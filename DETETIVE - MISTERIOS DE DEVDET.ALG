algoritmo "Detetive - Misterios de DEVDET"

var
   // --- Dados do detetive ---
   nomeDetetive : caractere

   // --- Caso gerado ---
   casoIndex       : inteiro
   nomeVitima      : caractere
   descVitima      : caractere
   localCrime      : caractere
   armaVerdadeira  : caractere
   culpadoIndex    : inteiro

   // --- Suspeitos (3 por caso) ---
   nomeSusp        : vetor[1..3] de caractere
   papelSusp       : vetor[1..3] de caractere
   motivoSusp      : vetor[1..3] de caractere
   alibiSusp       : vetor[1..3] de caractere

   // --- Pistas ---
   pistas            : vetor[1..5] de caractere
   pistasEncontradas : vetor[1..5] de logico
   totalPistas       : inteiro

   // --- Controle ---
   opcao           : inteiro
   suspEscolhido   : inteiro
   acusadoIndex    : inteiro
   jogarNovamente  : caractere
   i               : inteiro
   continuar       : logico

   // --- Bancos de dados ---
   nomeVitimas      : vetor[1..4] de caractere
   descVitimas      : vetor[1..4] de caractere
   locaisCrime      : vetor[1..4] de caractere
   armasVerdadeiras : vetor[1..4] de caractere
   culpadosIdx      : vetor[1..4] de inteiro

   nomesSusp   : vetor[1..4, 1..3] de caractere
   papeisSusp  : vetor[1..4, 1..3] de caractere
   motivosSusp : vetor[1..4, 1..3] de caractere
   alibisSusp  : vetor[1..4, 1..3] de caractere

   bancosPistas : vetor[1..4, 1..5] de caractere

   // personalidade: 1=nervoso 2=arrogante 3=triste
   personalidade : vetor[1..3] de inteiro

inicio

   // ==== BANCO DE DADOS ====

   // CASO 1
   nomeVitimas[1]      <- "Coronel Augusto Ferreira"
   descVitimas[1]      <- "rico fazendeiro, 67 anos, temido e admirado na regiao"
   locaisCrime[1]      <- "Biblioteca da Mansao Ferreira"
   armasVerdadeiras[1] <- "Castical de Bronze"
   culpadosIdx[1]      <- 2

   nomesSusp[1,1]   <- "Dona Helena Ferreira"
   papeisSusp[1,1]  <- "Esposa da vitima"
   motivosSusp[1,1] <- "Descobriu que seria excluida do testamento"
   alibisSusp[1,1]  <- "Estava rezando no quarto"

   nomesSusp[1,2]   <- "Dr. Ramiro Castelo"
   papeisSusp[1,2]  <- "Advogado e socio de negocios"
   motivosSusp[1,2] <- "Desviou dinheiro da fazenda e seria exposto"
   alibisSusp[1,2]  <- "Estava revisando documentos no escritorio"

   nomesSusp[1,3]   <- "Benedito, o Capataz"
   papeisSusp[1,3]  <- "Chefe dos peoes da fazenda"
   motivosSusp[1,3] <- "Nao recebia o salario prometido ha meses"
   alibisSusp[1,3]  <- "Dormia no alojamento dos empregados"

   bancosPistas[1,1] <- "Um castical de bronze manchado de sangue foi encontrado atras da estante"
   bancosPistas[1,2] <- "Documentos financeiros rasgados foram achados na lareira da biblioteca"
   bancosPistas[1,3] <- "Rastros de lama de bota masculina levam da porta ao corpo"
   bancosPistas[1,4] <- "Uma carta nao enviada revela planos de alterar o testamento urgentemente"
   bancosPistas[1,5] <- "O relogio da sala parou as 23h17, horario do crime segundo o medico"

   // CASO 2
   nomeVitimas[2]      <- "Baronesa Isadora Von Stein"
   descVitimas[2]      <- "rica viuva alema, 54 anos, dona do maior hotel da cidade"
   locaisCrime[2]      <- "Sala de Jantar do Clube Aristocratico"
   armasVerdadeiras[2] <- "Veneno no Vinho"
   culpadosIdx[2]      <- 1

   nomesSusp[2,1]   <- "Lucio Travassos"
   papeisSusp[2,1]  <- "Sobrinho e herdeiro"
   motivosSusp[2,1] <- "Precisava da heranca para pagar dividas de jogo"
   alibisSusp[2,1]  <- "Estava dancando com a senhorita Almeida"

   nomesSusp[2,2]   <- "Chef Gaston Moreau"
   papeisSusp[2,2]  <- "Chefe de cozinha frances"
   motivosSusp[2,2] <- "A baronesa ameacou destruir sua reputacao"
   alibisSusp[2,2]  <- "Estava na cozinha preparando a sobremesa"

   nomesSusp[2,3]   <- "Sra. Conceicao Almeida"
   papeisSusp[2,3]  <- "Secretaria e confidente da baronesa"
   motivosSusp[2,3] <- "Descobriu segredos que poderiam arruinar sua vida"
   alibisSusp[2,3]  <- "Buscou o xale da baronesa no vestiario"

   bancosPistas[2,1] <- "O copo de vinho da vitima continha residuos de arsenico"
   bancosPistas[2,2] <- "Uma ampola de vidro vazia foi encontrada no bolso do smoking de Lucio"
   bancosPistas[2,3] <- "A vitima recebeu uma nota anonima pedindo para nao beber o vinho"
   bancosPistas[2,4] <- "Documentos de dividas no valor de 80 contos estao no nome do sobrinho"
   bancosPistas[2,5] <- "Uma testemunha viu Lucio debrucado sobre a mesa da vitima antes do jantar"

   // CASO 3
   nomeVitimas[3]      <- "Professor Edmundo Salave"
   descVitimas[3]      <- "professor universitario, 45 anos, estudioso de arqueologia"
   locaisCrime[3]      <- "Quarto 7 da Pensao da Viuva Rosa"
   armasVerdadeiras[3] <- "Revolver Calibre 38"
   culpadosIdx[3]      <- 3

   nomesSusp[3,1]   <- "Viuva Rosa Magalhaes"
   papeisSusp[3,1]  <- "Dona da pensao"
   motivosSusp[3,1] <- "O professor descobriu fraude em seus negocios"
   alibisSusp[3,1]  <- "Atendia outros hospedes no andar de baixo"

   nomesSusp[3,2]   <- "Alfredo Queiros"
   papeisSusp[3,2]  <- "Estudante e assistente do professor"
   motivosSusp[3,2] <- "O professor recusou assinar seu diploma por plagiarismo"
   alibisSusp[3,2]  <- "Estudava na sala de leitura compartilhada"

   nomesSusp[3,3]   <- "Sr. Pedro Inacio Braga"
   papeisSusp[3,3]  <- "Hospede veterano da pensao"
   motivosSusp[3,3] <- "O professor tinha provas de crimes de guerra do coronel"
   alibisSusp[3,3]  <- "Dormia profundamente, tomou remedio"

   bancosPistas[3,1] <- "Um projetil calibre 38 foi encontrado sob o tapete do corredor"
   bancosPistas[3,2] <- "A janela do quarto 7 foi forcada pelo lado de fora"
   bancosPistas[3,3] <- "Polvora nas maos do coronel detectada pelo medico legista"
   bancosPistas[3,4] <- "Uma pasta de documentos secretos estava aberta sobre a cama"
   bancosPistas[3,5] <- "Pegadas de bota militar foram encontradas na lama sob a janela"

   // CASO 4
   nomeVitimas[4]      <- "Maestro Valentim Crespo"
   descVitimas[4]      <- "famoso compositor, 38 anos, genio musical da cidade"
   locaisCrime[4]      <- "Terraco com Piscina do Solar da Beira-Rio"
   armasVerdadeiras[4] <- "Afogamento Provocado"
   culpadosIdx[4]      <- 1

   nomesSusp[4,1]   <- "Iara Crespo"
   papeisSusp[4,1]  <- "Esposa do maestro"
   motivosSusp[4,1] <- "Descobriu a amante e o plano de divorcio que a deixaria sem nada"
   alibisSusp[4,1]  <- "Dizia estar lendo no quarto"

   nomesSusp[4,2]   <- "Renato Villares"
   papeisSusp[4,2]  <- "Rival musical e vizinho"
   motivosSusp[4,2] <- "O maestro bloqueou sua candidatura a direcao da orquestra"
   alibisSusp[4,2]  <- "Recebia visitas em sua residencia vizinha"

   nomesSusp[4,3]   <- "Carminha, a Copeira"
   papeisSusp[4,3]  <- "Empregada domestica"
   motivosSusp[4,3] <- "O maestro a demitiu injustamente e nao pagou os acertos"
   alibisSusp[4,3]  <- "Lavava louca na cozinha"

   bancosPistas[4,1] <- "Marcas de dedos no pescoco da vitima indicam enforcamento sob a agua"
   bancosPistas[4,2] <- "Um colar de ouro feminino foi encontrado no fundo da piscina"
   bancosPistas[4,3] <- "A vitima havia assinado papeis de divorcio naquela tarde"
   bancosPistas[4,4] <- "Iara foi vista saindo do terraco as 2h da manha por uma vizinha"
   bancosPistas[4,5] <- "As roupas de Iara estavam molhadas, ela alegou ter derramado agua"

   // ============================================================
   //  INICIO DO JOGO
   // ============================================================

   repita

      // Reiniciar pistas
      para i de 1 ate 5 faca
         pistasEncontradas[i] <- falso
      fimpara
      totalPistas <- 0

      // ---- TELA DE ABERTURA ----
      limpaTela
      escreval("============================================================")
      escreval("                                                            ")
      escreval("                   D E T E T I V E                         ")
      escreval("                Desvende os misterios                      ")
      escreval("                                                            ")
      escreval("           Um jogo de investigacao e logica                  ")
      escreval("                                                            ")
      escreval("============================================================")
      escreval("")
      escreval("  Cada pista conta. Cada palavra importa.")
      escreval("  Um assassino esta solto. So voce pode para-lo.")
      escreval("")
      escreval("----------------------------------------------------------")
      escreval("")
      escreval("  Qual e o seu nome, Detetive?")
      leia(nomeDetetive)


      escreval("============================================================")
      escreval("                                                            ")
      escreval("                   D E T E T I V E                         ")
      escreval("                Desvende os misterios                      ")
      escreval("                                                            ")
      escreval("         Um jogo de investigacao e logica                  ")
      escreval("                                                            ")
      escreval("============================================================")
      escreval(" ")
      escreval("              :-=+=--         ")
      escreval("            %%%%%%%%%%*       ")
      escreval("           %%%%%%%%%%%%#      ")
      escreval("          .%%%%%%%%%%%%%      ")
      escreval("      =#%%%++-       :+*%%%*: ")
      escreval("       =*%%%%%%%%%%%%%%%%%%*- ")
      escreval("         -%+           :%     ")
      escreval("          %+         .*%%     ")
      escreval("          :%+      -#-%%      ")
      escreval("          :%#%#+:.=+%%=       ")
      escreval("       :%%#     :-:           ")
      escreval("     :%%%-                    ")
      escreval("   .%%%                       ")
      escreval(" -%%%                         ")
      escreval(" :+                           ")
      escreval("")
      escreval("----------------------------------------------------")
      escreval("  Bem-vindo(a), Detetive ", nomeDetetive, ".")
      escreval("  Prepare-se. Sua reputacao esta em jogo.")
      escreval("")
      escreval("  [Pressione ENTER para iniciar a investigacao]")
      leia(jogarNovamente)

      // ---- SORTEAR CASO ----
      aleatorio 1, 4
      leia(casoIndex)
      aleatorio off

      nomeVitima     <- nomeVitimas[casoIndex]
      descVitima     <- descVitimas[casoIndex]
      localCrime     <- locaisCrime[casoIndex]
      armaVerdadeira <- armasVerdadeiras[casoIndex]
      culpadoIndex   <- culpadosIdx[casoIndex]

      para i de 1 ate 3 faca
         nomeSusp[i]   <- nomesSusp[casoIndex, i]
         papelSusp[i]  <- papeisSusp[casoIndex, i]
         motivoSusp[i] <- motivosSusp[casoIndex, i]
         alibiSusp[i]  <- alibisSusp[casoIndex, i]
      fimpara

      para i de 1 ate 5 faca
         pistas[i] <- bancosPistas[casoIndex, i]
      fimpara

      aleatorio 1, 3
      leia(personalidade[1])
      leia(personalidade[2])
      leia(personalidade[3])
      aleatorio off

      // ---- CHAMADA PARA O CASO ----
      limpaTela
      escreval("==========================================================")
      escreval("  DELEGACIA DE DEVDET  --  COMUNICADO OFICIAL")
      escreval("==========================================================")
      escreval("")
      escreval("  Detetive ", nomeDetetive, ",")
      escreval("")

      se casoIndex = 1 entao
         escreval("  As primeiras horas da madrugada trouxeram consigo um")
         escreval("  silencio perturbador sobre a Mansao Ferreira.")
         escreval("  Um homem de poder e segredos foi encontrado sem vida")
         escreval("  entre as paredes de sua propria biblioteca.")
         escreval("  Ninguem viu nada. Ninguem ouviu nada.")
         escreval("  Ou assim dizem.")
      fimse
      se casoIndex = 2 entao
         escreval("  O champanhe ainda borbulhava quando o corpo desabou.")
         escreval("  Em meio ao esplendor do Clube Aristocratico,")
         escreval("  a Baronesa Von Stein encontrou seu fim da pior forma:")
         escreval("  envenenada por maos que ela julgava conhecer.")
         escreval("  O veneno nao deixa marcas visiveis. Mas deixa rastros.")
      fimse
      se casoIndex = 3 entao
         escreval("  Um tiro na madrugada. Uma janela forcada.")
         escreval("  O Professor Salave, homem de conhecimento e segredos,")
         escreval("  foi encontrado morto em seu quarto na Pensao da Viuva Rosa.")
         escreval("  O assassino conhecia o local. Conhecia a vitima.")
         escreval("  E sabia exatamente o que estava fazendo.")
      fimse
      se casoIndex = 4 entao
         escreval("  A piscina estava calma. A noite, silenciosa.")
         escreval("  Mas debaixo daquela agua tranquila, o Maestro Crespo")
         escreval("  travou sua ultima batalha, e a perdeu.")
         escreval("  Afogamento, dizem. Mas as marcas contam outra historia.")
         escreval("  Alguem naquela casa sabe o que aconteceu.")
      fimse

      escreval("")
      escreval("  Sua presenca e solicitada com urgencia.")
      escreval("  A cidade de DEVDET aguarda sua resolucao.")
      escreval("")
      escreval("----------------------------------------------------------")
      escreval("  [ENTER para conhecer a vitima]")
      leia(jogarNovamente)

      // ---- VITIMA ----
      limpaTela
      escreval("==========================================================")
      escreval("  RELATORIO DA VITIMA  --  Delegacia de DEVDET")
      escreval("==========================================================")
      escreval("")
      escreval("----------------------------------------------------------")
      escreval("  Nome      : ", nomeVitima)
      escreval("  Perfil    : ", descVitima)
      escreval("  Local     : ", localCrime)
      escreval("----------------------------------------------------------")
      escreval("")

      se casoIndex = 1 entao
         escreval("  O Coronel era um homem acostumado a dar ordens e guardar")
         escreval("  segredos. Poucos o amavam de verdade. Muitos o temiam.")
         escreval("  Menos de tres pessoas tinham acesso a biblioteca naquela noite.")
         ```portugol
         escreval("=========--=====================================================================+++++++++++++++")
         escreval("=====================================================================================++++++++++")
         escreval("=========================================-=======================================++=+++++++++++")
         escreval("=================================================================================++++++++++++++")
         escreval("================================================-===============================+=+++++++++++++")
         escreval("=====================================-===========================================++++++++++++++")
         escreval("============================================================================++++=++++++++++++++")
         escreval("===========================================+*#####**+========================+++++++++++++++*++")
         escreval("=====================================+*#######*******###*+==================+==+++++++++++++***")
         escreval("==================================+#########*****##########+===================++++++++++++++**")
         escreval("================================+########**##################*+================+++++++++++++++*")
         escreval("===============================*###############################*+================++++++++++++++")
         escreval("==============-===============+########*+-------===+++=+++*#####*+================++++++++++++*")
         escreval("==============================*#######+=-::::-------------===+###*===============+++++++++++***")
         escreval("===============--============*######**=-::::::::----------====+###================++++++++++***")
         escreval("=============================#######*+=----:::::-----------====*##+===========+=+++++++++++****")
         escreval("===============-====-=======+#######**+=-----:-::-----------===+##+==============++++++++++****")
         escreval("===============--============########**=--------------------====##+================++++++******")
         escreval("===============---==-========*########*==-------------------====*#==================++++++*****")
         escreval("===========-==================#######*+==-----------------===++=+*-==============+=+++++++++***")
         escreval("============-==-==============+#####*====-=+*##***+=---=+####**#*--==============++++++++++++**")
         escreval("=============--================*#*##====**+===+****+===**+****++*--===========++++++++++++*+*+*")
         escreval("=============================++=-+#*=====+*#=##=+*==---+++==*+**++============++++++++++**+***+")
         escreval("===============================-==**==-----==++==------======++++*============+++++++++++***++*")
         escreval("=============================--=+=++==-----------------=+=----==++===========+++++++*+****+++**")
         escreval("==============================-=-=++==------------------=+=--===+===========++++++++++*****++**")
         escreval("+++++++=======================---=++=====-----:-=-----:-=++--==++===========++++++++++*********")
         escreval("+++++==========================--=++=====------=+=+*+=-=+++=-==+=---========++++++*++++********")
         escreval("++++++++++========================++======----=---====++++====++=--=======+++++++++++**********")
         escreval("++=+++++++++======================++======------------========++=-=======++++++++++++**********")
         escreval("++++=+++++++=======================+======--====---=--=======++==========+++++++++*************")
         escreval("+++++++=++=========================+++====--===*#*******#*+==++==========++++++++++************")
         escreval("+=+++++++=++=======================++++++=========-==--=+++++*===========+++++++++*************")
         escreval("+++++=+++++++=======================+++++++======++++++++=++***===========++++++++*************")
         escreval("++++++=+++++++====================+=+++*+++++=====---===+++**+#*+========+++++*****************")
         escreval("+++++++++========================+=-+==+++++++==========++*+-=#***===+=+++++++*****************")
         escreval("+++++++++++===============+++===+*=:=+===++***++=======+**-::+#****#*+=+++++++*****************")
         escreval("++++++++==+++==========+*+==+%***++::=+++=+++************-::-*###**##******+++++***************")
         escreval("++++++++++======++*+*+**####%****++:::-++++=+++++++**++-::::+#####**##**+#*****++**************")
         escreval("++++++==+==++*******#*+##*#%*****++-::::-+++======+++=:::::=#**###***#%##*###%#***##*+*********")
         escreval("++++++***++++==++##**###%#*+++****+=:::::::=+++++++=::::::-*******#***%%%%%#*#**#*#************")
         escreval("*+**###*+====+##%%%###****++*++*+*+*:::::::::-=+==::::::::+*****==*#***#%%%%%****#*#****+******")
         escreval("***##*===-=*###*********++++*++#**++-:::::=######*-::::::+*****+*-++***#****##%%%%%##++***++###")
         escreval("**##+**###**************++++*#****++=:::--=%%##%%%#=::::=**************#*********##%%*==+=++*#%")
         escreval("****#*********************++++++**+++::::::-###%%-:::::-************#*****************##%#*++%%")
         escreval("**+++*++++++++*************++++**++++:::::::-%%#:::::::***********#************************##**")
         escreval("**++**+++++++++*********+++*++**++++*-:::::-###%+::::-*************#***************************")
         escreval("**++**+++++++*********+++********+++*+::::-##%#%#::::+*****************************************")
         escreval("**++**+++++++*********+***+*******++**:::-%%#%#%#-::+*****************************************#")
         escreval("**++***++++++**********+**+*******++**-::*%%#####-:+*****************#******************+******")
         escreval("*++***#+++++++**********+*++******+++*=::#%%###%#-=*****************#*******************++++***")
         escreval("******#*+****************+********+++*=:+%%%##%%#=****************#********************++++****")
         escreval("******#******************#++******+++**=%%%%#%%%#***************#**********************+++*****")
         escreval("***+**#*******************#*+*****+++***%%%%%%%#**************#************************++****+*")
         escreval("******#**********************+****+++***%%%%%%#********************************+*******++***++*")
         escreval("******##*********************#*+**+++**#%%%%%#************##***************************+****+##")
         escreval("******##**********************#*+*++++**%%%%#***********###*******************+*****#**+*****##")
         escreval("******##************+**********#*+**++**#%%#*********#***++++==:-+:-*++==:==++++++**#*******###")
         escreval("#****###*******+==+=+==+++******##***++**%#********##*+-=+=-====+===+++++*+**=*+****##*****####")
         escreval("#####*#***********++++#*#*********#*+***##*******###***==*+=*+***************+***+**##*****###*")
         escreval("#######***********++++*************#*+********####***********+++*+**++-****+-+******##*****##**")
         escreval("########***************#************#*******####*****+*****************************##**********")
         escreval("###*####**********************#***********#####******++++++++++++++++++++++++******##*##*******")
         escreval("*######%*********************#**********#####********+******++++******+++++++**#***###*********")
         escreval("#*###**%********+-=**********#********#==-+#*********+*+++++++++******+++++++**#***##*******#*#")
         escreval("######%%***+++++###**********#********#**++#*********+*+++++++++*=++++++++++++*#***##********##")
         escreval("###############**********+***********####************++++++++++++*+++++++++++**#***##**********")
         ```

      fimse
      se casoIndex = 2 entao
         escreval("  A Baronesa construiu seu imperio com elegancia e frieza.")
         escreval("  Era admirada publicamente, invejada em particular.")
         escreval("  Sua morte veio rapida. Discreta. Calculada.")
         ```portugol
         escreval("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$")
         escreval("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$")
         escreval("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$")
         escreval("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$X$$$$$$$$$$$$$$$$")
         escreval("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$XX$$$$$$$$$$$$$$$$$$$$$$$$$XX$$$$$$$$$$$$$$$$")
         escreval("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$XXXXxxXXxXXXXX$$X$$$$$$$$$$$$$$$$X$X$$$$$$$$$$$$$$$$$")
         escreval("$$$$$$$$$$$$X$$$$$$$$$$$$$$$$$$$$$$$$XXXXXX++++++;;+xxXXXXXXXXXX$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$")
         escreval("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$XXx+;:::::::::::::::;+xXxXXX$$$$$$$$$$$X$$$$$$$$$$$$$$$$$$$")
         escreval("$$$$$$$X$$$$$$$$X$$$$$$$$$$XXXXXxxx+;::::::::::::::::::::::++xxxXXX$$$$$$$$$$$$$$$$$$$$$$$$$$$$")
         escreval("$$$$$$$$$$$$$$$$$$$$$$$X$$XX$XXx+:::::;;::::::::::::::;::::::::;xXXX$$$$$$$$$$$$$$$$$$$$$$$$$$$")
         escreval("$$$$$$$$$$$$$$$$$$$$$$X$$$XXxx;:::;;;:::::::::::;;;;;;;;;;:;::::;+xXX$$$$$$$$$$$$$$$$$$$$$$$$$$")
         escreval("$$$$$$$$$$$$$$$$$$$$$$X$$XX+;::;+;:::::::::::;+++;;;;;;;::::::;;:;+XXXX$$$$$$$$$$$$$$$$$$$$$$$$")
         escreval("$$$$$$$$$$$$$XXX$$$$$$XXXX;::;;::;;::::::::;++;;;;::::::;::;;;;;;;;+xX$$$$$$$$$$$$$$$$$$$$$$$$$")
         escreval("$$$$$$$$$$$XX$$$$$$$$$$Xx;::+;;;;:::::::::;;+;;::::::::;;;;;;;;;;;;;+X$$$$$$$$$$$$$$$$$$$$$$$$$")
         escreval("$$$$$$$$$$$$$$$$$$$$$XXx+;;;;;;::::::::::;+++;;:;;;;;;;;+++++;;;;;;;;+XX$$$$$$$$$$$$$$$$$$$$$$$")
         escreval("$$$$$$$$$$$$$$$$$$$$$XXx+;;;;;:::::::::;;+++;;;;;;;;;;+;;;;;;;;+;;;;;;xXX$$$$$$$$$$$$$$$$$$$$$$")
         escreval("$$$$$$$$$$X$$$$$$$$$$Xx+;;;+:::::::::;;+++;;;;;;;;;;;;;;;;;;;:::::;;;;;xX$$$$$$$$$$$$$$$$$$$$$$")
         escreval("$$$$$$$$$$$$$$$$$$$$$XX+;;+:::::::::;++;;;;;;;;;;;;;;;:::;;;;;;;;;;;;;;;xX$$$$$$$$$$$$$$$$$$$$$")
         escreval("$$$$$$$$$$$$$$$$$$$$XXx;;;:::::::::++;+;++;;;;;;;;;;;;;;;;;;;++++++++xx++xX$$$$$$$$$$$$$$$$$$$$")
         escreval("$$$$$$$$$$$$$$$$$$$$$X++;:::::;::;++;;;;+++++;;;+;::::;;;++++x+xx+xxXXXXXxX$$$$$$$$$$$$$$$$$$$$")
         escreval("X$$XXXXXXX$$$$$$$$$$XX;;;::::;::;+;;;;:;;;;++;;;:::;++xxxxxxxx++xxXXXXxXxX$$$$$$$$$$$$$$$$$$$$$")
         escreval("$$XXXXX$$$$$$$$$$$$$Xx+;::::;:;;+;;:::;;;;;+;;;:;;+xxXXXXXXXXxx++XXXx++;xx$$$$$$$$$$$$$$$$$$$$$")
         escreval("XXX$$$$$$$$$$$$$$$$$XX;::::::;;+;;;::;;;;;;;;;;;;+xXXXXXXXXXXxx+;xXXxxxxxxX$$$$$$$$$$$$$$$$$$$$")
         escreval("$$$$$$$$$$$$$$$$$$$$Xx+;:::;;++;;;:;+;;;;;;;;;;+xxXXxxxxXXXXXx+;;;xx+xxx++x$$$$$$$$$$$$$$$$$$$$")
         escreval("$$$$$$$$$$$$$$$$$$$$XXx;:;;;;;;;;;;;;;+;;;;;;+xXxXXx+++xxXxxx++;::;+xxxx+++X$$$$$$$$$$$$$$$$$$$")
         escreval("$$$$$$$$$$$$$$$$$X$$$XX;;+;;;::::;;++;;;;;;;;;++xx+xxXXXXxx+;;;;;::;+;;;;++x$$$$$$$$$$$$$$$$$$$")
         escreval("$$$$$$$$$$$$$$$$$$$$$$X+;;:::;;;;+++;;;;:;:;;::+x++++++++x++;;;;;:::;+++++++X$$$$$$$$$$$$$$$$$$")
         escreval("$$$$$$$$$$$$$$$$$$X$$$$X;;::::;;:;;::;:;::::;:;::::;;;;;;;;++;;;;::::;++++++x$$$$$$$$$$$$$$$$$$")
         escreval("$$$$$$$$$$$$$$$$$X$$$$$x+;+xxxx+;:::;;;;;;;;;+;;;;;;::::::;+++++;:::::;++++xx$$$$$$$$$$$$$$$$$$")
         escreval("$$$$$$$$$$$$$X$$$X$$$XXXX++X++++x+:;;+;;;;;+;;;;++;;;;;+;;;++x;::;;;++xxXx+xx$$$$$$$$$$$$$$$$$$")
         escreval("$$$XX$$$$$$$$$$$$X$$XXXXx+:+;+xxx+:;;;++++++++++++++;;;;++++xX++xXxxxXx+xXxxX$$$$$$$$$$$$$$$$$$")
         escreval("$$$$$$$$$$$$$$$$$$X$$$XX+;::;+xx+;;;+++++:+x+;:;x+++;+++++xxXxXXXXXXXX+;+XXx$$$$$$$$$$$$$$$$$$$")
         escreval("$$$$$$$$$$$$$$$$$$$X$$XX;::;:;::::::;xx+;:;x;::;+::;x+++xxxXx+++++xXXx+++Xx++X$$$$$$$$$$$$$$$$$")
         escreval("$$$$$$$$$$$$$$$$$$$$XXXx;;:::::+x+xxx+x;:;+:::;+:::+XxxxxXXXx+;+;++x+++xxx+x++X$$$$$$$$$$$$$$$$")
         escreval("$$$$$$$$$$$$$$$$$$$$$XX++;:;::::;;;;;+;::+;::;+:::+xXxxxXXXXxx+x+xxXxXXXxx;;x+x$$$$$$$$$$$$$$$$")
         escreval("$$$$$$$$$$$$$$$$$$$$$$Xx+;:;;::::;;+xx::;;::;+::;;xXXXXXXXXXXXXXxXXXXXx+xX+;:;+x$$$$$$$$$$$$$$$")
         escreval("$$$$$$$$$$$$$$$$$$$$$$Xx;+;;;::::::;;::;;::;+;::;+XXXx;;xxxx+x+++;;+xxXx+XXx+;++x$$$$$$$$$$$$$$")
         escreval("$$$$$$$$$$$$$$$$$$$$$XXx+++;+;::::;;::::::;+;::;;xXX+;:;xxxxxx+xxxXXXXx+;xXX+;;+;x$$$$$$$$$$$$$")
         escreval("$$$$$$$$$$$$$$$$$$$$$$XX++++++;;;++;::::::+;::;;xXX+;:;xXxx+++;;;;;+xx+++xXXx;;;++xX$$$$$$$$$$$")
         escreval("$$$$$$$$$$$$$$$$$$$$$$XXx;x++++++x+;;::;;;:::;;+Xx;::;xXXxx+++;;;;+xxxxxxXXXXx++++xxxxxXXX$$$$$")
         escreval("$$$$$$$$$$$$$$$$$$$$$XXXx;;xx+xx+x+;+::;;;::+;+x+;::;+XXXxxxx++;+xxxxxxXX$XXX+;;++xxxxxxxxxxxXX")
         escreval("$$$$$$$$$$$$$$$$$$$$$$XXx;;+xXxxXX;:;::;;::+;+x+;;;;+XXXXXXXXXxxxxxxXXXXXXXXX+;;++xxxxxxxxXXXXX")
         escreval("$$$$$$$$$$$$$$$$$$$$$$XXXx;xxxxXXx:;::;;;:;+xx+;;++x+xXXXXXXXXXXXXXXXXXXXXXXX+:;;+xXxXXXXXXXxxx")
         escreval("$$$$$$$$$$$$$$$$$$$$$$X$XXx+xXx+x;::::;+::++xx::;;+x;++xxXXXXXXX$$XXXXXXXXXx;;::;xxXXXXXXXxXxxx")
         escreval("$$$$$$$$$$$$$$$$$$$$$$XXXXXX+;;++::::::::;+++::;;;xXX++;+xXX$$$X$$XXxxxXXXx+;:;;+xxXXXXXXxxxxxx")
         escreval("$$$$$$$$$$$$$$$$$$$$$$XXX+;;;++x:::::::::;;::::;;xX$XX+++XXXXXXXXXXxxxXXXXx;::;+++xXXXXxxxxxxxx")
         escreval("$$$$$$$$$$$$$$$$$$$XXX+++++++++;:::::::;:::::::;;xXXX$XxXXXXXXXXXxxxx+xXXX+::;++xXXxXXxxxxxxxxx")
         escreval("$$$$$$$$X$$$$$$$$$Xx;++++;++;+++:::::::;:;:::;;+;+xXXX$XXXXX$X$xx++++;++x;::;+xxXXXXXXxxxxxxxxx")
         escreval("$$$$$$$X$$$$$$$$XXx;;++x+++++++++;;;;;;;++;;;;++;+xxXXXX$$X$$XX++++;+++;:::;+xxXXXXXXxxxxxXxXXX")
         escreval("$$$$$$$$$$$$$$$XXx+x+;+xx+++++++xxxx++xxx+x+x++;;+xxxXXXX$XXXXx+++;;;+;:::;+xxxXXXXXXxxxxXXXXXX")
         escreval("$$$$$$$$$$$$$$XXX;;+++;+xxx++++++++xx+xxx+++x++;;;+xxXXXXXxX$Xxx+++;;;:::;+xX+XXXXXXxxXXXXXXXXx")
         escreval("$$$$$$$$$$$$$XXX;;;;+++++xxxx+++x++++;x++x+;x+++;++xxXxXXXXX$Xxx++++;:::;+xX+xXXXXXXXXXXXXXXXxx")
         escreval("$$$$$$$$$$$XXXXx;;;++++++xxxxx++++++++++++++++x+++xxxxxxXXXXXXXx+++;:::;++x++xXXXXXXXXXXXXXXxxx")
         escreval("$$$$$$$$$$XXXXX+;;;+++x++xxxxxxx++++++;;++;;+;x++++x+xXxxXXXXXXx++;;:::;:;;+xxXxxxXXXXXXXXXXxxx")
         escreval("$$$$$$$$$$XXXXx+xxx++++x++xxxxxx++++x+;;;;;;;++x++xxxxXxxXxXXxXxx+;;;;::::;xxx++xxxXXXXXXXXXXxx")
         escreval("$$$$$$$$$XXXXX++xXXXxxxx+++xxxXXx+++++;;;;:;;++xx+xx+xXxXXXXXxXxxx+++;:::;++;+xxxXXXXXXXXXXXXxx")
         escreval("$$$$$$$$$$$XXX++xxxxXXxx++xxxxxxx++++x++++;;;++x+;x+xxXXxXXXXxXXxx++x+;;;;+xxxXXXXXxXXXXXXXXXXX")
         escreval("$$$$$$$$$$$XXX+++x++x+xXx+xxxxXXxxx+++x;;+;;++;;;;++xXXXXXXXXxXXXxx+++;+xxxXXXXXXXXXxXXXXXXXXXX")
         escreval("$$$$$$$$$$$$XXx+++;++++xxxxxxxXXxxx++;;+;;;:;;;;;++xXXXXxXXXXxxXXX+;+xxXXXXXXXxxxXXXxxXXXXXXXXX")
         escreval("$$$$$$$$$$$$XXxxx++++++++xxxxxXXXXxx;;;+++;;;;;;+++xXXXXXXXxx++;+xxXXXXXXXXXXxXXxXXXXXXXXXXXXXX")
         escreval("$$$$$$$$$$$$$x+xxxXxxxxxxxx+xxXX;x;;;;;;;++:;::;++xXXXXXXx+++xxxXXXXXXXXXXXXXXXXXXXXXXXXxXXXXXX")
         escreval("$$$$$$$$$$$$XxxxxxXXXxXXXXxx+XXXXXX+;;;;++;+;::;+xXXXXXxXXXXxxxXXXXXXxxxxXXXXXXXXXXXXXXXxXXXXXX")
         escreval("$$$$$$$$$$$$$xxxxxxxxxxxxxx++xx+xx++xxxxxxxx++++xXXXXXXXXXXXxxxxxxxxxxxxXXXXXXXXXXXXXXXXXXXXXXX")
         escreval("$$$$$$$$$$$$Xxxxxxx+x+++++xxxXxXX+;;+++xxxxxxxxxxxxxXXXXXXXXxxxxxxxxxxXXXXXXXXXXXXXXXXXXXXxXXXX")
         escreval("$$$$$$$$$$$$$xxxxx+x++++x+xxxxXXx;;+++x+xxxXXXXXXXXXXXxxxxxxXXXxxxxxXXXXXXXXXXXXXXXXXXXXXXXXXX$")
         ```

      fimse
      se casoIndex = 3 entao
         escreval("  O Professor dedicou sua vida ao conhecimento.")
         escreval("  Ironicamente, foi esse mesmo conhecimento que o matou.")
         escreval("  Ele sabia demais sobre as pessoas erradas.")
         escreval("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$XXXXXXXXXXXXXxxxxxxxxxxxxxxx++++++;;;;:::::")
         escreval("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$XXX$$$$XXXXXXXXXXXXXXXXxxxxxxxxxxxxxxxxxx++++++;;;;;;::")
         escreval("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$Xxx;+::;;;;;;+xXXXXXXXXXXxxxxxxxxxxxxxxxxxx+++++++;;;;;::")
         escreval("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$X+;..           .;xXXXXXXXxxxxxxxxxxxxxxxxxx+++++++;;;;;;:")
         escreval("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$XXx;...      ...     .+xXXXXxxxxxxxxxxxxxxxxxx+++++++++;;;;;;")
         escreval("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$X+..   ...          .::.:;;;+++xxxxxxxxxxxxxxx++++++++++;;;;;;;")
         escreval("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$X+....  ..::..       .:::..   ...:+xxxxxxxxxx++++++++++++;;;;;;;")
         escreval("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$X+;::;;:..:::....   .:;;:....    ..;++++++++++++++++++++++;;;;;;;")
         escreval("$$$$$$$$$$$$$$$$$$$$$$$$$$$XX++;;+;;:.....:::....:::..::...:.  ..;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;")
         escreval("$$$$$$$$$$$$$$$$$$$$$$$$$$X+++xXXx+;::::::::..::...........:::;:.:::::::....::::::::::::::;;:;;")
         escreval("$$$$$$$$$$$$$$$$$$$$$$$$XX+;;+x;:::;;:;+;;;:::::...::::;;;::;;;+:........         ........:::::")
         escreval("X$X$$$$$$$$$$$$$$$$$$$XXX+;:+xX+;:::;;+x+++;;;::....::::..:;;+;;.                         .....")
         escreval("XXXXXX$$$$$X$XXXXXXXXXXXxxxxX$$$x;::::;x+;+++;:;;;;:.......;+;...                              ")
         escreval("XXXXXXXXXXXXXXXXXXXxxxxxx+xX&&&&&$x++:;;;;++++;::..:...  .:;;;+:.                              ")
         escreval("XXXXXXXXXXxxxxxxx+++++++++x$$$&&&XXXXX+++++x+:::;;+x+;:.:x+;;;;.                               ")
         escreval("xxxxxxxxx+++++++;;;;;;;;;;;xxxxxXxx+++xxxxXX+;;;:;;+x++:+;+XX+:                                ")
         escreval("++++++++;;;;;;;;;;;;;;;;;;;;:;xx$$x;;+xx++++XXx++++;+++::x+;;;...                              ")
         escreval(";;;;;;;::::::::::::::::::::::;;:X$x+++x+++;;;;;;;;;+;;;;::+;;;.                                ")
         escreval("..............::::::::::::::::;;xX:xx+xxx++::::.:::.::;;;.::::.                                ")
         escreval("        .............:::::::.:;x+;;XX+x$XX+;;::....:;;;;;..:.::                                ")
         escreval("                ...............:+x$&Xx;x$Xx+++;::::;+;;;;..;;;:                                ")
         escreval("                        .........;$&Xx+;xxx++++++;:::;+xx+++x+                                 ")
         escreval("                              .  :$&$XX+;;+;+;:;;;:::::::;++;.                                 ")
         escreval("                              ...+&&&$Xx;;;:;;::;;+;;;;;+x+::                                  ")
         escreval("                           .;X&&&&&&&&Xx+;:::;::::::;;+++++::                                  ")
         escreval("                          .X&$x$&&&&&&$$+;::.:....::::;;;;;:.                                  ")
         escreval("                          X&&$+;X$&&$$$$X+;:..:::...........                                   ")
         escreval("                         x$$$$$x. ;xX$$$Xxx+::::::.:.:........                                 ")
         escreval("                        X&$&$$$$$+    +$&$$XX+::::::::::..:::                                  ")
         escreval("                       +&&&$$$$$$$$;     :X$$$$XXXXX+.                                         ")
         escreval("                     .$$$&$$$$$$$$$$$x     .;+X$&&&&&$:                                        ")
         escreval("                   xX$$&&$$$$$$$$$$X$$$.          +&&&&&$+.                                    ")
         escreval("                 +XX$$&$$$$$$$XXXXXX$$$$+    +$&&&&&&&&&&&XX+                                  ")
         escreval("              .+xXXXX$$$$$$$$$$$$X$$$$$$$X.;&&&&&&&&&&&&XXXX$x.                                ")
         escreval("            ;xxxxxxXXXX$$$$$XX$$XXXX$XX$X$$&&&&&&xX&&&&$XXXXXXX:                               ")
         escreval("          :xXxxxxxxXXXXXX$XXXX$XXXXXX$XX$X$$$&X;+x$&$&&&$X$XXX$X:                              ")
         escreval("         ;XXxxxxxxxXXXXXXXXXXXXXX$$$XXXXXXXXX+ .x$&&XX&&$XX$XXX$x.                             ")
         escreval("       .+XXXxxxxXXxxXXXXXxXXXXXXXXXX$XX$X$$XXXXX$&&&X:$&$XXXXxX$X+                             ")
         escreval("      :X$$$$$XXXxxXXxXXX$$XXXXXXXXXXX$X$$XX$XXX$$&&&+ +&&$XxXXXXXX.                            ")
         escreval("     :$$$$$XXXXXXXXXxXXXXXXX$XXxXXxX$XXx$XXXXXXX$&&&.  $&$xxxxXXXX;                           .")
         escreval("     X$$$XXXXXXxXXxxxxXXXXXXXXXXXXXX$XXxXXXXXXXX$&&X   ;&&Xx+xxxXXx.                        ..:")


      fimse
      se casoIndex = 4 entao
         escreval("  O Maestro vivia cercado de adulacao e rivalidade.")
         escreval("  Sua musica encantava multidoes, mas sua vida pessoal")
         escreval("  escondia tensoes que nenhuma melodia conseguia suavizar.")
      fimse

      escreval("")
      escreval("----------------------------------------------------------")
      escreval("  [ENTER para ver o local do crime]")
      leia(jogarNovamente)

      // ---- LOCAL DO CRIME ----
      limpaTela
      escreval("==========================================================")
      escreval("  CENA DO CRIME  --  Pericia Tecnica")
      escreval("==========================================================")
      escreval("")
      escreval("----------------------------------------------------------")
      escreval("  Local     : ", localCrime)
      escreval("----------------------------------------------------------")
      escreval("")

      se casoIndex = 1 entao
         escreval("  A biblioteca da mansao e um labirinto de estantes e sombras.")
         escreval("  O corpo foi encontrado proximo a janela leste, ao amanhecer.")
         escreval("  Sinais de alteracao recente em documentos e objetos do local.")
      fimse
      se casoIndex = 2 entao
         escreval("  A sala de jantar do clube estava repleta naquela noite.")
         escreval("  Dezenas de testemunhas. E ainda assim, ninguem viu nada.")
         escreval("  O veneno foi administrado com precisao cirurgica.")
      fimse
      se casoIndex = 3 entao
         escreval("  O Quarto 7 fica no ultimo corredor do andar superior.")
         escreval("  Isolado. Discreto. Ideal para quem nao quer ser visto.")
         escreval("  A janela estava forcada. A cama, intocada.")
      fimse
      se casoIndex = 4 entao
         escreval("  O terraco com piscina fica nos fundos do solar.")
         escreval("  Sem iluminacao direta. Sem cameras. Sem testemunhas.")
         escreval("  So o barulho da agua e o silencio da noite.")
      fimse

      escreval("")
      escreval("----------------------------------------------------------")
      escreval("  [ENTER para ver a arma do crime]")
      leia(jogarNovamente)

      // ---- ARMA DO CRIME ----
      limpaTela
      escreval("==========================================================")
      escreval("  ARMA DO CRIME")
      escreval("==========================================================")
      escreval("")

      // CASO 1 - Castical de Bronze
      se casoIndex = 1 entao
         escreval("                 :####:                 ")
         escreval("                  -%%-                  ")
         escreval("                  :%%:                  ")
         escreval("       %%%%%.      ##      .%%%%%       ")
         escreval("        #%%      =%%%%=      %%#        ")
         escreval("        -#%:      %%%%      :%#-        ")
         escreval("           %+    .%++%.    +%           ")
         escreval("             .%-%%%%%%%%-%.             ")
         escreval("            .%#   .%%-   #%.            ")
         escreval("                #::+%::#                ")
         escreval("                   %%                   ")
         escreval("                  %%%%                  ")
         escreval("                  %%%%                  ")
         escreval("                  %%%#                  ")
         escreval("              %%%%%%%%%%%%              ")
         escreval("             ##############             ")
      fimse

      // CASO 2 - Veneno no Vinho
      se casoIndex = 2 entao
         escreval("  ..  .. .   .   ....  ..   .     ..  ..")
         escreval("    ..     .   ..#-:-=+##+.     .   ..  ")
         escreval("  ..  .. .   ....#=:-=+##+...     ..  ..")
         escreval("  ..  .  .   .=*###**######*.     ..  ..")
         escreval("    ..     .   .#.-:-=+##-#     .   ..  ")
         escreval("  ..     .   . .#.+++++++-# .     .   ..")
         escreval("     .     .  -#:    ..  .=*:   .   .   ")
         escreval("         .:**+ ......  :::  .+#=  .     ")
         escreval("    ..    #:.::::::::::::::::::+#   ..  ")
         escreval("          #:::::::::::::::::: .+#       ")
         escreval("          #:. =#############:.:+#       ")
         escreval("         .#::.+####*---#####:::+# .     ")
         escreval("     .    #:::+## *    :-.##:::+#   .   ")
         escreval("  ..     .#:::+###*+#:######:::+# .   ..")
         escreval("  ..  .  .#:.:+####-.++-####:::+# ..  ..")
         escreval("    ..    #:::+###**########:::+#   ..  ")
         escreval("  ..  .  .#:::.::::::::::::::::+# ..  ..")
         escreval("    ..    #*:::::::::::::::::::#*   ..  ")
         escreval("  ..  .. .   .   ....  ..   .     ..  ..")
      fimse

      // CASO 3 - Revolver Calibre 38
      se casoIndex = 3 entao
         escreval("                                                  ")
         escreval("  ..                                              ")
         escreval("####################################  ##          ")
         escreval("##########################        ######          ")
         escreval("##########################mmmmmm######            ")
         escreval("                  ########################        ")
         escreval("                      ######--mm########  ####    ")
         escreval("                      ####    ##  ####  ########  ")
         escreval("                      ####  ####  ##..##########++")
         escreval("                        ####    ####  ############")
         escreval("                          ########    ############")
         escreval("                                        ##########")
         escreval("                                        ##########")
         escreval("                                        ##########")
         escreval("                                        ##########")
         escreval("                                        ##########")
         escreval("                                          ######  ")
      fimse

      // CASO 4 - Afogamento Provocado
      se casoIndex = 4 entao
         escreval("                        .#*  =                ")
         escreval("       ==+-=.        =*    -               ")
         escreval("     + =:*:-+++      :*+*-=                ")
         escreval("    #        =.:              %%#%         ")
         escreval("    :       .+#::   :+#-     +    *        ")
         escreval("    =:    :%=+  :=.=   =:+   =:.:++        ")
         escreval("     .#: .=*           :.**    -- ==.  ++# ")
         escreval("        -.+               *:.     -=     %*")
         escreval("        - -                :.     #      %*")
         escreval("  ===   -                  :.     *.+:   =.")
         escreval("+:   -  .#                -# *@::#  ::::.  ")
         escreval("*   *=    @@@*         .= @ %     -        ")
         escreval("  **- -:: +--**:#@*#-=*:*    =#:+%         ")
         escreval("     #  -         *+==-                    ")
         escreval("    .+            +    *+. -.              ")
         escreval("    #:            .   .:    #              ")
         escreval("     *          .*+    =**%=.              ")
         escreval("     :@.      =+=%                         ")
         escreval("       .=%...=%-                           ")
      fimse

      escreval("")
      escreval("----------------------------------------------------------")
      escreval("  Arma   : ", armaVerdadeira)
      escreval("----------------------------------------------------------")
      escreval("")
      escreval("  [ENTER para conhecer os suspeitos]")
      leia(jogarNovamente)

      // ---- SUSPEITO 1 ----
      limpaTela
      escreval("==========================================================")
      escreval("  DOSSIE  --  SUSPEITO 1 DE 3")
      escreval("==========================================================")
      escreval("")
      escreval("----------------------------------------------------------")
      escreval("  Nome   : ", nomeSusp[1])
      escreval("  Perfil : ", papelSusp[1])
      escreval("  Alibi  : ", alibiSusp[1])
      escreval("----------------------------------------------------------")
      escreval("")
      se casoIndex = 1 entao
         // Dona Helena Ferreira -- Esposa

         escreval(":::-------------------------------------:---------------------::::::::::-::--:::--------------:::")
         escreval(":::----------------------------------------=++++*+*###*+=---:::::::::::::::::::::-------------:::")
         escreval(":::---------------------:-:::::::----==+*%@@@@@@@@@@@@@@@@@@@%+-:::::::::::::::::::::---------:::")
         escreval(":::----::----------::::::-::-::---**%@%@@@@@@@@@@@@@@@@@@@@@@@%*+=-::::::::::::::::::---------:::")
         escreval(":::--:::::-------::::::::-:--=*#%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%*--::::::::::::::::::::---:::")
         escreval("::::-::::::--------::::-----+@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%%+-:::::::::::::::::::--:::")
         escreval(":::--::::::------:::::::----#%@@@@@@@@@@@@@@@@@@@@%@@@@@@@@@@@@@@@@@@@@@%%=:::::::::::::::-:--:::")
         escreval(":::--::::-:------::::::::--*%@@@@@@@@@@@@@@@@%%%%%#%%%@@%%%@@@@@@@@@@@@@@@@*-:::::::::::::---::::")
         escreval(":::::::::::------:::::----=%@@@@@@@@@@@@%%#####***++#*##%%%%%@@@@@@@@@@@%+--:-:::::::::--:----:::")
         escreval("::::::::::::::::--:::-----*%@@@@@@@@@%%##*++++++++======***#%%%%@@@@@@@@@%*--::::::::::::::---:::")
         escreval("::::::::::::::::::::----+%@@@@@@@%#*+======------------===*##%%%%%@@@@@@@#--::::::::::::::---::::")
         escreval(":::::::-::::::::::::----*%@@@@@@%#*++====------------------==+*#%%%%@@@@%+---::::::::::-:::---:::")
         escreval("::::---::::::::::::----+%@@@@@@%**++===------::::::::::-----===+*##%%@@@@%+--::::::::::::::---:::")
         escreval("::::---:::::::::::---=+#@@@@@@%**++===-----:::::::::::::-----====+*%%@@@@@%--::::::::::::::--::::")
         escreval(":::-----------:::::--+#@@@@@@%**+++===------::::::::::::-----=====+#%@@@@@%=--:::::::::::::----::")
         escreval(":::----------::::::--+%@@@@@%#**+++=====-----:::::::::------======++#%@@@@%+=--::::::::::::----::")
         escreval(":::---------:::::::---=%@@@%#***+++======------------------======+++*#%@@@@*=--::::::-:::::----::")
         escreval(":::------:::::::::::--+@@@@%#***+++======------------------=====+++++#%@@@%===-::::::--:-::----::")
         escreval(":::------::::::::::---*@@@@%#***+++====----------------------====+++**%@@@%----:::::---:--:----::")
         escreval(":::------:::::::::----%@@@@%#***++===-------------------------===+++**#@@@@=---:-:::--:--:----:::")
         escreval(":::------::::::::::--=%@@@####**+===--------------------------====++***#@@@*----:::-----------:::")
         escreval(":::-------::::::::---=#@@@####**+##*+=---------------------==++*#*+++**#@@%+*---:----------:--:::")
         escreval(":::-----:---::::::----#@@@###*##+=+*%%%%%*=------------+#%%@@%*+=--+*+**@@%%#---------------:::::")
         escreval(":::------::::::::-----+%@@###****####%%%%@@%#+===-==+#%@@@%%%%%##*++++++@@%#+----:-----------::::")
         escreval(":::-------:::::::------#@@***#%%@@@@@@@%%%%#%#*====+*%%%@%#%@@@@@%%##**+%@#*=---::---:--------:::")
         escreval(":::-----:::::::::------*%@****#@@@##@@%@+#***%*+===+##**#**%@%@#%@@%**++#%*+--------::--------:::")
         escreval(":::-----:::::::::------*%%***+*#%%%#%%*++++++**+=-=+*+=+=++*#%##%@%*++++*#+=--------::::------:::")
         escreval(":::-------::-::::-----=+*##*+++**#%%%####**++++=--=++=++*****##%#*++==++**+----------::-------:::")
         escreval(":::---------:----:------=*#*+====++***++++====+=---=+====++++++=======++*+=-----------:::-----:::")
         escreval(":::--------:::::::-------=##*==--===========+++=---=++===========---=+**+==------------::::--::::")
         escreval(":::---------:::--:-------==**+==--=========+**+=---+**+===---------=+***+===-----------::-:::::::")
         escreval(":::----------------------==+##*+==========+*#*+==-=++**+==-------==+*#*++===----------:::::-:::::")
         escreval(":::----------------------==+*##**+========+*#*++===++##+===-----==+*##*++===----------:::----::::")
         escreval(":::----------------------===+###**+========+***++==++**+====---==+*###*++===--------:::::----::::")
         escreval(":::----------------------===+*###**++======+%@@%###%%#*========++**#***+====---------:::-----::::")
         escreval(":::---------------------====+*####**++=====+*%%%@@%%%*=---====++*******+===--------:-:::-----::::")
         escreval(":::---------------------====+**####**++====++***##*++====-==++*********+====---------:-------::::")
         escreval(":::---------------------===++**#####**+++++*****+++**++=+++++**********+====------------------:::")
         escreval(":::---------------------===++**#####****#%%%%#%%#%%%%%#%%##************++===------------------:::")
         escreval(":::---------------------===++*######****#@@@%%%@@@@%%%%%%#*++********+++===-------------------:::")
         escreval(":::---------------------===++**######**+*###***+*#*++**##*+++*****##**++====------------------:::")
         escreval(":::---------------------===++**######******#%%##***####*+++++*#**+=+**+++=====----------------:::")
         escreval(":::--------------------====++**##*%%##**++++++*####**++==++**##%##==-=+++=====---------------::::")
         escreval("::::-------------------===+++***=+#%%%##**+==---------==++**#%%##%#+----=======--------------::::")
         escreval(":::-------------------====+++*+--####%%%##**++++++++++++**#%%%##*##*+=-:--======-------------::::")
         escreval(":::-------------------===+++*+--=%%####%%%#####****######%%%###**##*+++-----====--------------:::")
         escreval(":::------------------===+++++=--*@#######%%%%%%%###%%%%%%%##******###***------====-----------::::")
         escreval(":::-----------------===++++===--*%#****####%%%%%%##########*******###%%#*------======--------::::")
         escreval(":::--------------============--=*##******################**********##*#%#--------=====-------::::")
         escreval(":::------------====-----====---=###********#######*************+++****##*----------====-------:::")
         escreval(":::----------------------==----=#************###********+++++++++++++***=-------------===-----:::")
         escreval(":::----------------------------=***********************+++++++++===+++++*=--------------------:::")
         escreval(":::---------:--:::-------------=*++++++++++++*****++++++==+++=========++-----------------------::")
         escreval(":::::::---:::::::--------------+*++++++==++=++++++++++====+==-----===++---------:::---------:::::")
         escreval(":::::::--:::::::---------------+*++==========++++++=========------====++----------::::--------:::")
         escreval("::::::::::::::-----::----------=++=====================---------======+=---:-------::::-------:::")
         escreval(":::::::::::::-------------------==========-======---==---------=====-==----:--------::::------:::")
         escreval("::::::::::::------------::-------=====--=--=====---==---------------=---------------:::------::::")
         escreval("::::::::::::---------:::::--------====-------======----------------==------:--------::::-----::::")
         escreval(":::::::::::-::::::::----::---------===---------===-------:--------==-------::--------::::----::::")
         escreval("::::::::::-::::::--==---::---:-----===---------------------------==--------------------:::---::::")
         escreval(":::::::::::::::-----------::::------===-------------------------==---------------------:::::-::::")
         escreval(":::::::::::::-------------==---::---====---------------------===----------====-----------::::::::")
         escreval(":::::::::::::::-----------==---:::---===---------------------==---------==-------=---------::::::")
         escreval(":::::::::::::::::::::-----==---:::----==---------------------=-------=====--------===-------:::::")
         escreval("::::::::::::::::::::::----==---:::-----=----------------------------====---------------==---:::::")
         escreval("::::::::::::::::::::::----------:-:::------------------------------====------------------==---:::")
         escreval("::::::::::::::::::::::::------::-:::::---------------------------=====--------:---:--::-------:::")

      fimse
      se casoIndex = 2 entao
         // Lucio Travassos -- Sobrinho
         escreval("::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::")
         escreval("::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::")
         escreval("::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::")
         escreval("::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::")
         escreval(":::::::::::::::::::::::::::::::::::::::::::::;;;;++xXXXxx+;;;;+++;::::::::::::::::::::::::::::::::")
         escreval(":::::::::::::::::::::::::::::::::::::::;;+xX$X$$$XX$$$$$$$XXxX$&$XX+;:::::::::::::::::::::::::::::")
         escreval("::::::::::::::::::::::::::::::::::::;+xXXXX$$$$&&&$$$$&&&&$$$$&&&&&$$xx+;;::::::::::::::::::::::::")
         escreval("::::::::::::::::::::::::::::::::;+xxX$$&$&&&&&&&XXX$&&&&&&&&&&$XX$$&$$XXXxx+;:::::::::::::::::::::")
         escreval(":::::::::::::::::::::::::::::;+xXX$$$$&&&&&&&&&&&&&&&&&&&&&&&&&&&$$&&&$$$X+;x+::::::::::::::::::::")
         escreval("::::::::::::::::::::::::::::;+XX$$$$$$$&&&&&&&&&&&&&&&&&&$XXXXX&&&&&&&&$$XXX+x;:::::::::::::::::::")
         escreval("::::::::::::::::::::::::::;xX$$$$&&&&$X$&&$$$XxxXXXXX$&&$$$$$$&&$$&&&&&&&$X$xx;:::::::::::::::::::")
         escreval(":::::::::::::::::::::::::+X$$$$$$&&$&$$&&&&&$XX$$$$$&&&&&&&&&&&&&&&&&&&&&&$XXx;:::::::::::::::::::")
         escreval("::::::::::::::::::::::::;xXX$$$$$&&&$$$$$$$&&&&&$$&&$&&&&&&&&&&&&&&&&&&&&&&$X+;:::::::::::::::::::")
         escreval(":::::::::::::::::::::::::+xXX$$$$$$$XxXXX$$$&&&&&&$&$$&&&&&&&&&&&&&&&&&&&&&$x;::::::::::::::::::::")
         escreval(":::::::::::::::::::::::::;XxXX$$$$$$$XX$&&&$$&&&&&$$&$$&&&&&&&&&&&&&&&&&&&&&x;::::::::::::::::::::")
         escreval(":::::::::::::::::::::::::;XXXX$$$$$$XX$&&&$&$$$$&&&$&$&&&&&&&&&&&&&&&&&&&&&&x:::::::::::::::::::::")
         escreval(":::::::::::::::::::::::::+XXxx$$$XXX&&&&$$$$$&XX&&&$$$&&&&&&&&&&&$&&&&&&&&&$x:::::::::::::::::::::")
         escreval("::::::::::::::::::::::::::+xX$$$$X$&&$$$$XXX$$$$$$XXX&&&&&&&&&&&&&&&&&&&&&&X+:::::::::::::::::::::")
         escreval("::::::::::::::::::::::::::;xxX$$XXXXXXXXXXX$$&&&&&$$$&$$&&$&&&&&&&&&&&&&&$$XX;::::::::::::::::::::")
         escreval("::::::::::::::::::::::::::;xxxxx+++++++xxxxXXX$$$$$&&$$$$$$&&&&&&&&&&&&&&$$&$x::::::::::::::::::::")
         escreval("::::::::::::::::::::::::::;xx++++++++++++++++xxxxXX$$$$$$$$&&&&&&&&&&&$&&$$&$x;:::::::::::::::::::")
         escreval("::::::::::::::::::::::::::;x+++++++++++++++++++++xxxxX$$$$$&&&&&&&&&&&&&$$$$$x;:::::::::::::::::::")
         escreval("::::::::::::::::::::::::::;x++++++++++;+++++++++++++xxxX$$$$$&&&&&&&&&&$XX$$$x::::::::::::::::::::")
         escreval("::::::::::::::::::::::::::;+++++++++;;;;;++++++++++++++xxxxxxXXXX$$$$$XXXXXX$+::::::::::::::::::::")
         escreval("::::::::::::::::::::::+xx;;xx+;++++;;;;;;;++++++++++++++xxxxxxXXXX$$$XXXxXXXX;::::::::::::::::::::")
         escreval(":::::::::::::::::::::+x++x+xx;;+++;;;;;;;;+++++++++++xxxxxxxxxXXX$$$$$XXXxXX+:::::::::::::::::::::")
         escreval("::::::::::::::::::::;xx+;;+xx;;+++;;;;;;;;+++++++++++xxxxxxxxxXXX$$$$$XxxxXx::::::::::::::::::::::")
         escreval(":::::::::::::::::::::+++;;;x+;;+++;;;;;;;;++++++++++++xxxxxxxxXXX$$$$$XxxXx:::::::::::::::::::::::")
         escreval(":::::::::::::::::::::;+xx+++;;;++;;;;;;;;;++++++++++++xxxxxxxxXXXX$$$$Xxxx+::;::::::::::::::::::::")
         escreval("::::::::::::::::::::::+Xx;++;+++xxxxx+++;+++++++++++++xxxxxxXXXXX$$$$XXxxXX$$$+:::::::::::::::::::")
         escreval("::::::::::::::::::::::+++x+;++;++xxxX$XXx+++++++++xx++xxxxxxxXXXXXX$$XxxxX$$$$+:::::::::::::::::::")
         escreval("::::::::::::::::::::::;++x+++;;;+++xxxxX$$$$x++++++x+xxxxxxxxXX$$$$$$XxxxX$$$x::::::::::::::::::::")
         escreval("::::::::::::::::::::::;++++++;;;;+xX;++$$$XXxxx++xxxx+xxXX$&&&&&&&&&&&Xxx$&$X;::::::::::::::::::::")
         escreval(":::::::::::::::::::::::++x+++;;;;;++++xXxxX$X+++++xxxxX$&$$$&&&&$XXXXXxxx$&X;:::::::::::::::::::::")
         escreval("::::::::::::::::::::::::;x+++;;;;;;;;+++xxxx+;+;;+xxX$&&&&xx$$$XX&$$XXXxx$$+::::::::::::::::::::::")
         escreval("::::::::::::::::::::::::;x+++;;;;;++;;+++++++++;;+xX$&&&&$XXXXX$$$$$$$XxX$x:::::::::::::::::::::::")
         escreval("::::::::::::::::::::::::;X+++;;;;;+++++++;;;;;++++xX$$$&$$XXXXXXX$$$$$XxXX;:::::::::::::::::::::::")
         escreval("::::::::::::::::::::::::;Xx+;;;;;;;+++++;;;;+++;++xX$$$$$$$XXXXXXXXX$XXxX;::::::::::::::::::::::::")
         escreval("::::::::::::::::::::;+$$Xxx+;;;;;;;;+++++;;++++;++xX$$$$$$$XXXXXXXXXXXX+::::::::::::::::::::::::::")
         escreval("::::::::::::::::;+X$$&&&xxxx+;;;;;;++++++++++++++xX$$$$$$$$XXXXXXXX$XXx:::::::::::::::::::::::::::")
         escreval(":::::::::::::;+X&$$&&&&&Xxxx++;;+++++++++++++++++xX$$$$$$$$XXXXXXXXXXX+:::::::::::::::::::::::::::")
         escreval("::::::::::::x$&&$$&&&&&x+xxxx++;;;;++++++++++++;+xX$$$&$$$XXXXXXXXXX$X::::::::::::::::::::::::::::")
         escreval("::::::::::x$&&&$X&&&&X;;+xXxxx+++;;;;++;;++++;;++xX$$$&$$XXXXXXXXXX$$;::::::::::::::::::::::::::::")
         escreval("::::::::+$&&&&$X$&&&x;;++xXxxxx+;;;+++++++++++++xxX$&&&$$XXXXXXXX$&$+:::::::::::::::::::::::::::::")
         escreval("::::::;$&&&&&&$X$&$+;;;x++X$Xxx+;;+XxxxXxxXxXxxxx$&&&&$$$XXXXXX$$&$x::::::::::::::::::::::::::::::")
         escreval("::::;X$&&&&&$$XX$&$+;;;X+++$$Xx+++xxxxx++++xxX$Xx$$$$$&&&&$XXX$&&&X;::::::::::::::::::::::::::::::")
         escreval(":::+$&&&&&&$XXX$$&X;;:;X++++$$X+++x++++xxxxxxxx+xxXX$$$X$$&$X$&&&x::::::::::::::::::::::::::::::::")
         escreval(";+X$&&&&&$$$XX$$$&X;;:;Xx++++x$XxXx++;;++++xxxxXXXXX&&$XX$$$$&&&$x::::::::::::::::::::::::::::::::")
         escreval("$$&&&&&&$$$$$$$$&&$;;:;x$+++++X$Xx++++++++++xxxxxXXXXXXXX$$$&&&&&&x;::::::::::::::::::::::::::::::")
         escreval("$$$$&&&&$$$$$$$$&&$;;;;+&X+++++X$x+++++++xxX$XxxxxxxxXXX$&&&&$&&&&&$X:::::::::::::::::::::::::::::")
         escreval("&&$$$$$&$$$$$$$$&&$;;;:;X&X+++++X&X++;+++++xXXxxxxxXX$$&&&&&$$&&&&&&&&X:::::::::::::::::::::::::::")
         escreval("&&$&&&$$$$$$$$$$&&$+;:;;x$$x+++++x&Xx++;;+++xXxxxXXXX$&&&$$$x&&&&&&&&&&&x;::::::::::::::::::::::::")
         escreval("$&&&&$$$$$$$$$$$&&$+;;;;+X&$xx+++++$&Xxx++xxXXXXXXX$&&&$$$xxX&&&&&&&&&&&&&X;::::::::::::::::::::::")
         escreval("&&&$&&$$$$$$$$$$&&&+;:;;;x$&$Xx+++++x$$$$$$$$$$$$&&&&$XXXxxX$&&&&&&&&&&&&&&&$x;:::::::::::::::::::")
         escreval("&$&&&&$&&&$$$$$$&&$+;++;;+x$&$Xxx+++++xXX$$&&&&&&$XxxxXx+xx$&&&&&&&&&&&&&&&&&&&$x+::::::::::::::::")
         escreval("&&&&&&&$&&&&$$$$&&&&$xx++;+X&&$XXxxx+++++++xxxxxxxxxxX+++xX&&&&&&&&&&&&&&&&&&&&&&&$x;:::::::::::::")
         escreval("&&&&&&$&&&$&$&$$&&&&$x+++;;;+xX$$XXxxxx+++xxxxxx++xxx++xxx&&&&&&&&&&&&&&&&&&&&&&&&&&&X+:::::::::::")
         escreval("&$&&&&&&&&&&$$$$&&&&&X+++;;;;+;++X$$XXxxxxxxxxxxxxXx++xXX$&&&&&&&&&&&&&&&&&&&&&&&&&&&&&$x:::::::::")
         escreval("&&&&&&&&&&&$$$$$&&&&&$++++;;;;;;;;+$&$$XXXxxxxxxx+;xxxxxX&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&$+;::::::")
         escreval("&&&$&&&&$$&&$$$$&&&$$$x+++++;;;;;;;;x$$$$XXxx++;xXxxxxxx&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&$$$x;::")
         escreval("&&&&&&&&&&&&$$$$&&&$$$X++++++;;;;;;;;+$$$Xx++xX$Xxx+x$&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&$&&$X")
         escreval("&&&&&&&&&&&&&$$$&&&$X$Xx++++++;;;;;;;;X&xxxxXxxxx+++$&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&")
         escreval("&&&&&&&&&&&&&&$$&&&&$$$X++++++;;;;;++;;+xxxxxxx++++$&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&")
         escreval("&&&&&&&&&&&&&&$$&&&&$$$Xx++++++;;;;;+xxxxxxxxx++++$&&&&&&&&&&&$&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&")
         escreval("&&&&&&&&&&&&&&&$$&&&$$$$X+++++;;;+XXXx+++++++++++$&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&")
         escreval("&&&&&&&&&&&&$&$$&&&&$X$$Xx++++++xXxxx++;;;++++++X&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&")
         escreval("&&&&&&&&&$&$$$$&&&&&$X$$$x+++++xXxxx++;;;;+++++X&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&")
         escreval("&&&&&&&&$&&&&$$$&&&&&X$$$X++x+xxxx+++++;;;++++X&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&")
         escreval("&&&&&&$$&$$$$&&$$&&&&$$&$Xxxxxxx+++++++;;;++xX$&&$$$&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&$&&&&&&&&")
         escreval("&&&&&&$&&$$X$$$$&&&&&$&&&Xxxxxxx+++++++;;;+xX$&$$$&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&$$$&&&&&&&")
         escreval("&&&&&&$&&&&&$$$&&&&&&$&&&XXxxxx+++++++++;;+X$&X$$$&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&$&&&&&")
         escreval("&&&&&&&$&&&$$&&&&&&&&$&&&$XXxxx++++x++++;+x$$XX&&&&&&&&&&&&$&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&$$&&&&&&")
         escreval("&&&&&&&&&$$&&&&&&&&&&&&&&$$XXxxx+++xx+++;+X$Xx$&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&")
         escreval("&&&&&&&&&&&&&&&&&&&&&&&&&$$XXxxxx++xx+++;+XXX$&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&")
         escreval("&&&&&&&&&&&&&&&&&&&&&&&&&&$XXXxxxx+xxx++;+xx$&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&")
      fimse
      se casoIndex = 3 entao
         // Viuva Rosa Magalhaes -- Dona da pensao
         escreval("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$+;")
         escreval("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$+;")
         escreval("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$XXX$$X$$X$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$+;")
         escreval("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$XXXXXXXXXXXXXXXxxXXXX$$X$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$x;")
         escreval("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$XXxXXXXX$X$XXXXXXXXXXXXXXXXXXxxX$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$x;")
         escreval("$$$$$$$$$$$$$$$$$$$$$$$$$$$XXXXXXXXXXXX$$$X$$XXXXXXXXXXXXXXXXXXXXXxxXX$$$$$$$$$$$$$$$$$$$$$$$$$$x;")
         escreval("$$$$$$$$$$$$$$$$$$$$$XXXXxXX$$XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXxxxX$$$$$$$$$$$$$$$$$$$$$$$x;")
         escreval("$$$$$$$$$$$$$$$$$$$XXxXXXXXXXXXX$$$XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXxxxXX$$$$$$$$$$$$$$$$$$$$x;")
         escreval("$$$$$$$$$$$$$XXxXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXxXXXXxxX$$$$$$$$$$$$$$$$$$x:")
         escreval("$$$$$$$XXxxxxXXXXXXXXXXXXXXX$XXXXXXXXXXXXXXXXXXXXXXXXXXXxXxxXXXXXXXXXXXXxxXxxxxX$$$$$$$$$$$$$$$$X:")
         escreval("$$$$$xxxXXXXXXXXXXXX$$XXXXXXXXXXXXXXXXXXXXXXXXXXXXxXXXXXXXxxxxXXxXXXXXXXXXxxxXxxX$$$$$$$$$$$$$$$X:")
         escreval("$$$$xxXXXXX$XXXxXXXXXXX$XXXXXXXXXxXXXXXXXXXXXXXXXxxxxXXXXXXXxxxxXxxXXXXXXXxxxxxxxx$$$$$$$$$$$$$$X;")
         escreval("$$$x+x+x++xXXXXXXXXXXXXXXXXXXXXXXXXXxxXXXXXXXXxxxxxxxxXXXXXXXxxxxxxxxXXxXXxxxxxxxxxX$$$$$$$$$$$$X;")
         escreval("$$$++++++x++xXXXXXXXXXXXXXXXXXXXXXXXXxxxxxXxxxxxxxxxxxxxxXxXXxxxxxxxxxXXXxxxx+xxxxx++$$$$$$$$$$$X;")
         escreval("$$$X++++x+x+++xxXXXXXXXXXXXxxxXXxXXXXXXxxxxxxxxxxxxxxxx++xxxxxxxxxx+xxxxXxxxxx+++++x+x$X$$$$$$$$X;")
         escreval("X$$XXx+++++++++++xXXXXXXXXxxxxxxXXxXxXXxXxxxxxxx+++++++++x+xxxxxxxx+xxxxXXxxxx++++++x++X$$$$$$$$X;")
         escreval("$$$X+++++++xxx++x+xXXXXXXXXxxxxxxxXXxxxXXxxxxxx+++++++++++++xxxxxxxx++xXXxxxxx+++++++x++XX$$$$$$X;")
         escreval("$$X+++++++x++x+x++XxXXXXXXXXxxxxxxxxXxxxxxxxxx++++++++++;+++++xxxxxxx+xXXxxxxxx++++++x+++X$$$$$$$;")
         escreval("$$++++++xxx+++++x+xxXXXXXxXXXxx++++xxXxx+xxxxx+++++;;;++++++++++xxxxx++xXxxxxxxx+++x+++++;X$$$$$X;")
         escreval("$X;;+++xxxx++++++++xXXxXXxxXXXxxx+++xxXxx+xxx++++++;++;+++++++++++xxx+++Xxxx+xxx+++++++++;+$$$$$X;")
         escreval("$XxXX++x+++++++++++++XXxXXxxXxXxx++++XxXX++++++++++++++++++++x+++++xx+++xxxxxxxxx+++++++++;+$$$$$;")
         escreval("$$$$+++++++++++++++++Xxxxxxxxxxxxx++++XXXx+++++++++++++++++xxx++++++xx++++xx+x++xx++++;+;;;;x$$$X;")
         escreval("$$$+;++++++++++++++++xXxxxxxxx+xxx+++++xxX+x+++++++++++++xxxxxx+++++xx++x+xxx+++xx++++;;;;;;;X$$X;")
         escreval("$$X;++++++++++++++++++xxx+xxxx+++x+++x+++xxXx+++++++++x+xxxxxxx+++++++++x+xXxx+++x+++++;;;;;;+X$$;")
         escreval("$$x;++++++++++++++++++++x++++x+++x+++++x+++xXX++++++++xxxxxxxxxx++++++xxx+xxXx+xxxx+++;;;;;;;;x$$;")
         escreval("$$+;+++++++++++++++++++++++++++x+xx+++++xxx+++xx+++++xxxxxxxxxxxxxx+xxxxxxxxXXx+xxx+++;;;;;;;;;X$;")
         escreval("$$+;+++++++++++++++++++++++++++++xxx++++xxxxx++x++++x++++xxxxxxXXxxxxxxxxxxxXXx+xxxx++;;;;;;;;;+$;")
         escreval("$$+;++++++++++++++++++++++++;;;;+++xxxx++xxxxxxxx+++++++xx+++++++xxxxxxxxx+xXXX+xxxx+++;;;;;;;;;x;")
         escreval("$$+;+xx+++++++++++++++++++x+;;;;;+++xxxxx+xxxxxXxxx++++++++++++++x++xxxxxxxxXXXx+xxx+++;;;;;;;;;;;")
         escreval("$$x;+xx++++++++++++++xXXXxxxx+;;;;;++xxx+xxxxxxxxXxxx++++++++++++xxx+xxXxxXxxxx+++xxx+++;;;;;;;;;;")
         escreval("$$x;+xx+++++++++++XXXXxxxxx+++xx++++xxxxxxxxxxxxxxxXXxxx+x++++++++++++xxxXXxxXX++++xxx+++;;;;++;;;")
         escreval("$$+;+xx+++++xx++xX$$$XXXXXXXXxx++xx+xxXXXXXXXXxxxxxx+xxxxx++++++++++++++xXXXx+xx++++xx++++;;;;+++;")
         escreval("$x++++xx++++xxxXXXXXXX$$$$$XXXxxX++xxxxXxXXXXXXXXXXxxxxxxxx++++++++++++++xXXXXxxx++++xx+++;++;;+$;")
         escreval("$xxxXXXx++++++xxXxxxXXXXXXXXX$X$XXxxxxxxxXXXXxxxxxxxXxxxxx++++++++++++++++xXXXXx+xx++x++++;;++++$;")
         escreval("Xx+xXX$Xx++++++xxxxxxxX+;xXXXXXXXXxx++++++xXXxXxxxxxxxxxx++++++++++++++++xx+xxxXx++x+++++++++;xX$+")
         escreval("$$xX$X$XXX+++++++++++xxxx+xxxxXxx++;++;;;++xXXxxxxxxxxxx++++++;;;++++;;;;+xx+xxxxxx++x+++x++++x$$;")
         escreval("$$$Xx+XXXX+++++++++;;+++xxxxxxx+++;;+;;;;;;+xxXXxx+x+++++++++++;;;;++;;;;;;+xx+xxxxx++x+++++++x$$+")
         escreval("$$$$X++XXx++;++++++;;;++++++++;++;;;;;;;;;++++xxxXxx++++++;;;++;;;+;;;+;;+;;;+xx+xxx++++++++++++X+")
         escreval("$$$$$xxxx++++++++++;;;++++++;;;;;;;;;;;;++++++xx+xxxxxx++++++;+++;;++;;+++++;;+xx+xxxx+;+;++++++;;")
         escreval("$$$$$X+xx++;++++++++;;;++++++++;;;;;;;;++++++x++x++xxx+xXXx+++++x++;++;+++++++;++Xxxxxxx+;;;+++;;;")
         escreval("$$$$$x+++++++++++++++++++++;;;;;;;;;;;++++++++++xxx+xxxxxxXXXXxx++xx++++++++++++++XXx+xxxx;;;+x+;;")
         escreval("$$$$$x+++++++++++++++++++++;;;;;;;;;;+++++++xxxxxxxxx+xxxXxxXXXXXXxxXx+xx+x++x++++xXxx+xxxx;;;++;;")
         escreval("$$$$$+;++++++++++;;+++++++++++;;;+;+++++++xxxxxxxxxxxxxxxxxxxXXXXXXXxXx+xxx+++Xxxx+xxxx+xXx;;;+;;;")
         escreval("$$$$$+++;;;++x++;++;++++++++++++++++++++++xxxxxxxxxxxxxxxxxxxxXXXxXXXXXxXxx+++xXxxxxXxx+;xx;;;+;;;")
         escreval("$$$$$++;;;;++xx+++++;+++++++++++++++++++xxxxxxxxxxxxxxxxxxxxxxXXXXXXXXXXXxx++;+$X+XxXx+;;+x;;;;;;;")
         escreval("$$$$$++++xxxxx++;;+x+;;++++++++++++++xxxxxxxxxxxxxxxxxxxx++++xXXXXXXXXXXxxx++++XX+XxxX++;+x;;++;;;")
         escreval("$$$$$XxXXXXXXXXXx++x+;;;;;;;+++++++++xxxxxxxxxxxxxxxx+x++++++xXXXXXXXXXxxx+++++Xx+XxxX++;+x;;+;+;;")
         escreval("$$$$$$$x+x+xx++xxxXx;;;;;;;;;;;;+++++xxxxxxxxxxxxxx++++++++++xXXXXXXXXX+x+++++xX+XXxXXx+++x++x;+;;")
         escreval("$$$$$$$$;;;+x;;+++++++;;;;;;;;;;;;+++x+xxxxxxxxxx+++++++++++xXXXXXXXXX++++++++X+xXX+XXxx+x++x+++;;")
         escreval("$$$$$$$$X;;++x;++++++++;;;;;;;;;;;+++++xxxxxxxx++++++++++++xxXXXXXXXX++++++++xxxXX+xXXxx+x+++++++;")
         escreval("$$$$$$$$$+xx+++;;;+;;;;;;+;+;++++++++++++++++++++;;++++++++xXXXXXXXX++++++++xxxXX++XXXx+x+;xXXX++;")
         escreval("$$$$$$$$$XxXx++++x++++++++;;+++++;;;;;++++++++;;;;;++++++xX$XXXXXX+++++++++xxxXx++XXXx+++;+$XXXXx;")
         escreval("$$$$$$$$$xxxXXXxXXXXXXXXxxx++++;;;;;;;;;;;;;;;;;;;+++++xxXXXXXXxx++++++++xxxx+++xXXxx+;;;+X$XXX$X+")
         escreval("$$$$$$$$$XxXX$$$$XXXXXXXx++++++;;;;;;;;;;;;;;;;;;+++++xxxxXXXXXx++++++xxxxx++++XXX++;;+++$$$XxX$$+")
         escreval("$$$$$$$$$$xxxxxxx+++x+++;++;;++;;;;;;;;;;;;;;;;++++++xXxXxXXXxxx++xxxxxxxxx++XXx+;+xxxX$$$X$XXXX$+")
         escreval("$$$$$$$$$$X+xx+++xxx+++++++++++++++++++++;;;;+++++xxxXXXXXXXXxxxxxxxxxxxx++++;+XXXX$$$$X$$X$XXX$X+")
         escreval("$$$$$$$$$$$$xxxXxxxx+x++++++++++++++++++++++++++xxXXXXXXXXXXXXxxxxxxXxxxxX$Xx+x$$$$$$$$X$$XXxxX$Xx")
         escreval("$$$$$$$$$$$$$+;+++xxx++++++++x++xx+++xx+++xxxxxxXXXXX$XXXxXXXXXxxxxx+;;x$$$Xx;XX$$$$$$$$$$X$xX$$Xx")
         escreval("$$$$$$$$$$$$$$+;+xxxx+x++++++++++++xxxxxxxxxxXXXXXXXXXXxXxXXxXXxx+x++XXX$$XXXXX$$XXXxXXX$XX$xxXXXx")
         escreval("$$$$$$$$$$$$$$X;xx+++;;;;;;;;;;;;+++xxxxxXXXXXX$XXXXXxXXXxxXxxXx++XXXXXXX$$XXXXX$$XXXXXX$X$$XXXXX+")
         escreval("$$$$$$$$$$$$$$$+xxx++;;;;;;;;;;+++xxxXXXXXX$$$XXXXXXXXXXXXxXX+++XXXXX$XXX$$$XXX$XXXXXXXX$XXXXX$XXx")
         escreval("$$$$$$$$$$$$$$$Xxxxx+++;;;++++xxxXXXX$$$XXXXXXXXXXXX$$xXXXXxx++xXXXXXXXXXX$$XXX$XXXXXXXXXXX$XX$$Xx")
         escreval("$$$$$$$$$$$$$$$$XXXxxxxxxxxxXXXXXxXXXxxXXXXXXXXX$$$$$$XXXX$$Xx+XXXXXXXXXXX$$XXX$XXXXX$XX$XX$XX$$Xx")
         escreval("$$$$$$$$$$$$$$$$$$$$XXxXXXxXXX$$$$$$$X+xxxXX$$$$$$$$$Xx++XXX$XXxXXXXXXXXXX$$$$$$XXXXXXXXXXX$XX$$Xx")
         escreval("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$XxxX$$$$$$$$XXXXxxxxXX$$XXXXXXXXXXXX$$Xx$XXXXXXXXX$XX$XX$$Xx")
         escreval("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$xXX$$$$$$$$XXXX$$X+XXX$XXXXXXXXXXXX$$x;x$XXXXX$XX$XX$XX$$Xx")
         escreval("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$XxX$$XXXX$$X$$X$X$XXXXX$XXXXXXXXXXX$$x++$XXXXXxXXXXXXXXXXXx")
         escreval("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$XXXXXXXXXX$$XXXX$XXXXX$XXXXXXXXXXX$$Xx+$XXxXxXXXX;;$XXXXXx")
         escreval("$$$$$$$$$$$$$$$$$$$$$$$$$X$XXXXXXXXXXXXXXXX$$$XXXX$$$$$$X$XxXXX$XXXXXXXXXX$$$x+xXXXXXX$Xx+X$$X$$$X")
         escreval("$$$$$$$$$$$$$$$XXXXXXX$$$$$$$$$$$$$$XX$$$$$XX$XX$$$$$$$$$$$XXXX$$XXxXXXXX$$$X++xXX+xXXX$XXXXXXXXXx")
         escreval("$$$$$$$$$$$XxX$$$XX$$$$$$$$$$X$XXXXX$$$$$$$$XX$$XXX$$XXXXX$XXXXX$$XXXXX$XX$X+;++XXXXXXXXXXXxXXXXXx")
         escreval("$$$$$$$$X+xXXXXXXXXX$XXXXXXxXXXX$$$$$XX$$$$$$$X$X$$X$XXXXXX$XXXXX$XX$$XXX$++x++x$$XXXXXxXXXXXXXXXx")
         escreval("$$$$XX+;xxxxXXXXXXXXXXXXXXXXXXXxxX$$$$$$$XXX$$XXXXXXXX$XXXXX$XXXxX$XXXXXXXx+;;;+xXXXXXXXXXXXXXXXXx")
         escreval("XXXX+;+;;+++xXXXXXXXXXXXXXXXXXXXXXXxXX$X$XXXXXXXXXXXXXXXXXXxXXxXXX$XXXxxx+x+;;;++++xXXXXXXXXXXXXXx")
      fimse
      se casoIndex = 4 entao
         // Iara Crespo -- Esposa do maestro
         escreval("::::::::::::::::::::::::::::::--+******#*********+-::::::::::::::::::::::::::::::----------")
         escreval("::::::::::::::::::::::::::::-==#%###***************+-::::::::::::::::::::::::::------------")
         escreval("::::::::::::::::::::::::::--+#%%%##******************=-::::::::::::::::::::::::------------")
         escreval(":::::::::::::::::::::::::-+##%%%###*********##******#*+--:::::::::::::::::::::-------------")
         escreval("::::::-::::::::::::::::::-**#%%%%#****#####***###****#**=---::::::::::::::::::-------------")
         escreval("------------:::::::::::--*#*#***+===+*##%%########*#***#*+---:::::::::::::::::-------------")
         escreval("-------------:::::::::-=####*=---::::-*#%%%%%####%##*****#*+---::::::::::::::--------------")
         escreval("-------------::::::::-=#%%%+-----::::::=*%%%%%##%%%%*****#%#+=----:::::::::----------------")
         escreval("--------------::::::--=#%%%-------::::-++=+*#%###%%%##****#%%#=------::--------------------")
         escreval("---------------:::::--=#%%%=--------*#+==++===+**#%%%#******###*=-----:--------------------")
         escreval("----------------::----=#%%%#=-----=#*+##%#+-:--=+*%%%%%##########=-------------------------")
         escreval("----------------::::---*%%%@+=++=--=+*+++--::--=+*#%%%%%%##%%%%##*-------------------------")
         escreval("-----------------:::---+#%%%%###%+:--------:---=+*#%%%%%%%%%%%%%%%*------------------------")
         escreval("------------------------###%@%%++=:-----------==*#%%%%%%@%%%%%%%%#=------------------------")
         escreval("------------------------*##%%@%#==------------==+##%%%%%%%%@@@%%%##+-----------------------")
         escreval("------------------------*%%%%@@%==-=++==-----===+##%%%%%%%%@@@%%%%%#*=---------------------")
         escreval("------------------------+#%%%%%%%+=*#+-----======*##%%####%%@@@%%%%###+--------------------")
         escreval("------------------------+*%%%%%%%%%*++==++*+======+#%%%%#####%%@@@%%#*#*+------------------")
         escreval("------------------------=*%%%%%#%%%%#%%#+=+=====+#%%%#####%##%#%#%%%%##*%#=----------------")
         escreval("------------------------=*%%%%##%%%%%*+*##+--==*%%%%#**#%%%%%%%%%%%%%%##%%+----------------")
         escreval("------------------------=*%%%#*##%@%%#=+*+===*%%%%%%%%%%%%%%%%%%%%%%%%%##%%*---------------")
         escreval("------------------------+#%%%**+#%@@@%====#%%%%%%%%%%%%%%%%%%%%%%%%@@%%%#%%**--------------")
         escreval("------------------------+#%%%#++#%%%%@%--=#%%%%%%%%%%%%%%%%%%%%%%%%%%@%%#%%#*=-------------")
         escreval("------------------------*#%#%%#*##%#%%+-=#%%%%%%%%%%%%%%%%%%%%%%%%%@@@@%%%%%*+-------------")
         escreval("------------------------*####%%%*+*##*##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%@@%%@@%#+-------------")
         escreval("-----------------------=**%**#%%++%*+-=%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%@@%%%%%+====--------")
         escreval("------------------------**##**%%+=#++-+#%%%%%%%%%%%%%%%@%%@@@%%%%%@%%@@@@@%%#====-==-------")
         escreval("------------------------+****+*%*-+%*%%%%%%%%%%%%%%%%%%%@%%@@@%%@%%@@@@%%@@@@%@%**+=====+=-")
         escreval("------------------------===+*+=##+=%%%%%%%%%%%%%%%%%%%%%%%@@%@@@%@@@@@@@@%%%%*++==+*=====--")
         escreval("------------------------==+-=+*##*%@%%%%@%%%%%%%%%%%%%%%%%%@@@@@%@@@@@@@@%%*=+**+==========")
         escreval("--------------------------=+--=%##%%%%@@%%%@%%%@%%%%%%%%%%%%%%@@@@@@@@@@@@%##+=============")
         escreval("----------------------------==##=*%%%%%%%%%@%%%%%%%%%%%%%%%@@@@@@@@@@@@@%*++===============")
         escreval("----------------------------=##=*%%%%%%%%%%@%%%%%%%@@@%%%%%@@@@@@@@@@@@%*++++++============")
         escreval("----------------------------**=#%%%%%%%%%%%%%%%%%%%%%%%%%%%%@@@@@@@@@@@@#++++++++++========")
         escreval("---------------------------=*=*%%%%%%%%%%%%%%%%%%%%%%%%%%%%@@@@@@@@@@@#*+++++++++++++======")
         escreval("=----------------------------=#%%%%%%%%%%%%%%@@@%#+==++##%%@@@@@@@@@@@****+++++++++++++====")
         escreval("=========--------------------=#%%%%%%%%%%%%%%%@#*==----====+*%@@@@@@@#*********++++++++++==")
         escreval("============-----------------=#%%%@@@%@%%%%%%%@*===----====++*@@@@@@%************+++++++++=")
         escreval("=================----------====%@@@@@@@@@@@@%@@@*=====--=====+*%@@@@@#**************+++++++")
         escreval("================================%@@@@@@@@@@@@@@@%============++#@@@@%****************++++++")
         escreval("================================+@@@@@@@@@@@@@@@%+===========++*@@@@********************+++")
         escreval("================================+%@@@@@@@@@@@@@@%+===========++*#@@#*****#####************+")
         escreval("================================+%@@@@@@@@@@@@@@%*===========++*#@%*****#########**********")
         escreval("================================#@@@@@@@@@@@@@@@@#+===========+*#%#*****###########********")
         escreval("===============================#%@@@@@@@@@@@@@@@@#++=========+++*#*****##############******")
         escreval("==============================+%@@@@@@@@@@@@@@@@@%*+=========+++******################*****")
         escreval("+++===========================*@@@@@@@@@@@@@@@@@@@@#++=========++*#***####################*")
         escreval("+++++++++++===================#@@@@@@@@@@@@@@@@@@@@*++=======+++*#**######################*")
         escreval("+++++++++++++++++++=========++%@@@@@@@@@@@@@@@@@@@@#+++=====+++**##########################")
      fimse
      escreval("  [ENTER para ver o proximo suspeito]")
      leia(jogarNovamente)

      // ---- SUSPEITO 2 ----
      limpaTela
      escreval("==========================================================")
      escreval("  DOSSIE  --  SUSPEITO 2 DE 3")
      escreval("==========================================================")
      escreval("")
      escreval("----------------------------------------------------------")
      escreval("  Nome   : ", nomeSusp[2])
      escreval("  Perfil : ", papelSusp[2])
      escreval("  Alibi  : ", alibiSusp[2])
      escreval("----------------------------------------------------------")
      escreval("")
      se casoIndex = 1 entao
         // Dr. Ramiro Castelo -- Advogado
         escreval("%%%%%%%%%%%%%%%%%%%%%%%%%%#%%%%%%%%%%%%%#%%#*=:---==-=*###%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%%%%%%%%%%%%%%%%###%%%#####%######+:--:=::-+##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#*+***+=+#**+*==%----:+--=++##*#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%%%%%%%%%%%%%%%#####++*===++--=+*-=:==+=***+:**+##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%%%%%%%%%%%%####***++=:+===--:-=+#+-=+*%#%%*-+*=*##%%%%%%%%%%%@@@%%%%%%%%%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%%%%%%%%%%%%%%###*+*=::+**=-=--=-=*+***%%%%*=#+==####%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%%%%%%%%%%%#*+=++====*+-+*==++==--=*###%%%%++%+=+#+=*%%%%@@@@@%%%%%%%%%%%%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%%%%%%%%%%%#**+=+*+**=+***+*##***==+#%%%%%%*+*%*+*#*%%%%%%%%@@@%%%%%@%%%%%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%%%%%%@%%%%##***###%%###%%%%%#%%##*#%%%%@###%##%%%@%%%*%%%%%@@@@%%%%@%%%%%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%%%%%%%%%###**###*#%%%%%%%%%%%%%#%%%#%%%@%%%%%%%%@@@@%*=**#%%%%%@@@@@@@%%%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%%%@%%%*=-=*#**##%#***####********###%%%%%%%%%%%@@@%**%%%##%%@@@@@%@@%@%%%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%%%%%%%%###%%%%%%%##*******===----==++*###**##%%%@@@@@%@@@%%%#%%%@@@%%%@@%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%%%%@@%%##*****##*++++==-------::::---=+====+**##%%%@@@@@@@%%##%%@@@@@@@@%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%%%@%%%%####*+**++===---::::::::::::::-------===++*##%%%@@%%%%%%%%@@@@@@@@%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%@@%@%%%%###***===-----:::::::::::::::::------===++**###%%@%%%%%%@@@@@@@@@%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%@@@@@@%%%%#*+++==-----::::::..:::::::::::------==++**####%%%%#%@@@@@@@@%%%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%@@@@@%%%%%#*=======---::::........:..:::::::----===++**#####%%%#%%%@@@@%@%%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%@@@@@@%#**+=+===----::::............:::::::---===++**#####%%#%%%%@@@@%@@%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%%@@@@%%#*++++===---:::::............:::::::---==++***####%%%%##%@@@@@@%%@%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%%@@@@%#*+++++===--:::::.............:::::-----==+++**####%%%%%%%%@@@@@%@@%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%@@@@@%%%*+++*+==---::::.............::::--:---====+++**##%%%%%%%%%@@@@@%@@%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%@@@@@%%#*****===---:::::.........::::::---:::---==+++**##%%%%%%%%@@@@@@%@%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%@@@@%%####*+==----:::::..........::.::::::::---==++***##%%%%%%%%@@@@@@@%%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%%%@%%%%%#*===----::::::.........::...:::::::--===++**###%%%%%@@@@@@@@@@%%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%%%%%@@%%*===-----:::::..:.......::..:::..::----===+++*#####%%%@@@@@@@@@%%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%%@@@@@%#+====----==---:::...::::-:::--::-----====++**####%%%%%@@%@@@@@%%%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%%@%@@@%#+=====+**#%#%%%%%#*+===--=-:-==--=++++**######%###%%%%%@@%@@@@%%%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%%%%%@%%*++=++*%#******#%@@@%%##*+-:=**+*#%%%%@@@@@@%@@@@%%%%%%@@@@@@%%%%%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%%%@@@%%*++++***+=-----=+*###%%%#*--=###%%@@@@%%%%%%%%%@@@@%%%%@@@@@@%%%%%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%@@@%%%##*++=++++*#%%%@%@@%#####*=-::=#%%@%%%%####%%%%%%%@@@@%%@@@@@@@%%%%%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%%@%%#%#*++====*###**%@@%#+*#*=--:::=*%%%**#*=+#%@@%%@@@%@@%%%@@@@@@@@%%%%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%%%%%#%*+++=---==+*+=-==+===-:::::.:=*#%*=-::::=#%#*#%%@@%%%%%@@@@@@@%%%%%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%%%#%%#*+++=------=++++++++=-:::::.:=*##*+=--::-=*###%%%%%%%%%@@@@@@@%%%%%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%%%#*##*+++=--::-----+++=--:.:::::.-=*##*+=--=+**#%%%%%%%###%%@@@@@@%%%%%%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%%%#+*#*+++==-:::--------:..:::-:::-+###**=--===++**########%%@@@@@@%%%%%%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%%%%++#*+++==-:::::::::::..:::-::::-+####*+=--===+++**++**#%%@@@@@@@%%%%%%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%%%%*-***++===---:::::::..:::--:::::=*#%#*+=---======++**##%%@@@@@@%%%%%%%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%%%%%*##*+++==---::::::...::---:::::-+#%##+=------==++**##%%%@@@@@@%%%%%%%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%%%%%%##**++===---::::::::----::..::-+####*=-----===+**##%%%%@@@@@%%%%%%%%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%%%%%%%##*++=====--:::::--:--===--==+#%%###+=----==++*##%%%%%@@@@@%%%%%%%%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%%%%%%%%#**+++===---:::-=:.-#%%#*###%%@@@@@#*=-===+**##%%%%%@@@@%%%%%%%%%%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%%%%%%%%#***+++===----==::::-+*##%@@@@@@@@@%#*+===++*##%%%%%%@@@%%%%%%%%%%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%%%%%%%%#*****++==---==-----=++*###%%@@@%%#***+==+**#%%%%%%%@@@%%%%%%%%%%%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%%%%%%%%%##**+++===-=+====+++******##%%%%#####**+**##%%%%%%@@@%%%%%%%%%%%%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%%%%%%%%#****++=====+*****++***%#*####%%%%#%%%##*##%%%%%%%@@@%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%%%%%%%%%%#****++===*****+--=--++*====+*#######%%##%%%%%%@@@@@%%%%%%%%%%%%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%%%%%%%%%%#***********++****#%%###*++*%%%%####%%%%%%%%%%%@@@@@@@%%%%%%%%%%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%%%%%%%%%@@%###**++****+===----=+*##*****##%%%%%%%%%%%%@@@@@@@@%%%%%%%%%%%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%%%%%%%%@@@%#####***++==+++==---====++**###%%%%%%%@@@@@@@@@@@%%%%%@@@@@@@@@@@@@@@@%%%%%%%")
         escreval("%%%%%%%%%%%%%%%%@@@@@@@@%%###***+===++**##%%%%%%%%%%%%%%%%%%%%@@@@@@@@@@@@%@@@@@@@@@@@@@@@@@@%%%%%%%")
         escreval("%%%%%%%%%%%%@@@@@@@@@@@@@@%%#***+++===+***##########%%%%%%%%%@@@@@@@@@@@@%@@@@@@@@@@@@@@@@@@@@%%%%%%")
         escreval("%%%%%%%%%%%@@@@@@@@@@@@@@@@@%#**=-----------=----=**###%%%%%%@@@@@@@@@@@@%@@@@@@@@@@@@@@@@@%%@%%%%%%")
         escreval("%%%%%%%%%@@@@@@@@@@@@@@@@@@@@%#*+--:::::::--=====+******###%@@@@@@@@@@@@@%%@@@@@@@@@@@@@@@@%%%%%%%%%")
         escreval("%%%@%%%@@@@@@@@@@@@@%@@@@@@@@@@%*++=--=---:-=====*#######%%@@@@@@@@@@@@@@@%%@@@@@@@@@@@@@@@@@%%%%%%%")
         escreval("@@%@@@%%@@@@@@@@@@%%%@@@@@@@@@%@@#*+++++==++**++**####%%@@@@@@@@@@@@@@@@@@%%@@@@@@@@@@@@@@%%%%%%%%%%")
         escreval("%%@@@@%@@@@@@@@%@%%%@@@@@@@@@%%%%%%##******#*#*####%##%%@@@@@@@@@@@@@@@@@@%@@@@@@@@@@@@@@@@%%%%%%%%%")
         escreval("%%%@@@@@%@@@%%%%%%%@@@@@@@@%%%%%%%@%%#######*###%%%%%@@@@@@@@@@@@@@@@@@%@@@@@@@@@@@@@@@@@%%%%%%%%%%%")
         escreval("%%%%%@@@@@@%%%%%%%%@@@@@%%%%%@@%%%#%%%@%%@%@%%%%%%%%%@@@@@@@@@@@@@@@@@@@@%@@@@@@@@@@@@@@@%%%%%%%%%%%")
         escreval("%%%%%%%@@@@%%%%%%%%%@@@@@@@@@@@@@%%%%%%%%%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%@@@@@@@@@@@@@@@@@%%%%%%%%%")
         escreval("%@%%%%%%%@@@@%%%%%%%%@%%@@@@@@@@@@@%%%%%%%%%%@@@@@@@@@@@@@@@@@@@@@@@%@@@@@@@@@@@@@@@@@@%%%%%%%%%%%%%")
         escreval("%%@@@@%%%%%@@@%%%%%%%@@@@@@@@@@@@@@@@%%%%%%%%%%%@@@@@@@@@@@@@@@@@@@@@@@%@@@@@@@@@@@@@@@@@@%%%%%%%%%%")
         escreval("%%%%%%@@%%%%%@@@%%%%%@@@@@@@@@@@@%@@@@%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%@@@@@@@@@@@@@@@@@@%%%%%%%%%%%%%")
         escreval("%%%%%%%%@@@@%%@@@@%%%@@@@@@@@@@@@@%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%@@@@@@@@@@@@@@@@@@@%%%%%%%%%%%%%")
         escreval("%%%%%%%%%@@@@@@@%%%%%@%%%@@@%%%%%%%%%%%%%%@@%%%%%%%%#####%%%%%%%%%@@@@@@@@@@@@@@@@@@%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%%@@@%%@%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%##########%%%%%%@@@@@@@@@@@@@@@@@%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%@@@@%@@%@@@@@@@@@@%%%%%%%%%%%%%%%%@%%%%###############%@@@@@@@@@@@@@@@@@@%%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%@@@@@@@%%%@@%%%%%%%%%%%%%%%%%%%@%%%%##############%@@@@@@@@@@@@@@@@@%%%%%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%%@@@@@@%@%@%%%%%%%%%%%%%%%%%%%%@@%%%%############%@@@@@@@@@@@@@@@@%%%%%%%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%%%%@@@@@%%%%%%%%%%%%%%%%%%%%%%%@@@%%%####*******%@@@@@@@@@@@@@@@@@%%%%%%%%%%%%%%%%%%%%%%")
         escreval("%@@@%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%@@@@%%%###******+#%@@@@@@@@@@@@@@@%%%%%%%%%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%@@@@@%%##***++++*%@@@@@@@@@@@@@@@%%%%%%%%%%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%@@@@@@%%##**++===#@@@@@@@@@@@@@@%%%%%%%%%%%%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%@@@@@@%%##**+++=+%@@@@@@@@@@@@@@%%%%%%%%%%%%%%%%%%%%%%%%%%%")
      fimse
      se casoIndex = 2 entao
         // Chef Gaston Moreau -- Cozinheiro

         escreval(":%%@%%%%%%%%%%%%%%%%%%%%%@@%@@@@@@@@@@@@@@@@@@@@@%%%%%%%%%%%@@@@%%%@@@@%%%%%%%%%%%%%@%%")
         escreval("..+%%%%%%%%%%%%%%%%%%%@@@@@@@@@@@@@@@@@@@@@@@@@@@@%%%%%%%%%%%@@@@@%@@%%%%%%%%%%%%%%%%*.")
         escreval("....@%%%@%%%%%%%%%%%%%@@@@@@@@@@@@@@@@@@@@@@@@@@@@%%%%%%%%%%%@@@@@@@@@%%%%%%%%%%%%@%%..")
         escreval(".....+%%%%%%%%%%%%%%@@@@@@@@@@@%%%%%%@@@@@@@@@%%%%%%%%%%%%@@@@@@@@@%%%%%%%%%%@@%%%%%%..")
         escreval(".......%%%@%%%%%%%@@@@@@@@@@@%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%@%@@@@@@@@@%%%%%%%%...")
         escreval("........+#%%%%%%@@@@@@@@@@@%%%#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%@@@@@@@@@%%%%@%#:....")
         escreval("..........*%@@%@@@@@@@@@@%@%%##%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%@@@@@@@@@@@@%*.......")
         escreval("%#.........-#%@@@@@@@@@@@%%#####%%%%%=-:.:-:----:----+%#%%%%%%%%%%@@@@@@@@@@@#=........")
         escreval("%%%%#########+#%%%%%%%%%%%%%#####%=.::..:---.-==-------:=%%%%%%%%%%%%%%%%%%%*#%#%%%%%%%")
         escreval("%%%%%%%%%%%%%%##%@%@@@%%%%%%%%%:.:-:.::.:=:-=---===-==-=:+%@@%%%%%%%@@%@@%%%%%%%%%%%%%%")
         escreval("#######%#%%%%%#%%%%@@%%%%%%%%:..:-:::....:::--=+++++====--:#%%%%%%%%@@@%%%%%%%%%%%%%%%%")
         escreval("%%%%%%%%%%###%%#%#%%%%%%%%%%#..::::........::-==++++++++===--*%%%%%%%%%%%%%%%%%%%%%%%%%")
         escreval("%%%####*#****+=+*####%%%%%#...::-.........::-==+++====+++=--+%%%%%%%####**********###%%")
         escreval("####*+=-=----:--=+**###%%%-.....-.........:--=++++=-:.:++==-*%%%%%%#+===------------=+#")
         escreval("##**+=-:-:::::---=++*###%%.....:-.........:-==++++==:..====-#%%%%%%#+------:---::::--=+")
         escreval("***++==--::::----==+**###%....:::.....:--=+=*##%%%+--:.-==:-@%%%%%#*+===------------==+")
         escreval("**+++=---::------==++**##-..::::..:::::-=++=+*#####*+=.:=-=#%%%%%%#*++=+====-------===+")
         escreval("++++==---::-----====+**##+..:::::::-=##*++++##%#%%##-*:::%%%%%%%%##*+++++==========+#%%")
         escreval("++++==-:-:---=+#%#%+++*###..:::=-:::=+#%%*:*#%%%%%%%%+===##%%%%%%%%##**+++++=======++*%")
         escreval("++++=-=:-:*%#########++*###=.:::+:::-:.-+#-.+##%####%%==+##%%%%%%%%###********+++++=*##")
         escreval("++++=+*###%######%%#***#####:::--::::---:.:=#%##%%#%+=-#%#%%%%####**+++****+++++++++++%")
         escreval("+++++*###%%%#%**#*#%#*########::--::-.::+:.+#%%##%%##+-#+##########***++++++++++****###")
         escreval("*++*++*#%%*%#+*#*##*##*##*##########*:::::=*=+=+###%###+*+=+###########********+**+***%")
         escreval("##****###+*#**#**##*#############-:---#-::-*+%%%%%#*+++#############+*##***********##%#")
         escreval("%#****+###*##**##*#*++*###########=---==--=++#%%%%%#++#%############-######*:#*****%%%#")
         escreval("#++**#%*##**#*###**#+:-###########%#:--*=::-+*##%%%%*+#%%###########-#######-*######%%%")
         escreval("%%#%%*#**##*##*###**+-:+#########%##--*-=-=*##%##%#=%%%%##########+*######**########%%%")
         escreval("%%%%%%%%*##**#####*+=::=############:-=---=*##%#+*++=%%%########%#=%#%####**########%%%")
         escreval("#######*#########*=:..*############=:-=---+**+*+#+#+:+%%########%-#%##%#%++##%#%%%%%%%%")
         escreval("###############*-....*##%########+...:--:-=**+*##%#*:.+#%##%%%%#:*%%%%%%++#############")
         escreval("##############**:...=%######%+.........-:--##*#%%#+=:.--++=#%%#%-*%%%%%%=%%############")
         escreval("#################:..=%#%#-..............:+-####+++-==-+-++:==:=%=*%%%%**%#######%####%#")
         escreval("#############%#%%#..=.....:...:..........-%##*-+===+:-=:+=:+---:+--+++%%#%#%%%%%%%%%#%#")
         escreval("####%%%%#####%##+:..-*...:-..:-..........-%%%*===:==.=-:==--:-::#:--%+:+%%%%%%%%%%%%%%%")
         escreval("####%%%%%#####*.....:**..:::.-:.................-=+.=:.-=:-:.::-#-:%-::.:.*%%%%%%%%%%%%")
         escreval("%%%#%%%%%%%%%......-+#%-.:-::=:..:-..........:-===.:==:=+:=.:-:%--%=..:*+:.%%#%%%%%%%%%")
         escreval("%%%%%%%%%%%%#.......+*%#-:--:+..............:=+==..=+=--..-.--+*-##..=*===:-%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%=........+#%+==-==:............:-+=-..-==:::.-:.=-%--%:.+*++--::%%%%%%%%%%%")
         escreval("%%%%%%%%%%%%.........**%%==-+=-......:....:-=+-..:=-:.:..=.:+#+:%=-+**=**+-.+%%%%%%%%%%")
         escreval("%%%%%%%%%%%*..........*#@**=*==:..........-==-...-=::::..=:=+%-%%=**+**++*+:=%%%%%%%%%%")
         escreval("%%%%%%%%%%%+........:-::-=**#++:..........===...:=-:::..:-++===**%=++++-+=#%-%%%%%%%%%%")
         escreval("#%%%#%%%%%%:.........--::::=+**-:.:......:==-...:-::..:--:-=##%%%%#+=:-+#+*%:=%%%%%%%%%")
         escreval("******%%###-........::::--=*##**+++=.....-=-...:::...:::-:==+*=====+++*#**#%:-%%%%%%%%%")
         escreval("##%@@@@%####........:-::.+#####***+=::..:-:..::::...-:---#---#%#%%#*###****#::%%%%%%%%%")
         escreval("@%%%%@@%%#%.........:::.:*##*#**###*=-::::::::::...::--++=++=*%*#+*##*#**=-::+#%%%%%%%%")
         escreval("%%@%@@%@%%+.........:-.:+##**###***#*+=---:::::..---=+*+**+##*%##%#*##***+-+.*%%%%%##%%")
         escreval("#%%%@%%@%%:..........-:-**##***#***#+==--:......:**++*####%#**%%####*#***-:=..@%#######")
         escreval("%%%%%%%%#+-............++++*****++#:..........:::++**####%#%%%%%%###**#++=:::..#%%%%%%%")
         escreval("@%%%%%%%%#......::::::=-*++==+=-............::::-+*+#%%%%%%%%%#*#######**+==--:+======+")
         escreval("@%%%%%%%#%:....::..::..:::.:......::.......:::::-+%#%%%%%%##%####***##***+==-:*###**###")
         escreval("@@@%%%%%%%=..:..::...::..::::...-+:..::....:::::=-%%#**+++::=*=-=+=::-=++=-=++-####%###")
         escreval("**####*++#+...:::.:..:...=:.::..++=.-:-:::-:::-:-+##**+-:::.-*-:*::+...:.-::-::%%%*#%#*")
         escreval("+++++#*#%%=..:..:--:.:..++:.::.:+==-::=---:..:++*=*##*+=-:::-*+--+=.:.-++==:.:.%#%*%%##")
         escreval("@@@@%#@@@#%.-+*-:=-:::.+++-....=+==-:-......:=+++.-###**+==--+*++==+--+*+*****#%%%%%%%%")
         escreval("%%%%%@%%%%#-:=-.-=-.:+*++*-.:=+++=--=:...:-=++=+-..####**+++-=****+=+=-=****#*%###*##*#")
         escreval("@%%%%%%%%%%%.:..++:.=*#**+:.=++++==--:.-+=-+===:.:*#####*****+=******+++**##*%%###*####")
         escreval("%%%%%%%%%%%%*..:=-.:***+-:-+*******+++.-+-:=-..:+####%%#####*****#####****#*@%%%######*")
         escreval("%######%%%%%%+.::.:*#*+==+**********##-=+=:.:=*######%###################+*#%%%%%%**+++")
         escreval("##%%%%@%%%%%%%*:-=**********######*###=.-+**######**#####################**%@%%@%@#****")
         escreval("####%%@%%%%%%%@%**##%#%################*********##########################%@@@%%@@%%#**")
         escreval("##%%%%%%%%%%%%%%%%-::.-+*#***##********++*****###**#####################%%%@@@%%%%%%##*")
         escreval("#%%@%%%%%%%%%%%%%%-:...:=*++=++******+++++++*******#############**-=++*%%%@@@@@%%%%@@%#")
         escreval("%@%%%@%%%%%%%%%%%@=::...:-:::---=+++===+++++++*****##*###########**+:-+#%%%@@@@@@%%@%%%")
         escreval("%%%%@%%%%@%%%%%%%%%%=::..::::.:::-==--+++=====++*******####*##***+++-+%%%%%@@@@@@@%@@@@")
         escreval("%%%%%%%@@@%%%%%%%%%%%#-=+=::....:::*=----====+++****-=*******++**#*%%%@%%%@@@@@@@%%%@@@")


      fimse
      se casoIndex = 3 entao
         // Alfredo Queiros -- Estudante

         escreval(":::::::::::::::.............................:::::::::::::::::::::::::::::::::::::::::::::::::")
         escreval(":::::::::::::::.............................:::::::::::::::::::::::::::::::::::::::::::::::::")
         escreval("::::::::::::::....................................:::::::::::::::::::::::::::::::::::::::::::")
         escreval(":::::::::::::......................................::::::::::::::::::::::::::::::::::::::::::")
         escreval(":::::::::::::............................................::::::::::::::::::::::::::::::::::::")
         escreval("::::::::::::.............................................::::::::::::::::::::::::::::::::::::")
         escreval("::::::::::::...............................................::::::::::::::::::::::::::::::::::")
         escreval(":::::::::::...................................::::==::::----::..:::::::::::::::::::::::::::::")
         escreval(":::::::::::................................::==%%%@@@@@@@@%%=+-::..::::::::::::::::::::::::::")
         escreval(":::::::::..............................::+*%@@@@%@@@@@@@@@@@@+::..:::::::::::::::::::::::::::")
         escreval("::::::::::..............................:=%@@@@@@@@@@@@@@@@@@@@@#:....:::::::::::::::::::::::")
         escreval("::::::::::..............................*%%%@@@@@@@@@@@@@@@@@@@@@*::.......::::::::::::::::::")
         escreval(":::::::::..............................+#%%#%%%@@@@@@@@@@%%%%%%%%+:.......:::::::::::::::::::")
         escreval(":::::::::.............................:*##*++++*##*++++++***%%%%=:......:::::::::::::::::::::")
         escreval(":::::::::.............................=##+--:::::--------===++*#%%*:......:::::::::::::::::::")
         escreval(":::::::::.............................=##+-::::::::::::---===+*#%%*............::::::::::::::")
         escreval(":::::::::.............................-##*-::::::::::::----==++#%%+............::::::::::::::")
         escreval("::::::::::.............................*#+--=+**+-:::-=**###*++#%%-............::::::::::::::")
         escreval("::::::::::.............................-#+=+==+**+=--+*###*++++*%%:.................:::::::::")
         escreval(":::::::::::...........................--*=--++%**=---+*#=#***+=+#*+*:...............:::::::::")
         escreval("::::::::::..........................:=:--::::-------++++==--===++=*-...............:::.....::")
         escreval("::::::::::...........................-=+:::.::::----=+++==--====+#+:...............:::.....::")
         escreval("::::::::::...........................:----:::::--=-=+++++====+++++=................:::.....::")
         escreval("::::::::::::..........................:::-::::---==++*+++===++++=-...........................")
         escreval(":::::::::::::............................:--::------=========+++:............................")
         escreval("::::::::::::::--............................::-++++++++**=+==+++:............................")
         escreval("::::::::::::::.........................:=--------==+===+++++++++:............................")
         escreval("-:::::::::::::..............=#%@@@@@@@@@%------------==+++++*++#@@@@+........................")
         escreval("--::::::::::::::.........-@@@@@@@@@@@@@@@@#---=------===++++**+++@@@@@@@@%=..................")
         escreval("--:::::::::::::.....:----#@@@@@@@@@@@@@@#----+++=++++***#****+%@@@@@@@@@@@%-:................")
         escreval("---:::::::::::::::--------@@@@@@@@@@@@@@#---===++*#####*******@@@@@@@@@@@@@@@@#:.............")
         escreval("---:::::::::::::---:-------=@@@@@@@@@@@@@@=--========++*******@@@@@@@@@@@@@@@@@@+-:..:::.....")
         escreval("----:::::::::::--::::::-----*@@@@@@@@@@@@@@+======++*********@@@@@@@@@@@@@@@@@%=====::::.....")
         escreval("----::::::::::--::::::::----=@@@@@@@@@@@@@@@@*==+++********@@@@@@@@@@@@@@@@@@*-=======-....::")
         escreval("-----:::::::::-:::::::::::--=*@@@@@@@@@@@@@@@@@@%%#####%@@@@@@@@@@@@@@@@@@@@=---=======::::::")
         escreval("------:::::::--::::::::::---=+@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@=---------====:::")
         escreval("------:::::::--:::::::::----=+%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-----------====:::")
         escreval("-------::::::--::::::::--====+%@@@@@@@@@@@@@@@@@@@@@@@%@@@@@@@@@@@@@@@@@@@+-----------====:::")
         escreval("--------:::::--::::::---==+++*@%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*---::------====:::")
         escreval("--------::::::--:::::--==+**##@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%@@@@@@@@@@=---:::------===-:::")
         escreval("---------:::::--::::---==*##%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%==----------===+:::")
         escreval("---------:::::--::::---=+**#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%+=---------===+-::::")
         escreval("----------:::--::::::--==+*#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*==-------===+=::::")
         escreval("----------::---::::::---==+*%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*==------==+++-::::")
         escreval("----------::---:::::::---==+*@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%+=------==++++::::::")
         escreval("----------::---:::::::----=+*#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*=-------===+++=:::::")
         escreval("----------:----:::::::----==+*%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%==---------====+=::::::")
         escreval("---------------:::::::----==+*#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#=-----------====+-:::::")
         escreval("---------------:::::::----==+**@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#=-----------====++-::::::")
         escreval("----------------::::::----==+**%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#==----------====+++-::::::")
         escreval("-------------=--::::::---==++**#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#==-----------====+++:::::::")
         escreval("-------------=---::::----==++**%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%=------------====+++-:::::::")
         escreval("-----------------::::---==+***#%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#=------------====+++=::::----")
         escreval("-----------------:--------=========++*#%@@@@@@@@@@@@@@@@@@@@@@==-----------====+++=-:--------")
         escreval("------------------------------------====+++*#@@@@@@@@@@@@@@@@+=-----------====+++=-----------")
         escreval("-------------:---------:-:-::::----------===++++++**#*######+===-------=====+++=-------------")
         escreval("-------------------------:::::::::::---------======-==----==-----=========++++=--------------")
         escreval("-----------------------::-::::::::::::----------------------------=====+++++=----------------")
         escreval("----------------=---------------:::::::::::::-----------:-----------====++++-----------------")
         escreval("-----------------==----------------------------=-------------::-----======+=-----------------")
         escreval("------------------=============--==========================++==------=========---------------")
         escreval("------------------=++**********#*******************#*****##%%*=------=========+=-------------")
         escreval("-------------------==+++@%#+==-----------=======++***###%%%%@@*=------=========++------------")
         escreval("-------------------===------=-------------------=====++*###%%%%+=----==========+++-----------")
         escreval("-------------------=--:::::--==---===============+++++**###%%%%%#===========+++**+=----------")
         escreval("--------------------:::::--======++++***************##+----==++++*+=======+++**+**++---------")
         escreval("===-----------------:::-==++*************########%%*=-:::::--=+++++*+===++**+*#++%*+=--------")
         escreval("====------==-------:---==+***********##********##*=---::::::--==+++*##*+=++%++**+##*+--------")
         escreval("=========-------------==**---===++++++*+**+*+**#*=---::::::::::--=+*####==+**++#**#*+--------")
         escreval("=========------------=+**----====++++++++**+++*#*=-----::::::::::--+####*+++#****+%#+------==")
         escreval("===========--------==+*+--=======+++==++#*%+*+**#=====--::::::::::-=+##%***###%#+-##=-----===")
         escreval("=======+=====-----=+**--------==+++++++#%@++++*#*==+==-----::::::--==*#%***++%#+---=----=====")
         escreval("======+=-=+======+*+---------====++=++*#%@%+++**=++==------::::---====+*%=--+#+-------=======")
         escreval("==*==+==+#=-=+**+------------==++++++**%%%%%*++====---===-=:::----=+===*#+------------=======")
         escreval("=++++==**--=*=--------------==++==+***#%%%%%*-+===----====-:---==-=+++=++=-----------========")
         escreval("=+++++#*=++*--------------===++==+****#%%%%%*:====--======----=+=-==++++++=--------==========")


      fimse
      se casoIndex = 4 entao
         // Renato Villares -- Rival musical

         escreval("================================----=------------------------------------====================")
         escreval("==========================-----------------------------------------------------==============")
         escreval("=======================-------------------------------------------------------------=========")
         escreval("=================---------------------------------------------------------------------=======")
         escreval("================-----------------------=+*************=-----------------------------------===")
         escreval("=============--------------------=#########%%%%%%########*+==--------------------------------")
         escreval("==========------------------+**###%%%####*******####%%%%###**+=------------------------------")
         escreval("========-----------------=*%%%%%%%########**##%##*%%%%%%%#####*##*+--------------------------")
         escreval("======-----------------+#%#####%#%%%%%%%%%%%%#**##%#%%%%%%%%#**##*#**=-----------------------")
         escreval("====-----------------=#######%###%%%###%%%%%%%%%%*#%%%%%%%%%%%#*+*%###*++--------------------")
         escreval("==-----------------=*######%%%%%%##%%%%%#%%%%#%%#%%%%%%%%%%%%#######*=-----------------------")
         escreval("=-----------------**#%#%%%%###**#%%%%%%%##*#%##%%%##**#%%#%%%%%#%%##*#%##=-------------------")
         escreval("--------------+*+##**#%%##%%%#**###%##***###%*#%%#****#%*#%%%%%%%%*#*#*###**==---------------")
         escreval("--------------+##**#####***####%%%%#*+**#**%###*##**+*##+#*%%%%%##****###%#**+---------------")
         escreval("-----------==++#####%%%#######%%%%##+++*###%%*+**#*****#*##%%#%%#%*#*+*#%%#%#+---------------")
         escreval("-----------*###########**+**+#%%%#****#%#%%%##*#******#*####*##%#**#*##%##*###*=-------------")
         escreval("-----------*###**###%########%%%%####*##%%%########*#*#****#****%#*###%###+*###**=-----------")
         escreval("----------+*######%#####***####%%##%####****###%###########*#*###**##%%##*#*##***+-----------")
         escreval("---------=**###*##%%%%######*******++++++++++++****++++++======+=====*#%#%%####*=-+----------")
         escreval("---------*#%##%###%%%%#**++====================--=-------------==-====*#%%#%%%%##++=---------")
         escreval("---------*####%%%##%%*+===========================--======---========***#####%%%##+==--------")
         escreval("---------*##%#%##%%#*=======================================--=======++*##%%##%%#*#+---------")
         escreval("---------*#%%%%#%##*+======================================------======++**####%#*#*=--------")
         escreval("--------=##%%######+===============================--====---------=======****#*#+*+*+--------")
         escreval("---------*#%######*+====================================--------------=-=+**#+***#++*--------")
         escreval("---------+*%%##%##**+=============================--------------------=-=++**#%*##*+*--------")
         escreval("----------*###*%**#*+============================----------------------==++**######**--------")
         escreval("----------=*####*###*====================================--------------==+*###%#####+--------")
         escreval("-----------#*#%###%#*===========================---------------------=--=+*####%%#%*---------")
         escreval("----------=#*####%%*+====================--====---------------------------=+#%%%##%+---------")
         escreval("-----------######%#+================----------------------------=-==-------=+%###*+----------")
         escreval("-----------###%#%%#======++++++==+++======-------------===++++++++++====----+#%##+-----------")
         escreval("-----------*####%%+=====+****####%%%##**++==-------==+**#%%####*#***++===---=*%##+-----------")
         escreval("-----------=####%#+===++****#####********++====---==++++++***+++==+++====---=##%*------------")
         escreval("------------=*####+=========++***#####**+++====----====++***+++==++==-------=#*#+===---------")
         escreval("----------+*+=+#%#========+**#%%%%%%%%##**++===------==+**#%%%%#%#*==*==-----=##===+*=-------")
         escreval("----------***+=+#+======+**%*=*##%##*##*+++===------===***+####*==##*==------+*===+*=--------")
         escreval("----------***+==++=====+++**#++++****###*+++===-------==+*****+++++++==-------=+--=+*=-------")
         escreval("----------+*++===+============++++*****+++====------====+**++=====-----------==--==*=--------")
         escreval("----------+**===+===============++++++=======-------============-------------++==-=+=--------")
         escreval("-----------+*==+*+=====---=======++===========-------------======-------------**+====--------")
         escreval("-----------=++++*+======--===================--------------------------------*=+====---------")
         escreval("------------+++*++============================-------=----------------------=*=++==----------")
         escreval("-------------++***==========-=================------------------------------=#+====----------")
         escreval("-------------=+=+*==========================---------==--------------------==*--==-----------")
         escreval("--------------+==*==================+++====-----------=-====---------------==*=--------------")
         escreval("--------------===++===============++++=====-=----------=======----------=-==+*---------------")
         escreval("---------------==**===========++=++++++=+++=====-=+++===========--------====**=--------------")
         escreval("-----------------=*+=============+++====+++++++=++====----======----=======+**---------------")
         escreval("-----------------+#*+===================+*##********+====--==------======++**+---------------")
         escreval("------------------##**++============+**##############*#**++==--------====+**#*=--------------")
         escreval("------------------*##*#*+=========**######%%##**#####**#****+-----====+**##**----------------")
         escreval("------------------=#####*++=====+**###**+*+++=======++++*###*+=--====++#*###*----------------")
         escreval("-------------------#######*+====*###%%#********+++++++++*#%##*+====++**#####=----------------")
         escreval("-------------------=#######*+==+**++=++++===============++=++++====+*##**##*-----------------")
         escreval("--------------------*#######*+++++======+===========-====--======++*######*------------------")
         escreval("---------------------*#######*+++=========+=============---====+++*######*=------------------")
         escreval("---------------------+*#######*+++======+++****+++++=====-=====++*######*=-------------------")
         escreval("----------------------+#*#%###***+=+====++*#######*++=========+**#####*+---------------------")
         escreval("------------------------**#####***+=+++++++****#***+=====-==+++**####*==---------------------")
         escreval("-------------------------=*######**++==============-------=+*#*****#+===---------------------")
         escreval("--------------------------=+#######**++++===========--=====+***####======--------------------")
         escreval("--------------------------==++######*#*****+++++=+++++*++++**#*###+======--------------------")
         escreval("--------------------------====+########*#********************####+=======--------------------")
         escreval("--------------------------=+==+*#%%#%#################***#*#####==========-------------------")
         escreval("--------------------------=+===++**##%##%###*#%%%%%#%########*++==========-------------------")
         escreval("--------------------------=====+++++*###%%#%%#%%%%%%%#%###%#**+==============----------------")
         escreval("----------------------=+*+=======++++***#%#%%%%%%%########*++=================***=-----------")
         escreval("-------------------+*#%*+========++++++++****#+*++*++++========================+##+=---------")
         escreval("----------------=++%#++++=========+++++=+++++++++++==============================+#*==-------")
         escreval("------------=+*+++%*+++++++=======+++++++++++++++==================================+#=+++=---")
         escreval("--------=++**+=+=#*++++++++========++++++++++++=============================+======*==+==-===")
         escreval("----==++++*+==++**+++++++++++====+++++++++++++++====================================+*=======")
         escreval("-===++*++**+++++#++++++++++++++++++++++++++++++++===================================+*=======")
         escreval("=+++++++++++=#++++++++++++++++++++++++++++++++==================================+#====++=====")
         escreval("+***++==++++=+++#*++====++++++++++++++++++++====++++=================================+*======")
         escreval("++++====+++++=+=*#++========++++++++++++++++++====+=================----===========*+-=======")
         escreval("+++++++++++++=++=#*+=========+====+++++++=========================-------===========#+=======")
         escreval("++**+++++++++=++*#*++=============+++++=======================--------===========+#==========")
         escreval("+++*+====+++++++==##+++==============++=======================-------============++*#=======+")
         escreval("++++=====+==++====+#*+++++=================-===============================+++++++++=========")
         escreval("+++++====++========##*++++++===============--------================================+===-=====")
         escreval("++*+=========++++++=**+++++++=====+++======-------================================+-=========")
         escreval("+**++===+++==========+++++++=============---------=============--=================-==========")
         escreval("**+===========++======+=================----------==============-==========----==============")
         escreval("*+++=====+++++++++++++==================------=---===============-==---------=-=+============")
         escreval("*++++====++++++++++++++=+================--===-----==============-=--=-----===+==============")
         escreval("++=======++==++++++++++++=+==================------========================--================")
         escreval("+++++==========+++======+++=+=================--=-=========================================-=")
         escreval("++======++++++++++++++==+++++=+==================--====================-=====================")
         escreval("+++++++=++++++++++++=======++++=====================-=-==--------===+========================")
         escreval("+++===+++++=======+===+++=+=+++**+=====================-------==-=+++++======================")
         escreval("++=======+++====+===============+++**++=============-=--===-=+++===================-===----==")
         escreval("+++++===++++=====+=========+++========+++**++++=====+=++++++======================-=====+++++")
         escreval("++++++++++++++===+=====+=+======+=+++=====++++++=+============+=========================+++++")


      fimse
      escreval("")
      escreval("  [ENTER para ver o proximo suspeito]")
      leia(jogarNovamente)

      // ---- SUSPEITO 3 ----
      limpaTela
      escreval("==========================================================")
      escreval("  DOSSIE  --  SUSPEITO 3 DE 3")
      escreval("==========================================================")
      escreval("")
      escreval("----------------------------------------------------------")
      escreval("  Nome   : ", nomeSusp[3])
      escreval("  Perfil : ", papelSusp[3])
      escreval("  Alibi  : ", alibiSusp[3])
      escreval("----------------------------------------------------------")
      escreval("")
      escreval("  NOTA: Os motivos serao revelados durante os interrogatorios.")
      escreval("  Leia os alibis com atencao. Nem tudo o que parece verdade, e.")
      escreval("")
      se casoIndex = 1 entao
         // Benedito, o Capataz

         escreval("+++++++==========--------==========-------------------------========================++++*##")
         escreval("+++++++++++++=++==----==================---------------------=======================++**##%")
         escreval("**++********++++++++++++++==-----===+++========------------========================++++**##")
         escreval("**++************************+=-------=+*******++++======+====+++++===================++++**")
         escreval("*++************************+=-------=+******+++++++++++=+++++++++==========+++======++++*##")
         escreval("***************************+=-----==**+++==++++++++++=======================++======+++*##%")
         escreval("*++***********************+++==++*++==----==+***++++=============================++**#####%")
         escreval("*++++********************++++++++==-------=+++++++++++++++====================++**########%")
         escreval("*++++************************++++++++==-------==+++++++====+++++==================++*####%%")
         escreval("++++******************+++++*+++++++++++==---==++++++++=====++++=============---===+*######%")
         escreval("++++**********##****+===--==++++++++++***++++++=----=++++++++++++==================++**####")
         escreval("+++*********+++***###**+=-----===+==+***##***++=--------===+******++======+===========+**##")
         escreval("+++****++++++***###*+=-----===+==++***#***+----------=====+*****+++++++++++++++=======+++**")
         escreval("++++***+++=+++**###*+===--===+++=++++++===-------------======+*********++++****++==========")
         escreval("*++++***++++++***##***++==----------------------------------==-==***##**++**#**++==========")
         escreval("**********************+=----------------------------------------+*****++++****++==++++===--")
         escreval("+===++****#***************=---------------------------------------=+*++++++****++==+++++---")
         escreval("+====+***###***************+=--------=*****##*+=-----------------------===++=---========--=")
         escreval("++=++******#**++++***+++++++==-------=++*******####+=---------------------:::::::--==----==")
         escreval("*************++++++++++++++++===-----=++*****##****++**+=------------=---::::::::----=====+")
         escreval("*++++***++*****++++++++++++++++++====-=+=+*+**###**++++++**++=-------==-----:::::---==++++*")
         escreval("***+****************++++++***+++====*+***###*###**+=+**###*#*=-------------:--------=**++++")
         escreval("*******++************+++*****++=====#*###**#**###****##**#**##+==-----------=========++++++")
         escreval("*++++++++++++=========+++++++===---==**##+****#########*##**###+==----------=***++++*#*++++")
         escreval("--==+++=====-----------------------+***********##**#######*#*#*++===---------=+++++*****###")
         escreval("---=++=---------------------------=++**#*+++******####*#%###**+======-----------=+******###")
         escreval(":--=*+---::::::::::---:::::::::::--=*##*+++****#**#####****#**+=--====-----------=++****###")
         escreval(":---=+---:::::::-------::::::::::--===+++**#*****######*###**++=---====-=------====+****##*")
         escreval(":--=++=------------==----------:----+**************########*=-=------====----==+++++****###")
         escreval("---=***+=--====--===========--------=+******#*******######+-----=============+*****###**###")
         escreval("----=**++===========================++*+++**********##***-------=--=+++++==++**########**##")
         escreval("----=***+++++++++++*++*++++++++++========+*************+------------=*+++++***##########***")
         escreval("-==**#****+++++++++++==========----------=++*#********=----------------==+****#########****")
         escreval("-=+*#**+==--------------------------:::::--=+*******+---------------------=***########***+*")
         escreval("--+*#**==------------------------::::::::-=-:=+****=-------------------------+*######*+++++")
         escreval("--=*#**+=-----------------------:::::::::--::--+*+--------=-------------------+######*+=+++")
         escreval("--=+#**+=----------------------:::::::::::::---------:::-=---------------------+#####*+==++")
         escreval("--=+#**=---::::::::::::::::::----=-:::::::::--------:::----:--------------------=###**+===+")
         escreval("--=+***=---::::---::::::::::--+***+=-::::::::-------------:--:-------------------+###*+===+")
         escreval("---=***+=-------------:::::=++++*****+-:::::---------::-::------------------------+###*++**")
         escreval("--=++++++=+++++++==---:::-+*+++******+-::::------::::-::--------------------------=##*+++++")
         escreval("--=*#*****##**+++++=---::-=++*+++******+:::-------::--::-----------------------------=-----")
         escreval("--=**********++=====---:--+++**++++****+:::-------::--:-------------------------------+-:::")
         escreval("--=***********+++===---:--+*****++=-=***-:-------:----:---::--------------=-----------+=:::")
         escreval("--***********+++===---:-=+*#%##*+++++**+---------------:::---------------=-----------+*=:::")
         escreval("=+****************+++=-----+=+*##%#+++*##%#*=----------:--::----------------==--------*=--:")
         escreval("*###************+++=---==**+-+###**=*#****=------------::-----------------=-------==+****+=")
         escreval("************+++++==---=**+++*#***##**+****-----------:------------------=-----==+***#######")
         escreval("+++++======-----------==+*****====+*++++****=---::---::------------------=---=+++***###**##")
         escreval("----------------:::::-==**++++*+====++++++****=-:----::-=+*****+==--------=--=++****####**#")
         escreval(":::::::::::::::::::::::-=+++=====+++=++++++**=-------==*#*#######+=-----=--=++*****#####**#")
         escreval("::::::::::::::::::::::::-+**--==++++==++++++=:-----+++*##*#########*==---==+++****#######*#")
         escreval(":::::::::::::::::::::::=+*+::-==++*+==++++=-----=**+*#%#*######%####*+-==++++****##########")
         escreval(":::::::::::::::::::::::-+**-:::-==+**+==++-----=+**++#%%#*######%%%####*+=++++****#########")
         escreval("::::::::::::::::::::::-+*+:::::--=+*+-==::--=++***+*#%%#*######%%%%####**+++*****##########")
         escreval("::::::::::::::::::::::=**-:::::---==---:::-++++**+*#%%%#**#####%%%%####***+**##**##########")
         escreval(":::::::::::::::::::::-+*+-::::::---:--::-=+++++**+#%%%%#**#####%%%%##%##*+**####**#########")
         escreval(":::::::::::::::::::::-+*=:::--:::::--::-=+**+=*#**%%%%%**###%%%%%%%%%%##*+*#####**#########")
         escreval(":::::::::::::::::::::=*+-:::--::::--::-+****++*#*#%%%%%#%%%##%%%%%%%%%###*+*######*########")
         escreval("::::::::::::::::::::-+*+-::--+*=::----=+****++*###%%%%%#%%%##%%%%%%%%%##*+**###############")
         escreval(":::::::::::::::::::::=**=:::--*#=::---=+*****++*##%%%%%%#%%%##%%%%%%%%%##++*###############")
         escreval(":::::::::::::::::::-+*+-::::-=+--:--=*******+*###%%%%%%%%%###%%%%%%%%#*+*##################")
         escreval("::::::::::::::::::::-**+:::::-==--=++*****+*##%%%%%%%%%%%##%%%%%%%%#*+**###################")
         escreval(":::::::::::::::::::=**=:::::-===+*****++****+*#%%%%%%%%%%%%##%%%%%%%%#***##################")
         escreval(":::::::::::::::::::-+*+-::::--=+++*********#*+*%%%%%%%%%%%%#####%%%%#*+*###################")
         escreval(":::::::::::::::::::-**=::::::=+*++*##******#*+*#%%%%%%%%%%%%%%###%%%%*++*##################")
         escreval("::::::::::::::::::-=**-::::-=+*+++*##****###***#%%%%%%%%%%%%%%%##%%%*==+*##################")
         escreval("::::::::::::::::::-+*+::::-=+***++*###**###**#**#%%%%%%%%%%%%%%%%%%=-=**##################%")
         escreval("::::::::::::::::::=**=:::-++****++*##########***#%%%%%%%%%%%%#*#%%#+==+**##################")
         escreval(":::::::::::::::::-+*+-:-=+*******+*##########*###%%%%%%*++++++*#%#+++**####################")
         escreval(":::::::::::::::::-**=-=+****##***+*##############%%%%#+=++++***##*+**######################")
         escreval(":::::::::::::::::=*+++****####***+*####%#########%%%*====+++*#*****########################")
         escreval("::::::::::::::::-**+***######******####%#######%%%%#++====++*##*+*#######################%%")
         escreval("::::::::::::::::=**=-=*######****##%##%%%%%%%%%%%%%#++++++*###**+**#####################%%%")
         escreval("::---::::::::::-+*+=::-+**##****##%####%%%%%%%%%%%#*****###*****+*#####################%%%%")
         escreval("--:::::::::::::-++=:::::=++**###%%%####%%%%%%%%%%**##########*+*#########################%%")
      fimse
      se casoIndex = 2 entao
         // Sra. Conceicao Almeida -- Secretaria
         escreval("+++++++++++++++++++++++++++++++++++++++*****++++++++++++++++++++++++++++++++++***************")
         escreval("++++++++++++++++++++++++++++++++++++***%@@@%#**++*********++++++++++++++++++++++++++*********")
         escreval("=================++++++++++++++**###%@%%%@@@@@@@@@@%%@@@%%%%%%##****++++++++++++++++*********")
         escreval("========================++++++*#%%@@@@%%*#%@@@@@@%%%%%@@@@@@@@@@@@@@%#***++++++++++++++******")
         escreval("========================++++##%%@%@@@%%#+%%%@@@%%@%@%%%%@@@@@@@@@@@@@@@%**++++++++++++++**+++")
         escreval("=======================++++*#%%%@@%#%%#*#%%%%#%%#***#%%%%%@@@@@@@@@@@@@@%#+++++++++++++++++++")
         escreval("======================++++*##*#%%%*#*+**#***#*##*++**+++*#%%%@@@%%@@@@@@@@*++++++++++++++++++")
         escreval("=====================++++##**%%#**=+===+*+*++===++*+==-==++***#%####%%@@@@%#+++++++++++++++++")
         escreval("=====================+*=*#%**%%###*++=+**#%##*#**#**###**+====+*#+=****%@@@@%#+++++++++++++++")
         escreval("=====================+=*##%##%%##%%%%##%%@@@@%%%%#%%%%%#%%#**+=+*##+++#%%%@@@%*++++++++++++++")
         escreval("=====================+*%#%%%%%%%@@@@%%%@@@@@@@@@%%@@@@@@@%%%%%#%@@%%%@%%%@@@@@#++++++++++++++")
         escreval("=====================+*%@%@@%%%%@@@@%%@%@@@@@@@@@@@@@@@@@@@@@%@@@@@@@@@%###%%@@@%*+++++++++++")
         escreval("=====================+*%%%@@@%@@@@@@%%%@@@@@@@@@@%%%%@@@@@@@@@@@@%###*++*%@@@#+++++++++++++++")
         escreval("=====================++@@%%##%%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%%@@@@@%%#**%@@@#+++++++++++++")
         escreval("=======================%@@@%%%@@@@%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%@@%%**#%%@@%#++++++++++++++")
         escreval("=======================*%@%%%@@@%@@%%%%@%%@@@@@@@@@@@@@@@@@@@@@@@@@%@@@@@@%%**+++++++++++++++")
         escreval("======================++%%%%@%%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%@@%%*+++++++++++++")
         escreval("======================+%%%%@%@@@@@@@@%%%%%%%%%%%%%@@%%%%%%%%%%%%@@@@%@@@@@#****++++++++++++++")
         escreval("-=====================#@@%%@@@@@@%@@%%%%%%####%#%%%%%#####%%%%%%%%%%@@@@@@#++====++++++++++++")
         escreval("-------==============+%%%@@@@@@@@@@%%%%#####*****###**********#######%@%%%%@#*++===++++++++++")
         escreval("---------=====-==-===#%%@@@@@@@@%%%%%####**#***+++++++++++++++++*****#%##%%%%#*++====++++++++")
         escreval("----------==---==--=*%@@@@@@@@@@@%%%%%##*#**+++===================+++++++#%%%#*++====++++++++")
         escreval("----------------=-=+%@@@@@@@@@@@%%%%%##*++====---------------------======+++#%%#*+======+++++")
         escreval("----------------=-=*@@@@@@@%@@@@@%%##**++===-------::::--::::::--------=====*#%%#+========+++")
         escreval("----------------=-=@@@@@@@@%%%%%%%%#***+=------::::::::::::::::::::------===+*###+=========++")
         escreval("----------------=-+@@@@@@@@%%%%%%##**+===-----::::::::::::::::::::::--------=+###*===========")
         escreval("------------------#@@@@@@@@%#%%##**++===-----::::::::::::::::::::::::::------=+#*+===========")
         escreval("-----------------=@@@@@@%%%%%####**++==------:::::::::::::::::::::::::::-----==**============")
         escreval("-----------------+@@@@@%%%%%%###**+===-------::::::::::::::::::::::::::::----==+*+===========")
         escreval("----------------=*@@%@@%%%%###**++===--------:::::::::::::::::::::::::::::----==+============")
         escreval("--------------=+=-=*#%@@%%%##*++====--------::::::::::::::::::::::::::::::----==+============")
         escreval("-------------=++*#=-+#%@@%#*++=====--------:::::::::::::::::::::::::::::::-----==+===========")
         escreval("--------------=+++#*=*%%%%#*+======--------::::::::::::::::::::::::::::::-----==+============")
         escreval("--------------:---=*#*#%%##*+======---------======-:::::::::::::::::::::::-----=++===========")
         escreval("------------------=*##*###*++======------=======++***+--::::::::::::::::::---==++============")
         escreval("-----------=-=--:::=*******++=====----------------=+*###*+=-:::::::::::::----==++============")
         escreval("-----------====-::::=+*##*++=====-----=====++******+++*###**+--:::::::-----=+*#*=============")
         escreval("-=====-========-::::--+***+=====------==++***%%%%%#*++#*****+=-------=+**#%%%%%#+============")
         escreval("===============---::==+**++=====----:::-=+##*++*%*+==#*++++==-------+%%%@%*****+=============")
         escreval("================----:=***++++===----:::::--=+=-++-:::-++====--:::-=#@@%%#***@%*==============")
         escreval("===============++-:--=*+++++++==----:::::::---=-=====---::----:::-=+*##*+=%@@#+==============")
         escreval("==+++++++++++++++*=-:-**+++**++==----:::::::::--------::::---::::---==+=-=*##++==============")
         escreval("++++++++++++++++*%%*+=+*++++**+===----::::::::::::::::::::---::::-----==+*##+================")
         escreval("++++************#%%@%%%#*+++++++===----:::::::::::::::::::----:::------==+++=================")
         escreval("****************#%%%@@@%*++=+++++===----:::::::::::::::::----::::---------===================")
         escreval("**###############%%%%@@%*++==+++++===-----:::::::::::::------::::---------===================")
         escreval("#########%#%###*##%%@@@%#++====++++===-------::::::::--------:::::--------===================")
         escreval("####%%%%%%%#####%%%%%%@@#*+=======++====-------::::::--------:::::-------====================")
         escreval("#%%%%%%%%%%###%%%%%%%%%@#*++=============------::::::-+++***+=----------=====================")
         escreval("%%%%%%%%%#%%%%%%%%%%#*#%@%#*+============------:::::::::-===+#*++**=----=++==================")
         escreval("%%%%@%%%%%%@@@@@%%#*++*@@%#*+=========--------::::::::::::--+%@%#+---==++====================")
         escreval("%%%%%##@%@@@@@@@%#*==++#@%%#*+=========------------::::::::---------=+*+=====================")
         escreval("%%@@%@%@@@@@@@@%#+=====+%@%%#*+=======--------=+*+=-------------===++*=======================")
         escreval("%@@@@@@@@@@@@@%*+=======+%@@%#*++======---------==+*#######*###%%#+++========================")
         escreval("@@@@@@@@@@@@@%*+==------=*%@@@%#*++=====----------=+++===++****#*=++=========================")
         escreval("@@@@@@@@@@@@#+====-------=*%@@@%%#*++====-----------=+*******#*+=++==========================")
         escreval("@@@@@@@@@@%*+====---------=*%@@@@%%**++===----------===++***+++=++===========================")
         escreval("@@@@@@@@%*+=====-----------=+%@@@@@@%#**+===---------------===++=============================")
         escreval("@@@@@@%*++==-----------------+#%@@@@@@%%##*+==--------------==+==============================")
         escreval("@@@@%*++==--------------------=*%@@@@@@@@@%#*+==-----------=++===============================")
         escreval("@%#**+===----------------------=*%@@@@@@@@@@@%#*++========++=================================")
         escreval("#**++===-----------------------==+#%@@@@@@@@@%*++********+===================================")
         escreval("*++===--------------------------==+*#%@@@@@@@@@@%#*++========================================")
         escreval("+===-----------------------------===+*%%@@@@@@@@@@@@@%%#**+==================================")
         escreval("===------------------------------===+**#%%@@@@@@@@@@@@@@@@%%%####*+=========================+")
         escreval("==-------------------------------====+*##%%@@@@@@@@@@@@@%##*******####+=================+++++")
         escreval("==-------------------------------====++*#%%@@@@@@@@@@@@%%*+++++++****###*+=============++++++")
         escreval("===------------------------------=====++#%%@@@@@@@@@@%##*+++++++++++***###*+=================")
         escreval("========-==========-------------=======+*#%%@@@@@@@%###*++======+++++++**###*============++++")
         escreval("=============================---=========+*##%%%%%####*+===--=======+++++**##*=========+====+")
         escreval("+=====-=--------============================+++***##*#++==-----========+++**##*=======++====+")
         escreval("======-=--------------==============+===----==++++*##*+==-------========++++*##+===++=++++===")
         escreval("========------------------==========++==----===++*##**+===------=========+++**#*+==+++==++==+")
         escreval("==========----============-=========+++==---===+**##**++===----==========++++*##+===++++===++")
         escreval("=============--====================+++++======++*##***++===================+++**#*====+++++++")
         escreval("======+++++=======================+++++++====++**#****+++=================+++**##++++++++++++")
      fimse
      se casoIndex = 3 entao
         // Sr. Pedro Inacio Braga -- Hospede veterano
         escreval("-----------------------------::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::")
         escreval("------------------------------:::::::------========---:::::::::::::::::::::::::::::::::::::::")
         escreval("------------------------------------==+******###%###***+=---:::::::::::::::::::::::::::::::::")
         escreval("--------------------------------=+*##%%@@@%%%%%%%%##%##*****++=--::::::::::::::::::::::::::::")
         escreval("-----------------------------=+#%%%%@@@@@%%%%%%%%%%%%@%%#*******+=-::::::::::::::::::::::::::")
         escreval("----------------------------+#%%@@%%%%@%%%@@@@%%%@@@%%@@@%###**##*++--:::::::::::::::::::::::")
         escreval("--------------------------+#%%%%@@@@@@@@%%@@@@@@@@@@%%%@@@%#%%##*****+=-:::::::::::::::::::::")
         escreval("-------------------------*%%%@@%@@@@@@@@@@@@@@@@@@@@@%%@@@%%%%%%%#####*+=-:::::::::::::::::::")
         escreval("--------------::-------=*#%@@@@@@@%%@@@@@@@@@@@@@@@@@@@@@@@@%%%%%@%%%%%%%*+-:::::::::::::::::")
         escreval("-------------:::::-----+%%%%%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%@@@@%%##%%#*--:::::::::::::::")
         escreval("-------------::::::---+#%%@%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%%##*+-:::::::::::::")
         escreval("------------:::::::--=*%%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%%%%%%%%%%%@@@@@@@@%%#*+-:::::::::::::")
         escreval("-----------::::::----=*%@@@@@%%%%%%######%%##%%######**+++*****%@@@@@%@%%##*=-:::::::::::::::")
         escreval("----------::::::::---=*%@@@@#*****+++==+=++++============----==+*%@@@@@@@%##*+-::::::::::::::")
         escreval("----------:::::::::--=*%@@@#*++++++=========-------------------==#%@@@%%%%##*+=-:::::::::::::")
         escreval("---:---:::::::::::::--*@@@#*++==+++====-------------------------=+#%%%%%%%##**=-:::::::::::::")
         escreval("-::::::::::::-:::::::-*%%%#++====++===--------------------------==*%%%%%%%#***=-:::::::::::::")
         escreval("::::::::::::::::::::-+%%#*++====++++===------------------------==+#%%%%####*+=-:::::::::::;::")
         escreval("::::::::::::::::::::-+%#++++=========--------------------------==+#%%%%###**+-:::::::::::::::")
         escreval(":::::::::::::::::::--=#+=++++++++===========--------------------=+*%%%#%##*+=-:::::::::::::::")
         escreval(":::::::::::::::::::--=*+=+*#%%%@@%%##****++=++===-------------===+*#######*+-::::::::::::;:::")
         escreval(":::::::::::::::::::-=+**++*#***#%%%%%%%##**++++****++===--------====+*####**++-::::::::::::::")
         escreval(":::::::::::::::::--==++++++**#%@@@@@@%%#*+++**###%##****+=-------==+******+=-::::::::::::::::")
         escreval(":::::::::::::::::::-=+++++***%@%%@@%**###*+=+*#%%%%@@%%%###*+=======+*****++-::::::::::::::::")
         escreval("::::::::::::::::::--==+*******++****###***====+*%%%%@@@@%#++***======+***+++--:::::::::::::::")
         escreval(":::::::::::::::::---+*#*+++=+++++++*++=====+*++#%%#****##*++++====+**++++=--=-:::::::::::::::")
         escreval("::::::::::::::::--=**#*+++========+++*+-====+++++++++++++++++======+**+=====++-::::::::::::::")
         escreval("::::::::::::::::---=**#**++==========++=-====++======+=======---=====+*+=+++=++-:::::::::::::")
         escreval(":::::::::::::::::--+*##**+++========++=-==--=+==--=========----======+*+++===++-:::::::::::::")
         escreval(":::::::::::::::::-=++*#**++++=====+**=-==---=++==--==---==----=======+++#*++=+=-:::::::::::::")
         escreval(":::::::::::::::::--=++##**++++++=+*++====----==+==----------======++**+**+**+==-:::::::::::::")
         escreval(":::::::::::::::::--=+*##**++++++******+++++==--=====------=======+****====+*+=-::::::::::::::")
         escreval("::::::::-::::::::---=+*##*+++++***+++**##**++**+==+===----=====+++***+====+===-::::::::::::::")
         escreval("::::::::::::::::::----+%%#**+++++*#%%%%#####*++=-=++==========++***##+=====+=-:::::::::::::::")
         escreval("::::::::::::::::::----=#%##**++*#%%%%%%%%%%%%%###*+==========++***#####*+==---:::::::::::::::")
         escreval("::::--::---:::::::----=#%%%#**#%%##**#**########%#*+=======++*#####**++==---:::::::::::::::::")
         escreval("--:---:-----:::::------*%%%####%%%%%%###%#####*#####*+====++*######+------:::::::::::::::::::")
         escreval("-----------:::::::-----+#%%%%%%##*+++*********#%%#*##**++++*####%#+-:::::::::::::::::::::::::")
         escreval("------------::::::-----+*%@%%%%##****++++++++++****##*+*####%%*=-::::::::::::::::::::::::::::")
         escreval("--------------:::------=+#@%%%%%##****#######***++**#####**###%%*+-::::::::::::::::::::::::::")
         escreval("---------------:-------=++#@%%%%%%#*+*##%%###******########%%%#+-::::::::::::::::::::::::::::")
         escreval("----------------------==+++#@%%@%%#*++*###**++++**#########%%%#+=-:::::::::::::::::::::::::::")
         escreval("---------------------==++++*%@@@%%#**+******++**#*######%%%%%*+=-::::::::::::::::::::::::::::")
         escreval("----------====---======+++++*%@@%%######******#######%%%@@@%*+=--::::::::::::::::::::::::::::")
         escreval("--------=@@@@@@@@%*====++++++*#%@@%%%#%##**#####%%%%%%%@@@%*+==-:::::::::::::::::::::::::::::")
         escreval("-------*@@@@@@@@@#+====+++++***#%@@@@%%##%%%%%%%%%%@@@@@@#*++==-:::::::::::::::::::::::::::::")
         escreval("------#@@@@@@@@@@%*=++==++++***###%%@@@@@@@@@@@@@@@@@@@%#*++==--:::::::::::::::::::::::::::::")
         escreval("-----+#@@@@@@@@@@@%*++===++++****###%%%@@@@@@@@@@@@@%#**++=++=--:::::::::::::::::::::::::::::")
         escreval("---+##*#%@@@@@@@@@@@@*+====++++****#####%%%%%%%%%%%#**++++++++*=-:::::::::::::::::::::::::--:")
         escreval("-+##**##**#@@@@@@@@@@%*===++++++********########**+++++++++++%%*=-:::::::::::::::::::::------")
         escreval("##+*##+==*%@@@@@@@@@@@@@%*+=++++++++++++***********++++++++++#@@@@*--::::::::::::::----------")
         escreval("+*#*=-=#@@@@%#%@@@@@@@@@@%*++++++++++++++++++++++****++++++++%@@@@@%*=-----::::::::----------")
         escreval("*+=-+%@@@%+=+++*%@@@@@@@@@@@@#**+++++==++++++++++*++++++++++*%@@@@@@@%*=-------:-------------")
         escreval("=-*%%%%#+===+++++*#@@@@@@@@@@@@%**++=======++++++++++++++++*#@@@@@@@@+=++=-------------------")
         escreval("+#%%%*=======++==++*%@@@@@@@@@@@@%#*+====================++*%@@@@@@@@+=-==++=----------------")
         escreval("*##+=======++======++*%@@@@@@@@@@@@@#*+===++++=========++++#@@@@@@@@%+======++=--------------")
         escreval("=+=======++++++=======+*%@@@@@@@@@@@@%#+==+**++++===++++++*%@@@@@@@@@#+=======+**=-----------")
         escreval("-========++++===========++#@@@@@@@@@@@@@%*****+++++++++=+*#@@@@@@@@#+=========-=*+-----------")
         escreval("====+=+++++================+#@@@@@@@@@@@@@@%%##**++++++**%@@@@@@@@#++==========--=*+---------")
         escreval("====+++*++===================+*%@@@@@@@@@@@@@@@%#**+*#%@@@@@@@@@@@#+++===========---=*=------")
         escreval("====+++++======================++#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*++==============----=+=---")
         escreval("======+++=========================+*%@@@@@@@@@@@@@@@@@@@@@@@@@@#++=================----===---")
         escreval("=====================================+*%@@@@@@@@@@@@@@@@@@@@%*++======================----==-")
      fimse
      se casoIndex = 4 entao
         // Carminha, a Copeira

         escreval("@@@%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
         escreval("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
         escreval("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%@@@@@@@@@@@@@@@@@@@@@@@@")
         escreval("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%@@@@@@@@@@@@@@@@@@@")
         escreval("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%###%%%%%%%%%%%%%%%%%@@@@@@@@@@@@@@@@@")
         escreval("%%%%%%%%%%%%%###########################################%%%%%%%%%%%%%%%@@@@@@@@@@@@@@@@@@")
         escreval("%%%%%%########################################**##%%%%%%%###%%%%%%%%%%%%%%@@@@@@@@@@@@@@@")
         escreval("%%######################*#*******#%%%%%*+++*****######%%#++*#%%%%%%%%%%%%%@@@@@@@@@@@@@@@")
         escreval("###############************+++*#%%%%%%%%#++++++*********#####**##%%%%%%%%%%%%%@@@@@@@@@@@")
         escreval("##########**************++===*%%%%%@@%%#*++++*++++=======++*##**#%%%%%%%%%%%%%%@@@@@@@@@@")
         escreval("######****************+++=-+#%%@%@@@@@%##**++===============+*#**##%%%%%%%%%%%%%%%%@@@@@@")
         escreval("###***************++++++==*#%%%%%@@@@%%##*++========-------===*#++*#%%%%%%%%%%%%%%%%%@@@@")
         escreval("#************+++++++++=-=+#%%%%@@@@%%%#**++=====-------------==*#*+*#%%%%%%%%%%%%%%%%%@@@")
         escreval("**********+++++++++++=---#%%%@@@@@%%%#**+++=====-------------===****###%%%%%%%%%%%%%%%%@@")
         escreval("*******++++++++++++=-::-*%%@@@@@%%*%##**+++======------------===+%***%###%%%%%%%%%%%%%%%@")
         escreval("******++++++++++===-::-*%@@@%%@@%*#%##**++++====--------------===#%##%%###%%%%%%%%%%%%%%@")
         escreval("****+++++++++++======#*%@@%%@@%#*#%###**+++++***++=--:----======*@%#%%####%%%%%%%%%%%%%%%")
         escreval("***++++++++++++==-=+++*%%%%%@@@@###%%#**+++*****+++==----=++**+==*%%#%########%%%%%%%%%%%")
         escreval("*++++++++++++====-++==+#%@%#@@@@@@%%#%###*#%#+++**===+=---====*##*==%%#%#*#######%%%%%%%%")
         escreval("+++++++++++======*##%#+*#%@@@@@@%%##**+*%*+==++=+--==----=--=+#%**%%*******######%%%%%%%%")
         escreval("+++++++++=====%%%%%#@@@%%#%@@@@@%%#*+=======--------==-------++#*##*+*******######%%%%%%%")
         escreval("+++++++======*%%#=##@%@@@@@@@@@@%%%#*+==------------====--------==**++**+*****#####%%%%%%")
         escreval("+++++========+**++#%%%@%@@@@@@%%%%##*+=------------=+==----------=+++++++*****######%%%%%")
         escreval("++++=========--=+%@#**%%%%%@@@@@%%%#*+==----------+++##====------=*+++++++*****######%%%%")
         escreval("+++=========--=-+#%@%*#%%##%@@@@@@%%#*+==-------:-=+==++++=------=*+++++++++****######%%%")
         escreval("++============-==-+##%%%%#%%@%%@@@%%#*++====-------==-----------=+**+==++++++****#####%%%")
         escreval("+============--*+++**+#%@%%%#%@%%%%%#**+++=====--===++++*+------=***+===++++++*****####%%")
         escreval("=============-+#%=*#%####%%%##%@@%%%##***++++====+#%%%%%%%%#=--==+%%#*+===++++++*****##%%")
         escreval("=============+#%*=+%@%%%%%@#**#%@%%%##****++++=+%%%%###*#%%*===+#@%%#+====++++++****####%")
         escreval("=============+%%#%%%@@@@@@@%#*#%@@%%###****++++==*###***##*+===+@@%%#+=====++++*****#####")
         escreval("================#@@@@@@@@@@@@@%%@@@@%%%###***+++++=============+*#%%#=======++++++****###")
         escreval("=============-=+#@@@@@@@@@@@@@@@@@@@@%%%###***++++==-------==++++===========+++++*****###")
         escreval("============-====*#%@@@@@@@@@@@@@@@@@@%%%%###***+++==-----===++===---========+++++++#####")
         escreval("================-==*%@@@@@@@@@@@@@@@@@@@%%%%%%###**+++=====+++=------========+++++****###")
         escreval("===============---+##%%%%%%@@@@@@@@@@@@%%%%%%%%%#######***+*+--------=======+++++++######")
         escreval("================-=+#%%@@@@@@@@@@@@@@@@@@@%%%%%########***+*#=---------=======+++++++*####")
         escreval("===================+##%@@@@@@@@@@@@@@%@@%%####*******+++=++-----------=======+++++++#####")
         escreval("=======================*%%@@@@@%#%@@%%@%%#**+***++++=====++=--------========+++++++***###")
         escreval("======================--=+#%%%*++*%@%%%%%#**++++++=====-==++*+------=======++++++****####")
         escreval("============================++====#@%%%%%#**+++++=====---==++++++=--=======+++++*****####")
         escreval("==========================-====---#%%%%%%#*+++++++====----===+++++++=======++++++****####")
         escreval("==============================---=#%%%%%%%#*++++++++====----====++===++++==++++++****###%")
         escreval("=============================----*#%%%####**+++++++=======--===+++====++**+++++****#####%")
         escreval("+============================--=+*#%%%##*#***++++++===========+++++++++++***++*****#####%")
         escreval("++=====================+=++++++++*#%%%#*+*********+++===========+********++++++++++**##%%")
         escreval("++++=================-=+++=======+*#%%%*==+******+++++==========+***++++++++++++++**###%%")
         escreval("+++++=============---=======----====+*%#+==+*****+++++=======+++===+++++++++++====+++*#%%")
         escreval("++++++=========-::-++=--==+===+**++===%%+==+****+++++====++======++****+++++=========++*%")
         escreval("+++++++======::--***+=+*#%@@#+=====+#*##*=-=+**++++++++++=====++**##***++++===----=====+*")
         escreval("+++++++++==--+++#+#*==+%#%@@%*+==+++*==#*==+****++++++++++++***#%##***+++==-------===++++")
         escreval("++++++++++=+#%%#*%#+==+*%%%%%%*==-*@%+==++=+*********************%%%###**++===--------==+")
         escreval("++++++++++*%%%@%%#*+=-=*%@%%%%%*=--+%#+===++***++++*************#%%%%%##**+===--------==+")
         escreval("++++++++++%@@@@%%%*+=-=#%##%##%#+=--=#%*=-=+++++++++++++++++++**#%%%%%%##**+===-------===")
         escreval("+++++++++*%@@@@@%%%*====#%#%#*#%#+----*%*=-=++++++++++++++++++**#%%%%%%%%##*++=====----==")
         escreval("+++++++++*@@@@@@%@%#+=-=+%%%%**##*==---+*+==-=++++++++++++++++**##%%%%%%%%##*+++=====-===")
         escreval("*++++++++#@@@@@@%@%#*+=-=*%%%#**#*+==----==---=++++++++++++++++***##%%%%%%%##*+++========")
         escreval("****+++++#@@@@@@@%@%#+====#%#%#*#*+==---------=++++++++++++++****##%%%%%%%%#**+++========")
         escreval("******+++#@@@@@@@%@@%*+===*##%%#***+==--------=++++++++++++++*****##%%%%%%%##**+++=======")
         escreval("*********#@@@@@@@%@@%#+===###%%%#**++==-------=+++++++++++++******###%%%%%%##**+++=======")
         escreval("*********#@@@@@@@%%%%#*+==#%%#%%%#*++===------=+++++++++++++*******##%%%%%###***+++======")
         escreval("#********#@@@@@@%**%#*+===*%%%%%%%#*++===-----=+***+++++++++*******#%%%%%%%###***+++=====")
         escreval("####*****#%@@@@#+##%#*+==+#@@%%%%%%#*++===---==+*******++++++*******#%@%%%%###***+++++==+")
         escreval("##########%@@@@*+##%#++=++%@@@%%%%%##*+====---==*******++++++++****##%@%%%%###****+++++++")
         escreval("##########%@@@@=-*##*+===+#*%@@@%%%%##*+====--==+******++++++++*****#%@@%%%####***+++++++")
         escreval("###########%@@%++-+*+======#%@@@@%%%###*+====--==+******++++++++****##%@%%%%###****++++++")
         escreval("%%%########%@@%*##+===--==-+#%%%@@%%##%#*++===---=+*******+++==-::--=+#%%%%####*****+++++")
         escreval("%%%%%%%%%%#%@@@**##+#==-===*###%%%%%%####*++===---=+***+==-----------=*%%%%####******++++")
         escreval("%%%%%%%%%%%%@@@%%#*=#==-===***##%%%%%%%%%##**++==---========----------=*%%%%%###****++***")
         escreval("%%%%%%%%%%%%@@%#%%#++-=-=+*+++**#%%%%%%%%%###**++==---=========-------=+#%%%%###******+++")
         escreval("%%%%%%%%%%%%@@#%@@@%%**++*#*++***#%@@@%%%%%##***+==---===------------=+#%%%%###******+++*")
         escreval("%%%%%%%%%%%@@%%@@%%#**+++*********#%@@@@@%%%%##**++==--====-----------=*%%%%###*****++++*")
         escreval("@@@%%%%%%%%@@#%@%%%#*++++**********#%%@@@@%%%%%##**++=========-------==*%%%%%##******++**")
         escreval("@@@@@@@@@%%@%%@@%%%#**+++*###*******##%%%%%@%%%%%##**+==========-----==*%%%%%###******++*")


      fimse
      escreval("")
      escreval("  [ENTER para acessar o menu de investigacao]")
      leia(jogarNovamente)

      // ============================================================
      //  MENU PRINCIPAL
      // ============================================================
      continuar <- verdadeiro

      enquanto continuar faca

         limpaTela
         escreval("==========================================================")
         escreval("  CENTRAL DE INVESTIGACAO  --  Det. ", nomeDetetive)
         escreval("==========================================================")
         escreval("  Caso: Morte de ", nomeVitima)
         escreval("  Local do crime: ", localCrime)
         escreval("  Arma do crime : ", armaVerdadeira)
         escreval("  Pistas coletadas: ", totalPistas, " de 5")
         escreval("----------------------------------------------------------")
         escreval("")
         escreval("  O QUE DESEJA FAZER?")
         escreval("")
         escreval("  [1] Interrogar suspeito")
         escreval("  [2] Examinar evidencias coletadas")
         escreval("  [3] Rever perfil dos suspeitos")
         escreval("  [4] Rever local do crime")
         escreval("  [5] Fazer acusacao formal")
         escreval("")
         escreval("----------------------------------------------------------")
         escreval("  Escolha: ")
         leia(opcao)

         // ---- OPCAO 1: INTERROGAR ----
         se opcao = 1 entao
            limpaTela
            escreval("==========================================================")
            escreval("  INTERROGATORIO")
            escreval("==========================================================")
            escreval("")
            escreval("  Quem deseja interrogar?")
            escreval("")
            para i de 1 ate 3 faca
               escreval("  [", i, "] ", nomeSusp[i], " -- ", papelSusp[i])
            fimpara
            escreval("  [0] Voltar")
            escreval("")
            escreval("  Escolha: ")
            leia(suspEscolhido)

            se (suspEscolhido >= 1) e (suspEscolhido <= 3) entao

               limpaTela
               escreval("==========================================================")
               escreval("  INTERROGANDO: ", nomeSusp[suspEscolhido])
               escreval("  ", papelSusp[suspEscolhido])
               escreval("==========================================================")
               escreval("")

               se personalidade[suspEscolhido] = 1 entao
                  escreval("  ", nomeSusp[suspEscolhido], " entra cabisbaixo, maos tremendo.")
                  escreval("  Senta na ponta da cadeira, evitando seu olhar.")
               fimse
               se personalidade[suspEscolhido] = 2 entao
                  escreval("  ", nomeSusp[suspEscolhido], " entra com passos firmes, quase arrogante.")
                  escreval("  Cruza os bracos e te encara diretamente.")
               fimse
               se personalidade[suspEscolhido] = 3 entao
                  escreval("  ", nomeSusp[suspEscolhido], " entra com olhos vermelhos de choro.")
                  escreval("  Parece genuinamente abalado(a) com a morte.")
               fimse

               escreval("")
               escreval("  [ENTER para comecar o interrogatorio]")
               leia(jogarNovamente)

               // ---- LOOP DE PERGUNTAS ----
               opcao <- 0
               enquanto opcao <> 6 faca

                  limpaTela
                  escreval("==========================================================")
                  escreval("  INTERROGANDO: ", nomeSusp[suspEscolhido])
                  escreval("==========================================================")
                  escreval("")
                  escreval("  PERGUNTAS DISPONIVEIS:")
                  escreval("")
                  escreval("  [1] Onde voce estava na noite do crime?")
                  escreval("  [2] Qual era sua relacao com ", nomeVitima, "?")
                  escreval("  [3] Voce tem algum motivo para querer o mal a vitima?")
                  escreval("  [4] Notou algo suspeito nos ultimos dias?")
                  escreval("  [5] Tenho evidencias que colocam voce em duvida.")
                  escreval("  [6] Encerrar interrogatorio")
                  escreval("")
                  escreval("  Pergunta: ")
                  leia(opcao)

                  limpaTela
                  escreval("----------------------------------------------------------")

                  // PERGUNTA 1: ALIBI
                  se opcao = 1 entao
                     escreval("  Det. ", nomeDetetive, ": Onde estava entre 23h e meia-noite?")
                     escreval("")

                     se suspEscolhido = culpadoIndex entao
                        se personalidade[suspEscolhido] = 1 entao
                           escreval("  ", nomeSusp[suspEscolhido], ": Eu... eu estava no meu quarto. Sim, no quarto.")
                           escreval("  Ninguem pode confirmar, mas eu juro que e verdade.")
                           escreval("  Por que esta me olhando assim?")
                        fimse
                        se personalidade[suspEscolhido] = 2 entao
                           escreval("  ", nomeSusp[suspEscolhido], ": ", alibiSusp[suspEscolhido], ".")
                           escreval("  E nao preciso provar nada para um detetive de segunda.")
                           escreval("  Deveria procurar os verdadeiros criminosos.")
                        fimse
                        se personalidade[suspEscolhido] = 3 entao
                           escreval("  ", nomeSusp[suspEscolhido], ": ", alibiSusp[suspEscolhido], ".")
                           escreval("  Estou tao abalado... mal me lembro de nada direito.")
                           escreval("  Tudo isso e um pesadelo.")
                        fimse
                     senao
                        escreval("  ", nomeSusp[suspEscolhido], ": ", alibiSusp[suspEscolhido], ".")
                        escreval("  Posso dar nomes de pessoas que me viram la.")
                        escreval("  Nao tenho nada a esconder, Detetive ", nomeDetetive, ".")
                     fimse

                     se nao pistasEncontradas[1] entao
                        pistasEncontradas[1] <- verdadeiro
                        totalPistas <- totalPistas + 1
                        escreval("")
                        escreval("  *** PISTA DESCOBERTA! ***")
                        escreval("  >>> ", pistas[1])
                     fimse
                  fimse

                  // PERGUNTA 2: RELACAO COM A VITIMA
                  se opcao = 2 entao
                     escreval("  Det. ", nomeDetetive, ": Que relacao tinha com ", nomeVitima, "?")
                     escreval("")

                     se suspEscolhido = culpadoIndex entao
                        se personalidade[suspEscolhido] = 1 entao
                           escreval("  ", nomeSusp[suspEscolhido], ": Uma relacao... normal. Profissional.")
                           escreval("  Nao tinhamos problemas. Nenhum problema.")
                           escreval("  Pelo menos nenhum que eu queira falar agora.")
                        fimse
                        se personalidade[suspEscolhido] = 2 entao
                           escreval("  ", nomeSusp[suspEscolhido], ": Conhecidos. Apenas conhecidos de longa data.")
                           escreval("  Nao era chegado(a), se e isso que deseja saber.")
                           escreval("  Pergunta idiota, Detetive.")
                        fimse
                        se personalidade[suspEscolhido] = 3 entao
                           escreval("  ", nomeSusp[suspEscolhido], ": Era... importante para mim. A seu modo.")
                           escreval("  Tinhamos nossas diferencas, mas quem nao tem?")
                           escreval("  Nao consigo acreditar que se foi assim.")
                        fimse
                     senao
                        escreval("  ", nomeSusp[suspEscolhido], ": Uma relacao de respeito mutuo, sempre.")
                        escreval("  ", nomeVitima, " era uma pessoa complexa, e verdade,")
                        escreval("  mas nunca tive razao para desejar o mal.")
                     fimse

                     se nao pistasEncontradas[2] entao
                        pistasEncontradas[2] <- verdadeiro
                        totalPistas <- totalPistas + 1
                        escreval("")
                        escreval("  *** PISTA DESCOBERTA! ***")
                        escreval("  >>> ", pistas[2])
                     fimse
                  fimse

                  // PERGUNTA 3: MOTIVO
                  se opcao = 3 entao
                     escreval("  Det. ", nomeDetetive, ": Existe algum motivo pelo qual")
                     escreval("  alguem desejaria a morte de ", nomeVitima, "?")
                     escreval("")

                     se suspEscolhido = culpadoIndex entao
                        se personalidade[suspEscolhido] = 1 entao
                           escreval("  ", nomeSusp[suspEscolhido], ": Nao... nao sei. Talvez tivesse inimigos.")
                           escreval("  Todo mundo tem inimigos, ne? Nao e somente eu!")
                           escreval("  Quer dizer -- nao que EU tivesse problema...")
                        fimse
                        se personalidade[suspEscolhido] = 2 entao
                           escreval("  ", nomeSusp[suspEscolhido], ": Uma pessoa importante sempre tem inimigos.")
                           escreval("  Teria que perguntar para os outros, nao para mim.")
                           escreval("  Estou cansado dessas acusacoes veladas.")
                        fimse
                        se personalidade[suspEscolhido] = 3 entao
                           escreval("  ", nomeSusp[suspEscolhido], ": Nao consigo pensar em ninguem... assim.")
                           escreval("  A nao ser... nao, nao vou apontar dedos.")
                           escreval("  Seria injusto da minha parte.")
                        fimse
                     senao
                        escreval("  ", nomeSusp[suspEscolhido], ": Havia tensoes. Nao vou fingir que nao.")
                        escreval("  Mas entre desentendimentos e crime, ha uma distancia.")
                        escreval("  Se eu soubesse de algo concreto, ja teria dito.")
                     fimse

                     se nao pistasEncontradas[3] entao
                        pistasEncontradas[3] <- verdadeiro
                        totalPistas <- totalPistas + 1
                        escreval("")
                        escreval("  *** PISTA DESCOBERTA! ***")
                        escreval("  >>> ", pistas[3])
                     fimse
                  fimse

                  // PERGUNTA 4: OBSERVACOES
                  se opcao = 4 entao
                     escreval("  Det. ", nomeDetetive, ": Notou algo fora do comum")
                     escreval("  nos dias que antecederam o crime?")
                     escreval("")

                     se suspEscolhido = culpadoIndex entao
                        se personalidade[suspEscolhido] = 1 entao
                           escreval("  ", nomeSusp[suspEscolhido], ": Nao... bem... havia uma tensao no ar.")
                           escreval("  Mas isso e normal. Sempre foi assim aqui.")
                           escreval("  Nao anotei nada de especial, nao.")
                        fimse
                        se personalidade[suspEscolhido] = 2 entao
                           escreval("  ", nomeSusp[suspEscolhido], ": Nada que me dissesse respeito.")
                           escreval("  Nao fico bisbilhotando a vida alheia,")
                           escreval("  ao contrario de alguns por aqui.")
                        fimse
                        se personalidade[suspEscolhido] = 3 entao
                           escreval("  ", nomeSusp[suspEscolhido], ": A vitima parecia preocupada ultimamente.")
                           escreval("  Recebia visitas estranhas, cartas seladas.")
                           escreval("  Eu nao quis perguntar... agora me arrependo.")
                        fimse
                     senao
                        escreval("  ", nomeSusp[suspEscolhido], ": Sim, na verdade. Vi algo que me pareceu estranho.")
                        escreval("  Havia uma conversa acalorada no dia anterior,")
                        escreval("  mas prefiro nao especular sem ter certeza.")
                     fimse

                     se nao pistasEncontradas[4] entao
                        pistasEncontradas[4] <- verdadeiro
                        totalPistas <- totalPistas + 1
                        escreval("")
                        escreval("  *** PISTA DESCOBERTA! ***")
                        escreval("  >>> ", pistas[4])
                     fimse
                  fimse

                  // PERGUNTA 5: CONFRONTAR COM EVIDENCIAS
                  se opcao = 5 entao
                     escreval("  Det. ", nomeDetetive, ": Tenho evidencias que contradizem")
                     escreval("  sua versao dos fatos. O que tem a dizer?")
                     escreval("")

                     se suspEscolhido = culpadoIndex entao
                        se personalidade[suspEscolhido] = 1 entao
                           escreval("  [Suor aparece na testa. As maos apertam a mesa.]")
                           escreval("  ", nomeSusp[suspEscolhido], ": Que evidencias? Quais? Isso e impossivel!")
                           escreval("  Eu nao... voce nao tem nada contra mim!")
                        fimse
                        se personalidade[suspEscolhido] = 2 entao
                           escreval("  [Uma sombra cruza o rosto antes de recuperar a compostura.]")
                           escreval("  ", nomeSusp[suspEscolhido], ": Evidencias fabricadas nao valem nada em tribunal.")
                           escreval("  Fale com meu advogado antes de me acusar.")
                        fimse
                        se personalidade[suspEscolhido] = 3 entao
                           escreval("  [Comeca a chorar. As maos cobrem o rosto.]")
                           escreval("  ", nomeSusp[suspEscolhido], ": Nao... por favor. Voce nao entende.")
                           escreval("  Eu nao queria que acontecesse assim...")
                        fimse
                        escreval("")
                        escreval("  * A reacao foi intensa demais. Algo esta sendo ocultado. *")
                     senao
                        escreval("  [Mantem o olhar firme. Respira fundo.]")
                        escreval("  ", nomeSusp[suspEscolhido], ": Entao mostre essas evidencias. Nao tenho medo.")
                        escreval("  Porque nao fiz nada. Pode me acusar, se tiver provas.")
                        escreval("")
                        escreval("  * A serenidade parece genuina. *")
                     fimse

                     se nao pistasEncontradas[5] entao
                        pistasEncontradas[5] <- verdadeiro
                        totalPistas <- totalPistas + 1
                        escreval("")
                        escreval("  *** PISTA DECISIVA DESCOBERTA! ***")
                        escreval("  >>> ", pistas[5])
                     fimse
                  fimse

                  se opcao <> 6 entao
                     escreval("")
                     escreval("----------------------------------------------------------")
                     escreval("  [ENTER para proxima pergunta]")
                     leia(jogarNovamente)
                  fimse

               fimenquanto // fim loop perguntas

               opcao <- 0 // reseta para nao fechar o menu principal

            fimse // suspEscolhido valido

         fimse // opcao = 1

         // ---- OPCAO 2: VER EVIDENCIAS ----
         se opcao = 2 entao
            limpaTela
            escreval("==========================================================")
            escreval("  PASTA DE EVIDENCIAS  --  Det. ", nomeDetetive)
            escreval("==========================================================")
            escreval("  Pistas encontradas: ", totalPistas, " de 5")
            escreval("")

            se totalPistas = 0 entao
               escreval("  Nenhuma evidencia coletada ainda.")
               escreval("  Interrogue os suspeitos para descobrir pistas.")
            senao
               para i de 1 ate 5 faca
                  se pistasEncontradas[i] entao
                     escreval("  [*] PISTA ", i, ": ", pistas[i])
                  senao
                     escreval("  [ ] PISTA ", i, ": ??? (ainda nao descoberta)")
                  fimse
               fimpara
            fimse

            escreval("")
            escreval("----------------------------------------------------------")
            escreval("  [ENTER para voltar]")
            leia(jogarNovamente)
         fimse

         // ---- OPCAO 3: PERFIL DOS SUSPEITOS ----
         se opcao = 3 entao
            limpaTela
            escreval("==========================================================")
            escreval("  DOSSIE DOS SUSPEITOS")
            escreval("==========================================================")
            escreval("")
            para i de 1 ate 3 faca
               escreval("----------------------------------------------------------")
               escreval("  SUSPEITO ", i, ": ", nomeSusp[i])
               escreval("  Perfil  : ", papelSusp[i])
               escreval("  Alibi   : ", alibiSusp[i])
               escreval("")
            fimpara
            escreval("----------------------------------------------------------")
            escreval("  NOTA: Motivos sao revelados nos interrogatorios.")
            escreval("----------------------------------------------------------")
            escreval("  [ENTER para voltar]")
            leia(jogarNovamente)
         fimse

         // ---- OPCAO 4: REVER LOCAL ----
         se opcao = 4 entao
            limpaTela
            escreval("==========================================================")
            escreval("  RELATORIO DA CENA DO CRIME")
            escreval("==========================================================")
            escreval("")
            escreval("")
            escreval("  LOCAL  : ", localCrime)
            escreval("  VITIMA : ", nomeVitima)
            escreval("  PERFIL : ", descVitima)
            escreval("  ARMA   : ", armaVerdadeira)
            escreval("")

            // Arte da arma tambem aparece ao rever o local
            se casoIndex = 1 entao
               escreval("                 :####:                 ")
               escreval("                  -%%-                  ")
               escreval("                  :%%:                  ")
               escreval("       %%%%%.      ##      .%%%%%       ")
               escreval("        #%%      =%%%%=      %%#        ")
               escreval("        -#%:      %%%%      :%#-        ")
               escreval("           %+    .%++%.    +%           ")
               escreval("             .%-%%%%%%%%-%.             ")
               escreval("            .%#   .%%-   #%.            ")
               escreval("                #::+%::#                ")
               escreval("                   %%                   ")
               escreval("                  %%%%                  ")
               escreval("                  %%%%                  ")
               escreval("                  %%%#                  ")
               escreval("              %%%%%%%%%%%%              ")
               escreval("             ##############             ")
            fimse
            se casoIndex = 2 entao
               escreval("  ..  .. .   .   ....  ..   .     ..  ..")
               escreval("    ..     .   ..#-:-=+##+.     .   ..  ")
               escreval("  ..  .. .   ....#=:-=+##+...     ..  ..")
               escreval("  ..  .  .   .=*###**######*.     ..  ..")
               escreval("    ..     .   .#.-:-=+##-#     .   ..  ")
               escreval("  ..     .   . .#.+++++++-# .     .   ..")
               escreval("     .     .  -#:    ..  .=*:   .   .   ")
               escreval("         .:**+ ......  :::  .+#=  .     ")
               escreval("    ..    #:.::::::::::::::::::+#   ..  ")
               escreval("          #:::::::::::::::::: .+#       ")
               escreval("          #:. =#############:.:+#       ")
               escreval("         .#::.+####*---#####:::+# .     ")
               escreval("     .    #:::+## *    :-.##:::+#   .   ")
               escreval("  ..     .#:::+###*+#:######:::+# .   ..")
               escreval("  ..  .  .#:.:+####-.++-####:::+# ..  ..")
               escreval("    ..    #:::+###**########:::+#   ..  ")
               escreval("  ..  .  .#:::.::::::::::::::::+# ..  ..")
               escreval("    ..    #*:::::::::::::::::::#*   ..  ")
               escreval("  ..  .. .   .   ....  ..   .     ..  ..")
            fimse
            se casoIndex = 3 entao
               escreval("                                                  ")
               escreval("  ..                                              ")
               escreval("####################################  ##          ")
               escreval("##########################        ######          ")
               escreval("##########################mmmmmm######            ")
               escreval("                  ########################        ")
               escreval("                      ######--mm########  ####    ")
               escreval("                      ####    ##  ####  ########  ")
               escreval("                      ####  ####  ##..##########++")
               escreval("                        ####    ####  ############")
               escreval("                          ########    ############")
               escreval("                                        ##########")
               escreval("                                        ##########")
               escreval("                                        ##########")
               escreval("                                        ##########")
               escreval("                                        ##########")
               escreval("                                          ######  ")
            fimse
            se casoIndex = 4 entao
               escreval("                        .#*  =                ")
               escreval("       ==+-=.        =*    -               ")
               escreval("     + =:*:-+++      :*+*-=                ")
               escreval("    #        =.:              %%#%         ")
               escreval("    :       .+#::   :+#-     +    *        ")
               escreval("    =:    :%=+  :=.=   =:+   =:.:++        ")
               escreval("     .#: .=*           :.**    -- ==.  ++# ")
               escreval("        -.+               *:.     -=     %*")
               escreval("        - -                :.     #      %*")
               escreval("  ===   -                  :.     *.+:   =.")
               escreval("+:   -  .#                -# *@::#  ::::.  ")
               escreval("*   *=    @@@*         .= @ %     -        ")
               escreval("  **- -:: +--**:#@*#-=*:*    =#:+%         ")
               escreval("     #  -         *+==-                    ")
               escreval("    .+            +    *+. -.              ")
               escreval("    #:            .   .:    #              ")
               escreval("     *          .*+    =**%=.              ")
               escreval("     :@.      =+=%                         ")
               escreval("       .=%...=%-                           ")
            fimse

            escreval("")
            escreval("  DESCRICAO DA CENA:")
            escreval("  O local apresenta sinais claros de luta ou confronto.")
            escreval("  O medico legista estima que o crime ocorreu entre")
            escreval("  23h00 e 00h30. A vitima nao esbocou resistencia.")
            escreval("")
            escreval("  Tres pessoas tiveram acesso ao local naquela noite.")
            escreval("  Todas tinham oportunidade. A questao e: quem tinha")
            escreval("  o motivo e o meio para cometer o crime?")
            escreval("")
            escreval("----------------------------------------------------------")
            escreval("  [ENTER para voltar]")
            leia(jogarNovamente)
         fimse

         // ---- OPCAO 5: ACUSACAO FORMAL ----
         se opcao = 5 entao
            limpaTela
            escreval("==========================================================")
            escreval("  ACUSACAO FORMAL  --  Det. ", nomeDetetive)
            escreval("==========================================================")
            escreval("")

            se totalPistas < 2 entao
               escreval("  AVISO: Voce coletou apenas ", totalPistas, " pista(s).")
               escreval("  Uma acusacao precipitada pode ser desastrosa.")
               escreval("  Recomenda-se investigar mais antes da acusacao.")
               escreval("")
            fimse

            escreval("  Esta e sua acusacao formal. Pense bem.")
            escreval("  Um erro arruinara sua carreira e deixara o")
            escreval("  assassino solto pelas ruas de DEVDET.")
            escreval("")
            escreval("  O crime ocorreu em : ", localCrime)
            escreval("  A arma utilizada foi: ", armaVerdadeira)
            escreval("")
            escreval("----------------------------------------------------------")
            escreval("  QUEM VOCE ACUSA PELO CRIME?")
            escreval("")
            para i de 1 ate 3 faca
               escreval("  [", i, "] ", nomeSusp[i], " -- ", papelSusp[i])
            fimpara
            escreval("")
            escreval("  Sua escolha: ")
            leia(acusadoIndex)

            // ---- VEREDICTO ----
            limpaTela
            escreval("==========================================================")
            escreval("  V E R E D I T O  --  CASO: MORTE DE ", nomeVitima)
            escreval("==========================================================")
            escreval("")
            escreval("  Detetive ", nomeDetetive, " acusa formalmente:")
            escreval("")
            escreval("  SUSPEITO : ", nomeSusp[acusadoIndex])
            escreval("  LOCAL    : ", localCrime)
            escreval("  ARMA     : ", armaVerdadeira)
            escreval("")
            escreval("----------------------------------------------------------")
            escreval("")

            se acusadoIndex = culpadoIndex entao
               escreval("  CASO SOLUCIONADO!")
               escreval("")
               escreval("  Parabens, Detetive ", nomeDetetive, "!")
               escreval("  Voce identificou o verdadeiro culpado.")
               escreval("")
               escreval("  ", nomeSusp[culpadoIndex], " foi preso(a) em flagrante.")
               escreval("  Sob pressao, confessou tudo:")
               escreval("  ", motivoSusp[culpadoIndex], ".")
               escreval("")
               escreval("  Seu nome entrara para a historia de DEVDET.")
               escreval("  O promotor garante condenacao com suas provas.")
            senao
               escreval("  ACUSACAO INCORRETA -- CASO MAL RESOLVIDO")
               escreval("")
               escreval("  ", nomeSusp[acusadoIndex], " e INOCENTE.")
               escreval("  Voce acabou de destruir uma vida inocente.")
               escreval("")
               escreval("  O verdadeiro culpado era: ", nomeSusp[culpadoIndex])
               escreval("  Motivo: ", motivoSusp[culpadoIndex])
               escreval("")
               escreval("  ", nomeSusp[culpadoIndex], " fugiu da cidade.")
               escreval("  Sua carreira como detetive acabou.")
               escreval("  DEVDET nunca te perdoara.")
            fimse

            escreval("")
            escreval("  Pistas coletadas nesta partida: ", totalPistas, " de 5")
            escreval("")
            escreval("==========================================================")

            continuar <- falso // encerra o menu principal

         fimse // opcao = 5

      fimenquanto // fim menu principal

      // ---- JOGAR NOVAMENTE ----
      escreval("")
      escreval("  Deseja investigar um novo caso? (s/n): ")
      leia(jogarNovamente)

   ate (jogarNovamente = "n") ou (jogarNovamente = "N")

   limpaTela
   escreval("==========================================================")
   escreval("  Obrigado por jogar Detetive: Misterios de DEVDET!")
   escreval("  Detetive ", nomeDetetive, ", ate o proximo caso.")
   escreval("==========================================================")

fimalgoritmo
