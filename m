Received: from invmail3.skhynix.com (exvmail3.hynix.com [166.125.252.90])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACB341A3166
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 04:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746161848; cv=none; b=de/KB4CbqoG46xP0/N/+Z7WW5uFXKTEImrhBFSlgdCp/8XWmgNADPvnDHXnwdg5tzFkfherp8sumXtUyYqQuKhiQ8/m1blGWWzse+UPOZVQWDfkljiI9Xsqvn2wGnC/LhUpZkk9H6cHcjRu8QHFQntCij20OpQg0xW+lLdKYGB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746161848; c=relaxed/simple;
	bh=t2mPsg3cNM5tOVeHDbDyZCHdhU9Z6i7g6+yIeQsHgHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=udVpO4KbtxSWi//uk64Lsqdd3elXbgu2+CrmjztzzBI4U92v6Bz/PkkxN7dweLaWlXcCzgYvG5dO+/pOgj0CMi3eHVZhjYlzJWVNCOYF57o7qggKk8kyjry1ndDh5dfVNwkR8nJos9sqz1//WWBb6gQPqfQn85GEuECQavlfM+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc59-057ff7000000aab6-48-68144d21cb0b
From: "yohan.joung" <yohan.joung@sk.com>
To: jaegeuk@kernel.org,
	chao@kernel.org,
	daehojeong@google.com
Cc: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	pilhyun.kim@sk.com,
	"yohan.joung" <yohan.joung@sk.com>
Subject: [PATCH v2 2/2] f2fs: add ckpt_valid_blocks to the section entry
Date: Fri,  2 May 2025 13:41:45 +0900
Message-ID: <20250502044146.552-2-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250502044146.552-1-yohan.joung@sk.com>
References: <20250502044146.552-1-yohan.joung@sk.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrALMWRmVeSWpSXmKPExsXC9ZZnoa6Sr0iGQbe/xempZ5ksprbvZbR4
	sn4Ws8WlRe4Wl3fNYXNg9ViwqdRj06pONo/dCz4zeXzeJBfAEsVlk5Kak1mWWqRvl8CVceLF
	dNaC/zoVn/7cYG9gnKLaxcjJISFgIvHq5z9GGPv/wl8sIDabgIbEn95eZhBbRMBJ4v+NdvYu
	Ri4OZoE2Ron2o02sIAlhAQ+JQw9/gNksAqoSvz79YgOxeQVMJV5cPcIEMVRTYseX80A2Bwen
	gJlEzws7kLAQUMmfPy/ZIcoFJU7OfAK2l1lAXqJ562xmkF0SAh1sEvs372OBmCMpcXDFDZYJ
	jPyzkPTMQtKzgJFpFaNIZl5ZbmJmjrFecXZGZV5mhV5yfu4mRmA4Lqv9E7mD8duF4EOMAhyM
	Sjy8AQXCGUKsiWXFlbmHGCU4mJVEeGMMgEK8KYmVValF+fFFpTmpxYcYpTlYlMR5jb6VpwgJ
	pCeWpGanphakFsFkmTg4pRoYTWx9dy6xepx7e0VsqIp32pvsNfuLjs5K2jV3720xhj0sd9MO
	G5SXzjI557Kl//G1f2bGH1IbL/C+auA9sapxv7J5oaFC8cmDf48YPuL1fST3ekKM+Nw37Q7c
	3T9/5AVKLP//x2LCHX813+UpE6WdHTYsiz+4/3adjurl+EbvtuWzf99WbZ94UImlOCPRUIu5
	qDgRAGjytjdDAgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFLMWRmVeSWpSXmKPExsXCNUNljq6ir0iGwd1Hhhanp55lspjavpfR
	4sn6WcwWlxa5W1zeNYfNYsLcq0wW77feY3Rg91iwqdRj06pONo/dCz4zeXy77eHxeZNcAGsU
	l01Kak5mWWqRvl0CV8aJF9NZC/7rVHz6c4O9gXGKahcjJ4eEgInE/4W/WEBsNgENiT+9vcwg
	toiAk8T/G+3sXYxcHMwCbYwS7UebWEESwgIeEoce/gCzWQRUJX59+sUGYvMKmEq8uHqECWKo
	psSOL+eBbA4OTgEziZ4XdiBhIaCSP39eskOUC0qcnPkEbC+zgLxE89bZzBMYeWYhSc1CklrA
	yLSKUSQzryw3MTPHTK84O6MyL7NCLzk/dxMjMMSW1f6ZtIPx22X3Q4wCHIxKPLwBBcIZQqyJ
	ZcWVuYcYJTiYlUR4YwyAQrwpiZVVqUX58UWlOanFhxilOViUxHm9wlMThATSE0tSs1NTC1KL
	YLJMHJxSDYyyOZ+/LayT2fOoL/e0je1ylbtlFaW2uZeumnz6x7jS5cK/UxqbV8pKsRbs2dSz
	XO6dib/pVA/ddK4e37l6v9tuOp6eyygz88O+wKwvSTc1We6bFW7bdJhFb3Hs7Gv3t7gUL9q8
	fhGHTNKDiuR9Ky8l/RHc49jlx2E7N/CT0+GowD2NyjYKUQFKLMUZiYZazEXFiQAFdf92LQIA
	AA==
X-CFilter-Loop: Reflected

when performing buffered writes in a large section,
overhead is incurred due to the iteration through
ckpt_valid_blocks within the section.
when SEGS_PER_SEC is 128, this overhead accounts for 20% within
the f2fs_write_single_data_page routine.
as the size of the section increases, the overhead also grows.
to handle this problem ckpt_valid_blocks is
added within the section entries.

Test
insmod null_blk.ko nr_devices=1 completion_nsec=1  submit_queues=8
hw_queue_depth=64 max_sectors=512 bs=4096 memory_backed=1
make_f2fs /dev/block/nullb0
make_f2fs -s 128 /dev/block/nullb0
fio --bs=512k --size=1536M --rw=write --name=1
--filename=/mnt/test_dir/seq_write
--ioengine=io_uring --iodepth=64 --end_fsync=1

before
SEGS_PER_SEC 1
2556MiB/s
SEGS_PER_SEC 128
2145MiB/s

after
SEGS_PER_SEC 1
2556MiB/s
SEGS_PER_SEC 128
2556MiB/s

Signed-off-by: yohan.joung <yohan.joung@sk.com>
---
 fs/f2fs/segment.c | 29 ++++++++++++++++++++++-------
 fs/f2fs/segment.h | 29 ++++++++++++++++++-----------
 2 files changed, 40 insertions(+), 18 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 671bc5a8fd4a..09b66a755559 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2447,7 +2447,7 @@ static void update_segment_mtime(struct f2fs_sb_info *sbi, block_t blkaddr,
  * that the consecutive input blocks belong to the same segment.
  */
 static int update_sit_entry_for_release(struct f2fs_sb_info *sbi, struct seg_entry *se,
-				block_t blkaddr, unsigned int offset, int del)
+				unsigned int segno, block_t blkaddr, unsigned int offset, int del)
 {
 	bool exist;
 #ifdef CONFIG_F2FS_CHECK_FS
@@ -2492,15 +2492,18 @@ static int update_sit_entry_for_release(struct f2fs_sb_info *sbi, struct seg_ent
 				f2fs_test_and_clear_bit(offset + i, se->discard_map))
 			sbi->discard_blks++;
 
-		if (!f2fs_test_bit(offset + i, se->ckpt_valid_map))
+		if (!f2fs_test_bit(offset + i, se->ckpt_valid_map)) {
 			se->ckpt_valid_blocks -= 1;
+			if (__is_large_section(sbi))
+				get_sec_entry(sbi, segno)->ckpt_valid_blocks -= 1;
+		}
 	}
 
 	return del;
 }
 
 static int update_sit_entry_for_alloc(struct f2fs_sb_info *sbi, struct seg_entry *se,
-				block_t blkaddr, unsigned int offset, int del)
+				unsigned int segno, block_t blkaddr, unsigned int offset, int del)
 {
 	bool exist;
 #ifdef CONFIG_F2FS_CHECK_FS
@@ -2533,12 +2536,18 @@ static int update_sit_entry_for_alloc(struct f2fs_sb_info *sbi, struct seg_entry
 	 * or newly invalidated.
 	 */
 	if (!is_sbi_flag_set(sbi, SBI_CP_DISABLED)) {
-		if (!f2fs_test_and_set_bit(offset, se->ckpt_valid_map))
+		if (!f2fs_test_and_set_bit(offset, se->ckpt_valid_map)) {
 			se->ckpt_valid_blocks++;
+			if (__is_large_section(sbi))
+				get_sec_entry(sbi, segno)->ckpt_valid_blocks++;
+		}
 	}
 
-	if (!f2fs_test_bit(offset, se->ckpt_valid_map))
+	if (!f2fs_test_bit(offset, se->ckpt_valid_map)) {
 		se->ckpt_valid_blocks += del;
+		if (__is_large_section(sbi))
+			get_sec_entry(sbi, segno)->ckpt_valid_blocks += del;
+	}
 
 	return del;
 }
@@ -2569,9 +2578,9 @@ static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
 
 	/* Update valid block bitmap */
 	if (del > 0) {
-		del = update_sit_entry_for_alloc(sbi, se, blkaddr, offset, del);
+		del = update_sit_entry_for_alloc(sbi, se, segno, blkaddr, offset, del);
 	} else {
-		del = update_sit_entry_for_release(sbi, se, blkaddr, offset, del);
+		del = update_sit_entry_for_release(sbi, se, segno, blkaddr, offset, del);
 	}
 
 	__mark_sit_entry_dirty(sbi, segno);
@@ -5029,6 +5038,12 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
 	}
 	up_read(&curseg->journal_rwsem);
 
+	/* update ckpt_ckpt_valid_block */
+	if (__is_large_section(sbi)) {
+		for (unsigned int segno = 0; segno < MAIN_SEGS(sbi); segno += SEGS_PER_SEC(sbi))
+			set_ckpt_valid_blocks(sbi, segno);
+	}
+
 	if (err)
 		return err;
 
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 345da052f0e1..cabcec5af1ae 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -209,6 +209,7 @@ struct seg_entry {
 
 struct sec_entry {
 	unsigned int valid_blocks;	/* # of valid blocks in a section */
+	unsigned int ckpt_valid_blocks; /* # of valid blocks last cp in a section */
 };
 
 #define MAX_SKIP_GC_COUNT			16
@@ -345,20 +346,26 @@ static inline unsigned int get_valid_blocks(struct f2fs_sb_info *sbi,
 static inline unsigned int get_ckpt_valid_blocks(struct f2fs_sb_info *sbi,
 				unsigned int segno, bool use_section)
 {
-	if (use_section && __is_large_section(sbi)) {
-		unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
-		unsigned int start_segno = GET_SEG_FROM_SEC(sbi, secno);
-		unsigned int blocks = 0;
-		int i;
+	if (use_section && __is_large_section(sbi))
+		return get_sec_entry(sbi, segno)->ckpt_valid_blocks;
+	else
+		return get_seg_entry(sbi, segno)->ckpt_valid_blocks;
+}
+
+static inline void set_ckpt_valid_blocks(struct f2fs_sb_info *sbi,
+		unsigned int segno)
+{
+	unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
+	unsigned int start_segno = GET_SEG_FROM_SEC(sbi, secno);
+	unsigned int blocks = 0;
+	int i;
 
-		for (i = 0; i < SEGS_PER_SEC(sbi); i++, start_segno++) {
-			struct seg_entry *se = get_seg_entry(sbi, start_segno);
+	for (i = 0; i < SEGS_PER_SEC(sbi); i++, start_segno++) {
+		struct seg_entry *se = get_seg_entry(sbi, start_segno);
 
-			blocks += se->ckpt_valid_blocks;
-		}
-		return blocks;
+		blocks += se->ckpt_valid_blocks;
 	}
-	return get_seg_entry(sbi, segno)->ckpt_valid_blocks;
+	get_sec_entry(sbi, segno)->ckpt_valid_blocks = blocks;
 }
 
 static inline void seg_info_from_raw_sit(struct seg_entry *se,
-- 
2.33.0

