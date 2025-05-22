Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2077.outbound.protection.outlook.com [40.107.243.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC4C21ADA0
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 09:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747906584; cv=fail; b=lMrj2h5oTkkqwR43Ynrv5hFQxcf4DQWjrw44zT8rM4YB2zSz15YqJI0QaYVVgEcpqgBJvsLUJt4WEfBEN/2Io8QvJ1fPnZ1dMWAVLKSZttiGkW+mT/CbOZ2MNvo/AYAYaH3Ey9FT3nrQ/dqCbzL7gJ+nG9i71lnPfCm8Oi6kAUY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747906584; c=relaxed/simple;
	bh=gRmvdUUVFOeIXFsVmJPFoC4eYRNB0GupRY3Z0fgq5Xg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XcDrRKPR/98qy6gVqbpjbvanmBwXNZZgwu9BvX90VDwsbdtVL9BHiFb+htZGzn8m+CNC7AseMm/8LPIU2wQwdtd+CCOVkduHDzEKyGNuXGlkng/U4oBdFNKtVMr6SZj1aAkjgnWAIrlRWuKWex0ZG8G2xpEz+HUynpsliwTLvpw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ESev6Sfl; arc=fail smtp.client-ip=40.107.243.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ESev6Sfl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S0Q840xZ4FY99tjSNDASAadNIGXmLzIQF0nJqEdkLIdEJbqoDcJXvDGeO7S/DknVKgRb9/h24cqECNeY0OLmpyEiQTSCAAkxbk1xk9xWMKarB+ha/mq9lfflElI6U/3Bj1T+BY36bRFS8kCYgnmLUDPcXmRFuVodMtCZCdGTcsNFbRuSIndVPvBWfQU5Pom3YYNnN4vrkt4qJwkf8OVwWUVV9Rx1M4oWVkCoFofgDqxRRQ7U9iMmRCYwh50aoE28mWYARpeqrug36Jjcp/sA5l1GkX/3Lq8jUtQmb4HNys4jspmpj5qBm2SxpydLJEpdtgveXyzGCGSFnf8YW28ECw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=py5wyaDMD2kxNGSNWSLrwmrjEP6CQOHatCQjrbGF2+A=;
 b=FcdW/E4/DEgLaW3iorspq3WMonB6wQSHvX/Nus4VwUKOJd26qsfhhnzUI9M6/7Eem2lMMM2uaLnpdZIvGdUH2C+GwwOnUnUYcUItk8/1HfHym8MbYrrtIhlTvhs/uMf27MWIrb/yYERBwpB5hA+pZWuvz6wjjOEnqgBHRRFkX3I4sD1yXlC2vSOozYIKesJYRGRmtRGXfFucNIuAc37Ae36sy6ZRb3GN5Ft1IZDh7jLlJU2AbYuKakps+a/zEpsOH0W6gzi+qptEG5KmuLjiW8Xc8KwBwgkqeCgTWmawdl7hRyXYXTY5e5eJDUnKTHAlYvsjORho2StuyyFtVgkcLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=py5wyaDMD2kxNGSNWSLrwmrjEP6CQOHatCQjrbGF2+A=;
 b=ESev6SflGujx9iyLhdBv+z1CkXk5zUViSmoIiIGmxNeHDH5dbsfw947ozW76mPLM3p0DlSbK8zHHfwH08+xNMBzfJHxPLtws3Zhby3HqZjYugQvS9Lx/s3JKUOMgfgsV8fwRO0GP+k4DVjbDHjPFDcqAbj9wIki6qC1/F4P0e5U=
Received: from BN9PR03CA0381.namprd03.prod.outlook.com (2603:10b6:408:f7::26)
 by SJ1PR12MB6170.namprd12.prod.outlook.com (2603:10b6:a03:45b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 09:36:15 +0000
Received: from BN3PEPF0000B36F.namprd21.prod.outlook.com
 (2603:10b6:408:f7:cafe::a7) by BN9PR03CA0381.outlook.office365.com
 (2603:10b6:408:f7::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Thu,
 22 May 2025 09:36:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B36F.mail.protection.outlook.com (10.167.243.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.4 via Frontend Transport; Thu, 22 May 2025 09:36:14 +0000
Received: from kaveri.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 22 May
 2025 04:36:06 -0500
From: Shivank Garg <shivankg@amd.com>
To: <akpm@linux-foundation.org>, <david@redhat.com>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>
CC: <ziy@nvidia.com>, <baolin.wang@linux.alibaba.com>,
	<lorenzo.stoakes@oracle.com>, <Liam.Howlett@oracle.com>, <npache@redhat.com>,
	<ryan.roberts@arm.com>, <dev.jain@arm.com>, <fengwei.yin@intel.com>,
	<shivankg@amd.com>, <bharata@amd.com>,
	<syzbot+2b99589e33edbe9475ca@syzkaller.appspotmail.com>
Subject: [PATCH] mm/khugepaged: Fix race with folio splitting in hpage_collapse_scan_file()
Date: Thu, 22 May 2025 09:34:53 +0000
Message-ID: <20250522093452.6379-1-shivankg@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36F:EE_|SJ1PR12MB6170:EE_
X-MS-Office365-Filtering-Correlation-Id: aabdb723-f837-4755-c0a5-08dd99141877
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|7416014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CwJEregmRu2SXq74UAzYQnpxFtpT6ZAWD+JoPSpy/P6KFtf2534/j3MCYUX0?=
 =?us-ascii?Q?FkYXEWP0FEsBt1NUM8xbEQt2LL68aVyeFuKkQBohN7hT+ik7w22ngZAfO4ZO?=
 =?us-ascii?Q?/187SnocZwXWRkcNU/b+0JwnGZRgFjDrh2F58wJirE9OQK6Uarq08gbODh4K?=
 =?us-ascii?Q?WgOUz7BzWUeEUx2dgDpNYXEJUcIlmrzM9x3dSVDX84M0N9jx2TcY+ffEeIr6?=
 =?us-ascii?Q?c+pGt1ghnK6hIFbcZ/sJFk1Tl7zPpgKX8xRRqH9C0EdNomeG4q5gWfFN9RXw?=
 =?us-ascii?Q?n51OOGWAGTzQQADvawGPQPEWuFIWwxEdbfEGDW3kmjxuNW3y+4ICUI6G3poC?=
 =?us-ascii?Q?CmbGhGnEAibAJ+bm+31726rUXJpzBpCaMgdT1eSK5feK1W/cSl9kXuQo+o1Y?=
 =?us-ascii?Q?aO+MEyqxuCBFw9e8Tp17VjulChNnYbwKEAw8zA23o650DeiTlosONvzCX6z+?=
 =?us-ascii?Q?n+Dh/aD/LXKD052n20EEBugCe2PkARnYqc3A7n7pG4EuX2W9G5Di2O+p5v7G?=
 =?us-ascii?Q?lK9HklpmGm9L4XpmOPVwFDE391qK2IC7pC1aPwiLjyq5Qfv7faBtxvHwSdug?=
 =?us-ascii?Q?uI+8jx+fnFt3DbNbHOo1WNxUzeAIC46vftYd1MNKM9arwHyFsxUFN+EHgb/f?=
 =?us-ascii?Q?CJc7Vrz7sBG/fWxoHvpc7XdN3jCTZXGIbtVsIDr1LxWjrBy2g4ZJZL/Yhx89?=
 =?us-ascii?Q?mKXdyh70/HpNa5otqbgrkYyEsVXqc3P58Xz8oIYcZY7oW9XKkXXpobbIa6V1?=
 =?us-ascii?Q?gTqmJ/Y93jOqUTWnjsQcYKlYIWy6XzqIZ0xBeAtPKwxTFah4ABC4PRxt3uOn?=
 =?us-ascii?Q?JCSOQoNaqxacCby2Crt7BeeBshxaO/gtxjp9FuWkRIFL+lOawdQpwfqxF5if?=
 =?us-ascii?Q?VYq5WJZ+TJuMqsZGpelVT2vp5YAXIf9yAji1BUzZWSV9OrQBxZcOvA+hwyoM?=
 =?us-ascii?Q?RDKoDC3oHID7fHuy0Oa/58/qCEgug8Zp0iSmYAS2zreq+Ak3LXUA542DfjZS?=
 =?us-ascii?Q?0MhnAyv4aofECZs587dJlu3Sr9EFVtaRsa/vazJqcgQaP276ZgCyQrqxSeW8?=
 =?us-ascii?Q?+lXKT3+WFpaYB6HjVV81NJRej0DMftYVE4WriQjh/7QiEFVCdQ9z+8Lvxk2s?=
 =?us-ascii?Q?Bv9A1xH1aNhxICq4BqAczerqs87L3B4+Do40KK9VlQ4RXxh+EOOCk4OfZ1Z4?=
 =?us-ascii?Q?HUXtAg/pwLO7XwbvV41dfHOIWdfyJ/O93+KTkqyVBSQprDsPBgFzE2wLNfYy?=
 =?us-ascii?Q?GzrqUYbV8dIFeex/odmBODEObXAFH4a8kWijpAoAl2QhWljrwyzdtNzhJ/ta?=
 =?us-ascii?Q?Cxi53HC0ccr9ck+AgizqqCRMIU9hFZ10MBxUsUZvdLkTUtzDkrOyoxbbRN2j?=
 =?us-ascii?Q?eTGIXNGW6zndkGs6v+RgmseZ+TjBkxDm/yrUWEREp2UZUEXqKeVjkpq5KVZO?=
 =?us-ascii?Q?K4Bb85+pmUx9JXSWamk/SaZQPmKuVGo8+tJ4RqiODsjnKRMITRuLeA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(7416014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 09:36:14.4955
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aabdb723-f837-4755-c0a5-08dd99141877
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6170

folio_mapcount() checks folio_test_large() before proceeding to
folio_large_mapcount(), but there exists a race window where a folio
could be split between these checks which triggered the
VM_WARN_ON_FOLIO(!folio_test_large(folio), folio) in
folio_large_mapcount().

Take a temporary folio reference in hpage_collapse_scan_file() to prevent
races with concurrent folio splitting/freeing. This prevent potential
incorrect large folio detection.

Reported-by: syzbot+2b99589e33edbe9475ca@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/6828470d.a70a0220.38f255.000c.GAE@google.com
Fixes: 05c5323b2a34 ("mm: track mapcount of large folios in single value")
Suggested-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Shivank Garg <shivankg@amd.com>
---
 mm/khugepaged.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index cc945c6ab3bd..6e8902f9d88c 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2295,6 +2295,17 @@ static int hpage_collapse_scan_file(struct mm_struct *mm, unsigned long addr,
 			continue;
 		}
 
+		if (!folio_try_get(folio)) {
+			xas_reset(&xas);
+			continue;
+		}
+
+		if (unlikely(folio != xas_reload(&xas))) {
+			folio_put(folio);
+			xas_reset(&xas);
+			continue;
+		}
+
 		if (folio_order(folio) == HPAGE_PMD_ORDER &&
 		    folio->index == start) {
 			/* Maybe PMD-mapped */
@@ -2305,23 +2316,27 @@ static int hpage_collapse_scan_file(struct mm_struct *mm, unsigned long addr,
 			 * it's safe to skip LRU and refcount checks before
 			 * returning.
 			 */
+			folio_put(folio);
 			break;
 		}
 
 		node = folio_nid(folio);
 		if (hpage_collapse_scan_abort(node, cc)) {
 			result = SCAN_SCAN_ABORT;
+			folio_put(folio);
 			break;
 		}
 		cc->node_load[node]++;
 
 		if (!folio_test_lru(folio)) {
 			result = SCAN_PAGE_LRU;
+			folio_put(folio);
 			break;
 		}
 
 		if (!is_refcount_suitable(folio)) {
 			result = SCAN_PAGE_COUNT;
+			folio_put(folio);
 			break;
 		}
 
@@ -2333,6 +2348,7 @@ static int hpage_collapse_scan_file(struct mm_struct *mm, unsigned long addr,
 		 */
 
 		present += folio_nr_pages(folio);
+		folio_put(folio);
 
 		if (need_resched()) {
 			xas_pause(&xas);
-- 
2.34.1

