Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2056.outbound.protection.outlook.com [40.107.102.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492541C84D7
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 18:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748284208; cv=fail; b=V9bdXqHPWFKVvhPUH6eql721uMIgmL2AZS53jgJUUHEVj/DAffph2tFhzceiXfJQDCKyrRwPGO2cIZrU5+0JCEQZfmP/7AUR9ypclscu2gYtSAvUpURg5YkLVEC+5mafV1B3upHzz6KE3OxNPTBq/rOrazNU8ABrcvl8UvJ8Ulc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748284208; c=relaxed/simple;
	bh=l+K7RWusXzvGPxbOgQcy+uPjW1otPQ2V5uuEH1AkTyQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mRq9ws8K3taMoewQXG2vhNnMtam6D1oH7AwvrrE2l3yRBpBnnGO7EK7hqAtODnM7jRWd0MahpH4ELHGgv3DKC8KnBjJXinzpH+hOWdxk8HlhCbITNHRNpV5/MELB1FPyDpKFufJotFe9DfebPvrMP0+feAwphYqmZOASHyW02Hc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=OjJN15vm; arc=fail smtp.client-ip=40.107.102.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="OjJN15vm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l+3g//8+jmMw/LzSiskqISs7g8uH1nBZ2X/BL2WGqAco97xcb2VoozL4M5s7xFgRBIhs0DFYdVfsfyRvVLBvaKhkOM0rJUrSFhLMolXW/sXzqZ8Jo8dmRiKB5a32JLwHjxTvG0lG/PNgrkRCjGCb7yP/ApK27/TQxo2vGNbsEBZ7rEQlToDlyWZxdVOy3c7f1urOVKSgjyqaDEmmupDmwyRTSeELqbCXm34TuB+cNilNKmjf0JUt5XwmHdttX2SGNogLfxhdaXbiQw4rBDpzqyxk5ou2CIDPvrcweV2gOp8wgPZyMN23FqdtkepQENmrBQY9LMJnQVqOWYRsXVNVNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qKfzagy9Qb9nAWw5WDzckkFJ6iOqDu7Ot/K5put5WVs=;
 b=guFfyDDV1RG2Trqo82hFdznQyZ8yN8vk2lrgmAuSYLDNTYsHoW0aU/ivQ4MDITIFMpVpxr6E9tgNUYR3HlV6dPc31lznQmpSuqCRsNkgbat/UxT3NMLzwssmlIU77OplQJy7MDbbFIzSq8BVppOGcQ1lKobYNNAC7KSV9oowUhIxR5f2k7klyK0ruPg3rQgWlkYEdW8ZBb9XdiO5CXy1ykZpadwCi13+AMGaD2ZsqlKn6wc8qRl8Y4TkHb6tR0W8SmZozm2k+lTdTHcHJM9mkCpA3PaizXYnNgY62AJNl3p1bDRLVBGeyhemGKRUtolfXbVS7Bna9Xo8S0fzTgjC+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qKfzagy9Qb9nAWw5WDzckkFJ6iOqDu7Ot/K5put5WVs=;
 b=OjJN15vmZcKATsO6n+AAwX5jD7DyrMbhX341owLYq03g8hrGFgN0dE69YjMqvg4esBuxBqr7yZpzT6psZQK9d+/Toh0uvZ1OnD+xX0pgdEGJcsrf0Q4NDHt9Kqlkmlb6r0jIVRPOKlkruN1sX4QT6d4IXADtzammFJDe/LNshXI=
Received: from CH2PR11CA0008.namprd11.prod.outlook.com (2603:10b6:610:54::18)
 by DS7PR12MB8346.namprd12.prod.outlook.com (2603:10b6:8:e5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Mon, 26 May
 2025 18:30:02 +0000
Received: from CH1PEPF0000AD7D.namprd04.prod.outlook.com
 (2603:10b6:610:54:cafe::2c) by CH2PR11CA0008.outlook.office365.com
 (2603:10b6:610:54::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Mon,
 26 May 2025 18:30:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7D.mail.protection.outlook.com (10.167.244.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Mon, 26 May 2025 18:30:01 +0000
Received: from kaveri.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 26 May
 2025 13:29:57 -0500
From: Shivank Garg <shivankg@amd.com>
To: <akpm@linux-foundation.org>, <david@redhat.com>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>
CC: <ziy@nvidia.com>, <baolin.wang@linux.alibaba.com>,
	<lorenzo.stoakes@oracle.com>, <Liam.Howlett@oracle.com>, <npache@redhat.com>,
	<ryan.roberts@arm.com>, <dev.jain@arm.com>, <fengwei.yin@intel.com>,
	<shivankg@amd.com>, <bharata@amd.com>,
	<syzbot+2b99589e33edbe9475ca@syzkaller.appspotmail.com>
Subject: [PATCH V3 1/2] mm/khugepaged: fix race with folio split/free using temporary reference
Date: Mon, 26 May 2025 18:28:18 +0000
Message-ID: <20250526182818.37978-1-shivankg@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7D:EE_|DS7PR12MB8346:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a337434-dbca-4611-4f20-08dd9c8353e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|36860700013|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hHmMcYFO8Wk7+CJHYb1IZ3a9e5we7WBaHh3DoNiFErcbyMRPuRHxEiQKvvOb?=
 =?us-ascii?Q?kLJqlVfmG3d+Q858O602DaNvVfQltzxhuTK6FI9utjSoty5+6sEZ0X5nsmfi?=
 =?us-ascii?Q?Pd48u5Uwl1I5tqAEm1iVPfkr15o0OltJIpy2FL4/xSZkdBcKQnj9iK9EJuoO?=
 =?us-ascii?Q?BxyGWZUHoe3LHPXeWsjUB6j7flZB3TIU9W42F1NPTbqwK9zgUGBAAryCA8/V?=
 =?us-ascii?Q?MYq5TR9r0yXVnOWMCfFf4aa7CXS3Jwx8IqOOaH5QhGNJ0ny6CP2rnBzdzSJU?=
 =?us-ascii?Q?rkh1DZ2UJZjYMOBslbLi6rfnp0dCqgidYjX5Fr7R8Tf1GENUFbB/Qi2Xeecp?=
 =?us-ascii?Q?9bqdyw+3sveykSOvNamwRqsWdCBkytGOo202s0s0CcW3PLq7AVWQ/luNbJ4Y?=
 =?us-ascii?Q?eqj7iunPBc1atm7sYLlL6cpMPtXpIqoyMxQZ0cjeq38Pd3ge7/XP6BsefV3e?=
 =?us-ascii?Q?8bPpLI/+qkiC1UrCYa8TiV7QpfAPyRM38Ds4Ui7wcpYR3FcFtE11Zq+yD8ZE?=
 =?us-ascii?Q?IQrrt0Xq/CoQ2FBGdUtdZw0T5wfuHUfMx6hj2JQh0VqwEXHvIx1tXLr7n3PC?=
 =?us-ascii?Q?qXSjN0+mOp2TmRuDkoKBFoi8U9/hz+W8HgG6Tnuv0nudisyXOgBgoNuFUlTY?=
 =?us-ascii?Q?1P6a/UdgFdIwkimXaXVHmNp1pzrJMpOR+iKM8BJHqx4ykt16GFvzYwW4EtkG?=
 =?us-ascii?Q?7p0w7RbRbuxi9VN512sZwG2ElZ9HYHAPFDfwY7VJDaUwWDajzZdx7iFdyG77?=
 =?us-ascii?Q?dIHMqWOBk/5pVrC0YkSzCO7nyauYc+oyLS4VZ5HjQiDb194wJA4uQuJXdqI9?=
 =?us-ascii?Q?1n0XeAhBF6K7YBshpS4Rz3ZZM4eQn0W+2c7EP/llz7pa5V7D/xi7sl0X+LXs?=
 =?us-ascii?Q?bdvtH+nb4jvT1fpjyquF/OhFBqdmfH7/Zt8yL4n81ketRa4d26hruII/1rM+?=
 =?us-ascii?Q?P5+F5jDmjWKyJO1IDBb/p8BnImaheTZW0TL6O+OeLOVqTLn82SDFvjimhVAL?=
 =?us-ascii?Q?v+PiN8A6gYk6P6CX59OD6o+kZTJoTgA2eu8wwKWS7Q5bOEJ06YnHbRLlfVrV?=
 =?us-ascii?Q?Myv88NDkmH4j3sk0uQS0zV+tdCn52makjqEbsMirYxWK602IizWeRETATWVo?=
 =?us-ascii?Q?RE5S1htR7JWCoy6/oqJHmeA71Rt9oEKD8qP/eiR4ZtbcsqEtccgqSishBlqU?=
 =?us-ascii?Q?q+hguUVz03VwmybWAWep0K+h/yoIX4oZ91F+ZkfbVd+1kSXXZ5JXLERm47hP?=
 =?us-ascii?Q?/GrqfdV9gTLJ4Z2HLaSIikHUHB2vOVxKZ0ffaOU6dPY7tcWcepeJKqQv6zXT?=
 =?us-ascii?Q?C88a/B6C7laxgI9Vkm2SgWkXY5/5R03pjxVLYBW4qgieCNSFCZA0Ri7VhvIT?=
 =?us-ascii?Q?Unk1cUUHK5MsZKQclxJk24Qw/ujyHvoh3KtlfnViSrCY6E58Te1bLc7EW6Wy?=
 =?us-ascii?Q?XFFzHCfuWL5vopG/5GhoE3TJU62RLq4kB194fERS6VRqOz+UJW4TdQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(36860700013)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 18:30:01.8289
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a337434-dbca-4611-4f20-08dd9c8353e8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8346

hpage_collapse_scan_file() calls is_refcount_suitable(), which in turn
calls folio_mapcount(). folio_mapcount() checks folio_test_large() before
proceeding to folio_large_mapcount(), but there is a race window where the
folio may get split/freed between these checks, triggering:

  VM_WARN_ON_FOLIO(!folio_test_large(folio), folio)

Take a temporary reference to the folio in hpage_collapse_scan_file().
This stabilizes the folio during refcount check and prevents incorrect
large folio detection due to concurrent split/free. Use helper
folio_expected_ref_count() + 1 to compare with folio_ref_count()
instead of using is_refcount_suitable().

Fixes: 05c5323b2a34 ("mm: track mapcount of large folios in single value")
Reported-by: syzbot+2b99589e33edbe9475ca@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/6828470d.a70a0220.38f255.000c.GAE@google.com
Suggested-by: David Hildenbrand <david@redhat.com>
Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Shivank Garg <shivankg@amd.com>
---
Changes since V2:
- https://lore.kernel.org/linux-mm/20250523091432.17588-1-shivankg@amd.com
- Reorder the patches to bring the fix in first patch and clean-up in second.
---
 mm/khugepaged.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index cc945c6ab3bd..fe1fe7eace54 100644
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
 
-		if (!is_refcount_suitable(folio)) {
+		if (folio_expected_ref_count(folio) + 1 != folio_ref_count(folio)) {
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

