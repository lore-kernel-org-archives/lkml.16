Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2080.outbound.protection.outlook.com [40.107.244.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A075D223DEF
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 09:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747991784; cv=fail; b=pXSCE3FtOCa5UGrafABHM8Wgmfod7B2PCSoggFesS8gCqX2CgFh3BQWrFFTDyExMsK6YNVwU8A29wrcoeRlhh1fyOtcTkUcInX2Z+fwqwoIgA+mVPPErJvLfNN3oXkcb3dohJBmRVLhBLhYWW2WkUZnXemt4FHkxd6QHdufmrLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747991784; c=relaxed/simple;
	bh=ayitEm2qjO6sQhd1Ic7bPkZ3adiBCljy4qMbBsX+AJ4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qTxg3vuHLnNPRkvKkjp2LS5ikTmVcZVUnRRcSWZm86TLw+WuWtLwRirl/n/9slUgE6YdStYPnN71wwKOiWnuw/bDSLg7B36+b6U+6eo2b3PRg2tcowXIEitxIpYOaSMGv04yjTatH7gEA3WOXc3emfztBusjZtl5zXvWnOikf8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pG7XibBq; arc=fail smtp.client-ip=40.107.244.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pG7XibBq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gRJ1ymLnlidxpPZiyUsgoi+rfKszmlxV97rUVdQj3DGlv7qqw+QsD2obvN4wzOv8eDgPhgTBl5kbTNyFxtV5D2v/C92+jJ7OoAWCzN7+zeThaXHIrNtFYigluxOpVKSU7pLOr45j3ZsaeGQ4j5LwfRLNilvTzbYBjjNgdVBhlOJkGlUKERwmgYWyFDOIrfKu4lQhVafF96Bh/rVG3LLdCHXzn95Mzy/xjCE27oVHinJIcRKi2FCzF7L9F5NXOUD5zncmsknwbNuNIrdeF8nwiTzpuBa7EPQGtczs97imB3ItTylhLjJNmSVreUUwTQUJZCmAb+QZlhDDo//AG29apg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AAzfTKqh0DqMc5/o6rZDZ2MKKMyZCiSkUtvJV4HYEuw=;
 b=UgdZJW4yS9oI1lIeJiIkM80qQ0trQnsAUfEs+RJQIZ/+m13aAthKPUbP+M3LPFkNx9QjgPF+3n4Ast9XmrcdRfh0mJyWI5Dk4qIsWz2aJrhIjO0H7BXJuSNocQqXrxneDAquQ5wzyanP7NdYdIN628dtNstLC+CE9PqCl+HC5ffRJFkeIliV8/IXbhITmhaPy3virz1tpxNiGPAN4X3zX8LtYJDhOBfg+jBjvitm6Uvy4PyvKK9q72GKWK/9EGXbUgoCm1IXtawTpRd5Tc0wUSqJD3UpeFMakNtKZcwTErSP9U/xlGrls+PIL5bxrCoCvygxEUdhoAb/a6lJw2VUgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AAzfTKqh0DqMc5/o6rZDZ2MKKMyZCiSkUtvJV4HYEuw=;
 b=pG7XibBqFboyAkDEkNbdlSg5531NSfyKxWVeFJfeILSDTVpIEqL7twpwkpqeuUas4uykxVkknblt5PJlxxxa8UJJb5HP/6v2vYeTmwR1V/9TGGkywiOBnaZVKLE4x/oDEzMBUrDfKnAaRjoWC8ziGKwfwk43U+slQr2KWb6xqag=
Received: from BN9PR03CA0118.namprd03.prod.outlook.com (2603:10b6:408:fd::33)
 by IA0PR12MB8714.namprd12.prod.outlook.com (2603:10b6:208:488::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Fri, 23 May
 2025 09:16:15 +0000
Received: from BN1PEPF0000468A.namprd05.prod.outlook.com
 (2603:10b6:408:fd:cafe::2a) by BN9PR03CA0118.outlook.office365.com
 (2603:10b6:408:fd::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Fri,
 23 May 2025 09:16:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF0000468A.mail.protection.outlook.com (10.167.243.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Fri, 23 May 2025 09:16:15 +0000
Received: from kaveri.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 May
 2025 04:16:10 -0500
From: Shivank Garg <shivankg@amd.com>
To: <akpm@linux-foundation.org>, <david@redhat.com>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>
CC: <ziy@nvidia.com>, <baolin.wang@linux.alibaba.com>,
	<lorenzo.stoakes@oracle.com>, <Liam.Howlett@oracle.com>, <npache@redhat.com>,
	<ryan.roberts@arm.com>, <dev.jain@arm.com>, <fengwei.yin@intel.com>,
	<shivankg@amd.com>, <bharata@amd.com>,
	<syzbot+2b99589e33edbe9475ca@syzkaller.appspotmail.com>
Subject: [PATCH V2 2/2] mm/khugepaged: fix race with folio split/free using temporary reference
Date: Fri, 23 May 2025 09:14:35 +0000
Message-ID: <20250523091432.17588-2-shivankg@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250523091432.17588-1-shivankg@amd.com>
References: <20250523091432.17588-1-shivankg@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468A:EE_|IA0PR12MB8714:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eaa3422-f99e-46fa-317e-08dd99da7812
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|36860700013|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cTIIG0SGheHVUyMENNouZrbWsqj1Z4x5mEHAN9bg4DnoBxDG69wJOboR8LdG?=
 =?us-ascii?Q?At84o8xiQs9mEcxInBjn3bPqmlbRNwIRyNCF2rjdXWYgBUe2+kHSuCEpf0/j?=
 =?us-ascii?Q?yfS6YKhdj+qUzPtpHfSkGvM6tfuJmTgbHxf5CPuSzJCeEU9ZCxuwTsQA95Io?=
 =?us-ascii?Q?LGyjdDElsNwSNIf3fv2YpCVWY1axLbyunOfG+NXlgb43lpdrVbIE+9S7WlvL?=
 =?us-ascii?Q?yNyHvEMRWYVU6y/QIt+d1LpPqoW5Stbd/Jk1YHs4t6bAt48+nhwH7xvbJetE?=
 =?us-ascii?Q?ERfp1X/Stv3s0z4k0rJ9tFm2B9Zj23O5iWAv12N9KRXpYUsI+DRhDsJaRv3s?=
 =?us-ascii?Q?SlKnvhJwW1ZqAfCPQVz8Q963qtQp2d/gRqRavxZ+lVi7VxJV5yYFQnk2zEEk?=
 =?us-ascii?Q?1pDZj4KvcRS61c2ZntPZjccnF8F2GEa9E7Z+aUPotCQ9lgUK7CzJYOIcHXlj?=
 =?us-ascii?Q?VJufseaPtTh+3sw1ZEQk6ZnhhDYJBwLlamwc6pUuFZpyRUhsWLqwvEPVlBEW?=
 =?us-ascii?Q?dd6hHFr3z6qaMEYWEamzA2Dcr3YTUystwP53m4QoBzBEB2PPHbiQyLuplA4K?=
 =?us-ascii?Q?0FlcRJc878pMTxJoMVW1gENG6RWaQjwo/LZwwZ7PHkMmkIUqGkFCw0HUye8f?=
 =?us-ascii?Q?pM4RwYtS2oBhhRYy32y8oFR8HyP6nHOocGX61T3qfuZ/+1NOnna6MGTE+JO2?=
 =?us-ascii?Q?ftl4D3AY0v7ZZZ28QkUHB/laG5A2ToGi7xMTCmdYzkAmbGUO1jDUhqYc8cFE?=
 =?us-ascii?Q?5a8rzr77Lr45mlgRlLEep+PJ5DbAUGfdAzmkrkgZpJmBbJ5JSFfPzh6ICN0f?=
 =?us-ascii?Q?ptrRQyohEEUi8wB1w6U4r8U/EamEcTAuGLvZfM+J8cpmakL0qPzdbRSxnVkG?=
 =?us-ascii?Q?kw7ejvvtDcofx1rAd4eyhXrYO2Re/rncWbI/fxm+zWo7C8DZ+JhaxD8O4g1Q?=
 =?us-ascii?Q?LmLZ/CDL23yXsNOZ0dj/w3M5aBWhtLyse0MDHtpOm5ECfFCGsU1Ie6oOv5L0?=
 =?us-ascii?Q?MFB5S0p8o/N0uyJ1Fo5/sneRB6JubwPk7VNtR1/PSi/af1wnyRDLljTkiZHB?=
 =?us-ascii?Q?+MIyj56ABFk2o+Nb/Q1QuiQUdRriYyNzptlnmGJsj4xpTXjnhXeASBWpPw3U?=
 =?us-ascii?Q?nIfvmEDKmVs2phjZ0ofX8MIr+XSiBLj0N+R7KhUYz+elScXKlOqAJ0OBK9Nr?=
 =?us-ascii?Q?6amMi9595CIejNGG/W7LdEM4n0nxaz3zwfcVKML6Qukr18US8NAfrNoS7dbW?=
 =?us-ascii?Q?hfdhXiRo9VcVWY8xpixeGx0DhF3CC15QU1WwXzxa8VFuvlw9fJEEUU6SZYkR?=
 =?us-ascii?Q?x9FRulzW8JoLQkP3LGyDnbwhKuXVaKSG9VciYANouL1fKKVvIjx3KOennABp?=
 =?us-ascii?Q?kkcYnHgxzOnvDQPopFJs1TeF+XcECNosDeQgf6yD2phYYS76+RwTTtDk2xZU?=
 =?us-ascii?Q?5jNhJY+uNKz40nuIa41Uh3nHZuuAkzamv6IHn3O/mgJTS1DdYD7Njg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(36860700013)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 09:16:15.2388
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eaa3422-f99e-46fa-317e-08dd99da7812
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8714

hpage_collapse_scan_file() calls folio_expected_ref_count(), which in turn
calls folio_mapcount(). folio_mapcount() checks folio_test_large() before
proceeding to folio_large_mapcount(), but there is a race window where the
folio may get split/freed between these checks, triggering:

  VM_WARN_ON_FOLIO(!folio_test_large(folio), folio)

Take a temporary reference to the folio in hpage_collapse_scan_file().
This stabilizes the folio during refcount check and prevents incorrect
large folio detection due to concurrent split/free.

Fixes: 05c5323b2a34 ("mm: track mapcount of large folios in single value")
Reported-by: syzbot+2b99589e33edbe9475ca@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/6828470d.a70a0220.38f255.000c.GAE@google.com
Suggested-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Shivank Garg <shivankg@amd.com>
---
V1: https://lore.kernel.org/linux-mm/20250522093452.6379-1-shivankg@amd.com
---
 mm/khugepaged.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 19aa4142bb99..685eb949f4ce 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -2282,6 +2282,17 @@ static int hpage_collapse_scan_file(struct mm_struct *mm, unsigned long addr,
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
@@ -2292,23 +2303,27 @@ static int hpage_collapse_scan_file(struct mm_struct *mm, unsigned long addr,
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
 
-		if (folio_expected_ref_count(folio) != folio_ref_count(folio)) {
+		if (folio_expected_ref_count(folio) + 1 != folio_ref_count(folio)) {
 			result = SCAN_PAGE_COUNT;
+			folio_put(folio);
 			break;
 		}
 
@@ -2320,6 +2335,7 @@ static int hpage_collapse_scan_file(struct mm_struct *mm, unsigned long addr,
 		 */
 
 		present += folio_nr_pages(folio);
+		folio_put(folio);
 
 		if (need_resched()) {
 			xas_pause(&xas);
-- 
2.34.1

