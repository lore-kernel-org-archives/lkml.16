Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2074.outbound.protection.outlook.com [40.107.237.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4441223338
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 09:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747991738; cv=fail; b=h7kB79ZTaz426KCFcN5fjTysbKz7UxqkWc0vnyYJ9FW2CZCD8A4F4yDl1hkVXP7yDX2fosqvx2S5itehTP2ePO1dgRVCo0xG2flp4CAyEjfGcOlmaKdrNS3CUqiKDW4tv8sk6mLBY83ySummG4eI1xv0nR4/IBNdJq+RFnyGQD4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747991738; c=relaxed/simple;
	bh=lMmRdKa3jzCn7x1+LOZoyWF5V4DyvrkXXGTnvpNahTA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VQOjkrV92x/u/8qlaYE1v4e0O8ClQwcI+seepV1JMo+5n6v18YclyfjE+RjJg6Ru0se3sa7MNSuARK2aD0v3YwUCtyJ2i2Xe1Nofmp8isFNoh8YNC9xrcjcICGVsuox3KiGBS5K1u4WmNGgLySxy76wXHCinWUhoC8X98d2F+Hs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Nn/cMEiS; arc=fail smtp.client-ip=40.107.237.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Nn/cMEiS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PXAfOquPdMAKJ8wCeJ6Oz0xRTbg2oSwhfMv6M3XyVcPjNlBu1k8OxOa9JlY27H3/QONCK1vwtJtox7Vo5Xvpb+xfoJS3sRk5ZY4sUAKtVfVftf+TBFv20dfOywR6DrAJu2hnDadNZPb6bY7OpcIqv10Ir3UchZiwAwC/cRHlBK+TVma+iQLZyfR3T6x9g9FkTVYTRByqkWPQk2BxMaNnMD/9uhOVOkFjlTy0PdqcMJU719CrVIenHGKDM2FAfq2ylCfBr5Z3zj2aZwL1vrWocKuHzihIHqjp8OS2o4GSgGO2ieiIGIaHkelOg+SmNt8707oggDV6IXP9immo7dFjcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P5GX/xuXunh5Q4HPToTUaeRSaL7/PVdP2ElwNAMU9/w=;
 b=s+5L2AadXKT9DQ635e/k4HwG1+WUlx2tvEXsxNdn74GCnnTnUpCz9EiS396kUm6Xm3aPyitIcNrrQ6xrTIn9FIu8RGInlOW66AX4yoO5h+ecHVkZyVcBBTf+smMVG1st4oleDWHtT7OuFtyjRCYdHlPVMdTD0NBqut3JzBfcXn8ZZRc3IYTcRqaJ9rGvXlKx6wzMdK5evTImWwcMdo+0Spr9QUMaZofKfvClMnV/VGVjvDauyOoRrrgIoQJGBo1q+dsPEPPs486jKEle3f9EN2wkHJowRJjiDJpNQDi0xtD7BmUugMqqvWk3B6S3Fd3HtwOIdQMychSEHsVXpm2leA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5GX/xuXunh5Q4HPToTUaeRSaL7/PVdP2ElwNAMU9/w=;
 b=Nn/cMEiSWz8V3G4yBCsllr6jEu/9QJFLTQWmgG4ivSe84QMVphKaJNgFR00Nntn647PCpKixiC+VyQ/inkPxT/65NOTFfoYvNLbuzEYwYTN8aLpAhTSydgo4avdSbFjOCKAtnhsOxkbOCAWNeUIEL0dv0aAeV9E/8WLBTNVdETE=
Received: from BN7PR06CA0046.namprd06.prod.outlook.com (2603:10b6:408:34::23)
 by IA1PR12MB8495.namprd12.prod.outlook.com (2603:10b6:208:44d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Fri, 23 May
 2025 09:15:33 +0000
Received: from BN1PEPF0000468B.namprd05.prod.outlook.com
 (2603:10b6:408:34:cafe::f0) by BN7PR06CA0046.outlook.office365.com
 (2603:10b6:408:34::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Fri,
 23 May 2025 09:15:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF0000468B.mail.protection.outlook.com (10.167.243.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Fri, 23 May 2025 09:15:32 +0000
Received: from kaveri.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 May
 2025 04:15:28 -0500
From: Shivank Garg <shivankg@amd.com>
To: <akpm@linux-foundation.org>, <david@redhat.com>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>
CC: <ziy@nvidia.com>, <baolin.wang@linux.alibaba.com>,
	<lorenzo.stoakes@oracle.com>, <Liam.Howlett@oracle.com>, <npache@redhat.com>,
	<ryan.roberts@arm.com>, <dev.jain@arm.com>, <fengwei.yin@intel.com>,
	<shivankg@amd.com>, <bharata@amd.com>
Subject: [PATCH V2 1/2] mm/khugepaged: clean up refcount check using folio_expected_ref_count()
Date: Fri, 23 May 2025 09:14:33 +0000
Message-ID: <20250523091432.17588-1-shivankg@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468B:EE_|IA1PR12MB8495:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c3411fb-5dce-42d3-ce08-08dd99da5ed3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vVhVzXzIc1PhsjKKx/BmTyGUptVyT2sWD+KXNqm6PXiqZiDKYbzIQE/Mw2rA?=
 =?us-ascii?Q?7UJ+oZ7ZE2TTcX9vz27Qwbro8lDaHX6Fj0PemKLq6xSgXmYmNA5EbfF6Kxy+?=
 =?us-ascii?Q?Sahid1WUGU4WCo5eEENDX79kC7u2HirCJtrLAI0ucUAt9IjI+aepBJmBx93z?=
 =?us-ascii?Q?0Io4vjvKz9e5ENQt+MqOEKKCcXonFnbjOs9NO3oOYUYOrlJebsXKqWRNXGIm?=
 =?us-ascii?Q?4JwJAKZAeFxwMzUOxSHXRISRWCWBi3DTSQiWIqxoYnpyJ/tD9gJvOWFEd26s?=
 =?us-ascii?Q?k9vK3yQlZDXK+tyI5TWE3fvqT4aqwgNMeJD2c7540wnI87z5/iZklYkk5Co9?=
 =?us-ascii?Q?UyzxscxiqlLkbMC0ZUV2La0zxwtAFnmqvsQbUyssDNjARjDrH2z1RoF9STyq?=
 =?us-ascii?Q?z/Y8AGyiBDbnSqgJ01/YqXPe/zCglNUKOnV/Deh6rYe3Tb0CVFsbuVg5vhr/?=
 =?us-ascii?Q?Qy859txeYkJU/M6SJP1ojN6gOZubeJwgjfg+6IPPwG/PeanS20az83icCZ6Z?=
 =?us-ascii?Q?68DFqlR0W5NVSytT4R/qL5V1BsOHH+BmCipGaV5/jJ/nBlTzDhlqd7S6aAfc?=
 =?us-ascii?Q?Q2rlUmBgRPaZ1qrWNFA+QlqKm3r32/y6Qpj8ImmmlN51lEu/iS+P8r82BWV4?=
 =?us-ascii?Q?avMWr88rnFjBeL9siDw0e9BeaKJCj04y3qF35SVaatbDAa2P4G/dENdGEDsx?=
 =?us-ascii?Q?Oe4coU++jmPDddgiEo/hLcj5MGtDnStdnuwYvs4z0V07hEnDwjxsEHOB+JIc?=
 =?us-ascii?Q?Hc5HlHOr4ZMfIYzq408/dOC3a/mO9VD2SCz1eE+KDLS7QPeymCmBAJRTg+i+?=
 =?us-ascii?Q?Jz9h3Dm8JIGbz7hTXiC/N5ANZynei0xU5GiUy3seMO+/JQq7RguGRip2zHSN?=
 =?us-ascii?Q?hPEm3E35fUp4AtDCCT8w2jn6v21Bf7itmXSGfOWI2TTTEapMe6Ao/+vrCu/k?=
 =?us-ascii?Q?EjatAPkNN74OlbsEbIamGlR7gu2kPrLOKucrAqkxv8K0bQ8p4GA4ExVqGvmI?=
 =?us-ascii?Q?YJ1a9nSKzA43tFDvIxZhOuNuEshKJY63ygSRu9gDsrB0BNGC0Cut9ep+PnTQ?=
 =?us-ascii?Q?k+PIbfFJeR1KWXaTqSUVLNuna/BXOnSiVCnVLBbNwRb0VwFgGPq9d04t7WH/?=
 =?us-ascii?Q?O0ii745cOsWlE/RyBEmMDzFGohK48U/Spv1S1VMurXazgzHhMsUuewXYvXwJ?=
 =?us-ascii?Q?3MObOMdKGMVDlV4wDZ4TJHUkOnzd9MxkvLUv17b16wK0jhZ95OBqv93uCTXj?=
 =?us-ascii?Q?Lesi1IhFgGXa4RhiNwEnvyBoPxMUJKITHRug8oxp91jq7gJMZq2mCAKvGLTR?=
 =?us-ascii?Q?2YsoH1Gz1cIElosQZioFZnUzZO5xvFgr9iMHteCDfCtMlUQ7qPaJUZAt346v?=
 =?us-ascii?Q?zKzeMWEOFmMXjcaSv2pNmpfBiAwnbo22sYqDGLnw2t0RYJxm+oG5XwiYcbsi?=
 =?us-ascii?Q?gcwgFqJ0ymZntyqUu/bJpEx+9pEb+vuK4/2UWXrFPqhdV8BDnXaA462AQXMO?=
 =?us-ascii?Q?8DjhvIRh76JTmFA1R3ajLHe8Sesadvyo6tSj?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 09:15:32.8900
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c3411fb-5dce-42d3-ce08-08dd99da5ed3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8495

Use folio_expected_ref_count() instead of open-coded logic in
is_refcount_suitable(). This avoids code duplication and improves
clarity.

Drop is_refcount_suitable() as it is no longer needed.

Suggested-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Shivank Garg <shivankg@amd.com>
---
 mm/khugepaged.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index cc945c6ab3bd..19aa4142bb99 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -548,19 +548,6 @@ static void release_pte_pages(pte_t *pte, pte_t *_pte,
 	}
 }
 
-static bool is_refcount_suitable(struct folio *folio)
-{
-	int expected_refcount = folio_mapcount(folio);
-
-	if (!folio_test_anon(folio) || folio_test_swapcache(folio))
-		expected_refcount += folio_nr_pages(folio);
-
-	if (folio_test_private(folio))
-		expected_refcount++;
-
-	return folio_ref_count(folio) == expected_refcount;
-}
-
 static int __collapse_huge_page_isolate(struct vm_area_struct *vma,
 					unsigned long address,
 					pte_t *pte,
@@ -652,7 +639,7 @@ static int __collapse_huge_page_isolate(struct vm_area_struct *vma,
 		 * but not from this process. The other process cannot write to
 		 * the page, only trigger CoW.
 		 */
-		if (!is_refcount_suitable(folio)) {
+		if (folio_expected_ref_count(folio) != folio_ref_count(folio)) {
 			folio_unlock(folio);
 			result = SCAN_PAGE_COUNT;
 			goto out;
@@ -1402,7 +1389,7 @@ static int hpage_collapse_scan_pmd(struct mm_struct *mm,
 		 * has excessive GUP pins (i.e. 512).  Anyway the same check
 		 * will be done again later the risk seems low.
 		 */
-		if (!is_refcount_suitable(folio)) {
+		if (folio_expected_ref_count(folio) != folio_ref_count(folio)) {
 			result = SCAN_PAGE_COUNT;
 			goto out_unmap;
 		}
@@ -2320,7 +2307,7 @@ static int hpage_collapse_scan_file(struct mm_struct *mm, unsigned long addr,
 			break;
 		}
 
-		if (!is_refcount_suitable(folio)) {
+		if (folio_expected_ref_count(folio) != folio_ref_count(folio)) {
 			result = SCAN_PAGE_COUNT;
 			break;
 		}
-- 
2.34.1

