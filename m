Received: from SHSQR01.spreadtrum.com (mx1.unisoc.com [222.66.158.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B255F1D514E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 01:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=222.66.158.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749779515; cv=none; b=ZxD/I4cHfnMVTMT+mgz9RhA/YT3ZZXhvekWHfbkLU+4pDN3fOz2hAG6zlx7EaN0D/o+28dP/1JMoYAdUhL32wJSrL40ny+L/l0Vg3t9mKH5m5fjMu5/V5uG9jzhya/SeXr0sbUurM3kqEXbu+tWGyXWrtXTtiq8ozOn1mTBM968=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749779515; c=relaxed/simple;
	bh=FExD8GlVNoWZSYXm+/2aB6bOzWU1RU6TzpyMqSHjg5s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kx0hsjfELauJXp4RIeM/Jb4u9wsmdUByBvZZUgvHf/7YiEBg7g8ncxhwuMJA+sz/mpgGWSQSaQPxkbqIuU6O4Ls2/aJRpxx3dtdx5fzXCSirCyl2RXPnKZwPKOSvFLiXic+i/iX8ZqlFKExJq7Fjgyz+dOz+WNobQ43wbP/xChM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=unisoc.com; spf=pass smtp.mailfrom=unisoc.com; arc=none smtp.client-ip=222.66.158.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=unisoc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unisoc.com
Received: from SHSQR01.spreadtrum.com (localhost [127.0.0.2] (may be forged))
	by SHSQR01.spreadtrum.com with ESMTP id 55D1pohV030506
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 09:51:50 +0800 (+08)
	(envelope-from Zhiguo.Niu@unisoc.com)
Received: from dlp.unisoc.com ([10.29.3.86])
	by SHSQR01.spreadtrum.com with ESMTP id 55D1p2IR026532;
	Fri, 13 Jun 2025 09:51:02 +0800 (+08)
	(envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
	by dlp.unisoc.com (SkyGuard) with ESMTPS id 4bJMjM6Tffz2NtGrn;
	Fri, 13 Jun 2025 09:47:51 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.48; Fri, 13 Jun 2025 09:51:00 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
CC: <linux-f2fs-devel@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>,
        <niuzhiguo84@gmail.com>, <zhiguo.niu@unisoc.com>, <ke.wang@unisoc.com>,
        <Hao_hao.Wang@unisoc.com>, <baocong.liu@unisoc.com>
Subject: [PATCH 2/2] f2fs: compress: fix UAF of f2fs_inode_info in f2fs_free_dic
Date: Fri, 13 Jun 2025 09:50:45 +0800
Message-ID: <1749779445-29125-2-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1749779445-29125-1-git-send-email-zhiguo.niu@unisoc.com>
References: <1749779445-29125-1-git-send-email-zhiguo.niu@unisoc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL:SHSQR01.spreadtrum.com 55D1p2IR026532

The decompress_io_ctx may be released asynchronously after
I/O completion. If this file is deleted immediately after read,
and the kworker of processing post_read_wq has not been executed yet
due to high workloads, It is possible that the inode(f2fs_inode_info)
is evicted and freed before it is used f2fs_free_dic.

    The UAF case as below:
    Thread A                                      Thread B
    - f2fs_decompress_end_io
     - f2fs_put_dic
      - queue_work
        add free_dic work to post_read_wq
                                                   - do_unlink
                                                    - iput
                                                     - evict
                                                      - call_rcu
    This file is deleted after read.

    Thread C                                 kworker to process post_read_wq
    - rcu_do_batch
     - f2fs_free_inode
      - kmem_cache_free
     inode is freed by rcu
                                             - process_scheduled_works
                                              - f2fs_late_free_dic
                                               - f2fs_free_dic
                                                - f2fs_release_decomp_mem
                                      read (dic->inode)->i_compress_algorithm

This patch store compress_algorithm and sbi in dic to avoid inode UAF.

In addition, the previous solution is deprecated in [1] may cause system hang.
[1] https://lore.kernel.org/all/c36ab955-c8db-4a8b-a9d0-f07b5f426c3f@kernel.org

Cc: Daeho Jeong <daehojeong@google.com>
Fixes: bff139b49d9f ("f2fs: handle decompress only post processing in softirq")
Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
Signed-off-by: Baocong Liu <baocong.liu@unisoc.com>
---
 fs/f2fs/compress.c | 40 ++++++++++++++++++++--------------------
 fs/f2fs/f2fs.h     |  2 ++
 2 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 832a484..8cbb803 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -214,13 +214,13 @@ static int lzo_decompress_pages(struct decompress_io_ctx *dic)
 	ret = lzo1x_decompress_safe(dic->cbuf->cdata, dic->clen,
 						dic->rbuf, &dic->rlen);
 	if (ret != LZO_E_OK) {
-		f2fs_err_ratelimited(F2FS_I_SB(dic->inode),
+		f2fs_err_ratelimited(dic->sbi,
 				"lzo decompress failed, ret:%d", ret);
 		return -EIO;
 	}
 
 	if (dic->rlen != PAGE_SIZE << dic->log_cluster_size) {
-		f2fs_err_ratelimited(F2FS_I_SB(dic->inode),
+		f2fs_err_ratelimited(dic->sbi,
 				"lzo invalid rlen:%zu, expected:%lu",
 				dic->rlen, PAGE_SIZE << dic->log_cluster_size);
 		return -EIO;
@@ -294,13 +294,13 @@ static int lz4_decompress_pages(struct decompress_io_ctx *dic)
 	ret = LZ4_decompress_safe(dic->cbuf->cdata, dic->rbuf,
 						dic->clen, dic->rlen);
 	if (ret < 0) {
-		f2fs_err_ratelimited(F2FS_I_SB(dic->inode),
+		f2fs_err_ratelimited(dic->sbi,
 				"lz4 decompress failed, ret:%d", ret);
 		return -EIO;
 	}
 
 	if (ret != PAGE_SIZE << dic->log_cluster_size) {
-		f2fs_err_ratelimited(F2FS_I_SB(dic->inode),
+		f2fs_err_ratelimited(dic->sbi,
 				"lz4 invalid ret:%d, expected:%lu",
 				ret, PAGE_SIZE << dic->log_cluster_size);
 		return -EIO;
@@ -422,13 +422,13 @@ static int zstd_init_decompress_ctx(struct decompress_io_ctx *dic)
 
 	workspace_size = zstd_dstream_workspace_bound(max_window_size);
 
-	workspace = f2fs_vmalloc(F2FS_I_SB(dic->inode), workspace_size);
+	workspace = f2fs_vmalloc(dic->sbi, workspace_size);
 	if (!workspace)
 		return -ENOMEM;
 
 	stream = zstd_init_dstream(max_window_size, workspace, workspace_size);
 	if (!stream) {
-		f2fs_err_ratelimited(F2FS_I_SB(dic->inode),
+		f2fs_err_ratelimited(dic->sbi,
 				"%s zstd_init_dstream failed", __func__);
 		vfree(workspace);
 		return -EIO;
@@ -464,14 +464,14 @@ static int zstd_decompress_pages(struct decompress_io_ctx *dic)
 
 	ret = zstd_decompress_stream(stream, &outbuf, &inbuf);
 	if (zstd_is_error(ret)) {
-		f2fs_err_ratelimited(F2FS_I_SB(dic->inode),
+		f2fs_err_ratelimited(dic->sbi,
 				"%s zstd_decompress_stream failed, ret: %d",
 				__func__, zstd_get_error_code(ret));
 		return -EIO;
 	}
 
 	if (dic->rlen != outbuf.pos) {
-		f2fs_err_ratelimited(F2FS_I_SB(dic->inode),
+		f2fs_err_ratelimited(dic->sbi,
 				"%s ZSTD invalid rlen:%zu, expected:%lu",
 				__func__, dic->rlen,
 				PAGE_SIZE << dic->log_cluster_size);
@@ -733,7 +733,7 @@ static void f2fs_release_decomp_mem(struct decompress_io_ctx *dic,
 
 void f2fs_decompress_cluster(struct decompress_io_ctx *dic, bool in_task)
 {
-	struct f2fs_sb_info *sbi = F2FS_I_SB(dic->inode);
+	struct f2fs_sb_info *sbi = dic->sbi;
 	struct f2fs_inode_info *fi = F2FS_I(dic->inode);
 	const struct f2fs_compress_ops *cops =
 			f2fs_cops[fi->i_compress_algorithm];
@@ -806,7 +806,7 @@ void f2fs_end_read_compressed_page(struct page *page, bool failed,
 {
 	struct decompress_io_ctx *dic =
 			(struct decompress_io_ctx *)page_private(page);
-	struct f2fs_sb_info *sbi = F2FS_I_SB(dic->inode);
+	struct f2fs_sb_info *sbi = dic->sbi;
 
 	dec_page_count(sbi, F2FS_RD_DATA);
 
@@ -1632,14 +1632,13 @@ static inline bool allow_memalloc_for_decomp(struct f2fs_sb_info *sbi,
 static int f2fs_prepare_decomp_mem(struct decompress_io_ctx *dic,
 		bool pre_alloc)
 {
-	const struct f2fs_compress_ops *cops =
-		f2fs_cops[F2FS_I(dic->inode)->i_compress_algorithm];
+	const struct f2fs_compress_ops *cops = f2fs_cops[dic->compress_algorithm];
 	int i;
 
-	if (!allow_memalloc_for_decomp(F2FS_I_SB(dic->inode), pre_alloc))
+	if (!allow_memalloc_for_decomp(dic->sbi, pre_alloc))
 		return 0;
 
-	dic->tpages = page_array_alloc(F2FS_I_SB(dic->inode), dic->cluster_size);
+	dic->tpages = page_array_alloc(dic->sbi, dic->cluster_size);
 	if (!dic->tpages)
 		return -ENOMEM;
 
@@ -1669,10 +1668,9 @@ static int f2fs_prepare_decomp_mem(struct decompress_io_ctx *dic,
 static void f2fs_release_decomp_mem(struct decompress_io_ctx *dic,
 		bool bypass_destroy_callback, bool pre_alloc)
 {
-	const struct f2fs_compress_ops *cops =
-		f2fs_cops[F2FS_I(dic->inode)->i_compress_algorithm];
+	const struct f2fs_compress_ops *cops = f2fs_cops[dic->compress_algorithm];
 
-	if (!allow_memalloc_for_decomp(F2FS_I_SB(dic->inode), pre_alloc))
+	if (!allow_memalloc_for_decomp(dic->sbi, pre_alloc))
 		return;
 
 	if (!bypass_destroy_callback && cops->destroy_decompress_ctx)
@@ -1707,6 +1705,8 @@ struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
 
 	dic->magic = F2FS_COMPRESSED_PAGE_MAGIC;
 	dic->inode = cc->inode;
+	dic->sbi = sbi;
+	dic->compress_algorithm = F2FS_I(cc->inode)->i_compress_algorithm;
 	atomic_set(&dic->remaining_pages, cc->nr_cpages);
 	dic->cluster_idx = cc->cluster_idx;
 	dic->cluster_size = cc->cluster_size;
@@ -1750,7 +1750,8 @@ static void f2fs_free_dic(struct decompress_io_ctx *dic,
 		bool bypass_destroy_callback)
 {
 	int i;
-	struct f2fs_sb_info *sbi = F2FS_I_SB(dic->inode);
+	/* use sbi in dic to avoid UFA of dic->inode*/
+	struct f2fs_sb_info *sbi = dic->sbi;
 
 	f2fs_release_decomp_mem(dic, bypass_destroy_callback, true);
 
@@ -1793,8 +1794,7 @@ static void f2fs_put_dic(struct decompress_io_ctx *dic, bool in_task)
 			f2fs_free_dic(dic, false);
 		} else {
 			INIT_WORK(&dic->free_work, f2fs_late_free_dic);
-			queue_work(F2FS_I_SB(dic->inode)->post_read_wq,
-					&dic->free_work);
+			queue_work(dic->sbi->post_read_wq, &dic->free_work);
 		}
 	}
 }
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9333a22b..da2137e 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1536,6 +1536,7 @@ struct compress_io_ctx {
 struct decompress_io_ctx {
 	u32 magic;			/* magic number to indicate page is compressed */
 	struct inode *inode;		/* inode the context belong to */
+	struct f2fs_sb_info *sbi;	/* f2fs_sb_info pointer */
 	pgoff_t cluster_idx;		/* cluster index number */
 	unsigned int cluster_size;	/* page count in cluster */
 	unsigned int log_cluster_size;	/* log of cluster size */
@@ -1576,6 +1577,7 @@ struct decompress_io_ctx {
 
 	bool failed;			/* IO error occurred before decompression? */
 	bool need_verity;		/* need fs-verity verification after decompression? */
+	unsigned char compress_algorithm;	/* backup algorithm type */
 	void *private;			/* payload buffer for specified decompression algorithm */
 	void *private2;			/* extra payload buffer */
 	struct work_struct verity_work;	/* work to verify the decompressed pages */
-- 
1.9.1

