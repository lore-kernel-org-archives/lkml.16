Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C352926BD9A
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 13:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739282063; cv=none; b=CgY8e+eskCLq6lu6Xfv2DsgMYUmE8GkMICboZNfXX8lAzKNL9dwrNYtdXyqjjw4noJVzE+KtgbjZClazS9YUuH98+EgVHpM36vbVhmXRhOBY72NzbPypp1Y/WKTBpVspzJlkA0XrYOHHe/JWl2WNkkpQtQTumZEvcTbLVsPC+30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739282063; c=relaxed/simple;
	bh=ZMKELNB2ZjW7QKdSw7cU/Zd/ZXcgPfCNsfcbAb8+jjw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OZc861eMsLYlarV8bUBEEmjqX5oqTEwZnlD5pdbKeabYXyZ9dFWjQ6Aj6ixC9nVckJTAVbt1usceIMDIsDZxnqKwadwQB3NKMv35RbxlYZAX5h+UBg0b8HoAfHNnHyf2XgMUlpPHyJYWq00EGy+tZ/4/tges2kbJC+pAdGuTaMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4YsjZ00GZ1zrSvn;
	Tue, 11 Feb 2025 21:52:40 +0800 (CST)
Received: from kwepemo500009.china.huawei.com (unknown [7.202.194.199])
	by mail.maildlp.com (Postfix) with ESMTPS id 034001802D0;
	Tue, 11 Feb 2025 21:54:15 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemo500009.china.huawei.com
 (7.202.194.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 11 Feb
 2025 21:54:14 +0800
From: Hongbo Li <lihongbo22@huawei.com>
To: <xiang@kernel.org>, <chao@kernel.org>
CC: <zbestahu@gmail.com>, <jefflexu@linux.alibaba.com>, <dhavale@google.com>,
	<linux-erofs@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<lihongbo22@huawei.com>
Subject: [PATCH v2 2/4] erofs: decouple callback action for fileio bio
Date: Tue, 11 Feb 2025 21:53:29 +0800
Message-ID: <20250211135331.933681-3-lihongbo22@huawei.com>
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

Introduce erofs_fileio_end_folio as the .bi_end_io callback for fileio
bio.

Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
---
 fs/erofs/fileio.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/fs/erofs/fileio.c b/fs/erofs/fileio.c
index 616dc93c0dc5..cdd432ec266c 100644
--- a/fs/erofs/fileio.c
+++ b/fs/erofs/fileio.c
@@ -11,6 +11,7 @@ struct erofs_fileio_rq {
 	struct bio bio;
 	struct kiocb iocb;
 	struct super_block *sb;
+	ssize_t ret;
 };
 
 typedef void (fileio_rq_split_t)(void *data);
@@ -22,14 +23,15 @@ struct erofs_fileio {
 	struct inode *inode;
 	fileio_rq_split_t *split;
 	void *private;
+	bio_end_io_t *end;
 };
 
 static void erofs_fileio_ki_complete(struct kiocb *iocb, long ret)
 {
 	struct erofs_fileio_rq *rq =
 			container_of(iocb, struct erofs_fileio_rq, iocb);
-	struct folio_iter fi;
 
+	rq->ret = ret;
 	if (ret > 0) {
 		if (ret != rq->bio.bi_iter.bi_size) {
 			bio_advance(&rq->bio, ret);
@@ -37,14 +39,8 @@ static void erofs_fileio_ki_complete(struct kiocb *iocb, long ret)
 		}
 		ret = 0;
 	}
-	if (rq->bio.bi_end_io) {
+	if (rq->bio.bi_end_io)
 		rq->bio.bi_end_io(&rq->bio);
-	} else {
-		bio_for_each_folio_all(fi, &rq->bio) {
-			DBG_BUGON(folio_test_uptodate(fi.folio));
-			erofs_onlinefolio_end(fi.folio, ret);
-		}
-	}
 	bio_uninit(&rq->bio);
 	kfree(rq);
 }
@@ -54,6 +50,18 @@ static void erofs_folio_split(void *data)
 	erofs_onlinefolio_split((struct folio *)data);
 }
 
+static void erofs_fileio_end_folio(struct bio *bio)
+{
+	struct erofs_fileio_rq *rq =
+			container_of(bio, struct erofs_fileio_rq, bio);
+	struct folio_iter fi;
+
+	bio_for_each_folio_all(fi, &rq->bio) {
+		DBG_BUGON(folio_test_uptodate(fi.folio));
+		erofs_onlinefolio_end(fi.folio, rq->ret >= 0 ? 0 : rq->ret);
+	}
+}
+
 static void erofs_fileio_rq_submit(struct erofs_fileio_rq *rq)
 {
 	struct iov_iter iter;
@@ -151,6 +159,7 @@ static int erofs_fileio_scan(struct erofs_fileio *io,
 					break;
 				io->rq = erofs_fileio_rq_alloc(&io->dev);
 				io->rq->bio.bi_iter.bi_sector = io->dev.m_pa >> 9;
+				io->rq->bio.bi_end_io = io->end;
 				attached = 0;
 			}
 			if (bio_iov_iter_get_pages(&io->rq->bio, iter)) {
@@ -177,6 +186,7 @@ static int erofs_fileio_read_folio(struct file *file, struct folio *folio)
 	folioq_append(&folioq, folio);
 	iov_iter_folio_queue(&iter, ITER_DEST, &folioq, 0, 0, folio_size(folio));
 	io.inode = folio_inode(folio);
+	io.end = erofs_fileio_end_folio;
 	io.split = erofs_folio_split;
 	io.private = folio;
 
@@ -199,6 +209,7 @@ static void erofs_fileio_readahead(struct readahead_control *rac)
 	int err;
 
 	io.inode = inode;
+	io.end = erofs_fileio_end_folio;
 	io.split = erofs_folio_split;
 	trace_erofs_readpages(inode, readahead_index(rac),
 			      readahead_count(rac), true);
-- 
2.34.1

