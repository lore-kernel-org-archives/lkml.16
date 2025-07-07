Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012064.outbound.protection.outlook.com [52.101.66.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683C41DE8BB
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 10:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751884101; cv=fail; b=e6zfvhFpIM4XtUX2QnBb+QprHXNYtnSKfkZJ0h0JKQouALUuowrf0M1dONMiY+T5VFJ/skMRsaO+norHBHW9ryTBrKW+KZnaNFw1i1Ne7UOGjpvSm2CjVieSLgPvg9Hag3gaU6i6G5pT0g0EuxuG+Wq/gkQuB384A3CFxSIqeFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751884101; c=relaxed/simple;
	bh=gnbavE+ek03ja5ZzuWLO87pjvW6aZthycEcMvEAHLkM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WG+m4ED4Yp1ThBm2DJ23xuZVp+s8XowALzA6nHAPyZKvi9QR69aZTYlG16YQGq3xJYowiYEB7UvClWquPx9ijVBY0Qizh//sJEip6WQ4d8ICKsKAtkmFXDBvrVFzvQwDDsZjQiQ7ksX3Gqaje8Iqqw91GQM34IBih10K9nC5X9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mJIJdmL6; arc=fail smtp.client-ip=52.101.66.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mJIJdmL6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OvFbJd64tmd0V91YhaqcOXd1/uDPfxhb8luBFzVXiYSl7I00bbtB0phvN06hDT0KspzCXvyE489GOyUN3Rw8O49ieMTiFy9yfjLkpNxre2vhnrinl8mwX5ZvOz7Jcz9hPfpllh4TChTeV67DF3gDgu4YrPDy9tzMCrg13t96caU9whA3M1r+QV4Pprd9wvpJle6hrUxgkbyb5/sT6TDb5ymcWOIi6OXPpNMey9I8+vd9T0oLQt74Y6WMQtVRyI0CgM2jrC8G/NHcTvm4gKpaBPFam9pTJrj0o/Jc3GoKeyq8BnF9JaAITPniA0Y2p8AjJiZXjqYmQnk2v987MYCALw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FMaooTN7j7OZ4mQxjpDr9C/t6wwpc/omeJ0Xs2olLH4=;
 b=ICmxM4d9n82roDm3QcQH43H/gIQX8UdU1xMXGa95ntcRCBzTsgPGsUm47xt6z7GcBP2n5de2sUXn7SxRWBiOOdnCmXcvPRpfcu+aQjy9TGoAvq0p+PB9UaTTNBttsvq5IgJB20x8xDbm+nV2enfft4NoHFatHujw0y6SLhtrnBNhcvKXLtmhZE/3krAfGz4suna6bvFTxbfZjTBFd+I9J09EjXwVzO8aUK3Yy7T9EIFhvm1+Bz284cV6IljasPVF9eWnZSpcx+8lUkLvq6XrKLuc6lJw0sk24cmBPP8OB95I4odIZqMOEcMZ16RN3N3zTqkO+bvUo6eiuVdC0/ZKwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMaooTN7j7OZ4mQxjpDr9C/t6wwpc/omeJ0Xs2olLH4=;
 b=mJIJdmL6mYw4jSplGmJtKBGmBUn41ulGPiGDyGO8MQjHNxpF2K8aZjYeLAokK19bhq+ZhsIf/7lC8lTHZqWs/x1bxtK5e+kVtOiuktYTHQsQc9gzPgIvC8rIxR/Uur0Y+B9/0UcZGVLkogAfuEKdfNQCK6vS3QnT7c/RCsOjqrVeRKmOXbC8tSK4RomWSqBOWJXDajTszBlGOG+ynMbPgOuUqbUmAQNGhLoaamqT72oIdUfpXVDHNbXJcJmD5ER/XNDQzA1M0oEYJQbsNy6eVCWcRk4pH9ZYPzpTWCml2CZMybwhz0thUdPUnH5OIh7RVo0wDc8VypBeRbpArJyYhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com (2603:10a6:10:2d9::24)
 by PAXPR04MB8766.eurprd04.prod.outlook.com (2603:10a6:102:20d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Mon, 7 Jul
 2025 10:28:14 +0000
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74]) by DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74%3]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 10:28:14 +0000
Message-ID: <7ae99ab2-b9c2-4148-a06f-77fb818fe137@oss.nxp.com>
Date: Mon, 7 Jul 2025 13:28:11 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/20] clocksource/drivers/vf-pit: Consolidate calls to
 pit_*_disable/enable
Content-Language: en-GB
To: Daniel Lezcano <daniel.lezcano@linaro.org>, tglx@linutronix.de
Cc: S32@nxp.com, linux-kernel@vger.kernel.org
References: <20250705160129.3688026-1-daniel.lezcano@linaro.org>
 <20250705160129.3688026-16-daniel.lezcano@linaro.org>
From: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
In-Reply-To: <20250705160129.3688026-16-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::8) To DU2PR04MB8582.eurprd04.prod.outlook.com
 (2603:10a6:10:2d9::24)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8582:EE_|PAXPR04MB8766:EE_
X-MS-Office365-Filtering-Correlation-Id: fe0d9251-be47-4120-df46-08ddbd40fad3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ME1zYlkvM05VSmFaRkFmRERBTmRwdjNYMDZZMWVzWDhrMlE5L2swdEVoUkI3?=
 =?utf-8?B?TUxSQTI4amUzWHQvdCt5ZVRicktWc3VpclVCWHNCbGZzamFoVjdhNHdaaWdK?=
 =?utf-8?B?QTRDYnUxTjZFblp5Q3diQUZNaUZta2JITDlqbkRRRHhLMDVyZ3BCMHVlem4x?=
 =?utf-8?B?VnluMDBHUkxzUkVFOG04R0VyTnN5bU45dHlySndldEF2OWt3UVpNeHFLd0pj?=
 =?utf-8?B?bHRFaEJvYlNMTUdqanA2eDFERUdqQXU5RnJKaUVVK2dBd3RiNDhPbWtWMktF?=
 =?utf-8?B?SmtoZSs4Vk1laitNRU02WkZDV29VcGJEdVBzS3g1VjREWVFqYzUybTFmd3Fw?=
 =?utf-8?B?Ty9rWWZ6T2FyK0g2Z3hCem1YVkVSNlR6bElsa0ZTMHMxa3BjK0xPelNqYTYv?=
 =?utf-8?B?L2VWYWNTbDI2TjhkL0VIMERabEZYN3J4RzZuUDZ6Q2VEZmJ6Mlk2UTczSTJP?=
 =?utf-8?B?NC9ERUNnNXdiUklOdXFTTEh5aHF3UnI0bWhzRFlGK2dLbGxiRDZHNmtuYnQz?=
 =?utf-8?B?RjlWZzJxam4vUWxXdXdNYjlqeTdsNDgrRVFPdnh4RGNkaGJFNjBTbFR2dG1a?=
 =?utf-8?B?ZkdpMnN6QnFLNE9VcDBYMzRUeUJCVlVLOWlnQTVpMi9ldXdyS25MUE95UEE4?=
 =?utf-8?B?dTFqcy84eXFMZHNvQTExM1Fpc0loSTJmem5ZaVREM0Mvanc1S1V5Q0VhaklB?=
 =?utf-8?B?S3MyNnNUNWkvOEFJeVZ1ZFlxV0FUUE5rYUhoZCtXdTVSaWZLZGRTbUpDM0Q0?=
 =?utf-8?B?bXMvaThPdHI5d3ZSclVDeTBIOXZXYzltdXFDdXd6dDFkcWt3bzRaZFVXVlpX?=
 =?utf-8?B?WWdWTjJtZDBtemdtcFBNZTdQTHNBVGg0VjF5aWJMYW53K0dQWGpQREVDUGFp?=
 =?utf-8?B?L2UycXZudWRzbXZOWG5rVE82UGpnTkRrSVprTHhCUlI3RS9HUDZ5RUd0aTcx?=
 =?utf-8?B?QXlsVXVITCtXZ0hYbUlYdFlhVmo4UHMxUEFTY3NSbWJxalVvb0xneXNFT0tQ?=
 =?utf-8?B?WFZ2UlRvRi82MDMwN0JlaVhVTUsxeFc2cUNQUEdpZkhzZTNPMVFwZEJMYUhH?=
 =?utf-8?B?NGVYdjdnY3AxTzhZdklHak1JRnc4UHpWQzYwTHdUbXVSNkJIVEZFTm84Sksv?=
 =?utf-8?B?NENoKzVKeVo4UHhWSE1oUy9rM2FXclhRYWswWEJaZzJBUFhmVGFoZ0VEYWxC?=
 =?utf-8?B?TnJsYUpwQXRDUko0MTFFTFU0ZGdCcmRlVnBIT1V1SURmNzl4NWpHd214WTIx?=
 =?utf-8?B?RWYrOU9KSldBY2VabVgrczQ2OHBObE5sYURXNHI4KytPb1UzQ2Z1Ni9wK3dx?=
 =?utf-8?B?cGpkN1BjNVBTRUg4bS93aUJ5eE9YWEJ6Z3VlVlIxVWlGZ3lSc21ZbDFHZnJH?=
 =?utf-8?B?NytZbVhPb0oydGcwRENRd0xDdXBZTzEzVlNoYkFnaDFwWmR6Y0lQV1owd3dQ?=
 =?utf-8?B?WUFYRnNyNDV6bUNmOVhIR216dmwycHB1ZlZBTko1UEVxTmJMeHlLZVhaWlYv?=
 =?utf-8?B?U3l1YWRqRU9YOVQ3bUh4ZGJTcFBwZFNYOUZiRVFWblNVWkNDUGFRQTZHdzFm?=
 =?utf-8?B?dk1mR3kwSG5sRWdsRmp1L3d6ZEtRaVk5c2JIQm5acDIrb3lZQUpyczZ4c1ds?=
 =?utf-8?B?M3g3V05xT3JNRVVDMXhnaWpIZ0M4OGNWcEI2M1ZIZEtYSXRDWTVOcTBtQjJM?=
 =?utf-8?B?WjB3OFRmeTRRRmlFVnR1d1B2Y05ueGJNMlcwdWVmWVFKRkRnQVBpdHVJKzMr?=
 =?utf-8?B?RE9XdzI0T2Y0WWVjREJKTHVCTGZJOEpLcmh4SjRlUSs5VlRUb3JoejA5ZFJW?=
 =?utf-8?B?WnpFZ3hONkcwVTl2RVJJamhLNGtiQWxXWTVNQ09TN2MzNEQxN2JLRU1tRHk4?=
 =?utf-8?B?aEllTThZUm1rTXZmNHVuUGlLMmQ1UnA1TXBiVGFkK0R1N0t1YmV4aGRZL3Ur?=
 =?utf-8?Q?Jak7sAeXC8Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8582.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDFYV0QwWjJ3em5WWk9sZFZVbG9aNmQ5aEF3NzZ0Y25TUVRmYncyYjdqK3Iz?=
 =?utf-8?B?R1FoVTMrR05KMndpUENmQnVJZmhvQmJSa1FjSnFnUzBRSDVGcVlWVUlHSm5G?=
 =?utf-8?B?cUNQdTNHTTJZWER6eU1ieGJucjY1ZEFUMEJFYzBDUUhJUGluRnhVQ1pqN3pl?=
 =?utf-8?B?WDBWamxBRkF1K0NYNmd4VHRPRGMxUWdLUEZpNHFUUUJ1bTR4cytYbEk3ckZS?=
 =?utf-8?B?S1VxaVppWlBRYnhZN2ZSY0V6Z2lhRnd2MEJxZUd2VHVHTVlud2hKb2JaQ1l0?=
 =?utf-8?B?aGNncnkrWC9mYURIYmVkZmRzcUxvVHVjK2dBb1FJbGlTcWI5TjhML0JBd2hX?=
 =?utf-8?B?TFBDSkxzNE1WeTZ6SkdpdXBMbjlFQ3BQYmpXaC8wZDNqdThBMzhUck1ZNDNm?=
 =?utf-8?B?RU0zNzNvdmxiR3hOUDNYejdWUnNwZ2k5OXUyVFR6Z0g1SHRCUVRwYlhGTjk1?=
 =?utf-8?B?NzZpSEdiVVFiMFhXdkdaUllPS0VqWGRXWWJ3WjRqT2ljeFFXNGJ0TlNCMGZz?=
 =?utf-8?B?TmpHMFRVM1puUkYvR1VrRVgrZ0RmSFFsZFRVSDE3WmZRVkp2UHZIUFNUT1pZ?=
 =?utf-8?B?Q0FucGlXekoyMiswYm9JSmc0ektha3ZrS3Q3dDdyOFFvaWNIZWREa0h5ZUpY?=
 =?utf-8?B?clJrZkdycEV6UFpPWG1xUncyM0JqZGlTTE1xN1VXY01pa1lkSU5oTUxEWlk2?=
 =?utf-8?B?S2RuS0lHc1RBU1h3aGluTGZERjk4amR2MEg4alBOYkZHbk1vaEhZK1hpNFZQ?=
 =?utf-8?B?VmxEb3JUYXZSRVhZenBRRWJJdzY5NUFhcmZZay8wMWxHZ1hDQXMzWWJpTWtm?=
 =?utf-8?B?d3J6MVFPVGFTN3c5cnlNWjFuQWFpMzIwN1hLRlA3eWRVRDRZd1MzenNvNlVM?=
 =?utf-8?B?Wm1rSHRFeGRDK0dZS3JDa1NkK2xOdHdEZzA3QkhpeCswaVRQd1hFMVAzenFo?=
 =?utf-8?B?R0o2TDAwM3pFbzlCU29lZ3VWYi9yMjlLcWVJZVQyazlSN0tIeFFXMDVqck5T?=
 =?utf-8?B?eU14SE03aTVwdVNJL012a0twMXRnTjIyS0JyUDNHTk45SU9KTDRndzhiRHVn?=
 =?utf-8?B?dGs2K0pSaXp0VU0wcnQrNW55NnhPbitxbEkrZXVSWVUreFFoZHovVjgxMkJY?=
 =?utf-8?B?elhYMHEvT2V5WXhBemRML0xNaHdibWhRakIxUHFzcFF0OWc2U1dnSFpDZ3FW?=
 =?utf-8?B?UGJ1eGViZ3lacExMZVRwMUxoMmJHclpaNHdvNi9aNTg0TklKOWZ4N0xKM1l5?=
 =?utf-8?B?dzJQUDZEbW9teGMyWHBpQVhhV2RYZnhtampJRUx1cGZFeG9hZWpxVk1sVEd4?=
 =?utf-8?B?Qk5Sc1BML0pvNmZVN3VmU1gxZVdNc0tTS0pBQUpPNm5HK0dJQVh6a2RsYW1V?=
 =?utf-8?B?a3ZiYlJ2aENFYkt1a0t6SVpoRllZVEtRYnFwLzJBczk5cUN3UjAxeTd0UWdN?=
 =?utf-8?B?c29xcndON1ZzOUVXVFVkUmhneUY0QUhScTg5S0VYR2QvQ1M0TUZwQlNXbXBQ?=
 =?utf-8?B?b0tmbzNFSjNENFJKd0d1c0VSdllPMS91USt4UGxPa2VLMlRmZlA1OWJDY0py?=
 =?utf-8?B?UFE3MVU4a2pBZEszR0FpUmtsM1FjeTN5S3RhNkU0NFZLL3BXWTFrODQzRXNF?=
 =?utf-8?B?TVVwYjV6aWMweDR6bXVJdG43ZzVaMjFTejF1QjVVWm5ZV01vY2RNaW5BTmN5?=
 =?utf-8?B?WnJ2S2ZLZGhDSEhmVHppSWZtV2ZDN05RZUFId0FUN3Z0VEFIblRQM0gwdkEz?=
 =?utf-8?B?ejhsL2h3MnlUbk5JcFh1enR6RE5UVTB5VWhSbW1sZ3ZRNm95b1JGU2dQRHVa?=
 =?utf-8?B?d1ZYaUtIelRZd0QxbERmcnI5THJHcXZNTmFTeUt5TjFLQWQ2SHo3SmplTkVQ?=
 =?utf-8?B?MVpJWDdSRVZ0L1RrYTFJY0JMKzJGdjB0Um94S2dmbXF5cGp1Q1Q3LzRoR2FJ?=
 =?utf-8?B?VE1ybnpOYklXb2JLOTA1UnZLck94bFdOcGFYNnV0WHJHZ2sxcDFOT3pKWDhL?=
 =?utf-8?B?UzJmdTV6OUdVSFRNazZMY2lQaTkrZi96UVlJNkU1R1IraTRJVXZTM1dTZWVv?=
 =?utf-8?B?a2g4YVltN2RLNXMrajNGQ1pNSGRld0FrNWlPdGwrbnlEdzZjTEpoRFdTOWt1?=
 =?utf-8?B?WFMwcWhxcUpkcTZ1WEloZGxHczd4eUMwa0lMVEx3QituZWJSbjlKdlE2SnlT?=
 =?utf-8?Q?WsX4X+io6TJ1ml0BAZDyjN4=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe0d9251-be47-4120-df46-08ddbd40fad3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8582.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 10:28:14.3420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bS/k921qxmPfj24h9dEW3m9qdDvNaL7c75AjwKoE/07prXNT7BTIYy8CA5vR9tkITxnEuCnhUogbBwsuAYIGPmzi1ZC7f7hjX8MM8VXQZMY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8766

On 7/5/2025 7:01 PM, Daniel Lezcano wrote:
[...]

> -static inline void pit_timer_enable(struct pit_timer *pit)
> +static inline void pit_timer_enable(void __iomem *base, bool tie)
>  {
> -	writel(PITTCTRL_TEN | PITTCTRL_TIE, PITTCTRL(pit->clkevt_base));
> +	int val = PITTCTRL_TEN | (tie ? PITTCTRL_TIE : 0);
> +
> +	writel(val, PITTCTRL(base));
>  }
>  

Would it make sense to use 'u32 val' instead of 'int val', given that writel() expects a 32-bit unsigned value?

-- 
Regards,
Ghennadi
