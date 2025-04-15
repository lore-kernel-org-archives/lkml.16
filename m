Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC17919CD17
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 18:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744740532; cv=none; b=kT2+sve1v1y/ISYRwrJ0EBeKS2oqE4VI7N/rCjGA6NO9zjH13b9bdytjVJmOQdtAf32IYRyYOtdiuFrfUASj17950ywoDTC1/8mWddEjvm2WLsLTAikh64JcnIsJTMRuOSa1bk4vB4jZvXV1dCyTQpx2IxGq0UDZbZOtZVkjAQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744740532; c=relaxed/simple;
	bh=o6+Eil4uX9ctgJoAE45DqBGTx/za3XLcV45WCQQqpCA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Bm9hLt82r7wMkHrhAKEkGWvhWJm+ksV628QoX3AZIjdE271qzjft8kPUv3Cc8bldFgw1GFDwu906NRo+v2HCxcN/NUQCnvg59qPWhP2NJoHFoy9znEW3sb5BvoZH+nWj7RkIPoGhwYJGfujYR5yv+OZSxJKQuKFXBnfQqK1K2QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YySypBt4; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YySypBt4"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-736c062b1f5so4991703b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 11:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744740530; x=1745345330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AhohEOEKrvFoqIHtTXX76tezRnIlwWn51kNhrjU6ztA=;
        b=YySypBt4c6JSrHpB+zlIpw7QbzABEZ1OFhgXW63kCCh/UjuBvzQ0tNOy+RJFzspEAf
         VH8T74V8wyEOpYsC4KwOX5FutVjD+MNxanMV+GeGUZavVMALNw0Q338Rq+h8ETdnKhLu
         TPsXqqI9gv8X5+NP+yazm+JAYiZddr5XPGLtJ2OsPzuBZgcp6fjHgG+5eBWWgx2MnW31
         XNNqhu/1w6jwMa0LtXHih5zfPNH2W0Six9bSo9GFXNj6lNdyOJwI7+00m83ZOGtLjvx+
         I2/aU9tLzXoKzyoNRvUWYGLb4g4bQjTKGve/QtKkqapfILm+i7LHjLYNkDgg6AC3T4qB
         YdRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744740530; x=1745345330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AhohEOEKrvFoqIHtTXX76tezRnIlwWn51kNhrjU6ztA=;
        b=D1xlYbc6Zr1UJQwfVozxTZ5zdLCC4jWi+ssyD5Q1vZud3zDrXfFGktb0irmEexvh0f
         uEIEyVBaK7MLNF6SACq3p7XvJHqYnwdyWpvVOrxxH9VS0SjoJSwd5QjEKEAWZObnOzZK
         HSGUw1437EIXfTwKt8RbzRRe3Zja46o+zmwQqMTHK7wiml58UfarA6ni7b5tXudkf1ZT
         IG8l+7hzWAGM9JlEPzgmrTrsvns6m5pN03cc3AC0VHTyOhZjBUfubdwsYm1VxC3zkWiG
         U7FdXUpNAgfPitQBvV4pP17hLjj9Q+vTFTiO2cpeVY3oBhrYmn3Y9OAy8AG/zZ1NqcBF
         83cg==
X-Forwarded-Encrypted: i=1; AJvYcCVWsn1tNpsmtGZ1HBc6g4zxaLtlkknFGby5GhDMakL4Cji+CDsu+IXu2JSqIaeh2p8qcTleNIQq32HGPQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxphuAEU36tuF8w9fjlYLJtzjZrVccHvHQqtMCatlrEDFJSe4oT
	S7lBsIoIXihAlw7u6NHbmv+sDW4RC4EKq39WtOFtTkT7fimlVE58
X-Gm-Gg: ASbGncvF2y4+KPsoV34C7ZimJc7f+XvDr70ftGNpDHNeA/n7EfeEzmaYcIM7sbgYkX6
	FQL91DcWRnNqIfEViPAHoXS1qa84zT1MMOCC/8tzibsGaztmegXKa5iylL6CSSdQfXYSnHK5MLJ
	eDVFip77968DvSfYwrOmSZaEzBTrs2QWex156kVq5/Se/JWPpx0CLKt22iO+XIi5COqS4hkj81A
	2dKXwo3s8LP+Jt0KRVuJss4gTo1lFeWNoVqVOqbP9Enam/3q3kxfwYyrWPvShCzVYAa0rdu5RNC
	AiZqmvXy4ZSb2FLss7+i8Cv24p3g5b6Pc8daqYCx
X-Google-Smtp-Source: AGHT+IF/luC5UtYBRarSDCbcokkCcqL7a2s0ZFLUQ46tDzaJbDGCcs7odrn6licAeJwBb5hbCoCwdg==
X-Received: by 2002:a05:6a00:b90:b0:736:4d44:8b77 with SMTP id d2e1a72fcca58-73c1f931237mr625108b3a.8.1744740529892;
        Tue, 15 Apr 2025 11:08:49 -0700 (PDT)
Received: from pop-os.. ([49.207.215.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd2335285sm9103299b3a.170.2025.04.15.11.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 11:08:49 -0700 (PDT)
From: Aditya Dutt <duttaditya18@gmail.com>
To: duttaditya18@gmail.com
Cc: Dave Kleikamp <dave.kleikamp@oracle.com>,
	Dave Kleikamp <shaggy@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	jfs-discussion@lists.sourceforge.net,
	skhan@linuxfoundation.org,
	Manas Ghandat <ghandatmanas@gmail.com>
Subject: [PATCH 5.15.y] jfs: define xtree root and page independently
Date: Tue, 15 Apr 2025 23:38:39 +0530
Message-Id: <20250415180839.397326-1-duttaditya18@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dave Kleikamp <dave.kleikamp@oracle.com>

[ Upstream commit a779ed754e52d582b8c0e17959df063108bd0656 ]

In order to make array bounds checking sane, provide a separate
definition of the in-inode xtree root and the external xtree page.

Signed-off-by: Dave Kleikamp <dave.kleikamp@oracle.com>
Tested-by: Manas Ghandat <ghandatmanas@gmail.com>
(cherry picked from commit a779ed754e52d582b8c0e17959df063108bd0656)
Closes: https://syzkaller.appspot.com/bug?extid=ccb458b6679845ee0bae
Signed-off-by: Aditya Dutt <duttaditya18@gmail.com>
---
Tested using C reproducer here: https://syzkaller.appspot.com/x/repro.c?x=113bb250e80000
(given in the dashboard link above
UBSAN is not triggered when this commit is there.
It is triggered when it is not.

 fs/jfs/jfs_dinode.h |  2 +-
 fs/jfs/jfs_imap.c   |  6 +++---
 fs/jfs/jfs_incore.h |  2 +-
 fs/jfs/jfs_txnmgr.c |  4 ++--
 fs/jfs/jfs_xtree.c  |  4 ++--
 fs/jfs/jfs_xtree.h  | 37 +++++++++++++++++++++++--------------
 6 files changed, 32 insertions(+), 23 deletions(-)

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
-- 
2.34.1

