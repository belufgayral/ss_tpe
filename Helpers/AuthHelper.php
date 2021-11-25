<?php

class AuthHelper {
	
	public function checkIfLogged(){
        session_start();
        if (isset($_SESSION['user']) || !empty($_SESSION['user'])){
            
            session_abort();
            return true;
        } else {
            session_abort();
            return false;
        }
        }
    
    public function checkIfAdminLogged(){
		session_start();
        if (isset($_SESSION['admin']) || !empty($_SESSION['admin'])){
            
            session_abort();
            return true; //devuelve TRUE para así poder pasar el if en los chequeos en los controller
        } else {
            session_abort();
            return false; //same logic que arriba
        }
	}
	
}