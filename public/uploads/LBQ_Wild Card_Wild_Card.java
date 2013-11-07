import java.util.Scanner;
public class Main {

    /**
     * @param args the command line arguments
     */
    
    
    
    public static String i1;
    public static String pattern = "(?i)[abcdefghijklmnopqrstuvwxyz \\t*]+";
    public static String i2;
    public static void main(String[] args) {
        // TODO code application logic here
        Scanner s = new Scanner(System.in);
        i1 = s.nextLine();
        
        
        if (!correct_pattern()){
            System.out.println("Error: incorrect character");
        }
        
        
        if (!correct_number()){
            System.out.println("Error: no *");
        }
        
        
        i2 = s.nextLine();
        String new_string = i1.replaceAll("\\*",i2);
        System.out.println(new_string);
    }
    
    
    
    static boolean correct_syntax() {
        return correct_pattern() && correct_number();
    }
    
    
    static boolean correct_pattern() {
        if (i1.matches(pattern)){
            return true;
        }
        
        return false;
    }
    
    
    static boolean correct_number() {  
        if (i1.split("\\*", -1).length - 1 == 1){
            return true;
        }
        return false;
    }
}
