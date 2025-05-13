Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8EF1DE2A5
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 08:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747123320; cv=none; b=NPoJgITzNlw11d46WrK1KOuzkxMl+VrvS6lIiqdngisUd23+z9lxu5A09yKQH3tTUXxStobjoQF/LQj4HmfyFWBMv7bO4Beszqnx4/BxAQS21dT8Fjtvg4P89RNSA/WMrYfL98elc2UMnOWMDZLVYnxW7vGIibsYnRe5SYenxSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747123320; c=relaxed/simple;
	bh=ISCaUk8qWlGStaPC0a3WV1RMw9t74L4llRt8dIBC8dI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=sergnXPvKr4CN24Mct62MtVEo4bws95OKf0KI+apzxhBdAEzE5EnQtcPmetRvZOXZe5s9U5mo7qCp2gqkC5LjoahozjHqeSBrdEWeP7foGyizqi/3+tVT+5ncuHwr8k5MJFMbBsOv+TLBUHY1dTeaBmlYGX/fwO5ZzbEyem1lPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X87ODg2x; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X87ODg2x"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso35936115e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 01:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747123315; x=1747728115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8TVxLNSdPzo1kl9X3TZ7h2w8bkcXL8aHoigIDqpXP1M=;
        b=X87ODg2xNDvlKyj9ImfZ/FPREtjmepO4cHfMUc3vqanBvx4TUqqsccTXoLFkavgjmX
         sd9rlr6vnjgmBSENKPMfl41KZP3ymHFstZatVn1ziNoQDUpu1cqAZ5RERhmpcBLMbvnp
         72P+yzCQT2ghPEd1jXp6/auiriYDv8YOi3PnMx9z6wLcWr3Z/GNes93TPsPU1gofYy01
         mG9biIOeDpCF0LtsQ6RBZKIE2C2Ede/7QZ/U32t8JhtP6VqWKEUcnFd+SK9ucWFnmP/u
         rvfOCgc3S6e8jJ+Kwcb2Wxm6QiMacAx4FaTXnFr/rJPJsxLi+zp+VhIZUCus8bU4FwHE
         3Cuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747123315; x=1747728115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8TVxLNSdPzo1kl9X3TZ7h2w8bkcXL8aHoigIDqpXP1M=;
        b=uPHRavV7yW/ziO4fgcLj33P6Fx03va7EdG9JWhTHfoRv3nW4tteyRSgGxp9e7tK4WS
         WxK9aPSoGiarjruvNAYmHpzV6l6j2iHMegob/1Ihc1qP4jPDKQTLJMTWs6AORXL6YMwa
         IIyaWkFB4LLh2CWAhT0OsLFPzzbsq3tikaASokHbkEh55gVupFQsxdeQNJq/ndgYI9DS
         ZY8M7GGbcB+U1RaxveBITLIUGnPrZiyGOsPTQbyORahSgqmrhSEQPjuRj7RKIHfAhWSd
         I9rRcw0Az3vT9Xim5W1lYBboPAwk0Qa/v7yBPIrzJaFxvlRC/5e6XJ4lXMlxFu+9goPd
         tRXA==
X-Forwarded-Encrypted: i=1; AJvYcCWcfn9N6XWELLf+b54OogZdlkMFKc3ypmCDjJvGZtTcs26beyLDlD7A1OiQ/0TRAGqr41K3lz9oyeoHJDg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJtHXOx7HVEMajJvEzo8/ULRPDVXQF3m2gZHDjvE0hyu1SSmDM
	BTdHy0OHGtqbEURodjXSu1NAkb4QN/RWgStTFi2FfdxLsccuvnjg
X-Gm-Gg: ASbGnctcr4zXEmLk0v4iTMuDIj6txDmwrz1mAepeLG9NrtrMF6lbHsw3LiagjdT51Du
	fyY1vRKu/4IkkFgiRw0U70eo/5DE594V6kFTpp5pQHC+p4E8vpBWCJSikwenn2cG5tti00mm2c0
	6XYv/UpYY2FDO1vbK9JG5rh4MlCMgkOixciVsVRkZjLLkGNn9JJogJQTbEl0PGqiJrLwlmGznvG
	SdfqwafJZzVgqm4Mzwk7kTRUCtTlupk6KzND/+tl1ehpHtw+9R48BBvyvo7QC4stpOIs176lcIA
	S3OhO9Y5PrEWbIgzUxIjcET6jOd8qGh4IMGiaCWhtABwOFlC49DNYFVpjHaom8B0JkTJPE+H2WN
	x3UEzQ/03DPMq23pkHoYiTa9PpbPbTrDckMeQlBnVeAv8slYv/bc=
X-Google-Smtp-Source: AGHT+IFB8v1TYmL+KXLVLGf1H7MS2I+hdJ+yDMGVbwvS0jtbS2hlmGEaqb9RKjTFl9UBuxaxbsqVyQ==
X-Received: by 2002:a05:600c:154b:b0:441:ac58:ead5 with SMTP id 5b1f17b1804b1-442d6ddd0afmr168171445e9.31.1747123315062;
        Tue, 13 May 2025 01:01:55 -0700 (PDT)
Received: from skynet.lan (2a02-9142-4580-0400-0000-0000-0000-0008.red-2a02-914.customerbaf.ipv6.rima-tde.net. [2a02:9142:4580:400::8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd328f0fsm206510315e9.7.2025.05.13.01.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 01:01:54 -0700 (PDT)
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
Subject: [PATCH v2] mtd: rawnand: brcmnand: legacy exec_op implementation
Date: Tue, 13 May 2025 10:01:51 +0200
Message-Id: <20250513080151.565359-1-noltari@gmail.com>
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
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 160 ++++++++++++++++++++++-
 1 file changed, 154 insertions(+), 6 deletions(-)

 v2: multiple improvements:
  - Use proper native commands for checks.
  - Fix NAND_CMD_PARAM/NAND_CMD_RNDOUT addr calculation.
  - Remove host->last_addr usage.
  - Remove sector_size_1k since it only applies to v5.0+ controllers.
  - Remove brcmnand_wp since it doesn't exist for < v5.0 controllers.
  - Use j instead of i for flash_cache loop.

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 17f6d9723df9..2b519dfcac5d 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -2490,14 +2490,163 @@ static int brcmnand_op_is_reset(const struct nand_operation *op)
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
+	int cmd = CMD_NULL, last_cmd = CMD_NULL;
+	int ret = 0;
+	u64 last_addr;
+
+	for (i = 0; i < op->ninstrs; i++) {
+		instr = &op->instrs[i];
+
+		if (instr->type == NAND_OP_CMD_INSTR) {
+			if (instr->ctx.cmd.opcode == NAND_CMD_READID) {
+				cmd = CMD_DEVICE_ID_READ;
+			} else if (instr->ctx.cmd.opcode == NAND_CMD_READOOB) {
+				cmd = CMD_SPARE_AREA_READ;
+			} else if (instr->ctx.cmd.opcode == NAND_CMD_ERASE1) {
+				cmd = CMD_BLOCK_ERASE;
+			} else if (instr->ctx.cmd.opcode == NAND_CMD_ERASE2) {
+				cmd = CMD_NULL;
+			} else if (instr->ctx.cmd.opcode == NAND_CMD_PARAM) {
+				cmd = CMD_PARAMETER_READ;
+			} else if (instr->ctx.cmd.opcode == NAND_CMD_RNDOUT) {
+				cmd = CMD_PARAMETER_CHANGE_COL;
+			} else if (instr->ctx.cmd.opcode == NAND_CMD_RNDOUTSTART) {
+				cmd = CMD_NULL;
+			} else {
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
+			if (cmd == CMD_PARAMETER_CHANGE_COL)
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
+			} else if (last_cmd == CMD_SPARE_AREA_READ) {
+				for (j = 0; j < instr->ctx.data.len; j++)
+					in[j] = oob_reg_read(ctrl, j);
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
@@ -2525,11 +2674,10 @@ static int brcmnand_exec_op(struct nand_chip *chip,
 	if (op->deassert_wp)
 		brcmnand_wp(mtd, 0);
 
-	for (i = 0; i < op->ninstrs; i++) {
-		ret = brcmnand_exec_instr(host, i, op);
-		if (ret)
-			break;
-	}
+	if (ctrl->nand_version >= 0x500)
+		brcmnand_exec_instructions(chip, op);
+	else
+		brcmnand_exec_instructions_legacy(chip, op);
 
 	if (op->deassert_wp)
 		brcmnand_wp(mtd, 1);
-- 
2.39.5

