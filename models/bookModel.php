<?php

class bookModel
{
    private $db;

    function __construct()
    {
        $this->db = new PDO('mysql:host=localhost;' . 'dbname=libreria;charset=utf8', 'root', '');
    }

    function getBooks($offset, $limit)
    {
        $query = $this->db->prepare('SELECT l.*, e.nombre, e.apellido FROM libros l JOIN escritores e ON l.id_escritor = e.id_escritor limit ?, ?');
        $query->bindParam(2, $limit, PDO::PARAM_INT);
        $query->bindParam(1, $offset, PDO::PARAM_INT);
        $query->execute();
        $books = $query->fetchAll(PDO::FETCH_OBJ);
        return $books;
    }

    function countBooks()
    {
        $query = $this->db->prepare("SELECT count(*) as cantidad FROM libros l JOIN escritores e ON l.id_escritor = e.id_escritor");
        $query->execute();
        $cantidad = $query->fetch(PDO::FETCH_OBJ);
        return $cantidad;
    }

    function getBooksbyWriter($id_escritor)
    {
        $query = $this->db->prepare("SELECT l.*, e.nombre, e.apellido FROM libros l JOIN escritores e ON l.id_escritor = e.id_escritor WHERE e.id_escritor = ?");
        $query->execute([$id_escritor]);
        $books = $query->fetchAll(PDO::FETCH_OBJ);
        return $books;
    }

    function getBook($id_libro)
    {
        $query = $this->db->prepare("SELECT l.*, e.nombre, e.apellido FROM libros l JOIN escritores e ON l.id_escritor = e.id_escritor WHERE id_libro = ?");
        $query->execute([$id_libro]);
        $book = $query->fetch(PDO::FETCH_OBJ);
        return $book;
    }

    function editBook($id_libro, $titulo, $sinopsis, $genero, $anio)
    {
        $query = $this->db->prepare("UPDATE libros SET titulo = ?, sinopsis = ?, genero = ?, anio = ? WHERE id_libro = ?");
        $query->execute([$titulo, $sinopsis, $genero, $anio, $id_libro]);
    }

    function deleteBook($id_libro)
    {
        $query = $this->db->prepare("DELETE FROM libros WHERE id_libro = ?");
        $query->execute([$id_libro]);
    }

    function addBook($titulo, $sinopsis, $genero, $anio, $id_escritor)
    {
        $query = $this->db->prepare("INSERT INTO libros (titulo, sinopsis, genero, anio, id_escritor) VALUES(?,?,?,?, ?)");
        $query->execute([$titulo, $sinopsis, $genero, $anio, $id_escritor]);
    }
}
