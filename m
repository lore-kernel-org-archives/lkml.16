Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A15A8C1F
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 05:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747285715; cv=none; b=rTmP+tTp4NgDmFlmMn7URbbz6brS9coRE5cJFu1PWIS3eF8t7p2DkChS0GIPs39kA6GL/NtfcBloq4USjOiDw2AEn53GtodPSuO2Wziy20V2I6VMp6zBIdHpklo6/vuvyaVuN8Mo847J/g4HtnJO13JPDfrEhORu7L4YlhsLTsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747285715; c=relaxed/simple;
	bh=R2e6IY2aGM86GXVHnA535KPlLrO+bcT9FdZraQcUSZM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=krZnfP+xn/k0xSgcZ5V5weV8Ft5ZkIYcz6GEyT/sDMWN0JCDv5mvb7159lzE4wrzLPxWrSFzv3V08BTZSWtmHwodjKQciAjrTeoOuqZerUffhHgjqd4kMuY+ubERmptA3FTVhKrFSLMRJ565Dl4N8FMZsvRnaM3Orpr2rWbmTQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EikxpLdM; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EikxpLdM"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so3799405e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 22:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747285711; x=1747890511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9NxJDudth95COytxeMte8dNYzQjInMdH/rxx6p7aGR4=;
        b=EikxpLdMPZ3bxrln4vktu+bQH8UVlAx1GDWJf7+Z3t+3fxbUjYvfz9buH/BmnvVaJV
         P4founSVizNJoZsbNiNkvOzfhXNgh/waNUa/wOuaeMQZ0hVJ5WXDRtsee32odkyvQpch
         4/WUAHw3BHTl5vLsPN4nZIZVGJR9S0ioPQdv3mcfS//t/+oF4T1xNUZcwUVoba6dp+rg
         9jjfT/BaGxdAbCGZ7+tGf6KA5oWmxPE2tCaVY5Euuek7SVY7ijuVn6uMqqzseYG298cT
         VS5hBshTiuHp4Wyd6JUWdBgqxf1uVW/2JaqE3p2Q5VbdnGyi84DN2BvVMJksUoj7SC7d
         z7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747285711; x=1747890511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9NxJDudth95COytxeMte8dNYzQjInMdH/rxx6p7aGR4=;
        b=fVqrBHzLJMkwR0FUhX/aq1jnR561ujOOl7yfEVnUjNik4qJ/Dbkjw2gvTrJd4eBWBe
         TLz+GKxf3l/taIZDVtjWy7nZOkC+cHUJY1Mj0rfy/slk3LYvzaqc0R1k6CsmMYeBZzys
         jvMhE5fC9FZN01aHZJ5mQtNnAuep1ZUVrqu6sw4XvFIYerYlal+5bVwvTYp+9HkpD3j3
         2HWFsqk45XUYJcBnhzOM6cgtA6CnUyyYYHdk83DABCI0GRK3ckX9LtnvyCIDHLBDGb18
         qp8aiPvvSy5Hg2gIrEa+RMLXvQ7MhFO6FmJiNDDOKi7N+e2V1KOXXUeoI2waLHnlWQIM
         1Sqg==
X-Forwarded-Encrypted: i=1; AJvYcCUWaQAv9dpUE5hh3ggafJyfzICrA88UIGWZcXiBu+rb/qjVPZ3PPr35YZcxeg2DNcw6hoq3FmNnhVOZfR8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcrFEjxoNZR7uDtSnAG9i0GnwofrvhPy09Vt/ikMBkjQ24JBYK
	O/fYo/t3zePMCKDbWbLrC1P6DC6ViHK2Hd8WyEaQqI0gm9Eq8kq3
X-Gm-Gg: ASbGncuYtxT5MUeL9Bn3CwcnLuc99151JdMJ433Re5QK2kyhZxWDyOoFULQbKELPCwT
	qaaz+Dd8OLs8sRK2U1QqG7e2246jDA2/v7T5W0tGkjaFv5h9FD5XH1oloxB30Qf+G0sOY1Ylgt+
	9cyXtVr8aHReIK0Tl86N2uYhT0VWj6JV+zDNn4Bz8TRUhNNBOtFOJxy/2SUZM6W1mRoasGzDv3i
	OIUw7src5d/zoIbQOQK5k4rZJj1he0xlaKCBCmVm/sCGdbZpju9CNB2php5L+M6PH2rI5L8+QE5
	/sKhCen71wbS/3K9v2IUeAjPGWtIGHilS31/1iiiz01S7Phwg4e5Za2dTfCBRaioEkfevoPgt4D
	q6dloTKNav9LIP2XCUpkRABkb8pvds37A5EaQqvWHU8wdmcp1uH4=
X-Google-Smtp-Source: AGHT+IEYlbK6SpqgDIWRBPQvBVxXcupBMpet4tDsziRqWw+aFmthzTyUxlGDAxOkdMuyOxJ84/Slxg==
X-Received: by 2002:a05:6000:1869:b0:3a1:a96c:9b76 with SMTP id ffacd0b85a97d-3a3537ab240mr737321f8f.38.1747285711158;
        Wed, 14 May 2025 22:08:31 -0700 (PDT)
Received: from skynet.lan (2a02-9142-4580-0400-0000-0000-0000-0008.red-2a02-914.customerbaf.ipv6.rima-tde.net. [2a02:9142:4580:400::8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f39ef8bbsm54689245e9.37.2025.05.14.22.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 22:08:30 -0700 (PDT)
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
Subject: [PATCH v4] mtd: rawnand: brcmnand: legacy exec_op implementation
Date: Thu, 15 May 2025 07:07:59 +0200
Message-Id: <20250515050759.1016697-1-noltari@gmail.com>
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
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 181 ++++++++++++++++++++++-
 1 file changed, 175 insertions(+), 6 deletions(-)

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
index 17f6d9723df9..e6ec394d30f1 100644
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
 
+/* Native command conversion */
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
@@ -237,6 +262,10 @@ struct brcmnand_controller {
 	/* List of NAND hosts (one for each chip-select) */
 	struct list_head host_list;
 
+	/* Function to be called from exec_op */
+	int (*exec_instr)(struct nand_chip *chip,
+			  const struct nand_operation *op);
+
 	/* EDU info, per-transaction */
 	const u16               *edu_offsets;
 	void __iomem            *edu_base;
@@ -2490,14 +2519,152 @@ static int brcmnand_op_is_reset(const struct nand_operation *op)
 	return 0;
 }
 
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
+			ret = -EINVAL;
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
@@ -2525,11 +2692,7 @@ static int brcmnand_exec_op(struct nand_chip *chip,
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
@@ -3142,6 +3305,12 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 	if (ret)
 		goto err;
 
+	/* Only v5.0+ controllers have low level ops support */
+	if (ctrl->nand_version >= 0x0500)
+		ctrl->exec_instr = brcmnand_exec_instructions;
+	else
+		ctrl->exec_instr = brcmnand_exec_instructions_legacy;
+
 	/*
 	 * Most chips have this cache at a fixed offset within 'nand' block.
 	 * Some must specify this region separately.
-- 
2.39.5

