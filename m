Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0027D28399
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 01:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.153.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748482922; cv=fail; b=Gvksql7/DkkZwzPvBXStDj4MZ43p5/fDLNoCeqqY65oRNd7ArIrf5D2jEfJiyKinJAxttWqQSjrUL5uTXg04Bt4TjRqUiWAp+ZMYKH+3bXTu1kX7fGmW5o3t56FCIqlbVabhtYQQIzwF11OlVhLmiVwXGi6lkwRrmTeUyloMNgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748482922; c=relaxed/simple;
	bh=hZvjOBqh7Ti+y4dtyi6PtHBUn6zQJXMKifYYnaRiBwA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RjeGkRJcrMfNRCoz1gl1ehv17efDRubPaaLzINaC0MoKviRUX8lMbWrmzYO5e3nOoq1YPSNLOJcgqT7uZcErnN3+2uZ6H86fGrb8LJrKoOaaQM0BkCGAYwNw32SJrM5YCja2CJ/q9gfIurzwx9Zj33wvpzH5YeivZwFqC3vBo5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=h9eA5/pT; arc=fail smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="h9eA5/pT"
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54T02xX0009388;
	Wed, 28 May 2025 18:41:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=s2048-2021-q4;
	 bh=uKMYwzAYaaaPs1p5V6g6g2EsalQEaHI9V5eRT/5raCY=; b=h9eA5/pTH+6v
	hW/53sApEdsezILRSkTNTHvmqJ2+2ZhY8q7E8ZYd0ciK38vO2D3gNQMVX3FePvI1
	H44KcJscRDub9JVWkpf3JLGVH0JcW7EPgZyR/ayo+CTVXt62fvp/NiS4WP9u8IWq
	ARhNwPI+ms9YWQmnFNUgryZpX20whWENSKMxEA/kb6fY6jS0YmLojLTDCJRr7/R7
	dgbhq0jovje0z6SYv148sy3YfxidtE2YEOAiOe/xeX0GVM9HUwlyYDwn5IL9MWpM
	OKNGV9qo4bChjP6fvflx7aCkSldhbFD/vRHMg28Hz3+WDG+OKuQktzYGRmsPOoir
	/E6ZS0OVzA==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2040.outbound.protection.outlook.com [40.107.93.40])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 46wwd6qbf2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 18:41:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T9JHgLsyXLVQPqrEGP7IqG2tEnvzTRu1K5OOv3izg1mgz7YCo6rDH35dv1vUZ+7pwK0yg/5Mo8t0+0GNja6yH8VC+E8qWSU+yvuVjAD07RxwecpxdoZb6WOPjqDDViG/2xGML9u+M8lgYMo6MZ+c2AsrKGxf8rhlR2wt5uo37RVQ3r0Pq3jt/Asnpx9Rkn32r5eaMkFVncZJvzI2CamQ+pkpOgk3Sv+iBvLlBU8T6z0XYLpjTtRjl+BafZdlaA7NtGD4uu1vjAV8gbcfI3DaZuXtnJa17XVGEZmcQQqzNHk5hXjIZfP71Hhg9kv/EJoAvA/Rts39Jw+pDq5nPOFxdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uKMYwzAYaaaPs1p5V6g6g2EsalQEaHI9V5eRT/5raCY=;
 b=pf5mEGShSpsfv4IeTjRXcChMnqmlxxLNqgzVxLQidWYyTsl4udyAsn1ixRPFuoFEJLb1QzW6wMUa7SahA2QVSpVXsEL54kx53brVYRHVBzDNtm+XlA/MWcf5LmQynyKtoXxKcZbB+5ug51bvgKTxaHGiGrUcI7x07fbqFbcWNl3nYxUtCxSZ/aoRey74GejocGWviob67ZCzUsfbqrJw9MeXGw4Pgrtui0ttvRKmQLVkgVs0cymlO9zcZ5EzJEqTJEwtt0q0uFZ1ZdrsIxesYJQMocPup46TqDablSx6vU6WOCljJ5T7tzg03KGgr25JCIOhi2BfBgLP9giwZpOx8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from LV3PR15MB6455.namprd15.prod.outlook.com (2603:10b6:408:1ad::10)
 by DS0PR15MB5623.namprd15.prod.outlook.com (2603:10b6:8:11e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Thu, 29 May
 2025 01:41:42 +0000
Received: from LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::595a:4648:51bc:d6e0]) by LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::595a:4648:51bc:d6e0%7]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 01:41:42 +0000
Message-ID: <8a65afe3-30ba-45ed-9862-361376873ee0@meta.com>
Date: Wed, 28 May 2025 21:41:33 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH 0/5] sched: Try and address some recent-ish
 regressions
To: Peter Zijlstra <peterz@infradead.org>, mingo@redhat.com,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
        mgorman@suse.de, vschneid@redhat.com
Cc: linux-kernel@vger.kernel.org
References: <20250520094538.086709102@infradead.org>
 <20250528195944.GB19261@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Chris Mason <clm@meta.com>
In-Reply-To: <20250528195944.GB19261@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR02CA0069.namprd02.prod.outlook.com
 (2603:10b6:207:3d::46) To LV3PR15MB6455.namprd15.prod.outlook.com
 (2603:10b6:408:1ad::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR15MB6455:EE_|DS0PR15MB5623:EE_
X-MS-Office365-Filtering-Correlation-Id: b2ca7c2b-9c8f-4e4d-d35c-08dd9e51f686
X-FB-Source: Internal
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NkQzVzlxeUc2bHFqdFpCMi9UOFhJVURURTZBQ3JKbEw2STNjTjFYSlNoRjhW?=
 =?utf-8?B?VjJYcGNKekRsaDE4Y3M0TE5YZ1RlNHRKdFk1MGdCeG5RNE1zcUxZZmFaRVlr?=
 =?utf-8?B?Z0I5bjl4ZVZuMU1iYnNDQUQyNTluM0pnaE51SWE5a243TnFnbG8yL0dIMG05?=
 =?utf-8?B?ZngxUEQ5a1pIRERoemsxMFZUNGVZY2lnZWpCaDd6ejg5K3BFM3o4WXp3U0Qv?=
 =?utf-8?B?T1RvL093eStrOGZpZ3Z0M3lWZEMxUW9sOWVGaUQ2RWtnbFhlc25FZllXbUpi?=
 =?utf-8?B?RUN6cHZxYTJIUk5ObVVKQU1LSnQyaWV0TVRyVFdzSWR2Q0FSb1lRK0duckZ5?=
 =?utf-8?B?RFRkSVliTzBncncvc21QV0diWS9HYjBlUmJFTERBUkJOVitSU3pzQWkrODhU?=
 =?utf-8?B?R3U5SFpEd0pnNW5ock45OUlUUys2amRlcEw5UE1yMVU4UW1Wayt5K3Y3RlBF?=
 =?utf-8?B?NDNNeWdZNmVTY1A2MXlpQkRDbEx5d2lJZm8zSkUrY2tMYWtiTGJUSkljQVht?=
 =?utf-8?B?cnV3Nnc0VkVNOFY0dkowUDh5eDNwc0NpZngvbGZYOHhKN3hsdWI1c0hwVG5U?=
 =?utf-8?B?cXdIUFRaazNUWTM2bWFhL3hlbU5aNENIN3Z2ZXZkNFVraWd6cUM0bVNnRTF4?=
 =?utf-8?B?M2RObkNmTS8ranNDMzZ2Tzk2UXBqZStOc2t0cFczS2dFVUxaWlQ1QS9SalFL?=
 =?utf-8?B?RjZ4NXdyNXVMelZucCtkZkZNaExxa3BlMXcyU1JjTWk5WDNTSmFnZ1RRbDhT?=
 =?utf-8?B?UWcrMGRibnVwbUNuYW8wR1hlNi9SSmpDQ2wrSFVia1MwSzByMS9sZDV0V0Rt?=
 =?utf-8?B?MERSSDZja0loeXJ4eXJac2g1L1p5cFRxalhWOGNNZ2FBUkJVc01FRkNmNmZY?=
 =?utf-8?B?T05TSEFCVnIwSXlHc2MveUlUclE2UUFyQjhqKzBqVERmWUtkS2k2RVV1WVNR?=
 =?utf-8?B?ZUo4aWFtMEpBRGxxOVBnYzYza1hrZDRZNEs3UTVzU3B4Nk4vZld3QVNDNjc2?=
 =?utf-8?B?MGlFNlVYQmFVeEZuWHNqSnNHNXUzUGo0azh3WHhYbHA1OVlMcjZHQVQrN04z?=
 =?utf-8?B?V1N4Q2psV3JBOFYzZ2ZobVNPeXYwWlUyVnNhaXlIMU9HdmxVMGdQQVVBbU1v?=
 =?utf-8?B?MmsyMHlEdWE4Nm9JMFFmNEFna0djRmZxMXVUbWs5WGlWUDVHYkpVSkVXMkcz?=
 =?utf-8?B?dXQzcG1IbmlNM2t4cWF3TG1CZVc1bGVad2MySmwrc20zTDRwcU82WlJZUVJo?=
 =?utf-8?B?bTlHSzJUTWxJd0M0ellQcXFoVm1nNFZ1UGMxbGMzNXZoaGsvd3dxZnN2d0Ft?=
 =?utf-8?B?RVM4Vk5tOWxsWTdzajBxbFhXYkVTZTJHckpuUHREcnFSdTQ3SGs5UGdoTzVo?=
 =?utf-8?B?blkrcUJMTVlZbFlrWG5sbmpjVzRIQ1Zia2srWDUwcUY0dFlGT2ZJK2NUcEtt?=
 =?utf-8?B?OUZhenVXSHNQUlRYMEpLZktEU09LOE1DVEliOXZodVJlc2JmZFZSRytkUmVL?=
 =?utf-8?B?a3JXVXMxQThnYytBRmJrdDJBTVF5cnNvd1h4N01pZzlLOVF4NWxxV2NwOGFw?=
 =?utf-8?B?QkRtOTNxVkU5d0Z0REN6TUw2c1NtLzVYcjQwOElmdFJoV0NCZ3d4aUJ5bnJX?=
 =?utf-8?B?Q2ptZGFyUHdhUGFMaXBNR2hwc0xCaCt4SnZCbzBuTTVDUjYydUVHdExIUTd6?=
 =?utf-8?B?aHJBOXd2cnpUSFE1czRPR3puYXFBQk5uU3Ixb2MxVG9VWXpWUFI3RDgyeVJ4?=
 =?utf-8?B?YUFtZDR4Z3FZVzhPMElhWTR2eERGeFNmdlVyQnYxcHJHZWFqaDdlWUNvQlo2?=
 =?utf-8?B?TmxNNmR4WUgxRDlzdDhiUWFtR0xYb0xiUjhHUGJidU1OeEhEbC96NyttUjR2?=
 =?utf-8?B?dG5scEthRmU1TzdmeXd1NEZTVWxWU1BycU8xbzNUQVJUTnA3d3IySUh2Z3k4?=
 =?utf-8?Q?/a9NL7qu34o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR15MB6455.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YzZ1bEIvUFR5emVoUXFZWXVIdFd5dkJGUHhpbllJN21QdFJ1N3N4QllncENL?=
 =?utf-8?B?cy9Rdy9nclU1UTZUTDREb09MQTNZMHQzRU9zNnE0Qms1OHJSY1VEZW1tZkRm?=
 =?utf-8?B?ZzVFQ1pONTZ3QlJSVGNvSW1jTm5jemw3RGF5QmdpQ2s3S0VlZy90SGFqZEk0?=
 =?utf-8?B?TzFPUDJLYmplVmlLTkYySlNHd0FMc25qMmt5NGc2N1VvR013SlYwNVRwZlNh?=
 =?utf-8?B?U3FjTXY3bkx0dmh5NktwTk9GQU1xMlpqT0RFbGVGc09JQ3RmM04xZVN0Zmxu?=
 =?utf-8?B?RmpITjRGYS9GUGxzVU9qZGFwTHBWbGM1YW8yOW5jL3FsM0x6UlNpUWF3bzNF?=
 =?utf-8?B?YzBubjJTV1Naa0JwME43aGhaWGVUTFNNbk9JYm14ZFp2ejBHUzFqd0JudDVa?=
 =?utf-8?B?dUh5Wmo2UEN5SERVY0pUdExIa29Tc0dyaTBFb0Rpek9WRzdkU0hQTVhnNytx?=
 =?utf-8?B?cm1QaUcveGdRUnNkbHFNNlBKOFpMeWxlNTlqWEpURUZTcjdFNXc3d21hcklP?=
 =?utf-8?B?R0UxQ3ZpaThaVXdoR1UrMXRYMEZQb1VmSDYzZmFuMlNMTnJmcTR0NHBuM1dY?=
 =?utf-8?B?RUpvbUgwRzhvcEVVMVZ5WVMrTEdCaGk0M0pEVXB5aWFXTCtwbnN6K3R2QWF2?=
 =?utf-8?B?NzFvMkpVTjh1TzVhMG92bVMwWStad3FHVTgwRk1BOXhYV0pTbm1KaURqQXll?=
 =?utf-8?B?UTJVSWQyaEVvaVg4VStyMXo4KzBJdnRnM29wN0o0MUN2bjgxYUhpUDEvbUZy?=
 =?utf-8?B?VGV2R1RPS0ZrNWlUamJzYzNRV3ZLemdyNW1yYmdpdUFzeWNQS2k1WWwrSmdk?=
 =?utf-8?B?OFpzN1NuMlZvVWx2NGtoN09FOEZsWnpjZEM1b0JJcUJtM2ViVHpsMnNFZDRU?=
 =?utf-8?B?TWROai9kWC8zQUNaL3N4RXJrZzM2cVJoNTRzSFd4b1U4MWQyeDg0b0ZNZkIv?=
 =?utf-8?B?Mkk3ODB6bTgyRmx6OFZNSytGbGYrYnl3NGZTL0h6LzdOVFg1T1Z4and5T1Ji?=
 =?utf-8?B?eDFLZlNXd0RULzhwNU1PKzNnYk1YaHhJZ0JIcmpBK2pEYTI2aE4yWkQ4ZGFE?=
 =?utf-8?B?UXZENUN2d0RYUmh0TEwrOVJGKzZvUWZnSDNLYjRYWEhFTGhZVUdGbkhFVmpi?=
 =?utf-8?B?Y3FJNFRreE1ZazhXU3hpMDBGeFFYKzVlYkovZ3pxenlUaDB3QzZsb1dWOTh0?=
 =?utf-8?B?SlFaNEliaXBWbXUwWjBGRmdCQ3g3cHRiQkwyMFdEK3dVZTJLdmkvQzI5OS9J?=
 =?utf-8?B?UlBZYld3WW1HQ3VWRzh2ZjljSTg4akI5USs3Vlc1cU5MZkxYN0FRMnMwWTJw?=
 =?utf-8?B?dk42b253LzFNd1RzMWZQWWRNZG9XQ2V6U0dFV1gxb3pNY3NJL0ZQeFVGMkdN?=
 =?utf-8?B?dFVDNzdqcGkrSGNsZll5N2psNEc5UDgyejBnUzNnYUMxV0JSWGRQWktwMTFo?=
 =?utf-8?B?Y1JuSVc1OHpIang1NW44VDc5REptREJNQ1k1L2xJcVNHQmhvODZYUk1LaG5B?=
 =?utf-8?B?RStLVXVoZEdDa3JuckdvN1lYb2dIVEF4UzZMcG1aV3NqWkdXeEg2cUJTakRW?=
 =?utf-8?B?WDJTMUtZbE9IbGZ5ZDZ2N3JDek5tdVV2UUVMM0JmamlTN0s5YU93TzhyUyty?=
 =?utf-8?B?ZFVEN3NzUGNwazlpOUNOV0NiVlkxdGJjTmZqRVNteVk0ZzJybmMrNkl2dHRo?=
 =?utf-8?B?K2taNXhMQi9leUZwMlVmNzFFYmxUNEdscjMrM1dWUWY5c3g2T2xUclF5aGZn?=
 =?utf-8?B?bUVpcS9GQnBpbUdua3pzU3NpWU9KU2t4TmgzSlJ2NkxSbmlNU1NJV2kxRVh6?=
 =?utf-8?B?ekRwdzV5dE1VNkFiaW5QZ3Q0SjJEeTNsSVN3K1VzSFV4bGxBcVY5VlhVbUtm?=
 =?utf-8?B?dlVMdEp5MWx5QXFYdE40ZVp3Sm9QTEU1QTJ4TFBEd01jU29EQlZBR0h6WVVG?=
 =?utf-8?B?amwrUTNnYlhFS0JxQ2Y0aE4yamNDb1JIQlZpRElGTEZPcmI2WFFkOHBXUjEw?=
 =?utf-8?B?bHZROHRCYlhEdWY2b3JxM1BoN1lNSzJob2VONjBTR2wzYjlMemF4RGJOdERW?=
 =?utf-8?B?RFlreENBNGhNeFFYaCtWYWx2WDBpekVndEt2b1JvVUZCaVZIWnFOSm1Md1RN?=
 =?utf-8?Q?6VxY=3D?=
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2ca7c2b-9c8f-4e4d-d35c-08dd9e51f686
X-MS-Exchange-CrossTenant-AuthSource: LV3PR15MB6455.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 01:41:42.3249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ATwdefMhjSwOJdo+vKjq1F56Ll9vzhn86vlPAp+Jd/gnXeyvqfY3qE04KhHE65p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR15MB5623
X-Proofpoint-ORIG-GUID: mQemPf_weMgpQN3vYnDyF1GEdUsmazNO
X-Authority-Analysis: v=2.4 cv=YLKfyQGx c=1 sm=1 tr=0 ts=6837bb59 cx=c_pps a=k9k8JJMjf9kFmI91X82Fjw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=3gwvlTsiGaDvRPS2yPQA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
X-Proofpoint-GUID: mQemPf_weMgpQN3vYnDyF1GEdUsmazNO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDAxNSBTYWx0ZWRfXxUzuSOtC7Jra 99cIDG4k/NEIAL1RplCjtB9re57dp1+2ea1BRLCDF9hqNVAL1sOcLLkbZKz1QSsRpxw0zjMdzrj 9+DPQYre51fmpOCtsChw745kOSFLx7NzwdRj0977y343Y3MhocURx224a9FLg1gucBjg6xVJBA9
 GzI/JnuEmqemV1OK45awnHxOBaAjsnr18D8H3rRjeeVTCJK4IoDMHoDXuG2j2IjQ8ChOcHDHnpD Bx1sp/i7+eiQiRRA2lYOvnypkWNIgEBZzfWZz0OGfEUtB+rjKN0BtmD4m+m/UFcesbnZYyob4Y0 Vqm22GlBZbWY9XLIpgPEScXkzZbB7r59UaoRlivr7U69YjCatoLO6jSXd/BkpA9YWFeqLTYbWIF
 UxTVuSsFlB27iKRqEO8gMb+Yecl02qUNdV4G7v4nNBTM78TigcYdWDbJdNWDkHxPhUG1S4RO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_01,2025-05-27_01,2025-03-28_01

On 5/28/25 3:59 PM, Peter Zijlstra wrote:
> On Tue, May 20, 2025 at 11:45:38AM +0200, Peter Zijlstra wrote:
> 
>> Anyway, the patches are stable (finally!, I hope, knock on wood) but in a
>> somewhat rough state. At the very least the last patch is missing ttwu_stat(),
>> still need to figure out how to account it ;-)
>>
>> Chris, I'm hoping your machine will agree with these numbers; it hasn't been
>> straight sailing in that regard.
> 
> Anybody? -- If no comments I'll just stick them in sched/core or so.

Hi Peter,

I'll get all of these run on the big turin machine, should have some
numbers tomorrow.

-chris
