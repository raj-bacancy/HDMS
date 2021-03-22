
window.validate = function() {

    var cardnum=document.getElementById('cardnumber').value
    alert('cardnum = '+cardnum)
    var cardowner=document.getElementById('cardowner').value
    alert('cardowner = '+cardowner)
    var year=document.getElementById('year').value
    alert('year = '+year)
    var cvc=document.getElementById('cvc').value
    alert('cvc = '+cvc)
    var success=0;
    var startyear=2021;
    if(cardnum.length==16)
    {
        document.getElementById("cardnumerror").style.display = "none";
        success++;
    }else{
        document.getElementById("cardnumerror").style.display = "";
    }

    if(cardowner!=""){
        document.getElementById("cardownererror").style.display = "none";
        success++;
    }
    else{
        document.getElementById("cardownererror").style.display = "";
    }

    if(year>=startyear){
        document.getElementById("expyearerror").style.display = "none";
        success++;
    }
    else{
        document.getElementById("expyearerror").style.display = "";
    }

    if(cvc.length==3){
        document.getElementById("cvcerror").style.display = "none";
        success++;
    }
    else{
        document.getElementById("cvcerror").style.display = "";
    }

    if(success==4){
        return true
    }
    
    return false
}

window.isNumberKey = function(evt)
{

   var charCode = (evt.which) ? evt.which : evt.keyCode
   if (charCode > 31 && (charCode < 48 || charCode > 57)) {
       return false;
   }else{

    return true;
   }

}
 
