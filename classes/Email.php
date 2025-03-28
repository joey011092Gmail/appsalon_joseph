<?php 

namespace Classes;

use SendGrid;
use SendGrid\Mail\Mail;
use Exception;

class Email {
    public $email;
    public $nombre;
    public $token;

    public function __construct($email, $nombre, $token)
    {
        $this->email = $email;
        $this->nombre = $nombre;
        $this->token = $token;
    }

    public function enviarConfirmacion() {

        // Crear el objeto de email
        // $mail = new PHPMailer();
        // $mail->isSMTP();
        // $mail->SMTPAuth = true;
        // $mail->Host = $_ENV['EMAIL_HOST'];
        // $mail->Port = $_ENV['EMAIL_PORT'];
        // $mail->Username = $_ENV['EMAIL_USERNAME'];
        // $mail->Password = $_ENV['EMAIL_PASSWORD'];

        // $mail->setFrom('cuentas@appsalon.com');
        // $mail->addAddress('joey_011092@hotmail.com', 'AppSalon.com');
        // $mail->Subject = 'Confirma tu cuenta';

        // // Set HTML
        // $mail->isHTML(TRUE);
        // $mail->CharSet= 'UTF-8';

        // $contenido = "<html>";
        // $contenido .= "<p><strong>Hola " . $this->nombre . "</strong> Has creado tu cuenta en AppSalon, solo debes confirmarla presionando el siguiente enlace</p>";
        // $contenido .= "<p>Presiona aqui: <a href='http://localhost:3000/confirmar-cuenta?token=" . $this->token . "'>Confirmar cuenta</a></p>";
        // $contenido .= "<p>Si no solicitaste esta cuenta, puedes ignorar el mensaje</p>";
        // $contenido .= "</html>";

        // $mail->Body = $contenido;

        // // Enviar el mail
        // $mail->send();

        // API KEY
        $apiKey = $_ENV['SENDGRID_APIKEY'];

        // Crear el objeto de email
        $email = new Mail();
        $email->setFrom("cuentasappsalon@testforjoe.xyz", "AppSalon");
        $email->setSubject("Confirma tu cuenta");

        // Agregar el destinatario
        $email->addTo($this->email, $this->nombre);

        // Crear el contenido del correo
        $contenido = "<html>";
        $contenido .= "<p><strong>Hola " . $this->nombre . "</strong> Has creado tu cuenta en AppSalon, solo debes confirmarla presionando el siguiente enlace</p>";
        $contenido .= "<p>Presiona aquí: <a href='".  $_ENV['APP_URL']  ."/confirmar-cuenta?token=" . $this->token . "'>Confirmar cuenta</a></p>";
        $contenido .= "<p>Si no solicitaste esta cuenta, puedes ignorar el mensaje</p>";
        $contenido .= "</html>";

        $email->addContent("text/html", $contenido);

        // Enviar el correo utilizando SendGrid
        $sendgrid = new SendGrid($apiKey);

        try {
            $response = $sendgrid->send($email);
            // Descomentar para debuguear
            // print_r($response->statusCode());
            // print_r($response->headers());
            // print_r($response->body());
        } catch (Exception $e) {
            echo 'Excepción atrapada: ',  $e->getMessage(), "\n";
        }
    }

    public function enviarInstrucciones() {

        $apiKey = $_ENV['SENDGRID_APIKEY'];

        // Crear el objeto de email
        $email = new Mail();
        $email->setFrom("cuentasappsalon@testforjoe.xyz", "AppSalon");
        $email->setSubject("Reestablece tu password");

        // Agregar el destinatario
        $email->addTo($this->email, $this->nombre);

        // Crear el contenido del correo
        $contenido = "<html>";
        $contenido .= "<p><strong>Hola " . $this->nombre . "</strong> Has solicitado reestablecer tu password. Haz click en el siguiente enlace para hacerlo:</p>";
        $contenido .= "<p>Presiona aquí: <a href='".  $_ENV['APP_URL']  ."/recuperar?token=" . $this->token . "'>Reestablecer password</a></p>";
        $contenido .= "<p>Si no solicitaste este resstablecimiento de password, puedes ignorar el mensaje</p>";
        $contenido .= "</html>";

        $email->addContent("text/html", $contenido);

        // Enviar el correo utilizando SendGrid
        $sendgrid = new SendGrid($apiKey);

        try {
            $response = $sendgrid->send($email);
            // Descomentar para debuguear
            // print_r($response->statusCode());
            // print_r($response->headers());
            // print_r($response->body());
        } catch (Exception $e) {
            echo 'Excepción atrapada: ',  $e->getMessage(), "\n";
        }
    }
}

