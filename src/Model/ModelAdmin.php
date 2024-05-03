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
            $request = $this->db->prepare('SELECT *, admin_password AS aliasPassword, admin_email AS aliasEmail FROM admins WHERE admin_email = ?');
            $request->execute([$email]);
            $Admin = $request->fetch();
            return $Admin;
        } catch(PDOException $e){
            echo $e->getMessage();
            return null;
        }
    }

    public function addOneAdmin($civility, $firstname, $lastname, $phone, $email, $password, $street, $idCity){
        try{
            $request = $this->db->prepare('INSERT INTO admins   (admin_civility,
                                                                admin_firstname,
                                                                admin_lastname,
                                                                admin_phone,
                                                                admin_email,
                                                                admin_password,
                                                                admin_adress,
                                                                id_city)
                                            VALUES (?,?,?,?,?,?,?,?)');
            $request->execute([
                $civility,
                $firstname,
                $lastname,
                $phone,
                $email,
                $password,
                $street,
                $idCity
            ]);

        } catch(PDOException $e){
            echo $e->getMessage();
        }
    }
}