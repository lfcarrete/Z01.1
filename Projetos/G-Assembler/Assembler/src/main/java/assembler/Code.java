/**
 * Curso: Elementos de Sistemas
 * Arquivo: Code.java
 */

package assembler;
import java.lang.Math;

/**
 * Traduz mnemônicos da linguagem assembly para códigos binários da arquitetura Z0.
 */
public class Code {

    /**
     * Retorna o código binário do(s) registrador(es) que vão receber o valor da instrução.
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 4 bits) com código em linguagem de máquina para a instrução.
     */
    public static String dest(String[] mnemnonic) {
        if (mnemnonic.length > 3){
            if (mnemnonic[0] == "movw") {
                if ((mnemnonic[2] == "%D" && mnemnonic[3] == "%A") || (mnemnonic[3] == "%D" && mnemnonic[2] == "%A")){
                    return "0011";
                } else if ((mnemnonic[2] == "%A" && mnemnonic[3] == "(%A)") || (mnemnonic[3] == "%A" && mnemnonic[2] == "(%A)")) {
                    return "0101";
                } else if ((mnemnonic[2] == "%D" && mnemnonic[3] == "(%A)") || (mnemnonic[3] == "%D" && mnemnonic[2] == "(%A)")) {
                    return "0110";
                } else {
                    return "0111";
                }
            } else {
                if (mnemnonic[3] == "%A"){
                    return "0001";
                } else if (mnemnonic[3] == "(%A)") {
                    return "0100";
                } else {
                    return "0010";
                }
            }
        } else if (mnemnonic.length == 3) {
            if (mnemnonic[2] == "%A") {
                return "0001";
            } else if (mnemnonic[2] == "(%A)") {
                return "0100";
            } else {
                return "0010";
            }
        } else if (mnemnonic.length == 2) {
            if (mnemnonic[1] == "%A") {
                return "0001";
            } else if (mnemnonic[1] == "(%A)") {
                return "0100";
            } else {
                return "0010";
            }
        } else {
            return "0000";
        }

    }

    /**
     * Retorna o código binário do mnemônico para realizar uma operação de cálculo.
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 7 bits) com código em linguagem de máquina para a instrução.
     */
    public static String comp(String[] mnemnonic) {
        if (mnemnonic[0] == "movw") {
            if (mnemnonic[1] == "%A") {
                return "000110000";
            } else if (mnemnonic[1] == "%D") {
                return "000001100";
            } else if (mnemnonic[1] == "(%A)") {
                return "001110000";
            } else if (mnemnonic[1] == "$0") {
                return "000101010";
            } else if (mnemnonic[1] == "$1") {
                return "000111111";
            } else {
                return "000111010";
            }
        } else if (mnemnonic[0] == "addw") {
            if (mnemnonic[1] == "%A") {
                if (mnemnonic[2] == "%D") {
                    return "000000010";
                } else {
                    return "000110111";
                }
            } else if (mnemnonic[1] == "(%A)") {
                if (mnemnonic[2] == "%D") {
                    return "001000010";
                } else {
                    return "001110111";
                }
            } else if (mnemnonic[1] == "%D"){
                if (mnemnonic[2] == "%A") {
                    return "000000010";
                } else if (mnemnonic[2] == "(%A)") {
                    return "001000010";
                } else {
                    return "000011111";
                }
            } else {
                if (mnemnonic[2] == "%A") {
                    return "000110111";
                } else if (mnemnonic[2] == "(%A)") {
                    return "001110111";
                } else {
                    return "000011111";
                }
            }
        } else if (mnemnonic[0] == "incw") {
            if (mnemnonic[1] == "%A") {
                return "000110111";
            } else if (mnemnonic[1] == "(%A)") {
                return "001110111";
            } else {
                return "000011111";
            }
        } else if (mnemnonic[0] == "subw") {
            if (mnemnonic[1] == "%A") {
                if (mnemnonic[2] == "%D") {
                    return "000000111";
                } else {
                    return "000110010";
                }
            } else if (mnemnonic[1] == "(%A)") {
                if (mnemnonic[2] == "%D") {
                    return "001000111";
                } else {
                    return "001110010";
                }
            } else {
                if (mnemnonic[2] == "%A") {
                    return "000010011";
                } else if (mnemnonic[2] == "(%A)") {
                    return "001010011";
                } else {
                    return "000001110";
                }
            }
        } else if (mnemnonic[0] == "rsubw") {
            if (mnemnonic[2] == "%A") {
                if (mnemnonic[1] == "%D") {
                    return "000000111";
                } else {
                    return "000110010";
                }
            } else if (mnemnonic[2] == "(%A)") {
                if (mnemnonic[1] == "%D") {
                    return "001000111";
                } else {
                    return "001110010";
                }
            } else {
                if (mnemnonic[1] == "%A") {
                    return "000010011";
                } else if (mnemnonic[1] == "(%A)") {
                    return "001010011";
                } else {
                    return "000001110";
                }
            }
        } else if (mnemnonic[0] == "decw") {
            if (mnemnonic[1] == "%A") {
                return "000110010";
            } else if (mnemnonic[1] == "(%A)") {
                return "001110010";
            } else {
                return "000001110";
            }
        } else if (mnemnonic[0] == "notw") {
            if (mnemnonic[1] == "%A") {
                return "000110001";
            } else if (mnemnonic[1] == "(%A)") {
                return "001110001";
            } else {
                return "000001101";
            }
        } else if (mnemnonic[0] == "negw") {
            if (mnemnonic[1] == "%A") {
                return "000110011";
            } else if (mnemnonic[1] == "(%A)") {
                return "001110011";
            } else {
                return "000001111";
            }
        } else if (mnemnonic[0] == "andw") {
            if (mnemnonic[1] == "%A") {
                return "000000000";
            } else if (mnemnonic[1] == "(%A)") {
                return "001000000";
            } else {
                if (mnemnonic[2] == "(%A)") {
                    return "001000000";
                } else {
                    return "000000000";
                }
            }
        } else if (mnemnonic[0] == "orw") {
            if (mnemnonic[1] == "%A") {
                return "000010101";
            } else if (mnemnonic[1] == "(%A)") {
                return "001010101";
            } else {
                if (mnemnonic[2] == "(%A)") {
                    return "001010101";
                } else {
                    return "000010101";
                }
            }
        } else {
            return "000001100";
        }
    }

    /**
     * Retorna o código binário do mnemônico para realizar uma operação de jump (salto).
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 3 bits) com código em linguagem de máquina para a instrução.
     */
    public static String jump(String[] mnemnonic) {
        switch (mnemnonic[0]) {
            case "jmp" : return "111";
            case "jg"  : return "001";
            case "je"  : return "010";
            case "jge" : return "011";
            case "jl"  : return "100";
            case "jne" : return "101";
            case "jle" : return "110";
            default    : return "000";
        }
    }

    /**
     * Retorna o código binário de um valor decimal armazenado numa String.
     * @param  symbol valor numérico decimal armazenado em uma String.
     * @return Valor em binário (String de 15 bits) representado com 0s e 1s.
     */
    public static String toBinary(String symbol) {
        int numero = Integer.parseInt(symbol);
        Double num = Double.valueOf(numero);
        Double ones = 15.0;
        String last = "";
        while (ones >= 0) {
            if ((num / (Math.pow(2.0, ones)) >= 1)) {
                last += "1";
                num = (num - (Math.pow(2.0, ones)));
            } else {
                last += "0";
            }
            ones -= 1;
        }

        return last;
    }

}
