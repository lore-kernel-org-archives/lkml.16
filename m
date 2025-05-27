Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012040.outbound.protection.outlook.com [52.101.66.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A8F278E7A
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 16:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.40
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748363244; cv=fail; b=cFwE77BcuEogWQHOQgdWOBfvMWWITyn5dsfZEMF3TzQHHbusQg2H72nOotdaCJeuhn0Ziaz3hRvey5Cs87m2gtCoY85oeQe6QEscbqfoTqcibss4IpJnMZGN17XjdBTY+21H1qoeSXTVHzHwdR9Pq8m3TEORfdgvRtWXLfL8SfY=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748363244; c=relaxed/simple;
	bh=d3xgb86OvGS7gGyMpsgWCUre5NZZzM4gTiubaL6qefU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FTU2R+rxDtUpuChw2i4N/BfTDqGhSGBDJlGlwKiAyAk4LShVOG1SD5rb6gFQXg/T56ow0csUzjNQHaa8Q3lKOdvPUSk/TPUNAFFtXODTKpvWabP8TA/C3wqAuqns80lBrmpMRRDH0UMs0G24cQFu3gqAX3jEhjjzytZMrw4sbpI=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=rC3Cl2ra; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=rC3Cl2ra; arc=fail smtp.client-ip=52.101.66.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="rC3Cl2ra";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="rC3Cl2ra"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=cOtdxD+XPC9iJl9SXZqnPuQh7Su39QZMakaQTZnJk5zjPIQX5EZRz1Qgs+EFBI1//058tg3rFe4HdZq1Zvln3AGdM67NGhuHOT0oQ95bDyl/Oc6P9w/PknwpIpbzK5kKBtqIYAJjMesX0fE5iYpFLVLptAHJanlSyvh8Kzebh0FA7Th3cgeA9yQWODmRuiwoY3BTojm7c3UBHJz31jjdJvNIZkQbl4eAoWkFk8LYMup6lkT9K//V+FdsGSh6uOXiDBLfopbmADe0wb+Hh29CN0c5tFJm3+nUQSrym6Ws9YrK9PbUbZuPB4A9WiJHIWob4xXOHS43ZUqboqCN5M0mhA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3c4xli48AA1eYklHj2sWN8psYDIzJNOFfQPHRL5opv4=;
 b=Q0j9rj5i+cLj1Iz7ktr6lgHDlFxF1wB4KMo8drmMd6wZrxWZjMeZpyJBA6jeKb9yvzUWv4b6eWGXrBnFtiLIWr+OR069BiDhchcgUVZ7AvNzT+fhnaTdJAWZfm1XbFMhXHYPb6bBH0w1KB3+hPPm/SNdAOhYytxg9W8B8pNN/qjHnLuYT7pU4e+8kYb8IpVHHd1bUIQ72El4GddErfzGGZBiIMpx6uNZG5zs5I83qQoN0yg2NYLLx4p88A+33xONyd/vLGFn7hqNy4ch7A+tzDGWFZ7nzcolrK1ZGYNQH/BJp2gaPSo3wCdY1/AALHV7FGLBQP9sOvfJaQYo7kSAFA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oracle.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3c4xli48AA1eYklHj2sWN8psYDIzJNOFfQPHRL5opv4=;
 b=rC3Cl2radRhninvMXwkepLqP3bkMIPmU9fQ9omUPUz+2ykrHzhoJE/VdxLD4kpXgvi5g6gBS/oqV4VEyy/VZ2OBDGS2DZvXBRn8wH6+ZLOB/sDB3zCdfjJtDL1ySELbApHnbYP1QTK64mhhiwCJbbBjvjwvjHP1C1R6O4avuzvQ=
Received: from CWLP265CA0530.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18d::22)
 by DBBPR08MB5979.eurprd08.prod.outlook.com (2603:10a6:10:205::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Tue, 27 May
 2025 16:27:18 +0000
Received: from AM4PEPF00027A6B.eurprd04.prod.outlook.com
 (2603:10a6:400:18d:cafe::36) by CWLP265CA0530.outlook.office365.com
 (2603:10a6:400:18d::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.29 via Frontend Transport; Tue,
 27 May 2025 16:27:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A6B.mail.protection.outlook.com (10.167.16.89) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Tue, 27 May 2025 16:27:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yypFKYpHvGVOxwdVSf5sBir7/J/QaBU5BS8brNLFy5R3HHkbrWEFP9wl+/5qlXSj4y6qKWED6BLKEhfV3vBaokhV9jswm8YKJC9NVmssjlRSYYC0FHIJDVNbfrbTA7c5TNwLoz+u3WfGzG/edxp86E9LNDO72RvtbIqfbM+l/xnfO6j0lp3alkFWksWjzTmomBoH1LvggR6Cw5mXdM/pA96Hz8b6A1LoAIijVmruPugwIObC0fH5Z9zzc/UHwC34YGx58MXKECAubOJfRVJsqnG4xXg6+/Qj5IDZaRVs1HVs4SSIxWHfZRE5xNXRpcZjqMSc5TbQusTJ5OoOgsp/QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3c4xli48AA1eYklHj2sWN8psYDIzJNOFfQPHRL5opv4=;
 b=MIjmnRd2Hyv5NSLImDK2Kr0JROZyBADe/z8MDIg/8IyukSWSRpLQ62En39DAxfPg8wK8BwmJfMn3Qrryi8dlJIftFNOpqUEoZ/luvUBHd+O9mb2PNNNfpivfdEvgIF2E/Dc2ZG2ZB6YthoRrphw+iBBcVSbR4oVQ1Ih0SlwL4lw1T3PjrBxraZ7GzCmWCMOdxP5PDb2cx1j8Lghm3cLjPVZEOp1IMmszXeupDWGdGGihsJXut/PKSsM65eJgzkv0yDwnAhj7gtTCDG4UtbmtRGrdpfhBx8nl2XKte9YHFfQwOONix2y5xwbYKoLNy8WoATFGSc93KLSrFHa9yBuIow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3c4xli48AA1eYklHj2sWN8psYDIzJNOFfQPHRL5opv4=;
 b=rC3Cl2radRhninvMXwkepLqP3bkMIPmU9fQ9omUPUz+2ykrHzhoJE/VdxLD4kpXgvi5g6gBS/oqV4VEyy/VZ2OBDGS2DZvXBRn8wH6+ZLOB/sDB3zCdfjJtDL1ySELbApHnbYP1QTK64mhhiwCJbbBjvjwvjHP1C1R6O4avuzvQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by PAWPR08MB9544.eurprd08.prod.outlook.com (2603:10a6:102:2f2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Tue, 27 May
 2025 16:26:45 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8769.022; Tue, 27 May 2025
 16:26:44 +0000
Message-ID: <1d1c80fb-3012-49ce-b974-4f9445825e0b@arm.com>
Date: Tue, 27 May 2025 21:56:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Optimize mremap() for large folios
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
 <8df598a2-4147-4f96-b683-23e0957fc769@lucifer.local>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <8df598a2-4147-4f96-b683-23e0957fc769@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0012.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::11) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|PAWPR08MB9544:EE_|AM4PEPF00027A6B:EE_|DBBPR08MB5979:EE_
X-MS-Office365-Filtering-Correlation-Id: c27efd19-76d6-4f64-8249-08dd9d3b58b9
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?NFVPQ2RvbGhOVnV0eVNodHlyWksrM3lOcmxhakF1cm1uVVJJNzZaTjZVR1BR?=
 =?utf-8?B?RXRNNnNkRTVlUlhpZURWUWkzOTJ3azNydDRnNEZaK0dsZDJSc3VmMUpIRE92?=
 =?utf-8?B?U095d2MvKzNaVGdrK0FXQkprRjRzWVhndGNtOHY4WnNKRzFUaHdxamxxSTNG?=
 =?utf-8?B?bEtnMXdUWW1oRDB6ZzNSQ0VlZy8xQ3ZGczdVYUV2L1NaZWxmT0pLU1pRTFpD?=
 =?utf-8?B?Tmt0ZEMyMGFVOXNrUTZaM0dLWWR2V2ZoeDRWKytVZGd4OVhHMWl3RGRBRi9X?=
 =?utf-8?B?dks1c2pWRU8wYklUN0R1QVZ2M25OVHR1WWo3OWJtVzFDN2VucGtKTnVxRmNu?=
 =?utf-8?B?OGp3VGJpbDFrRnRtMWIzeUFlelhUS0dxczVhZnY0ZXgzSThNYXB4cCt1TWZS?=
 =?utf-8?B?Q1BHK1N5SmRTSFJTMXlnOFV4L2d2ZXU0YjRWMDAwRER6MHNZdzIvOWl1d2hL?=
 =?utf-8?B?MHhTSWlIb3UySGxBNFFSdXRiOFZvUjEvK3FKSVpsSUxsRnhpWENoUlBZRUJu?=
 =?utf-8?B?RENUVnVQaVJDM1YvOHlVYy9uUWs0aFR6WTUrN29BdWtLN29hUTQ5ZURra1Z0?=
 =?utf-8?B?ZGU2U24zS0hOaVI5MGlwV28vRVRUMGN0bEtkbldnODRCcEo0ZmMvbjYyd3Z1?=
 =?utf-8?B?KzNNUXlQckNLblBZelBCdGx5TmQxUXNjZ0pSbmtiRU1FdDU1QVdCaWlTRlBH?=
 =?utf-8?B?ZFpmYXkxV1FhQmdWallMS0FyMVQvWHY1VnRGY2hrVVV2MU9nN05PMC9abmtB?=
 =?utf-8?B?Q3lvR1FqNldZMkg1d0ZjLzNVQVcyakx5RjI3YTRlaWw0cmUvVWttTWZqQjda?=
 =?utf-8?B?YW1rdHhRWE55b0p2SWJKYzgwSE5tTWw0bWtRcW0xMFhmVVZhOGpvZEh0YTBS?=
 =?utf-8?B?WmtDOFZqSXV1RlJHc3dISWgxc0JaQWFYUHB4RzFoeWU3dFJYSEtLdE9XbzNV?=
 =?utf-8?B?dmY1RDlML2VuMXQ2ZVkrV0FnUUgzTk8xU3V4YUV5elppdWN4VmZMbFkvc0hX?=
 =?utf-8?B?d0UwNFVSNW5QVFN6UE5JRjE0RGxpMlk3SnFxL2JhRDVDUzN5WklRRlJUcUN0?=
 =?utf-8?B?ZmRwWFNNODUvQ3ZNYXZVZ3RwOGl3aTdFVmdmd2M2UnZrcmNtZ1BzTWova0tX?=
 =?utf-8?B?RkNVYm40UDFGUWhXVlRZZ0JONnpGZzNINUYvaXJ3dXgvTVpGeTRZUExyTGc2?=
 =?utf-8?B?eFh1ZitBWmVjNlhqNk81YVk2MDQzVU4rcGx6dERIOFo4RlJIaGpEaXh5N0Vw?=
 =?utf-8?B?UjcrTkMxdW5VSUdXOE53YVp3OFdTYkJSVnNaSU0xSFZzVG13REdqTWtveWJF?=
 =?utf-8?B?aks0bjVka3JxdHNFN2pQaWxsMjlMVzRSNlo5REh3b0dyTHFjNjVKOUVMQndK?=
 =?utf-8?B?bVNyODB1VEVZdWNQS3ovVVErN1RqTkErelNBaVdHbDVzenNORGVmNzUvRGwz?=
 =?utf-8?B?azlyQU5icVZFOHNYanJHZ1JZTUR6RlA0U1VJaFl6R1VkdW9HNE9BTExwMkNB?=
 =?utf-8?B?NWJnVUlLMkpGVWZmRkt6NzdRZ1R0WE9XVkU1TjM5YmY5Yi9YeWsyVU1xeHRC?=
 =?utf-8?B?aGtPUUh4MUpQU2xCSlVSUnhIL0dkTXNIM3U2NDZGYXl5MklQV1NwYzBRdXZS?=
 =?utf-8?B?eFEwVWZLcEY2ejFJT2NNQmRYNTBOcFJyNUVWUkpsbUFEUE01bWF2QWFqMG43?=
 =?utf-8?B?K0JCMHhzSThvY2dOQ0FZazFXdlo5M1VjWE9GQThBR1ZiUk9xY2xnU3JRQ3pH?=
 =?utf-8?B?Z2w4S21JTEJhaFpwL0xjLzR4NUZLbHYxcUZJT3NqdnpXclRLL0Npd2xVM0pB?=
 =?utf-8?B?RHA5SmdkSmRpWko5Y0EwaElFUXQyWTFuYm44Q2czS25YdThiejE0cDVEVDNp?=
 =?utf-8?B?SjB6eERNUC9ydmo4KzdTQU1ra1lRZ2hzaERUdXFFcXVtalZvZHJZdTRRTkl4?=
 =?utf-8?Q?gUs8a/wWYgA=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9544
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A6B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	965f0862-9fab-46e0-1ee7-08dd9d3b44ed
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|82310400026|14060799003|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?KzBUTGNqNmVHUXBGUEhGbTY0dXVkNkJmaXRkeU9KbUYwYTVKMlVPV0FmYkFo?=
 =?utf-8?B?UnRMWmc0eHc1TXhQVG15bytSK21RWUY0SUJHRDlzdDVKdFhrNzAvbUlJOXVz?=
 =?utf-8?B?amhkZWU5dE5wYytuM21zRG9FaTlPTXI1Y1hPa2E3YTIzYkU2Z3cvVHpIRVpQ?=
 =?utf-8?B?TDFUR0FPdEZId0ljaWtsN2tpdEZJaTkwR1R2Um9lMkxvSTEvbFRCOWZuOVhV?=
 =?utf-8?B?dm5CcEpXc2lMNDhpVFVpZktHYk9sSDk3bmVNSlFDc3gyRGw5QzhKQkd4QlBI?=
 =?utf-8?B?U3hYZmVKcVF2QXJmaldtSFI1ejhZdkUwODB6M3prYVdldmxyejUrSW1YbWhM?=
 =?utf-8?B?MG0xVTk0aGRRdWhaNTlVVTFOZG1HalJ5RGJoRUpWRGFCc1p4czVkcDduclpu?=
 =?utf-8?B?eE9SNG5KdzdXNFJFNGdZVUR2U1J0aVRDRFZWaGlpRTlubitkaDl3dzRkOEN3?=
 =?utf-8?B?STFad0s5Y2hPMXVtQlpwTXVZUUhESHRnYWVHMU9aRUhwc0ZseTNzUHgwTGhD?=
 =?utf-8?B?Y0ZudWN1TFdTNGJReVU0V2FScmQ1RjdWSUJaYVBIdnVZdTJQazB3QlBYMmo1?=
 =?utf-8?B?L096RUhnbExOTjVlVTlLZm5RWk1Dcnh3N1JZbHhoMVFDMVJ1bmZ1ZEVzczhv?=
 =?utf-8?B?bkdWcGNzTHdjdEpyQjFCcnBPNWdJcUoxdUpiVlpoNjBpOHhlMjdHR0U4UEhV?=
 =?utf-8?B?QzIvZjBEY1NuV21ERllnMDBKbW1GSDJ3VXR1Mk10V2tSVUtMVjE3WWdzeVR0?=
 =?utf-8?B?R1dCd1VmVEx1cmFNbXUyYTd5Z2JnYlpqYU9Jd2JSMlNtM3JqcTNySVd1Y2R0?=
 =?utf-8?B?TVlnYWFZVmYwRVlVcFJ4L2tEK1dPekRoMXpaWWJIS3NsNk1HY3hIRGwrQ1pD?=
 =?utf-8?B?eFhjUG5NdVNYRmZwQUgwaC8vd0ludVBqS0ZEYlZ6aEFSTUlNdldtYnRTa3NR?=
 =?utf-8?B?ZERvUWxLdktOOEFzQ3FTTHMvNkJZRzZ2c2FmeFJZQ2xHK0o1RTB1SE5UaVpQ?=
 =?utf-8?B?bDJWQ0crbWZma2habmIrSnQ2cW9qZnpSdXZwOHhDdEJSTXNqUWhGZjZCUXZK?=
 =?utf-8?B?bHpnb0Z3Y2JkWWNaMWRLTW5yYnluYVJ5c0VpSHBLZG5ZTjlTSFc1MHprMEhq?=
 =?utf-8?B?dEZYWmtUZXlrNFFHR3AwV2dsSUc5NlMwLzBmOHNQK1RTV0tVdzFNWS9OYkJl?=
 =?utf-8?B?R0NNaWIyK2ZUSzA0WFYvQkFnZTlRZTZqdnpIQTZOV002RUFNditXbGQxZGRv?=
 =?utf-8?B?WWRzQTJlbTlaaVVESkdrRlFVMDVULzByWFExcW45UVpoMkFod3NYRjBVWlpK?=
 =?utf-8?B?dG51SmZzZWVCaUJSbUVIaFRXdnNjaUx1UEplU203UDRXNVhCVDVKU1FrVExX?=
 =?utf-8?B?WTlxd2tNTnZmMEt5bHFWWjVibFRTdlFmM1doWmJXVDkycXNPaGc2M0dKVGdR?=
 =?utf-8?B?cjhMWWV2eU1zdytjNENuenE2d2Nta2FNd0N4TVJEdHdMVXZLZ0tzakhwOU9F?=
 =?utf-8?B?SERjb0tsQkhrSTE1Tk9NZWpEMXNaNHdNekQramxaaUhzY2VlcElJWkRCRkh3?=
 =?utf-8?B?U2w3c0YyUEdaM1ZnSTA4S1RKRnVXdUpyemFOUWYwemlscDVBQVlsTHd2d3pL?=
 =?utf-8?B?YjZMbytCZ1lJZXpjbUlTMnVKdHRIejBFQXZxMVZIWTdYZXNWOTE3bGlJNURR?=
 =?utf-8?B?ZEY5SDhsKzlPVUp2OTZlbzRESFFIZW9jS2czRWh5aEF6V1FDQmI1d25HZm9I?=
 =?utf-8?B?a29YSjhmN29tNWo3Q0tON0FjNDdNbitNSnFvQk90U3FQMG03eTh1SnNPeXhk?=
 =?utf-8?B?N2NESHE3SHFvTVV6S09sdncwRkFxeUxqai83ekp0cmloZjhRYTlOb2UwRG1D?=
 =?utf-8?B?cVN3YlQyZjl1dXNvSnp6dDBqMjFzbml2MzFPYnRwZnQ1RTVqR0R2U3d2cUQy?=
 =?utf-8?B?OENIekRvVExUVU1naW1HR01qRVJYSHpwNnl1V3NZbmE1eGl2eExoeGJEcm9t?=
 =?utf-8?B?ei8rQnc3SERId01PQjZaZW1jMmQwNG9FUGlxVjVSMUxwNkZuaWFyTFIwdGpQ?=
 =?utf-8?Q?B4PF8J?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(14060799003)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 16:27:17.2696
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c27efd19-76d6-4f64-8249-08dd9d3b58b9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A6B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5979


On 27/05/25 4:20 pm, Lorenzo Stoakes wrote:
> I seem to recall we agreed you'd hold off on this until the mprotect work
> was done :>) I see a lot of review there and was expecting a respin, unless


Oh, my interpretation was that you requested to hold this off for a bit to get
some review on the mprotect series first, apologies if you meant otherwise! I
posted that one or so week before so I thought enough time has passed : )


> I'm mistaken?
>
> At any rate we're in the merge window now so it's maybe not quite as
> important now :)
>
> We're pretty close to this being done anyway, just need some feedback on
> points raised (obviously David et al. may have further comments).
>
> Thanks, Lorenzo
>
> On Tue, May 27, 2025 at 01:20:47PM +0530, Dev Jain wrote:
>> Currently move_ptes() iterates through ptes one by one. If the underlying
>> folio mapped by the ptes is large, we can process those ptes in a batch
>> using folio_pte_batch(), thus clearing and setting the PTEs in one go.
>> For arm64 specifically, this results in a 16x reduction in the number of
>> ptep_get() calls (since on a contig block, ptep_get() on arm64 will iterate
>> through all 16 entries to collect a/d bits), and we also elide extra TLBIs
>> through get_and_clear_full_ptes, replacing ptep_get_and_clear.
> OK this is more general than the stuff in 2/2, so you are doing this work
> for page-table split large folios also.
>
> I do think this _should_ be fine for that unless I've missed something. At
> any rate I've commented on this in 2/2.
>
>> Mapping 1M of memory with 64K folios, memsetting it, remapping it to
>> src + 1M, and munmapping it 10,000 times, the average execution time
>> reduces from 1.9 to 1.2 seconds, giving a 37% performance optimization,
>> on Apple M3 (arm64). No regression is observed for small folios.
>>
>> The patchset is based on mm-unstable (6ebffe676fcf).
>>
>> Test program for reference:
>>
>> #define _GNU_SOURCE
>> #include <stdio.h>
>> #include <stdlib.h>
>> #include <unistd.h>
>> #include <sys/mman.h>
>> #include <string.h>
>> #include <errno.h>
>>
>> #define SIZE (1UL << 20) // 1M
>>
>> int main(void) {
>>      void *new_addr, *addr;
>>
>>      for (int i = 0; i < 10000; ++i) {
>>          addr = mmap((void *)(1UL << 30), SIZE, PROT_READ | PROT_WRITE,
>>                      MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>>          if (addr == MAP_FAILED) {
>>                  perror("mmap");
>>                  return 1;
>>          }
>>          memset(addr, 0xAA, SIZE);
>>
>>          new_addr = mremap(addr, SIZE, SIZE, MREMAP_MAYMOVE | MREMAP_FIXED, addr + SIZE);
>>          if (new_addr != (addr + SIZE)) {
>>                  perror("mremap");
>>                  return 1;
>>          }
>>          munmap(new_addr, SIZE);
>>      }
>>
>> }
>>
>> v2->v3:
>>   - Refactor mremap_folio_pte_batch, drop maybe_contiguous_pte_pfns, fix
>>     indentation (Lorenzo), fix cover letter description (512K -> 1M)
>>
>> v1->v2:
>>   - Expand patch descriptions, move pte declarations to a new line,
>>     reduce indentation in patch 2 by introducing mremap_folio_pte_batch(),
>>     fix loop iteration (Lorenzo)
>>   - Merge patch 2 and 3 (Anshuman, Lorenzo)
>>   - Fix maybe_contiguous_pte_pfns (Willy)
>>
>> Dev Jain (2):
>>    mm: Call pointers to ptes as ptep
>>    mm: Optimize mremap() by PTE batching
>>
>>   mm/mremap.c | 57 +++++++++++++++++++++++++++++++++++++++--------------
>>   1 file changed, 42 insertions(+), 15 deletions(-)
>>
>> --
>> 2.30.2
>>
