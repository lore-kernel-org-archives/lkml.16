Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010051.outbound.protection.outlook.com [52.101.84.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7215B1EFF9F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.51
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750663603; cv=fail; b=T2I35f2J9lYESRibN8e4/lDFkTNZ2yyMjjPiL+m5CrfWBHmbGNmwp9MV+zj6Zp7TeQuKpYFxukiWLs/0BK8x5wISMEZ3Tq0hpTD4KOo51rpD7bOsRABihGnC8knVZVLyC1poiZclQi//2cTnHkiJiJvmzvkNAifwVXNC+6oeVGM=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750663603; c=relaxed/simple;
	bh=7VN/lSvZXluRri+miQSXKb3ARJ1WmqCA12N6rNcfL98=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=J1MDKiVcRUHpDOcB9XU1W6gWYyGO0eAvrVTu++EXxvx83SKVkZHqn6+6xVLzPnhTxVZ7dmm4YCnebZ5kKAtYmHKvuW42xohywyUal/gvAu9drngeAwqj+K7OV7Sr5jCOYJ75p3ixlk98EQ9mEz/iW9oZkyLycJfuZ/10V47Cqzc=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=VdxDw3Z2; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=VdxDw3Z2; arc=fail smtp.client-ip=52.101.84.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="VdxDw3Z2";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="VdxDw3Z2"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=elDJaT7alnJgCgGx0hgH1WVpw4YUtlWGTYdyvZx8barrnJZrNZy3IybWxuMM+y+CdTebtfpeaDxirhhnEOAkbxad7j0MuMRwBnwoA4yFC+yPzgjDODe3kkdjdlF7DsLcYgIBvF+bkv/MJrKJTH/soV6P5DQe0diaBXDkAXhPfkWsoAgcF/JLep5mKocXdcXfi2jiX3hlm5zJRSirx036bdWn988tbE2WqLySnNlECYXwm/E2kxec4zH56V1CnuREMBR3OqlNPjrUw+igL5NYwzWeWZrcAmSLjcGSus5cRkA3PH/vVp/wvNnFeYIdI3M4YbAj55TUhMnXiKn2vaqqmQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8LphNKyJ6jKWyXEl/uNo2EmDw7d6HFAB7bd7V2teYRU=;
 b=JXlrYxP7Mo6hrZvsZvUVCE0Ke6gHq/4OGXAtORKziJHBhDcZOCp8RZh2smPqmBayLYqfsIU8R4vDwudVeluQtsE1OAz68AqkdpRMdwX3Gk/8QRvJLlgdroOlufq1GCcOROAhtb8z1Xn9cbwI3gKIZw9uWcDfCx41QNw/r23F/sFLyuL8bQGlpuCciGxa+/LsADoHSTanbXWdM6V3hIZnRbo2LBeT1KlZmNnSx8o3tZtI4R/zwEwUgv/xYY9Epe7Lml6IGUENDExiCaLJYSTc7xn2C7oPtg7EKx/SUZNnNDcsoF+JtERA3+UjL+66E/F9m0pxRwqqHggneZYUXEbBlw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux.alibaba.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8LphNKyJ6jKWyXEl/uNo2EmDw7d6HFAB7bd7V2teYRU=;
 b=VdxDw3Z28jndDkm3hzmDTUtWog7HV4BzHT94NOOM44Xa7ZxF/wFm46hXgs21SiocaNk3p46K6rwYEJi31phVJF73YXTW0mZBOC5CRD6PBhhm2UwvNgwRtZtWxu9Yy6ecsm7ioeOfo+Mk3QSaBHBbqtPMgCtNs7AHL790Xi3KuCY=
Received: from DB9PR06CA0008.eurprd06.prod.outlook.com (2603:10a6:10:1db::13)
 by DU5PR08MB10495.eurprd08.prod.outlook.com (2603:10a6:10:519::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 07:26:36 +0000
Received: from DB1PEPF00039231.eurprd03.prod.outlook.com
 (2603:10a6:10:1db:cafe::f1) by DB9PR06CA0008.outlook.office365.com
 (2603:10a6:10:1db::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.30 via Frontend Transport; Mon,
 23 Jun 2025 07:26:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF00039231.mail.protection.outlook.com (10.167.8.104) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Mon, 23 Jun 2025 07:26:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w9vTCGcLeWbFRm3XPF1T9GD32pL2XEWFYmaZBY9UZd8+M6u5g9z00q/Yj0YO6fiR5U2Qh5zgPMKtkG0Wk7IpIzhrOZ0iaVqcn2NUVaoLzhNTvmcn6zrRkoUhX4UM2kCxuYhOFaDxFCWelCM55RvOlitBmAvuYP0X2BGMXx+zjLqPbVQ4aUojjuyxasMxsBv7H3Gp2TNlZBFqgwADsjofYhjol32WJ+sg3sZmo5jxbLUbWQEFQT9ac6HoR1Wr529FKP+Tj3hJ504FV1/Uo54DxN4MtdMqikeBXAwONHlqJwtQKTm0FMSaiHVJq9h83bLwq47DcCaoE0I+mKTiMUGmlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8LphNKyJ6jKWyXEl/uNo2EmDw7d6HFAB7bd7V2teYRU=;
 b=pFqxfh1ngCydTkgPQMd2Q4s8AWt/cs7xugrP+ATbWN4DrUOz211RfqYqLHwQiLefoI8Ma91UsfHxyLphaysK+9gn0bDE3hxaiDAX0QdxZf/MX6B+Ptase6v3u5a27AuZ97Po97IEynbd7GTnoPVQoLROLAciGQHxr2wa3eHkDnugjJ4cUOqPqo4n2PVAV0V3LMBK5R6Rj+EOh3C2EAJynSHkZEPR0L+4FOvG4qczGK1pjdwHJ2n95ROqxh1ABnm66sSI74e8MhaFEY8bEw6emIaWM6th9R10WjJ+FbbuoHymBn7Bl9atw+kDMf1J1HR/JFrEnN1XMWw609/BAzxQhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8LphNKyJ6jKWyXEl/uNo2EmDw7d6HFAB7bd7V2teYRU=;
 b=VdxDw3Z28jndDkm3hzmDTUtWog7HV4BzHT94NOOM44Xa7ZxF/wFm46hXgs21SiocaNk3p46K6rwYEJi31phVJF73YXTW0mZBOC5CRD6PBhhm2UwvNgwRtZtWxu9Yy6ecsm7ioeOfo+Mk3QSaBHBbqtPMgCtNs7AHL790Xi3KuCY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by PAVPR08MB9721.eurprd08.prod.outlook.com (2603:10a6:102:31c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Mon, 23 Jun
 2025 07:26:01 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%4]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 07:26:01 +0000
Message-ID: <086fae7a-87ae-4da2-a10b-f01af184c418@arm.com>
Date: Mon, 23 Jun 2025 12:55:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] khugepaged: Optimize collapse_pte_mapped_thp() for large
 folios by PTE batching
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 david@redhat.com
Cc: ziy@nvidia.com, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, baohua@kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250618155608.18580-1-dev.jain@arm.com>
 <d2aee3d9-d3a9-4c69-ad03-8e5774d12dab@linux.alibaba.com>
 <0c20196b-f5bd-4238-bbb9-316f6ac3078e@arm.com>
 <e60571f5-1951-48a2-b5c6-374bbde6b763@linux.alibaba.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <e60571f5-1951-48a2-b5c6-374bbde6b763@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0074.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::7) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|PAVPR08MB9721:EE_|DB1PEPF00039231:EE_|DU5PR08MB10495:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b776283-5a27-43b1-8ee5-08ddb22748a6
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?WXBETEpLWitFbThoY3A4a2YwMGxBNDJQVkFhNGRIaUVqYnIwak9qcWRuMTZm?=
 =?utf-8?B?ck13Y2xoOHArWCs4cmlMYkc1elZjQWlicWxGamZSbzg2ejk4YXJzVHBnaUpr?=
 =?utf-8?B?SzRIOFp0U21UV2tES1g1RTdQa3p1UmxWa0txM3ltL3IxVjg5OXR6NWdubzlM?=
 =?utf-8?B?THhaSEhubEgvcEw1b0U2a0tsaDJjU09PMExNamQxakdZSnZ1dVFPQk5IM3d1?=
 =?utf-8?B?ZzFuQjI0MFMyNkM5a0NDN0J3Z0NRUllOSkQ0OUc1MHhMeHN3R2M3WTNTYzZL?=
 =?utf-8?B?VDVKcXNuaDNNK0JJTTdubGdUTlhUNXZOOXY5ZW1SVlFmSkU5eWJhN2pXcWRB?=
 =?utf-8?B?SFRHMkxqNWpZb2VicXUrT1l6c3UvY2wrajdWZTBCREJUOU5iUGhWbVhqVnZM?=
 =?utf-8?B?MHdwOExhOWRoSGwwNzdIdmdFeVVweWZyT2lvZVBrdURUa0hLd1hTcUg4ODZM?=
 =?utf-8?B?bDJQOEdyMnR2U2hJd2JweDRPbTVUalRURk5BdlB3RnozVUhVZW9wOHBpaDN5?=
 =?utf-8?B?ZXpaZitlQzlvODhpQk9LU3B0SEJnZDlkbGlPY3U4RmJDeldsOFpiNk1KaWI0?=
 =?utf-8?B?OGJoRFAyWHMxRGFmK2owYlRIRTlqWi9rdCt4MkVKSUllMThpb2UwTW9xWVJK?=
 =?utf-8?B?SjlYd2lFM3l1Qm9IcndraE1sU3pCUDZXZ3FLT05uK1J6ZktjZjlqS1VhT1Bs?=
 =?utf-8?B?TFNBcWc3RUc3YU85NjgrWGNHTUZMQkpMOUlBWXB0ZUpHRWZUT1JFN3JxRW1N?=
 =?utf-8?B?MzVBendxTUlyUm4xZXlBQnB5NmRFWXQ1RzJpK0t4R2hWRDlKU0JrSXNLNk43?=
 =?utf-8?B?MEtDZTJBUzJxWUNwblRnWjBpcjMzUk9rZlByU0JGTTd1ODloa3FmMXZlbkVl?=
 =?utf-8?B?UG9ubW1CcVlPTEs5aVBTVlYxYjJOQWFVdmxTMk9tTFVsRjVucXp0SjByZW9L?=
 =?utf-8?B?ZkJXdjVXUXpTSlcvZERUWXVXNVBPSHBVWVkyWVZ4SUF1YURRYVFoQjcxRUdI?=
 =?utf-8?B?WCtDSHFwUm15RWxvR1lqaDV5UjVnOHJaTHErU2hlaUFXd1gzMTZRUzdZUXJt?=
 =?utf-8?B?VGlXaUZkMUwwd3BNS0JHS1FsRCtoTVhyVDhvUk1sS1FzY09Tc1VleGJnS0RJ?=
 =?utf-8?B?cTJHU0hESUdPWmVTWHMyNklwWTV5ejVwREp2emk2Sjd5ZEt3bVVLcUhSRzdq?=
 =?utf-8?B?NWRjMVQ3RXUvK24zMllqejE1aUlsQ0JyWUxUcTJMNEhhOUZKeWt0VUJiSU9Z?=
 =?utf-8?B?RXJKbENpN3gyNG1mMjZ2bWNtL3EzalV2Y0V6Q09reWNDQWh3UU42SE1pZmE0?=
 =?utf-8?B?bUdoQVZJWllUM0ljSElTQzVOU3h0ZHQ3b2g2OXBvSkJHcktlNlJGKzJOVUlh?=
 =?utf-8?B?Qm1RMU4zR1JwcmZWNG5qSE9qUFZSRXZxWUlHcEdPdUx1cXh5Sk1hMHZxSXhz?=
 =?utf-8?B?VlZDVnViWXFFQTJSVlNMcUdUZ1lYSUpnRmZtWGgrTjc5M2FoUVRGSlFMOUMv?=
 =?utf-8?B?d3B3TGV0SFg0WnJHUmVMdHJiMmQwdTNBNE1nbWFTbGdHendCZEI3SE1LTkds?=
 =?utf-8?B?Z3N4TUZPWGM2TENqSGFTOUovU0ROQldHaERuVU54SGdyMERGVnBhMHZnZE12?=
 =?utf-8?B?RkJmUkxHSnNPSElvL1crVHc0Q1FXZ3U1clFIdGI0ZUxBTm5UQlJ1cXoyZVQy?=
 =?utf-8?B?QWhHWmVMUTc5N2V1NlYyVEFPa3A4QUIrN3Jvd3hWUHdIYURmOWZldVU2R2ly?=
 =?utf-8?B?TFR4M3VYVTl0dEx6ZlU3UWFYNjBSd2RVWGpoNEhscDg5Q2k2VkVlUUZjNlpk?=
 =?utf-8?B?OGZJa0RtK3hlSlNsYjUvdXBQSVVYeVVWcHlOQzhKS09PU3RvT0JzSCt6N3N3?=
 =?utf-8?B?S3BkRktFWnVBcUthQ1hpTXdiajBvSTU4K0NyTzFUc1FxM1NYdmZkb3ZpdHE5?=
 =?utf-8?Q?Xce16S+IWgo=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9721
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF00039231.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fe5858dc-0c95-403d-46fa-08ddb22734bf
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700013|14060799003|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NW9ueHEzeVROTUcvdTZMWnd0SjVGazdQNittODdXRXBZc2ZIYzZuNWg5dTdo?=
 =?utf-8?B?N0ladEZoTWVXcDZaaXhvNFNjSElrb2ZWeWk4V2twVnh2dTVDSDJsbmdIL05y?=
 =?utf-8?B?Yk1YL1ZVWlQ0d09sSjlYV00wSi90M1VGQVVoa0hWTlBoc0ZoMUVYdUFLTmVP?=
 =?utf-8?B?ZlZwUWlveVhKdWF2UXY0V3VVUyt2eXBFeVp0NkxOTW5BZ2JrSXZ3eUJkQ1Jt?=
 =?utf-8?B?WWlsWDF0S2NQWnpOOGRtb04rSjl0UTFkcFZPTm94aU80WWdLWnBEZDhSU243?=
 =?utf-8?B?a2REb1F5aTRzeEZUWkIzT1BqckhLOFl1ZnpPcVNkaWJHbFRCVXNDdE16WDBG?=
 =?utf-8?B?V29CNFN4aUVKMnAvR2xsVDhRR0pBY3BZTDFrdk9YNFM5c1JUODJ1c3NUV3Jh?=
 =?utf-8?B?S3RNcjlFaHJtK3RyU09rdE0ybk0yTHVlTWNscDlkL0ZEQlFudHZCa05YWGdq?=
 =?utf-8?B?REFobEpXeDYvNEswdUp6WUpnT1VSNDJDNDZ6dmRnaExIM2ZOOW1XTVBManoz?=
 =?utf-8?B?NVpkTFpiS1Ixc2VoSUFLOXdXU05PNEhDNm5HekxuR2ljUndSOHFkZ3lMZjYz?=
 =?utf-8?B?WFJqNWtFYWQrR3d6NUQ1ZlpxVXdHSEpmOUJEMDhiaDR6S0s1SFBDeVJ5ZGZU?=
 =?utf-8?B?SGxaWXVtWDRWTy93TUR2NzBucHFIRTF5ZnZraGtRSG80M28vZCtNNWRmSTdK?=
 =?utf-8?B?Y2lsT2N2MWtxWCs3cGFJVkxsSUxzazF4L1hjaFVkbHYxalV3YTM2NUMzRVVU?=
 =?utf-8?B?T2hBMjJvYndGT3JTZE9NSFdSZXByRk51WjVzQVFRbHVDVWd3bkhZdC9JVkNX?=
 =?utf-8?B?bkN0TGxjdkFicW9mbG5YbVlQT2UwTlg2NDh0U0FQbGFxZFM3TVc3bUN2Znh2?=
 =?utf-8?B?ZzkzRGdESXluc1gvUCtGVmhvZjQ1dE1qYkNFWEY5Ung5ZEljaHJKaWJOdEkx?=
 =?utf-8?B?akNHdEZueFhsdFEzT2syYktUbUpOWFhZcEVyZXdDVURCQ0JlUFp6N1Vpbjhq?=
 =?utf-8?B?WFk5bnVaNVQ4QUM2NjBjRHJ1T05IODVFc2ljeFBOeVMweG92VVhFSndTNFo5?=
 =?utf-8?B?L1ZDWUNGc0s0cXF0OG1xQkszNjFlZjN1NTJVMEFCZWphNXhPazhnVnRvb1lO?=
 =?utf-8?B?cEF5TDFmTnpXeFVBYTBzc0V0NEVGMk9UUGZscy9QRUExeXdFSWg5ektxYUhI?=
 =?utf-8?B?QXdod2VEUVRoSGJKUGNIcEFRZ0xkRnJlUmFiSGpNemxFdzYwTFBLSVczeW1o?=
 =?utf-8?B?aWprbWxiT0tYK2FCSkJJcVhQWldxNm5HdjgrUEh3RUZkRzhEaUhCclV5RTRV?=
 =?utf-8?B?OFlVazk4SmRXMWQxM0N2cGZWakxWOWR6b2hKdStWMkFSak9sR3AzdjhBL0My?=
 =?utf-8?B?R1hwNUkvWUg1Q1g4cWNiR2RFOTloZ2h4WW8xZkRrRVk2L2JUYVJ6QnlISlZy?=
 =?utf-8?B?T3N2RUNLNE1EbytYUGl0cTh0R3ZyVjdqWjZycGVSaHJZQWxFcmFtbGIzTFlh?=
 =?utf-8?B?VC9CVVp3Rys3ZVdaTUFzN3FVdkpNZ2lvQnlTVGRzY2dtVk1vOUcya0JiZHc2?=
 =?utf-8?B?Wm9vYzRjRkNhcnRTMWZBVHQ1eGRNUk1jU2hlYXBIcCsvdHVCemZGNlNzaExy?=
 =?utf-8?B?OXdhdFBhN1lqMit6RmQrMWVvVUtoWE1yT3dnaE1tYWpoSThpNzM4SW4vb3Zz?=
 =?utf-8?B?RlFYa2I5Z2ViNHpRT3VXdTBiZ3ZWbWl6TTlyTHU2R2Zib3g4SmlYMGpnSkdL?=
 =?utf-8?B?Wi9mT1VGejBpRU9sVkwyQUNEWlY4T1AzVEdpeEVuU2I3d2cvbnkva3RmZ2xq?=
 =?utf-8?B?QjBqQmhDUzd4aDVYNHBOWHRQVlBZRFhicmEwRUFyeWN5bUxab0ZKemN2anFM?=
 =?utf-8?B?MmkyOHVTNm4rejltR0NmWDlJQkNiQTdIaVdScGZrZW05R1pWYmZVWDlMUm0r?=
 =?utf-8?B?Z09hYjZ4aytXZkdHMTdkUkRUUXc1K0Q1NjdONFQyQnZvRXlrWmtvNUlqN3Va?=
 =?utf-8?B?bEtTMUxLUm5hdkk5UjQ3alBQRDJJQjFRZjIraEVuSGF3dnhYcThVMHc3ak5J?=
 =?utf-8?Q?S7NXK+?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013)(14060799003)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 07:26:34.7642
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b776283-5a27-43b1-8ee5-08ddb22748a6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00039231.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10495


On 23/06/25 12:51 pm, Baolin Wang wrote:
>
>
> On 2025/6/23 15:16, Dev Jain wrote:
>>
>> On 23/06/25 12:10 pm, Baolin Wang wrote:
>>>
>>>
>>> On 2025/6/18 23:56, Dev Jain wrote:
>>>> Use PTE batching to optimize collapse_pte_mapped_thp().
>>>>
>>>> On arm64, suppose khugepaged is scanning a pte-mapped 2MB THP for 
>>>> collapse.
>>>> Then, calling ptep_clear() for every pte will cause a TLB flush for 
>>>> every
>>>> contpte block. Instead, clear_full_ptes() does a
>>>> contpte_try_unfold_partial() which will flush the TLB only for the 
>>>> (if any)
>>>> starting and ending contpte block, if they partially overlap with 
>>>> the range
>>>> khugepaged is looking at.
>>>>
>>>> For all arches, there should be a benefit due to batching atomic 
>>>> operations
>>>> on mapcounts due to folio_remove_rmap_ptes().
>>>>
>>>> Note that we do not need to make a change to the check
>>>> "if (folio_page(folio, i) != page)"; if i'th page of the folio is 
>>>> equal
>>>> to the first page of our batch, then i + 1, .... i + nr_batch_ptes - 1
>>>> pages of the folio will be equal to the corresponding pages of our
>>>> batch mapping consecutive pages.
>>>>
>>>> No issues were observed with mm-selftests.
>>>>
>>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>>> ---
>>>>
>>>> This is rebased on:
>>>> https://lore.kernel.org/all/20250618102607.10551-1-dev.jain@arm.com/
>>>> If there will be a v2 of either version I'll send them together.
>>>>
>>>>   mm/khugepaged.c | 38 +++++++++++++++++++++++++-------------
>>>>   1 file changed, 25 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>>>> index 649ccb2670f8..7d37058eda5b 100644
>>>> --- a/mm/khugepaged.c
>>>> +++ b/mm/khugepaged.c
>>>> @@ -1499,15 +1499,16 @@ static int set_huge_pmd(struct 
>>>> vm_area_struct *vma, unsigned long addr,
>>>>   int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long 
>>>> addr,
>>>>                   bool install_pmd)
>>>>   {
>>>> +    int nr_mapped_ptes = 0, nr_batch_ptes, result = SCAN_FAIL;
>>>>       struct mmu_notifier_range range;
>>>>       bool notified = false;
>>>>       unsigned long haddr = addr & HPAGE_PMD_MASK;
>>>> +    unsigned long end = haddr + HPAGE_PMD_SIZE;
>>>>       struct vm_area_struct *vma = vma_lookup(mm, haddr);
>>>>       struct folio *folio;
>>>>       pte_t *start_pte, *pte;
>>>>       pmd_t *pmd, pgt_pmd;
>>>>       spinlock_t *pml = NULL, *ptl;
>>>> -    int nr_ptes = 0, result = SCAN_FAIL;
>>>>       int i;
>>>>         mmap_assert_locked(mm);
>>>> @@ -1620,12 +1621,17 @@ int collapse_pte_mapped_thp(struct 
>>>> mm_struct *mm, unsigned long addr,
>>>>       if (unlikely(!pmd_same(pgt_pmd, pmdp_get_lockless(pmd))))
>>>>           goto abort;
>>>>   +    i = 0, addr = haddr, pte = start_pte;
>>>>       /* step 2: clear page table and adjust rmap */
>>>> -    for (i = 0, addr = haddr, pte = start_pte;
>>>> -         i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE, pte++) {
>>>> +    do {
>>>> +        const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>>>> +        int max_nr_batch_ptes = (end - addr) >> PAGE_SHIFT;
>>>> +        struct folio *this_folio;
>>>>           struct page *page;
>>>>           pte_t ptent = ptep_get(pte);
>>>>   +        nr_batch_ptes = 1;
>>>> +
>>>>           if (pte_none(ptent))
>>>>               continue;
>>>>           /*
>>>> @@ -1639,6 +1645,11 @@ int collapse_pte_mapped_thp(struct mm_struct 
>>>> *mm, unsigned long addr,
>>>>               goto abort;
>>>>           }
>>>>           page = vm_normal_page(vma, addr, ptent);
>>>> +        this_folio = page_folio(page);
>>>> +        if (folio_test_large(this_folio) && max_nr_batch_ptes != 1)
>>>> +            nr_batch_ptes = folio_pte_batch(this_folio, addr, pte, 
>>>> ptent,
>>>> +                    max_nr_batch_ptes, flags, NULL, NULL, NULL);
>>>> +
>>>>           if (folio_page(folio, i) != page)
>>>>               goto abort;
>>>
>>> IMO, 'this_folio' is always equal 'folio', right? Can't we just use 
>>> 'folio'?
>>
>> I don't think so. What if we have mremapped some bytes of this PMD range
>>
>> to point to another folio.
>
> Then 'folio_page(folio, i) != page' can catch this, which is why I 
> suggest you move the 'nr_batch_ptes' calculation after the 
> folio_page() check.

Ah. page will be part of the folio, so the folio derived from page is 
equal to folio, so it is large. Thanks.


>
>>> In addition, I think the folio_test_large() and max_nr_batch_ptes 
>>> checks are redundant, since the 'folio' must be PMD-sized large 
>>> folio after 'folio_page(folio, i) != page' check.
>>
>> As an improvement we can at least do likely(folio_test_large()) since 
>> this is very likely.
>>
>>
>>>
>>> So I think we can move the 'nr_batch_ptes' calculation after the 
>>> folio_page() check, then shoule be:
>>>
>>> nr_batch_ptes = folio_pte_batch(folio, addr, pte, ptent,
>>>             max_nr_batch_ptes, flags, NULL, NULL, NULL);
>>>
>>>> @@ -1647,18 +1658,19 @@ int collapse_pte_mapped_thp(struct 
>>>> mm_struct *mm, unsigned long addr,
>>>>            * TLB flush can be left until pmdp_collapse_flush() does 
>>>> it.
>>>>            * PTE dirty? Shmem page is already dirty; file is 
>>>> read-only.
>>>>            */
>>>> -        ptep_clear(mm, addr, pte);
>>>> -        folio_remove_rmap_pte(folio, page, vma);
>>>> -        nr_ptes++;
>>>> -    }
>>>> +        clear_full_ptes(mm, addr, pte, nr_batch_ptes, false);
>>>> +        folio_remove_rmap_ptes(folio, page, nr_batch_ptes, vma);
>>>> +        nr_mapped_ptes += nr_batch_ptes;
>>>> +    } while (i += nr_batch_ptes, addr += nr_batch_ptes * PAGE_SIZE,
>>>> +         pte += nr_batch_ptes, i < HPAGE_PMD_NR);
>>>>         if (!pml)
>>>>           spin_unlock(ptl);
>>>>         /* step 3: set proper refcount and mm_counters. */
>>>> -    if (nr_ptes) {
>>>> -        folio_ref_sub(folio, nr_ptes);
>>>> -        add_mm_counter(mm, mm_counter_file(folio), -nr_ptes);
>>>> +    if (nr_mapped_ptes) {
>>>> +        folio_ref_sub(folio, nr_mapped_ptes);
>>>> +        add_mm_counter(mm, mm_counter_file(folio), -nr_mapped_ptes);
>>>>       }
>>>>         /* step 4: remove empty page table */
>>>> @@ -1691,10 +1703,10 @@ int collapse_pte_mapped_thp(struct 
>>>> mm_struct *mm, unsigned long addr,
>>>>               : SCAN_SUCCEED;
>>>>       goto drop_folio;
>>>>   abort:
>>>> -    if (nr_ptes) {
>>>> +    if (nr_mapped_ptes) {
>>>>           flush_tlb_mm(mm);
>>>> -        folio_ref_sub(folio, nr_ptes);
>>>> -        add_mm_counter(mm, mm_counter_file(folio), -nr_ptes);
>>>> +        folio_ref_sub(folio, nr_mapped_ptes);
>>>> +        add_mm_counter(mm, mm_counter_file(folio), -nr_mapped_ptes);
>>>>       }
>>>>   unlock:
>>>>       if (start_pte)
>>>
>
