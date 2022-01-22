<?php


require_once('libs/Router.php');
require_once('./controllers/commentAPIController.php');

// crea el router
$router = new Router();

// CAMBIAR TABLA DE ROUTEO
$router->addRoute('libros/detalle/:ID', 'GET', 'commentAPIController', 'getCommentsByBook');
$router->addRoute('libros/detalle/:ID/comments', 'POST', 'commentAPIController', 'addCommentBook');
$router->addRoute('libros/detalle/:ID/comments/:ID', 'DELETE', 'commentAPIController', 'deleteComment');
// rutea
$router->route($_GET["resource"], $_SERVER['REQUEST_METHOD']);
