Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010062.outbound.protection.outlook.com [52.101.84.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A333917A2E3
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 03:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.62
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748403197; cv=fail; b=iQq1qkVVb+gcI4Y6RJ3D5d9NcUJEVAyo946H/EdCngQRiyVIAc0iT+6T6GnSNFs5gQwkuustJTtu4Kdb/kjDAFGd/32URhWSJV547Sm2HjhWXDPE04qIoKBZa4/yqu0dNW3cUjYchXTFnX54aXoi/9DNC1xqX7Dm63lt5H7X+qI=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748403197; c=relaxed/simple;
	bh=/DhTP+wssoxrM2ZySpCHH/b5YvUI3jPtafD3D4eGL3o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GmX9K8B5PeQUEjAIQQ7CQN7vlN2Ve1t1XJBHIASvbWxhhlraqrJSt1Lnpzj/enQ2XaQGBd0xrNAOF3Hi4SA7NXiatITkTT61xvmbE2zmMibNBD/i1LNnS9+86ipf+R8EkXlBvkLlCqNdzw1Ygrv8j1Ehy3WyI+sZpKBTNJGJJW4=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=gYT2gAXT; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=gYT2gAXT; arc=fail smtp.client-ip=52.101.84.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="gYT2gAXT";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="gYT2gAXT"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=i0c+n9gmiy+oYmUiZdng7wsPFedFCeyKVTiyoxEWeF5alAjFrISuJ82hweH1L1SxmWWYOVQ/hm6ue2nH77ywADvBwjliOMUE6FILMTvewPPxle52HbtbfYrsNcZhuU+Ho1aVhrP6ODlzJXePnYqJLW6Nq92OqKjtSCeop1ASw/wbbJOEj6ggAZNOZjal9HdFRbeekMpWoqkqBtUFAbR4g0LI5PmcjI0efQy/uUheD3+o9elBgykkyq7dfmnKZdMZgxy+pZkW12ARIdZvPf0YTVqGHOKBB2cMPsX4Mdc/gn+/tcboEpmxd8zSlv4U2xt7HhB1Qmw3vLI/nb70MJ9T+w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/DhTP+wssoxrM2ZySpCHH/b5YvUI3jPtafD3D4eGL3o=;
 b=u4EOoDFwBPJwiJa7IwzO8nxwpd9/Ros333f4Xl466RqHswJYgdKzbmwYc2OYOSzU0PrhGYFKdNBCK+S6xPwLFVJHF5sonAID/dYyX7xpkOrHevE2xrnSr1N1kCvU5PIUqOTJk5aRu0GDOq2/V36JEYwXvQFaJENre9TAKmypympPv3ICVpb6OxxIUv/TMlOaEu/791hgado6OCFUHGrBIJospMI3H7fSXYcoAXvLjhSx+fmCJB47e8e4YGq4HlHvgyNlgn0/ZnGnaepsRle6zJA2FhM0lM4WPeRadHrewW7YrEcNnq086F1VAT2sbly7JMwmWxlW1vRoZNS5KO3+/A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oracle.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/DhTP+wssoxrM2ZySpCHH/b5YvUI3jPtafD3D4eGL3o=;
 b=gYT2gAXTfFdnrjRkIRGm125s+t/3r9yv6pRwmaoDn9+tMfVxvA+l9PgyLbUe+Dj/st/Kg/bpz73yzbYOGWnvujZtdiMmMXSzeBabwbyfM5bWUhnsWnScifoejvjydr0183TWp4oasDqHuTe/GnzZsOPdjIlY4e2qm9lA9jxSirU=
Received: from AS4P191CA0017.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d9::7)
 by PAXPR08MB6544.eurprd08.prod.outlook.com (2603:10a6:102:157::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Wed, 28 May
 2025 03:33:10 +0000
Received: from AMS1EPF0000004C.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d9::4) by AS4P191CA0017.outlook.office365.com
 (2603:10a6:20b:5d9::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.26 via Frontend Transport; Wed,
 28 May 2025 03:33:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF0000004C.mail.protection.outlook.com (10.167.16.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Wed, 28 May 2025 03:33:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IHfGjQ6UMXQl8qXD5ighAAcXQKmg2MTJOHvBKrE/nJtOqAU9L3ic4Nn8s78qmG8tcwudnlxrwm0BSLI48Kc3PakAE8ngUXoxm87mhWIM7um3TpOdyOfpvSJgVEvJr5Ip6caDeISNO7aYzOPkzvv3rQO2fR5wbm0XJDfJmlEG7pzCz3p3hTeCP3ft1AI0wdj1r5vNAuQ4dlXWai5GNH3Qjfk1e2d9Wrbhx9MCCW8og84X40PlKrlIIh/f/aL9FwBvMFyCq07DNaJnDGqbmoozDr5prulqxhN1/ttI2u9Lh0Z3Xw4MNyHlsOeZ3o67vZ2hr3i8TCMKlfnXveJQvYfhTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/DhTP+wssoxrM2ZySpCHH/b5YvUI3jPtafD3D4eGL3o=;
 b=OORId6wrlXNcJhz+7nByIJervivPskTqUW/mkNxFlLD0fW7kyKlEC02mACZ3+YvyDTQVH7Gnb2Ec2m+D4bW27jliF8j+APVIo4CJuQstyeEeENorv2YNvqtshyfJjPQXeU27NCV/zk68CGad07ZD15dxvTa4NFsnF1vUdTjfTEIG5MDbPJK0CyfDdZwt8IKRhhX3ApAbEWXd7n5UkEYCil120yaCMasVTuqmVXazq+10p/dRqRQfUFzuMYEsCQ/Phj126lDUaUTHPL+2LwKRQR91MUimQYIaFsVibSeeAUfwW1CxoE1Q3ZqFJrEvdbVGWB77vld85yaz9ZF3ONOohw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/DhTP+wssoxrM2ZySpCHH/b5YvUI3jPtafD3D4eGL3o=;
 b=gYT2gAXTfFdnrjRkIRGm125s+t/3r9yv6pRwmaoDn9+tMfVxvA+l9PgyLbUe+Dj/st/Kg/bpz73yzbYOGWnvujZtdiMmMXSzeBabwbyfM5bWUhnsWnScifoejvjydr0183TWp4oasDqHuTe/GnzZsOPdjIlY4e2qm9lA9jxSirU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by PAXPR08MB7351.eurprd08.prod.outlook.com (2603:10a6:102:229::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Wed, 28 May
 2025 03:32:34 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8769.025; Wed, 28 May 2025
 03:32:34 +0000
Message-ID: <170036fa-727c-4d2b-8ed4-0a1b6e4cf8d3@arm.com>
Date: Wed, 28 May 2025 09:02:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] mm: Optimize mremap() by PTE batching
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
 jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, david@redhat.com, peterx@redhat.com,
 ryan.roberts@arm.com, mingo@kernel.org, libang.li@antgroup.com,
 maobibo@loongson.cn, zhengqi.arch@bytedance.com, baohua@kernel.org,
 anshuman.khandual@arm.com, willy@infradead.org, ioworker0@gmail.com,
 yang@os.amperecomputing.com, baolin.wang@linux.alibaba.com, ziy@nvidia.com,
 hughd@google.com
References: <20250527075049.60215-1-dev.jain@arm.com>
 <20250527075049.60215-3-dev.jain@arm.com>
 <3d5d5813-7764-4667-937f-cec52f8b03c9@lucifer.local>
 <422a63ea-9211-4e4b-a37c-8d4c5e964b53@arm.com>
 <888a8314-b200-40b7-ab52-f30f0af93374@lucifer.local>
 <8ef715e7-76a2-4004-ac10-3cc10912c67d@arm.com>
 <67cf2131-da6b-4a1d-828e-52f0ff7fd0fb@lucifer.local>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <67cf2131-da6b-4a1d-828e-52f0ff7fd0fb@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0009.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::9) To AS8PR08MB7111.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|PAXPR08MB7351:EE_|AMS1EPF0000004C:EE_|PAXPR08MB6544:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a9fcdba-4aad-413a-d1df-08dd9d985dc9
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?cUNSdmZZamRlUTNiN1BMaXlJUnBZWkI5WTY1QXFhS3ltdlovTTdMSU5kUmVa?=
 =?utf-8?B?dDdHVVhCSjZzczRDY3hETXhZWExTSGgyMm85MzJTTDIvT1JEaDJMaWVTNUFh?=
 =?utf-8?B?d1l0ajZmelhRQ3ZIZkxQZXhnL040Qk1PaUkwU3VpalE5V3JHNlErWHNHamtK?=
 =?utf-8?B?UC85c1FHeEQ2ZWhPcFhSRmgvYkRHckVJV3RqanUrNHQwTlNLbkQ2eDVvMnBs?=
 =?utf-8?B?WGZvRXlJM3plaGxRME1KcDNOenAvcGN1UXJOaGF4WnpobnptYVR6Q0dFZnJS?=
 =?utf-8?B?cXVLbGRyZzdvc3ZOcE5KMHBMZkxYVmhXcjlhVStkZm14cUVmeUcvSnI2amV4?=
 =?utf-8?B?VWlIM0dZZUxZSFUrMlpDVDBDRURZcFBubUxoYUVpSGV2Mmh5cWdBbVJZNURM?=
 =?utf-8?B?WEZPRXRzeENjQk1Lb3RTZnhoUGllcFdrbzRaekhXSGNFTzZjdmUzRXptTlNF?=
 =?utf-8?B?amFZdXN6blFvWng1TDF6MzUrYTlMUHV4U3cyUWk5STBmUXdQeTZnWkk1eUhI?=
 =?utf-8?B?TTJVYlppVVAzN2phRUZSdVRlVGYvZllPQTJPOEF0N0RLbE9MWkFhZmhITWhV?=
 =?utf-8?B?amJhRy9ubnJNbFZycXBzd3R0QVNlaWFHMXJrV3psa0tGN212L24wNXR3N0lS?=
 =?utf-8?B?OWcwWFIzZ2VoTUI5SE9NYUVxZUhNSThhOU1SWTBIUlhrYzdWQWtCMmhQcDNa?=
 =?utf-8?B?Y0RiV1dtYjJiNnFuUFVTVFRabUhOTWx2aGNmSzhpMFFtdC95WE5kaHltYi9Q?=
 =?utf-8?B?ZHA2a0YzWlRFMUR3d2pqdG41bThKQkF3eXVpdnZoN1IvaGptT21tYmtNbW40?=
 =?utf-8?B?NDFvdGR4dWFNNnB1b1U1SGdjWUdGOW12YXBTYzJtRGFTZTJBQzlrdEFzbVps?=
 =?utf-8?B?VElNeDY1QVpHR2pKREFRdjRtS0RIWnRrSGU4a3c5THR2WkZsT2hlcDdlOHRO?=
 =?utf-8?B?NTlZY0NmNXovdzRwTnNqU0Qva0FOZFRJbmV4SGQrLzlpVlVEbFcySEk1c2RI?=
 =?utf-8?B?MkorVTJvSktuY3kwWko1QlUvZnJlTjFOVmtmejY0d1hvb0UrMnlMWkpkcng3?=
 =?utf-8?B?T3BYTnkrZ29zOUtFbE1iYzFQSkxJUEJPTnBab2QzZjJPZEpFcTZQVGRnMkEz?=
 =?utf-8?B?M3J6UnBRTmlNd3pwK1R4U3RSUktMNndQNzVXczJTbU1QV3hSclRtUk5CZ3VG?=
 =?utf-8?B?NHpuWDlzeWhqQVlLQThpMWJOcVoyS1laMklPOGN2ZUpKdEVYUVNwYW96U01P?=
 =?utf-8?B?MzNOR2svakw5d1k5cGE0cDB5c1ZVQTQ5Sy91anlJWUQ2bmE5UTJEM2xjc0g3?=
 =?utf-8?B?ZmNRb2ZuMFg1Z2ZLSmNZcGJ5UHlwR2FkQWtiYjVidnVKVm1LSzlPd0ZvaEhI?=
 =?utf-8?B?VldNMW8vR29nRG1JSHl6YlR3SitSU0FVYjRhQWs1ZGJwOTkxZ3RNeEs2ZXFs?=
 =?utf-8?B?ZmZObDlhcngxWm4vbzZlL0xhSjhiTkJmcTNhdFpxUGlIZ0dGUGd5N0MvYXlP?=
 =?utf-8?B?RTdHekk1Yk5TcEVMbUFKUitjUnlmVS9Ia2ZBcG1TNlIvdUlIa1VIWE4wekk1?=
 =?utf-8?B?c2NtWnh0UUVxUTFhaEFjSzJMRUFGdG5uMWlJREdnM0xReGFieUl1SWZMaHZ4?=
 =?utf-8?B?YW9hM3pnaWczSkEwZXRkSmVHNmZLVzAvQkdRVkdrVkJpZi9zRmhwR2ZLcmhW?=
 =?utf-8?B?bCtOeW1sYzBnWXE4NnR0b25udUE1U3QrME5DSno3S0Z4akhETFB2MlRDQndF?=
 =?utf-8?B?M2prS0dmOGs2cVpzWGJGZHlGWHpzOHlRN0FXeW94WDlCMWVmd1YvbndQeUpK?=
 =?utf-8?B?SkE0RnR0UWlhdHgvUFp5UkdkSkh2VXN5dWZ4VC9LeVRxaVJLOG5rSUFxckUv?=
 =?utf-8?B?blFIVG0yS1RreFVkUVRmTFIyTTdadXd0VVQvZTlRRkFlb2FDbVdkeGFiSHlq?=
 =?utf-8?Q?f3r0NPY8zsI=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7351
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF0000004C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	39635d91-9f28-4601-c68a-08dd9d984897
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|1800799024|35042699022|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QXpjeDIybFdxSnNRMG54aHkvZDJjT25HU2M2aFcwSkc4VU1sWXNLZ05zN0tH?=
 =?utf-8?B?N1FPak1VOWVqTzUrMUZJZkNpQTJzaFc1RUZFSmlQK1ZRMVM2dldkUFhTZ05k?=
 =?utf-8?B?eVZldGVzMURSaUN4VW95RnY1NDArdVZPamJxM1Zpdm04Nlh1emVxVlRxcHVW?=
 =?utf-8?B?cWswU0lJbmlOMzdQc2xzd0lKSVBRN21mM1BKT0hXVFArMVU2Z0tNWURqdVpk?=
 =?utf-8?B?Y3hpVWI5S0Z0QUFjbXNLQ255ODNidEViY0h0T1FTbkZNRGVzUkwwbk12Z1RL?=
 =?utf-8?B?MnpBaENOQ25MRlJaazBxeXc5bGtZL25VRkVTRkt1RUpqVk9DRVlPOXo0TmVz?=
 =?utf-8?B?QkN1bGFBZnFLUjVkUW9UblJqTFVQUkZLcVp0dGZ3SStkV1lsNlcwV0hYdEJQ?=
 =?utf-8?B?YlVhbDdONFRVUll4YldWcHJINGFTTmgrNHZZL1BCcFhzNjk4YThuc05la0NQ?=
 =?utf-8?B?ZFJjWFROcG1BU0phRW1Da2pmNzF2eTNzZzFnZklSQzV5Ung1biticG5oNjZ5?=
 =?utf-8?B?RFJQeVQrUDM0bm4wYXN6eXJvM0ZseGlRYmc1b2NqdFYvdkpxL0dhMlhEczAv?=
 =?utf-8?B?Z2ZUVFhLOS9mcDlzaXh4QWI1RjJhTzFWa0hDYWhRaWZ1dTFGdjhENmdSU3FC?=
 =?utf-8?B?aE9MY05RTWpVUUZDRDJSUVBLTXN6UnBPTjVIU20zem42ZitRYUdiZ0JRWGVC?=
 =?utf-8?B?WWUwdWJzVFdmK2UrY2ZWVERxNzBSQU56OVI3UkRZNXUxdVV5T3cwNWFaaWpk?=
 =?utf-8?B?a3Jkc2ZBNXZxTmo0bkE4cllqdVpEcXVPeFRoZHdiUlVsa2tDbGVib2JVTGRN?=
 =?utf-8?B?ak13eHplODVLdHNpcXovbnhTZmx1QWpjTkYvRHNFZnBNNk5MWjJQdmo3WW03?=
 =?utf-8?B?MXhwb3ZPZUExcEtBNWpmWmZVZXFxUFVUQ3MvVitXK2RTY2xOMk0xMkgrY211?=
 =?utf-8?B?NGdWeS9wN3VEWEpBL0l1TVdEQmJ2UStVZElUVHdjeVFYMGttQ3JhSzdyLzVZ?=
 =?utf-8?B?bHVSOUZqZVUvZzBKZW54THR2YTdIUXduL05zc2hIVDdVMXNFbm1FaWwvcDRm?=
 =?utf-8?B?Z0ZhSlZ0eS8yZ29vdklVMDB0eW4zSzZMbUM0UUZvcXY0NHV6QVhMaDBnSVZ4?=
 =?utf-8?B?djA1V2tHVkZiZ0pxWW9RVWoxMWk0SjdhYU0vZGFhaXFZUDFlbXZucGFBelho?=
 =?utf-8?B?Q3hySGZNZVhQZTZZTyswSjZFK0hicHM0U1BMMTZLMVM5YkNxNXl5S0FqUDUr?=
 =?utf-8?B?RVpwcVhGYWxkY2ZRYWJIeXM5QUp3Y3lPbXBBRWU3WWZtRGhrUnNNeHhFR3F3?=
 =?utf-8?B?a3B5eDVad2M0WDd5SkEvOFNEN3cyaDE1SnUxODVnclRGZDZvNlJSWkdkVkhn?=
 =?utf-8?B?QjhDS0txQ1lMWmFlWFhrSmhLdnZKSjRMV2R0SHo3Y2V5NlRhZG9LbjNVR29o?=
 =?utf-8?B?VHZkMVYzTVduTGVFclp5cVpQa0NMUDNlN2Jibyt0UldNSnF4N0lpYjZvZml0?=
 =?utf-8?B?WUhGTGpCem1IUU55clJXK2pJblRHdTl0NUJOSjZiZVhwalphU01rNFpGVmNv?=
 =?utf-8?B?WG9wM1ZZM3IwMWZtNEptOTk1R0MveUlPOUZ2Y3JrUnNQTk8yQlpLSXJKcVVQ?=
 =?utf-8?B?eHJqYUtnRjQrUGpuZSttdFRqWm5nQ0ZFa3dVWUJQOG51cVpEVXdVYWtzeXBI?=
 =?utf-8?B?OXVmMktJWTBLNW5hSUJpTVJzKy9Ia1lKT0JkT3l4UFI2eE9VbjcrclVSMjdK?=
 =?utf-8?B?dE9aN1BkMTJMdjZuOGJhN2tOTVk1ZUdZNHJ1NVRpRlFrVW0rL0F3eDZpa3do?=
 =?utf-8?B?Um5vWlJDQTZhNUc5YWljTlZYNWVybnlkNkl0aDFPYWYzVGVlSFRzTzVJaHpy?=
 =?utf-8?B?UDRmU3BtSE1KSEFFQkpGcFZFRlFaNDlNMC9KeGNHVG1YUW85WW9oUDY3bHFO?=
 =?utf-8?B?a0crWTFlZE1UQTlNRnV2alZiQnZmWE5iVmU2Y3BTanhFcWM3UDBISitLdDZZ?=
 =?utf-8?B?STNBZjkzRXFGaWhHU0syUExsZC9CTy9mVkFXVmlrNHFFUG1USFU2eWxrRGo5?=
 =?utf-8?Q?BPOWEX?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(1800799024)(35042699022)(36860700013)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 03:33:08.9603
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a9fcdba-4aad-413a-d1df-08dd9d985dc9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000004C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6544


On 27/05/25 10:16 pm, Lorenzo Stoakes wrote:
> On Tue, May 27, 2025 at 10:08:59PM +0530, Dev Jain wrote:
>> On 27/05/25 9:59 pm, Lorenzo Stoakes wrote:
> [snip]
>>> If I invoke split_huge_pmd(), I end up with a bunch of PTEs mapping the same
>>> large folio. The folio itself is not split, so nr_ptes surely will be equal to
>>> something >1 here right?
>>
>> Thanks for elaborating.
>>
>> So,
>>
>> Case 1: folio splitting => nr_ptes = 1 => the question of a/d bit smearing
>> disappears.
>>
>> Case 2: page table splitting => consec PTEs point to the same large folio
>> => nr_ptes > 1 => get_and_clear_full_ptes() will smear a/d bits on the
>> new ptes, which is correct because we are still pointing to the same large
>> folio.
>>
> OK awesome, I thought as much, just wanted to make sure :) we are good then.
>
> The accessed/dirty bits really matter at a folio granularity (and especially
> with respect to reclaim/writeback which both operate at folio level) so the
> smearing as you say is fine.
>
> This patch therefore looks fine, only the trivial comment fixup.
>
> I ran the series on my x86-64 setup (fwiw) with no build/mm selftest errors.

Thanks!


>
> Sorry to be a pain but could you respin with the commit message for this patch
> updated to explicitly mention that the logic applies for the non-contPTE split
> PTE case (and therefore also helps performance there)? That and the trivial
> thing of dropping that comment.

What do you mean by the non-contpte case? In that case the PTEs do not point
to the same folio or are misaligned, and there will be no optimization. This
patch is optimizing two things: 1) ptep_get() READ_ONCE accesses 2) reduction
in number of TLBIs for contig blocks, both of which happen in the contpte case.

In general, the patch should have a minor improvement on other arches because
we are detecting a batch and processing it together, thus saving on a few
function calls, but the main benefit is for arm64.

>
> Then we should be good for a tag unless somebody else spots something
> egregious :)
>
> Thanks for this! Good improvement.
>
> [snip]
>
> Cheers, Lorenzo
