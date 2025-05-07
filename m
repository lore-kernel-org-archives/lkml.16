Received: from invmail3.skhynix.com (exvmail3.skhynix.com [166.125.252.90])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8601B3211
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 04:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746592269; cv=none; b=odnCCMknXlWRZhBMleZXLQEy87ohuwtmKOZwfTKUv5bdv1wb9UtFCe+o3t0s2zXxTwfmOt0OOxGCN4HrAJbVccdLkxo/V9Oj1DN/MAExmx1/bXkzuyhL5PO8vDns5K16JNmf1BANftDLFAWHQUVepXOje6jcE6QfjxFJ4l2ZSrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746592269; c=relaxed/simple;
	bh=srBwzWfzGP9oE8BqQI5SKV8Es886pZ8K1t81Q7jHsRI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F6f5CSvpUTB1/7QoGc334Sri5p4BWdxxoGYhW69uM1Zo8S53XbnwM+vcHWDTQCfZ0mojvX6NpWOBh+jymIDBFg537oepQ/TWiBFkQQ+bSlkQEdQ1WGME1f0iNVZ7B0c3z51DZPMJ6vKB9g835yxVn64vFnOqCXS4PV0s8ZNG/bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc59-057ff7000000aab6-05-681ae1fcd9fa
From: "yohan.joung" <yohan.joung@sk.com>
To: jaegeuk@kernel.org,
	chao@kernel.org,
	daehojeong@google.com
Cc: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	pilhyun.kim@sk.com,
	"yohan.joung" <yohan.joung@sk.com>
Subject: [PATCH v3 1/2] f2fs: add a method for calculating the remaining blocks in the current segment in LFS mode.
Date: Wed,  7 May 2025 13:30:36 +0900
Message-ID: <20250507043038.591-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJLMWRmVeSWpSXmKPExsXC9ZZnoe6/h1IZBlunWFicnnqWyWJq+15G
	iyfrZzFbXFrkbnF51xw2B1aPBZtKPTat6mTz2L3gM5PH501yASxRXDYpqTmZZalF+nYJXBk/
	N01hL9giWNF09C97A+Nivi5GTg4JAROJ+0dWs8DYDcfusYHYbAIaEn96e5lBbBEBJ4n/N9rZ
	uxi5OJgF2hgl2o82sYIkhAWKJVo37gUrYhFQlXjzehpYnFfAVOLMp7mMEEM1JXZ8Oc8EEReU
	ODnzCdgyZgF5ieats5khal6ySuzbmw5hS0ocXHGDZQIj7ywkLbOQtCxgZFrFKJKZV5abmJlj
	rFecnVGZl1mhl5yfu4kRGGDLav9E7mD8diH4EKMAB6MSD++Bn5IZQqyJZcWVuYcYJTiYlUR4
	798HCvGmJFZWpRblxxeV5qQWH2KU5mBREuc1+laeIiSQnliSmp2aWpBaBJNl4uCUamCU7Ape
	I2mRt0Qpf3Xk4x6Ta7w/haNfsV5eZfTBUePmYS0e5kdfpbtEU5eF65SppmxleGtXNVO+UG/a
	+z3/xUSyvWpTpK2SZm5fY9nLv1LsGcfUg5s2fPU6vcgq9oWZjv6MOVl9pYYb3rVPNzBc8Ejv
	5RG5XUoWW3hyZzxy6y19Gh6W/ENVTEyJpTgj0VCLuag4EQA1FDSmLAIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpmluLIzCtJLcpLzFFi42LhmqEyR/fPQ6kMg1t32CxOTz3LZDG1fS+j
	xZP1s5gtLi1yt7i8aw6bxYS5V5ks3m+9x+jA7rFgU6nHplWdbB67F3xm8vh228Pj8ya5ANYo
	LpuU1JzMstQifbsEroyfm6awF2wRrGg6+pe9gXExXxcjJ4eEgIlEw7F7bCA2m4CGxJ/eXmYQ
	W0TASeL/jXb2LkYuDmaBNkaJ9qNNrCAJYYFiidaNe8GKWARUJd68ngYW5xUwlTjzaS4jxFBN
	iR1fzjNBxAUlTs58wgJiMwvISzRvnc08gZFrFpLULCSpBYxMqxhFMvPKchMzc8z0irMzKvMy
	K/SS83M3MQKDZlntn0k7GL9ddj/EKMDBqMTDe+CnZIYQa2JZcWXuIUYJDmYlEd7794FCvCmJ
	lVWpRfnxRaU5qcWHGKU5WJTEeb3CUxOEBNITS1KzU1MLUotgskwcnFINjDxzu3+e+XS+eu/i
	qMhNLdNY2J+0MTRnnO94Lza1rSQruD4r0KiPyTzAOHTfO+GzBwSXOmwXzbydKnhXfLtFweTO
	QxsFtnk/LChJnn/5kLbrWY14Fa6nMmbvly+p1pvYkyyq+VjOMPWYR/e+hklqvw6syk5cFt7n
	KepzaIdocOW7V7Jn2y01lFiKMxINtZiLihMBWjlxJBYCAAA=
X-CFilter-Loop: Reflected

In LFS mode, the previous segment cannot use invalid blocks,
so the remaining blocks from the next_blkoff of the current segment
to the end of the section are calculated.

Signed-off-by: yohan.joung <yohan.joung@sk.com>
---
 fs/f2fs/segment.h | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 03c0f59be5a8..f5d30f32ebdb 100644
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
+				(segno - GET_START_SEG_FROM_SEC(sbi, segno)) * BLKS_PER_SEG(sbi) -
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
+				(segno - GET_START_SEG_FROM_SEC(sbi, segno)) * BLKS_PER_SEG(sbi) -
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

