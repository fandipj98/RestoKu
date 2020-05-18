<?php

/** @var \Phalcon\Mvc\Router $router */
$router = $di->getRouter();
$config = $di->getConfig();

$router->removeExtraSlashes(true);

// Mengatur routes
$router->add('/', [
    'controller' =>  'index',
    'action' =>  'index'
]);


$router->add('/:controller', [
    'controller' =>  1,
    'action' =>  'index'
]);

$router->add('/:controller/:params', [
    'controller' =>  1,
    'action' =>  'index',
    'params' => 2
]);

$router->add('/:controller/:action', [
    'controller' =>  1,
    'action' =>  2,
]);

$router->add('/:controller/:action/:params', [
    'controller' =>  1,
    'action' =>  2,
    'params' =>  3,
]);

$router->notFound([
    'controller' => 'error',
    'action' => 'notFound',
]);

$router->add('/register', [
    'controller' =>  'users',
    'action' =>  'register',
]);

$router->add('/login', [
    'controller' =>  'users',
    'action' =>  'login',
]);

$router->add('/logout', [
    'controller' =>  'users',
    'action' =>  'logout',
]);

$router->add('/pembayaran', [
    'controller' =>  'pesanan',
    'action' =>  'pembayaran',
]);

$router->add('/about', [
    'controller' =>  'index',
    'action' =>  'about',
]);

$router->add('/error', [
    'controller' =>  'error',
    'action' =>  'error',
]);

$router->add(
    '/meja/read',
    [
        'controller'        => 'meja',
        'action'            => 'read'
    ]
);


$router->handle($di->get('request_uri'));