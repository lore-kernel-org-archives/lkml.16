Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03AA3597A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744012787; cv=none; b=tHhXc81On9AEqK/sLFSzw2LBTQadxXKWzKinL/FqBVZd+lWoGp7S2RlSbcuDeVm2OneJkvBdt3XTPHBKq6yps0KJjJKr1P/Qy0GaUAPQTSUHjmmmRi7+L4oDtL+RwIeFafuP4GM4ekD8IDc7SI9/MGsAkdp/L1NwvE3YjQ7kgJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744012787; c=relaxed/simple;
	bh=yLuV725n3lQz2NrQVr/qxYbvJzJjzdDDHH5WO23MmUQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qtgYRz2i2YfSAjJI4rZYCDcV++Xq3amK6dpkVkTVM7YPYYEOrlrit+rqZ9EcNrocsnb7J/X3GEZhBfzjtjxx3dKJEaMMZnKzIg0qmTKDUk5bUHXYkoYIZhGCXlWliJSkKuKdvZYovb7xNzjAwY3R1wp9trU42xRM3LEAzWoNabo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=glC9N9HT; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="glC9N9HT"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ff6a98c638so4211552a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 00:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744012785; x=1744617585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rKgfji2rqot1arhvUVR/iUE/ECdfszR0SrwjOA4/joM=;
        b=glC9N9HTs2SoFv9E9Q0tG7ecX0p9kjwQuxbPMPy5QCPz+5UX6c0qRu15UoEoK5DYIj
         2bcTTEYNQzZOF1KVpK7hayDOaSTm7u97mMoI/gwoeLwE1m3p/FXBH8HBEzENUT2vm5Pb
         +g7e1tD7azHGC/09fXmzAKUl51EdsYZUvv/PHvIMQkacHvEhuQDOqHJJ0jCUDdQyzZaE
         JNZaI4cB6mCoPUNt0KjA9c6deSIGv3ykwHJt2WoCsFIdwLbbgx8y9AdQQLWOm0nGi23F
         1NTy9B7+4p0gqcbh3nX/6SL7NSWlttwJCoRQO5baPrRlhdOhDUkE3WvA3+8Aze9BSTOK
         Sm9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744012785; x=1744617585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rKgfji2rqot1arhvUVR/iUE/ECdfszR0SrwjOA4/joM=;
        b=U7+XNxK/GDm0VziurgmxqUdZ0ebqeMK+MWrqSBvG+Pti32Neak5xsuA42y+JSeHVdK
         QKVoPQQS1HmDXoCPIRkXhOFGFJjVLv5ONxLiY4SIaP3HzsHpaIjMqNCooVly/Gr2Zm+H
         eRucvGBI7EPuJLIEGgbD2UQYAik0yUtms9i6T/4Nt+qNT9xlxJbFcuxS4PEwqZ0WluTp
         lV0WzrghhBI7ogPfgMR/GDlR99cfBl7NqWGoYRCBtnh1ZGMErHg4WdHzP0/WD96SutNy
         9svW0mtr5lskYtepZrSjb28k7mFW4yMio72RFkxYcn78Fmc9ETm4PP5v3nYve+KebyW2
         QvJg==
X-Forwarded-Encrypted: i=1; AJvYcCXQru5MpyaKRA9+fUhemu+ETCjSg1kz7A1Fph2leHiI8o6Irx1S3PRtZr7MCcdpP+e6YTeAoP9uPo/KNcA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUkNcD62LR1kYqgBWRuFrmkc8iBNtt92Jx55kFh+Xo7awnXIt+
	cs8hPkNh/9uhrYzSX1s5NPmEBBTR3wUdsZTn+Usde840f8PZHZJe
X-Gm-Gg: ASbGnctZrxNtSbeD2BlmFVZ7dBjxdKTThwYLEXmPL2QLxdeyD2ATzFC8wy0pdlnCnQK
	iWzVXFYQPpff8+hkAgftFcVA1ZtHVb07+UxElqVCnabY1+djeDHn4xTR3LT/Ns9tjX0cBzCcr/l
	FC6XNRxCW3J25t90sAC9zW70m7k0tPlp7PPlqcH6CwDR3Rxs1G/uvTAIQp94J3O2PnkW9snDURb
	MZHRE+DYH0Rz866mG/LvJ4Ag/o8FaLP1y7thsNgifDIxMaPYQMKDxSfMlntzUeCnK2bsbJSx2zS
	2O9b5wzDmrliHkfIT/bc8qZLgynTdq9FId124crr7tECXnrHzS8do4d/s1MvCmx7wuQdbfOWrxD
	A+cU=
X-Google-Smtp-Source: AGHT+IGlJh8P3H38GXG6VRpz+tiQXJCTK4jw+vQ6e4XstEhWqYS/COON931etfe/4WWR1arjzuDFLg==
X-Received: by 2002:a17:90b:5251:b0:2ff:6167:e92d with SMTP id 98e67ed59e1d1-306a48b3f74mr14346421a91.32.1744012784917;
        Mon, 07 Apr 2025 00:59:44 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-305983db5f2sm8235805a91.48.2025.04.07.00.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:59:44 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 919A9801D7;
	Mon,  7 Apr 2025 16:08:41 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v2 1/3] mtd: spi-nor: macronix: Drop the redundant flash info fields
Date: Mon,  7 Apr 2025 15:53:58 +0800
Message-Id: <20250407075400.1113177-2-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250407075400.1113177-1-linchengming884@gmail.com>
References: <20250407075400.1113177-1-linchengming884@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

Many flash devices share the same ID but have different part numbers.
To avoid confusion, the part number field is removed.

Additionally, since SFDP already provides size information and
functionality covered by no_sfdp_flags, these fields are also removed.

Furthermore, when 4-byte address instruction table is available,
the SPI_NOR_4B_OPCODES flag is no longer needed and is removed.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/macronix.c | 36 +++++++++-------------------------
 1 file changed, 9 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 4b09e5add630..2acd8e28d1c4 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -88,10 +88,8 @@ static const struct flash_info macronix_nor_parts[] = {
 		.name = "mx25l8005",
 		.size = SZ_1M,
 	}, {
+		/* MX25L1606E */
 		.id = SNOR_ID(0xc2, 0x20, 0x15),
-		.name = "mx25l1606e",
-		.size = SZ_2M,
-		.no_sfdp_flags = SECT_4K,
 	}, {
 		.id = SNOR_ID(0xc2, 0x20, 0x16),
 		.name = "mx25l3205d",
@@ -103,29 +101,21 @@ static const struct flash_info macronix_nor_parts[] = {
 		.size = SZ_8M,
 		.no_sfdp_flags = SECT_4K,
 	}, {
+		/* MX25L12805D */
 		.id = SNOR_ID(0xc2, 0x20, 0x18),
-		.name = "mx25l12805d",
-		.size = SZ_16M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP,
-		.no_sfdp_flags = SECT_4K,
 	}, {
+		/* MX25L25635E, MX25L25645G */
 		.id = SNOR_ID(0xc2, 0x20, 0x19),
-		.name = "mx25l25635e",
-		.size = SZ_32M,
-		.no_sfdp_flags = SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.fixups = &mx25l25635_fixups
 	}, {
+		/* MX66L51235F */
 		.id = SNOR_ID(0xc2, 0x20, 0x1a),
-		.name = "mx66l51235f",
-		.size = SZ_64M,
-		.no_sfdp_flags = SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.fixup_flags = SPI_NOR_4B_OPCODES,
 		.fixups = &macronix_qpp4b_fixups,
 	}, {
+		/* MX66L1G45G */
 		.id = SNOR_ID(0xc2, 0x20, 0x1b),
-		.name = "mx66l1g45g",
-		.size = SZ_128M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.fixups = &macronix_qpp4b_fixups,
 	}, {
 		/* MX66L2G45G */
@@ -167,11 +157,8 @@ static const struct flash_info macronix_nor_parts[] = {
 		.size = SZ_16M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
+		/* MX25U51245G */
 		.id = SNOR_ID(0xc2, 0x25, 0x3a),
-		.name = "mx25u51245g",
-		.size = SZ_64M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-		.fixup_flags = SPI_NOR_4B_OPCODES,
 		.fixups = &macronix_qpp4b_fixups,
 	}, {
 		.id = SNOR_ID(0xc2, 0x25, 0x3a),
@@ -185,11 +172,8 @@ static const struct flash_info macronix_nor_parts[] = {
 		.id = SNOR_ID(0xc2, 0x25, 0x3b),
 		.fixups = &macronix_qpp4b_fixups,
 	}, {
+		/* MX66U2G45G */
 		.id = SNOR_ID(0xc2, 0x25, 0x3c),
-		.name = "mx66u2g45g",
-		.size = SZ_256M,
-		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
-		.fixup_flags = SPI_NOR_4B_OPCODES,
 		.fixups = &macronix_qpp4b_fixups,
 	}, {
 		.id = SNOR_ID(0xc2, 0x26, 0x18),
@@ -215,15 +199,13 @@ static const struct flash_info macronix_nor_parts[] = {
 		.size = SZ_4M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
+		/* MX25UW51245G */
 		.id = SNOR_ID(0xc2, 0x81, 0x3a),
-		.name = "mx25uw51245g",
 		.n_banks = 4,
 		.flags = SPI_NOR_RWW,
 	}, {
+		/* MX25L3255E */
 		.id = SNOR_ID(0xc2, 0x9e, 0x16),
-		.name = "mx25l3255e",
-		.size = SZ_4M,
-		.no_sfdp_flags = SECT_4K,
 	},
 	/*
 	 * This spares us of adding new flash entries for flashes that can be
-- 
2.25.1

