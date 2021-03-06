<?php
require_once "./libs/smarty-3.1.39/libs/Smarty.class.php";

    class zonesView{

        private $smarty;

        function __construct() {
            $this->smarty = new Smarty();
            $this->smarty->assign('BASE_URL', BASE_URL);
        }

        public function renderZonesForm($admin = "", $zones, $zone = "") {
            $this->smarty->assign('zones', $zones);
            $this->smarty->assign('zone', $zone);
            $this->smarty->assign('admin', $admin);
            $this->smarty->display('templates/zonesForm.tpl');
        }

        public function renderWarning($id, $deleted) {
            $this->smarty->assign('id', $id);
            $this->smarty->assign('deleted', $deleted);
            $this->smarty->assign('risk', "recursos");
            $this->smarty->assign('param1', "zone");
            $this->smarty->assign('param2', "zones");
            $this->smarty->display('templates/warning.tpl');
        }

        public function renderZones($zones) {
            $this->smarty->assign('zones', $zones);
            $this->smarty->display('templates/zones.tpl');
        }

        /* public function renderResourcesPerZone($resources, $zone) { 
            $this->smarty->assign('resources', $resources);
            $this->smarty->assign('zone', $zone);
            $this->smarty->display('templates/resourcesPerZone.tpl');
        } */
    }