xquery version "1.0" encoding "Cp1252";
(:: pragma bea:global-element-parameter parameter="$getNordeaPartyResponse1" element="ns9:getNordeaPartyResponse" location="../../interface/NordeaServices.wsdl" ::)
(:: pragma bea:global-element-return element="ns6:retrievePartyResponse" location="../../interface/PartyRead_v1.1.wsdl" ::)

declare namespace xf = "http://tempuri.org/Party/PartyRead/v1.1.0/mapping/PartyContactInformation/Response_PartyContactInformation/";
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

declare function xf:Response_PartyContactInformation($getNordeaPartyResponse1 as element(ns9:getNordeaPartyResponse))
    as element(ns6:retrievePartyResponse) {
        <ns6:retrievePartyResponse>
            <ns6:partyResponseBobj>
                <ns2:requestPartyIdBobj>
                    <ns2:partyIdentifierBobj>
                        <ns2:partyId>{ data($getNordeaPartyResponse1/ns1:NordeaBObj/ns1:TCRMAdminContEquivBObj/ns1:AdminPartyId) }</ns2:partyId>
                        <ns2:partyIdType>{ data($getNordeaPartyResponse1/ns1:NordeaBObj/ns1:TCRMAdminContEquivBObj/ns1:AdminSystemValue) }</ns2:partyIdType>
                    </ns2:partyIdentifierBobj>
                </ns2:requestPartyIdBobj>
                {
                if (fn:exists($getNordeaPartyResponse1/ns1:NordeaBObj/ns1:TCRMPersonBObj)) then
                <ns3:partyContactInformationBobj>
                    {
                        for $A in $getNordeaPartyResponse1/ns1:NordeaBObj/ns1:TCRMPersonBObj/ns1:TCRMPartyContactMethodBObj union
                            $getNordeaPartyResponse1/ns1:NordeaBObj/ns1:TCRMPersonBObj/ns1:TCRMPartyAddressBObj
                        return
                            <ns3:contactInformationBobj>
                            
                            
                            {
                            let $__nullable := ( data($A/ns1:StartDate) )
                            return
                                if (fn:boolean($__nullable))
                                then
                                    <ns0:validFromDate>{xs:date(xs:dateTime(fn:replace(data($A/ns1:StartDate),' ','T')))}</ns0:validFromDate>
                                else
                                    ()
                        }
                        
                        
                        {
                            let $__nullable := ( data($A/ns1:EndDate) )
                            return
                                if (fn:boolean($__nullable))
                                then
                                    <ns0:validToDate>{xs:date(xs:dateTime(fn:replace(data($A/ns1:EndDate),' ','T')))}</ns0:validToDate>
                                else
                                    ()
                        }
                          {
                            let $__nullable := ( data($A/ns1:TCRMAddressBObj) )
                            return
                                if (fn:boolean($__nullable))
                                then
                                    <ns3:addressBobj>
                                    <ns3:addressLine1>{ data($A/ns1:TCRMAddressBObj/ns1:AddressLineOne) }</ns3:addressLine1>
                                    <ns3:addressLine2>{ data($A/ns1:TCRMAddressBObj/ns1:AddressLineTwo) }</ns3:addressLine2>
                                    <ns3:addressLine3>{ data($A/ns1:TCRMAddressBObj/ns1:AddressLineThree) }</ns3:addressLine3>
                                    <ns3:coName>{ data($A/ns1:CareOf) }</ns3:coName>
                                    <ns3:postalCode>{data($A/ns1:TCRMAddressBObj/ns1:ZipPostalCode)}</ns3:postalCode>
                                    <ns3:city>{ data($A/ns1:TCRMAddressBObj/ns1:City) }</ns3:city>
                                    <ns0:countryCode>{ data($A/ns1:TCRMAddressBObj/ns1:CountryValue) }</ns0:countryCode>
                                    <ns3:addressType>{ data($A/ns1:AddressUsageValue) }</ns3:addressType>                                   
                                </ns3:addressBobj>
                                     else
                                    ()
                        }
                         
                                {
                            let $__nullable := ( if (data($A/ns1:TCRMContactMethodBObj/ns1:ContactMethodValue) = ('MOBILE','LANDLINE','FAX')) then
                                            data($A/ns1:TCRMContactMethodBObj/ns1:ContactMethodValue)
                                        else 
                                            () )
                            return
                                if (fn:boolean($__nullable))
                                then
                                    <ns3:phoneNoBobj>
                                    <ns3:phoneNumberPresentation>
                                    {
                                        if (data($A/ns1:TCRMContactMethodBObj/ns1:ContactMethodValue) = ('MOBILE','LANDLINE','FAX')) then
                                            data($A/ns1:TCRMContactMethodBObj/ns1:ReferenceNumber)
                                        else 
                                            ()
                                    }
                                    </ns3:phoneNumberPresentation>
                                    <ns3:countryDialingCode>{ data($A/ns1:TCRMContactMethodBObj/ns1:TCRMPhoneNumberBObj/ns1:PhoneCountryCode) }</ns3:countryDialingCode>
                                    <ns3:areaCode>{ data($A/ns1:TCRMContactMethodBObj/ns1:TCRMPhoneNumberBObj/ns1:PhoneAreaCode) }</ns3:areaCode>
                                    <ns3:phoneNumber>{ data($A/ns1:TCRMContactMethodBObj/ns1:TCRMPhoneNumberBObj/ns1:PhoneNumber) }</ns3:phoneNumber>                                 
                                    {
                            let $__nullable := ( data($A/ns1:TCRMContactMethodBObj/ns1:TCRMPhoneNumberBObj/ns1:PhoneExtension) )
                            return
                                if (fn:boolean($__nullable))
                                then
                                    <ns3:extension>{ data($__nullable) }</ns3:extension>
                                else
                                    ()
                        } 
                                    <ns3:contactInfBobj>
                                    <ns3:contactInformationType>
                                    {
                                        if (data($A/ns1:TCRMContactMethodBObj/ns1:ContactMethodValue) = ('MOBILE','LANDLINE','FAX')) then
                                            data($A/ns1:ContactMethodUsageValue)
                                        else 
                                            ()
                                    }
                                    </ns3:contactInformationType>
                                    </ns3:contactInfBobj>
                                </ns3:phoneNoBobj>
                                else
                                    ()
                        }
                                
                               {
                            let $__nullable := ( if (data($A/ns1:TCRMContactMethodBObj/ns1:ContactMethodValue) = ('HOME_PAGE','EMAIL_ADDRESS','SWIFT_ADDRESS')) then
                                            data($A/ns1:TCRMContactMethodBObj/ns1:ReferenceNumber)
                                        else 
                                            () )
                            return
                                if (fn:boolean($__nullable))
                                then
                                    <ns3:e-addressBobj>
                                <ns3:electronicAddress>{data($A/ns1:TCRMContactMethodBObj/ns1:ReferenceNumber)}</ns3:electronicAddress>
                                <ns3:contactInfBobj>
                                    <ns3:contactInformationType>
                                {data($A/ns1:ContactMethodUsageValue)}
                                    </ns3:contactInformationType>
                                    </ns3:contactInfBobj>
                                </ns3:e-addressBobj>
                                else
                                    ()
                        }
                                
                            </ns3:contactInformationBobj>
                    }
                </ns3:partyContactInformationBobj>
                else if(fn:exists($getNordeaPartyResponse1/ns1:NordeaBObj/ns1:TCRMOrganizationBObj))
                then
                
                
                <ns3:partyContactInformationBobj>
                    {
                        for $A in $getNordeaPartyResponse1/ns1:NordeaBObj/ns1:TCRMOrganizationBObj/ns1:TCRMPartyContactMethodBObj union
                            $getNordeaPartyResponse1/ns1:NordeaBObj/ns1:TCRMOrganizationBObj/ns1:TCRMPartyAddressBObj
                        return
                            <ns3:contactInformationBobj>
                            
                             
                            {
                            let $__nullable := ( data($A/ns1:StartDate) )
                            return
                                if (fn:boolean($__nullable))
                                then
                                    <ns0:validFromDate>{xs:date(xs:dateTime(fn:replace(data($A/ns1:StartDate),' ','T')))}</ns0:validFromDate>
                                else
                                    ()
                        }
                        
                        
                        {
                            let $__nullable := ( data($A/ns1:EndDate) )
                            return
                                if (fn:boolean($__nullable))
                                then
                                    <ns0:validToDate>{xs:date(xs:dateTime(fn:replace(data($A/ns1:EndDate),' ','T')))}</ns0:validToDate>
                                else
                                    ()
                        }
                          
                            
                                {
                            let $__nullable := ( data($A/ns1:TCRMAddressBObj) )
                            return
                                if (fn:boolean($__nullable))
                                then
                                 
                                    <ns3:addressBobj>
                              
                                 <ns3:streetAddress>{
                                  fn:string-join((data($A/ns1:TCRMAddressBObj/ns1:StreetNumber),data($A/ns1:TCRMAddressBObj/ns1:StreetPrefix),data($A/ns1:TCRMAddressBObj/ns1:StreetName),data($A/ns1:TCRMAddressBObj/ns1:StreetSuffix)),',')
                                   }
                                    </ns3:streetAddress>
                                    <ns3:coName>{ data($A/ns1:CareOf) }</ns3:coName>
                                    <ns3:postalCode>{data($A/ns1:TCRMAddressBObj/ns1:ZipPostalCode)}</ns3:postalCode>
                                    <ns3:city>{ data($A/ns1:TCRMAddressBObj/ns1:City) }</ns3:city>
                                    <ns0:countryCode>{ data($A/ns1:TCRMAddressBObj/ns1:CountryValue) }</ns0:countryCode>
                                    <ns3:addressType>{ data($A/ns1:AddressUsageValue) }</ns3:addressType>
                                    <ns3:addressUnstructuredBobj>
                                        <ns3:addressLine1>{ data($A/ns1:TCRMAddressBObj/ns1:AddressLineOne) }</ns3:addressLine1>
                                        <ns3:addressLine2>{ data($A/ns1:TCRMAddressBObj/ns1:AddressLineTwo) }</ns3:addressLine2>
                                        <ns3:addressLine3>{ data($A/ns1:TCRMAddressBObj/ns1:AddressLineThree) }</ns3:addressLine3>
                                    </ns3:addressUnstructuredBobj>
                                </ns3:addressBobj>
                                    else
                                    ()
                        }
                                     {
                            let $__nullable := ( if (data($A/ns1:TCRMContactMethodBObj/ns1:ContactMethodValue) = ('MOBILE','LANDLINE','FAX')) then
                                            data($A/ns1:TCRMContactMethodBObj/ns1:ContactMethodValue)
                                        else 
                                            () )
                            return
                                if (fn:boolean($__nullable))
                                then
                                    <ns3:phoneNoBobj>
                                    <ns3:phoneNumberPresentation>
                                    {
                                        if (data($A/ns1:TCRMContactMethodBObj/ns1:ContactMethodValue) = ('MOBILE','LANDLINE','FAX')) then
                                            data($A/ns1:TCRMContactMethodBObj/ns1:ReferenceNumber)
                                        else 
                                            ()
                                    }
                                    </ns3:phoneNumberPresentation>
                                    <ns3:countryDialingCode>{ data($A/ns1:TCRMContactMethodBObj/ns1:TCRMPhoneNumberBObj/ns1:PhoneCountryCode) }</ns3:countryDialingCode>
                                    <ns3:areaCode>{ data($A/ns1:TCRMContactMethodBObj/ns1:TCRMPhoneNumberBObj/ns1:PhoneAreaCode) }</ns3:areaCode>
                                    <ns3:phoneNumber>{ data($A/ns1:TCRMContactMethodBObj/ns1:TCRMPhoneNumberBObj/ns1:PhoneNumber) }</ns3:phoneNumber>
                                    {
                            let $__nullable := ( data($A/ns1:TCRMContactMethodBObj/ns1:TCRMPhoneNumberBObj/ns1:PhoneExtension) )
                            return
                                if (fn:boolean($__nullable))
                                then
                                    <ns3:extension>{ data($__nullable) }</ns3:extension>
                                else
                                    ()
                        }
                                   
                                    <ns3:contactInfBobj>
                                    <ns3:contactInformationType>
                                    {
                                        if (data($A/ns1:TCRMContactMethodBObj/ns1:ContactMethodValue) = ('MOBILE','LANDLINE','FAX')) then
                                            data($A/ns1:ContactMethodUsageValue)
                                        else 
                                            ()
                                    }
                                    </ns3:contactInformationType>
                                    </ns3:contactInfBobj>
                                </ns3:phoneNoBobj>
                                else
                                    ()
                        }
                      
                                    {
                            let $__nullable := ( if (data($A/ns1:TCRMContactMethodBObj/ns1:ContactMethodValue) = ('HOME_PAGE','EMAIL_ADDRESS','SWIFT_ADDRESS')) then
                                            data($A/ns1:TCRMContactMethodBObj/ns1:ReferenceNumber)
                                        else 
                                            () )
                            return
                                if (fn:boolean($__nullable))
                                then
                                    <ns3:e-addressBobj>
                                <ns3:electronicAddress>{data($A/ns1:TCRMContactMethodBObj/ns1:ReferenceNumber)}</ns3:electronicAddress>
                                <ns3:contactInfBobj>
                                    <ns3:contactInformationType>
                                {data($A/ns1:ContactMethodUsageValue)}
                                    </ns3:contactInformationType>
                                    </ns3:contactInfBobj>
                                </ns3:e-addressBobj>
                                else
                                    ()
                        }
                         
                                
                            </ns3:contactInformationBobj>
                    }
                </ns3:partyContactInformationBobj>
                
                
                else ()
                }
            </ns6:partyResponseBobj>
        </ns6:retrievePartyResponse>
        
};

declare variable $getNordeaPartyResponse1 as element(ns9:getNordeaPartyResponse) external;

xf:Response_PartyContactInformation($getNordeaPartyResponse1)
