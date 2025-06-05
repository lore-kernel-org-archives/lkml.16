Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010037.outbound.protection.outlook.com [52.101.84.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE2C566A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 09:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749114363; cv=fail; b=ueKZoFgtfDXSmf37mLV4+rqaxp1dam+a/rt6jYH5BtFDW39qIEVQ4pH2av+o6xHtWoreCMzqhGJFGduXmwlFj7A0dmYJBd3CaRt9M1KMNrW4uw0ESQryfs79IhvKVr0/Xg2cQOA8zEc7r94G6C4tL1e8qlqkXtnwqNZh1IYVaL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749114363; c=relaxed/simple;
	bh=wGoi1VhEKz0WFUkALuAQyeJCKDS22k0d/7xqQ7OC9WM=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dIqytnNHhG7qT1J9OFjpAnBQdHLGVYmh1yQUjVLrUtCAPFf+zldy2jWBrTxoGzt+xlDIjYihhbAbl519YnZC5tywtXcoYguPAeHO4dxN1tsJqgo+WLdJ3U2nX8jgCqCQ8191SBTQI6yghW/57YD1ZIFNVko0bLyTeUpeGyXdA1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=A260MWUT; arc=fail smtp.client-ip=52.101.84.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="A260MWUT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pfc8rnhBteURyP9JEgsXjPoWRP2mDwoVK0qr97eukednET5yFvNbOB5j7q9xQX3HvGUMoXxhq+TCSGNN3/vHXHE/lXZ2WXRu9Ua/S7AmwrrVG9BVXtzCioCsFVaeNRypZWvs7W5MfB77sPzIQtGgzKrxRKUg7JhcAClQt8n+gEbVSyqVaZd0dtIX+FYOif3FtVqR7u/QZc+Upra9QrEhJFrcdff8oS1oBubwIGX/pEXVQF4T4G8kxwCdJ9QGfmqjrrhXyo2Cgsb20xtHcI5S+nXSn0sd9lupBvWUQkRkiO+15PvpvqqSqMFm4fFFxRVQ8AyTX/eCtmM/VxfyqwuPTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cFRuxW7NTZN/2ZGZzfZnUksUEo1HJBgvdfJYe0Zqygg=;
 b=OIsrEQH68TCxycGz5ZO0cIh1DzlupGSHiVo1Rox06CQdKglmjq7ffBxK+ImiXyeovhdZGQak0gnwYVaipNByxGhKpWTXrVwQsgu0dk73aCm5Y5sldJq4oWHeZizxvybxAbvXj/C2dgXi2bDHS/zSTQLYgtzG0jv20SeyAD30E/E9+EK2Ez8NFLjeVa418XMhkkKSp66gTOnndEdMT8QTUEF+sKhiZsmZ6jy3ropDkRu81YmUtwfBagV1qLnziSjsvyJdCi62oAqBFIhzT5YRRbMWmA3TK9gdyU/PHB1iVtFMd1kR+m3zIwhD1LPOUo/YTHhdGyDKP6816ieQcI9yYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFRuxW7NTZN/2ZGZzfZnUksUEo1HJBgvdfJYe0Zqygg=;
 b=A260MWUThAS7G0YakwKgMo3s84TAIvjIBTtb2BIlcTQ00LvALmAp/HySeDWmudfVaSLLLVVzWMv3mPWKjzA7NDPR9CqOAYv1ky6fkn5ctl6yhZIw2lqZOlyOSE0OQBzlf5U0LSMCT99SQQe583qmE35e+Hm3UNXTeOE0pKz9EvE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI1PR04MB6910.eurprd04.prod.outlook.com (2603:10a6:803:135::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Thu, 5 Jun
 2025 09:05:54 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.8813.018; Thu, 5 Jun 2025
 09:05:54 +0000
Message-ID: <a0202e76-4931-4061-9915-5fae50d3abdf@cherry.de>
Date: Thu, 5 Jun 2025 11:05:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: add regulator-enable-ramp-delay to
 RK860-2/-3 regulators
From: Quentin Schulz <quentin.schulz@cherry.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: jonas@kwiboo.se, dsimic@manjaro.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250604202425.239924-1-heiko@sntech.de>
 <e4a1bf0a-0fc5-4c15-96dc-7e9c7ae3ccd5@cherry.de>
Content-Language: en-US
In-Reply-To: <e4a1bf0a-0fc5-4c15-96dc-7e9c7ae3ccd5@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0172.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::6) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI1PR04MB6910:EE_
X-MS-Office365-Filtering-Correlation-Id: 9620f638-3112-412f-0121-08dda4102d3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?anlsMnArNlhKdFJFL3RhaXR6RC9UL1d2N0ZLeWxHcUpERitaTTVMdW05bjdS?=
 =?utf-8?B?V2pmcWlKSzk5dEsyamlVTzNMa0NibU1rcTk1Sm5hV2p1Y1dKaXNTcmM4Z3hs?=
 =?utf-8?B?VStQVnNDQXNuTzh3ZGsrZGFYajljb2liSllnc3dmL1l6UjZ0K0lvcmUrYzlJ?=
 =?utf-8?B?WHhGeTJ6OXZieHBWbktQUmN2L0RrdHFQYlJxOGxrU0lKS1hXUVMzQktBL01W?=
 =?utf-8?B?dUhQUDR4b3Vydm5VTEphOW00Um5qcDlyZzNSV08xcHNLQkY3YXI1aVk3c0Mw?=
 =?utf-8?B?SFUzV0ZYc0VzbnNETjUzNUhqMzBUTEFkbW9tWCtvQVRCa2FUR0NITDlLZlZ3?=
 =?utf-8?B?T0o4VW1mdCtqOHh6SW8vNURtRGVUNkpOZ3ZkZkhvM1ZlQTVOdyt3QmR5b3NL?=
 =?utf-8?B?LzFXd0pCeVE1em8vNzRITmg3c0Z3ajg1Y3NwYnFpY05rT2xoNDQwRG5LcEZl?=
 =?utf-8?B?eFVZeFRLa2pSakFzOXNrYS9GWlFBY0ZxTm1FdUZ0ZHdhREZFbXE4Y0xJVjJZ?=
 =?utf-8?B?RFVVYVV2bTBuMFNGL3N3ZlBHRW5rM01GMXdOaStIWE10dnFYbjRpeXFYNG9B?=
 =?utf-8?B?TU5lYkNrY1VDNGlMdEtyalBnamhhTzRKOEl2UE0wdEJadEtmTkZiWVp3ZVN4?=
 =?utf-8?B?cHRqOGZxeW5wclE2Tk9EQlFvZlE2dnRQNGoxKytyekRhenJiQ0VQRFlnUzJU?=
 =?utf-8?B?Mm9ka21HUkZlL3VndkU3bEZiWlhQV3ljZTROcElmT05XSzk0THBEUHZYeEFv?=
 =?utf-8?B?L252WlZ2SXNlVEVJQTZpVGtsVlNJZTNsQ2JQU01JbS90MHRrcE8xcHIyT3Q5?=
 =?utf-8?B?L05lSFR6VUg3clM1WDBKcHIwWW9vQXBSa2F2U3ByTUtybUVYbUVKT3A0bFk3?=
 =?utf-8?B?VzhHR3FabVJrS0ZQbDRMM2pteEFCVG81Q1pYbURkY2hlWXIwQU5tU0lvdnRj?=
 =?utf-8?B?YTRNM0pMVkpSQ1hleGxCei9tUFVQdldCTnNaRjlJbFVvT1NZdWt0N0FYMW45?=
 =?utf-8?B?VDdQY1k3ZnNRMXFEVjh3S3VIc2R5Y0lIWFlqYk50UTYwRXZ1UEJlMWRvUkRC?=
 =?utf-8?B?RnJFNG0yaEZJWVNrVjZWa1dmYVBnWVUvL3BCWnhvUEZZL3gzamtXZllSMXI1?=
 =?utf-8?B?TUU0VDROYVB5dWFLd3dUMXdGTm1HeUZCVUE0bVZBSkVleWpJUVc2ajdXci9h?=
 =?utf-8?B?V0JTZGVlR2xkZTgrc0txWTVTN0U4MFloL2xoQ0Z1U0tlWENtZ3JpMDJEM1Nk?=
 =?utf-8?B?bzNmMkFxNkhVbHh6ai9IT2NnMjIrUFpRb2UyQVZuT000T2d5eFBOQS95ZTgx?=
 =?utf-8?B?cFNQVlgwTW9ISVJhWE1yNXpJWWFsYWI2L3FmYXZqaDhWdnR3VWpoTXhqNVlx?=
 =?utf-8?B?bkFpMzFJWUNkbXhzaU85eW9vUEsveld6R0k2dDhGY3Bac2gzY1RtbGUrQmhx?=
 =?utf-8?B?N1pZSG51V3lXWkxEK3BoUll2ZnV1QkJTbGZHZVlwZVdiWWtEd1liZ1dNT2h1?=
 =?utf-8?B?eVhOelZNUTVDWFFFNEpsMi8ySktvNEUveEZOemt6d09MSnpodmZTcytWVGxZ?=
 =?utf-8?B?TFRPdFNlOUVkTjlKd1dOT0FiQkYzVkxERUhrRElZMktmV2tOdS9sbnJ6R1E4?=
 =?utf-8?B?bEpqSSt5azhuWGtBRUFOZWJ5NDRGMGx6NlUyNmp6b01uYmU3d0RHM21SYWl3?=
 =?utf-8?B?T0h1VGxYM1h3Y21nNndBLzVlakpTK2dMZmZsNU44NlJQL1N3dTAxa3hQTG02?=
 =?utf-8?B?OUVUenJ5aVJ4V1RyZnJaejVpRVcvaEZOM245aDluVjlZV0VZdkVYNytOS1BC?=
 =?utf-8?B?RnBKN3JnWGw1Nms3Y2lFY2lEMUNMVTEwNDdQVDFTZENON0JyZW81NEJJOVpL?=
 =?utf-8?B?bmRyNzJyM3A1akEvVlovMWJzQXBLcDNNNVFKSW5jQmR4cjB0cEFYb3NHL2Q0?=
 =?utf-8?Q?s+PiPImdsTY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3VSRkJsaFlWR0ZmZ3dsYUtjc3BWVzV4SmtmbHRLbmVQdmVqVXVzUFdwUVZN?=
 =?utf-8?B?NXN4L3R4UlJaellKOWlRZ2Z4d3JaQ0I3VEIzdzYzQ3FUbXpqeHhFWnNVL0Yr?=
 =?utf-8?B?aE9OMTN4QTBxQ3dYMEpXZm42WkNFRWNYSUFGcW1sQ1Y4a1JHSEZlSUpYZ2R4?=
 =?utf-8?B?c0hWb0l4VHdwOFdMUFFuY2IxNHJzK3RxOWhOYUw0OXV0OFRNemVpT2orWXdP?=
 =?utf-8?B?TVN2L2x5Z3NJemFqRUZITCtVQy9YNzRaMUs2TjJUQURYOW43dGowS054UUM2?=
 =?utf-8?B?WjUwZSs1L0Y1UlE3VG1aN2JmaWlla2pTT01RTUMyUjVJQTJBRnI5MUFKRDEv?=
 =?utf-8?B?UXh5bE1aV1ZDT1R4aEMzNVk1bTB4bXQ2QnBSd29EMzNxQjF3eWNYT3BqNnRQ?=
 =?utf-8?B?TVV2UzZzQWViMDJsSVE2SUJ2eks4dlhNN05sbm9hbXJQdzREa0VtY1hpc3ZC?=
 =?utf-8?B?RmRQaXVyNWFjR2NiY0E5YkVHQWcxclFuRHAxMzJvakc4YllJSlhiemFDZkVz?=
 =?utf-8?B?ZnEvTC94TGJiY3E1SGF2NmNPdU16bTBiYzVFa2JzVmVreW9GQ2hHMitCKzND?=
 =?utf-8?B?L3g0MnZ3Yjhia3B1V3oza2xyQTJrbThEQzJPdk51T0xEck02ZFRRNEtKSDJI?=
 =?utf-8?B?R3IrWUhUYklxRE95MkQ5WUptOVl2UitZWkUvNW9XWWxCWU9nVklDeWl3bVpN?=
 =?utf-8?B?STcxcXMwQkU2dGp0amdQYUV6ZGltTVRRTHRTSUY2cVFPUTg1T0pRdzBITXpJ?=
 =?utf-8?B?b1I2VFRSL0xuMHFGY0FNQzZkTW0vZVpya2xDSEVpU0xEYUtQT3o0NU9TZ1VM?=
 =?utf-8?B?blFPZ0kzeVVNR3lZbFpuWklIdlkvVVkxK1pCeXdkb0hvZlMwTzhHQTc0U3BF?=
 =?utf-8?B?WGxtUTMwQTJieUt0bmNEME5QRWhrcVFvY0liZDd6TEdEYlhRTklPYUZaWHRK?=
 =?utf-8?B?VDRnMTl1Z1p3Y2IzQllSL2g1V1dRUTlZcktWak9WZXRTemhYdzlWa2NqK25H?=
 =?utf-8?B?dUxSL2hxV2QrOGc4Rnp4cDMyM0NhRGtVWXFWUFZvbVlHS3N6cDVRSzF3UXdD?=
 =?utf-8?B?bGFaMGk0ZkRBNmNCOE4rMTIvTXoya1RvTURMaHZzeVVGZWZIM1VKMzVDbjBN?=
 =?utf-8?B?TS9VN1BnK2E1ZVhZU0RUbWdlWWZZekY3S0NYQXp2bWNLQW4wcFYzRUxKOGxL?=
 =?utf-8?B?ZnpTcmdmVDd4ZUNCK01nNWJ0RzhXalc1VDZhTmQxMlV5S2VodFJRL0hGNlBW?=
 =?utf-8?B?Z0xqSmdiY05Pb21BcVJTM0dRdnpLdTI2VHlMeWYzdlgvRk1wT0hwOTVvdUpT?=
 =?utf-8?B?aU5XYVExTVBXcUdOcXI2WVNpY3dnVXEwKy9TNmk5NTFYZEYyeThkM1RXaHlT?=
 =?utf-8?B?RGQzMXpEVTloRTJ5WHpGa0JING91S0xjZWdlaTRENFR2VkhwQnRJc0hrTXA4?=
 =?utf-8?B?eWhIMkllR1pFdThGbGxpSkJmcklSekUyOEtoWXJ3S0pOMkx1VWwza2JNWWNs?=
 =?utf-8?B?UVI2M3VkL2oweDkxajhpQUVvSHVrU3F4YjBnZURjNit0Yk90elJlbUdHUDhS?=
 =?utf-8?B?WU1oZDZDNmc2VU0vQ01kZ0xnbm9EbGhZZzdkSk03Q0paMlhVRlVRdHhPT0c5?=
 =?utf-8?B?MVNuSFFqZmFXTzEyZllxaWN6L2c2cE41TUJvSzEyUjVmNzU1QVY4elZhUUdp?=
 =?utf-8?B?K2psbmY1ZHhYWjVOTmpxd01kOEJnaURPY3VPOUdDODFpczJjVThRWXc1SmMz?=
 =?utf-8?B?Q1NlL3NBWkd6N0UvTXZPWXpTZjk0WXNkSnJBOWVuSGxkc1c2cXFhWjRZRnBT?=
 =?utf-8?B?S1VrZzQwUUkxa0U5WFpUQlZab3hHbkhVWmN2V0V2QVoyRzEvTU44cSs5WjlU?=
 =?utf-8?B?cWMvcjI4OGN2alhtZjJkYllZdjRDbG1QMjZZMm9SWC9qUEd5emJOdXhNYnlh?=
 =?utf-8?B?QlA4UEVwblZoTERGbVd2UU83MXMwSUN5b1E4a1lDS2Q0QS9LR1ZqVFJYVkli?=
 =?utf-8?B?UmxZTHN3WHFhNFBkbnJlMkZVSEN3OHpZLzdoWWJsRHAxaHBiMzF3KzVVdEMr?=
 =?utf-8?B?ajhmSHlUcUkxc0RrYkJqbm5xNHYzYldhSGR0UjlPWjUvUHpHMGN2QUNLNkVa?=
 =?utf-8?B?SkhBK0tYbHVnTkl6NEtnRlBBN09EcTNrd21ZNEVoNm1ZMmlkV0g3Tm16dDZ5?=
 =?utf-8?B?MFE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9620f638-3112-412f-0121-08dda4102d3e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 09:05:54.5771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m+bnS1Q8U8y/w6Aab5xiAv9NMJTHFzJvE4kIyMQJ6gJD78X0Vvc80eBkoMCeCyta6Ve4fqzImuSDUHq17AxXYgObD29XZQyLAWapX0hc/2o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6910

On 6/5/25 10:57 AM, Quentin Schulz wrote:
> Hi Heiko,
> 
> On 6/4/25 10:24 PM, Heiko Stuebner wrote:
>> The RK860-2/-3 regulators are used on rk3588 boards to supply components
>> like the big cpu-clusters and npu individually.
>>
>> Most of these things will be, and in fact most regulator nodes right 
>> now are,
>> always-on - probably nobody has tried completely turning of the big 
>> clusters
>> for example.
>>
> 
> This is a bit of a confusing wording here. If most things will be (and 
> are) always-on, then the ramp-up typically shouldn't be an issue I 
> assume? I'm not too familiar with the regulator subsystem but I guess 
> for the first initial enable this could be an issue?
> 
>> This changed with the new NPU driver, which does combined runtime- 
>> suspends
>> with the regulator being tied to the power-domain (it supplies the pd).
>>
>> If the NPU runtime-suspends while running a load and then starts again
>> hangs can be observed with messages like
>>
>>    rockchip-pm-domain fd8d8000.power-management:power-controller: 
>> failed to set domain 'nputop' on, val=0
>>
>> Removing the regulator from the domain and instead setting it to 
>> always-on
>> "fixes" the issue, which suggests that the domain is trying to get 
>> current
>> from the regulator before it is ready when it gets turned back on.
>>
> 
> If I'm not mistaken, this is also misleading as nothing currently uses 
> that (NPU support not merged yet and most if not all NPU regulators 
> currently are always-on so typically not impacted by this issue).
> 
> I assume this will be an issue the moment we add support for suspending 
> the NPU regulator, which would anyway require modification of the 
> various DT. Is that correct?
> 
>> And in fact the datasheet for the regulator defines an "Internal soft- 
>> start
>> time". For a target output voltage of 1.0V the _typical_ time to reach at
>> least 92% of the output is given as 260uS.
>>
> 
> Indeed. Now looking at the existing Device Trees, it seems some set the 
> ramp-up delay already, but to 2300 and not 500 like suggested here. 
> Maybe it'd be safer to go for 2300 by default then? This could also be 
> the typical "this Device Tree got merged, we use the same node, so we 
> simply copy it" case and not really backed by anything (though I would 
> hope the Toybrick and Rockchip evaluation boards values are based on 
> *something* since Rockchip would (could) have done measurements for 
> those?).
> 

I have been told by you in private that I mixed 
regulator-enable-ramp-delay and regulator-ramp-delay for that, so just 
acknowledging it publicly :) You can ignore the above paragraph :)

>> So that value is dependent on the target voltage (up to 1.5V for the 
>> type)
>> and also the rest of the board design.
>>
>> So add a regulator-enable-ramp-delay to all rk860-2/-3 nodes we have in
> 
> Maybe mention that there's currently no rk8601 node upstream, and the 
> only rk8600 (arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3.dtsi) 

Based on the above revelation, we should add this enable-ramp-delay to 
that DT too I believe.

> already has a ramp-up delay configured. Otherwise reading this I'm 
> wondering why the rk860-0 and rk860-1 while being handled by the same 
> datasheet are implicitly excluded from this change.
> 
>> mainline right now. I've chosen 500uS to be on the safe side, as
>> 260uS is the "typical" value for 1.0V and sadly no max value is given
>> in the datasheet.
>>
> 
> Reading the rk808 regulator driver... maybe we should also set the 
> typical delay as default in the fan53555.c driver? See rk805_reg which 
> sets the enable_time for some (typically the LDO with 400 and the DCDC 
> at 0). I assume those can be overridden from the DT anyway, but at least 
> we would have some decently safe defaults?
> 
> If we do not do this, then we should probably force the presence of 
> regulator-ramp-delay property for the rk860x DT binding so we don't 
> forget for future Device Trees?
> 

Read regulator-enable-ramp-delay here instead but still applicable.

Quentin
