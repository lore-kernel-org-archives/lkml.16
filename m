Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2070.outbound.protection.outlook.com [40.107.236.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A62254877
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 23:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748908392; cv=fail; b=njWFuedYFrzENZX/9/dMPB93BaCgZZQ/eZtbK+APX0QUwNZfNO1RV/QMUZ19DkOvWQD1LlJ2uOP3go1htFQgW2MKafkrjeieGFFAIFd433P95lBu1RdORyRRauNP65saHd2UQSHoMTTEWQ7n9r7HX0nmm6LYVAyZ7i45W1A/zxY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748908392; c=relaxed/simple;
	bh=mGHan1f3pvsQ3eX/Uo2gFvcOfPdp8iVlcI8dL4nzZHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dDr9e83n2f3afkbOCAtwo6rHbO6Sm2lAcKi3aUdLTbzKrRMqW1rwnd+asJa+0OP6mO+A25VmJkdb9fBgbukjn+HC7rzGj6d9zIeoxRvGkU9JN+6phOveO27WArXfmASAetdi9gfis8q1nn4KKtxDFAP4b75fK2y96pgWwYz1QXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BgixA/0b; arc=fail smtp.client-ip=40.107.236.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BgixA/0b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GEryMbA3bFzBPn/MXAaoGUwAeGQstNUdQno88q9kr/bX7e7D7eyABdJi/hVC5GWGpNdlAurp5wcqLITHP/+D627DdXyGl7I9zIdHr19RkwAfAWpFWfBi0PBs9HV/k5ImP7/14lPPzXAb/x8ahAy8JoGXYmJxLD2EPaGTh7ZkSuyK9eD6YaBcWu+DHfUugRA88bHPWG8zu02dw7PQUPz0DGM2atNmT8Vf9pLrw7uYW2gC4wwtm2cSZlfHbmcsSNeoq4GZuPChMgugMuoV49eqf8g9357iJTIFkyCVOzmC9Obn4iCrXdVWaFD1F/dxfSPhqJhYb8KoS2s5tCrT20w6Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Ca2y4Ll6GhldlIIPPkaafx8RWllJVTRpRpAU6TyVdY=;
 b=p9SXYJAXwWny08uIQn7v2pN6wC2s/UtZEFmudIjvXACxlbnm5eu/u3VOtsWI68YfSaTR9Wr/pzCS/JFlyVaehrFRHF7NyzkeDv3lrX6ing49BwKi2RQTTXDbhHBimnHTQT/ybM7hX9lJCWXu6DnnV7tYYd4qnL0nTSUGI9MNsLVtz+A8KX5yVk7dHzeGkv6YMAHCtjWUnDUCn3hclrP/azf2i5OCF+feZJOpllJTDdWfGE7s2CG0skulUCrmJtWu+EJld78dLGtn/99bcuMHSS0kLD2MbG09pAXj14hJkcZ1T7FG72X7YAjt2xTy5A90QFc+4+TBOMo9T7o/FcrjJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Ca2y4Ll6GhldlIIPPkaafx8RWllJVTRpRpAU6TyVdY=;
 b=BgixA/0bLrhWgblthHMjAyLwEjNdfQDs1SBEySHOsyiVmBJvt/hGRZtYBpiaxk5NVpM8CWM/DcgGrvy80hGoFaCKNkOX+/wqPU60++bjUkYF5OmP3Yit2SPtKP8SuD8UFkT6+WbQo368+CdZDSSSDBqRDe8HH6L63A9+MhHT9WAI6ht6NawXiZr/HKQFypbufjJtnyOfaGe9/6vQORM769d2MauyctXkMKGhAks9amydsztW/G/X1ZsEUdQ9ozBWoA10mbfNOv+egOC2Kt4XW5HSaHmvYy00M7gp4lNd5/a862pG0Rp2gAOzyUTdoo6VuEogF2h7ecguX6Hh4Lp5LQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 LV2PR12MB5726.namprd12.prod.outlook.com (2603:10b6:408:17e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.37; Mon, 2 Jun 2025 23:53:04 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8792.034; Mon, 2 Jun 2025
 23:53:03 +0000
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
Subject: [PATCH v8 5/6] mm/page_isolation: remove migratetype from undo_isolate_page_range()
Date: Mon,  2 Jun 2025 19:52:46 -0400
Message-ID: <20250602235247.1219983-6-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250602235247.1219983-1-ziy@nvidia.com>
References: <20250602235247.1219983-1-ziy@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR13CA0025.namprd13.prod.outlook.com
 (2603:10b6:208:160::38) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|LV2PR12MB5726:EE_
X-MS-Office365-Filtering-Correlation-Id: 7890dfa1-65a6-4a16-2159-08dda2309d48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZfXnRBnj7zMaO4WIDvlWEjGgY20euaYjOl9eOBzdQj3bP/cP1Gy7/NNLbsY8?=
 =?us-ascii?Q?DiqBDg1YZXydCzdOfdMgqnjS+EesPOcrOqQWiqfq+w/wQkQ4etI1IwQJC5LM?=
 =?us-ascii?Q?sgY6NYwxHgJeLh3LWCgSdaJxKTjMP6o9wRVxndSz5BdwdDU9diTHmOmkOT7d?=
 =?us-ascii?Q?6cEd0aTjZueHZMON853Hsxq293SPp0+5cPV37liqDQFBmukJUA0bfYEARoIJ?=
 =?us-ascii?Q?UoFSvOHM9QzdA3DocGQictdDh2ILRLtgbYHISJIPTdt71fNXtovzpjedmkFW?=
 =?us-ascii?Q?zCx1KRGTEhvCEaXGlrnbrWgkFyKESxaWhjaokmfhKueyrMI+pnJe/Ygto6Yh?=
 =?us-ascii?Q?KHAOAjCtwmZD7QFzGyTdfsIvn5ekeEFbVlS05/vCRET6GqYQdMm35gxqS+t5?=
 =?us-ascii?Q?D/xI++3obZmRwSP9b9vfSCJrHruwI8Sduy0smidlKhguJSipaAWGujiuC1jK?=
 =?us-ascii?Q?JjohPZKdryJBkdZl3po9CnPhy4b9Tr2nTY9PLqmPINgD2bJJiJRklpmJ4xh3?=
 =?us-ascii?Q?F/9GuAJYdbTFshPKdJyNshMxxxeBAHt9voLQtJWJTd0yKiIeTjt9SEmc3Qpm?=
 =?us-ascii?Q?jdwtQI9lO/+KqksdwmOu/4+WWS8eY9esPOiF+E/cuaxD5c8OY9phIafYXazr?=
 =?us-ascii?Q?DVBIwQwZpY904dR3fFosJOtBOgWdsV18OYAyq1Rfj/s2HZiK44+LTCNa944Y?=
 =?us-ascii?Q?9WGGVWAt5WZIz9Ig3GY5r9Mr+Od6Bt/d+k14AyxW4UBhMDJ1Jejvf6+Ay9mD?=
 =?us-ascii?Q?eGaboMz3eSIr3NFOIgaVJPQwVa7CK6LqniWK3ORo5ZktIrl0BXppy+wIg3QU?=
 =?us-ascii?Q?0hy9unLuX77etouolxOukVacMo0J3NXYKWbQVCkiIhGBBILbM24hA1eYDKEM?=
 =?us-ascii?Q?f+c+S9dTVdbHVXgsFKa8FYn86tJhQyN3N3dmcW9TWobx6ECsrfkqAVtgTBS1?=
 =?us-ascii?Q?ml2c4/p7nfFk8Dc58PXf3eJamZiKy/g1806iUKHmjsguByII4Rpcr561X56n?=
 =?us-ascii?Q?wfaelFQXpvxZ9J4esSpxKCVQ85sSFyEvKDhTigPLDFcelS2/E2VHitTDE1hJ?=
 =?us-ascii?Q?QhjiMm6leERcAYCJ7bSsDqf8Knw+DXfaAr/qFPOVw0EgiCRq+1s8OUNs0RCe?=
 =?us-ascii?Q?REvQaDh36TkvXLrCngo/XmrvVgOoX/xatSX//xR0BkQzY8sIX3jvmqDINPXv?=
 =?us-ascii?Q?yetyvz5dGHrYq0RYbk+U0LxXLF5QTRxFi/sKHotsvJE/FHSjD+QPtfv+Du45?=
 =?us-ascii?Q?xPsY9dBwjzAzhziWGgT6AqLcy/nVpb3tSBNKB/xDWE4PBULJUVGgiCq9dL3v?=
 =?us-ascii?Q?/DToiW0ppCKyj1iCuAf0NZlVbut40yz9z2NQvyrpF89eyM5bkVJD3A+rQmC8?=
 =?us-ascii?Q?iK+meJeHqAt/VpXxvP3Zbb/kB34qpgSH2HxAX3NvtdleDFu/qGIGzwymYWYV?=
 =?us-ascii?Q?5rdgaYi02lA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FF7Rbg+InB35HvmCmg9K2gA9kAwIpTuLTh0zQja1pcBXq3X+b+tZ+re1esWO?=
 =?us-ascii?Q?29+uKbIPBYhUNj36y4z9XUHQm1P3fRhSjHtwhZA5PyoiiJDLwycXdn7SgjJz?=
 =?us-ascii?Q?Yu6n8uPbjJIDfdjzLU7LoG6dyTsSNG6/+teyY7wdWSYZGXycpJU9yrjaoyxQ?=
 =?us-ascii?Q?uR5BQ5VOeFf3iAZVCvCXbOfvRqai70m2uo7tq0OT5aNCs1PsUl83avJ52JHE?=
 =?us-ascii?Q?RYq6aYNi5p62hG14pQGfPOBp3Hnerdtk/6RSYkCF3h1X5p/oS8JtOKdRjH4z?=
 =?us-ascii?Q?garw28BNE6P2WMO+GR6nnEZk2vk06evo2nr6Do4NYxGjeLEDMn+x8HrkEPN1?=
 =?us-ascii?Q?j/tSSux3oP3TPy5WxXzEV+ekJeuyryH6RERlJzH1Mitxe3cvNjTl/NBd/3QJ?=
 =?us-ascii?Q?iLHAswuukIXGuWdronc/8e3uwZaTeaVI3oOMgWazVzVUkjudUPebpSryg486?=
 =?us-ascii?Q?ZR6/S6kpmYVIL5IF8J8oKF57CHrIvuSwkRBpNwTWGygSneM1viRzhlYjgHK3?=
 =?us-ascii?Q?HyM5Ug2YwExyHsvbqvy95i4+/U+OI4XoAPi3YZI6G7WJruTSqvbR4avTTWNq?=
 =?us-ascii?Q?1tkKLEWjT9kCw3Y5rlsvkwvkOAPnk+UHx5lvyUNfiz8uvS2Kf9ToFUui4R1h?=
 =?us-ascii?Q?DavS/jTYJ46TmBAol6g9VAK8a0vYZQWUheEF0pQ/0t23dzyUD3bsuWnC/Vd6?=
 =?us-ascii?Q?6SpIaNhAvP5wqJpLc4qU+OuW7pbbZo98EslyDSobaXtLF65ucYGnqoGhkbSL?=
 =?us-ascii?Q?iJjJ4LKmaMc0bxAyrz3SD+dWXascqxhsauy32YlcnyRM1O494HV1pjPECow6?=
 =?us-ascii?Q?Wngo99n3PxCZ/QhtGz7kB+c25VVFG101bgZSZEDNsWUZGjOgqJaxCisL8LCq?=
 =?us-ascii?Q?uRKenRH1FVH1eAGY4U9aw3vGGtT/QRn1AgDIcWKdGr/Yke+V3Sa8HTq0MOY0?=
 =?us-ascii?Q?aV0KZWL9PEZpQvz9y3i8Y4OCtoMvOqkqpdfP7zK7rks4RShc9kvnyxDCThXA?=
 =?us-ascii?Q?CIVLf6Qczb3ORe2Y7r4F5FUQsu2KcsNcravrQJaIF22Twl8Gb45NN5EaEwpk?=
 =?us-ascii?Q?AKhg1MSyc3ukVyQRbK//I2bX6YzIrzovRSurVIa5a5mtROPLArzHKFjYXjrp?=
 =?us-ascii?Q?OkHpe6HxTPLfMXJfeJ8PzkJYv1scWAEp4wvknL9UnMUSCpFbAzx5XWzbP/WU?=
 =?us-ascii?Q?0grUtxF7ZghIWUO0OG4xKFNgc9Rvm/jLSwxu9ShSPQoNdTDklfmBM3D7s5r+?=
 =?us-ascii?Q?UG+MVqaA9VNq22sztqg/U5UjMoN1kCD0+Vl1XYA1nD8+yNGTchumwld4F9CY?=
 =?us-ascii?Q?4ZYTfsxm+rgMm7NrTwHToRWFwra8/VwFwYXLZvl6cuVYBApyfjWhEnaGRBFt?=
 =?us-ascii?Q?NqfVOuhkAa+6PIfLt4ATbe7NDp/E7WXDJR4cSPxILLI8PPvgt8WuBptfoyhS?=
 =?us-ascii?Q?VX2zuP7SDVBW0/h6IaR5BrxDVop8u1mQ1ngiqYcsDbqjNosmRjA4SBr2COoP?=
 =?us-ascii?Q?I05r5bsbn8ZoO1ZRfdv5G86ycwcmW/4bFVmbAgf2U1gvhdWLuMo+H9ia2ohp?=
 =?us-ascii?Q?gfOD41Uz/vkgCWmVMJrfEWtix2tq2c540q63SPOO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7890dfa1-65a6-4a16-2159-08dda2309d48
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 23:53:03.8621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CjB8QaowE56MSoeBI7GDoVh+654go96YEska1vgTQd/UvfNE05EBb8t1DvNulq/m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5726

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

