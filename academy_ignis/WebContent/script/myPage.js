$(function() {
	$("#postSearch2").click(function() {
		sample3_execDaumPostcode();
	});
	
    $('input[name="m_birth"]').daterangepicker({
        singleDatePicker: true,
        showDropdowns: true
    });
	
	$("#backBtn").click(function() {
		if ( document.referrer && document.referrer.indexOf("/academy_ignis") != -1 ) { 
			history.back();
		}

		else { 
			location.href = "/academy_ignis";
		}
	});
	
	$("#passChk").click(function() {
		var m_pass = $("#m_pass").val().trim();
		var m_id = $("#hidden_id").val().trim();
		
		$.post('/academy_ignis/member/passChk.jsp', { m_pass : m_pass, m_id : m_id }, function(temp) {
			var result = temp.trim();

			if (result == 'OK') {
				$.confirm({
					type: 'green',
				    title: '비밀번호 확인',
				    content: '확인되었습니다.',
				    buttons: {
				        확인: {
				        	btnClass: 'btn-green',
				        	action : function () {
				        		$("#menu1").html('<h3>비밀번호 변경</h3><form id="passForm" class="form-horizontal" method="post" action="./memUpProcess?page=pass"><fieldset><legend class="sr-only">비밀번호 변경</legend><div class="form-group"><label class="col-md-4 control-label" for="m_pass">패스워드</label><div class="col-md-4"><input name="hidden_id" id="hidden_id" type="hidden" value="'+ m_id + '"><input id="m_pass" name="m_pass" type="password" required="required" maxlength="12" placeholder="패스워드" class="form-control input-md"></div></div><div class="form-group"><label class="col-md-4 control-label" for="m_passchk">패스워드확인</label><div class="col-md-4"><input id="m_passchk" name="m_passchk" maxlength="12" type="password" required="required" placeholder="패스워드 확인" class="form-control input-md"></div><div class="col-md-4" id="passmsg"></div></div><div class="form-group"><div class="col-md-4"></div>&nbsp;&nbsp;&nbsp;<span class="label label-default"> 패스워드는 7~12자까지 가능합니다.</span></div><br><div class="form-group"><label class="col-md-4 control-label"></label><div class="col-md-4"><input id="passSubmit" class="btn btn-primary" value="수정하기"></div></div></fieldset></form><script type="text/javascript" charset="utf-8" src="/academy_ignis/script/myPage_pass.js?v=1"></script>');
				        	}
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
					title: '문제',
				    type: 'red',
				    content: '패스워드를 다시 입력해주세요.'
				});
				return false;
			}
		});
	});
	
	$('.button-checkbox').each(function(){
		var $widget = $(this),
			$button = $widget.find('button'),
			$checkbox = $widget.find('input:checkbox'),
			color = $button.data('color'),
			settings = {
					on: {
						icon: 'glyphicon glyphicon-check'
					},
					off: {
						icon: 'glyphicon glyphicon-unchecked'
					}
			};

		$button.on('click', function () {
			$checkbox.prop('checked', !$checkbox.is(':checked'));
			$checkbox.triggerHandler('change');
			updateDisplay();
		});

		$checkbox.on('change', function () {
			updateDisplay();
		});

		function updateDisplay() {
			var isChecked = $checkbox.is(':checked');
			// Set the button's state
			$button.data('state', (isChecked) ? "on" : "off");

			// Set the button's icon
			$button.find('.state-icon')
				.removeClass()
				.addClass('state-icon ' + settings[$button.data('state')].icon);

			// Update the button's color
			if (isChecked) {
				$button
					.removeClass('btn-default')
					.addClass('btn-' + color + ' active');
			}
			else
			{
				$button
					.removeClass('btn-' + color + ' active')
					.addClass('btn-default');
			}
		}
		function init() {
			updateDisplay();
			// Inject the icon if applicable
			if ($button.find('.state-icon').length == 0) {
				$button.prepend('<i class="state-icon ' + settings[$button.data('state')].icon + '"></i> ');
			}
		}
		init();
	});
	
});
