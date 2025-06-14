package lk.ijse.gdse72.cmsaad.util;

import java.util.regex.Pattern;

public class ValidationUtil {

    private static final Pattern EMAIL_PATTERN =
            Pattern.compile("^[A-Za-z0-9+_.-]+@([A-Za-z0-9.-]+\\.[A-Za-z]{2,})$");

    private static final Pattern USERNAME_PATTERN =
            Pattern.compile("^[A-Za-z0-9_]{3,20}$");

    private static final Pattern PASSWORD_PATTERN =
            Pattern.compile("^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{6,}$");

    private static final Pattern PHONE_PATTERN =
            Pattern.compile("^0\\d{9}$");

    private static final Pattern TITLE_PATTERN =
            Pattern.compile("^[\\w\\s.,'-]{5,100}$");

    private static final Pattern DESCRIPTION_PATTERN =
            Pattern.compile("^[\\w\\s.,'-]{10,1000}$");

    public static boolean isValidEmail(String email) {
        return email != null && EMAIL_PATTERN.matcher(email).matches();
    }

    public static boolean isValidUsername(String username) {
        return username != null && USERNAME_PATTERN.matcher(username).matches();
    }

    public static boolean isValidPassword(String password) {
        return password != null && PASSWORD_PATTERN.matcher(password).matches();
    }

    public static boolean isValidPhone(String phone) {
        return phone != null && PHONE_PATTERN.matcher(phone).matches();
    }

    public static boolean isValidTitle(String title) {
        return title != null && TITLE_PATTERN.matcher(title).matches();
    }

    public static boolean isValidDescription(String description) {
        return description != null && DESCRIPTION_PATTERN.matcher(description).matches();
    }

    public static boolean isValidString(String str) {
        return str != null && !str.isEmpty();
    }

    public static boolean isValidLength(String str, int minLength, int maxLength) {
        if (str == null) return false;
        int length = str.length();
        return length >= minLength && length <= maxLength;
    }
}
