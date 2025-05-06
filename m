Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0F428151F
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 14:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746541219; cv=none; b=cbdcleoPW/Nb2/xjoZkl0nQK8lF4AI+JMqoC9fmJyeEZOd8mJSb1/7+2Vxz1GBK9n4rwqYaJhpl5fJHqscvdoPoanT0MEgDfGPUhUREbYXYxBbt14r87sTq/VTyGbtELtTC4yYSvONCZVhg4grwFMLkWDODxL7QBSOae1PvV7NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746541219; c=relaxed/simple;
	bh=81aEPCcsJ/e6mOPbXDMh5xnnkudxyH/Lh/p+3c3/BZY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=WfCAZ73llM7JuD4s8g36zX2oCvpgTNMZFNz7NogTevaOqYFU3HARVOCJRplRb/W+InH+cQZ+i5dDSd4Hc4Q8JIXN0oioTqbucMwnpOvPRF4YN9lgrZ0dydNzTR+XDf7TPYzgQzanyc7f0RKR3aQcPGV4YidDJV4W+SrWmjp6wYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d5da4fb5e0so51244555ab.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 07:20:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746541216; x=1747146016;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=juvepVSO4FokjGYiIKhtY9Wro5+tj8hRv914JsGucko=;
        b=ZA+mxo/ueZ4+/7XCe3UMmM7k+sEAIjiXEqeDq6tN+tHd0v71dpJTfZUa8BZKQ/yPha
         rTr1tOPX471EY6RQsqjwsgb3dnPDnafvbgsLuYnoqT14GWxl3CuRUuP1C5okXBBVaec5
         Mf3DqBKuMMODSCHdcSeRfjtl91IpvR6BqalRFkFCx1SfE3Nwf5GFNbkcmhJg1HNCGxoN
         peFPpxA4wIGxOjT7v8c716Uh0GyUe7SS9Bh0jNJf800XZe3VLMlu3tXQHhMqxVTBWERT
         MBe3n62P8W+Z6bvLhotxocYpgV/xzfhQcuCxAKpEKkDh5VvQdH/uoo/Gt1HjKEysm2Fi
         tfEQ==
X-Gm-Message-State: AOJu0YyQktxjn19WLn6ikcU8iS9dJRxVNTot/+J6Ldvkxk1W6vps9e1W
	4tDnetfab1ivC3/GDC3JaClPq1j4Yi22NvoLVPMi+qpq4OOP6pQaukZ8JqxDOPmSJz3LgEgIlPh
	iT+Jwyd+PbUilGF5//b4emSgoKSC5Y5ndD5lb2nBxIshBSd7Nac+8OOs=
X-Google-Smtp-Source: AGHT+IFJWAXaGJKhNfjAoTFOLO6qMqdsosx81agp/WjhT16vW6QJIvtk7pQnGy0kYkIifQFX0+WIvR8iDxNlV+23pW/ErEwyS3+E
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:17c9:b0:3d3:fcff:edae with SMTP id
 e9e14a558f8ab-3da6cdc61bemr34217455ab.3.1746541216630; Tue, 06 May 2025
 07:20:16 -0700 (PDT)
Date: Tue, 06 May 2025 07:20:16 -0700
In-Reply-To: <68197d2b.050a0220.23d401.2859.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <681a1aa0.050a0220.a19a9.000f.GAE@google.com>
Subject: Re: [syzbot] Re: [syzbot] [jfs?] KMSAN: uninit-value in BT_STACK_DUMP
From: syzbot <syzbot+ba5f49027aace342d24d@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [jfs?] KMSAN: uninit-value in BT_STACK_DUMP
Author: richard120310@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 02ddfb981de8

Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
 fs/jfs/jfs_dtree.c |  6 +++---
 fs/jfs/jfs_xtree.c | 14 +++++++-------
 fs/jfs/namei.c     | 14 +++++++-------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/fs/jfs/jfs_dtree.c b/fs/jfs/jfs_dtree.c
index 93db6eec4465..87025d832758 100644
--- a/fs/jfs/jfs_dtree.c
+++ b/fs/jfs/jfs_dtree.c
@@ -2083,7 +2083,7 @@ int dtDelete(tid_t tid,
 	struct metapage *mp, *imp;
 	dtpage_t *p;
 	int index;
-	struct btstack btstack;
+	struct btstack btstack = {0};
 	struct dt_lock *dtlck;
 	struct tlock *tlck;
 	struct lv *lv;
@@ -2716,7 +2716,7 @@ int jfs_readdir(struct file *file, struct dir_context *ctx)
 	dtpage_t *p;
 	int index;
 	s8 *stbl;
-	struct btstack btstack;
+	struct btstack btstack = {0};
 	int i, next;
 	struct ldtentry *d;
 	struct dtslot *t;
@@ -4237,7 +4237,7 @@ int dtModify(tid_t tid, struct inode *ip,
 	struct metapage *mp;
 	dtpage_t *p;
 	int index;
-	struct btstack btstack;
+	struct btstack btstack = {0};
 	struct tlock *tlck;
 	struct dt_lock *dtlck;
 	struct lv *lv;
diff --git a/fs/jfs/jfs_xtree.c b/fs/jfs/jfs_xtree.c
index 5ee618d17e77..dd0e542a4978 100644
--- a/fs/jfs/jfs_xtree.c
+++ b/fs/jfs/jfs_xtree.c
@@ -123,7 +123,7 @@ int xtLookup(struct inode *ip, s64 lstart,
 	     s64 llen, int *pflag, s64 * paddr, s32 * plen, int no_check)
 {
 	int rc = 0;
-	struct btstack btstack;
+	struct btstack btstack = {0};
 	int cmp;
 	s64 bn;
 	struct metapage *mp;
@@ -520,7 +520,7 @@ int xtInsert(tid_t tid,		/* transaction id */
 	xtpage_t *p;		/* base B+-tree index page */
 	s64 bn;
 	int index, nextindex;
-	struct btstack btstack;	/* traverse stack */
+	struct btstack btstack = {0};	/* traverse stack */
 	struct xtsplit split;	/* split information */
 	xad_t *xad;
 	int cmp;
@@ -1344,7 +1344,7 @@ int xtExtend(tid_t tid,		/* transaction id */
 	xtpage_t *p;		/* base B+-tree index page */
 	s64 bn;
 	int index, nextindex, len;
-	struct btstack btstack;	/* traverse stack */
+	struct btstack btstack = {0};	/* traverse stack */
 	struct xtsplit split;	/* split information */
 	xad_t *xad;
 	s64 xaddr;
@@ -1503,7 +1503,7 @@ int xtUpdate(tid_t tid, struct inode *ip, xad_t * nxad)
 	xtpage_t *p;		/* base B+-tree index page */
 	s64 bn;
 	int index0, index, newindex, nextindex;
-	struct btstack btstack;	/* traverse stack */
+	struct btstack btstack = {0};	/* traverse stack */
 	struct xtsplit split;	/* split information */
 	xad_t *xad, *lxad, *rxad;
 	int xflag;
@@ -1949,7 +1949,7 @@ int xtAppend(tid_t tid,		/* transaction id */
 	xtpage_t *p;		/* base B+-tree index page */
 	s64 bn, xaddr;
 	int index, nextindex;
-	struct btstack btstack;	/* traverse stack */
+	struct btstack btstack = {0};	/* traverse stack */
 	struct xtsplit split;	/* split information */
 	xad_t *xad;
 	int cmp;
@@ -2196,7 +2196,7 @@ s64 xtTruncate(tid_t tid, struct inode *ip, s64 newsize, int flag)
 	xad_t *xad;
 	s64 xoff, xaddr;
 	int xlen, len, freexlen;
-	struct btstack btstack;
+	struct btstack btstack = {0};
 	struct btframe *parent;
 	struct tblock *tblk = NULL;
 	struct tlock *tlck = NULL;
@@ -2744,7 +2744,7 @@ s64 xtTruncate(tid_t tid, struct inode *ip, s64 newsize, int flag)
 s64 xtTruncate_pmap(tid_t tid, struct inode *ip, s64 committed_size)
 {
 	s64 bn;
-	struct btstack btstack;
+	struct btstack btstack = {0};
 	int cmp;
 	int index;
 	int locked_leaves = 0;
diff --git a/fs/jfs/namei.c b/fs/jfs/namei.c
index 65a218eba8fa..d04c752823ea 100644
--- a/fs/jfs/namei.c
+++ b/fs/jfs/namei.c
@@ -67,7 +67,7 @@ static int jfs_create(struct mnt_idmap *idmap, struct inode *dip,
 	struct inode *ip = NULL;	/* child directory inode */
 	ino_t ino;
 	struct component_name dname;	/* child directory name */
-	struct btstack btstack;
+	struct btstack btstack = {0};
 	struct inode *iplist[2];
 	struct tblock *tblk;
 
@@ -200,7 +200,7 @@ static struct dentry *jfs_mkdir(struct mnt_idmap *idmap, struct inode *dip,
 	struct inode *ip = NULL;	/* child directory inode */
 	ino_t ino;
 	struct component_name dname;	/* child directory name */
-	struct btstack btstack;
+	struct btstack btstack = {0};
 	struct inode *iplist[2];
 	struct tblock *tblk;
 
@@ -791,7 +791,7 @@ static int jfs_link(struct dentry *old_dentry,
 	struct inode *ip = d_inode(old_dentry);
 	ino_t ino;
 	struct component_name dname;
-	struct btstack btstack;
+	struct btstack btstack = {0};
 	struct inode *iplist[2];
 
 	jfs_info("jfs_link: %pd %pd", old_dentry, dentry);
@@ -883,7 +883,7 @@ static int jfs_symlink(struct mnt_idmap *idmap, struct inode *dip,
 	ino_t ino = 0;
 	struct component_name dname;
 	u32 ssize;		/* source pathname size */
-	struct btstack btstack;
+	struct btstack btstack = {0};
 	struct inode *ip;
 	s64 xlen = 0;
 	int bmask = 0, xsize;
@@ -1069,7 +1069,7 @@ static int jfs_rename(struct mnt_idmap *idmap, struct inode *old_dir,
 		      struct dentry *old_dentry, struct inode *new_dir,
 		      struct dentry *new_dentry, unsigned int flags)
 {
-	struct btstack btstack;
+	struct btstack btstack = {0};
 	ino_t ino;
 	struct component_name new_dname;
 	struct inode *new_ip;
@@ -1356,7 +1356,7 @@ static int jfs_mknod(struct mnt_idmap *idmap, struct inode *dir,
 		     struct dentry *dentry, umode_t mode, dev_t rdev)
 {
 	struct jfs_inode_info *jfs_ip;
-	struct btstack btstack;
+	struct btstack btstack = {0};
 	struct component_name dname;
 	ino_t ino;
 	struct inode *ip;
@@ -1448,7 +1448,7 @@ static int jfs_mknod(struct mnt_idmap *idmap, struct inode *dir,
 
 static struct dentry *jfs_lookup(struct inode *dip, struct dentry *dentry, unsigned int flags)
 {
-	struct btstack btstack;
+	struct btstack btstack = {0};
 	ino_t inum;
 	struct inode *ip;
 	struct component_name key;
-- 
2.43.0

