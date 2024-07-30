<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<style>
	body {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
    font-family: Arial, sans-serif;
    background-color: #fff;
}

.login-container {
    text-align: center;
}

h1 {
    font-size: 2.5em;
    margin-bottom: 20px;
    text-align:left;
}

.input-group {
    margin-bottom: 10px;
}

.input-group label {
    display: inline-block;
    width: 50px;
    text-align: right;
}

.input-group input {
    width: 200px;
    padding: 5px;
    border: 1px solid #ccc;
    border-radius: 3px;
}

.button-group {
    margin-top: 10px;
}

.login-btn, .signup-btn {
    width: 260px;
    padding: 10px;
    margin-bottom: 5px;
    border: 1px solid #ccc;
    border-radius: 3px;
    background-color: #f9f9f9;
    font-size: 1em;
    cursor: pointer;
}

.login-btn:hover, .signup-btn:hover {
    background-color: #e0e0e0;
}

</style>
<script>
	document.addEventListener('DOMContentLoaded', ()=>{
		document.getElementById("registButton").addEventListener("click", function() {
		    window.location.href = "Regist";
		});
	})
	
	window.onload = function() {
            <% if (request.getAttribute("loginFailed") != null) { %>
                alert("로그인에 실패했습니다. 다시 시도해주세요.");
            <% } %>
        };
</script>
</head>
<body>
 	 <div class="login-container">
        <h1>로그인</h1>
        <form action="LoginTry" method="POST">
            <div class="input-group">
                <label for="id">ID :</label>
                <input type="text" id="id" name="id">
            </div>
            <div class="input-group">
                <label for="pw">PW :</label>
                <input type="password" id="pw" name="pw">
            </div>
            <div class="button-group">
                <button type="submit" class="login-btn">로그인</button><br/>
                <button id="registButton" type="button" class="signup-btn">회원가입</button>
            </div>
        </form>
    </div>
</body>
</html>