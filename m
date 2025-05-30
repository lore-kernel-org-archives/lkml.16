Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2116.outbound.protection.outlook.com [40.107.93.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D225276034
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 17:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748625527; cv=fail; b=PCvEkqgmBV80g8WZjbVhLQIyt/v4Bvir75v6ySc7rwX10o3LAuHrpYfcg9r9r+qNioxINrOny3Ya8bvKxNkmHu5ajyOj+XI0axDDw10SC0j0ENyKO3Kb0xW86DlYqeSjdJyEkg3kNRS0agAI5kyZw1cqPEmWKGg02AjyagEshgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748625527; c=relaxed/simple;
	bh=8kH7YZg+Jgl5r4XFPfHxbqUHp7ZeceEnWqel3tPSUoM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tz5dfrWXRdaR5mH5drU21QT+qsxewjBbfXdmTxp3i5gy9kKLacnxLL0JkcjgX4wdCst7i0xW7fUt2d98UJzoakYi/lHezt9ob/Tp9AVnC6f6d7beHzAkqWmYZGTOKaDFZTOF5yxmtK/c3M5PXHrKBo7PbQGKVY+X649HMXNfo6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=KvcvaCwI; arc=fail smtp.client-ip=40.107.93.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="KvcvaCwI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SE1biWLIvI2u/caAWlCqoR51swddywRlq+an1DDMPoOA0+AD42s9T48WEtul/EpF4toXOn7tStmD/R9ErFtnolZ6rOYySjp0qPLMPaLffpMq5T0FPVoaTY9zGjClEJs9dHnXxL0pRJULuz7b31rNgy2pnsZMsrk4KeeEAPYUhObp/JhaBxXwAOJkNEHe0D/yO/y9ARnCw8loK16Jc8dmi/rsfghaTPucjK4X5Qa49rYHTufoY/zB7HJ7ApG4raOsjKKAFwouxHkMKnP2Q9DmZeEeFJU1qjuumY7UHevx+aNCP6Kv5/gplnmFGCsDTIr46TI5f4clZOsdP52SoGl7Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=45K7wTEuP5t2KwCzgYDIq56EOZTvlkqg5TVK6OkCcuI=;
 b=fNX7iZfUM5wPcErXh5CK/BCcf1cmf7bedQgJo1GIHGXCQQN10q+vgXeGrwnoZwwmRVZ4EQU4GvMsEy0gaS/ecpmZMr2/qOo3D3f5QDn9cyKSJeimPugdb+CJKgI42yOyhGNprun/MhKntoiRHaplxSpXiBV3vKPr8wsvm/YuEI30gOL2TdqFwWTHJQpH7vIhDMX0/EmzoiZq8BPzebs/e+dOy5vIH6e0Lk6EwkExTURedDuQJU7UT3U6TFq9kEH1epkYj5zjW1ecH/lWXxGPPBIPtXHl+0idUXOcgIlu2AAWbrIRLwdTMDZ58YdtUkGRsgdUnlb2vzoGEd5QBl+37g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=45K7wTEuP5t2KwCzgYDIq56EOZTvlkqg5TVK6OkCcuI=;
 b=KvcvaCwIhsgeZMSGb2qqPAflJQgfpyloFD/5jmDCBoWvGJlgAjgozdg3+UasC7uA7ScRCWD4SAYZj0Q/8/5M95ZhW9CM7J+Uz9iWPZsTEkPKZcA3HWpystgaKxxqEFBKkEUE44YXZwVQ+1voqjiuQYTXWtJBUWzSjf1hQ/GMVjI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 SJ0PR01MB7313.prod.exchangelabs.com (2603:10b6:a03:3f3::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.27; Fri, 30 May 2025 17:18:42 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%6]) with mapi id 15.20.8769.029; Fri, 30 May 2025
 17:18:42 +0000
Message-ID: <ce0ae0fd-3a9e-4cc2-8a60-f4ff434f3872@os.amperecomputing.com>
Date: Fri, 30 May 2025 10:18:33 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 PATCH 0/6] arm64: support FEAT_BBM level 2 and large block
 mapping when rodata=full
To: Ryan Roberts <ryan.roberts@arm.com>, will@kernel.org,
 catalin.marinas@arm.com, Miko.Lenczewski@arm.com,
 scott@os.amperecomputing.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Dev Jain <dev.jain@arm.com>
References: <20250304222018.615808-1-yang@os.amperecomputing.com>
 <5c6d9706-7684-4288-b630-c60b3766b13f@arm.com>
 <4d02978c-03c0-48fe-84eb-0f3fa0c54fea@os.amperecomputing.com>
 <912c3126-8ba7-4c3a-b168-438f92e89217@arm.com>
 <2ab5f65c-b9dc-471c-9b61-70d765af285e@os.amperecomputing.com>
 <239d4e93-7ab6-4fc9-b907-7ca9d71f81fd@arm.com>
 <1141d96c-f785-48ee-a0f6-9ec658cc11c2@os.amperecomputing.com>
 <9cdb027c-27db-4195-825d-1d63bec1b69b@os.amperecomputing.com>
 <e3e6a3e0-3012-4d95-9236-4b4d57c7974c@arm.com>
 <0769dbcb-bd9e-4c36-b2c1-a624abaeb5ce@os.amperecomputing.com>
 <f31792bf-3b54-408c-9deb-7058a79c60d4@arm.com>
 <a27776ed-4b45-4269-9e3c-5ca1463e4841@os.amperecomputing.com>
 <bfae581e-3988-44b5-af5e-8e2de4db68ed@arm.com>
 <cc1522f8-85b9-48e5-951f-9a1bb2075918@os.amperecomputing.com>
 <e0960267-0dd5-412a-be54-1afaacc6bace@arm.com>
 <4b2278d8-d627-47af-ae90-9d62ad249c88@os.amperecomputing.com>
 <ca1673c4-1c8d-40d5-bc40-abc6489b2fdd@arm.com>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <ca1673c4-1c8d-40d5-bc40-abc6489b2fdd@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0277.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::12) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|SJ0PR01MB7313:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d580f95-8784-498b-938f-08dd9f9e0685
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y0V0TlJsNHNuMys3Vm5PYmRoWnlqTnN5Y2NFQ25WMEZMS25hZzhRaEtQWk5M?=
 =?utf-8?B?TkJZeGcrUG0rdWhhWngvUnF4eTJwRTY3RDgyQUlJQzUySko1NnpteEFtUG9m?=
 =?utf-8?B?TEpPMnZMQ0lqeXhxcDRjQXVucHArdFlhTmk4emJvcloyYUZ3Z2Z2R1luUjVn?=
 =?utf-8?B?SHNyUFZKMnAxWjJKczBsUDJMRVNnSmh0ekdkSHZkUU5WT3dvSTRyWlJqczNV?=
 =?utf-8?B?cGJSZm5WNWFaU0wyb2dnMFRzVE9Td1RTd3hmd1VzSjJvd3d6TDJqWmhiN3Bu?=
 =?utf-8?B?RlU1dmFkT3lsSUFUaGFPT2NWMWpncnBFSHNpYzhIRHVPWHFBZ3pvYkp6cjBh?=
 =?utf-8?B?MTdYb0RyZ1dEazZPSlZUOHEyRmdFQ3VIOGJLVFIrU2JYV2VZSHVmVXBTL09a?=
 =?utf-8?B?SkhuYWRNOWhEdGlSd25QM0lqTStYazNKenNiNHFLdXVFRmtRTjcvYWQ1azkr?=
 =?utf-8?B?QTNaalZkeDl2Ty8vcVE4NHlwTXhXdzVjNDk4N25YZHRmQjdTQUR1WGhDRVU5?=
 =?utf-8?B?MlRjcU9JbkZqWGs2QXZmV2JRQTkrSE04K2V4UnlNR0xkT1VyK3JPWE95OVN6?=
 =?utf-8?B?VUNPMEhwbmpEZ3RES3VONnpudnVUcThrNkx4SnplNTZ2WmQwd2VhN3RFUU5H?=
 =?utf-8?B?V2dFV3QzeFE3dGJSYnZORWpsOGRYQjlCblA2N3VTNTRNL2RoeFpVbVYyMk5O?=
 =?utf-8?B?V3k2VHoxTjZOOEVvWEs5VlpoN09KMUpRSG45NHBzMmE4ZHBFcXI4NVdBL1hV?=
 =?utf-8?B?dG05T1JVcTRNS2hLb2xlNnpUR1c4Z2ZOTjJ2VUdyMUkyNzJSV2ViYVB6UjVz?=
 =?utf-8?B?WUVMcU42aTBISlJ2T3RIMUVscHJHaWhXL0dBeVpWdlA1UkpxbUovVEdqQVZ1?=
 =?utf-8?B?Q1grYTE1dTIvcW8xQUM2WGJabVNTbXVKajNRWk9KVTlZWWVheDFzendHZDRv?=
 =?utf-8?B?UG1nWmREZzVDZUtJdnVNeTNMOTIzM3VYM0tEenBmanNoOC9MUXdHUEphRElh?=
 =?utf-8?B?anNKemU2Y1l2M21CTU9rd09DQTdvbmhpUDg3cHRGbmhlTUNXelNnRjBqWGNl?=
 =?utf-8?B?YjlkMjkrQzdCRjFqZ0NUNnIydHlHcWxlaFkzdFFzcDVuc1NZOVp2d0IySkFM?=
 =?utf-8?B?R2QzOUJITDA3eXkzYTg3ZTZKRHZWbllQcWQ3cjk4d0s1QXEyeHA5RndobW12?=
 =?utf-8?B?alNoRVQxT3JxaFlFZmVnQTVuQWNrbm43Z2NKSklXaUxzSzB1RDZmbEhYTVJ4?=
 =?utf-8?B?TTRwWWlBMC9ZTkhKL0JiUGhucW1XbEVEd29zSVBQbkNmM3ZDcTU0TDFXWGhM?=
 =?utf-8?B?UklaUGZBcFAvTWZRNTBGSXpybTg2cGh4d29yQkhXaG1XSmJHVnZlZXlOQyti?=
 =?utf-8?B?ZzVYOXJCSU5qbzc0a2ZzQ253WnJ2ZmdFM0ljclg4UHdLMlpidHE2TlptLzVK?=
 =?utf-8?B?YXhEc2ROWkw1VWZFcDJ4QVBNeE5TdnkyUWxXQkxzRmE4Q1R6cXRNTytwaDlD?=
 =?utf-8?B?TlFLQVNQTzB3aStHTGo5dGl0d2RBdDBvSUo4ZC94aGRpdVowODdDR0preno3?=
 =?utf-8?B?RWV1N1I5M3VETUp1emlQb3FYb2VyOWs5RE1EY2N0aDNrSng0TkgzWXFhODIw?=
 =?utf-8?B?U2d4T1NHRSs0UEwzNmFUdFhSUjFMNlJUMUdsRXA4OVZsYkVKS09NTzhwL2c3?=
 =?utf-8?B?c3YzdlFabElZNTVTNzllTTVqbEN2d1d5ek5tRm4wMFN1S2VQeEhZQ3pldWFR?=
 =?utf-8?B?RDlaM1lFbWs0dkZpYWh6WVNUbVhWMUlOYTJwNVFPdzFSL2lad2tpenRpQy8z?=
 =?utf-8?B?V29CS3VTMmhsbmhxUnlaY3V1ZnRqNGxPVXVuZmkxV05kK1h6TG96VDltbDZw?=
 =?utf-8?B?YVN3MXUwVkpDbjFRc0lvUTdKaVhNNXJ6dExxMHQrUDZCRTE4TG4wZ0FTVFZF?=
 =?utf-8?Q?Od1iYNhtP/U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZS82ZmdQVTYrcmRQQkxqbFZ6ZGhGU0ljam1aQVNGOTVKd1prc1RxNWxnaG9Y?=
 =?utf-8?B?d0E2UkRxbHc4bEFZTWVUVkMrR0tzU20weDNnUDNEamVMRjdhT2VycGZiaUJR?=
 =?utf-8?B?emFJb2ZISzdGc3dSaWRpeWFyejZMRlpHMWdNU2Q1bjk5eEpORElNVkgrZCtN?=
 =?utf-8?B?b2pOZG84NkV2RmllVHUyaHByQyt6b2x5U1JPUkJ5RkdPV1VHOGVmUmZ0dmI5?=
 =?utf-8?B?dzlhTFRMbHhTenFzT0lrcE81WFRTejVtZEorUDNEbmN6RzlNVi9ZbGExMytO?=
 =?utf-8?B?WmtDemdrZnFRL0R3dFdTeXFoZXhVZFFGTStLeEVpaGgwbGRQbUdJWWFJcnlr?=
 =?utf-8?B?TzlhQlB4QTN1NzljdGk4U3VGTjZGNEwwRmYxcUhzcW5STWQ5MWtOY0tIeFF5?=
 =?utf-8?B?d2V1K05hZVd4VmN3endIWk5mcTlMb01pdm9EczFTS293VG1lMXBtcmNuODBn?=
 =?utf-8?B?bkNORjVOMGRiR1pDTTh2alBZcTk0ZG5FTkZnWDJXWDdNcnpJa3lnVnNVbExo?=
 =?utf-8?B?bnJUdm1qQjE5d0x3bjlEY2dxbnhncTM0SlMvKy8ybzBZNFIydGJld0MvL3Bt?=
 =?utf-8?B?OFByNFhQd2FMK1R3UGNlUXUvSXhpTDRpZXFmRUpTZTBjZkF4dEp6RXh4TDdL?=
 =?utf-8?B?eFhqaURwVDdwa3Jza3FjaWJubHhsckxWbCtrL1E2NFR6UUdEYUhsbEs4ZmRq?=
 =?utf-8?B?aklKOWtOakhGdVhOd1dDMFRsRVZualVJNy94QmFyakcwVkNMMzlQNm1xVzls?=
 =?utf-8?B?eG9Scm1tTHF4TmZKVytVK29BR1hWRzJpdXRXaHFtdTZob3JtRDNqcGh6MW5H?=
 =?utf-8?B?YlR1eTFQeWZLemtXbXBrOVBINmF5c3lLcHhtbVJ0UXdMdFVIL3ZtdVV0a1c0?=
 =?utf-8?B?cUhLOGJtTFV6YXdZY3VUM1ZrOFIyNGE1MVhqMnh6emttU0VmeGFEbHF6K011?=
 =?utf-8?B?NmJibGxzK0NzR2t1OGNBTVdzV29LcmZJZ28za3JMS2tocWNTd1VZbG9ZTW5R?=
 =?utf-8?B?VFlZM1I0TGJlQkF2TGx1cVl5WmZPd3Nmdk9HWlpad2U5QS9PUFpsZDhpQ042?=
 =?utf-8?B?aCtxMzNXS1MyZy9TWUk2VFdYQmJaVEtpVWFaWWNOVUh6djdqYjYyS29KeXFU?=
 =?utf-8?B?Y1JSWDQ4ekp4dUdTZFM5bElMZXVqcXhjc0s1MTFQeXNreWY1YlpwK253elJ0?=
 =?utf-8?B?RmRJYi80K3E5OEw5cWdiVXdJSHpiVUhUSTdJenZnQ1Bkb0tDazdCS2hGeEZS?=
 =?utf-8?B?L2lLVGpmRWUySitJTldSUlF4ZzV2Z0tvSWxUdldUN2xMQ1Z4SXJ6cTE3OExi?=
 =?utf-8?B?NklqcUswZXBta1dzb1k2Q3RVR1dzcVpCWXpnaHM3R3NLSnpwM2dDSEJ1VnB1?=
 =?utf-8?B?UGI4cDBGOWNNNkt2RCtFem5EMHRQc0dPSzc4WVAwNDB1UllUeVBkUUdoWlBQ?=
 =?utf-8?B?OHVBeXl0cmNUVHNHRFUySjFkajZ4UHFuY2tSRm93OGczeUVuWHJ5WGZxcEto?=
 =?utf-8?B?bzVkemFTQ3NoV1k1OXUxRW1SdkpVK3VYYWFDbmhZSlQvQW1hY2YvUmFoWmEz?=
 =?utf-8?B?T3h4OW5PYTI1WFkxazRLUzY1d1FOMm84SDFZQkVJNlRmUytPZ1dnTlJUYTM0?=
 =?utf-8?B?ZHh2OGZUK2RHUlhxRXRzV0NlcDduTzdnNzB0OThBWVNzZVpqem54SE8yZ1Y2?=
 =?utf-8?B?aVdIMEVKUW5YMERSaWh1SWtvaTR3MFB6V29IanZoeWFjQ3FIRFFLTjlneXpk?=
 =?utf-8?B?cm5hSDdnZUE1dHR1bjdNcG00N01GTlo3Y2RvVzdKeWNicS9odGQrVWRoV1po?=
 =?utf-8?B?ZFM2UXdUYVFURFk4WW1hRzJlcGlOSG5mQXg5dlBkdk04clNMc1NObGhYcnRT?=
 =?utf-8?B?d0VyTkF5MXZBWjdoWE1tOU5ZVVRIajFSVEh6THM4dFNRQTJOSjB3VlhKVE45?=
 =?utf-8?B?UUtTTFdVcFl5Q0REU3JzS2FmQlZodGc0TXdjbzZiS2M0RVVWcmRPeUxwYlA0?=
 =?utf-8?B?a0tReStDK0QvbzRJbW1rd1VjczFkVDBFWlZUK2dmWTZXaXYyQ0wzWmlLdEFM?=
 =?utf-8?B?VGt6UnNjK2hQRy9hS0QyKzVoT2Y4N1BOOXNNNVIvRDFJK2c4Nm1OeVN2bzdm?=
 =?utf-8?B?NVdLY1VubUVDaVRvMktyUFJsMXo3YUVrL0lQc2FxUlBVckd2SVE3S013dk1E?=
 =?utf-8?Q?omhfybaXF1MVCp+tAZDhHm8=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d580f95-8784-498b-938f-08dd9f9e0685
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 17:18:42.1340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ruRO/4ipZczKx1tMvUTTxsmiKkk7cauPzecxOQARzQmc+eweZ9sqrlJWY+w+uYkIITo+oOEFJsfJWW5U5fLkiLXlbsTBbwffWfmgBM/aXQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR01MB7313



On 5/30/25 12:59 AM, Ryan Roberts wrote:
> On 29/05/2025 21:52, Yang Shi wrote:
>>>>>>>> The split_mapping() guarantees keep block mapping if it is fully
>>>>>>>> contained in
>>>>>>>> the range between start and end, this is my series's responsibility. I know
>>>>>>>> the
>>>>>>>> current code calls apply_to_page_range() to apply permission change and it
>>>>>>>> just
>>>>>>>> does it on PTE basis. So IIUC Dev's series will modify it or provide a new
>>>>>>>> API,
>>>>>>>> then __change_memory_common() will call it to change permission. There
>>>>>>>> should be
>>>>>>>> some overlap between mine and Dev's, but I don't see strong dependency.
>>>>>>> But if you have a block mapping in the region you are calling
>>>>>>> __change_memory_common() on, today that will fail because it can only handle
>>>>>>> page mappings.
>>>>>> IMHO letting __change_memory_common() manipulate on contiguous address
>>>>>> range is
>>>>>> another story and should be not a part of the split primitive.
>>>>> I 100% agree that it should not be part of the split primitive.
>>>>>
>>>>> But your series *depends* upon __change_memory_common() being able to change
>>>>> permissions on block mappings. Today it can only change permissions on page
>>>>> mappings.
>>>> I don't think split primitive depends on it. Changing permission on block
>>>> mappings is just the user of the new split primitive IMHO. We just have no real
>>>> user right now.
>>> But your series introduces a real user; after your series, the linear map is
>>> block mapped.
>> The users of the split primitive are the permission changers, for example,
>> module, bpf, secret mem, etc.
> Ahh, perhaps this is the crux of our misunderstanding... In my model, the split
> primitive is called from __change_memory_common() (or from other appropriate
> functions in pageattr.c). It's an implementation detail for arm64 and is not
> exposed to common code. arm64 knows that it can split live mappings in a
> transparent way so it uses huge pages eagerly and splits on demand.
>
> I personally wouldn't want to be relying on the memory user knowing it needs to
> split the mappings...

We are actually on the same page...

For example, when loading module, kernel currently does:

vmalloc() // Allocate memory for module
module_enable_text_rox() // change permission to ROX for text section
     set_memory_x
         change_memory_common
             for every page in the vmalloc area
                 __change_memory_common(addr, PAGE_SIZE, ...) // page basis
                     split_mapping(addr, addr + PAGE_SIZE)
                     apply_to_page_range() // apply the new permission

__change_memory_common() has to be called on page basis because we don't 
know whether the pages for the vmalloc area are contiguous or not. So 
the split primitive is called on page basis.


So we need do the below in order to keep large mapping:
check whether the vmalloc area is huge mapped (PMD/CONT PMD/CONT PTE) or not
if (it is huge mapped)
     __change_memory_common(addr, HUGE_SIZE, ...)
         split_mapping(addr, addr + HUGE_SIZE)
         change permission on (addr, addr + HUGE_SIZE)
else
     fallback to page basis


To have huge mapping for vmalloc, we need use vmalloc_huge() or the new 
implementation proposed by you to allocate memory for module in the 
first place. This is the "user" in my understanding.

Thanks,
Yang


