Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCC923C4EA
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 16:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747066958; cv=none; b=UbiUdgqtj4kNeVG/mrr5cqLB3tZcEC9vwYs3mjvcF5vTrNbGnPAO4HSxCI4sSXkCUVgq3CL1xI0feIWBE5WA8fDS1nZNIdF/zN+inrcpGnrCmSfgA/EM2HPO+zRUWitjex4Ogeh3/dvC55BDgr62cX+g+ZKswNkcEGASo7J1Vt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747066958; c=relaxed/simple;
	bh=9PWx0uF4YC+E2j2VCSR2TrfDveDwhpSOtaOvyu92PQ0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=nOw19bNVp3tEtZbHkhyP2HRJt1iJN0kSqdrQivb/M7THD9mk1EhgX8ehQj248zNpw1NxhBT+thTQo050nnvN4AeXuumXN23V7tgCIj1QbLdz1pcbLEhpva1YPsv6+udlbzsZHy3Z4aRvrW7MQo1ou9SR0OMInvfbYJbFmYYDwNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V7PcbSsw; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V7PcbSsw"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf848528aso40608465e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 09:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747066954; x=1747671754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=469LQ0cOaa76vTQtARrjWciurSdyNkBmdKmtDRwhs4s=;
        b=V7PcbSsw0kNnkSNGyAQdnEEvWk5clO6CjoCUW4mdpAMQBSl9iPp8c/ced9wetPEjjW
         jjA7TJ2EjnBLuDY2CATDeQuZZNjZZelZ96CDGA1bOHXLzEhiMSJ7kPBG2NM/zCZa7/zC
         6DPwoLfdt5T8lC244CktRN2edih1fXHzoNZn+wz2T5JZ2aoBMmUahckq6Spdij8rXUTJ
         A9lZPmlUF8Vilj4XQbzGiV9JvEjDFrYEPGz5wbhFMD9++pieKQdI097oiWlrPemG/Gnd
         ZAn95PzX5Cw86s8QhHYl0a/jOB4z+QHwxP1WeFfZyuT08Jfr3FMhCxfzA2OwMHKHCSGH
         sSdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747066954; x=1747671754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=469LQ0cOaa76vTQtARrjWciurSdyNkBmdKmtDRwhs4s=;
        b=ncV3OZhI/ozB+w+4cy5RrOeAT6wQiMI+ymhkr7h+bTM9iWRIRIFEbG+TynEApambu7
         bNUOc5nu1vKBIJq66spFPuisnaspP0DU1/rqOHVjjQ0t7jfbsnMEFUgcq3+JNy3MTjBU
         /MYWXZkdll3z09trr+GTCKtCMfeHKY4q113V8OKTuclKYnEPb4vDdg3/XBkcUwLEOKea
         7ryzNitdX+Ysxbb5ODhQbhwTQ1JVKDLHQQrqxTIOz6qMs7K8wxfC+dPLL/MOoqy8zxYR
         lVPGry4sZicyUmi+33jjZagyfn/qjT56xGrGaPR581MsbWzsrgCTmLfZU9rSg7mdmPzF
         UfNw==
X-Forwarded-Encrypted: i=1; AJvYcCXhVQlwt/EtFpECTMTWt4JN7oUSJQUBYeJyv4JEuWOcNMqAGstPlJcNEpFdNWqQ/crRFj1cDvA3WefPcPQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7dMgh8yFASloWLjoTC73TaYGikGFNUTvWn7Gh2YHaL36gTnFU
	yOOwM5j1SPf20kWopB7orp5t4sE1+U2I6AzS6MX9o7N1/vQLc9f6
X-Gm-Gg: ASbGncvTX3RNg7oY+JtGPF/2ApbUAgcXTQFRo3yxqsxDM4rjl1G41R101oFZUXefUXK
	PYWVFIyTYGT+K+V95a4ZiAjK9wfvrN+iiXDBldARyOiOTlRxiCWFvRVn2mv59XzGueTw2Cxnjw/
	hYTW95PLeHFJy4pWal7FIAkzogko+KBFmyW6LTI9D+aNpCTLfSn42oIcLPliDyDLZRxmSZsuVg7
	c4J+N94RYqUoPcKylUkIA7ia/mx5sUgHHJN3Pxx6idiEVofueCICZnD3eh5ONGGLK4s9BjG7xfB
	YowQMkd5A4iXb/b7XO9NtffTPdkB3+KHnNc7iZkfuy/MD43QLmX8kTI4yjoAC6LPwf37i4vxWMW
	quNPJQh+1AOP75O8EUFCsHY65Y1TDfas+FHIn9nQ9p8UTacEZgCs=
X-Google-Smtp-Source: AGHT+IG0jZmkIPBVdcJwRfpYILK6n5e0sSPQwvN8CdyuzUpKfWnACaJDB+gpYfLrqi4bV5mh2BZPQQ==
X-Received: by 2002:a05:600c:46d3:b0:43c:f470:7605 with SMTP id 5b1f17b1804b1-442d6d377f0mr139532545e9.12.1747066954318;
        Mon, 12 May 2025 09:22:34 -0700 (PDT)
Received: from skynet.lan (2a02-9142-4580-0400-0000-0000-0000-0008.red-2a02-914.customerbaf.ipv6.rima-tde.net. [2a02:9142:4580:400::8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57dde27sm13228032f8f.17.2025.05.12.09.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 09:22:33 -0700 (PDT)
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
Subject: [PATCH] mtd: rawnand: brcmnand: legacy exec_op implementation
Date: Mon, 12 May 2025 18:22:26 +0200
Message-Id: <20250512162226.415154-1-noltari@gmail.com>
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
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 174 ++++++++++++++++++++++-
 1 file changed, 168 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 17f6d9723df9..919e322189d5 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -2490,14 +2490,177 @@ static int brcmnand_op_is_reset(const struct nand_operation *op)
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
+				brcmnand_wp(mtd, 0);
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
+			if (cmd == CMD_PARAMETER_CHANGE_COL) {
+				addr &= ~((u64)(FC_BYTES - 1));
+
+				if (brcmnand_get_sector_size_1k(host)) {
+					host->hwcfg.sector_size_1k =
+						brcmnand_get_sector_size_1k(host);
+					brcmnand_set_sector_size_1k(host, 0);
+				}
+			}
+
+			host->last_addr = addr;
+
+			brcmnand_set_cmd_addr(mtd, addr);
+			brcmnand_send_cmd(host, cmd);
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
+				for (i = 0; i < FC_WORDS; i++)
+					/*
+					 * Flash cache is big endian for parameter pages, at
+					 * least on STB SoCs
+					 */
+					flash_cache[i] = be32_to_cpu(brcmnand_read_fc(ctrl, i));
+
+				brcmnand_soc_data_bus_unprepare(ctrl->soc, true);
+
+				/* Cleanup from HW quirk: restore SECTOR_SIZE_1K */
+				if (host->hwcfg.sector_size_1k)
+					brcmnand_set_sector_size_1k(host,
+								    host->hwcfg.sector_size_1k);
+			} else if (last_cmd == NAND_CMD_ERASE1) {
+				brcmnand_wp(mtd, 1);
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
+			} else if (last_cmd == NAND_CMD_PARAM || last_cmd == NAND_CMD_RNDOUT) {
+				u64 addr;
+				u32 offs;
+
+				for (j = 0; j < instr->ctx.data.len; j++) {
+					addr = host->last_addr = j;
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
@@ -2525,11 +2688,10 @@ static int brcmnand_exec_op(struct nand_chip *chip,
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

