package jamie.bell.vo;

import java.util.Date;

public class FilmVO {
	private int film_id;
	private String jyear;
	private String title;
	private String jrole;
	private String checkyn;
	private String notes;
	private String url;
	private Date viewday;
	
	public int getFilm_id() {
		return film_id;
	}
	public void setFilm_id(int film_id) {
		this.film_id = film_id;
	}
	public String getJyear() {
		return jyear;
	}
	public void setJyear(String jyear) {
		this.jyear = jyear;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getJrole() {
		return jrole;
	}
	public void setJrole(String jrole) {
		this.jrole = jrole;
	}
	public String getCheckyn() {
		return checkyn;
	}
	public void setCheckyn(String checkyn) {
		this.checkyn = checkyn;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Date getViewday() {
		return viewday;
	}
	public void setViewday(Date viewday) {
		this.viewday = viewday;
	}
	
	
}
