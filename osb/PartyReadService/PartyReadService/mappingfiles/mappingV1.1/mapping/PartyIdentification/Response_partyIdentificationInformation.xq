(:: pragma bea:global-element-parameter parameter="$getNordeaPartyResponse1" element="ns9:getNordeaPartyResponse" location="../../interface/NordeaServices.wsdl" ::)
(:: pragma bea:global-element-return element="ns6:retrievePartyResponse" location="../../interface/PartyRead_v1.1.wsdl" ::)

declare namespace ns6 = "http://soa.nordea.com/party/partyread/v1.1";
declare namespace ns5 = "http://soa.nordea.com/party/customerresponsibleandcruslib/v1.0";
declare namespace ns8 = "http://error.ntpsoa.nordea.com/object/v1";
declare namespace ns7 = "http://soa.nordea.com/party/partyclassificationinformationlib/v1.0";
declare namespace ns9 = "http://services.ecs.mdm.nordea.com/NordeaServices/port";
declare namespace ns0 = "http://soa.nordea.com/party/partycommonfieldslib/v1.0";
declare namespace ns2 = "http://soa.nordea.com/party/partyidentificationinformationlib/v1.2";
declare namespace ns1 = "http://www.ibm.com/mdm/schema";
declare namespace xf = "http://tempuri.org/Party/PartyRead/v1.1.0/mapping/PartyIdentification/Response_partyIdentificationInformation/";
declare namespace ns4 = "http://soa.nordea.com/party/partybasiclib/v1.4";
declare namespace ns3 = "http://soa.nordea.com/party/partycontactinformationlib/v1.2";

declare function xf:Response_partyIdentificationInformation($getNordeaPartyResponse1 as element(ns9:getNordeaPartyResponse))
    as element(ns6:retrievePartyResponse) {
        <ns6:retrievePartyResponse>
            <ns6:partyResponseBobj>
                <ns2:requestPartyIdBobj>
                    <ns2:partyIdentifierBobj>
                        <ns2:partyId>{ data($getNordeaPartyResponse1/ns1:NordeaBObj/ns1:TCRMAdminContEquivBObj/ns1:AdminPartyId) }</ns2:partyId>
                        <ns2:partyIdType>{ data($getNordeaPartyResponse1/ns1:NordeaBObj/ns1:TCRMAdminContEquivBObj/ns1:AdminSystemValue) }</ns2:partyIdType>
                    </ns2:partyIdentifierBobj>
                </ns2:requestPartyIdBobj>
                <ns2:partyIdentificationInformationBobj>
                {
                for $A in ($getNordeaPartyResponse1/ns1:NordeaBObj/ns1:TCRMPersonBObj/ns1:TCRMPartyIdentificationBObj union
                            $getNordeaPartyResponse1/ns1:NordeaBObj/ns1:TCRMOrganizationBObj/ns1:TCRMPartyIdentificationBObj union 
                            $getNordeaPartyResponse1/ns1:NordeaBObj/ns1:TCRMAdminContEquivBObj)
                        return
                        if (fn:local-name($A) = "TCRMAdminContEquivBObj") then
                    <ns2:partyIdentifierBobj>
                        <ns2:partyId>{data($getNordeaPartyResponse1/ns1:NordeaBObj/ns1:TCRMAdminContEquivBObj/ns1:AdminPartyId)}</ns2:partyId>
                        <ns2:partyIdType>{ data($getNordeaPartyResponse1/ns1:NordeaBObj/ns1:TCRMAdminContEquivBObj/ns1:AdminSystemValue) }</ns2:partyIdType>
                        <ns0:countryCode>
                        {
                                       if (data($A/ns1:AdminSystemType) = "130303") then
                                            'FI'                                       
                                             else if (data($A/ns1:AdminSystemType) = "130300")
                                            then
                                            'DK'
                                            else if (data($A/ns1:AdminSystemType) = "130301")
                                            then
                                            'SE'
                                            else 'NO'
                                            }
                                   </ns0:countryCode>
                                    
                        </ns2:partyIdentifierBobj>
                        else
                        <ns2:partyIdentifierBobj>
                        <ns2:partyId>{data($A/ns1:IdentificationNumber)}</ns2:partyId>
                        <ns2:partyIdType>{data($A/ns1:IdentificationValue)}</ns2:partyIdType>
                        <ns0:countryCode>{$A/ns1:TCRMExtension/ns1:XIdentifierBObjExt/ns1:IssuingCountryValue/text()}</ns0:countryCode>
                    </ns2:partyIdentifierBobj>
                    }
                </ns2:partyIdentificationInformationBobj>
            </ns6:partyResponseBobj>
        </ns6:retrievePartyResponse>
};

declare variable $getNordeaPartyResponse1 as element(ns9:getNordeaPartyResponse) external;

xf:Response_partyIdentificationInformation($getNordeaPartyResponse1)
