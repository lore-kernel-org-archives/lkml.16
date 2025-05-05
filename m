Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810F91FF610
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 09:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746437186; cv=none; b=o7YjOQKDUTz7+kmgMecUa5tNkH37kr23j6qpQ6N6+IV3/DGWJDkEbzzon69lnWAYUknGCDalG70wkXSBP466cC1wa688g81No4102rfaQjILseRsViJLlznQtegvCHMdlmHXHOBFo27NhFv4s93blzgWDqHUQd5CapAl70OS/Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746437186; c=relaxed/simple;
	bh=PI2c5foZR5vyGJkH8WJMClJbqC5dtd+HRbGsj1/m554=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s2YtMt26b1BY/Mji9INUdc5eATQ30s7eabXBRG+z4+eQ0Nd6nuO9Gyn+2WdilRaYi0WHgsLUOjDZUX/LqWNe7dOP7hxt7SDqAfky8wlQbNrF0UK7laHHELEzxQwPzJqPkBrDdZJKAEyv5KZ5H2YNc+wDypXyS3M3mQnZTC0zB0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=x/U3nuPk; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="x/U3nuPk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=1iiA19Fpkg3RQwIUcBZsoeN39RODM7CDkoOHf3ZXDJ4=; b=x/U3nuPkN4ZRicLcyPK8i5g35N
	QUGZj0hAQXwIjC5s0sVXePlxxMTFvxhB+Ul6RvtUffY5O8fQpvNj2yuVG0YjFd2Ot5c3CC9q1S/vn
	o15RL2oI5tZybBe2WylZMNpf6yI/ZzBaPR7yFbqHA+WNY6s7w6Ws+kWT8hNtCZTXG59PBZBauJCp1
	ognWOiZNN4dyh1fM4UfwRXWlknrKZp2sAenHRXagT9yyxPhqKb9IrX+7mEfDPzTck/lomedt0cZRt
	/Zibx+bM6AsszTGD5UVC0nJJ64JZXY8r8MJkXrQcFeFzT4GtR+s3HujOGZHy9BC5SXEglXZ6DD9fn
	tUVe/2rA==;
Received: from 2a02-8389-2341-5b80-c9f7-77ec-522e-47ca.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:c9f7:77ec:522e:47ca] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBs5g-00000006um6-3OZ8;
	Mon, 05 May 2025 09:26:25 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] f2fs: simplify return value handling in f2fs_fsync_node_pages
Date: Mon,  5 May 2025 11:26:00 +0200
Message-ID: <20250505092613.3451524-4-hch@lst.de>
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

Always assign ret where the error happens, and jump to out instead
of multiple loop exit conditions to prepare for changes in the
__write_node_folio calling convention.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/f2fs/node.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index ec74eb9982a5..b9d9519c3da4 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1882,17 +1882,17 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 			if (!folio_clear_dirty_for_io(folio))
 				goto continue_unlock;
 
-			ret = __write_node_folio(folio, atomic &&
+			if (__write_node_folio(folio, atomic &&
 						folio == last_folio,
 						&submitted, wbc, true,
-						FS_NODE_IO, seq_id);
-			if (ret) {
+						FS_NODE_IO, seq_id)) {
 				folio_unlock(folio);
 				f2fs_folio_put(last_folio, false);
-				break;
-			} else if (submitted) {
-				nwritten++;
+				ret = -EIO;
+				goto out;
 			}
+			if (submitted)
+				nwritten++;
 
 			if (folio == last_folio) {
 				f2fs_folio_put(folio, false);
@@ -1903,10 +1903,10 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 		folio_batch_release(&fbatch);
 		cond_resched();
 
-		if (ret || marked)
+		if (marked)
 			break;
 	}
-	if (!ret && atomic && !marked) {
+	if (atomic && !marked) {
 		f2fs_debug(sbi, "Retry to write fsync mark: ino=%u, idx=%lx",
 			   ino, last_folio->index);
 		folio_lock(last_folio);
@@ -1918,7 +1918,7 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 out:
 	if (nwritten)
 		f2fs_submit_merged_write_cond(sbi, NULL, NULL, ino, NODE);
-	return ret ? -EIO : 0;
+	return ret;
 }
 
 static int f2fs_match_ino(struct inode *inode, unsigned long ino, void *data)
-- 
2.47.2

