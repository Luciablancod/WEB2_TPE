<?php

require_once "models/commentModel.php";
require_once "views/apiView.php";
require_once "models/bookModel.php";
require_once "helpers/authHelper.php";

class commentAPIController
{

    private $model;
    private $view;
    private $authHelper;
    private $modelBook;

    public function __construct()
    {
        $this->authHelper = new AuthHelper();
        $this->model = new commentModel();
        $this->view = new apiView();
        $this->modelBook = new bookModel();
    }


    public function getCommentsByBook($params = null)
    {
        $idBook = $params[":ID"];
        $orderBy = null;
        $order = null;
        $book = $this->modelBook->getBook($idBook);
        if (isset($book)) {
            if (isset($_GET['orderBy']) && ($_GET['orderBy'] == 'puntuacion' || $_GET['orderBy'] == 'fecha_creacion')) {
                $orderBy = $_GET['orderBy'];
            } else {
                $orderBy = 'fecha_creacion';
            }
            if (isset($_GET['order']) && ($_GET['order'] == 'ASC' || $_GET['order'] == 'DESC'))
                $order = $_GET['order'];
            else
                $order = 'DESC';
            $comments = $this->model->getCommentsByBook($idBook, $orderBy, $order);
            if (isset($comments) && !empty($comments)) {
                return $this->view->response($comments, 200);
            } else {
                return $this->view->response([], 200);
            }
        } else {
            return $this->view->response("El libro no existe", 404);
        }
    }

    public function addCommentBook()
    {
        $this->authHelper->isLogged();
        $id_usuario = $this->authHelper->getUserId();
        $body = $this->getBody();
        if (!isset($body->puntuacion) || !isset($body->comentario) || !isset($body->id_libro)) {
            $this->view->response("Faltan datos necesarios para insertar un comentario", 400);
        } else {
            $book = $this->modelBook->getBook($body->id_libro);
            if (!isset($book)) {
                $this->view->response("El libro no existe", 404);
            } else {
                $idComment = $this->model->addCommentBook($body->comentario, $body->puntuacion, $id_usuario, $body->id_libro);
                if (isset($idComment)) {
                    $this->view->response("Se ha insertado correctamente", 201);
                } else {
                    $this->view->response("No se ha podido insertar", 500);
                }
            }
        }
    }

    public function deleteComment($params = null)
    {
        $isLogged = $this->authHelper->isLogged();
        if ($isLogged) {
            $isAdmin = $this->authHelper->isAdmin();
            if ($isAdmin) {
                $idComment = $params[":ID"];
                $comment = $this->model->getComment($idComment);
                if (isset($comment)) {
                    $this->model->deleteComment($idComment);
                    return $this->view->response("El comentario ha sido eliminado", 200);
                } else {
                    return $this->view->response("El comentario no existe", 404);
                }
            } else {
                return $this->view->response("No tienes permisos suficientes para poder eliminarlo", 401);
            }
        } else {
            return $this->view->response("Debes loguearte para poder eliminarlo", 403);
        }
    }

    function getBook($params = null)
    {
        $idBook =  $params[":ID"];
        $book = $this->modelBook->getBook($idBook);
        if ($book) {
            $this->view->response($book, 200);
        } else {
            return $this->view->response("El libro no existe", 404);
        }
    }


    private function getBody()
    {
        $bodyString = file_get_contents("php://input");
        return json_decode($bodyString);
    }
}
