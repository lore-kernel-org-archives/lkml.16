Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8971FBCB0
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 09:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746437180; cv=none; b=KAZTFtjFPzI7IkIIszVE7lpo4bQoEdrOzcINYnwCXVwQodZIcT/EscS0SRJhNZg9rKEXS+AlVDlaPOfqhTmuhvhOxX4zGi2K01wxRu/nI7FuIfoxcXS55TDprnfuIhS2BvUontJmWC/7TtRoLK3WhHwPL5Gpay0q99l4yH6cVG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746437180; c=relaxed/simple;
	bh=fxSRi7z3WFNERGzFjWH+cJ8cECkNsH4NPZHNhxwZUB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uUWqcokNyIsavr9dIvHv9MPrc8pJy6oU+6b5d2XYjdSx64BncVFDtZk4Ve+sQstpaOKkz1AziOkBjfGRQuu36T9CfIbe55Xd7Vux8cG0TJSczc2PPjcm3MwOZL+GuC2sJk9NoqdDzKd+Zc28EFIjSUfEZdaqdETwtXXJPgpYh6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=l5+bbz5N; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="l5+bbz5N"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=MU+DP9oUJ78DUz/JlwF2VOH8GLV5VB5IwnkShLsTeuc=; b=l5+bbz5NDvUzHz9BTTjPIAfEqW
	2/zDFRbV/NggjUXTVL9SB/2pf6+IJi+Gi3ivi9+q46QTiuLglNLk30mVKIkEV3LgLvtb3lpdVtwbP
	/VE8ltRAMxeJi0AjaBAwIdIFy50wV2g9hjn4up0LREKYrnWgy39rRfRxzQMc9+9oIKILfHBccEBuu
	tqNDb3aS2WPvJgC4Amyku+woiZxm/CT8XMKlnbQz9PrRX9EtvykDDzYja5dO15zKvYVMn4ss4NJpO
	yg03ZGzkIl6QrE9vF3H34IIrJtGtdUd4Vb52fBCCLnK9AJ1te7CWd/4DxwFoCpQIwZcqyMrZbDa1X
	/tZMrm0g==;
Received: from 2a02-8389-2341-5b80-c9f7-77ec-522e-47ca.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:c9f7:77ec:522e:47ca] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBs5a-00000006ukp-0vNe;
	Mon, 05 May 2025 09:26:18 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] f2fs: return bool from __f2fs_write_meta_folio
Date: Mon,  5 May 2025 11:25:58 +0200
Message-ID: <20250505092613.3451524-2-hch@lst.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505092613.3451524-1-hch@lst.de>
References: <20250505092613.3451524-1-hch@lst.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

__f2fs_write_meta_folio can only return 0 or AOP_WRITEPAGE_ACTIVATE.
As part of phasing out AOP_WRITEPAGE_ACTIVATE, switch to a bool return
instead.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/f2fs/checkpoint.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index e42ed62fa45c..595d6e87aa2f 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -340,7 +340,7 @@ void f2fs_ra_meta_pages_cond(struct f2fs_sb_info *sbi, pgoff_t index,
 		f2fs_ra_meta_pages(sbi, index, ra_blocks, META_POR, true);
 }
 
-static int __f2fs_write_meta_folio(struct folio *folio,
+static bool __f2fs_write_meta_folio(struct folio *folio,
 				struct writeback_control *wbc,
 				enum iostat_type io_type)
 {
@@ -353,7 +353,7 @@ static int __f2fs_write_meta_folio(struct folio *folio,
 			folio_clear_uptodate(folio);
 			dec_page_count(sbi, F2FS_DIRTY_META);
 			folio_unlock(folio);
-			return 0;
+			return true;
 		}
 		goto redirty_out;
 	}
@@ -373,11 +373,11 @@ static int __f2fs_write_meta_folio(struct folio *folio,
 	if (unlikely(f2fs_cp_error(sbi)))
 		f2fs_submit_merged_write(sbi, META);
 
-	return 0;
+	return true;
 
 redirty_out:
 	folio_redirty_for_writepage(wbc, folio);
-	return AOP_WRITEPAGE_ACTIVATE;
+	return false;
 }
 
 static int f2fs_write_meta_pages(struct address_space *mapping,
@@ -461,7 +461,7 @@ long f2fs_sync_meta_pages(struct f2fs_sb_info *sbi, enum page_type type,
 			if (!folio_clear_dirty_for_io(folio))
 				goto continue_unlock;
 
-			if (__f2fs_write_meta_folio(folio, &wbc,
+			if (!__f2fs_write_meta_folio(folio, &wbc,
 						io_type)) {
 				folio_unlock(folio);
 				break;
@@ -1409,7 +1409,6 @@ static void commit_checkpoint(struct f2fs_sb_info *sbi,
 	 * f2fs_sync_meta_pages are combined in this function.
 	 */
 	struct folio *folio = f2fs_grab_meta_folio(sbi, blk_addr);
-	int err;
 
 	memcpy(folio_address(folio), src, PAGE_SIZE);
 
@@ -1418,13 +1417,14 @@ static void commit_checkpoint(struct f2fs_sb_info *sbi,
 		f2fs_bug_on(sbi, 1);
 
 	/* writeout cp pack 2 page */
-	err = __f2fs_write_meta_folio(folio, &wbc, FS_CP_META_IO);
-	if (unlikely(err && f2fs_cp_error(sbi))) {
-		f2fs_folio_put(folio, true);
-		return;
+	if (unlikely(!__f2fs_write_meta_folio(folio, &wbc, FS_CP_META_IO))) {
+		if (f2fs_cp_error(sbi)) {
+			f2fs_folio_put(folio, true);
+			return;
+		}
+		f2fs_bug_on(sbi, true);
 	}
 
-	f2fs_bug_on(sbi, err);
 	f2fs_folio_put(folio, false);
 
 	/* submit checkpoint (with barrier if NOBARRIER is not set) */
-- 
2.47.2

