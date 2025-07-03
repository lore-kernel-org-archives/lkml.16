Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023095.outbound.protection.outlook.com [40.107.44.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00863291C24;
	Thu,  3 Jul 2025 06:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751524189; cv=fail; b=jWEcT6u5tSI6WE54nUyFvaDe8klqfARGmcPC5MxIYcohoPzWzA/YarKsIj2j0A0D+83pzkxvDrxbObHvfeV29uM8bht9zIlldjKX4UQNwKWw3Dubac7lIasRLmYQS4Xe11cCRqlJC5sFzEWVqfxANUDwba4uwRRb2Q1BrDEqGHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751524189; c=relaxed/simple;
	bh=sZRpGMEO756n7SY7lAtBGiKTneW6UqHDpE4MyOdXXV8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BVd7pjcGwhI1Et8oOtwhxgxj2fru2OINFyfvp41ec7ITo039j3kFYVFlmyEhTjZb2HhfP1ahDYNs+1UMNj9W8mwa/C9HH/7zP0yl9IWOl9AeTlvBDJ9QMtg/G8LxkX0yDXGOA1sT8fikEzJ+dhko00oqrAbjrzE3Nrviaq2ZBrM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=XdA+Xgkk; arc=fail smtp.client-ip=40.107.44.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="XdA+Xgkk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KwT5aQde9H3YffbDozvQXDleapVqOUAoWJUbY+9iGyfvTUZvxWEf3T4FIYSBKlQfXk7kEVE4U+cYkvnHEZCrcv7Dspoy1Fk+5dtKNq974AV0XCGR7KjTOhcnImaFXAD05Jtz0Gtzj+Q0NnAypxbfIFTqFTRTtA1GoMXm+KheFgEVBUxHvzkCxi2XhY/lTzlDJDWrc3M7Xrp9rLxrgMCRHAkrtC5FNMEY3pT1oOOcrmfulaUZki1zGlKp771wq0gWZzLW7Q24NGIrurBBC8nOD8+Methb1BHaVptF2knHi7x1viuFbI45Avu9KwAo1/iCJwIE8Vs8+UuQp4cE1D9oig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BH7vN5Eu//Wjr8aL1TjK64i2B4SQ1PCSQtjf1HhS0y8=;
 b=fOgMHH3DhUyDQmW8+jGekIVvi9E5npkTt4SG5JvXyfUQWQsqkD5qpdgmWBY0WaouMkwAJ7RN45MX8oGAtgqqOvcdRUmxon7r1nyueMzymLWY4RJ/2O4DtYmawE0Na7S0JpvOwUr7+5TyZBu4iMQOpDoEAjBk7a93SwBkPlDzG219JpDXRUxtZMUaR2XAEne9QTXiuE5FuRATzsL8M4XzcHlEnz9tC+wYYUX7DI1vgnFPoy0OO0kWCzPlzkKAW+2POVDttzAMsRjP26e62Nq2R5NvkBwICTQxt5tfgKjqqoLSnAYDZ4UgBEK8BxmOf0cwZ6544znnVIIPQCrsG0tTKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BH7vN5Eu//Wjr8aL1TjK64i2B4SQ1PCSQtjf1HhS0y8=;
 b=XdA+XgkkQ67k0X/kt02ELpZz6PtBN8TgmydtwkxrUVbUJ7z9VnHjj3AXkyhDvwLSZVJZnoGfgKsJET1KilHAhQx+a7Ama+Q6EfnUzrvjo+nAdQ0f6fhRxXJmGJKNWhWhMUuz19sSdTIGbP32r+x3JXmFCPLro3UFN1oIHHwgBgSsBRg5NCDSE8RSjUQc95uUA6MIhEY3zRx7pcuFfKWWlV3Jsdf6mYPq6LDM2dMRxxp3SVxPaCrqvdzZPxThii9UaJZg0uV7WsxZIAYr3C3WReS45MYEPo+ODzR/wY8CA0Up3cRZTF764k2yuZU2EjBZJlRZVJa1ilHkO/MZSN54cQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by SI2PR03MB6613.apcprd03.prod.outlook.com (2603:1096:4:1e4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Thu, 3 Jul
 2025 06:29:40 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca%6]) with mapi id 15.20.8901.021; Thu, 3 Jul 2025
 06:29:39 +0000
Message-ID: <c9489be5-b48a-43dd-8785-b4db91659bc2@amlogic.com>
Date: Thu, 3 Jul 2025 14:29:05 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/26] clk: amlogic: use probe helper in mmio based
 controllers
To: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
 <20250702-meson-clk-cleanup-24-v1-17-e163c9a1fc21@baylibre.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-17-e163c9a1fc21@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR06CA0004.apcprd06.prod.outlook.com
 (2603:1096:4:186::20) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|SI2PR03MB6613:EE_
X-MS-Office365-Filtering-Correlation-Id: 47747105-207d-47dc-c810-08ddb9fafc05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q1JzUFFZUkt3Nk9KWW4wcE9GY2dObmE5ZU1ZdTNDWW1QYk5EU3U3SW5CL1Ra?=
 =?utf-8?B?V2dzV2ZnMzhGMnloa1NtU0FaR2l1WC82ako2SldIcFhzbjhFTVdjOW9UaFBS?=
 =?utf-8?B?MFN4dGtyZjdPN2tzRDVKMkh6OU5ydFppR2pEY2ZvM1FBdzB6SlBMaEVibFpN?=
 =?utf-8?B?REJ1Y3NVZ1VpMm42UWQ5T0Z6Rjg4SnUvSDQxOW9ZdmJpNUdNWWxNbVV2bFBa?=
 =?utf-8?B?OWxhalhmSUp4c3V3OUFUdU1vQWFMVXh5VHlabHZiZURsb0xtVURydnRhL1JQ?=
 =?utf-8?B?UHFmSDh3WFM3VWFCZ0o2R3hkdi85NXpoWUdFQS94KzU0a3ZQRVpyM2dlUVNv?=
 =?utf-8?B?NU5PMWFNRzNoYXlRd09LMUl1V1dLN2trVFJ6SVVVWnU1dmVIdk8yb3k0UDdM?=
 =?utf-8?B?ejhLdXZObmhVNmFtdjdPL3JFTEY1cG43eUlMNkZYV0Y3ZW53WVJ0WE5RNkNI?=
 =?utf-8?B?WXljWTA1VU83SnEwcmRNWkNMN3h0WndyNkE3SjFkQy80N0N6WktKOUpJd2VQ?=
 =?utf-8?B?dlphUC9BUFBVOUZ0bHJxbzFGMUJaUlI2ZDg3U05KZzZrL09SNGNRbnJXOG5R?=
 =?utf-8?B?aDlpblMvZ0xueEJwTGhhK0c5TThLWTJQdmpxdUdKaS91U0ZPTDdvQnRsd2R6?=
 =?utf-8?B?UG5iWjlQUlVHOHpobWJrKzFsTGR3d2RpYzBiWitTTEdkV052aWxKR3dEY0hO?=
 =?utf-8?B?MlQ2RENyNHkwOVFSRk9IS0NWVUpFK3A5bDRza0hEb0cyL05MTm5OUDQ1WEdJ?=
 =?utf-8?B?amdwWnZYakJyTmZaQjl2Sy9JQTYybUdaVm1JTDlib0trMXA0RDZrWlkvMmQx?=
 =?utf-8?B?QmRUS3pRUnppY1pRckdqQmlQVE1zc1ZURVJlOFQ2TGhuK2FGc1Z4RmxxSGlL?=
 =?utf-8?B?bU9zSXJXMnFBVFR3cU04dHZicVNnVHhGUmVSUHBIOURSbks5QW9lSy9ubGtM?=
 =?utf-8?B?ZGdZZkhsMVJ6cmNzeXNIVWZtNitRdjBiT2JMVW5aNkRieVhUZVA5N01FdEk1?=
 =?utf-8?B?akxhLzdRdjhnMTZBcE5td0FTV0xLYWNucmJPdm96V0hTeGdzay9xaDZTWGVj?=
 =?utf-8?B?WC80aGFHWFdnYURYTWdvZVd3UEFveEVzS093bFQxRHJJTzd3MHdYUDJvTk5w?=
 =?utf-8?B?ekpydk8wRFhSemRIUEpaYm90aFZaTWgxR3hjbHA1dFowK0JCM0lXN0FjblU4?=
 =?utf-8?B?aGdQTnhjbldmZDhSKy9RY3dlclN6bUw0MVVRVFpGRnZ5dXFEaldsWlBqY0sx?=
 =?utf-8?B?RGo4UWgySWVuYWt0eHQwQXAwa0xuRjV3aWtjbmtMODlmOGMweUtIT2VncVht?=
 =?utf-8?B?Uis1WWhhYUl0UDUxeVc0OFFEeVQzU0JuZEsxOEN1bG94WkZkQmhDZ0ljNFYz?=
 =?utf-8?B?aTNENnUvOXg5K1NORDNSaXhYN2cwYUxTTURoQUlIeTRIaUhrM0hVcTZZZjhK?=
 =?utf-8?B?SFJqc1lTZURJNDhrcUdLeTNtTDJXOWl5S3JFWTQ4b0FrUm9CMGFNZStNR1h4?=
 =?utf-8?B?NUNJWVIzMmlSZklJVGxWaFNOd0NEWlJXa0IxdDRIN1BjMnVCZUVFU0tJQlBF?=
 =?utf-8?B?dDJUOUw2R3ZmQVV0MmhoK01TNGFkb2pxTXZUVXFyVWxhcjJMTUhRV1ppTUtX?=
 =?utf-8?B?clFyaEx6SEhhQlh6YXV0M0U1bSs3dkx1MlM2dUN2b1FFbjg2SUpKblhkZEFh?=
 =?utf-8?B?a0JRSU1ZbDdmbGxjTXRreEJRbGxEc1M1U0Flc2hvSWNRUVpsL1M2dXpiWU1z?=
 =?utf-8?B?SW56UGQ4alJzT2krNXFEUS9RbHZWMTUwQ05ZaGVZRytJeGtXR2NoQ0t1VTZu?=
 =?utf-8?B?c3R3aERwcTVJa0ZOUlBGdDJlMjR5aVJnbXdzREdaMkRDaFpHTndpUUlDeC9L?=
 =?utf-8?B?Vnc1VDJ3SjhKOXM2MEtlSUxpem1reVVTMEFaVkJvOWRIbXM3ZXppMEl6YTd3?=
 =?utf-8?Q?HAr7Z2DPNGQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXdPelBhWlBjc1pFYmVpYzF0eVVqQkluaWtESGdJcFNYQ2pNMjVBMXZhdFVk?=
 =?utf-8?B?SGJySUZNK3lraTFHVVNMN3FJNGp3eENManFjWjJFNkM5MzZWQU4yZFZZREhs?=
 =?utf-8?B?YXpuYzloejlsUDJuQXVRN04xSHhrY05YSklMT1BhdlpSaWtOSmg4ZnY5NTNx?=
 =?utf-8?B?MkFzN2Q3WnR6eVNkY250eDQybUx2dE1kekcxVlF2VmtWWFpNT0dha1NvaVZ1?=
 =?utf-8?B?NG5HVkNSOEkxZC94d0s3SlU1TFFDTXVQZnpzVWtEcmdZNDBLbHMvVGdkTGxp?=
 =?utf-8?B?STRVK2xjQ09DMzk2L1dqa01QOC9BWFhXNk50WWpGMHBqOHR4N2lrYnMvdWRt?=
 =?utf-8?B?ZzRDejVudXBITFhqeVJ3T0VhUDJGbXpFUHZlWFpndzBKODM0dE9KcnJhNUtG?=
 =?utf-8?B?Q3lkWDltVVFKcXdISld2cTNaYkRYcWVCVkoxUHNQN3BPaXUyMDEwNlFYdVBY?=
 =?utf-8?B?ZVlTdVQ5MUp6UTgxZjJ3ZHZrRWdseEdxU3J5emZrVExZK2lUNmxSWDlTb1hF?=
 =?utf-8?B?VUZDcnRoWVVNWjVGbDZxeW9UeFl4MlY4ZVI0WDJ2d3EzK3ZUVUVCKzR1aVVU?=
 =?utf-8?B?SDlBaWxQYllKWm9wU2puUnE3azJPYTY0RjR2WmZFOXJRdHZvL2U0c3lZbE16?=
 =?utf-8?B?SGZ5V1JiSmttVEs3V0YxRnZWOVlkMTlibjlQV0tGVVNIZnMvZ3JIaWl0RHdo?=
 =?utf-8?B?UXZ5dDZDTE0wRnNNcFZNRWdxeWo4L3hielBaNTJiOTdwckU0aDFkSEl5eEZz?=
 =?utf-8?B?dEVuZy82d2RseDRVckZiUlpCREZ0TVROMFFzZHBrUEdWendJUmVFY0RiZ1hJ?=
 =?utf-8?B?OEZvaWFHaCtqUjVIOE0ycUF1ZlVJekwxNFF2WFNtU0swTFBOaC93Z0xyNnpo?=
 =?utf-8?B?SHZEZXY1ZTUzZ1lJdWN0NHcvdHBWQlFVR0dhZW55WnZaNWFMK0hKUlVDdXdm?=
 =?utf-8?B?YllXeWpzZGpsYXc5MXFNckwzK3ozK1J4THJFYkJvc2dsM3ozUkpmdjlEdngz?=
 =?utf-8?B?SUpZTmhPYndZTWQxd3dIcnVYdzJjbFNaMFB4Nkt6WnRrWXhMOVV5amhiU3BU?=
 =?utf-8?B?VWRmbXJlTURCaUxwbm43MFZLVTA0OTFNL09tU09OY1V0bnRneGh0N3UvWlBR?=
 =?utf-8?B?MkNuWkNzY2theE56UXp4M09oNENXSGd2U0p4NHVFU2VGWFBJdjFPeVEvck8w?=
 =?utf-8?B?NHh5eFNqOU9ZU08zSlZKN2Z5UjBvaUxqQS96RW45UFg1eW5RUnlQSTAvbmw2?=
 =?utf-8?B?bWRFbGRNWldPNktjRWFsS2hYMGkvaTIxYStueXNhK2MrRU5BTVF2UStUd2xY?=
 =?utf-8?B?ZkhjbnZXazdabDNjdXRDWnRteEMzNGUyeVl2MlpHN1hMUW55M2dmazB1b0dU?=
 =?utf-8?B?RkJEakwzTGp3dnlaVGJkcTVKaitzT0NYeE04Y1FKdnNHRmVidEIrSW4xR3No?=
 =?utf-8?B?VTI5NmJtdGdEMDk5U212eGkzU1Y4UEpDY011R2ZwZmJkeGg1R28rT0pMaUhD?=
 =?utf-8?B?TnZEcmp6MHEyelczZnFOVGIxYnBOTFpkSXdxakdXRFhBbklJUEVmNDF1L3hj?=
 =?utf-8?B?UEppSGp5bHZra2hZcUpLSVFUeEI0Rks2RmErT3FtcnRuZ0JFZHAxOGFRY0VS?=
 =?utf-8?B?QlVuc0lnZHhYbXk0ajU3Q3JGNko2NGs3UktmcUgwQlJ5SVdSUVBFWHJSUCtv?=
 =?utf-8?B?bmF5WjRzVlM0djFFajdhS3ppeG5WYlVLbUgzWUVQOGJSSlFEWkN4M3krRjBG?=
 =?utf-8?B?K0ZWZStqOHhWTkY1ZFgyOWIzQVdWZmFrenc0R3pmRXdwajZ5N1FRRHM5Y0lh?=
 =?utf-8?B?MDkxNGFnUXYvNlJUOThvajd3OC9YemV6WVJLS3lZNncvZjBkYkQvQnlKclZB?=
 =?utf-8?B?a05GRjJGMHEwblRjTXJ3K2V3ZkF2SnZlSnhhKy9MYmVKaDdTeklLcVBpR3lI?=
 =?utf-8?B?MnV1S3dSc2k3eEVFS08xNThEbzhnZDRkY0xUVFN6RzJUbWNxNWliYmdobG83?=
 =?utf-8?B?M2I1U2F6TU9qR3gzWi8yY0JGd1lGeWNOeFJiTlJkc2RZa2dvdEs2VWlDdmo4?=
 =?utf-8?B?b29DL1ZVTkh6SllDQXRTdjB3cWF1OStMcm5JZWNuVHJsSUNHZWI0V3ZOWVQv?=
 =?utf-8?Q?+7BNrVMBIwOlgW9FiU6WoW9fL?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47747105-207d-47dc-c810-08ddb9fafc05
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 06:29:39.2207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v8zpah9LL9YWt+d4lHYOaZBjr0J61qBlr6J4SAJi/D55np5PBJ6UxFu1dnyO3IPZlLG5Nql+uHebJHcvFFfvkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6613

Hi Jerome:

     I have no objections for C3 and S4. Thanks!


Reviewed-by: Chuan Liu <chuan.liu@amlogic.com>


On 7/2/2025 11:26 PM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> Factorize the probe function of the mmio based amlogic clock controllers
> using the newly introduced probe helper. This removes a fair amount
> of duplicated code.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/clk/meson/a1-peripherals.c | 52 +++++++--------------------------
>   drivers/clk/meson/a1-pll.c         | 52 +++++++--------------------------
>   drivers/clk/meson/c3-peripherals.c | 51 +++++---------------------------
>   drivers/clk/meson/c3-pll.c         | 49 +++++--------------------------
>   drivers/clk/meson/meson8-ddr.c     | 57 +++++++++---------------------------
>   drivers/clk/meson/s4-peripherals.c | 49 +++++--------------------------
>   drivers/clk/meson/s4-pll.c         | 60 +++++++-------------------------------
>   7 files changed, 66 insertions(+), 304 deletions(-)
>
> diff --git a/drivers/clk/meson/a1-peripherals.c b/drivers/clk/meson/a1-peripherals.c
> index 9e352dba54775c22126ee8bf7861ee1d981d6c88..b2feb8fe4775e38a17d8aa9ce9b992b3e1fb2bb8 100644
> --- a/drivers/clk/meson/a1-peripherals.c
> +++ b/drivers/clk/meson/a1-peripherals.c
> @@ -2057,54 +2057,24 @@ static struct clk_hw *a1_peripherals_hw_clks[] = {
>          [CLKID_DMC_SEL2]                = &a1_dmc_sel2.hw,
>   };
>
> -static const struct regmap_config a1_peripherals_regmap_cfg = {
> -       .reg_bits   = 32,
> -       .val_bits   = 32,
> -       .reg_stride = 4,
> -       .max_register = DMC_CLK_CTRL,
> -};
> -
> -static struct meson_clk_hw_data a1_peripherals_clks = {
> -       .hws = a1_peripherals_hw_clks,
> -       .num = ARRAY_SIZE(a1_peripherals_hw_clks),
> -};
> -
> -static int a1_peripherals_clkc_probe(struct platform_device *pdev)
> -{
> -       struct device *dev = &pdev->dev;
> -       void __iomem *base;
> -       struct regmap *map;
> -       int clkid, err;
> -
> -       base = devm_platform_ioremap_resource(pdev, 0);
> -       if (IS_ERR(base))
> -               return dev_err_probe(dev, PTR_ERR(base),
> -                                    "can't ioremap resource\n");
> -
> -       map = devm_regmap_init_mmio(dev, base, &a1_peripherals_regmap_cfg);
> -       if (IS_ERR(map))
> -               return dev_err_probe(dev, PTR_ERR(map),
> -                                    "can't init regmap mmio region\n");
> -
> -       for (clkid = 0; clkid < a1_peripherals_clks.num; clkid++) {
> -               err = devm_clk_hw_register(dev, a1_peripherals_clks.hws[clkid]);
> -               if (err)
> -                       return dev_err_probe(dev, err,
> -                                            "clock[%d] registration failed\n",
> -                                            clkid);
> -       }
> -
> -       return devm_of_clk_add_hw_provider(dev, meson_clk_hw_get, &a1_peripherals_clks);
> -}
> +static const struct meson_clkc_data a1_peripherals_clkc_data = {
> +       .hw_clks = {
> +               .hws = a1_peripherals_hw_clks,
> +               .num = ARRAY_SIZE(a1_peripherals_hw_clks),
> +       },
> +};
>
>   static const struct of_device_id a1_peripherals_clkc_match_table[] = {
> -       { .compatible = "amlogic,a1-peripherals-clkc", },
> +       {
> +               .compatible = "amlogic,a1-peripherals-clkc",
> +               .data = &a1_peripherals_clkc_data,
> +       },
>          {}
>   };
>   MODULE_DEVICE_TABLE(of, a1_peripherals_clkc_match_table);
>
>   static struct platform_driver a1_peripherals_clkc_driver = {
> -       .probe = a1_peripherals_clkc_probe,
> +       .probe = meson_clkc_mmio_probe,
>          .driver = {
>                  .name = "a1-peripherals-clkc",
>                  .of_match_table = a1_peripherals_clkc_match_table,
> diff --git a/drivers/clk/meson/a1-pll.c b/drivers/clk/meson/a1-pll.c
> index 79ef4cbe955326ecedceb68cda7f59bb8882b165..1f82e9c7c14ebeae5d43cf2623c3ab69427a8504 100644
> --- a/drivers/clk/meson/a1-pll.c
> +++ b/drivers/clk/meson/a1-pll.c
> @@ -295,56 +295,24 @@ static struct clk_hw *a1_pll_hw_clks[] = {
>          [CLKID_HIFI_PLL]        = &a1_hifi_pll.hw,
>   };
>
> -static const struct regmap_config a1_pll_regmap_cfg = {
> -       .reg_bits   = 32,
> -       .val_bits   = 32,
> -       .reg_stride = 4,
> -       .max_register = ANACTRL_HIFIPLL_STS,
> -};
> -
> -static struct meson_clk_hw_data a1_pll_clks = {
> -       .hws = a1_pll_hw_clks,
> -       .num = ARRAY_SIZE(a1_pll_hw_clks),
> +static const struct meson_clkc_data a1_pll_clkc_data = {
> +       .hw_clks = {
> +               .hws = a1_pll_hw_clks,
> +               .num = ARRAY_SIZE(a1_pll_hw_clks),
> +       },
>   };
>
> -static int a1_pll_clkc_probe(struct platform_device *pdev)
> -{
> -       struct device *dev = &pdev->dev;
> -       void __iomem *base;
> -       struct regmap *map;
> -       int clkid, err;
> -
> -       base = devm_platform_ioremap_resource(pdev, 0);
> -       if (IS_ERR(base))
> -               return dev_err_probe(dev, PTR_ERR(base),
> -                                    "can't ioremap resource\n");
> -
> -       map = devm_regmap_init_mmio(dev, base, &a1_pll_regmap_cfg);
> -       if (IS_ERR(map))
> -               return dev_err_probe(dev, PTR_ERR(map),
> -                                    "can't init regmap mmio region\n");
> -
> -       /* Register clocks */
> -       for (clkid = 0; clkid < a1_pll_clks.num; clkid++) {
> -               err = devm_clk_hw_register(dev, a1_pll_clks.hws[clkid]);
> -               if (err)
> -                       return dev_err_probe(dev, err,
> -                                            "clock[%d] registration failed\n",
> -                                            clkid);
> -       }
> -
> -       return devm_of_clk_add_hw_provider(dev, meson_clk_hw_get,
> -                                          &a1_pll_clks);
> -}
> -
>   static const struct of_device_id a1_pll_clkc_match_table[] = {
> -       { .compatible = "amlogic,a1-pll-clkc", },
> +       {
> +               .compatible = "amlogic,a1-pll-clkc",
> +               .data = &a1_pll_clkc_data,
> +       },
>          {}
>   };
>   MODULE_DEVICE_TABLE(of, a1_pll_clkc_match_table);
>
>   static struct platform_driver a1_pll_clkc_driver = {
> -       .probe = a1_pll_clkc_probe,
> +       .probe = meson_clkc_mmio_probe,
>          .driver = {
>                  .name = "a1-pll-clkc",
>                  .of_match_table = a1_pll_clkc_match_table,
> diff --git a/drivers/clk/meson/c3-peripherals.c b/drivers/clk/meson/c3-peripherals.c
> index a09cb1435ab108b2dcc209c6557bcd1988c4ba1a..e9c1ef99be13d0542b8a972ceffe69c8a9977118 100644
> --- a/drivers/clk/meson/c3-peripherals.c
> +++ b/drivers/clk/meson/c3-peripherals.c
> @@ -2091,52 +2091,17 @@ static struct clk_hw *c3_peripherals_hw_clks[] = {
>          [CLKID_VAPB]                    = &c3_vapb.hw,
>   };
>
> -static const struct regmap_config c3_peripherals_regmap_cfg = {
> -       .reg_bits       = 32,
> -       .val_bits       = 32,
> -       .reg_stride     = 4,
> -       .max_register   = NNA_CLK_CTRL,
> -};
> -
> -static struct meson_clk_hw_data c3_peripherals_clks = {
> -       .hws = c3_peripherals_hw_clks,
> -       .num = ARRAY_SIZE(c3_peripherals_hw_clks),
> -};
> -
> -static int c3_peripherals_clkc_probe(struct platform_device *pdev)
> -{
> -       struct device *dev = &pdev->dev;
> -       struct regmap *regmap;
> -       void __iomem *base;
> -       int clkid, ret;
> -
> -       base = devm_platform_ioremap_resource(pdev, 0);
> -       if (IS_ERR(base))
> -               return PTR_ERR(base);
> -
> -       regmap = devm_regmap_init_mmio(dev, base, &c3_peripherals_regmap_cfg);
> -       if (IS_ERR(regmap))
> -               return PTR_ERR(regmap);
> -
> -       for (clkid = 0; clkid < c3_peripherals_clks.num; clkid++) {
> -               /* array might be sparse */
> -               if (!c3_peripherals_clks.hws[clkid])
> -                       continue;
> -
> -               ret = devm_clk_hw_register(dev, c3_peripherals_clks.hws[clkid]);
> -               if (ret) {
> -                       dev_err(dev, "Clock registration failed\n");
> -                       return ret;
> -               }
> -       }
> -
> -       return devm_of_clk_add_hw_provider(dev, meson_clk_hw_get,
> -                                          &c3_peripherals_clks);
> -}
> +static const struct meson_clkc_data c3_peripherals_clkc_data = {
> +       .hw_clks = {
> +               .hws = c3_peripherals_hw_clks,
> +               .num = ARRAY_SIZE(c3_peripherals_hw_clks),
> +       },
> +};
>
>   static const struct of_device_id c3_peripherals_clkc_match_table[] = {
>          {
>                  .compatible = "amlogic,c3-peripherals-clkc",
> +               .data = &c3_peripherals_clkc_data,
>          },
>          { /* sentinel */ }
>   };
> @@ -2144,7 +2109,7 @@ static const struct of_device_id c3_peripherals_clkc_match_table[] = {
>   MODULE_DEVICE_TABLE(of, c3_peripherals_clkc_match_table);
>
>   static struct platform_driver c3_peripherals_clkc_driver = {
> -       .probe          = c3_peripherals_clkc_probe,
> +       .probe          = meson_clkc_mmio_probe,
>          .driver         = {
>                  .name   = "c3-peripherals-clkc",
>                  .of_match_table = c3_peripherals_clkc_match_table,
> diff --git a/drivers/clk/meson/c3-pll.c b/drivers/clk/meson/c3-pll.c
> index ccfcd4b5be8996592c27df31fa62d4871c826926..dd047d17488c1309dcc4607dfb55582ea978528d 100644
> --- a/drivers/clk/meson/c3-pll.c
> +++ b/drivers/clk/meson/c3-pll.c
> @@ -653,59 +653,24 @@ static struct clk_hw *c3_pll_hw_clks[] = {
>          [CLKID_MCLK1]           = &c3_mclk1.hw
>   };
>
> -static const struct regmap_config c3_pll_regmap_cfg = {
> -       .reg_bits       = 32,
> -       .val_bits       = 32,
> -       .reg_stride     = 4,
> -       .max_register   = ANACTRL_MPLL_CTRL4,
> -};
> -
> -static struct meson_clk_hw_data c3_pll_clks = {
> -       .hws = c3_pll_hw_clks,
> -       .num = ARRAY_SIZE(c3_pll_hw_clks),
> +static const struct meson_clkc_data c3_pll_clkc_data = {
> +       .hw_clks = {
> +               .hws = c3_pll_hw_clks,
> +               .num = ARRAY_SIZE(c3_pll_hw_clks),
> +       },
>   };
>
> -static int c3_pll_clkc_probe(struct platform_device *pdev)
> -{
> -       struct device *dev = &pdev->dev;
> -       struct regmap *regmap;
> -       void __iomem *base;
> -       int clkid, ret;
> -
> -       base = devm_platform_ioremap_resource(pdev, 0);
> -       if (IS_ERR(base))
> -               return PTR_ERR(base);
> -
> -       regmap = devm_regmap_init_mmio(dev, base, &c3_pll_regmap_cfg);
> -       if (IS_ERR(regmap))
> -               return PTR_ERR(regmap);
> -
> -       for (clkid = 0; clkid < c3_pll_clks.num; clkid++) {
> -               /* array might be sparse */
> -               if (!c3_pll_clks.hws[clkid])
> -                       continue;
> -
> -               ret = devm_clk_hw_register(dev, c3_pll_clks.hws[clkid]);
> -               if (ret) {
> -                       dev_err(dev, "Clock registration failed\n");
> -                       return ret;
> -               }
> -       }
> -
> -       return devm_of_clk_add_hw_provider(dev, meson_clk_hw_get,
> -                                          &c3_pll_clks);
> -}
> -
>   static const struct of_device_id c3_pll_clkc_match_table[] = {
>          {
>                  .compatible = "amlogic,c3-pll-clkc",
> +               .data = &c3_pll_clkc_data,
>          },
>          {}
>   };
>   MODULE_DEVICE_TABLE(of, c3_pll_clkc_match_table);
>
>   static struct platform_driver c3_pll_clkc_driver = {
> -       .probe          = c3_pll_clkc_probe,
> +       .probe          = meson_clkc_mmio_probe,
>          .driver         = {
>                  .name   = "c3-pll-clkc",
>                  .of_match_table = c3_pll_clkc_match_table,
> diff --git a/drivers/clk/meson/meson8-ddr.c b/drivers/clk/meson/meson8-ddr.c
> index 6a9efde9b570d8a2609c118d7d38334a3b4a5dcc..0f93774f73718d29afca87b4c601bd32b9745d30 100644
> --- a/drivers/clk/meson/meson8-ddr.c
> +++ b/drivers/clk/meson/meson8-ddr.c
> @@ -83,57 +83,26 @@ static struct clk_hw *meson8_ddr_hw_clks[] = {
>          [DDR_CLKID_DDR_PLL]             = &meson8_ddr_pll.hw,
>   };
>
> -static struct meson_clk_hw_data meson8_ddr_clks = {
> -       .hws = meson8_ddr_hw_clks,
> -       .num = ARRAY_SIZE(meson8_ddr_hw_clks),
> -};
> -
> -static const struct regmap_config meson8_ddr_regmap_cfg = {
> -       .reg_bits = 8,
> -       .val_bits = 32,
> -       .reg_stride = 4,
> -       .max_register = DDR_CLK_STS,
> +static const struct meson_clkc_data meson8_ddr_clkc_data = {
> +       .hw_clks = {
> +               .hws = meson8_ddr_hw_clks,
> +               .num = ARRAY_SIZE(meson8_ddr_hw_clks),
> +       },
>   };
>
> -static int meson8_ddr_clkc_probe(struct platform_device *pdev)
> -{
> -       struct regmap *regmap;
> -       void __iomem *base;
> -       struct clk_hw *hw;
> -       int ret, i;
> -
> -       base = devm_platform_ioremap_resource(pdev, 0);
> -       if (IS_ERR(base))
> -               return PTR_ERR(base);
> -
> -       regmap = devm_regmap_init_mmio(&pdev->dev, base,
> -                                      &meson8_ddr_regmap_cfg);
> -       if (IS_ERR(regmap))
> -               return PTR_ERR(regmap);
> -
> -       /* Register all clks */
> -       for (i = 0; i < meson8_ddr_clks.num; i++) {
> -               hw = meson8_ddr_clks.hws[i];
> -
> -               ret = devm_clk_hw_register(&pdev->dev, hw);
> -               if (ret) {
> -                       dev_err(&pdev->dev, "Clock registration failed\n");
> -                       return ret;
> -               }
> -       }
> -
> -       return devm_of_clk_add_hw_provider(&pdev->dev, meson_clk_hw_get,
> -                                          &meson8_ddr_clks);
> -}
> -
>   static const struct of_device_id meson8_ddr_clkc_match_table[] = {
> -       { .compatible = "amlogic,meson8-ddr-clkc" },
> -       { .compatible = "amlogic,meson8b-ddr-clkc" },
> +       {
> +               .compatible = "amlogic,meson8-ddr-clkc",
> +               .data = &meson8_ddr_clkc_data,
> +       }, {
> +               .compatible = "amlogic,meson8b-ddr-clkc",
> +               .data = &meson8_ddr_clkc_data,
> +       },
>          { /* sentinel */ }
>   };
>
>   static struct platform_driver meson8_ddr_clkc_driver = {
> -       .probe          = meson8_ddr_clkc_probe,
> +       .probe          = meson_clkc_mmio_probe,
>          .driver         = {
>                  .name   = "meson8-ddr-clkc",
>                  .of_match_table = meson8_ddr_clkc_match_table,
> diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
> index 9bcd35f12836de5e318fd1ad9c9ae15a2bfc3dd7..fc1500df926d056ce17252987dd91095a8399b55 100644
> --- a/drivers/clk/meson/s4-peripherals.c
> +++ b/drivers/clk/meson/s4-peripherals.c
> @@ -3449,59 +3449,24 @@ static struct clk_hw *s4_peripherals_hw_clks[] = {
>          [CLKID_HDCP22_SKPCLK]           = &s4_hdcp22_skpclk.hw,
>   };
>
> -static const struct regmap_config s4_peripherals_regmap_cfg = {
> -       .reg_bits       = 32,
> -       .val_bits       = 32,
> -       .reg_stride     = 4,
> -       .max_register   = CLKCTRL_DEMOD_CLK_CTRL,
> -};
> -
> -static struct meson_clk_hw_data s4_peripherals_clks = {
> -       .hws = s4_peripherals_hw_clks,
> -       .num = ARRAY_SIZE(s4_peripherals_hw_clks),
> +static const struct meson_clkc_data s4_peripherals_clkc_data = {
> +       .hw_clks = {
> +               .hws = s4_peripherals_hw_clks,
> +               .num = ARRAY_SIZE(s4_peripherals_hw_clks),
> +       },
>   };
>
> -static int s4_peripherals_clkc_probe(struct platform_device *pdev)
> -{
> -       struct device *dev = &pdev->dev;
> -       struct regmap *regmap;
> -       void __iomem *base;
> -       int ret, i;
> -
> -       base = devm_platform_ioremap_resource(pdev, 0);
> -       if (IS_ERR(base))
> -               return dev_err_probe(dev, PTR_ERR(base),
> -                                    "can't ioremap resource\n");
> -
> -       regmap = devm_regmap_init_mmio(dev, base, &s4_peripherals_regmap_cfg);
> -       if (IS_ERR(regmap))
> -               return dev_err_probe(dev, PTR_ERR(regmap),
> -                                    "can't init regmap mmio region\n");
> -
> -       for (i = 0; i < s4_peripherals_clks.num; i++) {
> -               /* array might be sparse */
> -               if (!s4_peripherals_clks.hws[i])
> -                       continue;
> -
> -               ret = devm_clk_hw_register(dev, s4_peripherals_clks.hws[i]);
> -               if (ret)
> -                       return dev_err_probe(dev, ret,
> -                                            "clock[%d] registration failed\n", i);
> -       }
> -
> -       return devm_of_clk_add_hw_provider(dev, meson_clk_hw_get, &s4_peripherals_clks);
> -}
> -
>   static const struct of_device_id s4_peripherals_clkc_match_table[] = {
>          {
>                  .compatible = "amlogic,s4-peripherals-clkc",
> +               .data = &s4_peripherals_clkc_data,
>          },
>          {}
>   };
>   MODULE_DEVICE_TABLE(of, s4_peripherals_clkc_match_table);
>
>   static struct platform_driver s4_peripherals_clkc_driver = {
> -       .probe          = s4_peripherals_clkc_probe,
> +       .probe          = meson_clkc_mmio_probe,
>          .driver         = {
>                  .name   = "s4-peripherals-clkc",
>                  .of_match_table = s4_peripherals_clkc_match_table,
> diff --git a/drivers/clk/meson/s4-pll.c b/drivers/clk/meson/s4-pll.c
> index 6a266bcafd6257937c1de50cbc5606dcc6f8207b..56ce6f566e537a26e932db245ede17d900d9f093 100644
> --- a/drivers/clk/meson/s4-pll.c
> +++ b/drivers/clk/meson/s4-pll.c
> @@ -798,66 +798,26 @@ static const struct reg_sequence s4_pll_init_regs[] = {
>          { .reg = ANACTRL_MPLL_CTRL0,    .def = 0x00000543 },
>   };
>
> -static const struct regmap_config s4_pll_clkc_regmap_cfg = {
> -       .reg_bits       = 32,
> -       .val_bits       = 32,
> -       .reg_stride     = 4,
> -       .max_register   = ANACTRL_HDMIPLL_CTRL0,
> -};
> -
> -static struct meson_clk_hw_data s4_pll_clks = {
> -       .hws = s4_pll_hw_clks,
> -       .num = ARRAY_SIZE(s4_pll_hw_clks),
> -};
> -
> -static int s4_pll_clkc_probe(struct platform_device *pdev)
> -{
> -       struct device *dev = &pdev->dev;
> -       struct regmap *regmap;
> -       void __iomem *base;
> -       int ret, i;
> -
> -       base = devm_platform_ioremap_resource(pdev, 0);
> -       if (IS_ERR(base))
> -               return dev_err_probe(dev, PTR_ERR(base),
> -                                    "can't ioremap resource\n");
> -
> -       regmap = devm_regmap_init_mmio(dev, base, &s4_pll_clkc_regmap_cfg);
> -       if (IS_ERR(regmap))
> -               return dev_err_probe(dev, PTR_ERR(regmap),
> -                                    "can't init regmap mmio region\n");
> -
> -       ret = regmap_multi_reg_write(regmap, s4_pll_init_regs, ARRAY_SIZE(s4_pll_init_regs));
> -       if (ret)
> -               return dev_err_probe(dev, ret,
> -                                    "Failed to init registers\n");
> -
> -       /* Register clocks */
> -       for (i = 0; i < s4_pll_clks.num; i++) {
> -               /* array might be sparse */
> -               if (!s4_pll_clks.hws[i])
> -                       continue;
> -
> -               ret = devm_clk_hw_register(dev, s4_pll_clks.hws[i]);
> -               if (ret)
> -                       return dev_err_probe(dev, ret,
> -                                            "clock[%d] registration failed\n", i);
> -       }
> -
> -       return devm_of_clk_add_hw_provider(dev, meson_clk_hw_get,
> -                                          &s4_pll_clks);
> -}
> +static const struct meson_clkc_data s4_pll_clkc_data = {
> +       .hw_clks = {
> +               .hws = s4_pll_hw_clks,
> +               .num = ARRAY_SIZE(s4_pll_hw_clks),
> +       },
> +       .init_regs = s4_pll_init_regs,
> +       .init_count = ARRAY_SIZE(s4_pll_init_regs),
> +};
>
>   static const struct of_device_id s4_pll_clkc_match_table[] = {
>          {
>                  .compatible = "amlogic,s4-pll-clkc",
> +               .data = &s4_pll_clkc_data,
>          },
>          {}
>   };
>   MODULE_DEVICE_TABLE(of, s4_pll_clkc_match_table);
>
>   static struct platform_driver s4_pll_clkc_driver = {
> -       .probe          = s4_pll_clkc_probe,
> +       .probe          = meson_clkc_mmio_probe,
>          .driver         = {
>                  .name   = "s4-pll-clkc",
>                  .of_match_table = s4_pll_clkc_match_table,
>
> --
> 2.47.2
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
