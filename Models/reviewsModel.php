<?php
    class reviewsModel{

        private $db;

        function __construct(){
            $this->db = new PDO('mysql:host=localhost;'.'dbname=tpe;charset=utf8', 'root', '');
        }

        public function getReviewsByResource($id_resource){
            $sentence = $this->db->prepare('SELECT * FROM reseñas WHERE id_recurso=?');
            $sentence->execute([$id_resource]);

            $reviews = $sentence->fetchAll(PDO::FETCH_OBJ);
            return $reviews;
        }

        public function addReview($review, $value, $id_user, $id_resource){ //esta funcion introduce una reseña y valoracion
            $sentence = $this->db->prepare('INSERT INTO reseñas(review, valoracion, id_user, id_recurso) VALUES(?, ?, ?, ?)');
            $sentence->execute(array($review, $value, $id_user, $id_resource));
            return $this->db->lastInsertId();
        }

        public function getReview($id) {
            $sentence = $this->db->prepare('SELECT * FROM reseñas WHERE id_review=?');
            $sentence->execute([$id]);

            $review = $sentence->fetch(PDO::FETCH_OBJ);
            return $review;
        }

        public function deleteReview($id) {
            $sentence = $this->db->prepare('DELETE FROM reseñas WHERE id_review=?');
            $sentence->execute([$id]);
        }
    }