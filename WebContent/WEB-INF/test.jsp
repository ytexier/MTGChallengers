<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Test</title>
    </head>

    <body>
        <p>Ceci est une page générée depuis une JSP.</p>
        <p>
            <% 
            String attribut = (String) request.getAttribute("test");
            out.println( attribut );

            String parametre = request.getParameter( "auteur" );
            out.println( parametre );
            %>
        </p>
        <p>
        	
        	<%= "Bip bip !" %>
        	
            Récupération du bean :
            <%  
        	com.mtgc.beans.User userBean = (com.mtgc.beans.User) request.getAttribute("user");
       		out.println( userBean.getFamilyName() );
            out.println( userBean.getGivenName() );
            %>
    </body>
</html>