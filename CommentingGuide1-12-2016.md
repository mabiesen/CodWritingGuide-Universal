#Commenting Guide

Up-to-date as of 1/12/2017

This commenting guide was created with input from the following webpages:

* Hongkiat - http://www.hongkiat.com/blog/source-code-comment-styling-tips/ 
* Golang Blog - https://blog.golang.org/godoc-documenting-go-code

Commenting Requirements for Functions:

* (@func, @var, etc.)
* @desc -
* @params - Line explaining each parameter
* @return - Line explaining each return
* @type -
* @pkg -
* @requiredFuncs if applicable
* @src if obtained in whole from another source

Commenting Example Golang:
```Go
//@func - recurCompareInput
//@desc - Container function to wait for user to make the correct selection
//Note:  combined scan and switch functions to create this comprehensive func
//@params 1. comparator String
//@comparator is value user must match in order to move forward in program
//@params 2. successMsg String
//@successMsg is message displayed when user provides desired input.
//@return - none
//@type - none
//@pkg - "strings", "fmt", "bufio"
func recurCompareInput(comparator string, successMsg string){
		fmt.Println("Waiting for input...")
		reader1 := bufio.NewReader(os.Stdin)
		userInput, _ := reader1.ReadString('\n')
		theInput := strings.TrimSpace(userInput)  //trim space here because two spaces added to input??? why?
		switch theInput{
			case comparator: fmt.Println(successMsg)
			default:
				fmt.Println("That is not a valid input.  Please type ",comparator," to continue.")
				recurCompareInput(comparator, successMsg)
		}
}
```
