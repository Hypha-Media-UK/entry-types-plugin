<?php

namespace hyphamedia\entrytypesdefaults\models;

use craft\base\Model;

/**
 * Settings model for Entry Type hierarchy configuration.
 */
class Settings extends Model
{
    /**
     * @var array Section hierarchy config: [sectionUid => [typeHierarchy => [typeUid => [...]]]]
     */
    public array $sectionConfig = [];

    public function defineRules(): array
    {
        return [['sectionConfig', 'safe']];
    }

    public function getTypeConfig(string $sectionUid, string $entryTypeUid): ?array
    {
        return $this->sectionConfig[$sectionUid]['typeHierarchy'][$entryTypeUid] ?? null;
    }
}

