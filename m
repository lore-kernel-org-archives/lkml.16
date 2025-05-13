Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECE62556E
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 06:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747116673; cv=none; b=Di469Ji9etA+bMl8+2kLv+PMioUL+lVo52EUh4nmcPp0dzAFHxZ4xR/gmTDPvwzEYfoo7uLM+QkNvY8nfJMab4aRbiWYxyNMPN9XZPSwwzINvG4LbCgz+BDsUlMRj2Pxd123Z4t7EPgW6FJwcRbgBQOgf4byGrMVpdOf/cy05QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747116673; c=relaxed/simple;
	bh=AuyKC3qOychXuDAeIAHX0G5Bz7LqlYSbAFejuq0z97s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=qt2RLTDDpS0SbRGborv9oPN0zi1Odzo+py89XIPNBOnGTiyh8GHpn6pLf/yv5CA1KsMBtv5iuid61B+tlRd6mAsAstITpUc3nmn+kwEITr5f7vkQmXpsSJtst5Pcfyhr9WWHUqTNB0ChoAjeCJzc/55Odvd7WUdmnxB+di3J0dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E0aIGaER; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E0aIGaER"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a0b7fbdde7so4973489f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 23:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747116669; x=1747721469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qZ1ztaXbZmCcupyFU8aDO4tFwSr0/lqFrQA95vlhVAk=;
        b=E0aIGaERBH70Hv4QfaKNXqCPINeUcrMm/xx1z17RkA6alZE0IqJLEqctKBf6F1GEXu
         2JpJyjPnGQU0tolX7E0qOdji/WiesAQMLMcaCfL+MP89Gq+e41O31bs6YQ0Ow9+oxZGV
         E4MGfgdAifEhn24w1JVSegb99QW+F7LXeq5oUTa8CNxfjS5+RvNdA7Nqmw9GLDiVCFzf
         Y1l4jVlhZGDsCcoeYh3C2TIhT1UAA4Q4MmgCFJLkSR6eBNKJGMEsdud7SP5qDHL5H1Gr
         WX9egE1D1tTeyBVjzpyZQhfZzksIMllZFFZsDBd0+V614Zh51uVGfiUd5zkbyRZ/MfmQ
         x6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747116669; x=1747721469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qZ1ztaXbZmCcupyFU8aDO4tFwSr0/lqFrQA95vlhVAk=;
        b=eQibWon8NTjHVeTIbtv5s415bWW9MVm3gXzdZTXmbpxK6Ud+E94GAEynxlA8rzU+2h
         fLdHgjBMDmF2oNv3coYtRefonciYRB7fgJz575wgO7z55EsekIP9KcV+VE+HKuQqQc0G
         NAG7r9ob3nJHFlhctHhezKCIYo1pNX41vtDLVWQzdujpwZD1x0O/U5gwu21sc7uQM2QR
         YCqNxvtmq5Fnpsrp2WN/DbwkA1rKGh6zeLgugUybb9BCz+UgRkJhmPEn5L2dt85pJ1TU
         7RZB4d011X9DNJSiXqpAO32tIbIbka729yAdlruxyH+uKxi7KZi7jqZRO7bb25Ijfxaj
         aRDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdtIXzUgzDKdPW4FdHeWlvbWOgOFZ2/TnhUdZ0RbRmEur7HMVvZOMdcF2r8UoFqNVZaFvpur7R3T+N+gg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFsvzDW6jAV7Q/cmC+V6CzwinQBHbG3X8Efn6fVuaEeg85KOP0
	xo73gnWQ2VX/c0phHlBco0Q7chcUcPOhQSKuKK4YZUBOzfMpqNWJ
X-Gm-Gg: ASbGncv43bl8iLsQqGfVsBuK2GMkO2jK1j0fGhEAi0+HownhaKF83us7+ayEhZUoWvh
	fhOUOLs7xl8Qv4d5gqaXtgj/5/cR71x/XXU1KR7fzGLFfzOp7biD4Cd5V8PO52a2a+sWcAlqtv/
	2VoK+sqZoW/qR+P4hGXsOxOz3OCmx4dDAy1wLl4UYv2vPf7KNHo+eZVxykDg852GcIpRYlkJgba
	k/SkaikFe606qKb3C0q+D9DjtDsXRNJYbjeWE2aubFIp4QlWn3Ouc42IYAz9NXQqqGMElUBepKn
	CNp1wTJJtl/VY9O5riJsbNDJbWTmPf8lXedAb7v5XmL728wlf9TIc+yoZvwFB7myYVXal+Auz//
	6Q+6hBG7Jg4Pxig9tSC4vEEEA0i8mg0AOsErzBmHXaX7xN0uSUqg=
X-Google-Smtp-Source: AGHT+IHtLmNxRhJzVtEfa0YzN0wa/v4767LFxr1jVbK0LU6e1aqWmtNaLjdRNUu1pTd0oic5PbWAOQ==
X-Received: by 2002:a05:6000:2ce:b0:39a:c8a8:4fdc with SMTP id ffacd0b85a97d-3a1f6437880mr12578857f8f.16.1747116668665;
        Mon, 12 May 2025 23:11:08 -0700 (PDT)
Received: from skynet.lan (2a02-9142-4580-0400-0000-0000-0000-0008.red-2a02-914.customerbaf.ipv6.rima-tde.net. [2a02:9142:4580:400::8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57dde01sm15156220f8f.15.2025.05.12.23.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 23:11:08 -0700 (PDT)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: dregan@broadcom.com,
	florian.fainelli@broadcom.com,
	computersforpeace@gmail.com,
	kamal.dasu@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	jonas.gorski@gmail.com,
	dgcbueu@gmail.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
Subject: [PATCH] mtd: rawnand: brcmnand: remove unused parameters
Date: Tue, 13 May 2025 08:10:52 +0200
Message-Id: <20250513061052.547392-1-noltari@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

last_cmd and last_byte are now unused brcmnand_host members.
last_addr is only written and never read so we can remove it too.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 17f6d9723df9..5ef5d075a30c 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -310,9 +310,6 @@ struct brcmnand_host {
 	struct platform_device	*pdev;
 	int			cs;
 
-	unsigned int		last_cmd;
-	unsigned int		last_byte;
-	u64			last_addr;
 	struct brcmnand_cfg	hwcfg;
 	struct brcmnand_controller *ctrl;
 };
@@ -2237,10 +2234,8 @@ static int brcmnand_read_page(struct nand_chip *chip, uint8_t *buf,
 	u8 *oob = oob_required ? (u8 *)chip->oob_poi : NULL;
 	u64 addr = (u64)page << chip->page_shift;
 
-	host->last_addr = addr;
-
-	return brcmnand_read(mtd, chip, host->last_addr,
-			mtd->writesize >> FC_SHIFT, (u32 *)buf, oob);
+	return brcmnand_read(mtd, chip, addr, mtd->writesize >> FC_SHIFT,
+			     (u32 *)buf, oob);
 }
 
 static int brcmnand_read_page_raw(struct nand_chip *chip, uint8_t *buf,
@@ -2252,11 +2247,9 @@ static int brcmnand_read_page_raw(struct nand_chip *chip, uint8_t *buf,
 	int ret;
 	u64 addr = (u64)page << chip->page_shift;
 
-	host->last_addr = addr;
-
 	brcmnand_set_ecc_enabled(host, 0);
-	ret = brcmnand_read(mtd, chip, host->last_addr,
-			mtd->writesize >> FC_SHIFT, (u32 *)buf, oob);
+	ret = brcmnand_read(mtd, chip, addr, mtd->writesize >> FC_SHIFT,
+			    (u32 *)buf, oob);
 	brcmnand_set_ecc_enabled(host, 1);
 	return ret;
 }
@@ -2367,9 +2360,7 @@ static int brcmnand_write_page(struct nand_chip *chip, const uint8_t *buf,
 	void *oob = oob_required ? chip->oob_poi : NULL;
 	u64 addr = (u64)page << chip->page_shift;
 
-	host->last_addr = addr;
-
-	return brcmnand_write(mtd, chip, host->last_addr, (const u32 *)buf, oob);
+	return brcmnand_write(mtd, chip, addr, (const u32 *)buf, oob);
 }
 
 static int brcmnand_write_page_raw(struct nand_chip *chip, const uint8_t *buf,
@@ -2381,9 +2372,8 @@ static int brcmnand_write_page_raw(struct nand_chip *chip, const uint8_t *buf,
 	u64 addr = (u64)page << chip->page_shift;
 	int ret = 0;
 
-	host->last_addr = addr;
 	brcmnand_set_ecc_enabled(host, 0);
-	ret = brcmnand_write(mtd, chip, host->last_addr, (const u32 *)buf, oob);
+	ret = brcmnand_write(mtd, chip, addr, (const u32 *)buf, oob);
 	brcmnand_set_ecc_enabled(host, 1);
 
 	return ret;
-- 
2.39.5

