Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD86E81E
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 19:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746558951; cv=none; b=Qzj1n6UZrxF5wIQmfxR2YnNDW+hH7wFBVOfLcogsdl1I+rIwqaNsG12qVmB3llNvIJObsAaO//930p2RwplzHD0kAC8FKvYWKolMt3jLyAFq+DVV6ifOW6iFMz4J+H3+c4R+4ZjuRKodRM8ICIEWfuLessOSkt0w1qQDOB0abvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746558951; c=relaxed/simple;
	bh=Z1yJoGEhUIwQUXueo6n/ha+JgB9QzMeGmPIixD+GFao=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jhVTmafvfRSiyQu2tvbT6Ra+qiugdRqWi4wQ/IfpFUlyLyeZZpqQ1uoqH5Kui8fF2rOblv63vuueKWv/D11ET4y1EWqUbRWwAes5WwN4oxspcSTS/ZElSd5Zc6pkM4a2RrJCdUWJxsWGP4wV9YOPYQgHFy/q141V7tkHtRFA4/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jakerice.dev; spf=pass smtp.mailfrom=jakerice.dev; dkim=pass (2048-bit key) header.d=jakerice-dev.20230601.gappssmtp.com header.i=@jakerice-dev.20230601.gappssmtp.com header.b=hsbj9FJo; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jakerice.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jakerice.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jakerice-dev.20230601.gappssmtp.com header.i=@jakerice-dev.20230601.gappssmtp.com header.b="hsbj9FJo"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c56a3def84so620672685a.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 12:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jakerice-dev.20230601.gappssmtp.com; s=20230601; t=1746558947; x=1747163747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7taY46IGc0mDFv9NltJivBJOSYvv+pAntv3/xJ8NA4w=;
        b=hsbj9FJolBf0N7EoSVgjVYzWpY4ocX/SgmQ4osP6NyejcAPVdRUBlbbNbz+bqtil+C
         BkiBA45iSwZyS1aP0p5cQF9BFLeFgZd7NidQfO5SfaLSK+kjcKRo/HQmXa6EKN16awDh
         n4OlAvRajaLwDoPLxIkNidtKhjU5Q1CkNpdhfsykdvptzi5UQIc4fQaIQixSsCS0cEEB
         POCmmzTxW2QqbVsNPYfwjv/GvNaIUJX2VIyqO9x2ke3xdhhM5mSDl7saevYGpaUBUs7O
         +Jye0cW61vDSFnTmhD/Evgvn/y+rVUcbbt8cpZy3nDPw8jhsCItaCQMlYMcnGloNop6h
         giaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746558947; x=1747163747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7taY46IGc0mDFv9NltJivBJOSYvv+pAntv3/xJ8NA4w=;
        b=vIzrwwx97yGoj/K9+/ab98nS1LJoOCBSSjLfmU1OMUIM0ZKlLLUW5M8DHXoEORUodo
         h8Wumj9fv+iDz3LyxN9ft3VC5hCuWCAHGXMyrrx9UEiziXKC2kxKsoCjPPVuko0R1dh1
         08rdXlanosaanDS+rywBc3Hv8qEcZ6Yj/8P8Wv3hiVSzfmtP1rP+IjudFhjuIPVq/bcr
         IBXMTKzjkYXbZ7w7cP8MRJ4WryW4PAac3HrIDfbJYayZqWP7nhxMqmGN/JifUAu8Dley
         CyKGQQa+FHkuJKcGb+Ffv/aMQZHpDNyAQ+yNOi67P0gXjs/bAqE0cg3GlrTblBlk3pPt
         ihQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNzC06eRFnof+PKKHHPzd+ie2Tme2OOysChVnVIBs3XBiaEWWSwQM6ygu+GDk6/aEs1+7flv8qmBUa9mI=@vger.kernel.org
X-Gm-Message-State: AOJu0YynT7ScWF4dJdNIpe9MWSPfJPOi9VkztQjkoJsWqyBUW/fYggoP
	zST5m/1ccpYXd6vmKVjCPYRneXoJ7lBRsFccnyxzx83DIsTh2el7eGkc/NMomCU=
X-Gm-Gg: ASbGncs4FeRYh203YPC09UtM4sOklJcEKk2qsrLrV+sp+YqTQy1GxNtIjdqt8Jr4LLE
	OeRToylmRXVL1eaMx4fqUvH/K8QQxmP9yvrdmpzcKpPuV+3+lz3VO2Pa5CXbsSLReIj9bMfpJNf
	LO5/aL5Sw/FiuIXEq8APmSdOoxcxay7xZXzkEC+SJBbJzAT+4EPSC4lMyDLHPplp0FtkE8thmRb
	gkRjX+8Myxzf4isVV8ZSXNlbXWrtQawih7Y4F0XJl4G2hdreRpd7VR6FkG0lOJ9gnDHLBcIQSuy
	FM/b12VwMw8kUwlIGPtGB5Ugk7v/lRcFcUm0BBVmtwQatalBSWPzNKjnaArD+w7ez0zKczwGw3V
	NkjtH5B5Dpg==
X-Google-Smtp-Source: AGHT+IHmeX/Vp3tBioEkx0O70r0EXrgFloiq02wtUU/AX3bPTNj6+4Vwqu5TkuE0j0bZmzdtFAOang==
X-Received: by 2002:a05:620a:40c7:b0:7c5:af73:4f72 with SMTP id af79cd13be357-7caf74020bbmr76661085a.42.1746558943029;
        Tue, 06 May 2025 12:15:43 -0700 (PDT)
Received: from localhost (c-67-162-238-230.hsd1.md.comcast.net. [67.162.238.230])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7caf75b884csm14778485a.86.2025.05.06.12.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 12:15:42 -0700 (PDT)
From: Jake Rice <jake@jakerice.dev>
To: linux-usb@vger.kernel.org
Cc: stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org,
	usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org,
	Jake Rice <jake@jakerice.dev>
Subject: [RFC PATCH] usb: storage: Add blockbuffer ptr to info struct of sddr09 driver
Date: Tue,  6 May 2025 15:15:31 -0400
Message-Id: <20250506191531.3326-1-jake@jakerice.dev>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This patch updates the sddr09 driver to allocate a reusable block
buffer. Unfortunately, I don't have access to the SDDR-00 hardware
(which I know is pretty ancient), so I'm requesting testing from anyone who does. 
Please let me now if the patch causes any issues or improves performance.

Best,
Jake

---
Currently, upon every write the block buffer is allocated and freed which is
computationally expensive. With this implementation, a buffer pointer
is added as a member to the info struct and allocated when the card
information is read. The buffer is freed during desconstruction if
necessary.

Signed-off-by: Jake Rice <jake@jakerice.dev>
---
 drivers/usb/storage/sddr09.c | 60 +++++++++++++++++++-----------------
 1 file changed, 31 insertions(+), 29 deletions(-)

diff --git a/drivers/usb/storage/sddr09.c b/drivers/usb/storage/sddr09.c
index e66b920e99e2..1d75b1a88c17 100644
--- a/drivers/usb/storage/sddr09.c
+++ b/drivers/usb/storage/sddr09.c
@@ -255,6 +255,7 @@ struct sddr09_card_info {
 	int		*pba_to_lba;	/* physical to logical map */
 	int		lbact;		/* number of available pages */
 	int		flags;
+	unsigned char   *blockbuffer;
 #define	SDDR09_WP	1		/* write protected */
 };
 
@@ -850,7 +851,7 @@ sddr09_find_unused_pba(struct sddr09_card_info *info, unsigned int lba) {
 static int
 sddr09_write_lba(struct us_data *us, unsigned int lba,
 		 unsigned int page, unsigned int pages,
-		 unsigned char *ptr, unsigned char *blockbuffer) {
+		 unsigned char *ptr) {
 
 	struct sddr09_card_info *info = (struct sddr09_card_info *) us->extra;
 	unsigned long address;
@@ -890,13 +891,13 @@ sddr09_write_lba(struct us_data *us, unsigned int lba,
 	/* read old contents */
 	address = (pba << (info->pageshift + info->blockshift));
 	result = sddr09_read22(us, address>>1, info->blocksize,
-			       info->pageshift, blockbuffer, 0);
+			       info->pageshift, info->blockbuffer, 0);
 	if (result)
 		return result;
 
 	/* check old contents and fill lba */
 	for (i = 0; i < info->blocksize; i++) {
-		bptr = blockbuffer + i*pagelen;
+		bptr = info->blockbuffer + i*pagelen;
 		cptr = bptr + info->pagesize;
 		nand_compute_ecc(bptr, ecc);
 		if (!nand_compare_ecc(cptr+13, ecc)) {
@@ -917,7 +918,7 @@ sddr09_write_lba(struct us_data *us, unsigned int lba,
 	/* copy in new stuff and compute ECC */
 	xptr = ptr;
 	for (i = page; i < page+pages; i++) {
-		bptr = blockbuffer + i*pagelen;
+		bptr = info->blockbuffer + i*pagelen;
 		cptr = bptr + info->pagesize;
 		memcpy(bptr, xptr, info->pagesize);
 		xptr += info->pagesize;
@@ -930,7 +931,7 @@ sddr09_write_lba(struct us_data *us, unsigned int lba,
 	usb_stor_dbg(us, "Rewrite PBA %d (LBA %d)\n", pba, lba);
 
 	result = sddr09_write_inplace(us, address>>1, info->blocksize,
-				      info->pageshift, blockbuffer, 0);
+				      info->pageshift, info->blockbuffer, 0);
 
 	usb_stor_dbg(us, "sddr09_write_inplace returns %d\n", result);
 
@@ -961,8 +962,6 @@ sddr09_write_data(struct us_data *us,
 
 	struct sddr09_card_info *info = (struct sddr09_card_info *) us->extra;
 	unsigned int lba, maxlba, page, pages;
-	unsigned int pagelen, blocklen;
-	unsigned char *blockbuffer;
 	unsigned char *buffer;
 	unsigned int len, offset;
 	struct scatterlist *sg;
@@ -975,21 +974,6 @@ sddr09_write_data(struct us_data *us,
 	if (lba >= maxlba)
 		return -EIO;
 
-	/*
-	 * blockbuffer is used for reading in the old data, overwriting
-	 * with the new data, and performing ECC calculations
-	 */
-
-	/*
-	 * TODO: instead of doing kmalloc/kfree for each write,
-	 * add a bufferpointer to the info structure
-	 */
-
-	pagelen = (1 << info->pageshift) + (1 << CONTROL_SHIFT);
-	blocklen = (pagelen << info->blockshift);
-	blockbuffer = kmalloc(blocklen, GFP_NOIO);
-	if (!blockbuffer)
-		return -ENOMEM;
 
 	/*
 	 * Since we don't write the user data directly to the device,
@@ -999,10 +983,8 @@ sddr09_write_data(struct us_data *us,
 
 	len = min_t(unsigned int, sectors, info->blocksize) * info->pagesize;
 	buffer = kmalloc(len, GFP_NOIO);
-	if (!buffer) {
-		kfree(blockbuffer);
+	if (!buffer)
 		return -ENOMEM;
-	}
 
 	result = 0;
 	offset = 0;
@@ -1028,7 +1010,7 @@ sddr09_write_data(struct us_data *us,
 				&sg, &offset, FROM_XFER_BUF);
 
 		result = sddr09_write_lba(us, lba, page, pages,
-				buffer, blockbuffer);
+				buffer);
 		if (result)
 			break;
 
@@ -1037,9 +1019,6 @@ sddr09_write_data(struct us_data *us,
 		sectors -= pages;
 	}
 
-	kfree(buffer);
-	kfree(blockbuffer);
-
 	return result;
 }
 
@@ -1405,6 +1384,7 @@ sddr09_card_info_destructor(void *extra) {
 
 	kfree(info->lba_to_pba);
 	kfree(info->pba_to_lba);
+	kfree(info->blockbuffer);
 }
 
 static int
@@ -1585,6 +1565,8 @@ static int sddr09_transport(struct scsi_cmnd *srb, struct us_data *us)
 
 	if (srb->cmnd[0] == READ_CAPACITY) {
 		const struct nand_flash_dev *cardinfo;
+		unsigned int pagelen;
+		unsigned int blocklen;
 
 		sddr09_get_wp(us, info);	/* read WP bit */
 
@@ -1603,6 +1585,26 @@ static int sddr09_transport(struct scsi_cmnd *srb, struct us_data *us)
 		info->blockshift = cardinfo->blockshift;
 		info->blocksize = (1 << info->blockshift);
 		info->blockmask = info->blocksize - 1;
+		
+		pagelen = (1 << info->pageshift) + (1 << CONTROL_SHIFT);
+		blocklen = (pagelen << info->blockshift);
+
+		/*
+		 * If it has already been allocated and is changed 
+		 * (i.e. a new card is inserted), we want to free
+		 * it and reallocate it with the updates size
+		 */
+
+		kfree(info->blockbuffer);
+
+		/*
+		 * blockbuffer is used for reading in the old data, overwriting
+		 * with the new data, and performing ECC calculations
+		 */
+
+		info->blockbuffer = kmalloc(blocklen, GFP_NOIO);
+		if (!info->blockbuffer)
+			return -ENOMEM;
 
 		// map initialization, must follow get_cardinfo()
 		if (sddr09_read_map(us)) {
-- 
2.34.1

