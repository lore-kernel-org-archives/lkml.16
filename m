Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A921CCB21
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 21:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743111898; cv=fail; b=i668ZNe7t/jM4KSgz/8GPC4uIW8WIxFj3Nz+YhADiYareUkYijySYqEQOh0kG13CAx3vzu5thk31h3Cd2QZTvd8cG9JBX1mEGqy2xrVxvCAXhngqocELA352fNvDL13ZugyeLWGBo1cCWPpf2zImrU8BEXQZ1PymkuhAGWiHhVU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743111898; c=relaxed/simple;
	bh=0iJPdu9Wyehbt9su20JMT+2SyTDxrTX+2zQ1X5yGdiA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GJBa39n/ogCSrDlV86SVibr98FrGYksbMfARUXgWDDGjbpMM4mfRA0iRFvh7owrlauwZ/yQR2k4u0TTBGDqhpEzFqpCCtttkiOcGoPY53zmpCPjfIPQ9ZvCe34Y/POvWLy0PhwUgDGFiAPxnAIs4eaBLMXZ/5CoE+9q/nywrB/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YLipD7K+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=G2VoIfOL; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YLipD7K+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="G2VoIfOL"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52RLMvpG007319;
	Thu, 27 Mar 2025 21:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=fFUNRunYwDM188fMNCN5Umsl4uiByiI4M/Q5McCRWhM=; b=
	YLipD7K+lJSW4qRr12XtzRo78nReQg0btbPneleNExJODfe9eHzesuO4sICqQYKr
	Ek6Dlaf5pnuioRpEmf7a2GISYI12RiNVjMSC5SC0ssA69Ya8kPHILFRu7viYwNOb
	PG4hsbga+0haB4sxaw0yaH0uyTGG4R6aw7sExWFVFNYTJ1QiYS3tsDAoEzGs8lu5
	HHveK959I0XqN5lTQb2U4D0VPqLbCK6YQYDmwr92SoYZzApXeWFt8tVPfhcm3CIC
	ef5e3/xk3IQYc019dedgc/4m6IkCV8TtZdYgymDKE5j0t2NvsGj+dBp6H8DB/uej
	/ABBTd/gn685a9I8uHTgpg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45hn7dwrm9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Mar 2025 21:44:39 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52RLf9oB022870;
	Thu, 27 Mar 2025 21:44:38 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2046.outbound.protection.outlook.com [104.47.51.46])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45jjch7w1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Mar 2025 21:44:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c+23cIatDYxZT2eFmYfYBnAg2nnDnhsAQPTuo+MftAavToxlyE9dyyJwm9rgCCURDvdDAp+ruount1IHZKbx91nFZPcKmii6OS1uehs/FXEp0izLnnFkFy2D42YjeW14gL0VRbh8dqZqpvpaRVo1cI4yIFCNSHptegIJqBkx7LbNbAX4345O3JdiPwhwZrP5Vd90X4Ofu9p8ws2UD+c+90alvGPTevGmpjAIw5Y/Py7SirLCBLrIG5AdaIH5LPdWLogVgn2ZCydtD6hRPvHnGLuPC2AeTwCbrUKaPUnkaLutmlJW7Udcpry97kuRBIEnJ8v95VL8XL1vuBiWUtGmtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fFUNRunYwDM188fMNCN5Umsl4uiByiI4M/Q5McCRWhM=;
 b=Ek3WTdryDydbYpGssWC5+iGv4BASvYVxYaUaqXfvBnDSqWXgRtNPJ7LnCzEnDHmWemiFkifHXcl5zyvBbp2FtpRlUPqPlmYOjaKwBRYE0YF63UlPDlIkJSAZ73J0HrSNqIpl8Hp0/FZM6+CFcYAii7D7kYeXnf58gZrki4wcwT7UkIr4pMnCUgaJubV7KxtbyOOTgOwj+k8Fn8Z3nYbDBZuRCILZfkI/dM5c2WQAOd1BCDU8gRzlu7+nDNVwWhRhJtfeNLlSBul8r0nMj4ltGK2A6a8CdofhAJxdaJLs/UYJmg2y6bLOQGjGp7a7GjWqiHGPsOL+2xwvJgwat4pbMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fFUNRunYwDM188fMNCN5Umsl4uiByiI4M/Q5McCRWhM=;
 b=G2VoIfOLQf+LD28UlUktOkLKnnQ66aPfS6ATCNR/f413YYeqCTwhX6d4mY4LNkCVqu4kconG06GBjYTeRC6jAB29whRbGyDwSmu05w31t6XZ08Gx/8tbizwYHpGsQzO6lj9foq4INkQ9Ml3TSJcJeZPkJDIOChVykG6rSS7kL30=
Received: from BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10)
 by SN7PR10MB6665.namprd10.prod.outlook.com (2603:10b6:806:2af::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.28; Thu, 27 Mar
 2025 21:44:36 +0000
Received: from BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::a088:b5e0:2c1:78a0]) by BLAPR10MB5009.namprd10.prod.outlook.com
 ([fe80::a088:b5e0:2c1:78a0%5]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 21:44:36 +0000
Message-ID: <f8ec905f-04d4-46f6-909c-7f79b151c0df@oracle.com>
Date: Thu, 27 Mar 2025 17:44:32 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Clear AMD's microcode cache on load failure
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, bp@alien8.de, tglx@linutronix.de,
        mingo@redhat.com, dave.hansen@linux.intel.com, x86@kernel.org,
        hpa@zytor.com
References: <20250327210305.1694664-1-boris.ostrovsky@oracle.com>
 <Z-XEPVvEDhC5vzR4@gmail.com>
Content-Language: en-US
From: boris.ostrovsky@oracle.com
In-Reply-To: <Z-XEPVvEDhC5vzR4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0275.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::11) To BLAPR10MB5009.namprd10.prod.outlook.com
 (2603:10b6:208:321::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5009:EE_|SN7PR10MB6665:EE_
X-MS-Office365-Filtering-Correlation-Id: 444be6c7-9033-45ca-601e-08dd6d78919d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T0trdytxdEV4ZUNOTWZPNy8zMk9URWcydlg0VC9GUUc1VmtmL1hTbWVzZ3lM?=
 =?utf-8?B?dDNCeDZiQ1VYRUVMalhxaVlEeWJpSVcxd3FwVndwQnA2VmlIUkVRMjM2eTUx?=
 =?utf-8?B?ME5hOGNuazUyNWNGSjY0YW1DWDhLcTRVOEhjOUxoajI1NWJBTGFhekZjeDFO?=
 =?utf-8?B?V1RrQWhoU2pVODJvNmdBRVpWS1NWV2ZIR01HMnJLME55WWg1WlBCc1JyZWVr?=
 =?utf-8?B?WmdSWU14eFNEajdBTGZMMlAyeW56QjdBQTdlcVgzSFpWbnFjY1hwc2JOQ0Y3?=
 =?utf-8?B?ZHRHVHM0dnJka3BVNXdpejJ0NzN0NUJtR1A1UFZ1eXk0RmJyUXRRQnlWRklh?=
 =?utf-8?B?dkE1amVqdThGUG9ocEFMY1NlTmEyUHdwaFVuRE5ESkpjQnJnQkxGVjRZYlBR?=
 =?utf-8?B?dkEwNXJWSjZVeC9ycllaQlNNbzRuZ1ovSk50WEo5aEJxZmxDc3BKSXFtTU5v?=
 =?utf-8?B?WXpUVTAxWkZiNzVwVDJDLzczQ3dldGwvMi9oTHBDTEpUOGhHZnZ4Sno5YnNa?=
 =?utf-8?B?TU5WR2kwd3EwdlQrYUcvNFJkT0Q2NkxrTVgrNlFURCs5WkVsSDRxU2ZiWFpX?=
 =?utf-8?B?N1NieE1ZOWR0clFjMWlYK0JLbkE0QXJCSys5VGowUGJuSStOKzhWYTBqM1pY?=
 =?utf-8?B?ZGJWZnoxV3VWSmxld3hNcFdyR1V0Mnp0bk5COFoxQWtuWm9DdjRmc1Q1VXMw?=
 =?utf-8?B?ZUhZc1RVaHk3czBxZGt4WVJKUHI5ZXlsclJlL05rTHp2b0NNZlhIUHY0aWFH?=
 =?utf-8?B?OEJnbGxaWkd0WE5xOG5HU3pueEVIT0kxempWOGpzcnJMMkZDTmczLzFCYm1o?=
 =?utf-8?B?M3ZRQ1kvK3B2TEs5TmNLRTR1L1N0cnUxek02SXAxTlhLNFZTdTk1YWZMSEgy?=
 =?utf-8?B?WUNUaXhFQ3ErdE5idnJtRTdFM2g3OTJSY2RNMjJtMWNTbGNNMVgrMGFDeXRn?=
 =?utf-8?B?K2Yzb1F1UVNNU3gvVG9uRUhhcU5jSVFlSDJCdCsyQVhERldXQUFQUllIb0F2?=
 =?utf-8?B?cm1yTTA1cldVRDk1dVRPMUpnK3hUV0dnMGVGemVZRktQUkRGcUk4VXZUVURR?=
 =?utf-8?B?a3R2WWJTODBWbEo1Ryt3M1ZsUGt3T1hKRGZQRTVXWjQ0cytidE5RcS80UWZE?=
 =?utf-8?B?VGZrRDlOZDVvZlZOT0lEY0xaM1J4eDRGQjJxQWpuYVZRZ1NCQUxkQTY4MmRF?=
 =?utf-8?B?cmxtampCbmpKSHlHVDQyZlFyeEFkbDAxVGtlaktFcjBvMS95VWtJa2xmeHRZ?=
 =?utf-8?B?UE8xZVdUS2V5bVBNbHRQcWZEN3NId2lXS1RqYTl5cTVUQ3BwMjJMejN3Qmtn?=
 =?utf-8?B?M0RPTDBmbTY5bjRBU2FyaU8zcDExMnRaWXByMXhyblFiUUpHdDkzZXNDL2NQ?=
 =?utf-8?B?OWtxdWVKTytTSTNsUU93cUZxZ0gyWkJxQ1poUW5UTTh1VldVRU5FREtSdHhP?=
 =?utf-8?B?aXhoWDlCdDlwMkNvNmIrRjY4SUtkWnY1VWp0bmsrVlMvcWhxc0dQUnRnaDlR?=
 =?utf-8?B?SmZmSHUvcnNMTmNaM21HblQxNWROWWYvVGdISkZzTE9QS013NlNNcm82VlZu?=
 =?utf-8?B?TTRsYzJMd0hXajNjWWlzb0Y1TlQwSFpZMFhROGYvcFcyVGdRazNDWEc0akdz?=
 =?utf-8?B?YVhtcXVodENIVGEwN3pYU3JQc1pMd1k4V1NOeDJlV3hLNWhQVDZPSmJRbURl?=
 =?utf-8?B?b1RvRlh6QnBMSlNpckxONVoyZEsvdG4wdFo2VWs5UURwdkxSVFJoQWFMc3Rt?=
 =?utf-8?B?SERSR2h2a1NyK0JRZDNudXhZV1VKOUQ3QVlVWUdFOVEyYzNqQ2NUN2VlYUxR?=
 =?utf-8?B?TmVRM3BEeUVRdkdGMFEweWRuSER0MCt5bWpjNVMvQUZMazVPWmxmdTBqYXI0?=
 =?utf-8?Q?gqp04FFnliwAa?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5009.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDdQQnhnbnNUQnFQTVRLK1B4TjJwYUxsRTN2ZmFSbldPZEROZFYvbUE4ZXgz?=
 =?utf-8?B?YkJsUDNGWmRaaXFLcUI3QXF0ZHdLeEhWNk53NzEyWWNzb0lIQzE4WDZoNTZD?=
 =?utf-8?B?UlJBWHYxTDZQWGlkcnAvMlpzWi9UTStNSC8rUTRVYk8ycHhYU0ZoaGVZN1NZ?=
 =?utf-8?B?dkNRV1owZWR2eUVsN0RLSUF4a1lIZyt6enVUY0FhVmdrbzhYbE9saUEybldF?=
 =?utf-8?B?NzRYM2dzd3dVbDZkRk0xVE1XTEl4RGxHSzBRM0VKOFBUTEZEaTF6SEhtSjVs?=
 =?utf-8?B?clhVdFY1NHU5Vml5R1U1aG5aK2tReklPZVozK0NyQnZQMURYcTFGYTRFZXNx?=
 =?utf-8?B?ZEhleEUxWDBPSDhsY1NBM3hnZjljOXl2WXRFQXp4VnhwdmoxazlQbWNudldl?=
 =?utf-8?B?RElTOWNhbGd1Z2htWnFWNmZPNEFLdFRyYXY5RFMvdys4aDR3VkpEZGJXclpj?=
 =?utf-8?B?TGZFem51Um1rcm9hMDN4NEdXQmlmeHBwZ3NqaytBdHFWUDR4SG1ha0hiOWpK?=
 =?utf-8?B?UllpQ2lPS3F1bHZZbnBDQWp0clZ2TUJZL0R1Vkkzekd4Q3pwaXMyem9LWWhJ?=
 =?utf-8?B?Z3FBZDEyUGp2ODZkSmhJdTZwc0tib2lrSUEyQ2txSVlManNZMHlwUnUwU2Zu?=
 =?utf-8?B?cXV2QUltZGMyQnB5ZW00SHg2UHBhUVJLaDhCLzB1OUNVSzFoOWVZUTQ0c1kr?=
 =?utf-8?B?V2NudnVxSkFWQWVjaVlTMTRCdUZPQ1VoLytQUkRNK2dXM3JnOG9Pb2F2bk5p?=
 =?utf-8?B?dGErZFpEbzNWZnRJV2ptZHhuYU5IMDBRWWxCcjNCczdUVjVDZ1VmSHE5K2lS?=
 =?utf-8?B?VWlzZDk0enN6NG03SldHYWxWS3h1cldGdG1EcFNHYzY2MXVNc1psWlkrZ0RN?=
 =?utf-8?B?S0o4Mm9CMnZTcnVQQzYreE9uSDFZZUU4RTB5V3AwTTV0ZG93U0tGdi8xa0NO?=
 =?utf-8?B?aHUwdUFzaDdHS084WDM3K3pGWmxUMTBuTmtsVDFGSC93cWFnVEtZVURxWVVB?=
 =?utf-8?B?N3locktyTXdvZFpsZTdIOUZ1bU9VbUtFMEZGanJjbVpKSUw2ZjJTRm5JdjVB?=
 =?utf-8?B?ajVyMnAzeVk0bWNTOGpkb00yN1l2cHVWK3pGNEIvMnBjaXpncGEzanRmNit6?=
 =?utf-8?B?d0N5cnlwQ3RDNzhDaGNCMUhGMUtZQk1pMGYzRDM3RnFYOGpieGVlbE5OT0ls?=
 =?utf-8?B?UXB4anZtV29HSXFPdTJxbjlGSXpES2MxYWhrdjJ2RnVJSXBHVGlpRC9RV29w?=
 =?utf-8?B?YVBjd09QWW0reGpKYndWdnByekpRTlVLQ0tzZEt1alh2aWdQUFNDMlZaL1ZB?=
 =?utf-8?B?eDVQd01JTmpyMnpqNFI0UDJJdDc1cTJuenlkR3ZLdWdpRXFyN1drc1ptMjJn?=
 =?utf-8?B?Wm04WHEvYVoyWVB2MHJrUmJKQWVZY3lUdlFiTktCK1NkN0ZpNHdoeCt1Y3lK?=
 =?utf-8?B?TzVwa1U3aEZ5R1BuN2gzZU95S244S1NBdE9uNVBRRy9sYjhsMkxqSnhYOTRJ?=
 =?utf-8?B?a0dHTHcxYXE5TU9SZWRFbXBjTFJuQkYwNkdTNTM4UmlHTFYreE5DRmh0cTVL?=
 =?utf-8?B?STNyMnZNQy9Cazc0VGt4VXZwamV5WE5NV2lZOGtZbEgwYlowS3NpK3F6S09T?=
 =?utf-8?B?UldOMGw3YUdrSmhOdEZHRm5iU0ZtUXRwelQ2WmozVWdidHFaN3pmbmk5VWhK?=
 =?utf-8?B?dWpSakNnbHd2RnF1Q09oSHZKMDI0T212dEgzZk5qd2IvVVZwTkRVTW9xUGoy?=
 =?utf-8?B?RGxKK0xET0lTdlZpejNWa2UvSDBQWk9WcFJZdzVMRzF1R2ZsdVhhaFZ4K2p5?=
 =?utf-8?B?c2oxZnJCakFibVNCUFNIS1o0TEs2dkthd0NHNW1jSEhTUU55UEhMSis2c2x6?=
 =?utf-8?B?Z1hsZDVXSWRMcmVhTU9Nci9iTFR2b3l4ZE80S3NrMHRGaE1hN0FtdFBBaEUx?=
 =?utf-8?B?eUZuN0d3VE5rZnBFekFlOUNWRjlHUE4xZDdPbWs1L3ZGS2FNOVJnMm1rVlBw?=
 =?utf-8?B?ZHJXbGQzNVdCVkxvcDk0amRGaG95REF0dHd2dEo0SExzMDVhVGpISUR2dS9K?=
 =?utf-8?B?d0pvMS95MUNWTUpLUTFhMlFhRC9VWVlIWXlvYTNrUG5JalF1SEZ0RVU3YjNM?=
 =?utf-8?B?a0ZFUk5MNUhvVEk1c25zbEYvRmhaM0JVV21VYXViQlZDYk42dTlmZnl0S3RF?=
 =?utf-8?B?M0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fHhRQgBWwUQJXgGJCmBzzmuAw3VTDA/ug5eCEG27KFTcjtp5vjkffrgmpSVBIj/SCcwUNM2IoOmJlmAKi0N0/BMdvnDd8k7GfyxFvYG9HYp5oC4hCpb9KDj03dDZW5qA6dIBNwU+0LlbYmZ0MNwKewKS4zsgz8S2sVod2N+WaMoO5yYgyPBu3I8hiW5Bsf88Vl2Z4tqZmIS0HOGBOSzv2y7ztqUs9ytjLoutlNNhVhw+SlAA9KQEQqh4uUMmxAPeBn8PGZx7neg9i8C1OR6eB3tzE7thWRBtxYx5ipjN3FhM++xdwdWzvz9HM7Fo2ggjpEylebS9fAEiTn7fmJKcAvXxXtzkQXp7zDm4y0uwSYAI9QgIAn9t+YNqKmUljnKiTrV/J5c0MzDpKBQu0a/Z1y5SfE0AiLHmKE3Ym7B0hcGtwR/CEdIIDkDgxjMESb2qmUYyQyEvz6Cy2DJB/m0TacCGvsQ5HQQmnsYZrWmvr803C2KAYiTCCZGrKoOkThZnD2jVmkhGifajOt27IxGeB/vpN3iJt5aO24cASH+nqkM06wpRAtb5uFEVK6TP1fAI1iLwM4tOXtUkIpcIRZxq2TMx+UWoEp5HHDBmniX9p4M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 444be6c7-9033-45ca-601e-08dd6d78919d
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5009.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 21:44:36.5906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qHouj8HpUWiQcfo1FapexznjL15kvo2WPlJoZfkaZZDnvg9i8+sef7YKWmqKVYGag9dm07+BBO5jjcabu2W0Ke/oa0xilGdMtq7WGrySV2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6665
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_04,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503270146
X-Proofpoint-GUID: uQdqaHaLpLmZrG5qbB2Irqz7LZvDuVA0
X-Proofpoint-ORIG-GUID: uQdqaHaLpLmZrG5qbB2Irqz7LZvDuVA0


On 3/27/25 5:33 PM, Ingo Molnar wrote:
> * Boris Ostrovsky <boris.ostrovsky@oracle.com> wrote:
>
>> Drop microcode cache when load operation fails to update microcode.
>>
>> Also make __apply_microcode_amd() return correct error.
>>
>> Boris Ostrovsky (2):
>>    x86/microcode/AMD: Fix __apply_microcode_amd()'s return value
>>    x86/microcode/AMD: Clean the cache if update did not load microcode
>>
>>   arch/x86/kernel/cpu/microcode/amd.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
> Should these be Cc: stable perhaps?


Definitely the first patch. The second one is not really a fix but 
rather an improvement.

Will resend. Thanks.


-boris

