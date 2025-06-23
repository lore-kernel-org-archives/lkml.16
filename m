Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8D3256C83;
	Mon, 23 Jun 2025 12:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750680058; cv=none; b=UeXxtICJSXe50FPbxefJ3XADVZRQWh4gnaONMA5RaYjcM/mmSAPIucxM+1cCoGpWjyENW1hz3YOhfuGjz/Z5Rn7v+N/1HgMP7qbu/StYoIoUWldHkFZKl3WxZeyO/HUrFS3rBFHFlT78Q/zw0wrn6UgD+dxnWpWdJbJBPmHujZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750680058; c=relaxed/simple;
	bh=ynNjCYWY9OpY9ODTpNTte5w8auGVt0pVguNPVv+omyg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XXqiMLa+8PxjGHLr70T2U9Oq8ljOI/g1h+tk+eWPEapapimNIRO1JCc0dpA2VdLwYLufA43SVoRkY8GLCayXs807s/QanJco0S/ntpiP7zg7SwYDKf6+mFLO2nQSn7mJzQ+q1PqDDnUKUsCeLSNTPRVzoRn+NQiY2TyEVHJe388=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=j1CsyIVi; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="j1CsyIVi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680055;
	bh=ynNjCYWY9OpY9ODTpNTte5w8auGVt0pVguNPVv+omyg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j1CsyIVi8GkACgQWt4etOQ6+2ZM59CLWcjCwtsjqc6aYtESU+UTJYdZ7KCquEZ+tP
	 LQ70CnzSstnsvQWWTCR19wiLb3HhiruYlKMrbwfopokkLIR7hw9PGzvv1AokKclvWZ
	 piB9ubabBIeJewMJXHK2SkyzlLJlIG+FyzVXYiAwPYtxkjM11wlC10F9dLt9sfYx7X
	 N6kOqybP+V7OwvppH88qsLwLlz/+zm6hvWC8T8jJZ0YJq6YI78FUj51Qa8y8SrG3YY
	 c5oLkEulVi0Us1UX25x9J7G9xSoL+y6FLCzoSrVUQqPLCxmGzIxfUHgTLGu6Xs1ina
	 5koqsw5zldT0A==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 16F1F17E156E;
	Mon, 23 Jun 2025 14:00:55 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sboyd@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	hsin-hsiung.wang@mediatek.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 5/5] spmi: mtk-pmif: Add support for MT8196 SPMI Controller
Date: Mon, 23 Jun 2025 14:00:47 +0200
Message-ID: <20250623120047.108961-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623120047.108961-1-angelogioacchino.delregno@collabora.com>
References: <20250623120047.108961-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the SPMI controller found in the MT8196 SoC:
this supports SPMI 2.0 and features two SPMI buses.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/spmi/spmi-mtk-pmif.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/spmi/spmi-mtk-pmif.c b/drivers/spmi/spmi-mtk-pmif.c
index ad7b0cc9cdaa..719753651234 100644
--- a/drivers/spmi/spmi-mtk-pmif.c
+++ b/drivers/spmi/spmi-mtk-pmif.c
@@ -636,6 +636,14 @@ static const struct pmif_data mt8195_pmif_arb = {
 	.soc_chan = 2,
 };
 
+static const struct pmif_data mt8196_pmif_arb = {
+	.regs = mt8195_regs,
+	.spmimst_regs = mt8195_spmi_regs,
+	.soc_chan = 2,
+	.spmi_ver = 2,
+	.num_spmi_buses = 2,
+};
+
 static int mtk_spmi_irq_init(struct device_node *node,
 			     const struct pmif_data *pdata,
 			     struct pmif_bus *pbus)
@@ -834,6 +842,9 @@ static const struct of_device_id mtk_spmi_match_table[] = {
 	}, {
 		.compatible = "mediatek,mt8195-spmi",
 		.data = &mt8195_pmif_arb,
+	}, {
+		.compatible = "mediatek,mt8196-spmi",
+		.data = &mt8196_pmif_arb,
 	}, {
 		/* sentinel */
 	},
-- 
2.49.0

