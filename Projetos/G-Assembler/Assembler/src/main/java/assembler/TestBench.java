package assembler;

public class TestBench {
    public static void main(String[] args) {
        String command = "leaw $12345, %A";

        System.out.println(command.split(" "));
    }
}
