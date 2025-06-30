Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04olkn2058.outbound.protection.outlook.com [40.92.45.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DC323ABB1
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 17:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.45.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751305807; cv=fail; b=t8XYbxckJOGqfS6m7RuV9d0ev3ZnHM6oq0uDnXqsPBRc/hLyiPryg9NbtlxxUmW99Ja6jS2r1tDPL+b3rU9zseXUwF2rbevqjP/KZ4WM28sPtUtqA76P6YjQ3ooeKC3AxMIwuxvOgn6Z+RSaaUQtjmSZoreKv+FYtD5R1ahIuWY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751305807; c=relaxed/simple;
	bh=sPgogZNFLtFFKgVqU5GJ1OQZwt0x7B9/j1SUL6WuXkQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HXOY8TdNqX6YSVwu7T86Ywh0Xqpe8Dt7krJtRS0Lb/v3jy3AyKZCjjV1dY/CLjLwRxHpKynKIXQeIGgx6TedQCHcNPaBgjfoDUgQXx+PvJeoc7EQWUDgPQeHw3LLBZvV7YOJshrUS+Jqe8W4WPdKStig4U4rWUjX8eEUEdkovtg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=nMFnTCAJ; arc=fail smtp.client-ip=40.92.45.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="nMFnTCAJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kHpaFIAq/ft7MzSYTK/+ikJK7GVA+lkTMG9+7EeVDqBpmLqvvJhDqe1Z5ykhdyWluW9vA46n3U0PSchu1UICu9LmuaXLGwb6+jSr65E5t2UcAX1fDIHm0ZiPe9VYCH21GSOiM8AzDnDm8EMuaceX47xfw/dqxL1rPt4uhomMHUdrvRXyF0mPyCu9yW/b1hTBsREpnNH7fr0ThuCm1J84ntY8OpKwkI724s+RnwqvX8LnX6Gtr5B4IIKUNzBqNwULUtWvkzyFw57Fhx1CFBqtyqWlGByQbtWdXDceYICYwvR/LCWcsgcYtcR15C/p2/g4JoY/xYgMRW3cLo6QAc9tUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HrQgg1XM5M93ddtCpp4OzJwj/lHoTpIcVcIplFjezJU=;
 b=BRxKdbrOzZ0ewvriv0kvVThQzFE3AEGPC4lcMQ9A1ERQmOL9cxxcAb3VgkBpgf+SNB/oyjlG1ew7aEf+HOpf61K0GkGyfnJMzUPm6YMy2VCj6kHAZkYw+g0IeB9pl7KTjuuE4yMvDm5IliaM10kvHTe3fhcRr+MSVcbtu37+hKpuxe9VvRzgzWYCeoR8oa5fdP/BbSrPhgAsIbjfCuoeYBNcCXVUIEYIgx6+9SJlyBdB10QrdbFzDIII7BLxGFobDrgwmaQBO16HKGwngB+o2Da5ff0WuU6oLLNGcTLsb+eFIalj43PzhuT7bHtnhJ62CgaesSAwGoEez3Gn2sm5qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HrQgg1XM5M93ddtCpp4OzJwj/lHoTpIcVcIplFjezJU=;
 b=nMFnTCAJZ4JXnuWgYbV5oiBLHjl3vr3ldxEisukGymrqXu1Cj6JEBGe/+hj2OzXNkmyXE743IoUolqjVDGY+ca2ZayheThvJMrJbbjwO32zL5Hd838puHlGb89p19N3Z6VIBVrAlgNyBLfDppSajoESGFGFXrtt/CCjHwKuanhobzGr/jVkiRZnZo010rbyXh3WK4zmUWcDinADFRHD9LvvFsjd+upb468U9chx+B3hvRF9k3M8LrI2kZWWmDNZwPThARI4qrRgk2MbI04eYUJZvRdvLyvBPVQrMnXfoaNX5u8qgafToih2Dp/0x9xLnDOzj2D1Qe/CUIGTLoIpKZw==
Received: from DM6PR06MB5611.namprd06.prod.outlook.com (2603:10b6:5:11a::24)
 by DS4PR06MB10763.namprd06.prod.outlook.com (2603:10b6:8:2a4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.27; Mon, 30 Jun
 2025 17:50:03 +0000
Received: from DM6PR06MB5611.namprd06.prod.outlook.com
 ([fe80::c8d:e215:300b:3ccf]) by DM6PR06MB5611.namprd06.prod.outlook.com
 ([fe80::c8d:e215:300b:3ccf%5]) with mapi id 15.20.8857.026; Mon, 30 Jun 2025
 17:50:03 +0000
Message-ID:
 <DM6PR06MB5611F88B8684C981CB986867C546A@DM6PR06MB5611.namprd06.prod.outlook.com>
Date: Mon, 30 Jun 2025 13:50:02 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [bug] spi-nor not unlocking on Ubiquiti XW and WA
To: Michael Walle <mwalle@kernel.org>, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: tim.j.wilkinson@gmail.com
References: <DM6PR06MB561177323DC5207E34AF2A06C547A@DM6PR06MB5611.namprd06.prod.outlook.com>
 <DAZRDAEP431C.26ALRPF1GSJQH@kernel.org>
Content-Language: en-US
From: Jean-Marc Ranger <jmranger@hotmail.com>
In-Reply-To: <DAZRDAEP431C.26ALRPF1GSJQH@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0031.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fe::15) To DM6PR06MB5611.namprd06.prod.outlook.com
 (2603:10b6:5:11a::24)
X-Microsoft-Original-Message-ID:
 <866d8173-0b19-4706-9d13-1647e02a596a@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR06MB5611:EE_|DS4PR06MB10763:EE_
X-MS-Office365-Filtering-Correlation-Id: d29924df-4150-4028-a36a-08ddb7fe8ad5
X-MS-Exchange-SLBlob-MailProps:
	30ekHghIwFrWESYOJg8k6gAFErGTINCbdJVh3Gt4AR1CkDOnnfcxtR1ma+v1WWZRNcEJDqThCSLelePEB89wnXnp4th4GZDxRw5rAsxih8+zbxXThTZP1UXqiOzO6ezksJkbnlNEeDvYDjR9ubr2oF/GSVJDJjoynoQw4i8e+OQEeFV1MkJEgb0YWlDmO18By2dxmQGQNPz7iLXt1l56n1fdQXM18RVbh/e+gVBORgYbsrM16v+rL6wA6Pt+9JkbmLGEhX/GXtfsWs4IweM6ylSPF3Vhs9TYKyhuZpvV0/CiAOXWS6e//eEpL0TvXRU72vlOfbDsjqDdmuNhLtxIncmlvU7it68xurycPYvHvaNMRuD4LHjWgFLHMnInsm/14lwCNsty5mCI997hqZFQ4fzgfM/b8FIR8MeHXpqD8Idtx4WVcTihTmZjAX5W/5UHPRneon5/QqDyn04l4t2YRARSYqEoeuvbrxmz8u+YSejKICMrWZAx0Uj36h2qx5pi2YnEDaPrTIk2dAi0LenarlsEWYJi4ji6FawLH/fmMknBfOxSueeYpEur/OXlgJGuc64TK6pLvN+SvGVKESqiHPLy3R7So0KNMThDw1D0Hr7Y1aMNhtyzpRBqupdvfG5pu+Py8egHK5cBg17Ie8NeiWq2LpihWK/rOWnxsxIONnTIMqYRp2vg7La2zgHM4zspuHovwpVEYaUxXf8/6CPPlp+8zdKDNQ4vesAPoLe0ligWqS2cUagF6pVYzyPrM6Cn
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|19110799006|15080799009|6090799003|8060799009|7092599006|5072599009|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MUpzYk5jWWMrZkNyK1ArWjRYUEpIOW8xQWFyYnkrWm5BbmFYTjdqMkdidlNa?=
 =?utf-8?B?UWl2TmtZcVMwWFc5aW5YZEplbnpXU1Z0MVFxZ3ZydE90WnlWUkwzQ1ltTlkx?=
 =?utf-8?B?OGtGakQ5V0lYZ3hZbjVhUmVrOU9KVG55TjNVYjM2MTZpdXU2eEZkQndsR1g2?=
 =?utf-8?B?eC9rSkoxL2FuamhoamJ6NXJzMkFpR1JmdUNRbFVONFlxTklYK1MvV1BxQTJk?=
 =?utf-8?B?RW5IV1Q3c3l1N2VLUnJISHVoNU1OSlREUS9YOXlxdkxRVGFNVUtFMXFrRW1z?=
 =?utf-8?B?WnlFOTFrOVJHaThhL1YrenpvQXE4K0dIbGY5b2ltOHpFSE1KanpqMFBkZUFD?=
 =?utf-8?B?MFRhbFgrQzlVWnpnWjB4eE1XZTV2eE9ReDNjcExKSkZwRGFRWXl0bytXcFlM?=
 =?utf-8?B?M0pDVlAxbGtHNFRvbXAzSENtQTN1RHJia2ZMTWhxN1ArNCtHTmY1Vm5reVJC?=
 =?utf-8?B?UEI2OWtsaWZvQXVCdWF5UFFETmI0QTBUWTVGRmV4WmpkSE1JZDVhdGVzQVNv?=
 =?utf-8?B?OUUySEh4b21DY1IyWEVIR0kvNGZGSmRaYXhQSU5pR2IwTWp6MXVkdjdqYXpE?=
 =?utf-8?B?dVZkOFYwWlp1ZWh5eG95dTZoR0xVWWFxUFdybkJqR1lJdklHUU8wbDFCUmpJ?=
 =?utf-8?B?UnFVK3ptUzZDTFJyU3V2WnZLU3ppTzByc1hHS1drMzdiZVh6OWdaRGtGOFlL?=
 =?utf-8?B?ckFSbTJra1J4K2xvc2Zkb3o4YzdlSzU4SlNMdlliM0k4QUNGKytHL28yUXda?=
 =?utf-8?B?Z2owazFJd0dlUmJBUEtvR3JtL1RQeUV6aEcraUZwcHVCZmtuVGVjd2VtMUw0?=
 =?utf-8?B?eW5welBmemRjYzhUYXBiZnd0OTEvTnByVXhrOTJQbkdZQmFocDVHTGhzUVB1?=
 =?utf-8?B?dGNKVlRWaXhiK0lOTW9QUjVKSUhiMzM4d0VteWt2S2wrOVVjekpDbk9yU2xZ?=
 =?utf-8?B?ZjljRlJsZVg2ODhiZnBBLzMvYXg2NE1PQmtaL3prQ092cERONG9iSlVSUVFO?=
 =?utf-8?B?aG50SGJuODB3aUdOK3I4am9JUU1tQnVraDJiL3FJdjJ6QTdjdTJyb1hRdVBl?=
 =?utf-8?B?dnE4dko2K0hYQ2N4UE0zbFRQMFJTVGJaempTS0hPQmJ3OHZjR3pBeFY0TkRW?=
 =?utf-8?B?RHlHQThjSWpMdSt0bys4OW9jbjc3K1JTUWxOR2g3Yk9RdlNkdVpnU3ZkbDNE?=
 =?utf-8?B?TFpvTDIrYksyaUJIWkhpZjNCckJRelQwVHN2Z2lvcXNMeVVJQnkrOXFGSXBB?=
 =?utf-8?B?SWxxY21aanptYVA4TDVVdmMzeHpKU1RYcnNYM09zR2x4VkxKNi9sRERzTVFB?=
 =?utf-8?B?L04rWDZCVzVIZ3F3M1RJMzlkNG9aNTZ6dWlSc0VUWlRhY3I3bm5sQjE2WGtt?=
 =?utf-8?B?Mm9MR1h1Z1JTandmajJDUkpUbEpZZy96K3ZXbDhuQ0NScEZ3bWJGaVBhajk0?=
 =?utf-8?B?TUdwZURPUGJ2M3djRUV1V2E0L2pmNUFJSnhLZ2hDZnZvMXcybzh4a0Z2dTRE?=
 =?utf-8?B?UXRTenBpME1Bc1RyaGFnMDRRYURZbVNYcklwM0E5NHpJM0h3ZDNTa2FEMXVH?=
 =?utf-8?Q?6LXCoD1SZSWmZgBbsdnCLIbOs=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXJzNWtCVG9id1g3cU5RM3BUSU16ZGNOeDk0QzNMdytXZUxDK2lRSnF2Ums3?=
 =?utf-8?B?djRTQmV6R1dabzdCWHlyTk5HUU1aenRwV0s1YkFlWDBveGgxOWFSWjVDK3l0?=
 =?utf-8?B?aWJDWHI2eGZqWmxJUDJQaGFTMkZGWktXRXpnM3U2T1VYUmFrSGJ3NTZZdzVP?=
 =?utf-8?B?TzVWc2NNTGptOXVXY2grNWxQSGJBN3RYNDZCa3h1VFd2L1ZoRUFheUtsYkdi?=
 =?utf-8?B?MzdBS3VDRzhyZlpRU3BLMllTTGNNcXQ4aGoxNW1OWTZ3clRHY2ZHMWN2Vmw2?=
 =?utf-8?B?djdOTC9FYU1KRHlrbmdNTGo5V0oxN2FPRFBvbVFiZWRERHVFeEQ4aHFacTFF?=
 =?utf-8?B?YUlNalRsa2FQT3FyN1U0NWNHaFNxRWJTenFFVXR0d2FMdXJCVFFhVTdvWWdV?=
 =?utf-8?B?MWtJaTEzVEVhbGJuWDY3dnVDcXdEYTZSMFJqK1FhN2l5ZTJpd05mcG5oRlU0?=
 =?utf-8?B?K3QzdkNGM0FRUEN1TGZhaHpwWlVycmZia0RPajRyVXd0RjhSSkNIVE9RekU2?=
 =?utf-8?B?R2UyVlFIcFgrVFFjUHpFZFhteXZyNk4yend3R2FlWDNnMXF4UVdTQklQOVl6?=
 =?utf-8?B?TnMyckZuemloRkFQczk4YnJDWFJNZDBadFVZQ0VGL0R4WjUwS0VMMGhRbnlR?=
 =?utf-8?B?K3VWQnozMlJmdUdZendlZkxqaE04WFpNeGlhdWs1RjZwSzZiZlEwbzZGb1J2?=
 =?utf-8?B?T3Bueld0RlBIaVpWajVQT2pFOW55LzdwYjJDbEdBNWdPMU0yYS9kWEt2bzUz?=
 =?utf-8?B?NXRXejhUN2JnaXRXbFVyenl5MGVpdUN3cUlYemJKWWNXK3JxbXF5WXhnaENF?=
 =?utf-8?B?OTNCU3VEZzJhaUtnTGpmNFRjU2VpeENoeDA2SnM3aG9wWFo3Q29aMFJoVEhn?=
 =?utf-8?B?YkRDVXNIRWsyUHZZUDF3WGtiNllrWmovVHZaa0hFUktRencxdkdZd3V6cUU5?=
 =?utf-8?B?MEhEU2lyeW80M1FHcG5admUzekVYUyt0L2NyOGV1TTEybWV4YTB5MDBqd0FP?=
 =?utf-8?B?KzlGdlErNVFMemxXa2dtSFNoYWR6MjFPaUJ4NFRlWCs5UnFUTC9VYVJvNXN0?=
 =?utf-8?B?aStOZlF1T2RCZUJEU3JUKy8vb01GelhwdzRsVFI0eVBRdzFBOG5ZSWo2NzFT?=
 =?utf-8?B?NnMzNTRUREM1UW1raDhWYjZ4YXgzR2IzYkp2NGt2c3ZNcmpqMHhKNXowcG1k?=
 =?utf-8?B?MEg1b2V2aWxaZ000T09FTHgzbE0yTGVsMThyaUhTaEgvajhhN2R3YVhwbDds?=
 =?utf-8?B?VmdaVTJ3djY0R0Rvb1FUcm13M1VVMmdMdG1oeHlRNmQ3ZFZlT0p0WFRmSWcv?=
 =?utf-8?B?eWkwZTVKbDZpVlBhZUI5UE5nVUpSTXJoWkQrNTREN1VtWGg1RmFJVWtCTmtD?=
 =?utf-8?B?Z2dESmdaY1RtK29xWjJCL1h0TUhWb1JweC9VN0dJNUNaYTNFYms5aUwxT1Jw?=
 =?utf-8?B?TVBwNmowUkxkZWtCajRaZzRXUFZuVmZzTGhScnowVXFLZ0dteU1tMnQ2N3Ba?=
 =?utf-8?B?N3lvV0t5ZEt6UFFSK0pISzVsUDlVTmZHbXRZTWgxaXRJOTJocnM2QXJJQnZs?=
 =?utf-8?B?a3Jidndyd1lrcFdQTndhbXJaeHlPKzBNVWxocW5kWldtYnNxOERneTRsWDJW?=
 =?utf-8?Q?LkmYiCHLEKmqlLplqDXxk1QTaYfAQJJ0I7neG6I39lMk=3D?=
X-OriginatorOrg: sct-15-20-8534-20-msonline-outlook-a1430.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: d29924df-4150-4028-a36a-08ddb7fe8ad5
X-MS-Exchange-CrossTenant-AuthSource: DM6PR06MB5611.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 17:50:03.7855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR06MB10763

On 2025-06-30 05:25, Michael Walle wrote:
> This seems to be due to the use of the uninitalized "mtd->size".
> Could you try the following patch which is based on the latest
> next kernel. It replaces mtd->size with nor->params->size, so you
> could backport it to 6.6, but maybe it will apply anyway.

Thank you so much for taking the time!

Your patch applies automatically on 6.6.93, with minimal fuzzing and 
offset changes. And it fixes the issue! Formally:
Tested-by: Jean-Marc Ranger <jmranger@hotmail.com>

Thanks again,

Jean-Marc

> ---snip---
> diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
> index 9c9328478d8a..9b07f83aeac7 100644
> --- a/drivers/mtd/spi-nor/swp.c
> +++ b/drivers/mtd/spi-nor/swp.c
> @@ -56,7 +56,6 @@ static u64 spi_nor_get_min_prot_length_sr(struct spi_nor *nor)
>   static void spi_nor_get_locked_range_sr(struct spi_nor *nor, u8 sr, loff_t *ofs,
>   					u64 *len)
>   {
> -	struct mtd_info *mtd = &nor->mtd;
>   	u64 min_prot_len;
>   	u8 mask = spi_nor_get_sr_bp_mask(nor);
>   	u8 tb_mask = spi_nor_get_sr_tb_mask(nor);
> @@ -77,13 +76,13 @@ static void spi_nor_get_locked_range_sr(struct spi_nor *nor, u8 sr, loff_t *ofs,
>   	min_prot_len = spi_nor_get_min_prot_length_sr(nor);
>   	*len = min_prot_len << (bp - 1);
>   
> -	if (*len > mtd->size)
> -		*len = mtd->size;
> +	if (*len > nor->params->size)
> +		*len = nor->params->size;
>   
>   	if (nor->flags & SNOR_F_HAS_SR_TB && sr & tb_mask)
>   		*ofs = 0;
>   	else
> -		*ofs = mtd->size - *len;
> +		*ofs = nor->params->size - *len;
>   }
>   
>   /*
> @@ -158,7 +157,6 @@ static bool spi_nor_is_unlocked_sr(struct spi_nor *nor, loff_t ofs, u64 len,
>    */
>   static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
>   {
> -	struct mtd_info *mtd = &nor->mtd;
>   	u64 min_prot_len;
>   	int ret, status_old, status_new;
>   	u8 mask = spi_nor_get_sr_bp_mask(nor);
> @@ -183,7 +181,7 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
>   		can_be_bottom = false;
>   
>   	/* If anything above us is unlocked, we can't use 'top' protection */
> -	if (!spi_nor_is_locked_sr(nor, ofs + len, mtd->size - (ofs + len),
> +	if (!spi_nor_is_locked_sr(nor, ofs + len, nor->params->size - (ofs + len),
>   				  status_old))
>   		can_be_top = false;
>   
> @@ -195,11 +193,11 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
>   
>   	/* lock_len: length of region that should end up locked */
>   	if (use_top)
> -		lock_len = mtd->size - ofs;
> +		lock_len = nor->params->size - ofs;
>   	else
>   		lock_len = ofs + len;
>   
> -	if (lock_len == mtd->size) {
> +	if (lock_len == nor->params->size) {
>   		val = mask;
>   	} else {
>   		min_prot_len = spi_nor_get_min_prot_length_sr(nor);
> @@ -248,7 +246,6 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
>    */
>   static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
>   {
> -	struct mtd_info *mtd = &nor->mtd;
>   	u64 min_prot_len;
>   	int ret, status_old, status_new;
>   	u8 mask = spi_nor_get_sr_bp_mask(nor);
> @@ -273,7 +270,7 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
>   		can_be_top = false;
>   
>   	/* If anything above us is locked, we can't use 'bottom' protection */
> -	if (!spi_nor_is_unlocked_sr(nor, ofs + len, mtd->size - (ofs + len),
> +	if (!spi_nor_is_unlocked_sr(nor, ofs + len, nor->params->size - (ofs + len),
>   				    status_old))
>   		can_be_bottom = false;
>   
> @@ -285,7 +282,7 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
>   
>   	/* lock_len: length of region that should remain locked */
>   	if (use_top)
> -		lock_len = mtd->size - (ofs + len);
> +		lock_len = nor->params->size - (ofs + len);
>   	else
>   		lock_len = ofs;
>   
> ---snip---
> 
> -michael

