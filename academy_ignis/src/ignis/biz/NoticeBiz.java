package ignis.biz;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ignis.bean.ig_notice;
import ignis.dao.NoticeDAO;

public class NoticeBiz {
	
	public boolean insert(HttpServletRequest request, HttpServletResponse response) {
		NoticeDAO noticeDao = new NoticeDAO();
	

		String nb_title = request.getParameter("nb_title");
		String nb_content = request.getParameter("nb_content");

		boolean result = noticeDao.insert(nb_title, nb_content);
		
		if (result) return result;
		else return result;
	}

	public List<ig_notice> selectAll(int startRowNum,int endRowNum) {
		NoticeDAO noticeDao = new NoticeDAO();
		List<ig_notice> list = noticeDao.selectAll(startRowNum,endRowNum);
		return list;
	}
	
	public List<ig_notice> searchAll(int startRowNum,int endRowNum,String searchOption,String searchContent) {
		NoticeDAO noticeDao = new NoticeDAO();
		List<ig_notice> list = noticeDao.searchAll(startRowNum,endRowNum,searchOption,searchContent);
		return list;
	}
	public int getListcount() {
		NoticeDAO noticeDao = new NoticeDAO();
		int listCount = noticeDao.getListcount();
		
		return listCount;
	}

	public List<ig_notice> selectDetail(int nb_num) {
		NoticeDAO noticeDao = new NoticeDAO();
		List<ig_notice> list = noticeDao.selectDetail(nb_num);

		return list;
	}

	public int updateCount(int nb_num) {
		NoticeDAO noticeDao = new NoticeDAO();
		int readCount_change = noticeDao.updateCount(nb_num);
		return readCount_change;
	}
}
