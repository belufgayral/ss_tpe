{literal}
    <div id="list">
        <h2>{{titulo}}</h2>

        <ul class="list-group list-group-flush">
            <li v-for="review in reviews" class="list-group-item">{{review.review}}
                <a :data-id="review.id_review" v-on:click.prevent="deleteR(review.id_review)" href="#">Eliminar</a>
            </li>
        </ul>
    </div>
{/literal}