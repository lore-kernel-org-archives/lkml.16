Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62AA2F852
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 15:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745766321; cv=none; b=d35xXn2rG7k3O9GLzY+pRb2rT7ljDHYMMVxJ3+sc1qzk48APRKoLrDIX0K8qwU69yFVD46fANa6niCj/wfFWrpct5b8fKv4sBIM3FqNR7dzcTTtoql6fakZN0dJD+qSlIeH2ozFlqocqSR66ea1H5dxpVI/iJh+S2/fQigdyZa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745766321; c=relaxed/simple;
	bh=Ywh+mRMPi4ox+Q+dMxHmvWj1KD/4vPH1Juc9WxWF1j8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JvJIYgQW/od8jTQtRve2hWSdx/AtnYpcgqtndkFYZ0XUqyt4eEH+Xc5NqrwbZFfTsiz0wDKjIvoZxbuxGnG0XvHpFZzHunGfApvAj2J2ilgoljiKJfzAYVCUSD1+oeGwtwIAwHtpAhKglyGvuHHUtgsqUqahzcHfloOaTYDVzT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AU+GopaO; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AU+GopaO"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2254e0b4b79so59705895ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 08:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745766319; x=1746371119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HQ4UCsD2wUaqapNoxDi1mJscBkHPxo1HGJNrvw4hNXE=;
        b=AU+GopaOjrm+BbUOoqqfxMsuwnzqSNotMKKFBWPIMf317wnd9iXKeeEAaAgfEP82tM
         ZKdEXQ8DgKZaWecfDkbnJvSkZMCX4nSY7epdoeE2iUx5gHQ7kBJ1ECbenLSSk3clKQfD
         8wVzvmfEJZP4+Z1Xw4M94G9dN/JbeioF1OyEzlALQ1dE7UCUBIjpfjwjHDjWO5F2E6Jj
         wnvr8JsNr51hxyKAjCgJf2VmGnfN0iR3g+d6rOfNWUungi/UJJq5PspYMfrH8Mgs0IGl
         PAzbHJH3GVQS7oi6KzHOEP/BBCRs0Zl+KeBXM68tADM8ukhFaqvVcLL6TDrv2Tw7JZva
         wejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745766319; x=1746371119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HQ4UCsD2wUaqapNoxDi1mJscBkHPxo1HGJNrvw4hNXE=;
        b=jmDL9lBbf+z1nXmBy05rGCqDUKjpJaqJltXHhJlLJKEiiXE0h8Pioxpr+h4Kv2OyJH
         lQxWR4A0CG5U79PVTskcjNVS32Fo8sV8ZlR3m6jxNlNthklFj8YtNdYyG3TjiGIbMmOw
         P9ofHwPt539y1iOh/ZRn/tRsykFmwNTKMh3NV5h206I68Yz3+MRFbX0dr6ixIVd+FCMA
         mWL8HlJlwzLGGAY3CvVf3Hb17C9coCrCb6uyA0TLfptbDIi2O4u+Gz3eedqJ1Zo2BlR2
         gb3PXIn+G04m0SuSVpdstZc60wP5eN6gYXRuZL92dlIVU59NCOeeQ/kJHc2UxDPX8HzJ
         ft9g==
X-Forwarded-Encrypted: i=1; AJvYcCV6OKO8UOFi/Kqk/NZbq+RxCBvYLPiJ2e/Z8negAVJYcXCB4mg2UiqM8yQyg9DzQITvOyaro5Hjv4nfznE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCr5Oz2PTH/8vrKxc9rsvQcrA0Nz811SIBgekddUjMyYCDiCNB
	uTDxmWCFmia3vBZcO6tXZP6lLj0qm4BimfEwP9C7bTUSsV9KdO5t
X-Gm-Gg: ASbGncuKx8bcFRXa0znEo4HyoJdFaSYkhXmZntK58nNXyRmep6QwNpTUgxu3l9AcBqU
	nuJmWF2jkfre30JE6XBXexp8Hkngi9nY03+tNlN+AgwlRQCDJp/UUvIMzDTgeJnmVv0fFWUwz5w
	z0xlbM4l2QMP6Cgu4Ua1xt/xV10UBFdI2TnBMNHwu/8r5VuzeySfDWSwpvvE5620+Ds4lxZmZoo
	y2c+u+LVoDG7jN6P6xl7t2Bd9dHZ0dE2QiDtYwceIzunqeUeuFFZObFbYsKkvUO6id20SXwNaOp
	p+Ktz6GT99dVeX94JTimMtATfuZopD6OqSyJOasA
X-Google-Smtp-Source: AGHT+IHVUk9g75mJJVFYutj2GO2Zb10rqvB/wCqU2dILutr3fSXHa51ulv1LQosg/5ZnlQ1N6CgzcQ==
X-Received: by 2002:a17:902:e84c:b0:223:4bd6:3869 with SMTP id d9443c01a7336-22dbf5ee28amr134782815ad.15.1745766318695;
        Sun, 27 Apr 2025 08:05:18 -0700 (PDT)
Received: from pop-os.. ([49.207.200.116])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef124ce9sm7005518a91.34.2025.04.27.08.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 08:05:18 -0700 (PDT)
From: Aditya Dutt <duttaditya18@gmail.com>
To: syzbot+e829cfdd0de521302df4@syzkaller.appspotmail.com
Cc: Aditya Dutt <duttaditya18@gmail.com>,
	syzkaller-lts-bugs@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: Test if it's still reproducible
Date: Sun, 27 Apr 2025 20:35:13 +0530
Message-Id: <20250427150513.84040-1-duttaditya18@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git linux-6.1.y

diff --git a/fs/jfs/jfs_dinode.h b/fs/jfs/jfs_dinode.h
index 6b231d0d0071..603aae17a693 100644
--- a/fs/jfs/jfs_dinode.h
+++ b/fs/jfs/jfs_dinode.h
@@ -96,7 +96,7 @@ struct dinode {
 #define di_gengen	u._file._u1._imap._gengen
 
 			union {
-				xtpage_t _xtroot;
+				xtroot_t _xtroot;
 				struct {
 					u8 unused[16];	/* 16: */
 					dxd_t _dxd;	/* 16: */
diff --git a/fs/jfs/jfs_imap.c b/fs/jfs/jfs_imap.c
index 155f66812934..9adb29e7862c 100644
--- a/fs/jfs/jfs_imap.c
+++ b/fs/jfs/jfs_imap.c
@@ -673,7 +673,7 @@ int diWrite(tid_t tid, struct inode *ip)
 		 * This is the special xtree inside the directory for storing
 		 * the directory table
 		 */
-		xtpage_t *p, *xp;
+		xtroot_t *p, *xp;
 		xad_t *xad;
 
 		jfs_ip->xtlid = 0;
@@ -687,7 +687,7 @@ int diWrite(tid_t tid, struct inode *ip)
 		 * copy xtree root from inode to dinode:
 		 */
 		p = &jfs_ip->i_xtroot;
-		xp = (xtpage_t *) &dp->di_dirtable;
+		xp = (xtroot_t *) &dp->di_dirtable;
 		lv = ilinelock->lv;
 		for (n = 0; n < ilinelock->index; n++, lv++) {
 			memcpy(&xp->xad[lv->offset], &p->xad[lv->offset],
@@ -716,7 +716,7 @@ int diWrite(tid_t tid, struct inode *ip)
 	 *	regular file: 16 byte (XAD slot) granularity
 	 */
 	if (type & tlckXTREE) {
-		xtpage_t *p, *xp;
+		xtroot_t *p, *xp;
 		xad_t *xad;
 
 		/*
diff --git a/fs/jfs/jfs_incore.h b/fs/jfs/jfs_incore.h
index 721def69e732..dd4264aa9bed 100644
--- a/fs/jfs/jfs_incore.h
+++ b/fs/jfs/jfs_incore.h
@@ -66,7 +66,7 @@ struct jfs_inode_info {
 	lid_t	xtlid;		/* lid of xtree lock on directory */
 	union {
 		struct {
-			xtpage_t _xtroot;	/* 288: xtree root */
+			xtroot_t _xtroot;	/* 288: xtree root */
 			struct inomap *_imap;	/* 4: inode map header	*/
 		} file;
 		struct {
diff --git a/fs/jfs/jfs_txnmgr.c b/fs/jfs/jfs_txnmgr.c
index ce4b4760fcb1..dccc8b3f1045 100644
--- a/fs/jfs/jfs_txnmgr.c
+++ b/fs/jfs/jfs_txnmgr.c
@@ -783,7 +783,7 @@ struct tlock *txLock(tid_t tid, struct inode *ip, struct metapage * mp,
 			if (mp->xflag & COMMIT_PAGE)
 				p = (xtpage_t *) mp->data;
 			else
-				p = &jfs_ip->i_xtroot;
+				p = (xtpage_t *) &jfs_ip->i_xtroot;
 			xtlck->lwm.offset =
 			    le16_to_cpu(p->header.nextindex);
 		}
@@ -1676,7 +1676,7 @@ static void xtLog(struct jfs_log * log, struct tblock * tblk, struct lrd * lrd,
 
 	if (tlck->type & tlckBTROOT) {
 		lrd->log.redopage.type |= cpu_to_le16(LOG_BTROOT);
-		p = &JFS_IP(ip)->i_xtroot;
+		p = (xtpage_t *) &JFS_IP(ip)->i_xtroot;
 		if (S_ISDIR(ip->i_mode))
 			lrd->log.redopage.type |=
 			    cpu_to_le16(LOG_DIR_XTREE);
diff --git a/fs/jfs/jfs_xtree.c b/fs/jfs/jfs_xtree.c
index 2d304cee884c..5ee618d17e77 100644
--- a/fs/jfs/jfs_xtree.c
+++ b/fs/jfs/jfs_xtree.c
@@ -1213,7 +1213,7 @@ xtSplitRoot(tid_t tid,
 	struct xtlock *xtlck;
 	int rc;
 
-	sp = &JFS_IP(ip)->i_xtroot;
+	sp = (xtpage_t *) &JFS_IP(ip)->i_xtroot;
 
 	INCREMENT(xtStat.split);
 
@@ -2098,7 +2098,7 @@ int xtAppend(tid_t tid,		/* transaction id */
  */
 void xtInitRoot(tid_t tid, struct inode *ip)
 {
-	xtpage_t *p;
+	xtroot_t *p;
 
 	/*
 	 * acquire a transaction lock on the root
diff --git a/fs/jfs/jfs_xtree.h b/fs/jfs/jfs_xtree.h
index 142caafc73b1..15da4e16d8b2 100644
--- a/fs/jfs/jfs_xtree.h
+++ b/fs/jfs/jfs_xtree.h
@@ -65,24 +65,33 @@ struct xadlist {
 #define XTPAGEMAXSLOT	256
 #define XTENTRYSTART	2
 
-/*
- *	xtree page:
- */
-typedef union {
-	struct xtheader {
-		__le64 next;	/* 8: */
-		__le64 prev;	/* 8: */
+struct xtheader {
+	__le64 next;	/* 8: */
+	__le64 prev;	/* 8: */
 
-		u8 flag;	/* 1: */
-		u8 rsrvd1;	/* 1: */
-		__le16 nextindex;	/* 2: next index = number of entries */
-		__le16 maxentry;	/* 2: max number of entries */
-		__le16 rsrvd2;	/* 2: */
+	u8 flag;	/* 1: */
+	u8 rsrvd1;	/* 1: */
+	__le16 nextindex;	/* 2: next index = number of entries */
+	__le16 maxentry;	/* 2: max number of entries */
+	__le16 rsrvd2;	/* 2: */
 
-		pxd_t self;	/* 8: self */
-	} header;		/* (32) */
+	pxd_t self;	/* 8: self */
+};
 
+/*
+ *	xtree root (in inode):
+ */
+typedef union {
+	struct xtheader header;
 	xad_t xad[XTROOTMAXSLOT];	/* 16 * maxentry: xad array */
+} xtroot_t;
+
+/*
+ *	xtree page:
+ */
+typedef union {
+	struct xtheader header;
+	xad_t xad[XTPAGEMAXSLOT];	/* 16 * maxentry: xad array */
 } xtpage_t;
 
 /*
