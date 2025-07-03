Received: from mail-io1-f97.google.com (mail-io1-f97.google.com [209.85.166.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E634D2581
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 02:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751510854; cv=none; b=Uu+/yWNC197byuLelgiR+pWZub7C/YV2tMZnmymCceJwyltj4lrYlRjilZnn51JxSz5hccBhjNiMRBJwwU/BYIyGopAkXhmblh9CxU8s7VpyVA3wBbkhTJKmQfhSCv99DwaCnil2iEn3/clApBt4s9cieDipVk5rAxt9nrEYFaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751510854; c=relaxed/simple;
	bh=idAAIFhpNAXl8jGV7eAgykkJwpo/2c7nHUEepJlkEfE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=q1F2CibMVrLook2xs5igWiVzCNgsYDoJmwEEs1By/8eAz0ZiPJn7CiyWpqKxMBaXTsGojDeNWPv77Q57L4hCgrWpYnVi1rqolQnULE+DTCj28kz4hTXz5uZ+VIKt+mYUUjj/22nGxOmDiWngnTcUaiqM/AE23gBW6QWoUJbnF5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=byIGwiaw; arc=none smtp.client-ip=209.85.166.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="byIGwiaw"
Received: by mail-io1-f97.google.com with SMTP id ca18e2360f4ac-87623971f44so13145739f.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 19:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1751510852; x=1752115652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=PhJFHcg87sU/DVyKPZbOZkGlSVURcDhV3sOi2cvPycY=;
        b=byIGwiawKSNOB7Sj4SLU4iNnD1fQdlUljdgrJ124y1JvsnQ1kT0gABr48iYt9kmkCe
         QZ0K28CcbVaZNIuT8dJ8mmIu/rT/6CaFlqUmEz4kaWjXh//sIBT6q3VuuIyT6TlKf0+1
         32JfbzS7o89nS0wWcYWbTa9dPO/9vuq3HZACw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751510852; x=1752115652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PhJFHcg87sU/DVyKPZbOZkGlSVURcDhV3sOi2cvPycY=;
        b=i+5Ek0XMcP2flGHrO+9xXl7kCkPJggJiyRzQMp8/iIVph8Rfc83/tJlheKJIBxvu9e
         B6tVh3L55dpr3oT/R06W85yBV4S4Qnv5pVx1jH2NCWusQiaCvlvvY/0AtXuOMnARoV+J
         kpgtn8RdM1jTox51xV3yYkk3A3/wdWFHM1G5oOu8mGP2j49FU8WKwTiI10mn5zaEJIk/
         zKkuHnvNXkicR/ZS7Ri7CUK+RynOggxkr57apDxpWPwY5ImQZLJwpqnSa/Aokw/m3Pe4
         Sjf9IJ5LCigkjys2OR3B3NZAAWBa3bPDjKtro/WzhDZdeN+/pd1YS4bkyBHDrj7ZprEg
         l7+w==
X-Gm-Message-State: AOJu0Yy8RaKjTg0OSFg9W8SvUsU8/uyxHsUYXl2ypOrcPrF7zuoSsULM
	Ch5VhF5I18+4DeUg3TCgloLB7wx+ltHa8rCjOjdpOZ6jEtkXxdA2KSetY/JenCmTT0ZWGFTemrU
	YePPyyHJmdv4aQ/lCDu1/hkC4OqVolkSP4b2WzAWdC5EOwXllWs4e28HjchY5XkTOe6OUh+6xJR
	ezapD8L9OZUlp88VK/gfITcd8uNfN7GBtMhxABDbMXcCS0hU3JZum3bxaBd/m1jjNHaQbPwSL+m
	PWvMLHNnCo=
X-Gm-Gg: ASbGncuC/SMk0iWPFRvfjjME/Yjb36KaGQG6qK+REuFulycgRvqGmLIJG209zOyijuR
	OaAfMTwD2puEvehhuoZziS14+m9o01Sqkoooh1akHFWX6CkXyN0FdWT0q+tagwz3RQTDS4jYcM9
	DGCmaCcmq+h2gAenxnIFlxzxMcTs2BPtGEql0jUDrHTPZ5Nv1ZKYHs+YD9XpZcQBvkdFciGUjOI
	/9OcoPzIZpfHDTUaXk3bKx51cO/VRqpfgPkIBUuEV47mhtqGktuBue9p1Vn+zuwcWHOkF96sgee
	S7awJGJ2NTa9mil14Mq5keB+mI3dGpLZk5tKzVjwW78zp5dau+k0K0ednEtzTr0bHOvMJ6PJ
X-Google-Smtp-Source: AGHT+IHBZ5fRo7G1atIG2AuPc0KGWP4Pxe1ggQWyDHR0SAuva5sBRHfROcvhtC+7ef6kHhcljVviYf+CWAxy
X-Received: by 2002:a05:6602:13d0:b0:873:13c6:f37b with SMTP id ca18e2360f4ac-876d5125164mr16717339f.3.1751510851736;
        Wed, 02 Jul 2025 19:47:31 -0700 (PDT)
Received: from bcacpedev-irv-2.lvn.broadcom.net ([192.19.161.250])
        by smtp-relay.gmail.com with ESMTPS id ca18e2360f4ac-87687b2283asm53992439f.24.2025.07.02.19.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 19:47:31 -0700 (PDT)
X-Relaying-Domain: broadcom.com
From: david regan <dregan@broadcom.com>
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
Subject: [PATCH v3] mtd: nand: brcmnand: fix mtd corrected bits stat
Date: Wed,  2 Jul 2025 19:47:05 -0700
Message-ID: <20250703024719.2256470-1-dregan@broadcom.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: David Regan <dregan@broadcom.com>

Currently we attempt to get the amount of flipped bits from a hardware
location which is reset on every subpage. Instead obtain total flipped
bits stat from hardware accumulator. In addition identify the correct
maximum subpage corrected bits.

Signed-off-by: David Regan <dregan@broadcom.com>
---
 v3: Use brcmnand_corr_total to obtain maximum subpage flipped
     bits for further backwards compatibility.

 v2: Add >= v4 NAND controller support as requested by Jonas.
     mtd->ecc_stats.corrected accumulates instead of set to total.
     Remove DMA specific flipped bits count.

---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 53 +++++++++++++++++-------
 1 file changed, 38 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 62bdda3be92f..b13f5f8f0eec 100644
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
@@ -959,11 +966,11 @@ static inline u16 brcmnand_cs_offset(struct brcmnand_controller *ctrl, int cs,
 	return offs_cs0 + cs * ctrl->reg_spacing + cs_offs;
 }
 
-static inline u32 brcmnand_count_corrected(struct brcmnand_controller *ctrl)
+static inline u32 brcmnand_corr_total(struct brcmnand_controller *ctrl)
 {
-	if (ctrl->nand_version < 0x0600)
-		return 1;
-	return brcmnand_read_reg(ctrl, BRCMNAND_CORR_COUNT);
+	if (ctrl->nand_version < 0x400)
+		return 0;
+	return brcmnand_read_reg(ctrl, BRCMNAND_READ_ERROR_COUNT);
 }
 
 static void brcmnand_wr_corr_thresh(struct brcmnand_host *host, u8 val)
@@ -2066,15 +2073,20 @@ static int brcmnand_dma_trans(struct brcmnand_host *host, u64 addr, u32 *buf,
  */
 static int brcmnand_read_by_pio(struct mtd_info *mtd, struct nand_chip *chip,
 				u64 addr, unsigned int trans, u32 *buf,
-				u8 *oob, u64 *err_addr)
+				u8 *oob, u64 *err_addr, unsigned int *corr)
 {
 	struct brcmnand_host *host = nand_get_controller_data(chip);
 	struct brcmnand_controller *ctrl = host->ctrl;
 	int i, ret = 0;
+	unsigned int prev_corr;
+
+	if (corr)
+		*corr = 0;
 
 	brcmnand_clear_ecc_addr(ctrl);
 
 	for (i = 0; i < trans; i++, addr += FC_BYTES) {
+		prev_corr = brcmnand_corr_total(ctrl);
 		brcmnand_set_cmd_addr(mtd, addr);
 		/* SPARE_AREA_READ does not use ECC, so just use PAGE_READ */
 		brcmnand_send_cmd(host, CMD_PAGE_READ);
@@ -2099,13 +2111,16 @@ static int brcmnand_read_by_pio(struct mtd_info *mtd, struct nand_chip *chip,
 
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
+					if (corr && (brcmnand_corr_total(ctrl) - prev_corr) > *corr)
+						*corr = brcmnand_corr_total(ctrl) - prev_corr;
+				}
+			}
 		}
 	}
 
@@ -2173,6 +2188,8 @@ static int brcmnand_read(struct mtd_info *mtd, struct nand_chip *chip,
 	int err;
 	bool retry = true;
 	bool edu_err = false;
+	unsigned int corrected = 0; /* max corrected bits per subpage */
+	unsigned int prev_tot = brcmnand_corr_total(ctrl);
 
 	dev_dbg(ctrl->dev, "read %llx -> %p\n", (unsigned long long)addr, buf);
 
@@ -2200,9 +2217,11 @@ static int brcmnand_read(struct mtd_info *mtd, struct nand_chip *chip,
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
@@ -2240,16 +2259,20 @@ static int brcmnand_read(struct mtd_info *mtd, struct nand_chip *chip,
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

