package Functionalities;

/**
 *
 * @author muzum
 */
public class Hash {
    static final int BASE = 13331, MOD = 998244353;
    public static String getHashValue(String str){
        long result = 0;
        for(int i = 0; i < str.length(); i++){
            result = result * BASE + str.charAt(i);
            result %= MOD;
        }
        return String.valueOf(result);
    }
}
