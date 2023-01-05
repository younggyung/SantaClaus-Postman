<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<style>
*{
    padding: 0;
    margin: 0;
}
body{
    font-size: 14px;
    font-family: 'Roboto', sans-serif;
    width: 2000px;
    
}
button{
    border: none;
}
.menuBar{
  position : relative;
  display : inline-block;
}
.menuBtn{
  border : 1px solid rgb(37, 37, 37);
  border-radius : 4px;
  background-color: #f5f5f5;
  font-weight: 400;
  color : rgb(37, 37, 37);
  padding : 12px;
  width :200px;
  text-align: left;
  cursor : pointer;
  font-size : 12px;
}
.submenu{
  display : none;
  position : absolute;
  z-index : 1; /*다른 요소들보다 앞에 배치*/
  font-weight: 400;
  background-color: #f9f9f9;
  min-width : 200px;
}

.submenu a{
  display : block;
  text-decoration : none;
  color : rgb(37, 37, 37);
  font-size: 12px;
  padding : 12px 20px;
}

.submenu a:hover{
  background-color : #ececec
}

.menuBar:hover .submenu {
  display: block;
}
</style>
</head>
<body>
    <div class="header">   
        <div class="menuBar">
            <button class="menuBtn"> 
                <span class="menu_icon"></span>
                메뉴
            </button>
            <div class="submenu">
                <a href="#">About</a>
                <a href="#">엽서 목록</a>
                <a href="#">트리 꾸미기</a>
                <a href="#">연하장 전송</a>
                <a href="#">리뷰 게시판</a>
            </div>
            <img class="logo">
            <div class="nav">
                <a>HOME</a>
                <a>로그인</a>
                <a>장바구니</a>
                <a>마이페이지</a>
            </div>
        </div>
    </div>
    <div class="slider">
        <div>
            <img>
        </div>
        <div>
            <img>
        </div>
        <div>
            <img>
        </div>
    </div>
    <div class="letterTplPage">
        <button onclick="">엽서 목록 페이지</button>
    </div>
	<div class="footer">
	
	</div>
</body>
</html>