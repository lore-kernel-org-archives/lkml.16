Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0842C3597A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744012793; cv=none; b=ZumW3zL/H1TdfPcEOzEjh2cupetLAPWrBf/+r7Iec354z0QQ9+2Y684C0/wdhMYB9lRotwxPFdSlKYrDd16jV8Xwm6a5c3Bdb2ok74apuqi+MRRmODFmPzvIIfs1FJstoPd/OvrSchabnh13vYx9uaASMP8r5hRbp23Hdl5Xip0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744012793; c=relaxed/simple;
	bh=fGvzMoP8xL3O3EdSKYPzV0pTCk7PJyLucUIFI4nau+c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NSb/64+sSPX+Rc6oCchKUKbObcsZUz3GR6Krco6yjRI2nyIQoKaz6tdeWMg/w4WEMRuqsP/JWD293zfSinSZsKb6fVKRSkFj9yMnEJp/uRvIg+GXOjD/hFTMD698h6HtVsYEvzCsk9Fz2uosI5b55bYaKMBaqSSadf1gUu9NDDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KzzBa5sZ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KzzBa5sZ"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-224191d92e4so35453625ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 00:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744012791; x=1744617591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jHCGoqHBzpIdEU6c96dPPdkpFb/y3mZAbOJiJJ57gYo=;
        b=KzzBa5sZxLv3FP0hhHH/j+qPmMtXioIiHgT95VIt9GAyriv1xokc7uz22ZatA0zq/l
         IvYrGMOiCoBOCwQyKmRq/KwrOTzYXswmPUz+JlZ53kjU4k05uM8wNZ9zzadER4hWMGlX
         FwiIDkHStjZydayyNq1HroF19dxXDz1s1yF+4uxQSPJquus7bo9P2GwkWF0Z8XKTo+iD
         6H8IkEf/EzvUGzjW/JAxvnYYnDVRwRYP46tNfih6s7GSud2L7UvPEaVv0Wou8lsfFkkz
         78qgtENcUxiHQFWDuTJGPg0+DZ72rA5wZVbg4SK4F9KDkM5Oe5WEZeZHIo94tm39fDD5
         PAXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744012791; x=1744617591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jHCGoqHBzpIdEU6c96dPPdkpFb/y3mZAbOJiJJ57gYo=;
        b=K5hXlTLZlpn8AI1r6I9TMC/Q79gthdLCa+jK7x9KlNnQL5FKJaLzWk4gjUlCxv4uvB
         /zc2+wNb6tO9sxlr/B4In6MNjRQmj5+prEd8CmBZgU/6tb6t1CHwca1818zXRy2Ib3Rb
         CftASxLlBIQ4VXeL+9fXuY7CbtY2+d2eoFBdV88FYHWOgrMWIgA62xLLBgYMgS2P4tbQ
         qTEnyBVg1hjXERmG0J4bXzBfMNmRpvXAqUDRQHZnwKUTX86s5WfH6FFrTj9GTqNQH2SG
         MLwoDP9iUgmq11h7nnHApDxrQFfphca+kvL3vWapX5IM4pOors8q4+XO8iHsObmLNNBs
         JaOw==
X-Forwarded-Encrypted: i=1; AJvYcCXEqzlurD+TvF3BaXShrkEhHp2TQFjU+I8msjXKd2zX2cXHVKsBpqj432pdqGTWLnDPCL228LWulBrZMtI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCLZljQ3ISuvMo4c3juBXnG2l0HxC5fpJ1Ui3rUsMP7woLzRH5
	SBFFzXW8ajcZ4W9U9k2QJALuZMoSe7bzl816Gf5+PNPD7+JGWHZHGKVNpg==
X-Gm-Gg: ASbGncvQEWAyO9GJZqbXiyN7Hhah1gb9yEEnXRXc/18lc7MpRSGFLg+GXl3mi3SHXOc
	j+nuIn5TxkZH22LOeZLS47Z8RF9qGYqiSI3oWuDgfpdAAQh4RcUXAOlhB2WgxEEi61W4CU0AmpN
	k1zHLYWcaqWZRnzlUjLCqXOzyuuc4/Y49CGt02yyC45cb6JE72L8NIKOG+PwPIwd+KBWYqw2LYg
	jYrbAyD6RT0FQ41ZNF2vawjlRDvnbQM7fZRN5Qg44KIdihoL29EnYoLr9QeaEXtTY9FNQqy6oA9
	COlZBeObkjC0Uuv3A8dT6fuEL/KptepNVnbBP7MhEcYhTXNqfW8W6GLpeMqRuqxYp0D5
X-Google-Smtp-Source: AGHT+IGzyuInDZv9TFbIGdTJf3z2Mmyb5DI+ZYc2OErxs5yInuxDIM5hgs4/dF9aBoyig1PmN467Iw==
X-Received: by 2002:a17:903:32cb:b0:224:18bb:44c2 with SMTP id d9443c01a7336-22a8a045ff0mr131372215ad.6.1744012791242;
        Mon, 07 Apr 2025 00:59:51 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c0153sm74635035ad.65.2025.04.07.00.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:59:50 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 515A880580;
	Mon,  7 Apr 2025 16:08:47 +0800 (CST)
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
Subject: [PATCH v2 3/3] mtd: spi-nor: macronix: Add fixups for MX25L3255E
Date: Mon,  7 Apr 2025 15:54:00 +0800
Message-Id: <20250407075400.1113177-4-linchengming884@gmail.com>
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

SFDP of MX25L3255E is JESD216, which does not include the Quad
Enable bit Requirement in BFPT. As a result, during BFPT parsing,
the quad_enable method is not set to spi_nor_sr1_bit6_quad_enable.
Therefore, it is necessary to correct this setting by late_init.

In addition, MX25L3255E also supports 1-4-4 page program in 3-byte
address mode. However, since the 3-byte address 1-4-4 page program
is not defined in SFDP, it needs to be configured in late_init.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 drivers/mtd/spi-nor/macronix.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 07e0bd0b70a0..4bbd3b651cec 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -58,6 +58,31 @@ macronix_qpp4b_post_sfdp_fixups(struct spi_nor *nor)
 	return 0;
 }
 
+static int
+mx25l3255e_late_init_fixups(struct spi_nor *nor)
+{
+	/*
+	 * SFDP of MX25L3255E is JESD216, which does not include the Quad
+	 * Enable bit Requirement in BFPT. As a result, during BFPT parsing,
+	 * the quad_enable method is not set to spi_nor_sr1_bit6_quad_enable.
+	 * Therefore, it is necessary to correct this setting by late_init.
+	 */
+	nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
+
+	/*
+	 * In addition, MX25L3255E also supports 1-4-4 page program in 3-byte
+	 * address mode. However, since the 3-byte address 1-4-4 page program
+	 * is not defined in SFDP, it needs to be configured in late_init.
+	 */
+	struct spi_nor_flash_parameter *params = nor->params;
+
+	params->hwcaps.mask |= SNOR_HWCAPS_PP_1_4_4;
+	spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP_1_4_4],
+				SPINOR_OP_PP_1_4_4, SNOR_PROTO_1_4_4);
+
+	return 0;
+}
+
 static const struct spi_nor_fixups mx25l25635_fixups = {
 	.post_bfpt = mx25l25635_post_bfpt_fixups,
 	.post_sfdp = macronix_qpp4b_post_sfdp_fixups,
@@ -67,6 +92,10 @@ static const struct spi_nor_fixups macronix_qpp4b_fixups = {
 	.post_sfdp = macronix_qpp4b_post_sfdp_fixups,
 };
 
+static const struct spi_nor_fixups mx25l3255e_fixups = {
+	.late_init = mx25l3255e_late_init_fixups,
+};
+
 static const struct flash_info macronix_nor_parts[] = {
 	{
 		.id = SNOR_ID(0xc2, 0x20, 0x10),
@@ -199,6 +228,7 @@ static const struct flash_info macronix_nor_parts[] = {
 	}, {
 		/* MX25L3255E */
 		.id = SNOR_ID(0xc2, 0x9e, 0x16),
+		.fixups = &mx25l3255e_fixups,
 	},
 	/*
 	 * This spares us of adding new flash entries for flashes that can be
-- 
2.25.1

