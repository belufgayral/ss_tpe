{include file="header.tpl"}

<h1 id="resource" id_resource={$resource->id_recurso} class="title">Detalles de {$resource->recurso|lower}</h1>

<p>Época de germinación: 
{if {$resource->germinacion}}
    {$resource->germinacion}
{else} --
{/if}
</p>

<p>Zona donde se encuentra: {$resource->zona}</p>

{if $resource->imagen}
    <p><img src={$resource->imagen}></p>
{/if}

<form id="form">
    <input placeholder="Introduce tu reseña de {$resource->recurso|lower}" type="text" size="90" id="review" name="review" required>
    <label for="value">Dar valoración:</label>
    <input type="number" id="value" name="value" min=1 max=5 required>
    <select name="id">
        <option>{$resource->id_recurso}</option>
    </select>
    <button type="submit" id="post" class="btn btn-primary">Enviar</button>
    {* <button type="submit" id="getAll" class="btn btn-primary">Ver reseñas anteriores!</button> *}
</form>

{include file="vue/review-list.tpl"}

{include file="js.tpl"}
{include file="redirectHome.tpl"}
{include file="footer.tpl"}