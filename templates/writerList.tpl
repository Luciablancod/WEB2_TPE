{include 'templates/header.tpl'}

<h1 class="text-uppercase fw-light container" style="width: 60rem">{$title}</h1>

<div class="card container mb-5" style="width: 60rem">
    <ul class="list-group list-group-flush">
        {foreach from=$writers item=$writer}
        <li class="list-group-item">
            <p> {$writer->nombre}, {$writer->apellido} ({$writer->fecha_nacimiento}), {$writer->biografia}- &nbsp;
             <a class="btn btn-link btn-sm" href="escritores/libros/{$writer->id_escritor}">Ver Libros</a>
                {if $isLogged && $isAdmin}
                    <button class="btn"> <a class="btn btn-danger" href='escritores/editar/{$writer->id_escritor}'>Editar </a></button>
                    <button class="btn"> <a class="btn btn-warning" href="escritores/eliminar/{$writer->id_escritor}">Eliminar</a> </button>
                {/if}
            </p>
        </li>
        {/foreach}
    </ul>
</div>

{if $isLogged && $isAdmin}
<div class="container" style="width: 60rem; margin-bottom:10%;">
    <h2 class="text-primary m-3">Agregar Escritor</h2>
        <form style="width: 30rem" class="mb-3" action="escritores/agregar" method="POST">
    <label class="form-label">Nombre</label>
    <input class="form-control"  name="nombre" type="text" placeholder="Nombre" >
    <label class="form-label">Apellido</label>
    <input class="form-control" name="apellido" type="text" placeholder="Apellido">
    <label class="form-label">Fecha Nacimiento</label>
    <input class="form-control"  name="fecha_nacimiento" type="date" placeholder="Fecha_Nacimiento">
    <label class="form-label">Biografía</label>
    <textarea class="form-control" name="biografia" type="text" placeholder="biografia">
    </textarea>

     <button class="btn btn-primary m-2" type="submit">Agregar</button>

        </form>
        {if isset($error)}
        <p>{$error}</p>
        {/if}
</div>


{/if}

{include 'templates/footer.tpl'}