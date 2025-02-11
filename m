Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963982451F3
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 13:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.255
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739282066; cv=none; b=nbO0zJSSZF4yDE0HSgYTKsThGTIIq7963sG0HwpNouo/NtDii8Zhkgqix7IF1YMRtarTVMqQDr3fh8q9sNVQPFE2kt8052IemL8qsn2Cc6JrAm1vu21cAP3/bp8ekpECy+VXoiPFvW2RtQTWM6QBscxRHIOkhP1CBDI2uzgDJPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739282066; c=relaxed/simple;
	bh=/VQLQK/nY2tJxzd3Cpm2B3of/xg7FOt74pCXe7XZ/Gs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HQ5/0WoPpmB2zBmESj92oclmv40bdze8Rs9QxkMc+ROprQd9vcGK6dSbZm7MyA6/4c8fFjwBGPwnzgVtbspgY/qde82IEQI5+EMXDa9mywZNl2XkEO3IgeqQR6JtYsrTCt6r+2lofSXjkrVJwCtSosJf6LnP/PkRw21g00nshMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.255
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4YsjVh5MHQz1W5ZW;
	Tue, 11 Feb 2025 21:49:48 +0800 (CST)
Received: from kwepemo500009.china.huawei.com (unknown [7.202.194.199])
	by mail.maildlp.com (Postfix) with ESMTPS id 99B3B1402C4;
	Tue, 11 Feb 2025 21:54:14 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemo500009.china.huawei.com
 (7.202.194.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 11 Feb
 2025 21:54:14 +0800
From: Hongbo Li <lihongbo22@huawei.com>
To: <xiang@kernel.org>, <chao@kernel.org>
CC: <zbestahu@gmail.com>, <jefflexu@linux.alibaba.com>, <dhavale@google.com>,
	<linux-erofs@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<lihongbo22@huawei.com>
Subject: [PATCH v2 1/4] erofs: decouple the iterator on folio
Date: Tue, 11 Feb 2025 21:53:28 +0800
Message-ID: <20250211135331.933681-2-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250211135331.933681-1-lihongbo22@huawei.com>
References: <20250211135331.933681-1-lihongbo22@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemo500009.china.huawei.com (7.202.194.199)

When reading data in file-backed mount case, we need to iterate the each
mapping item to read the real data into memory. Currently, the iterator is
based on the folio structure. To make the code more compatibable, we move
the folio related logic out of iteration so that it only depends on the
iov_iter structure. This allows the reading process (such as direct io) to
reuse this without interacting with the folio structure.

We conducted the base performance test with fio (iosize is 4k), and the
modifications did not affect performance.

[Before]
  - first round
    seq read: IOPS=96.6k
    rand read: IOPS=4101

  - multi-round
    seq read: IOPS=188k
    rand read: IOPS=35.2k

[After]
  - first round
    seq read: IOPS=96.3k
    rand read: IOPS=4245

  - multi-round
    seq read: IOPS=184k
    rand read: IOPS=34.3k

Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
---
 fs/erofs/fileio.c | 72 +++++++++++++++++++++++++++++++++--------------
 1 file changed, 51 insertions(+), 21 deletions(-)

diff --git a/fs/erofs/fileio.c b/fs/erofs/fileio.c
index 0ffd1c63beeb..616dc93c0dc5 100644
--- a/fs/erofs/fileio.c
+++ b/fs/erofs/fileio.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2024, Alibaba Cloud
  */
 #include "internal.h"
+#include <linux/folio_queue.h>
 #include <trace/events/erofs.h>
 
 struct erofs_fileio_rq {
@@ -12,10 +13,15 @@ struct erofs_fileio_rq {
 	struct super_block *sb;
 };
 
+typedef void (fileio_rq_split_t)(void *data);
+
 struct erofs_fileio {
 	struct erofs_map_blocks map;
 	struct erofs_map_dev dev;
 	struct erofs_fileio_rq *rq;
+	struct inode *inode;
+	fileio_rq_split_t *split;
+	void *private;
 };
 
 static void erofs_fileio_ki_complete(struct kiocb *iocb, long ret)
@@ -43,6 +49,11 @@ static void erofs_fileio_ki_complete(struct kiocb *iocb, long ret)
 	kfree(rq);
 }
 
+static void erofs_folio_split(void *data)
+{
+	erofs_onlinefolio_split((struct folio *)data);
+}
+
 static void erofs_fileio_rq_submit(struct erofs_fileio_rq *rq)
 {
 	struct iov_iter iter;
@@ -85,17 +96,15 @@ void erofs_fileio_submit_bio(struct bio *bio)
 						   bio));
 }
 
-static int erofs_fileio_scan_folio(struct erofs_fileio *io, struct folio *folio)
+static int erofs_fileio_scan(struct erofs_fileio *io,
+			     loff_t pos, struct iov_iter *iter)
 {
-	struct inode *inode = folio_inode(folio);
+	struct inode *inode = io->inode;
 	struct erofs_map_blocks *map = &io->map;
-	unsigned int cur = 0, end = folio_size(folio), len, attached = 0;
-	loff_t pos = folio_pos(folio), ofs;
-	struct iov_iter iter;
-	struct bio_vec bv;
+	unsigned int cur = 0, end = iov_iter_count(iter), len, attached = 0;
+	loff_t ofs;
 	int err = 0;
 
-	erofs_onlinefolio_init(folio);
 	while (cur < end) {
 		if (!in_range(pos + cur, map->m_la, map->m_llen)) {
 			map->m_la = pos + cur;
@@ -105,7 +114,7 @@ static int erofs_fileio_scan_folio(struct erofs_fileio *io, struct folio *folio)
 				break;
 		}
 
-		ofs = folio_pos(folio) + cur - map->m_la;
+		ofs = pos + cur - map->m_la;
 		len = min_t(loff_t, map->m_llen - ofs, end - cur);
 		if (map->m_flags & EROFS_MAP_META) {
 			struct erofs_buf buf = __EROFS_BUF_INITIALIZER;
@@ -117,21 +126,17 @@ static int erofs_fileio_scan_folio(struct erofs_fileio *io, struct folio *folio)
 				err = PTR_ERR(src);
 				break;
 			}
-			bvec_set_folio(&bv, folio, len, cur);
-			iov_iter_bvec(&iter, ITER_DEST, &bv, 1, len);
-			if (copy_to_iter(src, len, &iter) != len) {
+			if (copy_to_iter(src, len, iter) != len) {
 				erofs_put_metabuf(&buf);
 				err = -EIO;
 				break;
 			}
 			erofs_put_metabuf(&buf);
 		} else if (!(map->m_flags & EROFS_MAP_MAPPED)) {
-			folio_zero_segment(folio, cur, cur + len);
-			attached = 0;
+			iov_iter_zero(len, iter);
 		} else {
 			if (io->rq && (map->m_pa + ofs != io->dev.m_pa ||
 				       map->m_deviceid != io->dev.m_deviceid)) {
-io_retry:
 				erofs_fileio_rq_submit(io->rq);
 				io->rq = NULL;
 			}
@@ -148,26 +153,39 @@ static int erofs_fileio_scan_folio(struct erofs_fileio *io, struct folio *folio)
 				io->rq->bio.bi_iter.bi_sector = io->dev.m_pa >> 9;
 				attached = 0;
 			}
-			if (!attached++)
-				erofs_onlinefolio_split(folio);
-			if (!bio_add_folio(&io->rq->bio, folio, len, cur))
-				goto io_retry;
+			if (bio_iov_iter_get_pages(&io->rq->bio, iter)) {
+				err = -EIO;
+				break;
+			}
+			if (io->split && !attached++)
+				io->split(io->private);
 			io->dev.m_pa += len;
 		}
 		cur += len;
 	}
-	erofs_onlinefolio_end(folio, err);
 	return err;
 }
 
 static int erofs_fileio_read_folio(struct file *file, struct folio *folio)
 {
 	struct erofs_fileio io = {};
+	struct folio_queue folioq;
+	struct iov_iter iter;
 	int err;
 
+	folioq_init(&folioq, 0);
+	folioq_append(&folioq, folio);
+	iov_iter_folio_queue(&iter, ITER_DEST, &folioq, 0, 0, folio_size(folio));
+	io.inode = folio_inode(folio);
+	io.split = erofs_folio_split;
+	io.private = folio;
+
 	trace_erofs_read_folio(folio, true);
-	err = erofs_fileio_scan_folio(&io, folio);
+	erofs_onlinefolio_init(folio);
+	err = erofs_fileio_scan(&io, folio_pos(folio), &iter);
+	erofs_onlinefolio_end(folio, err);
 	erofs_fileio_rq_submit(io.rq);
+
 	return err;
 }
 
@@ -175,13 +193,25 @@ static void erofs_fileio_readahead(struct readahead_control *rac)
 {
 	struct inode *inode = rac->mapping->host;
 	struct erofs_fileio io = {};
+	struct folio_queue folioq;
+	struct iov_iter iter;
 	struct folio *folio;
 	int err;
 
+	io.inode = inode;
+	io.split = erofs_folio_split;
 	trace_erofs_readpages(inode, readahead_index(rac),
 			      readahead_count(rac), true);
 	while ((folio = readahead_folio(rac))) {
-		err = erofs_fileio_scan_folio(&io, folio);
+		folioq_init(&folioq, 0);
+		folioq_append(&folioq, folio);
+		iov_iter_folio_queue(&iter, ITER_DEST, &folioq, 0, 0, folio_size(folio));
+
+		io.private = folio;
+		erofs_onlinefolio_init(folio);
+		err = erofs_fileio_scan(&io, folio_pos(folio), &iter);
+		erofs_onlinefolio_end(folio, err);
+
 		if (err && err != -EINTR)
 			erofs_err(inode->i_sb, "readahead error at folio %lu @ nid %llu",
 				  folio->index, EROFS_I(inode)->nid);
-- 
2.34.1

