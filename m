Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CFC2163BD
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 05:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746681341; cv=none; b=hzCsq+U8WXcFfF7bhoRwvcb6qhUt9mkvVIgBrEYkw3nkCqk/TdSe1E9T8jWpgnv6tm38Dc5uibrCWSiOQN/fY+9j8Bh3KfNjz1LsSvMnhAZhoVnmSwLwJuV1DYGCDuohzyldFdKq8X4ZVfggZEDheHjMmYXkpjXn5aeNkpT7HGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746681341; c=relaxed/simple;
	bh=YhAVcR55J1+vUc7cLt7ms1cLvM4TlnzWGVWVktwdLIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D8+1VP9w7LcjOtvkUxYs4PLGd7FvJY8ykcSlRooQDk3TPwoEcSFOZLf5i50vDz3+o8kUzQsLwax/eX9gQ+BnkDGwtwWQjbsx1JlbqD8KukRkYxA72kX+SAoYMehIN253XC+T+qwY2wH2YDm7QiHrR7iMpWS0UA5JTWIZ8tcWHaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=K5PLsjS+; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="K5PLsjS+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=pqWJWBPSs4P/pAKs04mbwxvUo6WZ6kc2P9tPzwI5CAs=; b=K5PLsjS+fG/we46+q7A5vJeSGp
	HdJiDdnWx+Vq2WhA5hIZigYV94pcewyPTL8yDRXBWkdXGr/hO9koGZ2E+WHKsza22B4fIaEp2TcqW
	kWBsIvHUFTES5ZQlmvRyL5AkbMpcICm5m1PiU3RCiDsokGBbXzVxzC9AW4XPqFUOOhCa2/Eb6sEEq
	E+gWOU7ToF4NhDul3jYQGFiUfSb+0LSXJQUPanG9BcnmkORqlPWld1cCumIOIni6oRouBEhx6Pkay
	xwTul6zDhGTffyCg/k+WZ//0ho4t1Jq5dxT9EVkeB1yNRrVdyHSHB0JMqJb9r0SQ+T9R876gxZWAh
	BHmg5BOA==;
Received: from 2a02-8389-2341-5b80-2368-be33-a304-131f.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:2368:be33:a304:131f] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCtbf-0000000HLgF-1BjE;
	Thu, 08 May 2025 05:15:39 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] f2fs: always unlock the page in f2fs_write_single_data_page
Date: Thu,  8 May 2025 07:14:30 +0200
Message-ID: <20250508051520.4169795-5-hch@lst.de>
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

Consolidate the code to unlock the page in f2fs_write_single_data_page
instead of leaving it to the callers for the AOP_WRITEPAGE_ACTIVATE case.
Replace AOP_WRITEPAGE_ACTIVATE with a positive return of 1 as this case
now doesn't match the historic ->writepage special return code that is
on it's way out now that ->writepage has been removed.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/f2fs/compress.c | 3 +--
 fs/f2fs/data.c     | 8 +++-----
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index e016b0f96313..1e62fdffda07 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1565,8 +1565,7 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
 						NULL, NULL, wbc, io_type,
 						compr_blocks, false);
 		if (ret) {
-			if (ret == AOP_WRITEPAGE_ACTIVATE) {
-				folio_unlock(folio);
+			if (ret == 1) {
 				ret = 0;
 			} else if (ret == -EAGAIN) {
 				ret = 0;
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 160c7b39d967..8d8018083c31 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2917,9 +2917,9 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
 	 * file_write_and_wait_range() will see EIO error, which is critical
 	 * to return value of fsync() followed by atomic_write failure to user.
 	 */
-	if (!err)
-		return AOP_WRITEPAGE_ACTIVATE;
 	folio_unlock(folio);
+	if (!err)
+		return 1;
 	return err;
 }
 
@@ -3133,8 +3133,6 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 			ret = f2fs_write_single_data_page(folio,
 					&submitted, &bio, &last_block,
 					wbc, io_type, 0, true);
-			if (ret == AOP_WRITEPAGE_ACTIVATE)
-				folio_unlock(folio);
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 result:
 #endif
@@ -3146,7 +3144,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 				 * keep nr_to_write, since vfs uses this to
 				 * get # of written pages.
 				 */
-				if (ret == AOP_WRITEPAGE_ACTIVATE) {
+				if (ret == 1) {
 					ret = 0;
 					goto next;
 				} else if (ret == -EAGAIN) {
-- 
2.47.2

