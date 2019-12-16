import java.time.DayOfWeek;
import java.time.LocalDate;
//import java.util.*;

public class Mydate{
    public static void main(String[] args){
        //先获取今天的时间
        //再移动到本月第一天
        //只要月份没变就继续迭代
        //

        LocalDate date = LocalDate.now();
        //date = date.plusDays(106);
        System.out.println(date);
        int thisMonth =  date.getMonthValue();
        int today = date.getDayOfMonth();

        //System.out.printf("%d-%d\n",thisMonth,today);
        
        //这个月的第一天是？
        date = date.minusDays(today - 1);  
        DayOfWeek week = date.getDayOfWeek();
        int week_value = week.getValue();

        System.out.println("Mon Tue Wed Thu Fri Sat Sun");
        for (int i=1;i<week_value;i++){  //星期几 就在前面加空格
            System.out.print("    ");            
        }

        //只要还相等 还在这个月
        for(;date.getMonthValue()==thisMonth;date = date.plusDays(1)){
            System.out.printf("%3d",date.getDayOfMonth());
            
            if (date.getDayOfMonth() == today){
                System.out.printf("*");
            }else{
                System.out.printf(" ");
            }

            if (date.getDayOfWeek().getValue() == 7){
                System.out.println();
            }
            
            
            /*
            if (date.getDayOfWeek().getValue() == 1){
                System.out.println();
            }
            */
        }
        System.out.println();


    }
}
