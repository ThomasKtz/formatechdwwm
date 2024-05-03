<?php

class SignIn{

    public $modelSuperAdmin;
    public $modelAdmin;
    public $modelInstructor;
    public $modelStudent;

    public function __construct(){
        $this->modelSuperAdmin = new ModelSuperAdmin();
        $this->modelAdmin = new ModelAdmin();
        $this->modelInstructor = new ModelInstructor();
        $this->modelStudent = new ModelStudent();
    }



    public function manage(){
    
        if(isset($_POST['email'])){

            if(!empty($_POST['email']) || !empty($_POST['password'])){
                
                $superAdmin = $this->modelSuperAdmin->getOneSuperAdmin($_POST['email']);

                if($superAdmin === null){
                    var_dump("SA non trouvé");

                }elseif(!$superAdmin || !password_verify($_POST['password'], $superAdmin['super_admin_password'])){
                    var_dump("identifants incorrect");
                }else{

                    $_SESSION['user'] = [
                        'firstname'    => $superAdmin['super_admin_firstname'],
                        'lastname'    => $superAdmin['super_admin_lastname'],
                        'email'     => $superAdmin['super_admin_email'],
                        'id'        => $superAdmin['super_admin_id'],
                    ];
                    // header('Location: index.php?page=listMovies');
                    // exit();
                }
            


            } else {

                var_dump('Merci de remplir tous les champs');
            }
            
        }


        include(__DIR__ . '/../View/signIn.php');
    }
}