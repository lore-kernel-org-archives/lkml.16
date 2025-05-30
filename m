Received: from mail-yw1-f226.google.com (mail-yw1-f226.google.com [209.85.128.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD56A7080C
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 03:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748576889; cv=none; b=tb5Ltdys7XcfsiydemTCHisEzTMzWym4dZFs5G6y628WNHpkWRIZS8q72qeYtl6QqG6AqTC/s5//TlUU4Wtov1SJvzAxHk2ogUb4658ne0hfDY9BPuda+CY78deN+Hh05OdNox+QY0RstKJTAcDqpbQWZB0BvtXGfdJpU/AcSqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748576889; c=relaxed/simple;
	bh=SQzQk5+A+iQDcMZJ61idabZHiNePjEUYhRa2LjuRrfo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=nrjp/zUv5Urs5mFmsDWbyO76z7J7q1aHA/Yjs6n1cpTqAsq5DNe8NqVhOE9CBD5HJ4+cWttr0VZosOlXH4hqtwfxCxOqaRokD0N0HbDfLSLLQjfZ19EzSPtyv29Js+qxE36wHIlsrnVXIzLvxHDm6GSdDMBXHMsGJxKoJkfoeAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=PfV7qeAH; arc=none smtp.client-ip=209.85.128.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="PfV7qeAH"
Received: by mail-yw1-f226.google.com with SMTP id 00721157ae682-70e2a7a2ce6so1143707b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 20:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1748576886; x=1749181686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=TlMFeDmViObsRmCRsBGfnvTFsQkhpyrM25hcpRVgu8E=;
        b=PfV7qeAHDjn8MmsI3/InX5fo943Dl6vQf4EzAFhyYJdRl7m/jwZDlBC555ZKGwukLA
         9NF7is6PNZEYrxVQEUX6o/9OU3loNstqZnCESXbaEgqpQYvNh7SIMQRGDO/K2QYahEOb
         RkLshVbb/5MxiqqcGPTa0fdO/27ebWvr+KcEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748576886; x=1749181686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TlMFeDmViObsRmCRsBGfnvTFsQkhpyrM25hcpRVgu8E=;
        b=R9WCk4RWIr7uj1jnVMLgQ25U33q7GyxFT1zlsfNm2O8GEYu7C5UKRpeC5pFADJzVfF
         Ly66zDvzWV5FhlXSJc2j3yNdZKzMXJOaxA5i41+B1neqaz23/OGNCAQE2gjE7JxkbEtY
         YEEeR8acuciaJ59J+WKsb6CTX0QUEXenr0wOzncWmaceZDxsdm/Zh4aIPaWPimlmUTnH
         rnV0LgPzticrlS8BQfIGYlEQUJxmc4aYDw1ZnwC/6bwaWRsdU6muuhTPqq5aIKD1+C0Y
         w03Ry3/r3VvnLLLdDw6tbvO2SK00nvsVSUNLQW2q+ucID4lwIkoYpYfSdtQBAYHsIK4D
         kaqA==
X-Gm-Message-State: AOJu0YwvRqAgODgdlxxXI0dcGFRUl1VRrE9pshp9TDSEkm9meZpEyo1e
	YqxlcoYYF3VX84K39d6T52okk6etQiDy9BME5qaldWBeWpj+vMogTwcY46zjGRYErYBW7WJeVhi
	ZQyyqAPGgh3bA0mF+1xakt6ktqHSYWVLLgMODWjW5qg8CxrYP3o6eqzGApcJRTQ4j/lSOrrN0GI
	sIOoJlr+nvoX96OYNf9wn0J8MCVdge3OD92fPfjGrPLGCt3GJWwhFDEqK577c68nidhK/Jf+6mf
	+vYn5MDC2A=
X-Gm-Gg: ASbGncuxSDHiA/mK9LcYHjWolYoNvF1LdSMVJpd2JURvo/In3AEBwbeJ5merAyITRWn
	UVuXkhYxKAEEB/qUlaKB7nmz6Gbgg5CoiME9+p75/dLfHApMDmn+9bK522Je65uOdKRzT6XFwWO
	lZ3euFZd0k2pgPJO/Plz01VtIe9K1pLLg0qNDCu39N3xRokkmP7V9vP3uNnF25vN53YEtylI8Ie
	1mPwA28kG9mwOxXtnYLo+jO4Oz13vyNKxy4Jd81dijjkBBSw8V8HWcA/z6yq/OICpWXWLdAnt1z
	8Qj+ZOIzq6PVx//ayU/POkWcHKzjnnidaSOkWW1PxQCIluxoEjjsaVW68yO5uQ==
X-Google-Smtp-Source: AGHT+IFYlcasWUbSeH3e/3BpiLkJ/wqunTec57zsoURE4x+b3YDK2EjycXsojz1T4jvgsHKfWfJe30ptkmtu
X-Received: by 2002:a05:690c:7002:b0:70e:614d:6446 with SMTP id 00721157ae682-71048cbb122mr4828267b3.7.1748576886315;
        Thu, 29 May 2025 20:48:06 -0700 (PDT)
Received: from bcacpedev-irv-2.lvn.broadcom.net ([192.19.161.250])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-70f8ad73e72sm1290147b3.68.2025.05.29.20.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 20:48:06 -0700 (PDT)
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
	Miquel Raynal <miquel.raynal@bootlin.com>,
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
Subject: [PATCH] mtd: nand: brcmnand: fix mtd corrected bits stat
Date: Thu, 29 May 2025 20:46:59 -0700
Message-ID: <20250530034713.4165309-1-dregan@broadcom.com>
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
Reviewed-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 48 ++++++++++++++++++------
 1 file changed, 37 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 62bdda3be92f..43ab4aedda55 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -361,6 +361,7 @@ enum brcmnand_reg {
 	BRCMNAND_CORR_COUNT,
 	BRCMNAND_CORR_EXT_ADDR,
 	BRCMNAND_CORR_ADDR,
+	BRCMNAND_READ_ERROR_COUNT,
 	BRCMNAND_UNCORR_EXT_ADDR,
 	BRCMNAND_UNCORR_ADDR,
 	BRCMNAND_SEMAPHORE,
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
+	[BRCMNAND_READ_ERROR_COUNT]	=     0,
 	[BRCMNAND_CORR_EXT_ADDR]	=  0x70,
 	[BRCMNAND_CORR_ADDR]		=  0x74,
 	[BRCMNAND_UNCORR_EXT_ADDR]	=  0x78,
@@ -449,6 +452,7 @@ static const u16 brcmnand_regs_v50[] = {
 	[BRCMNAND_CORR_THRESHOLD_EXT]	=     0,
 	[BRCMNAND_UNCORR_COUNT]		=     0,
 	[BRCMNAND_CORR_COUNT]		=     0,
+	[BRCMNAND_READ_ERROR_COUNT]	=     0,
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
+	if (ctrl->nand_version < 0x0600)
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
+	unsigned int corr; /* max corrected bits per subpage */
+	bool dma = 0;
 
 	dev_dbg(ctrl->dev, "read %llx -> %p\n", (unsigned long long)addr, buf);
 
@@ -2195,14 +2217,17 @@ static int brcmnand_read(struct mtd_info *mtd, struct nand_chip *chip,
 		if (has_edu(ctrl) && err_addr)
 			edu_err = true;
 
+		dma = 1;
 	} else {
 		if (oob)
 			memset(oob, 0x99, mtd->oobsize);
 
 		err = brcmnand_read_by_pio(mtd, chip, addr, trans, buf,
-					       oob, &err_addr);
+					   oob, &err_addr, &corr);
 	}
 
+	mtd->ecc_stats.corrected = brcmnand_corr_total(ctrl);
+
 	if (mtd_is_eccerr(err)) {
 		/*
 		 * On controller version and 7.0, 7.1 , DMA read after a
@@ -2240,18 +2265,19 @@ static int brcmnand_read(struct mtd_info *mtd, struct nand_chip *chip,
 	}
 
 	if (mtd_is_bitflip(err)) {
-		unsigned int corrected = brcmnand_count_corrected(ctrl);
+		if (dma)
+			corr = brcmnand_count_corrected(ctrl);
 
 		/* in case of EDU correctable error we read again using PIO */
 		if (edu_err)
 			err = brcmnand_read_by_pio(mtd, chip, addr, trans, buf,
-						   oob, &err_addr);
+						   oob, &err_addr, &corr);
 
 		dev_dbg(ctrl->dev, "corrected error at 0x%llx\n",
 			(unsigned long long)err_addr);
-		mtd->ecc_stats.corrected += corrected;
+
 		/* Always exceed the software-imposed threshold */
-		return max(mtd->bitflip_threshold, corrected);
+		return max(mtd->bitflip_threshold, corr);
 	}
 
 	return 0;
-- 
2.43.5

