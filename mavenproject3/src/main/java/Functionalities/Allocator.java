package Functionalities;
import java.util.Random;
/**
 *
 * @author muzum
 */
public class Allocator {
    private static final Random random = new Random();
    private static boolean[] visitedBid = new boolean[1000001];
    private static boolean[] visitedSid = new boolean[1000001];
    public static String produceBid(){
        int curId; 
        do{
          curId = random.nextInt(1_000_000) + 1;
        } while(visitedBid[curId]); 
        visitedBid[curId] = true;
        return String.valueOf(curId);
    }
    public static void removeBid(String id){
        visitedBid[Integer.parseInt(id)] = false;
    }
    
    public static String produceSid(){
        int curId; 
        do{
          curId = random.nextInt(1_000_000) + 1;
        } while(visitedSid[curId]); 
        visitedSid[curId] = true;
        return String.valueOf(curId);
    }
    public static void removeSid(String id){
        visitedSid[Integer.parseInt(id)] = false;
    }
}
