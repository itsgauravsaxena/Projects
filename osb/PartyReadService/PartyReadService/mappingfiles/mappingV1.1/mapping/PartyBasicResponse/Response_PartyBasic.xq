xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$getNordeaPartyResponse1" element="ns9:getNordeaPartyResponse" location="../../interface/NordeaServices.wsdl" ::)
(:: pragma bea:global-element-return element="ns6:retrievePartyResponse" location="../../interface/PartyRead_v1.1.wsdl" ::)

declare namespace xf = "http://tempuri.org/Party/PartyRead/v1.1.0/mapping/PartyBasicResponse/Response_PartyBasic/";
declare namespace ns6 = "http://soa.nordea.com/party/partyread/v1.1";
declare namespace ns5 = "http://soa.nordea.com/party/customerresponsibleandcruslib/v1.0";
declare namespace ns8 = "http://error.ntpsoa.nordea.com/object/v1";
declare namespace ns7 = "http://soa.nordea.com/party/partyclassificationinformationlib/v1.0";
declare namespace ns9 = "http://services.ecs.mdm.nordea.com/NordeaServices/port";
declare namespace ns0 = "http://soa.nordea.com/party/partycommonfieldslib/v1.0";
declare namespace ns2 = "http://soa.nordea.com/party/partyidentificationinformationlib/v1.2";
declare namespace ns1 = "http://www.ibm.com/mdm/schema";
declare namespace ns4 = "http://soa.nordea.com/party/partybasiclib/v1.4";
declare namespace ns3 = "http://soa.nordea.com/party/partycontactinformationlib/v1.2";

declare function xf:Response_PartyBasic($getNordeaPartyResponse1 as element(ns9:getNordeaPartyResponse))
    as element(ns6:retrievePartyResponse) {
         <ns6:retrievePartyResponse>
            <ns6:partyResponseBobj>
            <ns2:requestPartyIdBobj>
                    <ns2:partyIdentifierBobj>
                        <ns2:partyId>{ data($getNordeaPartyResponse1/ns1:NordeaBObj/ns1:TCRMAdminContEquivBObj/ns1:AdminPartyId) }</ns2:partyId>
                        <ns2:partyIdType>{ data($getNordeaPartyResponse1/ns1:NordeaBObj/ns1:TCRMAdminContEquivBObj/ns1:AdminSystemValue) }</ns2:partyIdType>
                    </ns2:partyIdentifierBobj>
                </ns2:requestPartyIdBobj>
                <ns4:partyBasicBobj>
                {
                if (fn:exists($getNordeaPartyResponse1/ns1:NordeaBObj/ns1:TCRMPersonBObj)) then
                    <ns4:personBobj>
                    
                    {
                            let $__nullable := ( data($getNordeaPartyResponse1/ns1:NordeaBObj/ns1:TCRMPersonBObj/ns1:BirthDate) )
                            return
                                if (fn:boolean($__nullable))
                                then
                                    <ns4:dateOfBirth>{xs:date(xs:dateTime(fn:replace(data($__nullable),' ','T')))}</ns4:dateOfBirth>
                                else
                                    ()
                        }
                        
                        
                         {
                            let $__nullable := ( data($getNordeaPartyResponse1/ns1:NordeaBObj/ns1:TCRMPersonBObj/ns1:DeceasedDate) )
                            return
                                if (fn:boolean($__nullable))
                                then
                                   <ns4:deceasedDate>{xs:date(xs:dateTime(fn:replace(data($__nullable),' ','T')))}</ns4:deceasedDate>
                                else
                                    ()
                        }
                        
                        <ns4:gender>{ data($getNordeaPartyResponse1/ns1:NordeaBObj/ns1:TCRMPersonBObj/ns1:GenderType) }</ns4:gender>
                        <ns4:noCitizenshipReason>
                            {
                                typeswitch ($getNordeaPartyResponse1/ns1:NordeaBObj/ns1:TCRMPersonBObj/ns1:TCRMExtension/(ns1:CommonExtensionBObj | ns1:XPersonBObjExt))
                                case $case2 as element(ns1:CommonExtensionBObj)  return ($getNordeaPartyResponse1/ns1:NordeaBObj/ns1:TCRMPersonBObj/ns1:TCRMExtension/ns1:CommonExtensionBObj/text())  
                                case $case3 as element(ns1:XPersonBObjExt)  return ($getNordeaPartyResponse1/ns1:NordeaBObj/ns1:TCRMPersonBObj/ns1:TCRMExtension/ns1:XPersonBObjExt/ns1:CitizenshipMissingReason/text())  
                                default return ()
                            }
                        </ns4:noCitizenshipReason>
                        {
                        for $TCRMPersonName at $i in ($getNordeaPartyResponse1/ns1:NordeaBObj/ns1:TCRMPersonBObj/ns1:TCRMPersonNameBObj)
                        return
                        <ns4:personNameBobj>
                            <ns4:givenNameOne>{ data($getNordeaPartyResponse1/ns1:NordeaBObj/ns1:TCRMPersonBObj/ns1:TCRMPersonNameBObj[$i]/ns1:GivenNameOne) }</ns4:givenNameOne>
                            <ns4:givenNameTwo>{ data($getNordeaPartyResponse1/ns1:NordeaBObj/ns1:TCRMPersonBObj/ns1:TCRMPersonNameBObj[$i]/ns1:GivenNameTwo) }</ns4:givenNameTwo>
                            <ns4:givenNameThree>{ data($getNordeaPartyResponse1/ns1:NordeaBObj/ns1:TCRMPersonBObj/ns1:TCRMPersonNameBObj[$i]/ns1:GivenNameThree) }</ns4:givenNameThree>
                            <ns4:givenNameFour>{ data($getNordeaPartyResponse1/ns1:NordeaBObj/ns1:TCRMPersonBObj/ns1:TCRMPersonNameBObj[$i]/ns1:GivenNameFour) }</ns4:givenNameFour>
                            <ns4:lastName>{ data($getNordeaPartyResponse1/ns1:NordeaBObj/ns1:TCRMPersonBObj/ns1:TCRMPersonNameBObj[$i]/ns1:LastName) }</ns4:lastName>
                            <ns4:personNameType>{ fn:upper-case(data($getNordeaPartyResponse1/ns1:NordeaBObj/ns1:TCRMPersonBObj/ns1:TCRMPersonNameBObj[$i]/ns1:NameUsageValue)) }</ns4:personNameType>
                        </ns4:personNameBobj>
                        }
                        {
                               for $K  in ($getNordeaPartyResponse1/ns1:NordeaBObj/ns1:TCRMPersonBObj/ns1:TCRMExtension/ns1:XPersonBObjExt union $getNordeaPartyResponse1/ns1:NordeaBObj/ns1:TCRMPersonBObj/ns1:TCRMExtension/ns1:CommonExtensionBObj)
                                return
                                
                                        if (fn:local-name($K) = "XPersonBObjExt") then
                                            <ns4:occupationBobj>
                                <ns4:occupationType>{($K/ns1:OccupationCodeValue/text())}</ns4:occupationType>
                                <ns4:occupationText>{($K/ns1:OccupationText/text())}</ns4:occupationText>
                                </ns4:occupationBobj>
                                        else 
                                           ()
                                    
                            }
                            {
                            for $TCRMPersonBObj at $i in ($getNordeaPartyResponse1/ns1:NordeaBObj/ns1:PepRoleBObj)
                        return
                            <ns4:pepStatusBobj>
                            <ns4:pepRole>{
                            if (data($getNordeaPartyResponse1/ns1:NordeaBObj/ns1:PepRoleBObj[$i]/ns1:PepRoleCodeValue)="PEP")
                            then ('No Role Available')
                            else (data($getNordeaPartyResponse1/ns1:NordeaBObj/ns1:PepRoleBObj[$i]/ns1:PepRoleCodeValue))
                             }</ns4:pepRole>
                            
                            <ns0:countryCode>{ data($getNordeaPartyResponse1/ns1:NordeaBObj/ns1:PepRoleBObj[$i]/ns1:PepCountryCodeValue) }</ns0:countryCode>
                            
                            {
                            let $__nullable := ( data($getNordeaPartyResponse1/ns1:NordeaBObj/ns1:PepRoleBObj[$i]/ns1:StartDate) )
                            return
                                if (fn:boolean($__nullable))
                                then
                                    <ns0:validFromDate>{xs:date(xs:dateTime(fn:replace(data($__nullable),' ','T')))}</ns0:validFromDate>
                                else
                                    ()
                        }
                        
                        
                            {
                            
                            let $__nullable := ( data($getNordeaPartyResponse1/ns1:NordeaBObj/ns1:PepRoleBObj[$i]/ns1:EndDate) )
                            return
                                if (fn:boolean($__nullable))
                                then
                                    <ns0:validToDate>{xs:date(xs:dateTime(fn:replace(data($__nullable),' ','T')))}</ns0:validToDate>
                                else
                                    ()
                        }
                        
                        <ns0:partyDataSourceType>{data($getNordeaPartyResponse1/ns1:NordeaBObj/ns1:PepRoleBObj[$i]/ns1:SourceIdentifierType)}</ns0:partyDataSourceType>
                           
                        </ns4:pepStatusBobj>
                        }
                    </ns4:personBobj>
                    else if(fn:exists($getNordeaPartyResponse1/ns1:NordeaBObj/ns1:TCRMOrganizationBObj))
                then 
                <ns4:organisationBobj>
                <ns4:mainOrganisationType>
                {
                                typeswitch ($getNordeaPartyResponse1/ns1:NordeaBObj/ns1:TCRMOrganizationBObj/ns1:TCRMExtension/(ns1:CommonExtensionBObj | ns1:XNaceOrgBObjExt))
                                case $case2 as element(ns1:CommonExtensionBObj)  return ($getNordeaPartyResponse1/ns1:NordeaBObj/ns1:TCRMOrganizationBObj/ns1:TCRMExtension/ns1:CommonExtensionBObj/text())  
                                case $case3 as element(ns1:XNaceOrgBObjExt)  return ($getNordeaPartyResponse1/ns1:NordeaBObj/ns1:TCRMOrganizationBObj/ns1:TCRMExtension/ns1:XNaceOrgBObjExt/ns1:EntityStatusValue/text())  
                                default return ()
                            }
                </ns4:mainOrganisationType>
                
                {
                            let $__nullable := ( data($getNordeaPartyResponse1/ns1:NordeaBObj/ns1:TCRMOrganizationBObj/ns1:EstablishedDate) )
                            return
                                if (fn:boolean($__nullable))
                                then
                                    <ns4:legalRegistrationDate>{xs:date(xs:dateTime(fn:replace(data($__nullable),' ','T')))}</ns4:legalRegistrationDate>
                                else
                                    ()
                        }
                
                <ns4:legalRegistrationAuthority>
                {
                                typeswitch ($getNordeaPartyResponse1/ns1:NordeaBObj/ns1:TCRMOrganizationBObj/ns1:TCRMExtension/(ns1:CommonExtensionBObj | ns1:XIdentifierBObjExt))
                                case $case2 as element(ns1:CommonExtensionBObj)  return ($getNordeaPartyResponse1/ns1:NordeaBObj/ns1:TCRMOrganizationBObj/ns1:TCRMExtension/ns1:CommonExtensionBObj/text())  
                                case $case3 as element(ns1:XIdentifierBObjExt)  return ($getNordeaPartyResponse1/ns1:NordeaBObj/ns1:TCRMOrganizationBObj/ns1:TCRMExtension/ns1:XIdentifierBObjExt/ns1:IssuingAuthorityName/text())  
                                default return ()
                            }
                </ns4:legalRegistrationAuthority>
                <ns4:legalForm>{($getNordeaPartyResponse1/ns1:NordeaBObj/ns1:TCRMOrganizationBObj/ns1:OrganizationValue/text())}</ns4:legalForm>
               {
                for $M in ($getNordeaPartyResponse1/ns1:NordeaBObj/ns1:TCRMOrganizationBObj/ns1:TCRMOrganizationNameBObj)
                        return
                <ns4:orgNameBobj>
                <ns4:organisationName>{($M/ns1:OrganizationName/text())}</ns4:organisationName>
                <ns4:organisationNameType>{($M/ns1:NameUsageValue/text())}</ns4:organisationNameType>
                </ns4:orgNameBobj>
                }
                </ns4:organisationBobj>
                else ()
                    }
                    {
                        for $TCRMPersonBObj in $getNordeaPartyResponse1/ns1:NordeaBObj/ns1:PartyCountryPurposeBObj
                        return
                            <ns4:partyCountryBobj>
                                <ns0:countryCode>{data($TCRMPersonBObj/ns1:CountryValue)}</ns0:countryCode>
                                    <ns4:partyCountryCodeType>
                                {
                                    data($TCRMPersonBObj/ns1:CountryPurposeValue)
                                }
                                   </ns4:partyCountryCodeType>

                                {
                                                let $__nullable := ( data($TCRMPersonBObj/ns1:StartDate))
                                                return
                                                if (fn:boolean($__nullable))
                                                then
                                                <ns0:validFromDate>{xs:date(xs:dateTime(fn:replace(data($__nullable),' ','T')))}</ns0:validFromDate>
                                                else()
                                 }
                              {
                            let $__nullable := ( data($TCRMPersonBObj/ns1:EndDate))
                            return
                                if (fn:boolean($__nullable))
                                then
                                    <ns0:validToDate>{xs:date(xs:dateTime(fn:replace(data($__nullable),' ','T')))}</ns0:validToDate>
                                else
                                    ()
                                }
                               
                            </ns4:partyCountryBobj>
                    }
                  {
                  
                        for $Taxation in ($getNordeaPartyResponse1/ns1:NordeaBObj/ns1:PartyCountryPurposeBObj)
                        return
                        if(data($Taxation/ns1:CountryPurposeValue)='TAXATION') then
                        <ns4:partyTaxationBobj>
                        <ns4:taxRestrictionReason>{ data($Taxation/ns1:RestrictReasonValue) }</ns4:taxRestrictionReason>
                        <ns0:countryCode>{data($Taxation/ns1:CountryValue)}</ns0:countryCode>
                           </ns4:partyTaxationBobj>
                            else()
                  } 
                  {
                  for $observation in ($getNordeaPartyResponse1/ns1:NordeaBObj/ns1:ContactStatusBObj)
                  return
                  <ns4:partyObservationBobj>
                        <ns4:observationCode>{ data($observation/ns1:ObservationValue) }</ns4:observationCode>
                    </ns4:partyObservationBobj>
                  } 
                </ns4:partyBasicBobj>
            </ns6:partyResponseBobj>
        </ns6:retrievePartyResponse>
};

declare variable $getNordeaPartyResponse1 as element(ns9:getNordeaPartyResponse) external;

xf:Response_PartyBasic($getNordeaPartyResponse1)
