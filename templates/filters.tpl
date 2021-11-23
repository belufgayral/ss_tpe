{include file="header.tpl"}

<h2 class="title">Búsqueda avanzada de recursos</h2>
<p>Por época de germinación</p>
<form action="filter/season" method="post">
    <select name="season" required>
        <option hidden value="Error">Seleccione una estación</option required>
        <option value="Verano">Verano</option>
        <option value="Primavera">Primavera</option>
        <option value="Invierno">Invierno</option>
        <option value="Otoño">Otoño</option>
        <option value="Perenne">Perenne</option>
        <option value="">Sin época de germinación</option>
    </select>
    <button type="submit" class="btn btn-primary">Buscar</button>
</form>

<p>Por zona donde se encuentran</p>
<form action="filter/zone" method="post">
    <select name="zone">
        <option hidden value="Error">Seleccione una zona</option>
        {foreach from=$zones item=$zone}
        <option value="{$zone->id_zona}">{$zone->zona}</option>
        {/foreach}
    </select>
    <button type="submit" class="btn btn-primary">Buscar</button>
</form>

{include file="redirectHome.tpl"}
{include file="footer.tpl"}