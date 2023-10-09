## HW01 - chatbot order pizza
## dataframe
menu_name <- c("Seafood", "Hawaiian", "Pepperoni", "Truffle")
priceb <-c(189, 175, 200, 220)

#cus_member <- c("member", "No member")
#pricem  <-c(20, 0)


pizza_menu <- data.frame(menu_name, priceb)
#member <- data.frame(cus_member,pricem)


price <- 0
pricem <- 20

chatbot <- function() {
 
  print("Welcome the PizzaBot shop!")
  print("This is our menu: ")
  print(pizza_menu)
  print("Please enter the pizza id you'd like to order.: ")
  cus_inp <- readLines("stdin", n = 1)
  
    if (cus_inp == "Seafood") {
      price = price + 189 }
    else if (cus_inp == "Hawaiian"){
      price = price + 175 }
    else if (cus_inp == "Pepperoni"){
      price = price + 200}
    else if (cus_inp == "Truffle"){
      price = price + 200}
    else {
    print("Your order is not availabe, please try again.")
  }
    

  print(paste("OK, you choose",cus_inp, "and the price is",price))

  
      print("Are you a member? (Yes/No) ")
      cus_m <- readLines("stdin", n=1)
      
        if (cus_m == "Yes") {
         
            print(paste("Total price is", price - pricem, "baht"))                   
          print("Thank you!")
      break } 
    else if (cus_m == "No"){
      print("Sorry, We will not discount your order")}
    else {
      print("Thank you") }
         
 
}

chatbot()
