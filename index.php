<?php

require_once './include/DbHandler.php';
require 'Slim/Slim.php';
\Slim\Slim::registerAutoloader();

$app = new \Slim\Slim();

$app->get('/', function () {
    echo "Hello";
});


$app->get('/hello/:name', function ($name) {
    echo '{"name":"diego"}';
});

$app->get('/users/:username', function ($username) {
    $connect = mysqli_connect("localhost", "root", "1234");
    if (mysqli_select_db($connect, "a9914047_quentyd")) {
        $query1 = "SELECT * FROM UserQuenty WHERE name = '$username'";
        $result1 = mysqli_query($connect, $query1) or die(mysqli_error());
        $row1 = mysqli_fetch_object($result1);
        $resultado = json_encode($row1);
    }
    echo $resultado;
});

$app->get('/projects', function() {
    $response = array();
    $db = new DbHandler();

    // fetching all user tasks
    $result = $db->getAllProjects();

    $response["error"] = false;
    $response["message"] = array();

    // looping through result and preparing tasks array
    while ($project = $result->fetch_assoc()) {

        $tmp = array();
        $tmp["nombre"] = $project["nombre"];
        $tmp["descripcionLarga"] = $project["descripcion_larga"];
        $tmp["descripcionCorta"] = $project["descripcion_corta"];
        $tmp["monto"] = $project["monto"];
        $tmp["diasVigencia"] = $project["diasvigencia"];
        $tmp["proyectoID"] = $project["proyectoID"];
        $tmp["categoria"] = $project["categoria"];
        $tmp["ciudad"] = $project["ciudad"];
        $tmp["estado"] = $project["estado"];
        $tmp["usuarioID"] = $project["usuarioID"];
        $tmp["usuario"] = $project["usuario"];
        $tmp["urlImage"] = $project["url_image"];

        array_push($response["message"], $tmp);
    }
    echoRespnse(200, $response);
});

//crear nuevo proyecto
//
$app->post('/projects', function() use ($app) {
    // check for required params
    verifyRequiredParams(array('task'));

    $response = array();
    $projectID = $app->request->post('proyectoID');
    $nombre = $app->request->post('nombre');
    $descripcionLarga = $app->request->post('descripcionLarga');
    $descripcionCorta = $app->request->post('descripcionCorta');
    $monto = $app->request->post('monto');
    $diasvigencia = $app->request->post('diasvigencia');
    $urlImage = $app->request->post('urlImage');
    $categoria = $app->request->post('categoria');
    $ciudad = $app->request->post('ciudad');
    $estado = $app->request->post('estado');
    $socialID = $app->request->post('socialID');

    $db = new DbHandler();

    // creating new task
    $task_id = $db->createProject($projectID, $nombre, $descripcionLarga, $descripcionCorta, $monto, $diasvigencia, $urlImage, $categoria, $ciudad, $estado, $socialID);

    if ($task_id != NULL) {
        $response["error"] = false;
        $response["message"] = "Task created successfully";
        $response["task_id"] = $task_id;
        echoRespnse(201, $response);
    } else {
        $response["error"] = true;
        $response["message"] = "Failed to create task. Please try again";
        echoRespnse(200, $response);
    }
});


$app->post('/comments', function() use ($app) {
    $response = array();
    $db = new DbHandler();

    // fetching all user tasks        
    
    $socialID = $app->request->post('socialID');
    $proyectoID= $app->request->post('proyectoID');
    $comentario= $app->request->post('comentario');    
    
    $db = new DbHandler();

    // creating new task
    $task_id = $db->createComment($comentario,$proyectoID,$socialID);

    if ($task_id != NULL) {
        $response["error"] = false;
        $response["message"] = "";
//        $response["task_id"] = $task_id;
        echoRespnse(201, $response);
    } else {
        $response["error"] = true;
        $response["message"] = "Failed to create task. Please try again";
        echoRespnse(200, $response);
    }    
}
);
/*
 * get comentarios
 */
$app->get('/comments', function() use ($app) {
    $response = array();
    $db = new DbHandler();

    // fetching all user tasks
    $result = $db->getAllComments();

    $response["error"] = false;
    $response["message"] = array();

    // looping through result and preparing tasks array
    while ($project = $result->fetch_assoc()) {
        $tmp = array();
        $tmp["nombre"] = $project["nombre"];
        $tmp["socialID"] = $project["socialID"];
        $tmp["proyectoID"] = $project["proyectoID"];
        $tmp["comentario"] = $project["comentario"];
        $tmp["fecha_comentario"] = $project["fecha_comentario"];
        

        array_push($response["message"], $tmp);
    }
    echoRespnse(200, $response);
}
);


$app->post('/donar', function() use ($app) {
    $response = array();
    $db = new DbHandler();

    // fetching all user tasks
    $result = $db->getAllProjects();

    $response["error"] = false;
    $response["message"] = array();

    // looping through result and preparing tasks array
    while ($project = $result->fetch_assoc()) {

        $tmp = array();
        $tmp["nombre"] = $project["nombre"];
        $tmp["descripcionLarga"] = $project["descripcion_larga"];
        $tmp["descripcionCorta"] = $project["descripcion_corta"];
        $tmp["monto"] = $project["monto"];
        $tmp["diasVigencia"] = $project["diasvigencia"];
        $tmp["proyectoID"] = $project["proyectoID"];
        $tmp["categoria"] = $project["categoria"];
        $tmp["ciudad"] = $project["ciudad"];
        $tmp["estado"] = $project["estado"];
        $tmp["usuarioID"] = $project["usuarioID"];
        $tmp["usuario"] = $project["usuario"];

        array_push($response["message"], $tmp);
    }
    echoRespnse(200, $response);
}
);

/**
 * Verifying required params posted or not
 */
function verifyRequiredParams($required_fields) {
    $error = false;
    $error_fields = "";
    $request_params = array();
    $request_params = $_REQUEST;
    // Handling PUT request params
    if ($_SERVER['REQUEST_METHOD'] == 'PUT') {
        $app = \Slim\Slim::getInstance();
        parse_str($app->request()->getBody(), $request_params);
    }
    foreach ($required_fields as $field) {
        if (!isset($request_params[$field]) || strlen(trim($request_params[$field])) <= 0) {
            $error = true;
            $error_fields .= $field . ', ';
        }
    }

    if ($error) {
        // Required field(s) are missing or empty
        // echo error json and stop the app
        $response = array();
        $app = \Slim\Slim::getInstance();
        $response["error"] = true;
        $response["message"] = 'Required field(s) ' . substr($error_fields, 0, -2) . ' is missing or empty';
        echoRespnse(400, $response);
        $app->stop();
    }
}

/**
 * Echoing json response to client
 * @param String $status_code Http response code
 * @param Int $response Json response
 */
function echoRespnse($status_code, $response) {
    $app = \Slim\Slim::getInstance();
    // Http response code
    $app->status($status_code);

    // setting response content type to json
    $app->contentType('application/json');

    echo json_encode($response);
}

$app->run();
