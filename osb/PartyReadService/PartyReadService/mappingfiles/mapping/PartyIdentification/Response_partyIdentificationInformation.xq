(:: pragma bea:global-element-parameter parameter="$getNordeaPartyResponse1" element="ns4:getNordeaPartyResponse" location="../../interface/NordeaServices.wsdl" ::)
(:: pragma bea:global-element-return element="ns6:retrievePartyResponse" location="../../interface/PartyRead_v1.0.wsdl" ::)

declare namespace ns6 = "http://soa.nordea.com/party/partyread/v1.0";
declare namespace ns5 = "http://soa.nordea.com/party/partybasiclib/v1.2";
declare namespace ns0 = "http://soa.nordea.com/party/partycontactinformationlib/v1.1";
declare namespace ns2 = "http://www.ibm.com/mdm/schema";
declare namespace ns1 = "http://soa.nordea.com/party/partyidentificationinformationlib/v1.1";
declare namespace ns4 = "http://services.ecs.mdm.nordea.com/NordeaServices/port";
declare namespace xf = "http://tempuri.org/Party/PartyRead/v1.0.0/Response_partyIdentificationInformation/";
declare namespace ns3 = "http://error.ntpsoa.nordea.com/object/v1";

declare function xf:Response_partyIdentificationInformation($getNordeaPartyResponse1 as element(ns4:getNordeaPartyResponse))
    as element(ns6:retrievePartyResponse) {
        <ns6:retrievePartyResponse>
            <ns6:partyResponseBobj>
                <ns1:partyInternalIdentifierBobj>
                    <ns1:partyInternalId>{ data($getNordeaPartyResponse1/ns2:NordeaBObj/ns2:TCRMAdminContEquivBObj/ns2:AdminPartyId) }</ns1:partyInternalId>
                    <ns1:partyInternalIdType>{ data($getNordeaPartyResponse1/ns2:NordeaBObj/ns2:TCRMAdminContEquivBObj/ns2:AdminSystemValue) }</ns1:partyInternalIdType>
                </ns1:partyInternalIdentifierBobj>
                <ns1:partyIdentificationInformationBobj>
                    <ns1:partyInternalIdentifierBobj>
                        <ns1:partyInternalId>{ data($getNordeaPartyResponse1/ns2:NordeaBObj/ns2:TCRMAdminContEquivBObj/ns2:AdminPartyId) }</ns1:partyInternalId>
                        <ns1:partyInternalIdType>{ data($getNordeaPartyResponse1/ns2:NordeaBObj/ns2:TCRMAdminContEquivBObj/ns2:AdminSystemValue) }</ns1:partyInternalIdType>
                    </ns1:partyInternalIdentifierBobj>
                    {
                    for $A in $getNordeaPartyResponse1/ns2:NordeaBObj/ns2:TCRMPersonBObj/ns2:TCRMPartyIdentificationBObj union
                            $getNordeaPartyResponse1/ns2:NordeaBObj/ns2:TCRMOrganizationBObj/ns2:TCRMPartyIdentificationBObj
                        return
                    <ns1:partyIdentifierBobj>
                        <ns1:partyId>{ data($A/ns2:IdentificationNumber) }</ns1:partyId>
                        <ns1:partyIdType>{ data($A/ns2:IdentificationValue) }</ns1:partyIdType>
                    <ns1:partyIdCountryCode>
                    {
                    
                                typeswitch ($A/ns2:TCRMExtension/(ns2:CommonExtensionBObj | ns2:XIdentifierBObjExt))
                                case $case2 as element(ns2:CommonExtensionBObj)  return ($A/ns2:TCRMExtension/ns2:CommonExtensionBObj/text())  
                                case $case3 as element(ns2:XIdentifierBObjExt)  return ($A/ns2:TCRMExtension/ns2:XIdentifierBObjExt/ns2:IssuingCountryCodeValue/text())  
                                default return ()
                            }
                           </ns1:partyIdCountryCode>
                           <ns1:identificationMethodType>
                            {
                                typeswitch ($A/ns2:TCRMExtension/(ns2:CommonExtensionBObj | ns2:XIdentifierBObjExt))
                                case $case2 as element(ns2:CommonExtensionBObj)  return ($A/ns2:TCRMExtension/ns2:CommonExtensionBObj/text())  
                                case $case3 as element(ns2:XIdentifierBObjExt)  return ($A/ns2:TCRMExtension/ns2:XIdentifierBObjExt/ns2:MethodValue/text())  
                                default return ()
                            }
                    </ns1:identificationMethodType>
                    
                    <ns1:identificationDocumentBobj>
                    <ns1:idDocumentNumber>{ data($A/ns2:IdentificationNumber) }</ns1:idDocumentNumber>
                    <ns1:idDocumentName>
                    {
                                typeswitch ($A/ns2:TCRMExtension/(ns2:CommonExtensionBObj | ns2:XIdentifierBObjExt))
                                case $case2 as element(ns2:CommonExtensionBObj)  return ($A/ns2:TCRMExtension/ns2:CommonExtensionBObj/text())  
                                case $case3 as element(ns2:XIdentifierBObjExt)  return ($A/ns2:TCRMExtension/ns2:XIdentifierBObjExt/ns2:IdDocName/text())  
                                default return ()
                            }
                    </ns1:idDocumentName>
                    <ns1:idDocumentType>{ data($A/ns2:IdentificationValue) }</ns1:idDocumentType>
                    <ns1:idDocumentDescription>{ data($A/ns2:IdentificationDescription) }</ns1:idDocumentDescription>
                    <ns1:idDocIssuingAuthority>
                    {
                                typeswitch ($A/ns2:TCRMExtension/(ns2:CommonExtensionBObj | ns2:XIdentifierBObjExt))
                                case $case2 as element(ns2:CommonExtensionBObj)  return ($A/ns2:TCRMExtension/ns2:CommonExtensionBObj/text())  
                                case $case3 as element(ns2:XIdentifierBObjExt)  return ($A/ns2:TCRMExtension/ns2:XIdentifierBObjExt/ns2:IssuingAuthorityName/text())  
                                default return ()
                            }
                    </ns1:idDocIssuingAuthority>
                    <ns1:idDocIssuingDate>
                    {
                            let $__nullable := ( data($A/ns2:StartDate) )
                            return
                                if (fn:boolean($__nullable))
                                then
                                    xs:date(xs:dateTime(fn:replace(data($__nullable),' ','T')))
                                else
                                    ()
                        }
                    </ns1:idDocIssuingDate>
                    <ns1:idDocIssuerCountryCode>
                     {
                    
                                typeswitch ($A/ns2:TCRMExtension/(ns2:CommonExtensionBObj | ns2:XIdentifierBObjExt))
                                case $case2 as element(ns2:CommonExtensionBObj)  return ($A/ns2:TCRMExtension/ns2:CommonExtensionBObj/text())  
                                case $case3 as element(ns2:XIdentifierBObjExt)  return ($A/ns2:TCRMExtension/ns2:XIdentifierBObjExt/ns2:IssuingCountryCodeValue/text())  
                                default return ()
                            }
                    </ns1:idDocIssuerCountryCode>
                    <ns1:idDocExpiryDate>
                    {
                            let $__nullable := ( data($A/ns2:EndDate) )
                            return
                                if (fn:boolean($__nullable))
                                then
                                    xs:date(xs:dateTime(fn:replace(data($__nullable),' ','T')))
                                else
                                    ()
                        }
                    </ns1:idDocExpiryDate>
                    <ns1:idDocStoredCopyReference>
                    {
                    
                                typeswitch ($A/ns2:TCRMExtension/(ns2:CommonExtensionBObj | ns2:XIdentifierBObjExt))
                                case $case2 as element(ns2:CommonExtensionBObj)  return ($A/ns2:TCRMExtension/ns2:CommonExtensionBObj/text())  
                                case $case3 as element(ns2:XIdentifierBObjExt)  return ($A/ns2:TCRMExtension/ns2:XIdentifierBObjExt/ns2:DocImageRef/text())  
                                default return ()
                            }
                    </ns1:idDocStoredCopyReference>
                    </ns1:identificationDocumentBobj>
                    <ns1:electronicIdDocumentationBobj>
                    <ns1:eIdentificationType>{ data($A/ns2:IdentificationValue) }</ns1:eIdentificationType>
                    <ns1:eIssuer>
                    {
                                typeswitch ($A/ns2:TCRMExtension/(ns2:CommonExtensionBObj | ns2:XIdentifierBObjExt))
                                case $case2 as element(ns2:CommonExtensionBObj)  return ($A/ns2:TCRMExtension/ns2:CommonExtensionBObj/text())  
                                case $case3 as element(ns2:XIdentifierBObjExt)  return ($A/ns2:TCRMExtension/ns2:XIdentifierBObjExt/ns2:IssuingAuthorityName/text())  
                                default return ()
                            }
                    </ns1:eIssuer>
                    <ns1:eIdCertificateCode>{ data($A/ns2:IdentificationNumber) }</ns1:eIdCertificateCode>
                    </ns1:electronicIdDocumentationBobj>
                    </ns1:partyIdentifierBobj>
                    }
                </ns1:partyIdentificationInformationBobj>
            </ns6:partyResponseBobj>
        </ns6:retrievePartyResponse>
};

declare variable $getNordeaPartyResponse1 as element(ns4:getNordeaPartyResponse) external;

xf:Response_partyIdentificationInformation($getNordeaPartyResponse1)