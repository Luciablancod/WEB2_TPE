{include 'templates/header.tpl'}
<div class="container">
    <h1>{$title}</h1>

    <div class="row">
        <h2>{$book->titulo} - {$book->nombre}, {$book->apellido}</h2>
        <p>{$book->sinopsis}</p>
        <p>{$book->genero} - {$book->anio}</p>
    </div>
</div>


{include 'templates/footer.tpl'}