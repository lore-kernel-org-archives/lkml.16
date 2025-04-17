Received: from invmail3.skhynix.com (exvmail3.skhynix.com [166.125.252.90])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C069199947
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 04:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744863298; cv=none; b=uP0sZey/onwwXC1Yong0l0WYscRz3b2pPy/rljU8oyndw8Ja25O74J+hOqa1qkBwQMJLHkraUdqjpwttCvyKToFtDUX2dxHNEEi6FDbT8hIb0C6AZT/23qWJ2x+/9sGaYtJRWu3zBWy8abHgqTqODRK20ZtlNsRXqqf09E36Coo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744863298; c=relaxed/simple;
	bh=oaHPVz3pUZYhY055WY1iT8B3+zIlB0p8mmYxM9/t35E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l9sR+ZY88PYHisFSAp54YERhApeiBLGVeSVKO3DN1/F/KWrCJmD6Fgz85qZdsRiuSa0/YNJbMlP8F4ELKwkV5NakuW4XcdCh0RwCfVB/6Knr5cocyo/LSIhlfrEuq++xoPFW6VQyhQZZG6/KWgmx06TWlXUl/E6cQsiptD3KFx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc59-03fff7000000aab6-5b-680080351a10
From: "yohan.joung" <yohan.joung@sk.com>
To: jaegeuk@kernel.org,
	chao@kernel.org,
	daeho43@gmail.com
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	pilhyun.kim@sk.com,
	"yohan.joung" <yohan.joung@sk.com>
Subject: [PATCH v3 2/2] f2fs: Integration of migration window granularity with migration Granularity
Date: Thu, 17 Apr 2025 13:14:27 +0900
Message-ID: <20250417041429.2060-2-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250417041429.2060-1-yohan.joung@sk.com>
References: <20250417041429.2060-1-yohan.joung@sk.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrELMWRmVeSWpSXmKPExsXC9ZZnka5pA0OGweT7Bhanp55lsnhz5AyL
	xZP1s5gtLi1yt7i8aw6bA6vHzll32T02repk89i94DOTx+dNcgEsUVw2Kak5mWWpRfp2CVwZ
	W7cuYy+Yol/x7N5HtgbG72pdjJwcEgImEmsvP2WHsZftbmYFsdkENCT+9PYyg9giAnYS3Q3f
	wOLMAm2MErf++oLYwgIpEk82TGEBsVkEVCXmTdoNVsMrYCYxdckiVoiZmhI7vpxnArE5Bcwl
	ts35wAZiCwHVLNi7hAWiXlDi5MwnLBDz5SWat84G2ssF1NvIJnF1bR8TxCBJiYMrbrBMYOSf
	haRnFpKeBYxMqxhFMvPKchMzc4z1irMzKvMyK/SS83M3MQJDclntn8gdjN8uBB9iFOBgVOLh
	PbHof7oQa2JZcWXuIUYJDmYlEd5z5v/ShXhTEiurUovy44tKc1KLDzFKc7AoifMafStPERJI
	TyxJzU5NLUgtgskycXBKNTDWnV5UF7AvMXjjd+mZFhNN2vuuMf5+dOlV0fEPJ/m8T4U3/4sQ
	WL9r8aF3Cbw3rZV4WlJbxbkTbfLvTMwy2X+QK2FPPIfvNYOasB/XfNP/pURu37fonlu08Ftp
	d/9dddN18r6nh3512tIvrLuT+dfv0xubZ5kk9F5ITd993W+2KfeXhZUuZS1KLMUZiYZazEXF
	iQBBxk/cRQIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNLMWRmVeSWpSXmKPExsXCNUNljq5pA0OGwb9DGhanp55lsnhz5AyL
	xZP1s5gtLi1yt7i8aw6bxYS5V5ks3m+9x+jA7rFz1l12j02rOtk8di/4zOTx7baHx+dNcgGs
	UVw2Kak5mWWpRfp2CVwZW7cuYy+Yol/x7N5HtgbG72pdjJwcEgImEst2N7OC2GwCGhJ/enuZ
	QWwRATuJ7oZvYHFmgTZGiVt/fUFsYYEUiScbprCA2CwCqhLzJu0Gq+EVMJOYumQRK8RMTYkd
	X84zgdicAuYS2+Z8YAOxhYBqFuxdwgJRLyhxcuYTFoj58hLNW2czT2DkmYUkNQtJagEj0ypG
	kcy8stzEzBwzveLsjMq8zAq95PzcTYzAIFtW+2fSDsZvl90PMQpwMCrx8J5Y9D9diDWxrLgy
	9xCjBAezkgjvOfN/6UK8KYmVValF+fFFpTmpxYcYpTlYlMR5vcJTE4QE0hNLUrNTUwtSi2Cy
	TBycUg2Mdtyzjn5xrD13MjbG/OSxyVr/bGST3rxedyd8v7x1xZm9QvP5tti4Z57nbw1wD3Xs
	970swlfy2Zdz/ckHZ9auDty2/vYUxk2JgVX7Zh/RuqDm9Ebh3kHGYKvQHeYqV6LPfPB1zw25
	+XWLJ59X0c7be9bandJjlb8w2aDppX/At3K+JVG9/z+pK7EUZyQaajEXFScCANyiQO0uAgAA
X-CFilter-Loop: Reflected

Modify the large section so that only segments
with valid blocks are moved.
Remove Migration Window Granularity by searching
based on segment numbers instead of window search

Signed-off-by: yohan.joung <yohan.joung@sk.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs |  8 --------
 fs/f2fs/gc.c                            | 15 +++++++++------
 fs/f2fs/gc.h                            |  2 +-
 fs/f2fs/super.c                         |  5 ++---
 fs/f2fs/sysfs.c                         |  7 -------
 5 files changed, 12 insertions(+), 25 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 59adb7dc6f9e..b65033730a2c 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -788,14 +788,6 @@ Description:	The zone UFS we are currently using consists of two parts:
 		blkzone_alloc_policy = 2  Prioritize writing to conventional zones
 		========================  =========================================
 
-What:		/sys/fs/f2fs/<disk>/migration_window_granularity
-Date:		September 2024
-Contact:	"Daeho Jeong" <daehojeong@google.com>
-Description:	Controls migration window granularity of garbage collection on large
-		section. it can control the scanning window granularity for GC migration
-		in a unit of segment, while migration_granularity controls the number
-		of segments which can be migrated at the same turn.
-
 What:		/sys/fs/f2fs/<disk>/reserved_segments
 Date:		September 2024
 Contact:	"Daeho Jeong" <daehojeong@google.com>
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index fcd2cf68612d..3496c1523be7 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1750,7 +1750,7 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 	unsigned int segno = start_segno;
 	unsigned int end_segno = start_segno + SEGS_PER_SEC(sbi);
 	unsigned int sec_end_segno;
-	unsigned int window_granularity = 1;
+	unsigned int migration_granularity = sbi->migration_granularity;
 	int seg_freed = 0, migrated = 0;
 	unsigned char type = IS_DATASEG(get_seg_entry(sbi, segno)->type) ?
 						SUM_TYPE_DATA : SUM_TYPE_NODE;
@@ -1773,29 +1773,32 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 					f2fs_usable_segs_in_sec(sbi);
 
 		if (gc_type == BG_GC || one_time) {
-			window_granularity =
-				sbi->migration_window_granularity;
 
 			if (f2fs_sb_has_blkzoned(sbi) &&
 					!has_enough_free_blocks(sbi,
 					sbi->gc_thread->boost_zoned_gc_percent))
-				window_granularity *=
+				migration_granularity *=
 					BOOST_GC_MULTIPLE;
 		}
 
+		if (gc_type == FG_GC) {
+			migration_granularity = sec_end_segno - start_segno;
+		}
+
 		if (end_segno > sec_end_segno)
 			end_segno = sec_end_segno;
 	}
 
 	sanity_check_seg_type(sbi, get_seg_entry(sbi, segno)->type);
 
+
 	for (segno = start_segno; segno < end_segno; segno++) {
 		if (!get_valid_blocks(sbi, segno, false))
 			continue;
 
 		/* readahead multi ssa blocks those have contiguous address */
 		f2fs_ra_meta_pages(sbi, GET_SUM_BLOCK(sbi, segno),
-				window_granularity, META_SSA, true);
+				migration_granularity, META_SSA, true);
 
 		/* reference all summary page */
 		sum_page = f2fs_get_sum_page(sbi, segno);
@@ -1806,7 +1809,7 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 		}
 		add_gc_page_entry(&gc_page_list, sum_page, segno);
 		unlock_page(sum_page);
-		if (++gc_list_count >= window_granularity)
+		if (++gc_list_count >= migration_granularity)
 			break;
 	}
 
diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
index 9c8695efe394..5e933c2110d2 100644
--- a/fs/f2fs/gc.h
+++ b/fs/f2fs/gc.h
@@ -33,7 +33,7 @@
 
 #define LIMIT_NO_ZONED_GC	60 /* percentage over total user space of no gc for zoned devices */
 #define LIMIT_BOOST_ZONED_GC	25 /* percentage over total user space of boosted gc for zoned devices */
-#define DEF_MIGRATION_WINDOW_GRANULARITY_ZONED	3
+#define DEF_MIGRATION_GRANULARITY_ZONED	3
 #define BOOST_GC_MULTIPLE	5
 #define ZONED_PIN_SEC_REQUIRED_COUNT	1
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index a3241730fe4f..775a6e3cc6a6 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3890,9 +3890,8 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
 	sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
 	sbi->next_victim_seg[FG_GC] = NULL_SEGNO;
 	sbi->max_victim_search = DEF_MAX_VICTIM_SEARCH;
-	sbi->migration_granularity = SEGS_PER_SEC(sbi);
-	sbi->migration_window_granularity = f2fs_sb_has_blkzoned(sbi) ?
-		DEF_MIGRATION_WINDOW_GRANULARITY_ZONED : SEGS_PER_SEC(sbi);
+	sbi->migration_granularity = f2fs_sb_has_blkzoned(sbi) ?
+		DEF_MIGRATION_GRANULARITY_ZONED : SEGS_PER_SEC(sbi);
 	sbi->seq_file_ra_mul = MIN_RA_MUL;
 	sbi->max_fragment_chunk = DEF_FRAGMENT_SIZE;
 	sbi->max_fragment_hole = DEF_FRAGMENT_SIZE;
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index c69161366467..6a47b9c9c267 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -568,11 +568,6 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 			return -EINVAL;
 	}
 
-	if (!strcmp(a->attr.name, "migration_window_granularity")) {
-		if (t == 0 || t > SEGS_PER_SEC(sbi))
-			return -EINVAL;
-	}
-
 	if (!strcmp(a->attr.name, "gc_urgent")) {
 		if (t == 0) {
 			sbi->gc_mode = GC_NORMAL;
@@ -1085,7 +1080,6 @@ F2FS_SBI_RW_ATTR(gc_pin_file_thresh, gc_pin_file_threshold);
 F2FS_SBI_RW_ATTR(gc_reclaimed_segments, gc_reclaimed_segs);
 F2FS_SBI_GENERAL_RW_ATTR(max_victim_search);
 F2FS_SBI_GENERAL_RW_ATTR(migration_granularity);
-F2FS_SBI_GENERAL_RW_ATTR(migration_window_granularity);
 F2FS_SBI_GENERAL_RW_ATTR(dir_level);
 #ifdef CONFIG_F2FS_IOSTAT
 F2FS_SBI_GENERAL_RW_ATTR(iostat_enable);
@@ -1234,7 +1228,6 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(reserved_segments),
 	ATTR_LIST(max_victim_search),
 	ATTR_LIST(migration_granularity),
-	ATTR_LIST(migration_window_granularity),
 	ATTR_LIST(dir_level),
 	ATTR_LIST(ram_thresh),
 	ATTR_LIST(ra_nid_pages),
-- 
2.33.0

