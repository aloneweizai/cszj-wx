/**
 * Created by zhushuai 2017-08-25
 */
;!function(window, $){
	
	var BASE64_MAPPING = [
  		'A','B','C','D','E','F','G','H',
  		'I','J','K','L','M','N','O','P',
  		'Q','R','S','T','U','V','W','X',
  		'Y','Z','a','b','c','d','e','f',
  		'g','h','i','j','k','l','m','n',
  		'o','p','q','r','s','t','u','v',
  		'w','x','y','z','0','1','2','3',
  		'4','5','6','7','8','9','+','/'
  	];

  	/**
  	 *ascii convert to binary
  	 */
  	var _toBinary = function(ascii){
  		var binary = new Array();
  		while(ascii > 0){
  			var b = ascii%2;
  			ascii = Math.floor(ascii/2);
  			binary.push(b);
  		}
  		binary.reverse();
  		return binary;
  	};

  	/**
  	 *binary convert to decimal
  	 */
  	var _toDecimal  = function(binary){
  		var dec = 0;
  		var p = 0;
  		for(var i = binary.length-1 ; i >= 0 ; --i){
  			var b = binary[i];
  			if(b == 1){
  				dec += Math.pow(2 , p);
  			}
  			++p;
  		}
  		return dec;
  	};

  	/**
  	 *unicode convert to utf-8
  	 */
  	var _toUTF8Binary = function(c , binaryArray){
  		var mustLen = (8-(c+1)) + ((c-1)*6);
  		var fatLen = binaryArray.length;
  		var diff = mustLen - fatLen;
  		while(--diff >= 0){
  			binaryArray.unshift(0);
  		}
  		var binary = [];
  		var _c = c;
  		while(--_c >= 0){
  			binary.push(1);
  		}
  		binary.push(0);
  		var i = 0 , len = 8 - (c+1);
  		for(; i < len ; ++i){
  			binary.push(binaryArray[i]);
  		}

  		for(var j = 0 ; j < c-1 ; ++j){
  			binary.push(1);
  			binary.push(0);
  			var sum = 6;
  			while(--sum >= 0){
  				binary.push(binaryArray[i++]);
  			}
  		}
  		return binary;
  	};	

    function getMonth(date){  
  	    var month = "";  
  	    month = date.getMonth() + 1; //getMonth()得到的月份是0-11  
  	    if(month<10){  
  	        month = "0" + month;  
  	    }  
  	    return month;  
  	};  
  	function getDay(date){  
  	    var day = "";  
  	    day = date.getDate();  
  	    if(day<10){  
  	        day = "0" + day;  
  	    }  
  	    return day;  
  	};

  	function getHours(date){
  	  var hours = "";
  	  hours = date.getHours();
  	  if(hours<10){ 
  	    hours = "0" + hours; 
  	  } 
  	  return hours; 
  	}

  	function getMinutes(date){
  	  var minute = "";
  	  minute = date.getMinutes();
  	  if(minute<10){ 
  	    minute = "0" + minute; 
  	  } 
  	  return minute; 
  	}

  	function getSeconds(date){
  	  var second = "";
  	  second = date.getSeconds();
  	  if(second<10){ 
  	    second = "0" + second; 
  	  } 
  	  return second; 
  	}

	
   window.util={
	   dateFormat:function(longTypeDate){  
			var dateType = "";  
			var date = new Date();  
			date.setTime(longTypeDate); 
			dateType = date.getFullYear()+"-"+getMonth(date)+"-"+getDay(date);//yyyy-MM-dd格式日期
			return dateType;
	   }, 
	   dateTimeFormat:function(longTypeDate){
		   var date = new Date();  
		   date.setTime(longTypeDate);
		   return (date.getFullYear()+"-"+getMonth(date)+"-"+getDay(date)+" "+getHours(date)+":"+getMinutes(date)+":"+getSeconds(date));
	   },
	   chargeErrmsg:function(data,callback){
		 
		   var needLoginCode=['4194','4195'];
		   if(needLoginCode.indexOf(data.code)!=-1){
			   $.toptip("当前登陆用户已过期，请重新登陆", 'error');
			   setTimeout(function(){util.clearSDB();window.location.href=ctx+'/login.html';},1500)
		   }else{
			   $.toptip(data.message,'error');
			   if (typeof callback === "function"){callback(data);}
		   }
	   },
	   base64EN:function(str){
		    var base64_Index = [];
			var binaryArray = [];
			for(var i = 0 , len = str.length ; i < len ; ++i){
				var unicode = str.charCodeAt(i);
				var _tmpBinary = _toBinary(unicode);
				if(unicode < 0x80){
					var _tmpdiff = 8 - _tmpBinary.length;
					while(--_tmpdiff >= 0){
						_tmpBinary.unshift(0);
					}
					binaryArray = binaryArray.concat(_tmpBinary);
				}else if(unicode >= 0x80 && unicode <= 0x7FF){
					binaryArray = binaryArray.concat(_toUTF8Binary(2 , _tmpBinary));
				}else if(unicode >= 0x800 && unicode <= 0xFFFF){//UTF-8 3byte
					binaryArray = binaryArray.concat(_toUTF8Binary(3 , _tmpBinary));
				}else if(unicode >= 0x10000 && unicode <= 0x1FFFFF){//UTF-8 4byte
					binaryArray = binaryArray.concat(_toUTF8Binary(4 , _tmpBinary));	
				}else if(unicode >= 0x200000 && unicode <= 0x3FFFFFF){//UTF-8 5byte
					binaryArray = binaryArray.concat(_toUTF8Binary(5 , _tmpBinary));
				}else if(unicode >= 4000000 && unicode <= 0x7FFFFFFF){//UTF-8 6byte
					binaryArray = binaryArray.concat(_toUTF8Binary(6 , _tmpBinary));
				}
			}

			var extra_Zero_Count = 0;
			for(var i = 0 , len = binaryArray.length ; i < len ; i+=6){
				var diff = (i+6)-len;
				if(diff == 2){
					extra_Zero_Count = 2;
				}else if(diff == 4){
					extra_Zero_Count = 4;
				}
				//if(extra_Zero_Count > 0){
				//	len += extra_Zero_Count+1;
				//}
				var _tmpExtra_Zero_Count = extra_Zero_Count;
				while(--_tmpExtra_Zero_Count >= 0){
					binaryArray.push(0);
				}
				base64_Index.push(_toDecimal(binaryArray.slice(i , i+6)));
			}

			var base64 = '';
			for(var i = 0 , len = base64_Index.length ; i < len ; ++i){
				base64 += BASE64_MAPPING[base64_Index[i]];
			}

			for(var i = 0 , len = extra_Zero_Count/2 ; i < len ; ++i){
				base64 += '=';
			}
			return base64; 
	   },
	   setSDB:function (key,val){
		   if(typeof val == 'string'){
			   sessionStorage.setItem(key,val);			   
		   }else{
			   sessionStorage.setItem(key,JSON.stringify(val));
		   }
	   },
	   getSDB:function (key){
		  　try {
			　typeof JSON.parse(sessionStorage.getItem(key));
			  return JSON.parse(sessionStorage.getItem(key));
		   } catch(error) {
			   return sessionStorage.getItem(key)
		   }
		   
	   },
	   delSDB:function (key){
		   sessionStorage.removeItem(key)
	   },
	   clearSDB:function(){
		   sessionStorage.clear();
	   },
	   setLDB:function (key,val){
		   if(typeof val == 'string'){
			   localStorage.setItem(key,val);			   
		   }else{
			   localStorage.setItem(key,JSON.stringify(val));
		   }
	   },
	   getLDB:function (key){
		  　try {
			　typeof JSON.parse(localStorage.getItem(key));
			  return JSON.parse(localStorage.getItem(key));
		   } catch(error) {
			   return localStorage.getItem(key)
		   }
		   
	   },
	   delLDB:function (key){
		   localStorage.removeItem(key)
	   },
	   clearLDB:function(){
		   localStorage.clear();
	   },
	   ajaxComfirm :function (msg,title,type,url,data,headers,loading,loadmsg,hloading,callback){
		    $.confirm(msg, title, function() {
		    	util.ajax(type,url,data,headers,loading,loadmsg,hloading,callback);
   	        });
	   },
	   ajax:function(type,url,data,headers,loading,loadmsg,hloading,callback){
		   if(loading) $.showLoading(loadmsg);
		   $.ajax({
               type: type,
               url: url,
               data:JSON.stringify(data),
               headers:headers,
               async: true,
               contentType: "application/json",
               dataType: "JSON",
               success: function (data) {
            	   if(hloading) $.hideLoading();
            	   if (typeof callback === "function"){
           	         callback(data);
           	       }
               }
           });
	   }
   }

}(window, jQuery);