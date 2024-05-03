<?php

class AddAdmin{

    public $modelAdmin;
    public $modelCity;

    public function __construct(){
        $this->modelAdmin = new ModelAdmin();
        $this->modelCity = new ModelCity();
    }

    public function manage(){
        
        if(isset($_POST["firstname"])){

            if( empty($_POST["civility"]) ||
            empty($_POST["firstname"]) ||
            empty($_POST["lastname"]) ||
            empty($_POST["phone"]) ||
            empty($_POST["email"]) ||
            empty($_POST["password"]) ||
            empty($_POST["street"]) ||
            empty($_POST["zipcode"]) ||
            empty($_POST["city"]) ||
            empty($_POST["country"])){
                var_dump("Remplir tous les champs");
            } else{
                $checkExistingCity = $this->modelCity->checkExistingCity($_POST["zipcode"], $_POST['city']);
            }

            if($checkExistingCity){
                $city = $checkExistingCity;
                $passwordhash = password_hash($_POST["password"], PASSWORD_DEFAULT);
                $this->modelAdmin->addOneAdmin($_POST['civility'], $_POST["firstname"], $_POST["lastname"], $_POST["phone"], $_POST["email"], $passwordhash, $_POST["street"], $city["city_id"]);
            } else{
                $this->modelCity->addCity($_POST["zipcode"], $_POST["city"], 1);
            }
        }


        include(__DIR__ . '/../View/AddAdmin.php');
    }
}


