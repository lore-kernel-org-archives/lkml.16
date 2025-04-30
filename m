Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011022.outbound.protection.outlook.com [40.107.130.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A8519F12A;
	Wed, 30 Apr 2025 08:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746002361; cv=fail; b=TdemMGT527Ep3Nv9kVFDgSiZwHGjWZgDHzEXKZtVrAc2DaolNPpGLEvEKuqFUiWdn+VDTd/S4qZp2KMlv9YzVUosVNBDLgWKMKgta2afuefNJC/ZS1bHmN636aDqQM+hZhiGolSmUxRuYZKEraSyLSyn3zcJpxuS0TiEwdyMTOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746002361; c=relaxed/simple;
	bh=jo8QW6NcOZ9ZcixRxIlUyDRA4XkJORPZ3xNsJxrac9c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eFDgl/KrNCh+EhlrKGHeHhhlxXvqinexCH1kY7QUtu/5I0wmY+NrEMyv3I27tGa/l+8/aLL4Wl7LtZGsIdvCOM2y8NdIXyZqRk2qIvP5/IiXrKd8s+5L5zLo3OkVhl7zb/PYTmlqtfnJxhuia9xPZH8ZWLlmHKUwAYVDmBYT+l0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=XSghEL7K; arc=fail smtp.client-ip=40.107.130.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="XSghEL7K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uWaYG4SExK6oReLRuNgbUMI3F1RTugI5OwZ4hvJs0sFn9lb/VrezvYMEfFejx1NFOu9kRTuuS8SDMR2u+ziuCAn7UVByaFZQFnBCz5jIeNCUqBB/eh0/G3j6+kja6XAWqZEyY45j4BJ0RiAR5yzDjIqu0zDW4rvKQ/wBFVBrRUAK/A8Y+1En+eU/GfhcRTF+PDb1mLhW8n2TW6V2JIMGkvjPxTx+X91t8ldEzXg/ctXduTonNWPS8Yp3D3XnykpFlauFBCqOYEpTZBjBIz000FbjDtmUMml6f2g9ohyCaCQzmvw5I9dLTtemx41rYDU7VzyXi9KaZuxdO8B58x4LVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0NksyC24933ZqzHGbrZUdaKIhylr3iNaKWWtZyli3x4=;
 b=pAdM/tlf8sHb3d/6l60wG0OR+esYuEQB7Eh75IenaFoMIWsAIWgpSJMeT+Nc3oHknfUUd+Q1/aPTtB2vrlzk6rwS7w3bGqZ+JGkB7T8AM7TgvPOMgVG8eYE4Qq1bcm45S+OOC/fwgh6UER5anUMKHRiU/gQTeKA4/5dktFJCglK22Zc2PfdxvznTTkh4tOs5lwQ91XN9ZZWABaEvD+jGKfdPHrGgm3BNBYyubhlzLGAyWW0e+XuessaU6Vc31L4G2LJvph+09HZVBFl0Kwb0w5LPF9nn73vkz9S6bTDUX6twjBF2TCaqYuBfWOlEdcl5UM5l0r+aCGYcvNZUSZXECA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0NksyC24933ZqzHGbrZUdaKIhylr3iNaKWWtZyli3x4=;
 b=XSghEL7Kj+CBqYNe/bVQRl6EaIE7EfswgMjgX4B6j5CARCXEH33c0M8bvK4v4Ft35nVajs4KE9otDZuYLFGyh5p6J6uRgXMvEUytyh86bG6hVVVgzXPRgAqlOqLk97wYpE0P64SlU+I6RYRUdtaP6udyvqr5mLEvrVcZlCbwFrQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI1PR04MB7023.eurprd04.prod.outlook.com (2603:10a6:800:12f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Wed, 30 Apr
 2025 08:39:11 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.8699.019; Wed, 30 Apr 2025
 08:39:10 +0000
Message-ID: <31f5c9dc-d6cc-4fca-82ad-7be0da62d10c@cherry.de>
Date: Wed, 30 Apr 2025 10:39:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Add rk3399-evb-ind board
To: Chaoyi Chen <kernel@airkyi.com>, Heiko Stuebner <heiko@sntech.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Kever Yang <kever.yang@rock-chips.com>,
 Jianfeng Liu <liujianfeng1994@gmail.com>, Dragan Simic <dsimic@manjaro.org>,
 Jimmy Hon <honyuenkwun@gmail.com>, FUKAUMI Naoki <naoki@radxa.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Alexey Charkov <alchark@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250430074848.539-1-kernel@airkyi.com>
 <20250430074848.539-3-kernel@airkyi.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250430074848.539-3-kernel@airkyi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0195.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::6) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI1PR04MB7023:EE_
X-MS-Office365-Filtering-Correlation-Id: 46710fe4-34f2-494e-14e7-08dd87c27a86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V2NHZWljeGh1bURTRzB0SjJTM2hJOU02Z0E5Nk1Ra3JNOTRIZWgrMk5UVjIy?=
 =?utf-8?B?M2UzWUlGZHFaK1VaUmMxejdEbzZTbUNxMWFKRHZzOUNNVkpXckVycVJHUXlM?=
 =?utf-8?B?ZEJyUXlGUldpM1JlOUVNVm4vTE9leUROY2l4UWhJNHpWNHNtWjJudFJqNUc5?=
 =?utf-8?B?QXNxWTdpeHpVVXRQWEFvdGxYUmpEZys1MjRHTDVuUTBzUWdmbXowVVBhZjhs?=
 =?utf-8?B?OGNXZGY2OU9WVmU0REF2M01JU0t1TGJnZmxjc2Z5R2xXbzBhMWlsQmd1ZVBM?=
 =?utf-8?B?MHovS3dHY0tFOTM3S2Vrc1NxdmRjK3FPZk5qSnpMNXVKVDlvYUUzZytFZjhY?=
 =?utf-8?B?RURicTEzbGlvM1l1bTVjTHIvMlYzSENtQ2ltOUNVU2NPTTN0dlZYdGZ3czly?=
 =?utf-8?B?T244aWQ2RXh4bW1YZXErdE1ldG5jWTFDemZZTmVJZWpiVWRnUEJTYWlPZ1Q4?=
 =?utf-8?B?blM3T0ZCK1F1UU5NcVZVZVUrVUI2MDZhZ1hWUHZYc0pWRUVZeTNHYXlxWVNu?=
 =?utf-8?B?WkdmRXBYRjJrTlppZjQ0ZktlZU9UNHVSMnp5YzBVMnJDamJKVWxIQi93MDh6?=
 =?utf-8?B?YjZlb2RjdG5xc1pxQTg4VWFyeXZzUXVDN0VpbmZYSVlNRjh5RGZmQlNHMjlC?=
 =?utf-8?B?bTBJQ2tHaFRVUllYb0hTRnVTZHNaRXdJR0dCK3BnK3pNeHVEakxxWmVCb1Z5?=
 =?utf-8?B?TGw0RWlqVXVNY21iaGsrUmtJKzNONkw1S3RNT3l4bzdyME9kb3l1YlVOUFpU?=
 =?utf-8?B?YlJEYmMwTTJtRWJLU0F5TXRWWGNpYnBMZlU4bDhSMW9iRVdDL0F2RjdpTGhO?=
 =?utf-8?B?OXB5Zi9iVjF1YXZ4bUJUUldWWTNHNWJQOHA4Z1VScGtXZjE1cDVocm1XOFdp?=
 =?utf-8?B?WXV1REEydnljditWeDBhNmQxZ0hRMlZHK0dOTDhmOEM0WXRQazJ6M0I3R2lX?=
 =?utf-8?B?bk1iSHBkNDVMV3VWM205eHRETDZOeHpqUjBqbnJDWVhDZ280L3FjVDhTdXhK?=
 =?utf-8?B?K2FYSW5GckFtNjJGbkFJclloRSsrcEZYdVNFU1ltTnVIUThBRXlHQjZzT0cx?=
 =?utf-8?B?V3hBeVlDWWhyN1JyYmg4cXE0VGxTY21KS0krWU43WGlvbkwrZUdQQk43Qk9p?=
 =?utf-8?B?QTRXRHFuQUhxeERxWW5sSVJwZms3WFczS3RuQ25zMmUzNFhrazJmRE9ZU1hs?=
 =?utf-8?B?ZVVyYm1FeHUvRlhnTFZwQUd0dDJGZjZKVmNSQ0lRU0w4VW90TWxIOGZPSjVs?=
 =?utf-8?B?Y01BK0p6c0tRV0x4RkNkK0I5U0Rpa3ZuMkM1d1NRVjJoVXorbm85VHFpK2Ir?=
 =?utf-8?B?RVAwOG9zbzk0UzZFRFFRck83dzZGNHpLVTRrTFB4ZTlWTDl0ekw3cmk3QnE1?=
 =?utf-8?B?UlRGLzZ5MTRJaUk3QXJGRjhxbklaTnV0YTdRbDR3cWRpa1pMcEtMVExZd2Nx?=
 =?utf-8?B?b2pqanpHN015Sm9ZWFU1KzZlMGlTNkVQWnhaWm5kdCtFdHRWRFo2LzBVQmhn?=
 =?utf-8?B?QnBwd3BtaW96cHRsN3k2T2VPem9EQnh4S2pDTjhHWTZaYWEwdEdrSE9aZHJQ?=
 =?utf-8?B?VU9xNzE2U2ZCbU1aQmlwcUtkUDU1d1BzZGdXME1jRTQrMDJBWGdqaUNzQ3B2?=
 =?utf-8?B?a0ZGTFdpekVTdnQ1TlBTQmRtOTkzWmlpT2RRelZmb1VMWEU1S2UxcTl6M2Rn?=
 =?utf-8?B?VjZuNEZySmJ5cHRncVRNbEtVQUM3YjlsWjh0ZCs1anpUaXBoRk5FUzl5SHhP?=
 =?utf-8?B?bVhoTXZjTFNNR2JXV0x6UmhvUnFNU0YzYm1GVkdna1l4c0s0SzRmS3RJR0tP?=
 =?utf-8?B?eTd6V3NDbEN3VDR0OHUzVDRKdGY5dGxYTndwdGMyZ1Foc3ltU3ZuN2dEUFM2?=
 =?utf-8?B?YkExam5aMDBPU0FyMitOSmw1NTd4YWVUdVlJM0VZSGFsZDVGbnVjOWp6RDRM?=
 =?utf-8?Q?gWEGofc2AfE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFRQblpqd1R2d3pMTForZ1MyaUFvSG5Ndmcvc2JRRDdkN1hpbGJ2NEJLcXBG?=
 =?utf-8?B?UWZjSE5kNEFuMDVoNmF3WFFzaVRPc1MraC9vQUNsSjdLbHkwa1FFZitGdWI0?=
 =?utf-8?B?amlXVCtoeVlmdnhrbXV6WFZLTUV3NEJlMGhqL0Y5NkxTbzE5amVBSkZneUc3?=
 =?utf-8?B?R2UrNVBUUU1kUEZnRWdNMWtjZkdZNEVmQzdrNE1zaWpESDV1WkNUMTNyK0Iy?=
 =?utf-8?B?dkdsVTl5MDJ4MTI5SEhuRk50LzVvTU41UzgzbDhML3c2VzZGeG1mUFFZOEt6?=
 =?utf-8?B?OXlDYlNLOVRuRHYwcmFXeWNZMTF2VHFPRFhQM3dWODZaWjdkd0FxWkZDYUZr?=
 =?utf-8?B?Zm52TXlHTkpYUzdiTXdoTmtEVWdGYlF5bWczaThzNzRFM21ZZ3NSZFV5blEr?=
 =?utf-8?B?Q0tSU3grVjA3bTlWaHlzNWFLbGVLcXhRWGxYTnNzVmFnTS9HZ2JhaHVXTXE5?=
 =?utf-8?B?Z1dNOFRSdTlBTnNsTHhZZTZjdkU5Rm8rSnRsdlZFeDhxMHUyVitiSFM1V1ov?=
 =?utf-8?B?NmpNVGFnNnphdnRwQjVJdERNTVF0Q04zVmc1ZUxtV3RCMERRUk94endmMGpn?=
 =?utf-8?B?dENkVjI0VU0raTF2RnpwL2FvZDlTMWlLR0JXazI0V0VqL0pYUlRCbEs1M0dK?=
 =?utf-8?B?S2JLVGxCeUZaWm5qY0dMSHhUY3VaZ0lGYy9UK0EvMlB1Q2JrSFN6RDdaQjZN?=
 =?utf-8?B?NjI1LzBpeEtxR2UzbEZTZzlNMHZhdHJaVTl5UVIxcVNrQ01kOFNIQm1WSktn?=
 =?utf-8?B?RnY2VEdJOVFxZzRuc3VWZ0J4eGY2dVVlZDBUNHpWNndsanBpK2xCVVN6OXpp?=
 =?utf-8?B?T3dZdGplTzlkSlJzS2k4a216TjV5c0o5YUVPZlQ0NDVaR2FuekhEeEdZVDFU?=
 =?utf-8?B?djJwaU5OUVlndmRWYWFyRGlBTkVsbVNSaXIweFNwcVlvVE9odS9DY3pNdmVZ?=
 =?utf-8?B?SUpPaERLb01ZQUhCbUVORXFuZWg3UXU1YWVlYXpuVk5WY2p4MG8yVmR1Y0gz?=
 =?utf-8?B?bVJOYUFkTkpaVURCYVZyUXV6YjQrd0FFSnpzRk1scDU5SnJFVUM2eXhhRnha?=
 =?utf-8?B?R3d1aWRMcGFOSlJYRHRvekd4blJKdlhsVG9rZy9KNXRPSldlZHZIbEhxeXc3?=
 =?utf-8?B?aW95anZ4RVRvUkw4V2EyaXpUaktuM1RuNG9TNTI0ZW84aURDVjZwMkRnUTdQ?=
 =?utf-8?B?V2wyNmFZQjhVZ1Iwa0lKMTlxYVRUdXZma2VPSUpYTS9WeDJKKy9CUjFYcFhU?=
 =?utf-8?B?d0k5dEtOM2hjMGhzMXFyVVJNQUw5ZDRxV0E5U1VQWTYvRnNzMTQ1aTZFaXdj?=
 =?utf-8?B?SnV1b0prSmJGb1ltampxeks3eUFZQ09RbjU1RzhVUDdLdWRsVFIwY294UmFD?=
 =?utf-8?B?Q0tLRFYxYU9KV0dHbXJIem1JQkdDNEZRQk4wTUdxdGlkSHFyendVR1R1enVz?=
 =?utf-8?B?ZEpXRGFNQ2Q3Mk5XTVlFOERZM0dYZEI4aEo2TXVkZFZXZ09ITzRqR1RPQTFY?=
 =?utf-8?B?SHAxdTBmMDF1bVg3cVZBUWxjNkIzeWRWQk12alp3VTNzancyNnZaMUgxWFAr?=
 =?utf-8?B?Vkcvb3hNSGUrNU9WWGJxY0VRS1ZXSXJydGgxUXEzWWh4U0ZPVXZQWVdOYUov?=
 =?utf-8?B?U3h3dTY5Y0JCOU9mVmpMcXY5emtYRTRRbkZGRmJyTUZ3dUY4bUJ6Rll3QlM0?=
 =?utf-8?B?U3dDZzlBWGlxRENndG9LK0pqVER0eDNvYkxhQngwb29GNWpmb1ZmenZRalUz?=
 =?utf-8?B?UjZ1WnpZSi9pd0FCVXVDdGNZY25kc1F2eEN2czJNcDhkSDYzeDVMMktCS0xX?=
 =?utf-8?B?c1BWUU5iRm83aFE3NUdOOFlJejB2dFRKL3hxZ2JNLy9LUmZucnVYQ2w5Vk9Y?=
 =?utf-8?B?d1NvMnhnZCtjMms0YnkwV2U3Mm0xdDc5bWFnOGllbTB1cGljQ2F1NmlwKzZB?=
 =?utf-8?B?QzFLdUNOcDZ6Z2VOZ2VVaWdjUzlOWGs2UCtqcTZvYUxmOE1BbkM2NTVObUhQ?=
 =?utf-8?B?UEYrNk95aDR0ODIyYXdhcmZ5TkpxaGxDd1RRdVpFbHc2czgyVUhUUytYL3Ni?=
 =?utf-8?B?L3gzdnVvaW1mMk96MFN3ZTBGc3I0L25YeXpURVF6YmF1Nzd2NlpjWDVQdWpn?=
 =?utf-8?B?Tk9QK2xueFdsblkrMEV1SDk2LzJLcFlkT0NXM21FL0xXTFNWRnpCNksvSUNo?=
 =?utf-8?B?V0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 46710fe4-34f2-494e-14e7-08dd87c27a86
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 08:39:10.7778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WNEu3rWv0UI8+Gs5wweHMBD6GOMwpyfEUFASiCFJILUyMwJxD6GgzpSKhMmuTSYcIuYv77ZtL9vFnscs4w6wtzPGtot6JC3MIWaOcb6112A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7023

Hi Chaoyi Chen,

On 4/30/25 9:48 AM, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> General feature for rk3399 industry evaluation board:
> - Rockchip RK3399

Quick question, is this really an RK3399 or rather an RK3399K (the 
industrial grade)? If it's a K variant, then we need a new rk3399-k.dtsi 
with the appropriate OPPs and include that instead.

> - 4GB LPDDR4
> - emmc5.1
> - SDIO3.0 compatible TF card
> - 1x HDMI2.0a TX
> - 1x HDMI1.4b RX with TC358749XBG HDMI to MIPI CSI2 bridge chip
> - 1x type-c DisplayPort
> - 3x USB3.0 Host
> - 1x USB2.0 Host
> - 1x Ethernet / USB3.0 to Ethernet
> 
> Tested with HDMI/GPU/USB2.0/USB3.0/TF card/emmc.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
> 
> Changes in v2:
> - Remove gmac
> - Add rk809 PMIC
> - Add CPU supply
> - Fix io-domain for sdmmc
> - Enable vopl
> 
>   arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>   .../boot/dts/rockchip/rk3399-evb-ind.dts      | 466 ++++++++++++++++++
>   2 files changed, 467 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts
> 
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
> index 3e8771ef69ba..8a3adb7482ca 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -40,6 +40,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3368-px5-evb.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3368-r88.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-eaidk-610.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-evb.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-evb-ind.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-ficus.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-firefly.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-gru-bob.dtb
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts b/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts
> new file mode 100644
> index 000000000000..ebfe7e56b3f5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts
> @@ -0,0 +1,466 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2025 Rockchip Electronics Co., Ltd.
> + */
> +
> +/dts-v1/;
> +#include "rk3399-base.dtsi"
> +

You're supposed to include one device tree include with OPPs. I see that 
the rk3399-evb is the only one that does that.

According to 296602b8e5f7 ("arm64: dts: rockchip: Move RK3399 OPPs to 
dtsi files for SoC variants"), this was done because:

     The only exception to the "include only a SoC variant dtsi" is found in
     rk3399-evb.dts, which includes rk3399-base.dtsi instead of rk3399.dtsi.
     This is intentional, because this board dts file doesn't enable the 
TSADC,
     so including rk3399.dtsi would enable the SoC to go into higher 
OPPs with
     no thermal throttling in place.  Let's hope that people interested 
in this
     board will fix this in the future.

Soooo, maybe you could fix that now? At the very least for the 
industrial variant (but it would also be most welcomed for the "normal" 
EVB).

> +/ {
> +	model = "Rockchip RK3399 EVB IND LPDDR4 Board";
> +	compatible = "rockchip,rk3399-evb-ind", "rockchip,rk3399";
> +
> +	aliases {
> +		ethernet0 = &gmac;

Considering gmac is gone from the DT, maybe you want to have that one in 
the patch that will add Ethernet support?

> +		mmc0 = &sdhci;
> +		mmc1 = &sdmmc;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial2:1500000n8";
> +	};
> +
> +	vcc5v0_sys: regulator-vcc5v0-sys {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		gpio = <&gpio4 RK_PD2 GPIO_ACTIVE_HIGH>;
> +		regulator-name = "vcc5v0_sys";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-min-microvolt = <5000000>;
> +	};
> +};
> +
> +&cpu_l0 {
> +	cpu-supply = <&vdd_cpu_l>;
> +};
> +
> +&cpu_l1 {
> +	cpu-supply = <&vdd_cpu_l>;
> +};
> +
> +&cpu_l2 {
> +	cpu-supply = <&vdd_cpu_l>;
> +};
> +
> +&cpu_l3 {
> +	cpu-supply = <&vdd_cpu_l>;
> +};
> +
> +&cpu_b0 {
> +	cpu-supply = <&vdd_cpu_b>;
> +};
> +
> +&cpu_b1 {
> +	cpu-supply = <&vdd_cpu_b>;
> +};
> +

Please order the nodes alphabetically, so cpu_bX before cpu_lX. See 
https://www.kernel.org/doc/html/latest/devicetree/bindings/dts-coding-style.html

> +&emmc_phy {
> +	status = "okay";
> +};
> +
> +&gpu {
> +	mali-supply = <&vdd_gpu>;
> +	status = "okay";
> +};
> +
> +&hdmi {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&hdmi_i2c_xfer>, <&hdmi_cec>;
> +	status = "okay";
> +};
> +
> +&hdmi_sound {
> +	status = "okay";
> +};
> +

hdmi_sound requires i2s2 controller to be enabled too, but I don't see 
it in this device tree?

> +&i2c0 {
> +	clock-frequency = <400000>;
> +	i2c-scl-falling-time-ns = <4>;
> +	i2c-scl-rising-time-ns = <168>;
> +	status = "okay";
> +
> +	rk809: pmic@20 {
> +		compatible = "rockchip,rk809";
> +		reg = <0x20>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <RK_PC5 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pmic_int_l>;
> +		rockchip,system-power-controller;
> +		#clock-cells = <1>;
> +		pmic-reset-func = <0>;
> +		wakeup-source;
> +		clock-output-names = "xin32k", "rk808-clkout2";
> +

Please order properties correctly, see 
https://www.kernel.org/doc/html/latest/devicetree/bindings/dts-coding-style.html

> +		vcc1-supply = <&vcc5v0_sys>;
> +		vcc2-supply = <&vcc5v0_sys>;
> +		vcc3-supply = <&vcc5v0_sys>;
> +		vcc4-supply = <&vcc5v0_sys>;
> +		vcc5-supply = <&vcc_buck5>;
> +		vcc6-supply = <&vcc_buck5>;
> +		vcc7-supply = <&vcc5v0_sys>;
> +		vcc8-supply = <&vcc3v3_sys>;
> +		vcc9-supply = <&vcc5v0_sys>;
> +
> +		regulators {
> +			vdd_center: DCDC_REG1 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-initial-mode = <0x2>;
> +				regulator-max-microvolt = <1350000>;
> +				regulator-min-microvolt = <750000>;
> +				regulator-ramp-delay = <6001>;
> +				regulator-name = "vdd_center";

Missing blank line between last property and first child node, see 
https://www.kernel.org/doc/html/latest/devicetree/bindings/dts-coding-style.html. 
Same remark for all other regulators.

> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vdd_cpu_l: DCDC_REG2 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-initial-mode = <0x2>;
> +				regulator-max-microvolt = <1350000>;
> +				regulator-min-microvolt = <750000>;
> +				regulator-ramp-delay = <6001>;
> +				regulator-name = "vdd_cpu_l";
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vcc_ddr: DCDC_REG3 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-initial-mode = <0x2>;
> +				regulator-name = "vcc_ddr";
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +				};
> +			};
> +
> +			vcc3v3_sys: DCDC_REG4 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-initial-mode = <0x2>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-min-microvolt = <3300000>;
> +				regulator-name = "vcc3v3_sys";
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <3300000>;
> +				};
> +			};
> +
> +			vcc_buck5: DCDC_REG5 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <2200000>;
> +				regulator-min-microvolt = <2200000>;
> +				regulator-name = "vcc_buck5";
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <2200000>;
> +				};
> +			};
> +
> +			vcca_0v9: LDO_REG1 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <900000>;
> +				regulator-min-microvolt = <900000>;
> +				regulator-name = "vcca_0v9";
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vcc_1v8: LDO_REG2 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-name = "vcc_1v8";
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <1800000>;
> +				};
> +			};
> +
> +			vcc0v9_soc: LDO_REG3 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <900000>;
> +				regulator-min-microvolt = <900000>;
> +				regulator-name = "vcc0v9_soc";
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <900000>;
> +				};
> +			};
> +
> +			vcca_1v8: LDO_REG4 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-name = "vcca_1v8";
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vdd1v5_dvp: LDO_REG5 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <1500000>;
> +				regulator-min-microvolt = <1500000>;
> +				regulator-name = "vdd1v5_dvp";
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vcc_1v5: LDO_REG6 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <1500000>;
> +				regulator-min-microvolt = <1500000>;
> +				regulator-name = "vcc_1v5";
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vcc_3v0: LDO_REG7 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <3000000>;
> +				regulator-min-microvolt = <3000000>;
> +				regulator-name = "vcc_3v0";
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vccio_sd: LDO_REG8 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-name = "vccio_sd";
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vcc_sd: LDO_REG9 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-min-microvolt = <3300000>;
> +				regulator-name = "vcc_sd";
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +
> +			vcc5v0_usb: SWITCH_REG1 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-name = "vcc5v0_usb";
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +				};
> +			};
> +
> +			vccio_3v3: SWITCH_REG2 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-name = "vccio_3v3";
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +		};
> +	};
> +
> +	vdd_cpu_b: tcs4525@1c {

Please set the node name to regulator@1c.

> +		compatible = "tcs,tcs4525";
> +		reg = <0x1c>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&vsel1_gpio>;
> +		fcs,suspend-voltage-selector = <1>;
> +		vin-supply = <&vcc5v0_sys>;
> +		vsel-gpios = <&gpio1 RK_PC1 GPIO_ACTIVE_HIGH>;
> +		regulator-compatible = "fan53555-reg";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-initial-state = <3>;
> +		regulator-max-microvolt = <1500000>;
> +		regulator-min-microvolt = <712500>;
> +		regulator-name = "vdd_cpu_b";
> +		regulator-ramp-delay = <1000>;
> +		regulator-state-mem {
> +			regulator-off-in-suspend;
> +		};

Properties order and blank line before child node, see 
https://www.kernel.org/doc/html/latest/devicetree/bindings/dts-coding-style.html

> +	};
> +
> +	vdd_gpu: tcs4526@10 {

Please set node name to regulator@10.

Please order child nodes in busses based on their address, i.e.:

vdd_gpu
vdd_cpu_b
rk809

in this case.


> +		compatible = "tcs,tcs4525";
> +		reg = <0x10>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&vsel2_gpio>;
> +		fcs,suspend-voltage-selector = <1>;
> +		vin-supply = <&vcc5v0_sys>;
> +		vsel-gpios = <&gpio1 RK_PB6 GPIO_ACTIVE_HIGH>;
> +		regulator-compatible = "fan53555-reg";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-initial-state = <3>;
> +		regulator-max-microvolt = <1500000>;
> +		regulator-min-microvolt = <712500>;
> +		regulator-name = "vdd_gpu";
> +		regulator-ramp-delay = <1000>;
> +		regulator-state-mem {
> +			regulator-off-in-suspend;
> +		};

Properties order and blank line before child node, see 
https://www.kernel.org/doc/html/latest/devicetree/bindings/dts-coding-style.html

> +	};
> +};
> +
> +&io_domains {
> +	audio-supply = <&vcca_1v8>;
> +	bt656-supply = <&vcc_3v0>;
> +	gpio1830-supply = <&vcc_3v0>;
> +	sdmmc-supply = <&vccio_sd>;
> +	status = "okay";
> +};

What about pmu_io_domains too?

> +
> +&sdmmc {
> +	bus-width = <4>;
> +	cap-mmc-highspeed;
> +	cap-sd-highspeed;
> +	disable-wp;
> +	no-sdio;
> +	no-mmc;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&sdmmc_clk &sdmmc_cmd &sdmmc_bus4>;
> +	sd-uhs-sdr104;
> +	vmmc-supply = <&vcc_sd>;
> +	vqmmc-supply = <&vccio_sd>;
> +	status = "okay";
> +};
> +
> +&sdhci {

This should be before sdmmc

> +	bus-width = <8>;
> +	keep-power-in-suspend;
> +	mmc-hs400-1_8v;
> +	mmc-hs400-enhanced-strobe;
> +	no-sdio;
> +	no-sd;
> +	non-removable;
> +	status = "okay";
> +};
> +
> +&tcphy0 {
> +	status = "okay";
> +};
> +
> +&tcphy1 {
> +	status = "okay";
> +};
> +

What about tsadc?

> +&u2phy0 {
> +	status = "okay";
> +};
> +
> +&u2phy0_host {
> +	status = "okay";
> +};
> +
> +&u2phy0_otg {
> +	status = "okay";
> +};
> +
> +&u2phy1 {
> +	status = "okay";
> +};
> +
> +&u2phy1_host {
> +	status = "okay";
> +};
> +
> +&u2phy1_otg {
> +	status = "okay";
> +};
> +
> +&uart2 {
> +	status = "okay";
> +};
> +
> +&usbdrd_dwc3_0 {
> +	status = "okay";
> +};
> +
> +&usbdrd3_0 {
> +	status = "okay";
> +};
> +
> +&usbdrd3_1 {
> +	status = "okay";
> +};
> +
> +&usbdrd_dwc3_1 {
> +	dr_mode = "host";
> +	status = "okay";
> +};
> +
> +&usb_host0_ehci {
> +	status = "okay";
> +};
> +
> +&usb_host0_ohci {
> +	status = "okay";
> +};
> +
> +&usb_host1_ehci {
> +	status = "okay";
> +};
> +
> +&usb_host1_ohci {
> +	status = "okay";
> +};
> +
> +&pinctrl {

This needs to be ordered alphabetically, see 
https://www.kernel.org/doc/html/latest/devicetree/bindings/dts-coding-style.html 
(so before sdhci here).

Cheers,
Quentin
