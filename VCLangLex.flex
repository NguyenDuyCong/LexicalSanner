/* User code */
import java.util.ArrayList;
import java.util.HashMap;
import java.io.*;

%%

%class VCScanner

%standalone

%line
%column

LineTerminator = \r|\n|\r\n
InputCharacter = [^\r\n]

WhiteSpace = {LineTerminator} | [ \t\f]

Comments = {TraditionalComment} | {EndOfLineComment}
TraditionalComment = "/*" [^*] ~"*/" | "/*" "*"+ "/"
EndOfLineComment = "//" {InputCharacter}* {LineTerminator}?

Letter = [A-Za-z_]
Digit = [0-9]

Identifiers = {Letter}({Letter}|{Digit})*

Integers = {Digit}+

Fraction = \.{Digit}+
Exponent = (E|e)(\+|\-)?{Digit}+
Floats = {Digit}* {Fraction} {Exponent}? | {Digit}+\. | {Digit}+ \.? {Exponent}

Booleans = "true"|"false"

EscapeSequences = \b|\f|\n|\r|\t|\'|\"|\\
Strings = \"([^\r\n\"\\]*)\"

Keywords = boolean|float|int|string|else|for|if|return|void|while|break|continue

ArithmeticOperators = \+|\-|\*|\/
RelationalOperators = \<|\<=|\>|\>=
EqualityOperators = "=="|"!="
LogicalOperators = \|\||\&\&|\!
AssignmentOperator = "="
Separators = \{|\}|\(|\)|\[|\]|\;|\,

%{
    HashMap<String, Token> tokens = new HashMap<>();
	ArrayList<String> lexicals = new ArrayList<String>();
%}
%{
	public void printResult() {
		for (String lex : lexicals) {
			System.out.println("lexical: " + lex + "\n" + "token: " + tokens.get(lex) + "\n");
		}
	}
	
	public void saveResult() {
		try {
			File f = new File ("./output.txt");
			FileOutputStream fos = new FileOutputStream(f);
			OutputStreamWriter osw = new OutputStreamWriter(fos);
			Writer w = new BufferedWriter(osw);
			for (String lex : lexicals) {
				w.write("lexical: " + lex + "\n" + "token: " + tokens.get(lex) + "\n\n");
			}
			w.close();
		} catch (IOException ex) {
			ex.printStackTrace();
		}
	}
%}


%%
/* Lexical Rules */
{Integers} {
	lexicals.add(yytext());
	tokens.put(yytext(), Token.INT_LITERAL);
}
{Booleans} {
	lexicals.add(yytext());
	tokens.put(yytext(), Token.BOOL_LITERAL);
}
{Floats} {
	lexicals.add(yytext());
	tokens.put(yytext(), Token.FLOAT_LITERAL);
}
{Strings} {
	lexicals.add(yytext());
	tokens.put(yytext(), Token.STRING_LITERAL);
}
{Keywords} {
	lexicals.add(yytext());
	tokens.put(yytext(), Token.KEYWORD);
}
{Identifiers} {
	lexicals.add(yytext());
	tokens.put(yytext(), Token.IDENTIFIER);
}
{ArithmeticOperators} {
	lexicals.add(yytext());
	tokens.put(yytext(), Token.ARITHMETIC_OPERATOR);
}
{RelationalOperators} {
	lexicals.add(yytext());
	tokens.put(yytext(), Token.RELATIONAL_OPERATOR);
}
{EqualityOperators} {
	lexicals.add(yytext());
	tokens.put(yytext(), Token.EQUALITY_OPERATOR);
}
{LogicalOperators} {
	lexicals.add(yytext());
	tokens.put(yytext(), Token.LOGICAL_OPERATOR);
}
{AssignmentOperator} {
	lexicals.add(yytext());
	tokens.put(yytext(), Token.ASSIGNMENT_OPERATOR);
}
{Comments} {
	lexicals.add(yytext());
	tokens.put(yytext(), Token.COMMENT);
}
{Separators} {
	lexicals.add(yytext());
	tokens.put(yytext(), Token.SEPARATOR);
}

{WhiteSpace} { /* Do nothing*/ }
{EscapeSequences} { /* Do nothing*/ }

