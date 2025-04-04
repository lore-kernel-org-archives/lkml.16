Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046561DFD83
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 19:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743796486; cv=none; b=qWiHHWb7exm3FW/ICgzILwqB6iHh8FqNDO/d1frLruGmqr0RcDNoxxE2Vl3rJy0yUnqeHqEKKuTXg+PXFAF5PiqvxpBQzT+inCZHWztpB5Zpkr0BGLAktFmfUPotZes+7lROrjMHiafNuzppKwuT/AId7buiPQvSI51WfRnDr98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743796486; c=relaxed/simple;
	bh=2UlsTHi7AOc8miGOqZhj4VPJ8gnJHtkD07YzMrfULlg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UaycBWO5gBLQFOfZqsWHnn3AoMrZzyDAFrFfQEATsDXtU2qreJQINOuzBkDiGUjM7PgZtntk7FcULlULDvL/jSCf0+gQvJ8qs5q4YNsT4Le5/zByo0T/zY6DgfqT9TgK+jfQPu0i9r2Muuk+GCoA3CP+nL8BTSNfuZ3Ugta8G+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CEx/U85j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CEx/U85j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41F32C4CEDD;
	Fri,  4 Apr 2025 19:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743796485;
	bh=2UlsTHi7AOc8miGOqZhj4VPJ8gnJHtkD07YzMrfULlg=;
	h=From:To:Cc:Subject:Date:From;
	b=CEx/U85jhoYAMt09WN2v5Ga+FezzbD2Dz5tMaeiDaquWBw0BMfPsEDsVjFdLPVm92
	 4o2Y07hxNTgPv3ZSG6ryzQgaGNk2Zs5ae+h1pDop+MAbB1lW5GdupMzofjas0x0ozY
	 hWXYsa6L3cJGv8nUP+yTvtDINa+2ji6aTzTxZdDraEieAPu5pRFPPam1esWAj9yY/R
	 31+WkXtfgqzTomaDLBVWEeDai9GYo/0Le+fBNxS4V8530CuLL4KDbtlyFemTRSKSCW
	 qJyjLnB5yqJq7Bd8JX4p0n4cwHPYs4uijlS+QaoPUdz/zQgvlNsSX9FeODtdHX7pqU
	 exNpjk2u4UFcA==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Subject: [PATCH] f2fs: clean up unnecessary indentation
Date: Fri,  4 Apr 2025 19:54:42 +0000
Message-ID: <20250404195442.413945-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/segment.h | 40 ++++++++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 16 deletions(-)

diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 0465dc00b349..5fcb1f92d506 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -429,7 +429,6 @@ static inline void __set_free(struct f2fs_sb_info *sbi, unsigned int segno)
 	unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
 	unsigned int start_segno = GET_SEG_FROM_SEC(sbi, secno);
 	unsigned int next;
-	unsigned int usable_segs = f2fs_usable_segs_in_sec(sbi);
 
 	spin_lock(&free_i->segmap_lock);
 	clear_bit(segno, free_i->free_segmap);
@@ -437,7 +436,7 @@ static inline void __set_free(struct f2fs_sb_info *sbi, unsigned int segno)
 
 	next = find_next_bit(free_i->free_segmap,
 			start_segno + SEGS_PER_SEC(sbi), start_segno);
-	if (next >= start_segno + usable_segs) {
+	if (next >= start_segno + f2fs_usable_segs_in_sec(sbi)) {
 		clear_bit(secno, free_i->free_secmap);
 		free_i->free_sections++;
 	}
@@ -463,22 +462,31 @@ static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
 	unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
 	unsigned int start_segno = GET_SEG_FROM_SEC(sbi, secno);
 	unsigned int next;
-	unsigned int usable_segs = f2fs_usable_segs_in_sec(sbi);
+	bool ret;
 
 	spin_lock(&free_i->segmap_lock);
-	if (test_and_clear_bit(segno, free_i->free_segmap)) {
-		free_i->free_segments++;
-
-		if (!inmem && IS_CURSEC(sbi, secno))
-			goto skip_free;
-		next = find_next_bit(free_i->free_segmap,
-				start_segno + SEGS_PER_SEC(sbi), start_segno);
-		if (next >= start_segno + usable_segs) {
-			if (test_and_clear_bit(secno, free_i->free_secmap))
-				free_i->free_sections++;
-		}
-	}
-skip_free:
+	ret = test_and_clear_bit(segno, free_i->free_segmap);
+	if (!ret)
+		goto unlock_out;
+
+	free_i->free_segments++;
+
+	if (!inmem && IS_CURSEC(sbi, secno))
+		goto unlock_out;
+
+	/* check large section */
+	next = find_next_bit(free_i->free_segmap,
+			     start_segno + SEGS_PER_SEC(sbi), start_segno);
+	if (next < start_segno + f2fs_usable_segs_in_sec(sbi))
+		goto unlock_out;
+
+	ret = test_and_clear_bit(secno, free_i->free_secmap);
+	if (!ret)
+		goto unlock_out;
+
+	free_i->free_sections++;
+
+unlock_out:
 	spin_unlock(&free_i->segmap_lock);
 }
 
-- 
2.49.0.504.g3bcea36a83-goog

