<?php
require_once './Models/resourcesModel.php';
require_once './Views/resourcesView.php';
require_once './Models/zonesModel.php';
require_once './Helpers/AuthHelper.php';
require_once './Views/generalView.php';

class resourcesController{

    private $modelR;
    private $modelZ;
    private $view;
    private $viewU;
    private $authHelper;

    function __construct() {
        $this->modelR = new resourcesModel();
        $this->modelZ = new zonesModel();
        $this->view = new resourcesView();
        $this->viewU = new generalView();
        $this->authHelper = new AuthHelper();
    }

    public function goToDetails($id) { // este debería dejarlo en recursos
        $resource = $this->modelR->getOneResource($id);
        $this->view->renderDetails($resource);
    }

    public function goToFilters() {
        if ($this->authHelper->checkIfLogged() XOR $this->authHelper->checkIfAdminLogged()) {
            $zones = $this->modelZ->getZones();
            $this->view->renderFilters($zones);
        } else {
            $this->viewU->renderLogin();
        }
    }

    public function goToFilterSeason() {
        if ($this->authHelper->checkIfLogged() XOR $this->authHelper->checkIfAdminLogged()) {
            $resources = $this->modelR->filterSeason($_POST['season']);
            $countSeason = $this->modelR->countSeason($_POST['season']);
            $this->view->renderFilterSeason($resources, $countSeason);
        } else {
            $this->viewU->renderLogin();
        }
    }

    public function goToFilterZone() {
        if ($this->authHelper->checkIfLogged() XOR $this->authHelper->checkIfAdminLogged()) {
            $zone = $this->modelZ->getOneZone($_POST['zone']);
            $resources = $this->modelR->filterZone($_POST['zone']);
            $count = $this->modelR->countZone($_POST['zone']);
            $this->view->renderFilterZone($resources, $zone, $count);
        } else {
            $this->viewU->renderLogin();
        }
    }

    public function goToTableResources() {
        if ($this->authHelper->checkIfLogged() XOR $this->authHelper->checkIfAdminLogged()) {
            $resources = $this->modelR->getResources();
            $zones = $this->modelZ->getZones();
            $admin = isset($_SESSION['admin']);
            $this->view->renderResourcesForm($admin, $resources, $zones);
        } else {
            $this->viewU->renderLogin();
        }
    }

    public function goToAddResource(){
        if ($_POST['season'] == "Error" || $_POST['zone'] == "Error") {
            $this->view->renderErrorPage();
            die;
        } else {
            if ($this->authHelper->checkIfAdminLogged()) {
                $this->modelR->addResource($_POST['resource'], $_POST['season'], $_POST['zone'], $_FILES['image']['tmp_name']);
                $this->goToTableResources();        
            } else {
                $this->viewU->renderLogin();
            }
        }
    }

    public function goToDeleteResource($id) {
        if ($this->authHelper->checkIfAdminLogged()) {
            $this->modelR->deleteResource($id);
            $this->goToTableResources();
        } else {
            $this->viewU->renderLogin();
        }
    }

    public function goToDeleteImage($id) {
        if ($this->authHelper->checkIfAdminLogged()) {
            $resource = $this->modelR->getOneResource($id);
            $filePath = $resource->imagen;
            unlink($filePath);
            
            $this->modelR->deleteImage($id);
            $this->goToTableResources();
        } else {
            $this->viewU->renderLogin();
        }
    }

    public function goToUpdatedResourcesForm($id) {
        if ($this->authHelper->checkIfAdminLogged()) {
            $resources = $this->modelR->getResources();
            $resource = $this->modelR->getOneResource($id);
            $zones = $this->modelZ->getZones();
            $admin = isset($_SESSION['admin']);
            $this->view->renderResourcesForm($admin, $resources, $zones, $id, $resource);
        } else {
            $this->viewU->renderLogin();
        }
    }

    public function goToUpdateResource(){
        if ($_POST['season'] == "Error" || $_POST['zone'] == "Error") {
            $this->view->renderErrorPage();
            die;
        } else {
            if ($this->authHelper->checkIfAdminLogged()) {
                $this->modelR->updateResource($_POST['resource'], $_POST['season'], $_POST['zone'], $_POST['id']);
                $this->goToTableResources();
            } else {
                $this->viewU->renderLogin();
            }
        }
    }

}
