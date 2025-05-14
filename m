Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2061D1F9406
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 06:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747203828; cv=none; b=kx8Aa9q5j+QSPJgH5ize8B+FZkaxy2oh1CEw0Sn/3e4Vnsa9Z0uZ0kVCWa86esZ94jQJHexnYUmQVA/Ozxojdnjt1YkGRFLuJD6a4oLNOq5L3dD1blzj4IJO3zmYOV6sAkJja4tY4q2RvFSMyTF8M67sNGskHYLBgSHF6Yiwssw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747203828; c=relaxed/simple;
	bh=1XU22ycLcbDAX06mAwm81add3aZRPxk3l4Z+xrdqXqM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=WnpzpfYjmCukh6q6w337wugT3ep8fclD+OK72aNAT23SUqibnOH0LlxIfZjWmC6GdaO17lKxqcjP903EOZax7E4R23n6OLx7leLNbMzaeEjNe9Jy/GVVoVEeyKpwEKvc8XWE1YnOZYjnGcGJa9N6Tk1q325PJz4QIW42gwvza2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aj454twW; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aj454twW"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a0b637db6eso3834785f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 23:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747203824; x=1747808624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wmHBW6sfnSn/ftW0IvqkP48U4Cb81zY632t73DCuU7Y=;
        b=Aj454twW+3mhS8G5xjwKPrG/G3XFAH3VHB4EamXJTfFZkulrIm/hRULg9DIFx2DuoZ
         +Tog7nRPF9V132r/grAEXYP4vPRdM0etK1kQjmTbSk3PkkLmVueyi9ypRZcfaRz3CXsy
         A5sbMvwfalXati5ED6hJyvRtPNniAXpyh4xcQM1XccZ5XXWHn5J599HWiZGRYzmYVEoj
         yo6Cf0U1NV6hq9e43SFeDvJUc7ROnC8xWN8ZCUtsMACLhOogc9BpOPSsU8fcRwp9Zs5V
         Ej2fEPcaW8SEWT1aFBiZyap1UozROSql6daeYWgjAfPiGOSght16YliXkRwVRW/2XobX
         dGXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747203824; x=1747808624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wmHBW6sfnSn/ftW0IvqkP48U4Cb81zY632t73DCuU7Y=;
        b=i+LlPoby0RwfwftyTrx8+kPujTH956AqtRnOgTp8Mn0YkJ5RE7gFNmPHdD8ebBJBou
         7TdV6oFz4BWQRtk8Pq7GwXfA642MDraUNBqfcrbmJ5rf8lmVPv5uQKqkGdY4r/TCrgpp
         Ew4beLk/DVkh4HhRbM2OV6+287SiiLCJvc58ERpW14giYrC3bUMtfO3PkdqrTiZYVhUO
         2vqARRv0pA95osGsvQLFNpGwQNwR9v4/ORe403y5QlE708r38eBkcqyFCs9ohOCQxMTK
         LwaMR0Pfrw6mn2MmeaVxhfRKisac1ljirGR52skZr+p2jfXjWGBuio5G4YMLca9varRs
         OwFw==
X-Forwarded-Encrypted: i=1; AJvYcCVZ9WPSqk8NzRMxzHaso0HWiIroqCF66Z8kwm24Ktu/VWKecYWLbOrpBBeqsPLtkVRzcp55pyQBhk0TiIw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTiQ9tpnA4T1wMvyZc+1pwOqAxQR5UsIjVE7i1qZORfq3R6mQu
	uKZdWf45w2MyuEfGDJ55QIN0gTEF3OPKwbffzmv5SzEpDMJFOYht
X-Gm-Gg: ASbGnctYXtwAHaAhtc6znJ0DYggsA2EvlQ0pTy4PicZd/wt/tORY7GZ9GveUKK5KoGG
	gNbB62Vh9lVG4U2IpsY6sCDIXeWZdwE1khZx72gOKr16F7M+GiowbCKcZjfqJ0irPjyvli+GFVK
	nakfPIjQPtD+BEfkYxFE/bwWUwJPxbsMK6CU7DY2k87LsnGN2j180XWBO+r9WZ47D+zein+bWW+
	DskXh5/JIGC9XCsyaqp7lSeRbX9v/JRxCWogz3k5LGqrACMhyItoxj0flkFEXeTyprmZKE10tAm
	UXArkum+948aUTqCn/jZdoj1qPEHDS9zZ+2d9d5BBNi5EnNLzH1LIN2U15qKmCX1AsMnzDCgIR5
	AG8hl4JdCHjPT8hywfEtRiQ+x2ESJGvjqaR96YBWDbY+qm+TwDeY=
X-Google-Smtp-Source: AGHT+IGBHmGTvAbAtGxrvaGYWFE1srTooXJtUkMdGFrvXFAukwpk6BK2D1AfgrCfJ/xOKtgugJYtCA==
X-Received: by 2002:a05:6000:3104:b0:3a0:6f92:ef7c with SMTP id ffacd0b85a97d-3a3496a4e93mr1529943f8f.17.1747203824224;
        Tue, 13 May 2025 23:23:44 -0700 (PDT)
Received: from skynet.lan (2a02-9142-4580-0400-0000-0000-0000-0008.red-2a02-914.customerbaf.ipv6.rima-tde.net. [2a02:9142:4580:400::8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a22ea7a53asm6600341f8f.23.2025.05.13.23.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 23:23:43 -0700 (PDT)
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
Subject: [PATCH v3] mtd: rawnand: brcmnand: legacy exec_op implementation
Date: Wed, 14 May 2025 08:23:41 +0200
Message-Id: <20250514062341.774919-1-noltari@gmail.com>
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
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 178 ++++++++++++++++++++++-
 1 file changed, 172 insertions(+), 6 deletions(-)

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
index 17f6d9723df9..f4fabe7ffd9d 100644
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
@@ -2490,14 +2519,149 @@ static int brcmnand_op_is_reset(const struct nand_operation *op)
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
+		} else {
+			dev_err(ctrl->dev, "unsupported instruction type: %d\n", instr->type);
+			ret = -EINVAL;
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
@@ -2525,11 +2689,7 @@ static int brcmnand_exec_op(struct nand_chip *chip,
 	if (op->deassert_wp)
 		brcmnand_wp(mtd, 0);
 
-	for (i = 0; i < op->ninstrs; i++) {
-		ret = brcmnand_exec_instr(host, i, op);
-		if (ret)
-			break;
-	}
+	ctrl->exec_instr(chip, op);
 
 	if (op->deassert_wp)
 		brcmnand_wp(mtd, 1);
@@ -3142,6 +3302,12 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
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

