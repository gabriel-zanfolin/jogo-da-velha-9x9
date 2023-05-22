programa
{
	inclua biblioteca Util --> ut
	inteiro linha, coluna, cont, controlador
	caracter tabua[9][9], jogador, maquina 
	logico resp, resultado, vitoria
	//----------------------------------------------------------------------------------------------------------------------------/
	funcao imprime_matriz(){	//FUNCAO QUE ATUALIZA E IMPRIME A MATRIZ
		inteiro b
		limpa()
		para(b=0; b<9; b++){
			se (b==0){
				escreva ("\n   ")
			}
			escreva (" ", b, "  ")
		}

		para(b=0; b<9; b++){
			se (b==0){
				escreva ("\n  =")
			}
			escreva ("====")
			se (b==8){
				escreva ("\n")
			}
		}	
		para(linha=0; linha<9; linha++){
			para(coluna=0; coluna<9; coluna++){
				se (coluna==0){
					escreva (linha, " | ")
				}
				se (tabua[linha][coluna]!='O' e tabua[linha][coluna]!='X'){
					escreva ("_", " | ")
				}
				senao{
					escreva (tabua[linha][coluna], " | ")
				}
			}
			para(b=0; b<9; b++){
				se (b==0){
					escreva ("\n  =")
				}
				escreva ("====")
				se (b==8){
					escreva ("\n")
				}
			}			
		}
		escreva ("\n")
	}
	//----------------------------------------------------------------------------------------------------------------------------/
	funcao logico verifica_primeira_jog(caracter machine){ //FUNCAO QUE VERIFICA SE EH A PRIMEIRA JOGADA DO COMPUTADOR	
		maquina = machine
		resp = verdadeiro
		para (linha=0; linha<9; linha++){
			para (coluna=0; coluna<9; coluna++){
				se (tabua[linha][coluna]==maquina){
					resp = falso
				}
				se (resp==falso){
					coluna = 9
					linha = 9
				}
			}
		}
		retorne resp
	}
	//----------------------------------------------------------------------------------------------------------------------------/
	funcao logico leitura_matriz_vazia(){ //FUNCAO QUE VERIFICA SE A MATRIZ ESTA VAZIA	
		para	(linha=0; linha<9; linha++){
			para	(coluna=0; coluna<9; coluna++){
				se (tabua[linha][coluna] == 'O' ou tabua[linha][coluna] == 'X'){
					retorne falso
				}
			}
		}
		retorne verdadeiro
	}
	//----------------------------------------------------------------------------------------------------------------------------/
	funcao logico leitura_matriz_cheia(){ //FUNCAO QUE VERIFICA SE A MATRIZ ESTA CHEIA	
		para	(linha=0; linha<9; linha++){
			para	(coluna=0; coluna<9; coluna++){
				se (tabua[linha][coluna] != 'O' e tabua[linha][coluna] != 'X'){
					retorne falso
				}
			}
		}
		retorne verdadeiro
	}
	//----------------------------------------------------------------------------------------------------------------------------/
	funcao caracter caracter_maiusculo (caracter player){ //FUNCAO QUE CONVERTE O CARACTER ESCOLHIDO PARA MAIUSCULO	
		jogador = player
		se (jogador != 'O' e jogador != 'X'){
			se (jogador == 'o'){
				jogador = 'O'
			}
			senao{
				jogador = 'X'
			}
		}
		retorne jogador
	}
	//----------------------------------------------------------------------------------------------------------------------------/
	funcao solicita_jogada(){ //FUNCAO PARA SOLICITAR JOGADA ATRAVES DAS COORDENADAS DA MATRIZ	
		escreva ("Sua vez! Insira a posicao de sua jogada: ")
		escreva ("\nLinha: ")
		leia (linha)
		escreva ("Coluna: ")
		leia (coluna)
		enquanto (linha<0 ou linha>8 ou coluna<0 ou coluna>8){
			escreva ("Posicao invalida! Escolha valores entre 0 e 8: ")
			escreva ("\nLinha: ")
			leia (linha)
			escreva ("Coluna: ")
			leia (coluna)			
			enquanto (tabua[linha][coluna] == 'X' ou tabua[linha][coluna] == 'O'){
				escreva ("Posicao ja ocupada! Escolha outra: ")
				escreva ("\nLinha: ")
				leia (linha)
				escreva ("Coluna: ")
				leia (coluna)
			}		
		}
		enquanto (tabua[linha][coluna] == 'X' ou tabua[linha][coluna] == 'O'){
			escreva ("Posicao ja ocupada! Escolha outra: ")
			escreva ("\nLinha: ")
			leia (linha)
			escreva ("Coluna: ")
			leia (coluna)
			enquanto (linha<0 ou linha>8 ou coluna<0 ou coluna>8){
				escreva ("Posicao invalida! Escolha valores entre 0 e 8: ")
				escreva ("\nLinha: ")
				leia (linha)
				escreva ("Coluna: ")
				leia (coluna)	
			}
		}
		tabua[linha][coluna] = jogador
		imprime_matriz()
		controlador = 1
	}
	//----------------------------------------------------------------------------------------------------------------------------/
	funcao caracter caracter_jogador (){ //FUNCAO PARA ESCOLHA DE CARACTER	
		imprime_matriz()
		escreva ("Instrucoes:\n")
		escreva ("O objetivo do jogo eh marcar uma fileira ou diagonal de 5 casas. Quem conseguir eh o grande vencedor!!!\n")
		
		escreva ("\nSelecione seu caracter [X/O]: ")
		leia (jogador)
		enquanto (jogador != 'X' e jogador != 'x' e jogador != 'O' e jogador != 'o'){
			escreva ("Caracter invalido!!! Selecione seu caracter [X/O]: ")
			leia (jogador)
		}
		caracter_maiusculo(jogador)
		limpa()
		imprime_matriz()
		retorne jogador
	}
	//----------------------------------------------------------------------------------------------------------------------------/
	funcao caracter caracter_adversario (){ //FUNCAO PARA ATRIBUIR O CARACTER OPOSTO DO ESCOLHIDO AO COMPUTADOR	
		caracter adversario
		se (jogador == 'O'){
			adversario = 'X'
		}
		senao{
			adversario = 'O'
		}
		retorne adversario
	}
	//----------------------------------------------------------------------------------------------------------------------------/
	funcao logico varredura_horizontal (caracter simbolo){ //VERIFICA SE HOUVE VITORIA EM FILEIRAS HORIZONTAIS	
		cont=0
		para (linha=0; linha<9; linha++){
			para (coluna=0; coluna<9; coluna++){
				se (tabua[linha][coluna]==simbolo){
					cont++
				}
				senao{
					cont = 0
				}
				se (cont>=5){
					resultado = verdadeiro
				}
			}
			cont = 0
		}
		retorne resultado
	}
	//----------------------------------------------------------------------------------------------------------------------------/
	funcao logico varredura_vertical (caracter simbolo){ //VERIFICA SE HOUVE VITORIA EM FILEIRAS VERTICAIS
		cont=0
		para (coluna=0; coluna<9; coluna++){
			para (linha=0; linha<9; linha++){
				se (tabua[linha][coluna]==simbolo){
					cont++
				}
				senao{
					cont = 0
				}
				se (cont>=5){
					resultado = verdadeiro
				}
			}
			cont = 0
		}
		retorne resultado
	}
	//----------------------------------------------------------------------------------------------------------------------------/
	funcao logico varredura_diag_princ(caracter simbolo){ //VERIFICA SE HOUVE VITORIA EM DIAGONAIS PRINCIPAIS	
		inteiro vetor[9], ind_vet=0
		cont = 0
		para (linha=0; linha<9; linha++){
			vetor[linha] = 0
		}
		para (linha=0; linha<9; linha++){
			para (coluna=0; coluna<9; coluna++){
				se (linha==coluna+4){
					ind_vet = 0
				}
				senao{
					se (linha==coluna+3){
						ind_vet = 1
					}
					senao{
						se (linha==coluna+2){
							ind_vet = 2 
						}
						senao{
							se (linha==coluna+1){
								ind_vet = 3
							}
							senao{
								se (linha==coluna){
									ind_vet = 4
								}
								senao{
									se (linha==coluna-1){
										ind_vet = 5
									}
									senao{
										se (linha==coluna-2){
											ind_vet = 6
										}
										senao{
											se (linha==coluna-3){
												ind_vet = 7
											}
											senao{
												se (linha==coluna-4){
													ind_vet = 8
												}
											}
										}
									}
								}
							}
						}
					}
				}	
				se (ind_vet<=8){
					se (tabua[linha][coluna] == simbolo){
						vetor[ind_vet]++
					}
					senao{
						vetor[ind_vet] = 0
					}
					se (vetor[ind_vet] >=5){
						resultado = verdadeiro
					}						
				}
			}
		}
		retorne resultado
	}
	//----------------------------------------------------------------------------------------------------------------------------/
	funcao logico varredura_diag_sec(caracter simbolo){ //VERIFICA SE HOUVE VITORIA EM DIAGONAIS SECUNDARIAS	
		inteiro diag, j, k, x, z=0, vetor[9]
		para(diag=0;diag<9;diag++){
			vetor[diag] = 0
			k = 0
			se(diag==0 ou diag==8){
				x = (-2)
			}
			senao{
				se(diag==1 ou diag==7){
					x = (-3)
				}
				senao{
					se(diag==2 ou diag==6){
						x = (-4)
					}
					senao{
						se(diag==3 ou diag==5){
							x = (-5)
						}
						senao{
							x = (-6)
						}
					}
				}
			}
			se(diag>4){
				z++			
			}
			para(j=2;j>=x;j--){
				se(diag<=4){
					linha = k+(2*j)+diag
					coluna = k
				}
				senao{
					linha = k+(2*j)+(diag-z)
					coluna = k+z
				}
				se(tabua[linha][coluna]==simbolo){
					vetor[diag]++
				}
				senao{
					vetor[diag] = 0
				}
				se(vetor[diag]>=5){
					resultado = verdadeiro
				}
				k++
			}
		}
		retorne resultado
	}	
	//----------------------------------------------------------------------------------------------------------------------------/
	funcao logico verifica_ganhador(caracter simbolo){ //FUNCAO PARA VERIFICAR SE ALGUEM GANHOU O JOGO
		resp = falso
		vitoria = falso
		resp = varredura_horizontal(simbolo)
		se (resp==falso){
			resp = varredura_vertical(simbolo)
			se (resp==falso){
				resp = varredura_diag_princ(simbolo)
				se (resp==falso){
					resp = varredura_diag_sec(simbolo)
				}
			}
		}
		se (resp==verdadeiro){
			vitoria = verdadeiro
		}
		se (vitoria){
			msg_resultado(simbolo)
		}
		retorne vitoria
	}
	//----------------------------------------------------------------------------------------------------------------------------/
	funcao msg_resultado(caracter simbolo){ //FUNCAO PARA EXIBIR MENSAGEM DO RESULTADO	
		se (simbolo==jogador){
			escreva ("Parabens, voce venceu!!!")
			}	
		senao{
			escreva ("Voce perdeu :/")
		}
	}
	//----------------------------------------------------------------------------------------------------------------------------/
	funcao logico defensiva_horizontal (caracter machine){ //FUNCAO DE JOGADA DEFENSIVA NO SENTIDO HORIZONTAL	
		resp = falso
		maquina = machine
		para (linha=0; linha<9; linha++){
			cont=0
			para (coluna=0; coluna<9; coluna++){
				se (tabua[linha][coluna]==jogador){
					cont++
				}
				senao{
					cont = 0
				}
				se (cont>=3){
					se (coluna+1<9){
						se (tabua[linha][coluna+1]!=jogador e tabua[linha][coluna+1]!=maquina e resp==falso){
							tabua[linha][coluna+1] = maquina
							resp = verdadeiro
						}
						senao{
							se(tabua[linha][coluna+1]==jogador){
								se (coluna+2<9){
									se (tabua[linha][coluna+2]!=maquina e resp==falso){
										tabua[linha][coluna+2] = maquina
										resp = verdadeiro
									}
									senao{
										se (coluna-3>=0){
											se (tabua[linha][coluna-3]!=maquina e resp==falso){
												tabua[linha][coluna-3] = maquina
												resp = verdadeiro
											}
										}
									}
								}
								se (coluna-3>=0){
									se (tabua[linha][coluna-3]!=maquina e tabua[linha][coluna-3]!=jogador e resp==falso){
										tabua[linha][coluna-3] = maquina
										resp = verdadeiro
									}
									senao{
										se (tabua[linha][coluna-3]==jogador){
											se (coluna-4>=0){
												se (tabua[linha][coluna-4]!=maquina e tabua[linha][coluna-4]!=jogador e resp==falso){
													tabua[linha][coluna-4] = maquina
													resp = verdadeiro
												}
											}
										}
									}
								}
							}
						}
					}
					senao{
						se (tabua[linha][coluna-3]!=jogador e tabua[linha][coluna-3]!=maquina e resp==falso){
							tabua[linha][coluna-3] = maquina
							resp = verdadeiro
						}
						senao{
							se(tabua[linha][coluna-3]==jogador){
								se (tabua[linha][coluna-4]!=maquina e tabua[linha][coluna-4]!=jogador e resp==falso){
									tabua[linha][coluna-4]=maquina
									resp = verdadeiro
								}
							}
						}
					}
				}
			}
			cont = 0
		}
		retorne resp
	}
	//----------------------------------------------------------------------------------------------------------------------------/
	funcao logico defensiva_vertical (caracter machine){ //FUNCAO DE JOGADA DEFENSIVA NO SENTIDO VERTICAL	
		resp = falso
		maquina = machine
		para (coluna=0; coluna<9; coluna++){
			cont=0
			para (linha=0; linha<9; linha++){
				se (tabua[linha][coluna]==jogador){
					cont++
				}
				senao{
					cont = 0
				}
				se (cont>=3){
					se (linha+1<9){
						se (tabua[linha+1][coluna]!=jogador e tabua[linha+1][coluna]!=maquina e resp==falso){
							tabua[linha+1][coluna] = maquina
							resp = verdadeiro
						}
						senao{
							se(tabua[linha+1][coluna]==jogador){
								se (linha+2<9){
									se (tabua[linha+2][coluna]!=maquina e resp==falso){
										tabua[linha+2][coluna] = maquina
										resp = verdadeiro							
									}
									senao{
										se (linha-3>=0){
											se (tabua[linha-3][coluna]!=maquina e resp==falso){
												tabua[linha-3][coluna] = maquina
												resp = verdadeiro
											}
										}
									}
								}
								se (linha-3>=0){
									se (tabua[linha-3][coluna]!=maquina e tabua[linha-3][coluna]!=jogador e resp==falso){
										tabua[linha-3][coluna] = maquina
										resp = verdadeiro
									}
									senao{
										se (tabua[linha-3][coluna]==jogador){
											se (linha-4>=0){
												se (tabua[linha-4][coluna]!=maquina e tabua[linha-4][coluna]!=jogador e resp==falso){
													tabua[linha-4][coluna] = maquina
													resp = verdadeiro
												}
											}
										}
									}
								}
							}
						}
					}
					senao{
						se (tabua[linha-3][coluna]!=jogador e tabua[linha-3][coluna]!=maquina e resp==falso){
							tabua[linha-3][coluna] = maquina
							resp = verdadeiro
						}
						senao{
							se(tabua[linha-3][coluna]==jogador){
								se (tabua[linha-4][coluna]!=maquina e tabua[linha-4][coluna]!=jogador e resp==falso){
									tabua[linha-4][coluna]=maquina
									resp = verdadeiro
								}
							}
						}
					}
				}
			}
			cont = 0
		}
		retorne resp
	}
	//----------------------------------------------------------------------------------------------------------------------------/
	funcao logico defensiva(){ //FUNCAO DE JOGADA DEFENSIVA	
		resp = defensiva_horizontal(maquina)
		se (resp){
			retorne resp
		}
		senao{
			resp = defensiva_vertical(maquina)
		}
		retorne resp
	}
	//----------------------------------------------------------------------------------------------------------------------------/
	funcao logico ofensiva_horizontal (caracter machine, inteiro aux){ //FUNCAO DE JOGADA DEFENSIVA NO SENTIDO HORIZONTAL	
		inteiro bin
		resp = falso
		bin=0
		maquina = machine
		para (linha=0; linha<9; linha++){
			cont=0
			para (coluna=0; coluna<9; coluna++){
				se (tabua[linha][coluna]==maquina){
					cont++
				}
				senao{
					cont = 0
				}
				se (cont>=aux){
					se (coluna+1<9){
						se (tabua[linha][coluna+1]!=maquina e tabua[linha][coluna+1]!=jogador e bin==0){
							tabua[linha][coluna+1] = maquina
							bin = 1
						}
						senao{
							se(tabua[linha][coluna+1]==maquina){
								se (coluna+2<9){
									se (tabua[linha][coluna+2]!=jogador e tabua[linha][coluna+2]!=maquina e bin==0){
										tabua[linha][coluna+2] = maquina
										bin = 1
									}
									senao{
										se (coluna-1>=0){
											se (tabua[linha][coluna-1]!=jogador e tabua[linha][coluna-1]!=maquina e bin==0){
												tabua[linha][coluna-1] = maquina
												bin = 1
											}
											senao{
												se (tabua[linha][coluna-1]==maquina){
													se (coluna-2>=0){
														se (tabua[linha][coluna-2]!=jogador e tabua[linha][coluna-2]!=maquina e bin==0){
															tabua[linha][coluna-2] = maquina
															bin = 1
														}
													}
												}
											}
										}
									}
								}
								senao{
									se (tabua[linha][coluna-1]!=jogador e tabua[linha][coluna-1]!=maquina e bin==0){
										tabua[linha][coluna-1] = maquina
										bin = 1
									}
									senao{
										se (tabua[linha][coluna-1]==maquina){
											se (coluna-2>=0){
												se (tabua[linha][coluna-2]!=jogador e tabua[linha][coluna-2]!=maquina e bin==0){
													tabua[linha][coluna-2] = maquina
													bin = 1
												}
											}
										}
									}
								}
							}
						}
					}
					senao{
						se (tabua[linha][coluna-1]!=maquina e tabua[linha][coluna-1]!=jogador e bin==0){
							tabua[linha][coluna-1] = maquina
							bin = 1
						}
						senao{
							se(tabua[linha][coluna-1]==maquina){
								se (tabua[linha][coluna-2]!=jogador e tabua[linha][coluna-2]!=maquina e bin==0){
									tabua[linha][coluna-2]=maquina
									bin = 1
								}
							}
						}
					}
				}
				senao{
					resp = falso
				}
			}
			cont = 0
		}
		se (bin==1){
			resp = verdadeiro
		}
		retorne resp
	}
	//----------------------------------------------------------------------------------------------------------------------------/
	funcao logico ofensiva_vertical (caracter machine, inteiro aux){ //FUNCAO DE JOGADA DEFENSIVA NO SENTIDO VERTICAL	
		inteiro bin
		resp = falso
		bin=0
		maquina = machine
		para (coluna=0; coluna<9; coluna++){
			cont=0
			para (linha=0; linha<9; linha++){
				se (tabua[linha][coluna]==maquina){
					cont++
				}
				senao{
					cont = 0
				}
				se (cont>=aux){
					se (linha+1<9){
						se (tabua[linha+1][coluna]!=maquina e tabua[linha+1][coluna]!=jogador e bin==0){
							tabua[linha+1][coluna] = maquina
							bin = 1
						}
						senao{
							se(tabua[linha+1][coluna]==maquina){
								se (linha+2<9){
									se (tabua[linha+2][coluna]!=jogador e tabua[linha+2][coluna]!=maquina e bin==0){
										tabua[linha+2][coluna] = maquina
										bin = 1
									}
									senao{
										se (linha-1>=0){
											se (tabua[linha-1][coluna]!=jogador e tabua[linha-1][coluna]!=maquina e bin==0){
												tabua[linha-1][coluna] = maquina
												bin = 1
											}
											senao{
												se (tabua[linha-1][coluna]==maquina){
													se (linha-2>=0){
														se (tabua[linha-2][coluna]!=jogador e tabua[linha-2][coluna]!=maquina e bin==0){
															tabua[linha-2][coluna] = maquina
															bin = 1
														}
													}
												}
											}
										}
									}
								}
								senao{
									se (tabua[linha-1][coluna]!=jogador e tabua[linha-1][coluna]!=maquina e bin==0){
										tabua[linha-1][coluna] = maquina
										bin = 1
									}
									senao{
										se (tabua[linha-1][coluna]==maquina){
											se (linha-2>=0){
												se (tabua[linha-2][coluna]!=jogador e tabua[linha-2][coluna]!=maquina e bin==0){
													tabua[linha-2][coluna] = maquina
													bin = 1
												}
											}
										}
									}
								}
							}
						}
					}
					senao{
						se (tabua[linha-1][coluna]!=maquina e tabua[linha-1][coluna]!=jogador e bin==0){
							tabua[linha-1][coluna] = maquina
							bin = 1
						}
						senao{
							se(tabua[linha-1][coluna]==maquina){
								se (tabua[linha-2][coluna]!=jogador e tabua[linha-2][coluna]!=maquina e bin==0){
									tabua[linha-2][coluna]=maquina
									bin = 1
								}
							}
						}
					}
				}
				senao{
					resp = falso
				}
			}
			cont = 0
		}
		se (bin==1){
			resp = verdadeiro
		}
		retorne resp
	}
	//----------------------------------------------------------------------------------------------------------------------------/
	funcao logico ofensiva(){ //FUNCAO DE JOGADA DEFENSIVA	
		inteiro b
		resp = falso
		para (b=4; b>0; b--){
			se (nao resp){
				resp = ofensiva_horizontal(maquina,b)
				se (resp){
					retorne resp
				}
				senao{
					resp = ofensiva_vertical(maquina,b)
				}
			}
			senao{
				retorne resp	
			}
		}
		retorne resp
	}
	//----------------------------------------------------------------------------------------------------------------------------/
	funcao jogada_aleatoria(){ //FUNCAO DE JOGADA ALEATORIA
		faca{
			linha = ut.sorteia(0,8)
			coluna = ut.sorteia(0,8)
		}enquanto (tabua[linha][coluna]==jogador ou tabua[linha][coluna]==maquina)
		tabua[linha][coluna] = maquina
	}
	//----------------------------------------------------------------------------------------------------------------------------/
	funcao jogada_maquina(){ //FUNCAO PRINCIPAL DA JOGADA DA MAQUINA
		se(controlador==1){
			resp = verifica_primeira_jog(maquina)
			se (nao resp){
				resp = defensiva()
				se (nao resp){
					resp = ofensiva()
					se (nao resp){
						jogada_aleatoria()
					}
				}
			}
			senao{
				jogada_aleatoria()
			}
		}		
		imprime_matriz()
		controlador = 0	
	}
	//----------------------------------------------------------------------------------------------------------------------------/
	funcao inicio()
	{
		logico vazia
		resultado = falso
		controlador = 0
		faca{
			vazia = leitura_matriz_vazia()
			se (vazia){
				jogador = caracter_jogador()
				maquina = caracter_adversario()
			}
			se (controlador==0){
				solicita_jogada()
			}
			resultado = verifica_ganhador(jogador)
			se (nao resultado){
				jogada_maquina()
				resultado = verifica_ganhador(maquina)
			}
		}enquanto (resultado==falso e leitura_matriz_cheia()==falso)
		se (leitura_matriz_cheia()==verdadeiro){
			imprime_matriz()
			escreva("Empate!!!")
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 20233; 
 * @DOBRAMENTO-CODIGO = [7, 51, 68, 79, 90, 142, 159, 170, 189, 208, 275, 328, 350, 359, 433, 507, 518, 610, 702, 722, 750];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */