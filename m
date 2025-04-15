Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD1E22155D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 17:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744739349; cv=none; b=Mjyxc10wGfrlsSO/CWgi88NlGVzBJxT0XSuVKVSIaAjUy386KnfhpuXq8WZg64DY57ie/nXyfibiqOa4rX2VFTtFddiyywaH/PyIwvMpq4dWDUT/hw7m8ZIiPr3kBK3gAnZJn9dwUO9+GM8nAy09nMwJDEasuq8nS6eQa6IvHPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744739349; c=relaxed/simple;
	bh=bc829BU+7UnsOMXcXdUDJgV0SPYS643+LEuOhfKGCrA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hcRekxmINXR1SCsMQokk+FB2oIGWal6eZoiaTQ8a5P1utaxbfmAaWPCzsr3E7symGhas9vjT81JWfm/8NplggFnEtqSjIOg1mdIYe0dLli+wo0BUTe9g+TmOakA2twDQ3SgqXokEcxJVMNTBBrckzBm0CJbJ6dTHAEhSbA8YbPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VITJuTRE; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VITJuTRE"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-227c7e57da2so52588115ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744739347; x=1745344147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uDPqhVA8+u75XljjuMIGCr92m49FaXVHk2Z7wule4kM=;
        b=VITJuTRERhTy1IDuNk9YIeWzfY/dzVnkqtBNQfuWZ+bi2gZgMiBfUKXc13JN336T8i
         2NDkysrw0j9S6bRzWfeDnJ3iJ391UnniHTkLSIYVDq6K/C7XsloaFMNJLnrFzzQuUwU7
         RCZ0dHDhOQsflN2U0wPRhWofn5vM5GUD40ewFVCAbzcrMR5/XWXD3TKKQm3eq8VPiw5N
         TgEuMXu++6IsjEpvCKc1qXVHWA3A/lk9s2pC1cGnZhaQINkDOiXF9yhKYo8Yw9pW7b1Z
         AxO058kJJtXe2AzYrR0LMplieVLknmWVvSTXdeB23oplk79hJM4jY28IR+tsiNUcoWbi
         EXzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744739347; x=1745344147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uDPqhVA8+u75XljjuMIGCr92m49FaXVHk2Z7wule4kM=;
        b=v+PT5y4JWaRBffkpYXjb4S02tWuZ/Wy/if59gffU+nIy5A9P6qnB5QWu3BwgDjxpcG
         gUo7wK03J38ficj3lY3T9ekqSJNt4mbiFjSWg20cDVw5Q/wK87JiQtwtjRvKYyGPA+9a
         Mui9MCj1OA9qqmAQ3C4y4RGGlZ0mc/hZvZz6o780UYun+RPxY0u8nIfQvI8KFw5bxqs/
         LnFLM1ogTEv07AFqUfFf9xaEM3qcOeDrS8xBYkjdWsjPzsxPcZk3r+sVIyT/BqUXuh3d
         x9SNZpcsAn4dfuW5iSO6lKH1JRdWIp7dISZwUAvemuBmGB1WkvUFs1cHmcIDb6pwZxNp
         hHRg==
X-Forwarded-Encrypted: i=1; AJvYcCXIvQsUEHV5LfTAhwKNtuuxQJ9DJ/OysKup3CrxdQODbD83cz1YjgpwNEsU1DlaRqYJZGwovLIMnl8g8VE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLnK4MsR0+KZDLGAu189yLqbfP+DOVyir00qo5AvwENE8VhZVS
	S3K8QNjB51npWjwx6gO6rZQe7vq9UfACpTRTobZKMMQFDf7fdAT7
X-Gm-Gg: ASbGncufMhvNSGoIqQxxioetk2BLZHQtHhsq284SriY8ZZAhTuDxgS7MOXNYRMw7vlB
	O4eXhgVC4+6W2DEZp4+A+1P1nC9wLrNFK273i0YL8OV+LgJDO/ZUKL8I5WMBExKY7TROLeRywtX
	bY8SJ3iXufDqEHLK1ril5rGus9TYCxO1V9f1WOuVNhYxZXontrb30XU4mUAtjZLjRBEXTJQ2xJ1
	kc7/g6dJZUTha65Zvntov722qDDFJZdzB/1OZz/TlIL8/pg0rUYgPrimaAPASopmwxjADsIICtK
	/Vku4+y7k2wy1rzBqfbfoDrRmTZPY1UK7orOAadG
X-Google-Smtp-Source: AGHT+IEJIoZH0DUaaIdRdFmEsC3sTHcUdbPLZe57kZw9DBOVvGjBsLxOacOt/IQtRrrX5mEPosiGLg==
X-Received: by 2002:a17:903:230a:b0:224:2175:b0cd with SMTP id d9443c01a7336-22c319fef18mr678565ad.26.1744739347423;
        Tue, 15 Apr 2025 10:49:07 -0700 (PDT)
Received: from pop-os.. ([49.207.215.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b62973sm120846815ad.24.2025.04.15.10.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 10:49:07 -0700 (PDT)
From: Aditya Dutt <duttaditya18@gmail.com>
To: syzbot+b974bd41515f770c608b@syzkaller.appspotmail.com
Cc: Aditya Dutt <duttaditya18@gmail.com>,
	syzkaller-lts-bugs@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: Test if it's still reproducible
Date: Tue, 15 Apr 2025 23:18:56 +0530
Message-Id: <20250415174856.379736-1-duttaditya18@gmail.com>
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
