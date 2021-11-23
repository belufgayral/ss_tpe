{include file="header.tpl"}

{if empty($resources)}
    <h2>Lo sentimos, aún no hay recursos en esta zona.</h2>
{else}
<h2>Recursos localizados en {$zone->zona}</h2>

<ul class="list-group list-group-flush">
    {foreach from=$resources item=$resource}
        <li class="list-group-item"><a href="details/{$resource->id_recurso}">{$resource->recurso}</a></li>
    {/foreach}
</ul>

<h3 class="undertitle">Cantidad de recursos: {$count->count_zone}</h3>

{/if}

<a href="{BASE_URL}filters" class="btn btn-light home">Seguir buscando</a>
{include file="redirectHome.tpl"}
{include file="footer.tpl"}