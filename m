Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2062.outbound.protection.outlook.com [40.107.247.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACA5242D77;
	Thu, 22 May 2025 08:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747901905; cv=fail; b=QJZBDERf/8E5Tewf6gUsOtBD+vTs0qGS7gBLGtriH89/FAQqX4zMd51cvAKstW5LIUjLPVYMq7WyL4P4ULyyNB+GEDqVNPSKSqJokZHCM2d6zJlnMjWf3CwI7i8E9wOJP0W/xFfh0UdNkPmBdCpx6qMmzmakhnG8UMMbAQztsTo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747901905; c=relaxed/simple;
	bh=/oHWEQsPd2QngLLPLt4GsaLIoIeeOooKdK0r/ZVFGEU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bGczCi1HzzaHKlmBFRg45VtD1UaTAzyh8458UFt1F9ldHNNmu/SH/YZy4Mgz7WY8x3CLgrn5JS831jhlQ8CudcS3At1Yo1uCYttMjeQjjv6lVwZoZGL0zSVCQaSqtALFFN3lbA+9uX19uq9Rz9dXrn4lR+LlHnpUqeyVnIhpR9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=MSZfN2d8; arc=fail smtp.client-ip=40.107.247.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="MSZfN2d8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UeZgiEOuiH87zG41/QkC3fwetXo8V7gdn04cTY6Ua/N70P87zfdY7P+Ii0UmgD0ksZD5jZKbfT116BHfFmnIU2A6Vm4FIB/DRtHEztDWmlpr4T1D0J27/gpNp4em985hRPr/aE1dyEhsvgU4JUURizVy5VpZFjwTZCbmkShRj/Lgl3Lm0PYAwGCKzMq1WoqLFBu0z7NvbH2+2LcE39mlVWKe5t3BUECfIDLmk/dIC8Xj/1EvjNH2bLycPtD8+5TjgdA7byLC0g2gEQEcaen6b7YsRJ8d6MXVspcxDwsVXrgsHuXc3y5BwgXNu0DE+ELvFnNer3lU8gwk7HAbTsr6qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d2iFD4c36x95oY9BGLD2MaRUkVKuOYzcu80Qcl7HiY8=;
 b=BzCqiww9oQIZYNxo5cXCX6lXHZz0OJ9DVFtzauNFu8uve3nVLOqgbxCVTM15opN/PlKDtTFeigpOb50Xq0YS/+uLXQOLhoCwruq64/p4Vu/mE/hnMv5fpGGdtLgZPE2U2LmetiJGW/AapHAGqk7pYMCO+UK+7XxPT37O5JJT6JcncJkXadlnEjLPl4LJEPP3O40DUZNrfzHqFko/r4XGy2uXGRNfNWua/3np+hgCu/lP7M1yUzooBkgC+Df9WKotJdZrBbzEPpdykhPpwgEyQ0eUopUdLF0fouOqJ3UbnCwGcnsopqdCyPCtUGmpcJvFoyk/TiqX8JIr/1VinSxEbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d2iFD4c36x95oY9BGLD2MaRUkVKuOYzcu80Qcl7HiY8=;
 b=MSZfN2d8o2BzNolr6iyD2pDMCVrpSOygr83G7cUKMhObcd594WbiK4Xq95RRzNrx1nMpZKdVnZrGLZIE++QyRdO5divdbPlyb2sHYoM8M1Xm+FYayiqzfVWsSY/HrCM/F7E6bNA8pgpFMY1uXWLb17KHhAwFjKWJ09xbyk80RME=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS1PR04MB9238.eurprd04.prod.outlook.com (2603:10a6:20b:4c6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Thu, 22 May
 2025 08:18:17 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 08:18:17 +0000
Message-ID: <19574942-d06b-44b0-8b6c-d3ddd94db89f@cherry.de>
Date: Thu, 22 May 2025 10:18:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: support Ethernet Switch adapter
 for RK3588 Jaguar
To: Andrew Lunn <andrew@lunn.ch>, Quentin Schulz <foss+kernel@0leil.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Kever Yang <kever.yang@rock-chips.com>
References: <20250521-jaguar-mezz-eth-switch-v1-0-9b5c48ebb867@cherry.de>
 <20250521-jaguar-mezz-eth-switch-v1-2-9b5c48ebb867@cherry.de>
 <657a085c-4214-4096-8a68-047d57a40d60@lunn.ch>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <657a085c-4214-4096-8a68-047d57a40d60@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TL2P290CA0023.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::12) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS1PR04MB9238:EE_
X-MS-Office365-Filtering-Correlation-Id: bc11d784-39b3-44d5-5639-08dd99093450
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RTBxdzF6MVl5UGlCNkNiTE0rejNQaTlULytsU0YrQm1MTjErZDVHNlJ4VnBH?=
 =?utf-8?B?VEhmQk5ySERmczc3V1M1NnY1aW1GNU5lY2hENnM2amt5NWgzL3RuN2VQRnA0?=
 =?utf-8?B?QmJJYTd2eTlucTA2OG53RDVab251bU5WK0xFN0JuT0g4ejlnTEJEQnhBZnMv?=
 =?utf-8?B?aG1Rc05LK0tvSndwUHdoNnpxNGtWK0tGaG9VUlNZUWczR0hQaTdiTk1SejRj?=
 =?utf-8?B?VWRSZ3ZzQ2pSQmczLzNUYk1BQkgvZG91OVFIZnpTWDJOVGVXbFRaS0l5d01X?=
 =?utf-8?B?TE10NHRsdHRGd0pheGRIM2FwcXRZdEtOMzdpSlRydHJYamRRd2MzT05pQUd1?=
 =?utf-8?B?dnJ3OXFzNXRvM1RSVk55YzNOTjhSaUJuTS9uc3JlYUlrbExhbFBqdWlBN3dN?=
 =?utf-8?B?UHRaekZaSUxWaklaWmlwVjJBbU1VVnhWYUR5ekUxRTBRdUVPK2RBUDliU3Iw?=
 =?utf-8?B?ZHUzbDNoMWNSWDF0WlZsVGtiOTg5SE4vMWV5dExBRjg5WXo4cGdtWHNiUFFX?=
 =?utf-8?B?R2tIOHd0YTdTT2xORjBPM1QrRGNmUnV4eHRiUDBYRyt4NmNVNUtsVGVWeFRh?=
 =?utf-8?B?b1BtbDRTSjVqZWMrVGZBNVR1R20rNDIyRFQrZlJTNmc4N2FtWWRWODV1TWFL?=
 =?utf-8?B?SFFuMTUvcVhTOGJtNE9ZKzRrdWlkYTQyL0YrK2dwYStxMkk2VmRDVFRZcXpD?=
 =?utf-8?B?Tkl6dVZwZUZIeStxYXNnNWpzU1NQbFVBdVZwOU16K1N5SG1KZmZ3bVpqT0cy?=
 =?utf-8?B?MnVVVm1qcys1eFpHRGphSXQ1SVRMVzdoZDVXWHk3QnVNSHpSSWQvM3NkNGpY?=
 =?utf-8?B?TCtzSXR6TUczQjJHTXZ4ZVNnNnFNRnNpdnA4RnVSY0lOMWlnbmZsRzhUWUo3?=
 =?utf-8?B?Y2pGeTYyUUlyem5MQXlKeWhWd3lUZE5nRFZXcThEYTZDNHRQaG1Lc2lYWWZ2?=
 =?utf-8?B?alhPWnNERVU1ZHBhRElBcDFRaFNzUjlZUDVyN1RjbVVlMlBlTXdkOHRWNzA3?=
 =?utf-8?B?bmFPMnRLSHd0Smt1Y1djbWR1dFpJaTdwYm5yNmQvdXhZOXY3WHRUNnU0WUJT?=
 =?utf-8?B?WWpreUZhVU5wdDZNSG4wdXNmUERxblpFN05ER1VreEJmTXdrYTk5L1NpWXB2?=
 =?utf-8?B?bWw2K0t4M052WG1NM0VlNnRNNU90VXkrNWVBNWE0aDNOeS8rekZHVmVaWWo3?=
 =?utf-8?B?aHM1OGtsOGk5ZzhUb2g4cG45eEtiRmMvZ1hzeDdtZXg4UUszMVVPTGVaTkJL?=
 =?utf-8?B?UW4vcFMzL1BnZVdERXJ1ekd4ZWpuR1BRczZXV096dGRtUHQycU9Xd2liY0Z2?=
 =?utf-8?B?d2JYZTFBYmdYMk5MQ0daaklKdUdEQWs1YldFMHZiSEs5Wkw4Ny9KRjRVNitV?=
 =?utf-8?B?ZWQ0dDJTZzRVSXF1REtZU1YyUzVvWnVBWis2V2xCb2d6OHRUS0xwVGYvRDdm?=
 =?utf-8?B?M0JxNFc1VTZIT1duNzJFSHZzZkZVaUFTOUNxTFJuRXZ4am9leTNidXF5MElD?=
 =?utf-8?B?WUFqcUhwajlWTDJpbklrbG53bXBsUHUwQS9kZmNyWUlVV04zOHh5dGdnTDFH?=
 =?utf-8?B?UlJyL0NpUm5nUjhIcDF3MnBEU2J5TkZIZVV5SGFST2QrMnRCaitKUXVpMnhj?=
 =?utf-8?B?L2V5QmhSVEttcUZNc1EwcEQxdlE2aWl3aEUzdzhnbW84Nms3QjlUa0RtRFlO?=
 =?utf-8?B?MlRmYTd4ek5INWR5SUxLMFo0V0NRRTlWZENmaUpSRnJlQVI0RUlUOWRaSkF3?=
 =?utf-8?B?M01EN1BNMVFTaS9oMVl5R20ranlrNUpuQW9mc0JESUdFdmJJTXlhYk5GQzFR?=
 =?utf-8?Q?ScKIX8u7DSuJXrSKvdUvS/20d2uyUJVpNrTPE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3BCaUppMkNaRkVrbXNSaTdyWEJSUVZhZ0pRSnN4L0pIT2pmalVWN0cwYmRq?=
 =?utf-8?B?Q1N6SitTNnVJME0wSEdMVTcvakovWkFRWWFUWGZKOGZnVHl4RExRR0dnNkN1?=
 =?utf-8?B?Rk1tWnRFbFZocGkwSi81UzhaZmRKclVZNDE1aHMrdHpJVU9vYU4yVjVhS0Rl?=
 =?utf-8?B?amlsNzNmdzN3K1NKSTYvSnNUL1NESzMvRm0vN1h5aUdDY01DVzgyZm5OeVdM?=
 =?utf-8?B?MXB2RXNBZGJhY09HRjU3N0pRVjBTa2ljVEhUZ1JOT0lqWnQyU2ZMRDNhMHhu?=
 =?utf-8?B?RGliODBidE9Ra2wyR0YwNHAycXJTL01RQ3JOYXhGemN2WWJsRzBGWUhxSG1y?=
 =?utf-8?B?Z3VtSXAySi93QzRFUGNMZkRnUHV2TkZjUUl6bVc5MDlCWVZ6bDRUTnp6Nk4r?=
 =?utf-8?B?UXQwdy92QnhxSWwxQjdjZGJ6Qjl1SzU1RlowYXdjMTlpamRtVEhtRm4vT3hO?=
 =?utf-8?B?WTg3Y1FGTFhhR0l6eHJpQ1ZkMkVlNzZuME51R29iSjlQZTlUYS93RlFVcmtF?=
 =?utf-8?B?WmhRV1c0R1VmYkF5bHk2dE9sQ0w5MUpHd0F2cWl6VUR6djlRTkR0VFVTZys2?=
 =?utf-8?B?Mm4xVXIyQ0M1RzVIcm5OVlE2ejJYQWxWN05RRmNtYU9Da0RkQksyMWtib05O?=
 =?utf-8?B?NGQ0aVBBN2d4WEx2TnR2eTdpWGQyVEk0L2xGeTJ0Y01ZQXhUbXA3WGpkSVda?=
 =?utf-8?B?WXJZNk85QzdQOXJ3cU12ZU9jdUFXTHd3NjVlbFF2cG1tR0pSZzIyVTBMSWdI?=
 =?utf-8?B?QkFRWTZTcU1EM3Radlp6NkwwN0FsaGE0ZDk0dERDUjVnYzdnWDJuV1E4VkV0?=
 =?utf-8?B?TytOd3RMYjlkNEk5YnoxakY3R2tPWnBUaGRTQzhXcHp5SlkvRWhrQzR6QzlG?=
 =?utf-8?B?SjFDRmtIU3dCUzJyOWdwMHhnckdNclpna3dob3dYaDk3RlJPSTN4a0Y0dkZE?=
 =?utf-8?B?bC8xK1NvY1R5bTF0UjBmcjJ1WDdpR3EyS2x0WXM4TXhjRGlwVERsTFFGVmJT?=
 =?utf-8?B?SUdrUXpWeDEya1N2T0oxZFcwYmZmcWpaU1IvN3ZndkMxK0ZkVzhNMDAxOGM4?=
 =?utf-8?B?eFNzYTV2d3RHOWUvUDlEWldJUFJKVWpXVmFaSWJvZjFUbWd1d0JkOUoyS29W?=
 =?utf-8?B?KzY4V1VrQU8zb3QwN3c3MW12KzFBUVo2aFBEakhuQUg4L0tzZi91OHc4bTR5?=
 =?utf-8?B?d004RFVPYUhWcldORk92WklkRWZrM2hHdCtKTWlwblhWa0MwVnpRM2FMOXpY?=
 =?utf-8?B?bjdlWmt0U0thNFlwZ3dLeGtyN09EWUJscnpCS2JFNVA3SnNoOG9zUlUrdmZa?=
 =?utf-8?B?ZHBlbEpWTjhWdi84SmxPTmdpU3h4OTNqTzVsQ3NXclZYMXk3Yk1FMWJIOG1P?=
 =?utf-8?B?OFkwVEMyWnpzUjVOZVJIOU50TXNHeHIyc3MvSktJaWp5UEc3T255R0R5Q3h0?=
 =?utf-8?B?R1M2K0krMzNUNjgydUJtbE83NFpqRTkxWDhzTk91alJ4N1FVcmt1a3NTMnpZ?=
 =?utf-8?B?Sjk2N0ZESkp2UDR5SHlTaXNnUm5YeFlQem5MaHEzcUd2SEsvMHF4ZThXT0N0?=
 =?utf-8?B?eCs5TG1CMWVvREhsZUU2TVZvM0FOT2NXREFtR0EvOWtocFJzN0FzT1ZXSVk2?=
 =?utf-8?B?MXA5YkM4Nm9MNDZOSmMzOW9sSTZGaG9OeGpLZE9jbGJucEpseFR1SHpwOUto?=
 =?utf-8?B?cWZ2RHJBM3FVVEZkTW00QU53dWRaN1l0a2ZzN1V5WVJkYXFwUjkwVy95c3p3?=
 =?utf-8?B?cit3SGxpTkY4M1dad2Q5RDdWLzUwWVFvSzJ0RWI0NGkyWUpCMkxFbGJyWlgz?=
 =?utf-8?B?ejV4QTNWTHp4cnFqWWpURnV2YmhtV0gycHh4N1pzdlgxaUsxYytlVHVvMUJN?=
 =?utf-8?B?SzVaTUZQNThNc3hGcUNNeDJIbWN1L0dzdnc3MTJQelNueVhpeit0UUpvSDNE?=
 =?utf-8?B?dU05S20zQUtjU2ZJV2NnQm5YdEtkcXd1eHRRNkdOdjk5QkYxb2I1T3JaUHhJ?=
 =?utf-8?B?WldMSFVGQ016QldNSy8rMGkxWnZEckZzdEJoRVZhNkZvNGYwUnNYaGRuNGxx?=
 =?utf-8?B?MWcyZlYzY2NGaFpPY0NqZFdIbEo2L3Z0d09Ra3BFaVpnM3lDL0RSYTFnajVm?=
 =?utf-8?B?Ni9MSVRmVFBNZEdtNUdZd1RpQjJ4djFpUlpyODBFWjc2SDNDdGk1OU42VWlk?=
 =?utf-8?B?SGc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: bc11d784-39b3-44d5-5639-08dd99093450
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 08:18:17.1840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oJblstAQ8KhQpoL5NXqdia9bZa4dbzI3zBhvnLUEdVR0Qyaa4r3tr4b9mQkYVsfWm3+1z+D6hC+AVpqd7pWL7BcD2TIQgj9mfPwVQOSbSCQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9238

Hi Andrew,

On 5/21/25 6:25 PM, Andrew Lunn wrote:
>> +&gmac1 {
>> +	clock_in_out = "output";
>> +	phy-mode = "rgmii";
> 
> Does the PCB have extra long clock lines to implement the 2ns delays?
> 

Not that I am aware no.

The issue here is that I believe the Linux driver actually got the whole 
phy-mode thing wrong?

drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c

First, tx_delay defaults to 0x30 if absent, rx_delay to 0x10 if absent, 
which seems a bit odd but why not.

Then you have rk_gmac_powerup() handling the delays.

If RGMII, then use rx_delay and tx_delay. If RGMII-ID, use neither. If 
RGMII-RXID use tx_delay. If RGMII-TXID use rx_delay.

This is the complete opposite of what I was expecting? I would like to 
use rgmii-id because this should better fit the HW matching the 
documentation in the dt-binding here 
(https://elixir.bootlin.com/linux/v6.15-rc6/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287), 
but this would actually disable the delays on the MAC if I read that 
correctly.

>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&gmac1_rx_bus2
>> +		     &gmac1_tx_bus2
>> +		     &gmac1_rgmii_clk
>> +		     &gmac1_rgmii_bus
>> +		     &eth1_pins>;
>> +	rx_delay = <0x30>;
>> +	tx_delay = <0x30>;
> 
> Since this has a switch on the other end, its a bit more complicated
> with RGMII delays. Normally, the MAC does nothing and passed rgmii-id
> to the PHY, and the PHY then does the delays. However, here you don't
> have a PHY. So you have the MAC add the delays. This looks O.K. I

The switch actually supports adding delays on the port used for DSA conduit.

https://eu.mouser.com/datasheet/2/268/KSZ9896C_Data_Sheet_DS00002390C-3443638.pdf 
5.2.3.2 XMII Port Control 1 Register bits 3 and 4. But the granularity 
is essentially: 0 delay or at least 1.5ns...

With the SoC MAC we actually have a much (assumed) more precise granularity.

https://github.com/FanX-Tek/rk3588-TRM-and-Datasheet/blob/master/Rockchip%20RK3588%20TRM%20V1.0-Part1-20220309.pdf

25.6.11 Clock Architecture

"""
In order to dynamically adjust the timing between TX/RX clocks with data,
delayline is integrated in TX and RX clock path. Register 
SYS_GRF_SOC_CON7[5:2] can
enable the delayline and SYS_GRF_SOC_CON8[15:0]/SYS_GRF_SOC_CON9[15:0] 
is used to
determine the delay length. There are 200 delay elements in each delayline.
"""

No information on the meaning of the number we put in rx_delay/tx_delay. 
Then you'll ask how we figure out the value to put there :) We initially 
port on the downstream kernel where they have a debugfs entry to 
dynamically modify the delay and return an eye of which you get the center.

> would prefer that the driver used the standardized
> rx-internal-delay-ps & tx-internal-delay-ps rather than these vendor

I would prefer too. We would need to know what the value we put in 
rx_delay/tx_delay actually mean in terms of picoseconds? (adding Kever 
in Cc) The worry I have is whether this is stable across all SoCs using 
that IP and/or if the delay is based off the MAC clock or something like 
that?

Then, in order to NOT break new kernel Image with old DT, I assume we 
need something like:

If RGMII, then use rx_delay and tx_delay, no 
rx-internal-delay-ps/tx-internal-delay-ps.

If RGMII-ID, no rx_delay/tx_delay, both 
rx-internal-delay-ps/tx-internal-delay-ps.
If RGMII-RXID use tx_delay and rx-internal-delay-ps.
If RGMII-TXID use rx_delay and tx-internal-delay-ps.

Fail if there's a mix of tx_delay/rx_delay and 
tx-internal-delay-ps/rx-internal-delay-ps properties? (possibly even on 
dt-binding level).

> properties. But that is probably out of scope for this patchset.
> 
>> +			port@5 {
>> +				reg = <5>;
>> +				ethernet = <&gmac1>;
>> +				label = "CPU";
>> +				phy-mode = "rgmii";
> 
> Again, this probably should be rgmii-id to correctly describe the PCB,
> but i don't know if the switch takes any notice of it.
> 

It does something based on DT:

drivers/net/dsa/microchip/ksz_common.c:ksz_parse_rgmii_delay()

If neither rx-internal-delay-ps/tx-internal-delay-ps properties are 
present, set rx_delay to enabled (2000 is arbitrary there) when in RGMII 
or RGMII_RXID mode, set tx_delay to enabled (2000 is arbitrary there) 
when in RGMII or RGMII_TXID mode. If one property is missing, it is set 
to disabled.

Now I do have a question. Shouldn't phy-mode from the MAC match the one 
from the PHY (here I assume the switch contains a PHY on the CPU port)?

I'm a bit confused by the following sentence:

"""
Normally, the MAC does nothing and passed rgmii-id
"""

is this something that the MAC driver is supposed to do or is the 
subsystem handling that somehow? How do I know how/when to rewrite the 
phy-mode passed to the PHY?

Cheers,
Quentin
