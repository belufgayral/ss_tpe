<?php
require_once "./Models/resourcesModel.php";
require_once "./Views/ApiView.php";

class ApiResourcesController{

    private $model;
    private $view;

    function __construct(){
        $this->model = new resourcesModel();
        $this->view = new ApiView();
    }

     function getReviews(){
        $reviews = $this->model->getAllReviews(); 
        return $this->view->response($reviews, 200); 
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

    function insertReviewValue() { 
        $body = $this->getBody(); 
        /* print_r($body->reseña); */
		if ($body->reseña/*  && $body->valoracion */){
			$id = $this->model->addReview($body->reseña, $body->valoracion); 
			if ($id != 0) {
				$this->view->response("La reseña y valoracion se insertaron con el id=$id", 200);
			} else {
				$this->view->response("La reseña y valoracion no se pudieron insertar", 500);
			}
		} else {
			$this->view->response("No se pudo decodear el json", 311);
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