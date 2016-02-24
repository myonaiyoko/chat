package utils;

import java.util.Date;
/**
 *
 */

/**
 * @author Administrator
 *
 */
public class Chat {
	private int id;
	private String name;
	private String text;
	private Date date;

	/**
	 * @return id
	 */
	public int getId() {
		return id;
	}
	/**
	 * @param id セットする id
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * @return name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name セットする name
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return text
	 */
	public String getText() {
		return text;
	}
	/**
	 * @param text セットする text
	 */
	public void setText(String text) {
		this.text = text;
	}
	/**
	 * @return date
	 */
	public Date getDate() {
		return date;
	}
	/**
	 * @param date セットする date
	 */
	public void setDate(Date date) {
		this.date = date;
	}


}
