Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2051.outbound.protection.outlook.com [40.107.92.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B1B23371B
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 15:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748877507; cv=fail; b=clKghgREW2v0FjwwGK8ehOcgn/NfnPyF1PeWrrVr+QJtzI/uic8Q7/B+IQCgi9q3fvWyUY942ktJpCVI8xaWQ8wMI3UiCpXZ/ZPrRinTC2GX07S8Y1XthlYug+E5qrpt2fYbOyVV8MzG/lyMdbSLNwfYYxXGwGoPO2ZrowshA5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748877507; c=relaxed/simple;
	bh=mGHan1f3pvsQ3eX/Uo2gFvcOfPdp8iVlcI8dL4nzZHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tpdiP6AtfthRmCo7SnPKMorSU0LH4mfyPv59euEmBEfQ4CU1ykj6ERUJ8XDSQ2RHW7FxQ8yAKFM9azvGft4YCmwL7XEOg15GX/hH/KKNeEVAimIItEMW3ofkemNmypis7GNCUPD4kDHcmntAVpAi6FF2kpN/mxEi32QAEyPq0OQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VRd4Lq5G; arc=fail smtp.client-ip=40.107.92.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VRd4Lq5G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KBNWaV30ylZnvYX1F+hb9jkrSKGkaGCoUGzbdQrPjY30AuRG3stxuHh/wijdDmGegaoFRWpH/HwTmJcQkWvF4xC+ukovv/UCOSL5lZGZrJbK2NLDHo7gt1yo8lGxC5puX/mHQAC04jG3sPdDBk6ZfVxlXhlWf2qFGJuy8BncMc0fy8IPP3htun1Piudg7uO4A8giDC2MbGGfdiAl6149t9TEJ6WLZiAFliQRcWMq4Me4cPbfPujkxTF8crZRVzsVTyYTaaSDC2iJ05h/KgbLiKJyr1ESyKZ86nAMQJQocW+H+6XxhnXAd7POPX2PUYPrh6W7Ke61c1D6yH/STCDMWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Ca2y4Ll6GhldlIIPPkaafx8RWllJVTRpRpAU6TyVdY=;
 b=Vej2X+5CDfilVqhAYp+xc6Wo5IOX7RQYoPYk1h1lrKdHGNaMEwTBoOOAGUA5TDqVZUz2K3Z3SZep6b02+yKign7ovOIH5ESJvwmoTKO9bii558l66HmLMBlJJXfdVjLa2im1x4f5CEGNk5RWKlpmgQ4f8BukUjteyjuo/M408mWhbSt1v+54Hd3wld7xpdP4820pvxsFQsvjVsiYl/59lkvfMHGjx6uwuvT8Mg2eCgG7JQDSTweBezl1LEp7oOTZH7qcqvyg1Pkxgo0fYZziaMKTtbucoHz5W8gauyJl5EwZm7dUwgK2N8pR5/zehQQlIW3MoTV1O7xA83JQYMhj9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Ca2y4Ll6GhldlIIPPkaafx8RWllJVTRpRpAU6TyVdY=;
 b=VRd4Lq5GpmikyJ8F8ZbSVJa5KPp+sPq2weodNv41i5ocTYNKR/u79slIjieB6dcnGckXwjEu2dH8JLaugAzWXO0xen3b9Dx0vX4kOiwmnXqyHlAnKMSJRbLVEHXxxE8U87gw+qH6cWuJVuVhI7Qhk9ZaPkMllJeyC8DHiTKDeaGbt5umMY4URuqqDSVBCyqXLwtfIPzqxosmWrc8M0iURPu7HfhpjVBmc/qaDQ9RjqLm10eFIb1yKeBDSqbVkAZmwfvfre42k7s2P2xB0Hn1AEdmCHqUHRYQKNLEwP3gmJ45CVMa80RRIhbqJFwekg/0lphL0Y3WwdEb/DMijJEZXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 LV8PR12MB9450.namprd12.prod.outlook.com (2603:10b6:408:202::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 15:18:17 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8792.034; Mon, 2 Jun 2025
 15:18:17 +0000
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
Subject: [PATCH v7 5/6] mm/page_isolation: remove migratetype from undo_isolate_page_range()
Date: Mon,  2 Jun 2025 11:18:06 -0400
Message-ID: <20250602151807.987731-6-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250602151807.987731-1-ziy@nvidia.com>
References: <20250602151807.987731-1-ziy@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH5P223CA0016.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:610:1f3::21) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|LV8PR12MB9450:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d6b2981-0daa-4222-67e7-08dda1e8b3b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1m+XJNLvhZZ4lWueaJl6mcjUnKGa4bjkCrIfwx1+YXBadvIAGqyOb46BuED+?=
 =?us-ascii?Q?BSxT09gFH3+gsHsAgLdh8X2dvxa9QiGaFRrhEruNA+EnepJbOYBfjRcbkmnv?=
 =?us-ascii?Q?3gw7g7CD5vHo5jZug0Sk/1MQY81Z/V9uG/kQALLNL0UWvDbytsfNcUAyMbgE?=
 =?us-ascii?Q?dBARS42AcCLmp/apX0cwMfGEEPEkPNX6IBu8i6Ow40eoqaXJWnuPb6MZ64dm?=
 =?us-ascii?Q?fTVlB5UFTnSgFw0gbGed9L+/PyJ6sG/Oy2QJ0HkZOoB77V/X0VdpRgLulNKX?=
 =?us-ascii?Q?y/0R2c2opMl6sQq+6i+Ec/pjhcwGUYQjkcBUOt6KiAAycIYMfwM0rO2F9fo6?=
 =?us-ascii?Q?Bd7ffKOc6psuPKoAKC+khv0nbqEgytx9U1vkdBJbumGd7H5+wohme089QCPo?=
 =?us-ascii?Q?a/8S5gaygfYitYyVfB3s5SPE7vyor3vza+UfGghcrmwAKsJJ0kGQr6vZXTjY?=
 =?us-ascii?Q?Ev8cwDKt+cve8qLJXT595XyFEjNRxYlFVLb+9TW5uvNhuNF/EtNneHtEmD+o?=
 =?us-ascii?Q?Ck+N9058aegWax7WylePBDoDTUOKclS2kVmLgmo0ZPMHWDm+DXt7VCdCcVoL?=
 =?us-ascii?Q?8MHwtl0kpr2i4RULYXnuOjL2nvTqFId5YPetxwcs/HA/X7sq5ePqDyQu+Fbv?=
 =?us-ascii?Q?PS/hXCKlstdUMXB5kPorNPAp9IkuyokfzA39CysJNhTq0x4di7fiBjjzJ3hU?=
 =?us-ascii?Q?2a7heGfyTtWtn7A89pK7D4FEmT1nvEtVVe3DkwlP05WToVFDkDoXZ5d6wkFL?=
 =?us-ascii?Q?jdnKmMCn9+MZM5WQsff/usu38v6uLrTFyAneHYAYKELSOLMpTZnQBqY6wwmJ?=
 =?us-ascii?Q?gRKnNdNrWeIf9xHY632nrfBBteVl35w+VCp6V85JoPHi4Iw86YogrwtdkKql?=
 =?us-ascii?Q?/71wEbWcQ3bsMXDzJDtB3qpyWrEATJKE1mk7Kh1IiBGaftbvc2Hr63Zp8RF4?=
 =?us-ascii?Q?JbAEppWBWcq97H3mOEP7qBA86U1tAW4Qj6uAe9e/QzCLFF1B6mkSE6UCX3qd?=
 =?us-ascii?Q?os8vENVKhmPfhp7ULWwiFYIOFg8rMm5YSufrkgBxmteZOtlXbwpMDQPgtqRs?=
 =?us-ascii?Q?SadW6iKFbpVwgZIkF95FcsO0sbwl/tcUVx3+HKVHhu5vnLy60bHvJZB6Ysg4?=
 =?us-ascii?Q?hBVwQyZkjZ/TqHQWBUWlfVq8ioXAqVdPICFprIKuIk9c3OPEzDphEoPTezoE?=
 =?us-ascii?Q?SOTx5MVDCS4l+dmrtwDenknNJgOla78gxzYB6XTUZ0BayZjiqzVWgdYqeLjM?=
 =?us-ascii?Q?RI69QLlTSnREOp89pssUfUhti0MeJjJvtM/TuelhPl6rPAoWxICdQBxRhYSB?=
 =?us-ascii?Q?8omMgLGLXJcAGs0zysWqIfjApEQlwehB3jenbzGDlDQSEV9CeZV9W24JeIy2?=
 =?us-ascii?Q?t9vUVbHniaZB0bzkkpZOn6U0TbI/no6K7eyr2iWpzh6zfwGNIgpm+F5/UlFC?=
 =?us-ascii?Q?bM9yaI/9yts=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O+wkiiAL1N2WYP3jZDjf3qzzm61OLVfDkguQyxOrzbDQh4laeCv0355eANwq?=
 =?us-ascii?Q?JnMe20F04x1W/A+GNiujaLDUFwMf7r60VCFwR7aOBrsklI8lfllLE0MHcEVB?=
 =?us-ascii?Q?iSa7yMBmyZ17j5lhTyOjJ/DKxA2x/QEuWFH8hLRI94sHKJRwqZnCahb+cAUW?=
 =?us-ascii?Q?CkX5lmk1VdoSxLhd4zlM7YAdBEIatskKK2NjEOIzh2V4Rsik4kZCmbSXa8+i?=
 =?us-ascii?Q?dJE/NpeGJPMpvGKY/TPZSCwVtO5g5enPfLCZs+OS+ErM05vkU+KDBSAs1PTt?=
 =?us-ascii?Q?/+OQf2yK8RtMsvYQKcYALrRJFXP2WIcQCNBZl9jhapL2jicfGPEB3wiZVPxW?=
 =?us-ascii?Q?4qZ3yTlSjji2ykhPK+gOjSCMw+xRjhlkUNwxCifLDiYYROFozn4Wc0s3ZN+y?=
 =?us-ascii?Q?iTEVppz+3ziq1yQjSntyNyi3O4tLhGaDTa5/90octMzuf+2pGH/pFlzcyYs9?=
 =?us-ascii?Q?zFCpfG1wgQB9+g74KQ4wU+4s+lIpI5sikiHBWuqchbq3jo8Rtj7I3DSywl6U?=
 =?us-ascii?Q?EH3UqvERCuSbxaDSlvwwJB1/qdV9dizQrZO/rAijL5ZtGzhl9M8yCtmtPwLN?=
 =?us-ascii?Q?4oMnxkyKvlpd/AXnHUECyqMn5lY8dzGwxXNOVdg6AM5HnFNnoXgOWvQCi21X?=
 =?us-ascii?Q?6FfBYMKMrMQNy35chLzMICopzt8kQp6GX8whiXJpP7tRdaddqBLNwmQ5B4iA?=
 =?us-ascii?Q?93w/S5/06/JKZF6NU1WXBDI3OELJsaRoZmpxspkQJlknYr2EKcet/MEtjWd+?=
 =?us-ascii?Q?Ne7orecv46q/YNMfk5yc1HPi/V9ArfSoRyuYUZPG4XPkh7zK8NO+DhJHG7XL?=
 =?us-ascii?Q?CsqB/VYyFjXq9aCE0ZSKRfPLwHgTPlcFiWbEmIkVsubnx8S86pTLxZqFqq8v?=
 =?us-ascii?Q?bVOQ9UjAES+nAgLr577MD/Q6w7zrAXLO/yoZCZSdykOuSGRvC6Hhq8Gga+zr?=
 =?us-ascii?Q?6J/qBVdUmmgOK5Jsw/XxUoLWqsDOTeuoJGpBv1vs5yWckLzDggQqHBoF+FaS?=
 =?us-ascii?Q?+eadDEPNNO7nyoD56kVh4jMnGiZNF08Usy1kM6m7z3v5JIRBJ60MjZsfc/fd?=
 =?us-ascii?Q?PjiUcrU7Ey7GDWV0/HhXgphUAdjkMNvoZ7jg5UQj01zQiHqNpYRpcVyDRmVS?=
 =?us-ascii?Q?0qf1ehNN6Iete8l9ThtCV8UoGUKs/epso1ToXDo+rA1wCojVRUXSqZUwVc4t?=
 =?us-ascii?Q?5UXehS/C9DNDHc25Al8EifDl1QY6nuCkQrcumBrYUrctn+UbIzgemI0cQxOR?=
 =?us-ascii?Q?hTzIXZrMsCo0YrLU4guMQGVrwJWcb+2K3URdtD3eQcN/WpWyRKw/y3sNv7sL?=
 =?us-ascii?Q?GNrZkTC6ADZ24xGtUWCKeGRwDs0RCXBNVgbYECfBpVy3Qp6hJOPDYqx7x0Mk?=
 =?us-ascii?Q?U5Hkfmletwu8d4rZDPjDmnL5FNa8x5oX0UYZOo8OazLiWc7R56DSObAximC2?=
 =?us-ascii?Q?ThwvU2PoBw5UGxdGlL+X4TKR1x0cExrpAV/7w4j6/nEjSAnSh/Iuav6kL5cU?=
 =?us-ascii?Q?kW+Ifd8lvFmwmC7I3iZ+Was9Jx3n8r7Ez0x/edp58BSESqhndpViGnWpxHMV?=
 =?us-ascii?Q?wjz99h6g/6k/3fQd0jpoQmgNkYOukd7bfOk7xsJY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d6b2981-0daa-4222-67e7-08dda1e8b3b5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 15:18:17.7183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3EdNi1isNKDfqHpsqjP/kZr+cjIGXDQrcRea01ImS4FFCkbdK/GKv+rMh5HkmkJ/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9450

Since migratetype is no longer overwritten during pageblock isolation,
undoing pageblock isolation no longer needs which migratetype to restore.

Signed-off-by: Zi Yan <ziy@nvidia.com>
Acked-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
---
 include/linux/page-isolation.h | 3 +--
 mm/memory_hotplug.c            | 4 ++--
 mm/page_alloc.c                | 2 +-
 mm/page_isolation.c            | 9 +++------
 4 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/include/linux/page-isolation.h b/include/linux/page-isolation.h
index 7241a6719618..7a681a49e73c 100644
--- a/include/linux/page-isolation.h
+++ b/include/linux/page-isolation.h
@@ -51,8 +51,7 @@ bool pageblock_unisolate_and_move_free_pages(struct zone *zone, struct page *pag
 int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
 			     int migratetype, int flags);
 
-void undo_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
-			     int migratetype);
+void undo_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn);
 
 int test_pages_isolated(unsigned long start_pfn, unsigned long end_pfn,
 			int isol_flags);
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 16e3ad874144..4626064705ac 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1233,7 +1233,7 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
 		build_all_zonelists(NULL);
 
 	/* Basic onlining is complete, allow allocation of onlined pages. */
-	undo_isolate_page_range(pfn, pfn + nr_pages, MIGRATE_MOVABLE);
+	undo_isolate_page_range(pfn, pfn + nr_pages);
 
 	/*
 	 * Freshly onlined pages aren't shuffled (e.g., all pages are placed to
@@ -2119,7 +2119,7 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
 
 failed_removal_isolated:
 	/* pushback to free area */
-	undo_isolate_page_range(start_pfn, end_pfn, MIGRATE_MOVABLE);
+	undo_isolate_page_range(start_pfn, end_pfn);
 	memory_notify(MEM_CANCEL_OFFLINE, &arg);
 failed_removal_pcplists_disabled:
 	lru_cache_enable();
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 6ddf4fd6b2bd..ccb21af002b0 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6986,7 +6986,7 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
 		     start, end, outer_start, outer_end);
 	}
 done:
-	undo_isolate_page_range(start, end, migratetype);
+	undo_isolate_page_range(start, end);
 	return ret;
 }
 EXPORT_SYMBOL(alloc_contig_range_noprof);
diff --git a/mm/page_isolation.c b/mm/page_isolation.c
index 08f627a5032f..1edfef408faf 100644
--- a/mm/page_isolation.c
+++ b/mm/page_isolation.c
@@ -515,7 +515,7 @@ int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
 		page = __first_valid_page(pfn, pageblock_nr_pages);
 		if (page && set_migratetype_isolate(page, migratetype, flags,
 					start_pfn, end_pfn)) {
-			undo_isolate_page_range(isolate_start, pfn, migratetype);
+			undo_isolate_page_range(isolate_start, pfn);
 			unset_migratetype_isolate(
 				pfn_to_page(isolate_end - pageblock_nr_pages));
 			return -EBUSY;
@@ -528,13 +528,10 @@ int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
  * undo_isolate_page_range - undo effects of start_isolate_page_range()
  * @start_pfn:		The first PFN of the isolated range
  * @end_pfn:		The last PFN of the isolated range
- * @migratetype:	New migrate type to set on the range
  *
- * This finds every MIGRATE_ISOLATE page block in the given range
- * and switches it to @migratetype.
+ * This finds and unsets every MIGRATE_ISOLATE page block in the given range
  */
-void undo_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
-			    int migratetype)
+void undo_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn)
 {
 	unsigned long pfn;
 	struct page *page;
-- 
2.47.2

