package dto;

public class MemberDTO {
	private String id;
	private String pw;
	private String name;
	private Integer point;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getPoint() {
		return point;
	}
	public void setPoint(Integer point) {
		this.point = point;
	}
	public MemberDTO(String id, String pw, String name, Integer point) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.point = point;
	}
	
}
