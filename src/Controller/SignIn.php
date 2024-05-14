<?php

class SignIn
{

    public $modelSuperAdmin;
    public $modelAdmin;
    public $modelInstructor;
    public $modelStudent;


    public function __construct()
    {
        $this->modelSuperAdmin = new ModelSuperAdmin();
        $this->modelAdmin = new ModelAdmin();
        $this->modelInstructor = new ModelInstructor();
        $this->modelStudent = new ModelStudent();
    }



    public function manage()
    {

        if (isset($_POST['email'])) {

            if (empty($_POST['email']) || empty($_POST['password'])) {

                var_dump('Merci de remplir tous les champs');

            } else {

                $user = $this->modelSuperAdmin->getOneSuperAdmin($_POST['email']);
                $userType = "SuperAdmin";
                if (!$user) {
                    $user = $this->modelAdmin->getOneAdmin($_POST['email']);
                    $userType = 'Admin';
                }
                if (!$user) {
                    $user = $this->modelInstructor->getOneInstructor($_POST['email']);
                    $userType = 'Instructor';
                }
                if (!$user) {
                    $user = $this->modelStudent->getOneStudent($_POST['email']);
                    $userType = 'Student';
                }
                if (!$user) {
                    var_dump("Utilisateur non trouvé");
                } elseif (!$user || !password_verify($_POST['password'], $user['aliasPassword'])) {
                    var_dump("identifants incorrect");
                } else {
                    $_SESSION['user'] = [
                        'email' => $user['aliasEmail'],
                        'userType' => $userType,
                    ];
                    header("Location: index.php?page=" . $userType);
                    exit();
                }
            }
        }

        include (__DIR__ . '/../View/Header.php');
        include (__DIR__ . '/../View/SignIn.php');
        include (__DIR__ . '/../View/Footer.php');
    }
}