Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AE328EA6E;
	Thu, 10 Apr 2025 14:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744296011; cv=none; b=UcPjlwmfmMhwppHri/kaL6zOKvHPgqRj58D3zZmWe/Ylt6l8vrK3/L5f0WVG1cFH9GPBT59a0qK5N6uuYckFkJajfOI3EK/xETZMJdA6a+QVtaHgb13axlPuW1Dzmf2u+K52jQh4iKNYb2sOk1jQv96UPQfbPZaEkfEIHUMnwyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744296011; c=relaxed/simple;
	bh=AXlTzRDz2wjfCyGPo9vypAYdNg73fFjgfs4xKUlTttg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rET3gVPr4+gDlUMkAEaO7uhtpZL0hPbHMoYlIx4lPXToo28TmnxQm7IYKQuF4DtNwgv+arHdKPKN4L09mKBz9fhROe8soHV7NUNy46Z7R1+T4bIebDVX/pS2ttsXxgQLznEutGlT8Ef1y9mbkgtJTSgeh/iP3hVINTAd848EkWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SwfTnkxX; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SwfTnkxX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744296007;
	bh=AXlTzRDz2wjfCyGPo9vypAYdNg73fFjgfs4xKUlTttg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SwfTnkxXVNlAcyI2UVCoOL8p+olNimlKAvI5W2A1zu8GsNsgY+Ws2+W/RA3YLJVgm
	 RiJh2kI6m/pHClLIvlLnZrxCDOTIAIWvERxRC/8ODrnOXVU5y53I0/om6RkFe51WB1
	 BIb8+RnSpAd2hUCiLZmmF4KQS9w0Q4N+G1ko+yyDk+jTxdSUpK7561Ach6fO4AQs5f
	 6p+Cm+o6ktJOOHwQGfcXX7WMWz1c7LdxhcNZAC9JEdTmq3BH1lo9tm/CiPxEwNhg97
	 520T6voCM3xphsTMgYTdL/DgIIfBrc8NfmG7ObtoskcnpbCgB6ZqtZ+QVuNdTznrvB
	 7IRtYeYrCwclg==
Received: from IcarusMOD.eternityproject.eu (fi-19-199-243.service.infuturo.it [151.19.199.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7E4BA17E0C8D;
	Thu, 10 Apr 2025 16:40:05 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: yong.wu@mediatek.com
Cc: krzk@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 2/2] memory: mtk-smi: Add support for Dimensity 1200 MT6893 SMI
Date: Thu, 10 Apr 2025 16:39:58 +0200
Message-ID: <20250410143958.475846-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410143958.475846-1-angelogioacchino.delregno@collabora.com>
References: <20250410143958.475846-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the necessary platform data to enable support for the SMI
found on the MediaTek Dimensity 1200 (MT6893) SoC

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/memory/mtk-smi.c | 52 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index a8f5467d6b31..526ff6c3474f 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -283,6 +283,43 @@ static int mtk_smi_larb_config_port_gen2_general(struct device *dev)
 	return 0;
 }
 
+static const u8 mtk_smi_larb_mt6893_ostd[][SMI_LARB_PORT_NR_MAX] = {
+	[0] = {0x2, 0x6, 0x2, 0x2, 0x2, 0x28, 0x18, 0x18, 0x1, 0x1, 0x1, 0x8,
+	       0x8, 0x1, 0x3f},
+	[1] = {0x2, 0x6, 0x2, 0x2, 0x2, 0x28, 0x18, 0x18, 0x1, 0x1, 0x1, 0x8,
+	       0x8, 0x1, 0x3f},
+	[2] = {0x5, 0x5, 0x5, 0x5, 0x1, 0x3f},
+	[3] = {0x5, 0x5, 0x5, 0x5, 0x1, 0x3f},
+	[4] = {0x28, 0x19, 0xb, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x4, 0x1},
+	[5] = {0x1, 0x1, 0x4, 0x1, 0x1, 0x1, 0x1, 0x16},
+	[6] = {},
+	[7] = {0x1, 0x4, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x4, 0x4, 0x1,
+	       0x4, 0x1, 0xa, 0x6, 0x1, 0xa, 0x6, 0x1, 0x1, 0x1, 0x1, 0x5,
+	       0x3, 0x3, 0x4},
+	[8] = {0x1, 0x4, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x4, 0x4, 0x1,
+	       0x4, 0x1, 0xa, 0x6, 0x1, 0xa, 0x6, 0x1, 0x1, 0x1, 0x1, 0x5,
+	       0x3, 0x3, 0x4},
+	[9] = {0x9, 0x7, 0xf, 0x8, 0x1, 0x8, 0x9, 0x3, 0x3, 0x6, 0x7, 0x4,
+	       0x9, 0x3, 0x4, 0xe, 0x1, 0x7, 0x8, 0x7, 0x7, 0x1, 0x6, 0x2,
+	       0xf, 0x8, 0x1, 0x1, 0x1},
+	[10] = {},
+	[11] = {0x9, 0x7, 0xf, 0x8, 0x1, 0x8, 0x9, 0x3, 0x3, 0x6, 0x7, 0x4,
+		0x9, 0x3, 0x4, 0xe, 0x1, 0x7, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1,
+		0x1, 0x1, 0x1, 0x1, 0x1},
+	[12] = {},
+	[13] = {0x2, 0xc, 0xc, 0xe, 0x6, 0x6, 0x6, 0x6, 0x6, 0x12, 0x6, 0x1},
+	[14] = {0x2, 0xc, 0xc, 0x28, 0x12, 0x6},
+	[15] = {0x28, 0x1, 0x2, 0x28, 0x1},
+	[16] = {0x28, 0x14, 0x2, 0xc, 0x18, 0x2, 0x14, 0x14, 0x4, 0x4, 0x4, 0x2,
+		0x4, 0x2, 0x8, 0x4, 0x4},
+	[17] = {0x28, 0x14, 0x2, 0xc, 0x18, 0x2, 0x14, 0x14, 0x4, 0x4, 0x4, 0x2,
+		0x4, 0x2, 0x8, 0x4, 0x4},
+	[18] = {0x28, 0x14, 0x2, 0xc, 0x18, 0x2, 0x14, 0x14, 0x4, 0x4, 0x4, 0x2,
+		0x4, 0x2, 0x8, 0x4, 0x4},
+	[19] = {0x2, 0x2, 0x4, 0x2},
+	[20] = {0x9, 0x9, 0x5, 0x5, 0x1, 0x1},
+};
+
 static const u8 mtk_smi_larb_mt8188_ostd[][SMI_LARB_PORT_NR_MAX] = {
 	[0] = {0x02, 0x18, 0x22, 0x22, 0x01, 0x02, 0x0a,},
 	[1] = {0x12, 0x02, 0x14, 0x14, 0x01, 0x18, 0x0a,},
@@ -429,6 +466,12 @@ static const struct mtk_smi_larb_gen mtk_smi_larb_mt6779 = {
 		/* DUMMY | IPU0 | IPU1 | CCU | MDLA */
 };
 
+static const struct mtk_smi_larb_gen mtk_smi_larb_mt6893 = {
+	.config_port                = mtk_smi_larb_config_port_gen2_general,
+	.flags_general	            = MTK_SMI_FLAG_THRT_UPDATE | MTK_SMI_FLAG_SW_FLAG,
+	.ostd		            = mtk_smi_larb_mt6893_ostd,
+};
+
 static const struct mtk_smi_larb_gen mtk_smi_larb_mt8167 = {
 	/* mt8167 do not need the port in larb */
 	.config_port = mtk_smi_larb_config_port_mt8167,
@@ -474,6 +517,7 @@ static const struct of_device_id mtk_smi_larb_of_ids[] = {
 	{.compatible = "mediatek,mt2712-smi-larb", .data = &mtk_smi_larb_mt2712},
 	{.compatible = "mediatek,mt6779-smi-larb", .data = &mtk_smi_larb_mt6779},
 	{.compatible = "mediatek,mt6795-smi-larb", .data = &mtk_smi_larb_mt8173},
+	{.compatible = "mediatek,mt6893-smi-larb", .data = &mtk_smi_larb_mt6893},
 	{.compatible = "mediatek,mt8167-smi-larb", .data = &mtk_smi_larb_mt8167},
 	{.compatible = "mediatek,mt8173-smi-larb", .data = &mtk_smi_larb_mt8173},
 	{.compatible = "mediatek,mt8183-smi-larb", .data = &mtk_smi_larb_mt8183},
@@ -694,6 +738,13 @@ static const struct mtk_smi_common_plat mtk_smi_common_mt6795 = {
 	.init     = mtk_smi_common_mt6795_init,
 };
 
+static const struct mtk_smi_common_plat mtk_smi_common_mt6893 = {
+	.type     = MTK_SMI_GEN2,
+	.has_gals = true,
+	.bus_sel  = F_MMU1_LARB(1) | F_MMU1_LARB(2) | F_MMU1_LARB(4) |
+		    F_MMU1_LARB(5) | F_MMU1_LARB(7),
+};
+
 static const struct mtk_smi_common_plat mtk_smi_common_mt8183 = {
 	.type     = MTK_SMI_GEN2,
 	.has_gals = true,
@@ -756,6 +807,7 @@ static const struct of_device_id mtk_smi_common_of_ids[] = {
 	{.compatible = "mediatek,mt2712-smi-common", .data = &mtk_smi_common_gen2},
 	{.compatible = "mediatek,mt6779-smi-common", .data = &mtk_smi_common_mt6779},
 	{.compatible = "mediatek,mt6795-smi-common", .data = &mtk_smi_common_mt6795},
+	{.compatible = "mediatek,mt6893-smi-common", .data = &mtk_smi_common_mt6893},
 	{.compatible = "mediatek,mt8167-smi-common", .data = &mtk_smi_common_gen2},
 	{.compatible = "mediatek,mt8173-smi-common", .data = &mtk_smi_common_gen2},
 	{.compatible = "mediatek,mt8183-smi-common", .data = &mtk_smi_common_mt8183},
-- 
2.49.0

