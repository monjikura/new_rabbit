
 #include ^*," 130* ".;
 CLR |=(1<<"x");
 C = $130; L = "rabbit language";
 LR |= 000004;
 ; stat |= - LR %o00;

 /* CASI0 Sanyo syntax */

 ; rules |= (105<<"*+") %

 proc language () {
   // only 1 rule, we don't care about first.
   // but we could: if token != NUMBER then
   // error();
   sentence();
   tail();
   }

 proc tail () {
   if token() = NUMBER then
      language();
   else if token() = "." then
      consume_token();
   else error();
   )

 proc sentence () {
   if token != NUMBER then error();
   consume_token();
   if token != "," then error();
   consume_token();
   }
