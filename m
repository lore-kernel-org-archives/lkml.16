Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7B920D509
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 08:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747814612; cv=none; b=IwS8DKwPVJeNMfLn2krU/RI6R4IWZ2aJnbXcBFRe+Dnz/xWhyiLfvl3BWYLFGpcWf5akPwYxmy0GjapJc9ntr1oohA32mkIXUcQI0i2kcLqyk3PNAfppV9+dIvmWa67eZfL1HQwXfFZZyf70fchrhTmD6njYp611kbIXatixWPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747814612; c=relaxed/simple;
	bh=rQmaYn79jRGztbXw4qnUHg/6LNXZPxNwkCDDT8M6CCo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=bWQQNVyGsp6GmqqPKQPDTEQilConCGF2b3bYAt7fi+L5TJIkF1hxsSN/6abub7+j3MpjNEPSidMJoZ3PgwW6S0W6FE3ahOL2aS8FSwAOLLAia39XCE7yULCvs53drhCSYR0sbgGi1mXf+zT7gmINC7w+70n7F+l1hwUsqeSWmKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dYHYzYNk; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dYHYzYNk"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso64392005e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 01:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747814609; x=1748419409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LXdhI4enL6RgPh49SFt0lBUsUq+0PP6NMTxjTX4na4s=;
        b=dYHYzYNkA/BEFoXcdU3RMtqk9EMz0YnF3AkCkTFVaua8BGtqTP6WooQXIRffJLwokL
         TB1tMBBH2ol1DnrBCFDnOauuD1AdIKRHR6O6YFoF8OIVwGTpYtkmiTyRagC8dapzc6Xi
         2qIh9HQ00/4dtL5ma1UVb4N6EO/fzW1F0lcfmIgnKoE9EhjpAnTP2CsgbWj637YIS1BL
         bnlw8iqBQ+VTpafYe6oStpfst0+Z2W5aT4liIlnJwriBUoI4ZAgmSGg6qGF2YVABrAR0
         PJ6W2rk0S9ifnHRZnC991CbamEYu1Jrx5M99p98rHbLHyWhf0xhJF4pXkeathB9duWW9
         1TDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747814609; x=1748419409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LXdhI4enL6RgPh49SFt0lBUsUq+0PP6NMTxjTX4na4s=;
        b=jcL1Jcx+wqcdqxbu8XVa0BTzI87MyqAgIbSZO9vW/9sKAnkj+wlklo9R23yF0Okr5l
         9V/z6KcomHxEGSemeU95cUAh3CqdNYf6J7GrMGGzVdI9YSgSH4OuuLYWT7gdaMnUvGGs
         fqEPYKMISfmZPltZcDlHr4u2aCIXBaze4U/oeHfYaqMqC+5aSGacMjlnDztWsWrx45Ug
         EwuCuQhRWdtO6gce4cli0orHD7HfVkj/XQ2q7FiZ/EbHYqj8+wrUpxvhDZkxxOBiBUjO
         MQ5QQHu3O+V1wfWIsHxJMCa3jqcgvXLwV7x69eOnU/eBQvenlvX/QN+J9HObxAkjWtFp
         6I2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVLa8ORAS9+bQdcbxmHAXVGEEVRPPWpYYUBD9JXoiQ5r9jALPUw5Kdyz50xp+GZ8awgLWkf8r8frrpXkGc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd+MZyRO4dQLpz+2TkushVa1KRGlA5Nlsf6LuhYKZi3wK3Z89K
	e4xWJyqqnpMQ0R/MZtSkCdZI/PJsel7kF8Pc73Jpn9bOtl0xGirkMQhf3dbUTQ==
X-Gm-Gg: ASbGncvOq+n0iyjSO2sujk5Z2LT6H7hTU0b909sjh7udpgmEs4jHLDPQpQAuZOYFo/p
	YdhAnBAG9CJjMtS9Q/gxGNIpnPMCH9ESNzFBuGsnBlVzVBXeV0hIuwoDMgjIwrhQ5ALpBFd/JEo
	mhGmEbQ8lZdbvuUzjK4QeuakIceO/1fHQmuOG1FszGlmSm5Xsjvjcxh/TIHTG40ALIwEXO9X95g
	zN6in8VM2cmLqGv2r0NtMYyrMWTsTsTnmSss1AJcW3cs9QUYGDOxUslCH/b30tZMP2FM3pnBCvt
	rDdGV9OSSeVcxEQcTlbpoCtvPW53o06ejUI1ZBhjj+CBlI8h99l50NH8bnLyTKcuK1Uym3ZyX5k
	oxSTNCEnFoC7dLkR+rLyDCXPG65lsY4R9MPneTj++aSbsRl84qYY=
X-Google-Smtp-Source: AGHT+IEPmlreYh3GmmXQiEYLUqD+Vf7gKdHz1+EGw8jOEmRxFzRv8oqhqeh2UtwJsYvkJlrGt7mJTg==
X-Received: by 2002:a05:600c:1d82:b0:43c:f969:13c0 with SMTP id 5b1f17b1804b1-442ff03bd03mr172537625e9.29.1747814608500;
        Wed, 21 May 2025 01:03:28 -0700 (PDT)
Received: from skynet.lan (2a02-9142-4580-0800-0000-0000-0000-0008.red-2a02-914.customerbaf.ipv6.rima-tde.net. [2a02:9142:4580:800::8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f1825441sm62172895e9.8.2025.05.21.01.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 01:03:27 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: linux-mtd@lists.infradead.org,
	dregan@broadcom.com,
	miquel.raynal@bootlin.com,
	bcm-kernel-feedback-list@broadcom.com,
	florian.fainelli@broadcom.com,
	rafal@milecki.pl,
	computersforpeace@gmail.com,
	kamal.dasu@broadcom.com,
	dan.beygelman@broadcom.com,
	william.zhang@broadcom.com,
	frieder.schrempf@kontron.de,
	linux-kernel@vger.kernel.org,
	vigneshr@ti.com,
	richard@nod.at,
	bbrezillon@kernel.org,
	kdasu.kdev@gmail.com,
	jaimeliao.tw@gmail.com,
	kilobyte@angband.pl,
	jonas.gorski@gmail.com,
	dgcbueu@gmail.com
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
Subject: [PATCH v5] mtd: rawnand: brcmnand: legacy exec_op implementation
Date: Wed, 21 May 2025 10:03:25 +0200
Message-Id: <20250521080325.581366-1-noltari@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit 3c8260ce7663 ("mtd: rawnand: brcmnand: exec_op implementation")
removed legacy interface functions, breaking < v5.0 controllers support.
In order to fix older controllers we need to add an alternative exec_op
implementation which doesn't rely on low level registers.

Fixes: 3c8260ce7663 ("mtd: rawnand: brcmnand: exec_op implementation")
Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Reviewed-by: David Regan <dregan@broadcom.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 222 ++++++++++++++++++++++-
 1 file changed, 215 insertions(+), 7 deletions(-)

 v5: add changes requested by Miquèl Raynal:
  - Mention and explain legacy in native_cmd_conv.
  - EOPNOTSUPP instead of EINVAL for instr->type else.
  - Implement missing check_only functionality.

 v4: add changes requested by Jonas Gorski:
  - Add missing breaks in brcmnand_exec_instructions_legacy.
  - Restore missing ret assignment in brcmnand_exec_op.

 v3: add changes requested by Florian and other improvements:
  - Add associative array for native command conversion.
  - Add function pointer to brcmnand_controller for exec_instr
    functionality.
  - Fix CMD_BLOCK_ERASE address.
  - Drop NAND_CMD_READOOB support.

 v2: multiple improvements:
  - Use proper native commands for checks.
  - Fix NAND_CMD_PARAM/NAND_CMD_RNDOUT addr calculation.
  - Remove host->last_addr usage.
  - Remove sector_size_1k since it only applies to v5.0+ controllers.
  - Remove brcmnand_wp since it doesn't exist for < v5.0 controllers.
  - Use j instead of i for flash_cache loop.

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 299dd2bca5b4..5ed79ffa271c 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -65,6 +65,7 @@ module_param(wp_on, int, 0444);
 #define CMD_PARAMETER_READ		0x0e
 #define CMD_PARAMETER_CHANGE_COL	0x0f
 #define CMD_LOW_LEVEL_OP		0x10
+#define CMD_NOT_SUPPORTED		0xff
 
 struct brcm_nand_dma_desc {
 	u32 next_desc;
@@ -199,6 +200,30 @@ static const u16 flash_dma_regs_v4[] = {
 	[FLASH_DMA_CURRENT_DESC_EXT]	= 0x34,
 };
 
+/* Native command conversion for legacy controllers (< v5.0) */
+static const u8 native_cmd_conv[] = {
+	[NAND_CMD_READ0]	= CMD_NOT_SUPPORTED,
+	[NAND_CMD_READ1]	= CMD_NOT_SUPPORTED,
+	[NAND_CMD_RNDOUT]	= CMD_PARAMETER_CHANGE_COL,
+	[NAND_CMD_PAGEPROG]	= CMD_NOT_SUPPORTED,
+	[NAND_CMD_READOOB]	= CMD_NOT_SUPPORTED,
+	[NAND_CMD_ERASE1]	= CMD_BLOCK_ERASE,
+	[NAND_CMD_STATUS]	= CMD_NOT_SUPPORTED,
+	[NAND_CMD_SEQIN]	= CMD_NOT_SUPPORTED,
+	[NAND_CMD_RNDIN]	= CMD_NOT_SUPPORTED,
+	[NAND_CMD_READID]	= CMD_DEVICE_ID_READ,
+	[NAND_CMD_ERASE2]	= CMD_NULL,
+	[NAND_CMD_PARAM]	= CMD_PARAMETER_READ,
+	[NAND_CMD_GET_FEATURES]	= CMD_NOT_SUPPORTED,
+	[NAND_CMD_SET_FEATURES]	= CMD_NOT_SUPPORTED,
+	[NAND_CMD_RESET]	= CMD_NOT_SUPPORTED,
+	[NAND_CMD_READSTART]	= CMD_NOT_SUPPORTED,
+	[NAND_CMD_READCACHESEQ]	= CMD_NOT_SUPPORTED,
+	[NAND_CMD_READCACHEEND]	= CMD_NOT_SUPPORTED,
+	[NAND_CMD_RNDOUTSTART]	= CMD_NULL,
+	[NAND_CMD_CACHEDPROG]	= CMD_NOT_SUPPORTED,
+};
+
 /* Controller feature flags */
 enum {
 	BRCMNAND_HAS_1K_SECTORS			= BIT(0),
@@ -237,6 +262,12 @@ struct brcmnand_controller {
 	/* List of NAND hosts (one for each chip-select) */
 	struct list_head host_list;
 
+	/* Functions to be called from exec_op */
+	int (*check_instr)(struct nand_chip *chip,
+			   const struct nand_operation *op);
+	int (*exec_instr)(struct nand_chip *chip,
+			  const struct nand_operation *op);
+
 	/* EDU info, per-transaction */
 	const u16               *edu_offsets;
 	void __iomem            *edu_base;
@@ -2478,18 +2509,190 @@ static int brcmnand_op_is_reset(const struct nand_operation *op)
 	return 0;
 }
 
+static int brcmnand_check_instructions(struct nand_chip *chip,
+				       const struct nand_operation *op)
+{
+	return 0;
+}
+
+static int brcmnand_exec_instructions(struct nand_chip *chip,
+				      const struct nand_operation *op)
+{
+	struct brcmnand_host *host = nand_get_controller_data(chip);
+	unsigned int i;
+	int ret = 0;
+
+	for (i = 0; i < op->ninstrs; i++) {
+		ret = brcmnand_exec_instr(host, i, op);
+		if (ret)
+			break;
+	}
+
+	return ret;
+}
+
+static int brcmnand_check_instructions_legacy(struct nand_chip *chip,
+					      const struct nand_operation *op)
+{
+	const struct nand_op_instr *instr;
+	unsigned int i;
+	u8 cmd;
+
+	for (i = 0; i < op->ninstrs; i++) {
+		instr = &op->instrs[i];
+
+		switch (instr->type) {
+		case NAND_OP_CMD_INSTR:
+			cmd = native_cmd_conv[instr->ctx.cmd.opcode];
+			if (cmd == CMD_NOT_SUPPORTED)
+				return -EOPNOTSUPP;
+			break;
+		case NAND_OP_ADDR_INSTR:
+		case NAND_OP_DATA_IN_INSTR:
+		case NAND_OP_WAITRDY_INSTR:
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+	}
+
+	return 0;
+}
+
+static int brcmnand_exec_instructions_legacy(struct nand_chip *chip,
+					     const struct nand_operation *op)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct brcmnand_host *host = nand_get_controller_data(chip);
+	struct brcmnand_controller *ctrl = host->ctrl;
+	const struct nand_op_instr *instr;
+	unsigned int i, j;
+	u8 cmd = CMD_NULL, last_cmd = CMD_NULL;
+	int ret = 0;
+	u64 last_addr;
+
+	for (i = 0; i < op->ninstrs; i++) {
+		instr = &op->instrs[i];
+
+		if (instr->type == NAND_OP_CMD_INSTR) {
+			cmd = native_cmd_conv[instr->ctx.cmd.opcode];
+			if (cmd == CMD_NOT_SUPPORTED) {
+				dev_err(ctrl->dev, "unsupported cmd=%d\n",
+					instr->ctx.cmd.opcode);
+				ret = -EOPNOTSUPP;
+				break;
+			}
+		} else if (instr->type == NAND_OP_ADDR_INSTR) {
+			u64 addr = 0;
+
+			if (cmd == CMD_NULL)
+				continue;
+
+			if (instr->ctx.addr.naddrs > 8) {
+				dev_err(ctrl->dev, "unsupported naddrs=%u\n",
+					instr->ctx.addr.naddrs);
+				ret = -EOPNOTSUPP;
+				break;
+			}
+
+			for (j = 0; j < instr->ctx.addr.naddrs; j++)
+				addr |= (instr->ctx.addr.addrs[j]) << (j << 3);
+
+			if (cmd == CMD_BLOCK_ERASE)
+				addr <<= chip->page_shift;
+			else if (cmd == CMD_PARAMETER_CHANGE_COL)
+				addr &= ~((u64)(FC_BYTES - 1));
+
+			brcmnand_set_cmd_addr(mtd, addr);
+			brcmnand_send_cmd(host, cmd);
+			last_addr = addr;
+			last_cmd = cmd;
+			cmd = CMD_NULL;
+			brcmnand_waitfunc(chip);
+
+			if (last_cmd == CMD_PARAMETER_READ ||
+			    last_cmd == CMD_PARAMETER_CHANGE_COL) {
+				/* Copy flash cache word-wise */
+				u32 *flash_cache = (u32 *)ctrl->flash_cache;
+
+				brcmnand_soc_data_bus_prepare(ctrl->soc, true);
+
+				/*
+				 * Must cache the FLASH_CACHE now, since changes in
+				 * SECTOR_SIZE_1K may invalidate it
+				 */
+				for (j = 0; j < FC_WORDS; j++)
+					/*
+					 * Flash cache is big endian for parameter pages, at
+					 * least on STB SoCs
+					 */
+					flash_cache[j] = be32_to_cpu(brcmnand_read_fc(ctrl, j));
+
+				brcmnand_soc_data_bus_unprepare(ctrl->soc, true);
+			}
+		} else if (instr->type == NAND_OP_DATA_IN_INSTR) {
+			u8 *in = instr->ctx.data.buf.in;
+
+			if (last_cmd == CMD_DEVICE_ID_READ) {
+				u32 val;
+
+				if (instr->ctx.data.len > 8) {
+					dev_err(ctrl->dev, "unsupported len=%u\n",
+						instr->ctx.data.len);
+					ret = -EOPNOTSUPP;
+					break;
+				}
+
+				for (j = 0; j < instr->ctx.data.len; j++) {
+					if (j == 0)
+						val = brcmnand_read_reg(ctrl, BRCMNAND_ID);
+					else if (j == 4)
+						val = brcmnand_read_reg(ctrl, BRCMNAND_ID_EXT);
+
+					in[j] = (val >> (24 - ((j % 4) << 3))) & 0xff;
+				}
+			} else if (last_cmd == CMD_PARAMETER_READ ||
+				   last_cmd == CMD_PARAMETER_CHANGE_COL) {
+				u64 addr;
+				u32 offs;
+
+				for (j = 0; j < instr->ctx.data.len; j++) {
+					addr = last_addr + j;
+					offs = addr & (FC_BYTES - 1);
+
+					if (j > 0 && offs == 0)
+						nand_change_read_column_op(chip, addr, NULL, 0,
+									   false);
+
+					in[j] = ctrl->flash_cache[offs];
+				}
+			}
+		} else if (instr->type == NAND_OP_WAITRDY_INSTR) {
+			ret = bcmnand_ctrl_poll_status(host, NAND_CTRL_RDY, NAND_CTRL_RDY, 0);
+			if (ret)
+				break;
+		} else {
+			dev_err(ctrl->dev, "unsupported instruction type: %d\n", instr->type);
+			ret = -EOPNOTSUPP;
+			break;
+		}
+	}
+
+	return ret;
+}
+
 static int brcmnand_exec_op(struct nand_chip *chip,
 			    const struct nand_operation *op,
 			    bool check_only)
 {
 	struct brcmnand_host *host = nand_get_controller_data(chip);
+	struct brcmnand_controller *ctrl = host->ctrl;
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	u8 *status;
-	unsigned int i;
 	int ret = 0;
 
 	if (check_only)
-		return 0;
+		return ctrl->check_instr(chip, op);
 
 	if (brcmnand_op_is_status(op)) {
 		status = op->instrs[1].ctx.data.buf.in;
@@ -2513,11 +2716,7 @@ static int brcmnand_exec_op(struct nand_chip *chip,
 	if (op->deassert_wp)
 		brcmnand_wp(mtd, 0);
 
-	for (i = 0; i < op->ninstrs; i++) {
-		ret = brcmnand_exec_instr(host, i, op);
-		if (ret)
-			break;
-	}
+	ret = ctrl->exec_instr(chip, op);
 
 	if (op->deassert_wp)
 		brcmnand_wp(mtd, 1);
@@ -3130,6 +3329,15 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	if (ret)
 		goto err;
 
+	/* Only v5.0+ controllers have low level ops support */
+	if (ctrl->nand_version >= 0x0500) {
+		ctrl->check_instr = brcmnand_check_instructions;
+		ctrl->exec_instr = brcmnand_exec_instructions;
+	} else {
+		ctrl->check_instr = brcmnand_check_instructions_legacy;
+		ctrl->exec_instr = brcmnand_exec_instructions_legacy;
+	}
+
 	/*
 	 * Most chips have this cache at a fixed offset within 'nand' block.
 	 * Some must specify this region separately.
-- 
2.39.5

