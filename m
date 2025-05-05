Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2095.outbound.protection.outlook.com [40.107.103.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003DFA31;
	Mon,  5 May 2025 09:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746437363; cv=fail; b=ugc4m6VwmTjAgBNIx8yAsh9zEpygqfZCBh7kYJpgEEXP6jVJT7iW2BCg7oWCYuQPhJvw742M1brzGL7WzGX50c4T3MZhADSJpp5XLdsB7Qk7nPktfYTFd9qhA58baR7fjqwrdniufqILVRpERtwKEl038Imanz9DZhLytJaAW88=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746437363; c=relaxed/simple;
	bh=s1CkdKigfLzrOX9qkAxp9CIr6OCRCsS8ego8n/pk+hs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iIMX4B49/AHzKEhdo4ADtzSEmKr2twxiMlPVO5NOoO3ppoCXUXEK36Jyf5sLTrdN/n0BRibxT2R/9Pg2rH5KBXzp1bGoNkoF+/PWNbC37PI64+ZPiouP7nlr4y3OJG3/sH9h5+3vUgrMoXxMZ/iRrwpuu4Ln+KOFt/TE1BFHVaY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=LzPRlK4b; arc=fail smtp.client-ip=40.107.103.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="LzPRlK4b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nbmtHcx5mOP1qPj+GBpsaTULYCpMmi4ZoN3Vp7DHHS+YMatlgd3WbLceb4/XbRRHZW8H0G+K5WsSMejSZ9whFj0xlQCn7M5FOrK25jaG1aput6EEVuLT2eq5/eRIxvaV8XLj0goUTL8ZwrWWzcV7LXWG/74LO8pj3dGDJfrNOBW0lLlIKD4a/iwQO+h/DcYb8AtisPM9n4S0uaTwkHTb7QA0IlKFL6vKS2Xrh/zk7gzq8iHQtCACmzzjug0pPncE4//7K7VrOKsmWpo/Qz4wydnV2Jb1xuqtzZRW7eXitKY45j9Yf20UMKyx23yhSHZkNp5vc86NQYxoj0oleOqPoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A9ld3i446X74c5gT6DaX2X9B0iAchBqxKp+bKPitI2I=;
 b=ZxUipdiLHrJOf1zg8pTYKxmwAfRuWm4O6OM2eZoNunEW6xztD7+siMl8HH0ELdX7sOqNG4m9xZbWDHMRDYTtNvVf9PqYazXkIfVRSWK0n+C1HB4+UuwE+nnZ6y+T6+CSuKbc81oGvqKTHjhZ/zIw38ywZv2nDQYgTJ8JnQNHSegm6LtDdjojJ4nVpVWKOd4Ne8TSZzQ8WKfPgogYHNyU4UxNLw5EzE47jJZBDO3iV8LlrvepM+s8ZidUCCwe86fXV7gITikkhUcUtSfAgxy6dZ01pr/zXWW/+V+ftO5JoanF0yX7MnyhsIKFn0kIZce2dpeYjhy5W2auhdQDL4g2Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A9ld3i446X74c5gT6DaX2X9B0iAchBqxKp+bKPitI2I=;
 b=LzPRlK4bnjC5gFfF8tyizu1xnawuO/WxJPTbnpfnBSENhYEpqnWF4vNgS2kM/9664Q0s0ycKbEOWgb8pLmuOxiLiD5jG+MbsJGAynemeqY9P8FkLCVe4jWrlL1dw3t8A6dczWTag8ioZY+uh/GGqOHzE2wfjbhWalHr6wWnjfLfeiOUMo6za7VlD23R9Ef87UpZdWTjG3/XCauCcrtrHScJaQuGNezF/zkAdiQ0wDaIA1PmE91BZPT8E90GM2/43X54NOfq1R4RVEDzdRyjYY12to9SqpFqyex22WjsCSGS2RmfY4YrlexRpAiFgzfghi72lRLJDcmcgoMirV8zaKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
Received: from VI0P195MB2484.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:248::6)
 by PA2P195MB2494.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:40b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Mon, 5 May
 2025 09:29:15 +0000
Received: from VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 ([fe80::24f:8371:2871:5981]) by VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 ([fe80::24f:8371:2871:5981%4]) with mapi id 15.20.8699.019; Mon, 5 May 2025
 09:29:15 +0000
Message-ID: <1d2e2855-406f-4b28-b08e-3daa6bde6f2b@phytec.de>
Date: Mon, 5 May 2025 11:29:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/11] arm64: dts: ti: k3-am62-wakeup: Add wakeup R5F
 node
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hari Nagalla <hnagalla@ti.com>,
 Beleswar Padhi <b-padhi@ti.com>, Markus Schneider-Pargmann
 <msp@baylibre.com>, Andrew Davis <afd@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250502220325.3230653-1-jm@ti.com>
 <20250502220325.3230653-3-jm@ti.com>
Content-Language: en-US
From: Daniel Schultz <d.schultz@phytec.de>
In-Reply-To: <20250502220325.3230653-3-jm@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0123.namprd04.prod.outlook.com
 (2603:10b6:303:84::8) To VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:248::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0P195MB2484:EE_|PA2P195MB2494:EE_
X-MS-Office365-Filtering-Correlation-Id: 3049755a-31e6-44b3-9cd4-08dd8bb74d8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S0dWMUhTdVFxY2NHcEdMSnJCZU9xcGdibHhrTHZuS0VPVlNwanFRWFRpajN4?=
 =?utf-8?B?ZEtjMWtSd0Fmdit5TFM3T2RUcWhLS3dGRjFtbkpvV3hCdzRzVVp0L21LeFla?=
 =?utf-8?B?bTZEZmQ5YTN2aDRaSTFkUTVNK1VTckVaQm1zcjJrNDQ4bWZhQ0thZFBQQzZp?=
 =?utf-8?B?UmZ6Y0EwMGhuekJZNFNVWHE1MVZaU3M2d240Q2R0enQwV2YyTjlxdkFsNDhP?=
 =?utf-8?B?MDVaZWo1czlWcDI2WG10Ty9wazA2dnlJMDVDWnpNOE9iakRhWHJtRDJ3VlV0?=
 =?utf-8?B?QU5KTXV5cGpMMXk2eXBsSW1WSURJUVFpK2dMRGlWMjJpRVQ0V0FkaHF0NmZG?=
 =?utf-8?B?N1krQWhwclI5cEp6emdheXZLMjQ3Y2tKQ0NlejNKWmFhM294TzV2a2x4Zy9G?=
 =?utf-8?B?RU1kZFFFMlBCdlZsV1pPVnA2aWFFWEw2bXVZM1F1dEU4K2VnNDR2SVlob2Qy?=
 =?utf-8?B?dndtazdkMWFra0RVTWlkdFdRTkVHazBHWlVFRVdTckNwektzMm13Tzg4WnVD?=
 =?utf-8?B?MGIwRVVJNzJvNjJSZld0b3pIUUhjamRmQklTWEV0RjRaMStRY2Q4QUd6c0FD?=
 =?utf-8?B?VGt3Z3VCNkVJWjNyZ01Tekd4UFR2MzJUZ0dsU1BrOCtxbGdUK2JwNDJqSmhM?=
 =?utf-8?B?WG1lU0wzNlJIMUdJWGxQN09vMStZVFBQSC93YktESGF2NWYxR09ueU5wenp3?=
 =?utf-8?B?VVBVZ21QVXRENHUxbGNobmhDdEI1cXJrbUp4S2dmMW5mYXI5ZEJTUnZyamVt?=
 =?utf-8?B?aTM2aXg0bzU1a051Tkk0M09FUVhtdUZmV29wQXNETjY2cWdnRWFTaDlLeHV3?=
 =?utf-8?B?b3VaemZBdXBjY2pSazhBTGtuTFRST1dNWDVvQ29kQzVmQjVTM01nTEtqZEdo?=
 =?utf-8?B?TmhsbEtXRTZoL1FHTmVFYU14RFRJRUt6emVhOUpGNzBVMENjK1Nrd01wSUlM?=
 =?utf-8?B?bVo1bFNGREhoM0k5SHJ2TS9JNTNxRWY2M2ZsV2xmd1AvV0wvdWpuWUhuSlpq?=
 =?utf-8?B?ZXIxK3VSaXZGSDZ3bEpnblJrU0t2Rm9xbXlFTGFCeEVodTlLMTFITGsrWHJW?=
 =?utf-8?B?THBwajEvQm12SGdXa3ViaExUcW43YThnakFyVmNzT0ZuaVZlQ3JwQ2lMNlhZ?=
 =?utf-8?B?YWpaR0R1L2hLdk0rK1JwWG90dUpRS1JkR0NETlRWM3V6enV2V2N2RjFzc2VF?=
 =?utf-8?B?SDFLTU43KzNOeU4rUDE1VVM0ZWcyVHFydU1JcUxybXkzYi9POWZiRjhTYVVh?=
 =?utf-8?B?WDNHdHJ3dmVPWi9YVmhZdmp4WW1zSEhnSDc5Z0dkRHZaQUlEL2tyTW4rbVAr?=
 =?utf-8?B?em0vbkpUM1ZYNVovVDk2MEpzSWdtWm84RUl3MVloU3ZZNlAvTlpiK3M1NUJh?=
 =?utf-8?B?VmNmeG95QnR3NzBpaGFhR1B6VmQrbXdyenRkSGh3SHQ2M1NYUTBScGV6NVoy?=
 =?utf-8?B?bHBpdlFZTzBkdkkzelVzRFlDK3VoUHFCbWtrQVIyL00yTXNrcllUZVVhenI5?=
 =?utf-8?B?QkZJM2MxZUY0eGs3cGRVRTJaVDRiSjMyZlFjTzZxbjBtenlzQmNGRzJOQXEw?=
 =?utf-8?B?anIyeTVCeUdaMUk0c1FVei9odEhtMzJLQ0RZYlhmUFRqQjNuaWh4RjVtT09G?=
 =?utf-8?B?SXZVdlFPdFVXemFNWkRzODVZYnl4MmdrSm90a3NkZ1F0bEJhaC93dXdNUGZB?=
 =?utf-8?B?WW5Ba3NOME1zaThSK2pYM0F1N29mUHFvK3ZxSDZYQ1BXekZZRkljQlRZSzd5?=
 =?utf-8?B?b2JqWWlJWlRlVUo0cXczRVpUNzlUcWlsdmdmRW9VVjlMdkl1b3FUWFVKVlRI?=
 =?utf-8?B?TjMrRlQxQTkzT3dDNVg1SHpOakFLamx6a1hrMkpiOENCcWlmbHAxeDR2OFNj?=
 =?utf-8?B?RjVpOElIOHRkL1Y3OWw5dWJwdHE3cmVtbFJuOHlKZy96NFFUTFAvTTUvWHhW?=
 =?utf-8?Q?PSLMaUh4xgQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0P195MB2484.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MG8vLzBQT2Y5Wmg1ZTdRclo4UUViMGRRcFJRS3ZocU45ODV1VElBMWE2VE5i?=
 =?utf-8?B?QzBhR0haMEdnRmtEZXJLdE9wMjcyNXVlWFVOS1pLK2gyOEhTbzF4WEFoK1pp?=
 =?utf-8?B?VW9idGVjRDU4bnZPd0UzQ1Y4TzZ0Z2prVEU4YXI1eXRDNGJPNFZ1MGhXM1hI?=
 =?utf-8?B?TjQwNTN6QUpPblR2UG9BcHpTeklhak5JL1k2TWF1K2xzYTdNYU95T0dOUEZZ?=
 =?utf-8?B?RlZ2SDVpWTMycndielRWUk9PV1U1dXEvakRXNEhoamQvaEd1S0ZYYmFTaFVq?=
 =?utf-8?B?MmR4QjJ3eDVBRzhRM3JKNElsZno4NE45RGRFektWSlFQNm1JRUJ6QmxENlA2?=
 =?utf-8?B?aEphVVFwY1FqR0ZhdFFjT0oyWjNkODk0bm1iejF1aHgrM1htNmxKRmQ5LzA3?=
 =?utf-8?B?aVN0dFVDVEdwYTR6NjJkM1QwTDUyaHRUOFZqM0p2N3lUVEVHSTB6S1d0cy9O?=
 =?utf-8?B?VVZPL1REakpPRmtLRzdxNmlPZWhIY3Z4VlUvWlJtUGVKUm9Ca1FyRFN2RUp5?=
 =?utf-8?B?THc2QzJYYWNQN3VyNkV6Q21GWWpFS0d5UUJFMWFMWlhiSHVUelhyMEZYK0RK?=
 =?utf-8?B?VCtZa0ZCRUR4V1lDdzR0QzJldEFlbGhRTXhqUG1nbVVIc01obzV6RStUQVlm?=
 =?utf-8?B?em5YRlpSQ1I5VUdHYkZNRE8rSUM5RGFydWNEc1NodXkrMW9YbGhHME5YNGJz?=
 =?utf-8?B?UVB5QVdvUy9qMWdWaHhsTGRiQU94WGZYT2U3NlBvL2JGSkVoRHFRR1FxQWhR?=
 =?utf-8?B?ak5NYTB2c21wMTFQSldNVW01OEtEMUlBR3R2L1hmZVJUMlBscmZmVytoNUVF?=
 =?utf-8?B?WVIzSXNCMW9oMU9UcmVHclNwV2locnNyQm9ETkRXaXZIZ2hEZUJzYjllaGhl?=
 =?utf-8?B?VGJQakpHUVVnQmtpTFozT3lOblJhalpFd3lkc2lvN2M1dkY1aWV4R2NmejB2?=
 =?utf-8?B?ZDBFS01FeW5zMWlDMVQrY3hKUFRYRnF6M1FOdTJuczZ4WTh0dHlYSDZKd3lu?=
 =?utf-8?B?bkRsVVFnc0VWZkhUaEhKVTFOVzFTRlB2Ri9GcDE1SWtacmxrQkQxNjVlUXRa?=
 =?utf-8?B?dGhYTU9LOVFxcnJlaVgyZHdQSmVIb0JmL1lHcHhZZFdnZ1pQZngwVm1qWHpv?=
 =?utf-8?B?YzZMMGY2R214NStCZHhHbFYrUHZSOEg1anhwODlGL2pkb2xUcWN5QWxtT3hH?=
 =?utf-8?B?Z0VkUFE2Z3AyUGJieUFnVUZ3VnJob3UzK2N0b3R4bEFKMkV2VnpEYjJ6M1JX?=
 =?utf-8?B?Wk1CVEZvY0xjSzlLcFhXVzdaNWp3blJTcTJzSXpHa2pMWGJQbi9iZ3MrazA0?=
 =?utf-8?B?VEpSTGY1YUhtK2JXaWpOajJFR1BocHFuMUhENXlTRHZIRGwzZXVFeWpjZDlW?=
 =?utf-8?B?M2VmWWwyeUtITWtyRFIzSzUvTlJKMWJwd09Gb3pDQTR5bXpvUk1hY3BOZWdI?=
 =?utf-8?B?K3FZY0czRk5wcXE2OU5xT2tTVDhjTVZaWW9QWWZBaFhPV21pWktTV0VWRWU4?=
 =?utf-8?B?cmU0WW5DbmRnOFZiSjNyZzd1L1BrNXQ0S0VxNXo1MmRMd1pCdk1YZERvTFVW?=
 =?utf-8?B?TERwOThTenh6WXk1U2kzV1Zsd20ycnF4UkExWkFhQnhseUx5T256em9IUk52?=
 =?utf-8?B?cDZsZ05mejJiQ3JjcGtyNXVKdlU5MzNPU29SYmdDQ1M5bnlScW9IbWZXSldZ?=
 =?utf-8?B?OTkwUnV5QkdXc2VZdU9xcWIreG53alFQWnlTYTZzUWFhRVFRN3ArWjNsWVEv?=
 =?utf-8?B?WGxvS0NtMWpwRUlZQ3krYWRGclZrOHphWGRSbDZleVNtUDErcURseEM1U3d2?=
 =?utf-8?B?TXNuWkxld0lNQ0R4LysxYWZpOWRabk9NNzNpdVBmR3FGV0dOOHRSMlUrcjBO?=
 =?utf-8?B?RHNoZWxrWDNRNDViT2dEYm1DUk8wMVYxMk9wQXg4K21pRUtPZW9XRDFsUC94?=
 =?utf-8?B?RFFRUGRGSGJvSStIdUFQWm0ySHkvT09jd21RenNRa1FlbDdDOHd2WVFlTU04?=
 =?utf-8?B?UDNhdUFLRDNtdVhTYjRPTmR6dkZnbkowTG83YW95bXk1Z2NzQit5MUF3S21y?=
 =?utf-8?B?Y0hXQzhxc2ZBYjJwdkZSSlFGS1dXNUdua2lWdXBhT1ZwdDRQOXB4Tk0zNnVq?=
 =?utf-8?B?bVp1NTdwNExvM2JSd3lqVHlocEo1Qis3cG0veGwxWGxRQkJtcUJDUTRnb3Fq?=
 =?utf-8?Q?rN9Z0zL3uwzQ1czehF6tF4mV9CvYdiOjEc9r/1VsHICU?=
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3049755a-31e6-44b3-9cd4-08dd8bb74d8c
X-MS-Exchange-CrossTenant-AuthSource: VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 09:29:15.5172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b8ilwL11P+qzZ6GwpCbDPFPsqTHUiuYZQg8QKNLl3woB/V9SwlDr3anjJSBykT6L0h5XZIweoRPXnszLt0vXlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2P195MB2494


On 5/3/25 00:03, Judith Mendez wrote:
> From: Hari Nagalla <hnagalla@ti.com>
>
> AM62 SoC devices have a single core R5F processor in wakeup domain.
> The R5F processor in wakeup domain is used as a device manager
> for the SoC.
>
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
> Signed-off-by: Judith Mendez <jm@ti.com>
> Acked-by: Andrew Davis <afd@ti.com>
Tested-by: Daniel Schultz <d.schultz@phytec.de>
> ---
>   arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi | 25 ++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
> index 9b8a1f85aa15..6549b7efa656 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62-wakeup.dtsi
> @@ -106,6 +106,31 @@ wkup_rti0: watchdog@2b000000 {
>   		status = "reserved";
>   	};
>   
> +	wkup_r5fss0: r5fss@78000000 {
> +		compatible = "ti,am62-r5fss";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x78000000 0x00 0x78000000 0x8000>,
> +			 <0x78100000 0x00 0x78100000 0x8000>;
> +		power-domains = <&k3_pds 119 TI_SCI_PD_EXCLUSIVE>;
> +		status = "disabled";
> +
> +		wkup_r5fss0_core0: r5f@78000000 {
> +			compatible = "ti,am62-r5f";
> +			reg = <0x78000000 0x00008000>,
> +			      <0x78100000 0x00008000>;
> +			reg-names = "atcm", "btcm";
> +			resets = <&k3_reset 121 1>;
> +			firmware-name = "am62-wkup-r5f0_0-fw";
> +			ti,atcm-enable = <1>;
> +			ti,btcm-enable = <1>;
> +			ti,loczrama = <1>;
> +			ti,sci = <&dmsc>;
> +			ti,sci-dev-id = <121>;
> +			ti,sci-proc-ids = <0x01 0xff>;
> +		};
> +	};
> +
>   	wkup_vtm0: temperature-sensor@b00000 {
>   		compatible = "ti,j7200-vtm";
>   		reg = <0x00 0xb00000 0x00 0x400>,
