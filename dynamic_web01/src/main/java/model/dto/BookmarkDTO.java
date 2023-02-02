package model.dto;

public class BookmarkDTO {

	private int id;
	private String userId;
	private String name;
	private String url;
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getUrl() {
		return url;
	}
	
	public void setUrl(String url) {
		this.url = url;
	}
	
	@Override
	public String toString() {
		return "BookmarkDTO [id=" + id + ", userId=" + userId + ", name=" + name + ", url=" + url + "]";
	}
	
}