{literal}
    <div id="list">
        <h2>{{titulo}}</h2>

        <ul class="list-group list-group-flush">
            <li v-for="review in reviews" class="list-group-item">{{review.review}}
                <div v-if="admin == true">
                <a :data-id="review.id_review" v-on:click.prevent="deleteR(review.id_review)" href="#">
                Eliminar</a>
                </div>
                <div v-else>
                <a></a>
                </div>
            </li>
        </ul>
    </div>
{/literal}