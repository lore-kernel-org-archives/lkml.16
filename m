Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023079.outbound.protection.outlook.com [52.101.127.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CBF29C346;
	Thu,  3 Jul 2025 07:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751529417; cv=fail; b=AlHMviioCfh92GUBCxAi5d1kix9x9TPwMINjqsz5Bzv4148E48eeCDOUeWOWpRVUFkKodDSwHnE+w/VyS+zGunrqVRRSi2nQqiX7QW9jXi8A+ifuf9+Jkkt5oPt7ffDhpREZCldS0PYlrpZEmGr6KkOpbEEd0XPkr07hNq8ic74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751529417; c=relaxed/simple;
	bh=KSNsgIGvXM+XvDNpjoUvbck2Mhr6GmneaPqHWYSXSx0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=P6du8t3xJSD3PTzfHeJyY+IaXMAsyGZyrK/Ok7UOR1OKk20TyUEyXJqPHbXI0OgXEWbO9LxvfRogEyTD+kBLBB6hZuNduwACMm7zvn1XBCB45t2tN4b8cSPMSy2euLxwmOH001kKnZwhAzRalfDVEXRzKobnz6OPVDY3ztcBTZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=om0Brb+V; arc=fail smtp.client-ip=52.101.127.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="om0Brb+V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ngvDVV95wVc9eAursBDkLAtr2afXCjX5bVkjCK3oAQtjP0oII5sPjG9hfUpi9BHUdFihQ8mXv7a3cnxUIB/lNgonfWHAEJB3daFol6qLzwQ+MKWb15V1+WRddYzSTg/cOaWMMxYz7TbyItVEqS3z05CeFdrUgO3+711sWUmYFC7aPvxFkAM+7nAcEBAeO+kJ2hjvBpKYpbxYPOreHu651GDkzdyRwBKKcouvbhhRvEpoPYzCJISUSEBnvZ1CUBKP8GskCkWBsPIEWosBY4ppx1uJ4gumZ2LTzPdSAprug59rpRsdB76GW9SsDSja6vBCQ3cF+VSZ5y02BiU2rptRGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C3mmffRve6kwAXnTxVTjzGiBPOhx8xhuG31q/OpdwV4=;
 b=YeTMEbPD/n4TBcnXmmRYJUKyLj8JdpFFmNl0ZAae40YT21BKZWS2m212H4OhyU/04dwctzB/6vzyk0do9vovqWSUxuQZeuiyFl3ZWZ2VUq6YsggfuSTOA5/EbpuggtwkdejyENPsQgtz3RhbX892gIMjl+zllbrprubyqnMWpnz0SMxVGXuF6W0s0rX5w17kTZU95QCUhgD6l3UC7kKEqCAE58HwHmRQw+HUUfuSdx+LugOHZyxGrEG7RN/caYVGyc9p9t+8PKX3GRiSPitABgi8IYaC1H862dfdODjtx9YyYW5+66jj/egr34PdirPD3Mkpp8fd5+hXoHaedCw5aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C3mmffRve6kwAXnTxVTjzGiBPOhx8xhuG31q/OpdwV4=;
 b=om0Brb+VTlVERmGMixB6m+dfo7WKlrfzw5lSvL2azh5mDrD24NN94S3FZUQxneThB0uaTXssCiuYvvCVbD3TRsZT6fDD2vuQCl+eLvOSG7Co1xQVqQ9jZHIT2YqqEQZmY3uk07dlTInqi4iJHfyv+LdH9ATOWUqkrrFnCAaNrHgnEtQaNXNXwu+PGkwA0R/BUWPtXobHjnKps6W3TGBf5fDDw1fKkuZMG4bl4g/Z3KuTFYpb9721E14sIZdaYCpmqcC4GfZ7xGeu3vJLvghaD7l2NZbst4DG18UklLoy31tpzKjcvH+HyKeN4u6LNrnVRRFkIzafDv/JlOelqBwGsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by TYUPR03MB7232.apcprd03.prod.outlook.com (2603:1096:400:354::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 07:56:51 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca%6]) with mapi id 15.20.8901.021; Thu, 3 Jul 2025
 07:56:51 +0000
Message-ID: <27ae4f23-7a41-4810-9639-5bcc4cebc8dd@amlogic.com>
Date: Thu, 3 Jul 2025 15:56:25 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 26/26] clk: amlogic: c3-peripherals: use helper for basic
 composite clocks
To: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
 <20250702-meson-clk-cleanup-24-v1-26-e163c9a1fc21@baylibre.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-26-e163c9a1fc21@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0002.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::16) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|TYUPR03MB7232:EE_
X-MS-Office365-Filtering-Correlation-Id: 67b55439-3755-4718-0230-08ddba072b3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d2k5V2xCcHFnZVJUbVd6RmhyaDhURUh3NVVBbC9WRmlyakYrSmZzaDhIQU1y?=
 =?utf-8?B?U1VKWVN5RGVaSU5iNmw2eExkZkdKRFZFQ04yVkVsRmU4YWNMWDNNdzIzVVp2?=
 =?utf-8?B?d0ZKOUV4bHUwNjY5UU4zTGREZ0lmMUJPbmdwQ1UyQlQ4M1dCUzl1RUdncVNF?=
 =?utf-8?B?VzYwTExxZ2J1NmpjTkFIRW0ycXg4ZFIvaWVmczNrc0pHajU2YThwUmFNV3lt?=
 =?utf-8?B?N2FCd0Q4azBaRDV5SlNKb3FMcVlsOFRQcnFHcnJGeEhFU3JLYTM5M1BZaFpJ?=
 =?utf-8?B?blZZTC9FWnV0VlpCZEZFTldwS21XY0lSNnJGUE9pQmlRak5qaXVYSW91ajFi?=
 =?utf-8?B?eFBhSHdsYWJuRHRNNnpzYi9SQkFYT1VZL3BTbTkzblZKOTRjOXZaWG1jemtu?=
 =?utf-8?B?ZEQ5YmZ5T3oxdDZYNmtPT0l5TlRvTGlibTZCNjJldmdZTm03VVZnMjhHcFk0?=
 =?utf-8?B?WHg1TE9MUnNOYmk5Y0JvdHZES290cGJRbWNVdGNlSVBFcGZsZ1RTaHVza3FH?=
 =?utf-8?B?Nk9TK01XdVY0T25MSWU4WXNOS1I5OCtQQ2poZWo2SlhiR21SZTd6MU8vVUh4?=
 =?utf-8?B?KzFFOEpPQU5wSTNlOWlBZ1k2enZEbFJWT1FELy9yWnJTUktVYTJXaFh6bjF2?=
 =?utf-8?B?blJUTUFSbGJMRHpYKzhvaXIvd295YVl3MThTUVZTcHkxaEtWSEhzOTErNDdJ?=
 =?utf-8?B?YURkVUZDWWNPdlRWN2k0Z2JzdlVkanZNUVVFYURjQi9lT3pSU3lCNkJsYUl1?=
 =?utf-8?B?am9Dd3RwN3Vuc1FxTmhham15My9VODQ5Y0gxUElrZWFJK0s4dFBnRHU1dXI3?=
 =?utf-8?B?ekhNekxtVmpKQS9ORkp6elNzSHlXclA0U0dVNVJ6M0xLNmRlNW9jcmEwQnhy?=
 =?utf-8?B?ejM3Rmg5RW4vdEs5ODBIVzdwVXNCKzlOMVora1dnR2E5eFBMZXJ3L05ENXVj?=
 =?utf-8?B?bVUxTE43RytyelR1RGw1akJCMmQzeGtteWpZcC9BenVYL1F5WmR5dXVBTUVO?=
 =?utf-8?B?S3QvTVc5U1NhSmJRUmZ6NEJuKzh5Ti9ZRUMxd0ZYRjIyblRlb0hCczIwdmRu?=
 =?utf-8?B?Tk9acUhUVjQvOXhHeCsrYXI5Uy81QSt6WFo0L3plemZIaXU1NWdGNXZhMWRp?=
 =?utf-8?B?TSs0WTFYYzhZSVl5NEFxaytxK2xVdWxMSFNKMjdjTStZSGtFRUxYNzVKbWRZ?=
 =?utf-8?B?WnR3RTFiTmUxekNBVzQ2VExtQ3JFa3R5TnJtL1lQQ3FORmxXbEx4WjF5dUU0?=
 =?utf-8?B?NERia2t4ZHdWL3IwZXA2a1NGYXI0TSt2NGt2WW56YmluZVU1dUdGdFlxblFo?=
 =?utf-8?B?SUF4aWpMRDZ0TW1CdVNrM2EvcFVPUU5PNFhOLzN0T25HQXZkeVBBU3NmZjVt?=
 =?utf-8?B?c3VlQk9PUll3dkpoSlVZZGRBMlRoekhUYmx3SFkxRTJudEt6ZG1tVDZDV3J1?=
 =?utf-8?B?WVovOS9PUDhCRDNoVXVsNVF6K3FGRzg0NnFzZUh1SXJkSzIyaEpkWUsvbmdw?=
 =?utf-8?B?QTBwbFJkQUI2cUFJM090UXZ5Wmg0QlF1VURUcVFmZmZKV25xMlgwV1NORjFq?=
 =?utf-8?B?UEpQamw4OHA4UXBKcy9BV05GbVdna0lzTjdHd1lTa2hQV0V1eEpaZGp6YWsz?=
 =?utf-8?B?Z3QzTldLZ1NYbFIxZVFUeGNNb2tMMnU0QzhhbzNJTDhQU1BaVDF1bFlzSFha?=
 =?utf-8?B?ZUpxRDBXekM1bW16ZG5SRmgyb3Yvc1ZLMTVoQmxkdmhGY21tQTBhcVFZaDEr?=
 =?utf-8?B?TzQ5ajArUDQwMlF0N0RMRFJ2R2FDZXJsMHpwRkpWMUZva1lhalhsMEJPQ3Fa?=
 =?utf-8?B?SlRFeXc4VS9XNFdzOEY3UEV5TWVzeGVydnIzOXNpc1ZPWjRaUFpCUDdSSHUz?=
 =?utf-8?B?Vks3U21ZcWdqeXNKS09yVGpWUTlFSGhhUDUwRnFxbVd3dW52VDlXWWoxZHMw?=
 =?utf-8?Q?0QKvcCgihDs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sm1FaGY0aURNU0toZ2ppa3JhWkRKa0h5ZnZOa0VQWXRmZmh2ZEVSZ0ZGbHVo?=
 =?utf-8?B?bnhPNzFIQ0tQb08zZnVhYVN6a0NkeEpiOHpqemJzMG9VRWIyVHpZRGFEYVJD?=
 =?utf-8?B?aUVhakpqNmZUSE8rV2xCazFOc2s2cHZkc3o0UWN0YmdTSTNvd3BQeEY2UkE2?=
 =?utf-8?B?SjZVbWphbVdrM1BxVkZjWWx1Q3RReWlkbGhZdzBub0pRU1lYakR3dG9yT0pR?=
 =?utf-8?B?OExxYmIwTDBEc0dUUW1zQTFHR1BJU0cvR3VyU0lYaDJZZkZCMlB0b0cxaFk3?=
 =?utf-8?B?SCtRYzFGSmxPd3Zjdk5OM0h3MVpWWHVBOG5lK0FrbGlybDNIMEJxR3l5UHQ2?=
 =?utf-8?B?cEwwaFdwb1JhS01UNnllbFd1aW9QTXV3UEJNc1ZWYVdZU2FrUUVUTzJEZ2x4?=
 =?utf-8?B?TW91N0dWNnN6eG1vM3pleWpORDNVQzEzbHgyVUR0Wi9lSVhIMmk5QWZHM2Ra?=
 =?utf-8?B?ekpvWnlyVUlucFRQQ0lpeWdOalB3SjhLbDR6ZHh1TUg0aE85dE9tWTV3MHQx?=
 =?utf-8?B?a0VWbXJjbkpNNmpZWG93ZFpocElQeTJTL0tpUGFKMHZaT1plbjRHclh2VUJ5?=
 =?utf-8?B?ZG5kaFhJL0poQ01FcW5aMUtUQTVVTWZabFl2QXNIaC9LbTBybThRQUJiRndq?=
 =?utf-8?B?dXNiT1plSG9nU1NIWFhqaExGK0VEcmRKam5IcVhWVHJLc1VkZlo3NDA3R204?=
 =?utf-8?B?Vk91VHo2OU93TXdvYU5oZm1ER3FmbjQycG1JQnNBWmJjQU5qSmNFamR6RXRu?=
 =?utf-8?B?VEpTb2FubUZvUk5LWDZBVjV0enpxSWNicUJXaFdrVUozaGp3ZlVXUzVCalcw?=
 =?utf-8?B?eXpyMk5pZ09pK2oyZ09HWTk2bXI4ZWM4aTl6RFBCWUo4NlNtQTRZR1g4Z3VH?=
 =?utf-8?B?NUtqdWhGR2pGVmN4ODVjUzhTZFBWaGhnNk5ZZkJXR3lXTW40RW5lT284a3Yw?=
 =?utf-8?B?ZGgvUlRVOGdxdG0rSUJSbmR4aC95WVF5VHR5QjhCTTV1ZUNxeWp0UHRCNWVV?=
 =?utf-8?B?czNPTUpqTk5ycFhReWtnMW9wN0RJZ01hUk5xejA1TmVuQ0xNRkJTNWx1dnZ1?=
 =?utf-8?B?MXVVKzdvOWxTaWZiU2Y1aGFqVkJoUWhLSVF5aHZIdlBYaWcvTjg5QlVnRmVv?=
 =?utf-8?B?bERkR1JFQU1wZXpFR0dBVW1NQW82dmNuTk1vUEdFVmJmOWttaHJlQnFtcDFn?=
 =?utf-8?B?aFc1d1k2dVJsOGNVT3dIZk1DemdNL0ZrbW5ZQU5sbkNwYWVvQnprYlFhS2J2?=
 =?utf-8?B?akxUK2dBOXBmVTlCaVFESVB3aXNBUUxUNkw3MUZvTGFqMVc5RzBENDBJT1lF?=
 =?utf-8?B?aiswVTBXOVZZZUZaWmg5bEwraDFuWG1YWS94K2lrMGh1ZUNrUGVXQkJsR1F6?=
 =?utf-8?B?WlRsRnA3Z1hwK3kvVjFvZEtlZFI0bVYxM0Ftd1Z0dnRpVC9zRityV0lGelV0?=
 =?utf-8?B?dmZCcVU5V210THhhMlhaMHhkNlljQXFaN3NQQlpXMnh3RmxHdlZiZnNtNWs2?=
 =?utf-8?B?bkdqUnRPZXQrY0R2NVc1R2FKQ0JDS3QyWGd3bVN5eGpod2tuUU9QZTJJVEYv?=
 =?utf-8?B?Z2dzNS9pSzA5ZVZQOXNCdXhmYkh2cWExMy8wdllZM3J3b1Y4NUhYVG16Uk5q?=
 =?utf-8?B?NHpmeThwZnN3cmE0WW85YytOTVltQ3VOaHJlbSt5QVY2WFJRdjR5NzcrNlk0?=
 =?utf-8?B?dGdxSDVoRkRETXNCaStvZklBZjhiZXptN28vL3o2aWlxSzFsbWM1ZHp0Z1ZU?=
 =?utf-8?B?OWFLalQrQm5BZnlaR3J6UmhPZlVlOE1RcndWdkJzL0NEMW5ESGRtL3ZzTVhK?=
 =?utf-8?B?UlVrQ04rWFNnUnZmVUpRRHhOVEQ5dUVUK0x0SW9UN204bEdDRXRJemlrSW92?=
 =?utf-8?B?VVNtdzllNEVzUmZ1WmY3QkNjYkdCTFN5eko3dkRIejhNM3RITWdCQlgyUExD?=
 =?utf-8?B?MEFGMjNpMzhhOW0rcVpLRWV3N2lmbHdLZW4zbFhrRnZFdk9uZkc5NDFpanBC?=
 =?utf-8?B?SFNYYXFzbW9qVW1LeUdZbEM0T0p5OEFFMkYwSEVpYUZxL1MwNHZySEoyRHVZ?=
 =?utf-8?B?Tmh0WXVORllXUVdSRVNvaEVGSFNRYnc2OUlEUFI3SUNvbEFuRTNjZzg0endN?=
 =?utf-8?Q?OMAgP3KSULMMXvYIwRXusmiNP?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67b55439-3755-4718-0230-08ddba072b3a
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 07:56:51.0751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dzWjimKbBrgYHAskAr7qwd4i31T7pqnT9iBulIP1C3qvOqUObdio+3wEEwe6u1Vhs8wvHQ+OgfcCo6YK3OJMZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR03MB7232

Hi Jerome:

     Nise, The code looks much cleaner now. Thanks!!!


Reviewed-by: Chuan Liu <chuan.liu@amlogic.com>


On 7/2/2025 11:26 PM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> Use the composite clock helpers to define simple composite clocks of
> the c3-peripherals clock controller.
>
> This reduces the verbosity of the controller code on these very simple
> parts, making maintenance simpler.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/clk/meson/c3-peripherals.c | 1029 +++---------------------------------
>   1 file changed, 63 insertions(+), 966 deletions(-)
>
> diff --git a/drivers/clk/meson/c3-peripherals.c b/drivers/clk/meson/c3-peripherals.c
> index fd35f9b7994720d069c5f72142d6064790d40b60..b158756cfee4dd4bad5c0c9576da02d2cb8ee515 100644
> --- a/drivers/clk/meson/c3-peripherals.c
> +++ b/drivers/clk/meson/c3-peripherals.c


[...]


>   static const struct clk_parent_data c3_hcodec_pre_parents[] = {
>          { .fw_name = "fdiv2p5" },
> @@ -1228,99 +755,13 @@ static const struct clk_parent_data c3_hcodec_pre_parents[] = {
>          { .fw_name = "oscin" }
>   };
>
> -static struct clk_regmap c3_hcodec_0_sel = {
> -       .data = &(struct clk_regmap_mux_data) {
> -               .offset = VDEC_CLK_CTRL,
> -               .mask = 0x7,
> -               .shift = 9,
> -       },
> -       .hw.init = &(struct clk_init_data) {
> -               .name = "hcodec_0_sel",
> -               .ops = &clk_regmap_mux_ops,
> -               .parent_data = c3_hcodec_pre_parents,
> -               .num_parents = ARRAY_SIZE(c3_hcodec_pre_parents),
> -       },
> -};
> +static C3_COMP_SEL(hcodec_0,  VDEC_CLK_CTRL, 9, 0x7, c3_hcodec_pre_parents);
> +static C3_COMP_DIV(hcodec_0,  VDEC_CLK_CTRL, 0, 7);
> +static C3_COMP_GATE(hcodec_0,  VDEC_CLK_CTRL, 8);
>
> -static struct clk_regmap c3_hcodec_0_div = {
> -       .data = &(struct clk_regmap_div_data) {
> -               .offset = VDEC_CLK_CTRL,
> -               .shift = 0,
> -               .width = 7,
> -       },
> -       .hw.init = &(struct clk_init_data) {
> -               .name = "hcodec_0_div",
> -               .ops = &clk_regmap_divider_ops,
> -               .parent_hws = (const struct clk_hw *[]) {
> -                       &c3_hcodec_0_sel.hw
> -               },
> -               .num_parents = 1,
> -               .flags = CLK_SET_RATE_PARENT,
> -       },
> -};
> -
> -static struct clk_regmap c3_hcodec_0 = {
> -       .data = &(struct clk_regmap_gate_data) {
> -               .offset = VDEC_CLK_CTRL,
> -               .bit_idx = 8,
> -       },
> -       .hw.init = &(struct clk_init_data) {
> -               .name = "hcodec_0",
> -               .ops = &clk_regmap_gate_ops,
> -               .parent_hws = (const struct clk_hw *[]) {
> -                       &c3_hcodec_0_div.hw
> -               },
> -               .num_parents = 1,
> -               .flags = CLK_SET_RATE_PARENT,
> -       },
> -};
> -
> -static struct clk_regmap c3_hcodec_1_sel = {
> -       .data = &(struct clk_regmap_mux_data) {
> -               .offset = VDEC3_CLK_CTRL,
> -               .mask = 0x7,
> -               .shift = 9,
> -       },
> -       .hw.init = &(struct clk_init_data) {
> -               .name = "hcodec_1_sel",
> -               .ops = &clk_regmap_mux_ops,
> -               .parent_data = c3_hcodec_pre_parents,
> -               .num_parents = ARRAY_SIZE(c3_hcodec_pre_parents),
> -       },
> -};
> -
> -static struct clk_regmap c3_hcodec_1_div = {
> -       .data = &(struct clk_regmap_div_data) {
> -               .offset = VDEC3_CLK_CTRL,
> -               .shift = 0,
> -               .width = 7,
> -       },
> -       .hw.init = &(struct clk_init_data) {
> -               .name = "hcodec_1_div",
> -               .ops = &clk_regmap_divider_ops,
> -               .parent_hws = (const struct clk_hw *[]) {
> -                       &c3_hcodec_1_sel.hw
> -               },
> -               .num_parents = 1,
> -               .flags = CLK_SET_RATE_PARENT,
> -       },
> -};
> -
> -static struct clk_regmap c3_hcodec_1 = {
> -       .data = &(struct clk_regmap_gate_data) {
> -               .offset = VDEC3_CLK_CTRL,
> -               .bit_idx = 8,
> -       },
> -       .hw.init = &(struct clk_init_data) {
> -               .name = "hcodec_1",
> -               .ops = &clk_regmap_gate_ops,
> -               .parent_hws = (const struct clk_hw *[]) {
> -                       &c3_hcodec_1_div.hw
> -               },
> -               .num_parents = 1,
> -               .flags = CLK_SET_RATE_PARENT,
> -       },
> -};
> +static C3_COMP_SEL(hcodec_1, VDEC3_CLK_CTRL, 9, 0x7, c3_hcodec_pre_parents);
> +static C3_COMP_DIV(hcodec_1, VDEC3_CLK_CTRL, 0, 7);
> +static C3_COMP_GATE(hcodec_1, VDEC3_CLK_CTRL, 8);


Note: hcodec_clk is a no-glitch clock. The current driver may fail to set
hcodec_clk properly. A previous patch attempted to fix this by adding a 
flag,
but was abandoned as it introduced other issues.
(https://lore.kernel.org/all/f8c3b6e7-2f5d-493e-8254-2a27623f0d2e@amlogic.com/)

This macro won't be suitable if we revisit the flag approach later.


>
>   static const struct clk_parent_data c3_hcodec_parents[] = {
>          { .hw = &c3_hcodec_0.hw },


[...]


> --
> 2.47.2
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
