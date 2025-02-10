Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2105.outbound.protection.outlook.com [40.107.255.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A9126296
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 06:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739170027; cv=fail; b=HwbayPtIFizoIunRqiWn8GHOxq6qucoUj67P6u/B7cxrCrNgcRikvWshrXpU+Oa0tuWOAqz5qA2GCbS6ww8H0wVqaAoBNW66186a+qy/6/s4lQWSOCCMB0zmqI9veScFOccbZmYU20K2eWlMGRrmUDz/f9QZ+jPacvGbwfYh56s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739170027; c=relaxed/simple;
	bh=HJ3F0k92bHzIpaHa3DmI/Wl+TSgTVore5yvdipyizec=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=a+U3S5wRTmxlscAUWJsk165angyEurLXcv/O1WEL5hLxNa830fo+gi4fQWhxjLFmH4/OPe6ldLeEnfwYPw1R100OwErpC0yUm/32XuFctWKEIcU4YWmqegf6P0o5RLWx1bB0ah09sYG/j0ubjDyZBFMV2ukrFQu67QqbvHT6O50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=hiYBNoQU; arc=fail smtp.client-ip=40.107.255.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="hiYBNoQU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JD4nFIRgi2hyXUb71qfrdu41BWFnbnKQljlb8v4QlM6DrAIwrNQhlRNcbani/Sc+rkizc2mKcZ5zq8RYckN05Okrk24GbY8vqmaw1rrERvvpMfcdpZQ5COb3C0+T7Ku/lO3ASVb24CDrhjUjKup0KjW1UWUN/aLUC1dCJApMedjf/UgeQMiFvK7YsqvSU6Z/NooLEEmqnRAgoQ5Td/7SmTgAH4ij7MrtV0PE6S5uiwBDhI5LsJk5FPurJ8kt3SOiDTHTAUBRIQpLZZRz+r9zdsfzwzB/nG9czHXl3OjSB5Ol/Kdaoi6WpjONp6TiXj8j6t4+WDkvLizDRVgXuKFn5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qLShpQ+GcGX1O6scCtLD508voNktZZvh0+KDBe4CwmI=;
 b=mdlYDyoOBTQiFMSHels8IMB7oMBazeLrR0Yse3hwhE4zH0dx7O5BTyWC62fjsHpdM4wcWs3ysW1gTOD3hT7NL4wAer5u5gngMjZCfrzKrf60P/Ym4diUG/vrfvX/tyd9nb4OPAFJHyjZ76XEjeQynHgWW0pDSbZunXxqFat4A1WrupkA0S4K424Jdl2Ye8J90J8cGSHa+xSdTF+OCnu8Zms7YwqiIqVVMNXvWw7/GhdA/Fxc+THwWsUxwBO9vLAp+xnfQ8ephtYOf2LuyzUAlHwCSVVwicsZ4Yhm4J9iyUjwM8aAL7DDpRH7asigh/rADj+AagT2pizN0vXVt0rSeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qLShpQ+GcGX1O6scCtLD508voNktZZvh0+KDBe4CwmI=;
 b=hiYBNoQUXDf64jC59WGoIowpbhcKUlWsMkQ/fr5VlrUVkT8fldoPwBcf4H/kq4gQe/fkeN9dyK3S1TLOLSE+/k5jZWWVx3Djii20Eo4qpsgadmYgyRrVjoPkyDp+8bIJYAsjmjHL6pgWk6Uy1qh38utcjCEtEmsYi6WNQ7OJwxSH/yX3gUPK6W9JJFMhHc5m1ietYUdmcXrtwQKOJS3bUejYTsYgLVCwtLaUFbVn7Me7yU3jrXrXv0YMVzCd8zHiEP6pbLPgmwqmOQkIjOL0EaJGpqOfMiIdEMqAwJ36VS6Xyfb5A0HMKCS7NF3Qb5vKX7NlbJPFFwGvhOcGyg7X6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by SEYPR03MB7168.apcprd03.prod.outlook.com (2603:1096:101:d3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.16; Mon, 10 Feb
 2025 06:46:57 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca%5]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 06:46:56 +0000
Message-ID: <f08d0c8d-46a1-4b66-9d62-4b758d0ab949@amlogic.com>
Date: Mon, 10 Feb 2025 14:46:38 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] soc: amlogic: clk-measure: Optimize the memory size of
 clk-measure
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250205-optimize_memory_size_of_clk_measure-v2-1-4f546053495d@amlogic.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <20250205-optimize_memory_size_of_clk_measure-v2-1-4f546053495d@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0003.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::16) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|SEYPR03MB7168:EE_
X-MS-Office365-Filtering-Correlation-Id: ce5b9b89-7721-490b-d387-08dd499eb619
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QnV6bzRMRjZWaGszTzVvWGNvQVAzVU9Ja2pJMHc4NFlMUnhzNjl2U1J6UFQv?=
 =?utf-8?B?VnlYSFNvSEMxRTVSWmlZUnNSempGYjhFNW8vbjkrMkRLeW1MbFZLWnlwRklQ?=
 =?utf-8?B?TkhOL1N3T293L0ZZWUIwdEpDdmtxSU9kOThqY3NRZE14UVRTOW9KcUd6dlUv?=
 =?utf-8?B?Zk80Z0FmYnBobXlqSTJtRlFMSkI3NG5rekUzNFRtV3V6TDdIUFFoT0VmWm9P?=
 =?utf-8?B?TkJmbUlNcEVrRjdidTV2Ri9zeFB1OW9TZ1RjREpZV3AyNHBIcWNjQjd2cHht?=
 =?utf-8?B?WFRUTFl2RWZqNWRqV0M5UHBHcy8rRkZaYXdabFRyOEFEOVBNMVh6NC9XVDcv?=
 =?utf-8?B?VGQ4YStWeGlmR2hsckVlOHpCSEZ3SnBXamp5cDlReXBFdlNuNlZSY0lpUWRm?=
 =?utf-8?B?WklycVY1b0hGRnRFd1psdXpBaVluTlM5TVRVK2xQOGtOUmlNQ0pTWjJWbG5R?=
 =?utf-8?B?N2s0a0VMUXhiUW5rREM1dUY3dFdNdWhYRnFGdnlHaGliWkM3RTZpZ3RLN3VT?=
 =?utf-8?B?NjV2L25ZVjc5Q1FScHF6R2tyU3dGN2tvR2JUa1oxVTc2NDB3VmFUSSthblVm?=
 =?utf-8?B?OG03d1FvbTRsQlJBdC9oQ3J1QTZlNEwwYTVOVDdvSWhpbG96NEhZSVR6ZUQy?=
 =?utf-8?B?TFIvMGhienFxalNGcW9sR05OeE1nLzk2MTR0SmUyQmhJazAveU9FTTZmTWQz?=
 =?utf-8?B?TXNOYk5Ec3UwTjFQODc1b0owUnZlRE00bHBiYXQyRTJmZlVnbUVCajUwZzhF?=
 =?utf-8?B?WE9uN3NDbFRmNTQ3djZiQldDVnFoQXREQzcvK0NpY2x3bHhmSU1TcDNhWTNs?=
 =?utf-8?B?VGRhWTA4dTZERStkbkQxaDN4T0EvNFNvSGNDV3NHcUQ0MXp4Q1BLdGZnTVhD?=
 =?utf-8?B?T1l0aFFHSEtWTjM4eXBpb2xDdHVlWDlueVhNQURzSU1OeUFLeHVEMytOUVh3?=
 =?utf-8?B?by8wSGhub2s3STd0UTJveEpoRHBKR2d1OHhXaHdwZUI1RXkrVGZCbGRoSEwy?=
 =?utf-8?B?ang1cS9ZblNGc1FTMGhRMXhGQmY3Q2krd0tzd3Q1emNjTFFKM2ErQ0lDOXNI?=
 =?utf-8?B?SzNObmt6L2pyWWVvdCtlL3kwdk5HbGJSRkk5aTZGTHVvb2ZGYzhzb2d1R2Iz?=
 =?utf-8?B?bkRJaFFkakRCcFBwek9yRy9SZjh3dlN0cmFaU3JJbGsvWTE2b0t3K0RoaFIv?=
 =?utf-8?B?N1NmV2YyL1B5UWJzOVh3bFd1UlBJYnR6dVl2WG9RSjFTVjVYVUFtSFo0NkJQ?=
 =?utf-8?B?ZHlld0NKaEx6T0JPQytXalhWN1BlUWxEa256WjJFUFRFa3cvREt3Z090TkJm?=
 =?utf-8?B?aHJCU3E0R1pHdzBOci80cUJoRmx6V1poTEowTEZDSE5Oa0FzTEF5Y01xcVVo?=
 =?utf-8?B?NG1YS3lLUERDYllma2pydkpTbHpEeHkxQk8rQmI1dk55SXV5cHk3OWYvZC84?=
 =?utf-8?B?eHNTeUNyeTJZTUFhV0ZMc0VEaGRRbXc3R2VTSUwxOEpzOUNmL0t5bWNUV0xp?=
 =?utf-8?B?ME8wTGRyWlhVM0RySVlEcGJDa1hob3JqdnZsRkNNb015bXNJamJwMzZKZUlT?=
 =?utf-8?B?WU1nV3h4cFNrSVBHb3hNWTBTU2FsM01MRFF6MDlmUEM1Tk9sc1RRNjR4NjZH?=
 =?utf-8?B?citaVGFXVjZTZ1hscWdJMVlDYUlVOEJzUnZENjRpZUpBVnhyTUd1d0hRTFlr?=
 =?utf-8?B?VFB6d1JycUlIZzMyak9nRFMzcGRFWnE3Q2RoYXVHOGZhOWFNdEZKSEVHNE1t?=
 =?utf-8?B?TG9vWExvYTRDL0p4SExjQ1FyV3VaY2RISWNqZFBpdFpJQmtISmk0MTdLcHBM?=
 =?utf-8?B?T0pzekZMQjlUdnc4QWE0c1kxLzdlNUZlUlc5dmh0V3VXT0Rhajlhd1JQWXlK?=
 =?utf-8?Q?LwtxvSmI/pY5T?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFJDdTFXWG5KdXJDOGc3YU5qaFR5UU9yUTdLcHl0Q3Jpd3A5Q0ZrTVhlVlFZ?=
 =?utf-8?B?TnBwSmU1K09QWHpOc3Y2anNFUnBFTWszSzBzdURBS3dKblJPSGszL2NPS0Fx?=
 =?utf-8?B?Z292TzZ2V29qQm1mZzQvM1dKRjdMSG5LRXNIQUx6eE1XcFhNMHZ1WDhrbkov?=
 =?utf-8?B?U3BrekNHMExKeGg0ZW1KRlp3enN5UVRFODFoZ2VIbFd3M3pSNUh2QTZTWjJ0?=
 =?utf-8?B?MmRZQTIxSlRXdE14eE5wemVNT2d2aDRIcnJQT2hJdjBYR1ViUmdmaCtYS1p6?=
 =?utf-8?B?VEFDQ3h3cXV5ZExNL2IxMWlVaVlGeHFVQ2xYUFJ4LzJMRkZPNXBCVTN3UDV5?=
 =?utf-8?B?cEp4RVcvNGE2LzFaclN4MTFvckdqelMzSGxFLzR0TkRjamIxdDVSMmdrSmpH?=
 =?utf-8?B?OG1rME4zQjh6V3RISTREeHVJbW80c053TWRtNmJRaVl6MXhTeUJQQUFXYnNp?=
 =?utf-8?B?YjNPVEdwR1lhY2Y4anRKQmduSnJEUTU4MHlYTXhLUnY5WTBaTHJEK3JpOWgr?=
 =?utf-8?B?MXIrcWtxRFBONlZDNVBNU1YvNWcxSG5UMGpRYjVJc1Q0UGYyaFo0bjNZZm5l?=
 =?utf-8?B?ZVY0ZWJUdTZGS3pFMmhKdXV3ZUdXRkwybFdEdGJIY0FyYndYcyt1QWRkYWNo?=
 =?utf-8?B?aHBrZEZNM1ZYd0grZ0Mxb1F4VGl0cHVteGljVlRtWUYvT2xyNy9Ya3FyREh0?=
 =?utf-8?B?ZTdETDVtMHRUZ3UvRlVCeCtWdkJaRjFBak9lZG82cythTmxGT3BGN1dnWFc0?=
 =?utf-8?B?ZldXMTdIazFQc0hkODlxSU1pN01OTHV4clBJQTROcURDMXBxcElWUTkyRWVD?=
 =?utf-8?B?RlVUY3hWYWNYaEMyWS94UnBJWEhEMmhNN1NWK0lESUZTZWJOM2JsSkdSVnZP?=
 =?utf-8?B?RmJSY2tMTnc5Q1BUV3VHeDZwYTJjZkRsSUJsVFdreEN0dFQxWm91OWFOKy8z?=
 =?utf-8?B?QmUxeEVHMTN2ZFZldmlpcmd4UUM2WDhPaTBKWGNZb09SbGVob1Z6cTVyUFBp?=
 =?utf-8?B?NXFJcVF2QmlPYnVUSXhmd3ZKdFMxTzVoNHJvTXlPT2x0dnlIOG1aeGFNaFVF?=
 =?utf-8?B?ejhhTTBLblVTaU5KMThkWUdCZ3lKTm9KVmJvcVdlVzFmVittUGFKMlVDSWxq?=
 =?utf-8?B?d0JlL3M2eUNYQjMzQTZNOVBleUJlMStCdFp4K1VkKytKUG9LR1lhdVlId0ZK?=
 =?utf-8?B?VGc5ejNTamtVRnNSMHFKc09Fb3lDRk9WcUxGMVIybFJZWmdsTENzdW5CaTQx?=
 =?utf-8?B?SXZwWk5zeWtBOS9PcW9xZUFrWGJIK042WENiclcrTSt5NTROSFNFcjJzVzM2?=
 =?utf-8?B?T0VjbHRJUnFvRDg2K1hjMmZUajIwVzZMT3FQWWRVSTBUN1dkOUVKMVBsaVAy?=
 =?utf-8?B?UHgyQjZHdXhxdWhtT0o4VHRSWU9kNmUxRGRqbUM3OTJmVFl6aGNCak9JNUN0?=
 =?utf-8?B?UG9KNmhhNnRhSk1ydFVYZ29hMW9ZQ1gzMGs5RkYxMWF4RzhadlpTZU9hVUhN?=
 =?utf-8?B?S3UvUmpHaExoYkhLd0cwc0lxSmc0RjRoWEhNRjNINFU1bkVvTnlDem1LOWZZ?=
 =?utf-8?B?QjNnek5nQnE2MmtqaVZhcVc4bjhLNkI4Uzg3RE54cHFUSWdFUWJxdTVHRzhB?=
 =?utf-8?B?TVNWRFFGYnFQYjlXTDFiaFptS3VJd21jNXo4N0pqRlE4RDNHNUJ4SXpiL0w0?=
 =?utf-8?B?bk1yQkNQZlRKMFFVakM3OVN2VllZWGdIUC9GWEFGVzg4Z2pFWUFRVkgxMERC?=
 =?utf-8?B?M09lS1hXZlZpSXNjeVZhTUcxRXpBQmQzanNsTnJhTHAxRTZCM01pcmtDTmR2?=
 =?utf-8?B?RjhVR3ZlajR4KzhQWU9PbGNVS2daSFlkNVJLQ0E5R2duSm9MNHNGQzhIdHdm?=
 =?utf-8?B?ZzdyaXpia1JTZkswVFE4SDg4Z3gwMnQ4YStTenIveTBqYWRwOFJ0QkZ6SnVT?=
 =?utf-8?B?Rmk1Zll2M1NrcGxyU1k2SW40aUlJNHJEK3A3UGFEQmVSVk5BVXVmaEd1bnEw?=
 =?utf-8?B?NFgvU0NxdHQ2VEE0d040aTVYUUtrOTVaRThycGxPVlM1aFhLc0JHQzRZU3Zo?=
 =?utf-8?B?SzNIWFgrV0orOXZxUWR3UzVTMWpMZWd6eExVLzRXOXQ4N00xNGViamJKM3B0?=
 =?utf-8?Q?zyi74t90AKKIKhB25zc8iSLOh?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce5b9b89-7721-490b-d387-08dd499eb619
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 06:46:56.8215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FWk0gB9324SALm+hRTahb8ut64tJdfbHhwy4uN6OojIdDVwny0b6DHFwG6j4p8FBKiK3E/J8JcSPZINFe728Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7168

Hi, Neil:

Do you have any further suggestions regarding this patch?

I plan to submit the relevant patches for S4 and C3 support of
clk-measure based on this patch.


On 2/5/2025 3:58 PM, Chuan Liu via B4 Relay wrote:
> [ EXTERNAL EMAIL ]
>
> From: Chuan Liu <chuan.liu@amlogic.com>
>
> Drop "CLK_MSR_MAX" and replace it with adding a member "msr_count" in
> the structure to specify the count of msr_id.
>
> Mark the table of msr_id as const.
>
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
> The number of msr_ids for each chip is inconsistent. Defining a
> fixed-size array for each chip to store msr_ids would waste memory.
> ---
> Changes in v2:
> - Discard the global variable and restore the "priv" member in the
> "struct meson_msr_id".
> - Mark msr_id_table as const.
> - Link to v1: https://lore.kernel.org/r/20250123-optimize_memory_size_of_clk_measure-v1-1-06aa6a01ff37@amlogic.com
> ---
>   drivers/soc/amlogic/meson-clk-measure.c | 86 ++++++++++++++++++++++++---------
>   1 file changed, 62 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
> index a6453ffeb753..39638d6a593c 100644
> --- a/drivers/soc/amlogic/meson-clk-measure.c
> +++ b/drivers/soc/amlogic/meson-clk-measure.c
> @@ -33,23 +33,26 @@ static DEFINE_MUTEX(measure_lock);
>   #define DIV_STEP               32
>   #define DIV_MAX                        640
>
> -#define CLK_MSR_MAX            128
> -
>   struct meson_msr_id {
>          struct meson_msr *priv;
>          unsigned int id;
>          const char *name;
>   };
>
> +struct meson_msr_data {
> +       struct meson_msr_id *msr_table;
> +       unsigned int msr_count;
> +};
> +
>   struct meson_msr {
>          struct regmap *regmap;
> -       struct meson_msr_id msr_table[CLK_MSR_MAX];
> +       struct meson_msr_data data;
>   };
>
>   #define CLK_MSR_ID(__id, __name) \
>          [__id] = {.id = __id, .name = __name,}
>
> -static struct meson_msr_id clk_msr_m8[CLK_MSR_MAX] = {
> +static const struct meson_msr_id clk_msr_m8[] = {
>          CLK_MSR_ID(0, "ring_osc_out_ee0"),
>          CLK_MSR_ID(1, "ring_osc_out_ee1"),
>          CLK_MSR_ID(2, "ring_osc_out_ee2"),
> @@ -98,7 +101,7 @@ static struct meson_msr_id clk_msr_m8[CLK_MSR_MAX] = {
>          CLK_MSR_ID(63, "mipi_csi_cfg"),
>   };
>
> -static struct meson_msr_id clk_msr_gx[CLK_MSR_MAX] = {
> +static const struct meson_msr_id clk_msr_gx[] = {
>          CLK_MSR_ID(0, "ring_osc_out_ee_0"),
>          CLK_MSR_ID(1, "ring_osc_out_ee_1"),
>          CLK_MSR_ID(2, "ring_osc_out_ee_2"),
> @@ -168,7 +171,7 @@ static struct meson_msr_id clk_msr_gx[CLK_MSR_MAX] = {
>          CLK_MSR_ID(82, "ge2d"),
>   };
>
> -static struct meson_msr_id clk_msr_axg[CLK_MSR_MAX] = {
> +static const struct meson_msr_id clk_msr_axg[] = {
>          CLK_MSR_ID(0, "ring_osc_out_ee_0"),
>          CLK_MSR_ID(1, "ring_osc_out_ee_1"),
>          CLK_MSR_ID(2, "ring_osc_out_ee_2"),
> @@ -242,7 +245,7 @@ static struct meson_msr_id clk_msr_axg[CLK_MSR_MAX] = {
>          CLK_MSR_ID(109, "audio_locker_in"),
>   };
>
> -static struct meson_msr_id clk_msr_g12a[CLK_MSR_MAX] = {
> +static const struct meson_msr_id clk_msr_g12a[] = {
>          CLK_MSR_ID(0, "ring_osc_out_ee_0"),
>          CLK_MSR_ID(1, "ring_osc_out_ee_1"),
>          CLK_MSR_ID(2, "ring_osc_out_ee_2"),
> @@ -358,7 +361,7 @@ static struct meson_msr_id clk_msr_g12a[CLK_MSR_MAX] = {
>          CLK_MSR_ID(122, "audio_pdm_dclk"),
>   };
>
> -static struct meson_msr_id clk_msr_sm1[CLK_MSR_MAX] = {
> +static const struct meson_msr_id clk_msr_sm1[] = {
>          CLK_MSR_ID(0, "ring_osc_out_ee_0"),
>          CLK_MSR_ID(1, "ring_osc_out_ee_1"),
>          CLK_MSR_ID(2, "ring_osc_out_ee_2"),
> @@ -489,7 +492,7 @@ static struct meson_msr_id clk_msr_sm1[CLK_MSR_MAX] = {
>   };
>
>   static int meson_measure_id(struct meson_msr_id *clk_msr_id,
> -                              unsigned int duration)
> +                           unsigned int duration)
>   {
>          struct meson_msr *priv = clk_msr_id->priv;
>          unsigned int val;
> @@ -573,13 +576,14 @@ DEFINE_SHOW_ATTRIBUTE(clk_msr);
>   static int clk_msr_summary_show(struct seq_file *s, void *data)
>   {
>          struct meson_msr_id *msr_table = s->private;
> +       unsigned int msr_count = msr_table->priv->data.msr_count;
>          unsigned int precision = 0;
>          int val, i;
>
>          seq_puts(s, "  clock                     rate    precision\n");
>          seq_puts(s, "---------------------------------------------\n");
>
> -       for (i = 0 ; i < CLK_MSR_MAX ; ++i) {
> +       for (i = 0 ; i < msr_count ; ++i) {
>                  if (!msr_table[i].name)
>                          continue;
>
> @@ -604,7 +608,7 @@ static const struct regmap_config meson_clk_msr_regmap_config = {
>
>   static int meson_msr_probe(struct platform_device *pdev)
>   {
> -       const struct meson_msr_id *match_data;
> +       const struct meson_msr_data *match_data;
>          struct meson_msr *priv;
>          struct dentry *root, *clks;
>          void __iomem *base;
> @@ -621,7 +625,16 @@ static int meson_msr_probe(struct platform_device *pdev)
>                  return -ENODEV;
>          }
>
> -       memcpy(priv->msr_table, match_data, sizeof(priv->msr_table));
> +       priv->data.msr_table = devm_kcalloc(&pdev->dev,
> +                                           match_data->msr_count,
> +                                           sizeof(struct meson_msr_id),
> +                                           GFP_KERNEL);
> +       if (!priv->data.msr_table)
> +               return -ENOMEM;
> +
> +       memcpy(priv->data.msr_table, match_data->msr_table,
> +              match_data->msr_count * sizeof(struct meson_msr_id));
> +       priv->data.msr_count = match_data->msr_count;
>
>          base = devm_platform_ioremap_resource(pdev, 0);
>          if (IS_ERR(base))
> @@ -636,45 +649,70 @@ static int meson_msr_probe(struct platform_device *pdev)
>          clks = debugfs_create_dir("clks", root);
>
>          debugfs_create_file("measure_summary", 0444, root,
> -                           priv->msr_table, &clk_msr_summary_fops);
> +                           priv->data.msr_table, &clk_msr_summary_fops);
>
> -       for (i = 0 ; i < CLK_MSR_MAX ; ++i) {
> -               if (!priv->msr_table[i].name)
> +       for (i = 0 ; i < priv->data.msr_count ; ++i) {
> +               if (!priv->data.msr_table[i].name)
>                          continue;
>
> -               priv->msr_table[i].priv = priv;
> +               priv->data.msr_table[i].priv = priv;
>
> -               debugfs_create_file(priv->msr_table[i].name, 0444, clks,
> -                                   &priv->msr_table[i], &clk_msr_fops);
> +               debugfs_create_file(priv->data.msr_table[i].name, 0444, clks,
> +                                   &priv->data.msr_table[i], &clk_msr_fops);
>          }
>
>          return 0;
>   }
>
> +static const struct meson_msr_data clk_msr_gx_data = {
> +       .msr_table = (void *)clk_msr_gx,
> +       .msr_count = ARRAY_SIZE(clk_msr_gx),
> +};
> +
> +static const struct meson_msr_data clk_msr_m8_data = {
> +       .msr_table = (void *)clk_msr_m8,
> +       .msr_count = ARRAY_SIZE(clk_msr_m8),
> +};
> +
> +static const struct meson_msr_data clk_msr_axg_data = {
> +       .msr_table = (void *)clk_msr_axg,
> +       .msr_count = ARRAY_SIZE(clk_msr_axg),
> +};
> +
> +static const struct meson_msr_data clk_msr_g12a_data = {
> +       .msr_table = (void *)clk_msr_g12a,
> +       .msr_count = ARRAY_SIZE(clk_msr_g12a),
> +};
> +
> +static const struct meson_msr_data clk_msr_sm1_data = {
> +       .msr_table = (void *)clk_msr_sm1,
> +       .msr_count = ARRAY_SIZE(clk_msr_sm1),
> +};
> +
>   static const struct of_device_id meson_msr_match_table[] = {
>          {
>                  .compatible = "amlogic,meson-gx-clk-measure",
> -               .data = (void *)clk_msr_gx,
> +               .data = &clk_msr_gx_data,
>          },
>          {
>                  .compatible = "amlogic,meson8-clk-measure",
> -               .data = (void *)clk_msr_m8,
> +               .data = &clk_msr_m8_data,
>          },
>          {
>                  .compatible = "amlogic,meson8b-clk-measure",
> -               .data = (void *)clk_msr_m8,
> +               .data = &clk_msr_m8_data,
>          },
>          {
>                  .compatible = "amlogic,meson-axg-clk-measure",
> -               .data = (void *)clk_msr_axg,
> +               .data = &clk_msr_axg_data,
>          },
>          {
>                  .compatible = "amlogic,meson-g12a-clk-measure",
> -               .data = (void *)clk_msr_g12a,
> +               .data = &clk_msr_g12a_data,
>          },
>          {
>                  .compatible = "amlogic,meson-sm1-clk-measure",
> -               .data = (void *)clk_msr_sm1,
> +               .data = &clk_msr_sm1_data,
>          },
>          { /* sentinel */ }
>   };
>
> ---
> base-commit: 1e1fd26ed4ca05cc1f0e5857918da4dd54967f7d
> change-id: 20250123-optimize_memory_size_of_clk_measure-f9c40e815794
>
> Best regards,
> --
> Chuan Liu <chuan.liu@amlogic.com>
>
>
