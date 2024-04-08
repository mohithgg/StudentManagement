# Student Management Smart Contract

This Solidity smart contract is designed to manage student grades and marks. It provides functionalities to add grades and marks for students, as well as retrieve them. Additionally, it ensures that only valid inputs are accepted, such as valid grades and a maximum limit for the number of students.

## Features

- **Add Grade:** Allows adding a grade for a student identified by their ID.
- **Add Marks:** Allows adding marks for a student identified by their ID.
- **Retrieve Grade:** Retrieves the grade for a given student ID.
- **Retrieve Marks:** Retrieves the marks for a given student ID.
## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., StudentManagement.sol). Copy and paste the following code into the file:

```
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

contract StudentManagement{
    mapping(uint256=>string) public studentGrades;
    mapping(uint256=> uint256)public studentMarks;
    bool public _present=false;
    function addGrade(uint256 _id,string memory _grade)public {
        require(bytes(_grade).length<2,"It should be a charactre");
        if(_id>150){
            revert("Only 150 students are enrolled in the course");
        }
        studentGrades[_id]=_grade;
        _present=true;
    }
    function addMarks(uint256 _id, uint256 marks)public {
        assert(_id>0 && marks<=300);
        studentMarks[_id]=marks;
        _present=true;
    }
}
contract retrieveGrade is StudentManagement{
    function getGrade(uint256 _id, bool present) public view returns(string memory) {
        assert(_id>0);
        if(present==false){
            revert("No entries");
        }
        if(keccak256(bytes(studentGrades[_id]))==keccak256('A') || keccak256(bytes(studentGrades[_id]))==keccak256('B')){
            return studentGrades[_id];
        }
        else{
            return "Fail";
        }
        
    }

    function getMarks(uint256 _id, bool present) public view returns(uint){
        if(present==false){
            revert("No entries");
        }
        return studentMarks[_id];
    }

}
```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.18" (or another compatible version), and then click on the "Compile StudentManagement.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "StudentManagement" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact,

1. Use the `addGrade` function to add a grade for a student, providing their ID and the grade.
2. Use the `addMarks` function to add marks for a student, providing their ID and the marks.
3. Use the `getGrade` function to retrieve the grade for a student by providing their ID.
4. Use the `getMarks` function to retrieve the marks for a student by providing their ID.

## Authors

Mohith G 

Email - [m0hithgggg@gmail.com]

## License

This project is licensed under the [MIT] License - see the LICENSE.md file for details
