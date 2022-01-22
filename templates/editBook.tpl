{include 'templates/header.tpl'}

<form class="container mb-3" style="width: 60rem" action="libros/edit/{$id}" method="POST">
    <label class="form-label">Titulo</label>
    <input class="form-control"  name="titulo" placeholder="Titulo" value="{$titulo}">
    <label class="form-label">Sinopsis</label>
    <input class="form-control"  name="sinopsis" placeholder="Sinopsis" value="{$sinopsis}">
    <label class="form-label">Género</label>
    <input class="form-control"  name="genero" placeholder="Genero" value="{$genero}">
    <label class="form-label">Año</label>
    <input class="form-control" name="anio" type="number" placeholder="Año" value="{$anio}">
    <button class="btn btn-warning m-2" type="submit">Editar</button>
</form>

{include 'templates/footer.tpl'}