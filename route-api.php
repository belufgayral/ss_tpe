<?php

require_once 'libs/Router.php';
require_once 'Controllers/apiReviewsController.php';

$router = new Router();

$router->addRoute('recurso/:ID', 'GET', 'apiReviewsController', 'getReviewsByResource');
$router->addRoute('recurso', 'GET', 'apiReviewsController', 'getAdminSession');
$router->addRoute('recurso/:ID', 'DELETE', 'apiReviewsController', 'deleteReview');
$router->addRoute('recurso', 'POST', 'apiReviewsController', 'insertReviewValue');

$router->route($_GET["resource"], $_SERVER['REQUEST_METHOD']);