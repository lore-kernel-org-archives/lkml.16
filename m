Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2082.outbound.protection.outlook.com [40.107.96.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E083D1EFFA8
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 06:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744870226; cv=fail; b=QPBs4mp8emXgVw55mF41waPP0KYyGIQX8YkleuFY+j/uZDu66WPoQJfmvXnfJqBBovynGPdRDDqsnTdIxUiDLSbFO7fjCwnycWUuJ+NG838CdGGjBBVjmB9nrxwp5O2WnNJFvisg3gYfCZ9Z/Zpfr6fX7G/cqnFGtH7J4QhNPb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744870226; c=relaxed/simple;
	bh=1RR9r1DqNr5V6pa+IRUG2zgCsYfajGzCe3zaOy9hm6A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=se0pJLZtYmSQpQfXzzLwjukBZRe4eh/akk1YPtoiqMDs2BINCsWyVIvrunvoOIwstafpSuyVfWphHdb8+o7CCfCfCYhxOjPNYaYmbgRsfGqybLiSkIOjyZ+YRF0+VxIIhEi0FQr3axva053pr70FIUHy2aNRpsbzH4CrcjOkDxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LOtTnpuE; arc=fail smtp.client-ip=40.107.96.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LOtTnpuE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BopvfqRXp6+d5IZX25j8V70GfERtOIM6ayd0aSKO44XrO9swgyt75Fsk/pQ2EwmP/R8oyXWAUjO1Tbw6HazZjQZqfeEJbtEfnjVe6qr05Kcs03DRntifIzNMdcbD0fYkz9kHhYUUrQFzgqIebSIQ7HZXtEJrFTQhHaLqF7fVaShgjlDnUg7ikD+ILX60KkiTx1AWq3WTvySDxChfP1jUET9h5rjlUAU/Sz5aqDAUjA81LYVwFsfYifcyBRRuIYMm363vEfEBWVPLBubu53yHMY1fyt7z0pgCqT4igHx0JzmmNPFCMu7ou5QXy3SEWi+d6cWGk320XknnXAMOtiiWwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y7QQ4PRCsUbYHEX8v5XuML6LSHV9JQqcocqGFMNAD4Q=;
 b=IW31mlwTKJEkex/Kcrr3mdceHe8deOiQo2vLwCAWqKXXQwKnJXuexH5vNFyuA+egpPwsAiDMBUlzDX1a3ZvUUc+RO8NSzrG00sl3mlurV2FeNsOS6JnnLpM6sQ5o+iNEZGLBZ+DtODszk/9SFRdYZlPy3BN0583Gsk7flHLyPSAvmpifx1dQ1Bjh3OHzpwGP31iG1Na/6sR0FxJo82AsG3TKVh3I2ZdfuG/ZuJRMR492A9/cYeR0mZArUYT5xDTNmnVGBQemuW3dsxVW8wZm9oeYkuDhO8M33SKRq6zznzA9YMXrXimcBqEKOS9WIZndX76vqTw3gHrXE05cS0R1pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y7QQ4PRCsUbYHEX8v5XuML6LSHV9JQqcocqGFMNAD4Q=;
 b=LOtTnpuEB8d7eBcFoRCztiBokv1R9Q2K6EivJmY78tnf/egnenEn3eJ2AZXskcr19EtdhfdNL9gvymcsXauSQaOSdyUYy+mkG0aNt1u8bk5RKrTmFnl8chNaVm/Y+oj2smBQ8+/tW/+TPFTEph/FZKLvJs4SGu19n0K+VBadfR0=
Received: from CYZPR17CA0010.namprd17.prod.outlook.com (2603:10b6:930:8c::12)
 by SJ0PR12MB6927.namprd12.prod.outlook.com (2603:10b6:a03:483::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 06:10:19 +0000
Received: from CY4PEPF0000E9DC.namprd05.prod.outlook.com
 (2603:10b6:930:8c:cafe::91) by CYZPR17CA0010.outlook.office365.com
 (2603:10b6:930:8c::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.22 via Frontend Transport; Thu,
 17 Apr 2025 06:10:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9DC.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 17 Apr 2025 06:10:18 +0000
Received: from kaveri.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Apr
 2025 01:10:12 -0500
From: Shivank Garg <shivankg@amd.com>
To: <shaggy@kernel.org>, <akpm@linux-foundation.org>
CC: <willy@infradead.org>, <shivankg@amd.com>, <david@redhat.com>,
	<wangkefeng.wang@huawei.com>, <jane.chu@oracle.com>, <ziy@nvidia.com>,
	<donettom@linux.ibm.com>, <apopple@nvidia.com>,
	<jfs-discussion@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com>
Subject: [PATCH V3 2/2] jfs: implement migrate_folio for jfs_metapage_aops
Date: Thu, 17 Apr 2025 06:06:34 +0000
Message-ID: <20250417060630.197278-3-shivankg@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417060630.197278-1-shivankg@amd.com>
References: <20250417060630.197278-1-shivankg@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DC:EE_|SJ0PR12MB6927:EE_
X-MS-Office365-Filtering-Correlation-Id: 4df3a607-488c-4968-b090-08dd7d76878b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?llVlJuyOhC0d2yV9c0yIG9ftgooYdUDZPFJND89RECUKc0iIlUnFLeDnKa5h?=
 =?us-ascii?Q?x4Sth66NEyzOs4Sb5yELKXsvUI4Bo1/hAQ4yCM5iX3ArgjDPM+c834JUOtYO?=
 =?us-ascii?Q?zqx13ARmNirG2B1AiVbNqbspVnqi7QW1Q761HKhHKhhy3udjztBTJqH1Hf/q?=
 =?us-ascii?Q?MYxr2x8m6xKwwxWG/JqwcvLlb+GxnI7ZQh46XqW+7FkVUPmmRWeJYTyzgHV/?=
 =?us-ascii?Q?Evt9RjzDw9/ASV4qveYWjbe9/6QtdGW45lpSMtfEGGamZ/VsAX8nLylH/XnX?=
 =?us-ascii?Q?MeVZuPYLhG1yVB+gPg+R1ZJyWDv+GV5Jl/JMNUdKPfOrO46qTTuVnM/tfJ9P?=
 =?us-ascii?Q?C6zFXO+7k+X6OwQh2faDWYC/pmi/lvfaVTtU++EhLuEkW8aH0WlgakrvlkmZ?=
 =?us-ascii?Q?9DhDFI8qMjGfFr/39DPlslFzKrMv9n+o/rvNBR2n4YPAVbk0w40o7JG8IiiT?=
 =?us-ascii?Q?h6SRWwWPgkv+VrVWv1RqV5IKlETRJjE2K3qRUuDINg5VbKsmO9Rg9Zpdx935?=
 =?us-ascii?Q?D/dzYzi6sxNovld6EXsYVHQUOeQtBCx2G8nI3JuzJAXdsX0O8PYP/6VYrpFc?=
 =?us-ascii?Q?7+rth7DSAINqRofskiu62Whd91BzGmGfEEx8izvaMXEsVPHuud56Oi0mUPiZ?=
 =?us-ascii?Q?e2y8f8Yug4Dndj84+VxpQvzm38IqyVnr5JPSx+MxdkmTA0CDZKYLxs1RaiLP?=
 =?us-ascii?Q?NIiWpEz+bCM5Qlpa5lBzFY+IUcWyuQjK4BHrIcOxfx1dGZRFSq1vLrZC5Fa0?=
 =?us-ascii?Q?gTgm67VSigOUacAF42dnf1R2thWUmEjKeD13Q+MXZBDrXksjNpc74STyubfk?=
 =?us-ascii?Q?xW1P+Jfjkp/fJyQQoe4pR8jJjckWbiAV1pqLKDe8TQPqaOPXVgA6S+f/sK0K?=
 =?us-ascii?Q?tBYnjDaxxi9FuJkdtbRwxT9rYW9ANVWCLia3EtX+2a+wuLQuhmy5J5jg9QQH?=
 =?us-ascii?Q?iUdNmqBnr8VDxFEowpFn+PdIiWeDSzuY8IDyGbs3uMBTLm1LbJSggZUgLJqX?=
 =?us-ascii?Q?+h0OkiAP+oGfalnHZ5d+c9u3DC9ycQYXJAE7G5CHN3FwikNQKcmnfFU/E6co?=
 =?us-ascii?Q?FadAo7nZTTMPZoxwtq3TxL87bRhIFvX4gHWtIrcnTfxMu3aD7t+hAFnHhlsb?=
 =?us-ascii?Q?8aDRAK2gRT1O6/xzhiD0dOO+lpF7iqXSO8S/8V00PhGAmLKmVUgBWIx5XYnr?=
 =?us-ascii?Q?dBtn+LnVHKYgPkT0E6R1qBLkzkvGq5la05y6B/Ij2LajDt4sSv3Bg7XxP5ed?=
 =?us-ascii?Q?PSjstar8wD6IQrruQukj1TWSz1Ivt7cm5u4CA6PqAKXbyKKz6D9TA8iT0v8Z?=
 =?us-ascii?Q?jvHwWWDlD0osOVRfyNG7X30tQyi3z8ZtvhOoQerYiymwaPa21X7JieRCQK+C?=
 =?us-ascii?Q?huk0K0aHGDyfK9TKSXRg51S90dwB+NuMGBhIkCNaNgG4+1AxQ0+P3EDXzpM7?=
 =?us-ascii?Q?0n0zGOYMmWTwhWFKixK+TzjL6LFWPrradn2mKR+eBiQ/nBmc4Ei7gwt9Tzk0?=
 =?us-ascii?Q?wnTkAv5d2bUdjcTJPhjiWKinkn4VSCbBOlW4fhoG1X0Lp9EEdqGWSzhPuA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 06:10:18.8607
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4df3a607-488c-4968-b090-08dd7d76878b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6927

Add the missing migrate_folio operation to jfs_metapage_aops to fix
warnings during memory compaction. These warnings were introduced by
commit 7ee3647243e5 ("migrate: Remove call to ->writepage") which
added explicit warnings when filesystems don't implement migrate_folio.

System reports following warnings:
  jfs_metapage_aops does not implement migrate_folio
  WARNING: CPU: 0 PID: 6870 at mm/migrate.c:955 fallback_migrate_folio mm/migrate.c:953 [inline]
  WARNING: CPU: 0 PID: 6870 at mm/migrate.c:955 move_to_new_folio+0x70e/0x840 mm/migrate.c:1007

Implement metapage_migrate_folio which handles both single and multiple
metapages per page configurations.

Fixes: 35474d52c605 ("jfs: Convert metapage_writepage to metapage_write_folio")
Reported-by: syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/67faff52.050a0220.379d84.001b.GAE@google.com
Signed-off-by: Shivank Garg <shivankg@amd.com>
---
 fs/jfs/jfs_metapage.c | 94 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/fs/jfs/jfs_metapage.c b/fs/jfs/jfs_metapage.c
index df575a873ec6..8bf33c0a1b8c 100644
--- a/fs/jfs/jfs_metapage.c
+++ b/fs/jfs/jfs_metapage.c
@@ -15,6 +15,7 @@
 #include <linux/mempool.h>
 #include <linux/seq_file.h>
 #include <linux/writeback.h>
+#include <linux/migrate.h>
 #include "jfs_incore.h"
 #include "jfs_superblock.h"
 #include "jfs_filsys.h"
@@ -151,6 +152,54 @@ static inline void dec_io(struct folio *folio, blk_status_t status,
 		handler(folio, anchor->status);
 }
 
+static int __metapage_migrate_folio(struct address_space *mapping, struct folio *dst,
+				    struct folio *src, enum migrate_mode mode)
+{
+	struct meta_anchor *src_anchor = src->private;
+	struct metapage *mps[MPS_PER_PAGE] = {0};
+	struct metapage *mp;
+	int i, rc;
+
+	for (i = 0; i < MPS_PER_PAGE; i++) {
+		mp = src_anchor->mp[i];
+		if (mp && metapage_locked(mp))
+			return -EAGAIN;
+	}
+
+	rc = filemap_migrate_folio(mapping, dst, src, mode);
+	if (rc != MIGRATEPAGE_SUCCESS)
+		return rc;
+
+	for (i = 0; i < MPS_PER_PAGE; i++) {
+		mp = src_anchor->mp[i];
+		if (!mp)
+			continue;
+		if (unlikely(insert_metapage(dst, mp))) {
+			/* If error, roll-back previosly inserted pages */
+			for (int j = 0 ; j < i; j++) {
+				if (mps[j])
+					remove_metapage(dst, mps[j]);
+			}
+			return -EAGAIN;
+		}
+		mps[i] = mp;
+	}
+
+	/* Update the metapage and remove it from src */
+	for (i = 0; i < MPS_PER_PAGE; i++) {
+		mp = mps[i];
+		if (mp) {
+			int page_offset = mp->data - folio_address(src);
+
+			mp->data = folio_address(dst) + page_offset;
+			mp->folio = dst;
+			remove_metapage(src, mp);
+		}
+	}
+
+	return MIGRATEPAGE_SUCCESS;
+}
+
 #else
 static inline struct metapage *folio_to_mp(struct folio *folio, int offset)
 {
@@ -175,6 +224,32 @@ static inline void remove_metapage(struct folio *folio, struct metapage *mp)
 #define inc_io(folio) do {} while(0)
 #define dec_io(folio, status, handler) handler(folio, status)
 
+static int __metapage_migrate_folio(struct address_space *mapping, struct folio *dst,
+				    struct folio *src, enum migrate_mode mode)
+{
+	struct metapage *mp;
+	int page_offset;
+	int rc;
+
+	mp = folio_to_mp(src, 0);
+	if (mp && metapage_locked(mp))
+		return -EAGAIN;
+
+	rc = filemap_migrate_folio(mapping, dst, src, mode);
+	if (rc != MIGRATEPAGE_SUCCESS)
+		return rc;
+
+	if (unlikely(insert_metapage(dst, mp)))
+		return -EAGAIN;
+
+	page_offset = mp->data - folio_address(src);
+	mp->data = folio_address(dst) + page_offset;
+	mp->folio = dst;
+	remove_metapage(src, mp);
+
+	return MIGRATEPAGE_SUCCESS;
+}
+
 #endif
 
 static inline struct metapage *alloc_metapage(gfp_t gfp_mask)
@@ -554,6 +629,24 @@ static bool metapage_release_folio(struct folio *folio, gfp_t gfp_mask)
 	return ret;
 }
 
+/**
+ * metapage_migrate_folio - Migration function for JFS metapages
+ */
+static int metapage_migrate_folio(struct address_space *mapping, struct folio *dst,
+				  struct folio *src, enum migrate_mode mode)
+{
+	int expected_count;
+
+	if (!src->private)
+		return filemap_migrate_folio(mapping, dst, src, mode);
+
+	/* Check whether page does not have extra refs before we do more work */
+	expected_count = folio_expected_refs(mapping, src);
+	if (folio_ref_count(src) != expected_count)
+		return -EAGAIN;
+	return __metapage_migrate_folio(mapping, dst, src, mode);
+}
+
 static void metapage_invalidate_folio(struct folio *folio, size_t offset,
 				    size_t length)
 {
@@ -570,6 +663,7 @@ const struct address_space_operations jfs_metapage_aops = {
 	.release_folio	= metapage_release_folio,
 	.invalidate_folio = metapage_invalidate_folio,
 	.dirty_folio	= filemap_dirty_folio,
+	.migrate_folio	= metapage_migrate_folio,
 };
 
 struct metapage *__get_metapage(struct inode *inode, unsigned long lblock,
-- 
2.34.1

