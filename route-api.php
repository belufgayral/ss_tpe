<?php

require_once 'libs/Router.php';
require_once 'Controllers/apiReviewsController.php';

$router = new Router();

$router->addRoute('recurso', 'GET', 'apiReviewsController', 'getAdminSession');
$router->addRoute('recurso/asc/:ID', 'GET', 'apiReviewsController', 'getReviewsByOrderAsc');
$router->addRoute('recurso/desc/:ID', 'GET', 'apiReviewsController', 'getReviewsByOrderDesc');
$router->addRoute('recurso/:ID', 'GET', 'apiReviewsController', 'getReviewsByResource');
$router->addRoute('recurso/:ID', 'DELETE', 'apiReviewsController', 'deleteReview');
$router->addRoute('recurso', 'POST', 'apiReviewsController', 'insertReviewValue');

$router->route($_GET["resource"], $_SERVER['REQUEST_METHOD']);