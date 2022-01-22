<?php

class WriterModel
{

    private $db;

    function __construct()
    {
        $this->db = new PDO('mysql:host=localhost;' . 'dbname=libreria;charset=utf8', 'root', '');
    }

    function getWriters()
    {
        $query = $this->db->prepare("SELECT * FROM escritores");
        $query->execute();
        $writers = $query->fetchAll(PDO::FETCH_OBJ);
        return $writers;
    }

    function getWriter($id_escritor)
    {
        $query = $this->db->prepare("SELECT * FROM escritores where id_escritor = ?");
        $query->execute([$id_escritor]);
        $writer = $query->fetch(PDO::FETCH_OBJ);
        return $writer;
    }

    function editWriter($id_escritor, $nombre, $apellido, $fecha_nacimiento, $biografia)
    {
        $query = $this->db->prepare("UPDATE escritores SET nombre = ?, apellido = ?, fecha_nacimiento = ?,
        biografia = ? WHERE id_escritor = ?");
        $query->execute([$nombre, $apellido, $fecha_nacimiento, $biografia, $id_escritor]);
    }

    function deleteWriter($id_escritor)
    {
        $query = $this->db->prepare("DELETE FROM escritores WHERE id_escritor = ?");
        $query->execute([$id_escritor]);
    }

    function addWriter($nombre, $apellido, $fecha_nacimiento, $biografia)
    {
        $query = $this->db->prepare("INSERT INTO escritores(nombre, apellido, fecha_nacimiento, biografia) VALUES(?, ?, ?, ?)");
        $query->execute([$nombre, $apellido, $fecha_nacimiento, $biografia]);
    }
}
