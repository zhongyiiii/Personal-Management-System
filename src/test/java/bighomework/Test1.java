package bighomework;

import com.chen.utils.FormatDatetime;

public class Test1 {
	public static void main(String[] args) {
		/*
		 * String str = "2020-07-19T13:40";
		 * System.out.println(FormatDatetime.formatDatetimeLocal(str));
		 */
		
		String str = "2020-07-19 13:40:00";
		String[] str1 = str.split(" ");
		String str2 = str1[1].substring(0,5);
		System.out.println(str2);
		System.out.println(str1[0]+"T"+str2);
	}
}