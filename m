Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2087.outbound.protection.outlook.com [40.107.21.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86F1277807;
	Wed, 14 May 2025 13:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747229063; cv=fail; b=r4czyEORBNZroY2ZDLIIEVFu5psOPk3zFp/rqxCNgmBaNcRMtPDRps9RUC7S1mBHjEKcy4ZJyOFKY1KgLDeFZ9lOiLdaW0rCjZ+8seb3W+wD8WL6Gls4kcdy34F2NH5mRhslCICy4K0NkMTLNNYo3eYKs/20heso2Dgi3rEzZTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747229063; c=relaxed/simple;
	bh=0oahc7uaoHjxs0R76HrxWlh9+93PQtrqkaMa8hf4jUE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bx31/Cz6I6UCAduEM3ar3hL+SFhWiD4n2o/C5MTMsPSdfo/CqSHGgIc4Kshq0fnyjGMWpfrWwnsJ29/MGsEUeVmIxuJ5ZYuxOqaUzOt6oamDfvldIB5KHcqKVnvYZayktNYvAHmpBcRDoulz+e9la63ti06kyOru/7NA1uHtJzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=jMeQLF/D; arc=fail smtp.client-ip=40.107.21.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="jMeQLF/D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lhyuIhj38MH/kI7jprbck8C4Sz/40/+iLPEChOidFytz2Qfh6fMDI8QKzAcobOqnC7IxdEbmdMZXgpREr8kjDvYR8BB97N1MDUdIcdzEdZaVbZdv6Vf2L26raFfKKEvp1pJRHjX9kOLz/6NqFXiT3i+/Dx9jHwqSASZxihMwEY143SjrPvZSJmFPJc434/aXFfLlv9gI9MxD/wPFcQSUiDx3h2cgoAjnBkSbp3VhCfqnLiZQ97lGulVLn4IYD9kqNYX+21GwslfIv6N2j5HzTLFzFIdKg4o3jU2HrxYeFBGC/gqRmz70tnjDa1SVcjccZRivg6n36fS7/72AKf6/ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+sEbEAOZ0xUbUqEVNkH9nUz7C1wYUl37S4aVO34aB8Q=;
 b=XqdWciz34vEwxBFBRoxDKbo+WeJB8CAg0uhPx83dwTYTDPCqe5OLerupwEgHVhuMCWl7/gBUutzvIgplE6PsCDVCS2Ntf31rsZ1B1cpGlzL3dxbdqb1zJ70ZhhvfnaRndw6FwAnLrYQ1ws3ZSz/ANHH4/RD+EyE8cc/PXFN363EFpF38YMQ3+1SJz5+CVcNf0nEZIMlTE7Q3CajdYuOoFEl5x0AyYKIqG/3AWB4NWbjNe3NAVzCblZkK9LzuCKmBJvSfRT4iZBUpJCCT0E8rc77nidA0qCyT1faAnuzlV7DYJ5XaaAVj2LxL4HVODAFOcz4yQOYYXb9WFYGV4xkXwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+sEbEAOZ0xUbUqEVNkH9nUz7C1wYUl37S4aVO34aB8Q=;
 b=jMeQLF/DWBTXi3HuUSpIro/LoqnhWMPljUaIJYM8nx5DlPQ0UkN49fHSp3NsGSj32vCt53fnKORjTl6Pi9qWgr4WqNU2m3etTrCL6cgfGn/As7PM/Ld96mubTs2WXbC4SUBQ8sWnb9q/gLguq1AiimkVJCgTFNBc5H6+dzBVGY4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GVXPR04MB9926.eurprd04.prod.outlook.com (2603:10a6:150:11a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 14 May
 2025 13:24:12 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 13:24:12 +0000
Message-ID: <a5aa7ee4-1200-4b9d-8929-0f200e1737c9@cherry.de>
Date: Wed, 14 May 2025 15:24:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] arm64: dts: rockchip: add px30-cobra base dtsi and
 board variants
To: Heiko Stuebner <heiko@sntech.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20250514120906.2412588-1-heiko@sntech.de>
 <20250514120906.2412588-5-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250514120906.2412588-5-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::13) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GVXPR04MB9926:EE_
X-MS-Office365-Filtering-Correlation-Id: ff437a24-8392-48c0-e360-08dd92ea9d7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?by81V0ZGc0o4Um8wL0dJTnMrWURLNFBzVnl1bWV1OEhUbzY5WDF1d3RJQVVU?=
 =?utf-8?B?WnViVWVMNTl6Lyt2aVJKZVZac3Q5WnBJRHhFYWdNMDdQVDVBWFVEL3B5YkJz?=
 =?utf-8?B?dE40OVluSzVMS2lJcmZ6SkhQQVQwcFF5d3ZzSXZHMHZXdEJIRTRDZEMrZ2pY?=
 =?utf-8?B?Ri9kTDJibStldXg3K1c1aDRLU01zVHNVMngvYTQwN29ZSk50cS9xbEo5c08w?=
 =?utf-8?B?ZXpNeFROYVdLTjJpdzlJWTMyenloSU5maUxiaHBkMWJkb1JJTVEzUW42RGE3?=
 =?utf-8?B?T2k4WFhMYm5rcVBvc29LWkgyUVJHL2VTempMU1FmNUJMMFhmTGlsN1l5REZZ?=
 =?utf-8?B?RVlIakxTZldla2M4MzRPVDVxSzkxMXNndE5JbE55alJFYmIrcEZEZ0hOdDd2?=
 =?utf-8?B?bWhwZUJ1ajk4L1VZM0xuRW1IS1dabnppYysxczJMcnpXcmtkVG1SclVuMjRT?=
 =?utf-8?B?YUoyTTZzZEFURjhVUlVubkpWWGlWMkVRMGtsRFk1RXd4KytoSGQwZVNldnBO?=
 =?utf-8?B?bzEwQ1drOFF4OVZhY0wwUmRrUkJhQTB2bHBPQ2ZnQ3M2QVFJMzNMODJqdXdp?=
 =?utf-8?B?cm1Xb0dSRndCU1FiT1B1ZGZCd2xvRTdPakFEb2YvZUZlT3c5cC9OTzNIWG9j?=
 =?utf-8?B?cWREZ1pSdzYrWjB6OTcwd1hpQW4zZTJIRHBnR2owS1BoT2NacDNBSEFIYUZT?=
 =?utf-8?B?QXltNVJBdFFmY3U5VTM4N0MwK2JLa1QvSXVFZVhqLzVRZjhYUmZ0TmlaSEh2?=
 =?utf-8?B?d1ZFQnVTZ2JqNHpqc01yZGpEWTYrNVV1cG9iakdlU3QwM2t0ckFlaUg3cmVi?=
 =?utf-8?B?SkZxM3M1WU9pMG8zTkVSTU9ZZnJHY2tOUDlMVzFjV255UUh2SlZiendGV1Fi?=
 =?utf-8?B?K1IzK3grUHU5eGs0YTdpMDMxQWlvVEx2YkJOMk1vY2QxOHBCVzlRczc3d2Ja?=
 =?utf-8?B?Q2dMWUk4ZnhVRFNzL3hXY25PNkc4cHErZXhFdkpOUUd4eXY1cEdtZ3VNRUxY?=
 =?utf-8?B?eitwZnY2YUtmMjRwZDRlMENBVjVNR1NaSURxTGJ5KzV6YktaaHQ2cUxwbVdx?=
 =?utf-8?B?eFlDdkNMdGV5TXlMMDBSZDZUZjRHaVlQaXo1enUvQWdsbFFSVDIzV2M4cDZq?=
 =?utf-8?B?Y0NyemJIQWNIckcwbjJlMS9PdUsweUc4U2tjL0xBS0QvZjdkS3RyMnZENGpq?=
 =?utf-8?B?STg4eEkvb2VYWnR6ODZyc1dvY1RDUExTUlk5SitzQWFsY1BqUnhTR2ZrNC8v?=
 =?utf-8?B?ZEtaT1VQWWpDcmNyaTF0MUhvaWNIOGVQQUFhamF1a1JnbzdYcUdMSWpkRkpi?=
 =?utf-8?B?M2JUamFOY0Z3czcxTW95QnpkL1AyMkZ1Z3lGTXIyYkJDQWFEOUp1OG1la1pP?=
 =?utf-8?B?eWQyb3hxUnhPdHVseGhUZitkUXBXcnU4a1ROMWFXdG03SmQ2cnFmNTZhN0xS?=
 =?utf-8?B?cUlrZzF6RTJYKytUZld0bFlUYnNCV25KRGFIN2IzdStRZ0wzTFVLN0xHb2pY?=
 =?utf-8?B?VkNuV0JocUxLbDlhK3YxZWlNRTdRUDV1VFJJcGRxZFdSVkRaazB3aVVYSllN?=
 =?utf-8?B?YWpPS0dCcDNiM0tDL2FVSmVOd1kxTzdoNjNaVFVtVkRuMERlOWJ2NFFkWXFw?=
 =?utf-8?B?Zk8yaTJFdmNHSmMzMU5Ub1VCeDdmb0ZCRXNJQkgyYkd0VXlaNk56WHBhYjdY?=
 =?utf-8?B?UXk1QllQYjNmbmM5SkhCLzZ0bWVJMlJYdThCeVpZUUtDdStxa2Y4WGR4bzhY?=
 =?utf-8?B?bSszazJlOFFCcnh0dHk2enU5WFY0UWFDNFpGVmNMN0E3cHhGVEpuck5FdUJl?=
 =?utf-8?B?M0tscmUzaGt1QkNXMDhmUjhHMkRneElXeGxwQVZpbFZteVBIbDdjMU1KYlVQ?=
 =?utf-8?B?azBLRXRpREU5a1B5RHZFdHBnbU9yYXQ2QmxPaWxUd1NKQXgxRGdsdTZPbUdo?=
 =?utf-8?Q?i72wJ9Ex90c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0VDN1MwNVcyNTZmZjZmMkx0Z0tNMEJTUi8yQnBQWVJ3SWs0bFlLY0RUNnRj?=
 =?utf-8?B?cGJhbld4Nk5YZUk1Q3VRWWtzU0hvQ1Q0TDVQWTdyaUxQU0tEMXlSR3ZHeFBp?=
 =?utf-8?B?RzZEaVNkMk5nUGlQZGs3VGtoVmNyYlVBenZVTHBxZlRGS1A5U0QwbCt0MnFM?=
 =?utf-8?B?TFJQajdvTEF6VVdoTzN6Yi8vVllyMnpXOGxIQUJReGRzMmRZa1NLWjIyRHdo?=
 =?utf-8?B?ckZOL0JjRmN1bUVYUlZpVC9MQUtub0J5UjRNRWxzTlhSdUNkWkRhQlZXaHFJ?=
 =?utf-8?B?RXBmZWFSVVI5RVdYUE4yZFdMWGxHb2dVU3k5QThNTzkzSEw0YzlRSzdULzJk?=
 =?utf-8?B?WGM5L1RqY3pyYlBxUHJxSy9iMHR6YnF5WS94YnNTVnpabnhZcUlSb0lJSVpl?=
 =?utf-8?B?M0pIQjRpdUhFR1F6YlFoQWNJaXYvNEVYaE1aS01FbTRQcjlQWFVWUlF0dDJr?=
 =?utf-8?B?KzJHVVBZYUxreWZJTExtc0x2QkdMQ3lmOHRYOGloMjRTZ0J0bEcrL0xFZzNm?=
 =?utf-8?B?T2NVaFNZdnVhMXJTazB0TitNNUoyWWNOZXB2Skt3UGhkR05wY241dkVrdWpw?=
 =?utf-8?B?dlRGTUJDRHhiOHhJTitmcEMrUkZ0TFBpeW8vR2M1ZnFYdGE2Yy95V0dHbGxa?=
 =?utf-8?B?UUUxQmFPdXJWMnBBSFhNaEFpc01LakNZbW04NW9MK2ttZEo0UGFraHFqdGtN?=
 =?utf-8?B?eFgwZzFQeXZOOUluVHRaZGtJQkVibXdRNUxzak9hOGhjTXJZL2l2WWdlU0xu?=
 =?utf-8?B?SEVNb2lZRmMvU1VZWnRMdGRtMVJrSE5OT0lWeWt4eWZUM1FHaG8yOEpOTWlx?=
 =?utf-8?B?ZTltaU1JcU1VUVEwWUc1M2dlY21wVktPMnNWTFlINHlDU0VBMnFtbXVOblBT?=
 =?utf-8?B?SW5heHJ6TUU0YzF2QmkvRklvWUQ2TUxaNEsrL002ZjJjQk1EL1dudlFFK0NS?=
 =?utf-8?B?QVh2Mjg4S0pLa1RjUHR5SW1PeitkdlpHdStpaWk4ZkQ1WjJBdVdSakNTTC9k?=
 =?utf-8?B?OXV3MWthYldmclZjcy9KalJuYzZMLzJObVpqMGFYTUlNNWxYenBJOWo3RW5k?=
 =?utf-8?B?RmU0MjdxWDhvZ3JhcHBiT2pKVFBtRG1nZFF5NlU3RElWUDA2dG1OZkpmRVo2?=
 =?utf-8?B?ZGN3NDZDeVIwSjVQT1pDcm9vQWdUL1N5djk3b2dDekFlS3FLRGFTZ0Jnblcx?=
 =?utf-8?B?cmtiZldPQnRKckhVcWh1dEhxczZ1b0ZTQWVqVE04N1NkeUdjVHBJcTJveUU0?=
 =?utf-8?B?TmpEaEIvTUh2UHQ4OUNPeWhxT1ZUNkRTZ0J6L3Z3cEw2TjU2SkQzWENiQlBz?=
 =?utf-8?B?TWNzTmgyN0Z1dFZWVEZmSnUvNWpyZUxGYklXSHBLZG44YlJUT2lETjB1My82?=
 =?utf-8?B?eFpHKzUrejRoUHJJN29DTUtLMy9tejBXa3Y1R3ZYbk9ZQzFnZVYrMy8xQ01L?=
 =?utf-8?B?RjBtOE9WdmkxdlQ3czd6eUpORUw0YWlHQWZPNm5PaFBaQVhBZTVTZjlxMzZw?=
 =?utf-8?B?ZFpOS0Vod0h4Qmo2Rno1eDcyUEJNQ3N6c1V1TmFvMS8yTzBEb3Y1OEhCb2NT?=
 =?utf-8?B?empUdTgzZTl1SDdjNFh2STJaeXJpdHN4RXZ2b21SWjFvQ2Izc1NQODFJeEZD?=
 =?utf-8?B?c3JncmNDMmhFdW9GQyszZTk0VHhWVG9YWnR5UzlVNUg5YXJsKytrYUVDME5a?=
 =?utf-8?B?Vm9aY1RlWXJkc3dnM05YS3Y5NW12NVhzRmZHd2x1UDBGSG5LeUlBRFovZExB?=
 =?utf-8?B?WVo5TDlsU0tlNmg3MzVuaWNja05Kc2JhYmM0QmRCd2dSWnBmK1R0SVBxUjk2?=
 =?utf-8?B?NktqLzhqYTc2SGtCQ0E3TEFSQ0ZsNkd5djNQd0VaUEpCY1hhazF1Z1ViTFNM?=
 =?utf-8?B?dDNISEhoU0VTQzFVdDQvLytOMzg0d2JZaGt0SjBZUHI4UFdFR1NjYW1VWkc1?=
 =?utf-8?B?WEsxQVptcnZnL08vdzV1VjZTRmZ3cEUyN2RkV1pQbENFbTJJNHRHMks2NGps?=
 =?utf-8?B?SlhPQlBHcktIZFVJSkZTZURMaEtGYWlPZFBVNGx3MS9rU3VtRGxubDRvVEs2?=
 =?utf-8?B?TmFZR0pOL01GSUw0aVA3VUI0L1c3ZW5GbkpxWWJ1ak5NQ09OcUp1K1RWS3pw?=
 =?utf-8?B?aWxCdHkrV3dIK1k2dEVLS2U5UHN0bE1xUmNoeUVTZzd3UVpYLzRCSHR4bkhT?=
 =?utf-8?B?VHc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ff437a24-8392-48c0-e360-08dd92ea9d7e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 13:24:12.4154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t7bw4kK7ZLfq0/jEfhcFUFkwtEONe9CAIEOe5u+KKyOeTiT5vkGZkllkqQeuwfdwXMNxFD3l0ZDsVCFbkAXrEabmZe82G6VOS+Jfdtoj6SQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9926

Hi Heiko,

On 5/14/25 2:09 PM, Heiko Stuebner wrote:
[...]
> +&pinctrl {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&cobra_pin_hog>;
> +
> +	hog {
> +		cobra_pin_hog: cobra-pin-hog {
> +			rockchip,pins =
> +				/* USB_HUB2_RESET */
> +				<0 RK_PA5 RK_FUNC_GPIO &pcfg_output_high>,
> +				/* USB_HUB1_RESET */
> +				<0 RK_PB4 RK_FUNC_GPIO &pcfg_output_high>,
> +				/* The default pull-down can keep the IC in reset. */
> +				<3 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;

Small oopsie there, should end with a comma.

> +				/* USB-A 5V enable */
> +				<3 RK_PC0 RK_FUNC_GPIO &pcfg_output_high>,
> +				/* USB-A data enable */
> +				<3 RK_PD3 RK_FUNC_GPIO &pcfg_output_high>,

Small oopsie there, should end with a semi-colon.

Thanks Rob for the bot :)

Cheers,
Quentin
