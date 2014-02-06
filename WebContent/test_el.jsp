<!DOCTYPE html>
<html>
   <head>
       <meta charset="utf-8" />
       <title>Test des expressions EL</title>
   </head>
   <body>
   <p>
   		<!-- Active ou désactive les EL et renvoie du String 
   		et donc ne sera pas interpreté par le conteneur -->
   		<%@ page isELIgnored ="false" %>
   		<!-- On peut sinon directement le faire par web.xml -->
   		<!-- 
   		<jsp-config>
		    <jsp-property-group>
		        <url-pattern>*.jsp</url-pattern>
		        <el-ignored>true</el-ignored>
		    </jsp-property-group>
		</jsp-config>
		 -->
   		
   		${"TEST EL"}<br />
       	<!-- Logiques sur des booléens -->
        ${ true && true } <br /> <!-- Affiche true -->
        ${ true && false } <br /> <!-- Affiche false -->
        ${ !true || false } <br /> <!-- Affiche false -->
        
        <!-- Calculs arithmétiques -->
        ${ 10 / 4 } <br /> <!-- Affiche 2.5 -->
        ${ 10 mod 4 } <br /> <!-- Affiche le reste de la division entière, soit 2 -->
        ${ 10 % 4 } <br /> <!-- Affiche le reste de la division entière, soit 2 -->
        ${ 6 * 7 } <br /> <!-- Affiche 42 -->
        ${ 63 - 8 } <br /> <!-- Affiche 55 -->
        ${ 12 / -8 } <br /> <!-- Affiche -1.5 -->
        ${ 7 / 0 } <br /> <!-- Affiche Infinity -->
        
        <!-- Compare les caractères 'a' et 'b'. Le caractère 'a' étant bien situé avant le caractère 'b' dans l'alphabet ASCII, cette EL affiche true. -->
        ${ 'a' < 'b' } <br />  
        
        <!-- Compare les chaînes 'hip' et 'hit'. Puisque 'p' < 't', cette EL affiche false. -->
        ${ 'hip' gt 'hit' } <br /> 
        
        <!-- Compare les caractères 'a' et 'b', puis les chaînes 'hip' et 'hit'. Puisque le premier test renvoie true et le second false, le résultat est false. -->
        ${ 'a' < 'b' && 'hip' gt 'hit' } <br /> 
        
        <!-- Compare le résultat d'un calcul à une valeur fixe. Ici, 6 x 7 vaut 42 et non pas 48, le résultat est false. -->
        ${ 6 * 7 == 48 } <br /> 
       
	</p>
	
	<p> 
		${"TEST BEAN"}<br />
        <!-- Initialisation d'un bean de type Coyote avec une action standard, pour l'exemple : -->
        <jsp:useBean id="user" class="com.mtgc.beans.User" />
        <!-- Initialisation de sa propriété 'prénom' : -->
        <jsp:setProperty name="user" property="givenName" value="Yohan"/>
        <!-- Et affichage de sa valeur : -->
        <jsp:getProperty name="user" property="givenName" />
        
        <!-- Utilisation du raccourci EL -->
        <br/>
       	<%= "EL c'est magique !" %>
       	${"its me "}
        ${ user.givenName }<br />
        <!-- Son equivalent en Java -->
        <!-- 
        Coyote bean = (Coyote) pageContext.findAttribute( "coyote" );
        if ( bean != null ) {
    	String prenom = bean.getPrenom();
	    	if ( prenom != null ) {
	        out.print( prenom );
	   		}
		}
         -->
         
         <!-- Comparaison d'égalité entre la propriété -->
		${ user.givenName == "Yohan" }<br />
		<!-- Vérification si la propriété prenom est vide ou nulle -->
		${ empty user.givenName }<br />
		<!-- Condition ternaire qui affiche la propriété prénom si elle n'est ni vide ni nulle, et la chaîne "Veuillez préciser un prénom" sinon -->
		${ !empty user.familyName ? user.familyName : "Veuillez préciser un familyName" }<br />
		<!-- La scriptlet suivante affiche "null" si la propriété "familyName" n'a pas été initialisée, 
		et provoque une erreur à la compilation si l'objet "user" n'a pas été initialisé : -->
		<%= user.getFamilyName() %><br />
        
    </p>
    
    <p>
    	${"LIST"}<br />
        <% 
        /* Création d'une liste de légumes et insertion de quatre éléments */
        java.util.List<String> legumes = new java.util.ArrayList<String>();
        legumes.add( "poireau" );
        legumes.add( "haricot" );
        legumes.add( "carotte");
        legumes.add( "pomme de terre" );
        request.setAttribute( "legumes" , legumes );
        %>

        <!-- Les quatre syntaxes suivantes retournent le deuxième élément de la liste de légumes  -->
        ${ legumes.get(1) }<br />
        ${ legumes[1] }<br />
        ${ legumes['1'] }<br />
        ${ legumes["1"] }<br />
    </p>
    
    <p>
    	${"TAB"}<br />
        <% 
        /* Création d'un tableau */
        String[] animaux = {"chien", "chat", "souris", "cheval"};
        request.setAttribute("animaux" , animaux);
        %>
        
        <!-- Les trois syntaxes suivantes retournent le troisième élément du tableau  -->
        ${ animaux[2] }<br />
        ${ animaux['2'] }<br />
        ${ animaux["2"] }<br />
    </p>
    
    <p>
    	${"MAP"}<br />
        <% 
        /* Création d'une Map */
        java.util.Map<String,Integer> desserts = new java.util.HashMap<String, Integer>();
        desserts.put("cookies", 8);
        desserts.put("glaces", 3);
        desserts.put("muffins", 6);
        desserts.put("tartes aux pommes", 2);
        
        request.setAttribute("desserts" , desserts);
        %>
        
        <!-- Les quatre syntaxes suivantes retournent la valeur associée à la clé "cookies" de la Map de desserts  -->
        ${ desserts.cookies }<br />
        ${ desserts.get("cookies") }<br />
        ${ desserts['cookies'] }<br />
        ${ desserts["cookies"] }<br />

        <% 
        /* Création d'une chaîne nommée "element" et contenant le mot "cookies" */
        String element = "cookies"; 
        request.setAttribute("element",element);
        %>
        <!-- Il est également possible d'utiliser un objet au lieu d'initialiser la clé souhaitée directement dans l'expression -->
        ${ desserts[element] }<br />
    </p>
    
    </body>
</html>