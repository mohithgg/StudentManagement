// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

contract StudentManagement{
    mapping(uint256=>string) public studentGrades;
    mapping(uint256=> uint256)public studentMarks;
    bool public _present=false;
    function addGrade(uint256 _id,string memory _grade)public {
        require(bytes(_grade).length<2,"It should be a single charactre");
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
