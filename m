Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD42290081;
	Thu, 10 Apr 2025 14:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744296031; cv=none; b=AwMdCAn9CC0ZUv3IjVlDwKNegl/55gvUsHRtzVaHS20gw4uKFgUo2jly8+Nc+HtYLcBCEexFE3GnP6yP2zllCx6ahN4eBgKt7q97/FdEtasYi3mEsL1+tQjReOTM117BMLtc6IibWRb8KBQYKxYYIrLSAHkK9LadFSLhkaVihWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744296031; c=relaxed/simple;
	bh=XxKeLRHlwE1CmqH6HuYvXfcg5rpJw5MzJrPdDxVNVGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BpVGNAs3PYwCqfKGT5VgLveCwJ5vlV82xvW0jgJu+9uy9XgnWusvlXttMu4c3Fy8HLK14KD9EqlYj3FMXm9iIIQ47e4Ke06v9YBYZWEM7Ze04vmFzGytiPVDuG+ybnh46PcnpftlMhn/BUvO08Zuug2pfYzvVihCc6wrb5ZHMRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=HzEEUW3L; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="HzEEUW3L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744296027;
	bh=XxKeLRHlwE1CmqH6HuYvXfcg5rpJw5MzJrPdDxVNVGg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HzEEUW3LFifmUEMYGfzCZANHSYeGJjQMSL9AQfPOwPpT4KQIrs+Q1V5m7onphBaeG
	 6d+SpFBRMIs6BXLRu6MZMmXi3WLIdHCuPml+hgRLx5LCdrQ/cMwCUGyhhxsoZJz/nh
	 NSr+lKCLSgKEcsbSK3vdtsvm5R8wZsiH8ve7m6RF/tGBsCnDYuphtro0FZKaRUnmoU
	 HrFiFA3eweYMwwvQ8Sl6NGJdVGFWQoKGcuVnzFMmd6AOn0djyuZXAyEb4y7yrhCGkS
	 l4Ll6JTOwzu1XPplnHAccvNozrIutDG96j8s4uZuBvP+8XlhybEvj4pTLQijX4h9Hm
	 zL5BrQFTDbQiQ==
Received: from IcarusMOD.eternityproject.eu (fi-19-199-243.service.infuturo.it [151.19.199.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9D9E517E1134;
	Thu, 10 Apr 2025 16:40:26 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	henryc.chen@mediatek.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 3/5] regulator: mtk-dvfsrc: Add support for Dimensity 1200 MT6893
Date: Thu, 10 Apr 2025 16:40:17 +0200
Message-ID: <20250410144019.475930-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410144019.475930-1-angelogioacchino.delregno@collabora.com>
References: <20250410144019.475930-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MediaTek Dimensity 1200 (MT6893) features the same DVFSRC
regulators as the other currently supported SoCs, but with a
different select value: add an array describing the possible
voltages for the VCORE and VSCP regulators, and assign it to
a new compatible for this SoC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/regulator/mtk-dvfsrc-regulator.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/regulator/mtk-dvfsrc-regulator.c b/drivers/regulator/mtk-dvfsrc-regulator.c
index f5662c569464..6c84bfe56872 100644
--- a/drivers/regulator/mtk-dvfsrc-regulator.c
+++ b/drivers/regulator/mtk-dvfsrc-regulator.c
@@ -117,6 +117,24 @@ static const struct dvfsrc_regulator_pdata mt6873_data = {
 	.size = ARRAY_SIZE(mt6873_regulators),
 };
 
+static const unsigned int mt6893_voltages[] = {
+	575000,
+	600000,
+	650000,
+	725000,
+	750000,
+};
+
+static const struct regulator_desc mt6893_regulators[] = {
+	MTK_DVFSRC_VREG("dvfsrc-vcore", VCORE, mt6893_voltages),
+	MTK_DVFSRC_VREG("dvfsrc-vscp", VSCP, mt6893_voltages),
+};
+
+static const struct dvfsrc_regulator_pdata mt6873_data = {
+	.descs = mt6873_regulators,
+	.size = ARRAY_SIZE(mt6873_regulators),
+};
+
 static const unsigned int mt8183_voltages[] = {
 	725000,
 	800000,
@@ -173,6 +191,7 @@ static int dvfsrc_vcore_regulator_probe(struct platform_device *pdev)
 
 static const struct of_device_id mtk_dvfsrc_regulator_match[] = {
 	{ .compatible = "mediatek,mt6873-dvfsrc-regulator", .data = &mt6873_data },
+	{ .compatible = "mediatek,mt6893-dvfsrc-regulator", .data = &mt6893_data },
 	{ .compatible = "mediatek,mt8183-dvfsrc-regulator", .data = &mt8183_data },
 	{ .compatible = "mediatek,mt8192-dvfsrc-regulator", .data = &mt6873_data },
 	{ .compatible = "mediatek,mt8195-dvfsrc-regulator", .data = &mt8195_data },
-- 
2.49.0

