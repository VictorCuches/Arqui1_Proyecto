#include <LedControl.h>
#include <LiquidCrystal.h>

LiquidCrystal lcd(A8, A9, A10, A11, A12, A13);
LedControl lc = LedControl(13,11,12,4);
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  lcd.print("hola");

  //matriz #1
  lc.shutdown(0, false);
  lc.setIntensity(0,4);
  lc.clearDisplay(0);

  //MATRIZ #2
  lc.shutdown(1, false);
  lc.setIntensity(1,4);
  lc.clearDisplay(1);

  //MATRIZ #3
  lc.shutdown(2, false);
  lc.setIntensity(2,4);
  lc.clearDisplay(2);

  //MATRIZ #4
  lc.shutdown(3, false);
  lc.setIntensity(3,4);
  lc.clearDisplay(3);

  
  

}

void loop() {
  /*
  cuadratica_pos();
  delay(1000);
  limpiarBoard();
  delay(500);

  cuadratica_neg();
  delay(1000);
  limpiarBoard();
  
  delay(500);
  cuarta_pos();
  delay(1000);
  limpiarBoard();

  delay(500);
  cuarta_neg();
  delay(1000);
  limpiarBoard();
  
  delay(500);
  cubo_pos();
  delay(1000);
  limpiarBoard();

  delay(500);
  cubo_neg();
  delay(1000);
  limpiarBoard();

  delay(500);
  lineal_pos();
  delay(1000);
  limpiarBoard();

  delay(500);
  lineal_neg();
  delay(1000);
  limpiarBoard();
  */
   
  
  

  
  lcd.clear();
  lcd.print("Esperando");
  String str ="";
  while(true){
    if(Serial.available()){
      
      char c = Serial.read();
      if(c == 'k'){
        break;
      } else {
         str += c;
      }
      
      
    }
  }
  Serial.print(str); // funcion -> str
  lcd.clear();
  lcd.print(str);
  analize(str);
  delay(5000);
  
  
  
}

void analize(String funcion){
  int signo = 0;
  int potencia = 0;
  for (int i = 0; i <= funcion.length(); i++){
    char caracter = funcion[i];
    if(caracter == '-') {
      // grafica negativa 
      signo = 1;
           
    } else if (caracter == '^'){
      if(funcion[i+1]=='2'){
        potencia = 2;   
      } else if(funcion[i+1]=='3'){
        potencia = 3;   
      } else if(funcion[i+1]=='4'){
        potencia = 4;   
      } else if(funcion[i+1]=='5'){
        potencia = 5;   
      } 
      
      break;
    } else if (caracter == 'x'){
      if(funcion[i+1] == '+' || funcion[i+1] == '-'){
        potencia = 1;
        break;
      }
    }
    
  }
  if (signo == 0){ //POSITIVO
    if(potencia == 1){
      lineal_pos();
    } else if(potencia==2){
      cuadratica_pos();
    } else if(potencia ==3){
      cubo_pos(); 
    } else if (potencia == 4){
      cuarta_pos();
    }    
  }

  if (signo == 1){ //NEGATIVO
    if(potencia == 1){
      lineal_neg();
    } else if(potencia==2){
      cuadratica_neg();
    } else if(potencia ==3){
      cubo_neg(); 
    } else if (potencia == 4){
      cuarta_neg();
    }    
  }
 
  delay(5000);
  limpiarBoard();
  
  
  
  
}

void cuadratica_pos(){
  //(no_matriz, fila, columna, on/off)
  // MATRIZ #1 
  lc.setLed(0,7,7, true); 
  lc.setLed(0,7,6, true); 
  lc.setLed(0,6,5, true); 
  lc.setLed(0,5,4, true); 
  lc.setLed(0,4,3, true);
  lc.setLed(0,3,2, true);
  lc.setLed(0,2,1, true);
  lc.setLed(0,1,0, true);   

  // MATRIZ #2
  lc.setLed(1,7,0, true); 
  lc.setLed(1,7,1, true); 
  lc.setLed(1,6,2, true); 
  lc.setLed(1,5,3, true); 
  lc.setLed(1,4,4, true);
  lc.setLed(1,3,5, true);
  lc.setLed(1,2,6, true);
  lc.setLed(1,1,7, true); 

}
void cuadratica_neg(){
  //(no_matriz, fila, columna, on/off)
  // MATRIZ #3
  lc.setLed(2,0,7, true); 
  lc.setLed(2,0,6, true); 
  lc.setLed(2,1,5, true); 
  lc.setLed(2,2,4, true); 
  lc.setLed(2,3,3, true);
  lc.setLed(2,4,2, true);
  lc.setLed(2,5,1, true);
  lc.setLed(2,6,0, true);   

  // MATRIZ #4
  lc.setLed(3,0,0, true); 
  lc.setLed(3,0,1, true); 
  lc.setLed(3,1,2, true); 
  lc.setLed(3,2,3, true); 
  lc.setLed(3,3,4, true);
  lc.setLed(3,4,5, true);
  lc.setLed(3,5,6, true);
  lc.setLed(3,6,7, true); 

}
void cuarta_pos(){
  //(no_matriz, fila, columna, on/off)
  // MATRIZ #1 
  lc.setLed(0,0,0, true); 
  lc.setLed(0,1,0, true); 
  lc.setLed(0,2,0, true); 
  lc.setLed(0,3,1, true); 
  lc.setLed(0,4,2, true);
  lc.setLed(0,5,3, true);
  lc.setLed(0,6,4, true);
  lc.setLed(0,7,5, true);   
  lc.setLed(0,7,6, true);   
  lc.setLed(0,7,7, true);   

  // MATRIZ #2
  lc.setLed(1,0,7, true); 
  lc.setLed(1,1,7, true); 
  lc.setLed(1,2,7, true); 
  lc.setLed(1,3,6, true); 
  lc.setLed(1,4,5, true);
  lc.setLed(1,5,4, true);
  lc.setLed(1,6,3, true);
  lc.setLed(1,7,2, true);   
  lc.setLed(1,7,1, true);   
  lc.setLed(1,7,0, true); 

}
void cuarta_neg(){
  //(no_matriz, fila, columna, on/off)
  // MATRIZ #3 
  lc.setLed(2,7,0, true); 
  lc.setLed(2,6,0, true); 
  lc.setLed(2,5,0, true); 
  lc.setLed(2,4,1, true); 
  lc.setLed(2,3,2, true);
  lc.setLed(2,2,3, true);
  lc.setLed(2,1,4, true);
  lc.setLed(2,0,5, true);   
  lc.setLed(2,0,6, true);   
  lc.setLed(2,0,7, true);   

  // MATRIZ #4
  lc.setLed(3,7,7, true); 
  lc.setLed(3,6,7, true); 
  lc.setLed(3,5,7, true); 
  lc.setLed(3,4,6, true); 
  lc.setLed(3,3,5, true);
  lc.setLed(3,2,4, true);
  lc.setLed(3,1,3, true);
  lc.setLed(3,0,2, true);   
  lc.setLed(3,0,1, true);   
  lc.setLed(3,0,0, true); 

}

void cubo_pos(){
  // MATRIZ #2
  lc.setLed(1,7,0, true); 
  lc.setLed(1,7,1, true); 
  lc.setLed(1,6,2, true); 
  lc.setLed(1,5,3, true); 
  lc.setLed(1,4,4, true);
  lc.setLed(1,3,5, true);
  lc.setLed(1,2,6, true);
  lc.setLed(1,1,7, true); 
  lc.setLed(1,0,7, true); 

  // MATRIZ #3
  lc.setLed(2,7,0, true); 
  lc.setLed(2,6,0, true); 
  lc.setLed(2,5,1, true); 
  lc.setLed(2,4,2, true); 
  lc.setLed(2,3,3, true);
  lc.setLed(2,2,4, true);
  lc.setLed(2,1,5, true);
  lc.setLed(2,0,6, true); 
  lc.setLed(2,0,7, true); 
  
}

void cubo_neg(){
  // MATRIZ #1
  lc.setLed(0,7,7, true); 
  lc.setLed(0,7,6, true); 
  lc.setLed(0,6,5, true); 
  lc.setLed(0,5,4, true); 
  lc.setLed(0,4,3, true);
  lc.setLed(0,3,2, true);
  lc.setLed(0,2,1, true);
  lc.setLed(0,1,0, true); 
  lc.setLed(0,0,0, true); 

  // MATRIZ #4
  lc.setLed(3,7,7, true); 
  lc.setLed(3,6,7, true); 
  lc.setLed(3,5,6, true); 
  lc.setLed(3,4,5, true); 
  lc.setLed(3,3,4, true);
  lc.setLed(3,2,3, true);
  lc.setLed(3,1,2, true);
  lc.setLed(3,0,1, true); 
  lc.setLed(3,0,0, true); 
  
}

void lineal_pos(){
  // MATRIZ #2
  lc.setLed(1,7,0, true); 
  lc.setLed(1,6,1, true); 
  lc.setLed(1,5,2, true); 
  lc.setLed(1,4,3, true); 
  lc.setLed(1,3,4, true);
  lc.setLed(1,2,5, true);
  lc.setLed(1,1,6, true);
  lc.setLed(1,0,7, true); 
   

  // MATRIZ #3
  lc.setLed(2,7,0, true); 
  lc.setLed(2,6,1, true); 
  lc.setLed(2,5,2, true); 
  lc.setLed(2,4,3, true); 
  lc.setLed(2,3,4, true);
  lc.setLed(2,2,5, true);
  lc.setLed(2,1,6, true);
  lc.setLed(2,0,7, true); 
 
}
void lineal_neg(){
  // MATRIZ #1
  lc.setLed(0,0,0, true); 
  lc.setLed(0,1,1, true); 
  lc.setLed(0,2,2, true); 
  lc.setLed(0,3,3, true); 
  lc.setLed(0,4,4, true);
  lc.setLed(0,5,5, true);
  lc.setLed(0,6,6, true);
  lc.setLed(0,7,7, true); 
   

  // MATRIZ #4
  lc.setLed(3,0,0, true); 
  lc.setLed(3,1,1, true); 
  lc.setLed(3,2,2, true); 
  lc.setLed(3,3,3, true); 
  lc.setLed(3,4,4, true);
  lc.setLed(3,5,5, true);
  lc.setLed(3,6,6, true);
  lc.setLed(3,7,7, true); 
 
}
void limpiarBoard(){
  lc.shutdown(0, false);
  lc.shutdown(1, false);
  lc.shutdown(2, false);
  lc.shutdown(3, false);
  lc.setIntensity(0,4);
  lc.setIntensity(1,4);
  lc.setIntensity(2,4);
  lc.setIntensity(3,4);
  lc.clearDisplay(0);
  lc.clearDisplay(1);
  lc.clearDisplay(2);
  lc.clearDisplay(3);
 
}
