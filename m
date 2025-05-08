Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A77D21504D
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 05:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746681335; cv=none; b=Vm+nLKHU4us7cN09tnmqeb/UiCbLOnEP4rIHzWaLRe5ySHKLLt9xp2vxryTLZP2SqomxnQ/vMIgjfS5Q/X0/rTPS8433WuxV4UBY2DvSwlq/ryx7RSoVrUDvDXwU2U2sURBNxK1ywbA2ar2RkjQckNz1GpoSXc0xBtmIKsfsr74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746681335; c=relaxed/simple;
	bh=pA+nMQhKKS2/fEX7uhzqrqS2x+Y5IgMSiFXP1XmeHm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ry0JObvrGibpASiVD9GFrLDqQYFJthNmVzXIp2DBSK6Biru+Bhyz1pcYHXusFvLyD5nYqvyNv2+J6ocs8OX4I7t0D8Kh7K+YZQalv4XXT1A1mJhUnHMX+WjESonDHFvzjAdSflTNlCeYggyCqqpli780c5HKqqiMcWKUZ//IPac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=JBfVrU8u; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JBfVrU8u"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=mJ601YFTsjLc/Bu1ljq7runEahH6x5HE4nmzXPhOC1Q=; b=JBfVrU8uqyrhYLSbVLWM8tvrf+
	udba6Sw9VJE72XaxBHgNQA9LdhEY8oR45G7PaMlpK0EyGyPOOcKrA1XzEvcaDIOoVGQE6vpoQWNEZ
	jQYMU9LhF4WjO2PYpKTd3azTw4Vvpfl+w1zOxJIzmqyR1u7bVvykjMgB2YmGUrR8b/a2/QhsmW8/B
	TzuIpeeCwE6BW+lF+KjBFA9DbNMjOGEgWT+Luf6t5V0PK+XRam4DPvteL5lFEPqiWdvDuKgyTI87Z
	FzFNJcJ2WhNj2NLBq+u9BUVcN7Sp6KAU/b3ZZgOtdqDrrfwWTeJSMLOrFKt3UqkUmfUPD/s3bxws4
	Tn3kRrQw==;
Received: from 2a02-8389-2341-5b80-2368-be33-a304-131f.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:2368:be33:a304:131f] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCtbZ-0000000HLfw-1BuZ;
	Thu, 08 May 2025 05:15:33 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] f2fs: return bool from __f2fs_write_meta_folio
Date: Thu,  8 May 2025 07:14:28 +0200
Message-ID: <20250508051520.4169795-3-hch@lst.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250508051520.4169795-1-hch@lst.de>
References: <20250508051520.4169795-1-hch@lst.de>
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
Reviewed-by: Chao Yu <chao@kernel.org>
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

