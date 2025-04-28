Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazon11021136.outbound.protection.outlook.com [52.101.129.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A6212B73;
	Mon, 28 Apr 2025 02:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.129.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745807818; cv=fail; b=rnjkJDBEaj+fxFIY2WUZW6D6ZjIpr5i+dcGp6eP0DNJwMZj8KshvqgosYn51RkWRJ/aTPu4ttus8o+RpkOUJiYO/uSe7GHWdSZvBu9kEASLRW4efyNNHFxWfcly8XsGo/nSKnljZBoyyycqy8MjFBzr1mIVItbIoO4PnqnyjIAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745807818; c=relaxed/simple;
	bh=/uHPjAmXkeKn69neAwF0giTX1nkFszygVZJT4Kxndec=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=atewoRl71HrCqxyU6pAPisFJEIHc8gVfdHtn0g43QPEQJWmBWKyzF1Uvzpy/Huf4qpuR7mf8BQqfMo9wmAepdk/n+0MMh/iWcPzxzFg7oFdcwwGWA4d6R2I1XK3HInjpYg/GaLqOU4mdOdCh52QMHNJ2TqNPw+o/BidQ0+yCC0I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=S9u891I3; arc=fail smtp.client-ip=52.101.129.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="S9u891I3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GPG8MXjFmxPaXn0MkAk0TCknYVrEID4QppnIQBpCL3cEU79NtNlbeR3Klm8Iw4mxi2Vpye5BB+5LE0qsIW8JmVv84T6G1vDcs26zIWGuJuJnoeMwQleoFzxBBslfufsp/qWqYl/HH9l4eaa91QPN+u/L7/fTYfpTcrUFnOuDBgI8behwbZcINnVsHsoeSKloK39PBHc4PW9owMAehaueIpY+izLbAMu790pl4DUw9rCfcqbwsbXvNCcQVUWDtlRn0+68a2DnlkCAiW7h9Ea9driVMkfJeUL+d+/ZgXTUwZB8ZH2QcYpxAhLHJexxBmvLAyJdGCnAK4kx2Nmbb1aNaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pS7SP7a/v+I4qIr+5TKYWH+PTT6+NU4Zk65Ns7RO1gU=;
 b=O8KsTbsiGKYHRO1bDRRA2GClMgDhizk/vZUMxFTbXcuTS2C/QER4CvbhbRTYwUKkI1N26KuVdDyNxId0Pc30o9M9fpELImDX23V4twGQ8q+ax2868i0/XUeLTqrU69rdtilZgx1aaQGKh1kcI/KAOOStEey2+OF/hVS9JXIzkohqjVySNx6HkgPTo7LzeylXYGYVnD0rE1K856QcS8PNyQi5bfV0zizanriYLFyFwUms444qOGkPq8syLjvG5BRVOZKYNot055CZlcUaSTOsfXouLjp+g7AGJ/W/7xizrUJp/rrcyFLJrFvoS6kAiUq9IwAB9KMHPxbEYIYvO/up3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pS7SP7a/v+I4qIr+5TKYWH+PTT6+NU4Zk65Ns7RO1gU=;
 b=S9u891I3BDnabJPCN1eBfko94TwyTeuUk2sRRyeZ79jO39/h83x9NQTNtPNpnRucnrRuwyJoJmibDwm7Ur2IyvEq0eZK3eBsT2WcBvMKMTNl8vmuX2iWDTUDocKIQvmj1vEX992+J5NNEIuaOlKQ1zqeBZ+FN8tfqjEWRvoD9DUSDYmx2DU+PGg7F4GqLquJg8xEYahB5j+WMcKBJJPIcdnfw0hkiiVLR/m3K84PHzECCnEHunJLhZ6jmKdstz4JVePY3bXYIjB/JAxTNVyvqd+pAyacd0ya18WQG+RuNUM6lSj+t+bhTSDDx60DIviLiniJANC616rImCC3ZwqZDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by TY2PPF352F9938C.apcprd03.prod.outlook.com (2603:1096:408::9ca) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Mon, 28 Apr
 2025 02:36:50 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%4]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 02:36:50 +0000
Message-ID: <ef96c3a2-f1ab-4615-8f7f-43050718e2df@amlogic.com>
Date: Mon, 28 Apr 2025 10:36:45 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: amlogic: gxl: set i2c bias to pull-up
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Da Xue <da@libre.computer>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250425203118.1444481-1-da@libre.computer>
 <CAFBinCCUQizs=XWq7knm-4=3=hzPDNee9RZj9LDD2Mi6DHYBrQ@mail.gmail.com>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <CAFBinCCUQizs=XWq7knm-4=3=hzPDNee9RZj9LDD2Mi6DHYBrQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR06CA0010.apcprd06.prod.outlook.com
 (2603:1096:4:186::6) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|TY2PPF352F9938C:EE_
X-MS-Office365-Filtering-Correlation-Id: dbd0c552-10d8-4ed5-18ad-08dd85fd8750
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y1QwdE02cjNGTDNVUVI0NUg0WENxdUt4KzY2dy8rWW1jS2VDaVp6K2VDZGk0?=
 =?utf-8?B?T08vYUhRRXBGc0UyUkJVTTNyRHRqVzdkc0Q5U2phVTVzK2V5d2U2VkVDLzhZ?=
 =?utf-8?B?RUs3RUFZb1JBdTEwTlBlejJnaFJNU20zQmkyQUZpQVl3MExWNWRpdWxSTjVY?=
 =?utf-8?B?SC9TUEROamhUclJvK2ZWWlRpSm82MGtHWUdOYVBlS0pFSlhQYlJ1blpJNURW?=
 =?utf-8?B?azI0bTU0cmdCUS9qTExua1N1NUNoaUhnVmM5Zm1UaWw3RkJuMEhzeDNMUFJx?=
 =?utf-8?B?U0lZN1o5SkZadDd5aEd4WDNITUFJU1RRNEFremJ4RjN2Y2ZNQmJWMEJHRDR2?=
 =?utf-8?B?dWtyMXRlbFJLUnAxWHdtZ2ZzSDVXUzNUMVljM21aUCtmRHFvRTRGMWd3NzRQ?=
 =?utf-8?B?S3podzByeEZFQmNsRUZSSEg5QXNHU0dHU3BjbkpCVS9OWmRlSlNGYmdlcnVj?=
 =?utf-8?B?bjJrd0NnaEZBanN2bGZGR0NCaHpXdFd2UWpWOGdiaG1qM1BBUm5IQTY3Q01W?=
 =?utf-8?B?ckNFYndZc1k2QjNOZklxNVNxSzBOeS9RUHM5bk16elBBS3VZVWIvdzRWOVlB?=
 =?utf-8?B?Z3I4VW9ldmRoTHM2ZjI1NTJpTnlHd0dGaE9oYUZObXFsTUJFM2d4d09jZTZV?=
 =?utf-8?B?NjBpMDZ4ZkljMkltS1h0aDVlSXNiTE85YlYySjhOMkJMRGQyQVhCSUZ5aENn?=
 =?utf-8?B?L0NtNTRmcUlrTVVGMFBqZXU5RjlFT3hYSSsxYjZFM2tRZ29HSkQ3aHgvd1VX?=
 =?utf-8?B?ellQbHVTNFBKbzR3SmhNbVFGM2NBaGpyYTFxU29QY2NwWEpKajBTL2Y3USty?=
 =?utf-8?B?ZDNDWW0vTlFPSnZndEtibit4a25HVGlZdGdaTzh3THkwUkxDV0E3Nm5uak1k?=
 =?utf-8?B?MHZ5a2Z1YmU0UVdyVlJzT2ljajVPbWU2bER5MFJOSmNRVzNWYnl5RG5Jbk8v?=
 =?utf-8?B?Rm9TdEl5cWpsSTNkNjVVQktodGFUd2g1emc0MHVSclBvOFJQY0ExVmxTNHZ0?=
 =?utf-8?B?Y3lqaFFOYnc1YUZGSDloa1RwM2R2Ti9lQ2JYY3ZqcDRYTGVLRW5ibHVVQzdn?=
 =?utf-8?B?L1dYL0dBenV6dldaellqRXNxd01nUG85d20wQWZDcWRBc2hqN0ZMTXljYjUx?=
 =?utf-8?B?TEZmVWJEV3d1UHpseDl5eGRZd3BEZ3VIb2RQcFY3N3ZobmhxQ2xQVTF2ZzZk?=
 =?utf-8?B?T2dGYTdYc1JpalN5bkUvVnd6MnJ0MEJaSUtOakZSbStVd2RtOW5BbGxKM3dD?=
 =?utf-8?B?WUhackhrMFdpaElPWDNlbEJvMDJyOWd0Nk1talhuOHdIRklWdFFFZW5mVlcz?=
 =?utf-8?B?SjFQblhlbDg5MllOQkRFb2JvelZnUkVWajVTd25LMjVLVUQydjZnNm81MzVC?=
 =?utf-8?B?dzhZWXJsS0c5SGFDMGtRRzZybzhCMm81MnY4VUNoTXNSNEFyRFlCMnFhekV5?=
 =?utf-8?B?cldMU0NOYnU2Z3JOSXFPMEQ2SzRHWUdaSG1BTC9rSWcvRmtIZEVTbmZqa1F2?=
 =?utf-8?B?YmVjcUh2T2lIL2o1V081SWNTRkVBdCtHSDJXRThKS2xrcjlEbkZGb0pEM0p4?=
 =?utf-8?B?Q3cxYVVFNEgzKzNDVXFTTm55a3pCVGpTK3d2YVc5WXZXTlZkOG9GZmFZeWlw?=
 =?utf-8?B?V3NtT3VTWVc0bWphMklCRHc3VFd2cWNmQnNTR2RlbkpUeko0Mmd4UXlzNVR1?=
 =?utf-8?B?a3NnVkdzREdTQyt3bUpwRnFtR1E0ZlNYRHFDNmwzUlVpUk1pd0xHTGx3TFdL?=
 =?utf-8?B?S0R1UDllMXhlY3dYaEZ5VGNua05mY1BhbWFmbEtnRDEyaFk2VE5MdjFEVHRl?=
 =?utf-8?B?cDZjb1NIejA3ZXdUN3JNVXl1bFFTSmRIVHNjc2xzbmU5dkhjQzgwc0RQOEt0?=
 =?utf-8?B?MWx5TGRaWVBLSUp4M2p6TmtmWVo3VTVDVGp2eTR2a3NCTXVnekhaM2ltR1g1?=
 =?utf-8?Q?795svJB3Y7A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUVnWXFPcHJWbmRUekdPODZidzNlVkJWd2tMcjJ6cG5EZEJuNklXS04vT1Ey?=
 =?utf-8?B?b1hNMGhFZno3bkllU1dIeElmQ2dKZE9mM2N5dW5hWFBhK1hXSlA4TTFWV3FW?=
 =?utf-8?B?UEsvblA3ZDlERm9rQ1RINkdkYlloNlBpTnM4eWdHU0M5bXpDQTZxR3diekhp?=
 =?utf-8?B?N2tXMmJTRHZIV21nMmh4VnljUXkwa3FIT0xYMUxNY0tZVi9IWGN3dG1CYTlq?=
 =?utf-8?B?Z0xMK3hiQ3M5bUxlNk1FNHBoMFE1YWkvMXVNVnVSbHRPNGdESW8rTktobmdC?=
 =?utf-8?B?NjFjTEQyL2RkTFFoU0phZ0IwNFNJZXJCRmRyUUFqVmVUSXF2NFppMDFuLzRY?=
 =?utf-8?B?MXUvVGtkVjdvc3RMUDhFZmdsS0tUS0hmblo4WHBINXp5Z2NCTXhNOEdVam05?=
 =?utf-8?B?MHZlZmE1MmRzQVVSSWRwaHIydG4vdVZxY3JveW9PazdaVWVDK0F2Ynk1emRR?=
 =?utf-8?B?RnNXc3B0SE9Lejc1djd4OUhJbG1WUTBaR1FmKzN4dFh1aTNxNC9EU3piQi9r?=
 =?utf-8?B?QVc2eXFqMHlBOWM5ZUdOYkNGOHRBWHhWSU52VmxleWlhV0dJZ01hU3ZwcWNs?=
 =?utf-8?B?Sjg4OXMrTmYxMTZsZDJKM2VlWmxHN2MvTTZoMTZHeldHbWlJMFJkOVhkZUs4?=
 =?utf-8?B?UmhkMGZGZU1CSml1N0dLakVDSFRjYTRUUGI2V2JtUFpELzErb0VTVG1FSkhW?=
 =?utf-8?B?eUl5aGNFSWdnTHlIVGZVNkdnclRNQ0hyZ0kxbTZxNFRadURWM0R1b2ZlS1Ry?=
 =?utf-8?B?Mi91ZW12MnpQaWc3WlhsZHlvalUzaHd1cEhnVFZ6ZmVnRHJWRXR0VHNGWDJ5?=
 =?utf-8?B?SjRVTXBzODNzZDR6UWdzaHJNbFJrR0M5aGRpb0paZWpWZ3EyVkQzNnlMdGhv?=
 =?utf-8?B?YlVSbWJ0cVI3OXZHdG5ZbTV1VVRSNy82WXNPRU9xVm9KM2trL0xwMlN4NFkw?=
 =?utf-8?B?UjZya044cXU0QlBhN3JIc2tqSzdmM0ozaGVzbDNxa0tUdENmVHNDaE1nVWYz?=
 =?utf-8?B?ZEF6aHhRT0NsYnV3RmphKzA0QzlFUHNwN20rOXlWVi9udjk5UmR0Rm95RVRv?=
 =?utf-8?B?d1FlK1ZVSVZBWWFrTWRlVm1BVituTHhuYXlRK05nelpyaEV6K2xSVndEUGd5?=
 =?utf-8?B?c2ErV2Qzd2RBRCswZnhLSDFtN2pKT2ZQVzBmWStFOFBpbEtsanVBSkhVMWRt?=
 =?utf-8?B?a083djBidzh3NGZxdlBwczA2Skwybnl6TVE5TU5TaG9jVXE3ODlVaVNrY2xM?=
 =?utf-8?B?U3NaVHZ2TVpNbEJwREd6ZFMrbkVSa291V09aVHd0bFhrM29hbHFTNjM5ZDls?=
 =?utf-8?B?ZnIzTmFwK3VBU21XeWlFQjJoLzM3eXUwekc4RE5uYVpPUE1Ua1RzYVlieVhk?=
 =?utf-8?B?czc5U21FaVo2WW94WGtTYUVZM3h2WmViMzVrUlNFZnJDMElzdG1vazJkOEdU?=
 =?utf-8?B?djRORnFzT1pXckdtZDZuQlo1cVNXYklHWFBqNmk3bEtvaFNQZE1qMlZHck54?=
 =?utf-8?B?NHlWdUV2Tlp5c2p1MzJ3MmliUUR0VUd1b3E4QXBFRXRSeHNxUitTeld6YU9v?=
 =?utf-8?B?dHF0WTU5WEloL0xsT3FVZUpnbTBrQTUxTjhqSjhlKzNxdWcxUGZyb2pUcnlC?=
 =?utf-8?B?eVRiNG1zemNOKzVsR0ZPRndhSHplVmw3TUpTdzVvQkJUeW5xWEx0aG5RQ3Q3?=
 =?utf-8?B?Z09YVFhLQ0oxVXp2UU8wMGswdVZ4NFJzYlpQSkdDWVN4V3hBM1IvV1lTRHFZ?=
 =?utf-8?B?b2hGeC82QjVvUE9MTmV1UFBpRnluaFV3aTR1TUM5ZVA3L2hSNXJQMGNVUGh5?=
 =?utf-8?B?eFFmdUhxWEhEWlloaXllbitacFVhRzhjQUhtdEdMb3NMWDhoQnZxTk1vZ1lM?=
 =?utf-8?B?NEhLWGhYMjhDdW82N2dZR3NuMGhRSGdUYTEyMGZadEN1ZElzUW5aa1Y5YmVS?=
 =?utf-8?B?MTQxWnN4aFYwOFJQM0Ywb2hWcmpCZHllMjNVS0I1aDdYQUJvOGZKSlYwb1BE?=
 =?utf-8?B?b0ZGY1NxV0I5d3Z3dmowQ2NVaFoxdy9DT3RUd1JDRHhOOUN6WVhYVEF0Z01W?=
 =?utf-8?B?YkhsTkFibS9FWFlhMWp4NzVFTmRNT01Bcm1OQkJWOXFaekFmb3R6cGFuV2Fz?=
 =?utf-8?B?Nk8rVkFpN3g4UVZIV2xsOEwwbVArV1ZFWTFvQlZobkVQWHpuNnRHYzhjUVdY?=
 =?utf-8?B?UWc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbd0c552-10d8-4ed5-18ad-08dd85fd8750
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 02:36:50.2574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v3qIZMYZZV6WX9g3TTag+SFcfWYFmgFF6jxtqplbx02RSKYPKfS296bJl8oighitruYjQxb1nXlCVbNGHDdP1c+lhg66XPK/ADGEXkI3FM8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPF352F9938C

Hi Martin,

On 2025/4/28 05:08, Martin Blumenstingl wrote:
> [ EXTERNAL EMAIL ]
> 
> On Fri, Apr 25, 2025 at 10:31 PM Da Xue <da@libre.computer> wrote:
>>
>> GXL I2C pins need internal pull-up enabled to operate if there
>> is no external resistor. The pull-up is 60kohms per the datasheet.
>>
>> We should set the bias when i2c pinmux is enabled.
>>
>> Signed-off-by: Da Xue <da@libre.computer>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> 
> +Xianwei Zhao (who has recently upstreamed Amlogic A4 pinctrl support).
> I suspect we need a similar change for all other (Meson8, Meson8b,
> GXBB, G12A, ...) SoCs as well.
> Can you confirm this? And if not, why does only GXL need this special treatment?
> 

The A4 pinctrl driver mainly differs in the implementation method, and 
the differences between chips are primarily described in the DTS, rather 
than requiring the submission of bindings and code each time a new SoC 
pinctrl driver support is added. In theory, previous chips could also be 
supported by new drivers.

> 
> Best regards,
> Martin
