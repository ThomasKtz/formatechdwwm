<?php

class ModelStudent{

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


    public function getOneStudent($email){
        try{
            $request = $this->db->prepare('SELECT * FROM students WHERE student_email = ?');
            $request->execute([$email]);
            $student = $request->fetch();
            return $student;
        } catch(PDOException $e){
            echo $e->getMessage();
            return null;
        }
    }
}