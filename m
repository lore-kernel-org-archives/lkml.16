Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D1314A0BC
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 17:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744739468; cv=none; b=mjciGbbmmxwDg/hybTUublU1DVSPDSh+hXAufGxckErubnmVxIgYa2YY+TSypvZ3e5JtcE02kzIDXZxCDqvlasfFx+DUkZBs3V79tk38UFalB34WLoQFUP+abonVASkk30hloCcq5Db3qg1lsk3Pd5d4z7hnAd7m2DzwDI9q/fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744739468; c=relaxed/simple;
	bh=bc829BU+7UnsOMXcXdUDJgV0SPYS643+LEuOhfKGCrA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YbUjy/ZEvKH3EWDRmWwpOTDflV1pcU1JbocOyqxVdCB+E5bKynwJB5Blh5ea6ZmkHRq8ggAJLAUPJfQc+hrLSHgR2igOLxDWtQHBqPLzk+bs6G2GaWuZvqK0OdHn+VY4vY6huFwYELpOtzXDX9bl17bRt83J5TnkO3NAY50bCQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kiwEc6+g; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kiwEc6+g"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2264aefc45dso87590065ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744739466; x=1745344266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uDPqhVA8+u75XljjuMIGCr92m49FaXVHk2Z7wule4kM=;
        b=kiwEc6+gIt70jg18zsijwp9FWsupcXA0kefjTYRkBYB/jWX9VdUs1rkB9jsVBDui5C
         zKdnnnrfwvtAkgtnMv1/IhgCuU5gQ1B1QTzX487J28jQhv7dEI9QdQCk0mv3G+cQClRG
         W6rI7T3GlySN6ykddYHPb8+Yo7p4FyWChA2sDUIzSgD3XnCZ0NHECeC1PqN2FFlD3nw5
         6ef/gotst0gZzpJ73jZ2IbFFh2ZzOOw3nJI7jpV73VnFk1E4r1e4KkZFfGbS+p6wVw9i
         mtnoFxIb8NHM73yuIgeMEPHCArcxrinMVYSYWtaEzyJKx1WJhQFj6zE8vXPzm2JTN5j8
         gosw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744739466; x=1745344266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uDPqhVA8+u75XljjuMIGCr92m49FaXVHk2Z7wule4kM=;
        b=XUk4DMzQL+2SEIcTUiBXtH1mmLAwlJ3+GOzZsCWkdzJa/U1QLzJwlP6uwiU6ZYnd6a
         jTQI07dR4jMinbPBQ8/Q/cKDUl54m05OfTey51OMQwBuHpAyJHiGSDHuLSE1eUXeaCtI
         c3hSP2kLOzEnDT6qKmZccaU/QyrJqarsUsFor0Myc1FX+YQwMbT62qzTKeZLQxwmCbpf
         6nL1njJPtlq7dIjCiua802iuBOLwJ5/TI2fkyqfJEKeoxkAombsk8Hd16poNY2ygDaao
         WfQZGST1d3n7it/RHPmpaOmcQF5v8oK3oxEuryGk2crHPeABQIs7K6Aii0/6gonFOuEA
         +QMw==
X-Forwarded-Encrypted: i=1; AJvYcCUBfC/5txf0VaAhW/JPNYCJNpt198F+VDFV/Fd6J+jGNErO8RnZpeGY5aGwtpURbMyy2xyfa2HmDZQH+uc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz51aDB0HQrxzwMT+b6TlGfthIg9bT9gR0dG7w+W1dLthwn0GuR
	YTFs59DfaLJzuJH/yV1NjJOQnofwuPHGDXYh8l/qSNOYiizKLvi3
X-Gm-Gg: ASbGncuyfwE3CuT2aKYmZRNhco7pz+eu96AyIJOocBX4ONIlMIDjoLYxHQvKkGOhs35
	AYiI5zlsldSjl+6j2TJOtLhCPWIiaUV8vNJhd4QYCyOwsqpAUpP29B4AqhRlw8IHtz3hOX6Y2XI
	4yF5O8fD3FtMKfNFR/YuPhfWhIOjSMhe//styolcG11aY19dqVr9e6jto+kuMqTJBigV7MpCMfs
	ojw4qYYTj7n3W6aPt8qE+QsiJYNXETiJbtfzpAz9vUggR7wdcFjHw7ko1PgXZwGpAW6lxNbP+BY
	1oEEqivZCbpRrhD1/RKvIN4zvpwST96Veu/33KJy
X-Google-Smtp-Source: AGHT+IHoRtWSGUqFE1uqRh4yPvysINFawMBd2Kv3h1mf3laWdrzIkkTwWbXBefKpFMO5Cu5bpBl6Ew==
X-Received: by 2002:a17:902:f686:b0:223:668d:eba9 with SMTP id d9443c01a7336-22c318a6f90mr1153905ad.10.1744739466523;
        Tue, 15 Apr 2025 10:51:06 -0700 (PDT)
Received: from pop-os.. ([49.207.215.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b628edsm120684215ad.10.2025.04.15.10.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 10:51:06 -0700 (PDT)
From: Aditya Dutt <duttaditya18@gmail.com>
To: syzbot+ccb458b6679845ee0bae@syzkaller.appspotmail.com
Cc: Aditya Dutt <duttaditya18@gmail.com>,
	syzkaller-lts-bugs@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: Test if it's still reproducible
Date: Tue, 15 Apr 2025 23:20:57 +0530
Message-Id: <20250415175057.392984-1-duttaditya18@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git linux-5.15.y

diff --git a/fs/jfs/jfs_dinode.h b/fs/jfs/jfs_dinode.h
index 5fa9fd594115..e630810a48c6 100644
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
index 937ca07b58b1..5a360cd54098 100644
--- a/fs/jfs/jfs_imap.c
+++ b/fs/jfs/jfs_imap.c
@@ -671,7 +671,7 @@ int diWrite(tid_t tid, struct inode *ip)
 		 * This is the special xtree inside the directory for storing
 		 * the directory table
 		 */
-		xtpage_t *p, *xp;
+		xtroot_t *p, *xp;
 		xad_t *xad;
 
 		jfs_ip->xtlid = 0;
@@ -685,7 +685,7 @@ int diWrite(tid_t tid, struct inode *ip)
 		 * copy xtree root from inode to dinode:
 		 */
 		p = &jfs_ip->i_xtroot;
-		xp = (xtpage_t *) &dp->di_dirtable;
+		xp = (xtroot_t *) &dp->di_dirtable;
 		lv = ilinelock->lv;
 		for (n = 0; n < ilinelock->index; n++, lv++) {
 			memcpy(&xp->xad[lv->offset], &p->xad[lv->offset],
@@ -714,7 +714,7 @@ int diWrite(tid_t tid, struct inode *ip)
 	 *	regular file: 16 byte (XAD slot) granularity
 	 */
 	if (type & tlckXTREE) {
-		xtpage_t *p, *xp;
+		xtroot_t *p, *xp;
 		xad_t *xad;
 
 		/*
diff --git a/fs/jfs/jfs_incore.h b/fs/jfs/jfs_incore.h
index a466ec41cfbb..852f4c1f2946 100644
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
index dca8edd2378c..7d19324f5a83 100644
--- a/fs/jfs/jfs_txnmgr.c
+++ b/fs/jfs/jfs_txnmgr.c
@@ -778,7 +778,7 @@ struct tlock *txLock(tid_t tid, struct inode *ip, struct metapage * mp,
 			if (mp->xflag & COMMIT_PAGE)
 				p = (xtpage_t *) mp->data;
 			else
-				p = &jfs_ip->i_xtroot;
+				p = (xtpage_t *) &jfs_ip->i_xtroot;
 			xtlck->lwm.offset =
 			    le16_to_cpu(p->header.nextindex);
 		}
@@ -1708,7 +1708,7 @@ static void xtLog(struct jfs_log * log, struct tblock * tblk, struct lrd * lrd,
 
 	if (tlck->type & tlckBTROOT) {
 		lrd->log.redopage.type |= cpu_to_le16(LOG_BTROOT);
-		p = &JFS_IP(ip)->i_xtroot;
+		p = (xtpage_t *) &JFS_IP(ip)->i_xtroot;
 		if (S_ISDIR(ip->i_mode))
 			lrd->log.redopage.type |=
 			    cpu_to_le16(LOG_DIR_XTREE);
diff --git a/fs/jfs/jfs_xtree.c b/fs/jfs/jfs_xtree.c
index 3148e9b35f3b..34db519933b4 100644
--- a/fs/jfs/jfs_xtree.c
+++ b/fs/jfs/jfs_xtree.c
@@ -1224,7 +1224,7 @@ xtSplitRoot(tid_t tid,
 	struct xtlock *xtlck;
 	int rc;
 
-	sp = &JFS_IP(ip)->i_xtroot;
+	sp = (xtpage_t *) &JFS_IP(ip)->i_xtroot;
 
 	INCREMENT(xtStat.split);
 
@@ -3059,7 +3059,7 @@ static int xtRelink(tid_t tid, struct inode *ip, xtpage_t * p)
  */
 void xtInitRoot(tid_t tid, struct inode *ip)
 {
-	xtpage_t *p;
+	xtroot_t *p;
 
 	/*
 	 * acquire a transaction lock on the root
diff --git a/fs/jfs/jfs_xtree.h b/fs/jfs/jfs_xtree.h
index 5f51be8596b3..dc9b5f8d6385 100644
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
