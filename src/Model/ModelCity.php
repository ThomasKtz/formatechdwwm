<?php

class ModelCity{

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

    public function checkExistingCity($zipcode, $city){
        try{
            $request = $this->db->prepare("SELECT * FROM cities WHERE city_zipcode = ? AND city_name = ?");
            $request->execute([$zipcode, $city]);
            $idCity = $request->fetch();
            return $idCity;
        } catch(PDOException $e){
            echo $e->getMessage();
            return false;
        }
    }

    public function addCity($zipcode, $city, $country){
        try{
            $request = $this->db->prepare("INSERT INTO cities (city_zipcode, city_name, id_country) VALUES (?,?,?)");
            $city = $request->execute([$zipcode, $city, $country]);
            
            return $city;
        } catch(PDOException $e){
            echo $e->getMessage();
            return false;
        }
    }

}