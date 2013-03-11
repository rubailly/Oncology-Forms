<htmlform> <!--
           Oncology Diagnosis, Staging and Treatment Plan
            Pilot_4July_v1.3NT
                Author:  
                Builder: Bailly RURANGIRWA 
                started on Aug 28, 2012                
        -->
<style>
th.tableHeader {
	background-color: #009d8e;
	color: #FFFFFF;
	font-size: 16px;
	text-align: left;
}

ul {
	list-style-type: square;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 11px;
}

tr.spaceUnder>td {
	padding-bottom: 1em;
}

td {
	font-size: 15px;
}

#container {
	position: relative;
	margin: auto;
	width: 1400px;
	height: auto;
}

@media print {
	#container {
		display: none;
	}
	#printArea {
		display: block;
	}
	#userBar {
		display: none;
	}
	#banner {
		display: none;
	}
	#footer {
		display: none;
	}
	#htmlFormEntryBanner {
		display: none;
	}
	.error {
		display: none;
	}
	.lables {
		width: 200px;
	}
	table {
		width: 100%;
	}
	table,td,th {
		border: 1px solid black;
		border-collapse: collapse;
	}
	th {
		text-align: left;
		background-color: #D9D9D9;
		font-size: 10px;
	}
	td {
		font-size: 10px;
	}
	.selectedCancerStagingKeys {
		page-break-before: always;
		border: 0px;
	}
	table.selectedCancerStagingKeys td {
		border: 0px;
	}
}

@media screen {
	table {
		border: 1px solid #DFDFDF;
		width: 100%;
		border-color: #009d8e;
	}
	#container {
		display: block;
	}
	#printArea {
		display: none;
	}
}
</style>

<script type="text/javascript">
if(jQuery){
 $j(document).ready(function(){
    if ( $j.browser.msie ) {
        $j(":checkbox").click(function(){
             $j(this).change();
     });
        }
    
    $j(".checkboxGroup").each(function(){
        var group = $j(this);
        var checked = group.find(":checked").closest("td").attr("id");
       
        var uncheckAll = function(){
            group.find("input[type$='checkbox']").attr("checked",false);
            group.find("input[type$='checkbox']").change();
        }
       
        var showSection = function(which){
        	if(which !=""){
        	var triggerIndex = which.substring(7);
        	var sectionId= "toggleble"+triggerIndex;
            $j(".togglebles").find("tbody[id$="+sectionId+"]").fadeIn(1000);
           }
        }
        
       
        
        var hideSection = function(which){
        	var sectionId= "toggleble"+which.substring(7);
            $j(".togglebles").find("tbody[id$="+sectionId+"]").hide();
        }      
        
    group.find("input[type$='checkbox']").click(function(){
    	if(typeof checked != "undefined")
    		hideSection(checked);
        uncheckAll();
        $j(this).siblings("input[type$='checkbox']").attr("checked",false);
        $j(this).attr("checked",true);
        checked = group.find(":checked").closest("td").attr("id");
        $j(this).change();
        showSection($j(this).closest("td").attr("id"));
    });
    
    });

 });
}
</script> 

<script type="text/javascript">
if(jQuery){
 $j(document).ready(function(){
    if ( $j.browser.msie ) {
        $j(":checkbox").click(function(){
             $j(this).change();
     });
 }
	var printableTables = ["breast","cervical","kaposi","head","gastric","colon","prostate","nephroblastoma","lung","otherSolid","hodgkin","burkitt","large","otherNHL","ALL","CML","multiple","metastatic","otherLiquid"];
	
	var hideStagingKeys = function(elementsToHide) {
		$j('.'+elementsToHide).slideToggle("fast");
     };
	
     //add a button to toggle staging keys
	for (var i = 0; i &lt; printableTables.length; i++) {
	    var lastRow=printableTables[i]+"CancerStagingKeys";
	    $j('.'+lastRow+':last').after('<tr><td colspan="6" style="text-align: right;"><button style="color: #FFF; background-color: #009D8E;" type="button" id="'+lastRow+'">Toggle Staging Keys</button></td></tr>');	
	    
	    $j('#'+lastRow).click(function () {
	    	hideStagingKeys(this.id);
	    	}); 
	    
	}
     
	var getURLParam = function(name) {
	    var results = new RegExp('[\\?&amp;]' + name + '=([^&amp;#]*)').exec(document.URL);
	    if(results == null)
	    	return;
	    return results[1] || 0;
	};
     
	var isEditMode = function() {
		if(getURLParam('mode') == 'EDIT')
			return true;
		else
			return false;
     };
     
     var isViewMode = function() {
    	 if(getURLParam('inPopup') == 'true')
    		 return true;
    	 else
    		 return false;
     };
	
	var setInnerHtml = function(elementId,contentToSet) {
		$j('#'+elementId).html(''+contentToSet); 
     };
	
     var hideOthers = function(elementToSkip) {
    	 for (var i = 0; i &lt; printableTables.length; i++) {
 		    var tableToHide=printableTables[i];
 		    if(tableToHide != elementToSkip)
 		       $j('#'+tableToHide).hide();     		    	
 		}
      };
      
      var appendStagingKeys = function(elementToAppend) { 
    	  if(typeof elementToAppend == null){
    		  $j('.selectedCancerStagingKeys').empty();
    		  return;
    	  }
    	  $j('.selectedCancerStagingKeys').empty();
    	  $j('.'+elementToAppend).clone().appendTo('.selectedCancerStagingKeys');        	  
       };
       
       var getValueOfChildSpan = function(parentId) { 
        return $j('#'+parentId).children("span").html();
       };
       
       var hasValue = function(elementId) { 
    	   if($j('#'+elementId).children("span").attr("class") == 'value')
               return true;
    	   else
    		   return false;
          };
       
       var ViewModeHandler = function(){};
       ViewModeHandler.prototype = {

    		    handleHeadingSection: function(finalDiagnosis) { //handle heading section
    		    	 setInnerHtml("finalDiagnosis", finalDiagnosis);
    		         setInnerHtml("date", getValueOfChildSpan('encounterDate'));
    		         setInnerHtml("locationPrintArea", getValueOfChildSpan('encounterLocation'));
    		         setInnerHtml("provider", getValueOfChildSpan('encounterProvider'));    		       
    		         setInnerHtml("managingDCA", document.getElementById('managingDCA.managingDCA').value);
    		         setInnerHtml("managingGP", document.getElementById('managingGP.managingGP').value);
    		    },
    		    
    			 handleBreastCancerSection: function() { //handle Breast cancer section
    				 hideOthers('breast');

    		 		setInnerHtml("rightBreastMass", getValueOfChildSpan('rightBreastMassObs'));
    		 		setInnerHtml("rightBreastMassSize1", getValueOfChildSpan('rightBreastMassSize1Obs'));
    		 		setInnerHtml("rightBreastMassSize2", getValueOfChildSpan('rightBreastMassSize2Obs'));
    		 	
    		 	if(hasValue('rightBreastMassMobilityMobile'))
    		 		setInnerHtml('rightBreastMassMobility','Mobile');
    		 	if(hasValue('rightBreastMassMobilityFixed'))
    		 		setInnerHtml('rightBreastMassMobility', 'Fixed');
    		 	
    		 	setInnerHtml('leftBreastMass', getValueOfChildSpan('leftBreastMassObs'));
    		 	setInnerHtml('leftBreastMassSize1', getValueOfChildSpan('leftBreastMassSize1Obs'));
    		 	setInnerHtml('leftBreastMassSize2', getValueOfChildSpan('leftBreastMassSize2Obs'));
    		 	
    		 	if(hasValue('leftBreastMassMobilityMobile'))
    		 		setInnerHtml('leftBreastMassMobility','Mobile');
    		     if(hasValue('leftBreastMassMobilityFixed'))
    		     	setInnerHtml('leftBreastMassMobility','Fixed');
    		 	
    		     setInnerHtml('diagnosisSkinChanges',getValueOfChildSpan('diagnosisSkinChangesObs'));
    		     setInnerHtml('diagnosisLymphadenopathy',getValueOfChildSpan('diagnosisLymphadenopathyObs'));
    		     setInnerHtml('diagnosisComments', getValueOfChildSpan('diagnosisCommentsObs'));
    		 	
    		     setInnerHtml('stageTNMT', getValueOfChildSpan('stageTNMTObs'));
    		     setInnerHtml('stageTNMN', getValueOfChildSpan('stageTNMNObs'));
    		     setInnerHtml('stageTNMM', getValueOfChildSpan('stageTNMMObs'));
    		 	
    		 	
    		 	if(hasValue('breastStageOS0'))
    		 		setInnerHtml('breastStageOS', '0');
    		 	if(hasValue('breastStageOS1'))
    		 		setInnerHtml('breastStageOS', 'I');
    		 	if(hasValue('breastStageOS2'))
    		 		setInnerHtml('breastStageOS', 'II');
    		 	if(hasValue('breastStageOS3'))
    		 		setInnerHtml('breastStageOS', 'III');
    		 	if(hasValue('breastStageOS4'))
    		 		setInnerHtml('breastStageOS', 'IV');
    		 	
    		 	
    		 	if(hasValue('breastStageCSEarly'))
    		 		setInnerHtml('breastStageCS', 'Early');
    		 	if(hasValue('breastStageCSLocallyAdvanced'))
    		 		setInnerHtml('breastStageCS', 'Locally advanced');
    		 	if(hasValue('breastStageCSMetastatic'))
    		 		setInnerHtml('breastStageCS', 'Metastatic');
    		 	
    		 	if(hasValue('breastStageERER+'))
    		 		setInnerHtml('breastStageER', 'ER+');
    		 	if(hasValue('breastStageERER-'))
    		 		setInnerHtml('breastStageER', 'ER-');
    		 	if(hasValue('breastStageERNotDetermined'))
    		 		setInnerHtml('breastStageER', 'Not determined');
    		 	
    		 	if(hasValue('breastStagePRPR+'))
    		 		setInnerHtml('breastStagePR', 'PR+');
    		 	if(hasValue('breastStagePRPR-'))
    		 		setInnerHtml('breastStagePR', 'PR-');
    		 	if(hasValue('breastStagePRNotDetermined'))
    		 		setInnerHtml('breastStagePR', 'Not determined');
    		 	
    		 	
    		 	if(hasValue('breastStageHIIHC+'))
    		 	    setInnerHtml('breastStageHI', 'HER2 IHC+');
    		 	if(hasValue('breastStageHIIHC-'))
    		 	    setInnerHtml('breastStageHI', 'HER2 IHC-');
    		 	if(hasValue('breastStageHINotDetermined'))
    		 	    setInnerHtml('breastStageHI', 'Not determined');
    		 	
    		 	if(hasValue('breastStageHFFISH+'))
    		 	    setInnerHtml('breastStageHF', 'HER2 FISH+');
    		 	if(hasValue('breastStageHFFISH-'))
    		 	    setInnerHtml('breastStageHF', 'HER2 FISH-');
    		 	if(hasValue('breastStageHFNotDetermined'))
    		 	    setInnerHtml('breastStageHF', 'Not determined'); 
    		 	
    		 	appendStagingKeys('breastCancerStagingKeys');
    			 },
    			 
    			 handleCervicalCancerSection: function() { //handle Cervical cancer section
    					hideOthers('cervical');
    					
    					setInnerHtml('cervicalMass', ''+getValueOfChildSpan('cervicalMassObs'));
    					setInnerHtml('cervicalMassSize1', ''+getValueOfChildSpan('cervicalMassSize1Obs'));
    					setInnerHtml('cervicalMassSize2', ''+getValueOfChildSpan('cervicalMassSize2Obs'));
    					setInnerHtml('cervicalDiagnosisComments', ''+getValueOfChildSpan('cervicalDiagnosisCommentsObs'));
    					
    					if(hasValue('cervicalStageOS0'))
    					    setInnerHtml('cervicalStageOS', '0');
    					if(hasValue('cervicalStageOSI'))
    					    setInnerHtml('cervicalStageOS', 'I');
    					if(hasValue('cervicalStageOSIA'))
    					    setInnerHtml('cervicalStageOS', 'IA');
    					if(hasValue('cervicalStageOSIB1'))
    					    setInnerHtml('cervicalStageOS', 'IB1');
    					if(hasValue('cervicalStageOSIB2'))
    					    setInnerHtml('cervicalStageOS', 'IB2');
    					if(hasValue('cervicalStageOSII'))
    					    setInnerHtml('cervicalStageOS', 'II');
    					if(hasValue('cervicalStageOSIII'))
    					    setInnerHtml('cervicalStageOS', 'III');
    					if(hasValue('cervicalStageOSIVA'))
    					    setInnerHtml('cervicalStageOS', 'IVA');
    					if(hasValue('cervicalStageOSIVB'))
    					    setInnerHtml('cervicalStageOS', 'IVB');
    					
    					appendStagingKeys('cervicalCancerStagingKeys');
    				},
    				
    				handleKarposiSection: function() { //handle karposi cancer section
    					 hideOthers('kaposi');
    					
    					setInnerHtml('kaposiMass', ''+getValueOfChildSpan('kaposiMassObs'));
    					setInnerHtml('kaposiMassSize1', ''+getValueOfChildSpan('kaposiMassSize1Obs'));
    					setInnerHtml('kaposiMassSize2', ''+getValueOfChildSpan('kaposiMassSize2Obs'));
    					setInnerHtml('kaposiDiagnosisComments', ''+getValueOfChildSpan('kaposiDiagnosisCommentsObs'));
    					
    					setInnerHtml('kaposiStageTIST', ''+getValueOfChildSpan('kaposiStageTISTObs'));
    					setInnerHtml('kaposiStageTISI', ''+getValueOfChildSpan('kaposiStageTISIObs'));
    					setInnerHtml('kaposiStageTISS', ''+getValueOfChildSpan('kaposiStageTISSObs'));
    					
    					if(hasValue('kaposiStageOS0'))
    					    setInnerHtml('kaposiStageOS', '0');
    					if(hasValue('kaposiStageOS1'))
    					    setInnerHtml('kaposiStageOS', 'I');
    					if(hasValue('kaposiStageOS2'))
    					    setInnerHtml('kaposiStageOS', 'II');
    					if(hasValue('kaposiStageOS3'))
    					    setInnerHtml('kaposiStageOS', 'III');
    					if(hasValue('kaposiStageOS4'))
    					    setInnerHtml('kaposiStageOS', 'IV');
    					
    					appendStagingKeys('kaposiCancerStagingKeys');
    				},
    				
    				handleHeadAndNeckSection: function() {//handle H and N cancer section
    					 hideOthers('head');
    					
    					if(hasValue('headCancerTypeSinuses'))
    					    setInnerHtml('headCancerType', 'Sinuses / Nasal cavity');
    					if(hasValue('headCancerTypeOral'))
    					    setInnerHtml('headCancerType', 'Oral cavity / Oropharynx/Hypopharynx');
    					if(hasValue('headCancerTypeLarynx'))
    					    setInnerHtml('headCancerType', 'Larynx');
    					if(hasValue('headCancerTypeNasopharynx'))
    					    setInnerHtml('headCancerType', 'Nasopharynx');
    					if(hasValue('headCancerTypeOther'))
    					    setInnerHtml('headCancerType', 'Other');
    					
    					setInnerHtml('headMass', ''+getValueOfChildSpan('headMassObs'));
    					setInnerHtml('headMassSize1', ''+getValueOfChildSpan('headMassSize1Obs'));
    					setInnerHtml('headMassSize2', ''+getValueOfChildSpan('headMassSize2Obs'));
    					setInnerHtml('headDiagnosisComments', ''+getValueOfChildSpan('headDiagnosisCommentsObs'));
    					
    					setInnerHtml('headStageTNMT', ''+getValueOfChildSpan('headStageTNMTObs'));
    					setInnerHtml('headStageTNMN', ''+getValueOfChildSpan('headStageTNMNObs'));
    					setInnerHtml('headStageTNMM', ''+getValueOfChildSpan('headStageTNMMObs'));
    					
    					if(hasValue('headStageOS0'))
    					    setInnerHtml('headStageOS', '0');
    					if(hasValue('headStageOS1'))
    					    setInnerHtml('headStageOS', 'I');
    					if(hasValue('headStageOS2'))
    					    setInnerHtml('headStageOS', 'II');
    					if(hasValue('headStageOS3'))
    					    setInnerHtml('headStageOS', 'III');
    					if(hasValue('headStageOS4'))
    					    setInnerHtml('headStageOS', 'IV');

    					appendStagingKeys('headCancerStagingKeys');
    				},
    				
    				handleGastricCancerSection: function() {//handle Gastric cancer section
    					 hideOthers('gastric');
    					
    					setInnerHtml('gastricMass', ''+getValueOfChildSpan('gastricMassObs'));
    					setInnerHtml('gastricMassSize1', ''+getValueOfChildSpan('gastricMassSize1Obs'));
    					setInnerHtml('gastricMassSize2', ''+getValueOfChildSpan('gastricMassSize2Obs'));
    					setInnerHtml('gastricDiagnosisComments', ''+getValueOfChildSpan('gastricDiagnosisCommentsObs'));
    					
    					setInnerHtml('gastricStageTNMT', ''+getValueOfChildSpan('gastricStageTNMTObs'));
    					setInnerHtml('gastricStageTNMN', ''+getValueOfChildSpan('gastricStageTNMNObs'));
    					setInnerHtml('gastricStageTNMM', ''+getValueOfChildSpan('gastricStageTNMMObs'));
    					
    					if(hasValue('gastricStageOS0'))
    					    setInnerHtml('gastricStageOS', '0');
    					if(hasValue('gastricStageOS1'))
    					    setInnerHtml('gastricStageOS', 'I');
    					if(hasValue('gastricStageOS2'))
    					    setInnerHtml('gastricStageOS', 'II');
    					if(hasValue('gastricStageOS3'))
    					    setInnerHtml('gastricStageOS', 'III');
    					if(hasValue('gastricStageOS4'))
    					    setInnerHtml('gastricStageOS', 'IV');
    					
    					if(hasValue('gastricStageHPPositive'))
    					    setInnerHtml('gastricStageHP', 'Positive');
    					if(hasValue('gastricStageHPNegative'))
    					    setInnerHtml('gastricStageHP', 'Negative');
    					if(hasValue('gastricStageHPNotDetermined'))
    					    setInnerHtml('gastricStageHP', 'Not determined');
    					
    					appendStagingKeys('gastricCancerStagingKeys');
    				},
    				
    				handleColonCancerSection: function() {//handle Colon cancer section
    					 hideOthers('colon');
    					
    					setInnerHtml('colonMass', ''+getValueOfChildSpan('colonMassObs'));
    					setInnerHtml('colonMassSize1', ''+getValueOfChildSpan('colonMassSize1Obs'));
    					setInnerHtml('colonMassSize2', ''+getValueOfChildSpan('colonMassSize2Obs'));
    					setInnerHtml('colonDiagnosisComments', ''+getValueOfChildSpan('colonDiagnosisCommentsObs'));
    					
    					setInnerHtml('colonStageTNMT', ''+getValueOfChildSpan('colonStageTNMTObs'));
    					setInnerHtml('colonStageTNMN', ''+getValueOfChildSpan('colonStageTNMNObs'));
    					setInnerHtml('colonStageTNMM', ''+getValueOfChildSpan('colonStageTNMMObs'));
    					
    					if(hasValue('colonStageOS0'))
    					    setInnerHtml('colonStageOS', '0');
    					if(hasValue('colonStageOS1'))
    					    setInnerHtml('colonStageOS', 'I');
    					if(hasValue('colonStageOS2'))
    					    setInnerHtml('colonStageOS', 'II');
    					if(hasValue('colonStageOS3'))
    					    setInnerHtml('colonStageOS', 'III');
    					if(hasValue('colonStageOS4'))
    					    setInnerHtml('colonStageOS', 'IV');
    					
    					appendStagingKeys('colonCancerStagingKeys');
    				},

    				handleProstateCancerSection: function() {//handle Prostate cancer section
    					 hideOthers('prostate');
    					
    					setInnerHtml('prostateMass', ''+getValueOfChildSpan('prostateMassObs'));
    					setInnerHtml('prostateMassSize1', ''+getValueOfChildSpan('prostateMassSize1Obs'));
    					setInnerHtml('prostateMassSize2', ''+getValueOfChildSpan('prostateMassSize2Obs'));
    					setInnerHtml('prostateDiagnosisComments', ''+getValueOfChildSpan('prostateDiagnosisCommentsObs'));
    					
    					setInnerHtml('prostateStageTNMT', ''+getValueOfChildSpan('prostateStageTNMTObs'));
    					setInnerHtml('prostateStageTNMN', ''+getValueOfChildSpan('prostateStageTNMNObs'));
    					setInnerHtml('prostateStageTNMM', ''+getValueOfChildSpan('prostateStageTNMMObs'));
    					
    					if(hasValue('prostateStageOS0'))
    					    setInnerHtml('prostateStageOS', '0');
    					if(hasValue('prostateStageOS1'))
    					    setInnerHtml('prostateStageOS', 'I');
    					if(hasValue('prostateStageOS2'))
    					    setInnerHtml('prostateStageOS', 'II');
    					if(hasValue('prostateStageOS3'))
    					    setInnerHtml('prostateStageOS', 'III');
    					if(hasValue('prostateStageOS4'))
    					    setInnerHtml('prostateStageOS', 'IV');
    					
    					appendStagingKeys('prostateCancerStagingKeys');
    				},
    				
    				handleNephroblastomaCancerSection: function() {//handle Nephroblastoma cancer section
    					 hideOthers('nephroblastoma');
    					
    					setInnerHtml('nephroblastomaMass', ''+getValueOfChildSpan('nephroblastomaMassObs'));
    					setInnerHtml('nephroblastomaMassSize1', ''+getValueOfChildSpan('nephroblastomaMassSize1Obs'));
    					setInnerHtml('nephroblastomaMassSize2', ''+getValueOfChildSpan('nephroblastomaMassSize2Obs'));
    					setInnerHtml('nephroblastomaDiagnosisComments', ''+getValueOfChildSpan('nephroblastomaDiagnosisCommentsObs'));
    					
    					if(hasValue('nephroblastomaStageOS0'))
    					    setInnerHtml('nephroblastomaStageOS', '0');
    					if(hasValue('nephroblastomaStageOS1'))
    					    setInnerHtml('nephroblastomaStageOS', 'I');
    					if(hasValue('nephroblastomaStageOS2'))
    					    setInnerHtml('nephroblastomaStageOS', 'II');
    					if(hasValue('nephroblastomaStageOS3'))
    					    setInnerHtml('nephroblastomaStageOS', 'III');
    					if(hasValue('nephroblastomaStageOS4'))
    					    setInnerHtml('nephroblastomaStageOS', 'IV');
    					if(hasValue('nephroblastomaStageOS5'))
    					    setInnerHtml('nephroblastomaStageOS', 'V');
    					
    					appendStagingKeys('nephroblastomaCancerStagingKeys');
    				},

    				handleLungCancerSection: function() {//handle Lung cancer section
    					 hideOthers('lung');
    					 	
    					if(hasValue('lungCancerTypeSmallCell'))
    					    setInnerHtml('lungCancerType', 'Small cell lung cancer');
    					if(hasValue('lungCancerTypeNonSmall'))
    					    setInnerHtml('lungCancerType', 'Non-small cell lung cancer');
    					
    					setInnerHtml('lungMass', ''+getValueOfChildSpan('lungMassObs'));
    					setInnerHtml('lungMassSize1', ''+getValueOfChildSpan('lungMassSize1Obs'));
    					setInnerHtml('lungMassSize2', ''+getValueOfChildSpan('lungMassSize2Obs'));
    					setInnerHtml('lungDiagnosisComments', ''+getValueOfChildSpan('lungDiagnosisCommentsObs'));
    					
    					if(hasValue('lungSmallCellLimited'))
    					    setInnerHtml('lungSmallCell', 'Limited stage');
    					if(hasValue('lungSmallCellExtensive'))
    					    setInnerHtml('lungSmallCell', 'Extensive stage');
    					
    					setInnerHtml('lungStageTNMT', ''+getValueOfChildSpan('lungStageTNMTObs'));
    					setInnerHtml('lungStageTNMN', ''+getValueOfChildSpan('lungStageTNMNObs'));
    					setInnerHtml('lungStageTNMM', ''+getValueOfChildSpan('lungStageTNMMObs'));
    					
    					if(hasValue('lungStageOS0'))
    					    setInnerHtml('lungStageOS', '0');
    					if(hasValue('lungStageOS1'))
    					    setInnerHtml('lungStageOS', 'I');
    					if(hasValue('lungStageOS2'))
    					    setInnerHtml('lungStageOS', 'II');
    					if(hasValue('lungStageOS3A'))
    					    setInnerHtml('lungStageOS', 'III-A');
    					if(hasValue('lungStageOS3B'))
    					    setInnerHtml('lungStageOS', 'III-B ');
    					if(hasValue('lungStageOS4'))
    					    setInnerHtml('lungStageOS', 'IV');
    					
    					appendStagingKeys('lungCancerStagingKeys');
    				},

    				handleOtherSolidCancerSection: function() {//handle other solid cancer section
    					 hideOthers('otherSolid');
    					
    					setInnerHtml('otherSolidMass', ''+getValueOfChildSpan('otherSolidMassObs'));
    					setInnerHtml('otherSolidMassSize1', ''+getValueOfChildSpan('otherSolidMassSize1Obs'));
    					setInnerHtml('otherSolidMassSize2', ''+getValueOfChildSpan('otherSolidMassSize2Obs'));
    					setInnerHtml('otherSolidDiagnosisComments', ''+getValueOfChildSpan('otherSolidDiagnosisCommentsObs'));
    					
    					setInnerHtml('otherSolidStageTNMT', ''+getValueOfChildSpan('otherSolidStageTNMTObs'));
    					setInnerHtml('otherSolidStageTNMN', ''+getValueOfChildSpan('otherSolidStageTNMNObs'));
    					setInnerHtml('otherSolidStageTNMM', ''+getValueOfChildSpan('otherSolidStageTNMMObs'));
    					
    					if(hasValue('otherSolidStageOS0'))
    					    setInnerHtml('otherSolidStageOS', '0');
    					if(hasValue('otherSolidStageOS1'))
    					    setInnerHtml('otherSolidStageOS', 'I');
    					if(hasValue('otherSolidStageOS2'))
    					    setInnerHtml('otherSolidStageOS', 'II');
    					if(hasValue('otherSolidStageOS3'))
    					    setInnerHtml('otherSolidStageOS', 'III');
    					if(hasValue('otherSolidStageOS4'))
    					    setInnerHtml('otherSolidStageOS', 'IV');
    				},
    				
    				handleHodgkinCancerSection: function() {//handle Hodgkin cancer section
    					 hideOthers('hodgkin');
    					 	
    					setInnerHtml('hodgkinMass', ''+getValueOfChildSpan('hodgkinMassObs'));
    					setInnerHtml('hodgkinMassSize1', ''+getValueOfChildSpan('hodgkinMassSize1Obs'));
    					setInnerHtml('hodgkinMassSize2', ''+getValueOfChildSpan('hodgkinMassSize2Obs'));
    					setInnerHtml('hodgkinDiagnosisComments', ''+getValueOfChildSpan('hodgkinDiagnosisCommentsObs'));
    					
    					if(hasValue('hodgkinStageOS0'))
    					    setInnerHtml('hodgkinStageOS', '0');
    					if(hasValue('hodgkinStageOS1'))
    					    setInnerHtml('hodgkinStageOS', 'I');
    					if(hasValue('hodgkinStageOS2'))
    					    setInnerHtml('hodgkinStageOS', 'II');
    					if(hasValue('hodgkinStageOS3'))
    					    setInnerHtml('hodgkinStageOS', 'III');
    					if(hasValue('hodgkinStageOS4'))
    					    setInnerHtml('hodgkinStageOS', 'IV');
    					
    					if(hasValue('hodgkinStageBulkyYes'))
    					    setInnerHtml('hodgkinStageBulky', 'Yes');
    					if(hasValue('hodgkinStageBulkyNo'))
    					    setInnerHtml('hodgkinStageBulky', 'No');
    					if(hasValue('hodgkinStageBulkyNotDetermined'))
    					    setInnerHtml('hodgkinStageBulky', 'Not determined');
    					
    					if(hasValue('hodgkinStageSymptomaticNoBSymptoms'))
    					    setInnerHtml('hodgkinStageSymptomatic', 'No B symptoms');
    					if(hasValue('hodgkinStageSymptomaticBSymptoms'))
    					    setInnerHtml('hodgkinStageSymptomatic', 'B symptoms present');
    					
    					appendStagingKeys('hodgkinCancerStagingKeys');
    				},

    				handleBurkittCancerSection: function() {//handle Burkitt cancer section
    					 hideOthers('burkitt');
    					
    					setInnerHtml('burkittMass', ''+getValueOfChildSpan('burkittMassObs'));
    					setInnerHtml('burkittMassSize1', ''+getValueOfChildSpan('burkittMassSize1Obs'));
    					setInnerHtml('burkittMassSize2', ''+getValueOfChildSpan('burkittMassSize2Obs'));
    					setInnerHtml('burkittDiagnosisComments', ''+getValueOfChildSpan('burkittDiagnosisCommentsObs'));
    					
    					if(hasValue('burkittStageOS0'))
    					    setInnerHtml('burkittStageOS', '0');
    					if(hasValue('burkittStageOS1'))
    					    setInnerHtml('burkittStageOS', 'I');
    					if(hasValue('burkittStageOS2'))
    					    setInnerHtml('burkittStageOS', 'II');
    					if(hasValue('burkittStageOS3'))
    					    setInnerHtml('burkittStageOS', 'III');
    					if(hasValue('burkittStageOS4'))
    					    setInnerHtml('burkittStageOS', 'IV');
    					
    					if(hasValue('burkittStageBulkyYes'))
    					    setInnerHtml('burkittStageBulky', 'Yes');
    					if(hasValue('burkittStageBulkyNo'))
    					    setInnerHtml('burkittStageBulky', 'No');
    					if(hasValue('burkittStageBulkyNotDetermined'))
    					    setInnerHtml('burkittStageBulky', 'Not determined');
    					
    					if(hasValue('burkittStageSymptomaticNoBSymptoms'))
    					    setInnerHtml('burkittStageSymptomatic', 'No B symptoms');
    					if(hasValue('burkittStageSymptomaticBSymptoms'))
    					    setInnerHtml('burkittStageSymptomatic', 'B symptoms present');
    					
    					appendStagingKeys('burkittCancerStagingKeys');
    				},

    				handleLargeBCellCancerSection: function() {//handle large B cell cancer section
    					 hideOthers('large');
    					
    					setInnerHtml('largeMass', ''+getValueOfChildSpan('largeMassObs'));
    					setInnerHtml('largeMassSize1', ''+getValueOfChildSpan('largeMassSize1Obs'));
    					setInnerHtml('largeMassSize2', ''+getValueOfChildSpan('largeMassSize2Obs'));
    					setInnerHtml('largeDiagnosisComments', ''+getValueOfChildSpan('largeDiagnosisCommentsObs'));
    					
    					if(hasValue('largeStageOS0'))
    					    setInnerHtml('largeStageOS', '0');
    					if(hasValue('largeStageOS1'))
    					    setInnerHtml('largeStageOS', 'I');
    					if(hasValue('largeStageOS2'))
    					    setInnerHtml('largeStageOS', 'II');
    					if(hasValue('largeStageOS3'))
    					    setInnerHtml('largeStageOS', 'III');
    					if(hasValue('largeStageOS4'))
    					    setInnerHtml('largeStageOS', 'IV');
    					
    					if(hasValue('largeStageBulkyYes'))
    					    setInnerHtml('largeStageBulky', 'Yes');
    					if(hasValue('largeStageBulkyNo'))
    					    setInnerHtml('largeStageBulky', 'No');
    					if(hasValue('largeStageBulkyNotDetermined'))
    					    setInnerHtml('largeStageBulky', 'Not determined');
    					
    					if(hasValue('largeStageSymptomaticNoBSymptoms'))
    					    setInnerHtml('largeStageSymptomatic', 'No B symptoms');
    					if(hasValue('largeStageSymptomaticBSymptoms'))
    					    setInnerHtml('largeStageSymptomatic', 'B symptoms present');
    					
    					appendStagingKeys('largeCancerStagingKeys');
    				},

    				handleNHLCancerSection: function() {//handle NHL cancer section
    					 hideOthers('otherNHL');
    					
    					setInnerHtml('otherNHLMass', ''+getValueOfChildSpan('otherNHLMassObs'));
    					setInnerHtml('otherNHLMassSize1', ''+getValueOfChildSpan('otherNHLMassSize1Obs'));
    					setInnerHtml('otherNHLMassSize2', ''+getValueOfChildSpan('otherNHLMassSize2Obs'));
    					setInnerHtml('otherNHLDiagnosisComments', ''+getValueOfChildSpan('otherNHLDiagnosisCommentsObs'));
    					
    					if(hasValue('otherNHLStageOS0'))
    					    setInnerHtml('otherNHLStageOS', '0');
    					if(hasValue('otherNHLStageOS1'))
    					    setInnerHtml('otherNHLStageOS', 'I');
    					if(hasValue('otherNHLStageOS2'))
    					    setInnerHtml('otherNHLStageOS', 'II');
    					if(hasValue('otherNHLStageOS3'))
    					    setInnerHtml('otherNHLStageOS', 'III');
    					if(hasValue('otherNHLStageOS4'))
    					    setInnerHtml('otherNHLStageOS', 'IV');
    					
    					if(hasValue('otherNHLStageBulkyYes'))
    					    setInnerHtml('otherNHLStageBulky', 'Yes');
    					if(hasValue('otherNHLStageBulkyNo'))
    					    setInnerHtml('otherNHLStageBulky', 'No');
    					if(hasValue('otherNHLStageBulkyNotDetermined'))
    					    setInnerHtml('otherNHLStageBulky', 'Not determined');
    					
    					if(hasValue('otherNHLStageSymptomaticNoBSymptoms'))
    					    setInnerHtml('otherNHLStageSymptomatic', 'No B symptoms');
    					if(hasValue('otherNHLStageSymptomaticBSymptoms'))
    					    setInnerHtml('otherNHLStageSymptomatic', 'B symptoms present');
    					
    					appendStagingKeys('otherNHLCancerStagingKeys');
    				},

    				handleALLCancerSection: function() {//handle ALL cancer section
    					 hideOthers('ALL');
    					
    					setInnerHtml('ALLDiagnosisComments', ''+getValueOfChildSpan('ALLDiagnosisCommentsObs'));
    					

    					if(hasValue('ALLStageLowRisk'))
    					    setInnerHtml('ALLStage', 'Low risk');
    					if(hasValue('ALLStageMediumRisk'))
    					    setInnerHtml('ALLStage', 'Medium risk');
    					if(hasValue('ALLStageHighRisk'))
    					    setInnerHtml('ALLStage', 'High risk (always when Ph+, infant)');
    					if(hasValue('ALLStageVeryHighRisk'))
    					    setInnerHtml('ALLStage', 'Very High risk');
    					
    					if(hasValue('ALLStagePhStatusPh+'))
    					    setInnerHtml('ALLStagePhStatus', 'Ph+');
    					if(hasValue('ALLStagePhStatusPh-'))
    					    setInnerHtml('ALLStagePhStatus', 'Ph-');
    					if(hasValue('ALLStagePhStatusNotDetermined'))
    					    setInnerHtml('ALLStagePhStatus', 'not determined');
    					 
    				},
    				handleCMLCancerSection: function() {//handle CML cancer section
    					 hideOthers('CML');
    					
    					setInnerHtml('CMLDiagnosisComments', ''+getValueOfChildSpan('CMLDiagnosisCommentsObs'));
    					
    				 	
    					if(hasValue('CMLStageChronicPhase'))
    					    setInnerHtml('CMLStage', 'Chronic phase');
    					if(hasValue('CMLStageAcceleratedPhase'))
    					    setInnerHtml('CMLStage', 'Accelerated phase');
    					if(hasValue('CMLStageBlastCrisis'))
    					    setInnerHtml('CMLStage', 'Blast crisis');
    					
    					if(hasValue('CMLStageCytogeneticsTPositive'))
    					    setInnerHtml('CMLStageCytogenetics', 't(9,22)+');
    					if(hasValue('CMLStageCytogeneticsT-'))
    					    setInnerHtml('CMLStageCytogenetics', 't(9,22)-');
    					if(hasValue('CMLStageCytogeneticsNotDetermined'))
    					    setInnerHtml('CMLStageCytogenetics', 'not determined');
    					
    					
    					appendStagingKeys('CMLCancerStagingKeys');
    				},

    				handleMultipleMyelomaCancerSection: function() {//handle Multiple Myeloma cancer section
    					 
    					 hideOthers('multiple');
    					    
    					    setInnerHtml('multipleMass', ''+getValueOfChildSpan('multipleMassObs'));
    					setInnerHtml('multipleMassSize1', ''+getValueOfChildSpan('multipleMassSize1Obs'));
    					setInnerHtml('multipleMassSize2', ''+getValueOfChildSpan('multipleMassSize2Obs'));
    					setInnerHtml('multipleDiagnosisComments', ''+getValueOfChildSpan('multipleDiagnosisCommentsObs'));
    					
    					if(hasValue('multipleStageOS0'))
    					    setInnerHtml('multipleStageOS', '0');
    					if(hasValue('multipleStageOS1'))
    					    setInnerHtml('multipleStageOS', 'I');
    					if(hasValue('multipleStageOS2'))
    					    setInnerHtml('multipleStageOS', 'II');
    					if(hasValue('multipleStageOS3'))
    					    setInnerHtml('multipleStageOS', 'III');
    					
    					if(hasValue('multipleSubclassificationA'))
    					    setInnerHtml('multipleSubclassification', 'A: relatively normal renal function (serum creatinine value &lt; 2.0 mg/dl) ');
    					if(hasValue('multipleSubclassificationB'))
    					    setInnerHtml('multipleSubclassification', 'B: abnomal renal function (serum creatinine &gt; 2.0 mg/dl) ');
    					
    					appendStagingKeys('multipleCancerStagingKeys');
    					 
    				},

    				handleMetastaticCancerSection: function() {//handle Metastatic cancer section
    					 hideOthers('metastatic');
    					 	
    				    setInnerHtml('metastaticDiagnosisComments', ''+getValueOfChildSpan('metastaticDiagnosisCommentsObs'));
    					
    					if(hasValue('metastaticStageOS0'))
    					    setInnerHtml('metastaticStageOS', '0');
    					if(hasValue('metastaticStageOS1'))
    					    setInnerHtml('metastaticStageOS', 'I');
    					if(hasValue('metastaticStageOS2'))
    					    setInnerHtml('metastaticStageOS', 'II');
    					if(hasValue('metastaticStageOS3'))
    					    setInnerHtml('metastaticStageOS', 'III');
    					if(hasValue('metastaticStageOS4'))
    					    setInnerHtml('metastaticStageOS', 'IV');
    					
    					appendStagingKeys(null);
    				},

    				handleOtherLiquidCancerSection: function() {//handle Other Liquid cancer section
    					 hideOthers('otherLiquid');		 
    					setInnerHtml('otherLiquidDiagnosisComments', ''+getValueOfChildSpan('otherLiquidDiagnosisCommentsObs'));
    					setInnerHtml('otherLiquidStageOS', ''+getValueOfChildSpan('otherLiquidStageOSObs'));
    					appendStagingKeys(null);
    				},
    				
    				handleAllergiesSection: function() {//handle Allergies section
    					
    					$j('#existingAndNewAllergiesPrintView tr:gt(2)').remove();
    				    
    					$j('#existingAndNewAllergiesScreenView tr.existingAllergy').appendTo('#existingAndNewAllergiesPrintView');   
    				    
    				    if(hasValue('firstAllergyCauses')){
    				    	$j('#newAllergiesHeading tr').appendTo('#existingAndNewAllergiesPrintView');  
    				    	$j('#existingAndNewAllergiesPrintView').append('<tr><td>'+getValueOfChildSpan('firstAllergyCauses')+'</td><td>'+getValueOfChildSpan('firstAllergyReaction')+'</td><td>'+getValueOfChildSpan('firstAllergyYear')+'</td></tr>');
    				    
    				    }
    				  	 
    				    if(hasValue('secondAllergyCauses')){
    				    	$j('#existingAndNewAllergiesPrintView').append('<tr><td>'+getValueOfChildSpan('secondAllergyCauses')+'</td><td>'+getValueOfChildSpan('secondAllergyReaction')+'</td><td>'+getValueOfChildSpan('secondAllergyYear')+'</td></tr>');
    				        
    				        }
    				    
    				    if(hasValue('thirdAllergyCauses')){
    				    	$j('#existingAndNewAllergiesPrintView').append('<tr><td>'+getValueOfChildSpan('thirdAllergyCauses')+'</td><td>'+getValueOfChildSpan('thirdAllergyReaction')+'</td><td>'+getValueOfChildSpan('thirdAllergyYear')+'</td></tr>');
    				        
    				        }
    				},
    				
    				handleTreatmentItentSection: function() {//handle Treatment Intent section
    				   	
    				   	if(hasValue('treatmentCurative')){
    				   		setInnerHtml('treatmentIntent', 'Curative');
    				   	}
    				       if(hasValue('treatmentPalliative')){
    				       	setInnerHtml('treatmentIntent', 'Palliative systemic therapy');
    				   	}
    				       if(hasValue('treatmentPalliation')){
    				       	setInnerHtml('treatmentIntent', 'Palliation ONLY');
    				   	}
    				},
    				
    				handleTreatmentPlanSection: function() {//handle Treatment Plan section
    				    /*  now that we are going to play with the treatment plan sections (i.e surgery, radiation and chemotherapy) 
    				    we need to initisalize them to hidden state and we'll be toggling them one by one according to whether a section is selected or not */
    				    $j('#surgeryTreatmentPlan').hide();
    				    $j('#radiationTreatmentPlan').hide();
    				    $j('#chemotherapyTreatmentPlan').hide(); 
    				   
    				  //handle surgery section if selected
    				    if(hasValue('trigger21')){
    				    	$j('#surgeryTreatmentPlan').show();
    						setInnerHtml('surgeryFacility', ''+getValueOfChildSpan('surgeryFacilityObs'));
    						setInnerHtml('surgeryStartDate', ''+getValueOfChildSpan('surgeryStartDateObs'));
    						setInnerHtml('surgeryType', ''+getValueOfChildSpan('surgeryTypeObs'));
    					}

    				    //handle radiation section if selected
    				    if(hasValue('trigger22')){
    				    	$j('#radiationTreatmentPlan').show();
    						setInnerHtml('radiationFacility', ''+getValueOfChildSpan('radiationFacilityObs'));
    						setInnerHtml('radiationStartDate', ''+getValueOfChildSpan('radiationStartDateObs'));

    					}
    				    
    				  //handle chemotherapy section if selected
    				    if(hasValue('trigger23')){
    				    	$j('#chemotherapyTreatmentPlan').show();
    						setInnerHtml('chemotherapyRegimen', ''+getValueOfChildSpan('chemotherapyRegimenObs'));
    						setInnerHtml('chemotherapyCycles', ''+getValueOfChildSpan('chemotherapyCyclesObs'));
    						setInnerHtml('chemotherapyFirstCycle', ''+getValueOfChildSpan('chemotherapyFirstCycleObs'));
    						setInnerHtml('chemotherapyRegimenEnd', ''+getValueOfChildSpan('chemotherapyRegimenEndObs'));
    						setInnerHtml('chemotherapyStandardRegimen', ''+getValueOfChildSpan('chemotherapyStandardRegimenObs'));

    					}
    				},
       }
       
       
       //this class contains methods used to handle printing of this form while in the EDIT or ENTER mode 
	var EditModeHandler = function(){};
	EditModeHandler.prototype = {

	    handleHeadingSection: function(finalDiagnosis) { //handle heading section
	         setInnerHtml("finalDiagnosis", finalDiagnosis);
	         setInnerHtml("date", $j.datepicker.formatDate('dd/M/yy', new Date(getValue('encounterDate.value'))));
	         setInnerHtml("locationPrintArea", $j('#encounterLocation option:selected').text());
	         setInnerHtml("provider", $j('#encounterProvider option:selected').text());
	         setInnerHtml("managingDCA", getValue('managingDCA.managingDCA.value')+' '+getValue('managingDCA.newRelationship.value'));
	         setInnerHtml("managingGP", getValue('managingGP.managingGP.value')+' '+getValue('managingGP.newRelationship.value'));
	    },
	
	 handleBreastCancerSection: function() { //handle Breast cancer section
		 hideOthers('breast');

 		setInnerHtml("rightBreastMass", getValue('rightBreastMassObs.value'));
 		setInnerHtml("rightBreastMassSize1", getValue('rightBreastMassSize1Obs.value'));
 		setInnerHtml("rightBreastMassSize2", getValue('rightBreastMassSize2Obs.value'));
 	
 	
 	if(getValue('rightBreastMassMobilityMobile.value') !=null )
 		setInnerHtml('rightBreastMassMobility','Mobile');
 	if(getValue('rightBreastMassMobilityFixed.value') !=null )
 		setInnerHtml('rightBreastMassMobility', 'Fixed');
 	
 	setInnerHtml('leftBreastMass', getValue('leftBreastMassObs.value'));
 	setInnerHtml('leftBreastMassSize1', getValue('leftBreastMassSize1Obs.value'));
 	setInnerHtml('leftBreastMassSize2', getValue('leftBreastMassSize2Obs.value'));
 	
 	if(getValue('leftBreastMassMobilityMobile.value') !=null )
 		setInnerHtml('leftBreastMassMobility','Mobile');
     if(getValue('leftBreastMassMobilityFixed.value') !=null )
     	setInnerHtml('leftBreastMassMobility','Fixed');
 	
     setInnerHtml('diagnosisSkinChanges',getValue('diagnosisSkinChangesObs.value'));
     setInnerHtml('diagnosisLymphadenopathy',getValue('diagnosisLymphadenopathyObs.value'));
     setInnerHtml('diagnosisComments', getValue('diagnosisCommentsObs.value'));
 	
     setInnerHtml('stageTNMT', $j('#stageTNMTObs option:selected').text());
     setInnerHtml('stageTNMN', $j('#stageTNMNObs option:selected').text());
     setInnerHtml('stageTNMM', $j('#stageTNMMObs option:selected').text());
 	
 	
 	if(getValue('breastStageOS0.value') !=null )
 		setInnerHtml('breastStageOS', '0');
 	if(getValue('breastStageOS1.value') !=null )
 		setInnerHtml('breastStageOS', 'I');
 	if(getValue('breastStageOS2.value') !=null )
 		setInnerHtml('breastStageOS', 'II');
 	if(getValue('breastStageOS3.value') !=null )
 		setInnerHtml('breastStageOS', 'III');
 	if(getValue('breastStageOS4.value') !=null )
 		setInnerHtml('breastStageOS', 'IV');
 	
 	
 	if(getValue('breastStageCSEarly.value') !=null )
 		setInnerHtml('breastStageCS', 'Early');
 	if(getValue('breastStageCSLocallyAdvanced.value') !=null )
 		setInnerHtml('breastStageCS', 'Locally advanced');
 	if(getValue('breastStageCSMetastatic.value') !=null )
 		setInnerHtml('breastStageCS', 'Metastatic');
 	
 	if(getValue('breastStageERER+.value') !=null )
 		setInnerHtml('breastStageER', 'ER+');
 	if(getValue('breastStageERER-.value') !=null )
 		setInnerHtml('breastStageER', 'ER-');
 	if(getValue('breastStageERNotDetermined.value') !=null )
 		setInnerHtml('breastStageER', 'Not determined');
 	
 	if(getValue('breastStagePRPR+.value') !=null )
 		setInnerHtml('breastStagePR', 'PR+');
 	if(getValue('breastStagePRPR-.value') !=null )
 		setInnerHtml('breastStagePR', 'PR-');
 	if(getValue('breastStagePRNotDetermined.value') !=null )
 		setInnerHtml('breastStagePR', 'Not determined');
 	
 	
 	if(getValue('breastStageHIIHC+.value') !=null )
 	    setInnerHtml('breastStageHI', 'HER2 IHC+');
 	if(getValue('breastStageHIIHC-.value') !=null )
 	    setInnerHtml('breastStageHI', 'HER2 IHC-');
 	if(getValue('breastStageHINotDetermined.value') !=null )
 	    setInnerHtml('breastStageHI', 'Not determined');
 	
 	if(getValue('breastStageHFFISH+.value') !=null )
 	    setInnerHtml('breastStageHF', 'HER2 FISH+');
 	if(getValue('breastStageHFFISH-.value') !=null )
 	    setInnerHtml('breastStageHF', 'HER2 FISH-');
 	if(getValue('breastStageHFNotDetermined.value') !=null )
 	    setInnerHtml('breastStageHF', 'Not determined'); 
 	
 	appendStagingKeys('breastCancerStagingKeys');
	 },
	 
	 handleCervicalCancerSection: function() { //handle Cervical cancer section
			hideOthers('cervical');
    		
	    	setInnerHtml('cervicalMass', ''+getValue('cervicalMassObs.value'));
	    	setInnerHtml('cervicalMassSize1', ''+getValue('cervicalMassSize1Obs.value'));
	    	setInnerHtml('cervicalMassSize2', ''+getValue('cervicalMassSize2Obs.value'));
	    	setInnerHtml('cervicalDiagnosisComments', ''+getValue('cervicalDiagnosisCommentsObs.value'));
	    	
	    	if(getValue('cervicalStageOS0.value') !=null )
	    	    setInnerHtml('cervicalStageOS', '0');
	    	if(getValue('cervicalStageOSI.value') !=null )
	    	    setInnerHtml('cervicalStageOS', 'I');
	    	if(getValue('cervicalStageOSIA.value') !=null )
	    	    setInnerHtml('cervicalStageOS', 'IA');
	    	if(getValue('cervicalStageOSIB1.value') !=null )
	    	    setInnerHtml('cervicalStageOS', 'IB1');
	    	if(getValue('cervicalStageOSIB2.value') !=null )
	    	    setInnerHtml('cervicalStageOS', 'IB2');
	    	if(getValue('cervicalStageOSII.value') !=null )
	    	    setInnerHtml('cervicalStageOS', 'II');
	    	if(getValue('cervicalStageOSIII.value') !=null )
	    	    setInnerHtml('cervicalStageOS', 'III');
	    	if(getValue('cervicalStageOSIVA.value') !=null )
	    	    setInnerHtml('cervicalStageOS', 'IVA');
	    	if(getValue('cervicalStageOSIVB.value') !=null )
	    	    setInnerHtml('cervicalStageOS', 'IVB');
	    	
	    	appendStagingKeys('cervicalCancerStagingKeys');
	 },
	 
	 handleKarposiSection: function() { //handle karposi cancer section
		 hideOthers('kaposi');
 		
 		setInnerHtml('kaposiMass', ''+getValue('kaposiMassObs.value'));
     	setInnerHtml('kaposiMassSize1', ''+getValue('kaposiMassSize1Obs.value'));
     	setInnerHtml('kaposiMassSize2', ''+getValue('kaposiMassSize2Obs.value'));
     	setInnerHtml('kaposiDiagnosisComments', ''+getValue('kaposiDiagnosisCommentsObs.value'));
     	
     	setInnerHtml('kaposiStageTIST', ''+$j('#kaposiStageTISTObs option:selected').text());
     	setInnerHtml('kaposiStageTISI', ''+$j('#kaposiStageTISIObs option:selected').text());
     	setInnerHtml('kaposiStageTISS', ''+$j('#kaposiStageTISSObs option:selected').text());
     	
     	if(getValue('kaposiStageOS0.value') !=null )
     	    setInnerHtml('kaposiStageOS', '0');
     	if(getValue('kaposiStageOS1.value') !=null )
     	    setInnerHtml('kaposiStageOS', 'I');
     	if(getValue('kaposiStageOS2.value') !=null )
     	    setInnerHtml('kaposiStageOS', 'II');
     	if(getValue('kaposiStageOS3.value') !=null )
     	    setInnerHtml('kaposiStageOS', 'III');
     	if(getValue('kaposiStageOS4.value') !=null )
     	    setInnerHtml('kaposiStageOS', 'IV');
     	
     	appendStagingKeys('kaposiCancerStagingKeys');
	 },
	 
	 handleHeadAndNeckSection: function() {//handle H and N cancer section
		 hideOthers('head');
 		
 		if(getValue('headCancerTypeSinuses.value') !=null )
     	    setInnerHtml('headCancerType', 'Sinuses / Nasal cavity');
     	if(getValue('headCancerTypeOral.value') !=null )
     	    setInnerHtml('headCancerType', 'Oral cavity / Oropharynx/Hypopharynx');
     	if(getValue('headCancerTypeLarynx.value') !=null )
     	    setInnerHtml('headCancerType', 'Larynx');
     	if(getValue('headCancerTypeNasopharynx.value') !=null )
     	    setInnerHtml('headCancerType', 'Nasopharynx');
     	if(getValue('headCancerTypeOther.value') !=null )
     	    setInnerHtml('headCancerType', 'Other');
     	
     	setInnerHtml('headMass', ''+getValue('headMassObs.value'));
     	setInnerHtml('headMassSize1', ''+getValue('headMassSize1Obs.value'));
     	setInnerHtml('headMassSize2', ''+getValue('headMassSize2Obs.value'));
     	setInnerHtml('headDiagnosisComments', ''+getValue('headDiagnosisCommentsObs.value'));
     	
     	setInnerHtml('headStageTNMT', ''+$j('#headStageTNMTObs option:selected').text());
     	setInnerHtml('headStageTNMN', ''+$j('#headStageTNMNObs option:selected').text());
     	setInnerHtml('headStageTNMM', ''+$j('#headStageTNMMObs option:selected').text());
     	
     	if(getValue('headStageOS0.value') !=null )
     	    setInnerHtml('headStageOS', '0');
     	if(getValue('headStageOS1.value') !=null )
     	    setInnerHtml('headStageOS', 'I');
     	if(getValue('headStageOS2.value') !=null )
     	    setInnerHtml('headStageOS', 'II');
     	if(getValue('headStageOS3.value') !=null )
     	    setInnerHtml('headStageOS', 'III');
     	if(getValue('headStageOS4.value') !=null )
     	    setInnerHtml('headStageOS', 'IV');
	
     	appendStagingKeys('headCancerStagingKeys');
	 },
	 
	 handleGastricCancerSection: function() {//handle Gastric cancer section
		 hideOthers('gastric');
 		
 		setInnerHtml('gastricMass', ''+getValue('gastricMassObs.value'));
     	setInnerHtml('gastricMassSize1', ''+getValue('gastricMassSize1Obs.value'));
     	setInnerHtml('gastricMassSize2', ''+getValue('gastricMassSize2Obs.value'));
     	setInnerHtml('gastricDiagnosisComments', ''+getValue('gastricDiagnosisCommentsObs.value'));
     	
     	setInnerHtml('gastricStageTNMT', ''+$j('#gastricStageTNMTObs option:selected').text());
     	setInnerHtml('gastricStageTNMN', ''+$j('#gastricStageTNMNObs option:selected').text());
     	setInnerHtml('gastricStageTNMM', ''+$j('#gastricStageTNMMObs option:selected').text());
     	
     	if(getValue('gastricStageOS0.value') !=null )
     	    setInnerHtml('gastricStageOS', '0');
     	if(getValue('gastricStageOS1.value') !=null )
     	    setInnerHtml('gastricStageOS', 'I');
     	if(getValue('gastricStageOS2.value') !=null )
     	    setInnerHtml('gastricStageOS', 'II');
     	if(getValue('gastricStageOS3.value') !=null )
     	    setInnerHtml('gastricStageOS', 'III');
     	if(getValue('gastricStageOS4.value') !=null )
     	    setInnerHtml('gastricStageOS', 'IV');
     	
     	if(getValue('gastricStageHPPositive.value') !=null )
     	    setInnerHtml('gastricStageHP', 'Positive');
     	if(getValue('gastricStageHPNegative.value') !=null )
     	    setInnerHtml('gastricStageHP', 'Negative');
     	if(getValue('gastricStageHPNotDetermined.value') !=null )
     	    setInnerHtml('gastricStageHP', 'Not determined');
     	
     	appendStagingKeys('gastricCancerStagingKeys');
	 },
	 
	 handleColonCancerSection: function() {//handle Colon cancer section
		 hideOthers('colon');
 		
 		setInnerHtml('colonMass', ''+getValue('colonMassObs.value'));
     	setInnerHtml('colonMassSize1', ''+getValue('colonMassSize1Obs.value'));
     	setInnerHtml('colonMassSize2', ''+getValue('colonMassSize2Obs.value'));
     	setInnerHtml('colonDiagnosisComments', ''+getValue('colonDiagnosisCommentsObs.value'));
     	
     	setInnerHtml('colonStageTNMT', ''+$j('#colonStageTNMTObs option:selected').text());
     	setInnerHtml('colonStageTNMN', ''+$j('#colonStageTNMNObs option:selected').text());
     	setInnerHtml('colonStageTNMM', ''+$j('#colonStageTNMMObs option:selected').text());
     	
     	if(getValue('colonStageOS0.value') !=null )
     	    setInnerHtml('colonStageOS', '0');
     	if(getValue('colonStageOS1.value') !=null )
     	    setInnerHtml('colonStageOS', 'I');
     	if(getValue('colonStageOS2.value') !=null )
     	    setInnerHtml('colonStageOS', 'II');
     	if(getValue('colonStageOS3.value') !=null )
     	    setInnerHtml('colonStageOS', 'III');
     	if(getValue('colonStageOS4.value') !=null )
     	    setInnerHtml('colonStageOS', 'IV');
     	
     	appendStagingKeys('colonCancerStagingKeys');
	 },
	 
	 handleProstateCancerSection: function() {//handle Prostate cancer section
		 hideOthers('prostate');
 		
 		setInnerHtml('prostateMass', ''+getValue('prostateMassObs.value'));
     	setInnerHtml('prostateMassSize1', ''+getValue('prostateMassSize1Obs.value'));
     	setInnerHtml('prostateMassSize2', ''+getValue('prostateMassSize2Obs.value'));
     	setInnerHtml('prostateDiagnosisComments', ''+getValue('prostateDiagnosisCommentsObs.value'));
     	
     	setInnerHtml('prostateStageTNMT', ''+$j('#prostateStageTNMTObs option:selected').text());
     	setInnerHtml('prostateStageTNMN', ''+$j('#prostateStageTNMNObs option:selected').text());
     	setInnerHtml('prostateStageTNMM', ''+$j('#prostateStageTNMMObs option:selected').text());
     	
     	if(getValue('prostateStageOS0.value') !=null )
     	    setInnerHtml('prostateStageOS', '0');
     	if(getValue('prostateStageOS1.value') !=null )
     	    setInnerHtml('prostateStageOS', 'I');
     	if(getValue('prostateStageOS2.value') !=null )
     	    setInnerHtml('prostateStageOS', 'II');
     	if(getValue('prostateStageOS3.value') !=null )
     	    setInnerHtml('prostateStageOS', 'III');
     	if(getValue('prostateStageOS4.value') !=null )
     	    setInnerHtml('prostateStageOS', 'IV');
     	
     	appendStagingKeys('prostateCancerStagingKeys');
	 },
	 
	 handleNephroblastomaCancerSection: function() {//handle Nephroblastoma cancer section
		 hideOthers('nephroblastoma');
 		
 		setInnerHtml('nephroblastomaMass', ''+getValue('nephroblastomaMassObs.value'));
     	setInnerHtml('nephroblastomaMassSize1', ''+getValue('nephroblastomaMassSize1Obs.value'));
     	setInnerHtml('nephroblastomaMassSize2', ''+getValue('nephroblastomaMassSize2Obs.value'));
     	setInnerHtml('nephroblastomaDiagnosisComments', ''+getValue('nephroblastomaDiagnosisCommentsObs.value'));
     	
     	if(getValue('nephroblastomaStageOS0.value') !=null )
     	    setInnerHtml('nephroblastomaStageOS', '0');
     	if(getValue('nephroblastomaStageOS1.value') !=null )
     	    setInnerHtml('nephroblastomaStageOS', 'I');
     	if(getValue('nephroblastomaStageOS2.value') !=null )
     	    setInnerHtml('nephroblastomaStageOS', 'II');
     	if(getValue('nephroblastomaStageOS3.value') !=null )
     	    setInnerHtml('nephroblastomaStageOS', 'III');
     	if(getValue('nephroblastomaStageOS4.value') !=null )
     	    setInnerHtml('nephroblastomaStageOS', 'IV');
     	if(getValue('nephroblastomaStageOS5.value') !=null )
     	    setInnerHtml('nephroblastomaStageOS', 'V');
     	
     	appendStagingKeys('nephroblastomaCancerStagingKeys');
	 },
	 
	 handleLungCancerSection: function() {//handle Lung cancer section
		 hideOthers('lung');
		 	
 		if(getValue('lungCancerTypeSmallCell.value') !=null )
     	    setInnerHtml('lungCancerType', 'Small cell lung cancer');
     	if(getValue('lungCancerTypeNonSmall.value') !=null )
     	    setInnerHtml('lungCancerType', 'Non-small cell lung cancer');
     	
     	setInnerHtml('lungMass', ''+getValue('lungMassObs.value'));
     	setInnerHtml('lungMassSize1', ''+getValue('lungMassSize1Obs.value'));
     	setInnerHtml('lungMassSize2', ''+getValue('lungMassSize2Obs.value'));
     	setInnerHtml('lungDiagnosisComments', ''+getValue('lungDiagnosisCommentsObs.value'));
     	
     	if(getValue('lungSmallCellLimited.value') !=null )
     	    setInnerHtml('lungSmallCell', 'Limited stage');
     	if(getValue('lungSmallCellExtensive.value') !=null )
     	    setInnerHtml('lungSmallCell', 'Extensive stage');
     	
     	setInnerHtml('lungStageTNMT', ''+$j('#lungStageTNMTObs option:selected').text());
     	setInnerHtml('lungStageTNMN', ''+$j('#lungStageTNMNObs option:selected').text());
     	setInnerHtml('lungStageTNMM', ''+$j('#lungStageTNMMObs option:selected').text());
     	
     	if(getValue('lungStageOS0.value') !=null )
     	    setInnerHtml('lungStageOS', '0');
     	if(getValue('lungStageOS1.value') !=null )
     	    setInnerHtml('lungStageOS', 'I');
     	if(getValue('lungStageOS2.value') !=null )
     	    setInnerHtml('lungStageOS', 'II');
     	if(getValue('lungStageOS3A.value') !=null )
     	    setInnerHtml('lungStageOS', 'III-A');
     	if(getValue('lungStageOS3B.value') !=null )
     	    setInnerHtml('lungStageOS', 'III-B ');
     	if(getValue('lungStageOS4.value') !=null )
     	    setInnerHtml('lungStageOS', 'IV');
     	
     	appendStagingKeys('lungCancerStagingKeys');
	 },
	 
     handleOtherSolidCancerSection: function() {//handle other solid cancer section
    	 hideOthers('otherSolid');
 		
 		setInnerHtml('otherSolidMass', ''+getValue('otherSolidMassObs.value'));
     	setInnerHtml('otherSolidMassSize1', ''+getValue('otherSolidMassSize1Obs.value'));
     	setInnerHtml('otherSolidMassSize2', ''+getValue('otherSolidMassSize2Obs.value'));
     	setInnerHtml('otherSolidDiagnosisComments', ''+getValue('otherSolidDiagnosisCommentsObs.value'));
     	
     	setInnerHtml('otherSolidStageTNMT', ''+$j('#otherSolidStageTNMTObs option:selected').text());
     	setInnerHtml('otherSolidStageTNMN', ''+$j('#otherSolidStageTNMNObs option:selected').text());
     	setInnerHtml('otherSolidStageTNMM', ''+$j('#otherSolidStageTNMMObs option:selected').text());
     	
     	if(getValue('otherSolidStageOS0.value') !=null )
     	    setInnerHtml('otherSolidStageOS', '0');
     	if(getValue('otherSolidStageOS1.value') !=null )
     	    setInnerHtml('otherSolidStageOS', 'I');
     	if(getValue('otherSolidStageOS2.value') !=null )
     	    setInnerHtml('otherSolidStageOS', 'II');
     	if(getValue('otherSolidStageOS3.value') !=null )
     	    setInnerHtml('otherSolidStageOS', 'III');
     	if(getValue('otherSolidStageOS4.value') !=null )
     	    setInnerHtml('otherSolidStageOS', 'IV');
	 },
	 
	 handleHodgkinCancerSection: function() {//handle Hodgkin cancer section
		 hideOthers('hodgkin');
		 	
 		setInnerHtml('hodgkinMass', ''+getValue('hodgkinMassObs.value'));
     	setInnerHtml('hodgkinMassSize1', ''+getValue('hodgkinMassSize1Obs.value'));
     	setInnerHtml('hodgkinMassSize2', ''+getValue('hodgkinMassSize2Obs.value'));
     	setInnerHtml('hodgkinDiagnosisComments', ''+getValue('hodgkinDiagnosisCommentsObs.value'));
     	
     	if(getValue('hodgkinStageOS0.value') !=null )
     	    setInnerHtml('hodgkinStageOS', '0');
     	if(getValue('hodgkinStageOS1.value') !=null )
     	    setInnerHtml('hodgkinStageOS', 'I');
     	if(getValue('hodgkinStageOS2.value') !=null )
     	    setInnerHtml('hodgkinStageOS', 'II');
     	if(getValue('hodgkinStageOS3.value') !=null )
     	    setInnerHtml('hodgkinStageOS', 'III');
     	if(getValue('hodgkinStageOS4.value') !=null )
     	    setInnerHtml('hodgkinStageOS', 'IV');
     	
     	if(getValue('hodgkinStageBulkyYes.value') !=null )
     	    setInnerHtml('hodgkinStageBulky', 'Yes');
     	if(getValue('hodgkinStageBulkyNo.value') !=null )
     	    setInnerHtml('hodgkinStageBulky', 'No');
     	if(getValue('hodgkinStageBulkyNotDetermined.value') !=null )
     	    setInnerHtml('hodgkinStageBulky', 'Not determined');
     	
     	if(getValue('hodgkinStageSymptomaticNoBSymptoms.value') !=null )
     	    setInnerHtml('hodgkinStageSymptomatic', 'No B symptoms');
     	if(getValue('hodgkinStageSymptomaticBSymptoms.value') !=null )
     	    setInnerHtml('hodgkinStageSymptomatic', 'B symptoms present');
     	
     	appendStagingKeys('hodgkinCancerStagingKeys');
	 },
	 
	 handleBurkittCancerSection: function() {//handle Burkitt cancer section
		 hideOthers('burkitt');
 		
 		setInnerHtml('burkittMass', ''+getValue('burkittMassObs.value'));
     	setInnerHtml('burkittMassSize1', ''+getValue('burkittMassSize1Obs.value'));
     	setInnerHtml('burkittMassSize2', ''+getValue('burkittMassSize2Obs.value'));
     	setInnerHtml('burkittDiagnosisComments', ''+getValue('burkittDiagnosisCommentsObs.value'));
     	
     	if(getValue('burkittStageOS0.value') !=null )
     	    setInnerHtml('burkittStageOS', '0');
     	if(getValue('burkittStageOS1.value') !=null )
     	    setInnerHtml('burkittStageOS', 'I');
     	if(getValue('burkittStageOS2.value') !=null )
     	    setInnerHtml('burkittStageOS', 'II');
     	if(getValue('burkittStageOS3.value') !=null )
     	    setInnerHtml('burkittStageOS', 'III');
     	if(getValue('burkittStageOS4.value') !=null )
     	    setInnerHtml('burkittStageOS', 'IV');
     	
     	if(getValue('burkittStageBulkyYes.value') !=null )
     	    setInnerHtml('burkittStageBulky', 'Yes');
     	if(getValue('burkittStageBulkyNo.value') !=null )
     	    setInnerHtml('burkittStageBulky', 'No');
     	if(getValue('burkittStageBulkyNotDetermined.value') !=null )
     	    setInnerHtml('burkittStageBulky', 'Not determined');
     	
     	if(getValue('burkittStageSymptomaticNoBSymptoms.value') !=null )
     	    setInnerHtml('burkittStageSymptomatic', 'No B symptoms');
     	if(getValue('burkittStageSymptomaticBSymptoms.value') !=null )
     	    setInnerHtml('burkittStageSymptomatic', 'B symptoms present');
     	
     	appendStagingKeys('burkittCancerStagingKeys');
	 },
	 
	 handleLargeBCellCancerSection: function() {//handle large B cell cancer section
		 hideOthers('large');
 		
 		setInnerHtml('largeMass', ''+getValue('largeMassObs.value'));
     	setInnerHtml('largeMassSize1', ''+getValue('largeMassSize1Obs.value'));
     	setInnerHtml('largeMassSize2', ''+getValue('largeMassSize2Obs.value'));
     	setInnerHtml('largeDiagnosisComments', ''+getValue('largeDiagnosisCommentsObs.value'));
     	
     	if(getValue('largeStageOS0.value') !=null )
     	    setInnerHtml('largeStageOS', '0');
     	if(getValue('largeStageOS1.value') !=null )
     	    setInnerHtml('largeStageOS', 'I');
     	if(getValue('largeStageOS2.value') !=null )
     	    setInnerHtml('largeStageOS', 'II');
     	if(getValue('largeStageOS3.value') !=null )
     	    setInnerHtml('largeStageOS', 'III');
     	if(getValue('largeStageOS4.value') !=null )
     	    setInnerHtml('largeStageOS', 'IV');
     	
     	if(getValue('largeStageBulkyYes.value') !=null )
     	    setInnerHtml('largeStageBulky', 'Yes');
     	if(getValue('largeStageBulkyNo.value') !=null )
     	    setInnerHtml('largeStageBulky', 'No');
     	if(getValue('largeStageBulkyNotDetermined.value') !=null )
     	    setInnerHtml('largeStageBulky', 'Not determined');
     	
     	if(getValue('largeStageSymptomaticNoBSymptoms.value') !=null )
     	    setInnerHtml('largeStageSymptomatic', 'No B symptoms');
     	if(getValue('largeStageSymptomaticBSymptoms.value') !=null )
     	    setInnerHtml('largeStageSymptomatic', 'B symptoms present');
     	
     	appendStagingKeys('largeCancerStagingKeys');
	 },
	 
	 handleNHLCancerSection: function() {//handle NHL cancer section
		 hideOthers('otherNHL');
 		
 		setInnerHtml('otherNHLMass', ''+getValue('otherNHLMassObs.value'));
     	setInnerHtml('otherNHLMassSize1', ''+getValue('otherNHLMassSize1Obs.value'));
     	setInnerHtml('otherNHLMassSize2', ''+getValue('otherNHLMassSize2Obs.value'));
     	setInnerHtml('otherNHLDiagnosisComments', ''+getValue('otherNHLDiagnosisCommentsObs.value'));
     	
     	if(getValue('otherNHLStageOS0.value') !=null )
     	    setInnerHtml('otherNHLStageOS', '0');
     	if(getValue('otherNHLStageOS1.value') !=null )
     	    setInnerHtml('otherNHLStageOS', 'I');
     	if(getValue('otherNHLStageOS2.value') !=null )
     	    setInnerHtml('otherNHLStageOS', 'II');
     	if(getValue('otherNHLStageOS3.value') !=null )
     	    setInnerHtml('otherNHLStageOS', 'III');
     	if(getValue('otherNHLStageOS4.value') !=null )
     	    setInnerHtml('otherNHLStageOS', 'IV');
     	
     	if(getValue('otherNHLStageBulkyYes.value') !=null )
     	    setInnerHtml('otherNHLStageBulky', 'Yes');
     	if(getValue('otherNHLStageBulkyNo.value') !=null )
     	    setInnerHtml('otherNHLStageBulky', 'No');
     	if(getValue('otherNHLStageBulkyNotDetermined.value') !=null )
     	    setInnerHtml('otherNHLStageBulky', 'Not determined');
     	
     	if(getValue('otherNHLStageSymptomaticNoBSymptoms.value') !=null )
     	    setInnerHtml('otherNHLStageSymptomatic', 'No B symptoms');
     	if(getValue('otherNHLStageSymptomaticBSymptoms.value') !=null )
     	    setInnerHtml('otherNHLStageSymptomatic', 'B symptoms present');
     	
     	appendStagingKeys('otherNHLCancerStagingKeys');
	 },
	 
	 handleALLCancerSection: function() {//handle ALL cancer section
		 hideOthers('ALL');
 		
 		setInnerHtml('ALLDiagnosisComments', ''+getValue('ALLDiagnosisCommentsObs.value'));
 		
	
 		if(getValue('ALLStageLowRisk.value') !=null )
     	    setInnerHtml('ALLStage', 'Low risk');
     	if(getValue('ALLStageMediumRisk.value') !=null )
     	    setInnerHtml('ALLStage', 'Medium risk');
     	if(getValue('ALLStageHighRisk.value') !=null )
     	    setInnerHtml('ALLStage', 'High risk (always when Ph+, infant)');
     	if(getValue('ALLStageVeryHighRisk.value') !=null )
     	    setInnerHtml('ALLStage', 'Very High risk');
     	
     	if(getValue('ALLStagePhStatusPh+.value') !=null )
     	    setInnerHtml('ALLStagePhStatus', 'Ph+');
     	if(getValue('ALLStagePhStatusPh-.value') !=null )
     	    setInnerHtml('ALLStagePhStatus', 'Ph-');
     	if(getValue('ALLStagePhStatusNotDetermined.value') !=null )
     	    setInnerHtml('ALLStagePhStatus', 'not determined');
		 
	 },
	 
	 handleCMLCancerSection: function() {//handle CML cancer section
		 hideOthers('CML');
 		
 		setInnerHtml('CMLDiagnosisComments', ''+getValue('CMLDiagnosisCommentsObs.value'));
 		
 	 	
 		if(getValue('CMLStageChronicPhase.value') !=null )
     	    setInnerHtml('CMLStage', 'Chronic phase');
     	if(getValue('CMLStageAcceleratedPhase.value') !=null )
     	    setInnerHtml('CMLStage', 'Accelerated phase');
     	if(getValue('CMLStageBlastCrisis.value') !=null )
     	    setInnerHtml('CMLStage', 'Blast crisis');
     	
     	if(getValue('CMLStageCytogeneticsTPositive.value') !=null )
     	    setInnerHtml('CMLStageCytogenetics', 't(9,22)+');
     	if(getValue('CMLStageCytogeneticsT-.value') !=null )
     	    setInnerHtml('CMLStageCytogenetics', 't(9,22)-');
     	if(getValue('CMLStageCytogeneticsNotDetermined.value') !=null )
     	    setInnerHtml('CMLStageCytogenetics', 'not determined');
     	
     	
     	appendStagingKeys('CMLCancerStagingKeys');
	 },
	 
	 handleMultipleMyelomaCancerSection: function() {//handle Multiple Myeloma cancer section
		 
		 hideOthers('multiple');
		    
		    setInnerHtml('multipleMass', ''+getValue('multipleMassObs.value'));
     	setInnerHtml('multipleMassSize1', ''+getValue('multipleMassSize1Obs.value'));
     	setInnerHtml('multipleMassSize2', ''+getValue('multipleMassSize2Obs.value'));
     	setInnerHtml('multipleDiagnosisComments', ''+getValue('multipleDiagnosisCommentsObs.value'));
     	
     	if(getValue('multipleStageOS0.value') !=null )
     	    setInnerHtml('multipleStageOS', '0');
     	if(getValue('multipleStageOS1.value') !=null )
     	    setInnerHtml('multipleStageOS', 'I');
     	if(getValue('multipleStageOS2.value') !=null )
     	    setInnerHtml('multipleStageOS', 'II');
     	if(getValue('multipleStageOS3.value') !=null )
     	    setInnerHtml('multipleStageOS', 'III');
     	
     	if(getValue('multipleSubclassificationA.value') !=null )
     	    setInnerHtml('multipleSubclassification', 'A: relatively normal renal function (serum creatinine value &lt; 2.0 mg/dl) ');
     	if(getValue('multipleSubclassificationB.value') !=null )
     	    setInnerHtml('multipleSubclassification', 'B: abnomal renal function (serum creatinine &gt; 2.0 mg/dl) ');
     	
     	appendStagingKeys('multipleCancerStagingKeys');
		 
	 },
	 
	 handleMetastaticCancerSection: function() {//handle Metastatic cancer section
		 hideOthers('metastatic');
		 	
         setInnerHtml('metastaticDiagnosisComments', ''+getValue('metastaticDiagnosisCommentsObs.value'));
     	
     	if(getValue('metastaticStageOS0.value') !=null )
     	    setInnerHtml('metastaticStageOS', '0');
     	if(getValue('metastaticStageOS1.value') !=null )
     	    setInnerHtml('metastaticStageOS', 'I');
     	if(getValue('metastaticStageOS2.value') !=null )
     	    setInnerHtml('metastaticStageOS', 'II');
     	if(getValue('metastaticStageOS3.value') !=null )
     	    setInnerHtml('metastaticStageOS', 'III');
     	if(getValue('metastaticStageOS4.value') !=null )
     	    setInnerHtml('metastaticStageOS', 'IV');
     	
     	appendStagingKeys(null);
	 },
	 
	 handleOtherLiquidCancerSection: function() {//handle Other Liquid cancer section
		 hideOthers('otherLiquid');		 
 		setInnerHtml('otherLiquidDiagnosisComments', ''+getValue('otherLiquidDiagnosisCommentsObs.value'));
 		setInnerHtml('otherLiquidStageOS', ''+getValue('otherLiquidStageOSObs.value'));
 		appendStagingKeys(null);
	 },
	 
	 handleAllergiesSection: function() {//handle Allergies section
		 
		     $j('#existingAndNewAllergiesPrintView tr:gt(2)').remove();
                      
             $j('#existingAndNewAllergiesScreenView tr.existingAllergy').appendTo('#existingAndNewAllergiesPrintView');  
             
             if(getValue('firstAllergyCauses.value') !=''){
           	$j('#newAllergiesHeading tr').appendTo('#existingAndNewAllergiesPrintView');  
           	$j('#existingAndNewAllergiesPrintView').append('<tr><td>'+$j('#firstAllergyCauses option:selected').text()+'</td><td>'+$j('#firstAllergyReaction option:selected').text()+'</td><td>'+getValue('firstAllergyYear.value')+'</td></tr>');
             
             }
           	 
             if(getValue('secondAllergyCauses.value') !=''){
               	$j('#existingAndNewAllergiesPrintView').append('<tr><td>'+$j('#secondAllergyCauses option:selected').text()+'</td><td>'+$j('#secondAllergyReaction option:selected').text()+'</td><td>'+getValue('secondAllergyYear.value')+'</td></tr>');
                 
                 }
             
             if(getValue('thirdAllergyCauses.value') !=''){
               	$j('#existingAndNewAllergiesPrintView').append('<tr><td>'+$j('#thirdAllergyCauses option:selected').text()+'</td><td>'+$j('#thirdAllergyReaction option:selected').text()+'</td><td>'+getValue('thirdAllergyYear.value')+'</td></tr>');
                 
                 }
	 },
	 
	 handleTreatmentItentSection: function() {//handle Treatment Intent section
		 //see which treatment intent selected
	    	var treatmentIntent = $j(".treatmentPlan").find(":checked").closest("td").attr("id");
	    	
	    	if(treatmentIntent == 'treatmentCurative'){
	    		setInnerHtml('treatmentIntent', 'Curative');
	    	}
	        if(treatmentIntent == 'treatmentPalliative'){
	        	setInnerHtml('treatmentIntent', 'Palliative systemic therapy');
	    	}
	        if(treatmentIntent == 'treatmentPalliation'){
	        	setInnerHtml('treatmentIntent', 'Palliation ONLY');
	    	}
	 },
	 
     handleTreatmentPlanSection: function() {//handle Treatment Plan section
         /*  now that we are going to play with the treatment plan sections (i.e surgery, radiation and chemotherapy) 
         we need to initisalize them to hidden state and we'll be toggling them one by one according to whether a section is selected or not */
         $j('#surgeryTreatmentPlan').hide();
         $j('#radiationTreatmentPlan').hide();
         $j('#chemotherapyTreatmentPlan').hide();
         
       //find selected sections
         var surgeryPlanned = $j(".surgery").find(":checked").closest("td").attr("id");
         var radiationPlanned = $j(".radiation").find(":checked").closest("td").attr("id");
         var chemotherapyPlanned = $j(".chemotherapy").find(":checked").closest("td").attr("id"); 
        
       //handle surgery section if selected
         if(surgeryPlanned == 'trigger21'){
         	$j('#surgeryTreatmentPlan').show();
     		setInnerHtml('surgeryFacility', ''+getValue('surgeryFacilityObs.value'));
     		setInnerHtml('surgeryStartDate', ''+getValue('surgeryStartDateObs.value'));
     		setInnerHtml('surgeryType', ''+getValue('surgeryTypeObs.value'));
     	}

         //handle radiation section if selected
         if(radiationPlanned == 'trigger22'){
         	$j('#radiationTreatmentPlan').show();
     		setInnerHtml('radiationFacility', ''+$j('#radiationFacilityObs option:selected').text());
     		setInnerHtml('radiationStartDate', ''+getValue('radiationStartDateObs.value'));

     	}
         
       //handle chemotherapy section if selected
         if(chemotherapyPlanned == 'trigger23'){
         	$j('#chemotherapyTreatmentPlan').show();
     		setInnerHtml('chemotherapyRegimen', ''+$j('#chemotherapyRegimenObs option:selected').text());
     		setInnerHtml('chemotherapyCycles', ''+Math.floor(getValue('chemotherapyCyclesObs.value')));
     		setInnerHtml('chemotherapyFirstCycle', ''+getValue('chemotherapyFirstCycleObs.value'));
     		setInnerHtml('chemotherapyRegimenEnd', ''+getValue('chemotherapyRegimenEndObs.value'));
     		setInnerHtml('chemotherapyStandardRegimen', ''+getValue('chemotherapyStandardRegimenObs.value'));

     	}
	 },
	};
    
    $j("#printLinkSpan").find("a[href]").click(function(event) {    
    	var diagnosis = {trigger1:'Breast cancer',trigger2:'Cervical cancer',trigger3:'KS',trigger4:'H &#38; N cancer',trigger5:'Gastric cancer',trigger6:'Colo-rectal',trigger7:'Prostate',trigger8:'Nephroblastoma',trigger9:'Lung',trigger10:'Other solid cancer',trigger11:'Hodgkin’s lymphoma',trigger12:'Burkitt’s lymphoma',trigger13:'Large B-cell lymphoma',trigger14:'Other NHL',trigger15:'ALL',trigger16:'CML',trigger17:'Multiple myeloma',trigger18:'Metastatic cancer (unknown primary)',trigger19:'Other liquid cancer'};
		
    	var printHandler = null;
    	var checked = null;
    	
    	if(isEditMode()){ //the form is in the edit mode
    		
    		printHandler = new EditModeHandler();    		
    	    checked = $j(".checkboxGroup").find(":checked").closest("td").attr("id");
    	    
    	}else if(isViewMode()){//the form is in the view mode
    		
    		printHandler = new ViewModeHandler();    		
    		 var elements = [];
    			$j("td[id^='trigger']").each(function(){
    			   elements.push(this.id); 
    			});

    			for(var i = 0; i &lt; 19; i++){
    				if($j('#'+elements[i]).children("span").attr("class") == 'value'){
    					 checked = elements[i];
    				}
    			}
    	}else{//this should be the enter mode which should be handled the same way as the edit mode
    		//(..this means we treat the edit mode as the default mode)
    		
    		printHandler = new EditModeHandler();    		
    	    checked = $j(".checkboxGroup").find(":checked").closest("td").attr("id");
    	}
    	
          
    	printHandler.handleHeadingSection(diagnosis[checked]);
    	
         /* now that we want to play with the printable sections, lets set them all to visible 
         and we'll be hinding them one by one skiping the one whe have to show (see the hideOthers method) */
    	for (var i = 0; i &lt; printableTables.length; i++) {
		    var tableToHide=printableTables[i];
		    	  $j('#'+tableToHide).show();
		}
    	
    switch(checked)
    {
       case 'trigger1':
    	   printHandler.handleBreastCancerSection();    	
      break;
       case 'trigger2':
    	   printHandler.handleCervicalCancerSection();
      break;
        case 'trigger3':
        	printHandler.handleKarposiSection();
   	  break;
    	case 'trigger4':
    		printHandler.handleHeadAndNeckSection();        	
   	  break;
    	case 'trigger5':
    		printHandler.handleGastricCancerSection();   	
   	  break;
    	case 'trigger6':
    		printHandler.handleColonCancerSection();   	
   	  break;
    	case 'trigger7':
    		printHandler.handleProstateCancerSection();  
   	  break;
    	case 'trigger8':
    		printHandler.handleNephroblastomaCancerSection();  
   	  break;
    	case 'trigger9':
    		printHandler.handleLungCancerSection(); 
   	  break;
    	case 'trigger10':
    		printHandler.handleOtherSolidCancerSection(); 
   	  break;
    	case 'trigger11':
    		printHandler.handleHodgkinCancerSection(); 
   	  break;
    	case 'trigger12':
    		printHandler.handleBurkittCancerSection(); 
   	  break;
    	case 'trigger13':
    		printHandler.handleLargeBCellCancerSection(); 
   	  break;
    	case 'trigger14':
    		printHandler.handleNHLCancerSection(); 
   	  break;
    	case 'trigger15':
    		printHandler.handleALLCancerSection(); 
   	  break;
    	case 'trigger16':
    		printHandler.handleCMLCancerSection(); 
   	  break;
    	case 'trigger17':
    		printHandler.handleMultipleMyelomaCancerSection(); 
   	  break;
    	case 'trigger18':
    		printHandler.handleMetastaticCancerSection(); 
   	  break;
    	case 'trigger19':
    		printHandler.handleOtherLiquidCancerSection(); 
   	  break;
    	default:
    	  alert("No cancer type selected");
    	}
    	
    	//handle allergies section    	
    	printHandler.handleAllergiesSection();
    	 
    	 /* the following lines are about handling the treatment plan section  */
 	    
 	    //handle treatment intent section
        printHandler.handleTreatmentItentSection();
    	 
    	 //handle surgery, radiation and chemotherapy sections
        printHandler.handleTreatmentPlanSection();    	
	  });

 });
}
</script>
<div id="printArea">
	<div style="width: 100%; clear: both;">
		<div style="float: left; width: 45%;">
			<h4>
				Date Created: <span id="date"></span>
			</h4>
		</div>
		<div style="float: right; width: 45%; text-align: right;">
			<h4>
				Author: <span id="provider"></span>
			</h4>
		</div>
	</div>
	<table>
		<tr class="diagnosisPrintArea">
			<td style="border-right: 1px solid white;"><b>Inshuti Mu
					Buzima <br />PIH Rwanda</b>
			</td>
			<td align="right">Oncology Program / Programme d'oncologie<br />
				<h5>Diagnosis – Staging – Treatment Plan</h5>
			</td>
		</tr>
	</table>
	<br />
	<table>
		<tr>
			<th colspan="3">Patient Details</th>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">IMB ID</td>
			<td colspan="2" class="values"><lookup class="value"
					expression="patientIdentifiers.get(&quot;IMB ID&quot;)" />
			</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Name</td>
			<td colspan="2" class="values"><lookup class="value"
					expression="patient.personName.familyName" /> <lookup
					class="value" expression="patient.personName.givenName" />
			</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Clinique / Clinic</td>
			<td colspan="2" class="values"><span id="locationPrintArea"></span>
			</td>
		</tr>
	</table>
	<br />
	<table>
		<tr>
			<th colspan="3">Managing Doctors</th>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Managing DCA</td>
			<td colspan="2" class="values"><span id="managingDCA"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Managing GP</td>
			<td colspan="2" class="values"><span id="managingGP"></span>
			</td>
		</tr>
	</table>
	<br />
	<table>
		<tr>
			<th colspan="3">Diagnosis</th>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">FINAL DIAGNOSIS</td>
			<td colspan="2" class="values"><span id="finalDiagnosis"></span>
			</td>
		</tr>
	</table>
	<table id="breast">
		<tr class="diagnosisPrintArea">
			<td class="lables">Right breast mass</td>
			<td class="values"><span id="rightBreastMass"></span>
			</td>
			<td class="values">Size: <span id="rightBreastMassSize1"></span>x<span
				id="rightBreastMassSize2"> </span> <span>|</span> Mobility:<span
				id="rightBreastMassMobility"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Left breast mass</td>
			<td class="values"><span id="leftBreastMass"></span></td>
			<td class="values">Size: <span id="leftBreastMassSize1"></span>x<span
				id="leftBreastMassSize2"> </span> <span>|</span> Mobility:<span
				id="leftBreastMassMobility"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Skin changes</td>
			<td colspan="2" class="values"><span id="diagnosisSkinChanges"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Lymphadenopathy</td>
			<td colspan="2" class="values"><span
				id="diagnosisLymphadenopathy"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">

			<td class="lables">Comments</td>
			<td colspan="2" class="values"><span id="diagnosisComments"></span>
			</td>
		</tr>
		<tr bgcolor="#D9D9D9" class="diagnosisPrintArea">
			<td colspan="3">Staging</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">TNM Pathologic Staging*</td>
			<td colspan="2" class="values">T: <span id="stageTNMT"></span>
				N: <span id="stageTNMN"></span> M:<span id="stageTNMM"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Overall Stage*</td>
			<td colspan="2" class="values"><span id="breastStageOS"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Clustered Stage</td>
			<td colspan="2" class="values"><span id="breastStageCS"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Estrogen receptor</td>
			<td colspan="2" class="values"><span id="breastStageER"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Progesterone receptor</td>
			<td colspan="2" class="values"><span id="breastStagePR"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">HER2 IHC</td>
			<td colspan="2" class="values"><span id="breastStageHI"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">HER2 FISH</td>
			<td colspan="2" class="values"><span id="breastStageHF"></span>
			</td>
		</tr>

	</table>

	<table id="cervical">
		<tr class="diagnosisPrintArea">
			<td class="lables">Mass location</td>
			<td class="values"><span id="cervicalMass"></span>
			</td>
			<td class="values">Size: <span id="cervicalMassSize1"></span>x<span
				id="cervicalMassSize2"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">

			<td class="lables">Comments</td>
			<td colspan="2" class="values"><span
				id="cervicalDiagnosisComments"></span>
			</td>
		</tr>
		<tr bgcolor="#D9D9D9" class="diagnosisPrintArea">
			<td colspan="3">Staging</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Overall Stage*</td>
			<td colspan="2" class="values"><span id="cervicalStageOS"></span>
			</td>
		</tr>
	</table>

	<table id="kaposi">
		<tr class="diagnosisPrintArea">
			<td class="lables">Mass location</td>
			<td class="values"><span id="kaposiMass"></span>
			</td>
			<td class="values">Size: <span id="kaposiMassSize1"></span>x<span
				id="kaposiMassSize2"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Comments</td>
			<td colspan="2" class="values"><span
				id="kaposiDiagnosisComments"></span>
			</td>
		</tr>
		<tr bgcolor="#D9D9D9" class="diagnosisPrintArea">
			<td colspan="3">Staging</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">TIS Staging*</td>
			<td colspan="2" class="values">T:<span id="kaposiStageTIST"></span>
				I: <span id="kaposiStageTISI"></span> S:<span id="kaposiStageTISS"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Overall Stage*</td>
			<td colspan="2" class="values"><span id="kaposiStageOS"></span>
			</td>
		</tr>
	</table>

	<table id="head">
		<tr class="diagnosisPrintArea">
			<td class="lables">Cancer type</td>
			<td colspan="2" class="values"><span id="headCancerType"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Mass location</td>
			<td class="values"><span id="headMass"></span>
			</td>
			<td class="values">Size: <span id="headMassSize1"></span>x<span
				id="headMassSize2"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Comments</td>
			<td colspan="2" class="values"><span id="headDiagnosisComments"></span>
			</td>
		</tr>
		<tr bgcolor="#D9D9D9" class="diagnosisPrintArea">
			<td colspan="3">Staging</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">TNM Pathologic Staging*</td>
			<td colspan="2" class="values">T:<span id="headStageTNMT"></span>
				N:<span id="headStageTNMN"></span> M:<span id="headStageTNMM"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Overall Stage*</td>
			<td colspan="2" class="values"><span id="headStageOS"></span>
			</td>
		</tr>
	</table>

	<table id="gastric">
		<tr class="diagnosisPrintArea">
			<td class="lables">Mass location</td>
			<td class="values"><span id="gastricMass"></span>
			</td>
			<td class="values">Size: <span id="gastricMassSize1"></span>x<span
				id="gastricMassSize2"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Comments</td>
			<td colspan="2" class="values"><span
				id="gastricDiagnosisComments"></span>
			</td>
		</tr>
		<tr bgcolor="#D9D9D9" class="diagnosisPrintArea">
			<td colspan="3">Staging</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">TNM Pathologic Staging*</td>
			<td colspan="2" class="values">T: <span id="gastricStageTNMT"></span>
				N: <span id="gastricStageTNMN"></span> M:<span id="gastricStageTNMM"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Overall Stage*</td>
			<td colspan="2" class="values"><span id="gastricStageOS"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">H.pylori status</td>
			<td colspan="2" class="values"><span id="gastricStageHP"></span>
			</td>
		</tr>
	</table>

	<table id="colon">
		<tr class="diagnosisPrintArea">
			<td class="lables">Mass location</td>
			<td class="values"><span id="colonMass"></span>
			</td>
			<td class="values">Size: <span id="colonMassSize1"></span>x<span
				id="colonMassSize2"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">

			<td class="lables">Comments</td>
			<td colspan="2" class="values"><span id="colonDiagnosisComments"></span>
			</td>
		</tr>
		<tr bgcolor="#D9D9D9" class="diagnosisPrintArea">
			<td colspan="3">Staging</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">TNM Pathologic Staging*</td>
			<td colspan="2" class="values">T: <span id="colonStageTNMT"></span>
				N: <span id="colonStageTNMN"></span> M:<span id="colonStageTNMM"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Overall Stage*</td>
			<td colspan="2" class="values"><span id="colonStageOS"></span>
			</td>
		</tr>
	</table>

	<table id="prostate">
		<tr class="diagnosisPrintArea">
			<td class="lables">Mass location</td>
			<td class="values"><span id="prostateMass"></span>
			</td>
			<td class="values">Size: <span id="prostateMassSize1"></span>x<span
				id="prostateMassSize2"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">

			<td class="lables">Comments</td>
			<td colspan="2" class="values"><span
				id="prostateDiagnosisComments"></span>
			</td>
		</tr>
		<tr bgcolor="#D9D9D9" class="diagnosisPrintArea">
			<td colspan="3">Staging</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">TNM Pathologic Staging*</td>
			<td colspan="2" class="values">T: <span id="prostateStageTNMT"></span>
				N: <span id="prostateStageTNMN"></span> M:<span
				id="prostateStageTNMM"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Overall Stage*</td>
			<td colspan="2" class="values"><span id="prostateStageOS"></span>
			</td>
		</tr>
	</table>

	<table id="nephroblastoma">
		<tr class="diagnosisPrintArea">
			<td class="lables">Mass location</td>
			<td class="values"><span id="nephroblastomaMass"></span>
			</td>
			<td class="values">Size: <span id="nephroblastomaMassSize1"></span>x<span
				id="nephroblastomaMassSize2"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Comments</td>
			<td colspan="2" class="values"><span
				id="nephroblastomaDiagnosisComments"></span>
			</td>
		</tr>
		<tr bgcolor="#D9D9D9" class="diagnosisPrintArea">
			<td colspan="3">Staging</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Overall Stage*</td>
			<td colspan="2" class="values"><span id="nephroblastomaStageOS"></span>
			</td>
		</tr>
	</table>

	<table id="lung">
		<tr class="diagnosisPrintArea">
			<td class="lables">Cancer type</td>
			<td colspan="2" class="values"><span id="lungCancerType"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Mass location</td>
			<td class="values"><span id="lungMass"></span>
			</td>
			<td class="values">Size: <span id="lungMassSize1"></span>x<span
				id="lungMassSize2"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Comments</td>
			<td colspan="2" class="values"><span id="lungDiagnosisComments"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Cancer type</td>
			<td colspan="2" class="values"><span id="lungSmallCell"></span>
			</td>
		</tr>
		<tr bgcolor="#D9D9D9" class="diagnosisPrintArea">
			<td colspan="3">Staging</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">TNM Pathologic Staging*</td>
			<td colspan="2" class="values">T: <span id="lungStageTNMT"></span>
				N: <span id="lungStageTNMN"></span> M:<span id="lungStageTNMM"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Overall Stage*</td>
			<td colspan="2" class="values"><span id="lungStageOS"></span>
			</td>
		</tr>
	</table>

	<table id="otherSolid">
		<tr class="diagnosisPrintArea">
			<td class="lables">Mass location</td>
			<td class="values"><span id="otherSolidMass"></span>
			</td>
			<td class="values">Size: <span id="otherSolidMassSize1"></span>x<span
				id="otherSolidMassSize2"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">

			<td class="lables">Comments</td>
			<td colspan="2" class="values"><span
				id="otherSolidDiagnosisComments"></span>
			</td>
		</tr>
		<tr bgcolor="#D9D9D9" class="diagnosisPrintArea">
			<td colspan="3">Staging</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">TNM Pathologic Staging*</td>
			<td colspan="2" class="values">T: <span id="otherSolidStageTNMT"></span>
				N: <span id="otherSolidStageTNMN"></span> M:<span
				id="otherSolidStageTNMM"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Overall Stage*</td>
			<td colspan="2" class="values"><span id="otherSolidStageOS"></span>
			</td>
		</tr>
	</table>

	<table id="hodgkin">
		<tr class="diagnosisPrintArea">
			<td class="lables">Mass location</td>
			<td class="values"><span id="hodgkinMass"></span>
			</td>
			<td class="values">Size: <span id="hodgkinMassSize1"></span>x<span
				id="hodgkinMassSize2"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">

			<td class="lables">Comments</td>
			<td colspan="2" class="values"><span
				id="hodgkinDiagnosisComments"></span>
			</td>
		</tr>
		<tr bgcolor="#D9D9D9" class="diagnosisPrintArea">
			<td colspan="3">Staging</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Overall Stage*</td>
			<td colspan="2" class="values"><span id="hodgkinStageOS"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Bulky Mediastinal disease</td>
			<td colspan="2" class="values"><span id="hodgkinStageBulky"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Symptomatic</td>
			<td colspan="2" class="values"><span
				id="hodgkinStageSymptomatic"></span>
			</td>
		</tr>
	</table>

	<table id="burkitt">
		<tr class="diagnosisPrintArea">
			<td class="lables">Mass location</td>
			<td class="values"><span id="burkittMass"></span>
			</td>
			<td class="values">Size: <span id="burkittMassSize1"></span>x<span
				id="burkittMassSize2"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Comments</td>
			<td colspan="2" class="values"><span
				id="burkittDiagnosisComments"></span>
			</td>
		</tr>
		<tr bgcolor="#D9D9D9" class="diagnosisPrintArea">
			<td colspan="3">Staging</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Overall Stage*</td>
			<td colspan="2" class="values"><span id="burkittStageOS"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Bulky Mediastinal disease</td>
			<td colspan="2" class="values"><span id="burkittStageBulky"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Symptomatic</td>
			<td colspan="2" class="values"><span
				id="burkittStageSymptomatic"></span>
			</td>
		</tr>
	</table>

	<table id="large">
		<tr class="diagnosisPrintArea">
			<td class="lables">Mass location</td>
			<td class="values"><span id="largeMass"></span>
			</td>
			<td class="values">Size: <span id="largeMassSize1"></span>x<span
				id="largeMassSize2"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Comments</td>
			<td colspan="2" class="values"><span id="largeDiagnosisComments"></span>
			</td>
		</tr>
		<tr bgcolor="#D9D9D9" class="diagnosisPrintArea">
			<td colspan="3">Staging</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Overall Stage*</td>
			<td colspan="2" class="values"><span id="largeStageOS"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Bulky Mediastinal disease</td>
			<td colspan="2" class="values"><span id="largeStageBulky"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Symptomatic</td>
			<td colspan="2" class="values"><span id="largeStageSymptomatic"></span>
			</td>
		</tr>
	</table>

	<table id="otherNHL">
		<tr class="diagnosisPrintArea">
			<td class="lables">Mass location</td>
			<td class="values"><span id="otherNHLMass"></span>
			</td>
			<td class="values">Size: <span id="otherNHLMassSize1"></span>x<span
				id="otherNHLMassSize2"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Comments</td>
			<td colspan="2" class="values"><span
				id="otherNHLDiagnosisComments"></span>
			</td>
		</tr>
		<tr bgcolor="#D9D9D9" class="diagnosisPrintArea">
			<td colspan="3">Staging</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Overall Stage*</td>
			<td colspan="2" class="values"><span id="otherNHLStageOS"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Bulky Mediastinal disease</td>
			<td colspan="2" class="values"><span id="otherNHLStageBulky"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Symptomatic</td>
			<td colspan="2" class="values"><span
				id="otherNHLStageSymptomatic"></span>
			</td>
		</tr>
	</table>

	<table id="ALL">
		<tr class="diagnosisPrintArea">
			<td class="lables">Comments</td>
			<td colspan="2" class="values"><span id="ALLDiagnosisComments"></span>
			</td>
		</tr>
		<tr bgcolor="#D9D9D9" class="diagnosisPrintArea">
			<td colspan="3">Staging</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Confirmed Disease Stage</td>
			<td colspan="2" class="values"><span id="ALLStage"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Ph status</td>
			<td colspan="2" class="values"><span id="ALLStagePhStatus"></span>
			</td>
		</tr>
	</table>

	<table id="CML">
		<tr class="diagnosisPrintArea">

			<td class="lables">Comments</td>
			<td colspan="2" class="values"><span id="CMLDiagnosisComments"></span>
			</td>
		</tr>
		<tr bgcolor="#D9D9D9" class="diagnosisPrintArea">
			<td colspan="3">Staging</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Confirmed Disease Stage</td>
			<td colspan="2" class="values"><span id="CMLStage"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Cytogenetics</td>
			<td colspan="2" class="values"><span id="CMLStageCytogenetics"></span>
			</td>
		</tr>
	</table>

	<table id="multiple">
		<tr class="diagnosisPrintArea">
			<td class="lables">Mass location</td>
			<td class="values"><span id="multipleMass"></span>
			</td>
			<td class="values">Size: <span id="multipleMassSize1"></span>x<span
				id="multipleMassSize2"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Comments</td>
			<td colspan="2" class="values"><span
				id="multipleDiagnosisComments"></span>
			</td>
		</tr>
		<tr bgcolor="#D9D9D9" class="diagnosisPrintArea">
			<td colspan="3">Staging</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Overall Stage*</td>
			<td colspan="2" class="values"><span id="multipleStageOS"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Subclassification</td>
			<td colspan="2" class="values"><span
				id="multipleSubclassification"></span>
			</td>
		</tr>
	</table>

	<table id="metastatic">
		<tr class="diagnosisPrintArea">
			<td class="lables">Comments</td>
			<td colspan="2" class="values"><span
				id="metastaticDiagnosisComments"></span>
			</td>
		</tr>
		<tr bgcolor="#D9D9D9" class="diagnosisPrintArea">
			<td colspan="3">Staging</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Overall Stage*</td>
			<td colspan="2" class="values"><span id="metastaticStageOS"></span>
			</td>
		</tr>
	</table>

	<table id="otherLiquid">
		<tr class="diagnosisPrintArea">
			<td class="lables">Comments</td>
			<td colspan="2" class="values"><span
				id="otherLiquidDiagnosisComments"></span>
			</td>
		</tr>
		<tr bgcolor="#D9D9D9" class="diagnosisPrintArea">
			<td colspan="3">Staging</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Other liquid staging</td>
			<td colspan="2" class="values"><span id="otherLiquidStageOS"></span>
			</td>
		</tr>
	</table>
	<br />
	<table id="existingAndNewAllergiesPrintView">
		<tr class="diagnosisPrintArea">
			<th colspan="3">Allergies</th>
		</tr>
		<tr>
			<td colspan="3"><b>Existing Allergies</b>
			</td>
		</tr>
		<tr bgcolor="#D9D9D9" class="diagnosisPrintArea">
			<td>Causes</td>
			<td>Reaction</td>
			<td>Year of Reaction</td>
		</tr>

	</table>
	<br />
	<table id="treatmentPlan">
		<tr class="diagnosisPrintArea">
			<th colspan="3">Treatment Plan</th>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Intent</td>
			<td colspan="2" class="values"><span id="treatmentIntent"></span>
			</td>
		</tr>
	</table>

	<table id="surgeryTreatmentPlan">
		<tr class="diagnosisPrintArea">
			<th colspan="3">Surgery</th>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Facility</td>
			<td colspan="2" class="values"><span id="surgeryFacility"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Start Date</td>
			<td colspan="2" class="values"><span id="surgeryStartDate"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Type of Surgery</td>
			<td colspan="2" class="values"><span id="surgeryType"></span>
			</td>
		</tr>
	</table>

	<table id="radiationTreatmentPlan">
		<tr class="diagnosisPrintArea">
			<th colspan="3">Radiationtherapy</th>
		</tr>

		<tr class="diagnosisPrintArea">
			<td class="lables">Facility</td>
			<td colspan="2" class="values"><span id="radiationFacility"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Start Date</td>
			<td colspan="2" class="values"><span id="radiationStartDate"></span>
			</td>
		</tr>
	</table>

	<table id="chemotherapyTreatmentPlan">
		<tr class="diagnosisPrintArea">
			<th colspan="3">Chemotherapy</th>
		</tr>

		<tr class="diagnosisPrintArea">
			<td class="lables">Regimen</td>
			<td colspan="2" class="values"><span id="chemotherapyRegimen"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Cycles</td>
			<td colspan="2" class="values"><span id="chemotherapyCycles"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">

			<td class="lables">Planned first cycle</td>
			<td colspan="2" class="values"><span id="chemotherapyFirstCycle"></span>
			</td>
		</tr>
		<tr class="diagnosisPrintArea">

			<td class="lables">Planned regimen length</td>
			<td colspan="2" class="values"><span id="chemotherapyRegimenEnd"></span>
				Weeks</td>
		</tr>
		<tr class="diagnosisPrintArea">
			<td class="lables">Changes to standard regimen</td>
			<td colspan="2" class="values"><span
				id="chemotherapyStandardRegimen"></span>
			</td>
		</tr>
	</table>

	<table class="selectedCancerStagingKeys">

	</table>

	<table id="newAllergiesHeading" style="display: none;">
		<tr>
			<td colspan="3"><b>New Allergies</b>
			</td>
		</tr>
		<tr bgcolor="#D9D9D9" class="diagnosisPrintArea">
			<td>Causes</td>
			<td>Reaction</td>
			<td>Year of Reaction</td>
		</tr>

	</table>

</div>
<div id="container">
	<section>

	<table border="1" cellspacing="0" cellpadding="6" width="100%">
		<tr>
			<td><b> IMB ID: <lookup class="value"
						expression="patientIdentifiers.get(&quot;IMB ID&quot;)" /> </b></td>
			<td>Date: <encounterDate id="encounterDate" default="today" />
			</td>
		</tr>
		<tr>
			<td>Nom / Last name: <lookup class="value"
					expression="patient.personName.familyName" /></td>
			<td>Prénom/ First name: <lookup class="value"
					expression="patient.personName.givenName" /></td>
		</tr>

		<tr>
			<td><img src="/openmrs/images/emr_hands.gif" align="left"
				height="75" width="56"></img>
				<h2>
					Inshuti Mu Buzima <br /> PIH Rwanda
				</h2></td>
			<td><strong> Oncology Program / Programme d'oncologie <br />
					Diagnosis – Staging – Treatment Plan</strong> <br /></td>
		</tr>
		<tr>
			<td>Clinique / Clinic: <encounterLocation id="encounterLocation" />
			</td>
			<td>Author:<encounterProvider id="encounterProvider"
					role="Oncology Provider" /></td>
		</tr>
	</table>
	<br />
	<table>
		<tr>
			<th class="tableHeader">MANAGING DCA</th>
		</tr>
		<tr class="spaceUnder">
			<td><relationship id="managingDCA"
					type="2293a1d2-6ec5-428c-8230-b78353952a13" whoAmI="B"
					changeExistingRelationship="false" /></td>
		</tr>
		<tr class="spaceUnder">
			<td></td>
		</tr>
		<tr>
			<th class="tableHeader">MANAGING GP</th>
		</tr>
		<tr>
			<td><relationship id="managingGP"
					type="ff98bcbf-1706-456e-bba6-77588f5f1b45" whoAmI="B"
					changeExistingRelationship="false" /></td>
		</tr>
	</table>
	</section>
	<br />
	<table class="checkboxGroup togglebles">
		<tr>
			<th class="tableHeader" colspan="6">FINAL DIAGNOSIS &#38;
				STAGING</th>
		</tr>
		<tr>
			<td rowspan="6">Confirmed Diagnosis</td>
			<td id="trigger1"><workflowState
					workflowId="2e602550-4337-4ffa-90a2-7becc3f167b1"
					stateId="c733a3d0-c89b-4d88-9d89-b590e9175297"
					stateLabel="Breast cancer" type="checkbox" />
			</td>
			<td id="trigger2"><workflowState
					workflowId="2e602550-4337-4ffa-90a2-7becc3f167b1"
					stateId="441c3084-33d1-49a5-abd6-9e8b19ddf049"
					stateLabel="Cervical cancer" type="checkbox" />
			</td>
			<td id="trigger3"><workflowState
					workflowId="2e602550-4337-4ffa-90a2-7becc3f167b1"
					stateId="9c9fdd7c-1903-4f90-90f1-50d0c794fe6a" stateLabel="KS"
					type="checkbox" />
			</td>
			<td id="trigger4"><workflowState
					workflowId="2e602550-4337-4ffa-90a2-7becc3f167b1"
					stateId="d84e31f8-ebe2-4f31-8655-b29dfe671be4"
					stateLabel="H &#38; N cancer" type="checkbox" />
			</td>
			<td id="trigger5"><workflowState
					workflowId="2e602550-4337-4ffa-90a2-7becc3f167b1"
					stateId="3609c073-1b51-438d-849b-35d23f042484"
					stateLabel="Gastric cancer" type="checkbox" />
			</td>
		</tr>
		<tr>
			<td id="trigger6"><workflowState
					workflowId="2e602550-4337-4ffa-90a2-7becc3f167b1"
					stateId="34e298a3-8ca4-470e-8e4f-f422af9feef9"
					stateLabel="Colo-rectal" type="checkbox" />
			</td>
			<td id="trigger7"><workflowState
					workflowId="2e602550-4337-4ffa-90a2-7becc3f167b1"
					stateId="9fb6150d-cd19-43fc-8da9-e6599fac9709"
					stateLabel="Prostate" type="checkbox" />
			</td>
			<td id="trigger8"><workflowState
					workflowId="2e602550-4337-4ffa-90a2-7becc3f167b1"
					stateId="4cef0cce-67b9-4cf5-860e-503ade7ff37a"
					stateLabel="Nephroblastoma" type="checkbox" />
			</td>
			<td id="trigger9"><workflowState
					workflowId="2e602550-4337-4ffa-90a2-7becc3f167b1"
					stateId="b4cdfb5f-275b-4a76-893b-761ae302976d" stateLabel="Lung"
					type="checkbox" />
			</td>
			<td id="trigger10"><workflowState
					workflowId="2e602550-4337-4ffa-90a2-7becc3f167b1"
					stateId="8c3f2a38-eb43-4b13-87c2-4a85d66cafb1"
					stateLabel="Other solid cancer:" type="checkbox" /> <obs
					id="otherSolidSpec"
					conceptId="b9e23b4a-e714-4a55-a3d4-2e152ab4b2b8" labelText="" />
			</td>
		</tr>
		<tr>
			<td id="trigger11"><workflowState
					workflowId="2e602550-4337-4ffa-90a2-7becc3f167b1"
					stateId="ca083335-c209-4d50-8a40-26bd5ef3545e"
					stateLabel="Hodgkin’s lymphoma" type="checkbox" />
			</td>
			<td id="trigger12"><workflowState
					workflowId="2e602550-4337-4ffa-90a2-7becc3f167b1"
					stateId="890a3c62-ec89-41a0-8ffb-ca551dc36b18"
					stateLabel="Burkitt’s lymphoma" type="checkbox" />
			</td>
			<td id="trigger13"><workflowState
					workflowId="2e602550-4337-4ffa-90a2-7becc3f167b1"
					stateId="70d5c89b-657d-4e46-a7e6-62cf2c04a873"
					stateLabel="Large B-cell lymphoma" type="checkbox" />
			</td>
			<td id="trigger14"><workflowState
					workflowId="2e602550-4337-4ffa-90a2-7becc3f167b1"
					stateId="1bdce46f-62d3-4eb1-acfa-644cfd99993a"
					stateLabel="Other NHL" type="checkbox" />
			</td>
			<td id="trigger15"><workflowState
					workflowId="2e602550-4337-4ffa-90a2-7becc3f167b1"
					stateId="b2a69a8a-599f-405f-b11e-5b9f50267921" stateLabel="ALL"
					type="checkbox" />
			</td>
		</tr>
		<tr>
			<td id="trigger16"><workflowState
					workflowId="2e602550-4337-4ffa-90a2-7becc3f167b1"
					stateId="f4eb9f32-ddad-44a2-b8da-309bfd0549e4" stateLabel="CML"
					type="checkbox" />
			</td>
			<td id="trigger17"><workflowState
					workflowId="2e602550-4337-4ffa-90a2-7becc3f167b1"
					stateId="85f296a1-f196-4405-9dc6-1c36107e6df2"
					stateLabel="Multiple myeloma" type="checkbox" />
			</td>
			<td id="trigger18"><workflowState
					workflowId="2e602550-4337-4ffa-90a2-7becc3f167b1"
					stateId="9b9af079-2ad0-4860-9844-48d020912dc2"
					stateLabel="Metastatic cancer (unknown primary) " type="checkbox" />
			</td>
			<td id="trigger19" colspan="2"><workflowState
					workflowId="2e602550-4337-4ffa-90a2-7becc3f167b1"
					stateId="cb041132-1c31-4580-aff3-3564e18b985b"
					stateLabel="Other liquid cancer:" type="checkbox" /> <obs
					id="otherLiquidSpec"
					conceptId="5988cf36-80fb-46b9-bf19-93ec759c4bb6" labelText="" />
			</td>
		</tr>
	</table>
	<table class="togglebles">
		<TBODY id="toggleble1">

			<tr class="spaceUnder">
				<td colspan="6">Confirmed Diagnosis Details (include a copy of
					pathology report in chart)</td>
			</tr>
			<obsgroup groupingConceptId="ad1daadc-b671-493c-bb68-2ece80790706">
			<tr class="checkboxGroup">
				<td>Right breast mass:</td>
				<obsgroup groupingConceptId="e695754b-1c5f-41a8-9d08-5768b8202648">
				<obsgroup groupingConceptId="2e775064-6ece-4546-9375-50480e8e0020">
				<td colspan="3"><obs id="rightBreastMassObs"
						conceptId="e95848e2-f31c-485f-ba8b-8c9424840f92" labelText="" />
				</td>
				<td>Size:<obs id="rightBreastMassSize1Obs"
						conceptId="f174b027-79cf-4ebf-a103-d34b26eacafd" /> X <obs
						id="rightBreastMassSize2Obs"
						conceptId="f174b027-79cf-4ebf-a103-d34b26eacafd" /> cm</td>
				</obsgroup>

				<td><obs id="rightBreastMassMobilityMobile"
						conceptId="13f2f074-3c53-4074-a690-6626220acbdf"
						answerConceptId="a0f3848e-5380-4f61-b679-558f881bb4b4"
						answerLabel="mobile" />
				</td>
				<td><obs id="rightBreastMassMobilityFixed"
						conceptId="13f2f074-3c53-4074-a690-6626220acbdf"
						answerConceptId="5de8377b-6170-4328-895b-f4131b147af2"
						answerLabel="fixed" />
				</td>
				</obsgroup>
				<td></td>
			</tr>

			<tr class="checkboxGroup">
				<td>Left breast mass:</td>
				<obsgroup groupingConceptId="7b9a2f55-d8dd-4e5f-8638-9e212032a14c">
				<obsgroup groupingConceptId="2e775064-6ece-4546-9375-50480e8e0020">
				<td colspan="3"><obs id="leftBreastMassObs"
						conceptId="e95848e2-f31c-485f-ba8b-8c9424840f92" labelText="" />
				</td>
				<td>Size:<obs id="leftBreastMassSize1Obs"
						conceptId="f174b027-79cf-4ebf-a103-d34b26eacafd" /> X <obs
						id="leftBreastMassSize2Obs"
						conceptId="f174b027-79cf-4ebf-a103-d34b26eacafd" /> cm</td>
				</obsgroup>

				<td><obs id="leftBreastMassMobilityMobile"
						conceptId="13f2f074-3c53-4074-a690-6626220acbdf"
						answerConceptId="a0f3848e-5380-4f61-b679-558f881bb4b4"
						answerLabel="mobile" />
				</td>
				<td><obs id="leftBreastMassMobilityFixed"
						conceptId="13f2f074-3c53-4074-a690-6626220acbdf"
						answerConceptId="5de8377b-6170-4328-895b-f4131b147af2"
						answerLabel="fixed" />
				</td>
				</obsgroup>
				<td></td>
			</tr>

			<tr>
				<td>Skin changes:</td>
				<td colspan="5"><obs id="diagnosisSkinChangesObs"
						conceptId="5b357578-179a-4ddf-996f-2eb760b092d7" labelText="" />
				</td>
			</tr>

			<tr class="spaceUnder">
				<td>Lymphadenopathy:</td>
				<td colspan="5"><obs id="diagnosisLymphadenopathyObs"
						conceptId="3cce4c76-26fe-102b-80cb-0017a47871b2" labelText="" />
				</td>
			</tr>

			<tr>
				<td colspan="6"><obs id="diagnosisCommentsObs"
						conceptId="826af985-d6b8-46a5-8773-92e53ee10d45" rows="7"
						cols="60" />
				</td>
			</tr>

			<tr class="spaceUnder">
				<td colspan="6">Confirmed Disease Stage</td>
			</tr>
			<tr>
				<td>TNM Pathologic Staging*:</td>
				<obsgroup groupingConceptId="89089c30-a9ed-4a50-a3dd-0d12029feaf7">
				<td><obs id="stageTNMTObs"
						conceptId="8a1b7c95-6f00-4d66-b3da-cd091a693cf1" labelText="T:" />
				</td>
				<td><obs id="stageTNMNObs"
						conceptId="5f6e7585-27a2-4174-8958-95b52a408dbc" labelText="N:" />
				</td>
				<td><obs id="stageTNMMObs"
						conceptId="05303c1b-3de8-4fb8-91ad-9563ab4d2ac0" labelText="M:" />
				</td>
				</obsgroup>
				<td></td>
				<td></td>
			</tr>
			<tr class="checkboxGroup">
				<td>Overall Stage*:</td>
				<td colspan="5"><obs id="breastStageOS0"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="11ad3741-d3fe-48ff-8872-ce42c8764d34"
						answerLabel="0" /> <obs id="breastStageOS1"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="39c6497d-fe50-4dcf-86e4-5360e1d32f82"
						answerLabel="I" /> <obs id="breastStageOS2"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="c899d4c0-91a1-42f2-b395-114740f237fd"
						answerLabel="II" /> <obs id="breastStageOS3"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="1d5896f3-2e0e-4bc2-aa6c-afe1911afa79"
						answerLabel="III" /> <obs id="breastStageOS4"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="d2f21acb-9519-42ca-a72d-2fcb6bb15c5d"
						answerLabel="IV" />
				</td>
			</tr>

			<tr class="checkboxGroup">
				<td>Clustered Stage:</td>
				<td><obs id="breastStageCSEarly"
						conceptId="40a6d86f-dcd3-4e5e-88e6-bb55db8deef3"
						answerConceptId="c37a6c5a-7ef3-43e9-9ac6-215a1cf42c1f"
						answerLabel="Early" />
				</td>
				<td><obs id="breastStageCSLocallyAdvanced"
						conceptId="40a6d86f-dcd3-4e5e-88e6-bb55db8deef3"
						answerConceptId="3ab42fcd-df0f-4d5f-898f-1889ccb23a5b"
						answerLabel="Locally advanced" />
				</td>
				<td><obs id="breastStageCSMetastatic"
						conceptId="40a6d86f-dcd3-4e5e-88e6-bb55db8deef3"
						answerConceptId="ca3a621e-9d13-483a-8863-b76f61812699"
						answerLabel="Metastatic" />
				</td>
				<td></td>
				<td></td>
			</tr>
			<tr class="checkboxGroup">
				<td>Estrogen receptor:</td>
				<td><obs id="breastStageERER+"
						conceptId="1acc8814-ce06-49f3-8cc1-6b5d1efe3f79"
						answerConceptId="28fa396e-5330-43b3-8c69-d978003f24ff"
						answerLabel="ER+" />
				</td>
				<td><obs id="breastStageERER-"
						conceptId="1acc8814-ce06-49f3-8cc1-6b5d1efe3f79"
						answerConceptId="d65a1323-e3b2-43ac-ad35-b36359d00504"
						answerLabel="ER-" />
				</td>
				<td><obs id="breastStageERNotDetermined"
						conceptId="1acc8814-ce06-49f3-8cc1-6b5d1efe3f79"
						answerConceptId="09c8c10f-c3a6-41f8-ac91-55493ee008c6"
						answerLabel="not determined" />
				</td>
				<td></td>
				<td></td>
			</tr>
			<tr class="checkboxGroup">
				<td>Progesterone receptor:</td>
				<td><obs id="breastStagePRPR+"
						conceptId="b8c56ccc-fe19-4daa-8f2a-682b1e3acddc"
						answerConceptId="a054fa15-43aa-4271-bc24-dc24f34014ac"
						answerLabel="PR+" />
				</td>
				<td><obs id="breastStagePRPR-"
						conceptId="b8c56ccc-fe19-4daa-8f2a-682b1e3acddc"
						answerConceptId="5007fcdc-becb-474a-ab79-c36a94e56f66"
						answerLabel="PR-" />
				</td>
				<td><obs id="breastStagePRNotDetermined"
						conceptId="b8c56ccc-fe19-4daa-8f2a-682b1e3acddc"
						answerConceptId="09c8c10f-c3a6-41f8-ac91-55493ee008c6"
						answerLabel="not determined" />
				</td>
				<td></td>
				<td></td>
			</tr>
			<tr class="checkboxGroup">
				<td>HER2 IHC:</td>
				<td><obs id="breastStageHIIHC+"
						conceptId="6270e371-3fc9-4ed1-96fb-84b072067b1b"
						answerConceptId="f8e53211-e01c-4439-86e5-083b6a044652"
						answerLabel="HER2 IHC+" />
				</td>
				<td><obs id="breastStageHIIHC-"
						conceptId="6270e371-3fc9-4ed1-96fb-84b072067b1b"
						answerConceptId="2a7e3812-da32-437e-b967-079706ca955e"
						answerLabel="HER2 IHC-" />
				</td>
				<td><obs id="breastStageHINotDetermined"
						conceptId="6270e371-3fc9-4ed1-96fb-84b072067b1b"
						answerConceptId="09c8c10f-c3a6-41f8-ac91-55493ee008c6"
						answerLabel="not determined" />
				</td>
				<td></td>
				<td></td>
			</tr>
			<tr class="checkboxGroup">
				<td>HER2 FISH:</td>
				<td><obs id="breastStageHFFISH+"
						conceptId="c40c9293-14bf-4e42-becd-e2af798d217d"
						answerConceptId="7c7b9746-010e-42a1-97f7-4b5e5fe0f374"
						answerLabel="HER2 FISH+" />
				</td>
				<td><obs id="breastStageHFFISH-"
						conceptId="c40c9293-14bf-4e42-becd-e2af798d217d"
						answerConceptId="bc45c3ef-701d-4279-8434-ce94525fc7df"
						answerLabel="HER2 FISH-" />
				</td>
				<td><obs id="breastStageHFNotDetermined"
						conceptId="c40c9293-14bf-4e42-becd-e2af798d217d"
						answerConceptId="09c8c10f-c3a6-41f8-ac91-55493ee008c6"
						answerLabel="not determined" />
				</td>
				<td></td>
				<td></td>
			</tr>
			</obsgroup>
			<tr class="breastCancerStagingKeys">
				<td colspan="6"><span style="float: left;">
						<h5>*TNM Pathologic Staging Key</h5>
						<ul>
							<li>T0 No evidence of primary tumor</li>
							<li>Tis Carcinoma in situ only</li>
							<li>T1 ≤2 cm</li>
							<li>T2 >2 cm, and ≤5 cm</li>
							<li>T3 >5 cm</li>
							<li>T4 Involvement of skin or chest wall</li>
						</ul> </span> <span style="float: left;">
						<ul>
							<li>N0 No axillary node involvement</li>
							<li>N1 Involvement of 1-3 axillary nodes</li>
							<li>N2 Involvement of 4-9 axillary nodes</li>
							<li>N3 Involvement of ≥10 axillary nodes, or supraclavicular
								nodes</li>
						</ul> </span> <span style="float: left;">
						<ul>
							<li>M0 No evidence of distant metastases</li>
							<li>M1 Evidence of distant metastases (includes cervical
								adenopathy)</li>
						</ul> </span>
				</td>
			</tr>
			<tr class="breastCancerStagingKeys">
				<td colspan="6"><span style="float: left;">
						<h5>*Overall Staging Key</h5>
						<ul>
							<li>I T1/N0</li>
							<li>II T2/N0-1, T1/N1</li>
							<li>III T3/N0-1, T1-3/N2</li>
							<li>IV M1</li>
						</ul> </span>
				</td>
			</tr>
		</TBODY>

		<TBODY id="toggleble2">
			<tr class="spaceUnder">
				<td colspan="6">Confirmed Diagnosis Details (include a copy of
					pathology report in chart)</td>
			</tr>
			<obsgroup groupingConceptId="41a80891-3bb2-4423-9647-1f803cebed60">

			<tr>
				<obsgroup groupingConceptId="2e775064-6ece-4546-9375-50480e8e0020">
				<td colspan="5"><obs id="cervicalMassObs"
						conceptId="e95848e2-f31c-485f-ba8b-8c9424840f92"
						labelText="Mass location:" />
				</td>
				<td align="right">Size:<obs id="cervicalMassSize1Obs"
						conceptId="f174b027-79cf-4ebf-a103-d34b26eacafd" /> X <obs
						id="cervicalMassSize2Obs"
						conceptId="f174b027-79cf-4ebf-a103-d34b26eacafd" /> cm</td>
				</obsgroup>
			</tr>


			<tr>
				<td colspan="6"><obs id="cervicalDiagnosisCommentsObs"
						conceptId="826af985-d6b8-46a5-8773-92e53ee10d45" rows="7"
						cols="60" />
				</td>
			</tr>
			<tr class="spaceUnder">
				<td colspan="6">Confirmed Disease Stage</td>
			</tr>
			<tr class="checkboxGroup">
				<td>Overall Stage*:</td>
				<td colspan="5"><obs id="cervicalStageOS0"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="11ad3741-d3fe-48ff-8872-ce42c8764d34"
						answerLabel="0" /> <obs id="cervicalStageOSI"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="39c6497d-fe50-4dcf-86e4-5360e1d32f82"
						answerLabel="I:" /> <obs id="cervicalStageOSIA"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="0a51df04-8563-4e83-8869-56fd79fe4113"
						answerLabel="IA" /> <obs id="cervicalStageOSIB1"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="8f133498-607b-49d1-ab3a-9e09f9fa2246"
						answerLabel="IB1" /> <obs id="cervicalStageOSIB2"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="5d823631-ebf5-4849-919e-914b639cc060"
						answerLabel="IB2" /> <obs id="cervicalStageOSII"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="c899d4c0-91a1-42f2-b395-114740f237fd"
						answerLabel="II" /> <obs id="cervicalStageOSIII"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="1d5896f3-2e0e-4bc2-aa6c-afe1911afa79"
						answerLabel="III" /> <obs id="cervicalStageOSIVA"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="013bfdb5-8bf0-46aa-b11f-cef89acfd0f2"
						answerLabel="IVA" /> <obs id="cervicalStageOSIVB"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="6d86391c-10a5-49d6-967b-e619c1c908a3"
						answerLabel="IVB" />
				</td>
			</tr>
			</obsgroup>
			<tr class="cervicalCancerStagingKeys">
				<td colspan="6"><span style="float: left;">
						<h5>*Staging Key</h5>
						<ul>
							<li>O Tumor in situ or no evidence of primary tumor</li>
							<li>I Disease confined to cervix and/or endometrium</li>
							<li>IA Microscopic invasive disease only, &lt;7 mm in
								diameter</li>
							<li>IB1 Disease ≥7 mm and ≤4 cm</li>
							<li>IB2 Disease >4 cm</li>
							<li>II Disease beyond cervix but does not extend to pelvic
								sidewall</li>
							<li>III Disease extending to pelvic sidewall</li>
							<li>IVA Spread of disease to other pelvic organs such as
								bladder or rectum</li>
							<li>IVB Distant metastases</li>
						</ul> </span>
				</td>
			</tr>
		</TBODY>
		<TBODY id="toggleble3">
			<tr class="spaceUnder">
				<td colspan="6">Confirmed Diagnosis Details (include a copy of
					pathology report in chart)</td>
			</tr>
			<obsgroup groupingConceptId="c4042973-e670-467d-a4a5-bd4f109bdea1">

			<tr>
				<obsgroup groupingConceptId="2e775064-6ece-4546-9375-50480e8e0020">
				<td colspan="3"><obs id="kaposiMassObs"
						conceptId="e95848e2-f31c-485f-ba8b-8c9424840f92"
						labelText="Mass location:" />
				</td>
				<td colspan="3" align="right">Size:<obs id="kaposiMassSize1Obs"
						conceptId="f174b027-79cf-4ebf-a103-d34b26eacafd" /> X <obs
						id="kaposiMassSize2Obs"
						conceptId="f174b027-79cf-4ebf-a103-d34b26eacafd" /> cm</td>
				</obsgroup>
			</tr>


			<tr>
				<td colspan="6"><obs id="kaposiDiagnosisCommentsObs"
						conceptId="826af985-d6b8-46a5-8773-92e53ee10d45" rows="7"
						cols="60" />
				</td>
			</tr>
			<tr>
				<td colspan="6">Confirmed Disease Stage</td>
			</tr>
			<tr>
				<td>TIS Staging*:</td>
				<obsgroup groupingConceptId="60f733d6-7000-48eb-be8e-c503b094b882">
				<td><obs id="kaposiStageTISTObs"
						conceptId="40121f41-5303-4b18-8251-1d62e0eb3e2f" labelText="T:" />
				</td>
				<td><obs id="kaposiStageTISIObs"
						conceptId="26ada79f-153a-4067-b4dd-bec6bfc40647" labelText="I:" />
				</td>
				<td><obs id="kaposiStageTISSObs"
						conceptId="2476256a-2c16-4605-adcb-2ca1d33c299d" labelText="S:" />
				</td>
				</obsgroup>
				<td></td>
				<td></td>
			</tr>
			<tr class="checkboxGroup">
				<td>Overall Stage*:</td>
				<td colspan="5"><obs id="kaposiStageOS0"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="11ad3741-d3fe-48ff-8872-ce42c8764d34"
						answerLabel="0" /> <obs id="kaposiStageOS1"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="39c6497d-fe50-4dcf-86e4-5360e1d32f82"
						answerLabel="I" /> <obs id="kaposiStageOS2"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="c899d4c0-91a1-42f2-b395-114740f237fd"
						answerLabel="II" /> <obs id="kaposiStageOS3"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="1d5896f3-2e0e-4bc2-aa6c-afe1911afa79"
						answerLabel="III" /> <obs id="kaposiStageOS4"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="d2f21acb-9519-42ca-a72d-2fcb6bb15c5d"
						answerLabel="IV" />
				</td>
			</tr>
			</obsgroup>
			<tr class="kaposiCancerStagingKeys">
				<td colspan="6"><span style="float: left;">
						<h5>*TIS Staging Key</h5>
						<ul>
							<li>T0 Lesion(s) only in the skin and/or the lymph nodes, <br />and/or
								there is non-extensive oral disease (Lesions in the mouth are <br />limited
								to the palate and are flat)</li>
							<li>T1 Edema (swelling) due to the tumor; Extensive oral <br />disease
								lesions that are nodular (raised) and/or lesions involve areas
								of the <br />mouth besides the palate; Extensive systemic
								disease (visceral involvement): <br />Lesions are in organs
								other than lymph nodes (such as the lungs, the intestine, <br />the
								liver, etc.). KS in the lungs is particularly poor
								risk/prognosis.</li>
						</ul> </span> <span style="float: left;">
						<ul>
							<li>I0 CD4 count ≥ 200/µL (normal range, 600-1500/µL);
								alternative <br />cut- off proposed is 150, which is what is
								used by more recent studies</li>
							<li>I1 CD4 cell count &lt; 200/µL</li>
						</ul> </span> <span style="float: left;">
						<ul>
							<li>S0 No systemic illness present; ALL of the following are
								true: <br />No history of opportunistic infections or thrush;
								No B symptoms are <br />present (B symptoms include:
								unexplained <br />fever, night sweats (severe enough to soak
								bedding and clothes), <br />unintentional weight loss >10%,
								chronic diarrhea lasting >2 weeks)</li>
							<li>S1 Systemic illness present; one or more of the
								following is true: <br />History of opportunistic infections or
								thrush; One or <br />more B symptoms is present; Other
								HIV-related illness is present, <br />such as neurological
								(nervous system) disease or lymphoma</li>
						</ul> </span>
				</td>
			</tr>
			<tr class="kaposiCancerStagingKeys">
				<td colspan="6"><span style="float: left;">
						<h5>*Overall Staging Key</h5>
						<ul>
							<li>0 Tumor in situ or no evidence of primary tumor</li>
							<li>T1 or T2 lesion with less than 2 lymph nodes involved</li>
							<li>II T3 lesion or less with less than 6 lymph nodes
								involved</li>
							<li>III T4 lesion; any T with at least 7 or more lymph nodes
								involved</li>
							<li>IV any T, any N, M1</li>
							<li></li>
						</ul> </span>
				</td>
			</tr>

		</TBODY>
		<TBODY id="toggleble4">
			<obsgroup groupingConceptId="bc662e4d-6c74-48ab-a0c6-99e3f2d6dba9">
			<tr class="checkboxGroup">
				<td colspan="6">Cancer type:&#160;&#160;&#160;<obs
						id="headCancerTypeOral"
						conceptId="60272648-efe7-4522-9b3b-b3567fe5b403"
						answerConceptId="5181b953-119e-4123-9a71-f6bdbef3973a"
						answerLabel="Oral cavity / Oropharynx/Hypopharynx" /> <obs
						id="headCancerTypeLarynx"
						conceptId="60272648-efe7-4522-9b3b-b3567fe5b403"
						answerConceptId="4bd37944-e0e5-486a-8c14-03e9cf716e18"
						answerLabel="Larynx" /> <obs id="headCancerTypeNasopharynx"
						conceptId="60272648-efe7-4522-9b3b-b3567fe5b403"
						answerConceptId="cb08c841-6b04-4028-83dc-d349a837bcc5"
						answerLabel="Nasopharynx" /> <obs id="headCancerTypeSinuses"
						conceptId="60272648-efe7-4522-9b3b-b3567fe5b403"
						answerConceptId="fec03580-5d54-4b5d-8926-fd0b184b84db"
						answerLabel="Sinuses / Nasal cavity" /> <obs
						id="headCancerTypeOther"
						conceptId="60272648-efe7-4522-9b3b-b3567fe5b403"
						answerConceptId="3cee7fb4-26fe-102b-80cb-0017a47871b2"
						answerLabel="Other:" /> <obs
						conceptId="7e952ad1-935a-4792-96a7-c0ba2079711e" />
				</td>
			</tr>
			<tr class="spaceUnder">
				<td colspan="6">Confirmed Diagnosis Details (include a copy of
					pathology report in chart)</td>
			</tr>


			<tr>
				<obsgroup groupingConceptId="2e775064-6ece-4546-9375-50480e8e0020">
				<td colspan="3"><obs id="headMassObs"
						conceptId="e95848e2-f31c-485f-ba8b-8c9424840f92"
						labelText="Mass location:" />
				</td>
				<td colspan="3" align="right">Size:<obs id="headMassSize1Obs"
						conceptId="f174b027-79cf-4ebf-a103-d34b26eacafd" /> X <obs
						id="headMassSize2Obs"
						conceptId="f174b027-79cf-4ebf-a103-d34b26eacafd" /> cm</td>
				</obsgroup>
			</tr>


			<tr>
				<td colspan="6"><obs id="headDiagnosisCommentsObs"
						conceptId="826af985-d6b8-46a5-8773-92e53ee10d45" rows="7"
						cols="60" />
				</td>
			</tr>
			<tr class="spaceUnder">
				<td colspan="6">Confirmed Disease Stage</td>
			</tr>
			<tr>
				<td>TNM Pathologic Staging*:</td>
				<obsgroup groupingConceptId="89089c30-a9ed-4a50-a3dd-0d12029feaf7">
				<td><obs id="headStageTNMTObs"
						conceptId="8a1b7c95-6f00-4d66-b3da-cd091a693cf1" labelText="T:" />
				</td>

				<td colspan="2"><obs id="headStageTNMNObs"
						conceptId="5f6e7585-27a2-4174-8958-95b52a408dbc" labelText="N:" />
				</td>
				<td></td>
				<td><obs id="headStageTNMMObs"
						conceptId="05303c1b-3de8-4fb8-91ad-9563ab4d2ac0" labelText="M:" />
				</td>

				<td></td>
				</obsgroup>
			</tr>
			<tr class="checkboxGroup">
				<td>Overall Stage*:</td>
				<td colspan="5"><obs id="headStageOS0"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="11ad3741-d3fe-48ff-8872-ce42c8764d34"
						answerLabel="0" /> <obs id="headStageOS1"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="39c6497d-fe50-4dcf-86e4-5360e1d32f82"
						answerLabel="I" /> <obs id="headStageOS2"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="c899d4c0-91a1-42f2-b395-114740f237fd"
						answerLabel="II" /> <obs id="headStageOS3"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="1d5896f3-2e0e-4bc2-aa6c-afe1911afa79"
						answerLabel="III" /> <obs id="headStageOS4"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="d2f21acb-9519-42ca-a72d-2fcb6bb15c5d"
						answerLabel="IV" />
				</td>
			</tr>
			</obsgroup>
			<tr class="headCancerStagingKeys">
				<td colspan="6"><span style="float: left;">
						<h5>*TNM Pathologic Staging Key</h5> Sinuses / Nasal cavity
						<ul>
							<li>T1 Limited to the sinus without bone erosion</li>
							<li>T2 ≥1 subsite invasion or bone erosion</li>
							<li>T3 Invasion of posterior wall of maxillary sinus,
								subcutaneous tissue, <br />floor or medial wall of the orbit,
								pterygoid fossa and ethmoid sinus <br />(for maxillary sinus)</li>
							<li>T4 Invasion of the anterior orbit contents and apex,
								skin of cheek, <br />pterygoid plates, infratemporal fossa,
								cribriform plate <br />(maxillary sinus; T3 for ethmoid sinus
								and nasal cavity), and sphenoid and frontal sinuses, dura, <br />brain,
								middle cranial fossa, cranial nerves (except V2), nasopharynx or
								clivus</li>
						</ul> </span> <span style="float: left;">
						<ul>
							<li>N0 No regional node involved</li>
							<li>N1 Ipsilateral LN ≤3 cm</li>
							<li>N2 Ipsilateral LN >3 cm and ≤6 cm; multiple ipsilateral
								LN; <br />bilateral or contralateral LN ≤6 cm</li>
							<li>N3 LN >6 cm</li>
						</ul> </span> <span style="float: left;">
						<ul>
							<li>M0 No evidence of distant metastases</li>
							<li>M1 Evidence of distant metastases</li>
						</ul> </span>
				</td>
			</tr>
			<tr class="headCancerStagingKeys">
				<td colspan="6"><span style="float: left;">
						<h5>Oral cavity / Oropharynx / Hypopharynx</h5>
						<ul>
							<li>T1 ≤2 cm</li>
							<li>T2 >2 cm, and ≤4 cm</li>
							<li>T3 >4 cm</li>
							<li>T4 Invasion of adjacent organs (different depending on
								site of disease)</li>
						</ul> </span>
				</td>
			</tr>
			<tr class="headCancerStagingKeys">
				<td colspan="6"><span style="float: left;">
						<h5>Larynx</h5>
						<ul>
							<li>T1 Vocal cord mobility preserved</li>
							<li>T2 Decreased vocal cord mobility</li>
							<li>T3 Vocal cord fixation</li>
							<li>T4 Invasion through thyroid cartilage or tissues beyond
								larynx</li>
						</ul> </span>
				</td>
			</tr>
			<tr class="headCancerStagingKeys">
				<td colspan="6"><span style="float: left;">
						<h5>Nasopharynx</h5>
						<ul>
							<li>T1 No parapharyngeal extension</li>
							<li>T2 Parapharyngeal extension (posterolateral <br />infiltration
								beyond pharyngobasilar fascia)</li>
							<li>T3 Invasion of bony structures of skull base and/or
								paranasal sinuses</li>
							<li>T4 Intracranial extension and/or involvement of
								intracranial nerves, <br />infratemporal fossa, hypopharynx,
								orbit or masticator space</li>
						</ul> </span> <span style="float: left;">
						<ul>
							<li>N1 Unilateral lymph node(s) or in the midline <br />≤6
								cm, above the supraclavicular fossa</li>
							<li>N2 Bilateral lymph nodes ≤6 cm, above the
								supraclavicular fossa</li>
							<li>N3 LN >6 cm or extension into the supraclavicular fossa</li>
						</ul> </span> <span style="float: left;">
						<ul>
							<li>M1 Evidence of distant metastases</li>
						</ul> </span>
				</td>
			</tr>
		</TBODY>
		<TBODY id="toggleble5">
			<tr class="spaceUnder">
				<td colspan="6">Confirmed Diagnosis Details (include a copy of
					pathology report in chart)</td>
			</tr>
			<obsgroup groupingConceptId="971098c1-8e3b-42cf-bd10-ffc0f339c9aa">

			<tr>
				<obsgroup groupingConceptId="2e775064-6ece-4546-9375-50480e8e0020">
				<td colspan="5"><obs id="gastricMassObs"
						conceptId="e95848e2-f31c-485f-ba8b-8c9424840f92"
						labelText="Mass location:" />
				</td>
				<td align="right">Size:<obs id="gastricMassSize1Obs"
						conceptId="f174b027-79cf-4ebf-a103-d34b26eacafd" /> X <obs
						id="gastricMassSize2Obs"
						conceptId="f174b027-79cf-4ebf-a103-d34b26eacafd" /> cm</td>
				</obsgroup>
			</tr>


			<tr>
				<td colspan="6"><obs id="gastricDiagnosisCommentsObs"
						conceptId="826af985-d6b8-46a5-8773-92e53ee10d45" rows="7"
						cols="60" />
				</td>
			</tr>
			<tr class="spaceUnder">
				<td colspan="6">Confirmed Disease Stage</td>
			</tr>
			<tr>
				<td>TNM Pathologic Staging*:</td>
				<obsgroup groupingConceptId="89089c30-a9ed-4a50-a3dd-0d12029feaf7">
				<td><obs id="gastricStageTNMTObs"
						conceptId="8a1b7c95-6f00-4d66-b3da-cd091a693cf1" labelText="T:" />
				</td>
				<td><obs id="gastricStageTNMNObs"
						conceptId="5f6e7585-27a2-4174-8958-95b52a408dbc" labelText="N:" />
				</td>
				<td><obs id="gastricStageTNMMObs"
						conceptId="05303c1b-3de8-4fb8-91ad-9563ab4d2ac0" labelText="M:" />
				</td>
				</obsgroup>
				<td></td>
				<td></td>
			</tr>
			<tr class="checkboxGroup">
				<td>Overall Stage*:</td>
				<td><obs id="gastricStageOS0"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="11ad3741-d3fe-48ff-8872-ce42c8764d34"
						answerLabel="0" />
				</td>
				<td><obs id="gastricStageOS1"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="39c6497d-fe50-4dcf-86e4-5360e1d32f82"
						answerLabel="I" />
				</td>
				<td><obs id="gastricStageOS2"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="c899d4c0-91a1-42f2-b395-114740f237fd"
						answerLabel="II" />
				</td>
				<td><obs id="gastricStageOS3"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="1d5896f3-2e0e-4bc2-aa6c-afe1911afa79"
						answerLabel="III" />
				</td>
				<td><obs id="gastricStageOS4"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="d2f21acb-9519-42ca-a72d-2fcb6bb15c5d"
						answerLabel="IV" />
				</td>
			</tr>

			<tr>
				<td>H.pylori status:</td>
				<td><obs id="gastricStageHPPositive"
						conceptId="e45fd262-8a8c-4f72-ae42-d540973cc39f"
						answerConceptId="3cd3a7a2-26fe-102b-80cb-0017a47871b2"
						answerLabel="Positive" />
				</td>
				<td></td>
				<td><obs id="gastricStageHPNegative"
						conceptId="e45fd262-8a8c-4f72-ae42-d540973cc39f"
						answerConceptId="3cd28732-26fe-102b-80cb-0017a47871b2"
						answerLabel="Negative" />
				</td>
				<td></td>
				<td><obs id="gastricStageHPNotDetermined"
						conceptId="e45fd262-8a8c-4f72-ae42-d540973cc39f"
						answerConceptId="09c8c10f-c3a6-41f8-ac91-55493ee008c6"
						answerLabel="Not determined" />
				</td>
			</tr>
			</obsgroup>
			<tr class="gastricCancerStagingKeys">
				<td colspan="6"><span style="float: left;">
						<h5>*TNM Pathologic Staging Key</h5>
						<ul>
							<li>T0 No evidence of primary tumor</li>
							<li>Tis Carcinoma in situ</li>
							<li>T1 Tumor invades submucosa</li>
							<li>T2 Tumor invades muscularis propria</li>
							<li>T3 Tumor pentrates subserosal connective tissue <br />without
								invasion into adjacent structures or visceral peritoneum</li>
							<li>T4 Tumor invades serosa or adjacent structures</li>
						</ul> </span> <span style="float: left;">
						<ul>
							<li>N0 No regional lymph node involvement</li>
							<li>N1 Metastasis in 1-2 regional lymph nodes</li>
							<li>N2 Metastasis in 3-6 regional lymph nodes</li>
							<li>N3 Metastasis in 7 or more regional lymph nodes</li>
						</ul> </span> <span style="float: left;">
						<ul>
							<li>M0 No evidence of distant metastases</li>
							<li>M1 Evidence of distant metastases</li>
						</ul> </span>
				</td>
			</tr>
			<tr class="gastricCancerStagingKeys">
				<td colspan="6"><span style="float: left;">
						<h5>*Overall Staging Key</h5>
						<ul>
							<li>0 Tumor in situ or no evidence of primary tumor</li>
							<li>T1 or T2 lesion with less than 2 lymph nodes involved</li>
							<li>II T3 lesion or less with less than 6 lymph nodes
								involved</li>
							<li>III T4 lesion; any T with at least 7 or more lymph nodes
								involved</li>
							<li>IV any T, any N, M1</li>
							<li></li>
						</ul> </span>
				</td>
			</tr>
		</TBODY>
		<TBODY id="toggleble6">
			<tr class="spaceUnder">
				<td colspan="6">Confirmed Diagnosis Details (include a copy of
					pathology report in chart)</td>
			</tr>
			<obsgroup groupingConceptId="a46f5808-7e2d-4fa9-9266-facac792167f">

			<tr>
				<obsgroup groupingConceptId="2e775064-6ece-4546-9375-50480e8e0020">
				<td colspan="5"><obs id="colonMassObs"
						conceptId="e95848e2-f31c-485f-ba8b-8c9424840f92"
						labelText="Mass location:" />
				</td>
				<td align="right">Size:<obs id="colonMassSize1Obs"
						conceptId="f174b027-79cf-4ebf-a103-d34b26eacafd" /> X <obs
						id="colonMassSize2Obs"
						conceptId="f174b027-79cf-4ebf-a103-d34b26eacafd" /> cm</td>
				</obsgroup>
			</tr>


			<tr>
				<td colspan="6"><obs id="colonDiagnosisCommentsObs"
						conceptId="826af985-d6b8-46a5-8773-92e53ee10d45" rows="7"
						cols="60" />
				</td>
			</tr>
			<tr class="spaceUnder">
				<td colspan="6">Confirmed Disease Stage</td>
			</tr>
			<tr>
				<td>TNM Pathologic Staging*:</td>
				<obsgroup groupingConceptId="89089c30-a9ed-4a50-a3dd-0d12029feaf7">
				<td><obs id="colonStageTNMTObs"
						conceptId="8a1b7c95-6f00-4d66-b3da-cd091a693cf1" labelText="T:" />
				</td>
				<td><obs id="colonStageTNMNObs"
						conceptId="5f6e7585-27a2-4174-8958-95b52a408dbc" labelText="N:" />
				</td>
				<td><obs id="colonStageTNMMObs"
						conceptId="05303c1b-3de8-4fb8-91ad-9563ab4d2ac0" labelText="M:" />
				</td>
				</obsgroup>
				<td></td>
				<td></td>
			</tr>
			<tr class="checkboxGroup">
				<td>Overall Stage*:</td>
				<td colspan="5"><obs id="colonStageOS0"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="11ad3741-d3fe-48ff-8872-ce42c8764d34"
						answerLabel="0" /> <obs id="colonStageOS1"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="39c6497d-fe50-4dcf-86e4-5360e1d32f82"
						answerLabel="I" /> <obs id="colonStageOS2"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="c899d4c0-91a1-42f2-b395-114740f237fd"
						answerLabel="II" /> <obs id="colonStageOS3"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="1d5896f3-2e0e-4bc2-aa6c-afe1911afa79"
						answerLabel="III" /> <obs id="colonStageOS4"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="d2f21acb-9519-42ca-a72d-2fcb6bb15c5d"
						answerLabel="IV" />
				</td>
			</tr>
			</obsgroup>
			<tr class="colonCancerStagingKeys">
				<td colspan="6"><span style="float: left;">
						<h5>*TNM Pathologic Staging Key</h5>
						<ul>
							<li>T0 No evidence of primary tumor</li>
							<li>Tis Carcinoma in situ: intraepithelial or invasion of
								lamina propria</li>
							<li>T1 Submucosa invasion</li>
							<li>T2 Muscularis propria invasion</li>
							<li>T3 Invasion through the muscularis propria into
								pericolorectal tissues</li>
							<li>T4 Tumor penetrates to the surface of visceral
								peritoneum <br />and/or invades or attach other organs and
								structures</li>
						</ul> </span> <span style="float: left;">
						<ul>
							<li>N0 No regional node involved (at least 12 negative <br />nodes
								should be available on the specimen)</li>
							<li>N1 1-3 regional nodes involved</li>
							<li>N2 Metastasis in 3-6 regional lymph nodes</li>
							<li>N3 >3 regional nodes involved</li>
						</ul> </span> <span style="float: left;">
						<ul>
							<li>M0 No evidence of distant metastases</li>
							<li>M1 Evidence of distant metastasis</li>
						</ul> </span>
				</td>
			</tr>
		</TBODY>
		<TBODY id="toggleble7">
			<tr class="spaceUnder">
				<td colspan="6">Confirmed Diagnosis Details (include a copy of
					pathology report in chart)</td>
			</tr>
			<obsgroup groupingConceptId="de77bcbb-4027-44af-9e22-3bb691cd1736">

			<tr>
				<obsgroup groupingConceptId="2e775064-6ece-4546-9375-50480e8e0020">
				<td colspan="5"><obs id="prostateMassObs"
						conceptId="e95848e2-f31c-485f-ba8b-8c9424840f92"
						labelText="Mass location:" />
				</td>
				<td align="right">Size:<obs id="prostateMassSize1Obs"
						conceptId="f174b027-79cf-4ebf-a103-d34b26eacafd" /> X <obs
						id="prostateMassSize2Obs"
						conceptId="f174b027-79cf-4ebf-a103-d34b26eacafd" /> cm</td>
				</obsgroup>
			</tr>


			<tr>
				<td colspan="6"><obs id="prostateDiagnosisCommentsObs"
						conceptId="826af985-d6b8-46a5-8773-92e53ee10d45" rows="7"
						cols="60" />
				</td>
			</tr>
			<tr class="spaceUnder">
				<td colspan="6">Confirmed Disease Stage</td>
			</tr>
			<tr>
				<td>TNM Pathologic Staging*:</td>
				<obsgroup groupingConceptId="89089c30-a9ed-4a50-a3dd-0d12029feaf7">
				<td><obs id="prostateStageTNMTObs"
						conceptId="8a1b7c95-6f00-4d66-b3da-cd091a693cf1" labelText="T:" />
				</td>
				<td><obs id="prostateStageTNMNObs"
						conceptId="5f6e7585-27a2-4174-8958-95b52a408dbc" labelText="N:" />
				</td>
				<td><obs id="prostateStageTNMMObs"
						conceptId="05303c1b-3de8-4fb8-91ad-9563ab4d2ac0" labelText="M:" />
				</td>
				</obsgroup>
				<td></td>
				<td></td>
			</tr>
			<tr class="checkboxGroup">
				<td>Overall Stage*:</td>
				<td><obs id="prostateStageOS0"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="11ad3741-d3fe-48ff-8872-ce42c8764d34"
						answerLabel="0" />
				</td>
				<td><obs id="prostateStageOS1"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="39c6497d-fe50-4dcf-86e4-5360e1d32f82"
						answerLabel="I" />
				</td>
				<td><obs id="prostateStageOS2"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="c899d4c0-91a1-42f2-b395-114740f237fd"
						answerLabel="II" />
				</td>
				<td><obs id="prostateStageOS3"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="1d5896f3-2e0e-4bc2-aa6c-afe1911afa79"
						answerLabel="III" />
				</td>
				<td><obs id="prostateStageOS4"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="d2f21acb-9519-42ca-a72d-2fcb6bb15c5d"
						answerLabel="IV" />
				</td>
			</tr>
			</obsgroup>
			<tr class="prostateCancerStagingKeys">
				<td colspan="6"><span style="float: left;">
						<h5>*TNM Pathologic Staging Key</h5>
						<ul>
							<li>T0 No evidence of prostate tumor</li>
							<li>T1 Clinical inapparent tumor found on biopsy</li>
							<li>T2 Tumor confined to prostate gland</li>
							<li>T3 Tumor extends through capsule</li>
							<li>T4 Tumor fixed, or extends to surrounding structures</li>
						</ul> </span> <span style="float: left;">
						<ul>
							<li>N0 No regional lymph node involvement</li>
							<li>N1 Regional lymph node involvement</li>
						</ul> </span> <span style="float: left;">
						<ul>
							<li>M0 No evidence of distant metastases</li>
							<li>M1 Evidence of distant metastasis</li>
						</ul> </span>
				</td>
			</tr>
		</TBODY>
		<TBODY id="toggleble8">
			<tr class="spaceUnder">
				<td colspan="6">Confirmed Diagnosis Details (include a copy of
					pathology report in chart)</td>
			</tr>
			<obsgroup groupingConceptId="7c2e9249-1c84-4b98-b4c2-7d0465b1257d">

			<tr>
				<obsgroup groupingConceptId="2e775064-6ece-4546-9375-50480e8e0020">
				<td colspan="5"><obs id="nephroblastomaMassObs"
						conceptId="e95848e2-f31c-485f-ba8b-8c9424840f92"
						labelText="Mass location:" />
				</td>
				<td align="right">Size:<obs id="nephroblastomaMassSize1Obs"
						conceptId="f174b027-79cf-4ebf-a103-d34b26eacafd" /> X <obs
						id="nephroblastomaMassSize2Obs"
						conceptId="f174b027-79cf-4ebf-a103-d34b26eacafd" /> cm</td>
				</obsgroup>
			</tr>


			<tr>
				<td colspan="6"><obs id="nephroblastomaDiagnosisCommentsObs"
						conceptId="826af985-d6b8-46a5-8773-92e53ee10d45" rows="7"
						cols="60" />
				</td>
			</tr>
			<tr class="spaceUnder">
				<td colspan="6">Confirmed Disease Stage</td>
			</tr>
			<tr class="checkboxGroup">
				<td>Overall Stage*:</td>
				<td><obs id="nephroblastomaStageOS0"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="11ad3741-d3fe-48ff-8872-ce42c8764d34"
						answerLabel="0" />
				</td>
				<td><obs id="nephroblastomaStageOS1"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="39c6497d-fe50-4dcf-86e4-5360e1d32f82"
						answerLabel="I" />
				</td>
				<td><obs id="nephroblastomaStageOS2"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="c899d4c0-91a1-42f2-b395-114740f237fd"
						answerLabel="II" />
				</td>
				<td><obs id="nephroblastomaStageOS3"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="1d5896f3-2e0e-4bc2-aa6c-afe1911afa79"
						answerLabel="III" />
				</td>
				<td><obs id="nephroblastomaStageOS4"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="d2f21acb-9519-42ca-a72d-2fcb6bb15c5d"
						answerLabel="IV" />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<obs
						id="nephroblastomaStageOS5"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="afe0e350-6be0-4093-a701-923a446f1924"
						answerLabel="V" />
				</td>
			</tr>
			</obsgroup>
			<tr class="nephroblastomaCancerStagingKeys">
				<td colspan="6"><span style="float: left;">
						<h5>*Overall Staging Key</h5> SIOP staging: based upon surgical
						evaluation after administration of chemotherapy to reduce the size
						of the tumor
						<ul>
							<li>I Tumor is fully resected and is limited to the kidney,
								or if outside the kidney, it is surrounded with a fibrous
								pseudocapsule. Tumor may be found in the renal capsule, pelvic
								system (but not involving the ureter walls), and intrarenal
								vessels. There is no evidence of renal sinus vessel involvement
								or tumor at or beyond the margins of resection.</li>
							<li>II Tumor extends beyond the kidney or fibrous
								pseudocapsule but is completely resected without evidence of
								tumor at or beyond the margins of resection. Tumor infiltrates,
								which are completely resected, can extend into the renal sinus,
								blood vessels and lymph nodes beyond the renal parenchyma,
								adjacent organs, or vena cava.</li>
							<li>III After surgery, residual tumor remains but is
								confined to the abdomen. This includes regional lymph node
								involvement, incomplete resection of the tumor, tumor
								penetration of the peritoneal surface, tumor thrombi of vessels
								at resection margins, tumor spillage, or previous biopsy. There
								is no evidence of hematogenous metastasis.</li>
							<li>IV Hematogenous metastasis (e.g. lung, liver, bone,
								brain) or lymph node involvement beyond the abdominopelvic
								region.</li>
							<li>V Bilateral renal involvement is present at the time of
								diagnosis.</li>
						</ul> </span>
				</td>
			</tr>
		</TBODY>
		<TBODY id="toggleble9">
			<obsgroup groupingConceptId="9c5d0b7e-0de8-4c3a-aea1-7284735ceeef">
			<tr class="checkboxGroup spaceUnder">
				<td>Cancer type:</td>
				<td><obs id="lungCancerTypeSmallCell"
						conceptId="bc67ddac-4085-4427-978d-d214595ff304"
						answerConceptId="73087fb3-7d1f-4660-81a2-79f68ac001f0"
						answerLabel="Small cell lung cancer" />
				</td>
				<td><obs id="lungCancerTypeNonSmall"
						conceptId="bc67ddac-4085-4427-978d-d214595ff304"
						answerConceptId="924fd607-4986-4cd1-af54-505b8b90f990"
						answerLabel="Non-small cell lung cancer" />
				</td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr class="spaceUnder">
				<td colspan="6">Confirmed Diagnosis Details (include a copy of
					pathology report in chart)</td>
			</tr>


			<tr>
				<obsgroup groupingConceptId="2e775064-6ece-4546-9375-50480e8e0020">
				<td colspan="5"><obs id="lungMassObs"
						conceptId="e95848e2-f31c-485f-ba8b-8c9424840f92"
						labelText="Mass location:" />
				</td>
				<td align="right">Size:<obs id="lungMassSize1Obs"
						conceptId="f174b027-79cf-4ebf-a103-d34b26eacafd" /> X <obs
						id="lungMassSize2Obs"
						conceptId="f174b027-79cf-4ebf-a103-d34b26eacafd" /> cm</td>
				</obsgroup>
			</tr>


			<tr>
				<td colspan="6"><obs id="lungDiagnosisCommentsObs"
						conceptId="826af985-d6b8-46a5-8773-92e53ee10d45" rows="7"
						cols="60" />
				</td>
			</tr>
			<tr class="spaceUnder">
				<td colspan="6">Confirmed Disease Stage</td>
			</tr>
			<tr class="checkboxGroup">
				<td>If small cell lung cancer:</td>
				<td><obs id="lungSmallCellLimited"
						conceptId="3c7a530f-6061-4b0b-b541-f44bbadeb06b"
						answerConceptId="14f8ee91-6fe1-4907-8e4f-b12974a5f92a"
						answerLabel="Limited stage" />
				</td>
				<td><obs id="lungSmallCellExtensive"
						conceptId="3c7a530f-6061-4b0b-b541-f44bbadeb06b"
						answerConceptId="0d1221e1-e361-48e9-a79f-660baf25c141"
						answerLabel="Extensive stage" />
				</td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td colspan="6">If Non-small cell lung cancer:</td>
			</tr>
			<tr>
				<td>TNM Pathologic Staging*:</td>
				<obsgroup groupingConceptId="89089c30-a9ed-4a50-a3dd-0d12029feaf7">
				<td><obs id="lungStageTNMTObs"
						conceptId="8a1b7c95-6f00-4d66-b3da-cd091a693cf1" labelText="T:" />
				</td>
				<td><obs id="lungStageTNMNObs"
						conceptId="5f6e7585-27a2-4174-8958-95b52a408dbc" labelText="N:" />
				</td>
				<td><obs id="lungStageTNMMObs"
						conceptId="05303c1b-3de8-4fb8-91ad-9563ab4d2ac0" labelText="M:" />
				</td>
				</obsgroup>
				<td></td>
				<td></td>
			</tr>
			<tr class="checkboxGroup">
				<td>Overall Stage*:</td>
				<td colspan="5"><obs id="lungStageOS0"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="11ad3741-d3fe-48ff-8872-ce42c8764d34"
						answerLabel="0" /> <obs id="lungStageOS1"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="39c6497d-fe50-4dcf-86e4-5360e1d32f82"
						answerLabel="I" /> <obs id="lungStageOS2"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="c899d4c0-91a1-42f2-b395-114740f237fd"
						answerLabel="II" /> <obs id="lungStageOS3A"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="5833e1dc-ed16-4f46-91d4-af33b9a5dd48"
						answerLabel="III-A" /> <obs id="lungStageOS3B"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="cbb88e1b-2d13-4557-8ebd-9c622cd8b0c8"
						answerLabel="III-B" /> <obs id="lungStageOS4"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="d2f21acb-9519-42ca-a72d-2fcb6bb15c5d"
						answerLabel="IV" />
				</td>
			</tr>
			</obsgroup>
			<tr class="lungCancerStagingKeys">
				<td colspan="6"><span style="float: left;">
						<h5>*Staging Key</h5> Small cell lung cancer
						<ul>
							<li>Limited stage Disease confined to one lung, without
								pleural involvement, but ipsilateral mediastinal involvement
								allowed</li>
							<li>Extensive stage Disease outside of one lung, pleural
								effusion, cardiac involvement, contralateral lung involvement
								and distant metastases</li>
						</ul> </span>
				</td>
			</tr>
			<tr class="lungCancerStagingKeys">
				<td colspan="6"><span style="float: left;">
						<h5>Non-small cell lung cancer</h5>
						<ul>
							<li>T0 No evidence of primary tumor</li>
							<li>T1 ≤3 cm without invasion of bronchus or other chest
								structures</li>
							<li>T2 >3 cm ≤7 cm, >2 cm from carina, can invade visceral
								pleura,<br /> but not other surrounding chest structures</li>
							<li>T3 >7 cm, or invades chest wall, pericardium, diaphragm,
								mediastinal pleura</li>
							<li>T4 Tumor of any size invading heart, mediastinum great
								vessels, esophagus</li>
						</ul> </span> <span style="float: left;">
						<ul>
							<li>N0 No nodal involvement</li>
							<li>N1 Ipsilateral peri-bronchial or hilar nodes</li>
							<li>N2 Ipsilateral mediastinal or subcarinal nodes</li>
							<li>N3 Contralateral mediastinal or hilar nodes, and
								supraclavicular nodes</li>
						</ul> </span> <span style="float: left;">
						<ul>
							<li>M0 No evidence of distant metastases</li>
							<li>M1 Evidence of distant metastases</li>
						</ul> </span>
				</td>
			</tr>
			<tr class="lungCancerStagingKeys">
				<td colspan="6"><span style="float: left;">
						<h5>*Overall Staging Key</h5>
						<ul>
							<li>0 Tumor in situ or no evidence of primary tumor</li>
							<li>I T &lt; 5 cm and N0</li>
							<li>II T1-3/N0, T1-2/N1</li>
							<li>III-A T1-3/N2, T3/N1-2, T4/N0-1</li>
							<li>III-B T1-4/N3, T4/N2</li>
							<li>IV M1</li>
						</ul> </span>
				</td>
			</tr>
		</TBODY>
		<TBODY id="toggleble10">
			<tr class="spaceUnder">
				<td colspan="6">Confirmed Diagnosis Details (include a copy of
					pathology report in chart)</td>
			</tr>
			<obsgroup groupingConceptId="e4179f1d-9fb0-427e-9ca8-be6098fae679">

			<tr>
				<obsgroup groupingConceptId="2e775064-6ece-4546-9375-50480e8e0020">
				<td colspan="5"><obs id="otherSolidMassObs"
						conceptId="e95848e2-f31c-485f-ba8b-8c9424840f92"
						labelText="Mass location:" />
				</td>
				<td align="right">Size:<obs id="otherSolidMassSize1Obs"
						conceptId="f174b027-79cf-4ebf-a103-d34b26eacafd" /> X <obs
						id="otherSolidMassSize2Obs"
						conceptId="f174b027-79cf-4ebf-a103-d34b26eacafd" /> cm</td>
				</obsgroup>
			</tr>


			<tr>
				<td colspan="6"><obs id="otherSolidDiagnosisCommentsObs"
						conceptId="826af985-d6b8-46a5-8773-92e53ee10d45" rows="7"
						cols="60" />
				</td>
			</tr>
			<tr class="spaceUnder">
				<td colspan="6">Confirmed Disease Stage</td>
			</tr>
			<tr>
				<td>TNM Pathologic Staging*:</td>
				<obsgroup groupingConceptId="89089c30-a9ed-4a50-a3dd-0d12029feaf7">
				<td><obs id="otherSolidStageTNMTObs"
						conceptId="8a1b7c95-6f00-4d66-b3da-cd091a693cf1" labelText="T:" />
				</td>
				<td><obs id="otherSolidStageTNMNObs"
						conceptId="5f6e7585-27a2-4174-8958-95b52a408dbc" labelText="N:" />
				</td>
				<td><obs id="otherSolidStageTNMMObs"
						conceptId="05303c1b-3de8-4fb8-91ad-9563ab4d2ac0" labelText="M:" />
				</td>
				</obsgroup>
				<td></td>
				<td></td>
			</tr>
			<tr class="checkboxGroup">
				<td>Overall Stage*:</td>
				<td><obs id="otherSolidStageOS0"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="11ad3741-d3fe-48ff-8872-ce42c8764d34"
						answerLabel="0" />
				</td>
				<td><obs id="otherSolidStageOS1"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="39c6497d-fe50-4dcf-86e4-5360e1d32f82"
						answerLabel="I" />
				</td>
				<td><obs id="otherSolidStageOS2"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="c899d4c0-91a1-42f2-b395-114740f237fd"
						answerLabel="II" />
				</td>
				<td><obs id="otherSolidStageOS3"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="1d5896f3-2e0e-4bc2-aa6c-afe1911afa79"
						answerLabel="III" />
				</td>
				<td><obs id="otherSolidStageOS4"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="d2f21acb-9519-42ca-a72d-2fcb6bb15c5d"
						answerLabel="IV" />
				</td>
			</tr>
			</obsgroup>
		</TBODY>
		<TBODY id="toggleble11">
			<tr class="spaceUnder">
				<td colspan="6">Confirmed Diagnosis Details (include a copy of
					pathology report in chart)</td>
			</tr>
			<obsgroup groupingConceptId="d75d402a-a9da-40e3-827c-2e76114f51e6">

			<tr>
				<obsgroup groupingConceptId="2e775064-6ece-4546-9375-50480e8e0020">
				<td colspan="5"><obs id="hodgkinMassObs"
						conceptId="e95848e2-f31c-485f-ba8b-8c9424840f92"
						labelText="Mass location:" />
				</td>
				<td align="right">Size:<obs id="hodgkinMassSize1Obs"
						conceptId="f174b027-79cf-4ebf-a103-d34b26eacafd" /> X <obs
						id="hodgkinMassSize2Obs"
						conceptId="f174b027-79cf-4ebf-a103-d34b26eacafd" /> cm</td>
				</obsgroup>
			</tr>


			<tr>
				<td colspan="6"><obs id="hodgkinDiagnosisCommentsObs"
						conceptId="826af985-d6b8-46a5-8773-92e53ee10d45" rows="7"
						cols="60" />
				</td>
			</tr>
			<tr class="spaceUnder">
				<td colspan="6">Confirmed Disease Stage</td>
			</tr>
			<tr class="checkboxGroup">
				<td>Overall Stage*:</td>
				<td><obs id="hodgkinStageOS0"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="11ad3741-d3fe-48ff-8872-ce42c8764d34"
						answerLabel="0" />
				</td>
				<td><obs id="hodgkinStageOS1"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="39c6497d-fe50-4dcf-86e4-5360e1d32f82"
						answerLabel="I" />
				</td>
				<td><obs id="hodgkinStageOS2"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="c899d4c0-91a1-42f2-b395-114740f237fd"
						answerLabel="II" />
				</td>
				<td><obs id="hodgkinStageOS3"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="1d5896f3-2e0e-4bc2-aa6c-afe1911afa79"
						answerLabel="III" />
				</td>
				<td><obs id="hodgkinStageOS4"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="d2f21acb-9519-42ca-a72d-2fcb6bb15c5d"
						answerLabel="IV" />
				</td>
			</tr>
			<tr class="checkboxGroup">
				<td>Bulky Mediastinal disease:</td>
				<td><obs id="hodgkinStageBulkyYes"
						conceptId="a6896274-c1cb-4ff7-8e39-8d9c7c7cd50b"
						answerConceptId="3cd6f600-26fe-102b-80cb-0017a47871b2"
						answerLabel="Yes" />
				</td>
				<td><obs id="hodgkinStageBulkyNo"
						conceptId="a6896274-c1cb-4ff7-8e39-8d9c7c7cd50b"
						answerConceptId="3cd6f86c-26fe-102b-80cb-0017a47871b2"
						answerLabel="No" />
				</td>
				<td><obs id="hodgkinStageBulkyNotDetermined"
						conceptId="a6896274-c1cb-4ff7-8e39-8d9c7c7cd50b"
						answerConceptId="09c8c10f-c3a6-41f8-ac91-55493ee008c6"
						answerLabel="Not determined" />
				</td>
				<td></td>
				<td></td>
			</tr>
			<tr class="spaceUnder">
				<td></td>
				<td colspan="5">(bulky disease is defined as > 10cm in greatest
					dimension)</td>
			</tr>
			<tr class="checkboxGroup">
				<td>Symptomatic:</td>
				<td><obs id="hodgkinStageSymptomaticNoBSymptoms"
						conceptId="24e02fad-f94f-4a81-84e7-6c753f37edd7"
						answerConceptId="fb525380-e1f3-4740-a05b-7a57201a98dd"
						answerLabel="No B symptoms" />
				</td>
				<td><obs id="hodgkinStageSymptomaticBSymptoms"
						conceptId="24e02fad-f94f-4a81-84e7-6c753f37edd7"
						answerConceptId="94e19d03-ba1b-46ee-ac78-0cc853f85be0"
						answerLabel="B symptoms present" />
				</td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td colspan="5">(presence of fevers, night sweats, and/or >10%
					body weight loss)</td>
			</tr>
			</obsgroup>
			<tr class="hodgkinCancerStagingKeys">
				<td colspan="6"><span style="float: left;">
						<h5>*Staging Key</h5>
						<ul>
							<li>O Tumor in situ or unable to assess primary tumor</li>
							<li>I Lymph node disease, one site of involvement</li>
							<li>II Lymph node disease, 2 or more sites of involvement on
								the same side of diaphragm</li>
							<li>III Lymph node disease, on both sides of the diaphragm</li>
							<li>IV Extra-nodal disease, bone marrow, lung, liver</li>
						</ul> </span>
				</td>
			</tr>
		</TBODY>
		<TBODY id="toggleble12">
			<tr class="spaceUnder">
				<td colspan="6">Confirmed Diagnosis Details (include a copy of
					pathology report in chart)</td>
			</tr>
			<obsgroup groupingConceptId="3e4f8536-d583-437b-9b48-4e10ee8e1b17">

			<tr>
				<obsgroup groupingConceptId="2e775064-6ece-4546-9375-50480e8e0020">
				<td colspan="5"><obs id="burkittMassObs"
						conceptId="e95848e2-f31c-485f-ba8b-8c9424840f92"
						labelText="Mass location:" />
				</td>
				<td align="right">Size:<obs id="burkittMassSize1Obs"
						conceptId="f174b027-79cf-4ebf-a103-d34b26eacafd" /> X <obs
						id="burkittMassSize2Obs"
						conceptId="f174b027-79cf-4ebf-a103-d34b26eacafd" /> cm</td>
				</obsgroup>
			</tr>


			<tr>
				<td colspan="6"><obs id="burkittDiagnosisCommentsObs"
						conceptId="826af985-d6b8-46a5-8773-92e53ee10d45" rows="7"
						cols="60" />
				</td>
			</tr>
			<tr class="spaceUnder">
				<td colspan="6">Confirmed Disease Stage</td>
			</tr>
			<tr class="checkboxGroup">
				<td>Overall Stage*:</td>
				<td><obs id="burkittStageOS0"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="11ad3741-d3fe-48ff-8872-ce42c8764d34"
						answerLabel="0" />
				</td>
				<td><obs id="burkittStageOS1"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="39c6497d-fe50-4dcf-86e4-5360e1d32f82"
						answerLabel="I" />
				</td>
				<td><obs id="burkittStageOS2"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="c899d4c0-91a1-42f2-b395-114740f237fd"
						answerLabel="II" />
				</td>
				<td><obs id="burkittStageOS3"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="1d5896f3-2e0e-4bc2-aa6c-afe1911afa79"
						answerLabel="III" />
				</td>
				<td><obs id="burkittStageOS4"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="d2f21acb-9519-42ca-a72d-2fcb6bb15c5d"
						answerLabel="IV" />
				</td>
			</tr>
			<tr class="checkboxGroup">
				<td>Bulky Mediastinal disease:</td>
				<td><obs id="burkittStageBulkyYes"
						conceptId="a6896274-c1cb-4ff7-8e39-8d9c7c7cd50b"
						answerConceptId="3cd6f600-26fe-102b-80cb-0017a47871b2"
						answerLabel="Yes" />
				</td>
				<td><obs id="burkittStageBulkyNo"
						conceptId="a6896274-c1cb-4ff7-8e39-8d9c7c7cd50b"
						answerConceptId="3cd6f86c-26fe-102b-80cb-0017a47871b2"
						answerLabel="No" />
				</td>
				<td><obs id="burkittStageBulkyNotDetermined"
						conceptId="a6896274-c1cb-4ff7-8e39-8d9c7c7cd50b"
						answerConceptId="09c8c10f-c3a6-41f8-ac91-55493ee008c6"
						answerLabel="Not determined" />
				</td>
				<td></td>
				<td></td>
			</tr>
			<tr class="spaceUnder">
				<td></td>
				<td colspan="5">(bulky disease is defined as > 10cm in greatest
					dimension)</td>
			</tr>
			<tr class="checkboxGroup">
				<td>Symptomatic:</td>
				<td><obs id="burkittStageSymptomaticNoBSymptoms"
						conceptId="24e02fad-f94f-4a81-84e7-6c753f37edd7"
						answerConceptId="fb525380-e1f3-4740-a05b-7a57201a98dd"
						answerLabel="No B symptoms" />
				</td>
				<td><obs id="burkittStageSymptomaticBSymptoms"
						conceptId="24e02fad-f94f-4a81-84e7-6c753f37edd7"
						answerConceptId="94e19d03-ba1b-46ee-ac78-0cc853f85be0"
						answerLabel="B symptoms present" />
				</td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td colspan="5">(presence of fevers, night sweats, and/or >10%
					body weight loss)</td>
			</tr>
			</obsgroup>
			<tr class="burkittCancerStagingKeys">
				<td colspan="6"><span style="float: left;">
						<h5>*Staging Key</h5>
						<ul>
							<li>O Tumor in situ or unable to assess primary tumor</li>
							<li>I Lymph node disease, one site of involvement</li>
							<li>II Lymph node disease, 2 or more sites of involvement on
								the same side of diaphragm</li>
							<li>III Lymph node disease, on both sides of the diaphragm</li>
							<li>IV Extra-nodal disease, bone marrow, lung, liver</li>
						</ul> </span>
				</td>
			</tr>
		</TBODY>
		<TBODY id="toggleble13">
			<tr class="spaceUnder">
				<td colspan="6">Confirmed Diagnosis Details (include a copy of
					pathology report in chart)</td>
			</tr>
			<obsgroup groupingConceptId="5e0d8a90-4029-480e-a6c7-b2e925723261">

			<tr>
				<obsgroup groupingConceptId="2e775064-6ece-4546-9375-50480e8e0020">
				<td colspan="5"><obs id="largeMassObs"
						conceptId="e95848e2-f31c-485f-ba8b-8c9424840f92"
						labelText="Mass location:" />
				</td>
				<td align="right">Size:<obs id="largeMassSize1Obs"
						conceptId="f174b027-79cf-4ebf-a103-d34b26eacafd" /> X <obs
						id="largeMassSize2Obs"
						conceptId="f174b027-79cf-4ebf-a103-d34b26eacafd" /> cm</td>
				</obsgroup>
			</tr>


			<tr>
				<td colspan="6"><obs id="largeDiagnosisCommentsObs"
						conceptId="826af985-d6b8-46a5-8773-92e53ee10d45" rows="7"
						cols="60" />
				</td>
			</tr>
			<tr class="spaceUnder">
				<td colspan="6">Confirmed Disease Stage</td>
			</tr>
			<tr class="checkboxGroup">
				<td>Overall Stage*:</td>
				<td><obs id="largeStageOS0"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="11ad3741-d3fe-48ff-8872-ce42c8764d34"
						answerLabel="0" />
				</td>
				<td><obs id="largeStageOS1"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="39c6497d-fe50-4dcf-86e4-5360e1d32f82"
						answerLabel="I" />
				</td>
				<td><obs id="largeStageOS2"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="c899d4c0-91a1-42f2-b395-114740f237fd"
						answerLabel="II" />
				</td>
				<td><obs id="largeStageOS3"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="1d5896f3-2e0e-4bc2-aa6c-afe1911afa79"
						answerLabel="III" />
				</td>
				<td><obs id="largeStageOS4"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="d2f21acb-9519-42ca-a72d-2fcb6bb15c5d"
						answerLabel="IV" />
				</td>
			</tr>
			<tr class="checkboxGroup">
				<td>Bulky Mediastinal disease:</td>
				<td><obs id="largeStageBulkyYes"
						conceptId="a6896274-c1cb-4ff7-8e39-8d9c7c7cd50b"
						answerConceptId="3cd6f600-26fe-102b-80cb-0017a47871b2"
						answerLabel="Yes" />
				</td>
				<td><obs id="largeStageBulkyNo"
						conceptId="a6896274-c1cb-4ff7-8e39-8d9c7c7cd50b"
						answerConceptId="3cd6f86c-26fe-102b-80cb-0017a47871b2"
						answerLabel="No" />
				</td>
				<td><obs id="largeStageBulkyNotDetermined"
						conceptId="a6896274-c1cb-4ff7-8e39-8d9c7c7cd50b"
						answerConceptId="09c8c10f-c3a6-41f8-ac91-55493ee008c6"
						answerLabel="Not determined" />
				</td>
				<td></td>
				<td></td>
			</tr>
			<tr class="spaceUnder">
				<td></td>
				<td colspan="5">(bulky disease is defined as > 10cm in greatest
					dimension)</td>
			</tr>
			<tr class="checkboxGroup">
				<td>Symptomatic:</td>
				<td><obs id="largeStageSymptomaticNoBSymptoms"
						conceptId="24e02fad-f94f-4a81-84e7-6c753f37edd7"
						answerConceptId="fb525380-e1f3-4740-a05b-7a57201a98dd"
						answerLabel="No B symptoms" />
				</td>
				<td><obs id="largeStageSymptomaticBSymptoms"
						conceptId="24e02fad-f94f-4a81-84e7-6c753f37edd7"
						answerConceptId="94e19d03-ba1b-46ee-ac78-0cc853f85be0"
						answerLabel="B symptoms present" />
				</td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td colspan="5">(presence of fevers, night sweats, and/or >10%
					body weight loss)</td>
			</tr>
			</obsgroup>
			<tr class="largeCancerStagingKeys">
				<td colspan="6"><span style="float: left;">
						<h5>*Staging Key</h5>
						<ul>
							<li>O Tumor in situ or unable to assess primary tumor</li>
							<li>I Lymph node disease, one site of involvement</li>
							<li>II Lymph node disease, 2 or more sites of involvement on
								the same side of diaphragm</li>
							<li>III Lymph node disease, on both sides of the diaphragm</li>
							<li>IV Extra-nodal disease, bone marrow, lung, liver</li>
						</ul> </span>
				</td>
			</tr>
		</TBODY>
		<TBODY id="toggleble14">
			<tr class="spaceUnder">
				<td colspan="6">Confirmed Diagnosis Details (include a copy of
					pathology report in chart)</td>
			</tr>
			<obsgroup groupingConceptId="9c82b777-7ee8-440a-a95f-24c4e3ede867">

			<tr>
				<obsgroup groupingConceptId="2e775064-6ece-4546-9375-50480e8e0020">
				<td colspan="5"><obs id="otherNHLMassObs"
						conceptId="e95848e2-f31c-485f-ba8b-8c9424840f92"
						labelText="Mass location:" />
				</td>
				<td align="right">Size:<obs id="otherNHLMassSize1Obs"
						conceptId="f174b027-79cf-4ebf-a103-d34b26eacafd" /> X <obs
						id="otherNHLMassSize2Obs"
						conceptId="f174b027-79cf-4ebf-a103-d34b26eacafd" /> cm</td>
				</obsgroup>
			</tr>


			<tr>
				<td colspan="6"><obs id="otherNHLDiagnosisCommentsObs"
						conceptId="826af985-d6b8-46a5-8773-92e53ee10d45" rows="7"
						cols="60" />
				</td>
			</tr>
			<tr class="spaceUnder">
				<td colspan="6">Confirmed Disease Stage</td>
			</tr>
			<tr class="checkboxGroup">
				<td>Overall Stage*:</td>
				<td><obs id="otherNHLStageOS0"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="11ad3741-d3fe-48ff-8872-ce42c8764d34"
						answerLabel="0" />
				</td>
				<td><obs id="otherNHLStageOS1"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="39c6497d-fe50-4dcf-86e4-5360e1d32f82"
						answerLabel="I" />
				</td>
				<td><obs id="otherNHLStageOS2"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="c899d4c0-91a1-42f2-b395-114740f237fd"
						answerLabel="II" />
				</td>
				<td><obs id="otherNHLStageOS3"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="1d5896f3-2e0e-4bc2-aa6c-afe1911afa79"
						answerLabel="III" />
				</td>
				<td><obs id="otherNHLStageOS4"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="d2f21acb-9519-42ca-a72d-2fcb6bb15c5d"
						answerLabel="IV" />
				</td>
			</tr>
			<tr class="checkboxGroup">
				<td>Bulky Mediastinal disease:</td>
				<td><obs id="otherNHLStageBulkyYes"
						conceptId="a6896274-c1cb-4ff7-8e39-8d9c7c7cd50b"
						answerConceptId="3cd6f600-26fe-102b-80cb-0017a47871b2"
						answerLabel="Yes" />
				</td>
				<td><obs id="otherNHLStageBulkyNo"
						conceptId="a6896274-c1cb-4ff7-8e39-8d9c7c7cd50b"
						answerConceptId="3cd6f86c-26fe-102b-80cb-0017a47871b2"
						answerLabel="No" />
				</td>
				<td><obs id="otherNHLStageBulkyNotDetermined"
						conceptId="a6896274-c1cb-4ff7-8e39-8d9c7c7cd50b"
						answerConceptId="09c8c10f-c3a6-41f8-ac91-55493ee008c6"
						answerLabel="Not determined" />
				</td>
				<td></td>
				<td></td>
			</tr>
			<tr class="spaceUnder">
				<td></td>
				<td colspan="5">(bulky disease is defined as > 10cm in greatest
					dimension)</td>
			</tr>
			<tr class="checkboxGroup">
				<td>Symptomatic:</td>
				<td><obs id="otherNHLStageSymptomaticNoBSymptoms"
						conceptId="24e02fad-f94f-4a81-84e7-6c753f37edd7"
						answerConceptId="fb525380-e1f3-4740-a05b-7a57201a98dd"
						answerLabel="No B symptoms" />
				</td>
				<td><obs id="otherNHLStageSymptomaticBSymptoms"
						conceptId="24e02fad-f94f-4a81-84e7-6c753f37edd7"
						answerConceptId="94e19d03-ba1b-46ee-ac78-0cc853f85be0"
						answerLabel="B symptoms present" />
				</td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td colspan="5">(presence of fevers, night sweats, and/or >10%
					body weight loss)</td>
			</tr>
			</obsgroup>
			<tr class="otherNHLCancerStagingKeys">
				<td colspan="6"><span style="float: left;">
						<h5>*Staging Key</h5>
						<ul>
							<li>O Tumor in situ or unable to assess primary tumor</li>
							<li>I Lymph node disease, one site of involvement</li>
							<li>II Lymph node disease, 2 or more sites of involvement on
								the same side of diaphragm</li>
							<li>III Lymph node disease, on both sides of the diaphragm</li>
							<li>IV Extra-nodal disease, bone marrow, lung, liver</li>
						</ul> </span>
				</td>
			</tr>
		</TBODY>
		<TBODY id="toggleble15">
			<tr class="spaceUnder">
				<td colspan="6">Confirmed Diagnosis Details (include a copy of
					pathology report in chart)</td>
			</tr>
			<obsgroup groupingConceptId="1775fe51-cc4d-44db-9702-acc3f85c5fb3">

			<tr>
				<td colspan="6"><obs id="ALLDiagnosisCommentsObs"
						conceptId="826af985-d6b8-46a5-8773-92e53ee10d45" rows="7"
						cols="60" />
				</td>
			</tr>

			<tr class="spaceUnder">
				<td colspan="6">Confirmed Disease Stage</td>
			</tr>
			<tr class="checkboxGroup">
				<td><obs id="ALLStageLowRisk"
						conceptId="7b10db39-009a-4e99-8ef5-abc0977dbf65"
						answerConceptId="a5428445-23de-43bd-bbfb-b4054d3b1005"
						answerLabel="Low risk" />
				</td>
				<td><obs id="ALLStageMediumRisk"
						conceptId="7b10db39-009a-4e99-8ef5-abc0977dbf65"
						answerConceptId="7a5652ea-dacc-46f0-8c45-329fa28e09aa"
						answerLabel="Medium risk" />
				</td>
				<td colspan="3"><obs id="ALLStageHighRisk"
						conceptId="7b10db39-009a-4e99-8ef5-abc0977dbf65"
						answerConceptId="c5382fcc-e3b5-4676-95a3-1b09489f8429"
						answerLabel="High risk (always when Ph+, infant)" />
				</td>
				<td><obs id="ALLStageVeryHighRisk"
						conceptId="7b10db39-009a-4e99-8ef5-abc0977dbf65"
						answerConceptId="88e2ac87-6e53-4933-81db-949c759f2d2a"
						answerLabel="Very High risk" />
				</td>
			</tr>
			<tr class="checkboxGroup">
				<td>Ph status:</td>
				<td><obs id="ALLStagePhStatusPh+"
						conceptId="341f9b25-da06-4153-8abc-8fc9d52ee849"
						answerConceptId="0a01e9a5-94a9-42df-8674-1602b7d455fb"
						answerLabel="Ph+" />
				</td>
				<td><obs id="ALLStagePhStatusPh-"
						conceptId="341f9b25-da06-4153-8abc-8fc9d52ee849"
						answerConceptId="1d19d217-b491-4bff-8de7-a1f65dea3314"
						answerLabel="Ph-" />
				</td>
				<td colspan="3"><obs id="ALLStagePhStatusNotDetermined"
						conceptId="341f9b25-da06-4153-8abc-8fc9d52ee849"
						answerConceptId="09c8c10f-c3a6-41f8-ac91-55493ee008c6"
						answerLabel="not determined" />
				</td>
			</tr>
			</obsgroup>
		</TBODY>
		<TBODY id="toggleble16">
			<tr class="spaceUnder">
				<td colspan="6">Confirmed Diagnosis Details (include a copy of
					pathology report in chart)</td>
			</tr>
			<obsgroup groupingConceptId="c8945be9-d3b8-41bb-918a-e3bb424c244e">

			<tr>
				<td colspan="6"><obs id="CMLDiagnosisCommentsObs"
						conceptId="826af985-d6b8-46a5-8773-92e53ee10d45" rows="7"
						cols="60" />
				</td>
			</tr>

			<tr class="spaceUnder">
				<td colspan="6">Confirmed Disease Stage</td>
			</tr>
			<tr class="checkboxGroup">
				<td><obs id="CMLStageChronicPhase"
						conceptId="d960c608-37f7-4525-877c-bb4b41015ba7"
						answerConceptId="a6b97e07-2087-435b-a921-c96984da5e35"
						answerLabel="Chronic phase" />
				</td>
				<td><obs id="CMLStageAcceleratedPhase"
						conceptId="d960c608-37f7-4525-877c-bb4b41015ba7"
						answerConceptId="0bb18969-3e13-4686-b718-ac5ec5caec39"
						answerLabel="Accelerated phase" />
				</td>
				<td colspan="3"><obs id="CMLStageBlastCrisis"
						conceptId="d960c608-37f7-4525-877c-bb4b41015ba7"
						answerConceptId="71835cb2-aeba-4014-9c33-3c3a8ee1f456"
						answerLabel="Blast crisis" />
				</td>
				<td></td>
			</tr>
			<tr class="checkboxGroup">
				<td>Cytogenetics:</td>
				<td><obs id="CMLStageCytogeneticsTPositive"
						conceptId="e591db39-b26d-4e28-802e-1e435d2c0d22"
						answerConceptId="5fc18aa2-9d23-4a82-886e-3b8c5c7bbb38"
						answerLabel="t(9,22)+" />
				</td>
				<td><obs id="CMLStageCytogeneticsT-"
						conceptId="e591db39-b26d-4e28-802e-1e435d2c0d22"
						answerConceptId="3223fbd6-00ab-44dd-9d6a-e0826520d1e9"
						answerLabel="t(9,22)-" />
				</td>
				<td colspan="3"><obs id="CMLStageCytogeneticsNotDetermined"
						conceptId="e591db39-b26d-4e28-802e-1e435d2c0d22"
						answerConceptId="09c8c10f-c3a6-41f8-ac91-55493ee008c6"
						answerLabel="not determined" />
				</td>
			</tr>
			</obsgroup>
			<tr class="CMLCancerStagingKeys">
				<td colspan="6"><span style="float: left;">
						<h5>*CML Staging Key</h5>
						<ul>
							<li>Accelerated No set definition but of concern when >10%
								blasts in periphery or marrow; chromosomal changes other than 9;
								22; >20% eos plus basos in blood; extramedullary leukemia (skin,
								etc)</li>
							<li>Blast crisis >25% myeloblasts or lymphoblasts in BM in
								patient with history of CML or 9; 22 translocation in all
								lineages</li>
						</ul> </span>
				</td>
			</tr>
		</TBODY>
		<TBODY id="toggleble17">
			<tr class="spaceUnder">
				<td colspan="6">Confirmed Diagnosis Details (include a copy of
					pathology report in chart)</td>
			</tr>
			<obsgroup groupingConceptId="68b163a4-9d9c-4571-86e4-cb70b5b92ca7">

			<tr>
				<obsgroup groupingConceptId="2e775064-6ece-4546-9375-50480e8e0020">
				<td colspan="5"><obs id="multipleMassObs"
						conceptId="e95848e2-f31c-485f-ba8b-8c9424840f92"
						labelText="Mass location:" />
				</td>
				<td align="right">Size:<obs id="multipleMassSize1Obs"
						conceptId="f174b027-79cf-4ebf-a103-d34b26eacafd" /> X <obs
						id="multipleMassSize2Obs"
						conceptId="f174b027-79cf-4ebf-a103-d34b26eacafd" /> cm</td>
				</obsgroup>
			</tr>


			<tr>
				<td colspan="6"><obs id="multipleDiagnosisCommentsObs"
						conceptId="826af985-d6b8-46a5-8773-92e53ee10d45" rows="7"
						cols="60" />
				</td>
			</tr>
			<tr class="spaceUnder">
				<td colspan="6">Confirmed Disease Stage</td>
			</tr>
			<tr class="checkboxGroup">
				<td>Overall Stage*:</td>
				<td colspan="5"><obs id="multipleStageOS0"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="11ad3741-d3fe-48ff-8872-ce42c8764d34"
						answerLabel="0" /> <obs id="multipleStageOS1"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="39c6497d-fe50-4dcf-86e4-5360e1d32f82"
						answerLabel="I" /> <obs id="multipleStageOS2"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="c899d4c0-91a1-42f2-b395-114740f237fd"
						answerLabel="II" /> <obs id="multipleStageOS3"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="1d5896f3-2e0e-4bc2-aa6c-afe1911afa79"
						answerLabel="III" />
				</td>
			</tr>

			<tr class="checkboxGroup">
				<td>Subclassification:</td>
				<td colspan="5"><obs id="multipleSubclassificationA"
						conceptId="fefcac01-aadb-4b19-8390-07746920d506"
						answerConceptId="911e8796-0bbb-482d-a20f-486f1581528d"
						answerLabel="A: relatively normal renal function (serum creatinine value &lt;2.0 mg/dl)" />
					<obs id="multipleSubclassificationB"
						conceptId="fefcac01-aadb-4b19-8390-07746920d506"
						answerConceptId="bedc9e04-41ee-441e-9ec6-0be4833f75b8"
						answerLabel="B: abnomal renal function (serum creatinine &gt;2.0 mg/dl)" />
				</td>
			</tr>
			</obsgroup>
			<tr class="multipleCancerStagingKeys">
				<td colspan="6"><span style="float: left;">
						<h5>*Overall Staging Key</h5>
						<ul>
							<li>I All of the following: Hb >10 g/Lt; Serum Ca2+ normal
								(&lt;12 mg/dl); X-rays: normal bone structure or solitary bone
								plasmacytoma only; Low M-component production rates: IgG value
								&lt;5 g/dL, IgA value &lt;3 g/dL, Urine light chain M-component
								on electrophoresis &lt;4 g/24h</li>
							<li>II Overall data are minimally abnormal as shown for
								stage I and no single value as abnormal as defined for stage III</li>
							<li>III One or more of the following: Hb &lt;8.5 g/Lt; Serum
								Ca2+ >12 g/dl; Advanced lytic bone lesions (scale 3); High
								M-component production rates: IgG value >7 g/dl, IgA value >5
								g/dl, Urine light chain M-component on electrophoresis >12 g/24h</li>
						</ul> </span>
				</td>
			</tr>
		</TBODY>
		<TBODY id="toggleble18">
			<tr class="spaceUnder">
				<td colspan="6">Confirmed Diagnosis Details (include a copy of
					pathology report in chart)</td>
			</tr>
			<obsgroup groupingConceptId="58f97dd5-c583-42a6-97c0-5dabd8171b5c">
			<tr>
				<td colspan="6"><obs id="metastaticDiagnosisCommentsObs"
						conceptId="826af985-d6b8-46a5-8773-92e53ee10d45" rows="7"
						cols="60" />
				</td>
			</tr>
			<tr class="spaceUnder">
				<td colspan="6">Confirmed Disease Stage</td>
			</tr>
			<tr class="checkboxGroup">
				<td>Overall Stage*:</td>
				<td><obs id="metastaticStageOS0"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="11ad3741-d3fe-48ff-8872-ce42c8764d34"
						answerLabel="0" />
				</td>
				<td><obs id="metastaticStageOS1"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="39c6497d-fe50-4dcf-86e4-5360e1d32f82"
						answerLabel="I" />
				</td>
				<td><obs id="metastaticStageOS2"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="c899d4c0-91a1-42f2-b395-114740f237fd"
						answerLabel="II" />
				</td>
				<td><obs id="metastaticStageOS3"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="1d5896f3-2e0e-4bc2-aa6c-afe1911afa79"
						answerLabel="III" />
				</td>
				<td><obs id="metastaticStageOS4"
						conceptId="e9cf4aed-34be-4c0a-9004-4294d9bb2d74"
						answerConceptId="d2f21acb-9519-42ca-a72d-2fcb6bb15c5d"
						answerLabel="IV" />
				</td>
			</tr>
			</obsgroup>
		</TBODY>
		<TBODY id="toggleble19">
			<tr class="spaceUnder">
				<td colspan="6">Confirmed Diagnosis Details (include a copy of
					pathology report in chart)</td>
			</tr>
			<obsgroup groupingConceptId="92fee1a2-d4de-43c2-b880-d4235b889986">

			<tr>
				<td colspan="6"><obs id="otherLiquidDiagnosisCommentsObs"
						conceptId="826af985-d6b8-46a5-8773-92e53ee10d45" rows="7"
						cols="60" />
				</td>
			</tr>

			<tr class="spaceUnder">
				<td colspan="6">Confirmed Disease Stage</td>
			</tr>
			<tr>
				<td><obs id="otherLiquidStageOSObs"
						conceptId="ed671ebe-7b3e-40ed-a1ef-3d758b54fc97"
						labelText="Other liquid staging:" />
				</td>
				<td></td>
				<td></td>
				<td colspan="3"></td>
			</tr>
			</obsgroup>
		</TBODY>
	</table>
	<br />
	<table class="togglebles" width="100%">
		<tr>
			<th class="tableHeader" colspan="3">PATHOLOGY</th>
		</tr>
		<obsgroup groupingConceptId="639fb794-8a5a-4958-b4b1-749e554f44fb">
		<tr class="checkboxGroup , spaceUnder">
			<td width="400px">Pathology completed</td>
			<td id="trigger20" width="265px"><obs id="pathologyCompletedYes"
					conceptId="145c13d3-dfbb-4dc6-9986-d10fd5e9bf48"
					answerConceptId="3cd6f600-26fe-102b-80cb-0017a47871b2"
					answerLabel="Yes" style="checkbox" />
			</td>
			<td><obs id="pathologyCompletedNo"
					conceptId="145c13d3-dfbb-4dc6-9986-d10fd5e9bf48"
					answerConceptId="3cd6f86c-26fe-102b-80cb-0017a47871b2"
					answerLabel="NO" style="checkbox" />
			</td>
		</tr>
		<TBODY id="toggleble20">
			<tr class="checkboxGroup , spaceUnder">
				<td>Date:<obs id="dateOfPathologyObs"
						conceptId="926dd83d-5c6c-43d9-9fb8-a8c2e364d5f6" labelText="" /><br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;(date
					of report)</td>
				<td>Site of Pathology:<obs id="siteOfPathologyObs"
						conceptId="ca421c58-2c81-4fac-8cf7-aced4f2896e8" labelText="" />
				</td>
				<td></td>
			</tr>
		</TBODY>
		</obsgroup>
	</table>
	<br />
	<table id="existingAndNewAllergiesScreenView" class="togglebles"
		width="100%">

		<tr>
			<th class="tableHeader" colspan="3">ALLERGIES</th>
		</tr>
		<tr class="spaceUnder">
			<td colspan="3"></td>
		</tr>
		<tr>
			<td colspan="3"><b>Existing Allergies</b>
			</td>
		</tr>
		<tr class="spaceUnder">
			<td colspan="3"></td>
		</tr>
		<tr bgcolor="#009D8E">
			<th><font color="white">Causes</font>
			</th>
			<th><font color="white">Reaction</font>
			</th>
			<th><font color="white">Year of Reaction</font>
			</th>
		</tr>
		<lookup
			complexExpression="#set($obsGroupList = [])	
						
						#foreach($encounter in $fn.allEncounters(null)) 
						                                         #foreach($obs in $encounter.obs)
				                                                   #if( $obs.obsGroup.concept.uuid == '3cd95d5a-26fe-102b-80cb-0017a47871b2' )
				                                                     #if( ($obsGroupList.contains($obs.obsGroup)) )			                                                
				                                                     	
				                                                     #else
                                                                       #set($_usls =$obsGroupList.add($obs.obsGroup))	
                                                                     #end		                                                     
				                                                    #end				                                                   	
				                                                   #end					                                                                                              
				                                                 #end
				                                      #foreach($obsGroup in $obsGroupList)
				                                      &lt;tr class='existingAllergy'>
                                                        #foreach($o in $obsGroup.groupMembers)
                                                         #if( $o.concept.uuid == '3cd95ed6-26fe-102b-80cb-0017a47871b2' )
                                                            #set($causes = $o.valueCoded.name)	                                                        
                                                         #elseif( $o.concept.uuid == '3cd96052-26fe-102b-80cb-0017a47871b2' )
                                                            #set($reaction = $o.valueCoded.name)
                                                         #elseif( $o.concept.uuid == '3cd964bc-26fe-102b-80cb-0017a47871b2' )
                                                          #set($year = $o.valueDatetime)
                                                        #end      
                                                      #end           
                                                        &lt;td style='border: 1px solid black; border-collapse: collapse;'> $causes &lt;/td>  &lt;td style='border: 1px solid black; border-collapse: collapse;'> $reaction &lt;/td>  &lt;td style='border: 1px solid black; border-collapse: collapse;'> $year &lt;/td>                                            
                                                      &lt;/tr>
                                                    #end" />
		<tr class="spaceUnder">
			<td colspan="3"></td>
		</tr>
		<tr class="spaceUnder">
			<td colspan="3"><b>Add New Allergies</b></td>
		</tr>

		<tr bgcolor="#009D8E">
			<th><font color="white">Causes</font>
			</th>
			<th><font color="white">Reaction</font>
			</th>
			<th><font color="white">Year of Reaction</font>
			</th>
		</tr>

		<tr>
			<obsgroup groupingConceptId="3cd95d5a-26fe-102b-80cb-0017a47871b2">
			<td><obs id="firstAllergyCauses"
					conceptId="3cd95ed6-26fe-102b-80cb-0017a47871b2" /> <obs
					id="firstCausesOtherNonCoded"
					conceptId="2c62cce0-8b88-4b9e-8b22-c99c7ccc3e27"
					labelText="Specify:" /></td>
			<td><obs id="firstAllergyReaction"
					conceptId="3cd96052-26fe-102b-80cb-0017a47871b2" /> <obs
					id="firstReactionOtherNonCoded"
					conceptId="3cdd0c48-26fe-102b-80cb-0017a47871b2"
					labelText="Specify:" /></td>
			<td><obs id="firstAllergyYear"
					conceptId="3cd964bc-26fe-102b-80cb-0017a47871b2" />
			</td>
			</obsgroup>
		</tr>
		<tr>
			<obsgroup groupingConceptId="3cd95d5a-26fe-102b-80cb-0017a47871b2">
			<td><obs id="secondAllergyCauses"
					conceptId="3cd95ed6-26fe-102b-80cb-0017a47871b2" /> <obs
					id="secondCausesOtherNonCoded"
					conceptId="2c62cce0-8b88-4b9e-8b22-c99c7ccc3e27"
					labelText="Specify:" /></td>
			<td><obs id="secondAllergyReaction"
					conceptId="3cd96052-26fe-102b-80cb-0017a47871b2" /> <obs
					id="secondReactionOtherNonCoded"
					conceptId="3cdd0c48-26fe-102b-80cb-0017a47871b2"
					labelText="Specify:" /></td>
			<td><obs id="secondAllergyYear"
					conceptId="3cd964bc-26fe-102b-80cb-0017a47871b2" />
			</td>
			</obsgroup>
		</tr>
		<tr>
			<obsgroup groupingConceptId="3cd95d5a-26fe-102b-80cb-0017a47871b2">
			<td><obs id="thirdAllergyCauses"
					conceptId="3cd95ed6-26fe-102b-80cb-0017a47871b2" /> <obs
					id="thirdCausesOtherNonCoded"
					conceptId="2c62cce0-8b88-4b9e-8b22-c99c7ccc3e27"
					labelText="Specify:" /></td>
			<td><obs id="thirdAllergyReaction"
					conceptId="3cd96052-26fe-102b-80cb-0017a47871b2" /> <obs
					id="thirdReactionOtherNonCoded"
					conceptId="3cdd0c48-26fe-102b-80cb-0017a47871b2"
					labelText="Specify:" />
			</td>
			<td><obs id="thirdAllergyYear"
					conceptId="3cd964bc-26fe-102b-80cb-0017a47871b2" /></td>
			</obsgroup>
		</tr>
	</table>
	<br />
	<table width="100%">
		<tr>
			<th class="tableHeader" colspan="4">TREATMENT PLAN</th>
		</tr>
		<tr class="checkboxGroup , treatmentPlan">
			<td>Intent</td>
			<td id="treatmentCurative"><workflowState
					workflowId="bc04fe8c-869e-4b9b-8b9f-7224c0a3cb1f"
					stateId="cb777216-77f6-478a-9353-12ed7e85a929"
					stateLabel="Curative" type="checkbox" /></td>
			<td id="treatmentPalliative"><workflowState
					workflowId="bc04fe8c-869e-4b9b-8b9f-7224c0a3cb1f"
					stateId="eb4eeb73-996d-47c9-928e-f0569999eefa"
					stateLabel="Palliative systemic therapy" type="checkbox" /></td>
			<td id="treatmentPalliation"><workflowState
					workflowId="bc04fe8c-869e-4b9b-8b9f-7224c0a3cb1f"
					stateId="353e32de-4b62-4e09-9a4d-829942483db0"
					stateLabel="Palliation ONLY" type="checkbox" /></td>
		</tr>
		<tr class="checkboxGroup , surgery">
			<td>Surgery</td>
			<td id="trigger21"><workflowState
					workflowId="f213cee1-df80-4a6d-a3eb-44e4581c3479"
					stateId="d9a71d5e-cad4-432b-ab00-6a1edc7a226d" stateLabel="Planned"
					type="checkbox" /></td>
			<td><workflowState
					workflowId="f213cee1-df80-4a6d-a3eb-44e4581c3479"
					stateId="16387e03-5410-45e1-9f98-9e82ba245605"
					stateLabel="Not planned" type="checkbox" /></td>
			<td></td>

		</tr>
		<tr class="checkboxGroup , radiation">
			<td>Radiation therapy</td>
			<td id="trigger22"><workflowState
					workflowId="bf1d4a87-4219-4741-ac9a-770fb7cb7036"
					stateId="37848fcc-ecc3-460d-9c69-4fd3c9f3f767" stateLabel="Planned"
					type="checkbox" /></td>
			<td><workflowState
					workflowId="bf1d4a87-4219-4741-ac9a-770fb7cb7036"
					stateId="3543071e-e416-4fe2-89e9-6d55506c6c72"
					stateLabel="Not planned" type="checkbox" /></td>
			<td></td>

		</tr>
		<tr class="checkboxGroup , chemotherapy">
			<td>Chemotherapy</td>
			<td id="trigger23"><workflowState
					workflowId="e0a43e8d-27ce-4417-a497-54974c699bc0"
					stateId="73521919-ea8b-43e9-ad44-20fbdad33a75" stateLabel="Planned"
					type="checkbox" /></td>
			<td><workflowState
					workflowId="e0a43e8d-27ce-4417-a497-54974c699bc0"
					stateId="3f13abb5-0a00-4fac-b89b-4d0679c3b6e1"
					stateLabel="Not planned" type="checkbox" /></td>
			<td></td>
		</tr>
	</table>
	<table class="togglebles" width="100%">
		<obsgroup groupingConceptId="c0f544c2-b233-4956-a8d6-b75153992f00">
		<TBODY id="toggleble21">
			<tr>
				<th class="tableHeader" colspan="4">SURGERY</th>
			</tr>
			<tr>
				<td>Facility</td>
				<td><obs id="surgeryFacilityObs"
						conceptId="eca1ee04-ad37-41c3-8c09-e4c7e8b1caf0" labelText="" />
				</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>Planned dates</td>
				<td><obs id="surgeryStartDateObs"
						conceptId="374720cf-262b-4b96-ab08-c34979230f0b"
						labelText="Start date:" /></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>Type of surgery</td>
				<td><obs id="surgeryTypeObs"
						conceptId="3a794302-d39d-41ba-a835-917c23bf5560" labelText="" />
				</td>
				<td></td>
				<td></td>
			</tr>
		</TBODY>
		</obsgroup>
	</table>
	<table class="togglebles" width="100%">
		<obsgroup groupingConceptId="63ad7caa-b6e2-4b9a-b462-771a9b048c36">
		<TBODY id="toggleble22">
			<tr>
				<th class="tableHeader" colspan="4">RADIATION THERAPY</th>
			</tr>
			<tr>
				<td>Facility</td>
				<td><obs id="radiationFacilityObs"
						conceptId="09693eb4-aa3d-4804-bcc3-eb149cb0614a"
						defaultValue="ceac8227-23ec-4f51-9dab-6ed3886151aa" labelText="" />
				</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>Planned dates</td>
				<td><obs id="radiationStartDateObs"
						conceptId="b5f3650e-7614-4d13-8676-dd420458e1ba"
						labelText="Start date:" /></td>
				<td></td>
				<td></td>
			</tr>
		</TBODY>
		</obsgroup>
	</table>
	<table class="togglebles" width="100%">
		<obsgroup groupingConceptId="d4ceafd0-e5b5-422a-aecd-eac58207cbcc">
		<TBODY id="toggleble23">
			<tr>
				<th class="tableHeader" colspan="4">CHEMOTHERAPY</th>
			</tr>
			<tr>
				<td>Regimen</td>
				<td><obs id="chemotherapyRegimenObs"
						conceptId="012df739-5bd1-445c-a76e-de0d5702d86a" labelText="" />
				</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>Cycles</td>
				<td><obs id="chemotherapyCyclesObs"
						conceptId="aaeb5782-3ee6-4cb8-9d27-c557ad91e241" labelText="" />
				</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>Planned first cycle</td>
				<td><obs id="chemotherapyFirstCycleObs"
						conceptId="e9b59f4e-8a3f-467f-b5e0-1296025fb286" labelText="" />
				</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>Planned regimen length</td>
				<td><obs id="chemotherapyRegimenEndObs"
						conceptId="6ecc0570-9711-47ad-b9f9-997dd0964e17" labelText="" />weeks</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>Planned changes to standard regimen</td>
				<td><obs id="chemotherapyStandardRegimenObs"
						conceptId="d6e5e3a7-2ab7-45c2-a104-4f49ed01aefc" labelText="" />
				</td>
				<td></td>
				<td></td>
			</tr>
		</TBODY>
		</obsgroup>
	</table>
	<br />
	<workflowState workflowId="c8dea23e-c596-40d0-a4a4-08cb61b82d3b"
		stateId="09426655-2909-4f6f-938b-7a31b991075e" type="hidden" />
	<submit />
</div>

<script type="text/javascript">
    if(jQuery){
      $j(document).ready(function(){
    	  
    	 var firstInitialCausesValue = $j("#firstAllergyCauses  option:selected").text();
    	 if(firstInitialCausesValue == "")
    		 getField('firstCausesOtherNonCoded.value')[0].disabled = true;
    	 
    	  getField('firstAllergyCauses.value').change(function() {
    		  var checkNonCoded= $j("#firstAllergyCauses  option:selected").text();
    		  if( checkNonCoded == "OTHER NON-CODED") {
                  getField('firstCausesOtherNonCoded.value')[0].disabled = false;
          } else {
                  getField('firstCausesOtherNonCoded.value')[0].disabled = true;
          }
    	         });
    	  
    	  var firstInitialReactionValue = $j("#firstAllergyReaction  option:selected").text();
     	 if(firstInitialReactionValue == "")
     		 getField('firstReactionOtherNonCoded.value')[0].disabled = true;
     	 
     	  getField('firstAllergyReaction.value').change(function() {
     		  var checkNonCoded= $j("#firstAllergyReaction  option:selected").text();
     		  if( checkNonCoded == "OTHER NON-CODED") {
                   getField('firstReactionOtherNonCoded.value')[0].disabled = false;
           } else {
                   getField('firstReactionOtherNonCoded.value')[0].disabled = true;
           }
     	         });
    	  
    	   	 var secondInitialCausesValue = $j("#secondAllergyCauses  option:selected").text();
        	 if(secondInitialCausesValue == "")
        		 getField('secondCausesOtherNonCoded.value')[0].disabled = true;
        	 
        	  getField('secondAllergyCauses.value').change(function() {
        		  var checkNonCoded= $j("#secondAllergyCauses  option:selected").text();
        		  if( checkNonCoded == "OTHER NON-CODED") {
                      getField('secondCausesOtherNonCoded.value')[0].disabled = false;
              } else {
                      getField('secondCausesOtherNonCoded.value')[0].disabled = true;
              }
        	         });
        	  
        	  var secondInitialReactionValue = $j("#secondAllergyReaction  option:selected").text();
          	 if(secondInitialReactionValue == "")
          		 getField('secondReactionOtherNonCoded.value')[0].disabled = true;
          	 
          	  getField('secondAllergyReaction.value').change(function() {
          		  var checkNonCoded= $j("#secondAllergyReaction  option:selected").text();
          		  if( checkNonCoded == "OTHER NON-CODED") {
                        getField('secondReactionOtherNonCoded.value')[0].disabled = false;
                } else {
                        getField('secondReactionOtherNonCoded.value')[0].disabled = true;
                }
          	         });
        	  
        	   	 var thirdInitialCausesValue = $j("#thirdAllergyCauses  option:selected").text();
            	 if(thirdInitialCausesValue == "")
            		 getField('thirdCausesOtherNonCoded.value')[0].disabled = true;
            	 
            	  getField('thirdAllergyCauses.value').change(function() {
            		  var checkNonCoded= $j("#thirdAllergyCauses  option:selected").text();
            		  if( checkNonCoded == "OTHER NON-CODED") {
                          getField('thirdCausesOtherNonCoded.value')[0].disabled = false;
                  } else {
                          getField('thirdCausesOtherNonCoded.value')[0].disabled = true;
                  }
            	         });
            	  
            	  var thirdInitialReactionValue = $j("#thirdAllergyReaction  option:selected").text();
               	 if(thirdInitialReactionValue == "")
               		 getField('thirdReactionOtherNonCoded.value')[0].disabled = true;
               	 
               	  getField('thirdAllergyReaction.value').change(function() {
               		  var checkNonCoded= $j("#thirdAllergyReaction  option:selected").text();
               		  if( checkNonCoded == "OTHER NON-CODED") {
                             getField('thirdReactionOtherNonCoded.value')[0].disabled = false;
                     } else {
                             getField('thirdReactionOtherNonCoded.value')[0].disabled = true;
                     }
               	         });
    	  
    	  
        });
}
    </script> <script type="text/javascript">
	if (jQuery) {
		$j(document).ready(function() {			
			    $j(".checkboxGroup").each(function(){
			        var checkboxGroup = $j(this);
			        var checkedBox = checkboxGroup.find(":checked");	
			        if(checkedBox.is(':checked')){
		        		 var which = checkedBox.closest("td").attr("id");
		        		 if(which !=""){
		        			 var triggerIndex = which.substring(7);
		        	         var sectionId= "toggleble"+triggerIndex;
		        	         $j(".togglebles").find("tbody[id$="+sectionId+"]").show();
		        		 }
		        	 }
			 });
			 
			 beforeSubmit.push(function() {    	
					var elements = [];
					$j("td[id^='trigger']").each(function(){
					   elements.push(this.id); 
					});

					for(var i = 0; i &lt; elements.length; i++){
						if(!$j('#'+elements[i]).find('input').is(":checked")){
							var triggerIndex = elements[i].substring(7);
				        	var sectionId= "toggleble"+triggerIndex;           
				             $j('#'+sectionId+' :input').each(function(){         
				            	  //clear values that may have been recorded for othe solid or other liquid cancer type
				            	  //if they are not the cancer type selected
				            	   if(sectionId == "toggleble10")
				            		   $j("#otherSolidSpec").find("input[type$='text']").val("");
				            	   
				            	   if(sectionId == "toggleble19")
				            		   $j("#otherLiquidSpec").find("input[type$='text']").val("");
				            	   
				            	    var type = this.type;
				            	    var tag = this.tagName.toLowerCase(); // normalize case
				            	    // it's ok to reset the value attr of text inputs,
				            	    // password inputs, and textareas. This is a general case though, as I don't have password inputs in this form
				            	    if (type == 'text' || type == 'password' || tag == 'textarea')
				            	      this.value = "";
				            	    //if input is the jQuery datepicker, using this.value ="" will not clear the input
				            	    //we clear the input by setting the date to null with jQuery
				            	    else if ($j(this).datepicker().is('.hasDatepicker'))
				            	    	$j(this).datepicker( "setDate" , null );
				            	    // checkboxes and radios need to have their checked state cleared
				            	    // but should *not* have their 'value' changed
				            	    else if (type == 'checkbox' || type == 'radio')
				            	      this.checked = false;
				            	    // select elements need to have their 'selectedIndex' property set to -1
				            	    // (this works for both single and multiple select elements)
				            	    else if (tag == 'select')
				            	      this.selectedIndex = -1;	
				          	 }); 
						}
						
					}
				    return true;
				});
		});
		
	}
</script> <ifMode mode="EDIT"> <script type="text/javascript">
  var hideAll = function(){
            $j(".togglebles").find("tbody[id^='toggleble']").hide();
            $j(".togglebles").find("span[id^='toggleble']").hide();
        }
               
        hideAll();
        </script> </ifMode> <ifMode mode="ENTER"> <script type="text/javascript">
  var hideAll = function(){
            $j(".togglebles").find("tbody[id^='toggleble']").hide();
            $j(".togglebles").find("span[id^='toggleble']").hide();
        }
               
        hideAll();
        </script> </ifMode> <ifMode mode="VIEW"> <script type="text/javascript">
 	
       var elements = [];
		$j("td[id^='trigger']").each(function(){
		   elements.push(this.id); 
		});

		for(var i = 0; i &lt; elements.length; i++){
			if($j('#'+elements[i]).children("span").attr("class") != 'value'){
				var triggerIndex = elements[i].substring(7);
	        	var sectionId= "toggleble"+triggerIndex;
	        	 $j(".togglebles").find("tbody[id$="+sectionId+"]").hide();
			}
		}
 	 
       </script> </ifMode> </htmlform>