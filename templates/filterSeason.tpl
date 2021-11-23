{include file="header.tpl"}

{if $countSeason->germinacion === "Perenne"}
    <h2>Recursos {$perenne}</h2>
{else if $countSeason->germinacion == ""}
    <h2>Recursos {$noseason}</h2>
{else if} 
    <h2>Recursos {$season|lower}</h2>
{/if}

<ul class="list-group list-group-flush">
    {foreach from=$resources item=$resource}
        <li class="list-group-item"><a href="details/{$resource->id_recurso}">{$resource->recurso}</a></li>
    {/foreach}
</ul>

<h3 class="undertitle">Cantidad de recursos: {$countSeason->count_season}</h3>

<a href="{BASE_URL}filters" class="btn btn-light home">Seguir buscando</a>
{include file="redirectHome.tpl"}
{include file="footer.tpl"}