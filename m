Received: from invmail3.skhynix.com (exvmail3.skhynix.com [166.125.252.90])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DCF12561DC
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 07:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747035419; cv=none; b=Nn6hn4Mx1G6oWt645/ta+KjmvwJYj0f8GCNs4i06r6oP4HRZSpeiKg1efP0K7n7qvjj97+lIflhE6BjuSTnhzcThz3JOY3+pKKnhgFz1pa8Z2x54698A6QOqaIhUEyCIpw9Pc4rQGgZCZ6zV1i4Rj9LskTAYYuAcL5yA4LEFFUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747035419; c=relaxed/simple;
	bh=lHzlKcLG3ltefx1ck4nRL7SpLLOAdHDrvayk94Ccz+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BoO3HcWb1Hf28UMhL8GucyrHUCHprG0dLeU+uRUyMeLvysgSjOQmvsHT4D9uj4gZFo95KRFE3nXAuIERbX5lkHL/bNUzyilaz/zJ+KpNQNlgJpuEfWuYIxDm3SuneiBpt7xeStoWC4XQNKNuEYBYPZiAZ9Zg7Z2eDCsafHUUwrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc59-03fff7000000aab6-b3-6821a50bb9e5
From: "yohan.joung" <yohan.joung@sk.com>
To: jaegeuk@kernel.org,
	chao@kernel.org,
	daehojeong@google.com
Cc: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	pilhyun.kim@sk.com,
	"yohan.joung" <yohan.joung@sk.com>
Subject: [PATCH v5 2/2] f2fs: add ckpt_valid_blocks to the section entry
Date: Mon, 12 May 2025 16:36:10 +0900
Message-ID: <20250512073611.718-2-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250512073611.718-1-yohan.joung@sk.com>
References: <20250512073611.718-1-yohan.joung@sk.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrILMWRmVeSWpSXmKPExsXC9ZZnkS73UsUMg18TpC1OTz3LZDG1fS+j
	xZP1s5gtLi1yt7i8aw6bA6vHgk2lHptWdbJ57F7wmcnj8ya5AJYoLpuU1JzMstQifbsErozG
	Ax9ZCn5ZVKzvOc7UwPhBr4uRk0NCwETi+KktjF2MHGD2/S2yIGE2AQ2JP729zCC2iICTxP8b
	7exdjFwczAJtjBLtR5tYQRLCAh4S51//ZQKxWQRUJTrnbwKL8wqYSjy6+Y4NYr6mxI4v58Fq
	OAXMJD5eecICYgsB1by/vpQdol5Q4uRMiDizgLxE89bZzCDLJAQ62CSerd3GBDFIUuLgihss
	Exj5ZyHpmYWkZwEj0ypGkcy8stzEzBxjveLsjMq8zAq95PzcTYzAgFxW+ydyB+O3C8GHGAU4
	GJV4eBPWKmQIsSaWFVfmHmKU4GBWEuGdyiCfIcSbklhZlVqUH19UmpNafIhRmoNFSZzX6Ft5
	ipBAemJJanZqakFqEUyWiYNTqoHR5HG1GNOytGf8kY8Wi/AL5er1PTuXztydIjY5XIPxz4W/
	a+2tFKp2L/1z3IknTXsev+Jqhewft6QNsu6KFzi+DTPcd1or9A9L0NqXnKr7P0dsmHaTo1p5
	i5LNeW3rsxJTGaIi1f738ffL9NsWvP+i8LLRquXtnEzG0pXFR0L6BWv769XlApVYijMSDbWY
	i4oTAZxUFPNEAgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFLMWRmVeSWpSXmKPExsXCNUNlji73UsUMg1dneC1OTz3LZDG1fS+j
	xZP1s5gtLi1yt7i8aw6bxYS5V5ks3m+9x+jA7rFgU6nHplWdbB67F3xm8vh228Pj8ya5ANYo
	LpuU1JzMstQifbsErozGAx9ZCn5ZVKzvOc7UwPhBr4uRg0NCwETi/hbZLkZODjYBDYk/vb3M
	ILaIgJPE/xvt7F2MXBzMAm2MEu1Hm1hBEsICHhLnX/9lArFZBFQlOudvAovzCphKPLr5jg3E
	lhDQlNjx5TxYDaeAmcTHK09YQGwhoJr315eyQ9QLSpycCRFnFpCXaN46m3kCI88sJKlZSFIL
	GJlWMYpk5pXlJmbmmOkVZ2dU5mVW6CXn525iBIbYsto/k3YwfrvsfohRgINRiYc3Ya1ChhBr
	YllxZe4hRgkOZiUR3qkM8hlCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeb3CUxOEBNITS1KzU1ML
	UotgskwcnFINjFwxu/7sXDvtupXtmYWJkWfKfuX1TK9o9WvQXVNambbWT8prtp+07K+b7xX1
	Ut8v1Z/yfJnd5uw/oj5r7sju6/GXzPd9GdLjb92SaPRi8vpisVzFR8bXTrHsFVwezbP261Gx
	eb9cLKIEn3jxeLbf49TqrHt4ZOcqM/PwqUELN7qzngsX17ucp8RSnJFoqMVcVJwIACLT+Ict
	AgAA
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
 fs/f2fs/segment.c | 45 ++++++++++++++++++++++++++++++------
 fs/f2fs/segment.h | 58 ++++++++++++++++++++++++++++++++++++++---------
 2 files changed, 85 insertions(+), 18 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 671bc5a8fd4a..5ff0111ed974 100644
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
@@ -2492,15 +2492,21 @@ static int update_sit_entry_for_release(struct f2fs_sb_info *sbi, struct seg_ent
 				f2fs_test_and_clear_bit(offset + i, se->discard_map))
 			sbi->discard_blks++;
 
-		if (!f2fs_test_bit(offset + i, se->ckpt_valid_map))
+		if (!f2fs_test_bit(offset + i, se->ckpt_valid_map)) {
 			se->ckpt_valid_blocks -= 1;
+			if (__is_large_section(sbi))
+				get_sec_entry(sbi, segno)->ckpt_valid_blocks -= 1;
+		}
 	}
 
+	if (__is_large_section(sbi))
+		sanity_check_valid_blocks(sbi, segno);
+
 	return del;
 }
 
 static int update_sit_entry_for_alloc(struct f2fs_sb_info *sbi, struct seg_entry *se,
-				block_t blkaddr, unsigned int offset, int del)
+				unsigned int segno, block_t blkaddr, unsigned int offset, int del)
 {
 	bool exist;
 #ifdef CONFIG_F2FS_CHECK_FS
@@ -2533,12 +2539,21 @@ static int update_sit_entry_for_alloc(struct f2fs_sb_info *sbi, struct seg_entry
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
+
+	if (__is_large_section(sbi))
+		sanity_check_valid_blocks(sbi, segno);
 
 	return del;
 }
@@ -2569,9 +2584,9 @@ static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
 
 	/* Update valid block bitmap */
 	if (del > 0) {
-		del = update_sit_entry_for_alloc(sbi, se, blkaddr, offset, del);
+		del = update_sit_entry_for_alloc(sbi, se, segno, blkaddr, offset, del);
 	} else {
-		del = update_sit_entry_for_release(sbi, se, blkaddr, offset, del);
+		del = update_sit_entry_for_release(sbi, se, segno, blkaddr, offset, del);
 	}
 
 	__mark_sit_entry_dirty(sbi, segno);
@@ -4708,6 +4723,12 @@ void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 						&raw_sit->entries[sit_offset]);
 			}
 
+			/* update ckpt_valid_block */
+			if (__is_large_section(sbi)) {
+				set_ckpt_valid_blocks(sbi, segno);
+				sanity_check_valid_blocks(sbi, segno);
+			}
+
 			__clear_bit(segno, bitmap);
 			sit_i->dirty_sentries--;
 			ses->entry_cnt--;
@@ -5029,6 +5050,16 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
 	}
 	up_read(&curseg->journal_rwsem);
 
+	/* update ckpt_valid_block */
+	if (__is_large_section(sbi)) {
+		unsigned int segno;
+
+		for (segno = 0; segno < MAIN_SEGS(sbi); segno += SEGS_PER_SEC(sbi))
+			set_ckpt_valid_blocks(sbi, segno);
+
+		sanity_check_valid_blocks(sbi, segno);
+	}
+
 	if (err)
 		return err;
 
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 5777b385e7d2..db619fd2f51a 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -211,6 +211,7 @@ struct seg_entry {
 
 struct sec_entry {
 	unsigned int valid_blocks;	/* # of valid blocks in a section */
+	unsigned int ckpt_valid_blocks; /* # of valid blocks last cp in a section */
 };
 
 #define MAX_SKIP_GC_COUNT			16
@@ -347,22 +348,57 @@ static inline unsigned int get_valid_blocks(struct f2fs_sb_info *sbi,
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
 
-		for (i = 0; i < SEGS_PER_SEC(sbi); i++, start_segno++) {
-			struct seg_entry *se = get_seg_entry(sbi, start_segno);
+static inline void set_ckpt_valid_blocks(struct f2fs_sb_info *sbi,
+		unsigned int segno)
+{
+	unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
+	unsigned int start_segno = GET_SEG_FROM_SEC(sbi, secno);
+	unsigned int blocks = 0;
+	int i;
 
-			blocks += se->ckpt_valid_blocks;
-		}
-		return blocks;
+	for (i = 0; i < SEGS_PER_SEC(sbi); i++, start_segno++) {
+		struct seg_entry *se = get_seg_entry(sbi, start_segno);
+
+		blocks += se->ckpt_valid_blocks;
 	}
-	return get_seg_entry(sbi, segno)->ckpt_valid_blocks;
+	get_sec_entry(sbi, segno)->ckpt_valid_blocks = blocks;
 }
 
+#ifdef CONFIG_F2FS_CHECK_FS
+static inline void sanity_check_valid_blocks(struct f2fs_sb_info *sbi,
+		unsigned int segno)
+{
+	unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
+	unsigned int start_segno = GET_SEG_FROM_SEC(sbi, secno);
+	unsigned int blocks = 0;
+	int i;
+
+	for (i = 0; i < SEGS_PER_SEC(sbi); i++, start_segno++) {
+		struct seg_entry *se = get_seg_entry(sbi, start_segno);
+
+		blocks += se->ckpt_valid_blocks;
+	}
+
+	if (blocks != get_sec_entry(sbi, segno)->ckpt_valid_blocks) {
+		f2fs_err(sbi,
+			"Inconsistent ckpt valid blocks: "
+			"seg entry(%d) vs sec entry(%d) at secno %d",
+			blocks, get_sec_entry(sbi, segno)->ckpt_valid_blocks, secno);
+		f2fs_bug_on(sbi, 1);
+	}
+}
+#else
+static inline void sanity_check_valid_blocks(struct f2fs_sb_info *sbi,
+			unsigned int segno)
+{
+}
+#endif
 static inline void seg_info_from_raw_sit(struct seg_entry *se,
 					struct f2fs_sit_entry *rs)
 {
-- 
2.33.0

