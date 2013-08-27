
<%@page import="com.wso2.identity.oauth.sample.OAuth2ServiceClient"%>
<%@page import="org.wso2.carbon.identity.oauth2.stub.dto.OAuth2TokenValidationRequestDTO" %>

<%
    OAuth2ServiceClient client = new OAuth2ServiceClient();   
    String accessToken = request.getParameter("accessToken");
    
    if (accessToken==null || accessToken.trim().length()==0) {
%>
    	 <script type="text/javascript">
    	    window.location = "oauth2.jsp?reset=true";
    	 </script>
<%    	
    }
    
    OAuth2TokenValidationRequestDTO  oauthReq = new OAuth2TokenValidationRequestDTO();    
    oauthReq.setAccessToken(accessToken);
    oauthReq.setTokenType("bearer");
    
    try {
    	// Validate the OAuth access token.
    	if (!client.validateAuthenticationRequest(oauthReq)) {
%>
 		<script type="text/javascript">
    		window.location = "oauth2.jsp?reset=true&error='Invalid Access Attempt'";
 		</script>
<%
        } 
    } catch(Exception e) {
 %>
    <script type="text/javascript">
       window.location = "oauth2.jsp?reset=true&error=<%=e.getMessage()%>";
    </script>
<%
    }    
%>


<!DOCTYPE html>
<html><head>
<title>WSO2 OAuth2 Playground</title>
<meta charset="UTF-8">
<meta name="description" content="" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
<!--[if lt IE 9]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
<script type="text/javascript" src="js/prettify.js"></script>                                   <!-- PRETTIFY -->
<script type="text/javascript" src="js/kickstart.js"></script>                                  <!-- KICKSTART -->
<link rel="stylesheet" type="text/css" href="css/kickstart.css" media="all" />                  <!-- KICKSTART -->
<link rel="stylesheet" type="text/css" href="style.css" media="all" />                          <!-- CUSTOM STYLES -->



</head><body><a id="top-of-page"></a><div id="wrap" class="clearfix">
<!-- ===================================== END HEADER ===================================== -->

<!-- 
	
		ADD YOU HTML ELEMENTS HERE
		
		Example: 2 Columns
	 -->
	 <!-- Menu Horizontal -->
	<ul class="menu">
	<li class="current"><a href="index.jsp?reset=true">Home</a></li>
	
	</ul>

<br/>
	<h3 align="center">WSO2 OAuth2 Playground ~ My Photos</h3>
	

<table style="width:100%;text-align:center;'">
<tr>
<td style="text-align:center;width:100%">        						
<img src="images/nature-1.png" width="300px" height="350px" />
</td>
</tr>

<tr>
<td style="text-align:center;width:100%">        						
<img src="images/nature-2.png" width="300px" height="350px" />
</td>
</tr>

<tr>
<td style="text-align:center;width:100%">        						
<img src="images/nature-3.png" width="300px" height="350px" />
</td>
</tr>
    
</table>
</div>

</body>
</html>
