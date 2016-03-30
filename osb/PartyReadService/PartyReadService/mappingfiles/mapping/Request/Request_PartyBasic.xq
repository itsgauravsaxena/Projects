(:: pragma bea:global-element-parameter parameter="$serviceContext1" element="ns3:serviceContext" location="../../interface/PartyRead_v1.0.wsdl" ::)
(:: pragma bea:global-element-parameter parameter="$retrievePartyRequest1" element="ns7:retrievePartyRequest" location="../../interface/PartyRead_v1.0.wsdl" ::)
(:: pragma bea:global-element-return element="ns4:getNordeaParty" location="../../interface/NordeaServices.wsdl" ::)

declare namespace ns2 = "http://www.ibm.com/mdm/schema";
declare namespace ns1 = "http://soa.nordea.com/party/partyidentificationinformationlib/v1.1";
declare namespace ns4 = "http://services.ecs.mdm.nordea.com/NordeaServices/port";
declare namespace ns3 = "http://servicecontext.ntpsoa.nordea.com/object";
declare namespace ns0 = "http://soa.nordea.com/party/partycontactinformationlib/v1.1";
declare namespace ns5 = "http://soa.nordea.com/party/partybasiclib/v1.2";
declare namespace xf = "http://tempuri.org/Party/PartyRead/v1.0.0/Request_PartyBasic/";
declare namespace ns6 = "http://www.ibm.com/mdm/wsdl/schema";
declare namespace ns7 = "http://soa.nordea.com/party/partyread/v1.0";

declare function xf:Request_PartyBasic($serviceContext1 as element(ns3:serviceContext),
    $retrievePartyRequest1 as element(ns7:retrievePartyRequest))
    as element(ns4:getNordeaParty) {
        <ns4:getNordeaParty>
            <ns2:RequestControl>
                <ns2:DWLControl>
                <ns2:requesterName>cusadmin</ns2:requesterName>
                <ns2:requesterLanguage>100</ns2:requesterLanguage>
                <ns2:userRole>SYS</ns2:userRole>
                    <ns2:accessTokenCollection>
                        <ns2:userAccessToken>
                            <ns2:accessTokenValue>
                            {
                                       if (data($serviceContext1/ns3:requestDomain) = "FI") then
                                            '100001'                                       
                                             else if (data($serviceContext1/ns3:requestDomain) = "SE")
                                            then
                                            '100002'
                                            else if (data($serviceContext1/ns3:requestDomain) = "NO")
                                            then
                                            '100003'
                                            else '100004'
                                            
                                    }
                            </ns2:accessTokenValue>
                        </ns2:userAccessToken>
                    </ns2:accessTokenCollection>
                </ns2:DWLControl>
            </ns2:RequestControl>
            <ns2:InquiryParam>
                <ns2:tcrmParam name = "AdminSystemType">{ data($retrievePartyRequest1/ns1:partyInternalIdentifierBobj/ns1:partyInternalIdType) }</ns2:tcrmParam>
                 <ns2:tcrmParam name = "AdminPartyId">{ data($retrievePartyRequest1/ns1:partyInternalIdentifierBobj/ns1:partyInternalId) }</ns2:tcrmParam>
                 <ns2:tcrmParam name = "InquiryLevel">4</ns2:tcrmParam>  
            </ns2:InquiryParam>
        </ns4:getNordeaParty>
};

declare variable $serviceContext1 as element(ns3:serviceContext) external;
declare variable $retrievePartyRequest1 as element(ns7:retrievePartyRequest) external;

xf:Request_PartyBasic($serviceContext1,
    $retrievePartyRequest1)