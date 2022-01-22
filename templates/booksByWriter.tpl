{include 'templates/header.tpl'}

<h1>{$title} </h1>
<div>
{if count($books) == 0}
<p> No hay libros de este autor </p>
{/if}
    <ul>
        {foreach from=$books item=$book}
        <li>
            <p> {$book->titulo} {$book->sinopsis}, {$book->genero} - {$book->anio}
            </p>

        </li>
        {/foreach}
    </ul>
</div>

{include 'templates/footer.tpl'}