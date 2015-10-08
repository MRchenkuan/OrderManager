//查询顾客是否存在
	function checkcustomer(phone){
			var url="./checkcustomer/?phone="+phone;
			var xmlhttp;
			if (window.XMLHttpRequest){
				// code for IE7+, Firefox, Chrome, Opera, Safari
				xmlhttp=new XMLHttpRequest();
			}else{
				// code for IE6, IE5
				xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			}
			
			xmlhttp.onreadystatechange=function(){
				if (xmlhttp.readyState==4 && xmlhttp.status==200){
					if(xmlhttp.responseText!='201'){
						alert(xmlhttp.responseText);
					}
				}
			}
			xmlhttp.open("GET",url,true);
			xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xmlhttp.send(url);
			
	}

function addtr(x){ 
	var node = x.parentNode.parentNode;
	node.parentNode.appendChild(node.cloneNode(true)); 
} 

function deltr(x){
	if(!confirm("是否删除词条商品？"))return false;
	var Node =  x.parentNode.parentNode;
	var lineCount=document.getElementsByName('ItemDetailSign').length;
	if (lineCount <= 1)
		{
			document.getElementsByName("itemname")[0].value='';
			document.getElementsByName("itemprice")[0].value='';
			document.getElementsByName("number")[0].value='';
			alert("已经是最后一行了啊！");
		}else{
			Node.parentNode.removeChild(Node);
		}
}

//删除图片上传行
function delImgTr(x){
	if(!confirm("是否删除词条商品？"))return false;
	var Node =  x.parentNode.parentNode;
	var lineCount=document.getElementsByName('imgFile').length;
	if (lineCount <= 1)
		{
			alert("已经是最后一行了啊！");
		}else{
			Node.parentNode.removeChild(Node);
		}
}

//价格计算公式
function checkPrice(){
	sum=document.getElementById('sum').value;
	if(sum)
	{
		paid=document.getElementById('paid').value;
		if(paid){
			document.getElementById('debt').value=sum-paid;
		}else{
		}
	}else{
		}
}

//数字文本框的实现方法
function replaceNotNumber(num){
	var pattern = /[^0-9]/g;
	if(pattern.test(num.value)){
		num.value = num.value.replace(pattern,"");
	}
}
//文本框字符串长度限制 this 限制数
function lengthLimite(str,limite){
	if(str.value.length > limite){
		str.value = str.value.substring(0,limite);
		return false
	}else{
		return true
	}
}
//非空验证方法
function isNull(str){
   if(str==null||str.length==0) {
	   return true;
   }else {
	   return false;
   }
}


	

function check(form){
	//二维列表验证方法 - 商品名
	if(document.getElementsByName('itemname').length>1){
		for(var i=0;i<document.getElementsByName('itemname').length;i++){
			if(isNull(form.itemname[i].value)){
				alert('第'+(i+1)+'条商品的商品名没填');
				return false;
			}
		}
	}else if(isNull(form.itemname.value)) {
		alert("商品名没填");
		return  false;
	}
	
	//二维列表验证方法 - 商品价格
	if(document.getElementsByName('itemprice').length>1){
		for(var i=0;i<document.getElementsByName('itemprice').length;i++){
			if(isNull(form.itemprice[i].value)){
				alert('第'+(i+1)+'条商品的商品价格没填');
				return false;
			}
		}
	}else if(isNull(form.itemprice.value)) {
		alert("商品价格没填");
		return  false;
	}
	
	//二维列表验证方法 - 商品类型
	if(document.getElementsByName('itemtype').length>1){
		for(var i=0;i<document.getElementsByName('itemtype').length;i++){
			if(isNull(form.itemtype[i].value)){
				alert('第'+(i+1)+'条商品的商品价格没填');
				return false;
			}
		}
	}else if(isNull(form.itemtype.value)) {
		alert("商品价格没填");
		return  false;
	}

	
	if(isNull(form.cust_name.value)) {
		alert("请填写姓名");
		return  false;
	}
	
	if(isNull(form.address.value)) {
		alert("地址没有填写");
		return  false;
	}

	if(isNull(form.bookdate.value)) {
		alert("订货日期没有选择");
		return  false;
	}
	if(isNull(form.deliverydate.value)) {
		alert("交货日期没有选择");
		return  false;
	}
	if(isNull(form.sum.value)) {
		alert("总价没填");
		return  false;
	}
	if(isNull(form.paid.value)) {
		alert("定金没填");
		return  false;
	}
	if(isNull(form.debt.value)) {
		alert("余款没填");
		return  false;
	}

	return true;
} 
 
function submitForm(){
	var mf=document.getElementById("record");
	if(check(mf))
	{
		return true;
	} else {
		return false;
	}
}


 