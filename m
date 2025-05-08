Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DCC2185A6
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 05:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746681347; cv=none; b=cbtmx5/b9gv20SY46d99w5CmcRMuXv87QtLn37pSg8On6JiYc63NK1laE6hAGkulwJ1ls4s2J7qzNBSX9v1+5QWtVJpezDa17s3WuU1VByuxthuqiesrGZAt2mFZkFthSdp297/SytZ/rDZwWECkwScf/FEqd7wQaZnY1oZjMKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746681347; c=relaxed/simple;
	bh=T9Wo2J/HWYwAqgV0iDUyAuroHBc9x86vwG92oChRvYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FbWY1GBnPmHT63ZZyyN5yYnaMbf4YM3dWE43MsnMoz4MtrDoWsyKWcJBjrC1PmSH5hnqLtq2HUoyjdApKZD1en/o5nl12UEZq0RuPh0B1j4eWzaVuJsSG2+mFdaLUEL2nF0W3j371Zr1S+fGHFvfAEnq4AxvXw16a0BwEIOaVIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Rrmamjmo; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Rrmamjmo"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=1G4f4sk552Jl077q56Rrcrvm+8Rfw3GwTOMqnkMOeys=; b=Rrmamjmozk1BTD7R9CmoYXv3pl
	Bvf1ZNDqPKeTU8uvHnzUdpCqhGO7ZQtAva7CKWlCchQRawXvRLhgn+1K3P+n84ZqRrCnoiQcbjJX/
	yAG2fsdkS5ioxnhyWYMzGdkD5O5yWkviKW3W4QHtI1rQhYq4KKvzzpTQONP14zYRQFTPfagHZrckS
	VFaft3ouWl7q2irQR9wvp46rLXsLzM8wK9BLoDpMC407Pk4l8LTwnBm4g8zqESiTPjlTBx2FWcc4N
	zd68aVAbWkgiBfyOPCG7SYqw2GbBYaDaTBG0Yub1JuqWAdNUQX/nYKA20MSP9+LVIIAgZkcBw5+d6
	S20tqtiA==;
Received: from 2a02-8389-2341-5b80-2368-be33-a304-131f.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:2368:be33:a304:131f] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCtbl-0000000HLhe-00t2;
	Thu, 08 May 2025 05:15:45 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] f2fs: return bool from __write_node_folio
Date: Thu,  8 May 2025 07:14:32 +0200
Message-ID: <20250508051520.4169795-7-hch@lst.de>
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

__write_node_folio can only return 0 or AOP_WRITEPAGE_ACTIVATE.
As part of phasing out AOP_WRITEPAGE_ACTIVATE, switch to a bool return
instead.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/node.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index cbc7e9997b74..3f6b8037d25f 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1651,7 +1651,7 @@ static struct folio *last_fsync_dnode(struct f2fs_sb_info *sbi, nid_t ino)
 	return last_folio;
 }
 
-static int __write_node_folio(struct folio *folio, bool atomic, bool *submitted,
+static bool __write_node_folio(struct folio *folio, bool atomic, bool *submitted,
 				struct writeback_control *wbc, bool do_balance,
 				enum iostat_type io_type, unsigned int *seq_id)
 {
@@ -1681,7 +1681,7 @@ static int __write_node_folio(struct folio *folio, bool atomic, bool *submitted,
 		folio_clear_uptodate(folio);
 		dec_page_count(sbi, F2FS_DIRTY_NODES);
 		folio_unlock(folio);
-		return 0;
+		return true;
 	}
 
 	if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
@@ -1707,7 +1707,7 @@ static int __write_node_folio(struct folio *folio, bool atomic, bool *submitted,
 		dec_page_count(sbi, F2FS_DIRTY_NODES);
 		f2fs_up_read(&sbi->node_write);
 		folio_unlock(folio);
-		return 0;
+		return true;
 	}
 
 	if (__is_valid_data_blkaddr(ni.blk_addr) &&
@@ -1746,11 +1746,12 @@ static int __write_node_folio(struct folio *folio, bool atomic, bool *submitted,
 
 	if (do_balance)
 		f2fs_balance_fs(sbi, false);
-	return 0;
+	return true;
 
 redirty_out:
 	folio_redirty_for_writepage(wbc, folio);
-	return AOP_WRITEPAGE_ACTIVATE;
+	folio_unlock(folio);
+	return false;
 }
 
 int f2fs_move_node_folio(struct folio *node_folio, int gc_type)
@@ -1772,11 +1773,9 @@ int f2fs_move_node_folio(struct folio *node_folio, int gc_type)
 			goto out_page;
 		}
 
-		if (__write_node_folio(node_folio, false, NULL,
-					&wbc, false, FS_GC_NODE_IO, NULL)) {
+		if (!__write_node_folio(node_folio, false, NULL,
+					&wbc, false, FS_GC_NODE_IO, NULL))
 			err = -EAGAIN;
-			folio_unlock(node_folio);
-		}
 		goto release_page;
 	} else {
 		/* set page dirty and write it */
@@ -1871,11 +1870,10 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 			if (!folio_clear_dirty_for_io(folio))
 				goto continue_unlock;
 
-			if (__write_node_folio(folio, atomic &&
+			if (!__write_node_folio(folio, atomic &&
 						folio == last_folio,
 						&submitted, wbc, true,
 						FS_NODE_IO, seq_id)) {
-				folio_unlock(folio);
 				f2fs_folio_put(last_folio, false);
 				folio_batch_release(&fbatch);
 				ret = -EIO;
@@ -2078,16 +2076,15 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
 			set_fsync_mark(&folio->page, 0);
 			set_dentry_mark(&folio->page, 0);
 
-			ret = __write_node_folio(folio, false, &submitted,
-						wbc, do_balance, io_type, NULL);
-			if (ret) {
+			if (!__write_node_folio(folio, false, &submitted,
+					wbc, do_balance, io_type, NULL)) {
 				folio_unlock(folio);
 				folio_batch_release(&fbatch);
 				ret = -EIO;
 				goto out;
-			} else if (submitted) {
-				nwritten++;
 			}
+			if (submitted)
+				nwritten++;
 
 			if (--wbc->nr_to_write == 0)
 				break;
-- 
2.47.2

