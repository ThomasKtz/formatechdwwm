<?php

class ModelSuperAdmin{

    private $db;
    public function __construct(){
        $host = 'localhost';
        $dbname = "formatechdwwm";
        $user = 'root';
        $password = '';

        try{
            $this->db = new PDO("mysql:host=$host;dbname=$dbname", $user, $password, array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
        }catch(PDOException $e){
            echo $e->getMessage();

        }
    }

    public function getOneSuperAdmin($email){
        try{
            $request = $this->db->prepare('SELECT * FROM super_admins WHERE super_admin_email = ?');
            $request->execute([$email]);
            $superAdmin = $request->fetch();
            return $superAdmin;
        } catch(PDOException $e){
            echo $e->getMessage();
            return null;
        }
    }



}