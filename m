Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2056.outbound.protection.outlook.com [40.107.220.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44ECC28F5
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745322153; cv=fail; b=fiILzxIi4ZsI81TdV1GIVv15IvKM6/DTzCyOXQPd2TtqkKSNd3QEiMQ37LiCclosTR4LCpbL9Sb1oJy/w//tfYznQML45ZaIz0jHPGfw+LfuU5shdnVFzTtStrCXCVY1r3HNMwtqv5h0N5eC0S2mQNYsnaje4hIHaSFFudlzGFs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745322153; c=relaxed/simple;
	bh=H7xpZcXWzfT9yWC1nnDCz87WH3/B91pmOHLdpSsK27w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ob5X9MFYwizHmTKSQ/u9Rb+CrbwIAJzjs47tmypbaUJ5tIyBfb6XuARjWOTTFEpIfSzPdoJOEEr++wPnDTAhkCaROjvJCcQ7fmR+S9AKBHGXXkbftmHk6oeHibLzHsiizsSCw0WfB2a3RRVU2eFYEkoc/MkWHgTS5xzggEIlszY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bH528QY6; arc=fail smtp.client-ip=40.107.220.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bH528QY6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FkoS9u8sxyIMWCA1yzX9WYKLt1P15D8QAXYxCA+P13rU7gbrWWUrjshIipvYcY1IihP+moOWhPiE1Wi+ablzqCe35+vsr7QxLQe6bFp5fJhol31owSNsUKJUZsX9AZJ7v6o00CYUGIbBBX+zTFEtzXjH1bx913GUkA6jHVidBsZquyPi7plAhaWUNWvKXOcavw0S9kBeC6PRqJNW3hmy9zGwyVsqr89CURyWcan5+wkvA6fxz9wbID9pYLGi3p9BH09gF34PlXduc0vfGVbaC9lER9IIeulK2zfQ3QwjYKL2ynwu+9zzWrLgkvMcpcRbsg5OE8aO2YNJcqwxoxUerg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vjBMSX7mSni0Bs51ARYTQYn0pQLevaIJSAPztRsSPV4=;
 b=eJV2zrP92YcEf+yHlGCIDv2Giy0cD6Fo28TdVTQ9PFMs+VUASRs7cHvoPkaWWlGqQZtLpy3jCyGf646yogmVj5odxH3deqGDWoxldeiLIk0YEcyOab6sFdb4vCY4L70aKQ+GJuKMZbxVtmlKHG97n8qQQCrI88LrjmT3m4voOQmCFV5bL2j8acBMnd3sBvxXMjUghstS/+dWIpF2VikhwVTVWdZOFf9iN9QtNpuotYudftj9EW2OOviloaaModvVPZvcw7iYZ6oAD7YEcD/ip5uWmLlORuxfMqVQHk0pvnyVtGQgRmvaSyOqb/DYrGS+roWUbgxQWxYHHtGKP/3UxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vjBMSX7mSni0Bs51ARYTQYn0pQLevaIJSAPztRsSPV4=;
 b=bH528QY6w++9sryltLWGiBgp3/R2ky3HirwPmhf7TNabQZH5OAbg3XUY2FoI1hK0+zkp9mnt3CztUFuCEHwUxBxd5hDWP+RXHrZ1tdZG11ZFg7D+C20E3BGjZpV7i/bJV/tAwaSB5fALiRoc00/KDh4jBPo3eQlQsRe9tMgJ8ac=
Received: from BYAPR01CA0046.prod.exchangelabs.com (2603:10b6:a03:94::23) by
 CY1PR12MB9583.namprd12.prod.outlook.com (2603:10b6:930:fe::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.35; Tue, 22 Apr 2025 11:42:28 +0000
Received: from SJ1PEPF00001CE0.namprd05.prod.outlook.com
 (2603:10b6:a03:94:cafe::9f) by BYAPR01CA0046.outlook.office365.com
 (2603:10b6:a03:94::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Tue,
 22 Apr 2025 11:42:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE0.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Tue, 22 Apr 2025 11:42:28 +0000
Received: from kaveri.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Apr
 2025 06:42:22 -0500
From: Shivank Garg <shivankg@amd.com>
To: <shaggy@kernel.org>, <akpm@linux-foundation.org>
CC: <willy@infradead.org>, <shivankg@amd.com>, <david@redhat.com>,
	<wangkefeng.wang@huawei.com>, <jane.chu@oracle.com>, <ziy@nvidia.com>,
	<donettom@linux.ibm.com>, <apopple@nvidia.com>,
	<jfs-discussion@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com>
Subject: [PATCH V4 2/2] jfs: implement migrate_folio for jfs_metapage_aops
Date: Tue, 22 Apr 2025 11:40:05 +0000
Message-ID: <20250422114000.15003-3-shivankg@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250422114000.15003-1-shivankg@amd.com>
References: <20250422114000.15003-1-shivankg@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE0:EE_|CY1PR12MB9583:EE_
X-MS-Office365-Filtering-Correlation-Id: 4af24489-d8c7-4a2f-3fea-08dd8192c257
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|7416014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HdR2h6a32pgv+vuoGFIdiBW5cZcvUqCaQ9G4F5oPvjPjhQmL8rjDFMwdQatX?=
 =?us-ascii?Q?bXDHWzgYJCn+WvxbJJwb6au0gIuZkA/iMdfz0YUw8pNJv15SCOEaQfg4Dhqm?=
 =?us-ascii?Q?EsGNQ35fAQQLbEx6rj3Ecfd18fW2FjwAdZnX3rTt8W76JoHNWkUz0uz2Q0yx?=
 =?us-ascii?Q?5VPW5B1FI42xHV98fKpCAiFqOKUwadvQJi8Wjp/lNOdnar1n62ZAvn7eAaII?=
 =?us-ascii?Q?pCVYOMiQrhTXcCuW6mXiC77XhBoNymfJmW5DH0hHeXPM4f2qCbeMfyReRh5+?=
 =?us-ascii?Q?C8s5FIy4F74WXLENZJcvtuK9zI9Q7bWQP8/1eF4qLw7vItSKzTLAeEAdyg3E?=
 =?us-ascii?Q?XbUzKZoWxNtHk+GewrkYdjQLS7ovfXabyYtZrg/duLzatWc6tn5fiVvPhR+7?=
 =?us-ascii?Q?9ZTPTuE0NRCzlxh/cMbf3d+D5rtdAFs8dyVrBMWvtVu/bkRGurKLtIvjk1R/?=
 =?us-ascii?Q?TmCv+/cyAl0C7LISkmC5diN19chyX2huFHrR7lrkmpvWbCjqy+6QE0MSWvnL?=
 =?us-ascii?Q?ze4Y5eudEgw1ZWjgK5rFsUvwIQJGzBbgu1BZznF0QGNtVe0HjlEWkwWNH21Y?=
 =?us-ascii?Q?ViOPUM0LwxOFq3RC8DXCJwyt9imawXoaiA8gS/0h6k0iSdaHajfL2MD8I/FL?=
 =?us-ascii?Q?2YlMx1jDVDd+tDsIG7gZNiqmC8emhvHX/3j/SZa+IHGnP+xu7qZ95Y3SeyCo?=
 =?us-ascii?Q?I6Er1PzjMx+IHBRT0YumN5vZCoeq1U65yl4kTEZQBmCu+u6JIlcnBwgrg9uG?=
 =?us-ascii?Q?2uIVfd79I3XQ7krmv3LkziIb8qofsikCUEtDGxlv/TpfmqC9JI1aWNwnzrXm?=
 =?us-ascii?Q?QRlqfUVgfaqyuEbktRGTguazDH4WHqFxenAxixIAY76Ss9bd0BVY0vhHJTpt?=
 =?us-ascii?Q?SpCJgn+ahgES8+ZdndFdkah+8f8XSJ0UZYsaZ6Ku0E5otQ9yhguPtHlWCPSI?=
 =?us-ascii?Q?25ykFN8JNuBJgKlo59cXFPu3FxJqYu09kvJdNmXjzaOO+7h54W0cn0Xn0GPq?=
 =?us-ascii?Q?GT6pZtzuHXa445k77tZ2KbYaWrSFGoVJSHjU+4mmLDGG17lPzobv+QQLwVY7?=
 =?us-ascii?Q?WrOrHPg189vHFHcuilk8tk5fAPrS/rEZaMWHgLAYeEcGAheeFXjSoo6aXnaT?=
 =?us-ascii?Q?9cpzU0gHpS2mRUbAn9g5KasoNNYaKewwzoa9Vky8CqfXRHJmkPi1UlUKiVc9?=
 =?us-ascii?Q?3iwwwccWByzyLmwjF0xQiyW0a7EuvNSHRI1g+FY68htwG5JW/o4CIPUv0fQw?=
 =?us-ascii?Q?omJUr0vOpy4Xw6pnOtT+dK63KwQLsMRsZcVZkpg6awMlu2wu/WG1BtRnST59?=
 =?us-ascii?Q?IMFQXzYjrKWC8FYb1TC6248KI7M5WeHQrSTwfWMZTaPjYnlpuvgpVqhPX/6R?=
 =?us-ascii?Q?Wp1h8+Grw/eGF+7wmCTcmodvyUHCxRrwBPtYanZRC0LOonk0ch7zBp1h+uwx?=
 =?us-ascii?Q?aU8aGbmlJa/lEkTq4kcsADtSaGVZeZuT6ytb3LihfqcYrT5NJX7BgBeFaFzB?=
 =?us-ascii?Q?+cVdv/B6GKphmsw6gZbMVaKiXHeqhspd6zkxcqp7E5IrEhNVfArq+/M5ZA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(7416014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 11:42:28.0778
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4af24489-d8c7-4a2f-3fea-08dd8192c257
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9583

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
index df575a873ec6..a12fbd92cc69 100644
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
+	expected_count = folio_migration_expected_refs(mapping, src);
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

