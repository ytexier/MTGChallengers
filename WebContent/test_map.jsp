<%@ page import="java.util.Map, java.util.HashMap" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Test des Maps et EL</title>
    </head>
    <body>
    <p>
       <%
         Map<String, String> aliments = new HashMap<String, String>();
         aliments.put( "pomme","fruit" );
         aliments.put( "carotte","légume" );
         aliments.put( "boeuf","viande" );
         aliments.put( "aubergine","légume" );
         request.setAttribute( "aliments", aliments );
       %>
       ${ aliments.pomme } <br /> <!-- affiche fruit -->
       ${ aliments.carotte } <br /> <!-- affiche légume -->
       ${ aliments.boeuf } <br /> <!-- affiche viande -->
       ${ aliments.aubergine } <br /><!-- affiche légume -->
    </p>
    
    <form method="get" action="/MTGChallengers/test_obj_impl.jsp">
	   <p>
	       <label for="pays">Dans quel(s) pays avez-vous déjà voyagé ?</label><br />
	       <select name="pays" id="pays" multiple="multiple">
	           <option value="france">France</option>
	           <option value="espagne">Espagne</option>
	           <option value="italie">Italie</option>
	           <option value="royaume-uni">Royaume-Uni</option>
	           <option value="canada">Canada</option>
	           <option value="etats-unis">Etats-Unis</option>
	           <option value="chine" selected="selected">Chine</option>
	           <option value="japon">Japon</option>
	       </select>
	   </p>
	   <input type="submit">
	</form>
	
    </body>
</html>