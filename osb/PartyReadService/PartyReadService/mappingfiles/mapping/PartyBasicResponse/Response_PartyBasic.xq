(:: pragma bea:global-element-parameter parameter="$getNordeaPartyResponse1" element="ns4:getNordeaPartyResponse" location="../../interface/NordeaServices.wsdl" ::)
(:: pragma bea:global-element-return element="ns6:retrievePartyResponse" location="../../interface/PartyRead_v1.0.wsdl" ::)

declare namespace ns2 = "http://www.ibm.com/mdm/schema";
declare namespace ns1 = "http://soa.nordea.com/party/partyidentificationinformationlib/v1.1";
declare namespace ns4 = "http://services.ecs.mdm.nordea.com/NordeaServices/port";
declare namespace ns3 = "http://error.ntpsoa.nordea.com/object/v1";
declare namespace ns0 = "http://soa.nordea.com/party/partycontactinformationlib/v1.1";
declare namespace ns5 = "http://soa.nordea.com/party/partybasiclib/v1.2";
declare namespace xf = "http://tempuri.org/Party/PartyRead/v1.0.0/Response_PartyBasic/";
declare namespace ns6 = "http://soa.nordea.com/party/partyread/v1.0";

declare function xf:Response_PartyBasic($getNordeaPartyResponse1 as element(ns4:getNordeaPartyResponse))
    as element(ns6:retrievePartyResponse) {
        <ns6:retrievePartyResponse>
            <ns6:partyResponseBobj>
            <ns1:partyInternalIdentifierBobj>
                    <ns1:partyInternalId>{ data($getNordeaPartyResponse1/ns2:NordeaBObj/ns2:TCRMAdminContEquivBObj/ns2:AdminPartyId) }</ns1:partyInternalId>
                    <ns1:partyInternalIdType>{ data($getNordeaPartyResponse1/ns2:NordeaBObj/ns2:TCRMAdminContEquivBObj/ns2:AdminSystemValue) }</ns1:partyInternalIdType>
                </ns1:partyInternalIdentifierBobj>
                <ns5:partyBasicBobj>
                {
                if (fn:exists($getNordeaPartyResponse1/ns2:NordeaBObj/ns2:TCRMPersonBObj)) then
                    <ns5:personBobj>
                    <ns5:dateOfBirth>
                    {
                            let $__nullable := ( data($getNordeaPartyResponse1/ns2:NordeaBObj/ns2:TCRMPersonBObj/ns2:BirthDate) )
                            return
                                if (fn:boolean($__nullable))
                                then
                                    xs:date(xs:dateTime(fn:replace(data($__nullable),' ','T')))
                                else
                                    ()
                        }
                        </ns5:dateOfBirth>
                        <ns5:deceasedDate>
                         {
                            let $__nullable := ( data($getNordeaPartyResponse1/ns2:NordeaBObj/ns2:TCRMPersonBObj/ns2:DeceasedDate) )
                            return
                                if (fn:boolean($__nullable))
                                then
                                    xs:date(xs:dateTime(fn:replace(data($__nullable),' ','T')))
                                else
                                    ()
                        }
                        </ns5:deceasedDate>
                        <ns5:gender>{ data($getNordeaPartyResponse1/ns2:NordeaBObj/ns2:TCRMPersonBObj/ns2:GenderType) }</ns5:gender>
                        <ns5:noCitizenshipReason>
                            {
                                typeswitch ($getNordeaPartyResponse1/ns2:NordeaBObj/ns2:TCRMPersonBObj/ns2:TCRMExtension/(ns2:CommonExtensionBObj | ns2:XPersonBObjExt))
                                case $case2 as element(ns2:CommonExtensionBObj)  return ($getNordeaPartyResponse1/ns2:NordeaBObj/ns2:TCRMPersonBObj/ns2:TCRMExtension/ns2:CommonExtensionBObj/text())  
                                case $case3 as element(ns2:XPersonBObjExt)  return ($getNordeaPartyResponse1/ns2:NordeaBObj/ns2:TCRMPersonBObj/ns2:TCRMExtension/ns2:XPersonBObjExt/ns2:CitizenshipMissingReason/text())  
                                default return ()
                            }
</ns5:noCitizenshipReason>
                        <ns5:personNameBobj>
                            <ns5:givenNameOne>{ data($getNordeaPartyResponse1/ns2:NordeaBObj/ns2:TCRMPersonBObj/ns2:TCRMPersonNameBObj[1]/ns2:GivenNameOne) }</ns5:givenNameOne>
                            <ns5:givenNameTwo>{ data($getNordeaPartyResponse1/ns2:NordeaBObj/ns2:TCRMPersonBObj/ns2:TCRMPersonNameBObj[1]/ns2:GivenNameTwo) }</ns5:givenNameTwo>
                            <ns5:givenNameThree>{ data($getNordeaPartyResponse1/ns2:NordeaBObj/ns2:TCRMPersonBObj/ns2:TCRMPersonNameBObj[1]/ns2:GivenNameThree) }</ns5:givenNameThree>
                            <ns5:givenNameFour>{ data($getNordeaPartyResponse1/ns2:NordeaBObj/ns2:TCRMPersonBObj/ns2:TCRMPersonNameBObj[1]/ns2:GivenNameFour) }</ns5:givenNameFour>
                            <ns5:lastName>{ data($getNordeaPartyResponse1/ns2:NordeaBObj/ns2:TCRMPersonBObj/ns2:TCRMPersonNameBObj[1]/ns2:LastName) }</ns5:lastName>
                        </ns5:personNameBobj>
                        {
                               for $K  in ($getNordeaPartyResponse1/ns2:NordeaBObj/ns2:TCRMPersonBObj/ns2:TCRMExtension/ns2:XPersonBObjExt union $getNordeaPartyResponse1/ns2:NordeaBObj/ns2:TCRMPersonBObj/ns2:TCRMExtension/ns2:CommonExtensionBObj)
                                return
                                
                                        if (fn:local-name($K) = "XPersonBObjExt") then
                                            <ns5:occupationBobj>
                                <ns5:occupationType>{($K/ns2:OccupationCodeValue/text())}</ns5:occupationType>
                                <ns5:occupationText>{($K/ns2:OccupationText/text())}</ns5:occupationText>
                                </ns5:occupationBobj>
                                        else 
                                           ()
                                    
                            }
                            {
                            for $TCRMPersonBObj at $i in ($getNordeaPartyResponse1/ns2:NordeaBObj/ns2:PepRoleBObj)
                        return
                            <ns5:pepStatusBobj>
                            <ns5:pepRole>{
                            if (data($getNordeaPartyResponse1/ns2:NordeaBObj/ns2:PepRoleBObj[$i]/ns2:PepRoleCodeValue)="PEP")
                            then ('No Role Available')
                            else (data($getNordeaPartyResponse1/ns2:NordeaBObj/ns2:PepRoleBObj[$i]/ns2:PepRoleCodeValue))
                             }</ns5:pepRole>
                            
                            <ns5:pepCountryCode>{ data($getNordeaPartyResponse1/ns2:NordeaBObj/ns2:PepRoleBObj[$i]/ns2:PepCountryCodeValue) }</ns5:pepCountryCode>
                            <ns5:validFromDate>
                            {
                            let $__nullable := ( data($getNordeaPartyResponse1/ns2:NordeaBObj/ns2:PepRoleBObj[$i]/ns2:StartDate) )
                            return
                                if (fn:boolean($__nullable))
                                then
                                    xs:date(xs:dateTime(fn:replace(data($__nullable),' ','T')))
                                else
                                    ()
                        }
                        </ns5:validFromDate>
                        <ns5:validToDate>
                            {
                            
                            let $__nullable := ( data($getNordeaPartyResponse1/ns2:NordeaBObj/ns2:PepRoleBObj[$i]/ns2:EndDate) )
                            return
                                if (fn:boolean($__nullable))
                                then
                                    xs:date(xs:dateTime(fn:replace(data($__nullable),' ','T')))
                                else
                                    ()
                        }
                        </ns5:validToDate>
                        <ns5:pepStatusExpiryDate>
                         {
                            let $__nullable := ( data($getNordeaPartyResponse1/ns2:NordeaBObj/ns2:PepRoleBObj[$i]/ns2:PepStatusExpirydt) )
                            return
                                if (fn:boolean($__nullable))
                                then
                                    xs:date(xs:dateTime(fn:replace(data($__nullable),' ','T')))
                                else
                                    ()
                        }
                            
                         </ns5:pepStatusExpiryDate>   
                            
                        </ns5:pepStatusBobj>
                        }
                    </ns5:personBobj>
                    else if(fn:exists($getNordeaPartyResponse1/ns2:NordeaBObj/ns2:TCRMOrganizationBObj))
                then 
                <ns5:organisationBobj>
                <ns5:mainOrganisationType>
                {
                                typeswitch ($getNordeaPartyResponse1/ns2:NordeaBObj/ns2:TCRMOrganizationBObj/ns2:TCRMExtension/(ns2:CommonExtensionBObj | ns2:XNaceOrgBObjExt))
                                case $case2 as element(ns2:CommonExtensionBObj)  return ($getNordeaPartyResponse1/ns2:NordeaBObj/ns2:TCRMOrganizationBObj/ns2:TCRMExtension/ns2:CommonExtensionBObj/text())  
                                case $case3 as element(ns2:XNaceOrgBObjExt)  return ($getNordeaPartyResponse1/ns2:NordeaBObj/ns2:TCRMOrganizationBObj/ns2:TCRMExtension/ns2:XNaceOrgBObjExt/ns2:EntityStatusValue/text())  
                                default return ()
                            }
                </ns5:mainOrganisationType>
                <ns5:legalRegistrationDate>
                {
                            let $__nullable := ( data($getNordeaPartyResponse1/ns2:NordeaBObj/ns2:TCRMOrganizationBObj/ns2:EstablishedDate) )
                            return
                                if (fn:boolean($__nullable))
                                then
                                    xs:date(xs:dateTime(fn:replace(data($__nullable),' ','T')))
                                else
                                    ()
                        }
                </ns5:legalRegistrationDate>
                <ns5:legalRegistrationAuthority>
                {
                                typeswitch ($getNordeaPartyResponse1/ns2:NordeaBObj/ns2:TCRMOrganizationBObj/ns2:TCRMExtension/(ns2:CommonExtensionBObj | ns2:XIdentifierBObjExt))
                                case $case2 as element(ns2:CommonExtensionBObj)  return ($getNordeaPartyResponse1/ns2:NordeaBObj/ns2:TCRMOrganizationBObj/ns2:TCRMExtension/ns2:CommonExtensionBObj/text())  
                                case $case3 as element(ns2:XIdentifierBObjExt)  return ($getNordeaPartyResponse1/ns2:NordeaBObj/ns2:TCRMOrganizationBObj/ns2:TCRMExtension/ns2:XIdentifierBObjExt/ns2:IssuingAuthorityName/text())  
                                default return ()
                            }
                </ns5:legalRegistrationAuthority>
                <ns5:legalForm>{($getNordeaPartyResponse1/ns2:NordeaBObj/ns2:TCRMOrganizationBObj/OrganizationValue/text())}</ns5:legalForm>
               {
                for $M at $i in ($getNordeaPartyResponse1/ns2:NordeaBObj/ns2:TCRMOrganizationBObj/ns2:TCRMOrganizationNameBObj)
                        return
                <ns5:orgNameBobj>
                <ns5:organisationName>{($M[$i]/ns2:OrganizationName/text())}</ns5:organisationName>
                <ns5:organisationNameType>{($M[$i]/ns2:NameUsageValue/text())}</ns5:organisationNameType>
                </ns5:orgNameBobj>
                }
                </ns5:organisationBobj>
                else ()
                    }
                    
                    
                    
                    {
                        for $TCRMPersonBObj in $getNordeaPartyResponse1/ns2:NordeaBObj/ns2:TCRMPersonBObj/ns2:BirthPlaceType union $getNordeaPartyResponse1/ns2:NordeaBObj/ns2:CountryPurposeBObj
                        return
                            <ns5:partyCountryBobj>
                                <ns5:partyCountryCode>
                                    {
                                        if (fn:local-name($TCRMPersonBObj) = "BirthPlaceType") then
                                            (data($getNordeaPartyResponse1/ns2:NordeaBObj/ns2:TCRMPersonBObj/ns2:BirthPlaceValue))
                                        else 
                                            data($TCRMPersonBObj/ns2:CountryValue)
                                    }
</ns5:partyCountryCode>
<ns5:partyCountryCodeType>
                                {
                                    if (fn:local-name($TCRMPersonBObj) = "BirthPlaceType") then
                                        ("COUNTRY_OF_BIRTH")
                                    else 
                                        data($TCRMPersonBObj/ns2:CountryPurposeValue)
                                }
</ns5:partyCountryCodeType>

{
                                    if (fn:local-name($TCRMPersonBObj) = "BirthPlaceType") then
                                    <ns5:validFromDate>{
                                    let $__nullable := data($getNordeaPartyResponse1/ns2:NordeaBObj/ns2:TCRMPersonBObj/ns2:BirthDate)
                            return
                                if (fn:boolean($__nullable))
                                then
                                    xs:date(xs:dateTime(fn:replace(data($__nullable),' ','T')))
                                        
                                    else()}
                                    </ns5:validFromDate>
                                    else
                                   <ns5:validFromDate>
                                   {
                            let $__nullable := ( data($TCRMPersonBObj/ns2:StartDate))
                            return
                                if (fn:boolean($__nullable))
                                then
                                    xs:date(xs:dateTime(fn:replace(data($__nullable),' ','T')))
                                else
                                    ()
                        }</ns5:validFromDate>
                                        
                                }



                       <ns5:validToDate>
                              {
                                    if (fn:local-name($TCRMPersonBObj) = "BirthPlaceType") then
                                        ()
                                    else 
                                   
                            let $__nullable := ( data($TCRMPersonBObj/ns2:EndDate))
                            return
                                if (fn:boolean($__nullable))
                                then
                                    xs:date(xs:dateTime(fn:replace(data($__nullable),' ','T')))
                                else
                                    ()
                        
                                        
                                }
                                </ns5:validToDate>
                            </ns5:partyCountryBobj>
                    }
                    {
                    for $Z in $getNordeaPartyResponse1/ns2:NordeaBObj/ns2:TCRMPersonBObj union $getNordeaPartyResponse1/ns2:NordeaBObj/ns2:TCRMOrganizationBObj
                        return
                    <ns5:partyRoleBobj>
                    
                    <ns5:subPartyRole>{data($Z/TCRMPartyRelationshipBObj/RelationshipValue)}</ns5:subPartyRole>
                        
                    <ns5:validFromDate>
                    {
                            let $__nullable := ( data($Z/TCRMPartyRelationshipBObj/StartDate))
                            return
                                if (fn:boolean($__nullable))
                                then
                                    xs:date(xs:dateTime(fn:replace(data($__nullable),' ','T')))
                                else
                                    ()
                        }
                </ns5:validFromDate>
                <ns5:validToDate>
                 {
                            let $__nullable := ( data($Z/TCRMPartyRelationshipBObj/EndDate))
                            return
                                if (fn:boolean($__nullable))
                                then
                                    xs:date(xs:dateTime(fn:replace(data($__nullable),' ','T')))
                                else
                                    ()
                        }   
                    </ns5:validToDate>
                    </ns5:partyRoleBobj>
                    }
                </ns5:partyBasicBobj>
            </ns6:partyResponseBobj>
        </ns6:retrievePartyResponse>
};

declare variable $getNordeaPartyResponse1 as element(ns4:getNordeaPartyResponse) external;

xf:Response_PartyBasic($getNordeaPartyResponse1)