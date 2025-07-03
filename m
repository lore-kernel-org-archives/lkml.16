Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010015.outbound.protection.outlook.com [52.101.84.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAC22DE70E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 10:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.15
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751539561; cv=fail; b=Ibxyve1FngTXflNaDbvUurW4nq2crSPLfLZV3+PhL/teBv08bVInBeDSZ4bc6+KLpNrQKURGsxg7tMy3F2RFUryUMkjuSfcp7WVC6chi1PGF79WqLXA9Q8pDsXjLWO1xlHSG/BXaRX//A4PYObahBlNZ6TNtNMrYKqlxpzpw10A=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751539561; c=relaxed/simple;
	bh=iRaspwP0rFixgDheHdTE0E9WHWhOzQijqt3x10o8jOc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hkjXFeqaiRG97F1RiICQrQmgct163waCrMDcoz2jO35YPE6MUdhk6fpYnpfBIFzDa9kbG+zFRCzicQqgdsudpTVGJ/1bAfPDImXWHB9CBRTsvP5n6vHOaaLPBPa8WO/UzdqGw+qAOpTgbdSqCS0MssQw6RWLr//SsggnH4puQI0=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=UYzZqNQy; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=UYzZqNQy; arc=fail smtp.client-ip=52.101.84.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="UYzZqNQy";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="UYzZqNQy"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=KiaXVowIqiGAir216HbxmVgt4ynghTlPHmEFHfHDEAYRPpkcTH/wwYBMTooWP2BsbMjL0e904c8KLQ8dXZ8wlx9ozeq09EkUmewIptiA/SDdr4Ohnn1gcoLoWeW55Vzv++H1Md73W2+wQTTPcZWhLjPc78K1k0nfkJ49Tioz6RnpmJIKnIFXbgEGvyQn4SDHR8Cih0ZRXq5pWLDNs9S1ptn8IbHKJR4w9y1Z8hQtHHfRjtLVzs76iktjM0KK69oJHw1HyZD2Y/RNvz1y8l7gb8bBFu5DExehHEsBWRDS75oBY3tImR5jjc9IcByhYoGIgfWjMfj6mFatRRseLNnOiw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yj5ifjqKNIxJsuDk7/e/xh6hlx2T1CYJ7yooc2B36l0=;
 b=eXsXD9NxyWubQnagSB6D0vX/6O8DFXxi0mqyUGL8r5Y7mRc9OQcBeJPoyNWn3RCapyifRkxewFPzw98VjdH6wAwd6lHpV+1JT8UVaV9wASRvuZqI2oIbtHxDYnoaqdLaFsMRIT/VGqHqtkQoWUhSyRzouRyRJYPb54lZOFEeSq4xV0pcWPNN8ODU09SLldE6BLyJF/P+6r64DPwuRDkXzDQb3doXv+xfmZd2JP5vMVXiCuBzhs+qUUfNkJjuWUQEUDDJIsrYJBK6wr152rJvIW8ge3PAAePE9Hq3C6leHNUg2Z3WpPdqNRLgG8Ewz7K6aSE75zkjnjv5DMl7xZtb8w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=redhat.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yj5ifjqKNIxJsuDk7/e/xh6hlx2T1CYJ7yooc2B36l0=;
 b=UYzZqNQyHzY0zk/e+tOKlCSy0w1EV2F7CZtYqDaQx3wL8DQ2lWqOqcQcDkQyhFH3KaeBIKhxRa/EMkJB6j8fiZHO72nkyZ94TujPryk2DCPhfgG+lFW9GN4NDwSoIUoZe1rIMgIvX+JxozeInON2V2rATmuCu4mhm1kL22R1KyM=
Received: from AS4P190CA0030.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d0::20)
 by DB5PR08MB10064.eurprd08.prod.outlook.com (2603:10a6:10:48e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 10:45:56 +0000
Received: from AM1PEPF000252DA.eurprd07.prod.outlook.com
 (2603:10a6:20b:5d0:cafe::19) by AS4P190CA0030.outlook.office365.com
 (2603:10a6:20b:5d0::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.22 via Frontend Transport; Thu,
 3 Jul 2025 10:45:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM1PEPF000252DA.mail.protection.outlook.com (10.167.16.52) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Thu, 3 Jul 2025 10:45:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UwN6abRiFxvinsCpSkthohmdVF/y/7mtWl1LIHTFeUU1ngeBm7ALIfl0fbCt6JY+4DSa7qMh7lAct6Lhs8yTrgp6FnBRE9uIDLElZXFMdxnUyZP9ZtdkNeeMwNHXemDipSDeUh7x3WfOU1lgDV8gBkI8qPae8OfQ4OWynRUn59TJBQBXa2CX2yNjkrHpCKdiGSFkcW63HSljLILNXo8AicWMPLHzqOQtALFftoxG/Q9mCQx/BIRu/zdQ288ectr2duQlj2IOzn/TX1ehNAg89p+2G77HMvYYeIO1wESPsTJtIIHgrhpIQ0/hbq6t2HpWpQqsjxrWRbmBLu1KTBDrJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yj5ifjqKNIxJsuDk7/e/xh6hlx2T1CYJ7yooc2B36l0=;
 b=WG45oj7tFsVNiOh9x5TQayfxOLhWs254U3wwW6vypO1Trf9Ad2o47jMzd6bBC0ZW9wXCL2lVHp5LDY4PcbsPtzt/dP2kfB695aRcQQkEhEYz0lylCzrvyANwjxO1/p8CXfNVtH2RXqkDnvhnzVHPafmadJOV6WBDpX5nodmKcQhc0Umk1+1a8yiGvefPTHv7oVrYZFyeVnLDowIwDA54Psb6kOHboQGDhB7/rctyTAazvuN9abiu67c32kToyOqocfHMk2r0x4OZaWmHNCuCL+4UoquhmsB6YJ+pRr2BoTNo+Q5kgkEkhg0kbiFh/rstHluSyAnEvabL+GEZq57VDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yj5ifjqKNIxJsuDk7/e/xh6hlx2T1CYJ7yooc2B36l0=;
 b=UYzZqNQyHzY0zk/e+tOKlCSy0w1EV2F7CZtYqDaQx3wL8DQ2lWqOqcQcDkQyhFH3KaeBIKhxRa/EMkJB6j8fiZHO72nkyZ94TujPryk2DCPhfgG+lFW9GN4NDwSoIUoZe1rIMgIvX+JxozeInON2V2rATmuCu4mhm1kL22R1KyM=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AS8PR08MB7918.eurprd08.prod.outlook.com (2603:10a6:20b:539::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Thu, 3 Jul
 2025 10:45:23 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8901.021; Thu, 3 Jul 2025
 10:45:23 +0000
Message-ID: <b91a6670-0d85-49eb-90fb-804fcf6fa2a6@arm.com>
Date: Thu, 3 Jul 2025 16:15:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] mm: split folio_pte_batch() into folio_pte_batch()
 and folio_pte_batch_flags()
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Pedro Falcato <pfalcato@suse.de>,
 Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>,
 Lance Yang <ioworker0@gmail.com>, Oscar Salvador <osalvador@suse.de>
References: <20250702104926.212243-1-david@redhat.com>
 <20250702104926.212243-4-david@redhat.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20250702104926.212243-4-david@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0048.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::19) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|AS8PR08MB7918:EE_|AM1PEPF000252DA:EE_|DB5PR08MB10064:EE_
X-MS-Office365-Filtering-Correlation-Id: 9042015b-4e61-476f-d31b-08ddba1ec9fa
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|7416014|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?R09PZzZTVVJCemNXM2RHVDVuanFka2pBTkplNERLZFR3bFd0VFM3OTE5QWts?=
 =?utf-8?B?QVNKd3ZmeDRSZHVlSitPMk1lLzJXN2M3S0dBczVObmZnRXM2aUZ2bzJZaCtr?=
 =?utf-8?B?dDNZVzd1cXF3NDREcW9RUkFiQjJyWFZ2UlNlU3Z2RTBrVm00cFlzNlBaN2o4?=
 =?utf-8?B?eHRObkNod3JtVHA5dm1ZSldUbndUaTNkQk9zVFIvcUpQWjlnSFhJdlliREFx?=
 =?utf-8?B?V0NncC9IVWx0Rnd6eHlrU0NTYW50UDJuVXd2T0FoY2RpbnRHVjNtQVh1ZzFR?=
 =?utf-8?B?TVZrbmRkU1ZwdDFRSWxsTm4xa1oybTFqRmVoZmtuU1B1RE5taXNaRjdJMGVG?=
 =?utf-8?B?UFBLd0wrdU5Jd1EyNzgwRnd6RkhONVJ2Q1ZoQ0ZiR2NWN2xhQUZGN0VuOFg5?=
 =?utf-8?B?cjJqMUU0d3NyamtPTmx1cGluMjN0ZThKeHlBakNhYmNNYzFVRnZMcnk4eU8w?=
 =?utf-8?B?U29haUkwWTNoMHVtYVlRdi9KZmpJSXVQemM4SnJndnkxZFljaEozY0QxbzA3?=
 =?utf-8?B?NndsSVA1VENrMFBjUjdJK3l0OWZvOEtUdVNtc1Vrb3VMS0JDcjYrVVVXeWMw?=
 =?utf-8?B?UHVVOUQ5NDN4ejIydW1ldHVhMmV2dEpkZVVPRFdQVGZveHZYd1N6TVlpZE93?=
 =?utf-8?B?SGlQWEJ5RUo1VXpoV1d3dXFiU0E0NUNGd2RaUjNyVjg1YzB6bzZsWlF3aVFl?=
 =?utf-8?B?THRPcTB5bDhFanpTL0ZpRm5QaEZxMmVwSnhwbUJ5ZTVFZFRHRTNyT2k0dXl4?=
 =?utf-8?B?bCs5WUR4YzRNQmxPeVBwek1VYXJZWUJEL0F3cDMyVDJUUUd1Wlc1eFFVa0ZQ?=
 =?utf-8?B?WjJTR3lFWFFwek9zTVNEZFd0NkR2WGJueXA0WFFTcnYvRkxlWDU1aGpkZk9G?=
 =?utf-8?B?Vk9HdFc2VGlzU2FCUGNPRU0xWW1rbmh0WGJ1K2tBSFJOV2ZmaTZMZ2k2U2ds?=
 =?utf-8?B?VGdYRDh0N1pTaWRzNTN6K3VxU3hLdEtrdWpZeWtJR09WUUFOVDZkenNrSHo3?=
 =?utf-8?B?eU1zSnBKZmJiTEZTWnU3RkZVTHg2cHUvLzZhMEJpQlBSMjY2VytOVmJzL3hz?=
 =?utf-8?B?WGF4d3NoT1RjQkJFdkRaeWo3am5TbTNtQ01RclUzTVVBTGVzQzFrOGU4SUZN?=
 =?utf-8?B?WGZpNC9FWVFlbkMwU25iRTNVcUZid3BrVWcxWFdMaGwvWnR5Z1VKSmdYV1Ar?=
 =?utf-8?B?OU1ZYm1xd3JnTkNyQ1V3dDNnUnlEVnlyY1VrY2M4dllHbUxoUHhLMHM0UitK?=
 =?utf-8?B?dzZWVlovMTFpMUxSbUVBT1ljdDdBOTRqZS9mNXlLOUU0RU5WamJCRkVhcHFI?=
 =?utf-8?B?SmpJOHphSjRlK1FBemhKTmJ3S0VFUFMydXBGdGhkakRsMStMemFGMG1qVHhU?=
 =?utf-8?B?Ym4waGFKbEZpUEl2UDkvNHdNd0JQYXRPTE9Md2dJeUFKa2x6UStLM0JSVXFs?=
 =?utf-8?B?TGF0REZ0UnhBUDRTN056ckQ5a2ZYZXNMUENjVGJZVkVLZEsvalJ0OThoZUI2?=
 =?utf-8?B?cGkzM0FsUXVHWE1kRTd3bFVoZlh0SE9jbzZvU1Byd2VXaHVlWGVkUW9nNW9L?=
 =?utf-8?B?dWYwMXE2Nkw5b3lEN2g4UG5NWkxxUHU3TFpaRGFSZjdlb25qejZmYlNjdHdo?=
 =?utf-8?B?ekR0SHk5WWY3dUpjdVUwaEMrR1pCc2V3UkduTkpzNWZkdTdNMU1uYmRrNXpm?=
 =?utf-8?B?YnZRc1NPcUFudTdNZ1pNWEV6SnN6U1d6Z0FsRy93dC9kNzNNVWVxclZIcHAy?=
 =?utf-8?B?QXpONkZ1YVYzS0hMSkNpODkzekwrZWRqdnRMSGZZSE53ckwvWFVmbVliNnU3?=
 =?utf-8?B?UENXQnZKdWc4WWdxYzNEcVZZM29NN05Rb2xjZjJwQXVqcDRvVDcySlJNY3pu?=
 =?utf-8?B?YTVtSFlqeTFhRXRQREYvelc4NjZUUlpGNjBrY1BtZkd4ZDFzUVhBdDJkZlVj?=
 =?utf-8?Q?6ykWQRfgL7Y=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7918
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM1PEPF000252DA.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	51532e18-14b5-40f1-226b-08ddba1eb69d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|36860700013|82310400026|35042699022|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eTVocElqa1pDWjVvZGpkSUdaaG0wMTg1SVF2cnlvK2VXNXVPZStXaUVFRlNE?=
 =?utf-8?B?YkVGcnNhWHRCOXhScDBCdUFwRG82SzJ4bExqZFBCK3EvVWZNVDlGcGVMaUQ5?=
 =?utf-8?B?T29PSTRrTVhGbC9qanFtYnNLZEhTSzNFVVVaVitEL3YrRndOdFJ2QWxHaHhh?=
 =?utf-8?B?K2V4NVF0VnBFSC9PcmhuUm41eE96L3B6WXpYN1M2NkUwWnN5ekdpQlNSOVhR?=
 =?utf-8?B?RERRdkYwSHl0Z1FGQ014SFErellxc2xWV2xQTjBKZjBoazAwSk5OZWVtR3pH?=
 =?utf-8?B?Tm9tT1VKVVc1clJSbnRjR0VsaCswb2gzSjZYVnM2ZWZSYlp3bEo2MDU5bnQ0?=
 =?utf-8?B?SVdCQlY4djdaelVwTmhQeUFJRHpGdE8zT2cveFNCVDhvd1AyVVRUc2kyYTFq?=
 =?utf-8?B?NCtXOE15eWEvSktydkYwNWVaZ3hHbzk2Rnp2dkI0dU4vUHRucWU4a3d6WVVM?=
 =?utf-8?B?SXpkakJyempScjNBNjcvWUxyNHlxMFYrMkhVTmF6MUYrZHRWb2NoN0JmbjhS?=
 =?utf-8?B?YUtRbk5iYTZMc2ZaZ1M5UjJCN1FWMHM4TkdpdEllUGxLODdIY01vcW4raGNZ?=
 =?utf-8?B?cnVRYU5WOURhdFVlNzEyU0pheTN4N3JNdVZ5aUpxOXlaM1dOR1pKbk5FWWZh?=
 =?utf-8?B?ZGdlUHVxQ0lOK0xLM1VZcEJMcTVBRUd4anEvcVJWSTVITW9YTjBqMi90ZU9D?=
 =?utf-8?B?UlVQcTR0aFdBMC9CaGNQaXdaQnF1YW1TNmxTekpjR1gwR2VId0xDQWJtSitx?=
 =?utf-8?B?VGxkMDlhTjVCbFBDSVV1eThPdU1ZUzFmK1dsNWhzZVduYnlPUkcxVzRUUlN1?=
 =?utf-8?B?UExEbHI0WVo5QThGWDJBU1RqckNIWjVING9XQU81d0V6UFV6K3ZsdG00NWxU?=
 =?utf-8?B?U2ZJMlpNeWtNbDd2azZJZEJhdXNDZGtuSFNxekZGZDB3YUdoT2p3aHlTc3RL?=
 =?utf-8?B?S1M1ancvaWRMVlNNMUxUZm9YcGxjRytvV3ZIM1RtamRocHg3cGxIb083aU5U?=
 =?utf-8?B?dlVIcWF3cUZ3b1Mxbm5WdXJsWHBJSE5BT0VibU5qK2Q2WmRkVURIODdyYWRv?=
 =?utf-8?B?bFdQL1BreWNCdi8zelNvM1lvVjZhT0szcE9sdzdVN3h4VFhNUjUxU3VDTmhk?=
 =?utf-8?B?MXRmdzJacENORmVGL3BaZzZ4ZlhkYStRNXU0NVhLZGwwenFNZXJDZmI2amlF?=
 =?utf-8?B?N3NIbURFb0xZY1BYT3ZjZm4rekhPR0NpMkozYnp2TUZGaUQzZzBOSTQ0Y0dY?=
 =?utf-8?B?d1orMjd4SmszbFg4aFArdy9tNll3dUZUYXRhaVp0MFRaTWp2cFRnblVObzh1?=
 =?utf-8?B?K3BoOVVQSVFpQkJpZldsYW5PM2JheE5GVFpMVXBGS3FLVEhWeXRyZXVGUEJW?=
 =?utf-8?B?by9ZTzNBdlkxTll2SlJmRE11VFprbEUrL292NVNhMDJoOUhlQWtsUk50M2VL?=
 =?utf-8?B?clc3Y2lDS0VqQTFXR2RBQXpsMkcrd1NsVUFtdXBHcG5xcm12RzVtKzBpd2pp?=
 =?utf-8?B?bWl2MUp3TWkyejgwN1pRSll3R01URkxZczlucHRybmxHeGEwNkZwaHRIUlcz?=
 =?utf-8?B?WUtldU8rUUZKSVMxcmVTdlNEYUNaNXNHWVBtclYzd08reUFqQTZXeXAvRDBB?=
 =?utf-8?B?cVhiZVdRVTZPYWNSZTlZSVIyNWZtQ1B0cy9yME1hR1pTczZId1FoYmtaMUJO?=
 =?utf-8?B?RXBCbjRQMDcwKzhyOVVVanYzelZZSUZwY1BSWUtabTVDa2VIVnBWdlNIS0R4?=
 =?utf-8?B?bUJqSWZGRWc4bWhucys5aW9WT0hYUGFlOW1tNGdtcFM2LzRzNlpSZFlJMC8x?=
 =?utf-8?B?VWZpNFZ5T2ZPb2hEYmdVbm1Pb0ZYSk9SMFhRYVh2NVdXKzhwUVNrZ3liamYz?=
 =?utf-8?B?NjJCaVdNT3cwcmprRC9GSjdpakM2RVN4RWxjUUx2NitLOXQ5Nnp2M1RWcE5G?=
 =?utf-8?B?S1FEOUo1Ym1BK2ZXSm5lS0I3dUpWU0F1a2x4MENZcmtGbkkzbk9tVHJHVzJG?=
 =?utf-8?B?bksvMkg4Q0phazVvNnNTZGlzVGlhTHZ2T3RNSjU1K29FSWkyOHJNS0h5Sk1p?=
 =?utf-8?Q?taVJ9v?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(36860700013)(82310400026)(35042699022)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 10:45:55.6029
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9042015b-4e61-476f-d31b-08ddba1ec9fa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252DA.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10064


On 02/07/25 4:19 pm, David Hildenbrand wrote:
> Many users (including upcoming ones) don't really need the flags etc,
> and can live with the possible overhead of a function call.
>
> So let's provide a basic, non-inlined folio_pte_batch(), to avoid code
> bloat while still providing a variant that optimizes out all flag
> checks at runtime. folio_pte_batch_flags() will get inlined into
> folio_pte_batch(), optimizing out any conditionals that depend on input
> flags.
>
> folio_pte_batch() will behave like folio_pte_batch_flags() when no
> flags are specified. It's okay to add new users of
> folio_pte_batch_flags(), but using folio_pte_batch() if applicable is
> preferred.
>
> So, before this change, folio_pte_batch() was inlined into the C file
> optimized by propagating constants within the resulting object file.
>
> With this change, we now also have a folio_pte_batch() that is
> optimized by propagating all constants. But instead of having one instance
> per object file, we have a single shared one.
>
> In zap_present_ptes(), where we care about performance, the compiler
> already seem to generate a call to a common inlined folio_pte_batch()
> variant, shared with fork() code. So calling the new non-inlined variant
> should not make a difference.
>
> While at it, drop the "addr" parameter that is unused.
>
> Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> Link: https://lore.kernel.org/linux-mm/20250503182858.5a02729fcffd6d4723afcfc2@linux-foundation.org/
> Reviewed-by: Oscar Salvador <osalvador@suse.de>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   

Having one place to share the inlined copy is amazing! In the near
future I will be doing some GNU toolchain work so hopefully I gain
knowledge on compiler stuff; it was fun reading the inlined
vs non-inlined discussion.

Reviewed-by: Dev Jain <dev.jain@arm.com>

