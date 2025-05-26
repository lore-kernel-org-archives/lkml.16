Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2062.outbound.protection.outlook.com [40.107.22.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29AA20299E
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 16:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748277149; cv=fail; b=USeQ8a1j8+FL2/ZmxuRr1b6beFbRIVKuRgGP56dhzIgHPT2BmWxgGkIsFnlKCLMhMsUKzdozZZiPe3ruu0FWrPBI8qTbCoOOwmTTevn6eZLahVOlgkcnRxgV7MRv/guiQ6Aczw2WQhV/GxaO/1zAEoIgN+69M06mrjrzSp6sM4s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748277149; c=relaxed/simple;
	bh=wykweeHvROjwGSNRQtof3bz88jwAeGy2EZYE3P+N6DU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=S4QNlQv0bwpeD6ADNCM7m3FNaM//LkOfFbYh+3kAtqRVjQWDzc4O+SXi01aZd4W/FWxB5q9de+FnXj8gzyt9cl3j+BLaqoifR4YeR/I7Syo7Vlw2vTP2HmuW92zIqvIhY0C9NQiHimfKSW4znkwSOaT/AU5suB/07ld5WTFfnng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tW8q6+pu; arc=fail smtp.client-ip=40.107.22.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tW8q6+pu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uc9baSaEKeOR+Nx5p8O9OlvsZJFMxMNe3JVy8H5Bmb+5M7NySrSUL2W5c9jXseQUuPxrWL6wXKZJxeCEIopea0T3dGRDHkM/1s6PTWWryntXJgE+y7bhqNjOYZHIJDVG35MW/OV2TP/tSEu0Gxx+Egibi2mw/hLToIVbGX4xpu670hLykd8BnRX+/vks1xN/TFfvIRimYgvmh4kZifrKkUahzTvUng7ZALK7dlVQ36cormi/3mD9Z5d5XpQ141yfFhIylfU9wonuhQZDKItHgpsJxDvB4B0ySKvmUaflMUCmrOgi1AKjLcjxYfa7j0NdcVHjZ4QZRPozSFXQ/refCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iy76YAHfHBpLRjVBvY5itV4GuxifFpebpoqDesJACFc=;
 b=hkeZ5qNqEJt5YchVLvS2kZIbZmx/yLAeyx5+oizUAIi/w77yc1+lOoVh10ydOUJmSaGb8kBZwB1+D1g1q46rnMxl21s3+EjPtSReUdJNlazrP9sHs7w/mO2U0IQDlnR5PN2YPfcNax5Srteb4ft/nEjjCH6brMj5if1KqExzH433hJbFY8ldDNcitGYINgcFnPUFv5nZOQ1J6mFhYVmgIIc89VPLF+DU6xZzrjjvmLqQskZ6Txfigl0aYwuJm3NOEm0ySyEBE9CGq6WEtc4v/qDIIjmKWh6gIJJCS4qSU3RSpsGMA1WmNhRTqAxVspFdzq0Mq001/xWHH1QkJ0OswA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iy76YAHfHBpLRjVBvY5itV4GuxifFpebpoqDesJACFc=;
 b=tW8q6+puK/nX/ZVZpg2NEb1j1SCn6YfREnXDkLQNfPWxoletVRgV0ccctukI41N778eY38MThcWi5YZ4zWqGsJW+j4t+PQmP1TH7scK96tukhHIQSN2NQjtH5eiZG6IbF6ABvJaLLTz/3dU/joA2dP/T0Ml7fHgJzqXWWolgYfv3LlmDuXD7uRGLkY9y6FgFHgHyK3JH8WrCWmzdM2L0ji9WBdlIl8P9xDWzSXAYNSmhhqgJlj1ZhAeCcm0PPY3XS6jrioyLs8RGfR8hm8YefnCA7RiD7F06EE/acesvA7Hc6Vmt5bzQ9uJXjwPaG9NolNGOAx8cIN8gwSlDX6WyWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by PAXPR04MB8473.eurprd04.prod.outlook.com (2603:10a6:102:1dc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Mon, 26 May
 2025 16:32:25 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%5]) with mapi id 15.20.8769.022; Mon, 26 May 2025
 16:32:24 +0000
Message-ID: <fed76504-2fc0-43c2-99f5-37f579327eb1@oss.nxp.com>
Date: Mon, 26 May 2025 19:32:23 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: s32g: add RTC node
To: Shawn Guo <shawnguo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Christophe Lizzi <clizzi@redhat.com>,
 Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo <eballetb@redhat.com>,
 Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev
References: <20250526162954.2467894-1-ciprianmarian.costea@oss.nxp.com>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <20250526162954.2467894-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR06CA0120.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::25) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|PAXPR04MB8473:EE_
X-MS-Office365-Filtering-Correlation-Id: 2481f6bf-2b83-49a9-8b21-08dd9c72e581
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L1FHdnpjV3Rsa29LZkFCd3lWR0NXdGpWd1JLSjZTWm1xNFZEQVlrN3JsMXZw?=
 =?utf-8?B?eis1dHp4RlB2QTFzbDloaFlzTVpNY1NrRWZBRWpIUGJ0QkVjVDAzbVA1U2Y5?=
 =?utf-8?B?RjFISWhUUnk1OTl0U1JmdzRkaEZ3QlVEN0tZRmhPLzVNSHJTL0JJdHpsTjIr?=
 =?utf-8?B?bjdJR0lVNU9ZQWNFWFN0V1l6S292MkxwdFlibklwYTV1bUlsVDNIVFRuTkJH?=
 =?utf-8?B?WElGV090aDViM2VPRVdGNVdMOXF6R2piKzZZK2cwd21pVldWRVhabDVhY3p1?=
 =?utf-8?B?RjFXam1ROWdmT1BQcW5uUlplYndxOEJ6d1lSTzlPeGswbkk3dm1uYzkzMG1U?=
 =?utf-8?B?cW0valYwNENmb1lSTlNWck1JcjVrWmJEWTFkU1MxTDdrL3ZIaDF5ZXJuU243?=
 =?utf-8?B?VXR4Q3pUd1J1d3Y4eWMxaXcwSUthNjE1SEpkRktiRnBuM3Y5eWo2T1o0aHNs?=
 =?utf-8?B?NHpYUXlTL2lWZ0twblpPbWVjbkJaUGQ3dDlvUWwzbXNwS04vMlUwS0x6cm5L?=
 =?utf-8?B?bnV6RXNDajRidHlCRk83L0RLdm5yeUlhOURQZlZuWk1ta2pEUitzaUoxZ3NH?=
 =?utf-8?B?TGF1aWFXRkw0OVNvK05YNTloUXI3ZkFSQmtTQnM3WWhWYThxT0dJWUFLa1hq?=
 =?utf-8?B?WlNUYTVTOU1mWXhQZDMrWjh4N0Y1bnFSdUNtd01zT0M5eEcrN0daSkhTUDRy?=
 =?utf-8?B?MW9MaVdqbElSeTI3cnRSaG1jNjEvZ3NxUFN0TzVTTGlHQnpIS292NVl1MW5a?=
 =?utf-8?B?YUt0dnR4ZlliNVNXL2F0d3pxV2h3TGhNWnlMREc3MWxNcm8xTmdzcXRCZC9O?=
 =?utf-8?B?clpPVHhKU0l4WEZNNTBrWkpsUlhIVUx5SG4wejU3U3dZWVpKb3hYbGhScThW?=
 =?utf-8?B?eTBxZkNBbU9TY1ltVkNVbHhOZ09ieU4vb0dtVlB0NzIwMVBmS0N1enovbml3?=
 =?utf-8?B?YnVEMWtrazkwRWUyU1Y2NXZGeEhBdDl1RkVoc3hrc3FleUpvUEE5QUorMlpK?=
 =?utf-8?B?NnB6aGhXTFNTOHNTb0M0U2VuNExDeXp4Y0U1emhmVmtDWmVFbmxUTjhScmNw?=
 =?utf-8?B?V0NqNDNvRUllVmZFSTF4UlJsRmZqR1pBeVZjUk91a1dPODlmSiswdEw2UDht?=
 =?utf-8?B?T21CMlc2ZkVPUDF2aUpqREtqeEIvaUk3VjNYK0k5UnNFdzNlNXhXVWhnazFO?=
 =?utf-8?B?Z001aFUyTU43RlJibjlFWTFuYXlZMkhyTVVyNWgzbWRqTTdORlFmaGpFTVAz?=
 =?utf-8?B?L1FHdktRWUZXZ3hSOTBkYmVRNjR6SHFQVWNNckgzc0NsaHpOU0QwZ2lld2xW?=
 =?utf-8?B?RStqdVFtdERnUXVqR09YTGQ2MWNWbHlQcjB0c0x2ZEpIY2NyMzB5bTdqZzF0?=
 =?utf-8?B?bFErQ0dkRGhNTEZKeUtPU2h3OE0xeUQ4NXVKbHZaYlA5N3lDUDZQWTdoNkVT?=
 =?utf-8?B?NWhXNU1sNlh2MllBWm92RHF0aEQyWW9zbnBGOGsvQVhrYlpGbUhSdEhLdlIx?=
 =?utf-8?B?WmpBdXU5cGViYzZlVEcwT0VOeEQ4VTdZYzV6L0VmYVZTQ1Vubk1mbUM3KzJY?=
 =?utf-8?B?eklaVTZkVmg2bllydlZFSXJ4WmsyWFJzdk8zTGN5bWhEcVNEOERrSk5xZHJu?=
 =?utf-8?B?Y1hXZG9FbDVtS3R1RDhlWmZzZDlwdGgwV2JoUWNIMVZiTG9RblhuTk0zL2Iv?=
 =?utf-8?B?eDRnTEJnMUpHVkpxUzNnWktnU055T01TYXJ4QjloUVhjaWpCaGFLbmdOYmkv?=
 =?utf-8?B?T0xmWE5yTzVOcEVEM2twZG5LYlhhVnNjVXVGL2lzMXpDU2hPczlJbzZia1hW?=
 =?utf-8?B?dUtxb3o3ZzdnTzR3V1d4UVpJdVUvZWRJOXF1b2RnOTNna1ZKMnA2c0hrQ1Nh?=
 =?utf-8?B?RThzWGExeU1MSUJxc2VUc2Y5TG1KOTYrYTRkSFRLSzJsU3VqUGZEVE5EZ0pZ?=
 =?utf-8?Q?emrizQ78mU4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVNqS2UyVnFjQW54ODdaendDSzFQdXpmMy82TFBCcVVsMG4xVnRZOVZTeVFj?=
 =?utf-8?B?UVpSbzlZRENnZzFmZkYyUzRRSjJRbTBuamt0dURvTDhwT0J6Mmg4dnkzZWh0?=
 =?utf-8?B?cUc2bXJKY1lsSkRVSjB0L29PNCtEOTJ2UnZSTDFQbGhEeC9YYmxicXpERUtW?=
 =?utf-8?B?M08yaEtXWHlseVI3QkJpOS93NmlybWZxQ2NHc0duUHp1UHNCbkZOaU41bGFN?=
 =?utf-8?B?c3MwQVBleEVQc20zUVBWOEJSMzFLWUV1VjkyRWUxOUZaR29TaDJlcVVqelpY?=
 =?utf-8?B?akM5M1VCRXh0Rm1TUURMaktwMGRVWjhsakplYXRMVk1Kc3hDKzFIRGFyT2FM?=
 =?utf-8?B?K0dsVjBac0ZNRW1NRlltcVR5aUxXUUxGOFRSeU03aHZFOTRYdjNaNWVpQjRR?=
 =?utf-8?B?Z1lkVUlWcmZxamtQM1dOemFhYTVCZUdWcDh4cFo2Zm9oOERYc210RmtRUWVZ?=
 =?utf-8?B?K2I0V2t2NFFuVnYycGVGUWFGdUtyUHkyTWQ4WWF1STg0QjNrUy9UeTBuWTBm?=
 =?utf-8?B?MFJKNjJ4c1Q2cjRvZDRzZElSUm9SU3QrdEtMVmJva3ZOTkZ2V1hSQzBFMVlr?=
 =?utf-8?B?WDZ6Z3gvMDNiWVRpVjN0UHMrN05HdWxobzhIVTdndWN4N09SU1RXYnhkVnZC?=
 =?utf-8?B?Q1BEemdUVERZWU50WXlheVhQK1hmM3VmSUl3ZnFIWVIvdHBob0lhZVgzSFdt?=
 =?utf-8?B?MCtqWi9FaGF6OW84S1ZXejlUTVhteUxxUWVzcGdiQzlhUHBYcU5tT0VEVzZU?=
 =?utf-8?B?dllENGxQa1k4d3c3SmJTZWVRYVNQMy9ZNVBZUnBlNWxQQTNhYjVzVU9DZ1RU?=
 =?utf-8?B?eEI2VHRPSlZieHZYTXc3SjRZKzhLN2ZWcnYwejlnNjdXTXExUEtCMitXR2RN?=
 =?utf-8?B?RUdkWEUreEdZczREeWxJNlArdHlWZFJpODVpRWpkMDF5YmpKSStkVHlpMG1X?=
 =?utf-8?B?NXZjem1RbWhZbndxbTV2bTFnYXVxNEZZNkJFSFRNYW9heEIrNG1VOUpRTGRw?=
 =?utf-8?B?K0JkaW8wZC8xSXRtMTJhWVpFZzkzY0tSZjBrcTI3MVRsWWc1T3AzMkthYjRZ?=
 =?utf-8?B?YmxucHVSR2tZQjFhRnRHaWZiVmtraFZncVB4a3o3alpoR0NHajNYMUNJakVy?=
 =?utf-8?B?WVFWcG0wUE5zWE0wZncyMUo3SWxTTXQ1ZXdiaXE2Q1owc01Pd3FDZXBKQ0tR?=
 =?utf-8?B?RHB0b0pJVmpycjh0VnMwSjkvMkZWeUFJT2dNcDdOUUZqcCswTTV5WE1OL1Ir?=
 =?utf-8?B?eWVTMkF1WTBpZ0JyMVJueHV2aStLUHNIUEhHaGREOUl4NXh4UVhwQitUZ25x?=
 =?utf-8?B?aC9teVlTdGN2Y3JnbWs0a0NjZDJsT0ZmaEZXZ015VG9qUXJPK0hnYnNGTEQr?=
 =?utf-8?B?Z2x0MlNKOVRnS1djbEJUSW12WFZMcWs3ZGxjQzg0RmRDTHdjb0RlekJCM0Yv?=
 =?utf-8?B?dWxvYjVwUkNsZHBkejZkaGd5alZaSU9SQlBFUGFoT3ZrT1FlMXVGRnhueU9X?=
 =?utf-8?B?ZlhtUGllOC9neE5VMG5IcC9XclAwdVhiL1VITjZSbkxNTjdnRXM4WTAyUUFR?=
 =?utf-8?B?VFIvc3V6LzBFaVRlNWFRSC9kN2VWUUdURTVYbW5tTWtUb2gwaXVDR3hFTXVU?=
 =?utf-8?B?WnVjZUNaS09yWS9kU2M0MGFPNzdDUEd4aTlENHFZbEcrZVB5THlNSkhRVEZo?=
 =?utf-8?B?L3RacVpGTGVlZUlKYTkvOUczYUhjTlc3TXJvTkZzWkExU0ZLdkI2Ull3TEt6?=
 =?utf-8?B?MkFZbFdoNFcyZmlzUDMrbG05S0JEUkR5bXljbUVkMFpMbVRoVnpIVTd6L3VB?=
 =?utf-8?B?RkFNRmJiMWRXNEpaZnBiT0NMVTh1NXMwOStzNTcrenJRRUpyUTRSSHNINkt0?=
 =?utf-8?B?TjQyNDMreXlHVno0ME96dCs2aFU3ZU9xdCtPMmtBYnZHMFN5QUc4aXhxLzBt?=
 =?utf-8?B?VVRtYk5kNDl1QUhON1o4NUovL1M1UHk5SlltYXNXVjA3UURpY3lVUGN4bDlY?=
 =?utf-8?B?UDZUbXVJeTdWQWtiM3Z2ODZXWm1sSkN1SkhEL0FNemkvaW5Mc2ZpelFZYVFx?=
 =?utf-8?B?RTU3NDJPWHNUZ0YzaGxkUGRsaVU0ZWlkM2h0UWpGSGFJWUl2UWM3ZFBXeVcx?=
 =?utf-8?B?dWY2azlZYlBGK2hFYmxtQ3V6YTk5UnV4YkJySG9COTQ4eXRCUzZaQ3ZERnNM?=
 =?utf-8?B?cWc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2481f6bf-2b83-49a9-8b21-08dd9c72e581
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 16:32:24.8969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CkOQV4qBL/0bFqZk+1m8vXU6+tajMa77rK1c/mTRX84qC2pYOXCKRfA8P4SgmM8xyLUNKB9vR5SQqmYW3aGZDtEQlcXhKHwYUe4ApUynE88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8473

On 5/26/2025 7:29 PM, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> 
> The RTC module on S32G2/S32G3 based SoCs is used as a wakeup source from
> system suspend.
> 
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> ---
>   arch/arm64/boot/dts/freescale/s32g2.dtsi | 8 ++++++++
>   arch/arm64/boot/dts/freescale/s32g3.dtsi | 9 +++++++++
>   2 files changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> index fa054bfe7d5c..39d12422e3f3 100644
> --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> @@ -114,6 +114,14 @@ soc@0 {
>   		#size-cells = <1>;
>   		ranges = <0 0 0 0x80000000>;
>   
> +		rtc0: rtc@40060000 {
> +			compatible = "nxp,s32g2-rtc";
> +			reg = <0x40060000 0x1000>;
> +			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 54>, <&clks 55>;
> +			clock-names = "ipg", "source0";
> +		};
> +
>   		pinctrl: pinctrl@4009c240 {
>   			compatible = "nxp,s32g2-siul2-pinctrl";
>   				/* MSCR0-MSCR101 registers on siul2_0 */
> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> index b4226a9143c8..e71b80e048dc 100644
> --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> @@ -171,6 +171,15 @@ soc@0 {
>   		#size-cells = <1>;
>   		ranges = <0 0 0 0x80000000>;
>   
> +		rtc0: rtc@40060000 {
> +			compatible = "nxp,s32g3-rtc",
> +				     "nxp,s32g2-rtc";
> +			reg = <0x40060000 0x1000>;
> +			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 54>, <&clks 55>;
> +			clock-names = "ipg", "source0";
> +		};
> +
>   		pinctrl: pinctrl@4009c240 {
>   			compatible = "nxp,s32g2-siul2-pinctrl";
>   				/* MSCR0-MSCR101 registers on siul2_0 */

Wrong audience. Please ignore.

Regards,
Ciprian

