function passChk(){
	var pass = $('#m_pass').val().trim();
	var passchk = $('#m_passchk').val().trim();
	
	var _plength = pass.lenth;
	var _pclength = passchk.length;
	
	if (_plength < 7 || _pclength < 7) {
		$.alert({
			buttons: {
				tryAgain: {
		            text: '돌아가기',
		            btnClass: 'btn-red',
		            action: function(){
		            }
				}
			},
			title: '비밀번호',
		    type: 'red',
		    content: '비밀번호는 7~12글자로 해주세요.'
		});
		return false;
	}
	
	if (pass == passchk) {
		$('#passForm').submit();
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
			title: '비밀번호',
		    type: 'red',
		    content: '비밀번호를 일치시켜주세요.'
		});
		$('#m_passchk').val("");
		$('#m_passchk').focus();
		return false;
	}
}

$(function() {
	$("#passSubmit").click(function() {
		passChk();
	});
	
	
	$("#m_passchk").keyup(function() {
		var m_pass = $("#m_pass").val();
		var m_passchk = $("#m_passchk").val();
		
		if (m_pass != m_passchk) {
			$("#passmsg").html("<h4><span class='label label-danger'>비밀번호가 일치하지 않습니다.</span></h4>")
		} else if (m_passchk != m_pass) {
			$("#passmsg").html("<h4><span class='label label-danger'>비밀번호가 일치하지 않습니다.</span></h4>")
		} else {
			$("#passmsg").html("<h4><span class='label label-success'>비밀번호가 일치합니다.</span></h4>")
		}
	});
});