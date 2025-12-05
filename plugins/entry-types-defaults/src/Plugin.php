<?php

namespace hyphamedia\entrytypesdefaults;

use Craft;
use craft\base\Model;
use craft\base\Plugin as BasePlugin;
use craft\elements\Entry;
use craft\events\ModelEvent;
use hyphamedia\entrytypesdefaults\models\Settings;
use yii\base\Event;

/**
 * Entry Types Defaults plugin
 *
 * Automatically sets parent entries based on Entry Type hierarchy configuration.
 * This solves the common UX problem where entries in Structure sections default
 * to Level 1 when they should be children of a landing page.
 */
class Plugin extends BasePlugin
{
    /**
     * @var Plugin|null
     */
    public static ?Plugin $plugin = null;

    /**
     * @var bool Enable CP settings page
     */
    public bool $hasCpSettings = true;

    /**
     * @var string Plugin schema version
     */
    public string $schemaVersion = '1.0.0';

    /**
     * @inheritdoc
     */
    public function init(): void
    {
        parent::init();
        self::$plugin = $this;

        // Register event handler for new entries
        $this->registerEventHandlers();

        Craft::info(
            'Entry Types Defaults plugin loaded',
            __METHOD__
        );
    }

    /**
     * Register event handlers
     */
    private function registerEventHandlers(): void
    {
        // Use EVENT_AFTER_PROPAGATE to catch the entry after all properties are set
        // This fires after the entry and its drafts are fully saved
        Event::on(
            Entry::class,
            Entry::EVENT_AFTER_PROPAGATE,
            [$this, 'handleEntryAfterPropagate']
        );
    }

    /**
     * Track entries we've already processed to avoid duplicate processing
     */
    private array $processedEntries = [];

    /**
     * Handle entry after propagate - this fires after the entry is fully saved
     * and all properties (including entry type) are finalized
     */
    public function handleEntryAfterPropagate(ModelEvent $event): void
    {
        /** @var Entry $entry */
        $entry = $event->sender;

        // Skip if we've already processed this entry in this request
        $entryKey = $entry->id . '-' . $entry->siteId;
        if (isset($this->processedEntries[$entryKey])) {
            return;
        }

        // Skip drafts and revisions - we only want to act on the canonical entry
        if ($entry->getIsDraft() || $entry->getIsRevision()) {
            return;
        }

        // Skip if parent is already set (level > 1 means it has a parent)
        if ($entry->level !== null && $entry->level > 1) {
            return;
        }

        // Get the section - only Structure sections have levels
        $section = $entry->getSection();
        if (!$section || $section->type !== 'structure') {
            return;
        }

        // Check our plugin settings for this section
        $settings = $this->getSettings();
        $sectionConfig = $settings->sectionConfig[$section->uid] ?? null;

        if (!$sectionConfig || empty($sectionConfig['typeHierarchy'])) {
            return;
        }

        // Get entry type UID
        $entryType = $entry->getType();
        if (!$entryType) {
            return;
        }

        $entryTypeUid = $entryType->uid;
        $typeHierarchy = $sectionConfig['typeHierarchy'];
        $typeConfig = $typeHierarchy[$entryTypeUid] ?? null;

        // Check if this entry type has a configured parent type
        if (!$typeConfig || empty($typeConfig['parentTypeUid'])) {
            return;
        }

        // Find the parent entry
        $parentEntry = $this->findParentEntry($section, $typeConfig);

        if (!$parentEntry) {
            Craft::info(
                "Entry Types Defaults: No parent entry found for '{$entry->title}'",
                __METHOD__
            );
            return;
        }

        // Mark as processed before we make changes
        $this->processedEntries[$entryKey] = true;

        // Move the entry under the parent using the structure service
        $structuresService = Craft::$app->getStructures();
        $structure = $structuresService->getStructureById($section->structureId);

        if ($structure) {
            // Append the entry as a child of the parent
            $structuresService->append($structure->id, $entry, $parentEntry);

            Craft::info(
                "Entry Types Defaults: Moved '{$entry->title}' under '{$parentEntry->title}'",
                __METHOD__
            );
        }
    }

    /**
     * Find an appropriate parent entry based on configuration
     */
    private function findParentEntry($section, array $typeConfig): ?Entry
    {
        $parentTypeUid = $typeConfig['parentTypeUid'];
        $strategy = $typeConfig['parentSelectionStrategy'] ?? 'mostRecent';

        // Get parent entry type
        $parentType = Craft::$app->getEntries()->getEntryTypeByUid($parentTypeUid);
        if (!$parentType) {
            return null;
        }

        // Build query based on strategy
        $query = Entry::find()
            ->sectionId($section->id)
            ->typeId($parentType->id)
            ->status(null);

        switch ($strategy) {
            case 'specific':
                $specificId = $typeConfig['specificParentId'] ?? null;
                if ($specificId) {
                    return Entry::find()
                        ->id($specificId)
                        ->status(null)
                        ->one();
                }
                // Fall through to mostRecent
            case 'mostRecent':
                return $query->orderBy('dateUpdated DESC')->one();
            case 'firstCreated':
                return $query->orderBy('dateCreated ASC')->one();
            default:
                return $query->one();
        }
    }

    /**
     * @inheritdoc
     */
    protected function createSettingsModel(): ?Model
    {
        return new Settings();
    }

    /**
     * @inheritdoc
     */
    protected function settingsHtml(): ?string
    {
        // Get all structure sections for the settings page
        $sections = [];
        foreach (Craft::$app->getEntries()->getAllSections() as $section) {
            if ($section->type === 'structure') {
                $sections[] = $section;
            }
        }

        return Craft::$app->getView()->renderTemplate(
            'entry-types-defaults/settings',
            [
                'settings' => $this->getSettings(),
                'sections' => $sections,
            ]
        );
    }
}

