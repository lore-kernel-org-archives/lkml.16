Received: from invmail3.skhynix.com (exvmail3.hynix.com [166.125.252.90])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ACB21A239D
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 04:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746161837; cv=none; b=eoGGVoKDvrrrq2lgQR6H03SCc3eWwQlCSyzSsKM4JOt3sFCJMwm8a3nC7sMbIx9jV70BZFbk6d9pDJRXu3D7+OlH1feZ3SG9OMTWZUuTYF4ArZNaX9pwcRP8lChLnni/Jw9ECQOaOoRcaICH3L6QF9dwSr5IgTBxxjr6Pi7yMyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746161837; c=relaxed/simple;
	bh=l1BDJxuhk6c8FOy3mY0+YZSwTPiFtzM4NYJxyWJ9ke4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aE7/sp2KygtAmphy0vaA2rIFJ4nX9DD6o7E3X0fIwFIQpCyQEnS2twJUJgV4XQDfgDAKc/gqCIpe6KxT2UDIqygYsyQZjPtw64vDmIR8gdW00MeynEXsh9SQnBiezguCznS3Luau7xaRg8TWZh6TnCVJP1QWHgh4T33+LitdDZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc59-03fff7000000aab6-39-68144d1992a3
From: "yohan.joung" <yohan.joung@sk.com>
To: jaegeuk@kernel.org,
	chao@kernel.org,
	daehojeong@google.com
Cc: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	pilhyun.kim@sk.com,
	"yohan.joung" <yohan.joung@sk.com>
Subject: [PATCH v2 1/2] f2fs: Add a method for calculating the remaining blocks in the current segment in LFS mode.
Date: Fri,  2 May 2025 13:41:44 +0900
Message-ID: <20250502044146.552-1-yohan.joung@sk.com>
X-Mailer: git-send-email 2.49.0.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBLMWRmVeSWpSXmKPExsXC9ZZnoa6kr0iGQXuLvsXpqWeZLKa272W0
	eLJ+FrPFpUXuFpd3zWFzYPVYsKnUY9OqTjaP3Qs+M3l83iQXwBLFZZOSmpNZllqkb5fAldH0
	8xtbwSHeir7fG5gbGBu5uxg5OSQETCQ6D1xl6WLkALM377IDCbMJaEj86e1lBrFFBJwk/t9o
	Z+9i5OJgFmhjlGg/2sQKkhAWKJa4MfM6G4jNIqAqse7AdDCbV8BU4v7v1ywQ8zUldnw5zwQR
	F5Q4OfMJWJxZQF6ieetsZoiat6wSP+ZYQdiSEgdX3GCZwMg7C0nLLCQtCxiZVjGKZOaV5SZm
	5hjrFWdnVOZlVugl5+duYgSG17LaP5E7GL9dCD7EKMDBqMTDG1AgnCHEmlhWXJl7iFGCg1lJ
	hDfGACjEm5JYWZValB9fVJqTWnyIUZqDRUmc1+hbeYqQQHpiSWp2ampBahFMlomDU6qBUeLL
	Zs/3ra7NfdXCZZ8vLVwrIN4hpqJooSmsKW1+4sqEXKE/S74c6Kzdt6dYwiZq4e72KN9p3Ic8
	8qzlXSyNJZN2LCngtGZQZ1etv/za1/nxZYVJhVW3L3/hudR4ynXRj69nuneLTGa1MGyd4P5H
	Z9MaNuXFFkIvc6VNAnvmaRzUEbidvq1KiaU4I9FQi7moOBEASLZSBysCAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpiluLIzCtJLcpLzFFi42LhmqEyR1fSVyTD4PNvOYvTU88yWUxt38to
	8WT9LGaLS4vcLS7vmsNmMWHuVSaL91vvMTqweyzYVOqxaVUnm8fuBZ+ZPL7d9vD4vEkugDWK
	yyYlNSezLLVI3y6BK6Pp5ze2gkO8FX2/NzA3MDZydzFycEgImEhs3mXXxcjJwSagIfGnt5cZ
	xBYRcJL4f6OdvYuRi4NZoI1Rov1oEytIQligWOLGzOtsIDaLgKrEugPTwWxeAVOJ+79fs4DY
	EgKaEju+nGeCiAtKnJz5BCzOLCAv0bx1NvMERq5ZSFKzkKQWMDKtYhTJzCvLTczMMdMrzs6o
	zMus0EvOz93ECAyZZbV/Ju1g/HbZ/RCjAAejEg9vQIFwhhBrYllxZe4hRgkOZiUR3hgDoBBv
	SmJlVWpRfnxRaU5q8SFGaQ4WJXFer/DUBCGB9MSS1OzU1ILUIpgsEwenVANj/9xQxfuxsy6u
	Xnv1+7ULD6aJs2wu6dU8c7zQ7p//upiNL9UX5vBPn7Ijd5H2BrEjQdoLl0uobXhfrnie2XnX
	t6ql3bv5L0RtcZ/t+Tg8QW6HcRm7ZLjf7Yeuu6wmVN1icXpy/v7da2qVWbWMyRd63racvFD+
	ZcnMDVYGloXhsxWPPs3atP/6fyWW4oxEQy3mouJEAOc8jr8VAgAA
X-CFilter-Loop: Reflected

In LFS mode, the previous segment cannot use invalid blocks,
so the remaining blocks from the next_blkoff of the current segment
to the end of the section are calculated.

Signed-off-by: yohan.joung <yohan.joung@sk.com>
---
 fs/f2fs/segment.h | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 03c0f59be5a8..345da052f0e1 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -582,8 +582,14 @@ static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi,
 		if (unlikely(segno == NULL_SEGNO))
 			return false;
 
-		left_blocks = CAP_BLKS_PER_SEC(sbi) -
-				get_ckpt_valid_blocks(sbi, segno, true);
+		if (f2fs_lfs_mode(sbi)) {
+			left_blocks = CAP_BLKS_PER_SEC(sbi) -
+				(segno - rounddown(segno, SEGS_PER_SEC(sbi))) * BLKS_PER_SEG(sbi) -
+				CURSEG_I(sbi, i)->next_blkoff;
+		} else {
+			left_blocks = CAP_BLKS_PER_SEC(sbi) -
+					get_ckpt_valid_blocks(sbi, segno, true);
+		}
 
 		blocks = i <= CURSEG_COLD_DATA ? data_blocks : node_blocks;
 		if (blocks > left_blocks)
@@ -596,8 +602,15 @@ static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi,
 	if (unlikely(segno == NULL_SEGNO))
 		return false;
 
-	left_blocks = CAP_BLKS_PER_SEC(sbi) -
-			get_ckpt_valid_blocks(sbi, segno, true);
+	if (f2fs_lfs_mode(sbi)) {
+		left_blocks = CAP_BLKS_PER_SEC(sbi) -
+				(segno - rounddown(segno, SEGS_PER_SEC(sbi))) * BLKS_PER_SEG(sbi) -
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

