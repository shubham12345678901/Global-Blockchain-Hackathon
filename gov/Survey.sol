pragma solidity ^0.5.0;


contract Survey {
  struct option{
    uint id;
    string value;
    uint vote;
  }
  struct question{
    uint id;
    string value;
    uint numberOfOption;
    mapping(uint => option) options;
  }
  struct survey{
    uint id;
    string name;
    uint numberOfQuestion ;
    mapping(uint => question) questions;
  }
  mapping(uint => survey) surveys;   
    
  uint numberOfSurvey ;
  constructor() public {
  }

  function createOption(uint _optionId, string memory _optionValue, uint _questionId, uint _surveyId) public{
    surveys[_surveyId].questions[_questionId].options[_optionId] = option(_optionId, _optionValue, 0); 
  }

  function createQuestion(uint _surveyId, uint _questionId, string memory _questionValue, uint _numberOfOption) 
  public{
    surveys[_surveyId].questions[_questionId] = question(_questionId, _questionValue, _numberOfOption);
  }

  function createSurvey(uint _surveyId, string memory _surveyName, uint _numberOfQuestion) public {

    numberOfSurvey ++ ;
    surveys[numberOfSurvey] = survey(_surveyId, _surveyName, _numberOfQuestion);
  }
  

  function getSurvey(uint _surveyId) public view returns(string memory, uint)
  {
    require(_surveyId > 0 && _surveyId <= numberOfSurvey);
    return(surveys[_surveyId].name, surveys[_surveyId].numberOfQuestion);
  }

  function getQuestion(uint _questionId, uint _surveyId) public view returns(string memory, uint)
  {
    require(_surveyId > 0 && _surveyId <= numberOfSurvey);
    return (surveys[_surveyId].questions[_questionId].value, 
            surveys[_surveyId].questions[_questionId].numberOfOption) ;
  }

   function getOption(uint _optionId, uint _questionId, uint _surveyId) public view returns(string memory)
  {
    return surveys[_surveyId].questions[_questionId].options[_optionId].value;
  }
  function harshu() public view returns (string memory){
    return "Hi Harshita";
  }

}
