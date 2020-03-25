<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
<title>Test Page</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script type="text/javascript">
function doChange(srcE, targetId){
    var val = srcE.options[srcE.selectedIndex].value;
    var targetE = document.getElementById(targetId);
    //alert(val);
    removeAll(targetE);

    if(val == 'seoul'){
        addOption('개화산', targetE);
        addOption('관악산', targetE);
        addOption('수락산', targetE);
        addOption('천장산', targetE);
        addOption('홍릉수목원임내', targetE);
        addOption('구룡산', targetE);
        addOption('봉산', targetE);
        addOption('용마산', targetE);
    }
    else if(val == 'pusan'){
        addOption('양달산', targetE);
        addOption('백양산', targetE);
    }    else if(val == 'daejeon'){
        addOption('계족산', targetE);
        addOption('보문산', targetE);
    }    else if(val == 'ulsan'){
        addOption('백운산', targetE);
    }    else if(val == 'gyeonggi'){
        addOption('서리산', targetE);
        addOption('청우산', targetE);
        addOption('용암산', targetE);
        addOption('칠보산', targetE);
        addOption('어비산', targetE);
        addOption('소리산', targetE);
        addOption('운악산', targetE);
    }    else if(val == 'gangwon'){
        addOption('피래산', targetE);
        addOption('제왕산', targetE);
        addOption('전후재', targetE);
       addOption('고루포기산', targetE);
        addOption('만덕봉', targetE);
        addOption('검봉산', targetE);
        addOption('뇌암산', targetE);
        addOption('사금산', targetE);
        addOption('소공령', targetE);
        addOption('건봉산', targetE);
        addOption('곰봉', targetE);
       addOption('두위봉', targetE);
        addOption('망경대산', targetE);
        addOption('가칠봉', targetE);
        addOption('대암산', targetE);
        addOption('원대봉', targetE);
        addOption('한석산', targetE);
        addOption('백석봉', targetE);
       addOption('가리왕산', targetE);
        addOption('금병산', targetE);
        addOption('덕항산', targetE);
        addOption('함백산', targetE);
        addOption('백석산', targetE);
        addOption('오음산', targetE);
        addOption('응봉산', targetE);
        addOption('두류산', targetE);
        addOption('매봉산', targetE);
        addOption('응봉산', targetE);
        addOption('어답산', targetE);
        
    }    else if(val == 'chungnam'){
        addOption('무성산', targetE);
        addOption('장군산', targetE);
        addOption('국사봉', targetE);
        addOption('백암산', targetE);
        addOption('오서산', targetE);
        addOption('성주산', targetE);
        addOption('광덕산', targetE);
        addOption('국사봉', targetE);
        addOption('비봉산', targetE);
        
    }    else if(val == 'chungbuk'){
    	addOption('박달산', targetE);
    	addOption('금단산', targetE);
    	addOption('삼태산', targetE);
    	addOption('금적산', targetE);
    	addOption('삼봉산', targetE);
    	addOption('천등산', targetE);
    	addOption('원통산', targetE);
    	
    }    else if(val == 'jeonnam'){
    	addOption('두방산', targetE);
    	addOption('곤방산', targetE);
    	addOption('백운봉', targetE);
    	addOption('솔봉', targetE);
    	addOption('고비산', targetE);
    	addOption('방장산', targetE);
    	addOption('봉화산', targetE);
    	addOption('천봉산', targetE);
    	addOption('제암산', targetE);
    	addOption('초암산', targetE);
    	addOption('고동산', targetE);
    	addOption('제석산', targetE);
    	addOption('봉두산', targetE);
    	addOption('봉황산', targetE);
    	addOption('구수산', targetE);
    	addOption('백운산', targetE);
    	addOption('병풍산', targetE);
    	addOption('가지산', targetE);
    	addOption('여귀산', targetE);
    	addOption('고산봉', targetE);
    	addOption('달마산', targetE);
    	addOption('모후산', targetE);
    	addOption('용암산', targetE);
    }   
    
    else if(val == 'jeonbuk'){
    	addOption('방장산', targetE);
    	addOption('봉화산', targetE);
    	addOption('덕유산', targetE);
    	addOption('민주지산', targetE);
    	addOption('조항산', targetE);
    	addOption('여분산', targetE);
    	addOption('장안산', targetE);
    	addOption('덕태산', targetE);
    	addOption('운장산', targetE);
    	addOption('내동산', targetE);
    	addOption('성수산', targetE);
    	addOption('국사봉', targetE);
    }   
    
    else if(val == 'gyeongnam'){
    	addOption('노자산', targetE);
    	addOption('기백산', targetE);
    	addOption('단지봉', targetE);
    	addOption('월봉산', targetE);
    	addOption('철마산', targetE);
    	addOption('금원산', targetE);
    	addOption('평지산', targetE);
    	addOption('둔철산', targetE);
    	addOption('천성산', targetE);
    	addOption('대운산', targetE);
    	addOption('한우산', targetE);
    	addOption('도덕산', targetE);
    	addOption('형제봉', targetE);
    	addOption('대봉산', targetE);
    	addOption('법화산', targetE);
    }   
    
    else if(val == 'gyeongbuk'){
    	addOption('삼성산', targetE);
    	addOption('비봉산', targetE);
    	addOption('매봉산', targetE);
    	addOption('백화산', targetE);
    	addOption('장군봉', targetE);
    	addOption('문수산', targetE);
    	addOption('청옥산', targetE);
    	addOption('미림산', targetE);
    	addOption('조산봉', targetE);
    	addOption('기양산', targetE);
    	addOption('바데산', targetE);
    	addOption('등운산', targetE);
    	addOption('검마산', targetE);
    	addOption('금장산', targetE);
    	addOption('진조산', targetE);
    	addOption('조항산', targetE);
    	addOption('내연산', targetE);
    }   
    
    else if(val == 'jeju'){
        addOption('노로오름', targetE);
        addOption('사려니숲', targetE);
    }
    
}

function addOption(value, e){
    var o = new Option(value);
    try{
        e.add(o);
    }catch(ee){
        e.add(o, null);
    }
}

function removeAll(e){
    for(var i = 0, limit = e.options.length; i < limit - 1; ++i){
        e.remove(1);
    }
}
</script>
</head>
<body>
<form action="test33">
    <select name="selOne" id="selOne" onchange="doChange(this, 'selTwo')">
        <option value="default">---시/도 선택---</option>
        <option value="seoul">서울특별시</option>
        <option value="pusan">부산광역시</option>
        <option value="daejeon">대전광역시</option>
        <option value="ulsan">울산광역시</option>
        <option value="gyeonggi">경기도</option>
        <option value="gangwon">강원도</option>
        <option value="chungnam">충청남도</option>
        <option value="chungbuk">충청북도</option>
        <option value="jeonnam">전라남도</option>
        <option value="jeonbuk">전라북도</option>
        <option value="gyeongnam">경상남도</option>
        <option value="gyeongbuk">경상북도</option>
        <option value="jeju">제주도</option>
    </select>
    <select name="selTwo" id="selTwo" onchange="this.form.submit()">
        <option value="default">---산 선택---</option>
    </select>
</form>
</body>
</html>