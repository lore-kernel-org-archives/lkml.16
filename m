Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2051.outbound.protection.outlook.com [40.107.237.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302CD292B33
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 12:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750075841; cv=fail; b=fHaMvthuXYf5v5IXT48uWdYYH9C0G9iAX9W7t+fjD7O51dV22KrUz4LQuvwLrVLoz1ZKkkiW7HS3v1tWnpS42X4ePrTY6NKeNk5uwI8/IQmLggGNVRLuNw+KOLuXdHNsvXwmjM7SQKz9tDKQMQddNCMxB5UZJ0yopaBXXhmOD5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750075841; c=relaxed/simple;
	bh=Vaw4uKXFktsK2QkoVycqkyBrM2YsK1BHmChTsh1BKI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=K+qbFTHrX5xUj7HxVf9yszxF9q7NNvSTutl2YAnYkLCXRcjG5c6soockg2np9pJ6ulse51ilSQSg8gAT6+kX1bjXm0qaWbaC9ZstolMBEaXYNAdc5yy4CbvDsTaA4t/n9DAZb6O/wxPftP5prwKhVRXsz9i2/wPtfF+d6jL3Y9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ji+accCI; arc=fail smtp.client-ip=40.107.237.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ji+accCI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VTDyp7XHpnHyE4vg/vMPXpaXHP3FWsBx2Rne/lUhg7dKqkgSZ+BBDsix5abtPuH8J6ksRd+iLCxHFNyG5XUkJIRWJWb4tfpuDvBXjFp10rZmehY+Ei16dBPtgKbrR2JtmpZ+mw8RhDvcDghS/64r7s/mI43G4xDR/GNfa2VS0w12SPCq/QIN1p4/Q7nf6J/VSkEMaXVditdfG2DArMZBNXOls+pjiFEgUlbNqKr8w+d1+RF+L1Bo2vZ3Uige0onolbt8sx/vxkWOVyh+LUfcRUnCKIFJVF8cvy4oYUKIYTfiDJcvgQQd86kg5O42I7uDtYH5+pNtcQX4vJopJZQv7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cjP6KZAdN18Ayzcw+VYjsBh+lBRJyJFtgmNXEjUOicY=;
 b=nyYyOOw+5bvquB9wCi3BWZubYEFLmgJnLzE6e/LI/DyfbnOT0u1ALaed76jAjz8WqbfEJfmEonsRn0jlhhM0L5aWGQv813lWQ7eYXn2pU1pC6zLT4Av68R0DGe3uMMdMYVcv9alko8Udqp7UMl37OUTnRnE7LpP2ZyLA+N3yFspyqnhw7SmJuNAvlnj8pW1CE1sToMEm471tG0xSvcGA0Vosn1fUIjblKPBuSKA5JPXe/QlFkFVg6ThFjkYbNW3m1e61295YVaj/b4DGDiURMDLR3xbFIiOEz2mS+AuN0Bs7iKtTG9Kwceljko1m5iQNr9NgVWJgPkZpw3tLGSkESA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cjP6KZAdN18Ayzcw+VYjsBh+lBRJyJFtgmNXEjUOicY=;
 b=Ji+accCIGrkX7wAfOq9ElQPIy+JX/fEZq3jffuudXZM4cGz2v9911+smCdaDr3zLn7p65LqcmxLU+wS3cBlqTlPqZlEf94sYfUoqIZS5Yp9dt+ZXEYkuvRxDp4Hst7b+ow9qTbowTIPvET0Vf/PQAeG0aeJoP/JvzFsDzeeqnIFJsiowrzKDr0IYkd8SxXPF7+/sFUPbHac9kSsiFxBrw7VqMcMPgy7y72B8CvZ/4ctP1ibe1e11Dlz/o243cyLkB0sNMGe5R97KQy60Kwr9IR/PyMe6oUdnvtTWoLNa3ptzX2bpxQl8D1D+3eKkA/HKT+S2FbchYPw2ykKkPQdfuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 CY1PR12MB9560.namprd12.prod.outlook.com (2603:10b6:930:fd::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.29; Mon, 16 Jun 2025 12:10:33 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 12:10:33 +0000
From: Zi Yan <ziy@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Cc: David Hildenbrand <david@redhat.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Vlastimil Babka <vbabka@suse.cz>,
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
Subject: [PATCH v9 5/6] mm/page_isolation: remove migratetype from undo_isolate_page_range()
Date: Mon, 16 Jun 2025 08:10:18 -0400
Message-ID: <20250616121019.1925851-6-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250616121019.1925851-1-ziy@nvidia.com>
References: <20250616121019.1925851-1-ziy@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR15CA0014.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::27) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|CY1PR12MB9560:EE_
X-MS-Office365-Filtering-Correlation-Id: 33a1246f-959b-4391-b9ff-08ddaccecb27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mwXp8W4A+oSStAr+drINPqhp/Wjv/mEwkq6BZXzTRECoxadp/r70bbk5blDg?=
 =?us-ascii?Q?uXZDTTn2A+kgKfaTFHc3hzHXTw5jsWsYwGBl2ZvvQO0viEAwjpn0M35ktQvi?=
 =?us-ascii?Q?Lq4cQtavYYM2+lasui9KxzTUE0nt7e8rw7LSAS3RnEB9LEm72VkmKYoaiGfL?=
 =?us-ascii?Q?SXtBROUow+NnpFxuC5iBqRPZy3yD1+VA9Ongf+bx3lsRUPP+YpdhVCWZMIpN?=
 =?us-ascii?Q?OEzqQnIcCvbND2qtcpgiR9l2Gc1NUtTaUxgSiSCwwb/V5Vpqx0iOqkBIEHik?=
 =?us-ascii?Q?DxC9ME/rCNrFTEkZRAm9CdJ5mTkg083w5l0Zz6buxYwVqHZhzcNStUWI9Hjy?=
 =?us-ascii?Q?JnLHZ54WnZn/q6UiMEY1RPd2G1wgj74K7PYUmyLqCsiHasw/0cx07EcDf2WJ?=
 =?us-ascii?Q?MScxiuGPWGVKWyrb1u+TTT35bUfvpXR3q5BQ08E8bL6lMBXSAnicfX+iScEc?=
 =?us-ascii?Q?EfWyUt728GzKI7ffbUM5lqyMI2F0dJqrOjgGfLhsuLOvmg8QPaL9ZUujv6TE?=
 =?us-ascii?Q?g3eiQPoDS+RwgEBkVZ0catISXl00DmSna9+o3CSaLwqO7ruk0I/6+iiWLnTN?=
 =?us-ascii?Q?hwjU1Nv0G315syvRfcTM3F6SD9MJqRryW9MHDLgnTnX0kswa+I31+zd/67nd?=
 =?us-ascii?Q?w5neykwcNZNqM4a0FuoyzgPYkRxa6EAcmXFBlozpDBlmXAX8t5Sy63tCYi1g?=
 =?us-ascii?Q?R/GOHXDzx+uNFjHnVVPfdVJKuHRyJ+RSm0XT6/Sl8UiNbP++hBO8hr6gP2S6?=
 =?us-ascii?Q?XBe+6FtpEhGoSal5wJJQb6zjOlduiZ3+AEZmEgXPp5M4gioLDx/BTMeojD86?=
 =?us-ascii?Q?RYRS3I7VnMuvhmdbO2cIhlVeXjMUooYLYvvgzkiEkOAuuAn8i4ynU7VimyOI?=
 =?us-ascii?Q?sa4irUvsUNOzZg5mJQVhZ2hfR6sYub34NRYDypBQy8KlgRsWI3QahL4pobHZ?=
 =?us-ascii?Q?S+XJPUnOK2XVSrF+bUt1gRFmQOU+I6FvLEm41Kz3q6YSwEorsRcFjrL3bhR1?=
 =?us-ascii?Q?l//mMAycoz6g5RQd9yBe+UiSqXG7PhVg5VHh/dP0w2EsFHfWBl6gHAykWM3y?=
 =?us-ascii?Q?n+wNBr69qc0Wnsf0+9HjYhtD0GrTPD+7iLXtHwMq/ZG+b02HNGJbc1kaflH6?=
 =?us-ascii?Q?Nv1HyKasahLCYs7GdnJaZsTF2HUf1yYPubojBxtf/JPPBWRKQifWKLEcLdQv?=
 =?us-ascii?Q?VBQO8beMPRKI6RDVzsoX5MOlMRW74MsU2K3vNjlcT5Z6Xqp+iBVuPZPCCvqt?=
 =?us-ascii?Q?jGLy8wYI3UPAfoKwoIpgS5PsIQzQ3UHOMBzXA3nw8xpCTS6zQXuNWCNoWbC0?=
 =?us-ascii?Q?TE1w8Ik8HNWbF/bHL/aEH4t6S8MJVc6HX/y3Pox7rB+7qxG0wuVV1G+2HKJ6?=
 =?us-ascii?Q?KDNjp01yuDtaOFS4la62bwZ3QvoMZfHXwmZ9C31NdyVPdBMpB4X1oBu+x3EJ?=
 =?us-ascii?Q?GNGirH/H2+o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6tMcEpDl+q3QxhqNNMwZWsS2thyhzQ+Ky0RYLsOkiBHiaQ7pQXQ/2jFMyf/F?=
 =?us-ascii?Q?9uxLJnY8vTRlQjWbv9QwNVYx3XZdxve1WbanZTAD1X9dX+ojPH6QSoTppf5m?=
 =?us-ascii?Q?PGB4Idd7JwEyyEehF2RgHbVT0U9ZIziOQ+UbaXiyhX0LxGFLsAlaG98BYxxG?=
 =?us-ascii?Q?kqN8cKszhTUaRlDl20NwwpO0VlbW7RuRLZLbuE8SXKg78++nWnkPbzo/KLqc?=
 =?us-ascii?Q?Qf36SCDJCadUiJtgr4ZPgVhDNHoDsGuKcMI4MBt/jlB9npqQ2Fr/uB0ne8QD?=
 =?us-ascii?Q?opfKicPYXv7uz9ObImHUxETIx87rM6+r9T2eNXcukVcWbOWLRepX8+vJxA2m?=
 =?us-ascii?Q?r9lNsRNqir2iYMCy4vT0q+k3CVGJk8mb0MQc2467VV08dEf0mvUZWhniDav/?=
 =?us-ascii?Q?JMHMkWpavLRN99EGk6gLZdhfv7YePRzUQhep7MzMRIDSvVFZBlC+tN2R/x2H?=
 =?us-ascii?Q?cCRZw75lrtCyG9NL2HIdm+iBYHmqv0EjljlsgS55Nv2A50oHt4Lo5ZDAfJA5?=
 =?us-ascii?Q?2cKD1/uDWH5IWGZWZou+0bJR0CfmLiRqwZ1HHcND1YAPnK3jJTDxCPqMg6BF?=
 =?us-ascii?Q?2bshrh8EIQeyYqU2m9Miz/AAgj2sRkCWlYdhXpAN33UsuHDqHBYR7EICyrI5?=
 =?us-ascii?Q?rjVbm+XT/bnbq6gKtCCBV3A2l3XqqkRwfL8rnzzuaPmW1INBgvYrDswlHXwQ?=
 =?us-ascii?Q?zbA0kScH+wf9qvxm1O6ytxsIKLxoB5SExDv5f7InZkdBNm1rfD2Tft2YHkl/?=
 =?us-ascii?Q?Xxlz2wDRkx3BA/UPxI4sE6X8qppMCuRSnz4ZMkRhS5Uav/Px/P0TM/zHZgOI?=
 =?us-ascii?Q?LruHty1koQPBX7sIxzu5wXKQB1lbhmdSE6WubKvAXUW7vRgoFr/cemmk5gg8?=
 =?us-ascii?Q?7k7GoKtbB0ezhf5+AtT6plOeJWs3nvsj6BQ37QrzZ8i4W+DC0xUFQZipco21?=
 =?us-ascii?Q?uNHA7Pm3CYgYL1+w4wL5mVOMXKNYLC6Eb0FwGy1t4ScqJPaFVfi+sVP8Vj+K?=
 =?us-ascii?Q?xHWhcCz0X/2hpKVcsap8IReQ8PQ3jj30PKQJf4aysPkgk6VEQI8tI3C1yeKD?=
 =?us-ascii?Q?fU5QCgZFZN+ccJIhs8SGDYIZTeFxCX4QVPt7xWZFXQH9tzaLVZoqeFbnwJ66?=
 =?us-ascii?Q?PA1U73aoH9wsRl47q+hzw15fBswc17IoAfEIYOE40aXaH/79H50N/ERNeOnl?=
 =?us-ascii?Q?CIVYyWLoMytgcBv+B6nuowfnjMfAnBB0qFFrAy+1ier55S3yzeGpc3OhBHT8?=
 =?us-ascii?Q?bI8a9dDKTVm+81pnPR946xn/Ac28mK6jEU9PBv9btvE9hvazyCJ3ZDzEtFz5?=
 =?us-ascii?Q?S3NJeYmMheBLKdUz0/9ajVsoJkSBT7RPBjhwLOQ9nWiroMhFpmeXKd0TCWVC?=
 =?us-ascii?Q?gcmN4u4O4Zi/cDrZSPOmLzvwu9qUtDB+XBE9zM6nTCujtdhLmO+uTmfVLIKu?=
 =?us-ascii?Q?O0ghiGvsg/AjkdH4eZUIjJBtKe/Kfut5gDWJFWoj6YUtZ03qmVsmWT8tDaWF?=
 =?us-ascii?Q?MV1wYH+zKRQ87W/24Q0CQy9Ft8IGkGOwGZMeXjym9qKATw3/SvxZb9PBEheY?=
 =?us-ascii?Q?abN2FV78vctXVZEjcjnnlZg1CCATyMai9lltKWrM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33a1246f-959b-4391-b9ff-08ddaccecb27
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 12:10:33.0830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: utYqdVgtuAi2FGsokGvTcBGea7VtWftFsZK0G02IvRahL08oZVJM8Jk73ztTPhZe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9560

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
index 35f008364698..224987824a84 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1223,7 +1223,7 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
 		build_all_zonelists(NULL);
 
 	/* Basic onlining is complete, allow allocation of onlined pages. */
-	undo_isolate_page_range(pfn, pfn + nr_pages, MIGRATE_MOVABLE);
+	undo_isolate_page_range(pfn, pfn + nr_pages);
 
 	/*
 	 * Freshly onlined pages aren't shuffled (e.g., all pages are placed to
@@ -2092,7 +2092,7 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
 
 failed_removal_isolated:
 	/* pushback to free area */
-	undo_isolate_page_range(start_pfn, end_pfn, MIGRATE_MOVABLE);
+	undo_isolate_page_range(start_pfn, end_pfn);
 	if (cancel_mem_notifier_on_err)
 		memory_notify(MEM_CANCEL_OFFLINE, &mem_arg);
 	if (cancel_node_notifier_on_err)
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 06cc990e2a62..64321f6b714f 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6984,7 +6984,7 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
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

