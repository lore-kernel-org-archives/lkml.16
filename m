Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020126.outbound.protection.outlook.com [52.101.69.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6C414C5B0;
	Wed,  4 Jun 2025 09:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749028269; cv=fail; b=kg0zCpCy7VZNzxA9CPq7qRVg79M2jUAylODd9HmfLQLJgntNQSJ9ixn6gk3thtdpf7CoQXLRrj8fq87I466Ybx1AVTPJRP1baByrDYprtHQUaGfou4MIPsCFLIrM4jiK6pnMSM9nMTDGdKmT1WT80MBlsiii9p6Tp2zwu6xjUWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749028269; c=relaxed/simple;
	bh=2yuUcv043zh5aPwHbWW8PDxSBqfOdzBCvYhR0xpU08Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=X0iWstLqFO7CZ/+A232czyXJ3JfwYjGvLZGBCdqfnPKTWrF//QW0+VicMxrmsYvp8uh+Gq5GNouq/jUDlKtxdJgz/JSqEHFSL8BReFKUhEqV3ngOumwTeyMxjSxjKuAr/zpPtCFTj4j+vlS+1YktzVPGjZY1vbZtZhcAdRW2/wU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prodrive-technologies.com; spf=pass smtp.mailfrom=prodrive-technologies.com; dkim=pass (1024-bit key) header.d=prodrive-technologies.com header.i=@prodrive-technologies.com header.b=UURW2Rt8; arc=fail smtp.client-ip=52.101.69.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=prodrive-technologies.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prodrive-technologies.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=prodrive-technologies.com header.i=@prodrive-technologies.com header.b="UURW2Rt8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xGrlM7UndNli7sxgewy3XyfXXqIE8BDnY7jKFur5iXxsORb8BtXj0XiTcpVz5BWDz5pGHS3AZaHVZIZ58d+bexeECGfmcZTlTUqcBvoxo3fJwdtBdvAUV8vTKNsl/GdVg7Wnd/RSCg5i9pkfff4lkzEWUuxteD0nlEahWQfef/HZBKr429vkHZe7/vHa+hHfVmcH8wmiUnD5Oz3oC+iHm/fsvJHOZwB2XMMwX+m6A2P7cLjS/3OcCLCcLa8I2xy1WOOjKbr6/GvJpLydQWuGchKSbaqmrl/zk2R++LP6WH/3FPWlFPWe8LXXTjHsZTDYwC67boO1Si5nOJQRHNX+VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SMA6an4pApqcdKIpmq/GV3XFf3TP90ORHBCQp7q5V6w=;
 b=FhmiWJ8IkURF7iGNmkMVRBJjJN/OB46IWYSUrUgthpeJkZUdwfxauvk0waf7CXGDbIO9/PgPfGTyHDFzDWqbGhACiz5ZBQMi9t1+cKuN1T9YHV22PvWC/1ZRuzMGZYdJU6Cat9wabsBDerHIaHyK1T8hbMm2VWIxdx00Pkbft5s7esbiB5mw6Ghy9hmxgh/qxdvGYfR2DMsKCcrnsad2fZtQgCcQ/GliVJhkmJ908dUwYCrMKa8qqc7xyH0LATKJjXj3AsBPonmW+E45sCl3YNY1rvaEQWQ4QS1UYaOk4HJGzhraLem85de01eVqN0rAFupeQKX/J9Xl4qJYh4dC1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prodrive-technologies.com; dmarc=pass action=none
 header.from=prodrive-technologies.com; dkim=pass
 header.d=prodrive-technologies.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=prodrive-technologies.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMA6an4pApqcdKIpmq/GV3XFf3TP90ORHBCQp7q5V6w=;
 b=UURW2Rt889HipYW/YTpmDkaX5OUKIX4svXQX2iyXgvWr7mlbl6pnjhZUn2K2Pe2uOdlGmUDNgC7UQ2nvUiCn/O68ge/eLRSZOrrbRoQATST/JogPAINo4OokfnDnSOmYgS374VT427BMC73RPGMPEznCoeLZ4pJ5PawU4QJOUIA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prodrive-technologies.com;
Received: from AS8PR02MB9532.eurprd02.prod.outlook.com (2603:10a6:20b:5a8::17)
 by GV2PR02MB8848.eurprd02.prod.outlook.com (2603:10a6:150:b7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.17; Wed, 4 Jun
 2025 09:10:58 +0000
Received: from AS8PR02MB9532.eurprd02.prod.outlook.com
 ([fe80::4636:d263:14f1:bced]) by AS8PR02MB9532.eurprd02.prod.outlook.com
 ([fe80::4636:d263:14f1:bced%4]) with mapi id 15.20.8792.026; Wed, 4 Jun 2025
 09:10:58 +0000
Message-ID: <4d3f3552-de42-430a-afaf-b852784817ee@prodrive-technologies.com>
Date: Wed, 4 Jun 2025 11:10:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: regulator: add pca9450: Add
 regulator-allowed-modes
To: Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Robin Gong <yibin.gong@nxp.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250525071823.819342-1-martijn.de.gouw@prodrive-technologies.com>
 <aced65a2-937e-494d-a3bd-aa9b295f73b7@prodrive-technologies.com>
 <5ea091c6-7e78-4945-81b4-9b5c427d2e4d@kernel.org>
 <194f6c85-ad28-4217-b014-54bc64c6a9ca@prodrive-technologies.com>
 <ab813159-14e1-434f-8055-80486f5d6b3f@kernel.org>
Content-Language: en-US
From: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
In-Reply-To: <ab813159-14e1-434f-8055-80486f5d6b3f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P251CA0030.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d3::18) To AS8PR02MB9532.eurprd02.prod.outlook.com
 (2603:10a6:20b:5a8::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR02MB9532:EE_|GV2PR02MB8848:EE_
X-MS-Office365-Filtering-Correlation-Id: de13f035-8e7e-4eb2-a09d-08dda347b807
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZjQ4VTJ2aTAwVlp1K3FmV3pndGJFZVdFbkJndjI2Q3d2QWxkSFViV0RRWjBP?=
 =?utf-8?B?cmp0NmdEVERJSW50L1V4WWRMTUJkN0dSa08zVzVDRjBqME9aQVNyYy95c2FE?=
 =?utf-8?B?OVF5cHFTU1psdldVRUpYbU91ZXJ5M3ovR2hrZDB2cHJHS3orU2c0aUduejJp?=
 =?utf-8?B?ZEtIWjhUbzR1M0VCUTFERWdZSElldVZ6c1hNSCtTRXp4ZlpsbTJyTDQrYjZt?=
 =?utf-8?B?RmFmMmUyRzBrVjJXNXJPOXYzcHJsa0s2bUVYR0ZaTG1lMWhIUmJFbnc0d2JE?=
 =?utf-8?B?QURjQWpTVkVEbjhzUjRrUEpYL2NLbERudU9tUjhvNlNHSDhsRmV6bG43SS8x?=
 =?utf-8?B?NkM1bnFaaHE4b3Nkam5uSGlnMkVmbjVkdDZiS3pld2ZJQnZycklDUHNGdEZn?=
 =?utf-8?B?eUEyNVQyQ05WZW5qeXpQL2RXVWNmdUFQMVhzaTF2TUM1OUpDOWZxNUFBdnYr?=
 =?utf-8?B?SWo5QUlxZzZxWkFFUC9pUFZCT2dXV3JZQ2hPZjVSeVhvVnlKUytTUVlHK3gv?=
 =?utf-8?B?U0hUM0plTlk2eTVlZi9WQkM1czcvR2JzWmI1UVB6WUZ4ZzhjVnhlVEw1R1l5?=
 =?utf-8?B?Vi9CSnVBcWtNdlJsUmFsMDd5cEhGU2ZoWkwzKytTRi9HamJGMTc1dEhHamJC?=
 =?utf-8?B?T0VheWYwM2Z1LzRqSUxrcjZTbEhRU2FHQmdaSTd4bnpLd0wvM2FMOHNYMTcz?=
 =?utf-8?B?ODdJbFpBL2Z2WHQ2TUt4cnR1NlFpZGNiSTMvZ0tBOUxmazRLTGpCb2t0a3dK?=
 =?utf-8?B?aTFJaGcrSTF0MUJqTE5PWmdNTG5KSUtyM2VWcmFYUFlvb3lQYWVZdDFaREhz?=
 =?utf-8?B?ZmFBc1czRDQ5WVBSY0Z0enZCS21tdVV0Z3pIWGxWY3pRV1Jjak0vL2tFdUJP?=
 =?utf-8?B?SkpNKytFekdZU2RDZmdtVE1adzR1dHBUWGkvaWtpYjlYWTZCOVlSZDlRN1VB?=
 =?utf-8?B?QktTTTN6Ujh0d2ZhYW1KYU1YeFNKZkVBSGM0bXZsc1dMWVBaazZLN0VFcmZt?=
 =?utf-8?B?Skg1SE91aGlZUm1BOXFoSnA5WjkrWEVIQ1JkditOcWZJSmU4alNyRkllK1Rx?=
 =?utf-8?B?WnVQUmxiaFhVTkFqY014QjhVTVJmdVgraDJ5TVowM1pRNnUvVmZVMUozTGVh?=
 =?utf-8?B?SHV3Y3dGRXQ0TzBXSGxsbGUyM0YxZlBvTXZXd0V4VGZHcTd3OFhZeWF5ZXpG?=
 =?utf-8?B?ZzhqRGdmYVVqOWduUU12K201bDQ2aERLMGZmaTZ4Rkt2STdRV1ZIMnlmSXJE?=
 =?utf-8?B?MVp6QWhUUW5pWGtKZ3d0N29PcjJ5eVVDSmdPeDBDNE4wcVlQaG1uMU9OVlNC?=
 =?utf-8?B?WFZGL1Z6N09aT0piSFNDNEtUckJCQTJycU5LNm1ZdnEyeXBmZm9CbTg0NGVS?=
 =?utf-8?B?VFhhOHNtVHpYYVB2UEdYS0NaWmRzKytiVnZPZ1NCcThSSnFvcVgyaGxKdnZD?=
 =?utf-8?B?eFBXQWpEVy9Mcmk1TGVqT2VyckxYdHBHY1FTczh3MytUSVpsYXpVTVAwbi9N?=
 =?utf-8?B?MUpEVzFkRlVWR2R0a2xhbXBaN2V5VVQvRGtxenBCZ3d5SFZnWW1lSXJhNjJh?=
 =?utf-8?B?U3NXdnB1TERaRTNwOVZWVzArRm0rMTMrYXpNc3dCNWE3V0tqY00rL3YvbVU5?=
 =?utf-8?B?S09xbncyTFk5VUVJZnlIREF0VlNGTW91N0I4MXZpejhmamJBcTJKcG5BWmwz?=
 =?utf-8?B?S1ZreVhySm1RYmJJR3ZRV1RXZmVNckt4bnRZdUpVL012dnFPYnNqL0FHNXpK?=
 =?utf-8?B?TVA3cnJ6RXlTSVdLdEJoT3FXNERISy9pRVRPUkxlZExmQUJ3Z3hVbklSbmJN?=
 =?utf-8?B?bGNFN2NEVU1iVWZlQlpJdnN2TnRndEtENCtSRzZTajFTemVTMzZwQWIvRXBH?=
 =?utf-8?B?L3JJRXdyUXBNN1Q2NEFMNGl2QlRYaCsreTVzcG43RURuNSt4MU54ajNENnVq?=
 =?utf-8?Q?0ONOQmlo9oY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB9532.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWNBMVlMaTlScW5oR3RqR0JybkJ0YURwc0RiWCtyclQ2Q0orclFFM1huT3R5?=
 =?utf-8?B?cmw3TG5MSVFaZGsrRnpjbERVN1AzbUxDOHVlc0N6b0tYN0xpNFVQRkdvU0Ir?=
 =?utf-8?B?aFAyOFp1cUFsSTk2OTZkcFhROTYwTTUydUlRaTdRSUlBYWNScWkvTkI4QkVo?=
 =?utf-8?B?Rlk0eXlzSThaMTNpeHNhZm55a2JUc3lzUXdqWGhoWlBNQjNBcEs2S1NGZkd4?=
 =?utf-8?B?cm1tMjBjNkdFNGhDaUtKVkRwUUx0QjZiTVZNSFJUb3ltaFFHMHR4dzJmb1kr?=
 =?utf-8?B?c2c1L0NRR2NNK0E0VU5tNlRhb0crL1IwNm4xNmtyM0VzcHpsdVZEUmhyOWUr?=
 =?utf-8?B?S0szVXVndTRDV0JBQUNLNWNvbmhUdkxKc0paWnVVTGtYMkcrTTdtNzMzR2Yr?=
 =?utf-8?B?c1ZKdHpPSkFTV3lPS2kxNFE5Q2tVWXR6V0s1Zm5CQ0FDekRRSWZpVEZXZitv?=
 =?utf-8?B?ZWxabHh1NVV6MXBQaUgyTnN4NDh5Qll0YTZNbThqcW1SUmNqajFnRGJ1NVZ4?=
 =?utf-8?B?bEl4cWxPTFI4SUh3N21Dd2F2RitoN2NYaFB3MEFGSENnMkdXNlFsbjZyWUZV?=
 =?utf-8?B?Z0M4alI4WktPSit4ZFpOaXF2Q1NxN1dpWkgxZGtxWTNQVDFENlB3dStJN1lW?=
 =?utf-8?B?Tk95cW5JTzFJN21QQTk5S21zbkxnMWtDUjFTK2V2M2R1NW53alozeE8zcHVF?=
 =?utf-8?B?VWVxSCt2SU13cFZsT0hZRGNTSTh0TjNTdDFjV3p1cXhrZmFadFFNNk1HWDc4?=
 =?utf-8?B?a0F5L0Rwcy9BSlVLcytaVTEzQUgxNVZzenJlWVE4SmY2RGN3bUhhRXVQRUNM?=
 =?utf-8?B?UEl6d1dmbkhDeUZMNUphS2VCQWJkZHdjQzZTUHpieVVHT0lTb00vTTNOMkwy?=
 =?utf-8?B?dVNYMmRiV0VCUjFtMzU5bFJtOXYvQVk2dTdlVFN6RzFGeDJQZU5hYU9UaC9x?=
 =?utf-8?B?Q1o1dWFhU05LekpldXRRSS81M1lYeUNkbHNoREhEalJ1ZDZKQStuSmtSWjJy?=
 =?utf-8?B?WFlabTNmWWdtakpnWWN1TmpHZVJtbHdSV201Sms1TkZ4MlJXU245NXlINkNQ?=
 =?utf-8?B?MHAzbXJDakRHVkIzMElXNEVRaXFrVHVYb2RzNjArR21LUTFnck1mMkFTbGR0?=
 =?utf-8?B?cTVJcmFsT3JTQWlzeEZVVStUQVFWd3JnZE1qejRCOEJEanJWUmFKdXhHamhx?=
 =?utf-8?B?d21HbnBGQmJDR0UyK3VVeG5MTUxBU3FvV1JjZVFEVjV6NnhLSWZaRUY3NUda?=
 =?utf-8?B?N1A2MGZ4TC84TTBGeFlMeHVtUDBIY1h3Y0hqWjNXWGl4WmloWjN2aGc5a3J1?=
 =?utf-8?B?MElVM1pHV21acFpyejZNeUEyNUUrNEV0akxyRlh0WitIdlJ3NWF2R21Xa1dK?=
 =?utf-8?B?b1FzV3lnYThzOUhYdnRoZ2l5cVdsNk9ubTU2RjVSVGlwVTZFdXZ0elppNHhX?=
 =?utf-8?B?TFRhdklBZ0txZzdhcEZtZE0vdWpyTHdPREN2UUxsbDBIZDVPeFk3UUs5THM5?=
 =?utf-8?B?akcxamxmMjU2TTBTQXFmZFZzS2c1N0IwM0hjT3JrWUt4YTZKUElEaU9DNmFV?=
 =?utf-8?B?b0R0UlFMMk1SeWQ1RWd6YjBjd04xYlJhdG10UEI5Qkh4NnNXVGQ0ZHFJd24v?=
 =?utf-8?B?MjBYeU9jZS84VkFVS1hJYnVlUFcyWmlGcVVXZnlYTGdtY2RjWDF5ZzN5Zk5X?=
 =?utf-8?B?ODhXUzlONFlzc2M4aktFUHlacEc1MnFBSndaaGdJM2R4dDBZaG5aS0tLczAy?=
 =?utf-8?B?R0tCNWViQjlySnZDUHNQK3JxMEhQVk5TK3JMWU5WVGhqSHoxN2JFVG83dkQ4?=
 =?utf-8?B?R1RMcUM1bWpWcVRrVW85VmpZUXBSZTI5Z3JPOEx5QWNDVnRUYlpRSXFPcmJi?=
 =?utf-8?B?L0Ntby9Nd0pVS2tSdW1Pcy9MWnJyR1NOTTFpVXNIQWI1VWx6bGxDMWFrazdw?=
 =?utf-8?B?bXBwaWY1SHZOcTB5cXRkT2ZtYklLaVdmQjU2SnN6STFFenFhcW56K2pZR1o2?=
 =?utf-8?B?emMvTTBUbFlJSUh1V1hMTnNzSTU5QWdTdW50bWRGV2FaeTdMckZnaG50a25r?=
 =?utf-8?B?RFB4OGd4QThBUXlyS1RaaGV0NGc2T2R1aSs5ZTk4UmlkNTJjZ0FObjlPTTlz?=
 =?utf-8?B?dHpkYnRXK1JlL3YvTXFCKzc5empiRXk1NFo1bjJKOFdwQldkT0cvbUMvdjJk?=
 =?utf-8?Q?DSXvM763vDO3G7OjgpnyvfYAUnmsR/OFbmhsmx7B/Sjt?=
X-OriginatorOrg: prodrive-technologies.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de13f035-8e7e-4eb2-a09d-08dda347b807
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB9532.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 09:10:58.3711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 612607c9-5af7-4e7f-8976-faf1ae77be60
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aLqRd1FzPFj5qt0mLUUEMaEbsoSCIiAtFYFvnYqf4oVH5KPVStti4tH5WZdw0IMmf5yA9DRdiFPJc5K1bNEQaV6SZv+zlImg0cFkljNBX+WrIFdleuY0qpbnscewpBo3BjKy0q7GsU2aLf9mPnBujA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB8848



On 6/4/2025 11:07 AM, Krzysztof Kozlowski wrote:
> On 04/06/2025 10:58, Martijn de Gouw wrote:
>>
>>
>> On 6/4/2025 10:27 AM, Krzysztof Kozlowski wrote:
>>> On 04/06/2025 09:04, Martijn de Gouw wrote:
>>>> Hi,
>>>>
>>>> On 5/25/2025 9:18 AM, Martijn de Gouw wrote:
>>>>> Make the PWM mode on the buck controllers configurable from devicetree.
>>>>> Some boards require forced PWM mode to keep the supply ripple within
>>>>> acceptable limits under light load conditions.
>>>>>
>>>>> Signed-off-by: Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
>>>>> ---
>>>>> Changes in v3:
>>>>>   - Fix typo in the examples
>>>>> Changes in v2:
>>>>>   - Add the header to the binding patch
>>>>>   - Improve commit message
>>>>>
>>>>>  .../regulator/nxp,pca9450-regulator.yaml       | 14 ++++++++++++++
>>>>>  .../regulator/nxp,pca9450-regulator.h          | 18 ++++++++++++++++++
>>>>>  2 files changed, 32 insertions(+)
>>>>
>>>> Does this patch need additional changes?
>>>
>>> What is wrong with the email you already received? What do you exactly
>>> need from us?
>>
>> V2 was merged rather quickly, on V3 there was only the Acked-by: Conor Dooley. So it's safe to assume V3 is now waiting to be merged?
> 
> So this was ping for merging of entire patchset, not that patch? There
> is little point in pinging frequent and during the merge window -
> usually nothing can happen now.

Clear, thanks!

Regards, Martijn
