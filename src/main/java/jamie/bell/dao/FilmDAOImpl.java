package jamie.bell.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import jamie.bell.vo.FilmVO;


@Repository
public class FilmDAOImpl implements FilmDAO {
	@Inject
	private SqlSession sqlSession;
	
	// 불러오기
	@Override
	public List<FilmVO> selectFilm() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("filmMapper.selectFilm");
	}

}
