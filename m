Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2089.outbound.protection.outlook.com [40.107.236.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624B525F7AD
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 20:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746820889; cv=fail; b=cbYfu4kLuX0nRKM2Wfctuzn0E172mUv/ZpewGOcwquny9ZaNkwJtjjJBy12k4hflApPBCTjaFream5Iv0qLl+o/xh5qoC0/2BrnPBXfon6eHp315BL5ez0AjGduFYbCJVVl2nshYgq2BZowadHaZwWBRXq9QiVD8Sp2mGNTbxs4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746820889; c=relaxed/simple;
	bh=iZftCNo827Qq5mW9eg6FOl9YWIyPt6pBWlPJutNzJwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cat6JtJ1bgyI9dkWYKGROgTEJqb5eyWnNl4+9G7rmkR8rCwS5kNRkOVBXngYJUaBKGPN/AEOMp/esv2dcKq4plWBETEWFrfECUI3GhnLwJ30inTFgaVxnYNOJ/G2Uq2NR148AhB14lh5WqZEnAOtfrZPC+ADOx9N9bYDMQsyrsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jr6mMZJQ; arc=fail smtp.client-ip=40.107.236.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jr6mMZJQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gREJ1u445N+ANwevj9SPQmfoZiHT/xoMpBrqnL1V9isQkTIEaF5nyxNyvz7NwlX1k2hPjlY+ItHhrIFyzFGIRtj/umoirEjFXo4Pw7hzWdbC/GeoA/wEsAZjicVhN+FrJJtG13Z555mn0fC4hB6oT+MQ5EDxrlYqv4wfXQ84Zv+3Vkc/B+UbwoLlMGeIoA2PCaL9ovwY1nu1wyZMUjnIR7Uen7ui5RT1792gMX+ymF3QmA1UwKEsbbIvwx3ECwTbPR2EImxJB2DVZxBnxwmtAk9i9XDzO/A7B3BXy7hyXnCy+KMcBb/6yQZqtkIfI7rM+XB9zPd2JLARyi8fuuPcHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i4kR014OWOR8hHD48ehHXTRARKbKLQwqfsrr+83DwFg=;
 b=Oo2hIleam46jnp0rgSCUTFSHGSpSzr3VAWcO5bKY9jBd08SskBKGWY9OcaegSr60rq1JXUCIpfNCjMSqNt2WlyS4kiEnHEIsUtRwIPn/VRJkAJeZ2xfsI7RFzkulHWhPNLaU5cLVegKTr08j0tPTBB0d+TS9cTpRo1sb7JoknMf+BQmVK09wrWkmm0czjcW36F/vt5rZwZ2rU8hqlY4l9gIt3xtNfBNQpR7y4jdNljFJ0rm+1zMQjv9Tjb/bDYYvolzNKXL6+6EMx2c60ztpjkNSrP9urZf6SATDvfmuE/TRzGzO4LTX+P7jveWOhJYNoQ4vlMW3jzlrAhmuHXM+Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4kR014OWOR8hHD48ehHXTRARKbKLQwqfsrr+83DwFg=;
 b=jr6mMZJQb6I+6z57IYpcaKz97ToTNLuKjPpX6dMIpVzrGkiWu0M7fKeHxjTIkqt8SMtHWGZwSVqmEK9buRz8D4v9GvxUThASVjxeLQ3mPjjEXDOzXQDB+viabByqYV3YCoilMVzJVu/SHHUiBoFwe/HzD1b8WUf6T9Zv1T5BOb6pdHQhwecLKA0kwY8uitQ2u42k6PACBXhYdq1I8tV0fjt4rW0emYgZniakLh9Mvgh0fqhTZY7bbTJ9vkd9YkvLlvLmVLe7uuwXSFb3MW5+C2T+uZks3sHwjhJIgh2nldy37Y6gy5OzKhObXprJFYM0XT24Nt81nXee7aGMScefYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DM4PR12MB5865.namprd12.prod.outlook.com (2603:10b6:8:64::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.24; Fri, 9 May 2025 20:01:17 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 20:01:17 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Johannes Weiner <hannes@cmpxchg.org>,
	linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Mel Gorman <mgorman@techsingularity.net>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <jackmanb@google.com>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	Zi Yan <ziy@nvidia.com>
Subject: [PATCH v4 3/4] mm/page_isolation: remove migratetype from undo_isolate_page_range()
Date: Fri,  9 May 2025 16:01:10 -0400
Message-ID: <20250509200111.3372279-4-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250509200111.3372279-1-ziy@nvidia.com>
References: <20250509200111.3372279-1-ziy@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0213.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::8) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DM4PR12MB5865:EE_
X-MS-Office365-Filtering-Correlation-Id: 17de9c56-e1ef-4ce9-41a0-08dd8f3442c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TZ5cL41Jweq7zqEP3Ic+ZVUf/dek6nem5Lil9d+9/Z6OlZbCZaQPSylfKMri?=
 =?us-ascii?Q?0dVdm1EaiFFq7LdEVI2yFBRKh4euKr6b9hF0/1vg7w3osRQLrzyd2htOFRWA?=
 =?us-ascii?Q?MDUpb6PWzuxVlFjvchAp98+4VWS2Gf/h6iRN+CLHmvPTWX/DAIrzytChyzTc?=
 =?us-ascii?Q?ebho1LBeXLTsjXJiBh1woEDcS0BqpUTUJgD9HdgOoItJMCqqS7f9tcJ+myWu?=
 =?us-ascii?Q?Fq5JqzuZboFgT/mwoPnwfLPtj+V0j1AojbqDhBp6K22NUUnSmsmhpRJcBX+d?=
 =?us-ascii?Q?3u4uGjc3lA+flRT9qvU/XnHdfHp4xGAl97gCumAw/H/goWs001eYLhNWrHXD?=
 =?us-ascii?Q?nW7JPshBEBT2ByuSY0TF+wjqnylTYB3qf1HKNYEpIaWVM96SXDcctep+yaVK?=
 =?us-ascii?Q?7ck9ble2RCSrURS9wGhafBI10TvyJC+A8esI8dI4uXdofrTZn1/jiq4qzfBq?=
 =?us-ascii?Q?K9H14/OM1sGkh8jQCbfmmrdnKDE2qtmOlm39VtXe04+K1Czvg7kH6UzDh69Q?=
 =?us-ascii?Q?l39VYJedssztM39PBitbFZCY0MB4jUJLMj8hJ9t1mPq6Qn2hD4M9rALtFA5V?=
 =?us-ascii?Q?9Lrj3Kf5xUgER9S1I6IVQl1H/YPcAPmaRMCGig+/vnzXEIcUHIZ8pINr4A8m?=
 =?us-ascii?Q?9lbANZ5eCYv6wIIpCzGh4N5oIKdZC4xhzJRkSz33uJ1gngyJrWLXyJeu9csj?=
 =?us-ascii?Q?m//Zohs/Rj9UjWgRLwiKIFTTqY8OraXpdTaRtvy1G20Mdy0jqOFzZOyUx7wW?=
 =?us-ascii?Q?rtR8JNfbHUclK7c5zh0WRJQgUPG3FP0/k0HSDhUKUiRgUacQvTrv3dIvyMyz?=
 =?us-ascii?Q?5+5znvz6F59ZgqCzkx2LfqdmyEzcNrOBftNmnutWBM9bUShG6RYIKcaQkUt7?=
 =?us-ascii?Q?PJwfecXpqFEDTh06zHecxMQAwLR3Ov6ILeoeqXMLk9nMrjqFa5/Sp+AgP2R7?=
 =?us-ascii?Q?hNekXkvpozZtYtZFa0TMooK8Rdkn2o1vJYQOMX9BgW6ZOa0bEYpzH/miCJYo?=
 =?us-ascii?Q?BTtDNKz8tD+4ybdycwiv/ovM9JwZCiZLPj2Dfw1qGnLPzkKPhbMhEQfhi6Fn?=
 =?us-ascii?Q?Nvm3OFS4D/vJE2Iam+ph7pI4I2qn/jOQtL3PzEyGX57j2wAnrBECxJLfY1/c?=
 =?us-ascii?Q?G9REVkibPatfKbvPcLdybmc75XfqKxLO84waxdLoNC1iBZcdyIjBwRNKSHEP?=
 =?us-ascii?Q?VY2bW+J7TmSakKf57up7jOEoifgL86jhJg5An7IYaUDsY9gpyEQ6MeahrIqa?=
 =?us-ascii?Q?Bo05q8ZgdgX8kceZlT3KKYKQxyqsLnEMnbMjo52mktq1iteC2Ur6rMq7Jo7X?=
 =?us-ascii?Q?rxVAJEG5Sx4+c2NwFEGOWPPxTVrHUG4o8b0dEfGHQ68AN15XIBOTBzCrnm9p?=
 =?us-ascii?Q?HaGbXmuGSphOuo9/KrBA7X3cI81i2CWaD83WaQ6275pucQ1dfw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x/5y/ZOiqQYwuKPvI5uHs3av8/JhODbAnnFEzxRijUHTnLDc7pH/toSaHmGw?=
 =?us-ascii?Q?h/gVWjnyKFrNzTDnofkOEna4Ux+NEgRLf+mGegeUg/7+vRNxTyxNcGC/2eMw?=
 =?us-ascii?Q?+cZOuNUV8+xHrnc2iMlICcwhP7GGU03nwBR3Gqt/2xX+BNoFLvWoCKZpWUnV?=
 =?us-ascii?Q?upkTq/8TeZB8XXEe/1Gl/FJjTIfLzuGEc7U9pXtsmwYDjQ/ljeB2pqFpcc5R?=
 =?us-ascii?Q?uYjp1ORXH9pZOaimVIGSOya4PA6NbdbnoLEprlGGC6PqC9+ofKryBnd6DzFr?=
 =?us-ascii?Q?9jLOFKOMIGfeYxyUaNGUuwZaRSbhrRph2v6Wd7w1nJrJx10cIhB3aFUOqwhP?=
 =?us-ascii?Q?hvi53KeNbzSVKmjw2cgTgZx4nl9FSPNq4fd/IW+9pta3nvsPl65hL+S9XqwR?=
 =?us-ascii?Q?DM2EAthFuIVx4cMCn3/ytDCZ/BOw8cYPOz+7m+jk0pvaKITiSEo9UIne4VU2?=
 =?us-ascii?Q?LizHrWX1+OUM84AUnMDBWS9yvZqQ+gWYzsLIB120+QB6gFVjtMh6qwLa7I6O?=
 =?us-ascii?Q?UXrdbnKLRB9t5mhcJvxpSHwi0W9b9OIymRZzXwaR4uRD4+TAMxcaOPhibUao?=
 =?us-ascii?Q?I3zpK/ayambjxe2qbNZFeKkWcEHaM52ZJg83qvxjOxHY7fXaX2EopryA05B9?=
 =?us-ascii?Q?6Q61+Gxtwn050bH9YhyumcjCdfMgymVeiTonew7HeCyvpJnGoQ/vlBhEKZqx?=
 =?us-ascii?Q?JlNjRqqYZ3FQze/aKf/glWw96jq1dYbQOh+1DxjmVd1sWrwBamKdbzj2dIfz?=
 =?us-ascii?Q?overnHKwJr+XZewhFbAhKqouIJNpKGhLL2C3eIJ809SnN9vrhq3FLYMhbZSI?=
 =?us-ascii?Q?5P2Gdjpbj+pM/MLOrIYcJsxPISRTYmjV25rlfRe35bsQvD7yIUXoU/g9Iurh?=
 =?us-ascii?Q?1C4vATotOJ1a3r8jsMaMoAEwXE/iH9Zs2Z6hYptkY9hBIl5C/sO1Z3rpDs8c?=
 =?us-ascii?Q?zh5wMiCqQopNjSth+lLvzkwbQkszIMnR5cOte73CNIC9I1VRkeCXQol3Sx4c?=
 =?us-ascii?Q?oS7vmWeh85nfbxAvtxUzTomn0thVq/7Sfge3PGpyiDe8E92mEXqNwMOcdT30?=
 =?us-ascii?Q?wGr48DbH/acUpqvu4eEibDSUiiKoOzEjdgp4xSoNqsX/HXHRUzvzc8EzGwPf?=
 =?us-ascii?Q?OR626HPkNYJkKvlEOOqdzhfXOmn2Nd5DL85AGitigDcgFP2kmO66L4yYd2KZ?=
 =?us-ascii?Q?tsbH3NNM9+/UV6/JD786QBN2zCbYexNhgG0MpuhEZzxhiCLScsm78b08Xe+o?=
 =?us-ascii?Q?CiSmVel/eFi5cO4jsLpMc0pK+MGD+g42wyz4WSrbd5Sl2UTFTTD0dFDTGgwJ?=
 =?us-ascii?Q?2WT5NldtMsH3d/6LieIodFMbkxYUP4Lt2Dsd8X+dGOowHw2aZTZeNgjfsAqT?=
 =?us-ascii?Q?lZAX47FdotT/QPMGknBOMkGFyMHm5NRPd4L+CgV6U5Lf9q56nP3be6mYHuJ5?=
 =?us-ascii?Q?GnGwTSHjsQ+C83h8ZBimrIFm2+OwZBbC9Qm2ZmpiDqWYvnIPGo82UCba8sMV?=
 =?us-ascii?Q?Nx5m3yl5xt8BiXDun8HstntDnOBBgErU9BG2YnP2EtVH+RWmbdMCF7DJlG8Q?=
 =?us-ascii?Q?kY0RQMHgoqq5fMF3Y0aHvmC/S6cDMuHCyxlcVIdY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17de9c56-e1ef-4ce9-41a0-08dd8f3442c1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 20:01:17.8435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: htojIOSVoBoyExXF1T1VNmQqhXecWkuOvwY7sMUMmLPrpt+f1MfJHghJuFZL/bJ9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5865

Since migratetype is no longer overwritten during pageblock isolation,
undoing pageblock isolation no longer needs which migratetype to restore.

Signed-off-by: Zi Yan <ziy@nvidia.com>
Acked-by: David Hildenbrand <david@redhat.com>
---
 include/linux/page-isolation.h | 3 +--
 mm/memory_hotplug.c            | 4 ++--
 mm/page_alloc.c                | 2 +-
 mm/page_isolation.c            | 9 +++------
 4 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/include/linux/page-isolation.h b/include/linux/page-isolation.h
index b0a2af0a5357..5e6538ab74f0 100644
--- a/include/linux/page-isolation.h
+++ b/include/linux/page-isolation.h
@@ -34,8 +34,7 @@ bool pageblock_unisolate_and_move_free_pages(struct zone *zone, struct page *pag
 int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
 			     int migratetype, int flags);
 
-void undo_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
-			     int migratetype);
+void undo_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn);
 
 int test_pages_isolated(unsigned long start_pfn, unsigned long end_pfn,
 			int isol_flags);
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index c86c47bba019..e63e115e2c08 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1234,7 +1234,7 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
 		build_all_zonelists(NULL);
 
 	/* Basic onlining is complete, allow allocation of onlined pages. */
-	undo_isolate_page_range(pfn, pfn + nr_pages, MIGRATE_MOVABLE);
+	undo_isolate_page_range(pfn, pfn + nr_pages);
 
 	/*
 	 * Freshly onlined pages aren't shuffled (e.g., all pages are placed to
@@ -2120,7 +2120,7 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
 
 failed_removal_isolated:
 	/* pushback to free area */
-	undo_isolate_page_range(start_pfn, end_pfn, MIGRATE_MOVABLE);
+	undo_isolate_page_range(start_pfn, end_pfn);
 	memory_notify(MEM_CANCEL_OFFLINE, &arg);
 failed_removal_pcplists_disabled:
 	lru_cache_enable();
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index cfd37b2d992e..8ff7937e932a 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6887,7 +6887,7 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
 		     start, end, outer_start, outer_end);
 	}
 done:
-	undo_isolate_page_range(start, end, migratetype);
+	undo_isolate_page_range(start, end);
 	return ret;
 }
 EXPORT_SYMBOL(alloc_contig_range_noprof);
diff --git a/mm/page_isolation.c b/mm/page_isolation.c
index 4571940f14db..7b9b76620a96 100644
--- a/mm/page_isolation.c
+++ b/mm/page_isolation.c
@@ -532,7 +532,7 @@ int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
 		page = __first_valid_page(pfn, pageblock_nr_pages);
 		if (page && set_migratetype_isolate(page, migratetype, flags,
 					start_pfn, end_pfn)) {
-			undo_isolate_page_range(isolate_start, pfn, migratetype);
+			undo_isolate_page_range(isolate_start, pfn);
 			unset_migratetype_isolate(
 				pfn_to_page(isolate_end - pageblock_nr_pages));
 			return -EBUSY;
@@ -545,13 +545,10 @@ int start_isolate_page_range(unsigned long start_pfn, unsigned long end_pfn,
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

