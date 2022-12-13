<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head><meta charset="utf-8">
<style type="text/css">
	.button_selec{
    	display: inline-block;
    	margin: auto;
   	 	padding: 1% 15%;
    	color: #fff;
   	 	text-decoration: none;
   	 	font-size:1vw;
	}
	td:hover{
		box-sizing: border-box;
    	background-color: orange;
    	color: #BF6000;
	}

	div#wapper{width:100%;
		min-height: 300px;
		text-align: left;
		margin: 0 auto;}
	section, aside {float: left; height:57vw;}
	section {background-color: orange; width:90%;}
	aside {background-color: #FF8000; width:10%;  align-items:center;}
		#narrow{
		position:absolute; 
		visibility:visible;
		background: #FF8000;
		mix-blend-mode: normal;
		opacity: 0.5;
		visibility:hidden;
	}
	table{
	width:100%;
	height:100%;
	text-align:center;
	}
</style>
<script language="JavaScript">
function layer1() {//신공
	var el = document.getElementById('narrow');
	el.style.left = 45.5 + "%";
	el.style.top = 8+ "vw";
	el.style.width =9 + "%";
	el.style.height= 7 + "vw";
	el.style.visibility= "visible";
	el.style.transform= "rotate(0deg)";
}
function layer2() {//과학
	var el = document.getElementById('narrow');
	el.style.left = 35 + "%";
	el.style.top = 15+ "vw";
	el.style.width =6.5 + "%";
	el.style.height= 5 + "vw";
	el.style.visibility= "visible";
	el.style.transform= "rotate(-18deg)";
}
function layer3() {//명진
	var el = document.getElementById('narrow');
	el.style.left = 37 + "%";
	el.style.top = 18.5+ "vw";
	el.style.width =9 + "%";
	el.style.height= 5 + "vw";
	el.style.visibility= "visible";
	el.style.transform= "rotate(-18deg)";
}
function layer4() {//법학/만해
	var el = document.getElementById('narrow');
	el.style.left = 34 + "%";
	el.style.top = 26+ "vw";
	el.style.width =10.5 + "%";
	el.style.height= 7 + "vw";
	el.style.visibility= "visible";
	el.style.transform= "rotate(32deg)";
}
function layer5() {//본관
	var el = document.getElementById('narrow');
	el.style.left = 47 + "%";
	el.style.top = 18+ "vw";
	el.style.width =9 + "%";
	el.style.height= 5.5 + "vw";
	el.style.visibility= "visible";
	el.style.transform= "rotate(36deg)";
}
function layer6() {//사회과학
	var el = document.getElementById('narrow');
	el.style.left = 16 + "%";
	el.style.top = 33+ "vw";
	el.style.width =11.7 + "%";
	el.style.height= 7 + "vw";
	el.style.visibility= "visible";
	el.style.transform= "rotate(45deg)";
}
function layer7() {//원흥관
	var el = document.getElementById('narrow');
	el.style.left = 53 + "%";
	el.style.top = 15+ "vw";
	el.style.width =9 + "%";
	el.style.height= 6 + "vw";
	el.style.visibility= "visible";
	el.style.transform= "rotate(30deg)";
}
function layer8() {//정보P
	var el = document.getElementById('narrow');
	el.style.left = 60 + "%";
	el.style.top = 17+ "vw";
	el.style.width =8 + "%";
	el.style.height= 4.5+ "vw";
	el.style.visibility= "visible";
	el.style.transform= "rotate(25deg)";
}
function layer9() {//정보P
	var el = document.getElementById('narrow');
	el.style.left = 66 + "%";
	el.style.top = 16+ "vw";
	el.style.width =5 + "%";
	el.style.height= 3+ "vw";
	el.style.visibility= "visible";
	el.style.transform= "rotate(25deg)";
}
function layer10() {//정보P
	var el = document.getElementById('narrow');
	el.style.left = 65 + "%";
	el.style.top = 33.5+ "vw";
	el.style.width =9.8 + "%";
	el.style.height= 5+ "vw";
	el.style.visibility= "visible";
	el.style.transform= "rotate(-32deg)";
}
function layer11() {//학술/문화
	var el = document.getElementById('narrow');
	el.style.left = 17 + "%";
	el.style.top = 40.5+ "vw";
	el.style.width =11 + "%";
	el.style.height= 5 + "vw";
	el.style.visibility= "visible";
	el.style.transform= "rotate(50deg)";
}
function layer12() {//혜화
	var el = document.getElementById('narrow');
	el.style.left = 24.5 + "%";
	el.style.top = 29+ "vw";
	el.style.width =11 + "%";
	el.style.height= 7.5+ "vw";
	el.style.visibility= "visible";
	el.style.transform= "rotate(50deg)";
}
function go(building){
	if(confirm(building+" 건물의 강의실을 예약하시겠어요?")){
		location.href='selectbuilding.jsp?building='+building;
	}
}
</script>
<title>예약할 강의실을 선택하세요</title>
</head><body>
<div id="wapper">
<div id="narrow"></div>

<section>
<img width="100%" src="map.png" alt="동국대 지도">
</section>
<aside>
<table border="0">
<tr><td onMouseOver="layer1()"><div class="button_selec" onclick="go('신공학관')" >신공학관<br>(기숙사)</div>
</td></tr><tr><td onMouseOver="layer2()" onclick="go('과학관')" ><div class="button_selec">과학관</div></td>
</tr><tr>
<td onMouseOver="layer3()" onclick="go('명진관')"><div class="button_selec" >명진관</div></td></tr><tr>
<td onMouseOver="layer4()" onclick="go('법학_만해관')">
<div class="button_selec" >법학/만해관</div></td></tr><tr>
<td onMouseOver="layer5()"onclick="go('본관')">
<div class="button_selec" >본관</div></td></tr><tr><td onMouseOver="layer6()" onclick="go('사회과학_경영관')">
<div class="button_selec" >사회과학/<br>경영관</div></td></tr><tr><td onMouseOver="layer7()" onclick="go('원흥관')"> 
<div class="button_selec" >원흥관</div></td></tr><tr><td  onMouseOver="layer8()" onclick="go('정보문화관 P')">
<div class="button_selec">정보문화관 P</div></td></tr><tr><td onMouseOver="layer9()" onclick="go('정보문화관 Q')">
<div class="button_selec" >정보문화관 Q</div></td></tr><tr><td onMouseOver="layer10()" onclick="go('학림관')">
<div class="button_selec">학림관</div></td></tr><tr><td onMouseOver="layer11()" onclick="go('학술_문화관')"> 
<div class="button_selec" >학술/문화관</div></td></tr><tr><td onMouseOver="layer12()" onclick="go('혜화관')">
<div class="button_selec">혜화관</div></td></tr>
</table>
</aside>
</div>
</body>
</html>