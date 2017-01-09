package ignis.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.biz.ReviewBiz;

public class ReviewEditViewAction implements ActionInterface {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ReviewBiz reviewBiz = new ReviewBiz();
		ActionForward forward = new ActionForward();
		int num = Integer.valueOf(request.getParameter("num"));
		
		System.out.println("ReviewViewAction");
		
		String login = request.getParameter("login");
		String pageNo = "1";
		
		if(request.getParameter("pageNo") != null){
			pageNo = request.getParameter("pageNo");
		}
		
		if(login.equals("admin")){
			
			forward.setRedirect(true);
			forward.setPath("/academy_ignis/admin/ad_CommunityReviewEditView.jsp?pageNo=" + pageNo + "&num="+ num);
			return forward;

		} else if(login.equals("member")){
			boolean result = reviewBiz.upReadCount(request, response);
			if(result){
				System.out.println("member로 들어옴");
				System.out.println(pageNo);
				System.out.println(num);
				forward.setRedirect(true);
				forward.setPath("/academy_ignis/community/reviewEdit.jsp?pageNo=" + pageNo + "&num="+ num);
				return forward;
			} else {
				System.out.println(num);
			}
		}
		return null;
		
	}
}
