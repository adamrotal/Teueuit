<!-- <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Teueuit.WebForm1" %> -->

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Teueuit</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/flexslider.css">
    <link rel="stylesheet" href="css/jquery.fancybox.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/responsive.css">
    <link rel="stylesheet" href="css/animate.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
</head>
<body>
    <form id="form1" runat="server">
    <section class="banner" role="banner">
        <header id="header">
            <div class="header-content clearfix">
                <a class="logo" href="#"><img src="images/logo_teueuit.png" alt=""></a>
                <nav class="navigation" role="navigation">
                    <ul class="primary-nav">
                        <li><a href="#search">Search Tweets</a></li>
                        <li><a href="#result">Result</a></li>
                        <li><a href="#teams">Teams</a></li>
                    </ul>
                </nav>
                <a href="#" class="nav-toggle">Menu<span></span></a>
            </div><!-- header content -->
        </header><!-- header -->
       
        <div class="container">
            <div class="col-md-10 col-md-offset-1">
                <div class="banner-text text-center">
                    <h1>Listen what matters.</h1>
                    <h3>Help you discover what people think about our lovely <strong>B A N D U N G</strong>.</h3>
                    <!--<a href="#" class="btn btn-large">Find out more</a> -->
                </div><!-- banner text -->
            </div>
        </div>
    </section>
    <!-- banner -->
    
    <!-- Contact Form -->
    <section id="search" class="space100">
        <div class="container">
            <div class="row">
            </div>
            <div class="headingsyle">
             <h1><span>SEARCH</span></h1>
           </div>
           
            <!-- ./end row -->
            <div class="row">
                <div class="col-md-8">
                    <div id="main-contact-form" class="contact-form">
                        <!-- form -->
                        
                            <div class="form-group">
                                <label class="sr-only" for="search-keyword">
                                    Keyword</label>
                                <asp:TextBox ID="txtKeyWord" runat="server" CssClass="search-keyword form-control" />
                                  
                            </div>
                            <div class="form-group">
                                <label class="sr-only" for="dinas-kebersihan">
                                    Dinas Kebersihan</label>
                                <asp:TextBox ID="txtKebersihan" runat="server" CssClass="dinas-kebersihan form-control" />
                            </div>
                            <div class="form-group">
                                <label class="sr-only" for="dinas-pendidikan">
                                    Dinas Pendidikan</label>
                                <asp:TextBox ID="txtPendidikan" runat="server" CssClass="dinas-pendidikan form-control" />
                            </div>
                            <div class="form-group">
                                <label class="sr-only" for="dinas-perhubungan">
                                    Dinas Perhubungan</label>
                                <asp:TextBox ID="txtPerhubungan" runat="server" CssClass="dinas-perhubungan form-control" />
                            </div>
                            <div class="form-group">
                                <label class="sr-only" for="dinas-pertamanan">
                                    Dinas Pertamanan</label>
                                <asp:TextBox ID="txtPertamanan" runat="server" CssClass="dinas-pertamanan form-control" />
                            </div>
                            <div class="form-group">
                                <label class="sr-only" for="dinas-sosial">
                                    Dinas Sosial</label>
                                <asp:TextBox ID="txtSosial" runat="server" CssClass="dinas-sosial form-control" />
                            </div>

                            <div class="form-group">
                                <label>Pilih Algoritma</label>
                                <asp:DropDownList ID="ddlAlgoritma" CssClass="form-control" runat="server">
                                    <asp:ListItem Value="KMP">Knuth-Morris-Pratt Algorithm</asp:ListItem>
                                    <asp:ListItem Value="BM">Boyer-Moore Algorithm</asp:ListItem>
                                </asp:DropDownList>

                            </div>

                            <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-small" Text="Search" OnClick="btnSearch_Click" />
                            

                            
                        
                        
                        <!-- ./form -->
                    </div>
                </div>
            </div>
            <!-- ./end row -->
        </div>
    </section>

    <section id="result" class="features section" runat="server">
        <div class="container">
            <div class="row">
                <div class="headingsyle">
                    <h1><span>RESULT</span></h1>
                </div>
                <h3>Dinas Kebersihan</h3>
                <asp:Repeater ID="rptKebersihan" runat="server">
                    <ItemTemplate>
                        <p><%# DataBinder.Eval(Container.DataItem,"Username") %> : <%# DataBinder.Eval(Container.DataItem,"Isi") %></p>
                    </ItemTemplate>
                </asp:Repeater>
                <h3>Dinas Pendidikan</h3>
                <asp:Repeater ID="rptPendidikan" runat="server">
                    <ItemTemplate>
                        <p><%# DataBinder.Eval(Container.DataItem,"Username") %> : <%# DataBinder.Eval(Container.DataItem,"Isi") %></p>
                    </ItemTemplate>
                </asp:Repeater>
                <h3>Dinas Perhubungan</h3>
                <asp:Repeater ID="rptPerhubungan" runat="server">
                    <ItemTemplate>
                        <p><%# DataBinder.Eval(Container.DataItem,"Username") %> : <%# DataBinder.Eval(Container.DataItem,"Isi") %></p>
                    </ItemTemplate>
                </asp:Repeater>
                <h3>Dinas Perhubungan</h3>
                <asp:Repeater ID="rptPertamanan" runat="server">
                    <ItemTemplate>
                        <p><%# DataBinder.Eval(Container.DataItem,"Username") %> : <%# DataBinder.Eval(Container.DataItem,"Isi") %></p>
                    </ItemTemplate>
                </asp:Repeater>
                <h3>Dinas Sosial</h3>
                <asp:Repeater ID="rptSosial" runat="server">
                    <ItemTemplate>
                        <p><%# DataBinder.Eval(Container.DataItem,"Username") %> : <%# DataBinder.Eval(Container.DataItem,"Isi") %></p>
                    </ItemTemplate>
                </asp:Repeater>
                <h3>Unknown</h3>
                <asp:Repeater ID="rptUnknown" runat="server">
                    <ItemTemplate>
                        <p><%# DataBinder.Eval(Container.DataItem,"Username") %> : <%# DataBinder.Eval(Container.DataItem,"Isi") %></p>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </section>
    <!-- features -->

    <section id="teams" class="section teams">
        <div class="container">
            <div class="row">
             <div class="headingsyle">
             <h1><span>TEAM</span></h1>
           </div>
                <div class="col-md-4 col-sm-6">
                    <div class="person">
                        <img src="images/foto-adam.jpg" alt="" class="img-responsive">
                        <div class="person-content">
                            <h4><strong>Adam Rotal Yuliandaru</strong></h4>
                            <h5 class="role"><strong>Co-Founder, Developer</strong></h5>
                            <p>The benefits of such a service, if priced, are held to be self-evident in the buyer's willingness to pay for it. Public services are those, that society (nation state, fiscal union, regional) as a whole pays for, through taxes and other means.</p>
                        </div>
                        <ul class="social-icons clearfix">
                            <li><a href="#" class=""><span class="fa fa-facebook"></span></a></li>
                            <li><a href="#" class=""><span class="fa fa-twitter"></span></a></li>
                            <li><a href="#" class=""><span class="fa fa-linkedin"></span></a></li>
                            <li><a href="#" class=""><span class="fa fa-google-plus"></span></a></li>
                            <li><a href="#" class=""><span class="fa fa-dribbble"></span></a></li>
                        </ul>
                    </div><!-- person -->
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="person">
                        <img src="images/foto-umay.jpg" alt="" class="img-responsive">
                        <div class="person-content">
                            <h4><strong>Sri Umay Nur'aini S.</strong></h4>
                            <h5 class="role"><strong>UI Designer</strong></h5>
                            <p>The benefits of such a service, if priced, are held to be self-evident in the buyer's willingness to pay for it. Public services are those, that society (nation state, fiscal union, regional) as a whole pays for, through taxes and other means.</p>
                        </div>
                        <ul class="social-icons clearfix">
                            <li><a href="#" class=""><span class="fa fa-facebook"></span></a></li>
                            <li><a href="#" class=""><span class="fa fa-twitter"></span></a></li>
                            <li><a href="#" class=""><span class="fa fa-linkedin"></span></a></li>
                            <li><a href="#" class=""><span class="fa fa-google-plus"></span></a></li>
                            <li><a href="#" class=""><span class="fa fa-dribbble"></span></a></li>
                        </ul>
                    </div><!-- person -->
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="person">
                        <img src="images/foto-fajar.jpg" alt="" class="img-responsive">
                        <div class="person-content">
                            <h4><strong>Ahmad Fajar Prasetiyo</strong></h4>
                            <h5 class="role"><strong>Data Scientist</strong></h5>
                            <p>The benefits of such a service, if priced, are held to be self-evident in the buyer's willingness to pay for it. Public services are those, that society (nation state, fiscal union, regional) as a whole pays for, through taxes and other means.</p>
                        </div>
                        <ul class="social-icons clearfix">
                            <li><a href="#" class=""><span class="fa fa-facebook"></span></a></li>
                            <li><a href="#" class=""><span class="fa fa-twitter"></span></a></li>
                            <li><a href="#" class=""><span class="fa fa-linkedin"></span></a></li>
                            <li><a href="#" class=""><span class="fa fa-google-plus"></span></a></li>
                            <li><a href="#" class=""><span class="fa fa-dribbble"></span></a></li>
                        </ul>
                    </div><!-- person -->
                </div>
            </div>
        </div>
    </section>
    <!-- teams -->
    <hr />
    <footer class="footer">
        <div class="footer-top">
            <div class="container">
                <div class="row">
                    <div class="footer-col col-md-4">
                        <h5>Location</h5>
                        <p style="color:black">Jalan Ganesha Nomor 10<br>Bandung, Indonesia</p>
                    </div>
                    <div class="footer-col col-md-4">
                        <h5>Share with Love</h5>
                        <ul class="footer-share">
                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                            <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                        </ul>
                    </div>
                    <div class="footer-col col-md-4">
                        <h5>About Teueuit</h5>
                        <p style="color:black">Teueuit is a web application that can help you discover what people think about Bandung.</p>
                    </div>
                </div>
            </div>
        </div><!-- footer top -->
        <div class="footer-bottom">
            <div class="container">
                <div class="col-md-12">
                    <p style="color:black">Copyright © 2016 Teueuit. All Rights Reserved<br>Made with <i class="fa fa-heart pulse"></i></p>
                </div>
            </div>
        </div>
    </footer>
    <!-- footer -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script>        window.jQuery || document.write('<script src="js/jquery.min.js"><\/script>')</script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.flexslider-min.js"></script>
    <script src="js/jquery.fancybox.pack.js"></script>
    <script src="js/jquery.waypoints.min.js"></script>
    <script src="js/retina.min.js"></script>
    <script src="js/modernizr.js"></script>
    <script src="js/main.js"></script>
    </form>
</body>
</html>
