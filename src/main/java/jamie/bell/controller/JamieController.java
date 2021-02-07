package jamie.bell.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import jamie.bell.service.FilmService;

@Controller
@RequestMapping("/jamiebell/*")
public class JamieController {
	
	private static final Logger logger = LoggerFactory.getLogger(JamieController.class);

	@Inject
	FilmService service;
	
	@RequestMapping(value = "/jamiebell/", method = RequestMethod.GET)
	public String selectFilm(Model model) throws Exception{
		logger.info("selectFilm");
		
		model.addAttribute("selectFilm", service.selectFilm());
		System.out.println(model);
		return "/jamiebell/";
	}
}
