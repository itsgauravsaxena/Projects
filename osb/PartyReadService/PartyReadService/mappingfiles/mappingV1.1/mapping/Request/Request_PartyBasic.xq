(:: pragma bea:global-element-parameter parameter="$serviceContext1" element="ns6:serviceContext" location="../../interface/PartyRead_v1.1.wsdl" ::)
(:: pragma bea:global-element-parameter parameter="$retrievePartyRequest1" element="ns7:retrievePartyRequest" location="../../interface/PartyRead_v1.1.wsdl" ::)
(:: pragma bea:global-element-return element="ns10:getNordeaParty" location="../../interface/NordeaServices.wsdl" ::)

declare namespace ns6 = "http://servicecontext.ntpsoa.nordea.com/object";
declare namespace ns5 = "http://soa.nordea.com/party/customerresponsibleandcruslib/v1.0";
declare namespace ns8 = "http://soa.nordea.com/party/partyclassificationinformationlib/v1.0";
declare namespace ns7 = "http://soa.nordea.com/party/partyread/v1.1";
declare namespace ns9 = "http://www.ibm.com/mdm/wsdl/schema";
declare namespace ns10 = "http://services.ecs.mdm.nordea.com/NordeaServices/port";
declare namespace ns0 = "http://soa.nordea.com/party/partycommonfieldslib/v1.0";
declare namespace ns2 = "http://soa.nordea.com/party/partycontactinformationlib/v1.2";
declare namespace ns1 = "http://soa.nordea.com/party/partyidentificationinformationlib/v1.2";
declare namespace xf = "http://tempuri.org/Party/PartyRead/v1.1.0/mapping/Request/Request_PartyBasic/";
declare namespace ns4 = "http://soa.nordea.com/party/partybasiclib/v1.4";
declare namespace ns3 = "http://www.ibm.com/mdm/schema";

declare function xf:Request_PartyBasic($serviceContext1 as element(ns6:serviceContext),
    $retrievePartyRequest1 as element(ns7:retrievePartyRequest))
    as element(ns10:getNordeaParty) {
        <ns10:getNordeaParty>
        <ns3:RequestControl>
                <ns3:DWLControl>
                <ns3:requesterName>cusadmin</ns3:requesterName>
                <ns3:requesterLanguage>100</ns3:requesterLanguage>
                <ns3:userRole>SYS</ns3:userRole>
                </ns3:DWLControl>
            </ns3:RequestControl>
            <ns3:InquiryParam>
                 <ns3:tcrmParam name = "AdminSystemType">{ data($retrievePartyRequest1/ns1:requestPartyIdBobj/ns1:partyIdentifierBobj/ns1:partyIdType) }</ns3:tcrmParam>
                 <ns3:tcrmParam name = "AdminPartyId">{ data($retrievePartyRequest1/ns1:requestPartyIdBobj/ns1:partyIdentifierBobj/ns1:partyId) }</ns3:tcrmParam>
                 <ns3:tcrmParam name = "InquiryLevel">4</ns3:tcrmParam>
            </ns3:InquiryParam>
        </ns10:getNordeaParty>
};

declare variable $serviceContext1 as element(ns6:serviceContext) external;
declare variable $retrievePartyRequest1 as element(ns7:retrievePartyRequest) external;

xf:Request_PartyBasic($serviceContext1,
    $retrievePartyRequest1)
