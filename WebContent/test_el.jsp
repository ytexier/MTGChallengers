<!DOCTYPE html>
<html>
   <head>
       <meta charset="utf-8" />
       <title>Test des expressions EL</title>
   </head>
   <body>
   <p>
   		<!-- Active ou d�sactive les EL et renvoie du String 
   		et donc ne sera pas interpret� par le conteneur -->
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
       	<!-- Logiques sur des bool�ens -->
        ${ true && true } <br /> <!-- Affiche true -->
        ${ true && false } <br /> <!-- Affiche false -->
        ${ !true || false } <br /> <!-- Affiche false -->
        
        <!-- Calculs arithm�tiques -->
        ${ 10 / 4 } <br /> <!-- Affiche 2.5 -->
        ${ 10 mod 4 } <br /> <!-- Affiche le reste de la division enti�re, soit 2 -->
        ${ 10 % 4 } <br /> <!-- Affiche le reste de la division enti�re, soit 2 -->
        ${ 6 * 7 } <br /> <!-- Affiche 42 -->
        ${ 63 - 8 } <br /> <!-- Affiche 55 -->
        ${ 12 / -8 } <br /> <!-- Affiche -1.5 -->
        ${ 7 / 0 } <br /> <!-- Affiche Infinity -->
        
        <!-- Compare les caract�res 'a' et 'b'. Le caract�re 'a' �tant bien situ� avant le caract�re 'b' dans l'alphabet ASCII, cette EL affiche true. -->
        ${ 'a' < 'b' } <br />  
        
        <!-- Compare les cha�nes 'hip' et 'hit'. Puisque 'p' < 't', cette EL affiche false. -->
        ${ 'hip' gt 'hit' } <br /> 
        
        <!-- Compare les caract�res 'a' et 'b', puis les cha�nes 'hip' et 'hit'. Puisque le premier test renvoie true et le second false, le r�sultat est false. -->
        ${ 'a' < 'b' && 'hip' gt 'hit' } <br /> 
        
        <!-- Compare le r�sultat d'un calcul � une valeur fixe. Ici, 6 x 7 vaut 42 et non pas 48, le r�sultat est false. -->
        ${ 6 * 7 == 48 } <br /> 
       
	</p>
	
	<p> 
		${"TEST BEAN"}<br />
        <!-- Initialisation d'un bean de type Coyote avec une action standard, pour l'exemple : -->
        <jsp:useBean id="user" class="com.mtgc.beans.User" />
        <!-- Initialisation de sa propri�t� 'pr�nom' : -->
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
         
         <!-- Comparaison d'�galit� entre la propri�t� -->
		${ user.givenName == "Yohan" }<br />
		<!-- V�rification si la propri�t� prenom est vide ou nulle -->
		${ empty user.givenName }<br />
		<!-- Condition ternaire qui affiche la propri�t� pr�nom si elle n'est ni vide ni nulle, et la cha�ne "Veuillez pr�ciser un pr�nom" sinon -->
		${ !empty user.familyName ? user.familyName : "Veuillez pr�ciser un familyName" }<br />
		<!-- La scriptlet suivante affiche "null" si la propri�t� "familyName" n'a pas �t� initialis�e, 
		et provoque une erreur � la compilation si l'objet "user" n'a pas �t� initialis� : -->
		<%= user.getFamilyName() %><br />
        
    </p>
    
    <p>
    	${"LIST"}<br />
        <% 
        /* Cr�ation d'une liste de l�gumes et insertion de quatre �l�ments */
        java.util.List<String> legumes = new java.util.ArrayList<String>();
        legumes.add( "poireau" );
        legumes.add( "haricot" );
        legumes.add( "carotte");
        legumes.add( "pomme de terre" );
        request.setAttribute( "legumes" , legumes );
        %>

        <!-- Les quatre syntaxes suivantes retournent le deuxi�me �l�ment de la liste de l�gumes  -->
        ${ legumes.get(1) }<br />
        ${ legumes[1] }<br />
        ${ legumes['1'] }<br />
        ${ legumes["1"] }<br />
    </p>
    
    <p>
    	${"TAB"}<br />
        <% 
        /* Cr�ation d'un tableau */
        String[] animaux = {"chien", "chat", "souris", "cheval"};
        request.setAttribute("animaux" , animaux);
        %>
        
        <!-- Les trois syntaxes suivantes retournent le troisi�me �l�ment du tableau  -->
        ${ animaux[2] }<br />
        ${ animaux['2'] }<br />
        ${ animaux["2"] }<br />
    </p>
    
    <p>
    	${"MAP"}<br />
        <% 
        /* Cr�ation d'une Map */
        java.util.Map<String,Integer> desserts = new java.util.HashMap<String, Integer>();
        desserts.put("cookies", 8);
        desserts.put("glaces", 3);
        desserts.put("muffins", 6);
        desserts.put("tartes aux pommes", 2);
        
        request.setAttribute("desserts" , desserts);
        %>
        
        <!-- Les quatre syntaxes suivantes retournent la valeur associ�e � la cl� "cookies" de la Map de desserts  -->
        ${ desserts.cookies }<br />
        ${ desserts.get("cookies") }<br />
        ${ desserts['cookies'] }<br />
        ${ desserts["cookies"] }<br />

        <% 
        /* Cr�ation d'une cha�ne nomm�e "element" et contenant le mot "cookies" */
        String element = "cookies"; 
        request.setAttribute("element",element);
        %>
        <!-- Il est �galement possible d'utiliser un objet au lieu d'initialiser la cl� souhait�e directement dans l'expression -->
        ${ desserts[element] }<br />
    </p>
    
    </body>
</html>