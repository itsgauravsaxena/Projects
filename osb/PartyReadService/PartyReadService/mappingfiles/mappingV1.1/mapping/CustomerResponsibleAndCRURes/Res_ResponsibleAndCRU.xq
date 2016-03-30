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
declare namespace xf = "http://tempuri.org/Party/PartyRead/v1.1.0/mapping/CustomerResponsibleAndCRURes/Res_ResponsibleAndCRU/";
declare namespace ns4 = "http://soa.nordea.com/party/partybasiclib/v1.4";
declare namespace ns3 = "http://soa.nordea.com/party/partycontactinformationlib/v1.2";

declare function xf:Res_ResponsibleAndCRU($getNordeaPartyResponse1 as element(ns9:getNordeaPartyResponse))
    as element(ns6:retrievePartyResponse) {
        <ns6:retrievePartyResponse>
            <ns6:partyResponseBobj>
                <ns2:requestPartyIdBobj>
                    <ns2:partyIdentifierBobj>
                        <ns2:partyId>{ data($getNordeaPartyResponse1/ns1:NordeaBObj/ns1:TCRMAdminContEquivBObj/ns1:AdminPartyId) }</ns2:partyId>
                        <ns2:partyIdType>{ data($getNordeaPartyResponse1/ns1:NordeaBObj/ns1:TCRMAdminContEquivBObj/ns1:AdminSystemValue) }</ns2:partyIdType>
                    </ns2:partyIdentifierBobj>
                </ns2:requestPartyIdBobj>
            </ns6:partyResponseBobj>
        </ns6:retrievePartyResponse>
};

declare variable $getNordeaPartyResponse1 as element(ns9:getNordeaPartyResponse) external;

xf:Res_ResponsibleAndCRU($getNordeaPartyResponse1)
