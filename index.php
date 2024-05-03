<?php

session_start();


require('src/Controller/SignIn.php');
require('src/Controller/AddUser.php');
require('src/Controller/superAdmin.php');
require('src/Model/ModelSuperAdmin.php');
require('src/Model/ModelAdmin.php');
require('src/Model/ModelInstructor.php');
require('src/Model/ModelStudent.php');

$page = filter_input(INPUT_GET, "page");

$route = [
    "SignIn"=> SignIn::class,
    "AddUser"=> AddUser::class,
    "SuperAdmin"=> SuperAdmin::class,
];

$controller = null;

foreach ($route as $routeValue => $classname){
    if($page === $routeValue){
        $controller = new $classname;
        $controller->manage();
    }
}

if(!$controller){
    $controller = new SignIn();
    $controller->manage();
}