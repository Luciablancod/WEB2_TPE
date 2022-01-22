{include 'templates/header.tpl'}

<h1 class="text-uppercase fw-light container" style="width: 60rem">{$title}</h1>

<div class="card container" style="width: 60rem; margin-bottom: 5%;">
    <ul class="list-group list-group-flush">
        {foreach from=$books item=$book}
        <li class="list-group-item">
            <p> {$book->titulo} ({$book->nombre}, {$book->apellido}) <a class="btn btn-link btn-sm"
                    href="libros/detalle/{$book->id_libro}">
                    Ver más</a>
                {if $isLogged && $isAdmin}
                <button class="btn"> <a class="btn btn-warning " href='libros/editar/{$book->id_libro}'>Editar
                    </a></button>
                <button class="btn"> <a class="btn btn-danger " href="libros/eliminar/{$book->id_libro}">Eliminar</a>
                </button>
                {/if}
            </p>

        </li>
        {/foreach}
    </ul>

    <div class="container mt-3 mb-3">

        <div class="row justify-content-center align-items-center">

            {for $page=1 to $cantidadPag}
            <div class="col-1">
                <a href="libros?page={$page}"><img src="https://img.icons8.com/ios/26/000000/{$page}.png" /></a>
            </div>
            {/for}


        </div>
    </div>
</div>


{if $isLogged && $isAdmin}
<div class="container" style="width: 60rem; margin-bottom: 5%;">
    <h2 class="text-primary m-3">Agregar Libro</h2>
    <form class="mb-3" action="libros/agregar" method="POST" style="width: 30rem">
        <label class="form-label">Titulo</label>
        <input class="form-control" name="titulo" placeholder="Título">
        <label class="form-label">Sinopsis</label>
        <input class="form-control" name="sinopsis" placeholder="Sinopsis">
        <label class="form-label">Género</label>
        <input class="form-control" name="genero" placeholder="Genero">
        <label class="form-label">Año</label>
        <input class="form-control" name="anio" type="number" placeholder="Año">
        <label class="form-label" for="escritor">Escritor</label>
        <select class="form-select" name="escritor">
            {foreach from=$writers item=$writer}
            <option value="{$writer->id_escritor}">{$writer->nombre}, {$writer->apellido} </option>
            {/foreach}
        </select>

        <button class="btn btn-primary m-2" type="submit">Agregar</button>

    </form>
    {/if}



</div>


{include 'templates/footer.tpl'}