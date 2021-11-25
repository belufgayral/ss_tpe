{literal}
    <div id="list">
        <h2>{{titulo}}</h2>

        <ul class="list-group list-group-flush">
        <div v-if="reviewBool == true">
            <li v-for="review in reviews" class="list-group-item">{{review.review}} | {{review.valoracion}}
                <div v-if="admin == true">
                <a :data-id="review.id_review" v-on:click.prevent="deleteR(review.id_review)" href="#">
                Eliminar</a>
                </div>
                <div v-else>
                <a></a>
                </div>
            </li>
        </div>
        <div v-if="reviewBool == false">
            <li v-for="review in reviewsByOrd" class="list-group-item">{{review.review}} | {{review.valoracion}}
                <div v-if="admin == true">
                <a :data-id="review.id_review" v-on:click.prevent="deleteR(review.id_review)" href="#">
                Eliminar</a>
                </div>
                <div v-else>
                <a></a>
                </div>
            </li>
        </div>
        </ul>
    </div>
{/literal}