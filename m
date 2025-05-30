Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2067.outbound.protection.outlook.com [40.107.94.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B395623642E
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 16:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748622180; cv=fail; b=qXnz3fVQfrmjzpWN8ZN9XGq2W4E3CsA41NUXAFxljGN5yYvcEdBjn7py2CpL+dxITY/HIefcUrqWO5x4shwbdL+1vmCSHhbDQ3NfMbGz2Q30+Rp+3Tz/BWfORAvlEKwhsSGTbE9gn/Q3Saiw2f7ju5cxaPIZWHCT/lcxbsMNto8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748622180; c=relaxed/simple;
	bh=LvS/1JIskFMUktwfKAtqmyL0OtX/8Q1n6Puzx7+gHPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jrKpRQHvB1KjN3RRPFQeUuE8BoP3E3q+dsOeARG8P88dBT29okJLAdoyhzzUxuepGyhNaQQ8XAeQ1GkzX6PikRfC/D8bujLla8eqp6/xxTaf+yFqyzG3WDxvhU9F102qevMBNrRT7E5KpVXs3ScquBLMJqdUx34vuD34qy7HVuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CEGd9d2k; arc=fail smtp.client-ip=40.107.94.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CEGd9d2k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lunTq+O1fDrWYfZ0zQk9RaAiIHEgd0rUQbP78/j0nwa1q+y/IhEaA+ZBw+iMSksVDnt9HzB6EFzbxft0QKKY1yjQuDGVVPePnERdnyMuMSrvhgZ1Ve+NiuIyS5eeXtTQCxnylNAkIrVTrI/iLa0A9xOn7kVf/wiH668ay0QSbvMZRNxyjOqEC7IIV+g2enVirdkKCAWZy+0dDj2uf2x9gNO+nuq99NMpO2LL2Tr/kYmEvS3d8SVHQCBh5Hh6uR0j/naZmW3ZG/AMlAKrsPn79EXexjAFJ/c75Fet6nSuUR0VbEXfzeav3Vg9+JsF23DUnnU4xR1n/YQU/GpaAe4hfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/6F2REMxyWAtpRnlSvivqg8w0x0yFmFzOF1and/A0A=;
 b=BTnPa9T/26PRucQI0fy1AVyo86O5P/GHVLa2XsD88Bsy9xijzMjREB8axa7UKqFYF0e3pr+UIBb6d9c9DR6UYnD8ao31vJr1nsVx/oIXzlVMwgyp9qDQFQ/ReAL2tE8tYnH8Y3WSFuXobXAhO1WPsZQKmEA/NYpkUN5FXjJBZa5l0hKIofGsugTBAAnVQnn+z7YGJcaLNyjQV1YnZRV9nxoN8WBu8rSZDTeCCXKN5KuyuAlKGNsaHUPzokUaGXTE9HD9R7+PN3vAjGHlt7mSa4ZOW+9pzFM03nX3MhucWUciRtPQJHo/ZEee7kYK2br0Kvq4pXg6vnR5fRQJy9Wzjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/6F2REMxyWAtpRnlSvivqg8w0x0yFmFzOF1and/A0A=;
 b=CEGd9d2k1tbY10FJ1Xos0HVAXwdXFigGAQqR0pKd8rkE2kXWmXNSR4SqxgLFgBDCrevdUCblktwD7epp/40r5Ln1Kmq9FXYdy6xLGYXUXadhcGjjS3Dxn4tVB6y5aFkBtExKj2X/FMdKYWeN67MsWZKUb2kqkr96Km0OZMGe1w2UlqKu1RX0+wXzS4yqD/U8IbEh0kLtYfREJ4sz8hSuer6Hb1UtnZKme022cboAFwcpp7dk2ev0oRQkOCWlq0swKcuTp/lgPb1jEZsCbsm+Zg+jVRcNUP+cJCtxeBogBbWZH7M7xm5hAUCQTUyXQ46ITmjSGAshSwDdrgr2nvQ7TA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DM3PR12MB9352.namprd12.prod.outlook.com (2603:10b6:0:4a::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.27; Fri, 30 May 2025 16:22:54 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%4]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 16:22:54 +0000
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
Subject: [PATCH v6 5/6] mm/page_isolation: remove migratetype from undo_isolate_page_range()
Date: Fri, 30 May 2025 12:22:26 -0400
Message-ID: <20250530162227.715551-6-ziy@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250530162227.715551-1-ziy@nvidia.com>
References: <20250530162227.715551-1-ziy@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0646.namprd03.prod.outlook.com
 (2603:10b6:408:13b::21) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DM3PR12MB9352:EE_
X-MS-Office365-Filtering-Correlation-Id: e264d5b1-533e-4488-b969-08dd9f963ae8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?H8z8n2nb9AXIN01GBJfCG62kbgY79G00+8zUKhJ8RdLMODK1WYv9IQmoPJqS?=
 =?us-ascii?Q?XZlbfj8GfqO9uvhYJBybGiDXpVaYUudb7mlwaxdu0Ak+PQfK19ZZe7qRc5eI?=
 =?us-ascii?Q?kEo2GP5pTLP7eV5XiCqiuajTUZxVqDuaYESCJchXL6P76dukiFWO7WtYTS30?=
 =?us-ascii?Q?tgeLYhiI18mchc7BIolD564gMe9O6mZ3HtFQPTix7GxXBzBywybIBtWsnK/z?=
 =?us-ascii?Q?JSE1ixGHKp4c/PlB4JfAD9/KMVQ8FQwT/ufg7cpavp66vb6E1AI1ykG1lGWf?=
 =?us-ascii?Q?d6+qXA+iDoy8Rep0axIacuq1ObBkMW+M12Jx26Of9pK0filg8lDhMlF+LZiU?=
 =?us-ascii?Q?On6CmlAMII4CtN6REHx2Qt67pVjLdJKoBDe0cBJdDRmWjBn6WLK8w8zr9fw6?=
 =?us-ascii?Q?Pl/2eX8gS18uYRRx+bcVdeMxw30SnZV9B8jSlJRQN49amgNl5kwspXDkFOeh?=
 =?us-ascii?Q?F8BbU33iVD11JRdv/+/JpbQG4ZQMLSE0neRoj5ixbO9LrUJqpyfOKXGZtEOa?=
 =?us-ascii?Q?N6A8gbqCDNB9e3uzDCzWP4B/ghgCPpthjYSqAgrYWiRxzma+UBJix3zWRJNI?=
 =?us-ascii?Q?3jEwl/fXW4K6WSDOrgWtWAQSyHzXC+kQcBHLlkxWfbTDViz9pPKmDi3Ee9xH?=
 =?us-ascii?Q?kt36gbQgVyM2MYDB9uQJ1ctUSKYGKjgCjRnDwPNGezTF0kOqDoS58MRIrW4O?=
 =?us-ascii?Q?1vdeAtHpreySoZJnYC5zkusMEGehgIC8izefGK1lcyReoFpJQ6Az+UHKg0T1?=
 =?us-ascii?Q?WWsz1AkhNepYA62gx1AHZUrPXbyWD6ToXHKet1/Np/P8PhqfnkeKqdFOLNCn?=
 =?us-ascii?Q?YXlHW8/R7LFCCOT4D2uzhhKkMLuRtfez478v4snChHwKVsysI70Lf7V7a9bK?=
 =?us-ascii?Q?x97wIMCuHmKHie33zdh+kMECclUgSLINXdkejKCVcWYJmMpkTl1tjcssXFCO?=
 =?us-ascii?Q?h6Awik8WEd17LgdFmfYoGhFeglEAvQ0K6S6afre5VWoBazk0OUljTDQhMIc7?=
 =?us-ascii?Q?s5AnqgslT/o4xosUbyCcHcYVU1VbOraUFtpQx+k+X1E9X0uVYuRfoVh69OC3?=
 =?us-ascii?Q?X7zRnzeLOnDFpAb7/1FnzTl77NXH159gZS8/Dxp0Li0Hqx0YICVjl4SNSVmY?=
 =?us-ascii?Q?hx8YuoWYze0MLcDY0Vqxb99mNU6g6oN8izm6JUS3KjELPoGPLGWqfAtqBBuV?=
 =?us-ascii?Q?MXsv4qIJxHZEo0Qk1mGHc8ZC66coh/U6kjZBKAgL5o3CR/gGl8rzNk6usQuz?=
 =?us-ascii?Q?cJOU7b4x/v7sDhAtFWqfthB7uS7D93Ojya6ML4MWZkw0P1C4LN+KJgtQkHEV?=
 =?us-ascii?Q?7JxTXkco7ocrUbxSUT6yJR9I/PU0ITLrByA7muliCWRuZm+eRsH17cShC0hq?=
 =?us-ascii?Q?LO4Dt071EZcLCOt95SmPpEi92wXl3FEIT0SJbLU3RCE1PTOcTknXM9GoHLd+?=
 =?us-ascii?Q?ptNOoD9Izsw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VHHhTuvSS0ngB/KCnieMegRUYXUAZeQ/y9PxVpJMMWtNc2bLLGcM9X8cyApD?=
 =?us-ascii?Q?x2zrObXcEB4GoRJACfcOL99Qbwu5rxxllEZ0GQ2G29I3IbW5CrUDneP2/UIc?=
 =?us-ascii?Q?++TMD0LAX2t9tOXwlNrN2Ai5m8qmXMjXyzQ/oIX1D9AM6IKfawWudTSZRhdI?=
 =?us-ascii?Q?iFTd7aweEWKdem+Uhc37VKSBZXeqqJhnWhXGAWLMrWsVgtcgjdZ0WKvnhqPd?=
 =?us-ascii?Q?hwKW/PNX1/aGooYV2g365kGNhIwer+83DsX6FUFeRiU5XC2cvk/DCk2xwtOM?=
 =?us-ascii?Q?JGDFNFUo5AKPmxFe8BLeNHHp9dshxJvyLLlpZa24aro5K8g1Z6fw94AQjyBj?=
 =?us-ascii?Q?XzwzMLZnNb37URMa61pruuBbpWvBSEk4It2SsSfUuHWRevVYGJYhnaU1XNcp?=
 =?us-ascii?Q?WEVg5c9y/VZZW9T4n1ijPwzu8KBUwVVgb7G2EurrJrTBhzBFaEZEf3hyDD/V?=
 =?us-ascii?Q?KLgu6VyL02CPdvl+hDkCPPv9rB4N5E2R87KTXae0LdKkmF1jKYt9WW3FbZKd?=
 =?us-ascii?Q?aTOeRqmwdfpSEs//MlrusiNIefQ20Ht+xPesp5QgGrj9LVdI0FpCayaRnQHo?=
 =?us-ascii?Q?HKF7ftg3/6RNjOGeBBh0CbV0ol8SRMXcIai+5YowPw6Df3keyAb8zcp2mRwE?=
 =?us-ascii?Q?pqhTyGZVTwaZmmGaHD3Byg+7G97sit7Nju5wlZ8QI9kW6dFiVHJ5BGKD3hCp?=
 =?us-ascii?Q?OHKOcV78XY+PGiMPxF8IrSeQetCPM5KqUY1btUFJteAG7R8XyHK1M5Vm6oOV?=
 =?us-ascii?Q?J5qmLbkFA5/K5O1O5qayTn3ONxdJOG43DALtzJgCqIxFR4w/0Qo78+9oJfwS?=
 =?us-ascii?Q?2JrWKHi6vb3TQ2Itv6wOvV6CLY8Ij3VqikB7ylWLTrB2n8hLz8XRJfGOnreh?=
 =?us-ascii?Q?yJbhvWV/8DIw+tGIWxdev7z7UMwgMUAfh8GmgEmCIMYPuwgL0QO7qmC3Qbww?=
 =?us-ascii?Q?sdbWstQttj3FjHGEx6H2Ah8x/uNzRgxQZpNyJpOL/q7JbVPIZO83MKK5pT6T?=
 =?us-ascii?Q?l9NWYARRVX3HlAyQE37zQIDwZOqsJ1Hq0/CbSRiCehh7d5s4fmwkOVx1MqQT?=
 =?us-ascii?Q?dHtNvbL5lagk7x8OGxU8UwToeM5qVBvn6DVw05LC8EYGvtJETsnNXjHnVr/3?=
 =?us-ascii?Q?EkWIiIdzQ0EUl4qRGSqCa+3JrwaGyn3lfw4wuKmoCgVKsMQ7+gsJ7DzgqJTH?=
 =?us-ascii?Q?0+7wtGJpZNteWGFV1JdNx6QS90tR5VyGdWdgbBfkiRdTxKqLUqq70r6AvnDk?=
 =?us-ascii?Q?BKaP9kk5lUasrQMseDU6ErrbNjKE9cx7ickdYRTDaEN1NwTSBrN9uO9T5kjO?=
 =?us-ascii?Q?8mujtmHTTsa/hevts26jnmfStEtJNRHH2+kT8xCTvhEV/8G8YCJIHqvSX0l0?=
 =?us-ascii?Q?mH4AtbeXR4CvR/6kuYONOsJaCmAGXz6/gR7sTDN7SNHdkg/BUqUj+HuBMtDb?=
 =?us-ascii?Q?H183ZiyV9HGl5v638S1QHhJWlGUerEw1oTPQhgIVHRfwmSHAc+Pl6IaX7FGl?=
 =?us-ascii?Q?9HmUOEeEYVukupWYvwU970A3bbUdv5rFkMVc9AM+8ZmEMuKnR2eE7lY4UD+X?=
 =?us-ascii?Q?H9UVXXyXUzrpKt6EVHEcqModPMYMtNRM0samh9BW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e264d5b1-533e-4488-b969-08dd9f963ae8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 16:22:53.9666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BpIkbaROXQ5wlmdRtEFdoDjJuxPl5/2egpq2mNAYvrevy4Tlskz7b/S0iR6OiB/B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9352

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
index 43ac34ee8d2e..ab66acd3e6b3 100644
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
index bab114022829..a248faf30ee0 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6988,7 +6988,7 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
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

