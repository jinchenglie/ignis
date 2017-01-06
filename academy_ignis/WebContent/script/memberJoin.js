$(function() {
	$("#postSearch").click(function() {
		sample3_execDaumPostcode();
	});
	
	$("#m_passchk").keyup(function() {
		var m_pass = $("#m_pass").val();
		var m_passchk = $("#m_passchk").val();
		
		if (m_pass != m_passchk) {
			$("#passmsg").html("<div class='col-md-3'></div><div class='col-md-6 alert alert-danger'>비밀번호가 일치하지 않습니다.</div>")
		} else {
			$("#passmsg").html("<div class='col-md-3'></div><div class='col-md-6 alert alert-success'>비밀번호가 일치합니다.</div>")
		}
	});
	
	$("#idChk").click(function() {
		$.MessageBox({
			  input    : true,
			  message  : "사용하실 아이디를 입력해주세요."
			}).done(function(data){

			data = data.trim();	
			var idReg = /^[a-zA-Z][A-Za-z0-9]{4,10}$/g;
			if (!data) {
				$.alert({
					buttons: {
						tryAgain: {
				            text: '돌아가기',
				            btnClass: 'btn-red',
				            action: function(){
				            }
						}
					},
				    title: '빈아이디',
				    type: 'red',
				    content: '아이디를 입력해 주십시오.'
				});
				return false;
			}

			
			if(!idReg.test(data)) {
				$.alert({
					buttons: {
						tryAgain: {
				            text: '돌아가기',
				            btnClass: 'btn-red',
				            action: function(){
				            }
						}
					},
					columnClass: 'col-md-10 col-md-offset-1 col-sm-10 col-sm-offset-1 col-xs-10 col-xs-offset-1',
				    title: '양식에 맞지않음',
				    type: 'red',
				    content: '아이디는 알파벳으로 시작하고 알파벳과 숫자를 사용하여 5~11자까지 가능합니다.'
				});
				return false;
			}
			
			$.post('/academy_ignis/member/idChk.jsp', 'm_id=' + data, function(temp) {
				var resultArr = temp.split('/');
				var result = resultArr[0].trim();
				var id = resultArr[1].trim();
				
				if (result == 'OK') {
					$.confirm({
						type: 'green',
					    title: '사용가능',
					    content: '사용가능한 아이디입니다.',
					    buttons: {
					        사용하기: {
					        	btnClass: 'btn-green',
					        	action : function () {
					        		$("#m_id").val(id);
					        	}
					        },
					        돌아가기: function () {
					        }
					    }
					});
					return false;
				} else {
					$.alert({
						buttons: {
							tryAgain: {
					            text: '돌아가기',
					            btnClass: 'btn-red',
					            action: function(){
					            }
							}
						},
						title: '사용불가',
					    type: 'red',
					    content: '이미 존재하는 아이디입니다.'
					});
					return false;
				}
			});
		});
	});
});

