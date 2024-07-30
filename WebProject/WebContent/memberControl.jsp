<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*, java.util.*, dao.*, dto.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberControl</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #fff;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.container {
    width: 300px;
    border: 1px solid #ccc;
    padding: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    text-align: center;
}

header {
    margin-bottom: 20px;
}

h1 {
    font-size: 1.5em;
    margin: 0;
}

form {
    display: flex;
    flex-direction: column;
    align-items: center;
}

.input-group {
    margin-bottom: 10px;
    width: 100%;
    display: flex;
    justify-content: space-between;
}

.input-group label {
    width: 30%;
    text-align: left;
}

.input-group input {
    width: 65%;
    padding: 5px;
    border: 1px solid #ccc;
    border-radius: 3px;
}

.button-group {
    margin-top: 10px;
    width: 100%;
}

.button-group button {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    background-color: #f0f0f0;
    cursor: pointer;
    border-radius: 3px;
}


</style>
</head>
<body>
<%
    // 요청에서 id 값을 가져옵니다.
    String id = request.getParameter("id");
    MemberDTO member = null;

    // id가 존재하면 DAO에서 해당 회원 정보를 가져옵니다.
    if (id != null && !id.isEmpty()) {
        MemberDAO mDAO = new MemberDAO();
        try {
            member = mDAO.getInfo(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
  <div class="container">
        <header>
            <h1>회원관리 - 수정관리자</h1>
        </header>
		<main>
			<form action="updateMember" method="post">
				<div class="input-group">
					<label for="id">ID</label> <input type="text" id="id" name="id"
						value="<%= (member != null) ? member.getId() : "" %>" readonly>
				</div>
				<div class="input-group">
					<label for="pw">PW</label> <input type="text" id="pw" name="pw"
						value="<%= (member != null) ? member.getPw() : "" %>">
				</div>
				<div class="input-group">
					<label for="name">Name</label> <input type="text" id="name"
						name="name"
						value="<%= (member != null) ? member.getName() : "" %>">
				</div>
				<div class="input-group">
					<label for="point">Point</label> <input type="text" id="point"
						name="point"
						value="<%= (member != null) ? member.getPoint() : "" %>">
				</div>
				<input type="submit" value="Update">
			</form>
		</main>
	</div>
</body>
</html>