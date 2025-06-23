Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F2424EAAA
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 12:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750680202; cv=none; b=htZ2nmMGLozX16ddhGZr+nIjwgrwf+pYP74AQWPGk4Ut1ix19mqpBroBl3sBAdYa/iAEsrsK2nDf/J+sBktFZGuPjxWcvQYjlYiBINjp9yP+vTknU39vyAoVDHueKB88xi6nJxqkkh0jhmlQKRK6sa+aPrFU6rnk792s8iqTndw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750680202; c=relaxed/simple;
	bh=tOpD5LTV/P8tm/1UAfOVh6bSUSeBFltYVVD8Ct+QpFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PIThLRMcK63OASPJyI/lPd4swVYAylpxCMQcln+V3jKTqlrKytZTa4kjADT4ngaer2FFaSxGXZ6HTxir274oThoG2SqlHWyCSnjo6W1PYTX4YWhYDGK59cFjUDuBnCLB1HTUL4VAe5KUuVpCUxDM8R4mgXdBezsU/3TrY88Ufag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=BPXElbYC; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BPXElbYC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680199;
	bh=tOpD5LTV/P8tm/1UAfOVh6bSUSeBFltYVVD8Ct+QpFM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BPXElbYC3D6vKdJHilYWDaXvnIxCXG/COLTXYBdOwULJ+hNDORKb4FIgpddGRpDwX
	 G4gMXKXSMZKCANDv1FP45YLB5LljbXixmNAY4MjBIEdpAsKPSW3aTIf0XKqx8dpF9Z
	 bsktZbufErjX3MZOPqYvOZWpb+Eq/+FlMPefUFFnMKBR8yoHisN8zgiCLita9zI36G
	 UNGlL480/C50S3vhdawEvIk/cs6G4Z48/do0+Qs2q85T1nc9Hl1D/O/0JmLoSdixEB
	 E+NHGAkXRUPfQCrpOL1axLY6MVUcKdlt3NPBouzbQkVA3suCVjTkHNK8FZa5SisHru
	 XdvCDRxe4QRrw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C3B1C17E0EC0;
	Mon, 23 Jun 2025 14:03:18 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunfeng.yun@mediatek.com
Cc: vkoul@kernel.org,
	kishon@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v1 1/2] phy: mediatek: tphy: Clarify and add kerneldoc to mtk_phy_pdata
Date: Mon, 23 Jun 2025 14:03:14 +0200
Message-ID: <20250623120315.109881-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623120315.109881-1-angelogioacchino.delregno@collabora.com>
References: <20250623120315.109881-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As struct mtk_phy_pdata was almost fully documented, transfer
the comments into kerneldoc on top.
While at it, also rewrite the comments to both improve the writing
writing and the actual information in the documentation, and add a
description for the `version` member of the structure.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/phy/mediatek/phy-mtk-tphy.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
index 644a34bd2b0b..858824b4476e 100644
--- a/drivers/phy/mediatek/phy-mtk-tphy.c
+++ b/drivers/phy/mediatek/phy-mtk-tphy.c
@@ -277,19 +277,19 @@ enum mtk_phy_version {
 	MTK_PHY_V3,
 };
 
+/**
+ * mtk_phy_pdata - SoC specific platform data
+ * @avoid_rx_sen_degradation: Avoid TX Sensitivity level degradation (MT6795/8173 only)
+ * @sw_pll_48m_to_26m:        Workaround for V3 IP (MT8195) - switch the 48MHz PLL from
+ *                            fractional mode to integer to output 26MHz for U2PHY
+ * @sw_efuse_supported:       Switches off eFuse auto-load from PHY and applies values
+ *                            read from different nvmem (usually different eFuse array)
+ *                            that is pointed at in the device tree node for this PHY
+ * @version:                  PHY IP Version
+ */
 struct mtk_phy_pdata {
-	/* avoid RX sensitivity level degradation only for mt8173 */
 	bool avoid_rx_sen_degradation;
-	/*
-	 * workaround only for mt8195, HW fix it for others of V3,
-	 * u2phy should use integer mode instead of fractional mode of
-	 * 48M PLL, fix it by switching PLL to 26M from default 48M
-	 */
 	bool sw_pll_48m_to_26m;
-	/*
-	 * Some SoCs (e.g. mt8195) drop a bit when use auto load efuse,
-	 * support sw way, also support it for v2/v3 optionally.
-	 */
 	bool sw_efuse_supported;
 	enum mtk_phy_version version;
 };
-- 
2.49.0

