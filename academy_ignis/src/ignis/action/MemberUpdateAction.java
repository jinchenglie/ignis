package ignis.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.biz.MemberBiz;

public class MemberUpdateAction implements ActionInterface {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberBiz memBiz = MemberBiz.getInstance();
		
		int result = memBiz.update(request, response);
		String userId = request.getParameter("m_id");
		
		switch (result) {
		case MemberBiz.ADSUCCESS:
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out0 = response.getWriter();
			out0.println("<script>");
			out0.println("alert('수정되었습니다.');");
			out0.println("location.href='/academy_ignis/admin/ad_mypage.jsp?userId=" + userId +"';");
			out0.println("</script>");
			out0.close();
			return null;
		
		case MemberBiz.ADFAIL:
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out1 = response.getWriter();
			out1.println("<script>");
			out1.println("alert('수정된 정보가 없습니다.');");
			out1.println("location.href='/academy_ignis/admin/ad_mypage.jsp?userId=" + userId +"';");
			out1.println("</script>");
			out1.close();
			return null;
			
		case MemberBiz.USERSUCCESS:
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out2 = response.getWriter();
			out2.println("<script>");
			out2.println("alert('수정되었습니다.');");
			out2.println("location.href='/academy_ignis/myPage';");
			out2.println("</script>");
			out2.close();
			return null;
		
		case MemberBiz.USERFAIL:
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out3 = response.getWriter();
			out3.println("<script>");
			out3.println("alert('수정실패하였습니다.');");
			out3.println("location.href='/academy_ignis/myPage';");
			out3.println("</script>");
			out3.close();
			return null;
			
		case MemberBiz.PASSSUCCESS:
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out4 = response.getWriter();
			out4.println("<script>");
			out4.println("alert('수정되었습니다.');");
			out4.println("location.href='/academy_ignis/myPage';");
			out4.println("</script>");
			out4.close();
			break;
		
		case MemberBiz.PASSFAIL:
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out5 = response.getWriter();
			out5.println("<script>");
			out5.println("alert('수정과정에 문제가있었습니다.');");
			out5.println("location.href='/academy_ignis/myPage';");
			out5.println("</script>");
			out5.close();
			return null;

		default:
			System.out.println("업데이트 예외");
			break;
		}
		
		return null;
	}

}
