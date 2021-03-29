
window.validate = function() {
    alert('hi');
    var cardnum=document.getElementById('cardnumber').value
    
    var cardowner=document.getElementById('cardowner').value
    
    var year=document.getElementById('year').value
    
    var cvc=document.getElementById('cvc').value
    
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
 
