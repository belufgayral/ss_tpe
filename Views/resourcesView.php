<?php
require_once "./libs/smarty-3.1.39/libs/Smarty.class.php";

    class resourcesView{

        private $smarty;

        function __construct() {
            $this->smarty = new Smarty();
            $this->smarty->assign('BASE_URL', BASE_URL);
        }

        public function renderResourcesForm($admin = "", $resources, $zones, $id = "", $resource = "") {
            $this->smarty->assign('id', $id);
            $this->smarty->assign('resource', $resource);
            $this->smarty->assign('resources', $resources);
            $this->smarty->assign('zones', $zones);
            $this->smarty->assign('admin', $admin);
            $this->smarty->display('templates/resourcesForm.tpl');
        }

        public function renderDetails($resource) {
            $this->smarty->assign('resource', $resource);
            $this->smarty->display('templates/resourcesDetails.tpl');
        }
        
        public function renderFilters($zones) {
            $this->smarty->assign('zones', $zones);
            $this->smarty->display('templates/filters.tpl');
        }

        public function renderFilterSeason($resources, $countSeason) {
            $this->smarty->assign('resources', $resources);
            $this->smarty->assign('countSeason', $countSeason);
            $this->smarty->assign('season', "que germinan en $countSeason->germinacion");
            $this->smarty->assign('perenne', "perennes");
            $this->smarty->assign('noseason', "sin época de germinación");
            $this->smarty->display('templates/filterSeason.tpl');
        }

        public function renderFilterZone($resources, $zone, $count) {
            $this->smarty->assign('resources', $resources);
            $this->smarty->assign('zone', $zone);
            $this->smarty->assign('count', $count);
            $this->smarty->display('templates/filterZone.tpl');
        }

        public function renderErrorPage() {
            $this->smarty->display('templates/errorPage.tpl');
        }
    }