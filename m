Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710A81AAA11
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 08:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738916576; cv=none; b=tWknQx+X4dpzeScFMlcUx2FQNBIwS1VW5N9l+vSbIefQYXYE/GUBkFC+Qt04673RkCYVDq1KBhqZj0x2l0t2maVtF8An0IBQ3ryYwc3AmHURVRDWBYRBT3rZUKAsygZUV8glLNpAzFrjSFZueMfSWsCY3oLrzpyrvP0jL2OKL78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738916576; c=relaxed/simple;
	bh=jbOSei2/Mdg2pxww+2EB2MDkpjFLBi7KGrpBEj+dEcU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dGmNBMvqCeqYLtHJE+JV576+IEz1eWuD0VRE3VWJHGY8oJWRTMR4Lh+tLCoZDag++lPzyz+TjSCfcO93ax5etehba81Khm+9mKQeAwEA7HQBRaRQegTlW+TJ8y6Fv0Hd8Wn4supDf2t95cRbV+AVtqfH397B684xBtoZ9iE0nOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MRQtk/rn; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MRQtk/rn"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21f2cfd821eso32566405ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 00:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738916575; x=1739521375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/E9wvz8/vddvY3iiHd9apEkjBGgx41rPnXOMKqGyg0=;
        b=MRQtk/rnJuSZEQF//N1VWylnWGTRyvHBGZXCbqsV9tJFCII29D9LBjpzh+NxmvT5ee
         o+JhF1RQGDz4BsK6KJliirJCV2uKgWzH76FmnFIjMDHbnDXZd8r6OgkTHeEh+6tALW6o
         tsbjpQVPrcbzsFE/UlJHApgGWArqTrnZmeRL34CzHY5sXUyrHxzfetM5ls38o81ZYj9d
         ajMcp/nrmrN+89qePr9IiPMvhHUlJqShcz4xH6XRtcKJ+MFWgAADRoy8Of+wxVm8jqfE
         eKSMLjbXpqKZ0BdLRay87ZSQwH1wZ9kV3QMsVG8FZmn013A52OQnqAAEsehZ6zJNMkCn
         8I1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738916575; x=1739521375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f/E9wvz8/vddvY3iiHd9apEkjBGgx41rPnXOMKqGyg0=;
        b=K+u2qsNoT0SAxJ6sthSvit1Obf5EhxknvIsipguSMCVO4TuUpdI9JeuxE0i3QecSHe
         d9RMr379lbCzUlPgf4qLwo8VfHFlzQpXTLQQGnatUVc6zcEOQOZnt7GuwWTlh20Q+0Zz
         46URRAIf+l+DOZ4uG1f3nV8IKnMZBuLZpgmq+UZ2NRbKqRLJ7lLfQiSuBhMa+VPIcKMl
         7xplFHuazVq/0J/7jDVWssMkkUNgIpYRAuJGhuWTjvBgMaQ2DvD8HgdOai/lllvCaIqz
         GRyIGWIqb5/X0MPV+q0rVEEKK8Idi4gVSz0G3sAwrJ9t8E2KQ+MAPaurcf7wpBKRarK4
         ZBMg==
X-Forwarded-Encrypted: i=1; AJvYcCVNb+Zavu6vfPC+k7jUYjPNrGvC3bxhRDAlsvDvV+eyvLc7sEC5O8GcaP05QF8PyoyxyFzLpE9NX4uXJng=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcfbKjNILxvRU0pVN3lEx4ROmv3zDjuy7kk/e6ijxuCb2GfWaG
	Uw4wnkWz9II4jC6xYJN7lOpDyxesmgmYvq/wvWSt1PRwSu92riyD
X-Gm-Gg: ASbGnctFwFOSjOpZqNNvzyrGBAmoUm6sVHYBvu31RQ5PzuIiv1kqnKOx7yyBlgP/rlc
	PhnnCX3hRW7ozT1aIKoRn4kuIfvd4De8OupGZ1I+Z32wbez3Oe6pg3nD7EuuZRclejCHj+qDbnY
	1wpaRhRZXTtzhpXmSArDoyd57qM/9Iyi73J1O84KJu7tev5AXu1D2iMur9Mr2OAr6Te4bP34Vu+
	5WWPKFwN8/IM1r596ONhp3fUh0VwTMdxim7tZqIV/KHPnb+IDD+29X8OkXVUDQKT5okNdZuIYOu
	W8ZUv6MK3cNz1ErGjKeUvnvJ4rhxmRXwnEFuGnU=
X-Google-Smtp-Source: AGHT+IEuiQOl0O5y5F2rid9jIYT+/Bs5UbyEGc1FgRz4zT7d8tiNKjaPQtF28kM++aczoT1+6O2YDA==
X-Received: by 2002:a05:6a21:9184:b0:1dc:e8d:c8f0 with SMTP id adf61e73a8af0-1ee03b3e6a8mr4963912637.29.1738916574931;
        Fri, 07 Feb 2025 00:22:54 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048a9d1aesm2475473b3a.3.2025.02.07.00.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 00:22:54 -0800 (PST)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 160A38085A;
	Fri,  7 Feb 2025 16:33:30 +0800 (CST)
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
Subject: [PATCH 1/2] mtd: spi-nor: macronix: Add post_sfdp fixups for Quad Input Page Program
Date: Fri,  7 Feb 2025 16:18:45 +0800
Message-Id: <20250207081846.362919-2-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250207081846.362919-1-linchengming884@gmail.com>
References: <20250207081846.362919-1-linchengming884@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

Although certain Macronix NOR flash support the Quad Input Page Program
feature, the corresponding information in the 4-byte Address Instruction
Table of these flash is not properly filled. As a result, this feature
cannot be enabled as expected.

To address this issue, a post_sfdp fixups implementation is required to
correct the missing information.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 drivers/mtd/spi-nor/macronix.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 830da21eea08..ada17999ccbb 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -45,8 +45,26 @@ mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
 	return 0;
 }
 
+static int
+macronix_qpp4b_post_sfdp_fixups(struct spi_nor *nor)
+{
+	/* PP_1_1_4_4B is supported but missing in 4BAIT. */
+	struct spi_nor_flash_parameter *params = nor->params;
+
+	params->hwcaps.mask |= SNOR_HWCAPS_PP_1_1_4;
+	spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP_1_1_4],
+			SPINOR_OP_PP_1_1_4_4B, SNOR_PROTO_1_1_4);
+
+	return 0;
+}
+
 static const struct spi_nor_fixups mx25l25635_fixups = {
 	.post_bfpt = mx25l25635_post_bfpt_fixups,
+	.post_sfdp = macronix_qpp4b_post_sfdp_fixups,
+};
+
+static const struct spi_nor_fixups macronix_qpp4b_fixups = {
+	.post_sfdp = macronix_qpp4b_post_sfdp_fixups,
 };
 
 static const struct flash_info macronix_nor_parts[] = {
@@ -102,11 +120,13 @@ static const struct flash_info macronix_nor_parts[] = {
 		.size = SZ_64M,
 		.no_sfdp_flags = SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.fixup_flags = SPI_NOR_4B_OPCODES,
+		.fixups = &macronix_qpp4b_fixups,
 	}, {
 		.id = SNOR_ID(0xc2, 0x20, 0x1b),
 		.name = "mx66l1g45g",
 		.size = SZ_128M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixups = &macronix_qpp4b_fixups,
 	}, {
 		.id = SNOR_ID(0xc2, 0x23, 0x14),
 		.name = "mx25v8035f",
@@ -154,18 +174,21 @@ static const struct flash_info macronix_nor_parts[] = {
 		.size = SZ_64M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.fixup_flags = SPI_NOR_4B_OPCODES,
+		.fixups = &macronix_qpp4b_fixups,
 	}, {
 		.id = SNOR_ID(0xc2, 0x25, 0x3a),
 		.name = "mx66u51235f",
 		.size = SZ_64M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.fixup_flags = SPI_NOR_4B_OPCODES,
+		.fixups = &macronix_qpp4b_fixups,
 	}, {
 		.id = SNOR_ID(0xc2, 0x25, 0x3c),
 		.name = "mx66u2g45g",
 		.size = SZ_256M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.fixup_flags = SPI_NOR_4B_OPCODES,
+		.fixups = &macronix_qpp4b_fixups,
 	}, {
 		.id = SNOR_ID(0xc2, 0x26, 0x18),
 		.name = "mx25l12855e",
-- 
2.25.1

