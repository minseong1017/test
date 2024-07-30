<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List" %>
<%@ page import="dto.MemberDTO" %>
<%@ page import="dao.MemberDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
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
    width: 80%;
    max-width: 1200px;
    min-width: 800px;
    border: 1px solid #ccc;
    padding: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-bottom: 1px solid #ccc;
    padding-bottom: 10px;
}

h1 {
    font-size: 2em;
    margin: 0;
}

.login-btn {
    padding: 5px 10px;
    border: 1px solid #ccc;
    background-color: #f0f0f0;
    cursor: pointer;
}

main {
    margin-top: 20px;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

th, td {
    border: 1px solid #ccc;
    padding: 10px;
    text-align: center;
}

button {
    padding: 5px 10px;
    border: 1px solid #ccc;
    background-color: #f0f0f0;
    cursor: pointer;
}

.scheduler-buttons {
    display: flex;
    justify-content: center;
}

.scheduler-buttons button {
    margin: 5px;
    padding: 10px 20px;
    border: 1px solid #ccc;
    background-color: #f0f0f0;
    cursor: pointer;
}
	
</style>
<script>
	document.addEventListener('DOMContentLoaded', ()=>{
		const login = document.querySelector('.login-btn');
		login.addEventListener('click', ()=>{
			window.location.href = "Login";
		})
	})
	function deleteMember(id) {
        if (confirm('정말로 삭제하시겠습니까?')) {
            window.location.href = 'deleteMember?id=' + id;
        }
    }
	function editMember(id) {
       window.location.href = 'editMember?id=' + id;
    }
</script>
</head>
<body>
	 <div class="container">
        <header>
            <h1>회원관리</h1>
            <button class="login-btn">로그인</button>
        </header>
        <main>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>PW</th>
                        <th>Name</th>
                        <th>Point</th>
                        <th>수정</th>
                        <th>삭제</th>
                    </tr>
                </thead>
                <tbody>
					<%
					MemberDAO mDAO = new MemberDAO();
					List<MemberDTO> memberList = mDAO.memberAll();
					if (memberList != null) {
						for (MemberDTO member : memberList) {
					%>
					<tr>
						<td><%=member.getId()%></td>
						<td><%=member.getPw()%></td>
						<td><%=member.getName()%></td>
						<td><%=member.getPoint()%></td>
						<td><button onclick="editMember('<%= member.getId() %>')">수정</button></td>
						<td><button onclick="deleteMember('<%= member.getId() %>')">삭제</button></td>
					</tr>
					<%
						}
					}
					%>
				</tbody>
            </table>
            <h2>스케줄러관리</h2>
            <div class="scheduler-buttons">
                <button>스케줄러(20초마다 포인트 1 증가) 실행 시작</button>
                <button>스케줄러 실행 종료</button>
            </div>
        </main>
    </div>
</body>
</html>