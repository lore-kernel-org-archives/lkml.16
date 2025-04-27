Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5850DC148
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 15:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745766313; cv=none; b=ON4nDNInD0sRp5ir7UOtxVsrHTJhoU5DQgOSIXHinsPblOidxmRXVVGyy97+cdq26/qrz0dRWYIzGYXSrZgyVcHP1qBiVyBUulJIJdJ0p6dDjwmty02a1EB0acec3iMOlyrwNfREEBiMS5SGRJzknr0SSpqXFX1n0WVFhh5GlGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745766313; c=relaxed/simple;
	bh=Ywh+mRMPi4ox+Q+dMxHmvWj1KD/4vPH1Juc9WxWF1j8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mC9rbtRU5e7V8mTn4k/WZuej3Jw+TlBFrxQxIcfX8Ra+ZAyaiAdTierqMrwR0ApxVey2QLpTub42WgK8RyBqP2tu9t5Iu6oN3v0KKi//BlPeK6eiV0vs5jRErAA8N4f5fQu597X4DD7q7J2tUr8qjvT5RDEb5WMhUECn7daCo8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UlrvwOOc; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UlrvwOOc"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b170c99aa49so1914475a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 08:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745766311; x=1746371111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HQ4UCsD2wUaqapNoxDi1mJscBkHPxo1HGJNrvw4hNXE=;
        b=UlrvwOOcE96Khs0HKj+5K+Ta12R3+5/qixfwONt/iIxovFL8pQX2V3DfQTjiRtZHqW
         Rd7/159PVPmC3rQf4NzoV/LIFGfZ8K8GhZh0rXlyAXFyMxMJhMsuFAi0EPXSPMko0u5l
         9Ci6nGvhbtnizmA4RD8+uUxJ+yINPr5i1ZhdUahU989Z8kBCzaIgijjcF71uLr2XuQ2U
         ZYUSHkJY71S5KkceWobEjaoYDXnvPAkGcjgEtsMWDRWmpoY8pJf16UEPKGMA+mwD7m0Z
         JPspwZTNLunRmsBxWyuamx0wzDDmA2dTSHMvoAx+J4AUn63cion01dWXPkrLmdX8iXI1
         pX8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745766311; x=1746371111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HQ4UCsD2wUaqapNoxDi1mJscBkHPxo1HGJNrvw4hNXE=;
        b=hBTFPHkSvaG1AEHktAeahqEEfTO5cy7t3PJJg9EzO//+xKLpyaGuHjXK+xvHaMI2r2
         ViFR1QyOupKJkeyY/nvcf6XECuGMFDAYz0c4AMnwgECVZ3Ber5t2PfuaDWuPuFo/j66t
         ClFu0gkMFx23FWOT8oVGJUmcUqSP/6IK/eOWFk0IeH9hPruv6Aaumx1b7WXyVDOBKwqe
         MQ5BYHs7EF5b/rnUB8LMbatncrvk4WparD9dqZUiEMROXELuVzIphR96NKMuQUuO8gvg
         CnARQLZ1ew0U85x2qzo/1S9k86nty6nngoUguGlYgGBEzGAAOX/RWfimbaUEyOfSMSrp
         6esw==
X-Forwarded-Encrypted: i=1; AJvYcCUo+IzbZwpvSOfBNYfhMgCM4ugYr+x4HDPz/wVGUUa0SXnEzWVNADF0EAtjny1jnCn4F7Ymo1/ti1RFHQU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLaqHRLW3Hb/aINajAJ7uZfWGH/QpJl7O0FaYznEDVIc5PVpyG
	14odEwSgQKFG+TXj3i3u86Ln1LfnjGC6RqrIGnT5/7sDX0dA8gly
X-Gm-Gg: ASbGncuc5LJXOMy0MSSqXtsxcAH2Ogr/KZmJpYhQBmSsCOd15JuCEjPXSqVCoWTjc+A
	dobpqITbs+IXeLYvNE7t7rYmLwvAQOgh4zhPw4Fh2cbj4uWfewnVn9T6NjOfMVj6U9FZ1S0j2vb
	X+pR06midj9wTbFoGa6rKAfUDAT5gQMhlBexpc/fR74FtbUAEHRw7ZY99IEris+0pvzetEGWGla
	sc5rzAwQkH9jp2ALHPFIEJ1lvZIzy02KecCYUUTM/lyYbfM+A4/KgIPaWuxceklqSjpnCLCs+jN
	9KNRY3hfO25IXpEzS7yhR1NOmWdpJPMvDFuOt6BM
X-Google-Smtp-Source: AGHT+IHCzwtdvk0sHUo82yyWWKSU0f1kQtNI4M6SRFJuCsUhPWZb+k6xtv9dctngGza1i5nX/aPckw==
X-Received: by 2002:a17:90b:2802:b0:2fa:e9b:33b8 with SMTP id 98e67ed59e1d1-309f7dfa014mr14860332a91.18.1745766311455;
        Sun, 27 Apr 2025 08:05:11 -0700 (PDT)
Received: from pop-os.. ([49.207.200.116])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5216adbsm64912525ad.234.2025.04.27.08.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 08:05:11 -0700 (PDT)
From: Aditya Dutt <duttaditya18@gmail.com>
To: syzbot+67f714a53ce18d5b542e@syzkaller.appspotmail.com
Cc: Aditya Dutt <duttaditya18@gmail.com>,
	syzkaller-lts-bugs@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: Test if it's still reproducible
Date: Sun, 27 Apr 2025 20:35:05 +0530
Message-Id: <20250427150505.83981-1-duttaditya18@gmail.com>
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
