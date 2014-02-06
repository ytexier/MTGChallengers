<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Test des objets implicites EL</title>
    </head>
    <body>
    
    <!-- http://localhost:8080/MTGChallengers/test_obj_impl.jsp?langue=fr&article=mon_article -->
    <!-- dans le cas ou le map des params serait  Map<String,String> -->
    <p>
	<% 
	String paramLangue = request.getParameter("langue");
	out.println( "Langue : " + paramLangue );
	%>
	<br />
	<%
	String paramArticle = request.getParameter("article");
	out.println( "Article : " + paramArticle );
	%>
    </p>
    
    <!-- La même chose mais cette fois avec EL -->
    <!-- Pratique et elegant :) -->
    <p>
    Langue : ${ param.langue }
    <br />
    Article : ${ param.article }
    </p>
    
    <!-- http://localhost:8080/MTGChallengers/test_obj_impl.jsp?langue=fr&langue=en&&article=mon_article -->
   	<!-- dans le cas ou le map serait des params Map<String,String[]> -->
   	<p>
    Langue : ${ paramValues.langue[1] }
    <br />
    Article : ${ paramValues.article[0] }
    </p>
    
    <!-- http://localhost:8080/MTGChallengers/test_map.jsp -->
    <!-- Pour afficher chaque pays contenu dans paramValues -->
    <c:forEach var='parameter' items='${paramValues}'> 
		<b><c:out value='${parameter.key}'/></b>:
         <ul>
            <c:forEach var='value' items='${parameter.value}'>
            	<li>
               		<c:out value='${value}'/>   
               	</li>
            </c:forEach>
         </ul>
     </c:forEach>
     
    </body>
</html>