Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFB227D760
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 17:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749146205; cv=none; b=SZ4KAJJ0Y5gjDgtrqnh9vC9RbXBdq5HOgcAigs7t7gxeBUZqs+SDK4CJQ5kMupzMAVsOZHQfG3/jttMw5I8n47TRRtRjcrG25Xd+yb3dFEy+U9lJiTRPtj+hBkm8o/3DsSKOHznbBalQn3+kZ6xcKLzMb3zNf91zWTgCFzyUGPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749146205; c=relaxed/simple;
	bh=fzKf2jz9QCto1iwp1YUjq3HCHQ5mp1pmfY1Mhp4cYng=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c5qd3PTkR6nsD+ZWs24aXlty9GiSegJJYCM80pgQo0myzkveCnqhop/QFnmlQAWZQRkYWy56yrSq7UHTxjbVlejAzhw1Si4m55Fet8nXBhoBgAYRj88G9BMu9e8XBd9uGx5nxXYa9vCwf+wGOflTkzKYwCz+Sn1/yxc2IIXByDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PMq7fW+B; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PMq7fW+B"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-234c5b57557so12741955ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 10:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749146203; x=1749751003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QE1NK7D9odSVao69Jtlb/9rs54V5GYBC5kloyXSAMRk=;
        b=PMq7fW+B9ThSrGi5DObzmg/ERwNZLslT2dPLB6S1qZfAUaDq1y2V8zpCu4Dw703iJG
         HrcHWDo7qySUHE1plY4lJYdAum+z85je/1r9Lhj/pTOYIS95Z6JMoaLbQAPOHVbgM84I
         UMphLYzFXTguyIJ446tT4wRq6pWN3yJJMGEs8Pt0gr/+m4H8dQTtoVcIsDBL/I5ZEAGZ
         JQ+5wPt13ED9faHfi7CoXoegAqEcPHm6PgGqQuCiYYaBhyapIycbbFJ1V4ay6JPoRP96
         SXENN7KGfPAwaQhsVnl8Xbd7i6UzYYhLUcOiIaiUUYxyPioqgiJc/1Rrmcf3hfmyXuHR
         mgOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749146203; x=1749751003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QE1NK7D9odSVao69Jtlb/9rs54V5GYBC5kloyXSAMRk=;
        b=F3Gu1MSLOQF9OXkD1GG1NkLmVs7VwuuH+jDAs624h5CxMCFu1t7PG5hxfcdEGiRxHa
         WVCyNX8chJasyjVaZjQHxCQ7doAbFJ3iPXSby2crr9XzSC0hfDQZdUWYCuWNmQwzFqjA
         7t+WTpcRxmft6P1fkOmGK1ZrCgay5eGvQTw8nq8oogmmeJQIvuO5hnR4R2D7iAV80Xpi
         qhg++CRNUly1Jmr8dyAxIUWmiOFz+EcMtqDS0oH2NNjLsr6EgA+gFyfRfOLIwKHoGzcs
         ViDV+xZ21C5es43j2vFYOivLtXsSqovn54hkOw1dWqfdpI32sUt4DBxNamO3MvWplbXi
         Rp3A==
X-Forwarded-Encrypted: i=1; AJvYcCUxBXTdEsjHJJmlUdC7IK/4ZIj1prJYdPk7+KxgFxBt5YoAL4ZJijOrsTr04XgvYt0QO4BoT3eLsn3dj7U=@vger.kernel.org
X-Gm-Message-State: AOJu0YySmLw7bL1AsqHpFSL53iSS7u8bv1f40ZB5PRgMRj6wz2q6E5SL
	jEAA5pZr3cColC8randCxnPmqiel5P7j6pToUBywqysiHnFcONotHVK9
X-Gm-Gg: ASbGncuv+KR89pYIUn+2ggyYKNF4U5/X2ZnlcPTrwEFdm9vO2FnWTD0ebazPFIH7C6l
	fsbJzZQJne+oGjC/cJo5sv4cud5+K6rD+Vn3hrNgMmBgIBhWpNOx7zpZVXeMEa8uHGD9qBgSstw
	PQA5XyaDZxSat1r4fHC/DrJsPfE+cfo4Cq76NMsHO/ytN0BhdskjHSZNTqpyxN9XNztEg524+aw
	WEfpcyiWdUStEQ6stZkAf1Awjr5UpTyJyUURUkogs3aSkIvInqsRpoPZwGvheMAQQXdqzgmfn+g
	eOv4Cut9imaS3BG0gpSDJlSzB4HNZSxe8ygyCNFXzsr+bG5/UcD+/sSE1+IU2B2otPM38C7B6VU
	=
X-Google-Smtp-Source: AGHT+IH7FuT0t4KYKzqRCX2QhSJh8CO4QqItoh8NieA7++j/STlROTlp6WkRws8oWHvWzTtPWPcDMQ==
X-Received: by 2002:a17:902:f686:b0:234:aa9a:9e0f with SMTP id d9443c01a7336-23601d21231mr4163485ad.23.1749146202802;
        Thu, 05 Jun 2025 10:56:42 -0700 (PDT)
Received: from localhost.localdomain ([205.254.163.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bdd0e9sm122228185ad.74.2025.06.05.10.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 10:56:42 -0700 (PDT)
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
To: shaggy@kernel.org,
	jfs-discussion@lists.sourceforge.net
Cc: linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>
Subject: [PATCH RESEND] jfs: jfs_xtree: replace XT_GETPAGE macro with xt_getpage()
Date: Thu,  5 Jun 2025 23:26:34 +0530
Message-ID: <20250605175634.16362-1-suchitkarunakaran@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace legacy XT_GETPAGE macro with an inline function that returns a
xtpage_t pointer and update all instances of XT_GETPAGE in jfs_xtree.c

Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
---
 fs/jfs/jfs_xtree.c | 87 ++++++++++++++++++++++++++++------------------
 1 file changed, 53 insertions(+), 34 deletions(-)

diff --git a/fs/jfs/jfs_xtree.c b/fs/jfs/jfs_xtree.c
index 5ee618d17e77..5b8b7819cf29 100644
--- a/fs/jfs/jfs_xtree.c
+++ b/fs/jfs/jfs_xtree.c
@@ -49,26 +49,6 @@
 
 #define XT_PAGE(IP, MP) BT_PAGE(IP, MP, xtpage_t, i_xtroot)
 
-/* get page buffer for specified block address */
-/* ToDo: Replace this ugly macro with a function */
-#define XT_GETPAGE(IP, BN, MP, SIZE, P, RC)				\
-do {									\
-	BT_GETPAGE(IP, BN, MP, xtpage_t, SIZE, P, RC, i_xtroot);	\
-	if (!(RC)) {							\
-		if ((le16_to_cpu((P)->header.nextindex) < XTENTRYSTART) || \
-		    (le16_to_cpu((P)->header.nextindex) >		\
-		     le16_to_cpu((P)->header.maxentry)) ||		\
-		    (le16_to_cpu((P)->header.maxentry) >		\
-		     (((BN) == 0) ? XTROOTMAXSLOT : PSIZE >> L2XTSLOTSIZE))) { \
-			jfs_error((IP)->i_sb,				\
-				  "XT_GETPAGE: xtree page corrupt\n");	\
-			BT_PUTPAGE(MP);					\
-			MP = NULL;					\
-			RC = -EIO;					\
-		}							\
-	}								\
-} while (0)
-
 /* for consistency */
 #define XT_PUTPAGE(MP) BT_PUTPAGE(MP)
 
@@ -114,6 +94,45 @@ static int xtSplitPage(tid_t tid, struct inode *ip, struct xtsplit * split,
 static int xtSplitRoot(tid_t tid, struct inode *ip,
 		       struct xtsplit * split, struct metapage ** rmpp);
 
+/*
+ *	xt_getpage()
+ *
+ * function:	get the page buffer for a specified block address.
+ *
+ * parameters:
+ *	ip      - pointer to the inode
+ *	bn      - block number (s64) of the xtree page to be retrieved;
+ *	mp      - pointer to a metapage pointer where the page buffer is returned;
+ *	size    - size parameter to pass to BT_GETPAGE;
+ *      rc      - pointer to an integer to store the return code;
+ *
+ * returns:
+ *      A pointer to the xtree page (xtpage_t) on success. If an error occurs,
+ *      sets rc to -EIO, releases the page buffer, sets mp to NULL and returns NULL.
+ */
+
+static inline xtpage_t *xt_getpage(struct inode *ip, s64 bn, struct metapage **mp,
+				unsigned int size, int *rc)
+{
+	xtpage_t *p;
+
+	BT_GETPAGE(ip, bn, *mp, xtpage_t, size, p, *rc, i_xtroot);
+
+	if (!(*rc)) {
+		if ((le16_to_cpu(p->header.nextindex) < XTENTRYSTART) ||
+			(le16_to_cpu(p->header.nextindex) >
+				le16_to_cpu(p->header.maxentry)) ||
+			(le16_to_cpu(p->header.maxentry) >
+				((bn == 0) ? XTROOTMAXSLOT : PSIZE >> L2XTSLOTSIZE))) {
+			jfs_error(ip->i_sb, "xt_getpage: xtree page corrupt\n");
+			BT_PUTPAGE(*mp);
+			*mp = NULL;
+			*rc = -EIO;
+		}
+	}
+	return p;
+}
+
 /*
  *	xtLookup()
  *
@@ -252,7 +271,7 @@ static int xtSearch(struct inode *ip, s64 xoff,	s64 *nextp,
 	 */
 	for (bn = 0;;) {
 		/* get/pin the page to search */
-		XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
+		p = xt_getpage(ip, bn, &mp, PSIZE, &rc);
 		if (rc)
 			return rc;
 
@@ -807,7 +826,7 @@ xtSplitUp(tid_t tid,
 		 * insert router entry in parent for new right child page <rp>
 		 */
 		/* get/pin the parent page <sp> */
-		XT_GETPAGE(ip, parent->bn, smp, PSIZE, sp, rc);
+		sp = xt_getpage(ip, parent->bn, &smp, PSIZE, &rc);
 		if (rc) {
 			XT_PUTPAGE(rcmp);
 			return rc;
@@ -1062,7 +1081,7 @@ xtSplitPage(tid_t tid, struct inode *ip,
 	 * update previous pointer of old next/right page of <sp>
 	 */
 	if (nextbn != 0) {
-		XT_GETPAGE(ip, nextbn, mp, PSIZE, p, rc);
+		p = xt_getpage(ip, nextbn, &mp, PSIZE, &rc);
 		if (rc) {
 			XT_PUTPAGE(rmp);
 			goto clean_up;
@@ -1417,7 +1436,7 @@ int xtExtend(tid_t tid,		/* transaction id */
 			return rc;
 
 		/* get back old page */
-		XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
+		p = xt_getpage(ip, bn, &mp, PSIZE, &rc);
 		if (rc)
 			return rc;
 		/*
@@ -1433,7 +1452,7 @@ int xtExtend(tid_t tid,		/* transaction id */
 			XT_PUTPAGE(mp);
 
 			/* get new child page */
-			XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
+			p = xt_getpage(ip, bn, &mp, PSIZE, &rc);
 			if (rc)
 				return rc;
 
@@ -1711,7 +1730,7 @@ int xtUpdate(tid_t tid, struct inode *ip, xad_t * nxad)
 			return rc;
 
 		/* get back old page */
-		XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
+		p = xt_getpage(ip, bn, &mp, PSIZE, &rc);
 		if (rc)
 			return rc;
 		/*
@@ -1727,7 +1746,7 @@ int xtUpdate(tid_t tid, struct inode *ip, xad_t * nxad)
 			XT_PUTPAGE(mp);
 
 			/* get new child page */
-			XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
+			p = xt_getpage(ip, bn, &mp, PSIZE, &rc);
 			if (rc)
 				return rc;
 
@@ -1788,7 +1807,7 @@ int xtUpdate(tid_t tid, struct inode *ip, xad_t * nxad)
 		XT_PUTPAGE(mp);
 
 		/* get new right page */
-		XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
+		p = xt_getpage(ip, bn, &mp, PSIZE, &rc);
 		if (rc)
 			return rc;
 
@@ -1864,7 +1883,7 @@ printf("xtUpdate.updateLeft.split p:0x%p\n", p);
 			return rc;
 
 		/* get back old page */
-		XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
+		p = xt_getpage(ip, bn, &mp, PSIZE, &rc);
 		if (rc)
 			return rc;
 
@@ -1881,7 +1900,7 @@ printf("xtUpdate.updateLeft.split p:0x%p\n", p);
 			XT_PUTPAGE(mp);
 
 			/* get new child page */
-			XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
+			p = xt_getpage(ip, bn, &mp, PSIZE, &rc);
 			if (rc)
 				return rc;
 
@@ -2268,7 +2287,7 @@ s64 xtTruncate(tid_t tid, struct inode *ip, s64 newsize, int flag)
 	 * first access of each page:
 	 */
       getPage:
-	XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
+	p = xt_getpage(ip, bn, &mp, PSIZE, &rc);
 	if (rc)
 		return rc;
 
@@ -2506,7 +2525,7 @@ s64 xtTruncate(tid_t tid, struct inode *ip, s64 newsize, int flag)
 
 	/* get back the parent page */
 	bn = parent->bn;
-	XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
+	p = xt_getpage(ip, bn, &mp, PSIZE, &rc);
 	if (rc)
 		return rc;
 
@@ -2791,7 +2810,7 @@ s64 xtTruncate_pmap(tid_t tid, struct inode *ip, s64 committed_size)
 		 * first access of each page:
 		 */
       getPage:
-		XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
+		p = xt_getpage(ip, bn, &mp, PSIZE, &rc);
 		if (rc)
 			return rc;
 
@@ -2836,7 +2855,7 @@ s64 xtTruncate_pmap(tid_t tid, struct inode *ip, s64 committed_size)
 
 	/* get back the parent page */
 	bn = parent->bn;
-	XT_GETPAGE(ip, bn, mp, PSIZE, p, rc);
+	p = xt_getpage(ip, bn, &mp, PSIZE, &rc);
 	if (rc)
 		return rc;
 
-- 
2.49.0

