Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83752900BD;
	Thu, 10 Apr 2025 14:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744296034; cv=none; b=OXjNbNTb3Mxqa3kpFci2DHKLMMTuWQM27bJGTggkwuVfYLfk5PNjdhRhPy8iIxB6P0oCiMPCdKRKcI6gwuLfaQ7HIJLjbpT3es0PdQXBN17/AjRWXpNIl+MutBeJu+tuKzHNL3PZKrZLEWB/u0Kd5k16JkZLC7828tdGn8psTxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744296034; c=relaxed/simple;
	bh=kqSJ93vK2S4mqV0ElW2RKyULJci/G30jK+JAfppUqTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cqB4ZR/AlmNX85ATEgRR9W1BGz20b3brBftLg4NqBLvWrEqbaZQJgUGQksX0QbG9syUhfDw1oVM3toeWafanN84h8BJb6ZVM+B+uTnesU8sGOerXv3Xrkop9JWE372uu7UjxxydmRvPocX58UAE131/SVX+VLcpkNdehn68oqJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZT/QaPsG; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZT/QaPsG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744296031;
	bh=kqSJ93vK2S4mqV0ElW2RKyULJci/G30jK+JAfppUqTA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZT/QaPsG4Fd/55L3wCh3wfRZTv3uf06znLWMLhAe+nvshFSt5X1jsusd//qD6iUO1
	 RSuRbBSVRDdj3XbXGhs2d/dysi2l2P9g2FNr/qNBBHYlp6y2su+xX9OvfESoLE/8rU
	 yNX66qQ3utbXRdpwKQ+wZ80X0ek/LkRbawO8g6lJZancmwEd5eb63V8+pwqm3/vaeD
	 1IC5QnsUK0+b6gvWX/meLc3y/pbVIKVnr5zq/TJ1IiVrs4OT+62IDioGGBMUSX25wN
	 rxa55xws+sm3XIqpVo/0GDoZ2clazWwnK6Gb4hH5BFIip8KS7V4rr4sEW2O1MqwIK0
	 jqD/RCGRUy9Ew==
Received: from IcarusMOD.eternityproject.eu (fi-19-199-243.service.infuturo.it [151.19.199.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9004F17E1072;
	Thu, 10 Apr 2025 16:40:29 +0200 (CEST)
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
Subject: [PATCH v1 5/5] soc: mediatek: mtk-dvfsrc: Add support for Dimensity 1200 MT6893
Date: Thu, 10 Apr 2025 16:40:19 +0200
Message-ID: <20250410144019.475930-6-angelogioacchino.delregno@collabora.com>
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

Add support for the MediaTek Dimensity 1200 (MT6893) SoC's DVFSRC
v2 hardware: the only difference between this and the only other
supported DVFSRCv2 SoC (MT8195) is the VCore-DRAM OPP array.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-dvfsrc.c | 40 +++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-dvfsrc.c b/drivers/soc/mediatek/mtk-dvfsrc.c
index 65c7d7bf743e..d24010b88c33 100644
--- a/drivers/soc/mediatek/mtk-dvfsrc.c
+++ b/drivers/soc/mediatek/mtk-dvfsrc.c
@@ -453,6 +453,45 @@ static const struct dvfsrc_bw_constraints dvfsrc_bw_constr_v2 = {
 	.max_dram_hrt_bw = 1023,
 };
 
+static const struct dvfsrc_opp dvfsrc_opp_mt6893_lp4[] = {
+	{ 0, 0 }, { 1, 0 }, { 2, 0 }, { 3, 0 },
+	{ 0, 1 }, { 1, 1 }, { 2, 1 }, { 3, 1 },
+	{ 0, 2 }, { 1, 2 }, { 2, 2 }, { 3, 2 },
+	{ 0, 3 }, { 1, 3 }, { 2, 3 }, { 3, 3 },
+	{ 1, 4 }, { 2, 4 }, { 3, 4 }, { 2, 5 },
+	{ 3, 5 }, { 3, 6 }, { 4, 6 }, { 4, 7 },
+};
+
+static const struct dvfsrc_opp_desc dvfsrc_opp_mt6893_desc[] = {
+	[0] = {
+		.opps = dvfsrc_opp_mt6893_lp4,
+		.num_opp = ARRAY_SIZE(dvfsrc_opp_mt6893_lp4),
+	}
+};
+
+static const struct dvfsrc_bw_constraints dvfsrc_bw_constr_mt6893 = {
+	.max_dram_nom_bw = 255,
+	.max_dram_peak_bw = 255,
+	.max_dram_hrt_bw = 1023,
+};
+
+static const struct dvfsrc_soc_data mt6893_data = {
+	.opps_desc = dvfsrc_opp_mt6893_desc,
+	.regs = dvfsrc_mt8195_regs,
+	.get_target_level = dvfsrc_get_target_level_v2,
+	.get_current_level = dvfsrc_get_current_level_v2,
+	.get_vcore_level = dvfsrc_get_vcore_level_v2,
+	.get_vscp_level = dvfsrc_get_vscp_level_v2,
+	.set_dram_bw = dvfsrc_set_dram_bw_v1,
+	.set_dram_peak_bw = dvfsrc_set_dram_peak_bw_v1,
+	.set_dram_hrt_bw = dvfsrc_set_dram_hrt_bw_v1,
+	.set_vcore_level = dvfsrc_set_vcore_level_v2,
+	.set_vscp_level = dvfsrc_set_vscp_level_v2,
+	.wait_for_opp_level = dvfsrc_wait_for_opp_level_v2,
+	.wait_for_vcore_level = dvfsrc_wait_for_vcore_level_v1,
+	.bw_constraints = &dvfsrc_bw_constr_v2,
+};
+
 static const struct dvfsrc_opp dvfsrc_opp_mt8183_lp4[] = {
 	{ 0, 0 }, { 0, 1 }, { 0, 2 }, { 1, 2 },
 };
@@ -530,6 +569,7 @@ static const struct dvfsrc_soc_data mt8195_data = {
 };
 
 static const struct of_device_id mtk_dvfsrc_of_match[] = {
+	{ .compatible = "mediatek,mt6893-dvfsrc", .data = &mt6893_data },
 	{ .compatible = "mediatek,mt8183-dvfsrc", .data = &mt8183_data },
 	{ .compatible = "mediatek,mt8195-dvfsrc", .data = &mt8195_data },
 	{ /* sentinel */ }
-- 
2.49.0

