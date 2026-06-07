<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Starbucks - Autenticación</title>
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
    <link href="css/styles.css" rel="stylesheet" />
</head>
<body style="background-color: #ffffff !important;">

    <div class="container d-flex justify-content-center align-items-center" style="min-height: 100vh;">
        <div class="row w-100 justify-content-center">
            <div class="col-md-6 col-lg-5">
                
                <div class="card shadow-lg" style="background-color: #00704A !important; border: none !important; border-radius: 15px;">
                    
                    <div class="card-header text-center py-3" style="border-bottom: 1px solid rgba(255,255,255,0.15) !important;">
                        <h3 class="m-0 text-uppercase tracking-wider fw-bold" style="color: #ffffff !important;">Starbucks App</h3>
                    </div>
                    
                    <div class="card-body p-4">
                        <form action="principal" method="POST">   
                            <div class="mb-3">
                                <label for="usuario" class="form-label small fw-bold" style="color: rgba(255, 255, 255, 0.9) !important;">Nombre de Usuario</label>
                                <input type="text" class="form-control" id="usuario" name="usuario" placeholder="Ingresa tu usuario" required 
                                       style="background-color: #f8f9fa !important; color: #212529 !important; border: 1px solid #ced4da !important;" />
                            </div>
                            
                            <div class="mb-4">
                                <label for="contrasena" class="form-label small fw-bold" style="color: rgba(255, 255, 255, 0.9) !important;">Contraseña</label>
                                <input type="password" class="form-control" id="contrasena" name="contrasena" placeholder="Ingresa tu contraseña" required 
                                       style="background-color: #f8f9fa !important; color: #212529 !important; border: 1px solid #ced4da !important;" />
                            </div>
                            
                            <div class="d-grid gap-2">
                                <button type="submit" 
                                        formaction="principal?accion=login&redir=${param.redir}" 
                                        class="btn fw-bold py-2 text-uppercase" 
                                        style="background-color: #1e3932 !important; color: #ffffff !important; border: none !important;">
                                    Iniciar Sesión
                                </button>
                                
                                <button type="submit" 
                                        formaction="principal?accion=registrar" 
                                        class="btn py-2 text-uppercase small" 
                                        style="background-color: transparent !important; color: #ffffff !important; border: 1px solid #ffffff !important;">
                                    Registrarse como nuevo usuario
                                </button>
                            </div>

                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>