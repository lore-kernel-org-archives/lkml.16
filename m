Received: from invmail3.skhynix.com (exvmail3.skhynix.com [166.125.252.90])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33F12256C63
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 07:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747035414; cv=none; b=DL3yGr54CnMaEFVoZD0Ou6d3pKq0F46wiD5QoKpPSASzOvnDe2CZuUF8dkUEpSDn//lcURNDALqE7nmaPi1S9TKL4Dmhs52RIcBBIoQqz24jSb2zMpCDXCq9gtOKnjsmmLSt+kzu/bu9t/8uY6ZTCvcWF5K7Yz74mb25ZnuTLgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747035414; c=relaxed/simple;
	bh=o3fHYXSX29gp6NajjYFvmoa1IPO4JtSlTwtofFKNh2U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ngSv9FUypiVBzDjp3aop3Xg0pvXJMCsgbcbtUJpN+zeAeijPp6iuT2pxNYZRzTl1IFXSHG7gWMZUr05jhEmiRqs16uJ4K+ii560gRmI6kFBnGSPpTFg87Af3pUmA02Z8VXFE4DZhj7frIBMMZN5xUmUfwBH2Yl/CK9jnV+iUWEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc59-03fff7000000aab6-aa-6821a5092cf9
From: "yohan.joung" <yohan.joung@sk.com>
To: jaegeuk@kernel.org,
	chao@kernel.org,
	daehojeong@google.com
Cc: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	pilhyun.kim@sk.com,
	"yohan.joung" <yohan.joung@sk.com>
Subject: [PATCH v5 1/2] f2fs: add a method for calculating the remaining blocks in the current segment in LFS mode.
Date: Mon, 12 May 2025 16:36:09 +0900
Message-ID: <20250512073611.718-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJLMWRmVeSWpSXmKPExsXC9ZZnkS7nUsUMgzsHpSxOTz3LZDG1fS+j
	xZP1s5gtLi1yt7i8aw6bA6vHgk2lHptWdbJ57F7wmcnj8ya5AJYoLpuU1JzMstQifbsErowZ
	i3pZCjYJVjStqW5gXMzXxcjJISFgItHWNY0dxr56+SGYzSagIfGnt5cZxBYRcJL4f6MdKM7F
	wSzQxijRfrSJFSQhLFAscfXhYxYQm0VAVeL76WdgzbwCphJLj2xlhhiqKbHjy3kmiLigxMmZ
	T8DqmQXkJZq3zmYGGSoh8JJVYtPvNywQDZISB1fcYJnAyDsLSc8sJD0LGJlWMYpk5pXlJmbm
	GOsVZ2dU5mVW6CXn525iBAbYsto/kTsYv10IPsQowMGoxMObsFYhQ4g1say4MvcQowQHs5II
	71QG+Qwh3pTEyqrUovz4otKc1OJDjNIcLErivEbfylOEBNITS1KzU1MLUotgskwcnFINjJ2i
	ljurnVOPM1+evOnifGtRkad+DpXF/ZXbC2YtVD/RvXVXi9tuU5uyNwabNXo4rvQuUN++tqUt
	cHt+4Vfj51te2/e07Vr1c8qdH/tu1Ez9HN/2jcOy6MGlLTkv4/L3vJ+7Ye+JaA6OmU1S81RK
	5Fq67/6ZFN7tJ/M43GFjTTxn8CrxGy8bapRYijMSDbWYi4oTAVtD1IMsAgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpiluLIzCtJLcpLzFFi42LhmqEyR5dzqWKGwYp2XovTU88yWUxt38to
	8WT9LGaLS4vcLS7vmsNmMWHuVSaL91vvMTqweyzYVOqxaVUnm8fuBZ+ZPL7d9vD4vEkugDWK
	yyYlNSezLLVI3y6BK2PGol6Wgk2CFU1rqhsYF/N1MXJySAiYSFy9/JAdxGYT0JD409vLDGKL
	CDhJ/L/RDhTn4mAWaGOUaD/axAqSEBYolrj68DELiM0ioCrx/fQzsGZeAVOJpUe2MkMM1ZTY
	8eU8E0RcUOLkzCdg9cwC8hLNW2czT2DkmoUkNQtJagEj0ypGkcy8stzEzBwzveLsjMq8zAq9
	5PzcTYzAkFlW+2fSDsZvl90PMQpwMCrx8CasVcgQYk0sK67MPcQowcGsJMI7lUE+Q4g3JbGy
	KrUoP76oNCe1+BCjNAeLkjivV3hqgpBAemJJanZqakFqEUyWiYNTqoEx48+ElVePPm1kSap6
	v39HwxQhL/GdsgvfmW7Wn/koc+pqE7nfM04925q8VOtrMePmDY+YFL7/6BEISM9cckGg3KPl
	xIK9UVH7IhZEVlzRCeFh2Gads3Zrv6fizi3qc331qm0vhR3MfKC0wnq/o+/yE5mqJ+pX1ZQ1
	clnHyKg3/VMoXnQi5IWTEktxRqKhFnNRcSIAO1q9hRUCAAA=
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

