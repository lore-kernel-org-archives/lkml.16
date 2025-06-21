Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527B7EAC6
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 14:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750516039; cv=none; b=eaaHd2YnoQU8nixcvdHxMxr1Cq8ehbSUov0RB+32IwjmKdxwoW+4Y53TvHAjXdFeupDNlL/okiY6EV1nYO4OaJT0T93ZHGjaQbfuKA2Ej+isgwKXtQhkScod1prvjFACCy16fDpH0I/BcMErDrDoU9KT6Hll3XYkQDQqmZA0AIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750516039; c=relaxed/simple;
	bh=0MdFw4ehLSSpE3Iq9nRUjhjj7+K2E8iVjs/Vm0LIXTY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=rGzA/+8Hwq5/fFB841YQHB2ehRIaAgP+EhTCXZ9VH0+UMBLiOMyoJDRpajdddTfyRByih/01/lLI95j0+Iglt0d7wVL8LJanMeaQSNnl0dTWJYSwnjq2rBM0fgM5AXAwDTl4kglMs5znd5r/u2Ytea/Xq+qg9TvcOaY2Vc84EsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 55LERCwr007953;
	Sat, 21 Jun 2025 23:27:12 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 55LERCfZ007950
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Sat, 21 Jun 2025 23:27:12 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <9a1a4a25-f7cb-4eaa-bcaa-d655a444076f@I-love.SAKURA.ne.jp>
Date: Sat, 21 Jun 2025 23:27:12 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [ocfs2?] possible deadlock in
 ocfs2_try_remove_refcount_tree
To: syzbot <syzbot+1fed2de07d8e11a3ec1b@syzkaller.appspotmail.com>,
        LKML <linux-kernel@vger.kernel.org>
References: <00000000000032dd730620055fde@google.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <00000000000032dd730620055fde@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav303.rs.sakura.ne.jp

#syz test

diff --git a/fs/ocfs2/ocfs2.h b/fs/ocfs2/ocfs2.h
index 6aaa94c554c1..8bdeea60742a 100644
--- a/fs/ocfs2/ocfs2.h
+++ b/fs/ocfs2/ocfs2.h
@@ -494,8 +494,6 @@ struct ocfs2_super
 	struct rb_root	osb_rf_lock_tree;
 	struct ocfs2_refcount_tree *osb_ref_tree_lru;
 
-	struct mutex system_file_mutex;
-
 	/*
 	 * OCFS2 needs to schedule several different types of work which
 	 * require cluster locking, disk I/O, recovery waits, etc. Since these
diff --git a/fs/ocfs2/refcounttree.c b/fs/ocfs2/refcounttree.c
index 8f732742b26e..c8467b92b64e 100644
--- a/fs/ocfs2/refcounttree.c
+++ b/fs/ocfs2/refcounttree.c
@@ -928,8 +928,8 @@ int ocfs2_try_remove_refcount_tree(struct inode *inode,
 	struct ocfs2_inode_info *oi = OCFS2_I(inode);
 	struct ocfs2_dinode *di = (struct ocfs2_dinode *)di_bh->b_data;
 
-	down_write(&oi->ip_xattr_sem);
 	down_write(&oi->ip_alloc_sem);
+	down_write(&oi->ip_xattr_sem);
 
 	if (oi->ip_clusters)
 		goto out;
@@ -945,8 +945,8 @@ int ocfs2_try_remove_refcount_tree(struct inode *inode,
 	if (ret)
 		mlog_errno(ret);
 out:
-	up_write(&oi->ip_alloc_sem);
 	up_write(&oi->ip_xattr_sem);
+	up_write(&oi->ip_alloc_sem);
 	return 0;
 }
 
diff --git a/fs/ocfs2/super.c b/fs/ocfs2/super.c
index 3d2533950bae..4461daf909cf 100644
--- a/fs/ocfs2/super.c
+++ b/fs/ocfs2/super.c
@@ -1997,8 +1997,6 @@ static int ocfs2_initialize_super(struct super_block *sb,
 	spin_lock_init(&osb->osb_xattr_lock);
 	ocfs2_init_steal_slots(osb);
 
-	mutex_init(&osb->system_file_mutex);
-
 	atomic_set(&osb->alloc_stats.moves, 0);
 	atomic_set(&osb->alloc_stats.local_data, 0);
 	atomic_set(&osb->alloc_stats.bitmap_data, 0);
diff --git a/fs/ocfs2/sysfile.c b/fs/ocfs2/sysfile.c
index 53a945da873b..03e7a0cd55aa 100644
--- a/fs/ocfs2/sysfile.c
+++ b/fs/ocfs2/sysfile.c
@@ -98,11 +98,9 @@ struct inode *ocfs2_get_system_file_inode(struct ocfs2_super *osb,
 	} else
 		arr = get_local_system_inode(osb, type, slot);
 
-	mutex_lock(&osb->system_file_mutex);
 	if (arr && ((inode = *arr) != NULL)) {
 		/* get a ref in addition to the array ref */
 		inode = igrab(inode);
-		mutex_unlock(&osb->system_file_mutex);
 		BUG_ON(!inode);
 
 		return inode;
@@ -112,11 +110,8 @@ struct inode *ocfs2_get_system_file_inode(struct ocfs2_super *osb,
 	inode = _ocfs2_get_system_file_inode(osb, type, slot);
 
 	/* add one more if putting into array for first time */
-	if (arr && inode) {
-		*arr = igrab(inode);
-		BUG_ON(!*arr);
-	}
-	mutex_unlock(&osb->system_file_mutex);
+	if (inode && arr && !*arr && !cmpxchg(&(*arr), NULL, inode))
+		igrab(*arr);
 	return inode;
 }
 

