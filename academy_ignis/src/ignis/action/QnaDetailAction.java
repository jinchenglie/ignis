package ignis.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.bean.*;
import ignis.biz.*;

public class QnaDetailAction  implements ActionInterface{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		QnaBiz qnaBiz = new QnaBiz();
		ActionForward forward = new ActionForward();
		request.removeAttribute("qnalist");
		request.removeAttribute("pagelimit");
		request.removeAttribute("pageCount");
		request.removeAttribute("startpage");
		request.removeAttribute("pagenum");
		request.removeAttribute("endpage");
		int pagenum=1;//현재 페이지
		if(request.getParameter("pagenum")!=null){
			pagenum=Integer.parseInt(request.getParameter("pagenum"));
		}

		List<ig_qna> list = qnaBiz.selectDetail(request,response);//상세 정보 가져옴
		
		request.setAttribute("pagenum", pagenum);
		
		if (list !=null) {
			String login = request.getParameter("login");//admin 이면 관지자창 이동
			if(login!=null&&login.equals("admin")){
				forward.setRedirect(false);
				forward.setPath("./admin/ad_CommunityQnaDetail.jsp?login=admin&pagenum="+pagenum);
				return forward;
			}
			forward.setRedirect(false);
			forward.setPath("./community/qnaDetail.jsp?pagenum="+pagenum);
			return forward;
		}
		
		return null;
	}
}
