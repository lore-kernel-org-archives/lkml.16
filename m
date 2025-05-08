Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2086.outbound.protection.outlook.com [40.107.237.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14562797B2
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 20:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746735840; cv=fail; b=jLnO3MfWdSTQLvgxwQ1g9umO/aQkEY2HmlmQK8nJ8clnpc4m10o++D80wDLMvt2iHk5xeG8yJR/nSiDHDdF49WZMi178VsHGRt8Cx1zrOlCIycY9LJaSvaDOXOUpOEfMvXLX3D+3/sX98pgdnD9pvUFu23cYI0d0YvuxOl4K8Zk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746735840; c=relaxed/simple;
	bh=gNI/i5xjQGnLjsY4Id0mDRIPd4CN/TYXshkSfL/ytfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eeN2KTrFXyeMUQT7e8ZTrIMBDNB2DeX6NO5VPiT/OCalIbsNZKeiGxDOtYmyvc1U9y5MVBRhupbOPLz5FsUyjvzR1YoLKqdnzLkosXicP5BoMGMw6D45PojWjmT4kBCm7l5a4Kxmj8sVxZlvtw1ilSGAPEbw+mYVwhKdm4i18/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=albfTbjX; arc=fail smtp.client-ip=40.107.237.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="albfTbjX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JZJk7TY/D5QH1bOBzvgkdY9TiGnLD8m5JUAmN31Pce5EcoGRr6/qlHivxUeRLziEJS+eCjP6JCDCX8v5LfGYQCuWSQwcNmbhhHOlqXPGJ9hjYd4v/Ld8UnKCb36ckPSzm3/WbA11yA788ezR8+/ocbpHyNRg47WSrczP997vTQq4+QXS0Tb3KsTaCEto1r729jIZJpUbmoYuRxQQYXTlGzLyjlWTeNYPtu+/2SsfO38T81Tq5sNTUGHxVjJ/FxxGWCxmK6Li7kpXs4CYuYu153O/mYv54Zlj+B+qnZAtHiztucjUVYkAkHs42RunEpF6161Shn5UJnvGmIKAwx1yxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UyjV8PI1wMYRygJ84B6Z2HNJVMwLHDvJef7i5yzV8JQ=;
 b=TV3wOMFAn+7Ks/5PyvyI4VRdRcy5l8AiPv0Ca5kQjHQ5i+8dcaWJFA9OcspeYkpGJ4nVd8YC8I+yzvuYEvI0gBJJMQ4YwraQfueuCghCFXWvTuo0YVvNIySBiuvbxY//es0qayhxBRlws2FbZqtsyC2bIuGJ7QmDfMUOJntusCUZ/oBPV+0rvSzb4D8tyK3sVGikM/pdYRvHCPaw1+q1BRIRhJmrJJUuK3OhdsXNwhQkRq3BhS/bFrn7Ce9Hwjyk8ua40/iGoGbWXNy6TCK7lX3i9dV+6wGtaJIfzr5/gw2uI/oT3d5Hx0CFNmuPuBW6AYZkOrHpPkWx+LP75ZcMbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UyjV8PI1wMYRygJ84B6Z2HNJVMwLHDvJef7i5yzV8JQ=;
 b=albfTbjXm8rG9WpnPzQs5lP5spDOzF3qPoZklLNFPklS/i5Vrp1f3a6w3tX5Bj9ugzMLq67mv+5msQYdwLqqLARrVfCEHU6MSFJIXNREZDwWxnzZfy6b4eyq7P+8ZNigUrohHV4B+UNv5duXFLwKIoUAjGPgCuTwjkrJQYRxUmDk/Vvo6q5OW3nf1u/4SBlejXTiUC1p6xHCu4wZ0Vd5CfOEob6jxlGL4Qqdxj9OHqEyvutYrB+1J3JwF8xF5Ibvqn4aBQoGbpTlQOG9xL8sr1lFf1sHlWoBQf3cxXPPk9a6G3D8nPDK88bkYj9V3lIWfzfGvj1vJNc7l8alzRYpwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DS5PPF884E1ABEC.namprd12.prod.outlook.com (2603:10b6:f:fc00::658) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Thu, 8 May
 2025 20:23:52 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8722.020; Thu, 8 May 2025
 20:23:52 +0000
From: Zi Yan <ziy@nvidia.com>
To: Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, David Hildenbrand <david@redhat.com>,
 Oscar Salvador <osalvador@suse.de>, Vlastimil Babka <vbabka@suse.cz>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang <richardycc@google.com>,
 linux-kernel@vger.kernel.org, Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH v3 2/4] mm/page_isolation: remove migratetype from
 move_freepages_block_isolate()
Date: Thu, 08 May 2025 16:23:49 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <F05CF961-6104-4C46-94C2-8966F580D8AC@nvidia.com>
In-Reply-To: <20250507211059.2211628-3-ziy@nvidia.com>
References: <20250507211059.2211628-1-ziy@nvidia.com>
 <20250507211059.2211628-3-ziy@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN1PR12CA0024.namprd12.prod.outlook.com
 (2603:10b6:408:e1::29) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DS5PPF884E1ABEC:EE_
X-MS-Office365-Filtering-Correlation-Id: 9509bd1c-778c-4d63-65b9-08dd8e6e3f7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UHRJMi9IN2kzZXJMQ0ZtMVU5U1hmekFrOURZZnoyTitSNEVHT05HeHBXbHZ0?=
 =?utf-8?B?L3l6cG5lVkZJRXhoaDdZeHAwdjNqSmJEdXBQcWRFeVkvYWZHc1JwalFqenVS?=
 =?utf-8?B?MzUrdTFvSDdDeGQyMlF1V0xNQ3JXNGJSc0RmcFVxQmFiNkpXSVowSXVyTktp?=
 =?utf-8?B?R2xaK0twZmw4VHQ0ZDEzQ0h3bnMwcG1sUUl2R0htSU5jR2FoekZlVEU1eXFT?=
 =?utf-8?B?eUZaenhlSW5QRGRSUTVxZG16bTNKTEJsQkR3bUdid3VOM0FsemVIdS84bitm?=
 =?utf-8?B?T3pTeWlOS2ZnaU00OXJ3K0JWZ0JPV0ZHQmJjQXZEYkRUNUw0Y3NidUkxbkQv?=
 =?utf-8?B?cmZ0SlZtci9DdU5raHlicnpDY3ZqMGxaZEtlUllnak5pbkFhSjVlbDZybnRp?=
 =?utf-8?B?dFVvWUtna3JpZlpvMXNKWHRDdnVFUXpQbDNsbWN5ZzVXQzBpd1pjRWUwa3J5?=
 =?utf-8?B?MVk2UjNERHlXTmF2M210UW1VNXI2bURzVHQzWUpVZVk4Y1BiWVJxVEc0M01V?=
 =?utf-8?B?RTRKMjFwblgrM29PMjc3clV0UWhaQ2p1QVVNSFdNZ0UwVGYya0gzdC9hVW5G?=
 =?utf-8?B?TXR5dllVU2tjN3kvcjlTTW5XQ21IUXM2STFwd3ZVRXFPVFNOcmNJMXVGZGov?=
 =?utf-8?B?SFBwMk90NlNvdE1ZbnJyY0o1RlNONVpHYUhqY0VjMVBRcng3dTVwdlZETXFh?=
 =?utf-8?B?U3F6ZHlwNG9TWTdOU2FvWkp6WVdmREdhNmJHeHhYTUxxaWNCazlBWVpHci9x?=
 =?utf-8?B?T3BiZ09zWE5uY2pZZDIrdVJ0YS9lVTBPYk1lVHpER3A1NlFoRkRGek85aVhj?=
 =?utf-8?B?TjV5dnpyZG9xKzJTeEFkblAvbTc0SWppeGVsYkQrN2EwWXBJZDRZRUhZbGpU?=
 =?utf-8?B?WS9wYXp5UVhOelNjR0dWRkJmYkpIUmhpRXF0UlVCYVV3dFpnWXZBUnp1Yndy?=
 =?utf-8?B?K2lpVEw0TUF3eFh5Y1dBZElXVUpqbGtROWhJdFdwemJEYXpVcXJSNk9EZDdX?=
 =?utf-8?B?RWYxUmg5YzI2ZjYzN3FMM1VBdG9EM1k3T3l6SkpQVmIxWk5YeWdBTjMxWXo0?=
 =?utf-8?B?ZndxckVWTWxqcWhsUFV2L2xGeHc4QWNOb29PaFN3bG5MUDd5WkJjQ3JwMTgy?=
 =?utf-8?B?Q1B3YUNCUjFEOFFQTmtFTVdtQU41OHM0V3ZuRTNkSldSeGtvTGE1QXRQWlBt?=
 =?utf-8?B?cW1PallvQ1NSaUo0d2Z2bWFKNllRNmZJWXBXL1lHb0lCTUlnZHRRNWFDTTcz?=
 =?utf-8?B?VGhBSUd6clpmTGllWHlqd0NNWER0ZWJWd3hQL1NmaE9mU05OWFZwOFcraTIv?=
 =?utf-8?B?d1Q1WHdSdmZSN1Z1clZKQ1V3YnQxcHVUK1dRVkRJMUNGN1Z3dUN0RnZ6M09m?=
 =?utf-8?B?OTdySzVzT3ByWDMyOE5sSUlzWm9WS1V5eHNtK25JOWVmaWNqdWVHTHRsRDBi?=
 =?utf-8?B?cEdFMi9MS0M2MUZyblNhSXhOMzg4M2swTWk1dFFoZHp6eU1SVzUzZWlHd1lJ?=
 =?utf-8?B?UG44OVRBVUFLVEorTmhERUt4VlM2dnpna0ZvMk4xS0lpQVFBWU04UWxXUFdk?=
 =?utf-8?B?anV5dzRjVmppQU5kQW1iQUJlS3FWclVjZitaOGsxNnhBcGdQUTlVWHJnSkNV?=
 =?utf-8?B?d3lVOWdGcUI4YTJWWDQzdFZtcnlxcFI3cE9jVjk0cmR1NmRHTnkrRG1pWXVq?=
 =?utf-8?B?cVQ4bno5V3B6emRHL0E1NUVKSUNYZDd3QWhRK3VaYmg1K2VqczdsWE1QeTdO?=
 =?utf-8?B?SHRNMjI4d1VWdWRwSGJYVzRRNUJwM0NvRUQ1MzY5TEdaTjVWeXVrS21Ecnl5?=
 =?utf-8?B?azVGS0Zua0NTSGpUZkZ3N2xpYW14aHJ1TkFoNTFDZlNQOTBKRkpnSVZ3V0I2?=
 =?utf-8?B?dGpSVEQ1K0NBRG9BblQ3WTI5M0hVejYwYndJUnFpSUtXdFJ6NkIzMnZLN3dz?=
 =?utf-8?Q?R89hJYLzin8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHhMcUh2T0dXRU5JTzdKeDd3M2FnZG9YV0czVjQzdzVvVm16cExjM09Ca2ty?=
 =?utf-8?B?TFk1M2lRSU1KbG80QjllV1lkQ2lsazhHZ0xoTUI2RmlxVHlUWHl3OWd0ODcz?=
 =?utf-8?B?blVIWHBwby93VktRUXRLUW5qSnY5ak41ZHhNSEpiRW9CR0dBY2gyTnBiVndv?=
 =?utf-8?B?ajlhV1dJaHBBNXpZNU91czY4RE9XL0NicEdHZnFEQ25SYWZxMUl5SzhsVFdk?=
 =?utf-8?B?OW15N09CejZQVkwvbHh2RXNqZDlDeTEzbmIyWjZJdlcvSG14Z0JxbjdPWFFC?=
 =?utf-8?B?ODdkOVJJZkxKa1luOUFCWHFBYkM3U3ZNODRTK2xFUzc2QldrUWk0V2xtOUZW?=
 =?utf-8?B?Ulh4N3E3TWZUQWFDNy9OeEZLNmRuUTh5UVZNam9EOGVjc2t0Z1N2ak1WZnpm?=
 =?utf-8?B?aWhLVXc4TlBYRWR3TXNrMUJJQytkeWtKRVZNd004RkhuVUljVy9UdytZdkND?=
 =?utf-8?B?bjlvUDFyR1JNdUNBTmhMekR0d2k2VHlPRmNkYkxXNVR1NG9CeUFtd28xUW44?=
 =?utf-8?B?SlFXWkF6QlRQSjFmWFZPOWFlNmFST3J6Wk1YQ2JEaTNhUjFRejlQVXRBMlJN?=
 =?utf-8?B?YW80WFZiN1R0cldHQ3F6UXpaSGQ3aHI3bjRQQkFOU1dKV2Vzem4wem1uOU45?=
 =?utf-8?B?SktTY1FsNFhjZjJ2RW5hR0h3cGxUZmxuUDlucGxwVEIyb0VtN0VZU0hoUThG?=
 =?utf-8?B?VVVUSG1wRzBaSGszUUJTOHVHZmJUVUwzcUpzS0tyN1ZIQ0krRU1BMG12c3No?=
 =?utf-8?B?UWpBQWkrTjdWTlF6S3JtR2xkVWtGSU8ydU1RSldBOHFZcXJPbnhORFJqYW15?=
 =?utf-8?B?cVhVTTFxOFZURVhBSnQrR0cxSGdKejJnT2oyeXBJY1NFaDFqMERkdk1sTmNO?=
 =?utf-8?B?dmo2ZjcxQkEzWUh1SStYUWJwV2k2QXRJVG10Q2haL21teDZWUkt0cjhMaVlZ?=
 =?utf-8?B?SE9mOUlYWDJoSFVKZFJMUzNsY2JGNHBxakNFeUMrVEtUYkNiQUtBblVQaVdY?=
 =?utf-8?B?cWxISmQ4RlRKaEhIbnJyTjgvbnV1eGNsZWE0STJOcUttL1E5NHdjRVJCd214?=
 =?utf-8?B?S3N1ZHVOSGQvVkx6TDNvMjA3ZnQ5b1N2bE9aOGQ1SUNRVGp0L2lZRVFpSmRn?=
 =?utf-8?B?Zmhnc2ZQUlJIK2RoSXFmQkV3YUxIUjJjUG53dnJwbjBSU0pnblAza2dvRmhP?=
 =?utf-8?B?VkFIdTJMN3B0VUZPTFYrOEZVd1M1SiszNHh3bXkwNUJvR3pmNHZXb08xODhT?=
 =?utf-8?B?OVQrRUFkaDJxcjZFSVk5ek9MejMxdy9mYzRHMUVzR2dhV1pUaU5hQjkrSDhB?=
 =?utf-8?B?SEQwY09nMWRVK2gzUnRLRXhaS0xlN0Z3dUdTRzFYSUNUNlVjd3N0eVQxTUdt?=
 =?utf-8?B?NnJkWEk4NEVqZitUalFOcEVqK0kzUzNVTE05Z1RrM1E4TkZ4S29TYWlVZzZG?=
 =?utf-8?B?Q0p2Nmh4Y24wVS9xQXAxQWpCNm8rRjc5cWgvYjZGT21rMHM0eVREVjN4cStV?=
 =?utf-8?B?VFdJMEpKUDNHaDJaT0FHeDZzYWhLRUprcmUwK3RmdGlRZHdNWWdyZmRSbUJJ?=
 =?utf-8?B?MzA4dkdrRkhJbmRPYWl2M0d3Slp6YTRGWFh3a1RIK3Z4UVYzKzRoeUF0QXha?=
 =?utf-8?B?ZjJrMDBhNjk2SGd1anE0bDVzYm9KcTh3TzhPYkJLZTQ4aUtqV29hR0NvWE94?=
 =?utf-8?B?Z0RrTnRNNGpwQUt5SEhINE5CNWtOMTNGT3FqZFg1ZEZZNkJEYmxtRHY0YXdw?=
 =?utf-8?B?SDZ6NTNSQ1drMEozT1JOdGRYUm9vSW1KOFBvQXNLNEhwTHFHQnMvd2o4cHVR?=
 =?utf-8?B?emFDT1RjcmxLd1JQQzYvdnJPa2FoQzMvT2tLeU5reE9LMlNuT3ZMek5nV3NU?=
 =?utf-8?B?YWlQa0FBMXpBNlM5bXRtWHUvd2xSOXQ0NFpJR0xrRE5XZll4dHFPNlRXdFVv?=
 =?utf-8?B?NDZaa3l5MVFFbzdRK0VxNEZuZU9IQjRYcVJTSlZ1UHNVQzM2RG1Za1JBM3lC?=
 =?utf-8?B?RXBvVUhiUklMSUVzNjBCZXpaZUNpRnBQb0YzY2pxZHlVbnpXZkFHVURtOTV3?=
 =?utf-8?B?TStmTC9nUWJuNzJMaFhFSE9ncHhDL3BJWmM3a3JUY1hUbnlTWW1tNzNPZ2FP?=
 =?utf-8?Q?KPcrftZBrFXxuon2bxa/M/0SC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9509bd1c-778c-4d63-65b9-08dd8e6e3f7b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 20:23:51.9989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mS6BuIeh/1FVXpqQd6rh2NjdhYABAxUTM41IUMN13TccOp7FJGvXgpMdpKkNfkwE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF884E1ABEC

On 7 May 2025, at 17:10, Zi Yan wrote:

> Since migratetype is no longer overwritten during pageblock isolation,
> moving pageblocks to and from MIGRATE_ISOLATE no longer needs migratetype.
>
> Add MIGRATETYPE_NO_ISO_MASK to allow read before-isolation migratetype
> when a pageblock is isolated. It is used by move_freepages_block_isolate().
>
> Add pageblock_isolate_and_move_free_pages() and
> pageblock_unisolate_and_move_free_pages() to be explicit about the page
> isolation operations. Both share the common code in
> __move_freepages_block_isolate(), which is renamed from
> move_freepages_block_isolate().
>
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> ---
>  include/linux/mmzone.h         |  4 ++-
>  include/linux/page-isolation.h |  4 +--
>  mm/page_alloc.c                | 49 +++++++++++++++++++++++++++-------
>  mm/page_isolation.c            | 21 +++++++--------
>  4 files changed, 55 insertions(+), 23 deletions(-)
>

Here is the fixup 2/3 to address Johannes’ comments.

From 4e6fddf64c07da8796ff6ca90703a5aa64302a90 Mon Sep 17 00:00:00 2001
From: Zi Yan <ziy@nvidia.com>
Date: Thu, 8 May 2025 15:23:42 -0400
Subject: [PATCH] fixup for mm/page_isolation: remove migratetype from
 move_freepages_block_isolate()

1. replace get_pageblock_isolate() with
   get_pageblock_migratetype() == MIGRATE_ISOLATE, a
   get_pageblock_isolate() becomes private in mm/page_isolation.c

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 mm/page_alloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index b502e4a3afbe..c99b77fdf383 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1975,7 +1975,7 @@ static bool __move_freepages_block_isolate(struct zone *zone,
 	int from_mt;
 	int to_mt;

-	if (isolate == get_pageblock_isolate(page))
+	if (isolate == (get_pageblock_migratetype(page) == MIGRATE_ISOLATE))
 		return false;

 	if (!prep_move_freepages_block(zone, page, &start_pfn, NULL, NULL))
-- 
2.47.2


Best Regards,
Yan, Zi
