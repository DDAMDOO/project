<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Team Project by 2020 TMC</title>
    <link href="css/styles.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"
        crossorigin="anonymous"></script>
</head>

<body class="bg-img">
    <div id="layoutAuthentication">
        <div id="layoutAuthentication_content">
            <main>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-7">
                            <div class="card shadow-lg border-0 rounded-lg mt-5">
                                <div class="card-header">
                                    <h3 class="text-center font-weight-light my-4">Create Account</h3>
                                </div>
                                <div class="card-body">
                                    <form action="../../ins1" method="GET">
                                        <div class="form-group">
                                            <label class="small mb-1" for="inputName">Name</label>
                                            <input class="form-control py-4" name="inputName" id="inputName" type="text"
                                                placeholder="Enter name" />
                                        </div>
                                        <div class="form-group">
                                            <label class="small mb-1" for="inputID">ID</label>
                                            <input class="form-control py-4" name="inputID" id="inputID" type="text"
                                                placeholder="Enter id" />
                                        </div>
                                        <div class="form-group">
                                            <label class="small mb-1" for="inputEmailAddress">Email</label><input
                                                class="form-control py-4" name="inputEmailAddress"
                                                id="inputEmailAddress" type="email" aria-describedby="emailHelp"
                                                placeholder="Enter email address" /></div>
                                        <div class="form-row">
                                            <div class="col-md-6">
                                                <div class="form-group"><label class="small mb-1"
                                                        for="inputPassword">Password</label><input
                                                        class="form-control py-4" name="inputPassword"
                                                        id="inputPassword" type="password"
                                                        placeholder="Enter password" /></div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group"><label class="small mb-1"
                                                        for="inputConfirmPassword">Confirm Password</label><input
                                                        class="form-control py-4" id="inputConfirmPassword"
                                                        type="password" placeholder="Confirm password" /></div>
                                            </div>
                                        </div>
                                        <div class="form-group"><label class="small mb-1"
                                                for="inputBirth">Birth</label><input class="form-control py-4"
                                                id="inputBirth" name="inputBirth" type="text"
                                                placeholder="ex)1999-01-01" /></div>
                                        <div class="form-group"><label class="small mb-1"
                                                for="inputBirth">Gender</label><br>
                                            <input type="radio" id="male" name="gender" value="male">
                                            <label for="male">Male</label><br>
                                            <input type="radio" id="female" name="gender" value="female">
                                            <label for="female">Female</label><br>
                                        </div>

                                        <!-- <div class="form-group mt-4 mb-0"><a class="btn btn-primary btn-block"
                                                href="login.html">Create Account</a></div> -->
                                        <div class="form-group mt-4 mb-0">
                                            <button class="btn btn-primary btn-block" type="submit">Create
                                                Account</button>
                                        </div>
                                    </form>
                                </div>
                                <div class="card-footer text-center">
                                    <div class="small"><a href="login.html">Have an account? Go to login</a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
        <div id="layoutAuthentication_footer">
            <footer id="footer" class="py-4 bg-light mt-auto">
            </footer>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#footer").load("content/footer.html")
        });
    </script>
</body>

</html>