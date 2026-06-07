<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="Starbucks Colombia - Aplicación Web" />
    <meta name="author" content="Juan Diego Vélez" />
    <title>Starbucks</title>
    
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
    <link href="css/styles.css" rel="stylesheet" />
</head>
<body id="page-top">

    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
        <div class="container px-4 px-lg-5">
            <a class="navbar-brand" href="#page-top">Starbucks</a>
            <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                Menu <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="#about">Acerca de</a></li>
                    <li class="nav-item"><a class="nav-link" href="#signup">Menú</a></li>
                    <li class="nav-item"><a class="nav-link" href="usuarios">Usuarios</a></li>
                    <li class="nav-item"><a class="nav-link" href="productos">Pedidos en Fila</a></li>
                    <li class="nav-item"><a class="nav-link text-danger" href="principal?accion=logout">Cerrar Sesión</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <header class="masthead">
        <div class="container px-4 px-lg-5 d-flex h-100 align-items-center justify-content-center">
            <div class="d-flex justify-content-center">
                <div class="text-center">
                    <h1 class="mx-auto my-0 text-uppercase">Starbucks</h1>
                    <h2 class="text-white-50 mx-auto mt-2 mb-5">Suscribete para recibir beneficios exclusivos</h2>
                    <a class="btn btn-primary" href="login.jsp">Entrar</a>
                </div>
            </div>
        </div>
    </header>

    <section class="about-section text-center" id="about">
        <div class="container px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="col-lg-8">
                    <h2 class="text-white mb-4">Gracias por visitarnos</h2>
                    <p class="text-white-50">
                        Iniciando sesion podras recibir acceso a nuestro menu donde podras crear tu pedido y lograr ver que pedidos estan en fila hasta este momento
                    </p>
                </div>
            </div>
            <img class="img-fluid" src="assets/img/cafe.png" alt="Café Starbucks" />
        </div>
    </section>

    <section class="projects-section bg-light" id="projects">
        <div class="container px-4 px-lg-5">
            
            <div class="row gx-0 mb-5 align-items-center">
                <div class="col-xl-6 col-lg-6">
                    <img class="img-fluid mb-3 mb-lg-0" src="assets/img/demo-image-01.jpg" alt="Starbucks Coffee" style="width: 100%; object-fit: cover;" />
                </div>
                <div class="col-xl-6 col-lg-6">
                    <div class="featured-text text-center text-lg-left p-4">
                        <h4>¿Qué ofrecemos?</h4>
                        <p class="text-black-50 mb-0">
                            Desde los mejores cafés de la ciudad hasta horneados, tenemos todo lo que necesitas durante tu día. En nuestra pestaña productos puedes acceder a todo nuestro menú.
                        </p>
                    </div>
                </div>
            </div>

            <div class="row gx-0 mb-5 align-items-center">
                <div class="col-xl-6 col-lg-6 order-lg-first">
                    <div class="bg-black text-center h-100 project p-5 text-white">
                        <div class="d-flex h-100">
                            <div class="project-text w-100 my-auto text-center text-lg-left">
                                <h4 class="text-white mb-3">Tu café Starbucks en prensa francesa</h4>
                                <p class="mb-0 text-white-50 text-start" style="font-size: 0.95rem; line-height: 1.6;">
                                    <strong>¿Qué necesitamos?</strong><br/>
                                    - Tu CAFÉ STARBUCKS COLOMBIA<br/>
                                    - Prensa Francesa<br/>
                                    - Cuchara<br/>
                                    - Tu taza favorita<br/>
                                    - Agua<br/><br/>
                                    Prepara tu prensa de café y no olvides precalentar la prensa de café enjuagándola con agua caliente. No olvides desechar el agua antes de agregar los pasos.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-6 col-lg-6">
                    <img class="img-fluid" src="assets/img/demo-image-02.jpg" alt="Prensa Francesa" style="width: 100%; height: 100%; object-fit: cover;" />
                </div>
            </div>

            <div class="row gx-0 mb-5 align-items-center">
                <div class="col-xl-6 col-lg-6">
                    <img class="img-fluid" src="assets/img/demo-image-03.jpg" alt="Preparación" style="width: 100%; object-fit: cover;" />
                </div>
                <div class="col-xl-6 col-lg-6">
                    <div class="bg-black text-center h-100 project p-5 text-white">
                        <div class="d-flex h-100">
                            <div class="project-text w-100 my-auto text-center text-lg-left">
                                <h4 class="text-white mb-3">Pasos de Preparación</h4>
                                <p class="mb-0 text-white-50 text-start" style="font-size: 0.95rem; line-height: 1.6;">
                                    - Agrega el café molido grueso. Usa 2 cucharadas (10 g) de café molido por cada taza (180 ml) de agua caliente.<br/>
                                    - Vierte agua justo debajo del borde de la prensa.<br/>
                                    - Revuelve suavemente los granos varias veces con una cuchara.<br/>
                                    - Coloca la tapa del émbolo, asegura y espera.<br/>
                                    - Espera 4 minutos para que se libere el café.<br/>
                                    - Empuja firmemente el émbolo hacia abajo, separando así el café de la superficie.<br/><br/>
                                    <strong>¡Sirve y saborea tu café favorito en casa!</strong>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </section>

    <section class="signup-section" id="signup">
        <div class="container px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5">
                <div class="col-md-10 col-lg-8 mx-auto text-center">
                    <i class="fas fa-shopping-bag fa-2x mb-3 text-white"></i>
                    <h2 class="text-white mb-4">Gestiona tu Experiencia Starbucks</h2>
                    <p class="text-white-50 mb-5">Haz clic en el siguiente botón para comenzar a seleccionar tus productos favoritos.</p>
                    <div class="d-flex justify-content-center align-items-center">
                        <a href="pedido.jsp" class="btn btn-primary btn-lg px-5 py-3 fw-bold text-uppercase shadow">
                            <i class="fas fa-coffee me-2"></i>Haz tu pedido
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="contact-section bg-black">
        <div class="container px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5">
                
                <div class="col-md-4 mb-4 mb-md-0">
                    <div class="card py-4 h-100 border-0 shadow">
                        <div class="card-body text-center">
                            <i class="fas fa-map-marked-alt text-primary mb-3 fa-lg"></i>
                            <h4 class="text-uppercase m-0 small fw-bold text-muted">Nombre</h4>
                            <hr class="my-4 mx-auto style-starbucks" style="max-width: 3rem; border-top: 3px solid #198754;" />
                            <div class="small text-black-50 fw-semibold">Starbucks Cúcuta</div>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4 mb-4 mb-md-0">
                    <div class="card py-4 h-100 border-0 shadow">
                        <div class="card-body text-center">
                            <i class="fas fa-envelope text-primary mb-3 fa-lg"></i>
                            <h4 class="text-uppercase m-0 small fw-bold text-muted">Email</h4>
                            <hr class="my-4 mx-auto style-starbucks" style="max-width: 3rem; border-top: 3px solid #198754;" />
                            <div class="small text-black-50">
                                <a href="mailto:juandiego.velez@udea.edu.co" class="text-decoration-none text-success">juandiego.velez@udea.edu.co</a>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-4 mb-4 mb-md-0">
                    <div class="card py-4 h-100 border-0 shadow">
                        <div class="card-body text-center">
                            <i class="fas fa-mobile-alt text-primary mb-3 fa-lg"></i>
                            <h4 class="text-uppercase m-0 small fw-bold text-muted">Phone</h4>
                            <hr class="my-4 mx-auto style-starbucks" style="max-width: 3rem; border-top: 3px solid #198754;" />
                            <div class="small text-black-50 fw-semibold">+57 302 3530698</div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <footer class="footer bg-black small text-center text-white-50">
        <div class="container px-4 px-lg-5">Copyright &copy; Starbucks Colombia 2026</div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/scripts.js"></script>
</body>
</html>