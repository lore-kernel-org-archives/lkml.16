Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0E72E5417;
	Thu,  3 Jul 2025 11:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751543931; cv=none; b=arYqTcI/9oyiwKTImO3fzQiHaIlOz0//UPJMS9fZLO3LG1cFcMFgK+AHWaudkF73ZDOgRxCzBcGzZ13UARH7KUYXSM5fmF+14a5hAEDRxROIkXl54CgAy8oZJr0WYrh9ABFp4bUBg9OQqlmCla5xueHl1AxyLNCE9s3wEqguefE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751543931; c=relaxed/simple;
	bh=t9HODM5Y2GDbH0AxGuEt+4umoitypeYCGG0NoQDFuM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BGQW2vbhlV3E1T7XI65K2QDEYUpD/HKNVSEdiY5mjhN7BXLnvlD2hvoDk5M2Nh8JCNz+V5cuXEN3LHH0y39rQeeDQkrg1P5i6K6GK+EYIKM3cxbWtWoUUAvCoNnM2JayyZMAheLi1t2sKU4ZZvDpfu1NRlQtqDNmm3E4R7PMw94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Ysp8eiNB; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Ysp8eiNB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751543927;
	bh=t9HODM5Y2GDbH0AxGuEt+4umoitypeYCGG0NoQDFuM8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ysp8eiNBIz86UIZ8qfWnK0XnxCnYRoGybBrPmQ5gs/AhZDOGDfh7THBFFeFq1tdW1
	 1tM6/u3fq3VRAbyzXEFFtLteuB50YawgKA8UZnPqZK1vhDXIVRJhu0+B+UK909zoKw
	 rKexJxpxybrszcvwA7a2OhnHMKvce7hc2am4SO8FtC61Fw4BGiJgJSHqsQrKSGk7Ok
	 Kxz+FvmJJIJnvb5wpqpWWVl6B9kzbprfpluw2twAwggFasaZdgd9CZWICVl1x/xUnY
	 +ABqMYUOhi6Xe+6Vfepp6yanr1HrpJJWpllVS+n8z0bBSrSMnTZsk+enJPeIMdPV2B
	 G+ZxgDZxEg86A==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0F26117E09C6;
	Thu,  3 Jul 2025 13:58:47 +0200 (CEST)
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
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
Subject: [PATCH v2 5/5] spmi: mtk-pmif: Add support for MT8196 SPMI Controller
Date: Thu,  3 Jul 2025 13:58:28 +0200
Message-ID: <20250703115828.118425-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703115828.118425-1-angelogioacchino.delregno@collabora.com>
References: <20250703115828.118425-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for the SPMI controller found in the MT8196 SoC:
this supports SPMI 2.0 and features two SPMI buses.

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
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

