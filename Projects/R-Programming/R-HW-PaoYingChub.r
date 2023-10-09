print("Hello")
print("What's your name ?")
player_n <- readLines("stdin",n=1)
print(paste("Welcome ",player_n ,"to play paoyingchub game with Bot"))
print ("Let start!!!")
pyc <- c("Hammer","Paper","Scissors")
choose <- c("h","p","s")
enter_pyc <- data.frame(pyc,choose)
print(pyc)

bot <- c("h","p","s")
win <- 0
lose <- 0
tie <- 0

while(TRUE){
  print("You can press 'h'  'p'  's' for play game")
  print(" You can press 'q' to exit the game ")
  bot <- sample(bot,1)
  user <- readLines("stdin",n=1)
  print(paste("You choose :",user))
  if (user != bot){
    if (user=="h" & bot == "s" | 
        user == "p" & bot == "h" | 
        user == "s" & bot == "p"){
        print(paste("Bot choose :",bot))
        print("You : win")
       #paoyingchub again")
        win <- win +1
    }else if (user=="h" & bot =="p" | 
              user == "p" & bot  == "s"|
              user == "s" & bot == "h"){
        print(paste("Bot choose :",bot))
        print("You : lose")
      #paoyingchub again")
        lose <- lose + 1 
    }else if (user == "q"){
      print("Thank you for playing Pao Ying Chub game.")
      print("Finally, your score ")
      break
    }
  }else if (user == bot){
    print(paste("Bot choose :",bot))
    print("tie")
  
    tie <- tie + 1
  }
}

print(paste("You win : ",win,"score"))
print(paste("You lose : ",lose,"score"))
print(paste("You tie : ",tie,"score"))

