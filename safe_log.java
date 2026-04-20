import java.util.Scanner;
public class safe_log{
    public static void main(String args[]){

        Scanner sc = new Scanner(System.in);

        while(true){

            System.out.println("Enter the password");
            String password = sc.next();

            int upper_case_count =0;
            int digit_count=0;
            int special_char_count =0;

            if(password.length()<8){
                System.out.println("the entered password is too short try again");
                continue;
            }

            for(int i=0;i<password.length();i++){
                char letter = password.charAt(i);

                if(Character.isDigit(letter)){
                    digit_count++;
                }
                if(Character.isUpperCase(letter)){
                    upper_case_count++;
                }
                if(!Character.isLetterOrDigit(letter)){
                    special_char_count++;
                }
            }

            if(upper_case_count==0){
                System.out.println("use at least one upper case");
                continue;
            }

            if(digit_count==0){
                System.out.println("use at least one digit in your password");
                continue;
            }

            if(special_char_count==0){
                System.out.println("use at least one special character in your password");
                continue;
            }

            System.out.println("your password is valid");
            break;
        }
        
        sc.close();
    }
}