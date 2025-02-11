Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C729D24BD0A
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 13:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.255
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739282066; cv=none; b=MckU3Sn0lyKj2xKVI3OmCyp8E7QE1uRUTXsWH1n28joN4M6gCGK3AkLeJXRZCmDfAY4s1ty1FamBC7jiHeD1v7zkhyrLWUWmAGEoiEWSjVBuGenDeFEGTwsn6LODDDZM0R0EJ7Z6Q4QYZeV2YYQFbcSv58aDU/QxoQdToSQ4cQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739282066; c=relaxed/simple;
	bh=6m4pOdfZ5pRJ8RcVP608oycyRdOTBMRDArfZbZhrsDw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BradyhMBXyqi6ZIp9sCetD55EHHIjJrGLdtSnVtdO1GAiwzQg/yriJ4FRyj7xZG160fb/Zld/48BrteFE68K3DkqzWucsWwJQdQkttbEMDrXpZZbmNJVdoG1KrCt69QBK6VazgDlzRu8mX3D1C6eB2VZnyLHGTeng1x8lF2bKjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.255
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4YsjVj3jsBz1W5Zn;
	Tue, 11 Feb 2025 21:49:49 +0800 (CST)
Received: from kwepemo500009.china.huawei.com (unknown [7.202.194.199])
	by mail.maildlp.com (Postfix) with ESMTPS id 609B51402C3;
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
Subject: [PATCH v2 3/4] erofs: add erofs_fileio_direct_io helper to handle direct io
Date: Tue, 11 Feb 2025 21:53:30 +0800
Message-ID: <20250211135331.933681-4-lihongbo22@huawei.com>
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

erofs has add file-backed mount support. In this scenario, only buffer
io is allowed. So we enhance the io mode by implementing the direct
io. Also, this can make the iov_iter (user buffer) interact with the
backed file's page cache directly.

To be mentioned, the direct io is atomic, if the part of the iov_iter
of direct io failed, the whole direct io also fails.

Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
---
 fs/erofs/fileio.c | 71 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/fs/erofs/fileio.c b/fs/erofs/fileio.c
index cdd432ec266c..b652e3df050c 100644
--- a/fs/erofs/fileio.c
+++ b/fs/erofs/fileio.c
@@ -12,6 +12,7 @@ struct erofs_fileio_rq {
 	struct kiocb iocb;
 	struct super_block *sb;
 	ssize_t ret;
+	void *private;
 };
 
 typedef void (fileio_rq_split_t)(void *data);
@@ -24,6 +25,11 @@ struct erofs_fileio {
 	fileio_rq_split_t *split;
 	void *private;
 	bio_end_io_t *end;
+	/* the following members control the sync call */
+	struct completion ctr;
+	refcount_t ref;
+	size_t total;
+	size_t done;
 };
 
 static void erofs_fileio_ki_complete(struct kiocb *iocb, long ret)
@@ -50,6 +56,13 @@ static void erofs_folio_split(void *data)
 	erofs_onlinefolio_split((struct folio *)data);
 }
 
+static void erofs_iter_split(void *data)
+{
+	struct erofs_fileio *io = (struct erofs_fileio *)data;
+
+	refcount_inc(&io->ref);
+}
+
 static void erofs_fileio_end_folio(struct bio *bio)
 {
 	struct erofs_fileio_rq *rq =
@@ -62,6 +75,25 @@ static void erofs_fileio_end_folio(struct bio *bio)
 	}
 }
 
+static void erofs_fileio_iter_complete(struct erofs_fileio *io)
+{
+	if (!refcount_dec_and_test(&io->ref))
+		return;
+	complete(&io->ctr);
+}
+
+static void erofs_fileio_end_iter(struct bio *bio)
+{
+	struct erofs_fileio_rq *rq =
+			container_of(bio, struct erofs_fileio_rq, bio);
+	struct erofs_fileio *io = (struct erofs_fileio *)rq->private;
+
+	if (rq->ret > 0)
+		io->done += rq->ret;
+
+	erofs_fileio_iter_complete(io);
+}
+
 static void erofs_fileio_rq_submit(struct erofs_fileio_rq *rq)
 {
 	struct iov_iter iter;
@@ -158,6 +190,7 @@ static int erofs_fileio_scan(struct erofs_fileio *io,
 				if (err)
 					break;
 				io->rq = erofs_fileio_rq_alloc(&io->dev);
+				io->rq->private = io;
 				io->rq->bio.bi_iter.bi_sector = io->dev.m_pa >> 9;
 				io->rq->bio.bi_end_io = io->end;
 				attached = 0;
@@ -230,7 +263,45 @@ static void erofs_fileio_readahead(struct readahead_control *rac)
 	erofs_fileio_rq_submit(io.rq);
 }
 
+static ssize_t erofs_fileio_direct_io(struct kiocb *iocb, struct iov_iter *iter)
+{
+	struct file *file = iocb->ki_filp;
+	struct inode *inode = file_inode(file);
+	size_t i_size = i_size_read(inode);
+	struct erofs_fileio io = {};
+	int err;
+
+	if (unlikely(iocb->ki_pos >= i_size))
+		return 0;
+
+	iter->count = min_t(size_t, iter->count,
+			    max_t(size_t, 0, i_size - iocb->ki_pos));
+	io.total = iter->count;
+	if (!io.total)
+		return 0;
+
+	io.inode = inode;
+	io.done = 0;
+	io.split = erofs_iter_split;
+	io.private = &io;
+	io.end = erofs_fileio_end_iter;
+	init_completion(&io.ctr);
+	refcount_set(&io.ref, 1);
+	err = erofs_fileio_scan(&io, iocb->ki_pos, iter);
+	erofs_fileio_rq_submit(io.rq);
+
+	erofs_fileio_iter_complete(&io);
+	wait_for_completion(&io.ctr);
+	if (io.total != io.done) {
+		iov_iter_revert(iter, io.done);
+		return err ?: -EIO;
+	}
+
+	return io.done;
+}
+
 const struct address_space_operations erofs_fileio_aops = {
 	.read_folio = erofs_fileio_read_folio,
 	.readahead = erofs_fileio_readahead,
+	.direct_IO = erofs_fileio_direct_io,
 };
-- 
2.34.1

