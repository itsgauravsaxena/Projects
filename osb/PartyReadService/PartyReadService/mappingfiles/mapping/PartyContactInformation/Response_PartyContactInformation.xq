(:: pragma bea:global-element-parameter parameter="$getNordeaPartyResponse1" element="ns4:getNordeaPartyResponse" location="../../interface/NordeaServices.wsdl" ::)
(:: pragma bea:global-element-return element="ns6:retrievePartyResponse" location="../../interface/PartyRead_v1.0.wsdl" ::)

declare namespace ns6 = "http://soa.nordea.com/party/partyread/v1.0";
declare namespace ns5 = "http://soa.nordea.com/party/partybasiclib/v1.2";
declare namespace ns0 = "http://soa.nordea.com/party/partycontactinformationlib/v1.1";
declare namespace ns2 = "http://www.ibm.com/mdm/schema";
declare namespace ns1 = "http://soa.nordea.com/party/partyidentificationinformationlib/v1.1";
declare namespace ns4 = "http://services.ecs.mdm.nordea.com/NordeaServices/port";
declare namespace xf = "http://tempuri.org/Party/PartyRead/v1.0.0/Response_PartyContactInformation/";
declare namespace ns3 = "http://error.ntpsoa.nordea.com/object/v1";

declare function xf:Response_PartyContactInformation($getNordeaPartyResponse1 as element(ns4:getNordeaPartyResponse))
    as element(ns6:retrievePartyResponse) {
        <ns6:retrievePartyResponse>
            <ns6:partyResponseBobj>
            <ns1:partyInternalIdentifierBobj>
                    <ns1:partyInternalId>{ data($getNordeaPartyResponse1/ns2:NordeaBObj/ns2:TCRMAdminContEquivBObj/ns2:AdminPartyId) }</ns1:partyInternalId>
                    <ns1:partyInternalIdType>{ data($getNordeaPartyResponse1/ns2:NordeaBObj/ns2:TCRMAdminContEquivBObj/ns2:AdminSystemValue) }</ns1:partyInternalIdType>
                </ns1:partyInternalIdentifierBobj>
                {
                if (fn:exists($getNordeaPartyResponse1/ns2:NordeaBObj/ns2:TCRMPersonBObj)) then
                <ns0:partyContactInformationBobj>
                    {
                        for $A in $getNordeaPartyResponse1/ns2:NordeaBObj/ns2:TCRMPersonBObj/ns2:TCRMPartyContactMethodBObj union
                            $getNordeaPartyResponse1/ns2:NordeaBObj/ns2:TCRMPersonBObj/ns2:TCRMPartyAddressBObj
                        return
                            <ns0:contactInformationBobj>
                            <ns0:validityStatus>{fn:true()}</ns0:validityStatus>
                            <ns0:validFromDate>
                            {
                            let $__nullable := ( data($A/ns2:StartDate) )
                            return
                                if (fn:boolean($__nullable))
                                then
                                    xs:date(xs:dateTime(fn:replace(data($A/ns2:StartDate),' ','T')))
                                else
                                    ()
                        }
                        </ns0:validFromDate>
                        <ns0:validToDate>
                        {
                            let $__nullable := ( data($A/ns2:EndDate) )
                            return
                                if (fn:boolean($__nullable))
                                then
                                    xs:date(xs:dateTime(fn:replace(data($A/ns2:EndDate),' ','T')))
                                else
                                    ()
                        }
                          </ns0:validToDate>
                            
                                <ns0:contactUsageBobj>
                                <ns0:usageType>
                                {
                                        if (fn:local-name($A) = "TCRMPartyAddressBObj") then
                                            (data($A/ns2:AddressUsageValue))
                                        else 
                                            data($A/ns2:ContactMethodUsageValue)
                                    }
                                    </ns0:usageType>
                                </ns0:contactUsageBobj>
                          {
                            let $__nullable := ( data($A/ns2:TCRMAddressBObj) )
                            return
                                if (fn:boolean($__nullable))
                                then
                                    <ns0:addressBobj>
                                    <ns0:streetAddress>{
                                  fn:string-join((data($A/ns2:TCRMAddressBObj/ns2:StreetNumber),data($A/ns2:TCRMAddressBObj/ns2:StreetPrefix),data($A/ns2:TCRMAddressBObj/ns2:StreetName),data($A/ns2:TCRMAddressBObj/ns2:StreetSuffix)),',')
                                   }
                                    </ns0:streetAddress>
                                    <ns0:coName>{ data($A/ns2:CareOf) }</ns0:coName>
                                    <ns0:postalCode>{data($A/ns2:TCRMAddressBObj/ns2:ZipPostalCode)}</ns0:postalCode>
                                    <ns0:city>{ data($A/ns2:TCRMAddressBObj/ns2:City) }</ns0:city>
                                    <ns0:addressCountryCode>{ data($A/ns2:TCRMAddressBObj/ns2:CountryValue) }</ns0:addressCountryCode>
                                    <ns0:addressType>{ data($A/ns2:AddressUsageValue) }</ns0:addressType>
                                    <ns0:addressUnstructuredBobj>
                                        <ns0:addressLine1>{ data($A/ns2:TCRMAddressBObj/ns2:AddressLineOne) }</ns0:addressLine1>
                                        <ns0:addressLine2>{ data($A/ns2:TCRMAddressBObj/ns2:AddressLineTwo) }</ns0:addressLine2>
                                        <ns0:addressLine3>{ data($A/ns2:TCRMAddressBObj/ns2:AddressLineThree) }</ns0:addressLine3>
                                    </ns0:addressUnstructuredBobj>
                                </ns0:addressBobj>
                                     else
                                    ()
                        }
                         
                                {
                            let $__nullable := ( if (data($A/ns2:ContactMethodUsageValue) = ('Work Mobile','Landline','Fax')) then
                                            data($A/ns2:TCRMContactMethodBObj/ns2:ContactMethodValue)
                                        else 
                                            () )
                            return
                                if (fn:boolean($__nullable))
                                then
                                    <ns0:phoneNoBobj>
                                    <ns0:phoneNumberPresentation>
                                    {
                                        if (data($A/ns2:ContactMethodUsageValue) = ('Work Mobile','Landline','Fax')) then
                                            data($A/ns2:TCRMContactMethodBObj/ns2:ReferenceNumber)
                                        else 
                                            ()
                                    }
                                    </ns0:phoneNumberPresentation>
                                    <ns0:countryDialingCode>{ data($A/ns2:TCRMContactMethodBObj/ns2:TCRMPhoneNumberBObj/ns2:PhoneCountryCode) }</ns0:countryDialingCode>
                                    <ns0:areaCode>{ data($A/ns2:TCRMContactMethodBObj/ns2:TCRMPhoneNumberBObj/ns2:PhoneAreaCode) }</ns0:areaCode>
                                    <ns0:phoneNumber>{ data($A/ns2:TCRMContactMethodBObj/ns2:TCRMPhoneNumberBObj/ns2:PhoneNumber) }</ns0:phoneNumber>
                                    <ns0:extension>{ data($A/ns2:TCRMContactMethodBObj/ns2:TCRMPhoneNumberBObj/ns2:PhoneExtension) }</ns0:extension>
                                    <ns0:phoneNumberType>
                                    {
                                        if (data($A/ns2:ContactMethodUsageValue) = ('Work Mobile','Landline','Fax')) then
                                            data($A/ns2:TCRMContactMethodBObj/ns2:ContactMethodValue)
                                        else 
                                            ()
                                    }
                                    </ns0:phoneNumberType>
                                </ns0:phoneNoBobj>
                                else
                                    ()
                        }
                                
                               {
                            let $__nullable := ( if (data($A/ns2:ContactMethodUsageValue) = ('Website','Email','SWIFT Address')) then
                                            data($A/ns2:TCRMContactMethodBObj/ns2:ReferenceNumber)
                                        else 
                                            () )
                            return
                                if (fn:boolean($__nullable))
                                then
                                    <ns0:e-addressBobj>
                                <ns0:electronicAddress>{data($A/ns2:TCRMContactMethodBObj/ns2:ReferenceNumber)}</ns0:electronicAddress>
                                <ns0:electronicAddressType>
                                {data($A/ns2:TCRMContactMethodBObj/ns2:ContactMethodValue)}
                                </ns0:electronicAddressType>
                                </ns0:e-addressBobj>
                                else
                                    ()
                        }
                                
                            </ns0:contactInformationBobj>
                    }
                </ns0:partyContactInformationBobj>
                else if(fn:exists($getNordeaPartyResponse1/ns2:NordeaBObj/ns2:TCRMOrganizationBObj))
                then
                
                
                <ns0:partyContactInformationBobj>
                    {
                        for $A in $getNordeaPartyResponse1/ns2:NordeaBObj/ns2:TCRMOrganizationBObj/ns2:TCRMPartyContactMethodBObj union
                            $getNordeaPartyResponse1/ns2:NordeaBObj/ns2:TCRMOrganizationBObj/ns2:TCRMPartyAddressBObj
                        return
                            <ns0:contactInformationBobj>
                            <ns0:validityStatus>{fn:true()}</ns0:validityStatus>
                             <ns0:validFromDate>
                            {
                            let $__nullable := ( data($A/ns2:StartDate) )
                            return
                                if (fn:boolean($__nullable))
                                then
                                    xs:date(xs:dateTime(fn:replace(data($A/ns2:StartDate),' ','T')))
                                else
                                    ()
                        }
                        </ns0:validFromDate>
                        <ns0:validToDate>
                        {
                            let $__nullable := ( data($A/ns2:EndDate) )
                            return
                                if (fn:boolean($__nullable))
                                then
                                    xs:date(xs:dateTime(fn:replace(data($A/ns2:EndDate),' ','T')))
                                else
                                    ()
                        }
                          </ns0:validToDate>
                            
                            
                                <ns0:contactUsageBobj>
                                <ns0:usageType>
                                {
                                        if (fn:local-name($A) = "TCRMPartyAddressBObj") then
                                            (data($A/ns2:AddressUsageValue))
                                        else 
                                            data($A/ns2:ContactMethodUsageValue)
                                    }
                                    </ns0:usageType>
                                </ns0:contactUsageBobj>
                                
                                
                                
                                {
                            let $__nullable := ( data($A/ns2:TCRMAddressBObj) )
                            return
                                if (fn:boolean($__nullable))
                                then
                                 
                                    <ns0:addressBobj>
                              
                                 <ns0:streetAddress>{
                                  fn:string-join((data($A/ns2:TCRMAddressBObj/ns2:StreetNumber),data($A/ns2:TCRMAddressBObj/ns2:StreetPrefix),data($A/ns2:TCRMAddressBObj/ns2:StreetName),data($A/ns2:TCRMAddressBObj/ns2:StreetSuffix)),',')
                                   }
                                    </ns0:streetAddress>
                                    <ns0:coName>{ data($A/ns2:CareOf) }</ns0:coName>
                                    <ns0:postalCode>{data($A/ns2:TCRMAddressBObj/ns2:ZipPostalCode)}</ns0:postalCode>
                                    <ns0:city>{ data($A/ns2:TCRMAddressBObj/ns2:City) }</ns0:city>
                                    <ns0:addressCountryCode>{ data($A/ns2:TCRMAddressBObj/ns2:CountryValue) }</ns0:addressCountryCode>
                                    <ns0:addressType>{ data($A/ns2:AddressUsageValue) }</ns0:addressType>
                                    <ns0:addressUnstructuredBobj>
                                        <ns0:addressLine1>{ data($A/ns2:TCRMAddressBObj/ns2:AddressLineOne) }</ns0:addressLine1>
                                        <ns0:addressLine2>{ data($A/ns2:TCRMAddressBObj/ns2:AddressLineTwo) }</ns0:addressLine2>
                                        <ns0:addressLine3>{ data($A/ns2:TCRMAddressBObj/ns2:AddressLineThree) }</ns0:addressLine3>
                                    </ns0:addressUnstructuredBobj>
                                </ns0:addressBobj>
                                    else
                                    ()
                        }
                                     {
                            let $__nullable := ( if (data($A/ns2:ContactMethodUsageValue) = ('Work Mobile','Landline','Fax')) then
                                            data($A/ns2:TCRMContactMethodBObj/ns2:ContactMethodValue)
                                        else 
                                            () )
                            return
                                if (fn:boolean($__nullable))
                                then
                                    <ns0:phoneNoBobj>
                                    <ns0:phoneNumberPresentation>
                                    {
                                        if (data($A/ns2:ContactMethodUsageValue) = ('Work Mobile','Landline','Fax')) then
                                            data($A/ns2:TCRMContactMethodBObj/ns2:ReferenceNumber)
                                        else 
                                            ()
                                    }
                                    </ns0:phoneNumberPresentation>
                                    <ns0:countryDialingCode>{ data($A/ns2:TCRMContactMethodBObj/ns2:TCRMPhoneNumberBObj/ns2:PhoneCountryCode) }</ns0:countryDialingCode>
                                    <ns0:areaCode>{ data($A/ns2:TCRMContactMethodBObj/ns2:TCRMPhoneNumberBObj/ns2:PhoneAreaCode) }</ns0:areaCode>
                                    <ns0:phoneNumber>{ data($A/ns2:TCRMContactMethodBObj/ns2:TCRMPhoneNumberBObj/ns2:PhoneNumber) }</ns0:phoneNumber>
                                    <ns0:extension>{ data($A/ns2:TCRMContactMethodBObj/ns2:TCRMPhoneNumberBObj/ns2:PhoneExtension) }</ns0:extension>
                                    <ns0:phoneNumberType>
                                    {
                                        if (data($A/ns2:ContactMethodUsageValue) = ('Work Mobile','Landline','Fax')) then
                                            data($A/ns2:TCRMContactMethodBObj/ns2:ContactMethodValue)
                                        else 
                                            ()
                                    }
                                    </ns0:phoneNumberType>
                                </ns0:phoneNoBobj>
                                else
                                    ()
                        }
                      
                                    {
                            let $__nullable := ( if (data($A/ns2:ContactMethodUsageValue) = ('Website','Email','SWIFT Address')) then
                                            data($A/ns2:TCRMContactMethodBObj/ns2:ReferenceNumber)
                                        else 
                                            () )
                            return
                                if (fn:boolean($__nullable))
                                then
                                    <ns0:e-addressBobj>
                                <ns0:electronicAddress>{data($A/ns2:TCRMContactMethodBObj/ns2:ReferenceNumber)}</ns0:electronicAddress>
                                <ns0:electronicAddressType>
                                {data($A/ns2:TCRMContactMethodBObj/ns2:ContactMethodValue)}
                                </ns0:electronicAddressType>
                                </ns0:e-addressBobj>
                                else
                                    ()
                        }
                         
                                
                            </ns0:contactInformationBobj>
                    }
                </ns0:partyContactInformationBobj>
                
                
                else ()
                }
            </ns6:partyResponseBobj>
        </ns6:retrievePartyResponse>
};

declare variable $getNordeaPartyResponse1 as element(ns4:getNordeaPartyResponse) external;

xf:Response_PartyContactInformation($getNordeaPartyResponse1)