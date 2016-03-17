<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <style type='text/css'>
        body {
            padding-top: 0px;
            margin-left: 0px;
            margin-right: 0px;
            margin-top: 0px;
            background-color: whitesmoke;

        }

        p {
            box-sizing: border-box;
            color: #FFF;
            font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
            font-size: 16px;
            font-weight: 500;
            margin-bottom: 0px;
            margin-top: 0px;

        }

        #heading {
            text-align: left;
            margin: 0px auto;
            padding: 15px;
            background: none repeat scroll 0% 0% #337AB7;
            border-radius: 0px 0px 0px 0px;
            position: relative;

        }

        #centerbox {
            border-radius: 4px 4px 4px 4px;
            border: 1px solid #337AB7;
             width: 460px;
            background-color: white;
            margin-top: 90px;
            left: 50%;
            margin-left: -230px;
            position: absolute;
            overflow: visible;
            text-align: right;
            line-height: 1;

        }

        #login {

            padding: 10px;

        }


        input.button {
            color: #FFF;
            background-color: #337AB7;
            border: 1px solid #2E6DA4;
            border-radius: 3px;
            display: inline;
            width: auto;
            padding: 5px;
        }

        :focus {
            border-color: #66AFE9;
            outline: 0px none;
            box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.075) inset, 0px 0px 8px rgba(102, 175, 233, 0.6);
        }
        input {
            font-size: 14px;
            margin: 5px;
            line-height: 1.42857;
            color: #555;
            display: block;
            width: 95%;
            background: #FFF none;
            padding: 5px;
            border: 1px solid #CCC;
            border-radius: 4px;
            box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.075) inset;
            transition: border-color 0.15s ease-in-out 0s, box-shadow 0.15s ease-in-out 0s;
        }
        input.button:hover {
            box-shadow: 0px 1px 3px rgba(50, 50, 50, 0.75);
            background-color: #286090;
            border-color: #204D74;
            border-radius: 3px;
            color: white;

        }

        #logo_img {
            position: absolute;
            height: 15px;
            width: 50px;
            left: 50%;
            margin-left: -50px;
            overflow: visible;

        }
    </style>
</head>

<body>
<div id="logo_img">
    <img style="height: 100px" class="logo"
         src="data:image/png;base64,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"
         alt="cclouds_users.png"/>
</div>
<div id='centerbox'>
    <div id='heading'>

        <p>
            Iniciar sesión
        </p></div>

    <div id="login">

        <form action='login' method='post'><input type='hidden' name='action' value='login'>

            <p><input type='text' name='username' placeholder="username"></p>

            <p><input type='password' name='password' placeholder="password">

            <p/>
            <input type='submit' class='button' value='Log in'>
            <c:if test="${param.error != null}">        
		<p style="color: #C9302C; text-align: center">
			Credenciales no válidas. Intente otra vez.
		</p>
	</c:if>
        </form>
        
    </div>
</div>
    
</body>
</html>