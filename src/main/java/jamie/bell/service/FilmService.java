package jamie.bell.service;

import java.util.List;

import jamie.bell.vo.FilmVO;

public interface FilmService {
	// 불러오기
	public List<FilmVO> selectFilm() throws Exception;
}
