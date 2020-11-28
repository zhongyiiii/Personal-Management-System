package bighomework;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class Test6 {

	public static void main(String[] args) {
//		int count = 0;
//		int i= 1;
//		while(count < 60) {
//			i = i+1;
//			if((i+"").contains("6")) {
//				count++;
//			}
//			System.out.println(i);
//		}
//		System.out.println(count);
		
		String path0 = "D:\\DeskTop\\110.txt";
		String path1 = "D:\\DeskTop\\111.txt";
		String path2 = "D:\\DeskTop\\112.txt";
		String path3 = "D:\\DeskTop\\113.txt";
		
		List<String> paths = new ArrayList<String>();
		paths.add(path0);
		paths.add(path1);
		paths.add(path2);
		paths.add(path3);
		
		for (String path : paths) {
			File file = new File(path);
			if(file.exists()) {
				file.delete();
			}
		}
	}

}
