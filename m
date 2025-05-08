Received: from invmail3.skhynix.com (exvmail3.skhynix.com [166.125.252.90])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1B7F215F41
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 07:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746690500; cv=none; b=InpqV/8PADXmPheaMtN2ehjiCcEVK5Y+y6jTxfKrKIf+O2F5zxLvxhtfuFQdd5UT9WSIVS/hd2NkBTNJfQ8hGXRHiXq8UbMevgca11ZQtX4+P1gRMWRZo1z/q99e/ttboADOB8fBiuRH5BO315Mfh94DGBRJjH5E77MKnpU7D/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746690500; c=relaxed/simple;
	bh=TtdqIUEYjXcMTuPnGG8Is3QfKnZXrWlI7F4wmJf/KOY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R+ENr+K2MeKuYvbKlO4ZDPmT9PJytkLxd5mlvHK+RDA8KiwhKpZVoWceyYSVmb9pJVj1N6gLczfFhm1ExMtgTjnvX5JoJaE+/dukLJFFyPkNkMgNFgbh6EsPIeW3B83jOSvVRR7M2ci8l7foUS4nFt89ChppU48bxOxU2Tl07Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc59-03fff7000000aab6-bd-681c61b29f13
From: "yohan.joung" <yohan.joung@sk.com>
To: jaegeuk@kernel.org,
	chao@kernel.org,
	daehojeong@google.com
Cc: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	pilhyun.kim@sk.com,
	"yohan.joung" <yohan.joung@sk.com>
Subject: [PATCH v4 2/2] f2fs: add ckpt_valid_blocks to the section entry
Date: Thu,  8 May 2025 16:47:55 +0900
Message-ID: <20250508074756.693-2-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250508074756.693-1-yohan.joung@sk.com>
References: <20250508074756.693-1-yohan.joung@sk.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrILMWRmVeSWpSXmKPExsXC9ZZnke6mRJkMg5YT5hanp55lspjavpfR
	4sn6WcwWlxa5W1zeNYfNgdVjwaZSj02rOtk8di/4zOTxeZNcAEsUl01Kak5mWWqRvl0CV8bF
	CQfYC7ZZVWx5uZO5gbHNoIuRk0NCwETiZPttZhj70MPpjCA2m4CGxJ/eXrC4iICTxP8b7exd
	jFwczAJtjBLtR5tYQRLCAh4SnQe/gDWwCKhKzOv8x9bFyMHBK2AqsfSTCMRMTYkdX84zgdic
	AmYSR/9cASsXAipZ8H0DG4jNKyAocXLmExYQm1lAXqJ562xmkF0SAj1sEmuWrGCBGCQpcXDF
	DZYJjPyzkPTMQtKzgJFpFaNIZl5ZbmJmjrFecXZGZV5mhV5yfu4mRmBALqv9E7mD8duF4EOM
	AhyMSjy8Dt7SGUKsiWXFlbmHGCU4mJVEeIsagUK8KYmVValF+fFFpTmpxYcYpTlYlMR5jb6V
	pwgJpCeWpGanphakFsFkmTg4pRoYF7I/WNfGeLL5SpVBePHFiG92971u2dk6Zywqdaucq3Ly
	x5yfsX6TKmYyxgW3HNroxWp6N3yjJENk4YXvGywlmtbOW6/9SXptTkTFydZP3acvNj+/3HWu
	6/fDvPlFPn2Sm6KPBjA+Xe22l0NabH77mlOrDjSvms13oSq/aknGviPyXJ0t0XfqlFiKMxIN
	tZiLihMBn6W0B0QCAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFLMWRmVeSWpSXmKPExsXCNUNlju6mRJkMg0/7DSxOTz3LZDG1fS+j
	xZP1s5gtLi1yt7i8aw6bxYS5V5ks3m+9x+jA7rFgU6nHplWdbB67F3xm8vh228Pj8ya5ANYo
	LpuU1JzMstQifbsEroyLEw6wF2yzqtjycidzA2ObQRcjJ4eEgInEoYfTGUFsNgENiT+9vcwg
	toiAk8T/G+3sXYxcHMwCbYwS7UebWEESwgIeEp0Hv4A1sAioSszr/MfWxcjBwStgKrH0kwjE
	TE2JHV/OM4HYnAJmEkf/XAErFwIqWfB9AxuIzSsgKHFy5hMWEJtZQF6ieets5gmMPLOQpGYh
	SS1gZFrFKJKZV5abmJljplecnVGZl1mhl5yfu4kRGGLLav9M2sH47bL7IUYBDkYlHl5Hb+kM
	IdbEsuLK3EOMEhzMSiK8RY1AId6UxMqq1KL8+KLSnNTiQ4zSHCxK4rxe4akJQgLpiSWp2amp
	BalFMFkmDk6pBsaGf2YpzQ8WKNmeX3H8joyVHPt25yqVHd3/5s8IfXu9T8/aeuOkY2aac9Ub
	83+efOx+3vjEnkcfBL7Z6iyfIHRLsYuj8JClV8muzHtBDnsfXr6/V66Ev+tBe/2FZ5MurynY
	u2XvgvAlmxzUj9uv2R5V0RZ86eqVq8K72H5vrF7ffKCeafaBP7MclFiKMxINtZiLihMBFdQ4
	Hi0CAAA=
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
 fs/f2fs/segment.c | 41 +++++++++++++++++++++++++++++-------
 fs/f2fs/segment.h | 53 +++++++++++++++++++++++++++++++++++++----------
 2 files changed, 76 insertions(+), 18 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 671bc5a8fd4a..7a53f2d8a474 100644
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
@@ -2492,15 +2492,22 @@ static int update_sit_entry_for_release(struct f2fs_sb_info *sbi, struct seg_ent
 				f2fs_test_and_clear_bit(offset + i, se->discard_map))
 			sbi->discard_blks++;
 
-		if (!f2fs_test_bit(offset + i, se->ckpt_valid_map))
+#ifdef CONFIG_F2FS_CHECK_FS
+		if (__is_large_section(sbi))
+			sanity_check_valid_blocks(sbi, segno);
+#endif
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
@@ -2532,13 +2539,23 @@ static int update_sit_entry_for_alloc(struct f2fs_sb_info *sbi, struct seg_entry
 	 * SSR should never reuse block which is checkpointed
 	 * or newly invalidated.
 	 */
+#ifdef CONFIG_F2FS_CHECK_FS
+	if (__is_large_section(sbi))
+		sanity_check_valid_blocks(sbi, segno);
+#endif
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
@@ -2569,9 +2586,9 @@ static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
 
 	/* Update valid block bitmap */
 	if (del > 0) {
-		del = update_sit_entry_for_alloc(sbi, se, blkaddr, offset, del);
+		del = update_sit_entry_for_alloc(sbi, se, segno, blkaddr, offset, del);
 	} else {
-		del = update_sit_entry_for_release(sbi, se, blkaddr, offset, del);
+		del = update_sit_entry_for_release(sbi, se, segno, blkaddr, offset, del);
 	}
 
 	__mark_sit_entry_dirty(sbi, segno);
@@ -4700,12 +4717,16 @@ void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 					&sit_in_journal(journal, offset));
 				check_block_count(sbi, segno,
 					&sit_in_journal(journal, offset));
+				if (__is_large_section(sbi))
+					set_ckpt_valid_blocks(sbi, segno);
 			} else {
 				sit_offset = SIT_ENTRY_OFFSET(sit_i, segno);
 				seg_info_to_raw_sit(se,
 						&raw_sit->entries[sit_offset]);
 				check_block_count(sbi, segno,
 						&raw_sit->entries[sit_offset]);
+				if (__is_large_section(sbi))
+					set_ckpt_valid_blocks(sbi, segno);
 			}
 
 			__clear_bit(segno, bitmap);
@@ -5029,6 +5050,12 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
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
index 5777b385e7d2..ebc90d3cb57c 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -211,6 +211,7 @@ struct seg_entry {
 
 struct sec_entry {
 	unsigned int valid_blocks;	/* # of valid blocks in a section */
+	unsigned int ckpt_valid_blocks; /* # of valid blocks last cp in a section */
 };
 
 #define MAX_SKIP_GC_COUNT			16
@@ -347,22 +348,52 @@ static inline unsigned int get_valid_blocks(struct f2fs_sb_info *sbi,
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
+#endif
 static inline void seg_info_from_raw_sit(struct seg_entry *se,
 					struct f2fs_sit_entry *rs)
 {
-- 
2.33.0

