import java.util.Scanner;
public class Tweet {
	
	public static void main (String args[]) {
		ask_for_a_tweet();
		get_the_tweet();
		deal_with_the_length();
		print_result();
	}
	
	static void puts (Object str) {
		System.out.println(str);
	}
	
	static void ask_for_a_tweet() {
		puts("Please enter a tweet");
	}
	
	static String contents;
	static void get_the_tweet() {
		Scanner s = new Scanner(System.in);
		contents = s.nextLine();
	}
	
	
	static String[] words;
	static void deal_with_the_length() {
		String delimiter = "[\\t ]";
		words = contents.split(delimiter);
		if (word_length()<=140) {
			// Correct
			puts("Length Correct");
		}
		else
		{
			// Error!
			puts ("Excess Characters: " + (word_length() - 140));
		}
	}
	
	static int word_length() {
		return contents.length( );
	}
	
	static boolean exceeded(){
		return contents.length( )>140;
	}
	static int numbers_of_hashtages() {
		int num = 0;
		for (String i : words){
			if (i.matches("(?i)[#][a-zA-Z_0-9]+")) {
				num++;
			}
		}
		return num;
	}
	
	static int numbers_of_attr() {
		int num = 0;
		for (String i : words){
			if (i.matches("(?i)@[a-zA-Z_0-9]+")) {
				num++;
			}
		}
		return num;
	}
	
	static int numbers_of_links() {
		int num = 0;
		for (String i : words){
			if (i.matches("(?i)http://\\S+")) {
				num++;
			}
		}
		return num;
	}
	
	static void print_result(){
		if (contents.length( )>140){
			return;
		 }
		puts("Number of Hashtags: " + numbers_of_hashtages());
		puts("Number of Attributions: " + numbers_of_attr());
		puts("Number of Links: " + numbers_of_links());
	}
}

