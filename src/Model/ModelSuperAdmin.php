<?php

class ModelSuperAdmin
{

    private $db;
    public function __construct()
    {
        $host = 'localhost';
        $dbname = "formatechdwwm";
        $user = 'root';
        $password = '';

        try {
            $this->db = new PDO("mysql:host=$host;dbname=$dbname", $user, $password, array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION));
        } catch (PDOException $e) {
            echo $e->getMessage();

        }
    }

    public function getOneSuperAdmin($email)
    {
        try {
            $request = $this->db->prepare('SELECT *, super_admin_password AS aliasPassword, super_admin_email AS aliasEmail FROM super_admins WHERE super_admin_email = ?');
            $request->execute([$email]);
            $superAdmin = $request->fetch();
            return $superAdmin;
        } catch (PDOException $e) {
            echo $e->getMessage();
            return null;
        }
    }

    public function addOneSuperAdmin($civility, $firstname, $lastname, $phone, $email, $password, $street, $idCity)
    {
        try {
            $request = $this->db->prepare('INSERT INTO super_admins   (super_admin_civility,
                                                                super_admin_firstname,
                                                                super_admin_lastname,
                                                                super_admin_phone,
                                                                super_admin_email,
                                                                super_admin_password,
                                                                super_admin_adress,
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

        } catch (PDOException $e) {
            echo $e->getMessage();
        }
    }


}