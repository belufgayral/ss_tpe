<?php
require_once "./Models/resourcesModel.php";
require_once "./Views/ApiView.php";
require_once "./Models/generalModel.php";
require_once "./Helpers/AuthHelper.php";

class ApiResourcesController{

    private $model;
    private $view;
    private $modelG;
    private $helper;

    function __construct(){
        $this->model = new resourcesModel();
        $this->view = new ApiView();
        $this->modelG = new generalModel();
        $this->helper = new AuthHelper();
    }

    public function getReviews(){
        $reviews = $this->model->getAllReviews(); 
        return $this->view->response($reviews, 200); 
    }

    public function getAdminSession(){
        $boolSession = $this->helper->checkIfAdminLogged(); //si es admin la varaible guardará true, sino, guardará false
        return $this->view->response($boolSession, 200); //retorno el booleano conseguido
    }
    /*
    function obtenerTarea($params = null) { 
        $idTarea = $params[":ID"]; 
        $tarea = $this->model->getTask($idTarea); 
        if ($tarea) { //si existe...
            return $this->view->response($tarea, 200); 
        } else {
            return $this->view->response("La tarea con el id=$idTarea no existe", 404); 
        }
    }

    function eliminarTarea($params = null) { 
        $idTarea = $params[":ID"];
        $tarea = $this->model->getTask($idTarea);

        if ($tarea) {
            $this->model->deleteTaskFromDB($idTarea);
            return $this->view->response("La tarea con el id=$idTarea fue borrada", 200);
        } else {
            return $this->view->response("La tarea con el id=$idTarea no existe", 404);
        }
    } */

    public function insertReviewValue() { 
        $body = $this->getBody(); 
        /* $user = $this->modelG->getUserByEmail($_SESSION['user']); */ // encontrar la forma de conseguir el id de usuario
        /* print_r($body->reseña); */
		if ($body->review/*  && $body->valoracion */){
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

   /*  function actualizarTarea($params = null) { 
        $idTarea = $params[':ID'];
        $body = $this->getBody();
      
        $tarea = $this->model->getTask($idTarea);

        if ($tarea) {
            $this->model->update($idTarea, $body->titulo, $body->descripcion, $body->prioridad, $body->finalizada);
            $this->view->response("La tarea se actualizó correctamente", 200);
        } else {
            return $this->view->response("La tarea con el id=$idTarea no existe", 404);
        }
    }*/
   
    private function getBody() {
        $bodyString = file_get_contents("php://input");
        return json_decode($bodyString); 
    } 

}