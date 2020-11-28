package com.chen.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public  class FormatDatetime {

    public static String  datetimeUtils(Date date){
        SimpleDateFormat sdf  = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String datetime = sdf.format(date);
        String[] y_m_d_h_m_s = datetime.split(" ");
        String[] y_m_d = y_m_d_h_m_s[0].split("-");
        String[] h_m_s = y_m_d_h_m_s[1].split(":");
        String dt = "";
        for (String d:
             y_m_d) {
            dt+=d;
        }
        for (String t :
                h_m_s) {
            dt+=t;
        }
        return dt;
    }
    
    public static String formatDatetimeLocal(String dateTimeLocal) {
		String[] str1 = dateTimeLocal.split("T");
		String str2 = str1[1]+":00";
    	
		return str1[0]+" "+str2;
    	
    }
    public static String reverseFormatDatetimeLocal(String dateTimeLocal) {
		String[] str1 = dateTimeLocal.split(" ");
		String str2 = str1[1].substring(0,5);
		return str1[0]+"T"+str2;
    	
    }
}
