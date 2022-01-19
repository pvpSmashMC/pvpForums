<?php

/**
 * @param int $user NamelessMC ID of user to view
 * @param array $groups ID of group ids
 *
 * @return string JSON Array
 */
class RemoveGroupsEndpoint extends KeyAuthEndpoint {

    public function __construct() {
        $this->_route = 'users/{user}/groups/remove';
        $this->_module = 'Core';
        $this->_description = 'Remove groups from user';
        $this->_method = 'POST';
    }

    public function execute(Nameless2API $api, User $user): void {
        $api->validateParams($_POST, ['groups']);

        $groups = $_POST['groups'];
        if (!count($groups)) {
            $api->throwError(6, $api->getLanguage()->get('api', 'invalid_post_contents'));
        }

        $removed_groups = [];
        foreach ($groups as $group) {
            if ($user->removeGroup($group)) {
                $removed_groups[] = $group;
            }
        }

        GroupSyncManager::getInstance()->broadcastChange(
            $user,
            NamelessMCGroupSyncInjector::class,
            $removed_groups
        );

        $api->returnArray(['message' => $api->getLanguage()->get('api', 'group_updated')]);
    }
}
