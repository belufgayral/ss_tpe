<?php
require_once "./Models/reviewsModel.php";
require_once "./Views/ApiView.php";
require_once "./Helpers/AuthHelper.php";

class apiReviewsController{

    private $model;
    private $view;
    private $helper;

    function __construct(){
        $this->model = new reviewsModel();
        $this->view = new ApiView();
        $this->helper = new AuthHelper();
    }

    public function getReviewsByResource($params = null){
        $id_resource = $params[':ID'];
        $reviews = $this->model->getReviewsByResource($id_resource); 

        if ($reviews) {
            $this->view->response($reviews, 200); 
        } else {
            $this->view->response("Los comentarios no fueron encontrados", 404);
        }
    }

    public function getAdminSession(){
        $boolSession = $this->helper->checkIfAdminLogged(); //si es admin la varaible guardará true, sino, guardará false
        return $this->view->response($boolSession, 200); //retorno el booleano conseguido
    }

    public function insertReviewValue() { 
        $body = $this->getBody(); 
        
		if ($body->review && $body->valoracion){
			$id = $this->model->addReview($body->review, $body->valoracion, 0, $body->id_recurso); // id_user harcodeado
			if ($id != 0) {
				$this->view->response("La reseña y valoracion se insertaron con el id=$id", 200);
			} else {
				$this->view->response("La reseña y valoracion no se pudieron insertar", 500);
			}
		} else {
			$this->view->response("No se pudo decodear el json", 311);
		}
    }

    public function deleteReview($params = null) {
        $id = $params[':ID'];
        $review = $this->model->getReview($id);

        if ($review) {
            $this->model->deleteReview($id);
            $this->view->response("El comentario de id=$id fue eliminado", 200);
        } else {
            $this->view->response("El comentario no fue encontrado", 404);
        }
    }

    private function getBody() {
        $bodyString = file_get_contents("php://input");
        return json_decode($bodyString); 
    } 

}