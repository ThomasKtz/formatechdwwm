<?php

class ModelAdmin{

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

    public function getOneAdmin($email){
        try{
            $request = $this->db->prepare('SELECT * FROM admins WHERE admin_email = ?');
            $request->execute([$email]);
            $Admin = $request->fetch();
            return $Admin;
        } catch(PDOException $e){
            echo $e->getMessage();
            return null;
        }
    }
}