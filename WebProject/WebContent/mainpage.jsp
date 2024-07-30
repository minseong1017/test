<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {
    font-family: Arial, sans-serif;
    background-color: #fff;
    margin: 0;
    padding: 0;
    display: flex;
    flex-direction: column;
    align-items: center;
}

header {
    width: 100%;
    padding: 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-bottom: 1px solid #ccc;
}

h1 {
    font-size: 2em;
    margin: 0;
}

.user-info {
    display: flex;
    align-items: center;
}

.user-info span {
    margin-right: 10px;
}

.user-info button {
    padding: 5px 10px;
    border: 1px solid #ccc;
    background-color: #f0f0f0;
    cursor: pointer;
}

main {
    width: 100%;
    max-width: 1200px;
    text-align: center;
    position: relative;
}

h2 {
    margin-top: 20px;
}

.courses {
    display: flex;
    justify-content: space-between;
    margin: 20px 0;
}

.course-card {
    width: 30%;
    border: 1px solid #ccc;
    border-radius: 5px;
    padding: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    text-align: left;
}

.course-image {
    height: 400px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: bold;
    color: white;
}

h3 {
    margin: 10px 0;
}

.rating {
    color: #f39c12;
}

.level {
    color: #7f8c8d;
}

.estimated-time {
    font-weight: bold;
}

.price {
    margin-top: 10px;
    font-weight: bold;
    text-align: center;
}

.ad {
    position: absolute;
    right: 20px;
    font-weight: bold;
    border: 1px solid #ccc;
    border-radius: 5px;
}

.ad p {
	text-align:left;
    margin: 0;
}

.ad-image {
    height: 100px;
    width: 250px;
    margin-top: 5px;
    display: flex;
    align-items: center;
    justify-content: center;
   
    background-image: url("<%= request.getContextPath() %>/img/korea_it.png");
    background-size: cover; /* 이미지가 div를 완전히 덮도록 설정 */
    background-position: center; /* 이미지를 중앙에 위치 */
    background-repeat: no-repeat; 
}

#first{
	background-image: url("<%= request.getContextPath() %>/img/Intro_350_408.png");
	background-size: cover; /* 이미지가 div를 완전히 덮도록 설정 */
    background-position: center; /* 이미지를 중앙에 위치 */
}	
#second{
	background-image: url("<%= request.getContextPath() %>/img/Java_350_408.png");
	background-size: cover; /* 이미지가 div를 완전히 덮도록 설정 */
    background-position: center; /* 이미지를 중앙에 위치 */
}	
#third{
	background-image: url("<%= request.getContextPath() %>/img/Cpp_350_408.png");
	background-size: cover; /* 이미지가 div를 완전히 덮도록 설정 */
    background-position: center; /* 이미지를 중앙에 위치 */
}	
</style>
<script>
document.addEventListener('DOMContentLoaded', () => {
    const logout = document.querySelector('#logout');
    logout.addEventListener('click', () => {
    	alert('로그아웃 되었습니다.');
        window.location.href = "Logout";
    });
    
    const first = document.querySelector('#first');
    first.addEventListener('click', () => {
    	window.location.href = "FirstClick";
    });
    
    const second = document.querySelector('#second');
    second.addEventListener('click', () => {
    	window.location.href = "SecondClick";
    });
    
    const third = document.querySelector('#third');
    third.addEventListener('click', () => {
    	window.location.href = "ThirdClick";
    });
    
    const ad = document.querySelector('.ad');
    ad.addEventListener('click', ()=>{
    	window.location.href = "WatchAd";
    });
});
window.onload = function() {
     <% if (request.getAttribute("buyComplete") != null) { %>
            var buyComplete = "<%= request.getAttribute("buyComplete") %>";
            alert("컨텐츠("+buyComplete + ")를 구입하였습니다");
       <% } %>
       <% if (request.getAttribute("buyFailed") != null) { %>
       alert("포인트가 부족합니다. 광고를 클릭하세요");
   <% } %>
   <% if (request.getAttribute("watchAd") != null) { %>
   var ad = "<%= request.getAttribute("watchAd") %>";
   alert(ad + "점이 적립되었습니다.");
   window.location.href = 'https://www.koreaisacademy.com';
<% } %>
};


</script>
         
</head>
<body>
 <%
    String userName = (String) session.getAttribute("userName");
    String userId = (String) session.getAttribute("userId");
    Integer userPoint = (Integer) session.getAttribute("userPoint");
%>
<header>
        <h1>메인페이지</h1>
        <div class="user-info">
 
<span><%= userName %>(<%= userId %>)님 안녕하세요.</span>
<span>포인트 : <%= userPoint %>점</span>
            <button id="logout">로그아웃</button>
        </div>
    </header>
    <main>
        <h2>구입할 컨텐츠를 선택하세요.</h2>
        <div class="courses">
            <div class="course-card">
                <div id = "first" class="course-image">
                </div>
                
            </div>
            <div class="course-card">
                <div id = "second" class="course-image"></div>
            </div>
            <div class="course-card">
                <div id="third" class="course-image" style="background-color: #ffa500;"></div>
            </div>
        </div>
        <div class="ad">
            <p><광고></p>
            <div class="ad-image"></div>
        </div>
    </main>
</body>
</html>