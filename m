Received: from mail-yb1-f228.google.com (mail-yb1-f228.google.com [209.85.219.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088CA28A1C4
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 16:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749229104; cv=none; b=SEJTuwA3D5aXNyE6zJj9VUaiEqNAdO+X2YpaqwTpDQdVpTJ5Q+DRe1IOePJqETh9j0E5MMhgTCVIjPmpectFxT1fSiOaXpmAdyqwpsaueHXq1BdDahuZLSL1Z4O/BTg4WFHQJ6uXMR96YhPZrHVnABSMQAKn+F5pqPnW5myFNuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749229104; c=relaxed/simple;
	bh=MngIcYiXP6HvUSC5VFe7pMwdihGLWpd5wKPDQNMg174=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Cs/Fyzi894uC1Jx/czcZTAQkjM0/0Q9z+a8jkL8Opdf/tfyC/z5ejXcW42MB1C9wvy2b9vBi210vo63AtydHspmKfX6/DuZN4Yr73KQ+LPoFlr8gIoOV5zqPGn3dlCqfSaIcAXzcKFmzMkAoE5+ES6v2nJ4wuyPT7TSf3gHrfXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=WuiprYSp; arc=none smtp.client-ip=209.85.219.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="WuiprYSp"
Received: by mail-yb1-f228.google.com with SMTP id 3f1490d57ef6-e7dc7245bcdso279168276.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 09:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1749229102; x=1749833902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=6GcLRRfuesWA0E+vmxrSkcl9ahXGVhzhcFxNoFBkwNY=;
        b=WuiprYSpPqz8TK+yGX4A3B9jNg45jGs4p0bWOubeRZ0d0iF8kOHa5F1gUsNKwNucAk
         FLy7mhU0XKKEEXmYMxBsjmPK4syryiepbtQiDKHW4uvRmScZoFbGKZPs3xpu1BtK/RSK
         T3LMzAFlA9PJ0WZ3p3fKRBI1XnmsqOrB3QiMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749229102; x=1749833902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6GcLRRfuesWA0E+vmxrSkcl9ahXGVhzhcFxNoFBkwNY=;
        b=noAmISUcezJOAc2G93hIwyx0IRocCvHEdxqLuq6RaEuyVjcIbjpg9fVTnMRlKW87x/
         m6OhWJVC+hEeHqKl7EtIFG50GXFiltQAVaTLSnpEYMZ5NMJm1HG75RDjThzmjgKuFO7x
         tzKFjBGAnHLMcP+noxvMvMyw0kW+RAU9m4C1QMK4WBwAk+loWxpwnPvRksX2230X3gLm
         DK5iddnSf7qNMEyg5ra8zrIzyOGmFWKUByGHHOQ/h1NFcEpBLAFCXQ0pXFL9CFD76VAl
         pSC6ULRu99QAKCCP5Hk0e2lesIfPDp/d3F+6WnxS1d2FbdpS0legigDF9hFMq4sv9n9u
         A7Fg==
X-Gm-Message-State: AOJu0YzRBl9ec14WFm725bQxi6xWoGIIluOC0gv2wgE3ifO6pGFDITHD
	e0jOhi14P0oyssjZ/mk20MOpQPWCe7XQoY37MOCWcH20mF2ekMUmhTbS49/kfsXf14SOazEU8UK
	GAS981ZQPPieeim6ebS9lwGioLQlt48LU7khnHsBn6Wr2dNzR2wAHM8OwMCRwsJltOqMXlT1DqS
	8RDmuf/Bry1+0QTZdSS3WIPtVz7ljnmuxAMOVZGP3dKysN+CsLSLfLSHzVYb15nk+3cSzeDWzjf
	qIamBczvMc=
X-Gm-Gg: ASbGncsthvUWF7xPvN6Y7YHqoI22jOXcEHPhwGI8yG4PrdlBliKRBpS/iLqOGBenK32
	6P0kst6+2UxVLDxulNBpQJZNd0nWe8nIVV7aDNABCNsQJUC0s1XNIFCu1gXud+qLaRjJMgrXiIi
	rl8lF3XIQ6XPfD9jY8htPxhDtpwp7H8/rvGfiuk6/Rc+/3vtNa4qoknHM9ikAbsm5yXjAticuOo
	alOXupG0aKEKHr4LQ0Cy8Kfxv2DFpKw47ePS3a9YrUqEctZ6VFNV5s0Om5HSv9IjMpSRSAjNBqM
	e1RCuQWVkbKAeEGAC+hJL01KkLKDWUv7mT7hvBxjK8xAEKsn7LiPtG6M9WywcLfabLjs+H9a
X-Google-Smtp-Source: AGHT+IE4csKqUW2xqcAMljZpXppjshLODmsfBBcw73uSFQY2Nq15v84MAYa5IztjLQctwSQBfK5m+yep/T+D
X-Received: by 2002:a05:6902:1883:b0:e7d:c8b9:3191 with SMTP id 3f1490d57ef6-e81a97cc997mr1683264276.7.1749229101422;
        Fri, 06 Jun 2025 09:58:21 -0700 (PDT)
Received: from bcacpedev-irv-2.lvn.broadcom.net ([192.19.161.250])
        by smtp-relay.gmail.com with ESMTPS id 3f1490d57ef6-e81a41592fasm120273276.23.2025.06.06.09.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 09:58:21 -0700 (PDT)
X-Relaying-Domain: broadcom.com
From: David Regan <dregan@broadcom.com>
To: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	william.zhang@broadcom.com,
	anand.gore@broadcom.com,
	florian.fainelli@broadcom.com,
	kamal.dasu@broadcom.com,
	dan.beygelman@broadcom.com,
	=?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@bootlin.com>,
	=?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>,
	rafal@milecki.pl,
	computersforpeace@gmail.com,
	frieder.schrempf@kontron.de,
	vigneshr@ti.com,
	richard@nod.at,
	bbrezillon@kernel.org,
	kdasu.kdev@gmail.com,
	jaimeliao.tw@gmail.com,
	kilobyte@angband.pl,
	jonas.gorski@gmail.com,
	dgcbueu@gmail.com,
	dregan@broadcom.com,
	dregan@mail.com
Subject: [PATCH v2] mtd: nand: brcmnand: fix mtd corrected bits stat
Date: Fri,  6 Jun 2025 09:57:03 -0700
Message-ID: <20250606165756.1531164-1-dregan@broadcom.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently we attempt to get the amount of flipped bits from a hardware
location which is reset on every subpage. Instead obtain total flipped
bits stat from hardware accumulator. In addition identify the correct
maximum subpage corrected bits.

Signed-off-by: David Regan <dregan@broadcom.com>
Reviewed-by: William Zhang <william.zhang@broadcom.com>
---
 v2: Add >= v4 NAND controller support as requested by Jonas.
     mtd->ecc_stats.corrected accumulates instead of set to total.
     Remove DMA specific flipped bits count.
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 50 ++++++++++++++++++------
 1 file changed, 39 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 62bdda3be92f..c3ed3dcf0871 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -359,6 +359,7 @@ enum brcmnand_reg {
 	BRCMNAND_CORR_THRESHOLD_EXT,
 	BRCMNAND_UNCORR_COUNT,
 	BRCMNAND_CORR_COUNT,
+	BRCMNAND_READ_ERROR_COUNT,
 	BRCMNAND_CORR_EXT_ADDR,
 	BRCMNAND_CORR_ADDR,
 	BRCMNAND_UNCORR_EXT_ADDR,
@@ -389,6 +390,7 @@ static const u16 brcmnand_regs_v21[] = {
 	[BRCMNAND_CORR_THRESHOLD_EXT]	=     0,
 	[BRCMNAND_UNCORR_COUNT]		=     0,
 	[BRCMNAND_CORR_COUNT]		=     0,
+	[BRCMNAND_READ_ERROR_COUNT]	=     0,
 	[BRCMNAND_CORR_EXT_ADDR]	=  0x60,
 	[BRCMNAND_CORR_ADDR]		=  0x64,
 	[BRCMNAND_UNCORR_EXT_ADDR]	=  0x68,
@@ -419,6 +421,7 @@ static const u16 brcmnand_regs_v33[] = {
 	[BRCMNAND_CORR_THRESHOLD_EXT]	=     0,
 	[BRCMNAND_UNCORR_COUNT]		=     0,
 	[BRCMNAND_CORR_COUNT]		=     0,
+	[BRCMNAND_READ_ERROR_COUNT]	=  0x80,
 	[BRCMNAND_CORR_EXT_ADDR]	=  0x70,
 	[BRCMNAND_CORR_ADDR]		=  0x74,
 	[BRCMNAND_UNCORR_EXT_ADDR]	=  0x78,
@@ -449,6 +452,7 @@ static const u16 brcmnand_regs_v50[] = {
 	[BRCMNAND_CORR_THRESHOLD_EXT]	=     0,
 	[BRCMNAND_UNCORR_COUNT]		=     0,
 	[BRCMNAND_CORR_COUNT]		=     0,
+	[BRCMNAND_READ_ERROR_COUNT]	=  0x80,
 	[BRCMNAND_CORR_EXT_ADDR]	=  0x70,
 	[BRCMNAND_CORR_ADDR]		=  0x74,
 	[BRCMNAND_UNCORR_EXT_ADDR]	=  0x78,
@@ -479,6 +483,7 @@ static const u16 brcmnand_regs_v60[] = {
 	[BRCMNAND_CORR_THRESHOLD_EXT]	=  0xc4,
 	[BRCMNAND_UNCORR_COUNT]		=  0xfc,
 	[BRCMNAND_CORR_COUNT]		= 0x100,
+	[BRCMNAND_READ_ERROR_COUNT]	= 0x104,
 	[BRCMNAND_CORR_EXT_ADDR]	= 0x10c,
 	[BRCMNAND_CORR_ADDR]		= 0x110,
 	[BRCMNAND_UNCORR_EXT_ADDR]	= 0x114,
@@ -509,6 +514,7 @@ static const u16 brcmnand_regs_v71[] = {
 	[BRCMNAND_CORR_THRESHOLD_EXT]	=  0xe0,
 	[BRCMNAND_UNCORR_COUNT]		=  0xfc,
 	[BRCMNAND_CORR_COUNT]		= 0x100,
+	[BRCMNAND_READ_ERROR_COUNT]	= 0x104,
 	[BRCMNAND_CORR_EXT_ADDR]	= 0x10c,
 	[BRCMNAND_CORR_ADDR]		= 0x110,
 	[BRCMNAND_UNCORR_EXT_ADDR]	= 0x114,
@@ -539,6 +545,7 @@ static const u16 brcmnand_regs_v72[] = {
 	[BRCMNAND_CORR_THRESHOLD_EXT]	=  0xe0,
 	[BRCMNAND_UNCORR_COUNT]		=  0xfc,
 	[BRCMNAND_CORR_COUNT]		= 0x100,
+	[BRCMNAND_READ_ERROR_COUNT]	= 0x104,
 	[BRCMNAND_CORR_EXT_ADDR]	= 0x10c,
 	[BRCMNAND_CORR_ADDR]		= 0x110,
 	[BRCMNAND_UNCORR_EXT_ADDR]	= 0x114,
@@ -966,6 +973,13 @@ static inline u32 brcmnand_count_corrected(struct brcmnand_controller *ctrl)
 	return brcmnand_read_reg(ctrl, BRCMNAND_CORR_COUNT);
 }
 
+static inline u32 brcmnand_corr_total(struct brcmnand_controller *ctrl)
+{
+	if (ctrl->nand_version < 0x400)
+		return 0;
+	return brcmnand_read_reg(ctrl, BRCMNAND_READ_ERROR_COUNT);
+}
+
 static void brcmnand_wr_corr_thresh(struct brcmnand_host *host, u8 val)
 {
 	struct brcmnand_controller *ctrl = host->ctrl;
@@ -2066,12 +2080,15 @@ static int brcmnand_dma_trans(struct brcmnand_host *host, u64 addr, u32 *buf,
  */
 static int brcmnand_read_by_pio(struct mtd_info *mtd, struct nand_chip *chip,
 				u64 addr, unsigned int trans, u32 *buf,
-				u8 *oob, u64 *err_addr)
+				u8 *oob, u64 *err_addr, unsigned int *corr)
 {
 	struct brcmnand_host *host = nand_get_controller_data(chip);
 	struct brcmnand_controller *ctrl = host->ctrl;
 	int i, ret = 0;
 
+	if (corr)
+		*corr = 0;
+
 	brcmnand_clear_ecc_addr(ctrl);
 
 	for (i = 0; i < trans; i++, addr += FC_BYTES) {
@@ -2099,13 +2116,16 @@ static int brcmnand_read_by_pio(struct mtd_info *mtd, struct nand_chip *chip,
 
 			if (*err_addr)
 				ret = -EBADMSG;
-		}
+			else {
+				*err_addr = brcmnand_get_correcc_addr(ctrl);
 
-		if (!ret) {
-			*err_addr = brcmnand_get_correcc_addr(ctrl);
+				if (*err_addr) {
+					ret = -EUCLEAN;
 
-			if (*err_addr)
-				ret = -EUCLEAN;
+					if (corr && brcmnand_count_corrected(ctrl) > *corr)
+						*corr = brcmnand_count_corrected(ctrl);
+				}
+			}
 		}
 	}
 
@@ -2173,6 +2193,8 @@ static int brcmnand_read(struct mtd_info *mtd, struct nand_chip *chip,
 	int err;
 	bool retry = true;
 	bool edu_err = false;
+	unsigned int corrected = 0; /* max corrected bits per subpage */
+	unsigned int prev_tot = brcmnand_corr_total(ctrl);
 
 	dev_dbg(ctrl->dev, "read %llx -> %p\n", (unsigned long long)addr, buf);
 
@@ -2200,9 +2222,11 @@ static int brcmnand_read(struct mtd_info *mtd, struct nand_chip *chip,
 			memset(oob, 0x99, mtd->oobsize);
 
 		err = brcmnand_read_by_pio(mtd, chip, addr, trans, buf,
-					       oob, &err_addr);
+					   oob, &err_addr, &corrected);
 	}
 
+	mtd->ecc_stats.corrected += brcmnand_corr_total(ctrl) - prev_tot;
+
 	if (mtd_is_eccerr(err)) {
 		/*
 		 * On controller version and 7.0, 7.1 , DMA read after a
@@ -2240,16 +2264,20 @@ static int brcmnand_read(struct mtd_info *mtd, struct nand_chip *chip,
 	}
 
 	if (mtd_is_bitflip(err)) {
-		unsigned int corrected = brcmnand_count_corrected(ctrl);
-
 		/* in case of EDU correctable error we read again using PIO */
 		if (edu_err)
 			err = brcmnand_read_by_pio(mtd, chip, addr, trans, buf,
-						   oob, &err_addr);
+						   oob, &err_addr, &corrected);
 
 		dev_dbg(ctrl->dev, "corrected error at 0x%llx\n",
 			(unsigned long long)err_addr);
-		mtd->ecc_stats.corrected += corrected;
+		/*
+		 * if flipped bits accumulator is not supported but we detected
+		 * a correction, increase stat by 1 to match previous behavior.
+		 */
+		if (brcmnand_corr_total(ctrl) == prev_tot)
+			mtd->ecc_stats.corrected++;
+
 		/* Always exceed the software-imposed threshold */
 		return max(mtd->bitflip_threshold, corrected);
 	}
-- 
2.43.5

