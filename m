Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85351C8631
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 18:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748024096; cv=none; b=jFeV2fRnwJmHeFetgTJ8iW5kKWvbhgrVOvUKOOdikpC1aQYQSSqMOvfFDBMcO4dw0w1AI0RDA9uFNxo6CUHCSxe/wgz90zp7mwv79WRNITyyc0DAZyUkUTiyDU8XIfj+y51wti9ftSg9I8OfWEXchmKd0+bILIplI2iKCuyskD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748024096; c=relaxed/simple;
	bh=s85zEFx000MgdgA5PhcGQg6Ost75ZtASD5Zeo3ZI4uM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=XTCt8Rcc/Ve/ooG9hAGS1TzZRYtGylOFpqknzDHOjlobgb62iTqd5ChjFLZf2rpA32qMnt2vd4jnjKkx92FlyixgNw+bP6STt64rXHRPCSios6BsWdNu0L2piGoxRTmuc9drUpWIgGCLXNlcMUZJXZOf0EqZxCqDtgHNckvzysE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XX/5pxhE; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XX/5pxhE"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-445b11306abso405835e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 11:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748024093; x=1748628893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZW1jttOPNJ06RdYrWP6ScVpFMjz9flIrlDAiLpOrirs=;
        b=XX/5pxhEsevEcZ3wyAby+0/eUw6Yu0l4xKArLfbIGvLKgj5gf2BtyHY2cmDnjEf2wM
         IEfYF9B/RNsDxRxw6eXQ5So+SzykPgSa91EKyVjW3/ZIA/YbNJ4ArjXOvg1DEWz0nsvq
         prGAjV2k62VEkwbER/ciLp2XLd84Tlus7LCllYcRYhwp76Wh/uIKWI0FsEtBvEyRyyuf
         sfkfiZqsvxNGcwYw6ENz58V0KVequ8cLnaT462bU2QCfqqClcP2Jo9drLnMxxkem/fCY
         wJ+93t5WDVwu9z6gxUkbsum/kxsIfSB8tWJ/Uuo1IugeHF91XGKRfGyI+B8MHlGj79b0
         HwSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748024093; x=1748628893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZW1jttOPNJ06RdYrWP6ScVpFMjz9flIrlDAiLpOrirs=;
        b=YtUjcOXDbn/nW/Bnwg3QWfrpIWLgev3iVXXynlkrPo8eO5Pe7f5RH3e7UgI852TH5u
         clIVZLSrGT6zjpfd1pLYlTsFlZLKA1Ekpr49F5zvs0SBlug2ls8+jmzs5oqKuUuSJEZB
         DJjnMpT+3W5b/8FoUygcJrOK+EOl2+TpIrYIKg3BlVZfBjCpdj4kyiyr4Xu3lySzrL8N
         HL7OOV3gPWghCStNx+WkOPRbqtNx6A6dy+DyfyqYkC5HEv3Var4UQx4Z1ayynfgJDTLy
         gBBU4trhw7NyA6xya/kXd3lUunU/QM5JqCv/R9spps9WRKX+2EinQXALaVnfIJ3jMmzE
         9Sqg==
X-Forwarded-Encrypted: i=1; AJvYcCVsRePjDOxSEYYMvV1lI5+4vEi8Sz1bwv2oH6Aes54dp5bEpGG5lxdk6mUaoS719r9DEb+4xtAQRAuAq3s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKmP4rDuT8gnxjFO767NR40GefvPUgDH6O+/q6S2C5IICcUhMI
	OlMkmK3zuCRH2BZHHas9QZcveRtcnGB0jESgJgZV9QE2Il+vLxPrwQND
X-Gm-Gg: ASbGncuz2L/jEMXV8BvbWYqA3kvVvdkrxFs8FNzG5OppqLSIia2K8RoKOTmF1PoVraD
	kxzfFcXEuEv17FIKrd3Upsl9gQDojlqSRvEdrVEUoPdJwFLLCuH/4KRtspvXzP7GD+h3dj35abS
	VRfFa+/0h90CMcg0KJvFeyw8ctDgCdX66E0Xob6zUcMdsGGn5YDidpOCX/DysgB9CIWSKtsnMUh
	qA4vTy9jHkz9Ao0c2zBNSF7UaTFRQhQN589tozUKc2EU670IxuIpsIDXyDV90chWlist8JcsDqc
	LUtNjlKxsT9VPyfvHP+ACqaDDvR5OVidWR8wPBnAcrTfPPGGaSzqG95WeEgCZpjRTo1g7haNIoZ
	URjAgePXZeQ0PH1POilUsMaMnEJLxEzjefqt/72tOnB6g6xiVq3o=
X-Google-Smtp-Source: AGHT+IGB19drkN0Qe2GohVK/9BT2BrTvom1tn1tIMOVKQXd9Cpdj6elPYPYCXAlTOzLddnOoR3UGxg==
X-Received: by 2002:a05:600c:3e84:b0:43d:7588:667b with SMTP id 5b1f17b1804b1-44c935dd592mr686215e9.10.1748024092612;
        Fri, 23 May 2025 11:14:52 -0700 (PDT)
Received: from skynet.lan (2a02-9142-4580-0a00-0000-0000-0000-0008.red-2a02-914.customerbaf.ipv6.rima-tde.net. [2a02:9142:4580:a00::8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f38142b8sm147078285e9.30.2025.05.23.11.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 11:14:52 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: linux-mtd@lists.infradead.org,
	dregan@broadcom.com,
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
Subject: [PATCH v6] mtd: rawnand: brcmnand: legacy exec_op implementation
Date: Fri, 23 May 2025 20:14:48 +0200
Message-Id: <20250523181448.1181256-1-noltari@gmail.com>
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
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Reviewed-by: William Zhang <william.zhang@broadcom.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 223 ++++++++++++++++++++++-
 1 file changed, 216 insertions(+), 7 deletions(-)

 v6: add changes requested by David Regan:
  - add braces in flash_cache for loop.

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
index b43281b8204f6..610e8557acafe 100644
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
@@ -2478,18 +2509,191 @@ static int brcmnand_op_is_reset(const struct nand_operation *op)
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
+				for (j = 0; j < FC_WORDS; j++) {
+					/*
+					 * Flash cache is big endian for parameter pages, at
+					 * least on STB SoCs
+					 */
+					flash_cache[j] = be32_to_cpu(brcmnand_read_fc(ctrl, j));
+				}
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
@@ -2513,11 +2717,7 @@ static int brcmnand_exec_op(struct nand_chip *chip,
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
@@ -3130,6 +3330,15 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
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

