Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840051E5711
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 21:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744578161; cv=none; b=oM+m9R/JzfDxtKKi5xAp/1pRiWMD+Giqlro9lNYvUP5mumHNLmCNhpBK/cLRjI67Qv6FA/K6P4KPNZrv9pkhSg+ZEqhMvNK/bOs0csY2TrVYWXrNpIdFWIYvC1tnKL9Ojq/ITKdrRZEAqave5AhtLB4kCWlKskxjGStY8JsBLx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744578161; c=relaxed/simple;
	bh=Pk92mL5k+XXRZ0OWMKLRIOmc3frVVp2jR/b+e//O1MY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UvkyGjE/QunPMLuW5iC/q+4VA7lLb1VBfOe8uRIbEeif/Lbc9THcMzdUJZDGN/QWDeOuONLajYJAo+ty97Npuk6+8qOzVBs/669IYIdyzHPlJRUzh3SIRNul9we/txEiPHUIsfxhak7kbsKdRi+fhCrEh2Wvj5MxkLf3EST6PHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y/C32+5f; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y/C32+5f"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-227d6b530d8so33754095ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 14:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744578158; x=1745182958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oExSuRgSkOYG1U5jJabPZvKPbMxgJkOF/aB8GjfoPCg=;
        b=Y/C32+5fVQTTbNwfDnEN/pkw/GiCh2qMS/1xQIUybqO12/+mDsOr3IQi2HmZqHUg+B
         tAJCtyYZyi13LJw1qtc2Z1+YApiwQ1jRoN5LS3FfSeuEri1rENl6mZpdz0SDw/it+Y3b
         qwz5GydwnxqAMmjbtgBCOOv2n/5ozB9MutzwdNF3m+LAP0tbU5RmVpWruMzTDG5xDvyE
         Xfhs6lpyVfM3tMjJAcClDKuBy3ZN5X9s5GXP3vy240IkCsYQKzVhXCa/5Ub1BbOP20hk
         +qbljtqkXtlaTfW+srECE+vasCMDi6r4rdiuU2SIVICSAidS2s178FtddVmLsgRKnr+Q
         OYXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744578158; x=1745182958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oExSuRgSkOYG1U5jJabPZvKPbMxgJkOF/aB8GjfoPCg=;
        b=Ti0oE4htk4oJkqK7TtBhbJ7YMeAuMQFQ9Uqjke3jRv1ZzVS+k+H5w4Y7hk+Ylr1s1j
         uSBgglpKJ9oVrz/D9eXQOTJ+RHygkuqH3WlWquPI59I4u7enevmw8zQ+lqb+YyStnVxR
         usRbQNPG8Nf6HbMg1x0Wcf7hRj0htzxsTgrssTbXVJx/Jox5rhlqep64sJlqNdkwBnoM
         uNZwT+PnZthsRgCM1mUMvR1nEYw2h+ozDTEOZtjU5LMoy4mMgRXRgbPRh5PTBzPw0de5
         9B0xl4U+FXuwamlAbLDpYkF5LxDawemUXpi8uMSR9dw5zufx9xwQ6L/pZX75NG1LRS/l
         UoDg==
X-Forwarded-Encrypted: i=1; AJvYcCVh5TeZuk9sj6DRQzsPv/Mi5fj1lbZEELfrH8J9D470Sp0hAKw81Rja39sgBjhd3TWCRAGbBRpX/nJuA+o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSf/8Sa1Mn7xE35XqAHxITjOWXwmu/wbRJuZhLV8uy8hDcEK5L
	05vZjhss7riM2UU+v95VZLS0+Rzdu9MUAQg0wrZuqnKW3zcYuBLFHmZ6wcIk2m0=
X-Gm-Gg: ASbGncte6XCDDqiz9A/3n8agpnYGRy1/Oc6AwNhWp0eIE2/zCoi+1zCVD9fO2OhWx6L
	r0Igp0tBrnKJAaJmowd+Ouxt8IfS9IpUfA0X5fOpg2KcATIamQHNDDUPUVf5Lk921981FRtQGTJ
	BKwALTnkee/jINa8dU1NdiH77TrGi8uGk4mguPXqCa12JHJuWhCFdkjvGVxivJLF5YEby03tsSX
	Teap9xaHRjEWBIqo5yNRKp/ZRSjbCwWtaTbCq/6pGOqNNsvSmQnNoDsyWgNV/g/O5eUj4ZU1sxA
	iH8ioQTnAN5MRkH/6SnkCyYupgqYhzGM5xVrY4vmHOeV4iujzw==
X-Google-Smtp-Source: AGHT+IF0dOs0iCfPOxj+3D4d4UqDWm2ILpwsXwoRsCyX1J6rpUpFZJN7mY8/7lWBtAy7NnquaO0L6Q==
X-Received: by 2002:a17:903:8d0:b0:21f:136a:a374 with SMTP id d9443c01a7336-22bea4fcf7bmr146617735ad.43.1744578157486;
        Sun, 13 Apr 2025 14:02:37 -0700 (PDT)
Received: from archlinux.nitk.ac.in ([2400:4f20:11:c00::106:b642])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c95cdcsm86630895ad.118.2025.04.13.14.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 14:02:37 -0700 (PDT)
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
To: shaggy@kernel.org,
	jfs-discussion@lists.sourceforge.net
Cc: linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>
Subject: [PATCH v2] jfs: jfs_xtree: replace XT_GETPAGE macro with xt_getpage() function
Date: Mon, 14 Apr 2025 02:32:18 +0530
Message-ID: <20250413210218.111472-1-suchitkarunakaran@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace legacy XT_GETPAGE macro with an inline function and update all
instances of XT_GETPAGE in jfs_xtree.c file to use the new function.

Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
---
 fs/jfs/jfs_xtree.c | 55 +++++++++++++++++++++++-----------------------
 1 file changed, 28 insertions(+), 27 deletions(-)

diff --git a/fs/jfs/jfs_xtree.c b/fs/jfs/jfs_xtree.c
index 4fea5e90e29b..5b8b7819cf29 100644
--- a/fs/jfs/jfs_xtree.c
+++ b/fs/jfs/jfs_xtree.c
@@ -104,32 +104,33 @@ static int xtSplitRoot(tid_t tid, struct inode *ip,
  *	bn      - block number (s64) of the xtree page to be retrieved;
  *	mp      - pointer to a metapage pointer where the page buffer is returned;
  *	size    - size parameter to pass to BT_GETPAGE;
- *	p       - pointer to an xtpage_t pointer mapping the page's data.
+ *      rc      - pointer to an integer to store the return code;
  *
  * returns:
- *	0 on success, or -EIO if the page is corrupt or an error occurs.
+ *      A pointer to the xtree page (xtpage_t) on success. If an error occurs,
+ *      sets rc to -EIO, releases the page buffer, sets mp to NULL and returns NULL.
  */
 
-static inline int xt_getpage(struct inode *ip, s64 bn, struct metapage **mp,
-			unsigned int size, xtpage_t **p)
+static inline xtpage_t* xt_getpage(struct inode *ip, s64 bn, struct metapage **mp,
+				unsigned int size, int *rc)
 {
-	int rc;
+	xtpage_t *p;
 
-	BT_GETPAGE(ip, bn, *mp, xtpage_t, size, *p, rc, i_xtroot);
+	BT_GETPAGE(ip, bn, *mp, xtpage_t, size, p, *rc, i_xtroot);
 
-	if (!rc) {
-		if ((le16_to_cpu((*p)->header.nextindex) < XTENTRYSTART) ||
-			(le16_to_cpu((*p)->header.nextindex) >
-				le16_to_cpu((*p)->header.maxentry)) ||
-			(le16_to_cpu((*p)->header.maxentry) >
+	if (!(*rc)) {
+		if ((le16_to_cpu(p->header.nextindex) < XTENTRYSTART) ||
+			(le16_to_cpu(p->header.nextindex) >
+				le16_to_cpu(p->header.maxentry)) ||
+			(le16_to_cpu(p->header.maxentry) >
 				((bn == 0) ? XTROOTMAXSLOT : PSIZE >> L2XTSLOTSIZE))) {
 			jfs_error(ip->i_sb, "xt_getpage: xtree page corrupt\n");
 			BT_PUTPAGE(*mp);
 			*mp = NULL;
-			rc = -EIO;
+			*rc = -EIO;
 		}
 	}
-	return rc;
+	return p;
 }
 
 /*
@@ -270,7 +271,7 @@ static int xtSearch(struct inode *ip, s64 xoff,	s64 *nextp,
 	 */
 	for (bn = 0;;) {
 		/* get/pin the page to search */
-		rc = xt_getpage(ip, bn, &mp, PSIZE, &p);
+		p = xt_getpage(ip, bn, &mp, PSIZE, &rc);
 		if (rc)
 			return rc;
 
@@ -825,7 +826,7 @@ xtSplitUp(tid_t tid,
 		 * insert router entry in parent for new right child page <rp>
 		 */
 		/* get/pin the parent page <sp> */
-		rc = xt_getpage(ip, parent->bn, &smp, PSIZE, &sp);
+		sp = xt_getpage(ip, parent->bn, &smp, PSIZE, &rc);
 		if (rc) {
 			XT_PUTPAGE(rcmp);
 			return rc;
@@ -1080,7 +1081,7 @@ xtSplitPage(tid_t tid, struct inode *ip,
 	 * update previous pointer of old next/right page of <sp>
 	 */
 	if (nextbn != 0) {
-		rc = xt_getpage(ip, nextbn, &mp, PSIZE, &p);
+		p = xt_getpage(ip, nextbn, &mp, PSIZE, &rc);
 		if (rc) {
 			XT_PUTPAGE(rmp);
 			goto clean_up;
@@ -1435,7 +1436,7 @@ int xtExtend(tid_t tid,		/* transaction id */
 			return rc;
 
 		/* get back old page */
-		rc = xt_getpage(ip, bn, &mp, PSIZE, &p);
+		p = xt_getpage(ip, bn, &mp, PSIZE, &rc);
 		if (rc)
 			return rc;
 		/*
@@ -1451,7 +1452,7 @@ int xtExtend(tid_t tid,		/* transaction id */
 			XT_PUTPAGE(mp);
 
 			/* get new child page */
-			rc = xt_getpage(ip, bn, &mp, PSIZE, &p);
+			p = xt_getpage(ip, bn, &mp, PSIZE, &rc);
 			if (rc)
 				return rc;
 
@@ -1729,7 +1730,7 @@ int xtUpdate(tid_t tid, struct inode *ip, xad_t * nxad)
 			return rc;
 
 		/* get back old page */
-		rc = xt_getpage(ip, bn, &mp, PSIZE, &p);
+		p = xt_getpage(ip, bn, &mp, PSIZE, &rc);
 		if (rc)
 			return rc;
 		/*
@@ -1745,7 +1746,7 @@ int xtUpdate(tid_t tid, struct inode *ip, xad_t * nxad)
 			XT_PUTPAGE(mp);
 
 			/* get new child page */
-			rc = xt_getpage(ip, bn, &mp, PSIZE, &p);
+			p = xt_getpage(ip, bn, &mp, PSIZE, &rc);
 			if (rc)
 				return rc;
 
@@ -1806,7 +1807,7 @@ int xtUpdate(tid_t tid, struct inode *ip, xad_t * nxad)
 		XT_PUTPAGE(mp);
 
 		/* get new right page */
-		rc = xt_getpage(ip, bn, &mp, PSIZE, &p);
+		p = xt_getpage(ip, bn, &mp, PSIZE, &rc);
 		if (rc)
 			return rc;
 
@@ -1882,7 +1883,7 @@ printf("xtUpdate.updateLeft.split p:0x%p\n", p);
 			return rc;
 
 		/* get back old page */
-		rc = xt_getpage(ip, bn, &mp, PSIZE, &p);
+		p = xt_getpage(ip, bn, &mp, PSIZE, &rc);
 		if (rc)
 			return rc;
 
@@ -1899,7 +1900,7 @@ printf("xtUpdate.updateLeft.split p:0x%p\n", p);
 			XT_PUTPAGE(mp);
 
 			/* get new child page */
-			rc = xt_getpage(ip, bn, &mp, PSIZE, &p);
+			p = xt_getpage(ip, bn, &mp, PSIZE, &rc);
 			if (rc)
 				return rc;
 
@@ -2286,7 +2287,7 @@ s64 xtTruncate(tid_t tid, struct inode *ip, s64 newsize, int flag)
 	 * first access of each page:
 	 */
       getPage:
-	rc = xt_getpage(ip, bn, &mp, PSIZE, &p);
+	p = xt_getpage(ip, bn, &mp, PSIZE, &rc);
 	if (rc)
 		return rc;
 
@@ -2524,7 +2525,7 @@ s64 xtTruncate(tid_t tid, struct inode *ip, s64 newsize, int flag)
 
 	/* get back the parent page */
 	bn = parent->bn;
-	rc = xt_getpage(ip, bn, &mp, PSIZE, &p);
+	p = xt_getpage(ip, bn, &mp, PSIZE, &rc);
 	if (rc)
 		return rc;
 
@@ -2809,7 +2810,7 @@ s64 xtTruncate_pmap(tid_t tid, struct inode *ip, s64 committed_size)
 		 * first access of each page:
 		 */
       getPage:
-		rc = xt_getpage(ip, bn, &mp, PSIZE, &p);
+		p = xt_getpage(ip, bn, &mp, PSIZE, &rc);
 		if (rc)
 			return rc;
 
@@ -2854,7 +2855,7 @@ s64 xtTruncate_pmap(tid_t tid, struct inode *ip, s64 committed_size)
 
 	/* get back the parent page */
 	bn = parent->bn;
-	rc = xt_getpage(ip, bn, &mp, PSIZE, &p);
+	p = xt_getpage(ip, bn, &mp, PSIZE, &rc);
 	if (rc)
 		return rc;
 
-- 
2.49.0

