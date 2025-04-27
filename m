Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0065313C82E
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 14:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745764055; cv=none; b=YfLDvXtTN0gzzK8UbAKNbLGwFpCbe9cH4m1cQggrpeYrK6nqPIJlDnwk5OW2EuT8ArDmp9ZBJTBzrNa7wdzVv2K9KzCuKGo0/CSxpkX28Q5EBs3P6ex6k7ec8p7F2qTH4WV0gEhiNUdbpZym6ud+5ZTIQ07Yh4z2A2n86f5bSbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745764055; c=relaxed/simple;
	bh=Ywh+mRMPi4ox+Q+dMxHmvWj1KD/4vPH1Juc9WxWF1j8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uRL8cO6nxRajKKkjFHAchZLbRBzadk6AsTD4QX0kBG54+cWSrcPDyIIiAfiBWA/Zgl43yqPPDqEYS99tXlTq81TCufpAjX1V4jrjQgey+02OMguyKh50aScm27pfCuby5uU9ed7CbJ5ulBbeEcDwi5IQuR69qWPj9vVU22lHKd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m0YrcTY5; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m0YrcTY5"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-736aa9d0f2aso4911798b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 07:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745764053; x=1746368853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HQ4UCsD2wUaqapNoxDi1mJscBkHPxo1HGJNrvw4hNXE=;
        b=m0YrcTY5ZI5ykgFlxtmKR76gjVAvK5E0G5pv84AuwsK8dMf0881WpqIl+jMRVUBSUM
         UMzqTlzACztmyTGh/umANF3ds0N0dZZsCwySKGu+sY9nMiV+91uXiDv5vjwp4leYlu52
         W59tCcIvnSjKq3eZoySJ3ZF3CbMMUhO21Y0RXubQo//7xXuO8LACfO24MKkK1sFQNARE
         FVW9L2nkr5M2lLwRlxeDa3nPFItU/Fe9plqFzSRYbHHwxJkGS20N1ROiqWLBAysANU5b
         6PGkW4uNaA+OAsEpRT+yhZh7oVDDpA939VcittiMyAwH/dfdP/sgcxaDuVYT3+PPtmUj
         A90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745764053; x=1746368853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HQ4UCsD2wUaqapNoxDi1mJscBkHPxo1HGJNrvw4hNXE=;
        b=WBh1g8cs8i08JnTD7tcW1aDsOMDEc+OONlYdFAHNI4zsAiyPTBUqXJdO7WV2STLpq+
         0F4mM4V2zYJ7IxEMQlBjIxj/HuW4BDxJ0MJFHwx7rsx7AY3dsJI6dPmRZDgaW9LH2Q22
         9pipZIfD4Scfk8Ipu36Rm9RpFRVUGsWekjXDkHw8K1NDmf4zuEgtqRiwYfLOlptqZdUr
         iY5ukYYtAPFbDf5494r+4KFJU5kGDH+DHX6uFlXCtMpbjEuhEPygb9QVHs8DQnYAi7mH
         kUMp7j39m+eMrvia7NUaI4EhnXVgmjrb/5YluLNT5njyzNromskONG9cyw1hvbPmvK4K
         sb6A==
X-Forwarded-Encrypted: i=1; AJvYcCUxD6ccZUqkT2HhRIIPiH4xcoVo0Oj17MnsncvWkM8V6Cha+BI9vpHPW99Lenur+aODVPjNsJ/4sxjkD7A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSeRNqxw2qnBlxRsOHb5cVDTYZ136yCssUEkuKnLgIWIThP+Ws
	SZ7ovVmHaHLz/azHK5di4NVHMCtk1Mb5TMHwQ7jTFpF+o92w90j4
X-Gm-Gg: ASbGncvm8uOUpgwB7fZO3N+NaPGOr7oce4zIFMC3v6KwIZtNWL/4oSsAZU7Gs4UBFEI
	Rlqe8dVB/pG0jam9WzwDuwbfx7pOX/z5/UWXk5tRGvmfd/zI7NJraKwMRatfFPVWbiuP/u7Vcx8
	4vfDJ+5qvwsDHzhRrMrkw1UhUSO4yPhuE04iSYoaQvCPDt5ykRSOChdZag/ybwbw2C1WLfV9/D8
	lweT7F9uFzUDKkgrVRLz2EJyT5RVilXnmiE5pw1F6ILmMv3VP8/kWHydNtnueZx9ur5/vB0AAKi
	bSU09uzZJgGUuZ2dHbzQHe3Uwl5gjEFPN/EuIXXl
X-Google-Smtp-Source: AGHT+IHBe36c09W7VSpH/dV488Y11luG4bCty3CezFV6s4rgEL8zpmKSxCuLyAcFBb7b6vSYzjGoAw==
X-Received: by 2002:a05:6a21:6d83:b0:1f5:a98d:3d8a with SMTP id adf61e73a8af0-2045b9f2684mr16054051637.40.1745764052990;
        Sun, 27 Apr 2025 07:27:32 -0700 (PDT)
Received: from pop-os.. ([49.207.200.116])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a6a66dsm6438159b3a.102.2025.04.27.07.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 07:27:32 -0700 (PDT)
From: Aditya Dutt <duttaditya18@gmail.com>
To: syzbot+7cb897779f3c479d0615@syzkaller.appspotmail.com,
	syzbot+6b1d79dad6cc6b3eef41@syzkaller.appspotmail.com,
	syzbot+67f714a53ce18d5b542e@syzkaller.appspotmail.com,
	syzbot+e829cfdd0de521302df4@syzkaller.appspotmail.com
Cc: Aditya Dutt <duttaditya18@gmail.com>,
	syzkaller-lts-bugs@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: Test if it's still reproducible
Date: Sun, 27 Apr 2025 19:57:23 +0530
Message-Id: <20250427142723.72473-1-duttaditya18@gmail.com>
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
