<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return; // Detiene la renderización del HTML por seguridad
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Starbucks - Menú de Productos</title>
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
    <link href="css/styles.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
</head>
<body style="background-color: #ffffff !important; min-height: 100vh; display: flex; flex-direction: column; justify-content: space-between;">

    <section class="py-5 bg-light">
        <div class="container px-4 px-lg-5">
            <div class="text-center mb-5">
                <i class="fas fa-mug-hot fa-3x mb-2" style="color: #00704A;"></i>
                <h2 class="fw-bold text-uppercase" style="color: #1e3932;">Nuestro Menú Artesanal</h2>
            </div>
           
            <div class="row gx-4 justify-content-center">
               
                <div class="col-md-6 col-lg-4 mb-4">
                    <div class="card h-100 border-0 shadow-sm" style="border-radius: 12px; overflow: hidden;">
                        <div class="card-body p-4" style="border-top: 5px solid #00704A;">
                            <h5 class="card-title fw-bold text-dark mb-2">Café Espresso Roast</h5>
                            <p class="card-text text-muted small mb-0">Un café de tostado intenso con notas ricas y profundas de caramelo dulce. Es el alma y la esencia de todas nuestras bebidas a base de espresso</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-lg-4 mb-4">
                    <div class="card h-100 border-0 shadow-sm" style="border-radius: 12px; overflow: hidden;">
                        <div class="card-body p-4" style="border-top: 5px solid #00704A;">
                            <h5 class="card-title fw-bold text-dark mb-2">Caramel Frappuccino</h5>
                            <p class="card-text text-muted small mb-0">Bebida fría licuada con jarabe de caramelo, café, leche, hielo, decorada con crema batida y un delicioso espiral de caramelo.</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-lg-4 mb-4">
                    <div class="card h-100 border-0 shadow-sm" style="border-radius: 12px; overflow: hidden;">
                        <div class="card-body p-4" style="border-top: 5px solid #00704A;">
                            <h5 class="card-title fw-bold text-dark mb-2">Croissant de Mantequilla Clásico</h5>
                            <p class="card-text text-muted small mb-0">Auténtica masa de hojaldre francés horneada con capas crujientes por fuera y un interior suave, esponjoso y con un rico sabor a mantequilla.</p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <section class="py-5">
        <div class="container">
            <div class="row justify-content-center gx-4">
               
                <div class="col-md-6 col-lg-5 mb-4 mb-md-0">
                    <div class="card shadow-lg h-100" style="background-color: #00704A !important; border: none !important; border-radius: 15px;">
                        <div class="card-header text-center py-3" style="border-bottom: 1px solid rgba(255,255,255,0.15) !important;">
                            <h3 class="m-0 text-uppercase tracking-wider fw-bold" style="color: #ffffff !important;">Añadir a la fila</h3>
                        </div>
                       
                        <div class="card-body p-4 d-flex flex-column justify-content-between">
                            <form action="productos" method="POST">
                                <div class="mb-3">
                                    <label for="nombreAnadir" class="form-label small fw-bold" style="color: rgba(255, 255, 255, 0.9) !important;">Selecciona el Producto</label>
                                    <select class="form-select" id="nombreAnadir" name="nombre" required style="background-color: #f8f9fa !important; color: #212529 !important; border: 1px solid #ced4da !important;">
                                        <option value="" disabled selected hidden>Elige un producto...</option>
                                        <option value="Café Espresso Roast">Café Espresso Roast</option>
                                        <option value="Caramel Frappuccino">Caramel Frappuccino</option>
                                        <option value="Croissant de Mantequilla Clásico">Croissant de Mantequilla Clásico</option>
                                    </select>
                                </div>

                                <div class="mb-4">
                                    <label for="descripcionAnadir" class="form-label small fw-bold" style="color: rgba(255, 255, 255, 0.9) !important;">Descripción (Opcional)</label>
                                    <textarea class="form-control" id="descripcionAnadir" name="descripcion" rows="3" placeholder="Alguna nota sobre el producto (opcional)..." style="background-color: #f8f9fa !important; color: #212529 !important; border: 1px solid #ced4da !important; resize: none;"></textarea>
                                </div>
                               
                                <div class="d-grid mt-auto">
                                    <button type="submit" name="accion" value="añadir" class="btn fw-bold py-2 text-uppercase text-white" style="background-color: #1e3932 !important; border: none !important; box-shadow: 0 4px 6px rgba(0,0,0,0.15);">
                                        <i class="fas fa-plus-circle me-2"></i>Guardar Pedido
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-lg-5">
                    <div class="card shadow-lg h-100" style="background-color: #00704A !important; border: none !important; border-radius: 15px;">
                        <div class="card-header text-center py-3" style="border-bottom: 1px solid rgba(255,255,255,0.15) !important;">
                            <h3 class="m-0 text-uppercase tracking-wider fw-bold" style="color: #ffffff !important;">Actualizar Pedido</h3>
                        </div>
                       
                        <div class="card-body p-4 d-flex flex-column justify-content-between">
                            <form action="productos" method="POST">
                               
                                <div class="mb-3">
                                    <label for="idActualizar" class="form-label small fw-bold" style="color: rgba(255, 255, 255, 0.9) !important;">ID del Producto a Modificar</label>
                                    <input type="text" inputmode="numeric" pattern="[0-9]*" class="form-control text-center fw-bold" id="idActualizar" name="idProducto" placeholder="Escribe el ID (Ej: 4)" required style="background-color: #f8f9fa !important; color: #1e3932 !important; border: 2px solid #1e3932 !important;" />
                                </div>

                                <div class="mb-3">
                                    <label for="nombreActualizar" class="form-label small fw-bold" style="color: rgba(255, 255, 255, 0.9) !important;">Nuevo Producto</label>
                                    <select class="form-select" id="nombreActualizar" name="nombre" required style="background-color: #f8f9fa !important; color: #212529 !important; border: 1px solid #ced4da !important;">
                                        <option value="" disabled selected hidden>Elige el nuevo producto...</option>
                                        <option value="Café Espresso Roast">Café Espresso Roast</option>
                                        <option value="Caramel Frappuccino">Caramel Frappuccino</option>
                                        <option value="Croissant de Mantequilla Clásico">Croissant de Mantequilla Clásico</option>
                                    </select>
                                </div>

                                <div class="mb-4">
                                    <label for="descripcionActualizar" class="form-label small fw-bold" style="color: rgba(255, 255, 255, 0.9) !important;">Nueva Descripción (Opcional)</label>
                                    <textarea class="form-control" id="descripcionActualizar" name="descripcion" rows="3" placeholder="Actualizar notas del sabor (opcional)..." style="background-color: #f8f9fa !important; color: #212529 !important; border: 1px solid #ced4da !important; resize: none;"></textarea>
                                </div>
                               
                                <div class="d-grid mt-auto">
                                    <button type="submit" name="accion" value="actualizar" class="btn fw-bold py-2 text-uppercase text-white" style="background-color: #ffc107 !important; color: #212529 !important; border: none !important; box-shadow: 0 4px 6px rgba(0,0,0,0.15);">
                                        <i class="fas fa-sync-alt me-2"></i>Actualizar Pedido
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <section class="py-5 text-white" style="background-color: #1e3932;">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-5 text-center">
                    <i class="fas fa-trash-alt fa-2x mb-3 text-warning"></i>
                    <h4 class="text-uppercase fw-bold mb-3">Cancelar Pedido</h4>
                    <p class="text-white-50 small mb-4">Escribe el ID del pedido que deseas cancelar</p>
                   
                    <form action="productos" method="POST" class="row g-2 justify-content-center">
                        <div class="col-7 col-sm-6">
                            <input type="text"
                                   inputmode="numeric"
                                   pattern="[0-9]*"
                                   class="form-control text-center py-2"
                                   id="idProducto"
                                   name="idProducto"
                                   placeholder="Número ID"
                                   required
                                   style="border-radius: 8px; border: none;" />
                        </div>
                        <div class="col-5 col-sm-4">
                            <button type="submit" name="accion" value="eliminar" class="btn btn-danger w-100 py-2 fw-bold text-uppercase" style="border-radius: 8px;">
                                Borrar
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>