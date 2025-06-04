Received: from SHSQR01.spreadtrum.com (unknown [222.66.158.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB76028ECC9
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 11:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=222.66.158.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749037117; cv=none; b=Xin6UU09rY8/8okA3AZt68UeqTVR4RhBt1EQADI5MTQfupo6Lq20/4iToAjc+/5mL38NBlGe573ixs3jPZLzc7rGeSPt7Xc+yNWjlu9G6iuzxlsB7Y3eNmJfRYtI2NMzm+aqitYwj6ngMG1ZdAmYbaOrCuAotVG65g/t2qZmTyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749037117; c=relaxed/simple;
	bh=bkWYBN0z7L5PXWrZDWUNaAzGfO2efcEkm/tCxSovQGc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hv045OFPASdvNwYQ6U6l/bx+UEiM6laVVVAH6e2hvbA9XSV1Tc7D0KkDZe/YT13jVGgKqm8VwMEiZ9fpFZuvt50jvRmC4DPwIIA7hmxHnIHPwfh9gYytwD/IKa81Xp6c1YtTRxjg4ehfWasURxo7HMa20Asogp7Mtq2tflHvLkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=unisoc.com; spf=pass smtp.mailfrom=unisoc.com; arc=none smtp.client-ip=222.66.158.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=unisoc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unisoc.com
Received: from dlp.unisoc.com ([10.29.3.86])
	by SHSQR01.spreadtrum.com with ESMTP id 554BbvWC063964;
	Wed, 4 Jun 2025 19:37:57 +0800 (+08)
	(envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
	by dlp.unisoc.com (SkyGuard) with ESMTPS id 4bC59374gHz2NZDyW;
	Wed,  4 Jun 2025 19:35:03 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.48; Wed, 4 Jun 2025 19:37:55 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
CC: <linux-f2fs-devel@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>,
        <niuzhiguo84@gmail.com>, <zhiguo.niu@unisoc.com>, <ke.wang@unisoc.com>,
        <Hao_hao.Wang@unisoc.com>, <baocong.liu@unisoc.com>
Subject: [PATCH v2] f2fs: compress: fix UAF of f2fs_inode_info in f2fs_free_dic
Date: Wed, 4 Jun 2025 19:37:39 +0800
Message-ID: <1749037059-4243-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL:SHSQR01.spreadtrum.com 554BbvWC063964

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

This patch use __iget before f2fs_free_dic and iput after free the dic.

Cc: Daeho Jeong <daehojeong@google.com>
Fixes: bff139b49d9f ("f2fs: handle decompress only post processing in softirq")
Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
Signed-off-by: Baocong Liu <baocong.liu@unisoc.com>
---
v2: use __iget/iput function
---
 fs/f2fs/compress.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index b3c1df9..3f0c18d 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1687,7 +1687,7 @@ static void f2fs_release_decomp_mem(struct decompress_io_ctx *dic,
 }
 
 static void f2fs_free_dic(struct decompress_io_ctx *dic,
-		bool bypass_destroy_callback);
+		bool bypass_destroy_callback, bool late_free);
 
 struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
 {
@@ -1743,12 +1743,12 @@ struct decompress_io_ctx *f2fs_alloc_dic(struct compress_ctx *cc)
 	return dic;
 
 out_free:
-	f2fs_free_dic(dic, true);
+	f2fs_free_dic(dic, true, false);
 	return ERR_PTR(ret);
 }
 
 static void f2fs_free_dic(struct decompress_io_ctx *dic,
-		bool bypass_destroy_callback)
+		bool bypass_destroy_callback, bool late_free)
 {
 	int i;
 
@@ -1775,6 +1775,8 @@ static void f2fs_free_dic(struct decompress_io_ctx *dic,
 	}
 
 	page_array_free(dic->inode, dic->rpages, dic->nr_rpages);
+	if (late_free)
+		iput(dic->inode);
 	kmem_cache_free(dic_entry_slab, dic);
 }
 
@@ -1783,16 +1785,20 @@ static void f2fs_late_free_dic(struct work_struct *work)
 	struct decompress_io_ctx *dic =
 		container_of(work, struct decompress_io_ctx, free_work);
 
-	f2fs_free_dic(dic, false);
+	f2fs_free_dic(dic, false, true);
 }
 
 static void f2fs_put_dic(struct decompress_io_ctx *dic, bool in_task)
 {
 	if (refcount_dec_and_test(&dic->refcnt)) {
 		if (in_task) {
-			f2fs_free_dic(dic, false);
+			f2fs_free_dic(dic, false, false);
 		} else {
 			INIT_WORK(&dic->free_work, f2fs_late_free_dic);
+			/* to avoid inode is evicted simultaneously */
+			spin_lock(&dic->inode->i_lock);
+			__iget(dic->inode);
+			spin_unlock(&dic->inode->i_lock);
 			queue_work(F2FS_I_SB(dic->inode)->post_read_wq,
 					&dic->free_work);
 		}
-- 
1.9.1

