package ignis.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.biz.JoinBiz;
import ignis.biz.NoticeBiz;

public class NoticeInsertAction implements ActionInterface {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		NoticeBiz noticeBiz = new NoticeBiz();
		ActionForward forward = new ActionForward();
		
		boolean result = noticeBiz.insert(request, response);
		
		if (result) {
			forward.setRedirect(true);
			forward.setPath("./community/noticeinsert.jsp");
			return forward;
		}
		
		return null;
	}

}