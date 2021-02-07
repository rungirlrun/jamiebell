<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>	
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Jamie Bell's Filmography</title>
	<c:set var="path" value="${pageContext.request.contextPath}"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Droid+Sans:400,700" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.8.1/baguetteBox.min.css">
    <link rel="stylesheet" href="${path}/resources/css/thumbnail-gallery.css">

</head>
<body>

<div class="container gallery-container">

    <h1>Jamie Bell's Filmography</h1>

    <p class="page-description text-center">Andrew James Matfin Jamie Bell, March 14th, 1986</p>
    
    <div class="tz-gallery">

        <div class="row">
        <c:if test="${selectFilm==null}">
       <div>바보</div>
        </c:if>

		<c:forEach items="${selectFilm}" var="selectFilm">
			<div class="col-sm-6 col-md-4">
                <div class="thumbnail">
                	<c:if test="${selectFilm.jrole==''}">
                    <a class="lightbox" href="${path}/resources/images/unnamed.gif">
                        <img src="${path}/resources/images/unnamed.gif" alt="unnamed">
                    </a>
                    </c:if>
                    <c:if test="${selectFilm.jrole!=''}">
                    <a class="lightbox" href="${path}/resources/images/${selectFilm.url}">
                        <img src="${path}/resources/images/${selectFilm.url}" alt="${selectFilm.jrole}">
                    </a>
                    </c:if>
                    <div class="caption">
                        <h3><c:out value="${selectFilm.title}" />(<c:out value="${selectFilm.jyear}" />)</h3>
                        <p><c:out value="${selectFilm.notes}" /></p>
                    </div>
                </div>
            </div>
		</c:forEach>

<!-- 
            <div class="col-sm-6 col-md-4">
                <div class="thumbnail">
                    <a class="lightbox" href="../images/billy.gif">
                        <img src="../images/billy.gif" alt="Billy Eliot">
                    </a>
                    <div class="caption">
                        <h3>Billy Elliot(2000)</h3>
                        <p>Billy Elliot is a 2000 British dance drama film directed by Stephen Daldry and written by Lee Hall.</p>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-md-4">
                <div class="thumbnail">
                    <a class="lightbox" href="../images/iggy.gif">
                        <img src="../images/iggy.gif" alt="Flags of our Fathers: Heroes of Iwo Jima">
                    </a>
                    <div class="caption">
                        <h3>Flags of our Fathers: Heroes of Iwo Jima(2002)</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-md-4">
                <div class="thumbnail">
                    <a class="lightbox" href="../images/smike.gif">
                        <img src="../images/smike.gif" alt="Nicholas Nicklebyj(2002)">
                    </a>
                    <div class="caption">
                        <h3>Nicholas Nickleby</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-md-4">
                <div class="thumbnail">
                    <a class="lightbox" href="../images/coast.jpg">
                        <img src="../images/coast.jpg" alt="Coast">
                    </a>
                    <div class="caption">
                        <h3>Thumbnail label</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-md-4">
                <div class="thumbnail">
                    <a class="lightbox" href="../images/rails.jpg">
                        <img src="../images/rails.jpg" alt="Rails">
                    </a>
                    <div class="caption">
                        <h3>Thumbnail label</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-md-4">
                <div class="thumbnail">
                    <a class="lightbox" href="../images/traffic.jpg">
                        <img src="../images/traffic.jpg" alt="Traffic">
                    </a>
                    <div class="caption">
                        <h3>Thumbnail label</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                    </div>
                </div>
            </div>
            -->
        </div>

    </div>

</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.8.1/baguetteBox.min.js"></script>
<script>
    baguetteBox.run('.tz-gallery');
</script>
</body>
</html>