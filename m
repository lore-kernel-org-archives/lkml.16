Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26B7C148
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 15:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745766303; cv=none; b=dRLEQyNcZhvlFei/pkunkmIcClQBKyZvWrNH/N9T4gi5TNzEBOanLHbZdhRl3/JYXBNeLuDr9OBx5t9yvq+DvJeQUwinj9FCoYfFceUhRQE5K0ybVCZEu4H6H2q5HjXspSHjbBAAEipEauBREN9bHgAV+AIZA/8HHuYrEPTnwZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745766303; c=relaxed/simple;
	bh=Ywh+mRMPi4ox+Q+dMxHmvWj1KD/4vPH1Juc9WxWF1j8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SAl0+EUC7EaZYSE7HvvN9jfVeEStwqWC3TzMw3G9VuAUo/ExiUH6YrJb0+8xs38lfOB01YUAj5pHb4qm8YadqLE8t2RV2Yt8YXBIBtdMy8GoZZIrfBI15d1SRtPo5m1QY+lo/EU9a6bOKIh/0gSslric0ZuGOn9WiCErinrWV9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rkh+Si++; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rkh+Si++"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ff6cf448b8so5365865a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 08:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745766301; x=1746371101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HQ4UCsD2wUaqapNoxDi1mJscBkHPxo1HGJNrvw4hNXE=;
        b=Rkh+Si++s63XwB3wO0NmF85zkznaKUrRYOGLF1bnSVIMHUTD4WhYwqUK40asvwIwEZ
         PbvrbvtDl2v0/GLUGZqX6igaHnqVdoTkLPdlUcq/J3tL968VP+ISHf4eMr/SaWT3dhgC
         OgJo1s7LDppVCyluSo0yzVHeUcnHFwqdOK7z+tS0gg3P3ry7Xo8caIagNUrgvsSR2FTd
         hyVdudAa6obKG9j+MYm/R3pnul2ntN10dmfZdD8Ni8vw9AiNyxdyRtBNZ93SwDoN2YG6
         mEqgER1oYM3ote0gUtLpR3PulJFVgfqc4ZOIWoGi0TzCy+zmucC1WeZjFSV+1Ty6XMR1
         AZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745766301; x=1746371101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HQ4UCsD2wUaqapNoxDi1mJscBkHPxo1HGJNrvw4hNXE=;
        b=QYp2jz22qlPV9HHjzcHzhffIaL7PDWYYB+ob49SYkg4knx54ZgPteGdMhluDu5dC4j
         utiXD0vlMAWFWr11CFIULuHdxTgLYNaiwrmcNW1FiBGsdoPR/pJoBVNQeuwOHtamZ84C
         mnsRJUDT8bD/8Q13hzeYJCpTpUGwf67xLFwkFFxeAC8d9/eaChAhjizbUye5vGrkuxaS
         GGctlq/WuF2SKv7Ejja50bY0hfGfXdghXva8zzY6WLYu1OpnJDDkv2XruhpANixBKnCS
         ANvmZ1dsmBes3EJDORPL68hT/1wNsGqsPr0EKo5mQCuVKJiu04ZSRyrt9R3dTZHbKIc3
         Di8A==
X-Forwarded-Encrypted: i=1; AJvYcCVeNj0J1yKNUOzrU9bVsIczdQqFEPNY2zp1q3uec+qwkrlg/VtBNEzPzN6QVJgpcogB/fXNp0dlfKO9naU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6mxREpXqa8BMU/EL1UWINMT3mttW5mPOx0JW+2yYAuzuuVX9R
	XBBabhJEC/dyKC7zdwG/ei7r1MRA2E6QSRZonAas08J9hPN9EvHV
X-Gm-Gg: ASbGnctGzMfBV5eHh52XCd5cYmncW/AJntKLf8pqAQ6CDEmv1th+5SkrDxC5FKdIctj
	/bcQkBhspAfmyv3XwSDTE9qjwMNyp02VE8xg/yDAAfhr3QgITN4acnxXR24tupNgO4/cr+HWG48
	K/IOnOO2MesCGpyrEdUh+M+f4cFGqZotVbGDub9SWgw0Z5AAVynLcgyIhmjQPFY7I9sKvgK4URe
	byH3IWZmGFoTApShcy5bDSBT81ZTUWKGoQZFT56lZvSeOy415l2Gmkv5aWyqaUlDEsEIAHBsZNs
	1ZoDyLgfuhaWKXmjfz2cUyQEtQsOAolqomnFUyRD
X-Google-Smtp-Source: AGHT+IGkv2bn/aI5jBy5pHP9QG6A7E/+LGG7gemVXN2Pe3H2LQS9B7YekuirYT/E4yOgC1ETQhY6pg==
X-Received: by 2002:a17:90b:2741:b0:2ee:c91a:acf7 with SMTP id 98e67ed59e1d1-309f7da6d24mr12844595a91.4.1745766300801;
        Sun, 27 Apr 2025 08:05:00 -0700 (PDT)
Received: from pop-os.. ([49.207.200.116])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef03baf7sm7029049a91.5.2025.04.27.08.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 08:05:00 -0700 (PDT)
From: Aditya Dutt <duttaditya18@gmail.com>
To: syzbot+6b1d79dad6cc6b3eef41@syzkaller.appspotmail.com
Cc: Aditya Dutt <duttaditya18@gmail.com>,
	syzkaller-lts-bugs@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: Test if it's still reproducible
Date: Sun, 27 Apr 2025 20:34:35 +0530
Message-Id: <20250427150435.83816-1-duttaditya18@gmail.com>
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
