            
spila segment stack
	DB 32 DUP ('stack___')
spila ends

sdatos segment 

	separa	db "------------------------------", 10d, 13d, "$"

	;Variable para menu
	msg1 db "Menu", 10d, 13d, "$"
	msg2 db "Ingrese una opcion -> ", "$"
	opc1 db " 1. Derivar Funcion", 10d, 13d, "$"
	opc2 db " 2. Integrar Funcion", 10d, 13d, "$"
	opc3 db " 3. Ingresar Funciones", 10d, 13d, "$"
		opc3_1 db " a. Ingresar Funcion", 10d, 13d, "$"
		opc3_2 db " b. Cargar Archivo", 10d, 13d, "$"
		opc3_3 db " c. Regresar al Menu Principal", 10d, 13d, "$"
	opc4 db " 4. Imprimir Funciones Ingresadas", 10d, 13d, "$"
	opc5 db " 5. Graficar", 10d, 13d, "$"
	opc6 db " 6. Resolver Ecuacion", 10d, 13d, "$"
	opc7 db " 7. Enviar arduino", 10d, 13d, "$"
	opc8 db " 8. Salir", 10d, 13d, "$"
	
	;variables mensajes
	msg3 db "Ingrese el ID de la funcion -> ", "$"
	msg4 db "Original -> ", "$"
	msg5 db "Derivada -> ", "$"
	msg6 db "Integrar -> ", "$"
	msg7 db "Resultado -> ", "$"
	msg8 db "Funcion al ingresar -> ", "$"
	msg9 db "Nombre archivo -> ", "$"

	;variable para ver que id esta cada funcion
	idfun1 db " 1) ", "$"
	idfun2 db " 2) ", "$"
	idfun3 db " 3) ", "$"
	idfun4 db " 4) ", "$"
	idfun5 db " 5) ", "$"
	idfun6 db " 6) ", "$"
	idfun7 db " 7) ", "$"
	idfun8 db " 8) ", "$"
	idfun9 db " 9) ", "$"
	idfun10 db " 10) ", "$"
	idfun11 db " 11) ", "$"
	idfun12 db " 12) ", "$"
	idfun13 db " 13) ", "$"
	idfun14 db " 14) ", "$"
	idfun15 db " 15) ", "$"
	idfun16 db " 16) ", "$"
	idfun17 db " 17) ", "$"
	idfun18 db " 18) ", "$"
	idfun19 db " 19) ", "$"
	idfun20 db " 20) ", "$"

	;Variable para guardar las funciones
	fun1 db 50 dup ("$")
	fun2 db 50 dup ("$")
	fun3 db 50 dup ("$")
	fun4 db 50 dup ("$")
	fun5 db 50 dup ("$")
	fun6 db 50 dup ("$")
	fun7 db 50 dup ("$")
	fun8 db 50 dup ("$")
	fun9 db 50 dup ("$")
	fun10 db 50 dup ("$")
	fun11 db 50 dup ("$")
	fun12 db 50 dup ("$")
	fun13 db 50 dup ("$")
	fun14 db 50 dup ("$")
	fun15 db 50 dup ("$")
	fun16 db 50 dup ("$")
	fun17 db 50 dup ("$")
	fun18 db 50 dup ("$")
	fun19 db 50 dup ("$")
	fun20 db 50 dup ("$")

	;Variable general
	general db 50 dup("$")
	modo dw 0 ;1=derivar, 2=integrar, 3=resolver

	;Variable para guardar las funciones derivaras
	d1 db 50 dup ("$")
	d2 db 50 dup ("$")
	d3 db 50 dup ("$")
	d4 db 50 dup ("$")
	d5 db 50 dup ("$")
	d6 db 50 dup ("$")
	d7 db 50 dup ("$")
	d8 db 50 dup ("$")
	d9 db 50 dup ("$")
	d10 db 50 dup ("$")
	d11 db 50 dup ("$")
	d12 db 50 dup ("$")
	d13 db 50 dup ("$")
	d14 db 50 dup ("$")
	d15 db 50 dup ("$")
	d16 db 50 dup ("$")
	d17 db 50 dup ("$")
	d18 db 50 dup ("$")
	d19 db 50 dup ("$")
	d20 db 50 dup ("$")

	;Variable para guardar las funciones Integradas
	i1 db 50 dup ("$")
	i2 db 50 dup ("$")
	i3 db 50 dup ("$")
	i4 db 50 dup ("$")
	i5 db 50 dup ("$")
	i6 db 50 dup ("$")
	i7 db 50 dup ("$")
	i8 db 50 dup ("$")
	i9 db 50 dup ("$")
	i10 db 50 dup ("$")
	i11 db 50 dup ("$")
	i12 db 50 dup ("$")
	i13 db 50 dup ("$")
	i14 db 50 dup ("$")
	i15 db 50 dup ("$")
	i16 db 50 dup ("$")
	i17 db 50 dup ("$")
	i18 db 50 dup ("$")
	i19 db 50 dup ("$")
	i20 db 50 dup ("$")

	retorno dw 0

	;Variable para mostrar error
	err1 db "Error: El valor ingresado no esta entre 1 y 8", 10d, 13, "$"
	err2 db "Error: El valor ingresado no es a, b, c", 10d, 13, "$"
	err3 db "Error: Se alcanzo el maximo permitido de funciones", 10d, 13, "$"
	err4 db "Error: La entrada tiene valores no validos", 10d, 13, "$"
	err5 db "Error: No se pudo abrir el archivo", 10d, 13, "$"
	err6 db "Advertencia: No hay ningun funcion ingresado", 10d, 13, "$"
	err7 db "Error: El Id ingresado no esta entre 1 y 20", 10d, 13, "$"
	err8 db "Error: El Id ingresado no hay funcion", 10d, 13, "$"
	err9 db "Error: El grado de la funcion es mayor a 2", 10d, 13, "$"

	;Varaible para leer el archivo
	textoArchivo db 2222 dup ("$")
	ruta  db  20 dup("$")
	handle dw ?
	

	;Variable para capturar informacion ingresada
	info db 50 dup ("$")
	saltoLinea db 10d, 13d, "$"
	salto db 0ah, 0dh, '$','$'
	;Variable para derivar
	num db 10 dup("$")
	pot db " ", "$"
	result dw 0
	dig dw 0
	pos dw 0
	espacio db " "

	;variables soluciones
	auxnumero dw 0
	tienesigno db 0
	n1 dw 0
	n2 dw 0
	n3 dw 0
	n4 dw 0
	n5 dw 0
	potencia2 dw 2
	potencia3 dw 3
	potencia4 dw 4
	solucionX1 db 0
	solucionX2 db 0
	ingreselaFuncion db 'Ingrese la Funcion cuadratica para resolverla.$'
	imprimirsolucionX1 db 'x1= $'
	imprimirsolucionX2 db 'x2= $'
	errorSolucion db 'No tiene Solucion$'
	;variables modo Video
	funcion db 50 dup ("$")
	peticion db 'Desea introducir su propio rango(S/N)$'
	peticionid db 'Ingrese el ID de la ecuacion a graficar:$'
	ecuacionagraficar dw 0
	iniciografica dw 0
	fingrafica dw 0
	imprimiriniciografica db 'Coloque el inicio de la grafica: $'
	imprimirfingrafica db 'Coloque el fin de la grafica: $'
	punto dw 0


sdatos ends


scodigo segment 'CODE'
    
	ASSUME SS:spila, DS:sdatos, CS:scodigo         
	
	print macro cadena
		mov dx, offset cadena
		mov ah, 09h
		int 21h
	endm

	print2 macro registro
    	push ax
    	push dx
    	mov dl,registro
    	mov ah,02h
    	int 21h
    	pop dx
    	pop ax
	endm

	AsignarValor macro cadena1, cadena2
		local ciclo, finalciclo
		push bx
		push ax
		xor ax, ax
		xor bx, bx
		ciclo:
			mov al, cadena1[bx]
			cmp al, "$"
			je finalciclo
			mov cadena2[bx], al
			inc bx
			jmp ciclo
		finalciclo:

		pop ax
		pop bx

	endm

	LecturaTec macro entrada,cantidad
		local salto,finalM,otroCiclo, seguir
		push bx
		xor bx,bx
		otroCiclo:
		mov entrada[bx],"$"
		inc bx
		cmp bx,cantidad
		jnz otroCiclo	
		xor bx,bx
		salto:
		mov ah,01h
		int 21h
		cmp al,10
		jz finalM
		cmp al,13
		jz finalM
		mov entrada[bx],al
		inc bx; DEJAR DE LEER CUANDO AL ES 10,13
		cmp bx,cantidad
		jnz salto
		finalM:
			cmp modo, 1
			jne seguir
			inc bx
			mov entrada[bx], 0
		seguir:
		pop bx	
	endm

	IngFun macro variable,datos
		local Ciclo, FinCiclo
		push bx
		push ax

		xor bx, bx
		Ciclo:
			mov al, datos[bx]
			cmp al, "$"
			je FinCiclo
			mov variable[bx], al
			inc bx
			jmp Ciclo
		
		FinCiclo:
		pop ax
		pop bx
	endm
	
	POSICION_ENTRADA proc
		push bx

		mov bx, 0
		cmp fun1[bx], "$"
		je Id1

		cmp fun2[bx], "$"
		je Id2

		cmp fun3[bx], "$"
		je Id3

		cmp fun4[bx], "$"
		je Id4

		cmp fun5[bx], "$"
		je Id5

		cmp fun6[bx], "$"
		je Id6

		cmp fun7[bx], "$"
		je Id7

		cmp fun8[bx], "$"
		je Id8

		cmp fun9[bx], "$"
		je Id9

		cmp fun10[bx], "$"
		je Id10

		cmp fun11[bx], "$"
		je Id11

		cmp fun12[bx], "$"
		je Id12

		cmp fun13[bx], "$"
		je Id13

		cmp fun14[bx], "$"
		je Id14

		cmp fun15[bx], "$"
		je Id15

		cmp fun16[bx], "$"
		je Id16

		cmp fun17[bx], "$"
		je Id17
		
		cmp fun18[bx], "$"
		je Id18

		cmp fun19[bx], "$"
		je Id19

		cmp fun20[bx], "$"
		je Id20

		jmp error3

		Id1:
			IngFun fun1, info
			jmp FinIngFun
		Id2:
			IngFun fun2, info
			jmp FinIngFun
		Id3:
			IngFun fun3, info
			jmp FinIngFun
		Id4:
			IngFun fun4, info
			jmp FinIngFun
		Id5:
			IngFun fun5, info
			jmp FinIngFun
		Id6:
			IngFun fun6, info
			jmp FinIngFun
		Id7:
			IngFun fun7, info
			jmp FinIngFun
		Id8:
			IngFun fun8, info
			jmp FinIngFun
		Id9:
			IngFun fun9, info
			jmp FinIngFun
		Id10:
			IngFun fun10, info
			jmp FinIngFun
		Id11:
			IngFun fun11, info
			jmp FinIngFun
		Id12:
			IngFun fun12, info
			jmp FinIngFun
		Id13:
			IngFun fun13, info
			jmp FinIngFun
		Id14:
			IngFun fun14, info
			jmp FinIngFun
		Id15:
			IngFun fun15, info
			jmp FinIngFun
		Id16:
			IngFun fun16, info
			jmp FinIngFun
		Id17:
			IngFun fun17, info
			jmp FinIngFun
		Id18:
			IngFun fun18, info
			jmp FinIngFun
		Id19:
			IngFun fun19, info
			jmp FinIngFun
		Id20:
			IngFun fun20, info
		FinIngFun:

		pop bx
		ret
	POSICION_ENTRADA endp

	VerificarDatos macro datos
		local RecorrerDatos, Numero, Incrementar, Incrementar2, LetraX, ComprobarPotencia, Correcto, TodoCorrecto, PotCorrecto, NoHayLetraX, Signo
		push bx
		xor bx, bx
		RecorrerDatos:
			mov cx, 0
				
			cmp datos[bx], "-"
			je Incrementar2
			jmp Numero

			Signo:
				cmp datos[bx], "-"
				je Incrementar2
				cmp datos[bx], "+"
				je Incrementar2
				jmp error4
				
				Incrementar2:
					inc bx

			Numero:
				cmp datos[bx], "0"
				je Incrementar
				cmp datos[bx], "1"
				je Incrementar
				cmp datos[bx], "2"
				je Incrementar
				cmp datos[bx], "3"
				je Incrementar
				cmp datos[bx], "4"
				je Incrementar
				cmp datos[bx], "5"
				je Incrementar
				cmp datos[bx], "6"
				je Incrementar
				cmp datos[bx], "7"
				je Incrementar
				cmp datos[bx], "8"
				je Incrementar
				cmp datos[bx], "9"
				je Incrementar
				jmp LetraX

				Incrementar:
					cmp cx, 2
					je error4
					inc cx
					inc bx
					jmp Numero

			LetraX:
				
				cmp datos[bx], "x"
				jne NoHayLetraX
				inc bx
				cmp datos[bx], "^"
				je ComprobarPotencia
				dec bx
				jmp PotCorrecto

			NoHayLetraX:
				cmp cx, 0
				je error4 
				cmp datos[bx], "$"
				je TodoCorrecto
				mov cx, 0
				jmp Signo

			ComprobarPotencia:
				inc bx 
				cmp datos[bx], "1"
				je PotCorrecto
				cmp datos[bx], "2"
				je PotCorrecto
				cmp datos[bx], "3"
				je PotCorrecto
				cmp datos[bx], "4"
				je PotCorrecto
				jmp error4
			
			PotCorrecto:
				inc bx
				cmp datos[bx], "$"
				je TodoCorrecto
				mov cx, 0
				jmp Signo

			TodoCorrecto:
		pop bx
	endm

	abrirArchivo macro rutaArch
		push ax
		push dx
		
		mov ah, 3Dh
		mov al, 2
		mov dx, offset rutaArch
		int 21h
		jc error5
		mov handle, ax

		pop dx
		pop ax
	endm

	cerrarArchivo macro idArchivo
		mov ah, 3Eh
		mov bx, idArchivo
		int 21h
	endm

	LimpiarVariable macro entrada,cantidad
		local otroCiclo
		push bx
		xor bx,bx
		otroCiclo:
		mov entrada[bx],"$"
		inc bx
		cmp bx,cantidad
		jnz otroCiclo
		pop bx
	endm
	
	MOSTRAR_FUNCION proc
		xor bx, bx
		
		cmp fun1[bx], "$"
		je error6
		print idfun1
		print fun1
		print saltoLinea

		cmp fun2[bx], "$"
		je FinImplimirFunciones
		print idfun2
		print fun2
		print saltoLinea

		cmp fun3[bx], "$"
		je FinImplimirFunciones
		print idfun3
		print fun3
		print saltoLinea

		cmp fun4[bx], "$"
		je FinImplimirFunciones
		print idfun4
		print fun4
		print saltoLinea

		cmp fun5[bx], "$"
		je FinImplimirFunciones
		print idfun5
		print fun5
		print saltoLinea

		cmp fun6[bx], "$"
		je FinImplimirFunciones
		print idfun6
		print fun6
		print saltoLinea

		cmp fun7[bx], "$"
		je FinImplimirFunciones
		print idfun7
		print fun7
		print saltoLinea

		cmp fun8[bx], "$"
		je FinImplimirFunciones
		print idfun8
		print fun8
		print saltoLinea

		cmp fun9[bx], "$"
		je FinImplimirFunciones
		print idfun9
		print fun9
		print saltoLinea

		cmp fun10[bx], "$"
		je FinImplimirFunciones
		print idfun10
		print fun10
		print saltoLinea

		cmp fun11[bx], "$"
		je FinImplimirFunciones
		print idfun11
		print fun11
		print saltoLinea

		cmp fun12[bx], "$"
		je FinImplimirFunciones
		print idfun12
		print fun12
		print saltoLinea

		cmp fun13[bx], "$"
		je FinImplimirFunciones
		print idfun13
		print fun13
		print saltoLinea

		cmp fun14[bx], "$"
		je FinImplimirFunciones
		print idfun14
		print fun14
		print saltoLinea

		cmp fun15[bx], "$"
		je FinImplimirFunciones
		print idfun15
		print fun15
		print saltoLinea

		cmp fun16[bx], "$"
		je FinImplimirFunciones
		print idfun16
		print fun16
		print saltoLinea

		cmp fun17[bx], "$"
		je FinImplimirFunciones
		print idfun17
		print fun17
		print saltoLinea

		cmp fun18[bx], "$"
		je FinImplimirFunciones
		print idfun18
		print fun18
		print saltoLinea

		cmp fun19[bx], "$"
		je FinImplimirFunciones
		print idfun19
		print fun19
		print saltoLinea

		cmp fun20[bx], "$"
		je FinImplimirFunciones
		print idfun20
		print fun20
		print saltoLinea

		FinImplimirFunciones:
		ret
	MOSTRAR_FUNCION endp

	ExisteFuncion macro idFuncion
		xor bx, bx
		cmp idFuncion[bx], "$"
		je error8
	endm 

	IMPRIMIR_NUMERO proc
		push dx
		push si
		;push di
		push cx
		push bx

		mov cx, '$'
		push cx
		for1num:
			xor dx, dx
			mov bx, 10d
			div bx
			push dx
			cmp ax, 10
			jge for1num		
			cmp ax, 0
			je axEs0
		push ax

		axEs0:

		for2num:
			pop dx
			cmp dl, '$'
			je finFor2

			mov ah, 02h
			add dl, 30h
			;mov digito, dl  <-- numero
			mov general[di], dl
			inc di
			;int 21h <-- implimir numero
			;print saltoLinea
			jmp for2num
		finFor2:
		
		pop bx
		pop cx
		;pop di
		pop si
		pop dx
		ret
	IMPRIMIR_NUMERO endp

	ConversionDig macro digito
		push bx
		mov ax, result
		mov bx, 10
		mul bx
		add ax, digito
		pop bx
	endm

	ConvertirStrInt macro cadenaNum
		local Ciclo1, Numero1, NumeroObtenido, Numero0, Numero1, Numero2, Numero3, Numero4, Numero5, Numero6, Numero7, Numero8, Numero9
		push bx
		push ax
		xor bx, bx
		xor ax, ax
		mov result, 0
		Ciclo1:
			cmp cadenaNum[bx], "0"
			je Numero0
			cmp cadenaNum[bx], "1"
			je Numero1
			cmp cadenaNum[bx], "2"
			je Numero2
			cmp cadenaNum[bx], "3"
			je Numero3
			cmp cadenaNum[bx], "4"
			je Numero4
			cmp cadenaNum[bx], "5"
			je Numero5
			cmp cadenaNum[bx], "6"
			je Numero6
			cmp cadenaNum[bx], "7"
			je Numero7
			cmp cadenaNum[bx], "8"
			je Numero8
			cmp cadenaNum[bx], "9"
			je Numero9


			Numero0: 
				ConversionDig 0
				inc bx
				cmp cadenaNum[bx], "$"
				je NumeroObtenido
				mov result, ax
				jmp Ciclo1

			Numero1: 
				ConversionDig 1
				inc bx
				cmp cadenaNum[bx], "$"
				je NumeroObtenido
				mov result, ax
				jmp Ciclo1

			Numero2: 
				ConversionDig 2
				inc bx
				cmp cadenaNum[bx], "$"
				je NumeroObtenido
				mov result, ax
				jmp Ciclo1

			Numero3: 
				ConversionDig 3
				inc bx
				cmp cadenaNum[bx], "$"
				je NumeroObtenido
				mov result, ax
				jmp Ciclo1

			Numero4: 
				ConversionDig 4
				inc bx
				cmp cadenaNum[bx], "$"
				je NumeroObtenido
				mov result, ax
				jmp Ciclo1

			Numero5: 
				ConversionDig 5
				inc bx
				cmp cadenaNum[bx], "$"
				je NumeroObtenido
				mov result, ax
				jmp Ciclo1

			Numero6: 
				ConversionDig 6
				inc bx
				cmp cadenaNum[bx], "$"
				je NumeroObtenido
				mov result, ax
				jmp Ciclo1

			Numero7: 
				ConversionDig 7
				inc bx
				cmp cadenaNum[bx], "$"
				je NumeroObtenido
				mov result, ax
				jmp Ciclo1

			Numero8: 
				ConversionDig 8
				inc bx
				cmp cadenaNum[bx], "$"
				je NumeroObtenido
				mov result, ax
				jmp Ciclo1

			Numero9: 
				ConversionDig 9
				inc bx
				cmp cadenaNum[bx], "$"
				je NumeroObtenido
				mov result, ax
				jmp Ciclo1
			
		NumeroObtenido:
			mov dig, ax
			
		pop ax
		pop bx
	endm

	DerivarFuncion macro funcion
		local CicloFuncion, SignoPositivo, SignoNegativo, EliminarSigno, NumbersG,NumbersG2, DatosNum, Number0, Number1, Number2, Number3, Number4, Number5, Number6, Number7, Number8, Number9, ExistePotencia, SiHayPotencia, Ingresar2, Ingresar3, Ingresar4, Potencia, pot1, pot2, pot3, pot4, Verificar, FinDerivarFuncion, EsDerivar0, EsIntegrar0, EsDerivar1, EsIntegrar1, EsDerivar2, EsIntegrar2, EsDerivar3, EsIntegrar3, , EsDerivar4, EsIntegrar4, UnDigitos, DosDigitos, ColocarX
		push si
		push di
		push bx
		push ax
		xor bx, bx
		xor si, si
		xor di, di
		CicloFuncion:
			xor si, si
			mov al, funcion[bx]
			cmp al, "+"
			je SignoPositivo
			cmp al, "-"
			je SignoNegativo

			jmp NumbersG2
			
			SignoNegativo:
				mov general[di], "-"
				inc di
				jmp NumbersG

			SignoPositivo:
				mov general[di], "+"
				inc di
				jmp NumbersG

			NumbersG: 
				inc bx
				NumbersG2:
				mov al, funcion[bx]
				cmp al, "0"
				je Number0
				cmp al, "1"
				je Number1
				cmp al, "2"
				je Number2
				cmp al, "3"
				je Number3
				cmp al, "4"
				je Number4
				cmp al, "5"
				je Number5
				cmp al, "6"
				je Number6
				cmp al, "7"
				je Number7
				cmp al, "8"
				je Number8
				cmp al, "9"
				je Number9

				cmp al, "x"
				je DatosNum

				jmp EliminarSigno

				DatosNum:
					cmp si, 0
					jne ExistePotencia
					mov num[si], "1"
					inc si
					jmp ExistePotencia

				Number0:
					mov num[si], "0"
					inc si
					jmp NumbersG
				Number1:
					mov num[si], "1"
					inc si
					jmp NumbersG
				Number2:
					mov num[si], "2"
					inc si
					jmp NumbersG
				Number3:
					mov num[si], "3"
					inc si
					jmp NumbersG
				Number4:
					mov num[si], "4"
					inc si
					jmp NumbersG
				Number5:
					mov num[si], "5"
					inc si
					jmp NumbersG
				Number6:
					mov num[si], "6"
					inc si
					jmp NumbersG
				Number7:
					mov num[si], "7"
					inc si
					jmp NumbersG
				Number8:
					mov num[si], "8"
					inc si
					jmp NumbersG
				Number9:
					mov num[si], "9"
					inc si
					jmp NumbersG


			ExistePotencia:
				inc bx
				mov al, funcion[bx]
				cmp al, "^"
				je SiHayPotencia
				dec bx
				mov pot, "1"
				jmp Potencia
		
			SiHayPotencia:
				inc bx
				mov al, funcion[bx]
				cmp al, "2"
				je Ingresar2
				mov al, funcion[bx]
				cmp al, "3"
				je Ingresar3
				mov al, funcion[bx]
				cmp al, "4"
				je Ingresar4
			
			Ingresar2:
				mov pot, "2"
				jmp Potencia
			Ingresar3:
				mov pot, "3"
				jmp Potencia
			Ingresar4:
				mov pot, "4"
				jmp Potencia

			

			Potencia:
				cmp pot, "1"
				je pot1
				cmp pot, "2"
				je pot2
				cmp pot, "3"
				je pot3
				cmp pot, "4"
				je pot4

				pot1:
					push bx
					xor ax, ax
					ConvertirStrInt num

					cmp modo, 1
					je EsDerivar1
					cmp modo, 2
					je EsIntegrar1

					EsDerivar1:
						mov ax, dig
						call IMPRIMIR_NUMERO
						pop bx
						jmp Verificar
					
					EsIntegrar1:
						mov ax, dig
						mov bx, 2
						div bx
						call IMPRIMIR_NUMERO
						mov general[di], "x"
						inc di
						mov general[di], "^"
						inc di
						mov general[di], "2"
						inc di
						pop bx
						jmp Verificar
				pot2:
					push bx
					xor ax, ax
					ConvertirStrInt num

					cmp modo, 1
					je EsDerivar2
					cmp modo, 2
					je EsIntegrar2
					
					EsDerivar2:
						mov ax, dig
						mov bl, 2
						mul bl
						call IMPRIMIR_NUMERO
						mov general[di], "x"
						inc di
						pop bx
						jmp Verificar

					EsIntegrar2:
						mov ax, dig
						mov bx, 3
						div bx
						call IMPRIMIR_NUMERO
						mov general[di], "x"
						inc di
						mov general[di], "^"
						inc di
						mov general[di], "3"
						inc di
						pop bx
						jmp Verificar
				pot3:
					push bx
					xor ax, ax
					ConvertirStrInt num

					cmp modo, 1
					je EsDerivar3
					cmp modo, 2
					je EsIntegrar3

					EsDerivar3:
						mov ax, dig
						mov bl, 3
						mul bl
						call IMPRIMIR_NUMERO
						mov general[di], "x"
						inc di
						mov general[di], "^"
						inc di
						mov general[di], "2"
						inc di
						pop bx
						jmp Verificar
					
					EsIntegrar3:
						mov ax, dig
						mov bx, 4
						div bx
						call IMPRIMIR_NUMERO
						mov general[di], "x"
						inc di
						mov general[di], "^"
						inc di
						mov general[di], "4"
						inc di
						pop bx
						jmp Verificar

				pot4:
					push bx
					xor ax, ax
					ConvertirStrInt num

					cmp modo, 1
					je EsDerivar4
					cmp modo, 2
					je EsIntegrar4

					EsDerivar4:
						mov ax, dig
						mov bl, 4
						mul bl
						call IMPRIMIR_NUMERO
						mov general[di], "x"
						inc di
						mov general[di], "^"
						inc di
						mov general[di], "3"
						inc di
						pop bx
						jmp Verificar

					EsIntegrar4:
						mov ax, dig
						mov bx, 5
						div bx
						call IMPRIMIR_NUMERO
						mov general[di], "x"
						inc di
						mov general[di], "^"
						inc di
						mov general[di], "5"
						inc di
						pop bx
						jmp Verificar

			EliminarSigno:

				cmp modo, 1
				je EsDerivar0
				cmp modo, 2
				je EsIntegrar0

				EsDerivar0:
					dec di
					mov general[di], "$"
					dec bx
					jmp Verificar
				
				EsIntegrar0:
					push bx
					xor ax, ax
					cmp si, 1
					je UnDigitos
					cmp si, 2
					je DosDigitos

					UnDigitos:
						dec si
						mov al, num[si]
						mov general[di], al
						inc di
						jmp ColocarX

					DosDigitos:
						dec si
						dec si
						mov al, num[si]
						mov general[di], al
						inc si
						inc di
						mov al, num[si]
						mov general[di], al
						inc di
					ColocarX:
					mov general[di], "x"
					inc di
					pop bx

			Verificar:
				mov dig, 0
				LimpiarVariable num, 10
				inc bx
				mov al, funcion[bx]
				cmp al, "$"
				je FinDerivarFuncion
				jmp CicloFuncion

		FinDerivarFuncion:

		pop ax
		pop bx
		pop di
		pop si
	endm

	ComprobarGrado2 macro funcion
		local Ciclo, VerPotencia, FinalCiclo, Correcto
		push bx
		push ax

		Ciclo:
			mov al, funcion[bx]
			cmp al, "$"
			je FinalCiclo
			
			cmp al, "^"
			je VerPotencia

			inc bx
			jmp Ciclo
		
		VerPotencia:
			inc bx
			mov al, funcion[bx]
			cmp al, "1"
			je Correcto
			cmp al, "2"
			je Correcto
			jmp error9

		Correcto:
			inc bx
			jmp Ciclo

		FinalCiclo:
		
		pop ax
		pop bx
	endm

	DERIVAR_INTEGRAR_RESOLVER proc 
		;Ingresar ID ........1 a 20
		print msg3
		xor bx,bx 
		LecturaTec info, 50
		cmp info[bx], "1"
		je DosDigito
		cmp info[bx], "2"
		je ExisteCero

		inc bx
		cmp info[bx], "$"
		jne error7
		dec bx

		cmp info[bx], "3"
		je DerivarFun3
		cmp info[bx], "4"
		je DerivarFun4
		cmp info[bx], "5"
		je DerivarFun5
		cmp info[bx], "6"
		je DerivarFun6
		cmp info[bx], "7"
		je DerivarFun7
		cmp info[bx], "8"
		je DerivarFun8
		cmp info[bx], "9"
		je DerivarFun9

		DosDigito:
			inc bx
			cmp info[bx], "$"
			je DerivarFun1
			inc bx
			cmp info[bx], "$"
			jne error7
			dec bx

			cmp info[bx], "0"
			je DerivarFun10
			cmp info[bx], "1"
			je DerivarFun11
			cmp info[bx], "2"
			je DerivarFun12
			cmp info[bx], "3"
			je DerivarFun13
			cmp info[bx], "4"
			je DerivarFun14
			cmp info[bx], "5"
			je DerivarFun15
			cmp info[bx], "6"
			je DerivarFun16
			cmp info[bx], "7"
			je DerivarFun17
			cmp info[bx], "8"
			je DerivarFun18
			cmp info[bx], "9"
			je DerivarFun19

		ExisteCero:
			inc bx 
			cmp info[bx], "$"
			je DerivarFun2
			inc bx
			cmp info[bx], "$"
			jne error7
			dec bx
			cmp info[bx], "0"
			je DerivarFun20
			jmp error7


		jmp error7

		DerivarFun1:
			ExisteFuncion fun1
			cmp modo, 3
			jne seguir1
			
			ComprobarGrado2 fun1
			
			seguir1:
			DerivarFuncion fun1
			cmp modo, 1
			je ResultadoDerivar1
			cmp modo, 2
			je ResultadoIntegrar1
			
			ResultadoDerivar1:
				AsignarValor general, d1
				print msg4
				print fun1
				print saltoLinea
				print msg5
				print d1
				print saltoLinea
				jmp FinTodo
			
			ResultadoIntegrar1:
				AsignarValor general, i1
				print msg4
				print fun1
				print saltoLinea
				print msg6
				print i1
				print saltoLinea
				jmp FinTodo
			
		DerivarFun2:
			ExisteFuncion fun2
			cmp modo, 3
			jne seguir2
			
			ComprobarGrado2 fun2
			
			seguir2:
			DerivarFuncion fun2
			cmp modo, 1
			je ResultadoDerivar2
			cmp modo, 2
			je ResultadoIntegrar2
			
			ResultadoDerivar2:
				AsignarValor general, d2
				print msg4
				print fun2
				print saltoLinea
				print msg5
				print d2
				print saltoLinea
				jmp FinTodo
			
			ResultadoIntegrar2:
				AsignarValor general, i2
				print msg4
				print fun2
				print saltoLinea
				print msg6
				print i2
				print saltoLinea
				jmp FinTodo

			jmp FinTodo
		DerivarFun3:
			ExisteFuncion fun3
			cmp modo, 3
			jne seguir3
			
			ComprobarGrado2 fun3
			
			seguir3:
			DerivarFuncion fun3
			cmp modo, 1
			je ResultadoDerivar3
			cmp modo, 2
			je ResultadoIntegrar3
			
			ResultadoDerivar3:
				AsignarValor general, d3
				print msg4
				print fun3
				print saltoLinea
				print msg5
				print d3
				print saltoLinea
				jmp FinTodo
			
			ResultadoIntegrar3:
				AsignarValor general, i3
				print msg4
				print fun3
				print saltoLinea
				print msg6
				print i3
				print saltoLinea
				jmp FinTodo

			jmp FinTodo
		DerivarFun4:
			ExisteFuncion fun4
			cmp modo, 3
			jne seguir4
			
			ComprobarGrado2 fun4
			
			seguir4:
			DerivarFuncion fun4
			cmp modo, 1
			je ResultadoDerivar4
			cmp modo, 2
			je ResultadoIntegrar4
			
			ResultadoDerivar4:
				AsignarValor general, d4
				print msg4
				print fun4
				print saltoLinea
				print msg5
				print d4
				print saltoLinea
				jmp FinTodo
			
			ResultadoIntegrar4:
				AsignarValor general, i4
				print msg4
				print fun4
				print saltoLinea
				print msg6
				print i4
				print saltoLinea
				jmp FinTodo

			jmp FinTodo
		DerivarFun5:
			ExisteFuncion fun5
			cmp modo, 3
			jne seguir5
			
			ComprobarGrado2 fun5
			
			seguir5:
			DerivarFuncion fun5
			cmp modo, 1
			je ResultadoDerivar5
			cmp modo, 2
			je ResultadoIntegrar5
			
			ResultadoDerivar5:
				AsignarValor general, d5
				print msg4
				print fun5
				print saltoLinea
				print msg5
				print d5
				print saltoLinea
				jmp FinTodo
			
			ResultadoIntegrar5:
				AsignarValor general, i5
				print msg4
				print fun5
				print saltoLinea
				print msg6
				print i5
				print saltoLinea
				jmp FinTodo

		DerivarFun6:
			ExisteFuncion fun6
			cmp modo, 3
			jne seguir6
			
			ComprobarGrado2 fun6
			
			seguir6:
			DerivarFuncion fun6
			cmp modo, 1
			je ResultadoDerivar6
			cmp modo, 2
			je ResultadoIntegrar6
			
			ResultadoDerivar6:
				AsignarValor general, d6
				print msg4
				print fun6
				print saltoLinea
				print msg5
				print d6
				print saltoLinea
				jmp FinTodo
			
			ResultadoIntegrar6:
				AsignarValor general, i6
				print msg4
				print fun6
				print saltoLinea
				print msg6
				print i6
				print saltoLinea
				jmp FinTodo

		DerivarFun7:
			ExisteFuncion fun7
			cmp modo, 3
			jne seguir7
			
			ComprobarGrado2 fun7
			
			seguir7:
			DerivarFuncion fun7
			cmp modo, 1
			je ResultadoDerivar7
			cmp modo, 2
			je ResultadoIntegrar7
			
			ResultadoDerivar7:
				AsignarValor general, d7
				print msg4
				print fun7
				print saltoLinea
				print msg5
				print d7
				print saltoLinea
				jmp FinTodo
			
			ResultadoIntegrar7:
				AsignarValor general, i7
				print msg4
				print fun7
				print saltoLinea
				print msg6
				print i7
				print saltoLinea
				jmp FinTodo

		DerivarFun8:
			ExisteFuncion fun8
			cmp modo, 3
			jne seguir8
			
			ComprobarGrado2 fun8
			
			seguir8:
			DerivarFuncion fun8
			cmp modo, 1
			je ResultadoDerivar8
			cmp modo, 2
			je ResultadoIntegrar8
			
			ResultadoDerivar8:
				AsignarValor general, d8
				print msg4
				print fun8
				print saltoLinea
				print msg5
				print d8
				print saltoLinea
				jmp FinTodo
			
			ResultadoIntegrar8:
				AsignarValor general, i8
				print msg4
				print fun8
				print saltoLinea
				print msg6
				print i8
				print saltoLinea
				jmp FinTodo

		DerivarFun9:
			ExisteFuncion fun9
			cmp modo, 3
			jne seguir9
			
			ComprobarGrado2 fun9
			
			seguir9:
			DerivarFuncion fun9
			cmp modo, 1
			je ResultadoDerivar9
			cmp modo, 2
			je ResultadoIntegrar9
			
			ResultadoDerivar9:
				AsignarValor general, d9
				print msg4
				print fun9
				print saltoLinea
				print msg5
				print d9
				print saltoLinea
				jmp FinTodo
			
			ResultadoIntegrar9:
				AsignarValor general, i9
				print msg4
				print fun9
				print saltoLinea
				print msg6
				print i9
				print saltoLinea
				jmp FinTodo

		DerivarFun10:
			ExisteFuncion fun10
			cmp modo, 3
			jne seguir10
			
			ComprobarGrado2 fun10
			
			seguir10:
			DerivarFuncion fun10
			cmp modo, 1
			je ResultadoDerivar10
			cmp modo, 2
			je ResultadoIntegrar10
			
			ResultadoDerivar10:
				AsignarValor general, d10
				print msg4
				print fun10
				print saltoLinea
				print msg5
				print d10
				print saltoLinea
				jmp FinTodo
			
			ResultadoIntegrar10:
				AsignarValor general, i10
				print msg4
				print fun10
				print saltoLinea
				print msg6
				print i10
				print saltoLinea
				jmp FinTodo

		DerivarFun11:
			ExisteFuncion fun11
			cmp modo, 3
			jne seguir11
			
			ComprobarGrado2 fun11
			
			seguir11:
			DerivarFuncion fun11
			cmp modo, 1
			je ResultadoDerivar11
			cmp modo, 2
			je ResultadoIntegrar11
			
			ResultadoDerivar11:
				AsignarValor general, d11
				print msg4
				print fun11
				print saltoLinea
				print msg5
				print d11
				print saltoLinea
				jmp FinTodo
			
			ResultadoIntegrar11:
				AsignarValor general, i11
				print msg4
				print fun11
				print saltoLinea
				print msg6
				print i11
				print saltoLinea
				jmp FinTodo

		DerivarFun12:
			ExisteFuncion fun12
			cmp modo, 3
			jne seguir12
			
			ComprobarGrado2 fun12
			
			seguir12:
			DerivarFuncion fun12
			cmp modo, 1
			je ResultadoDerivar12
			cmp modo, 2
			je ResultadoIntegrar12
			
			ResultadoDerivar12:
				AsignarValor general, d12
				print msg4
				print fun12
				print saltoLinea
				print msg5
				print d12
				print saltoLinea
				jmp FinTodo
			
			ResultadoIntegrar12:
				AsignarValor general, i12
				print msg4
				print fun12
				print saltoLinea
				print msg6
				print i12
				print saltoLinea
				jmp FinTodo

		DerivarFun13:
			ExisteFuncion fun13
			cmp modo, 3
			jne seguir13
			
			ComprobarGrado2 fun13
			
			seguir13:
			DerivarFuncion fun13
			cmp modo, 1
			je ResultadoDerivar13
			cmp modo, 2
			je ResultadoIntegrar13
			
			ResultadoDerivar13:
				AsignarValor general, d13
				print msg4
				print fun13
				print saltoLinea
				print msg5
				print d13
				print saltoLinea
				jmp FinTodo
			
			ResultadoIntegrar13:
				AsignarValor general, i13
				print msg4
				print fun13
				print saltoLinea
				print msg6
				print i13
				print saltoLinea
				jmp FinTodo

		DerivarFun14:
			ExisteFuncion fun14
			cmp modo, 3
			jne seguir14
			
			ComprobarGrado2 fun14
			
			seguir14:
			DerivarFuncion fun14
			cmp modo, 1
			je ResultadoDerivar14
			cmp modo, 2
			je ResultadoIntegrar14
			
			ResultadoDerivar14:
				AsignarValor general, d14
				print msg4
				print fun14
				print saltoLinea
				print msg5
				print d14
				print saltoLinea
				jmp FinTodo
			
			ResultadoIntegrar14:
				AsignarValor general, i14
				print msg4
				print fun14
				print saltoLinea
				print msg6
				print i14
				print saltoLinea
				jmp FinTodo

		DerivarFun15:
			ExisteFuncion fun15
			cmp modo, 3
			jne seguir15
			
			ComprobarGrado2 fun15
			
			seguir15:
			DerivarFuncion fun15
			cmp modo, 1
			je ResultadoDerivar15
			cmp modo, 2
			je ResultadoIntegrar15
			
			ResultadoDerivar15:
				AsignarValor general, d15
				print msg4
				print fun15
				print saltoLinea
				print msg5
				print d15
				print saltoLinea
				jmp FinTodo
			
			ResultadoIntegrar15:
				AsignarValor general, i15
				print msg4
				print fun15
				print saltoLinea
				print msg6
				print i15
				print saltoLinea
				jmp FinTodo

		DerivarFun16:
			ExisteFuncion fun16
			cmp modo, 3
			jne seguir16
			
			ComprobarGrado2 fun16
			
			seguir16:
			DerivarFuncion fun16
			cmp modo, 1
			je ResultadoDerivar16
			cmp modo, 2
			je ResultadoIntegrar16
			
			ResultadoDerivar16:
				AsignarValor general, d16
				print msg4
				print fun16
				print saltoLinea
				print msg5
				print d16
				print saltoLinea
				jmp FinTodo
			
			ResultadoIntegrar16:
				AsignarValor general, i16
				print msg4
				print fun16
				print saltoLinea
				print msg6
				print i16
				print saltoLinea
				jmp FinTodo

		DerivarFun17:
			ExisteFuncion fun17
			cmp modo, 3
			jne seguir17
			
			ComprobarGrado2 fun17
			
			seguir17:
			DerivarFuncion fun17
			cmp modo, 1
			je ResultadoDerivar17
			cmp modo, 2
			je ResultadoIntegrar17
			
			ResultadoDerivar17:
				AsignarValor general, d17
				print msg4
				print fun17
				print saltoLinea
				print msg5
				print d17
				print saltoLinea
				jmp FinTodo
			
			ResultadoIntegrar17:
				AsignarValor general, i17
				print msg4
				print fun17
				print saltoLinea
				print msg6
				print i17
				print saltoLinea
				jmp FinTodo

		DerivarFun18:
			ExisteFuncion fun18
			cmp modo, 3
			jne seguir18
			
			ComprobarGrado2 fun18
			
			seguir18:
			DerivarFuncion fun18
			cmp modo, 1
			je ResultadoDerivar18
			cmp modo, 2
			je ResultadoIntegrar18
			
			ResultadoDerivar18:
				AsignarValor general, d18
				print msg4
				print fun18
				print saltoLinea
				print msg5
				print d18
				print saltoLinea
				jmp FinTodo
			
			ResultadoIntegrar18:
				AsignarValor general, i18
				print msg4
				print fun18
				print saltoLinea
				print msg6
				print i18
				print saltoLinea
				jmp FinTodo

		DerivarFun19:
			ExisteFuncion fun19
			cmp modo, 3
			jne seguir19
			
			ComprobarGrado2 fun19
			
			seguir19:
			DerivarFuncion fun19
			cmp modo, 1
			je ResultadoDerivar19
			cmp modo, 2
			je ResultadoIntegrar19
			
			ResultadoDerivar19:
				AsignarValor general, d19
				print msg4
				print fun19
				print saltoLinea
				print msg5
				print d19
				print saltoLinea
				jmp FinTodo
			
			ResultadoIntegrar19:
				AsignarValor general, i19
				print msg4
				print fun19
				print saltoLinea
				print msg6
				print i19
				print saltoLinea
				jmp FinTodo

		DerivarFun20:
			ExisteFuncion fun20
			cmp modo, 3
			jne seguir20
			
			ComprobarGrado2 fun20
			
			seguir20:
			DerivarFuncion fun20
			cmp modo, 1
			je ResultadoDerivar20
			cmp modo, 2
			je ResultadoIntegrar20
			
			ResultadoDerivar20:
				AsignarValor general, d20
				print msg4
				print fun20
				print saltoLinea
				print msg5
				print d20
				print saltoLinea
				jmp FinTodo
			
			ResultadoIntegrar20:
				AsignarValor general, i20
				print msg4
				print fun20
				print saltoLinea
				print msg6
				print i20
				print saltoLinea
				jmp FinTodo
			
		FinTodo:
			LimpiarVariable general, 50
		ret
	DERIVAR_INTEGRAR_RESOLVER endp
	DELAY proc ; ax -> tiempo
		push di
		mov si, ax
		mov di, ax
		
		delay1:
			dec si
			jz finDelay
			mov di, ax
			delay2:
				dec di
				jz delay1
			jmp delay2
		finDelay:

		pop di
		ret
	DELAY endp

	ESCRIBIR_EN_PUERTO proc
		;al se coloca antes de llamar al proc
		mov dx, 3F8h
		out dx, al
		ret
	ESCRIBIR_EN_PUERTO endp

	leerDePantalla macro
		mov ah, 1
		int 21h

	endm
	ENVIAR_ARD proc
		cicloEnv: 
			leerDePantalla
			call ESCRIBIR_EN_PUERTO
			cmp al, 13d
			jne cicloEnv
		ret
	ENVIAR_ARD endp

	ENVIAR_ARDUINO proc 
		print msg3
		xor bx, bx
		LecturaTec info, 50
		cmp info[bx], "1"
		je DosDigitoAr
		cmp info[bx], "2"
		je ExisteCeroAr

		inc bx 
		cmp info[bx], "$"
		jne error7
		dec bx 

		cmp info[bx], "3"
		je sendArduino3
		cmp info[bx], "4"
		je sendArduino4
		cmp info[bx], "5"
		je sendArduino5
		cmp info[bx], "6"
		je sendArduino6
		cmp info[bx], "7"
		je sendArduino7
		cmp info[bx], "8"
		je sendArduino8
		cmp info[bx], "9"
		je sendArduino9


		DosDigitoAr:
			inc bx 
			cmp info[bx], "$"
			je sendArduino1
			inc bx 

			cmp info[bx], "$"
			jne error7
			dec bx

			cmp info[bx], "0"
			je sendArduino10
			cmp info[bx], "1"
			je sendArduino11
			cmp info[bx], "2"
			je sendArduino12
			cmp info[bx], "3"
			je sendArduino13
			cmp info[bx], "4"
			je sendArduino14
			cmp info[bx], "5"
			je sendArduino15
			cmp info[bx], "6"
			je sendArduino16
			cmp info[bx], "7"
			je sendArduino17
			cmp info[bx], "8"
			je sendArduino18
			cmp info[bx], "9"
			je sendArduino19
			

		ExisteCeroAr:
			inc bx 
			cmp info[bx], "$"
			je sendArduino2
			inc bx 
			cmp info[bx], "$"
			jne error7
			dec bx
			
			cmp info[bx], "0"
			je sendArduino20
			jmp error7

		jmp error7

		sendArduino1:
			ExisteFuncion fun1
			cmp modo, 3
			jne seguirAr1
			
			ComprobarGrado2 fun1

			seguirAr1:
			 
				print msg4
				print fun1
				print saltoLinea

				xor di, di
				cicloEnv1:
					mov al, fun1[di]
					cmp al, "$"
					je unomas
					call ESCRIBIR_EN_PUERTO
					mov ax, 1000
					call DELAY
					inc di
					jmp cicloEnv1

				unomas:
					mov al, 'k'
					call ESCRIBIR_EN_PUERTO
					mov ax, 1000
					call DELAY
					

				jmp finArduino
				


		sendArduino2:
			ExisteFuncion fun2
			cmp modo, 3
			jne seguirAr2
			
			ComprobarGrado2 fun2

			seguirAr2:
				 
				print msg4
				print fun2
				print saltoLinea
				xor di, di
				cicloEnv2:
					mov al, fun2[di]
					cmp al, "$"
					je unomas2
					call ESCRIBIR_EN_PUERTO
					mov ax, 1000
					call DELAY
					inc di
					jmp cicloEnv2

				unomas2:
					mov al, 'k'
					call ESCRIBIR_EN_PUERTO
					mov ax, 1000
					call DELAY

				jmp finArduino

		sendArduino3:
			ExisteFuncion fun3
			cmp modo, 3
			jne seguirAr3
			
			ComprobarGrado2 fun3

			seguirAr3:
				print msg4
				print fun3
				print saltoLinea
				xor di, di
				cicloEnv3:
					mov al, fun3[di]
					cmp al, "$"
					je unomas3
					call ESCRIBIR_EN_PUERTO
					mov ax, 1000
					call DELAY
					inc di
					jmp cicloEnv3

				unomas3:
					mov al, 'k'
					call ESCRIBIR_EN_PUERTO
					mov ax, 1000
					call DELAY
				jmp finArduino

		sendArduino4:
			ExisteFuncion fun4
			cmp modo, 3
			jne seguirAr4
			
			ComprobarGrado2 fun4

			seguirAr4:
				print msg4
				print fun4
				print saltoLinea
				xor di, di
				cicloEnv4:
					mov al, fun4[di]
					cmp al, "$"
					je unomas4
					call ESCRIBIR_EN_PUERTO
					mov ax, 1000
					call DELAY
					inc di
					jmp cicloEnv4

				unomas4:
					mov al, 'k'
					call ESCRIBIR_EN_PUERTO
					mov ax, 1000
					call DELAY
				jmp finArduino

		sendArduino5:
			ExisteFuncion fun5
			cmp modo, 3
			jne seguirAr5
			
			ComprobarGrado2 fun5

			seguirAr5:
				print msg4
				print fun5
				print saltoLinea
				xor di, di
				cicloEnv5:
					mov al, fun5[di]
					cmp al, "$"
					je unomas5
					call ESCRIBIR_EN_PUERTO
					mov ax, 1000
					call DELAY
					inc di
					jmp cicloEnv5

				unomas5:
					mov al, 'k'
					call ESCRIBIR_EN_PUERTO
					mov ax, 1000
					call DELAY

				jmp finArduino
			
		sendArduino6:
			ExisteFuncion fun6
			cmp modo, 3
			jne seguirAr6
			
			ComprobarGrado2 fun6

			seguirAr6:
				print msg4
				print fun6
				print saltoLinea
				xor di, di
				cicloEnv6:
					mov al, fun6[di]
					cmp al, "$"
					je unomas6
					call ESCRIBIR_EN_PUERTO
					mov ax, 1000
					call DELAY
					inc di
					jmp cicloEnv6

				unomas6:
					mov al, 'k'
					call ESCRIBIR_EN_PUERTO
					mov ax, 1000
					call DELAY
				jmp finArduino

		sendArduino7:
			ExisteFuncion fun7
			cmp modo, 3
			jne seguirAr7
			
			ComprobarGrado2 fun7

			seguirAr7:
				print msg4
				print fun7
				print saltoLinea
				xor di, di
				cicloEnv7:
					mov al, fun7[di]
					cmp al, "$"
					je unomas7
					call ESCRIBIR_EN_PUERTO
					mov ax, 1000
					call DELAY
					inc di
					jmp cicloEnv7

				unomas7:
					mov al, 'k'
					call ESCRIBIR_EN_PUERTO
					mov ax, 1000
					call DELAY
				jmp finArduino
			
		sendArduino8:
			ExisteFuncion fun8
			cmp modo, 3
			jne seguirAr8
			
			ComprobarGrado2 fun8

			seguirAr8:
				print msg4
				print fun8
				print saltoLinea
				xor di, di
				cicloEnv8:
					mov al, fun8[di]
					cmp al, "$"
					je unomas8
					call ESCRIBIR_EN_PUERTO
					mov ax, 1000
					call DELAY
					inc di
					jmp cicloEnv8

				unomas8:
					mov al, 'k'
					call ESCRIBIR_EN_PUERTO
					mov ax, 1000
					call DELAY
				jmp finArduino

		sendArduino9:
			ExisteFuncion fun9
			cmp modo, 3
			jne seguirAr9
			
			ComprobarGrado2 fun9

			seguirAr9:
				print msg4
				print fun9
				print saltoLinea
				xor di, di
				cicloEnv9:
					mov al, fun9[di]
					cmp al, "$"
					je unomas9
					call ESCRIBIR_EN_PUERTO
					mov ax, 1000
					call DELAY
					inc di
					jmp cicloEnv9

				unomas9:
					mov al, 'k'
					call ESCRIBIR_EN_PUERTO
					mov ax, 1000
					call DELAY
				jmp finArduino

		sendArduino10:
			ExisteFuncion fun10
			cmp modo, 3
			jne seguirAr10
			
			ComprobarGrado2 fun10

			seguirAr10:
				print msg4
				print fun10
				print saltoLinea
				xor di, di
				cicloEnv10:
					mov al, fun10[di]
					cmp al, "$"
					je unomas10
					call ESCRIBIR_EN_PUERTO
					mov ax, 1000
					call DELAY
					inc di
					jmp cicloEnv10

				unomas10:
					mov al, 'k'
					call ESCRIBIR_EN_PUERTO
					mov ax, 1000
					call DELAY
				jmp finArduino

		sendArduino11:
			ExisteFuncion fun11
			cmp modo, 3
			jne seguirAr11
			
			ComprobarGrado2 fun11

			seguirAr11:
				print msg4
				print fun11
				print saltoLinea
				xor di, di
				cicloEnv11:
					mov al, fun11[di]
					cmp al, "$"
					je unomas11
					call ESCRIBIR_EN_PUERTO
					mov ax, 1000
					call DELAY
					inc di
					jmp cicloEnv11

				unomas11:
					mov al, 'k'
					call ESCRIBIR_EN_PUERTO
					mov ax, 1000
					call DELAY
				jmp finArduino

		sendArduino12:
			ExisteFuncion fun12
			cmp modo, 3
			jne seguirAr12
			
			ComprobarGrado2 fun12

			seguirAr12:
				print msg4
				print fun12
				print saltoLinea
				xor di, di
				cicloEnv12:
					mov al, fun12[di]
					cmp al, "$"
					je unomas12
					call ESCRIBIR_EN_PUERTO
					mov ax, 1000
					call DELAY
					inc di
					jmp cicloEnv12

				unomas12:
					mov al, 'k'
					call ESCRIBIR_EN_PUERTO
					mov ax, 1000
					call DELAY
				jmp finArduino

		sendArduino13:
			ExisteFuncion fun13
			cmp modo, 3
			jne seguirAr13
			
			ComprobarGrado2 fun13

			seguirAr13:
				print msg4
				print fun13
				print saltoLinea
				xor di, di
				cicloEnv13:
					mov al, fun13[di]
					cmp al, "$"
					je unomas13
					call ESCRIBIR_EN_PUERTO
					mov ax, 1000
					call DELAY
					inc di
					jmp cicloEnv13

				unomas13:
					mov al, 'k'
					call ESCRIBIR_EN_PUERTO
					mov ax, 1000
					call DELAY
				jmp finArduino

		sendArduino14:
			ExisteFuncion fun14
			cmp modo, 3
			jne seguirAr14
			
			ComprobarGrado2 fun14

			seguirAr14:
				print msg4
				print fun14
				print saltoLinea
				xor di, di
				cicloEnv14:
					mov al, fun14[di]
					cmp al, "$"
					je unomas14
					call ESCRIBIR_EN_PUERTO
					mov ax, 1000
					call DELAY
					inc di
					jmp cicloEnv14

				unomas14:
					mov al, 'k'
					call ESCRIBIR_EN_PUERTO
					mov ax, 1000
					call DELAY
				jmp finArduino

		sendArduino15:
			ExisteFuncion fun15
			cmp modo, 3
			jne seguirAr15
			
			ComprobarGrado2 fun15

			seguirAr15:
				print msg4
				print fun15
				print saltoLinea
				xor di, di
				cicloEnv15:
					mov al, fun15[di]
					cmp al, "$"
					je unomas15
					call ESCRIBIR_EN_PUERTO
					mov ax, 1000
					call DELAY
					inc di
					jmp cicloEnv15

				unomas15:
					mov al, 'k'
					call ESCRIBIR_EN_PUERTO
					mov ax, 1000
					call DELAY
				jmp finArduino

		sendArduino16:
			ExisteFuncion fun16
			cmp modo, 3
			jne seguirAr16
			
			ComprobarGrado2 fun16

			seguirAr16:
				print msg4
				print fun16
				print saltoLinea
				xor di, di
				cicloEnv16:
					mov al, fun16[di]
					cmp al, "$"
					je unomas16
					call ESCRIBIR_EN_PUERTO
					mov ax, 1000
					call DELAY
					inc di
					jmp cicloEnv16

				unomas16:
					mov al, 'k'
					call ESCRIBIR_EN_PUERTO
					mov ax, 1000
					call DELAY
				jmp finArduino

		sendArduino17:
			ExisteFuncion fun17
			cmp modo, 3
			jne seguirAr17
			
			ComprobarGrado2 fun17

			seguirAr17:
				print msg4
				print fun17
				print saltoLinea
				xor di, di
				cicloEnv17:
					mov al, fun17[di]
					cmp al, "$"
					je unomas17
					call ESCRIBIR_EN_PUERTO
					mov ax, 1000
					call DELAY
					inc di
					jmp cicloEnv17

				unomas17:
					mov al, 'k'
					call ESCRIBIR_EN_PUERTO
					mov ax, 1000
					call DELAY
				jmp finArduino

		sendArduino18:
			ExisteFuncion fun18
			cmp modo, 3
			jne seguirAr18
			
			ComprobarGrado2 fun18

			seguirAr18:
				print msg4
				print fun18
				print saltoLinea
				xor di, di
				cicloEnv18:
					mov al, fun1[di]
					cmp al, "$"
					je unomas18
					call ESCRIBIR_EN_PUERTO
					mov ax, 1000
					call DELAY
					inc di
					jmp cicloEnv18

				unomas18:
					mov al, 'k'
					call ESCRIBIR_EN_PUERTO
					mov ax, 1000
					call DELAY
				jmp finArduino

		sendArduino19:
			ExisteFuncion fun19
			cmp modo, 3
			jne seguirAr19
			
			ComprobarGrado2 fun19

			seguirAr19:
				print msg4
				print fun19
				print saltoLinea
				xor di, di
				cicloEnv19:
					mov al, fun19[di]
					cmp al, "$"
					je unomas19
					call ESCRIBIR_EN_PUERTO
					mov ax, 1000
					call DELAY
					inc di
					jmp cicloEnv19

				unomas19:
					mov al, 'k'
					call ESCRIBIR_EN_PUERTO
					mov ax, 1000
					call DELAY
				jmp finArduino

		sendArduino20:
			ExisteFuncion fun20
			cmp modo, 3
			jne seguirAr20
			
			ComprobarGrado2 fun20

			seguirAr20:
				print msg4
				print fun20
				print saltoLinea
				xor di, di
				cicloEnv20:
					mov al, fun20[di]
					cmp al, "$"
					je unomas20
					call ESCRIBIR_EN_PUERTO
					mov ax, 1000
					call DELAY
					inc di
					jmp cicloEnv20

				unomas20:
					mov al, 'k'
					call ESCRIBIR_EN_PUERTO
					mov ax, 1000
					call DELAY
				jmp finArduino
				

			
		
		finArduino:
			LimpiarVariable general, 50

	ret
	ENVIAR_ARDUINO endp

	getChar macro
        mov ah,01h
        int 21h
    endm

	crearNumero macro n
		LOCAL _solox,_unNumero,_dosNumero,_terminarvalor1,_nada,_seguir,_signo,_signo2
		mov n,0
        mov tienesigno,0
        _seguir:
		    getChar
            cmp al,'-'
		    je _signo
            cmp al,'+'
		    je _signo2
		    cmp al,'x'
		    je _solox
            cmp al,0dh
		    je _nada
		    mov bl,al
		    getChar
		    cmp al,'x'
		    je _unNumero
            cmp al,0dh
            je _unNumero
		    mov bh,al
		    getChar
		    cmp al,'x'
		    je _dosNumero
            cmp al,0dh
		    je _dosNumero
        _signo:
            mov tienesigno,1
            jmp _seguir
        _signo2:
            jmp _seguir
        _nada:
            mov dl,al
			jmp _terminarvalor1
		_solox:
            mov dl,al
			mov n,1
			jmp _terminarvalor1
		_unNumero:
            mov dl,al
			sub bl,'0'
			mov al,1
			mul bl
			mov n,ax
			jmp _terminarvalor1
		_dosNumero:
            mov dl,al
			sub bl,'0'
			mov al,10
			mul bl
			mov n,ax
			mov bl,bh
			sub bl,'0'
			mov al,1
			mul bl
			add n,ax
		_terminarvalor1:
            convertirnegativo n
	endm

    convertirnegativo macro n
        LOCAL _final
        cmp tienesigno,0
        je _final
        mov ax,n
        mov bl,-1
        imul bl
        mov n,ax
        _final:
    endm

    imprimirNumero macro num
        LOCAL _menor,_print
        mov ax,num
        cmp num,0
        jl _menor
        jb _menor
        jmp _print
        _menor:
            mov bx,ax
            mov ah,2
            mov dl,'-'
            int 21h
            mov ax,-1
            mul bx
        _print:
            AAM
            mov bx,ax
            mov ah,02h
            mov dl,bh
            add dl,30h
            int 21h
            mov ah,02h
            mov dl,bl
            add dl,30h
            int 21h
	endm
; metodos modo video
    empezarModoVideo macro
        mov ax,0013h
        int 10h
    endm

    terminarModoVideo macro
        mov ah,10h
        int 16h
        mov ax,0003h
        int 10h
    endm

    imprimirPixel macro columna,fila,color
        mov al, color
	    mov cx, columna
	    mov dx, fila
	    mov ah, 0ch
        int 10h
    endm

    imprimirpunto macro x,y
        mov cx,x
        add cx,160
        mov ax,100
        sub ax,y
	    mov dx,ax
        mov al, 1111b
	    mov ah, 0ch
        int 10h
    endm

    pintarCruz macro
        xor si,si
        iniciocolumna:
            imprimirPixel 160,si,0010b
            inc si
            cmp si,200
            je finalcolumna
            jmp iniciocolumna
        finalcolumna:
            xor si,si
        iniciofila:
            imprimirPixel si,100,0010b
            inc si
            cmp si,320
            je finalfila
            jmp iniciofila
        finalfila:
        imprimirPixel 160,100,0001b
    endm

    crearNumeroG macro n,cadena
		LOCAL _solox,_unNumero,_dosNumero,_terminarvalor1,_nada,_seguir,_signo,_signo2
		mov n,0
        mov tienesigno,0
        _seguir:
		    mov al,cadena[si]
            inc si
            cmp al,'-'
		    je _signo
            cmp al,'+'
		    je _signo2
		    cmp al,'x'
		    je _solox
            cmp al,'$'
		    je _nada
		    mov bl,al
		    mov al,cadena[si]
            inc si
		    cmp al,'x'
		    je _unNumero
            cmp al,'$'
            je _unNumero
		    mov bh,al
		    mov al,cadena[si]
            inc si
		    cmp al,'x'
		    je _dosNumero
            cmp al,'$'
		    je _dosNumero
        _signo:
            mov tienesigno,1
            jmp _seguir
        _signo2:
            jmp _seguir
        _nada:
            mov dl,al
			jmp _terminarvalor1
		_solox:
            mov dl,al
			mov n,1
			jmp _terminarvalor1
		_unNumero:
            mov dl,al
			sub bl,'0'
			mov al,1
			mul bl
			mov n,ax
			jmp _terminarvalor1
		_dosNumero:
            mov dl,al
			sub bl,'0'
			mov al,10
			mul bl
			mov n,ax
			mov bl,bh
			sub bl,'0'
			mov al,1
			mul bl
			add n,ax
		_terminarvalor1:
            convertirnegativo n
	endm

    cargarNumeros macro cadena
        LOCAL _tienex,_esn5,_final,_esn4,_esn3,_esn2,_esn1,_inicio
        xor si,si
        _inicio:
        mov auxnumero,0
        crearNumeroG auxnumero,cadena
        cmp dl,'x'
        je _tienex
        cmp dl,'$'
        je _esn5
        _tienex:
            mov al,cadena[si]
            cmp al,'^'
            jne _esn4
            inc si
            mov al,cadena[si]
            cmp al,'2'
            je _esn3
            cmp al,'3'
            je _esn2
            cmp al,'4'
            je _esn1
            jmp _esn5
        _esn1:
            inc si
            mov ax,auxnumero
            mov n1,ax
            jmp _inicio
        _esn2:
            inc si
            mov ax,auxnumero
            mov n2,ax
            jmp _inicio
        _esn3:
            inc si
            mov ax,auxnumero
            mov n3,ax
            jmp _inicio
        _esn4:
            mov ax,auxnumero
            mov n4,ax
            jmp _inicio
        _esn5:
            mov ax,auxnumero
            mov n5,ax
        _final:
    endm

    potencia macro numero,pot
        LOCAL _inicio
        mov cx,pot
        dec cx
        mov ax,numero
        _inicio:
            mov bx,numero
            imul bx
        loop _inicio
    endm

    ejecutarnumero macro num
        potencia num,potencia4
        mov bx,n1
        imul bx
        mov auxnumero,ax
        potencia num,potencia3
        mov bx,n2
        imul bx
        add auxnumero,ax
        potencia num,potencia2
        mov bx,n3
        imul bx
        add auxnumero,ax
        mov ax,num
        mov bx,n4
        imul bx
        add auxnumero,ax
        mov ax,n5
        add auxnumero,ax
    endm

    ejecutargrafica macro
        LOCAL _empezar,_final,_empezarantes,_usala1,_usala2,_usala3,_usala4,_usala5,_usala6,_usala7,_usala8,_usala9,_usala10,_usala11,_usala12,_usala13,_usala14,_usala15,_usala16,_usala17,_usala18,_usala19,_usala20
		cmp ecuacionagraficar,1
		je _usala1
		cmp ecuacionagraficar,2
		je _usala2
		cmp ecuacionagraficar,3
		je _usala3
		cmp ecuacionagraficar,4
		je _usala4
		cmp ecuacionagraficar,5
		je _usala5
		cmp ecuacionagraficar,6
		je _usala6
		cmp ecuacionagraficar,7
		je _usala7
		cmp ecuacionagraficar,8
		je _usala8
		cmp ecuacionagraficar,9
		je _usala9
		cmp ecuacionagraficar,10
		je _usala10
		cmp ecuacionagraficar,11
		je _usala11
		cmp ecuacionagraficar,11
		je _usala12
		cmp ecuacionagraficar,13
		je _usala13
		cmp ecuacionagraficar,14
		je _usala14
		cmp ecuacionagraficar,15
		je _usala15 
		cmp ecuacionagraficar,16
		je _usala16 
		cmp ecuacionagraficar,17
		je _usala17 
		cmp ecuacionagraficar,18
		je _usala18 
		cmp ecuacionagraficar,19
		je _usala19 
		cmp ecuacionagraficar,20
		je _usala20 
		_usala1:
        cargarNumeros fun1
		AsignarValor fun1,funcion
		jmp _empezarantes
		_usala2:
        cargarNumeros fun2
		AsignarValor fun2,funcion
		jmp _empezarantes
		_usala3:
        cargarNumeros fun3
		AsignarValor fun3,funcion
		jmp _empezarantes
		_usala4:
        cargarNumeros fun4
		AsignarValor fun4,funcion
		jmp _empezarantes
		_usala5:
        cargarNumeros fun5
		AsignarValor fun5,funcion
		jmp _empezarantes
		_usala6:
        cargarNumeros fun6
		AsignarValor fun6,funcion
		jmp _empezarantes
		_usala7:
        cargarNumeros fun7
		AsignarValor fun7,funcion
		jmp _empezarantes
		_usala8:
        cargarNumeros fun8
		AsignarValor fun8,funcion
		jmp _empezarantes
		_usala9:
        cargarNumeros fun9
		AsignarValor fun9,funcion
		jmp _empezarantes
		_usala10:
        cargarNumeros fun10
		AsignarValor fun10,funcion
		jmp _empezarantes
		_usala11:
        cargarNumeros fun11
		AsignarValor fun11,funcion
		jmp _empezarantes
		_usala12:
        cargarNumeros fun12
		AsignarValor fun12,funcion
		jmp _empezarantes
		_usala13:
        cargarNumeros fun13
		AsignarValor fun13,funcion
		jmp _empezarantes
		_usala14:
        cargarNumeros fun14
		AsignarValor fun14,funcion
		jmp _empezarantes
		_usala15:
        cargarNumeros fun15
		AsignarValor fun15,funcion
		jmp _empezarantes
		_usala16:
        cargarNumeros fun16
		AsignarValor fun16,funcion
		jmp _empezarantes
		_usala17:
        cargarNumeros fun17
		AsignarValor fun17,funcion
		jmp _empezarantes
		_usala18:
        cargarNumeros fun18
		AsignarValor fun18,funcion
		jmp _empezarantes
		_usala19:
        cargarNumeros fun19
		AsignarValor fun19,funcion
		jmp _empezarantes
		_usala20:
        cargarNumeros fun20
		AsignarValor fun20,funcion
		jmp _empezarantes
		_empezarantes:
		mov si,iniciografica
        _empezar:
            mov punto,si
            ejecutarnumero punto

            imprimirpunto punto,auxnumero
            inc si
            cmp si,fingrafica
            je _final
            jmp _empezar
        _final:
            print funcion
			LimpiarVariable funcion,50
    endm
    
    GRAFICARFUNCION proc
        push ax
        push cx
        push bx
        push dx
        xor ax,ax
        xor bx,bx
        xor cx,cx
        mov auxnumero,0
        mov n1,0
        mov n2,0
        mov n3,0
        mov n4,0
        mov n5,0
        mov iniciografica,-10
        mov fingrafica,11
		print peticionid
		print salto
		crearNumero ecuacionagraficar
		print salto
        print peticion
        getChar
        print salto
        cmp al,'n'
        je _hacer
        print imprimiriniciografica
        crearNumero iniciografica
        print salto
        print imprimirfingrafica
        crearNumero fingrafica
        add fingrafica,1
        print salto
        _hacer:
        empezarModoVideo
        pintarCruz
        ejecutargrafica
        terminarModoVideo
        pop dx
        pop bx
        pop cx
        pop ax
        ret
    GRAFICARFUNCION endp

; metodos Soluciones
    raizCuadrada macro
        LOCAL _calcular,_menor,_salirMayor,_igual
        xor cx,cx
        _calcular:
            mul cx
            mov ax,cx
            cmp ax,bx
            ja _salirMayor
            jb _menor
            je _igual
        _menor:
            inc cx
            mov ax,cx
            mul cx
            cmp ax,bx
            ja _salirMayor
            jb _menor
            je _igual
        _salirMayor:
            dec cx
            jmp _igual
        _igual:
    endm

    getSolucionx1 macro
        LOCAL _menor1,_menor2,_resultado,_resultado2,_final,_nocolocarMenor,_colocarMenor_,_error
        xor bx,bx
        xor cx,cx
        xor dx,dx
        ;4acx
        mov bx,4
        mov ax,n1
        imul bx
        mov bx,n3
        imul bx
        mov cx,ax
        ;b^2
        mov ax,n2
        mov bx,n2
        imul bx
        ;b^2-4acx
        sub ax,cx
        ;sqtr(b^2-4acx)
        mov bx,ax
        cmp bx,0
        jl _error
        raizCuadrada
        ;-b
        mov ax,-1
        mov bx,n2
        imul bx
        ;-b+sqtr(b^2-4acx)
        add ax,cx
        mov cx,ax
        ;2a
        mov ax,2
        mov bx,n1
        imul bx
        cmp ax,0
        je _error
        ;-b-sqtr(b^2-4acx)/2a
            xor si,si
            cmp cx,0
            jl _menor1
            cmp ax,0
            jl _menor2
            jmp _resultado
        _menor1:
            inc si
            push ax
            mov ax,cx
            mov bx,-1
            imul bx
            mov cx,ax
            pop ax
            cmp ax,0
            jl _menor2
            jmp _resultado2
        _menor2:
            inc si
            mov bx,-1
            imul bx
            jmp _resultado2
        _resultado:
            mov bx,ax
            mov ax,cx
            idiv bx
            mov auxnumero,ax
            print salto
            print imprimirsolucionX1
            imprimirNumero auxnumero
            print salto
            jmp _final
        _resultado2:
            mov bx,ax
            mov ax,cx
            idiv bx
            mov auxnumero,ax
            print salto
            print imprimirsolucionX1
            cmp si,1
            je _colocarMenor
            cmp si,2
            je _nocolocarMenor
        _colocarMenor:
            mov ah,2
            mov dl,'-'
            int 21h
        _nocolocarMenor:
            imprimirNumero auxnumero
            print salto
            jmp _final
        _error:
            print errorSolucion
            print salto
        _final:
    endm

    getSolucionx2 macro
        LOCAL _menor1,_menor2,_resultado,_resultado2,_final,_nocolocarMenor,_colocarMenor,_error
        xor ax,ax
        xor bx,bx
        xor cx,cx
        xor dx,dx
        ;4acx
        mov bx,4
        mov ax,n1
        imul bx
        mov bx,n3
        imul bx
        mov cx,ax
        ;b^2
        mov ax,n2
        mov bx,n2
        imul bx
        ;b^2-4acx
        sub ax,cx
        ;sqtr(b^2-4acx)
        mov bx,ax
        cmp bx,0
        jl _error
        raizCuadrada
        ;-b
        mov ax,-1
        mov bx,n2
        imul bx
        ;-b-sqtr(b^2-4acx)
        sub ax,cx
        mov cx,ax
        ;2a
        mov ax,2
        mov bx,n1
        imul bx
        cmp ax,0
        je _error
        ;-b-sqtr(b^2-4acx)/2a
            xor si,si
            cmp cx,0
            jl _menor1
            cmp ax,0
            jl _menor2
            jmp _resultado
        _menor1:
            inc si
            push ax
            mov ax,cx
            mov bx,-1
            imul bx
            mov cx,ax
            pop ax
            cmp ax,0
            jl _menor2
            jmp _resultado2
        _menor2:
            inc si
            mov bx,-1
            imul bx
            jmp _resultado2
        _resultado:
            mov bx,ax
            mov ax,cx
            idiv bx
            mov auxnumero,ax
            print salto
            print imprimirsolucionX2
            imprimirNumero auxnumero
            print salto
            jmp _final
        _resultado2:
            mov bx,ax
            mov ax,cx
            idiv bx
            mov auxnumero,ax
            print salto
            print imprimirsolucionX2
            cmp si,1
            je _colocarMenor
            cmp si,2
            je _nocolocarMenor
        _colocarMenor:
            mov ah,2
            mov dl,'-'
            int 21h
        _nocolocarMenor:
            imprimirNumero auxnumero
            print salto
            jmp _final
        _error:
            print errorSolucion
            print salto
        _final:
    endm

    SOLUCIONES proc 
        push ax
        push cx
        push bx
        push dx
        xor ax,ax
        xor bx,bx
        xor cx,cx
        mov auxnumero,0
        mov n1,0
        mov n2,0
        mov n3,0
        print ingreselaFuncion
        print salto
        crearNumero n1
        getChar
        getChar
        crearNumero n2
        crearNumero n3
        getSolucionx1
        getSolucionx2
        pop dx
        pop bx
        pop cx
        pop ax
		ret
    SOLUCIONES endp


	main proc far 
		push ds
		mov si, 0
		push si
		mov ax, sdatos
		mov ds,ax
		mov es,ax 
        
		Menu:
			mov retorno, 0
			print saltoLinea
			print msg1
			print separa
			print opc1
			print opc2
			print opc3
			print opc4
			print opc5
			print opc6
			print opc7
			print opc8
			print saltoLinea
			print msg2

			LecturaTec info, 50
			cmp info, "1"
			je Derivar

			cmp info, "2"
			je Integrar

			cmp info, "3"
			je Ingresar

			cmp info, "4"
			je Imprimir

			cmp info, "5"
			je Graficar

			cmp info, "6"
			je Resolver

			cmp info, "7"
			je Enviar

			cmp info, "8"
			je Salir

			jmp error1

			Derivar:
				mov modo, 1
				call DERIVAR_INTEGRAR_RESOLVER
				mov modo, 0
				jmp Menu
			Integrar:
				mov modo, 2
				call DERIVAR_INTEGRAR_RESOLVER
				mov modo, 0
				jmp Menu

			Ingresar:
				print saltoLinea
				print opc3_1
				print opc3_2
				print opc3_3
				print saltoLinea
				print msg2
				
				LecturaTec info, 50

				cmp info, "a"
				je OpcA

				cmp info, "b"
				je OpcB

				cmp info, "c"
				je OpcC

				jmp error2
				
				OpcA:
					mov retorno, 1
					print msg8
					LecturaTec info, 50
					VerificarDatos info
					call POSICION_ENTRADA
					jmp Ingresar
				OpcB:
					mov retorno, 2
					mov modo, 1
					print msg9
					LimpiarVariable ruta, 20
					LecturaTec ruta, 20

					LimpiarVariable textoArchivo, 2222
					abrirArchivo ruta
						mov ah, 3Fh
						mov bx, handle
						mov cx, 2222
						mov dx, offset textoArchivo
						int 21h
					cerrarArchivo handle

					xor bx, bx
					xor si, si
					ObtenerUnaFuncion:
						mov al, textoArchivo[si]
						cmp al, "$"
						je SalirObtenerUnaFuncion
						cmp al, ";"
						je UnaFuncion

						cmp al, 10d
						je Omitir
						cmp al, 13d
						je Omitir

						mov info[bx], al
						inc si
						inc bx
						jmp ObtenerUnaFuncion

						Omitir:
							inc si
							jmp ObtenerUnaFuncion

						UnaFuncion:
							VerificarDatos info
							call POSICION_ENTRADA
							LimpiarVariable info, 50
							inc si
							xor bx, bx
							jmp ObtenerUnaFuncion

					SalirObtenerUnaFuncion:
					jmp Ingresar
				
				OpcC:
					jmp Menu

				jmp Menu

				
			Imprimir:
				call MOSTRAR_FUNCION
				LecturaTec info, 50
				jmp Menu
		
			Graficar:
				call GRAFICARFUNCION
				jmp Menu
		
			Resolver:
				call SOLUCIONES
				jmp Menu
		
			Enviar:
				print opc7
				;CONECTANDO CON VIRTUAL SERIAL PORT
				;call ENVIAR_ARD
				
				call ENVIAR_ARDUINO
				
				jmp Menu

			;Lista de Errores
			error1:
				print err1
				jmp Menu

			error2:
				print err2
				jmp Ingresar 
			
			error3:
				print err3
				jmp Menu

			error4:
				print err4
				cmp retorno, 1
				je Ingresar
				;Para que no regrese y sigue leyendo el archivo
				inc si
				xor bx, bx
				cmp retorno, 2		
				je ObtenerUnaFuncion
				jmp menu

			error5:
				print err5
				jmp Ingresar

			error6:
				print err6
				jmp Menu

			error7:
				print err7
				jmp Menu
			
			error8:
				print err8
				jmp Menu
			error9:
				print err9
				pop ax
				pop bx
				jmp Menu
		Salir:

		ret
    main endp	
scodigo ends
end main
    