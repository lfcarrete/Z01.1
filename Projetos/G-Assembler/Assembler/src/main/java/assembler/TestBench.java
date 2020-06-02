package assembler;

import java.util.Arrays;
import java.util.LinkedList;

public class TestBench {
    public static void main(String[] args) {
        String command = "leaw $0,%A";

        LinkedList<String> tokens = new LinkedList<>();
        for (String element: command.split(" ")) {
            for (String value: element.split(",")) {
                tokens.add(value);

            }
        }
        System.out.println(Arrays.toString(tokens.toArray(new String[0])));
    }
}
