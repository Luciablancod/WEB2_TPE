<?php

require_once "models/writerModel.php";
require_once "views/writerView.php";
require_once "helpers/authHelper.php";

class WriterController
{

    private $model;
    private $view;
    private $authHelper;

    function __construct()
    {
        $this->authHelper = new AuthHelper();
        $this->model = new writerModel();
        $this->view = new writerView();
    }

    function getWriters()
    {
        $writers = $this->model->getWriters();
        if (isset($writers))
            $this->view->showWriters($writers);
    }

    function editWriter($id)
    {
        $this->authHelper->checkLoggedIn();
        $isAdmin = $this->authHelper->isAdmin();
        if (
            isset($_POST['nombre']) && !empty($_POST['nombre']) && isset($_POST['apellido']) && !empty($_POST['apellido'])
            && isset($_POST['fecha_nacimiento']) && !empty($_POST['fecha_nacimiento']) && isset($_POST['biografia'])
            && !empty($_POST['biografia'])
        ) {
            if ($isAdmin) {
                $nombre = $_POST['nombre'];
                $apellido = $_POST['apellido'];
                $fecha_nacimiento = $_POST['fecha_nacimiento'];
                $biografia = $_POST['biografia'];
                $this->model->editWriter($id, $nombre, $apellido, $fecha_nacimiento, $biografia);
            }
        }
        header("Location: " . BASE_URL . "escritores");
    }

    function editWriterForm($id)
    {
        $this->authHelper->checkLoggedIn();
        $writer = $this->model->getWriter($id);
        if($writer)
            $this->view->editWriter($writer);
    }

    function deleteWriter($id)
    {
        $this->authHelper->checkLoggedIn();
        $isAdmin = $this->authHelper->isAdmin();
        if ($isAdmin) {
            $writer = $this->model->getWriter($id);
            if (isset($writer)) {
                $this->model->deleteWriter($id);
                header("Location: " . BASE_URL . "escritores");
            }
        }
    }


    function addWriter()
    {
        $this->authHelper->checkLoggedIn();
        $isAdmin = $this->authHelper->isAdmin();
        if (
            isset($_POST['nombre']) && !empty($_POST['nombre']) && isset($_POST['apellido']) && !empty($_POST['apellido'])
            && isset($_POST['fecha_nacimiento']) && !empty($_POST['fecha_nacimiento']) && isset($_POST['biografia'])
            && !empty($_POST['biografia'])
        ) {
            if ($isAdmin) {
                $nombre = $_POST['nombre'];
                $apellido = $_POST['apellido'];
                $fecha_nacimiento = $_POST['fecha_nacimiento'];
                $biografia = $_POST['biografia'];
                $this->model->addWriter($nombre, $apellido, $fecha_nacimiento, $biografia);
                header("Location: " . BASE_URL . "escritores");
            }
        } else {
            $writers = $this->model->getWriters();
            $this->view->showWriters($writers, "Faltó completar un campo requerido");
        }
    }
}
