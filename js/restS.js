"use strict";

let app = new Vue({
    el: "#list",
    data: {
        titulo: "Comentarios",
        admin: false,
        reviews: [],
        reviewsByOrd: [],
        reviewBool: false,
        reviewEmpty: false
    },
    methods: {
        deleteR: function(id) {
            deleteReview(id);
        }
    }
});

const API_URL = 'api/recurso';

/* const btnGet = document.querySelector("#getAll");
btnGet.addEventListener("click", getReviews); */
const id_item = document.querySelector("#resource").getAttribute("id_resource");
const btnPost = document.querySelector("#post");
btnPost.addEventListener("click", insertReview);
const btnOrderAsc = document.querySelector("#order-asc");
btnOrderAsc.addEventListener("click", getReviewsByOrderAsc);
const btnOrderDesc = document.querySelector("#order-desc");
btnOrderDesc.addEventListener("click", getReviewsByOrderDesc);

getReviews();
getIfAdminSession();
console.log(id_item);

async function getReviews() {
    console.log(`${API_URL}/${id_item}`)
    try {
        let response = await fetch(`${API_URL}/${id_item}`);   
        let reviews = await response.json();
        console.log(reviews);
        if (reviews == "Los comentarios no fueron encontrados") {
            app.reviewEmpty = true;
        } else if (reviews !== "Los comentarios no fueron encontrados"){
            app.reviewEmpty = false;
        }
        console.log(reviews); 
        app.reviews = reviews; //convierte el arreglo traido por GET para el vue, para que se lea como reviews
        app.reviewBool = true;
    } catch (error) {
        console.log("hola");
        console.error();
    }
}

async function getReviewsByOrderAsc(){
    let order = document.querySelector("#order-asc").value;
    try {
        let response = await fetch(`${API_URL}/${order}/${id_item}`);
        let reviewsByOrder = await response.json();

        app.reviewsByOrd = reviewsByOrder;
        app.reviewBool = false;
    } catch (error) {
        console.error();
    }
}

async function getReviewsByOrderDesc(){
    let order = document.querySelector("#order-desc").value;
    try {
        let response = await fetch(`${API_URL}/${order}/${id_item}`);
        let reviewsByOrder = await response.json();

        app.reviewsByOrd = reviewsByOrder;
        app.reviewBool = false;
    } catch (error) {
        console.error();
    }
}

async function getIfAdminSession(){
    
    try {
        console.log("hi");
        let res = await fetch(API_URL);
        let session = await res.json();
        console.log(session);
        app.admin = session;
    } catch (error) {
        console.log("error");
        console.error();
    }
}


async function insertReview(e){
    e.preventDefault();
    let form = document.querySelector("#form");
    let formData = new FormData(form);
    let reviewObj = {
        "review": formData.get('review'),
		"valoracion": parseInt(formData.get('value')),
        "id_recurso": parseInt(formData.get('id')),
    }

    console.log(reviewObj);

    try {
        let res = await fetch (API_URL, {
            "method": "POST",
            /* "mode": 'cors', */
            "headers": {"Content-type": "application/json"},
            "body": JSON.stringify(reviewObj)
        });
        if(res.status == 200){
            console.log("Datos cargados!")
            getReviews();
        }
    } catch (error){
        console.error();
    }
}

async function deleteReview(id) {
    try {
        let res = await fetch (`${API_URL}/${id}`, {
        method: 'DELETE'
        });
        if (res.status == 200) {
            console.log("Comentario eliminado exitosamente")
            getReviews();
        }
    } catch (error) {
        console.error();
    }    
}

