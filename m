Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309568460
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 13:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751032348; cv=none; b=LFEt4jqtoIkKDDenASK3NtqXMr9HZffsBkDmUxmiGOD99L7uWpImgt0TUtRtgMb/oSF442AVY8dpCRnwNMIGdIEzFxFh2DoOKBNcTq3GtKvkgqv3G7qIOXL291SF+XuQyqaY7WbU1KhfZix8+qzfbdd2nwmq3L0sChb5bEiiazg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751032348; c=relaxed/simple;
	bh=jkaGkkape4jvWDkycC4WREz8CW2nIiNpEd1kmmmIaBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=af3t1Pc3tmzy0HcfwLFoXk/Ae3fbvrEI8l/P1SEpUbq3eOCjjjPuj6hXJ0QAZKL6NeC6t7/vYuf9fVdHk0y7zBQ8TbkIARMaymbzPAztB6m33dfJwwBXUAC0GBQZ1mTROiQAv2mpi1LQlXupEKMQWqXkTZknhRuKYdek/mtnu9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 55RDqKrS017620;
	Fri, 27 Jun 2025 22:52:21 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 55RDqK37017617
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 27 Jun 2025 22:52:20 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <8bd7960a-540c-426f-8c47-620d66fbdfb4@I-love.SAKURA.ne.jp>
Date: Fri, 27 Jun 2025 22:52:20 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [btrfs?] VFS: Busy inodes after unmount (use-after-free)
 (2)
To: syzbot <syzbot+1134d3a5b062e9665a7a@syzkaller.appspotmail.com>,
        LKML <linux-kernel@vger.kernel.org>
References: <682063e1.050a0220.f2294.002a.GAE@google.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <682063e1.050a0220.f2294.002a.GAE@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav205.rs.sakura.ne.jp

#syz test

Subject: [PATCH v2] ocfs2: update d_splice_alias() return code checking

When commit d3556babd7fa ("ocfs2: fix d_splice_alias() return code
checking") was merged into v3.18-rc3, d_splice_alias() was returning
one of a valid dentry, NULL or an ERR_PTR.

When commit b5ae6b15bd73 ("merge d_materialise_unique() into
d_splice_alias()") was merged into v3.19-rc1, d_splice_alias() started
returning -ELOOP as one of ERR_PTR values.

Now, when syzkaller mounts a crafted ocfs2 filesystem image that hits
d_splice_alias() == -ELOOP case from ocfs2_lookup(), ocfs2_lookup() fails
to handle -ELOOP case and generic_shutdown_super() hits "VFS: Busy inodes
after unmount" message.

Instead of calling ocfs2_dentry_attach_lock() or ocfs2_dentry_attach_gen()
when d_splice_alias() returned an ERR_PTR value, change ocfs2_lookup() to
bail out immediately.

Also, ocfs2_lookup() needs to call dupt() when ocfs2_dentry_attach_lock()
returned an ERR_PTR value.

Reported-by: syzbot <syzbot+1134d3a5b062e9665a7a@syzkaller.appspotmail.com>
Closes: https://syzkaller.appspot.com/bug?extid=1134d3a5b062e9665a7a
Suggested-by: Al Viro <viro@zeniv.linux.org.uk>
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
 fs/ocfs2/namei.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/ocfs2/namei.c b/fs/ocfs2/namei.c
index 99278c8f0e24..f75fd19974bc 100644
--- a/fs/ocfs2/namei.c
+++ b/fs/ocfs2/namei.c
@@ -142,6 +142,8 @@ static struct dentry *ocfs2_lookup(struct inode *dir, struct dentry *dentry,
 
 bail_add:
 	ret = d_splice_alias(inode, dentry);
+	if (IS_ERR(ret))
+		goto bail_unlock;
 
 	if (inode) {
 		/*
@@ -154,13 +156,12 @@ static struct dentry *ocfs2_lookup(struct inode *dir, struct dentry *dentry,
 		 * NOTE: This dentry already has ->d_op set from
 		 * ocfs2_get_parent() and ocfs2_get_dentry()
 		 */
-		if (!IS_ERR_OR_NULL(ret))
-			dentry = ret;
-
-		status = ocfs2_dentry_attach_lock(dentry, inode,
+		status = ocfs2_dentry_attach_lock(ret ? ret : dentry, inode,
 						  OCFS2_I(dir)->ip_blkno);
 		if (status) {
 			mlog_errno(status);
+			if (ret)
+				dput(ret);
 			ret = ERR_PTR(status);
 			goto bail_unlock;
 		}
-- 
2.50.0


