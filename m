Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8521A201266
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 09:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746437190; cv=none; b=nezSs/OuYjqZJ3f0Cyn5xrMSx4BnR1MTYq6uYpOwqNgQC81KokHoXfK1r1LBQaNuSK8jmcCro44oV1UwYYJFjBmoU+GgSKzDC5giAzA5ss6Owh6Tvcr+/luk9ICSgpfKnb3cqYhNUoXNn4QHFr4bnGQ+4S6Oi/hm5NKCGHjkDZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746437190; c=relaxed/simple;
	bh=EavZyrcQhyIgkwz2UR77Z2VkrZSkHHezDAlNNqb8HZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SMn9P2MLE6FFUvfQPqZ0PBYYXBI6F27wPrcwmHsUIyWOvbVxHKKFnaqlSFl53if/atV3dsS/nJ4Qvzz7nf8cXrt4iXNRWzMmSfGvOOQDY9kzyytSmIdUAEZYDMK2baP0Q1An2noVyXQj6YW7pb3PTp3osDD6E63824Aiza3+0vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=kDWV0f/E; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kDWV0f/E"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=XtTvnTyq5mIhVTRdyBLDrwbTGyjJ80hJmgnWbsqgwSc=; b=kDWV0f/Ebjc5oyeTodSvEuRgZP
	0RzVOIhsgExqqR2SiMgTqim7LvqW3PbvbOpDxziSyNEZPXvBmpsO68zuU+YwupjSKfdFgwbujQxan
	w0OpdnV3W37wFiu4DyTW81b8AwzhgHZ5f7gC+YtmwBjs8gBK7okvBMWWCNma5/poIsFGmhne/wZki
	3XuwpoJ77jk5Z2TIeOlgTXb5lRwjmseWGn8x5BWwOtiZAn9kWnNXrkFMIYoRyveyu6oPXmyrqBu0R
	9I6WQPYmcyKFPr+NGqAUBsr/g7l832wO3b0XI2J26PTFQTyNceczZ4J3JzXFHKx8BvNZQMPOpM6cC
	DuemWOIA==;
Received: from 2a02-8389-2341-5b80-c9f7-77ec-522e-47ca.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:c9f7:77ec:522e:47ca] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBs5k-00000006unv-1e6s;
	Mon, 05 May 2025 09:26:29 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] f2f2: return bool from __write_node_folio
Date: Mon,  5 May 2025 11:26:01 +0200
Message-ID: <20250505092613.3451524-5-hch@lst.de>
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

__write_node_folio can only return 0 or AOP_WRITEPAGE_ACTIVATE.
As part of phasing out AOP_WRITEPAGE_ACTIVATE, switch to a bool return
instead.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/f2fs/node.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index b9d9519c3da4..4008e09c3d58 100644
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
@@ -1712,7 +1712,7 @@ static int __write_node_folio(struct folio *folio, bool atomic, bool *submitted,
 		dec_page_count(sbi, F2FS_DIRTY_NODES);
 		f2fs_up_read(&sbi->node_write);
 		folio_unlock(folio);
-		return 0;
+		return true;
 	}
 
 	if (__is_valid_data_blkaddr(ni.blk_addr) &&
@@ -1756,11 +1756,12 @@ static int __write_node_folio(struct folio *folio, bool atomic, bool *submitted,
 
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
@@ -1783,11 +1784,9 @@ int f2fs_move_node_folio(struct folio *node_folio, int gc_type)
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
@@ -1882,11 +1881,10 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 			if (!folio_clear_dirty_for_io(folio))
 				goto continue_unlock;
 
-			if (__write_node_folio(folio, atomic &&
+			if (!__write_node_folio(folio, atomic &&
 						folio == last_folio,
 						&submitted, wbc, true,
 						FS_NODE_IO, seq_id)) {
-				folio_unlock(folio);
 				f2fs_folio_put(last_folio, false);
 				ret = -EIO;
 				goto out;
@@ -2090,10 +2088,9 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
 			set_fsync_mark(&folio->page, 0);
 			set_dentry_mark(&folio->page, 0);
 
-			ret = __write_node_folio(folio, false, &submitted,
-						wbc, do_balance, io_type, NULL);
-			if (ret)
-				folio_unlock(folio);
+			if (!__write_node_folio(folio, false, &submitted,
+						wbc, do_balance, io_type, NULL))
+				ret = AOP_WRITEPAGE_ACTIVATE;
 			else if (submitted)
 				nwritten++;
 
-- 
2.47.2

