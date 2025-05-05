Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DF01FDE09
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 09:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746437183; cv=none; b=QEvXYJOaSYftOWeuRs3CGB5Qfzjl4lrAWB6uC+ATV+3yP1+5RGtHXyuIvXICo+elLkkvLK5NnMjYJdHKOjXIw/0XlSu9c5tMqxP0LzxJMOg39MqBZySWXADgNOC5Afl4/seCL4SabWdDp/0ldx/AeeVzpDFOZQUrONqI2ggk/ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746437183; c=relaxed/simple;
	bh=UHYW7kjzP0vvHIBclVg5mb4jykYm7F1YV93Kfe2YQ2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RhW1xSFdKrPpdAj81g7CQhfOMEX0ReTNUeJus0dkGHXMduEOjHAnFzye4yiNdj5fct8jaRxuxirwZmWfM2DKcE+GveRVbLfOqpg6QxdyHwPfEXUvkTzpWDgClsjyfmj0kfgRPY7P+T+OXIK5KCEkDkw2S9M1BkJKQRc/pLICdjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=hWMVJqmr; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hWMVJqmr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=sELj/MlDtAAj12/hR7awIfpwOruMjrHMsTWeklMcCBo=; b=hWMVJqmrABhxNjTTqPVqQzaT2Q
	6vMHdKc/nise00cHaSu44/FhLCMa/yt86MpB1tTBj8eU5nmvSQVYIYAtmwN2+O+/zioQ9vPyUPm9Q
	AkIhfP+q0QArgX4UP0xwSNZ73iFizNvjX/tP1ODkKIrD3I6SNtwEounEkrcfS+ZWcr40rhhndLmoD
	BDJoVDWOKgdpFMmFDET9JKuX4cJzBQmWLHA5/MMEliefErtE5OWcBuUoCgFyjfq5ixA/aAydsgGkw
	EViiXPrOhwK7cV6/mnLGu+nC8pY4cvQguEfrBz+1+cexad/QLKM9SPwoEZGq2Su5+tVkTcJLhf/iH
	pvWGf9JA==;
Received: from 2a02-8389-2341-5b80-c9f7-77ec-522e-47ca.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:c9f7:77ec:522e:47ca] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBs5d-00000006uky-0wDw;
	Mon, 05 May 2025 09:26:21 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] f2fs: don't return AOP_WRITEPAGE_ACTIVATE from f2fs_write_single_data_page
Date: Mon,  5 May 2025 11:25:59 +0200
Message-ID: <20250505092613.3451524-3-hch@lst.de>
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

Instead unlock the pages locally where that would happen and thus
consolidate the code in the callers.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/f2fs/compress.c |  5 +----
 fs/f2fs/data.c     | 13 ++++---------
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index e016b0f96313..ce63b3bfb28f 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1565,10 +1565,7 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
 						NULL, NULL, wbc, io_type,
 						compr_blocks, false);
 		if (ret) {
-			if (ret == AOP_WRITEPAGE_ACTIVATE) {
-				folio_unlock(folio);
-				ret = 0;
-			} else if (ret == -EAGAIN) {
+			if (ret == -EAGAIN) {
 				ret = 0;
 				/*
 				 * for quota file, just redirty left pages to
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 08a8a107adcb..e32c9cf5b4f5 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2930,10 +2930,10 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
 	 * file_write_and_wait_range() will see EIO error, which is critical
 	 * to return value of fsync() followed by atomic_write failure to user.
 	 */
-	if (!err || wbc->for_reclaim)
-		return AOP_WRITEPAGE_ACTIVATE;
 	folio_unlock(folio);
-	return err;
+	if (err && !wbc->for_reclaim)
+		return err;
+	return 0;
 }
 
 /*
@@ -3146,8 +3146,6 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 			ret = f2fs_write_single_data_page(folio,
 					&submitted, &bio, &last_block,
 					wbc, io_type, 0, true);
-			if (ret == AOP_WRITEPAGE_ACTIVATE)
-				folio_unlock(folio);
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 result:
 #endif
@@ -3159,10 +3157,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 				 * keep nr_to_write, since vfs uses this to
 				 * get # of written pages.
 				 */
-				if (ret == AOP_WRITEPAGE_ACTIVATE) {
-					ret = 0;
-					goto next;
-				} else if (ret == -EAGAIN) {
+				if (ret == -EAGAIN) {
 					ret = 0;
 					if (wbc->sync_mode == WB_SYNC_ALL) {
 						f2fs_io_schedule_timeout(
-- 
2.47.2

