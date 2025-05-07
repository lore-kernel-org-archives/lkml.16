Received: from invmail3.skhynix.com (exvmail3.skhynix.com [166.125.252.90])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 628161D5146
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 04:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746592273; cv=none; b=I7DSfVUfmRYrkDyKb+MZ59Z1E7D66yLBrvdeyEbp4lJQpS0JqGh8KyCJ9jyYKwkZ4RPmrGligWM8qx0Khg3Q4B83tMTnQyEoVfMt7JJRhHRaCBlUmsByb9HdckXzux2wIfWAQ8tWS5uLJZ/eGEJN8z6XS6b/Uvw1ZbkNkf2Ih7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746592273; c=relaxed/simple;
	bh=NB7LvAZy+4B6LLzD2FE3mPnouhhRsVhs6g8ATPxP6rI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qGWYcb6mrIrM7bmoPSHvs6WFBMlt9aRI2duKTXstGocTy38V3z5I+uGJqFZN/rtq7AX8Gn6ElsMqDelpV89+EQCXruvOup2JDaGqOrPmhrboGDwXoBzjlKhAJzjYxcDCPzul/rKIB89RlsbQ9n/+RXl5+hhe1pYI0c3UFCtCaJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc59-057ff7000000aab6-22-681ae1fee4ce
From: "yohan.joung" <yohan.joung@sk.com>
To: jaegeuk@kernel.org,
	chao@kernel.org,
	daehojeong@google.com
Cc: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	pilhyun.kim@sk.com,
	"yohan.joung" <yohan.joung@sk.com>
Subject: [PATCH v3 2/2] f2fs: add ckpt_valid_blocks to the section entry
Date: Wed,  7 May 2025 13:30:37 +0900
Message-ID: <20250507043038.591-2-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250507043038.591-1-yohan.joung@sk.com>
References: <20250507043038.591-1-yohan.joung@sk.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrILMWRmVeSWpSXmKPExsXC9ZZnkS7DI6kMg1Ptahanp55lspjavpfR
	4sn6WcwWlxa5W1zeNYfNgdVjwaZSj02rOtk8di/4zOTxeZNcAEsUl01Kak5mWWqRvl0CV0bP
	bcOC/zoVsy7NZm5gnKLaxcjJISFgIvHr6jdWGHvhuoNMIDabgIbEn95eZhBbRMBJ4v+NdvYu
	Ri4OZoE2Ron2o01gDcICHhL/b79kB7FZBFQlzrz7DWbzCphKLN26hgViqKbEji/nwYZyCphJ
	HD/8kBHEFgKqmfFtExNEvaDEyZlPwOqZBeQlmrfOZgZZJiHQwSbRPH0BI8QgSYmDK26wTGDk
	n4WkZxaSngWMTKsYRTLzynITM3OM9YqzMyrzMiv0kvNzNzECA3JZ7Z/IHYzfLgQfYhTgYFTi
	4T3wUzJDiDWxrLgy9xCjBAezkgjv/ftAId6UxMqq1KL8+KLSnNTiQ4zSHCxK4rxG38pThATS
	E0tSs1NTC1KLYLJMHJxSDYweO3Y/ae0JjXg46Z3/2n2vT5YfVnPzrM+X3le1wjNrvjeb+po/
	76xa/GfUp/SJ33z9KCr28oKgP7+Xba1LqLlrfTNy68NwLZn7H6/M79xS9zLDqunBl1ix6baz
	HT1W2vVcbCx+ZvNaZY/0yRmfjtZbv7HNslq7g30OP9vL1SUN7Q1y7yzKZbcqsRRnJBpqMRcV
	JwIAP2gAYEQCAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFLMWRmVeSWpSXmKPExsXCNUNlju6/h1IZBuv/qFucnnqWyWJq+15G
	iyfrZzFbXFrkbnF51xw2iwlzrzJZvN96j9GB3WPBplKPTas62Tx2L/jM5PHttofH501yAaxR
	XDYpqTmZZalF+nYJXBk9tw0L/utUzLo0m7mBcYpqFyMnh4SAicTCdQeZQGw2AQ2JP729zCC2
	iICTxP8b7exdjFwczAJtjBLtR5tYQRLCAh4S/2+/ZAexWQRUJc68+w1m8wqYSizduoYFYqim
	xI4v58GGcgqYSRw//JARxBYCqpnxbRMTRL2gxMmZT8DqmQXkJZq3zmaewMgzC0lqFpLUAkam
	VYwimXlluYmZOWZ6xdkZlXmZFXrJ+bmbGIEhtqz2z6QdjN8uux9iFOBgVOLhPfBTMkOINbGs
	uDL3EKMEB7OSCO/9+0Ah3pTEyqrUovz4otKc1OJDjNIcLErivF7hqQlCAumJJanZqakFqUUw
	WSYOTqkGRpW1/+acm/i5M8OsasWcubpzyxZsY5x95VzC4eLwaRE20y4vq4yYXjNnxiw+yaOF
	Zj8eL1qZq9agELRDIm9NwbOfJ3d0tlo+bX59Yt/6nlSVoOO/Hj2OO35MUuiuxKYTTz5NrQy9
	Om1HhK6s86TpjZOuTr4VrSqWd8t+xRpmx6NfD7vumdQeoTJXiaU4I9FQi7moOBEASLF83S0C
	AAA=
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
index f5d30f32ebdb..e91d944f003a 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -211,6 +211,7 @@ struct seg_entry {
 
 struct sec_entry {
 	unsigned int valid_blocks;	/* # of valid blocks in a section */
+	unsigned int ckpt_valid_blocks; /* # of valid blocks last cp in a section */
 };
 
 #define MAX_SKIP_GC_COUNT			16
@@ -347,20 +348,26 @@ static inline unsigned int get_valid_blocks(struct f2fs_sb_info *sbi,
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

