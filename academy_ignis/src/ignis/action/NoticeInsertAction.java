package ignis.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.biz.*;

public class NoticeInsertAction implements ActionInterface {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		QnaBiz qnaBiz = new QnaBiz();
		ActionForward forward = new ActionForward();
		
		boolean result = qnaBiz.insert(request, response);
		
		if (result) {
			forward.setRedirect(true);
			forward.setPath("./community/notice.jsp");
			return forward;
		}
		
		return null;
	}

}
