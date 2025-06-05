Received: from SHSQR01.spreadtrum.com (unknown [222.66.158.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE951C27
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 07:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=222.66.158.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749107991; cv=none; b=iJE7+w5jgkba0Ane5rna2zl8VrBIGfdPbSHhhLanv3lPVbR+MyYK/Mq8PZvb4ZNMCoAa6H4Kj6HPktIMqFby34t1y3sqWG7o3+yPjEi7sZPHVr+L/vjTAQ6Ib02gwT1bHl91sg1Y2R5hIC3nhfnzz7IeuWv2upL5Ynqfb3RWhig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749107991; c=relaxed/simple;
	bh=wrOzrOpItq9PklhttnH4+ERkE/iekakTgs9ldslFJr4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Nb1KWZnRU21X6nNpFWTcjrw++apU0KWwjfBt0Pb1oHhEuVAMPXPV7alEMAmJv+Zzk2molr1lXXkt9P//sH73MDFGnudScJqo0FWE3idFo301/fGJapuThgslrCBfPc8eZeM7BVPwD3i37yUHZTk7zQPApu8Zf+6dlSujYfuJLPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=unisoc.com; spf=pass smtp.mailfrom=unisoc.com; arc=none smtp.client-ip=222.66.158.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=unisoc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unisoc.com
Received: from dlp.unisoc.com ([10.29.3.86])
	by SHSQR01.spreadtrum.com with ESMTP id 5557Iqwi020105;
	Thu, 5 Jun 2025 15:18:52 +0800 (+08)
	(envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
	by dlp.unisoc.com (SkyGuard) with ESMTPS id 4bCbMc70cnz2NnHTV;
	Thu,  5 Jun 2025 15:15:56 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.48; Thu, 5 Jun 2025 15:18:49 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
CC: <linux-f2fs-devel@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>,
        <niuzhiguo84@gmail.com>, <zhiguo.niu@unisoc.com>, <ke.wang@unisoc.com>,
        <Hao_hao.Wang@unisoc.com>, <baocong.liu@unisoc.com>
Subject: [PATCH v3] f2fs: compress: fix UAF of f2fs_inode_info in f2fs_free_dic
Date: Thu, 5 Jun 2025 15:18:40 +0800
Message-ID: <1749107920-17958-1-git-send-email-zhiguo.niu@unisoc.com>
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
X-MAIL:SHSQR01.spreadtrum.com 5557Iqwi020105

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

This patch use igrab before f2fs_free_dic and iput after free the dic when dic free
action is done by kworker.

Cc: Daeho Jeong <daehojeong@google.com>
Fixes: bff139b49d9f ("f2fs: handle decompress only post processing in softirq")
Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
Signed-off-by: Baocong Liu <baocong.liu@unisoc.com>
---
v3: use igrab to replace __iget
v2: use __iget/iput function
---
 fs/f2fs/compress.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index b3c1df9..729ad16 100644
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
 
@@ -1783,16 +1785,18 @@ static void f2fs_late_free_dic(struct work_struct *work)
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
+			/* use igrab to avoid inode is evicted simultaneously */
+			f2fs_bug_on(F2FS_I_SB(dic->inode), !igrab(dic->inode));
 			queue_work(F2FS_I_SB(dic->inode)->post_read_wq,
 					&dic->free_work);
 		}
-- 
1.9.1

