/**
 * Curso: Elementos de Sistemas
 * Arquivo: Code.java
 */

package assembler;

import java.util.Arrays;

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
        StringBuilder dest = new StringBuilder("0000");
        if (mnemnonic[0].equals("movw")) {
            for (String mn:Arrays.copyOfRange(mnemnonic,2, mnemnonic.length)) {
                if (mn.equals("%A")) {
                    dest.setCharAt(3,'1');
                } else if (mn.equals("%D")) {
                    dest.setCharAt(2,'1');
                } else if (mn.equals("(%A)")) {
                    dest.setCharAt(1,'1');
                }
            }
        } else if (mnemnonic[0].equals("incw") | mnemnonic[0].equals("decw") | mnemnonic[0].equals("negw") | mnemnonic[0].equals("notw")) {
            if (mnemnonic[1].equals("%A")) {
                dest.setCharAt(3,'1');
            } else if (mnemnonic[1].equals("%D")) {
                dest.setCharAt(2,'1');
            } else if (mnemnonic[1].equals("(%A)")) {
                dest.setCharAt(1,'1');
            }
        } else if (mnemnonic[0].equals("addw") | mnemnonic[0].equals("subw") | mnemnonic[0].equals("rsubw") | mnemnonic[0].equals("andw") | mnemnonic[0].equals("orw")) {
            if (mnemnonic[3].equals("%A")) {
                dest.setCharAt(3,'1');
            } else if (mnemnonic[3].equals("%D")) {
                dest.setCharAt(2,'1');
            } else if (mnemnonic[3].equals("(%A)")) {
                dest.setCharAt(1,'1');
            }
        } /*else if (mnemnonic[0].equals("nop") | mnemnonic[0].charAt(0) == 'j') {
            ;
        }*/
        return dest.toString();
    }

    /**
     * Retorna o código binário do mnemônico para realizar uma operação de cálculo.
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 7 bits) com código em linguagem de máquina para a instrução.
     */
    public static String comp(String[] mnemnonic) {
        StringBuilder comp = new StringBuilder("000000000");
        if (mnemnonic[0].equals("movw")) {
            if (mnemnonic[1].equals("%A")) {
                comp.replace(comp.length()-6, comp.length(), "110000");
                comp.setCharAt(comp.length()-7, '0');
            } else if (mnemnonic[1].equals("%D")) {
                comp.replace(comp.length()-6, comp.length(), "001100");
                comp.setCharAt(comp.length()-7, '0');
            } else if (mnemnonic[1].equals("(%A)")) {
                comp.replace(comp.length()-6, comp.length(), "110000");
                comp.setCharAt(comp.length()-7, '1');
            }

        } else if (mnemnonic[0].equals("incw")) {
            if (mnemnonic[1].equals("%A")) {
                comp.replace(comp.length()-6, comp.length(), "110111");
                comp.setCharAt(comp.length()-7, '0');
            } else if (mnemnonic[1].equals("%D")) {
                comp.replace(comp.length()-6, comp.length(), "011111");
                comp.setCharAt(comp.length()-7, '0');
            } else if (mnemnonic[1].equals("(%A)")) {
                comp.replace(comp.length()-6, comp.length(), "110111");
                comp.setCharAt(comp.length()-7, '1');
            }

        } else if (mnemnonic[0].equals("decw")) {
            if (mnemnonic[1].equals("%A")) {
                comp.replace(comp.length()-6, comp.length(), "110010");
                comp.setCharAt(comp.length()-7, '0');
            } else if (mnemnonic[1].equals("%D")) {
                comp.replace(comp.length()-6, comp.length(), "001110");
                comp.setCharAt(comp.length()-7, '0');
            } else if (mnemnonic[1].equals("(%A)")) {
                comp.replace(comp.length()-6, comp.length(), "110010");
                comp.setCharAt(comp.length()-7, '1');
            }

        } else if ( mnemnonic[0].equals("negw")) {
            if (mnemnonic[1].equals("%A")) {
                comp.replace(comp.length()-6, comp.length(), "110011");
                comp.setCharAt(comp.length()-7, '0');
            } else if (mnemnonic[1].equals("%D")) {
                comp.replace(comp.length()-6, comp.length(), "001111");
                comp.setCharAt(comp.length()-7, '0');
            } else if (mnemnonic[1].equals("(%A)")) {
                comp.replace(comp.length()-6, comp.length(), "110011");
                comp.setCharAt(comp.length()-7, '1');
            }

        } else if ( mnemnonic[0].equals("notw")) {
            if (mnemnonic[1].equals("%A")) {
                comp.replace(comp.length()-6, comp.length(), "110001");
                comp.setCharAt(comp.length()-7, '0');
            } else if (mnemnonic[1].equals("%D")) {
                comp.replace(comp.length()-6, comp.length(), "001101");
                comp.setCharAt(comp.length()-7, '0');
            } else if (mnemnonic[1].equals("(%A)")) {
                comp.replace(comp.length()-6, comp.length(), "110001");
                comp.setCharAt(comp.length()-7, '1');
            }

        } else if (mnemnonic[0].equals("addw")) {
            if ( (mnemnonic[1].equals("%A") && mnemnonic[2].equals("%D")) | (mnemnonic[1].equals("%D") && mnemnonic[2].equals("%A")) ) {
                comp.replace(comp.length()-6, comp.length(), "000010");
                comp.setCharAt(comp.length()-7, '0');
            } else if ( (mnemnonic[1].equals("(%A)") && mnemnonic[2].equals("%D")) | (mnemnonic[1].equals("%D") && mnemnonic[2].equals("(%A)")) ) {
                comp.replace(comp.length()-6, comp.length(), "000010");
                comp.setCharAt(comp.length()-7, '1');

            } else if ( (mnemnonic[1].equals("%A") && mnemnonic[2].equals("$1")) | (mnemnonic[1].equals("$1") && mnemnonic[2].equals("%A")) ) {
                comp.replace(comp.length()-6, comp.length(), "110111");
                comp.setCharAt(comp.length()-7, '0');
            } else if ( (mnemnonic[1].equals("%D") && mnemnonic[2].equals("$1")) | (mnemnonic[1].equals("$1") && mnemnonic[2].equals("%D")) ) {
                comp.replace(comp.length()-6, comp.length(), "011111");
                comp.setCharAt(comp.length()-7, '0');
            } else if ( (mnemnonic[1].equals("(%A)") && mnemnonic[2].equals("$1")) | (mnemnonic[1].equals("$1") && mnemnonic[2].equals("(%A)")) ) {
                comp.replace(comp.length()-6, comp.length(), "110111");
                comp.setCharAt(comp.length()-7, '1');
            }

        } else if (mnemnonic[0].equals("subw")) {
            if (mnemnonic[1].equals("%A") && mnemnonic[2].equals("%D")) {
                comp.replace(comp.length()-6, comp.length(), "000111");
                comp.setCharAt(comp.length()-7, '0');
            } else if (mnemnonic[1].equals("%D") && mnemnonic[2].equals("%A")) {
                comp.replace(comp.length()-6, comp.length(), "010011");
                comp.setCharAt(comp.length()-7, '0');
            } else if (mnemnonic[1].equals("(%A)") && mnemnonic[2].equals("%D")){
                comp.replace(comp.length()-6, comp.length(), "000111");
                comp.setCharAt(comp.length()-7, '1');
            } else if (mnemnonic[1].equals("%D") && mnemnonic[2].equals("(%A)")) {
                comp.replace(comp.length()-6, comp.length(), "010011");
                comp.setCharAt(comp.length()-7, '1');
            } else if ( (mnemnonic[1].equals("%A") && mnemnonic[2].equals("$1")) | (mnemnonic[1].equals("$1") && mnemnonic[2].equals("%A")) ) {
                comp.replace(comp.length()-6, comp.length(), "110010");
                comp.setCharAt(comp.length()-7, '0');
            } else if ( (mnemnonic[1].equals("%D") && mnemnonic[2].equals("$1")) | (mnemnonic[1].equals("$1") && mnemnonic[2].equals("%D")) ) {
                comp.replace(comp.length()-6, comp.length(), "001110");
                comp.setCharAt(comp.length()-7, '0');
            } else if ( (mnemnonic[1].equals("(%A)") && mnemnonic[2].equals("$1")) | (mnemnonic[1].equals("$1") && mnemnonic[2].equals("(%A)")) ) {
                comp.replace(comp.length()-6, comp.length(), "110010");
                comp.setCharAt(comp.length()-7, '1');
            }

        } else if ( mnemnonic[0].equals("rsubw")) {
            if (mnemnonic[1].equals("%A") && mnemnonic[2].equals("%D")) {
                comp.replace(comp.length()-6, comp.length(), "010011");
                comp.setCharAt(comp.length()-7, '0');
            } else if (mnemnonic[1].equals("%D") && mnemnonic[2].equals("%A")) {
                comp.replace(comp.length()-6, comp.length(), "000111");
                comp.setCharAt(comp.length()-7, '0');
            } else if (mnemnonic[1].equals("(%A)") && mnemnonic[2].equals("%D")){
                comp.replace(comp.length()-6, comp.length(), "010011");
                comp.setCharAt(comp.length()-7, '1');
            } else if (mnemnonic[1].equals("%D") && mnemnonic[2].equals("(%A)")) {
                comp.replace(comp.length()-6, comp.length(), "000111");
                comp.setCharAt(comp.length()-7, '1');
            }
        } else if ( mnemnonic[0].equals("andw")) {
            if ( (mnemnonic[1].equals("%A") && mnemnonic[2].equals("%D")) | (mnemnonic[1].equals("%D") && mnemnonic[2].equals("%A")) ) {
                comp.replace(comp.length()-6, comp.length(), "000000");
                comp.setCharAt(comp.length()-7, '0');
            } else if ( (mnemnonic[1].equals("(%A)") && mnemnonic[2].equals("%D")) | (mnemnonic[1].equals("%D") && mnemnonic[2].equals("(%A)")) ) {
                comp.replace(comp.length() - 6, comp.length(), "000000");
                comp.setCharAt(comp.length() - 7, '1');
            }
        } else if (mnemnonic[0].equals("orw")) {
                if ((mnemnonic[1].equals("%A") && mnemnonic[2].equals("%D")) | (mnemnonic[1].equals("%D") && mnemnonic[2].equals("%A"))) {
                    comp.replace(comp.length() - 6, comp.length(), "010101");
                    comp.setCharAt(comp.length() - 7, '0');
                } else if ((mnemnonic[1].equals("(%A)") && mnemnonic[2].equals("%D")) | (mnemnonic[1].equals("%D") && mnemnonic[2].equals("(%A)"))) {
                    comp.replace(comp.length() - 6, comp.length(), "010101");
                    comp.setCharAt(comp.length() - 7, '1');
                }

        } else if (mnemnonic[0].charAt(0) == 'j') {
            comp.replace(comp.length()-6,comp.length(), "001100");
            comp.setCharAt(comp.length()-7, '0');
        }
        return comp.toString();

    }

    /**
     * Retorna o código binário do mnemônico para realizar uma operação de jump (salto).
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 3 bits) com código em linguagem de máquina para a instrução.
     */
    public static String jump(String[] mnemnonic) {
<<<<<<< HEAD
        switch (mnemnonic[0]) {
            case "jmp" : return "111";
            case "jle" : return "110";
            case "jne" : return "101";
            case "jl"  : return "100";
            case "jge" : return "011";
            case "je"  : return "010";
            case "jg"  : return "001";
=======
        switch (mnemnonic[0]){
            case "jmp"  : return "111";
            case "jg"  : return "001";
            case "je"  : return "010";
            case "jge"  : return "011";
            case "jl"  : return "100";
            case "jne"  : return "101";
            case "jle"  : return "110";

>>>>>>> ec2ecc84037824b5fca6b86226fabc80b8a02d58
            default    : return "000";
        }
    }


    /**
     * Retorna o código binário de um valor decimal armazenado numa String.
     * @param  symbol valor numérico decimal armazenado em uma String.
     * @return Valor em binário (String de 16 bits) representado com 0s e 1s.
     */
    public static String toBinary(String symbol) {
        StringBuilder bin16 = new StringBuilder("0000000000000000");
        String bin = (Integer.toBinaryString(Integer.parseInt(symbol)));
        bin16.replace(bin16.length()-bin.length(), bin16.length(), bin);
        return bin16.toString();
    }

}
