Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2051.outbound.protection.outlook.com [40.107.92.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C21235041
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 15:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748877512; cv=fail; b=uJTMUM+zF4MLDz6cJZV9YlDRKynV45FUWHeMWBR8CpXlcXD5VzpE5UqtRc0yuUenH9ySmhl/yjAfpIg9wsjn9mk5u1Un4xtQ2CCAcm1w4vKVc4LlAd6psbNciH2RYALybktIJvyGND5BvzONdCtsiHq/QkH8pXgHo9VroTsgZnA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748877512; c=relaxed/simple;
	bh=Am2frd/TRJXCIdlvXfNFm9iMtGdI/cmrUOReA72IND8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=odZpb0AwvSFMn6rg5whrPzNvW7ehBUR1zTc7PR4eBGWvV/7l2PNkAzGrJnplsB9MYK03lc/U0o0KKW6xkIMJDcQH8Ul2tzNTyajtqC0aIKvTngjlL5qOp29f3fJdeduXhHcfhBGIm8WpUiJ3QkFbt/Rg3pDzdH4MHdZ7q0OEUM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sXdqc8+w; arc=fail smtp.client-ip=40.107.92.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sXdqc8+w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bF+N0M6qB0aep1ZgFArtL8b4L7xQ3byCXiE86BpmPFfWNJriqC679+DDnhgQV9g/O1L0t0rLDnSw76SilRV262rCp5Wu0xgi3/2SFetRkoDqLQZKXoqgaRXr7HaiZmzCffipu0kZx1R0T+f9s1NFaWLojZjXjHcpvjs7IE3pVDUMHJVf6kn9kXCnEU3jW0sxZ6bY6GEcieyEN0KmPt4nR/vyP3xHuDMJmZnxsBj+aWnQU7giID0v++CagZoYXejtxxKHp6I5AjrI/S4uQTJqOO8FRb/KSydrqKoiNY4M4DXNguMIZIwqyhw62GFKoADjIQwSY90xIMPB/lanFkqY0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qZeTqg6z0kj0O+HI8GmQzwxQO6usyTldHlTsCtq7P5U=;
 b=TC3qe5trIYSQ3xy6vNMs/4sylMItvo5jtZMEQMjpdYYKwX4YBMnYIPS3qG36JN8RqIvMi2WkPXiPYB7zZvJtnEWxSid4hsILFt/RMZXoXf3qXyxeniwaBa7Lfq5FBv84qnQq3Xbgeyj4DQGlT/B4xhDLwJoAxm+Vr2liB7FRVs35NoqABDbQGVEXY/eAXGRMoj83jaoglYt76uSJrb7jWtqSjeBScw9c6y9DDFU/rIPz366ipjj0hHz2uqCBYR67043K2iC9h8QgShQxTG+lvQlER8sYZbi1QL/1ZBgKdvsuJKf543UYN8lGw0NtnpVPAfI1k4jtZ/7KHJxFecGRJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qZeTqg6z0kj0O+HI8GmQzwxQO6usyTldHlTsCtq7P5U=;
 b=sXdqc8+wWKgoytkRkRPELQ8ymAwKyB/r8IxU2+B/1vV2tCcmif7RgvFO4zSwjU1CHF/U7Ck507CNxqTZOUfWiG6/RV5IWN0xPMNifqHAdGi5njmwjglww9l3V8EvWcR8aar+dser9GUOlNEaFnqxfQ4jjK3g8ZXktZMhjk2/KJU9aB2ubjwHDfcbUuPkXEsyKJw6AMG2PHFg/dZn3dERGU4D/YYEqneCf1UG7X8vuMu0uR+R0LmG8JDGT6g302fiE4sl6q1m32gIkxQT0TDi7+HwLNThntjsCDmknqm/s5wce1HDCla9K8x7BanNgvHJuR9KfTK5CZk4qPyw4l+UVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 LV8PR12MB9450.namprd12.prod.outlook.com (2603:10b6:408:202::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 15:18:19 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8792.034; Mon, 2 Jun 2025
 15:18:19 +0000
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
Subject: [PATCH v7 6/6] mm/page_isolation: remove migratetype parameter from more functions.
Date: Mon,  2 Jun 2025 11:18:07 -0400
Message-ID: <20250602151807.987731-7-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250602151807.987731-1-ziy@nvidia.com>
References: <20250602151807.987731-1-ziy@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0265.namprd03.prod.outlook.com
 (2603:10b6:408:ff::30) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|LV8PR12MB9450:EE_
X-MS-Office365-Filtering-Correlation-Id: 956319f4-deed-41ba-3e09-08dda1e8b4ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5wa3GNdiopInYjLcWSD3eZsjg1yU7XrkWd1O/UWY6YC1QQYElbHZJpvc1hqj?=
 =?us-ascii?Q?1sBhLYat35ETNQoMKXJqRU4k28ZCdqAn2F0kG8LaJZ++j8KUHqGTtiOi6shS?=
 =?us-ascii?Q?EgHHkcV7sn906XnpRQTlRnSadPo16Pa4TUdf/r5vy6qfJCy786EbsSBHVgSi?=
 =?us-ascii?Q?S5/EjWzokIytYXXfkWRTmXIQdGG0vHKH7n6GRElZBWkFF8DCwiFpxr6xKrtw?=
 =?us-ascii?Q?zBQjlP9sU53IdI5jH8YrGEFvon1lmxMJdEFhMFVk7gAj9KCwqTTmanQAk1ej?=
 =?us-ascii?Q?PZARlbMwDVLi8JZLPVnQVgvzV5TDC9Ey856ndH7aCRqlEeOI5lgEx+DGQHZO?=
 =?us-ascii?Q?6XO8OtbuwMFFl6gRf3CRQxjskTuUAc6YXW5y16FOg4TY9MivOkZd/ltLYJPH?=
 =?us-ascii?Q?KDiIv66zWnjp8srJSygJzCiEGl/DCfggC0OCUY5RJiajaa8Akb0n3GJqO9DY?=
 =?us-ascii?Q?UUb91qVHWDkoScjtdydnvk1nxA7dQQNV4TbdJnoxwVjGxtvgAoGbCzKQiUsV?=
 =?us-ascii?Q?NMcalidWQ3/85t/m6nLhLOT5o0BarRP9YrtuYmHIRDVSIOILVbynWZFQs+5B?=
 =?us-ascii?Q?tAEXK9AHIReoK0qaHrl4qgrV6jo/S06sS3LyD/YD18EnRX//mJZrqKp5xYqP?=
 =?us-ascii?Q?hbX92eDcvqyLLWad9usQbcuBh5fCaZDqUScRZKeCPjf7XM6dFbneA6IPwNF9?=
 =?us-ascii?Q?9BVxXuyw3Ad+KeU4+KLvMRK+bnzuBw9OsaTFFsbEHktT1ILtBA+CZNbep+2Z?=
 =?us-ascii?Q?kItzMZ1szqFQyvuj69sSsbwXzdgpxVweZB5WqOlvGn1VxjIkkXJG2HSPOOEU?=
 =?us-ascii?Q?IuSZt9PkLElgh9I3hF8qu+aw5s1PJMuogLLavkWGG05aEGaQh/3X5YEVrirZ?=
 =?us-ascii?Q?CW0uKz6zW0hzQ0H0VLmEpaFZusC7Jg8mLxR7P4r70HvNjg4lS7udce1xF9fn?=
 =?us-ascii?Q?jdt+5uCILu2sCQWkHy5AGUSw9p+vYWktYqbq3bPygrc1+CvbbbeEkyBTJrkt?=
 =?us-ascii?Q?5B0Gv+8LlMWSOZ3IkTobPwzDN+YLASHJajn8Xdl7tPKwPRFQM3Il4Q4ChhF7?=
 =?us-ascii?Q?UK4rhkqQXalFHHPxfJgLHY3F7LJLfvzK5XcVb9nnvmKqq6+rA9p6vfipYdpu?=
 =?us-ascii?Q?8GGy7V2sAKWztVVyuCOKHUTsgM4MDOyqTjKhpPOKCJ4wAzI7sYG4bbP0jU+Y?=
 =?us-ascii?Q?BL2COAbOoh74LBPbwl/U2aTGRV+2lX625Uz+Rhw5WiFEJn7X5wcATJTBtFmc?=
 =?us-ascii?Q?Q0ATjLWgdg/xqsx9qKnx4yQUtErHi8tc63Mk5lNsSHMEnJ4xQ3Nq/njYbjrm?=
 =?us-ascii?Q?y+64LJ0mTJ1L8ExiygZoUi3Z3Z0i+abT/OOb++Q2eoACOo4B7BwjVqGF1elz?=
 =?us-ascii?Q?bxa4GfP9h88ykXFKmWk0j/KgvWloY4Fu0eJuG+nTZFOET19DEFdblK+xqXlc?=
 =?us-ascii?Q?6wfoyH+J4GA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xsLSekf/zJmrmIIFHD2xl4TNkPmnfxcxehsgIwGlNHK4K10GFpNZS69Br41j?=
 =?us-ascii?Q?fIxnsMiiuYnIQ0rKXLmmNYD1RhNgMcuJy6teNvpzcfSyXgLiydWvUg8oyBmL?=
 =?us-ascii?Q?8UsMlFntTIWwTfyVP6nMj37T2rQkq+BbrN7U5HnPD1okfs62a/7ojJRmXfG0?=
 =?us-ascii?Q?cNbmEWBkD8xr6+9Fgt/ASnnNDyfp/iLrsWuPUjvn7CxqYrfR2voOe2usYUPx?=
 =?us-ascii?Q?BqvZG+7Gf6KwMaYMx4yAXA1LKvduyFhx3OGr08VW4HMDb7iSYQ8tML+1csVC?=
 =?us-ascii?Q?F5plhbV4ZoBLNKIVbSZvNli9L09ONg0yToQ0bsRwWdMBpjOxGJrNuBWojMqB?=
 =?us-ascii?Q?zqTOmzmhSUiNRuoRuqrMhwb/G83Kz8DdBQQv4et/VPZjypEo4BRgd7IkbT77?=
 =?us-ascii?Q?fcjGFo0VwQ3FU70H9F04Vk3dQWJDRj9RtJqiRCX3WuSsi5McpbEN7vnZSpYH?=
 =?us-ascii?Q?WtRL2aP27fBJ4JwhE1xwTv31uufPkq70CYJT+cFG4I84ngIHs80mqSG7Q9gn?=
 =?us-ascii?Q?QLHQgNfA18T/ZgsqdwhJhSzlDphyrH9AyNYGMHECnjdIcW1sYFPeXOsH0sD8?=
 =?us-ascii?Q?crZOcHJVCe1JeEpc6tMRgYCQKa2AKD4qJPkTlcAPXdXJ8NiugWIUCaJa71Lg?=
 =?us-ascii?Q?jfYkxy5kEv6SJngQC3UyJIXpY6xW1AdPdZZV3NGt1vLvzLDbm+39m2dyNMKY?=
 =?us-ascii?Q?+jNUS2wz3rus8Id48g6Tug16p0+eG6rWAN4sfOTIuhUQzUk4LlVU71ONUSnE?=
 =?us-ascii?Q?uJB9HhiFLWqM19an7w4RoOsQgPb1F1RVtSCidnVe8HITvNwL+xzxrPwEBxtY?=
 =?us-ascii?Q?GQ7qG2W7Afp9BiGdwzhvaE8AmDUyOW66RMue+4/y9iKV0LlPI5rQs3bZSFe9?=
 =?us-ascii?Q?vACe9z0PcZY7dJIkh7fdcgabIiqHiITDp/40d4Kp8puFpLz5Xe6qVM91kFys?=
 =?us-ascii?Q?J1TLuui/EfARypLlxzbMdFTX+COuitiFdEP7FMvJldwa3Nylc7tcTcMf1fNI?=
 =?us-ascii?Q?mC2CSgyF31QYpzcVIGukGbnA3vNd2F/56I4FsWUpMMiYaOu9NJ/zHra8Mkpm?=
 =?us-ascii?Q?cJuPFWIXANTESI8w//sl/NylV3SSnBrVBpDMDhlpva820cK5/Wo6sItwhIQz?=
 =?us-ascii?Q?mZ2mlAC4NRY+Rvd7kB0Cr4EpDB98Im71owHjDm2cyw9LkbVLLx7AMoZq2kgT?=
 =?us-ascii?Q?rYBVxaNs9u0lPrXCGU+f8skWy9c/6IxY8s5XgWTSmJqLObm35gpOjfRdkft7?=
 =?us-ascii?Q?OJcX0WZdsrq3SAEkLvb4R/2kzisSFbVGSZkz2yFp+0Mk/KNfBlr7KFxk3Bba?=
 =?us-ascii?Q?cENFM+flRNnabySQLqVTGTuPjouy2lShr/0Ms/NuyZDpXXs6hOzm8/1WOlxx?=
 =?us-ascii?Q?GQD0Pi2HOT9Zy+mkQNvFm3d4vKktvGmd69q8c6RNRSzVpfUvtpBLGxjqCALG?=
 =?us-ascii?Q?7npDkqKmZuu1FD0boIpx02baDnC/YkmkgiwAQWJe0Xc2nHrmvkxQKgGRR41e?=
 =?us-ascii?Q?XFcWWPrtuyjb02dMzxX7wJZOuBk3QhadekhaIhuy7HPdi4rsxWhhjbRMy9J7?=
 =?us-ascii?Q?o+/O5MXgAWcjYw+W7k6JHWhf6bIOpD1E5Bzptw+8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 956319f4-deed-41ba-3e09-08dda1e8b4ba
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 15:18:19.4227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bi4BBf/DK/DHF7mf9wNkeQXcbaIFPBfld7z+72lke3HEreh0H6Khe9RarwE3yzeG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9450

migratetype is no longer overwritten during pageblock isolation,
start_isolate_page_range(), has_unmovable_pages(), and
set_migratetype_isolate() no longer need which migratetype to restore
during isolation failure.

For has_unmoable_pages(), it needs to know if the isolation is for CMA
allocation, so adding PB_ISOLATE_MODE_CMA_ALLOC provide the information.
At the same time change isolation flags to enum pb_isolate_mode
(PB_ISOLATE_MODE_MEM_OFFLINE, PB_ISOLATE_MODE_CMA_ALLOC,
PB_ISOLATE_MODE_OTHER). Remove REPORT_FAILURE and check
PB_ISOLATE_MODE_MEM_OFFLINE, since only PB_ISOLATE_MODE_MEM_OFFLINE
reports isolation failures.

alloc_contig_range() no longer needs migratetype. Replace it with
PB_ISOLATE_MODE_CMA_ALLOC to tell if an allocation is for CMA. So does
__alloc_contig_migrate_range().

Signed-off-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
---
 drivers/virtio/virtio_mem.c    |  4 +-
 include/linux/gfp.h            | 18 ++++++++-
 include/linux/page-isolation.h |  7 +---
 include/trace/events/kmem.h    | 14 ++++---
 mm/cma.c                       |  3 +-
 mm/memory_hotplug.c            |  6 +--
 mm/page_alloc.c                | 27 ++++++-------
 mm/page_isolation.c            | 70 +++++++++++++++-------------------
 8 files changed, 79 insertions(+), 70 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index 56d0dbe62163..535680a54ff5 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -1243,8 +1243,8 @@ static int virtio_mem_fake_offline(struct virtio_mem *vm, unsigned long pfn,
 		if (atomic_read(&vm->config_changed))
 			return -EAGAIN;
 
-		rc = alloc_contig_range(pfn, pfn + nr_pages, MIGRATE_MOVABLE,
-					GFP_KERNEL);
+		rc = alloc_contig_range(pfn, pfn + nr_pages,
+					PB_ISOLATE_MODE_OTHER, GFP_KERNEL);
 		if (rc == -ENOMEM)
 			/* whoops, out of memory */
 			return rc;
diff --git a/include/linux/gfp.h b/include/linux/gfp.h
index be160e8d8bcb..17b92888d6de 100644
--- a/include/linux/gfp.h
+++ b/include/linux/gfp.h
@@ -423,9 +423,25 @@ static inline bool gfp_compaction_allowed(gfp_t gfp_mask)
 extern gfp_t vma_thp_gfp_mask(struct vm_area_struct *vma);
 
 #ifdef CONFIG_CONTIG_ALLOC
+/*
+ * Pageblock isolation modes:
+ * PB_ISOLATE_MODE_MEM_OFFLINE - isolate to offline (!allocate) memory
+ *				 e.g., skip over PageHWPoison() pages and
+ *				 PageOffline() pages. Unmovable pages will be
+ *				 reported in this mode.
+ * PB_ISOLATE_MODE_CMA_ALLOC   - isolate for CMA allocations
+ * PB_ISOLATE_MODE_OTHER       - isolate for other purposes
+ */
+enum pb_isolate_mode {
+	PB_ISOLATE_MODE_MEM_OFFLINE,
+	PB_ISOLATE_MODE_CMA_ALLOC,
+	PB_ISOLATE_MODE_OTHER,
+};
+
 /* The below functions must be run on a range from a single zone. */
 extern int alloc_contig_range_noprof(unsigned long start, unsigned long end,
-			      unsigned migratetype, gfp_t gfp_mask);
+				     enum pb_isolate_mode isol_mode,
+				     gfp_t gfp_mask);
 #define alloc_contig_range(...)			alloc_hooks(alloc_contig_range_noprof(__VA_ARGS__))
 
 extern struct page *alloc_contig_pages_noprof(unsigned long nr_pages, gfp_t gfp_mask,
diff --git a/include/linux/page-isolation.h b/include/linux/page-isolation.h
index 7a681a49e73c..7ed60a339a02 100644
--- a/include/linux/page-isolation.h
+++ b/include/linux/page-isolation.h
@@ -38,9 +38,6 @@ static inline void set_pageblock_isolate(struct page *page)
 }
 #endif
 
-#define MEMORY_OFFLINE	0x1
-#define REPORT_FAILURE	0x2
-
 void __meminit init_pageblock_migratetype(struct page *page,
 					  enum migratetype migratetype,
 					  bool isolate);
@@ -49,10 +46,10 @@ bool pageblock_isolate_and_move_free_pages(struct zone *zone, struct page *page)
 bool pageblock_unisolate_and_move_free_pages(struct zone *zone, struct page *page);
 
 int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
-			     int migratetype, int flags);
+			     enum pb_isolate_mode mode);
 
 void undo_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn);
 
 int test_pages_isolated(unsigned long start_pfn, unsigned long end_pfn,
-			int isol_flags);
+			enum pb_isolate_mode mode);
 #endif
diff --git a/include/trace/events/kmem.h b/include/trace/events/kmem.h
index f74925a6cf69..e0bcbc43a548 100644
--- a/include/trace/events/kmem.h
+++ b/include/trace/events/kmem.h
@@ -304,6 +304,7 @@ TRACE_EVENT(mm_page_alloc_extfrag,
 		__entry->change_ownership)
 );
 
+#ifdef CONFIG_CONTIG_ALLOC
 TRACE_EVENT(mm_alloc_contig_migrate_range_info,
 
 	TP_PROTO(unsigned long start,
@@ -311,9 +312,9 @@ TRACE_EVENT(mm_alloc_contig_migrate_range_info,
 		 unsigned long nr_migrated,
 		 unsigned long nr_reclaimed,
 		 unsigned long nr_mapped,
-		 int migratetype),
+		 enum pb_isolate_mode isol_mode),
 
-	TP_ARGS(start, end, nr_migrated, nr_reclaimed, nr_mapped, migratetype),
+	TP_ARGS(start, end, nr_migrated, nr_reclaimed, nr_mapped, isol_mode),
 
 	TP_STRUCT__entry(
 		__field(unsigned long, start)
@@ -321,7 +322,7 @@ TRACE_EVENT(mm_alloc_contig_migrate_range_info,
 		__field(unsigned long, nr_migrated)
 		__field(unsigned long, nr_reclaimed)
 		__field(unsigned long, nr_mapped)
-		__field(int, migratetype)
+		__field(enum pb_isolate_mode, isol_mode)
 	),
 
 	TP_fast_assign(
@@ -330,17 +331,18 @@ TRACE_EVENT(mm_alloc_contig_migrate_range_info,
 		__entry->nr_migrated = nr_migrated;
 		__entry->nr_reclaimed = nr_reclaimed;
 		__entry->nr_mapped = nr_mapped;
-		__entry->migratetype = migratetype;
+		__entry->isol_mode = isol_mode;
 	),
 
-	TP_printk("start=0x%lx end=0x%lx migratetype=%d nr_migrated=%lu nr_reclaimed=%lu nr_mapped=%lu",
+	TP_printk("start=0x%lx end=0x%lx isol_mode=%d nr_migrated=%lu nr_reclaimed=%lu nr_mapped=%lu",
 		  __entry->start,
 		  __entry->end,
-		  __entry->migratetype,
+		  __entry->isol_mode,
 		  __entry->nr_migrated,
 		  __entry->nr_reclaimed,
 		  __entry->nr_mapped)
 );
+#endif
 
 TRACE_EVENT(mm_setup_per_zone_wmarks,
 
diff --git a/mm/cma.c b/mm/cma.c
index 397567883a10..23aa35193122 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -822,7 +822,8 @@ static int cma_range_alloc(struct cma *cma, struct cma_memrange *cmr,
 
 		pfn = cmr->base_pfn + (bitmap_no << cma->order_per_bit);
 		mutex_lock(&cma->alloc_mutex);
-		ret = alloc_contig_range(pfn, pfn + count, MIGRATE_CMA, gfp);
+		ret = alloc_contig_range(pfn, pfn + count,
+					 PB_ISOLATE_MODE_CMA_ALLOC, gfp);
 		mutex_unlock(&cma->alloc_mutex);
 		if (ret == 0) {
 			page = pfn_to_page(pfn);
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 4626064705ac..3eea3008727f 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -2009,8 +2009,7 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
 
 	/* set above range as isolated */
 	ret = start_isolate_page_range(start_pfn, end_pfn,
-				       MIGRATE_MOVABLE,
-				       MEMORY_OFFLINE | REPORT_FAILURE);
+				       PB_ISOLATE_MODE_MEM_OFFLINE);
 	if (ret) {
 		reason = "failure to isolate range";
 		goto failed_removal_pcplists_disabled;
@@ -2069,7 +2068,8 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
 			goto failed_removal_isolated;
 		}
 
-		ret = test_pages_isolated(start_pfn, end_pfn, MEMORY_OFFLINE);
+		ret = test_pages_isolated(start_pfn, end_pfn,
+					  PB_ISOLATE_MODE_MEM_OFFLINE);
 
 	} while (ret);
 
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index ccb21af002b0..02a0f5621d10 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6695,11 +6695,12 @@ static void alloc_contig_dump_pages(struct list_head *page_list)
 
 /*
  * [start, end) must belong to a single zone.
- * @migratetype: using migratetype to filter the type of migration in
+ * @isol_mode: using pb_isolate_mode filter the type of migration in
  *		trace_mm_alloc_contig_migrate_range_info.
  */
 static int __alloc_contig_migrate_range(struct compact_control *cc,
-		unsigned long start, unsigned long end, int migratetype)
+					unsigned long start, unsigned long end,
+					enum pb_isolate_mode isol_mode)
 {
 	/* This function is based on compact_zone() from compaction.c. */
 	unsigned int nr_reclaimed;
@@ -6771,7 +6772,7 @@ static int __alloc_contig_migrate_range(struct compact_control *cc,
 		putback_movable_pages(&cc->migratepages);
 	}
 
-	trace_mm_alloc_contig_migrate_range_info(start, end, migratetype,
+	trace_mm_alloc_contig_migrate_range_info(start, end, isol_mode,
 						 total_migrated,
 						 total_reclaimed,
 						 total_mapped);
@@ -6842,10 +6843,7 @@ static int __alloc_contig_verify_gfp_mask(gfp_t gfp_mask, gfp_t *gfp_cc_mask)
  * alloc_contig_range() -- tries to allocate given range of pages
  * @start:	start PFN to allocate
  * @end:	one-past-the-last PFN to allocate
- * @migratetype:	migratetype of the underlying pageblocks (either
- *			#MIGRATE_MOVABLE or #MIGRATE_CMA).  All pageblocks
- *			in range must have the same migratetype and it must
- *			be either of the two.
+ * @isol_mode:	allocation information used for pageblock isolation
  * @gfp_mask:	GFP mask. Node/zone/placement hints are ignored; only some
  *		action and reclaim modifiers are supported. Reclaim modifiers
  *		control allocation behavior during compaction/migration/reclaim.
@@ -6862,7 +6860,7 @@ static int __alloc_contig_verify_gfp_mask(gfp_t gfp_mask, gfp_t *gfp_cc_mask)
  * need to be freed with free_contig_range().
  */
 int alloc_contig_range_noprof(unsigned long start, unsigned long end,
-		       unsigned migratetype, gfp_t gfp_mask)
+			      enum pb_isolate_mode isol_mode, gfp_t gfp_mask)
 {
 	unsigned long outer_start, outer_end;
 	int ret = 0;
@@ -6878,6 +6876,9 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
 	};
 	INIT_LIST_HEAD(&cc.migratepages);
 
+	if (isol_mode == PB_ISOLATE_MODE_MEM_OFFLINE)
+		return -EINVAL;
+
 	gfp_mask = current_gfp_context(gfp_mask);
 	if (__alloc_contig_verify_gfp_mask(gfp_mask, (gfp_t *)&cc.gfp_mask))
 		return -EINVAL;
@@ -6903,7 +6904,7 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
 	 * put back to page allocator so that buddy can use them.
 	 */
 
-	ret = start_isolate_page_range(start, end, migratetype, 0);
+	ret = start_isolate_page_range(start, end, isol_mode);
 	if (ret)
 		goto done;
 
@@ -6919,7 +6920,7 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
 	 * allocated.  So, if we fall through be sure to clear ret so that
 	 * -EBUSY is not accidentally used or returned to caller.
 	 */
-	ret = __alloc_contig_migrate_range(&cc, start, end, migratetype);
+	ret = __alloc_contig_migrate_range(&cc, start, end, isol_mode);
 	if (ret && ret != -EBUSY)
 		goto done;
 
@@ -6953,7 +6954,7 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
 	outer_start = find_large_buddy(start);
 
 	/* Make sure the range is really isolated. */
-	if (test_pages_isolated(outer_start, end, 0)) {
+	if (test_pages_isolated(outer_start, end, isol_mode)) {
 		ret = -EBUSY;
 		goto done;
 	}
@@ -6996,8 +6997,8 @@ static int __alloc_contig_pages(unsigned long start_pfn,
 {
 	unsigned long end_pfn = start_pfn + nr_pages;
 
-	return alloc_contig_range_noprof(start_pfn, end_pfn, MIGRATE_MOVABLE,
-				   gfp_mask);
+	return alloc_contig_range_noprof(start_pfn, end_pfn, PB_ISOLATE_MODE_OTHER,
+					 gfp_mask);
 }
 
 static bool pfn_range_valid_contig(struct zone *z, unsigned long start_pfn,
diff --git a/mm/page_isolation.c b/mm/page_isolation.c
index 1edfef408faf..ece3bfc56bcd 100644
--- a/mm/page_isolation.c
+++ b/mm/page_isolation.c
@@ -31,7 +31,7 @@
  *
  */
 static struct page *has_unmovable_pages(unsigned long start_pfn, unsigned long end_pfn,
-				int migratetype, int flags)
+				enum pb_isolate_mode mode)
 {
 	struct page *page = pfn_to_page(start_pfn);
 	struct zone *zone = page_zone(page);
@@ -46,7 +46,7 @@ static struct page *has_unmovable_pages(unsigned long start_pfn, unsigned long e
 		 * isolate CMA pageblocks even when they are not movable in fact
 		 * so consider them movable here.
 		 */
-		if (is_migrate_cma(migratetype))
+		if (mode == PB_ISOLATE_MODE_CMA_ALLOC)
 			return NULL;
 
 		return page;
@@ -117,7 +117,7 @@ static struct page *has_unmovable_pages(unsigned long start_pfn, unsigned long e
 		 * The HWPoisoned page may be not in buddy system, and
 		 * page_count() is not 0.
 		 */
-		if ((flags & MEMORY_OFFLINE) && PageHWPoison(page))
+		if ((mode == PB_ISOLATE_MODE_MEM_OFFLINE) && PageHWPoison(page))
 			continue;
 
 		/*
@@ -130,7 +130,7 @@ static struct page *has_unmovable_pages(unsigned long start_pfn, unsigned long e
 		 * move these pages that still have a reference count > 0.
 		 * (false negatives in this function only)
 		 */
-		if ((flags & MEMORY_OFFLINE) && PageOffline(page))
+		if ((mode == PB_ISOLATE_MODE_MEM_OFFLINE) && PageOffline(page))
 			continue;
 
 		if (__PageMovable(page) || PageLRU(page))
@@ -151,7 +151,7 @@ static struct page *has_unmovable_pages(unsigned long start_pfn, unsigned long e
  * present in [start_pfn, end_pfn). The pageblock must intersect with
  * [start_pfn, end_pfn).
  */
-static int set_migratetype_isolate(struct page *page, int migratetype, int isol_flags,
+static int set_migratetype_isolate(struct page *page, enum pb_isolate_mode mode,
 			unsigned long start_pfn, unsigned long end_pfn)
 {
 	struct zone *zone = page_zone(page);
@@ -186,7 +186,7 @@ static int set_migratetype_isolate(struct page *page, int migratetype, int isol_
 				  end_pfn);
 
 	unmovable = has_unmovable_pages(check_unmovable_start, check_unmovable_end,
-			migratetype, isol_flags);
+			mode);
 	if (!unmovable) {
 		if (!pageblock_isolate_and_move_free_pages(zone, page)) {
 			spin_unlock_irqrestore(&zone->lock, flags);
@@ -198,7 +198,7 @@ static int set_migratetype_isolate(struct page *page, int migratetype, int isol_
 	}
 
 	spin_unlock_irqrestore(&zone->lock, flags);
-	if (isol_flags & REPORT_FAILURE) {
+	if (mode == PB_ISOLATE_MODE_MEM_OFFLINE) {
 		/*
 		 * printk() with zone->lock held will likely trigger a
 		 * lockdep splat, so defer it here.
@@ -292,11 +292,10 @@ __first_valid_page(unsigned long pfn, unsigned long nr_pages)
  * isolate_single_pageblock() -- tries to isolate a pageblock that might be
  * within a free or in-use page.
  * @boundary_pfn:		pageblock-aligned pfn that a page might cross
- * @flags:			isolation flags
+ * @mode:			isolation mode
  * @isolate_before:	isolate the pageblock before the boundary_pfn
  * @skip_isolation:	the flag to skip the pageblock isolation in second
  *			isolate_single_pageblock()
- * @migratetype:	migrate type to set in error recovery.
  *
  * Free and in-use pages can be as big as MAX_PAGE_ORDER and contain more than one
  * pageblock. When not all pageblocks within a page are isolated at the same
@@ -311,8 +310,9 @@ __first_valid_page(unsigned long pfn, unsigned long nr_pages)
  * either. The function handles this by splitting the free page or migrating
  * the in-use page then splitting the free page.
  */
-static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
-		bool isolate_before, bool skip_isolation, int migratetype)
+static int isolate_single_pageblock(unsigned long boundary_pfn,
+			enum pb_isolate_mode mode, bool isolate_before,
+			bool skip_isolation)
 {
 	unsigned long start_pfn;
 	unsigned long isolate_pageblock;
@@ -338,12 +338,11 @@ static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
 				      zone->zone_start_pfn);
 
 	if (skip_isolation) {
-		int mt __maybe_unused = get_pageblock_migratetype(pfn_to_page(isolate_pageblock));
-
-		VM_BUG_ON(!is_migrate_isolate(mt));
+		VM_BUG_ON(!get_pageblock_isolate(pfn_to_page(isolate_pageblock)));
 	} else {
-		ret = set_migratetype_isolate(pfn_to_page(isolate_pageblock), migratetype,
-				flags, isolate_pageblock, isolate_pageblock + pageblock_nr_pages);
+		ret = set_migratetype_isolate(pfn_to_page(isolate_pageblock),
+				mode, isolate_pageblock,
+				isolate_pageblock + pageblock_nr_pages);
 
 		if (ret)
 			return ret;
@@ -441,14 +440,7 @@ static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
  * start_isolate_page_range() - mark page range MIGRATE_ISOLATE
  * @start_pfn:		The first PFN of the range to be isolated.
  * @end_pfn:		The last PFN of the range to be isolated.
- * @migratetype:	Migrate type to set in error recovery.
- * @flags:		The following flags are allowed (they can be combined in
- *			a bit mask)
- *			MEMORY_OFFLINE - isolate to offline (!allocate) memory
- *					 e.g., skip over PageHWPoison() pages
- *					 and PageOffline() pages.
- *			REPORT_FAILURE - report details about the failure to
- *			isolate the range
+ * @mode:		isolation mode
  *
  * Making page-allocation-type to be MIGRATE_ISOLATE means free pages in
  * the range will never be allocated. Any free pages and pages freed in the
@@ -481,7 +473,7 @@ static int isolate_single_pageblock(unsigned long boundary_pfn, int flags,
  * Return: 0 on success and -EBUSY if any part of range cannot be isolated.
  */
 int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
-			     int migratetype, int flags)
+			     enum pb_isolate_mode mode)
 {
 	unsigned long pfn;
 	struct page *page;
@@ -492,8 +484,8 @@ int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
 	bool skip_isolation = false;
 
 	/* isolate [isolate_start, isolate_start + pageblock_nr_pages) pageblock */
-	ret = isolate_single_pageblock(isolate_start, flags, false,
-			skip_isolation, migratetype);
+	ret = isolate_single_pageblock(isolate_start, mode, false,
+			skip_isolation);
 	if (ret)
 		return ret;
 
@@ -501,8 +493,7 @@ int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
 		skip_isolation = true;
 
 	/* isolate [isolate_end - pageblock_nr_pages, isolate_end) pageblock */
-	ret = isolate_single_pageblock(isolate_end, flags, true,
-			skip_isolation, migratetype);
+	ret = isolate_single_pageblock(isolate_end, mode, true, skip_isolation);
 	if (ret) {
 		unset_migratetype_isolate(pfn_to_page(isolate_start));
 		return ret;
@@ -513,8 +504,8 @@ int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
 	     pfn < isolate_end - pageblock_nr_pages;
 	     pfn += pageblock_nr_pages) {
 		page = __first_valid_page(pfn, pageblock_nr_pages);
-		if (page && set_migratetype_isolate(page, migratetype, flags,
-					start_pfn, end_pfn)) {
+		if (page && set_migratetype_isolate(page, mode, start_pfn,
+					end_pfn)) {
 			undo_isolate_page_range(isolate_start, pfn);
 			unset_migratetype_isolate(
 				pfn_to_page(isolate_end - pageblock_nr_pages));
@@ -556,7 +547,7 @@ void undo_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn)
  */
 static unsigned long
 __test_page_isolated_in_pageblock(unsigned long pfn, unsigned long end_pfn,
-				  int flags)
+				  enum pb_isolate_mode mode)
 {
 	struct page *page;
 
@@ -569,11 +560,12 @@ __test_page_isolated_in_pageblock(unsigned long pfn, unsigned long end_pfn,
 			 * simple way to verify that as VM_BUG_ON(), though.
 			 */
 			pfn += 1 << buddy_order(page);
-		else if ((flags & MEMORY_OFFLINE) && PageHWPoison(page))
+		else if ((mode == PB_ISOLATE_MODE_MEM_OFFLINE) &&
+			 PageHWPoison(page))
 			/* A HWPoisoned page cannot be also PageBuddy */
 			pfn++;
-		else if ((flags & MEMORY_OFFLINE) && PageOffline(page) &&
-			 !page_count(page))
+		else if ((mode == PB_ISOLATE_MODE_MEM_OFFLINE) &&
+			 PageOffline(page) && !page_count(page))
 			/*
 			 * The responsible driver agreed to skip PageOffline()
 			 * pages when offlining memory by dropping its
@@ -591,11 +583,11 @@ __test_page_isolated_in_pageblock(unsigned long pfn, unsigned long end_pfn,
  * test_pages_isolated - check if pageblocks in range are isolated
  * @start_pfn:		The first PFN of the isolated range
  * @end_pfn:		The first PFN *after* the isolated range
- * @isol_flags:		Testing mode flags
+ * @mode:		Testing mode
  *
  * This tests if all in the specified range are free.
  *
- * If %MEMORY_OFFLINE is specified in @flags, it will consider
+ * If %PB_ISOLATE_MODE_MEM_OFFLINE specified in @mode, it will consider
  * poisoned and offlined pages free as well.
  *
  * Caller must ensure the requested range doesn't span zones.
@@ -603,7 +595,7 @@ __test_page_isolated_in_pageblock(unsigned long pfn, unsigned long end_pfn,
  * Returns 0 if true, -EBUSY if one or more pages are in use.
  */
 int test_pages_isolated(unsigned long start_pfn, unsigned long end_pfn,
-			int isol_flags)
+			enum pb_isolate_mode mode)
 {
 	unsigned long pfn, flags;
 	struct page *page;
@@ -639,7 +631,7 @@ int test_pages_isolated(unsigned long start_pfn, unsigned long end_pfn,
 	/* Check all pages are free or marked as ISOLATED */
 	zone = page_zone(page);
 	spin_lock_irqsave(&zone->lock, flags);
-	pfn = __test_page_isolated_in_pageblock(start_pfn, end_pfn, isol_flags);
+	pfn = __test_page_isolated_in_pageblock(start_pfn, end_pfn, mode);
 	spin_unlock_irqrestore(&zone->lock, flags);
 
 	ret = pfn < end_pfn ? -EBUSY : 0;
-- 
2.47.2

