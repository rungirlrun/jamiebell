package jamie.bell.dao;

import java.util.List;

import jamie.bell.vo.FilmVO;


public interface FilmDAO {
	
	// 불러오기
	public List<FilmVO> selectFilm() throws Exception;
}
