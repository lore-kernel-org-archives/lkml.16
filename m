Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2051.outbound.protection.outlook.com [40.107.92.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDD522FAD4
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 15:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748877500; cv=fail; b=Qvk3JseYWL9D+Vedan60JoneXi+BVpCFJK6gEBjAOPOfHh8012IGuzVJQ7LoHPtNLnldunG8Bv+Bw9bhHJDhptpPCUFbIAP9h7RW0ts2MDe3pOSy2NNFduDwVyAA6u/BujAh/rHRgCoL7wdC7PG8Wy7YbY9GS/wxMKvGISbPhxk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748877500; c=relaxed/simple;
	bh=6U9w1dKsYh/DEQW00DsMHKBMT+TqlZMfENr8pBytKIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=idUwXE/3bDaH9kbrYL/JI356UEgYK0GWRTh5aENvUb931hXJCYJ9MSTJuxisRZU2WTakOQJHteKeKsUHc1ZRFjXgOuXdt0+v8xdL4u30f7KJJqJdrAW3sgUL5TSqDSEQn/nKKmvScNL5Xulh6mbvOASoNgzJbq+veRkN0cyP/Y8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=iII7IMNC; arc=fail smtp.client-ip=40.107.92.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="iII7IMNC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U+ZRbqsmdZg6AgntjK6RN9rddCShrUg2P27jRGZ+esDGwZOiug6SfuY2JagxwO74aKheQli+n77C+noDkYnpIfeLl/PFFMcMXwMGXQTX4wG52UBRjh2Y6g+GdsIlMwj48KHbtIJDTbZ5lscJJbG903fQfQUh9PlnYVv0Pw0m9oJFLAt4QkiKPOLkNYgkJlL4v8ERyMeDzl6loXtoEwmsvs+jGrapFKIuZwjfnmWCMj+Ae+OqZSGr3e0UqV60sDIJP0bFLnORwuRhdo1ZmZa1LPKlibcxl8lFqi+Pdyg9USWAmrxgGxSIrj7GRDgmAfF0kvZ+jWRVandpCYc2WQtD1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S32XQEizl/6DUk/6LC99drW7fwx9X9K2aG6VfQn+4xo=;
 b=O2LYdefkCGGsEPb1rmjUgYmn0TVVsP/W7lQNducWiVpoluvYxgch19PQl9l2NjDao5iotH/M3/NGFs4671TzTobP0vfoE8EHKAA0k+mYHSRCnzGIym+2sP+JwdfAijrYPd61yqFAVhBpIK8Py/KCXBUD9e+EjvvAVoT+/wWhLxIZ/uXHV3QOH5GKcHGWH+CpUy53ICuxSqucVrHHFUnp9b4RgkMSIOlMyWSJNFJynDUhmlmB8v7GvnFy1oehFN5TZdiNYwzSjxMBbqcKrcIrjn5lLt1wMVPMF4FBFCVfjcbLCbOtOcyipWkhB9a3ker8VrY3Erl9v9pAvo5BytKZsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S32XQEizl/6DUk/6LC99drW7fwx9X9K2aG6VfQn+4xo=;
 b=iII7IMNCRfI1EmxndS3C/oIvPi9dKqdUlZoGs6x+8MAh/lzfqVMWVrpOXWCAunUB8BTJ6TiZKdKEmZpBGnik0oCtsvvvCTjV0awWi1lX2CeKyb6Qi0fXfn9F21wLxRtAY8K0zXOHqED88T5iRQ1yTtFLXd5rxwSxXtpC7aUuLaFJEFUYG/d80HzVuQzQpSJ3cu8d3ScYfyRBBBYFa/2oB7Ct7iJJrCnVfnqH9yPjGGq6kn5hPfHHsCkK6L2bphVbAVJUCZGATvBhZ6krHC9eisaQ8vnmlzaZbhBReuFZ0AXY7tEAfwUy8gkPdC7g0McnMiDodIzsOIZ//+OpCS5umw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 LV8PR12MB9450.namprd12.prod.outlook.com (2603:10b6:408:202::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 15:18:12 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8792.034; Mon, 2 Jun 2025
 15:18:12 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Mel Gorman <mgorman@techsingularity.net>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <jackmanb@google.com>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	Zi Yan <ziy@nvidia.com>
Subject: [PATCH v7 1/6] mm/page_alloc: pageblock flags functions clean up.
Date: Mon,  2 Jun 2025 11:18:02 -0400
Message-ID: <20250602151807.987731-2-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250602151807.987731-1-ziy@nvidia.com>
References: <20250602151807.987731-1-ziy@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0240.namprd03.prod.outlook.com
 (2603:10b6:408:f8::35) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|LV8PR12MB9450:EE_
X-MS-Office365-Filtering-Correlation-Id: 62e5170b-869b-4263-94e1-08dda1e8b082
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OuE0CfSvw+25tfRHyvO7riFbRQfU6oDN5aLuwG6BiJdOGCDQ1NEGBP2u/wAl?=
 =?us-ascii?Q?cS07iidpebFw7MVxaKyuyose9JDbpRqQO769PsHet6zacLbXjyVKOO1lazth?=
 =?us-ascii?Q?0pfq7aL1GZN1+ZBoXlqiKdvUCFoJKLWfZB0oBGVasq9iuWblUMh1X6ji/fT7?=
 =?us-ascii?Q?kLpxYG1WsXDNnv6zDZQTB6I0yZr/hQVsfrOaaXAuY4bfcLYP8IJWc5zuyJog?=
 =?us-ascii?Q?j+CW9v+YfsFH0lqp47XQ7VXYFRD2M6YzXOrLwyZvZdOR0M5Jg+TuXrK8d2jA?=
 =?us-ascii?Q?fA75S2J8/J1O6LFXFXdt/1Bz6VDfHrLZYY8/wOySW2Oshk0HHzeIuZdjhgYN?=
 =?us-ascii?Q?ljiNhdRULS1w1AevnQW69U6x0XE90VvhXjxEnlrPhj6EqnP3YPxWxyl4BZLw?=
 =?us-ascii?Q?RhRvFJRgqwbMML/OMzfMAmwbDF/cKFCGXOL3lm525vl10lOc48V5QYFZfFE8?=
 =?us-ascii?Q?AoJWQjPedBqJHSAP5hpT26/THuUT6KcUElaho1JnatqRNpCHVKEjB5ypSWzl?=
 =?us-ascii?Q?pjRjsWG7TgefUrSegrMBIzrOZIyLvx+n9RJSWlgRntIfbyy0CGZYlhKPog22?=
 =?us-ascii?Q?7noKDTgm0ieXm1oiM3uB0oaSyVHunduIBhTGR5EoVn33q83zaWqHmr3LYvCd?=
 =?us-ascii?Q?xAoGyy3l77kvBkQpYT/8vGgS/BRPunwfA8b6oyKSiOeBr9A2rrH1X2/KzZ1F?=
 =?us-ascii?Q?zt1MzDPEoL2BAk5F8ci3TOa83tw2562NQcTCDPJuwo/N0iFjGAWEVvR0pnT7?=
 =?us-ascii?Q?ZSRZnFuGiPxlRy3Jd9vdTfUxt0AM4zGUnJbbBwWm9KIdEeJw4FavfGmGYZV1?=
 =?us-ascii?Q?xYQacNWZtJEjQAcKhL2owD7dh59BagHnyYMBnTwJKdnqjQAknmUQcnv1DUdK?=
 =?us-ascii?Q?YfTjl0olxawYEM4l4O36x1IufMo+HIVo45XYDX98qmEoHrX5ZhRMLzQO+9lE?=
 =?us-ascii?Q?hQMh7kZ0NdXcdlKn7+4FWsfkwglDtQe0VGeDMSMQnYhWVR3HCkjyGGvOeUb2?=
 =?us-ascii?Q?wA1DsMsDt3XnraK/I8lJ2Q9UYbM1KyQ+bdaxZcsUiBna+/O1Ns1EFtaJZ3yG?=
 =?us-ascii?Q?NPdncf4yIXCQnmPZ9bxlhJEIEfEXMq/ZxJk0joNUoxF6f0oeZWnhkmyb8EP8?=
 =?us-ascii?Q?6wikthcPFWVe34AdVw9BW1ZQG5iX4yip8kvcRypSDR302AL2MqCwE6ISIPj3?=
 =?us-ascii?Q?fPXbV3pMB+vBKNpJRDjmuJ0BOTqJFZLu8kETUeK69vK6Lq69hsIOPasF4DV8?=
 =?us-ascii?Q?aPFSWf4s/xUbc9jb8cIvLhjaesuV+Rc1vDSfTPsgxKJCPsE4SsPjcv5I5u3s?=
 =?us-ascii?Q?AZg6V358qj3caKPGRXHxGwy/HNauhgF8frKni9GuXo/kvnuOz5gOoXBX4UVH?=
 =?us-ascii?Q?L6v9g8K+thYJm/HaonCrsclgIHeMcbHO8/YGzXB484TOCzPble3iQHH8P3qt?=
 =?us-ascii?Q?LVLvBtdQrTQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mbC+Mq4ocZYQ2KDZkAzIroXNoue4lHhUjNZFvtBUbc9EEDOeRQPCVFiQaZ4F?=
 =?us-ascii?Q?XK0AsWxB+qNjSC81Mx4vZcSuWE3qA5IuNmz3E/Q6QhjfWEcd88DYZTKZLSNA?=
 =?us-ascii?Q?NAGh4mhfOpp8VNgeYKxZxnSpHwTZZ8w5M7HAdcmOW/vksIU05tTo0KP1Oqqu?=
 =?us-ascii?Q?3OiL2qtryCbIAxxxbqgRUPTqA0bEJVz0aumbb2enM5c6tLoOqP/HWpff16de?=
 =?us-ascii?Q?btZnkm2yM640YaxEENKWg+/32/e7AJ7w7WFGwqD6yzMYExGCMxwwnvhqGWnh?=
 =?us-ascii?Q?bSpr3YMxQLyA12czuGigxr8XNdef8TikncVRmxU3lxqYpWDdyIodOKimwfre?=
 =?us-ascii?Q?+P9o3PaoZQLKjXZZOncXlOO7Vtkfn+kjStYJhZ6TR56JUdMjzOSQgs1/DH9T?=
 =?us-ascii?Q?OUKRdAxpml/409g9dyL1O6TBV9IHqodCO3W1YZCabv4WAMf9EYEeIWzR+8oB?=
 =?us-ascii?Q?zD/OGQr3FK1poh/zQflVB9e+bma8afMWNQOFz+BHgjwEzy6ag8giMVwr/RWZ?=
 =?us-ascii?Q?o2YWY0NjDxg+fJcl41fcD/ZRjEkRnxwrZMJggT1R0wvY9mU7Uu70w4ggldFy?=
 =?us-ascii?Q?7w8SXUbxkes2qbIY2VdjdGhZwBs8uCoaFPxFjOMNHkPfpJ1LaJvJkLb/0Mjy?=
 =?us-ascii?Q?t8dHewMftHK2P6D/nmIQwaEEGrt5sln2FyRYarrGgVw4MJNsLybUW71MqI4p?=
 =?us-ascii?Q?HiWk8M2Arb21yBZ8VIL9Ly9Tep1DzN6M16FsRDvK74sxb8N8UL7U6iYg404Q?=
 =?us-ascii?Q?gU2Trxu3JrYFgfsKhie6ey7mYOyS8U9DMKZwq4ghansABi8TioBB92v3i9dW?=
 =?us-ascii?Q?TgJFcmcat4k0THIspsZvm/abS0Ay+M4o0bstH5ckw/NggpFoRlDh2KacyROK?=
 =?us-ascii?Q?7loaTJ/Vyg/rL/09GfyWLVSIppESqeRK5ZblGxgO4I06JTtdBVZ49kxZiFSO?=
 =?us-ascii?Q?vtdpn/J0RRTuTTdMbJXz2Zl/psjPCjK2emdoV6gQepzJNjsZeaBIbhDMqyeo?=
 =?us-ascii?Q?HqIDlJ76+gAY6wzYlvM5/QZ59P+H0KqF9KvG+xjBk0GkxbFu7kWWLCEACp1R?=
 =?us-ascii?Q?kFPIRz0LYGUagIT7Ca6xw2FqvPcli9DvFIeMFcJAeFcSsZkJ6LYQzw8AIyBY?=
 =?us-ascii?Q?9J5HDGAuSc4Sni6GTRMm8cdcn3LlJMrX27Dn4Rh/SzLhY7uZefbHTQzaV+It?=
 =?us-ascii?Q?d4cDD4SaY1Kfu+43hzXfrGALEnPFytFvovxZx0YG+wKQRX5qrMzxG03yuDIU?=
 =?us-ascii?Q?5JcNmEsUeTnM9bqMiODSK8j9rtwP+31QbZVhIwJkW7P9amkW9uw1cWZZCwUq?=
 =?us-ascii?Q?AtSLrWRPHN9TOHIMH/MVwZqiomwcwcc6jdlWpjJf4xnx2YtA+TIudhKyJoNG?=
 =?us-ascii?Q?GGZtjZQ7SP+hPuX4kyCYEjFcqoNi+4A559wiJTF6kKSP0R0UovkKYp5gKpEv?=
 =?us-ascii?Q?D5BcVScKE0t2lCAc36ykdI6yqQotmfF9MQMgMPWav2BJuwKdhqkuO5zU9R+Z?=
 =?us-ascii?Q?qgn0dslR7wrY8zKFeAt22tSYx++CE6geyED4IfUmjMEP4f99ou9ewvu4V6Jz?=
 =?us-ascii?Q?/DobmoORRdshoZpZ1gsfTzLfW1u8ok/khMD0KFEQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62e5170b-869b-4263-94e1-08dda1e8b082
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 15:18:12.3506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rBKi92CcwJPBaJKhi1DbcqzyyRxGoJbiBytLZPeKUs02i+1LsElBZpThi0oHUM1/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9450

No functional change is intended.

1. Add __NR_PAGEBLOCK_BITS for the number of pageblock flag bits and use
   roundup_pow_of_two(__NR_PAGEBLOCK_BITS) as NR_PAGEBLOCK_BITS to take
   right amount of bits for pageblock flags.
2. Rename PB_migrate_skip to PB_compact_skip.
3. Add {get,set,clear}_pfnblock_bit() to operate one a standalone bit,
   like PB_compact_skip.
3. Make {get,set}_pfnblock_flags_mask() internal functions and use
   {get,set}_pfnblock_migratetype() for pageblock migratetype operations.
4. Move pageblock flags common code to get_pfnblock_bitmap_bitidx().
3. Use MIGRATETYPE_MASK to get the migratetype of a pageblock from its
   flags.
4. Use PB_migrate_end in the definition of MIGRATETYPE_MASK instead of
   PB_migrate_bits.
5. Add a comment on is_migrate_cma_folio() to prevent one from changing it
   to use get_pageblock_migratetype() and causing issues.

Signed-off-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
Acked-by: David Hildenbrand <david@redhat.com>
---
 Documentation/mm/physical_memory.rst |   2 +-
 include/linux/mmzone.h               |  18 +--
 include/linux/page-isolation.h       |   2 +-
 include/linux/pageblock-flags.h      |  34 +++---
 mm/memory_hotplug.c                  |   2 +-
 mm/page_alloc.c                      | 171 +++++++++++++++++++++------
 6 files changed, 162 insertions(+), 67 deletions(-)

diff --git a/Documentation/mm/physical_memory.rst b/Documentation/mm/physical_memory.rst
index d3ac106e6b14..9af11b5bd145 100644
--- a/Documentation/mm/physical_memory.rst
+++ b/Documentation/mm/physical_memory.rst
@@ -584,7 +584,7 @@ Compaction control
 
 ``compact_blockskip_flush``
   Set to true when compaction migration scanner and free scanner meet, which
-  means the ``PB_migrate_skip`` bits should be cleared.
+  means the ``PB_compact_skip`` bits should be cleared.
 
 ``contiguous``
   Set to true when the zone is contiguous (in other words, no hole).
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 87a667533d6d..392a03e37610 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -92,8 +92,12 @@ extern const char * const migratetype_names[MIGRATE_TYPES];
 #ifdef CONFIG_CMA
 #  define is_migrate_cma(migratetype) unlikely((migratetype) == MIGRATE_CMA)
 #  define is_migrate_cma_page(_page) (get_pageblock_migratetype(_page) == MIGRATE_CMA)
-#  define is_migrate_cma_folio(folio, pfn)	(MIGRATE_CMA ==		\
-	get_pfnblock_flags_mask(&folio->page, pfn, MIGRATETYPE_MASK))
+/*
+ * __dump_folio() in mm/debug.c passes a folio pointer to on-stack struct folio,
+ * so folio_pfn() cannot be used and pfn is needed.
+ */
+#  define is_migrate_cma_folio(folio, pfn) \
+	(get_pfnblock_migratetype(&folio->page, pfn) == MIGRATE_CMA)
 #else
 #  define is_migrate_cma(migratetype) false
 #  define is_migrate_cma_page(_page) false
@@ -122,14 +126,12 @@ static inline bool migratetype_is_mergeable(int mt)
 
 extern int page_group_by_mobility_disabled;
 
-#define MIGRATETYPE_MASK ((1UL << PB_migratetype_bits) - 1)
+#define get_pageblock_migratetype(page) \
+	get_pfnblock_migratetype(page, page_to_pfn(page))
 
-#define get_pageblock_migratetype(page)					\
-	get_pfnblock_flags_mask(page, page_to_pfn(page), MIGRATETYPE_MASK)
+#define folio_migratetype(folio) \
+	get_pageblock_migratetype(&folio->page)
 
-#define folio_migratetype(folio)				\
-	get_pfnblock_flags_mask(&folio->page, folio_pfn(folio),		\
-			MIGRATETYPE_MASK)
 struct free_area {
 	struct list_head	free_list[MIGRATE_TYPES];
 	unsigned long		nr_free;
diff --git a/include/linux/page-isolation.h b/include/linux/page-isolation.h
index 898bb788243b..277d8d92980c 100644
--- a/include/linux/page-isolation.h
+++ b/include/linux/page-isolation.h
@@ -25,7 +25,7 @@ static inline bool is_migrate_isolate(int migratetype)
 #define MEMORY_OFFLINE	0x1
 #define REPORT_FAILURE	0x2
 
-void set_pageblock_migratetype(struct page *page, int migratetype);
+void set_pageblock_migratetype(struct page *page, enum migratetype migratetype);
 
 bool move_freepages_block_isolate(struct zone *zone, struct page *page,
 				  int migratetype);
diff --git a/include/linux/pageblock-flags.h b/include/linux/pageblock-flags.h
index e73a4292ef02..451b351c689e 100644
--- a/include/linux/pageblock-flags.h
+++ b/include/linux/pageblock-flags.h
@@ -19,15 +19,19 @@ enum pageblock_bits {
 	PB_migrate,
 	PB_migrate_end = PB_migrate + PB_migratetype_bits - 1,
 			/* 3 bits required for migrate types */
-	PB_migrate_skip,/* If set the block is skipped by compaction */
+	PB_compact_skip,/* If set the block is skipped by compaction */
 
 	/*
 	 * Assume the bits will always align on a word. If this assumption
 	 * changes then get/set pageblock needs updating.
 	 */
-	NR_PAGEBLOCK_BITS
+	__NR_PAGEBLOCK_BITS
 };
 
+#define NR_PAGEBLOCK_BITS (roundup_pow_of_two(__NR_PAGEBLOCK_BITS))
+
+#define MIGRATETYPE_MASK ((1UL << (PB_migrate_end + 1)) - 1)
+
 #if defined(CONFIG_HUGETLB_PAGE)
 
 #ifdef CONFIG_HUGETLB_PAGE_SIZE_VARIABLE
@@ -65,27 +69,23 @@ extern unsigned int pageblock_order;
 /* Forward declaration */
 struct page;
 
-unsigned long get_pfnblock_flags_mask(const struct page *page,
-				unsigned long pfn,
-				unsigned long mask);
-
-void set_pfnblock_flags_mask(struct page *page,
-				unsigned long flags,
-				unsigned long pfn,
-				unsigned long mask);
+enum migratetype get_pfnblock_migratetype(const struct page *page,
+					  unsigned long pfn);
+bool get_pfnblock_bit(const struct page *page, unsigned long pfn,
+		      enum pageblock_bits pb_bit);
+void set_pfnblock_bit(const struct page *page, unsigned long pfn,
+		      enum pageblock_bits pb_bit);
+void clear_pfnblock_bit(const struct page *page, unsigned long pfn,
+			enum pageblock_bits pb_bit);
 
 /* Declarations for getting and setting flags. See mm/page_alloc.c */
 #ifdef CONFIG_COMPACTION
 #define get_pageblock_skip(page) \
-	get_pfnblock_flags_mask(page, page_to_pfn(page),	\
-			(1 << (PB_migrate_skip)))
+	get_pfnblock_bit(page, page_to_pfn(page), PB_compact_skip)
 #define clear_pageblock_skip(page) \
-	set_pfnblock_flags_mask(page, 0, page_to_pfn(page),	\
-			(1 << PB_migrate_skip))
+	clear_pfnblock_bit(page, page_to_pfn(page), PB_compact_skip)
 #define set_pageblock_skip(page) \
-	set_pfnblock_flags_mask(page, (1 << PB_migrate_skip),	\
-			page_to_pfn(page),			\
-			(1 << PB_migrate_skip))
+	set_pfnblock_bit(page, page_to_pfn(page), PB_compact_skip)
 #else
 static inline bool get_pageblock_skip(struct page *page)
 {
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index b1caedbade5b..4ce5210ea56e 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -797,7 +797,7 @@ void move_pfn_range_to_zone(struct zone *zone, unsigned long start_pfn,
 
 	/*
 	 * TODO now we have a visible range of pages which are not associated
-	 * with their zone properly. Not nice but set_pfnblock_flags_mask
+	 * with their zone properly. Not nice but set_pfnblock_migratetype()
 	 * expects the zone spans the pfn range. All the pages in the range
 	 * are reserved so nobody should be touching them so we should be safe
 	 */
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index cc9577a27ec4..74cb7696e527 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -353,81 +353,174 @@ static inline int pfn_to_bitidx(const struct page *page, unsigned long pfn)
 	return (pfn >> pageblock_order) * NR_PAGEBLOCK_BITS;
 }
 
+static __always_inline bool is_standalone_pb_bit(enum pageblock_bits pb_bit)
+{
+	return pb_bit > PB_migrate_end && pb_bit < __NR_PAGEBLOCK_BITS;
+}
+
+static __always_inline void
+get_pfnblock_bitmap_bitidx(const struct page *page, unsigned long pfn,
+			   unsigned long **bitmap_word, unsigned long *bitidx)
+{
+	unsigned long *bitmap;
+	unsigned long word_bitidx;
+
+	BUILD_BUG_ON(NR_PAGEBLOCK_BITS != 4);
+	BUILD_BUG_ON(MIGRATE_TYPES > (1 << PB_migratetype_bits));
+	VM_BUG_ON_PAGE(!zone_spans_pfn(page_zone(page), pfn), page);
+
+	bitmap = get_pageblock_bitmap(page, pfn);
+	*bitidx = pfn_to_bitidx(page, pfn);
+	word_bitidx = *bitidx / BITS_PER_LONG;
+	*bitidx &= (BITS_PER_LONG - 1);
+	*bitmap_word = &bitmap[word_bitidx];
+}
+
+
 /**
- * get_pfnblock_flags_mask - Return the requested group of flags for the pageblock_nr_pages block of pages
+ * __get_pfnblock_flags_mask - Return the requested group of flags for
+ * a pageblock_nr_pages block of pages
  * @page: The page within the block of interest
  * @pfn: The target page frame number
  * @mask: mask of bits that the caller is interested in
  *
  * Return: pageblock_bits flags
  */
-unsigned long get_pfnblock_flags_mask(const struct page *page,
-					unsigned long pfn, unsigned long mask)
+static unsigned long __get_pfnblock_flags_mask(const struct page *page,
+					       unsigned long pfn,
+					       unsigned long mask)
 {
-	unsigned long *bitmap;
-	unsigned long bitidx, word_bitidx;
+	unsigned long *bitmap_word;
+	unsigned long bitidx;
 	unsigned long word;
 
-	bitmap = get_pageblock_bitmap(page, pfn);
-	bitidx = pfn_to_bitidx(page, pfn);
-	word_bitidx = bitidx / BITS_PER_LONG;
-	bitidx &= (BITS_PER_LONG-1);
+	get_pfnblock_bitmap_bitidx(page, pfn, &bitmap_word, &bitidx);
 	/*
-	 * This races, without locks, with set_pfnblock_flags_mask(). Ensure
+	 * This races, without locks, with set_pfnblock_migratetype(). Ensure
 	 * a consistent read of the memory array, so that results, even though
 	 * racy, are not corrupted.
 	 */
-	word = READ_ONCE(bitmap[word_bitidx]);
+	word = READ_ONCE(*bitmap_word);
 	return (word >> bitidx) & mask;
 }
 
-static __always_inline int get_pfnblock_migratetype(const struct page *page,
-					unsigned long pfn)
+/**
+ * get_pfnblock_bit - Check if a standalone bit of a pageblock is set
+ * @page: The page within the block of interest
+ * @pfn: The target page frame number
+ * @pb_bit: pageblock bit to check
+ *
+ * Return: true if the bit is set, otherwise false
+ */
+bool get_pfnblock_bit(const struct page *page, unsigned long pfn,
+		      enum pageblock_bits pb_bit)
 {
-	return get_pfnblock_flags_mask(page, pfn, MIGRATETYPE_MASK);
+	unsigned long *bitmap_word;
+	unsigned long bitidx;
+
+	if (WARN_ON_ONCE(!is_standalone_pb_bit(pb_bit)))
+		return false;
+
+	get_pfnblock_bitmap_bitidx(page, pfn, &bitmap_word, &bitidx);
+
+	return test_bit(bitidx + pb_bit, bitmap_word);
 }
 
 /**
- * set_pfnblock_flags_mask - Set the requested group of flags for a pageblock_nr_pages block of pages
+ * get_pfnblock_migratetype - Return the migratetype of a pageblock
+ * @page: The page within the block of interest
+ * @pfn: The target page frame number
+ *
+ * Return: The migratetype of the pageblock
+ *
+ * Use get_pfnblock_migratetype() if caller already has both @page and @pfn
+ * to save a call to page_to_pfn().
+ */
+__always_inline enum migratetype
+get_pfnblock_migratetype(const struct page *page, unsigned long pfn)
+{
+	return __get_pfnblock_flags_mask(page, pfn, MIGRATETYPE_MASK);
+}
+
+/**
+ * __set_pfnblock_flags_mask - Set the requested group of flags for
+ * a pageblock_nr_pages block of pages
  * @page: The page within the block of interest
- * @flags: The flags to set
  * @pfn: The target page frame number
+ * @flags: The flags to set
  * @mask: mask of bits that the caller is interested in
  */
-void set_pfnblock_flags_mask(struct page *page, unsigned long flags,
-					unsigned long pfn,
-					unsigned long mask)
+static void __set_pfnblock_flags_mask(struct page *page, unsigned long pfn,
+				      unsigned long flags, unsigned long mask)
 {
-	unsigned long *bitmap;
-	unsigned long bitidx, word_bitidx;
+	unsigned long *bitmap_word;
+	unsigned long bitidx;
 	unsigned long word;
 
-	BUILD_BUG_ON(NR_PAGEBLOCK_BITS != 4);
-	BUILD_BUG_ON(MIGRATE_TYPES > (1 << PB_migratetype_bits));
-
-	bitmap = get_pageblock_bitmap(page, pfn);
-	bitidx = pfn_to_bitidx(page, pfn);
-	word_bitidx = bitidx / BITS_PER_LONG;
-	bitidx &= (BITS_PER_LONG-1);
-
-	VM_BUG_ON_PAGE(!zone_spans_pfn(page_zone(page), pfn), page);
+	get_pfnblock_bitmap_bitidx(page, pfn, &bitmap_word, &bitidx);
 
 	mask <<= bitidx;
 	flags <<= bitidx;
 
-	word = READ_ONCE(bitmap[word_bitidx]);
+	word = READ_ONCE(*bitmap_word);
 	do {
-	} while (!try_cmpxchg(&bitmap[word_bitidx], &word, (word & ~mask) | flags));
+	} while (!try_cmpxchg(bitmap_word, &word, (word & ~mask) | flags));
+}
+
+/**
+ * set_pfnblock_bit - Set a standalone bit of a pageblock
+ * @page: The page within the block of interest
+ * @pfn: The target page frame number
+ * @pb_bit: pageblock bit to set
+ */
+void set_pfnblock_bit(const struct page *page, unsigned long pfn,
+		      enum pageblock_bits pb_bit)
+{
+	unsigned long *bitmap_word;
+	unsigned long bitidx;
+
+	if (WARN_ON_ONCE(!is_standalone_pb_bit(pb_bit)))
+		return;
+
+	get_pfnblock_bitmap_bitidx(page, pfn, &bitmap_word, &bitidx);
+
+	set_bit(bitidx + pb_bit, bitmap_word);
 }
 
-void set_pageblock_migratetype(struct page *page, int migratetype)
+/**
+ * clear_pfnblock_bit - Clear a standalone bit of a pageblock
+ * @page: The page within the block of interest
+ * @pfn: The target page frame number
+ * @pb_bit: pageblock bit to clear
+ */
+void clear_pfnblock_bit(const struct page *page, unsigned long pfn,
+			enum pageblock_bits pb_bit)
+{
+	unsigned long *bitmap_word;
+	unsigned long bitidx;
+
+	if (WARN_ON_ONCE(!is_standalone_pb_bit(pb_bit)))
+		return;
+
+	get_pfnblock_bitmap_bitidx(page, pfn, &bitmap_word, &bitidx);
+
+	clear_bit(bitidx + pb_bit, bitmap_word);
+}
+
+/**
+ * set_pageblock_migratetype - Set the migratetype of a pageblock
+ * @page: The page within the block of interest
+ * @migratetype: migratetype to set
+ */
+__always_inline void set_pageblock_migratetype(struct page *page,
+					       enum migratetype migratetype)
 {
 	if (unlikely(page_group_by_mobility_disabled &&
 		     migratetype < MIGRATE_PCPTYPES))
 		migratetype = MIGRATE_UNMOVABLE;
 
-	set_pfnblock_flags_mask(page, (unsigned long)migratetype,
-				page_to_pfn(page), MIGRATETYPE_MASK);
+	__set_pfnblock_flags_mask(page, page_to_pfn(page),
+				  (unsigned long)migratetype, MIGRATETYPE_MASK);
 }
 
 #ifdef CONFIG_DEBUG_VM
@@ -667,7 +760,7 @@ static inline void __add_to_free_list(struct page *page, struct zone *zone,
 	int nr_pages = 1 << order;
 
 	VM_WARN_ONCE(get_pageblock_migratetype(page) != migratetype,
-		     "page type is %lu, passed migratetype is %d (nr=%d)\n",
+		     "page type is %d, passed migratetype is %d (nr=%d)\n",
 		     get_pageblock_migratetype(page), migratetype, nr_pages);
 
 	if (tail)
@@ -693,7 +786,7 @@ static inline void move_to_free_list(struct page *page, struct zone *zone,
 
 	/* Free page moving can fail, so it happens before the type update */
 	VM_WARN_ONCE(get_pageblock_migratetype(page) != old_mt,
-		     "page type is %lu, passed migratetype is %d (nr=%d)\n",
+		     "page type is %d, passed migratetype is %d (nr=%d)\n",
 		     get_pageblock_migratetype(page), old_mt, nr_pages);
 
 	list_move_tail(&page->buddy_list, &area->free_list[new_mt]);
@@ -715,7 +808,7 @@ static inline void __del_page_from_free_list(struct page *page, struct zone *zon
 	int nr_pages = 1 << order;
 
         VM_WARN_ONCE(get_pageblock_migratetype(page) != migratetype,
-		     "page type is %lu, passed migratetype is %d (nr=%d)\n",
+		     "page type is %d, passed migratetype is %d (nr=%d)\n",
 		     get_pageblock_migratetype(page), migratetype, nr_pages);
 
 	/* clear reported state and update reported page count */
@@ -3127,7 +3220,7 @@ static struct page *rmqueue_pcplist(struct zone *preferred_zone,
 
 /*
  * Do not instrument rmqueue() with KMSAN. This function may call
- * __msan_poison_alloca() through a call to set_pfnblock_flags_mask().
+ * __msan_poison_alloca() through a call to set_pfnblock_migratetype().
  * If __msan_poison_alloca() attempts to allocate pages for the stack depot, it
  * may call rmqueue() again, which will result in a deadlock.
  */
-- 
2.47.2

