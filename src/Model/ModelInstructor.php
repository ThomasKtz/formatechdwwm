<?php

class ModelInstructor{

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


    public function getOneInstructor($email){
        try{
            $request = $this->db->prepare('SELECT *, instructor_password AS aliasPassword, instructor_email AS aliasEmail FROM instructors WHERE instructor_email = ?');
            $request->execute([$email]);
            $instructor = $request->fetch();
            return $instructor;
        } catch(PDOException $e){
            echo $e->getMessage();
            return null;
        }
    }
}