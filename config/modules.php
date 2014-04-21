<?php

/**
 * Register application modules
 */
$application->registerModules(array(
    'home' => array(
        'className' => 'Baby\Home\Module',
        'path' => __DIR__ . '/../apps/home/Module.php'
    )
));
