!classDefinition: #TDDBabyStepsGame category: 'TDDBabyStepsGame'!
Object subclass: #TDDBabyStepsGame
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDBabyStepsGame'!

!TDDBabyStepsGame methodsFor: 'building' stamp: 'NR 5/3/2022 08:29:29'!
build
	
	^ TDDBabyStepsGameView for: self buildGame.! !

!TDDBabyStepsGame methodsFor: 'building' stamp: 'NR 5/3/2022 08:29:42'!
buildGame
	
	^ TDDBabyStepsGameBase startNamed: self name withCases: self cases withExtraCase:self extraCase inCategory: 'TDDBabyStepsGame', self name capitalized withDefinition: self definition.
	! !

!TDDBabyStepsGame methodsFor: 'building' stamp: 'NR 5/3/2022 08:48:24'!
createGameContext
	
	"Compiler evaluate: self createTestCaseDefinition"! !

!TDDBabyStepsGame methodsFor: 'building' stamp: 'NR 5/3/2022 08:30:14'!
createTestCaseDefinition

	^ 'TestCase subclass: #{1}
	instanceVariableNames: ''''
	classVariableNames: ''''
	poolDictionaries: ''''
	category: ''{2}''' format: {self name. game testCaseCategory }! !

!TDDBabyStepsGame methodsFor: 'building' stamp: 'NR 5/3/2022 08:47:16'!
start
	
	game := self build.
	self createGameContext. 
	^ game start! !


!TDDBabyStepsGame methodsFor: 'private - cases' stamp: 'NR 5/3/2022 08:32:10'!
cases

	self subclassResponsibility ! !

!TDDBabyStepsGame methodsFor: 'private - cases' stamp: 'NR 5/3/2022 08:32:43'!
extraCase
	
	self subclassResponsibility ! !


!TDDBabyStepsGame methodsFor: 'private' stamp: 'NR 5/3/2022 08:34:42'!
definition
	
	self subclassResponsibility ! !

!TDDBabyStepsGame methodsFor: 'private' stamp: 'NR 5/3/2022 08:32:39'!
name
	
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TDDBabyStepsGame class' category: 'TDDBabyStepsGame'!
TDDBabyStepsGame class
	instanceVariableNames: ''!

!TDDBabyStepsGame class methodsFor: 'instance creation' stamp: 'NR 5/3/2022 08:46:01'!
start
	
	^ self new start! !


!classDefinition: #TDDBabyStepsGameAnagrams category: 'TDDBabyStepsGame'!
TDDBabyStepsGame subclass: #TDDBabyStepsGameAnagrams
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDBabyStepsGame'!
!TDDBabyStepsGameAnagrams commentStamp: '<historical>' prior: 0!
| game |
game  := TDDBabyStepsGameCuentaBancaria start.
game openHelp.
game openDefinition.
game next.!


!TDDBabyStepsGameAnagrams methodsFor: 'private' stamp: 'NR 5/8/2022 14:59:41'!
definition
	
	^ 'Debe obtenerse todos los anagramas de una palabra (string). Por ej. todos los potenciales anagramas de "kata" son:
	
	''ktaa'' ''atka'' ''akat'' ''atak'' ''akta'' ''taka'' ''kata'' ''aatk'' ''tkaa'' ''aakt'' ''kaat'' ''taak''

	'! !

!TDDBabyStepsGameAnagrams methodsFor: 'private' stamp: 'NR 5/4/2022 07:48:12'!
name 
	
	^ 'Anagrams'! !


!TDDBabyStepsGameAnagrams methodsFor: 'private - cases' stamp: 'NR 5/8/2022 15:25:00'!
case01
	
	^ 'test01EmptyStringAnagramIsJustACollectionWithTheEmptyString

	self assert: (Set with: '''') equals: '''' anagrams
	'! !

!TDDBabyStepsGameAnagrams methodsFor: 'private - cases' stamp: 'NR 5/4/2022 16:59:07'!
case02

	^ 'test02OneCharStringAnagramReturnsACollectionWithTheSameOneCharString

	self assert: (Set with:''a'') equals: ''a'' anagrams
	'
	! !

!TDDBabyStepsGameAnagrams methodsFor: 'private - cases' stamp: 'NR 5/4/2022 16:59:18'!
case03
	
	^ 'test03TwoCharStringAnagramReturnsTheOriginalStringAndAnotherOneFlipped

	self assert: (Set with:''ab'' with: ''ba'') equals: ''ab'' anagrams
	'! !

!TDDBabyStepsGameAnagrams methodsFor: 'private - cases' stamp: 'NR 5/4/2022 16:59:42'!
case04
	
	^ 'test04ThreeCharStringAnagramReturnsAllThe6PossibleOrderCombinations

	| anagrams |
	
	anagrams := Set new.
	anagrams add: ''abc''.
	anagrams add: ''acb''.
	anagrams add: ''bac''.
	anagrams add: ''bca''.
	anagrams add: ''cab''.
	anagrams add: ''cba''.

	self assert: anagrams equals: ''abc'' anagrams
	'! !

!TDDBabyStepsGameAnagrams methodsFor: 'private - cases' stamp: 'NR 5/4/2022 17:00:10'!
case05
	
	^ 'test05MoreThanThreeCharStringAnagramReturnsAllTheCorrectPossibleOrderCombinations

	| anagrams |
	
	anagrams := Set new.
	anagrams add: ''abcd''; add: ''abdc''; add: ''acbd''; add: ''acdb''; add: ''adbc''; add: ''adcb''; add: ''bacd''; add: ''badc''; add: ''bcad''; add: ''bcda''; add: ''bdac''; add: ''bdca''; add: ''cabd''; add: ''cadb''; add: ''cbad''; add: ''cbda''; add: ''cdab''; add: ''cdba''; add: ''dabc''; add: ''dacb''; add: ''dbac''; add: ''dbca''; add: ''dcab''; add: ''dcba''.

	self assert: anagrams equals: ''abcd'' anagrams
	'! !

!TDDBabyStepsGameAnagrams methodsFor: 'private - cases' stamp: 'NR 5/4/2022 06:25:37'!
cases
	
	^ {self case01. self case02. self case03. self case04. self case05. }! !

!TDDBabyStepsGameAnagrams methodsFor: 'private - cases' stamp: 'NR 5/4/2022 16:58:23'!
extraCase
	
	^ 'testExtraToCheckGeneralizationOnKata

	self assert: 40320 equals:`''abcdefgh'' anagrams` size.
	
	self assert: (`''abcdefgh'' anagrams`) includes: ''cghdbeaf''.
	
	self assert: 10080 equals: `''abcdefab'' anagrams` size
	'! !


!classDefinition: #TDDBabyStepsGameContador category: 'TDDBabyStepsGame'!
TDDBabyStepsGame subclass: #TDDBabyStepsGameContador
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDBabyStepsGame'!
!TDDBabyStepsGameContador commentStamp: '<historical>' prior: 0!
| game |
game  := TDDBabyStepsGameContador start.
game openHelp.
game openDefinition.
game next.!


!TDDBabyStepsGameContador methodsFor: 'private' stamp: 'NR 5/3/2022 08:40:17'!
definition
	
	^ ' Implementar un contador que recibe el mensaje incrementar para incrementar en 1 su valor.
	El contador debe comenzar en 0.
	El contador tambien sabe responder el mensaje value para obtener su valor.
'! !

!TDDBabyStepsGameContador methodsFor: 'private' stamp: 'FL 11/9/2021 20:23:07'!
name 
	^ 'Contador'! !


!TDDBabyStepsGameContador methodsFor: 'private - cases' stamp: 'FL 11/9/2021 20:55:37'!
case01
	^ 'test01UnNuevoContadorEmpiezaConValorCero

	| contador |
	contador := Contador new.
	self assert: 0 equals: contador valor.
	'! !

!TDDBabyStepsGameContador methodsFor: 'private - cases' stamp: 'FL 11/9/2021 20:56:57'!
case02
	^ 'test02AlIncrementarUnaVezElContadorSuValorSubeUno

	| contador |
	contador := Contador new.
	contador incrementar.
	self assert: 1 equals: contador valor.
	' ! !

!TDDBabyStepsGameContador methodsFor: 'private - cases' stamp: 'FL 11/9/2021 20:59:28'!
case03
	^ 'test03SePuedeIncrementarVariasVecesElContadorYSuValorIncrementaEnUnoEsaCantidadDeVeces

	| contador |
	contador := Contador new.
	contador incrementar.
	contador incrementar.
	contador incrementar.
	self assert: 3 equals: contador valor.
	'! !

!TDDBabyStepsGameContador methodsFor: 'private - cases' stamp: 'FL 11/9/2021 20:22:50'!
cases
	^ {self case01. self case02. self case03. }! !

!TDDBabyStepsGameContador methodsFor: 'private - cases' stamp: 'NR 5/2/2022 02:08:55'!
extraCase
	
	^ 'extraTest
	
	self assert: true.
	' ! !


!classDefinition: #TDDBabyStepsGameCuentaBancaria category: 'TDDBabyStepsGame'!
TDDBabyStepsGame subclass: #TDDBabyStepsGameCuentaBancaria
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDBabyStepsGame'!
!TDDBabyStepsGameCuentaBancaria commentStamp: '<historical>' prior: 0!
| game |
game  := TDDBabyStepsGameCuentaBancaria start.
game openHelp.
game openDefinition.
game next.!


!TDDBabyStepsGameCuentaBancaria methodsFor: 'private' stamp: 'FL 11/15/2021 18:31:13'!
definition
	^ 'Uno de nuestros clientes nos pide crear un modelo de una cuenta bancaria, de modo que nos permita las siguientes operaciones:
		- Realizar uno o mas depositos en pesos.
		- Realizar una o mas extracciones en pesos.
		- Otro punto importante, es que si la cuenta tiene un saldo menor al monto que se desea extraer,
		  debe levantarse un error indicando: "La cuenta no puede quedar en descubierto"
	'! !

!TDDBabyStepsGameCuentaBancaria methodsFor: 'private' stamp: 'FL 11/12/2021 16:13:07'!
name 
	^ 'CuentaBancariaEnPesos'! !


!TDDBabyStepsGameCuentaBancaria methodsFor: 'private - cases' stamp: 'FL 11/12/2021 16:09:58'!
case01
	^ 'test01UnaNuevaCuentaComienzaConSaldoCero
	
	self assert: 0 * peso equals: CuentaBancariaEnPesos new saldo.
	'! !

!TDDBabyStepsGameCuentaBancaria methodsFor: 'private - cases' stamp: 'FL 11/12/2021 16:10:18'!
case02
	^ 'test02AlHacerUnDepositoSeIncrementaElSaldoConElMontoDepositado
	
	| cuentaBancaria |
	cuentaBancaria := CuentaBancariaEnPesos new.
	cuentaBancaria depositar: 10 * peso.
 	self assert: 10 * peso equals: cuentaBancaria saldo.
	' ! !

!TDDBabyStepsGameCuentaBancaria methodsFor: 'private - cases' stamp: 'FL 11/12/2021 16:10:30'!
case03
	^ 'test03AlHacerVariosDepositosSeIncrementaElSaldoConElTotalDepositado
	
	| cuentaBancaria |
	cuentaBancaria := CuentaBancariaEnPesos new.
	cuentaBancaria depositar: 10 * peso.
	cuentaBancaria depositar: 20 * peso.
 	self assert: 30 * peso equals: cuentaBancaria saldo.
	'! !

!TDDBabyStepsGameCuentaBancaria methodsFor: 'private - cases' stamp: 'FL 11/12/2021 16:10:55'!
case04
	^ 'test04AlExtrerDisminuyeElSaldoSegunElMontoExtraido
	
	| cuentaBancaria |
	cuentaBancaria := CuentaBancariaEnPesos new.
	cuentaBancaria depositar: 30 * peso.
	cuentaBancaria extraer: 20 * peso.
 	self assert: 10 * peso equals: cuentaBancaria saldo.
	'! !

!TDDBabyStepsGameCuentaBancaria methodsFor: 'private - cases' stamp: 'FL 11/12/2021 16:11:57'!
case05
	^ 'test05AlExtraerLaCuentaNoPuedeQuedarEnDescubierto
	
	| cuentaBancaria |
	cuentaBancaria := CuentaBancariaEnPesos new.
	cuentaBancaria depositar: 30 * peso.
	cuentaBancaria extraer: 20 * peso.
	self should: [cuentaBancaria extraer: 11 * peso.] 
		raise: Error  
		withExceptionDo: [:anException | 
			self assert: ''La cuenta no puede quedar en descubierto'' equals: anException messageText. 
			self assert: 10 * peso equals: cuentaBancaria saldo.
		].
	'! !

!TDDBabyStepsGameCuentaBancaria methodsFor: 'private - cases' stamp: 'FL 11/12/2021 16:12:20'!
cases
	^ {self case01. self case02. self case03. self case04. self case05. }! !

!TDDBabyStepsGameCuentaBancaria methodsFor: 'private - cases' stamp: 'NR 5/2/2022 02:11:08'!
extraCase
	
	^ 'extraTest
	
	self assert: true.
	'! !


!classDefinition: #TDDBabyStepsGameDemo category: 'TDDBabyStepsGame'!
TDDBabyStepsGame subclass: #TDDBabyStepsGameDemo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDBabyStepsGame'!
!TDDBabyStepsGameDemo commentStamp: '<historical>' prior: 0!
| game |
game  := TDDBabyStepsGameDemo start.
game openHelp.
game openDefinition.
game next.!


!TDDBabyStepsGameDemo methodsFor: 'private' stamp: 'NR 5/1/2022 04:27:11'!
definition
	
	^ 'Definicion de demostracion.'! !

!TDDBabyStepsGameDemo methodsFor: 'private' stamp: 'NR 5/2/2022 02:07:42'!
name 
	
	^ 'Demo'! !


!TDDBabyStepsGameDemo methodsFor: 'private - cases' stamp: 'NR 5/2/2022 02:07:11'!
case01
	
	^ 'test01
	
	self assert: false.
	'! !

!TDDBabyStepsGameDemo methodsFor: 'private - cases' stamp: 'NR 5/2/2022 02:07:18'!
case02
	
	^ 'test02
	
	self assert: false.
	' ! !

!TDDBabyStepsGameDemo methodsFor: 'private - cases' stamp: 'NR 5/2/2022 02:07:21'!
case03
	
	^ 'test03
	
	self assert: false.
	'! !

!TDDBabyStepsGameDemo methodsFor: 'private - cases' stamp: 'NR 5/2/2022 02:07:24'!
case04
	
	^ 'test04
	
	self assert: false.
	'! !

!TDDBabyStepsGameDemo methodsFor: 'private - cases' stamp: 'NR 5/1/2022 04:27:33'!
cases
	
	^ {self case01. self case02. self case03. self case04. }! !

!TDDBabyStepsGameDemo methodsFor: 'private - cases' stamp: 'NR 5/2/2022 02:11:02'!
extraCase
	
	^ 'testExtra
	
	self assert: true.
	'! !


!classDefinition: #TDDBabyStepsGamePrimeFactors category: 'TDDBabyStepsGame'!
TDDBabyStepsGame subclass: #TDDBabyStepsGamePrimeFactors
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDBabyStepsGame'!
!TDDBabyStepsGamePrimeFactors commentStamp: '<historical>' prior: 0!
| game |
game  := TDDBabyStepsGameCuentaBancaria start.
game openHelp.
game openDefinition.
game next.!


!TDDBabyStepsGamePrimeFactors methodsFor: 'private' stamp: 'NR 5/2/2022 02:05:49'!
definition
	
	^ 'Deben obtenerse los factores primos de un número natural. Por ej. 850 factorize debe retornar 2,5,5 y 17.
	'! !

!TDDBabyStepsGamePrimeFactors methodsFor: 'private' stamp: 'NR 5/2/2022 02:05:56'!
name 
	
	^ 'PrimeFactors'! !


!TDDBabyStepsGamePrimeFactors methodsFor: 'private - cases' stamp: 'NR 5/4/2022 07:15:28'!
case01
	
	^ 'test01OneHasNoPrimeFactors
	
	self assert: Bag new equals: 1 factorize
	'! !

!TDDBabyStepsGamePrimeFactors methodsFor: 'private - cases' stamp: 'NR 5/8/2022 16:43:51'!
case02

	^ 'test02FactorsOfAPrimeNumberAreThePrimeNumber

	self assert: (Bag with: 2) equals: 2 factorize
	'
	! !

!TDDBabyStepsGamePrimeFactors methodsFor: 'private - cases' stamp: 'NR 5/8/2022 16:44:00'!
case03
	
	^ 'test03FactorsOfAPrimeNumberAreThePrimeNumber

	self assert: (Bag with: 3) equals: 3 factorize
	'! !

!TDDBabyStepsGamePrimeFactors methodsFor: 'private - cases' stamp: 'NR 5/4/2022 07:26:12'!
case04
	
	^ 'test04CorrectlyFactorizesACompositeNumberWithTwoFactors2
	
	self assert: (Bag with: 2 with: 2) equals: 4 factorize
	'! !

!TDDBabyStepsGamePrimeFactors methodsFor: 'private - cases' stamp: 'NR 5/4/2022 07:25:29'!
case05
	
	^ 'test08CorrectlyFactorizesACompositeNumberWithMoreThanTwoFactors2
	
	self assert: (Bag with: 2 with: 2 with: 2) equals: 8 factorize
	'! !

!TDDBabyStepsGamePrimeFactors methodsFor: 'private - cases' stamp: 'NR 5/4/2022 07:26:29'!
case06
	
	^ 'test09CorrectlyFactorizesACompositeNumberWithMoreThanOneFactorsDifferentThan2
	
	self assert: (Bag with: 3 with: 3) equals: 9 factorize
	'! !

!TDDBabyStepsGamePrimeFactors methodsFor: 'private - cases' stamp: 'NR 5/2/2022 02:11:29'!
cases
	
	^ {self case01. self case02. self case03. self case04. self case05. self case06. }! !

!TDDBabyStepsGamePrimeFactors methodsFor: 'private - cases' stamp: 'NR 5/4/2022 06:48:58'!
extraCase
	
	^ 'testExtraToCheckGeneralizationOnKata
	
	self assert: (Bag with: 2 with: 2 with: 3 with: 3 with: 5 with: 13) equals: (2*2*3*3*5*13) factorize
	'! !


!classDefinition: #TDDBabyStepsGameRot13 category: 'TDDBabyStepsGame'!
TDDBabyStepsGame subclass: #TDDBabyStepsGameRot13
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDBabyStepsGame'!
!TDDBabyStepsGameRot13 commentStamp: '<historical>' prior: 0!
| game |
game  := TDDBabyStepsGameCuentaBancaria start.
game openHelp.
game openDefinition.
game next.!


!TDDBabyStepsGameRot13 methodsFor: 'private' stamp: 'NR 5/2/2022 02:06:05'!
definition
	
	^ 'ROT13 («rotar 13 posiciones») es un sencillo cifrado César utilizado para ocultar un texto sustituyendo cada letra por la letra que está trece posiciones por delante en el alfabeto. 
	
- A se convierte en N, B se convierte en O y así hasta la M, que se convierte en Z. 
	
- Luego la secuencia se invierte: N se convierte en A, O se convierte en B y así hasta la Z, que se convierte en M. 

Ver gráfico en: https://es.wikipedia.org/wiki/ROT13
Probar en: https://rot13.com/
'! !

!TDDBabyStepsGameRot13 methodsFor: 'private' stamp: 'NR 5/2/2022 02:06:01'!
name 
	
	^ 'Rot13'! !


!TDDBabyStepsGameRot13 methodsFor: 'private - cases' stamp: 'NR 5/4/2022 07:28:32'!
case01
	
	^ 'test01TheEmptyStringDoesntChange
	
	self assert: '''' equals: '''' asRot13
	'! !

!TDDBabyStepsGameRot13 methodsFor: 'private - cases' stamp: 'NR 5/4/2022 07:32:20'!
case02

	^ 'test02CorrectlyEncodesALowercaseOneCharStringFromTheFirstPartOfTheAlphabet
	
	self assert: ''n'' equals: ''a'' asRot13
	'
	! !

!TDDBabyStepsGameRot13 methodsFor: 'private - cases' stamp: 'NR 5/4/2022 07:32:25'!
case03
	
	^ 'test03CorrectlyEncodesALowercaseOneCharStringFromTheFirstPartOfTheAlphabet
	
	self assert: ''z'' equals: ''m'' asRot13
	'! !

!TDDBabyStepsGameRot13 methodsFor: 'private - cases' stamp: 'NR 5/4/2022 07:32:31'!
case04
	
	^ 'test04CorrectlyEncodesALowercaseOneCharStringFromTheSecondPartOfTheAlphabet
	
	self assert: ''a'' equals: ''n'' asRot13
	'! !

!TDDBabyStepsGameRot13 methodsFor: 'private - cases' stamp: 'NR 5/4/2022 07:32:35'!
case05
	
	^ 'test05CorrectlyEncodesALowercaseOneCharStringFromTheSecondPartOfTheAlphabet
	
	self assert: ''m'' equals: ''z'' asRot13
	'! !

!TDDBabyStepsGameRot13 methodsFor: 'private - cases' stamp: 'NR 5/8/2022 18:05:06'!
case06
	
	^ 'test06CorrectlyEncodesAnUppercaseOneCharStringFromTheFirstPartOfTheAlphabet
	
	self assert: ''N'' equals: ''A'' asRot13.
	self assert: ''Z'' equals: ''M'' asRot13
	'! !

!TDDBabyStepsGameRot13 methodsFor: 'private - cases' stamp: 'NR 5/8/2022 18:05:11'!
case07
	
	^ 'test07CorrectlyEncodesAnUppercaseOneCharStringFromTheSecondPartOfTheAlphabet
	
	self assert: ''A'' equals: ''N'' asRot13.
	self assert: ''M'' equals: ''Z'' asRot13
	'! !

!TDDBabyStepsGameRot13 methodsFor: 'private - cases' stamp: 'NR 5/4/2022 07:34:51'!
case08
	
	^ 'test08CorrectlyEncodesATwoCharStringWithNoSpecialCharacters
	
	self assert: ''nm'' equals: ''az'' asRot13
	'! !

!TDDBabyStepsGameRot13 methodsFor: 'private - cases' stamp: 'NR 5/4/2022 07:39:20'!
case09
	
	^ 'test09CorrectlyEncodesMoreThanTwoCharStringWithNoSpecialCharacters
	
	self assert: ''uByN'' equals: ''hOlA'' asRot13
	'! !

!TDDBabyStepsGameRot13 methodsFor: 'private - cases' stamp: 'NR 5/4/2022 07:40:46'!
case10
	
	^ 'test10CorrectlyEncodesSpecialCharactersWithNoChange
	
	self assert: ''&án%( ñ4'' equals: ''&áa%( ñ4'' asRot13
	'! !

!TDDBabyStepsGameRot13 methodsFor: 'private - cases' stamp: 'NR 5/8/2022 17:56:14'!
cases
	
	^ {self case01. self case02. self case03. self case04. self case05. self case06. self case07. self case08. self case09. self case10. }! !

!TDDBabyStepsGameRot13 methodsFor: 'private - cases' stamp: 'NR 5/4/2022 06:48:53'!
extraCase
	
	^ 'testExtraToCheckGeneralizationOnKata
		
	self assert: ''Ju3er j3 4e3 t01at j3 q0ag a3rq e04q$...'' equals: ''Wh3re w3 4r3 g01ng w3 d0nt n3ed r04d$...'' asRot13
	'! !


!classDefinition: #TDDBabyStepsGameBase category: 'TDDBabyStepsGame'!
Object subclass: #TDDBabyStepsGameBase
	instanceVariableNames: 'name casesToTest currentStep currentStepReturnMessage category score currentTest journey definition extraTest state'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDBabyStepsGame'!

!TDDBabyStepsGameBase methodsFor: 'private - journey' stamp: 'NR 5/1/2022 23:07:11'!
addEntryToJourney

	currentStepReturnMessage ifNotEmpty: [ journey add: 	currentStepReturnMessage ]! !

!TDDBabyStepsGameBase methodsFor: 'private - journey' stamp: 'NR 5/1/2022 20:11:49'!
clearCurrentStepReturnMessage

	currentStepReturnMessage := ''! !

!TDDBabyStepsGameBase methodsFor: 'private - journey' stamp: 'NR 5/1/2022 22:51:28'!
finalScoreLine

	^ 'Tu puntaje final es: {1} puntos de {2} posibles. Tu nota por la kata es un {3}/10.' format: { score.  self totalObtainablePoints. self grade }! !

!TDDBabyStepsGameBase methodsFor: 'private - journey' stamp: 'NR 5/1/2022 23:02:37'!
informGrade
	
	self updateCurrentStepReturnMessage: self newLine, self finalScoreLine
	! !

!TDDBabyStepsGameBase methodsFor: 'private - journey' stamp: 'NR 5/1/2022 03:47:37'!
newLine
	
	^ String with: Character newLineCharacter
	
	! !

!TDDBabyStepsGameBase methodsFor: 'private - journey' stamp: 'NR 5/1/2022 20:11:24'!
updateCurrentStepReturnMessage: aNewMessage

	currentStepReturnMessage := currentStepReturnMessage, aNewMessage! !


!TDDBabyStepsGameBase methodsFor: 'points definition' stamp: 'NR 5/1/2022 19:33:40'!
forcedNextPointsCost

	^ 5! !

!TDDBabyStepsGameBase methodsFor: 'points definition' stamp: 'NR 5/1/2022 22:56:55'!
grade
	
	| gradeableScore |
	
	gradeableScore := self score.
	gradeableScore  < 0 ifTrue: [ gradeableScore := 0 ].
	
	^ (gradeableScore / self totalObtainablePoints * 10) asFloat roundTo: 0.01! !

!TDDBabyStepsGameBase methodsFor: 'points definition' stamp: 'NR 5/1/2022 19:33:31'!
prematureDecisionsMadePointsCost

	^ 1! !

!TDDBabyStepsGameBase methodsFor: 'points definition' stamp: 'NR 5/1/2022 19:37:09'!
testPassedEarlyBonusPoints

	^ 0! !

!TDDBabyStepsGameBase methodsFor: 'points definition' stamp: 'NR 5/1/2022 19:33:47'!
testsDoNotPassPointsCost

	^ 1! !

!TDDBabyStepsGameBase methodsFor: 'points definition' stamp: 'NR 5/1/2022 19:37:19'!
testsPassedBonusPoints

	^ 5! !

!TDDBabyStepsGameBase methodsFor: 'points definition' stamp: 'NR 5/1/2022 19:47:29'!
totalObtainablePoints

	^ casesToTest size * self testsPassedBonusPoints! !


!TDDBabyStepsGameBase methodsFor: 'game state' stamp: 'NR 5/3/2022 06:46:35'!
finishGame

	state := GameEnded for: self.
	self hasPassedExtraTest ifTrue: [ self gameEndedGeneralizedCorrectly ] ifFalse: [ self gameEndedGeneralizedIncorrectly ].
	self informGrade.
	! !

!TDDBabyStepsGameBase methodsFor: 'game state' stamp: 'NR 5/3/2022 08:13:09'!
forceNextOnNormalStep
	
	self tryToPassTestsAndEvaluate: [ self stepCompleted ]
		
! !

!TDDBabyStepsGameBase methodsFor: 'game state' stamp: 'NR 5/3/2022 09:23:32'!
increaseScoreOnEndedGame
	
	self error: self class increaseScoreOnEndedGameErrorMessage.
	
	
! !

!TDDBabyStepsGameBase methodsFor: 'game state' stamp: 'NR 5/3/2022 07:45:07'!
increaseScoreOnNormalStep
	
	currentStep > 0 ifTrue: [ self increaseScoreAsCurrentTestsPassed ].
	
	
! !

!TDDBabyStepsGameBase methodsFor: 'game state' stamp: 'NR 5/3/2022 07:46:54'!
increaseScoreOnPrematureDecisionStep
	
	self increaseScoreAsLatestTestPassedEarly.
	state := OnNormalStep for: self.
	
	
! !

!TDDBabyStepsGameBase methodsFor: 'game state' stamp: 'NR 5/3/2022 07:48:00'!
nextOnEndedGame
	
	! !

!TDDBabyStepsGameBase methodsFor: 'game state' stamp: 'NR 5/8/2022 17:57:44'!
nextOnNormalStep
	
	self tryToPassTestsAndEvaluate: [	
		(self prematureDecisionMade)
			ifTrue:[ self decreaseScoreAsPrematureDecisionsMade. ]
			ifFalse:[ self stepCompleted ]
		]
! !


!TDDBabyStepsGameBase methodsFor: 'private' stamp: 'NR 5/3/2022 07:32:37'!
detectPrematureDecisions
	
	self prematureDecisionsMadeOnLastStep ifTrue: [ 
		self decreaseScoreAsForcedNext.
		state := OnPrematureDecisionStep for: self]! !

!TDDBabyStepsGameBase methodsFor: 'private' stamp: 'NR 5/1/2022 20:14:49'!
gameEndedGeneralizedCorrectly
	
	self updateCurrentStepReturnMessage: self newLine, '¡Felicitaciones!! ', self class endOfGameMessage, ' Has generalizado la solución correctamente.'
	! !

!TDDBabyStepsGameBase methodsFor: 'private' stamp: 'NR 5/1/2022 20:15:03'!
gameEndedGeneralizedIncorrectly
	
	score > 0 ifTrue: [ score := 0 ].
	self updateCurrentStepReturnMessage: self newLine, self class endOfGameMessage, ' Pero si bien pasas los tests, no has generalizado la solución lo suficiente.'
	
	! !

!TDDBabyStepsGameBase methodsFor: 'private' stamp: 'NR 5/3/2022 09:06:25'!
gameHasEnded

	^ currentStep > casesToTest size! !

!TDDBabyStepsGameBase methodsFor: 'private' stamp: 'NR 4/30/2022 03:02:08'!
increaseCurrentStep
	
	currentStep := currentStep  + 1
! !

!TDDBabyStepsGameBase methodsFor: 'private' stamp: 'NR 5/3/2022 07:17:22'!
prematureDecisionMade

	^ currentStep < casesToTest size and: [ self hasPassedNextTest ]! !

!TDDBabyStepsGameBase methodsFor: 'private' stamp: 'NR 5/3/2022 07:27:03'!
prematureDecisionsMadeOnLastStep
	
	^ currentTest isNil not and: [ self hasPassedCurrentTest ]! !

!TDDBabyStepsGameBase methodsFor: 'private' stamp: 'NR 5/1/2022 03:50:11'!
prematureDecisionsMessage
	
	^ 'Pero has tomado decisiones prematuras (utilizaste el forceNext) por lo que restás {1} puntos'! !

!TDDBabyStepsGameBase methodsFor: 'private' stamp: 'NR 5/3/2022 09:17:10'!
stepCompleted

	self increaseScore.
	self increaseCurrentStep.
	self gameHasEnded
		ifTrue: [ self finishGame ]
		ifFalse: [ self addTestToTheTestCaseClass.
			self detectPrematureDecisions ]
! !

!TDDBabyStepsGameBase methodsFor: 'private' stamp: 'NR 5/3/2022 07:07:59'!
tryToPassTestsAndEvaluate: aTestsPassBlock
	
	self clearCurrentStepReturnMessage.
		
	self runSuiteIfPassDo: aTestsPassBlock
		ifDoesNotPass: [ self decreaseScoreAsTestsDoNotPass. ]
	
	
! !


!TDDBabyStepsGameBase methodsFor: 'private - tests' stamp: 'NR 4/30/2022 03:03:05'!
browseTestCase
	
	BrowserWindow fullOnClass: self testCaseClass
	! !

!TDDBabyStepsGameBase methodsFor: 'private - tests' stamp: 'NR 5/1/2022 03:46:17'!
hasPassedCurrentTest
	
	^ self runCurrentTest hasPassed! !

!TDDBabyStepsGameBase methodsFor: 'private - tests' stamp: 'NR 5/1/2022 03:46:12'!
hasPassedExtraTest
	
	^ self runExtraTest hasPassed! !

!TDDBabyStepsGameBase methodsFor: 'private - tests' stamp: 'NR 5/1/2022 03:46:09'!
hasPassedNextTest
	
	^ self runNextTest hasPassed! !

!TDDBabyStepsGameBase methodsFor: 'private - tests' stamp: 'NR 5/1/2022 03:34:15'!
runCurrentTest
	
	^ self runTest: currentTest
	! !

!TDDBabyStepsGameBase methodsFor: 'private - tests' stamp: 'NR 5/1/2022 03:43:31'!
runExtraTest
	
	^ self runTest: (self compileTestFromMethod: extraTest)
	
	! !

!TDDBabyStepsGameBase methodsFor: 'private - tests' stamp: 'NR 5/1/2022 03:45:38'!
runNextTest
	
	| nextTestName results |
	nextTestName := (self compileTestFromMethod: self nextTest).
	results := self runTest: nextTestName.
	self testCaseClass removeSelector: nextTestName.
	^ results
	
	! !

!TDDBabyStepsGameBase methodsFor: 'private - tests' stamp: 'NR 5/3/2022 05:58:19'!
runSuiteIfPassDo: aTestsPassBlock ifDoesNotPass: aTestsDoesNotPassBlock
		
	| testResult |
	testResult _ self testSuite run.	
	[testResult hasPassed 
		ifTrue: aTestsPassBlock
		ifFalse: aTestsDoesNotPassBlock]
	ensure: [	self addEntryToJourney]
	! !

!TDDBabyStepsGameBase methodsFor: 'private - tests' stamp: 'NR 5/1/2022 03:44:50'!
runTest: aTestName
	
	| suite |
	suite _ TestSuite forCompiledMethod: self testCaseClass >> aTestName.
	^ suite run
	
	
	! !

!TDDBabyStepsGameBase methodsFor: 'private - tests' stamp: 'NR 5/1/2022 03:44:56'!
testSuite
	
	^ TestSuite forClass: self testCaseClass! !


!TDDBabyStepsGameBase methodsFor: 'private - test case building' stamp: 'NR 4/30/2022 02:54:59'!
addTestToTheTestCaseClass
	
	currentTest := self testCaseClass compile: self currentTest classified: 'tests'! !

!TDDBabyStepsGameBase methodsFor: 'private - test case building' stamp: 'NR 5/1/2022 03:41:59'!
compileTestFromMethod: aTestMethod

	^ self testCaseClass compile: aTestMethod classified: 'tests'! !

!TDDBabyStepsGameBase methodsFor: 'private - test case building' stamp: 'NR 4/30/2022 02:55:03'!
createTestCaseClass
	
	Compiler evaluate: self createTestCaseDefinition! !

!TDDBabyStepsGameBase methodsFor: 'private - test case building' stamp: 'NR 4/30/2022 02:55:07'!
createTestCaseDefinition
	
	^ 'TestCase subclass: #{1}
	instanceVariableNames: ''''
	classVariableNames: ''''
	poolDictionaries: ''''
	category: ''{2}''' format: {self testCaseName. self testCaseCategory }! !

!TDDBabyStepsGameBase methodsFor: 'private - test case building' stamp: 'JMB 10/28/2021 19:56:16'!
currentTest

	^ casesToTest at: currentStep! !

!TDDBabyStepsGameBase methodsFor: 'private - test case building' stamp: 'NR 5/1/2022 03:18:50'!
nextTest

	^ casesToTest at: currentStep + 1! !


!TDDBabyStepsGameBase methodsFor: 'test cases' stamp: 'NR 5/1/2022 03:19:31'!
testCaseCategory
	
	^ category! !

!TDDBabyStepsGameBase methodsFor: 'test cases' stamp: 'NR 5/1/2022 03:19:18'!
testCaseClass
	
	^ Smalltalk at: self testCaseName ! !

!TDDBabyStepsGameBase methodsFor: 'test cases' stamp: 'NR 5/1/2022 03:19:25'!
testCaseName
	
	^ ('TDDBabySteps{1}Test' format: {name capitalized}) asSymbol! !


!TDDBabyStepsGameBase methodsFor: 'steps' stamp: 'NR 5/3/2022 08:13:17'!
forceNext
	
	state forceNext
		
! !

!TDDBabyStepsGameBase methodsFor: 'steps' stamp: 'NR 5/1/2022 03:51:35'!
journey
	
	^ journey! !

!TDDBabyStepsGameBase methodsFor: 'steps' stamp: 'NR 5/1/2022 03:51:38'!
lastStepTakenIfNone: exceptionBlock
	
	^ journey lastIfEmpty: exceptionBlock ! !

!TDDBabyStepsGameBase methodsFor: 'steps' stamp: 'NR 5/3/2022 05:49:50'!
next
	
	state next
! !

!TDDBabyStepsGameBase methodsFor: 'steps' stamp: 'NR 5/1/2022 03:51:48'!
score
	
	^ score! !


!TDDBabyStepsGameBase methodsFor: 'statements' stamp: 'NR 5/1/2022 03:52:12'!
definition
	
	^ definition! !

!TDDBabyStepsGameBase methodsFor: 'statements' stamp: 'NR 5/2/2022 02:15:35'!
help
	
	^ '0- Iniciar un juego. Si llegó hasta aquí es que ya hizo: 
	
	game:=TDDBabyStepsGameXXXX start.
	
1- Usted comienza con un puntaje de 0 puntos. Al comenzar se creará la clase de test y se abrirá un class browser.  

2- Para obtener el primer caso de test a pasar haga: 

	game next. 

3- Una vez finalizada la implementación para ese test haga nuevamente:

	game next.
	
- Si sus tests pasan, ganará 5 puntos y se le presentará el próximo test.
- Si sus tests no pasan, perderá 1 punto y deberá seguir intentando haciendolos pasar.
- Si sus test pasan pero se adelantó con su implementación (no es mínima) perderá 1 punto y deberá intentar reformularla para no adelanterse pasos.

3''- Tenga SIEMPRE en mente que hacer "game next" le escribirá un nuevo test. Si desea hacer un "paso 3" de refactor, hagalo ANTES de enviar el mensaje next.

4- Si no logra llegar a la implementación mínima siempre puede hacer:

	game forceNext.
	
para seguir avanzando. De esta manera se le presentará el próximo test (el cual pasará directamente con la implementación propuesta) y así entender en que se había adelantado. Pero ¡atención!! De hacerlo se le restaran 5 puntos y ademas el nuevo test presentado no sumará puntos pues ya pasaba de entrada al efectuar el forceNext.

5- En cualquier momento puede hacer:
	
	game openJourney.
	
para ver un resumen de trayecto actual por el juego.

6- Cuando los tests se acaben el juego habrá terminado y se le presentará un puntaje junto a su nota final por el ejercicio. Pero ¡atención nuevamente!! Si sólo se encargó de pasar los tests y nunca generalizó utilizando un paso 3, puede que pierda TODOS su puntos si no logra pasar un último test extra de generalización. Con lo que, ¡No se olviden de generalizar!!

Notas extras: 
a) Para practicar, antes de hacer game next puede pensar y anotar en un papel cual cree que sería el próximo test a pasar y así comparar por el que presenta el juego.
b) Al terminar el juego puede pensar cuales de los tests presentados habría que mantener y cuales podrían eliminarse por estar repetidos. Verificar además los nombres de los mismos.
'! !

!TDDBabyStepsGameBase methodsFor: 'statements' stamp: 'NR 5/1/2022 03:52:16'!
name
	
	^ name! !


!TDDBabyStepsGameBase methodsFor: 'initialization' stamp: 'NR 5/3/2022 09:14:30'!
initializeNamed: aName withCases: aCasesToTest withExtraCase: anExtraCase inCategory: aCategory withDefinition: aDefinition 
	
	name := aName.
	casesToTest := aCasesToTest.
	extraTest :=anExtraCase.
	category := aCategory.
	definition := aDefinition. 
	currentStep := 0.
	score := 0.
	state := OnNormalStep for: self.
	journey := OrderedCollection new.
	self createTestCaseClass.! !


!TDDBabyStepsGameBase methodsFor: 'score' stamp: 'NR 5/1/2022 19:29:43'!
decreaseScoreAsForcedNext

	self decreaseScoreBy: self forcedNextPointsCost withMessage: self newLine, self prematureDecisionsMessage. ! !

!TDDBabyStepsGameBase methodsFor: 'score' stamp: 'NR 5/3/2022 07:54:50'!
decreaseScoreAsPrematureDecisionsMade

	self decreaseScoreBy: self prematureDecisionsMadePointsCost withMessage: self class prematureDecisionsMadeErrorMessage, self newLine, 'Restás {1} punto.'.! !

!TDDBabyStepsGameBase methodsFor: 'score' stamp: 'NR 5/3/2022 07:55:10'!
decreaseScoreAsTestsDoNotPass

	self decreaseScoreBy: self testsDoNotPassPointsCost withMessage:self class testsDoNotPassErrorMessage, self newLine, 'Restás {1} punto.'.! !

!TDDBabyStepsGameBase methodsFor: 'score' stamp: 'NR 5/1/2022 20:29:52'!
decreaseScoreBy: points withMessage: description
	
	score := score - points.
	self updateCurrentStepReturnMessage: (description,' Tu puntaje actual es de {2}.' format: {points. score}).
	
	! !

!TDDBabyStepsGameBase methodsFor: 'score' stamp: 'NR 5/3/2022 07:44:57'!
increaseScore
	
	state increaseScore.
	

	

! !

!TDDBabyStepsGameBase methodsFor: 'score' stamp: 'NR 5/1/2022 19:37:19'!
increaseScoreAsCurrentTestsPassed

	self increaseScoreBy: self testsPassedBonusPoints withMessage: 'Has completado el test actual, sumás {1} puntos.'
	! !

!TDDBabyStepsGameBase methodsFor: 'score' stamp: 'NR 5/1/2022 20:28:44'!
increaseScoreAsLatestTestPassedEarly

	self increaseScoreBy: self testPassedEarlyBonusPoints withMessage: 'Sumás {1} puntos porque pasaste este test de entrada. Avanzás al siguiente test.'! !

!TDDBabyStepsGameBase methodsFor: 'score' stamp: 'NR 5/1/2022 20:29:04'!
increaseScoreBy: points withMessage: description
	
	score := score + points.
	self updateCurrentStepReturnMessage: (description,' Tu puntaje actual es de {2}.' format: {points. score})	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TDDBabyStepsGameBase class' category: 'TDDBabyStepsGame'!
TDDBabyStepsGameBase class
	instanceVariableNames: ''!

!TDDBabyStepsGameBase class methodsFor: 'instance creation' stamp: 'NR 5/1/2022 04:50:08'!
startNamed: aName withCases: casesToTest withExtraCase: extraCase
	
	^self startNamed: aName withCases: casesToTest withExtraTest: extraCase inCategory: self category withDefinition: ''! !

!TDDBabyStepsGameBase class methodsFor: 'instance creation' stamp: 'NR 5/1/2022 04:49:56'!
startNamed: aName withCases: casesToTest withExtraCase:extraCase inCategory: aCategory withDefinition: aDefinition  
	
	^self new initializeNamed: aName withCases: casesToTest withExtraCase: extraCase inCategory: aCategory withDefinition: aDefinition ! !


!TDDBabyStepsGameBase class methodsFor: 'messages' stamp: 'NR 4/30/2022 21:18:15'!
endOfGameMessage
	
	^ 'Has finalizado el juego/kata.'! !

!TDDBabyStepsGameBase class methodsFor: 'messages' stamp: 'NR 5/3/2022 09:20:42'!
increaseScoreOnEndedGameErrorMessage
	
	^ 'No se pueden sumar puntos de un juego terminado.'! !

!TDDBabyStepsGameBase class methodsFor: 'messages' stamp: 'NR 4/30/2022 19:13:53'!
prematureDecisionsMadeErrorMessage
	
	^ '¡Te estás adelantando!! Para continuar modifica tu modelo actual por uno más sencillo y menos general.'! !

!TDDBabyStepsGameBase class methodsFor: 'messages' stamp: 'NR 4/30/2022 19:13:48'!
testsDoNotPassErrorMessage
	
	^ 'No se puede avanzar al próximo test si no pasan todos los tests actuales.'! !


!classDefinition: #TDDBabyStepsGameState category: 'TDDBabyStepsGame'!
Object subclass: #TDDBabyStepsGameState
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDBabyStepsGame'!

!TDDBabyStepsGameState methodsFor: 'initialization' stamp: 'NR 5/3/2022 05:40:43'!
initializeWith: aGame
	
	game := aGame! !


!TDDBabyStepsGameState methodsFor: 'game actions' stamp: 'NR 5/3/2022 08:11:07'!
forceNext
	
	self subclassResponsibility! !

!TDDBabyStepsGameState methodsFor: 'game actions' stamp: 'NR 5/3/2022 07:49:44'!
increaseScore
	
	self subclassResponsibility! !

!TDDBabyStepsGameState methodsFor: 'game actions' stamp: 'NR 5/3/2022 05:48:57'!
next
	
	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TDDBabyStepsGameState class' category: 'TDDBabyStepsGame'!
TDDBabyStepsGameState class
	instanceVariableNames: ''!

!TDDBabyStepsGameState class methodsFor: 'as yet unclassified' stamp: 'NR 5/3/2022 05:54:15'!
for: aGame
	
	^ self new initializeWith: aGame! !


!classDefinition: #GameEnded category: 'TDDBabyStepsGame'!
TDDBabyStepsGameState subclass: #GameEnded
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDBabyStepsGame'!

!GameEnded methodsFor: 'game actions' stamp: 'NR 5/3/2022 08:11:26'!
forceNext
	
	game nextOnEndedGame! !

!GameEnded methodsFor: 'game actions' stamp: 'NR 5/3/2022 07:41:42'!
increaseScore

	game increaseScoreOnEndedGame! !

!GameEnded methodsFor: 'game actions' stamp: 'NR 5/3/2022 07:48:00'!
next
	
	game nextOnEndedGame! !


!classDefinition: #OnNormalStep category: 'TDDBabyStepsGame'!
TDDBabyStepsGameState subclass: #OnNormalStep
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDBabyStepsGame'!

!OnNormalStep methodsFor: 'game actions' stamp: 'NR 5/3/2022 08:11:47'!
forceNext

	game forceNextOnNormalStep! !

!OnNormalStep methodsFor: 'game actions' stamp: 'NR 5/3/2022 07:40:42'!
increaseScore

	game increaseScoreOnNormalStep! !

!OnNormalStep methodsFor: 'game actions' stamp: 'NR 5/3/2022 05:48:20'!
next

	game nextOnNormalStep! !


!classDefinition: #OnPrematureDecisionStep category: 'TDDBabyStepsGame'!
TDDBabyStepsGameState subclass: #OnPrematureDecisionStep
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDBabyStepsGame'!

!OnPrematureDecisionStep methodsFor: 'game actions' stamp: 'NR 5/3/2022 08:12:15'!
forceNext

	game forceNextOnNormalStep! !

!OnPrematureDecisionStep methodsFor: 'game actions' stamp: 'NR 5/3/2022 07:41:11'!
increaseScore

	game increaseScoreOnPrematureDecisionStep! !

!OnPrematureDecisionStep methodsFor: 'game actions' stamp: 'NR 5/3/2022 07:31:28'!
next

	game nextOnNormalStep! !


!classDefinition: #TDDBabyStepsGameView category: 'TDDBabyStepsGame'!
Object subclass: #TDDBabyStepsGameView
	instanceVariableNames: 'model'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDDBabyStepsGame'!

!TDDBabyStepsGameView methodsFor: 'initialization' stamp: 'NR 4/30/2022 03:11:59'!
initializeFor: aGame
	
	model := aGame ! !


!TDDBabyStepsGameView methodsFor: 'steps' stamp: 'NR 5/1/2022 03:55:04'!
forceNext
	
	self informResultOf: [ model forceNext ]! !

!TDDBabyStepsGameView methodsFor: 'steps' stamp: 'NR 5/3/2022 06:16:00'!
informResultOf: aNextStepBlock
	
	aNextStepBlock value.
	
	self informStepResult! !

!TDDBabyStepsGameView methodsFor: 'steps' stamp: 'NR 5/1/2022 03:55:14'!
next
	
	self informResultOf: [ model next ]
! !

!TDDBabyStepsGameView methodsFor: 'steps' stamp: 'NR 4/30/2022 03:12:26'!
start
	
	model browseTestCase. 
	self informStart! !


!TDDBabyStepsGameView methodsFor: 'statements' stamp: 'NR 5/3/2022 06:21:01'!
formatJourney

	^ model journey inject: '' into:[ :finalLog :line | finalLog, '- ', line, self newLine ]! !

!TDDBabyStepsGameView methodsFor: 'statements' stamp: 'NR 5/3/2022 06:20:49'!
newLine

	^ String with: Character newLineCharacter! !

!TDDBabyStepsGameView methodsFor: 'statements' stamp: 'NR 5/1/2022 02:31:30'!
openDefinition
	
	TextModel new contents: model definition; openLabel: 'Enunciado ', model name! !

!TDDBabyStepsGameView methodsFor: 'statements' stamp: 'NR 5/1/2022 02:31:56'!
openHelp
	
	TextModel new contents: model help; openLabel: model name, ' Ayuda'! !

!TDDBabyStepsGameView methodsFor: 'statements' stamp: 'NR 5/1/2022 02:31:59'!
openJourney
	
	TextModel new contents: self formatJourney; openLabel: model name, ' Journey Log'! !


!TDDBabyStepsGameView methodsFor: 'test cases' stamp: 'NR 4/30/2022 03:12:53'!
testCaseCategory
	
	^ model testCaseCategory! !


!TDDBabyStepsGameView methodsFor: 'private' stamp: 'NR 5/3/2022 06:21:55'!
informStart
	
	self inform: 'El juego/kata se inicia. Se ha creado la clase de test.', self newLine, 'Avance al siguiente paso (utilizando next) para generar el primer test a pasar.'! !

!TDDBabyStepsGameView methodsFor: 'private' stamp: 'NR 5/1/2022 03:56:09'!
informStepResult
	
	| lastStepTaken |
	lastStepTaken := model lastStepTakenIfNone: [ ^self ].
	self inform: lastStepTaken! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TDDBabyStepsGameView class' category: 'TDDBabyStepsGame'!
TDDBabyStepsGameView class
	instanceVariableNames: ''!

!TDDBabyStepsGameView class methodsFor: 'instance creation' stamp: 'JMB 11/14/2021 20:12:56'!
for: aGame
	^ self new initializeFor: aGame! !
