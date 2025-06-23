Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4043F25EF81;
	Mon, 23 Jun 2025 12:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750680115; cv=none; b=AaymrQy/jeQS037OMHBeMEpTQ0L5CJjnbg7og8I95tYKXEVXJeud1mrwMzDdLlCznME8wcA7kc9t8e7Qsk1S53/4dQmK9n6OzrgNEQ8FSOhmtAdv6NytJIyBpKQ7lT005uWg5F+p3JvlshOqmHqdRznt49RWXQNpb0WVrc3KHI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750680115; c=relaxed/simple;
	bh=RvKfNvTGbOQFn1QyzjQzGAKKfTfMoWOIXhrv2ucXpIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gjS9jGilTazlKmWGYAprmRKv7bdxnhxWBkxzDIeJpfx691uHnFs8TY0TLbuT9ZR7BT9g1YST8BvArnMBE/UDYfM1U14nn1I/8JaEATHzu+XHA6tTCg2D1RqhY4ytG6vjny8u2YnFSVGMdUZeJhHXyWZvbEW+fVSJOd1zLDYRGfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qrkE9vPK; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qrkE9vPK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680112;
	bh=RvKfNvTGbOQFn1QyzjQzGAKKfTfMoWOIXhrv2ucXpIg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qrkE9vPK0M2IJReSi0i2qt0L0EoPgLB4/3+dbFZL+B1YdmFvQgsZfngaKEQRVciNO
	 c7+Bq4CFDUSZzEZGj7cScl4v6lHwvPXULkTpp5Z0iyp0HdSbBSsyoydN1QE2A52eti
	 g/eYvTZfnBfzCP2WMuEnpVcPVSznVEzAZughxssuFaIz1lmZS8bmxQmzJJKsXLvjOj
	 qIhfarD3iEaPe/OqK+z11hGKXp6NdNY6KJEKuP7w9ZhAq1VZBMcjmZmeIZCh3r2T7I
	 tc6P9QCPamB9IO86/ZpGfIBlf5TLGCOrP2WtfP2RL6E0oOxQqCT+FDX3lQnaAOK8+9
	 T8K61Rcc0wa0w==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1E54117E156D;
	Mon, 23 Jun 2025 14:01:52 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lgirdwood@gmail.com
Cc: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 4/4] regulator: mtk-dvfsrc: Add support for MediaTek MT8196 DVFSRC
Date: Mon, 23 Jun 2025 14:01:44 +0200
Message-ID: <20250623120144.109359-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623120144.109359-1-angelogioacchino.delregno@collabora.com>
References: <20250623120144.109359-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MediaTek MT8196 Chromebook SoC features one DVFSRC regulator
with 6 voltage steps.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/regulator/mtk-dvfsrc-regulator.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/regulator/mtk-dvfsrc-regulator.c b/drivers/regulator/mtk-dvfsrc-regulator.c
index 5bc4d85517f0..c0c9a6751c26 100644
--- a/drivers/regulator/mtk-dvfsrc-regulator.c
+++ b/drivers/regulator/mtk-dvfsrc-regulator.c
@@ -166,6 +166,24 @@ static const struct dvfsrc_regulator_pdata mt8195_data = {
 	.size = ARRAY_SIZE(mt8195_regulators),
 };
 
+static const unsigned int mt8196_voltages[] = {
+	575000,
+	600000,
+	650000,
+	725000,
+	825000,
+	875000,
+};
+
+static const struct regulator_desc mt8196_regulators[] = {
+	MTK_DVFSRC_VREG("dvfsrc-vcore", VCORE, mt8196_voltages),
+};
+
+static const struct dvfsrc_regulator_pdata mt8196_data = {
+	.descs = mt8196_regulators,
+	.size = ARRAY_SIZE(mt8196_regulators),
+};
+
 static int dvfsrc_vcore_regulator_probe(struct platform_device *pdev)
 {
 	struct regulator_config config = { .dev = &pdev->dev };
@@ -195,6 +213,7 @@ static const struct of_device_id mtk_dvfsrc_regulator_match[] = {
 	{ .compatible = "mediatek,mt8183-dvfsrc-regulator", .data = &mt8183_data },
 	{ .compatible = "mediatek,mt8192-dvfsrc-regulator", .data = &mt6873_data },
 	{ .compatible = "mediatek,mt8195-dvfsrc-regulator", .data = &mt8195_data },
+	{ .compatible = "mediatek,mt8196-dvfsrc-regulator", .data = &mt8196_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mtk_dvfsrc_regulator_match);
-- 
2.49.0

