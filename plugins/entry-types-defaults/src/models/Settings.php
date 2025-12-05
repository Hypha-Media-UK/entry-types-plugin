<?php

namespace hyphamedia\entrytypesdefaults\models;

use craft\base\Model;

/**
 * Entry Types Defaults Settings Model
 *
 * Stores the hierarchy configuration for each Structure section.
 */
class Settings extends Model
{
    /**
     * Configuration per section
     *
     * Format:
     * [
     *   'section-uid' => [
     *     'typeHierarchy' => [
     *       'entry-type-uid' => [
     *         'parentTypeUid' => 'parent-entry-type-uid',
     *         'parentSelectionStrategy' => 'mostRecent', // or 'firstCreated', 'specific'
     *         'specificParentId' => null, // Used when strategy is 'specific'
     *       ],
     *     ],
     *   ],
     * ]
     *
     * @var array
     */
    public array $sectionConfig = [];

    /**
     * @inheritdoc
     */
    public function defineRules(): array
    {
        return [
            ['sectionConfig', 'safe'],
        ];
    }

    /**
     * Get the hierarchy configuration for a specific section
     *
     * @param string $sectionUid
     * @return array|null
     */
    public function getSectionConfig(string $sectionUid): ?array
    {
        return $this->sectionConfig[$sectionUid] ?? null;
    }

    /**
     * Get the type configuration for a specific entry type within a section
     *
     * @param string $sectionUid
     * @param string $entryTypeUid
     * @return array|null
     */
    public function getTypeConfig(string $sectionUid, string $entryTypeUid): ?array
    {
        $sectionConfig = $this->getSectionConfig($sectionUid);
        if (!$sectionConfig) {
            return null;
        }

        return $sectionConfig['typeHierarchy'][$entryTypeUid] ?? null;
    }

    /**
     * Check if an entry type is configured as a child type (has a parent type defined)
     *
     * @param string $sectionUid
     * @param string $entryTypeUid
     * @return bool
     */
    public function isChildType(string $sectionUid, string $entryTypeUid): bool
    {
        $typeConfig = $this->getTypeConfig($sectionUid, $entryTypeUid);
        return $typeConfig !== null && !empty($typeConfig['parentTypeUid']);
    }
}

