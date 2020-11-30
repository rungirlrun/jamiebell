package kr.co.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.vo.BoardVO;

// Component라고 어노테이션 선언을 해주면 다른 클래스에서 @Resource 를 사용해서 Component 붙은 애를 가져와 사용 할 수 있음.

@Component("fileUtils")
public class FileUtils {
	private static final String filePath = "/Users/juwonlee/Desktop/";
	
	/* 그동안 업로드했던 파일들이 저장 안되었던 이유 Desktop 이라고만 해서; Desktop/ 이라고 해줘야지 Desktop에 저장됨 바보멍충아 */
	
	public List<Map<String, Object>> parseInsertFileInfo(BoardVO boardVO, MultipartHttpServletRequest mpRequest) throws Exception{
		
		/* 
		 * Iterator은 데이터들의 집합체에서 컬렉션으로부터 정보를 얻어올 수 있는 인터페이스입니다.
		 * List나 배열은 순차적으로 데이터의 접근이 가능하지만, Map등의 클래스들은 순차적으로 접근할 수가 없습니다. 
		 * Iterator을 이용하여 Map에 있는 데이터들을 while문을 이용하여 순차적으로 접근합니다.
		 *  */
		
		/* MultipartHttpServletRequest : 멀티파트를 디코딩한 내용과 이를 참조하거나 조작할 수 있는 기능이 추가 됨. 
		 * 이를 파라미터로 받은 컨트롤러는 전달받은 오브젝트를 MultipartHttpServlerRequest 로 캐스팅한 후에 멀티파트 정보를 가진 MultipartFile 오브젝트를 가져와 사용할 수 있음.
		 */
		
	Iterator<String> iterator = mpRequest.getFileNames();	// String 타입의 File명들을 가지고 올 수 있음. ex) file1, file2, file3... 이런식으로 나열된 이름들을 가지고 있음.
	
	MultipartFile multipartFile = null;
	String originalFileName = null;
	String originalFileExtension = null;
	String storedFileName = null;
	
	List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
	Map<String, Object> listMap = null;
	
	int bno = boardVO.getBno();
	
	File file = new File(filePath);
	if(file.exists() == false) {
		file.mkdirs();
	}
	
	while(iterator.hasNext()) {
		multipartFile = mpRequest.getFile(iterator.next());
		if(multipartFile.isEmpty() == false) {
			originalFileName = multipartFile.getOriginalFilename();
			originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf(".")); // , 아니고 . 다. 주원아. . 
			storedFileName = getRandomString() + originalFileExtension;
			
			file = new File(filePath + storedFileName);
			multipartFile.transferTo(file);
			listMap = new HashMap<String, Object>();
			listMap.put("BNO", bno);
			listMap.put("ORG_FILE_NAME", originalFileName);
			listMap.put("STORED_FILE_NAME", storedFileName);
			listMap.put("FILE_SIZE", multipartFile.getSize());
			list.add(listMap);
		}
	}
		return list;
	}
	
	public List<Map<String, Object>> parseUpdateFileInfo(BoardVO boardVO, String[] files, String[] fileNames, MultipartHttpServletRequest ucRequest) throws Exception{
		Iterator<String> iterator = ucRequest.getFileNames();
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> listMap = null;
		int bno = boardVO.getBno();
		while(iterator.hasNext()) {
			multipartFile = ucRequest.getFile(iterator.next());
			if(multipartFile.isEmpty()==false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = getRandomString() + originalFileExtension;
				multipartFile.transferTo(new File(filePath + storedFileName));
				listMap = new HashMap<String,Object>();
				listMap.put("IS_NEW", "Y");
				listMap.put("BNO", bno);
				listMap.put("ORG_FILE_NAME", originalFileName);
				listMap.put("STORED_FILE_NAME", storedFileName);
				listMap.put("FILE_SIZE", multipartFile.getSize());
				list.add(listMap);
			}
		}
		if(files != null && fileNames != null) {
			for(int i = 0;i<fileNames.length; i++) {
				listMap = new HashMap<String, Object>();
				listMap.put("IS_NEW", "N");
				listMap.put("FILE_NO", files[i]);
				list.add(listMap);
			}
		}
		return list;
	}
	
	public static String getRandomString() {	// getRandomString()은 32글자의 랜덤한 문자열(숫자포함)을 만들어서 반환해주는 기능을 함.
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}
