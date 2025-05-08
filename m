Received: from invmail3.skhynix.com (exvmail3.skhynix.com [166.125.252.90])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D92122E40E
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 07:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746690495; cv=none; b=DcO7zIMZFImaa5r04gZJfe3kQ/V8wEJlRdGRukPu1zIOviwD4A7zWlF3ar2DeJ4GkKt1LOYyTIp+4RSYJcnMCWakn9L/gEAkbW3vdsNU1avNMXgBzyoe8jhBYedLbhd7J6M8CCN4pHBmoq0riMmBsbOLIGidIa06+YSkYSscxUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746690495; c=relaxed/simple;
	bh=o3fHYXSX29gp6NajjYFvmoa1IPO4JtSlTwtofFKNh2U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LfkEmXygSYYneLBJaKyayFwoBJ5DkwEeesf7D5NBTowsGzk3A9zt6/IcQ63S7dGvpFaxnmRCQ6kPtt/k3ChEd8I6Cw74Z6VJfnn2YPYgjY2HCSWNgsMlNmEJf02qSsLOHMhu9JncOFi2xdCCdqnmAqL9mTY7fm39fMiITmJX9g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc59-03fff7000000aab6-9b-681c61b00664
From: "yohan.joung" <yohan.joung@sk.com>
To: jaegeuk@kernel.org,
	chao@kernel.org,
	daehojeong@google.com
Cc: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	pilhyun.kim@sk.com,
	"yohan.joung" <yohan.joung@sk.com>
Subject: [PATCH v4 1/2] f2fs: add a method for calculating the remaining blocks in the current segment in LFS mode.
Date: Thu,  8 May 2025 16:47:54 +0900
Message-ID: <20250508074756.693-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBLMWRmVeSWpSXmKPExsXC9ZZnke6GRJkMg9X3dCxOTz3LZDG1fS+j
	xZP1s5gtLi1yt7i8aw6bA6vHgk2lHptWdbJ57F7wmcnj8ya5AJYoLpuU1JzMstQifbsErowZ
	i3pZCjYJVjStqW5gXMzXxcjJISFgIrGkdwc7jH1y4xcmEJtNQEPiT28vM4gtIuAk8f9GO1AN
	FwezQBujRPvRJtYuRg4OYYFiiVObEkFqWARUJbbNeMkIYvMKmErsPPyRGWKmpsSOL+eZIOKC
	EidnPmEBsZkF5CWat85mBpkpIfCWVWL+436oIyQlDq64wTKBkXcWkp5ZSHoWMDKtYhTJzCvL
	TczMMdYrzs6ozMus0EvOz93ECAyvZbV/IncwfrsQfIhRgINRiYfXwVs6Q4g1say4MvcQowQH
	s5IIb1EjUIg3JbGyKrUoP76oNCe1+BCjNAeLkjiv0bfyFCGB9MSS1OzU1ILUIpgsEwenVAMj
	T1BOyjy7gIiN3Ae/dAWaG6j+ks3lDp28bl+2zzdhGTGFea/T9DLf2V2JDXqXVs3y9nPxshc7
	Ez/6Nt2xuc6w5HWGqLwMW3uiawSDS4jhG6XEGSf1VXJPHsh5I1a38emTx4YFVb7fNRbNzV55
	2CIg4ed1e+b3ois4/MpWOYcmb/t5Q8Zg32klluKMREMt5qLiRAB3kw6WKwIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpkluLIzCtJLcpLzFFi42LhmqEyR3dDokyGQcsreYvTU88yWUxt38to
	8WT9LGaLS4vcLS7vmsNmMWHuVSaL91vvMTqweyzYVOqxaVUnm8fuBZ+ZPL7d9vD4vEkugDWK
	yyYlNSezLLVI3y6BK2PGol6Wgk2CFU1rqhsYF/N1MXJySAiYSJzc+IUJxGYT0JD409vLDGKL
	CDhJ/L/Rzt7FyMXBLNDGKNF+tIm1i5GDQ1igWOLUpkSQGhYBVYltM14ygti8AqYSOw9/ZIaY
	qSmx48t5Joi4oMTJmU9YQGxmAXmJ5q2zmScwcs1CkpqFJLWAkWkVo0hmXlluYmaOmV5xdkZl
	XmaFXnJ+7iZGYMAsq/0zaQfjt8vuhxgFOBiVeHgdvaUzhFgTy4orcw8xSnAwK4nwFjUChXhT
	EiurUovy44tKc1KLDzFKc7AoifN6hacmCAmkJ5akZqemFqQWwWSZODilGhhbfqfausu8SCow
	cZv+NMDyidX6lfUbXxxe+qTq3EfjzYoVv1d5uC9c+DDLuvnBk/9Z7E7Ln1QJMrE0+/Uta9/4
	638gz7LlT4ODXhtWv92Zarp1mUFY16d387/kM13VOOdx4fh5qR9yDBzJsWcUP+hFz78RO2EB
	5xGZKIcD2R8zymTu3bp12bBWiaU4I9FQi7moOBEAP5yI4BQCAAA=
X-CFilter-Loop: Reflected

In LFS mode, the previous segment cannot use invalid blocks,
so the remaining blocks from the next_blkoff of the current segment
to the end of the section are calculated.

Signed-off-by: yohan.joung <yohan.joung@sk.com>
---
 fs/f2fs/segment.h | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 03c0f59be5a8..5777b385e7d2 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -102,6 +102,8 @@ static inline void sanity_check_seg_type(struct f2fs_sb_info *sbi,
 #define CAP_SEGS_PER_SEC(sbi)					\
 	(SEGS_PER_SEC(sbi) -					\
 	BLKS_TO_SEGS(sbi, (sbi)->unusable_blocks_per_sec))
+#define GET_START_SEG_FROM_SEC(sbi, segno)			\
+	(rounddown(segno, SEGS_PER_SEC(sbi)))
 #define GET_SEC_FROM_SEG(sbi, segno)				\
 	(((segno) == -1) ? -1 : (segno) / SEGS_PER_SEC(sbi))
 #define GET_SEG_FROM_SEC(sbi, secno)				\
@@ -582,8 +584,14 @@ static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi,
 		if (unlikely(segno == NULL_SEGNO))
 			return false;
 
-		left_blocks = CAP_BLKS_PER_SEC(sbi) -
-				get_ckpt_valid_blocks(sbi, segno, true);
+		if (f2fs_lfs_mode(sbi) && __is_large_section(sbi)) {
+			left_blocks = CAP_BLKS_PER_SEC(sbi) -
+				SEGS_TO_BLKS(sbi, (segno - GET_START_SEG_FROM_SEC(sbi, segno))) -
+				CURSEG_I(sbi, i)->next_blkoff;
+		} else {
+			left_blocks = CAP_BLKS_PER_SEC(sbi) -
+					get_ckpt_valid_blocks(sbi, segno, true);
+		}
 
 		blocks = i <= CURSEG_COLD_DATA ? data_blocks : node_blocks;
 		if (blocks > left_blocks)
@@ -596,8 +604,15 @@ static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi,
 	if (unlikely(segno == NULL_SEGNO))
 		return false;
 
-	left_blocks = CAP_BLKS_PER_SEC(sbi) -
-			get_ckpt_valid_blocks(sbi, segno, true);
+	if (f2fs_lfs_mode(sbi) && __is_large_section(sbi)) {
+		left_blocks = CAP_BLKS_PER_SEC(sbi) -
+				SEGS_TO_BLKS(sbi, (segno - GET_START_SEG_FROM_SEC(sbi, segno))) -
+				CURSEG_I(sbi, CURSEG_HOT_DATA)->next_blkoff;
+	} else {
+		left_blocks = CAP_BLKS_PER_SEC(sbi) -
+				get_ckpt_valid_blocks(sbi, segno, true);
+	}
+
 	if (dent_blocks > left_blocks)
 		return false;
 	return true;
-- 
2.33.0

