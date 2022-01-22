<?php

require_once "libs/smarty-3.1.39/libs/Smarty.class.php";

class writerView
{
    private $authHelper;
    private $smarty;

    public function __construct()
    {
        $this->authHelper = new AuthHelper();
        $isLogged = $this->authHelper->isLogged();
        $isAdmin = $this->authHelper->isAdmin();
        $this->smarty = new Smarty();
        $this->smarty->assign('BASE_URL', BASE_URL);
        $this->smarty->assign('isLogged', $isLogged);
        $this->smarty->assign('isAdmin', $isAdmin);
        $this->smarty->assign('title', 'Lista de Escritores');
    }

    public function showWriters($writers, $error = '')
    {
        $this->smarty->assign('writers', $writers);
        $this->smarty->assign('error', $error);
        $this->smarty->display('templates/writerList.tpl');
    }

    function editWriter($writer)
    {
        $this->smarty->assign('id', $writer->id_escritor);
        $this->smarty->assign('nombre', $writer->nombre);
        $this->smarty->assign('apellido', $writer->apellido);
        $this->smarty->assign('fecha_nacimiento', $writer->fecha_nacimiento);
        $this->smarty->assign('biografia', $writer->biografia);
        $this->smarty->display('templates/editWriter.tpl');
    }
}
