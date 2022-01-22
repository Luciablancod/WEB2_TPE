{include 'templates/header.tpl'}

<form class="container mb-3" style="width: 60rem" action="escritores/edit/{$id}" method="POST">
    <label class="form-label">Nombre</label>
    <input class="form-control" name="nombre" type="text" placeholder="Nombre" value="{$nombre}">
    <label>Apellido</label>
    <input class="form-control" name="apellido" type="text" placeholder="Apellido" value="{$apellido}">
    <label class="form-label">Fecha Nacimiento</label>
    <input class="form-control" name="fecha_nacimiento" type="date" placeholder="Fecha_Nacimiento" value="{$fecha_nacimiento}">
    <label class="form-label">Biografía</label>
    <textarea class="form-control" name="biografia" type="text" placeholder="biografia">
        {$biografia}
    </textarea>
    <button class="btn btn-warning m-2" type="submit">Editar</button>
</form>

{include 'templates/footer.tpl'}