package jamie.bell.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import jamie.bell.dao.FilmDAO;
import jamie.bell.vo.FilmVO;

@Service
public class FilmServiceImpl implements FilmService {

	@Inject
	private FilmDAO dao;
	
	// 불러오기
	@Override
	public List<FilmVO> selectFilm() throws Exception {
		// TODO Auto-generated method stub
		return dao.selectFilm();
	}

}
