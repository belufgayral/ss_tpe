<?php
require_once 'Controllers/userController.php';
require_once 'Controllers/resourcesController.php';
require_once 'Controllers/zonesController.php';

    define('BASE_URL', '//'.$_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']).'/');

    $userController = new userController();
    $resourcesController = new resourcesController();
    $zonesController = new zonesController();

    if (!empty($_GET['action'])) {
        $action = $_GET['action'];
    } else {
        $action = 'home'; 
    }

    $parameters = explode('/', $action);

    switch($parameters[0]){
        case 'home':
            $userController->goToRenderHome();
            break;
        case 'login':
            $userController->goToLogin();
            break;
        case 'logout':
            $userController->logOut();
            break;
        case 'register': 
            $userController->goToRegisterUser();
            break;
        case 'registerUser':
            $userController->registerUser();
            break;
        case 'verifyLogin':
            $userController->verifyLogin($_POST['email'], $_POST['password']);
            break;
        case 'details':
            $resourcesController->goToDetails($parameters[1]);
            break;                                   
        case 'request':                                                                                          
            if ($parameters[1] == "resources") {
                $resourcesController->goToTableResources();
            } else if ($parameters[1] == "zones") {
                $zonesController->goToTableZones();
            } else if ($parameters[1] == "panel") {
                $userController->goToPanel();
            }
            break;
        case 'add':
            if ($parameters[1] == "resource") {
                $resourcesController->goToAddResource();
            } else if ($parameters[1] == "zone") {
                $zonesController->goToAddZone();
            }
            break;
        case 'delete':
            if ($parameters[1] == "resource") {
                $resourcesController->goToDeleteResource($parameters[2]);
            } else if ($parameters[1] == "image") {
                $resourcesController->goToDeleteImage($parameters[2]);
            } else if ($parameters[1] == "zone") {
                $zonesController->goToDeleteZone($parameters[2]);
            } else if ($parameters[1] == "user") {
                $userController->goToDeleteUser($parameters[2]);
            }
            break;
        case 'warning':
            if ($parameters[1] == "zone") {
                $zonesController->goToWarning($parameters[2]);
            } else if ($parameters[1] == "resource") {
                $resourcesController->goToWarning($parameters[2]);
            }
            break;
        case 'getUpdate':
            if ($parameters[1] == "resource") {
                $resourcesController->goToUpdatedResourcesForm($parameters[2]);
            } else if ($parameters[1] == "zone") {
                $zonesController->goToUpdatedZonesForm($parameters[2]);
            } else if ($parameters[1] == "user") {
                $userController->goToChangeStatus($parameters[2]);
            }
            break;
        case 'updateResource':                    
            $resourcesController->goToUpdateResource();
            break;
        case 'updateZone':      
            $zonesController->goToUpdateZone();
            break;
        case 'filters':        
            $resourcesController->goToFilters();  
            break;
        case 'filter':
            if ($parameters[1] == "season") {
                $resourcesController->goToFilterSeason();
            } else if ($parameters[1] == "zone"){
                $resourcesController->goToFilterZone();
            }
            break;
        default:
            $userController->goToError();
            break;
    }