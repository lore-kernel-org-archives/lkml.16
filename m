Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5356F23372B;
	Wed,  2 Apr 2025 09:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743584789; cv=none; b=tHxlmihj34f8TsfHTYRHTVu2E+bw1eyvRq2owMgIMIzgTFiwRBo/QMTra0HEWSg2FgL74L+GieeDmcP/15CjAb3B/k59zNbUmCdQJJSt2OR156OLgf9Tn0+B0WTGX8TsXBC/hoKSsrpqV++8THMdT7RVCmCXUuDT9Y2noScNrHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743584789; c=relaxed/simple;
	bh=LrSP6HWCbXK4Bjo8D1kqooNWX+Memzd4hQNwtRsOCSw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fsvrQUQtOy8HDlv4FFnlre+mV5InvzN+2BrWM4/sSLYelShtfqulWAeAYADFvOZPuqDK4uGFcJFmpqdMiAaBuYk8+tn5ox24eN5sfpDvTa0Gs10Ygtva2EinE6LBZDrT6LfaNRidThIzzrrGeLDPmt9LD6ZpnbhdWDg916a+Kts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=fDwGPBEn; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fDwGPBEn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743584780;
	bh=LrSP6HWCbXK4Bjo8D1kqooNWX+Memzd4hQNwtRsOCSw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fDwGPBEnIxHePAI0uDznhxI//v/tqK7A7o1tcavd/q7r7aSTfFCj9v7lEpkeQUIv0
	 K8JRSl3B+G6c7iKM8Aw+ZXFtfxHwe+8WQ/ntKPwb4E33nPDbqXn50Z85b4axxuqF1L
	 qnbknoph9ntCI9q4CElHkaIl7IHtNPfaUiV11hfkWd3OaGbASSOIU6uYSmuAPh38Ff
	 sWIMPM7TDaf968ez+3TpqDyaec5ATGdyS2AQLF4zZApiZIlE3EySgALGnIxeClSy8r
	 9h2x0jMeLDSmYIOTud+RROm7rRu2p0EwYIzmVSQBGQLTsWvSpcC40n5Qiz0jgFy86B
	 9CBQa4vQ/wg0A==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B799217E02BE;
	Wed,  2 Apr 2025 11:06:19 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	weiyi.lu@mediatek.com,
	tinghan.shen@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 1/2] arm64: dts: mediatek: mt8195: Add subsys clks for PCIe power domains
Date: Wed,  2 Apr 2025 11:06:14 +0200
Message-ID: <20250402090615.25871-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402090615.25871-1-angelogioacchino.delregno@collabora.com>
References: <20250402090615.25871-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCIe MAC needs the sram to be powered on for internal IP
access and it has always worked before because the bootloader
on Chromebooks was leaving the PCIe PERI_AO MEM clocks on
before booting the kernel.
Add the SRAM (mem) clock as a subsystem clock on the PCIe MAC
P0 and P1 to correctly describe the hardware and to avoid any
issue with bootloaders behaving differently.

Fixes: 2b515194bf0c ("arm64: dts: mt8195: Add power domains controller")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index b33726da900b..0cb96cba727a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -792,12 +792,16 @@ power-domain@MT8195_POWER_DOMAIN_CAM_MRAW {
 
 				power-domain@MT8195_POWER_DOMAIN_PCIE_MAC_P0 {
 					reg = <MT8195_POWER_DOMAIN_PCIE_MAC_P0>;
+					clocks = <&pericfg_ao CLK_PERI_AO_PCIE_P0_MEM>;
+					clock-names = "ss-pextp0-mem";
 					mediatek,infracfg = <&infracfg_ao>;
 					#power-domain-cells = <0>;
 				};
 
 				power-domain@MT8195_POWER_DOMAIN_PCIE_MAC_P1 {
 					reg = <MT8195_POWER_DOMAIN_PCIE_MAC_P1>;
+					clocks = <&pericfg_ao CLK_PERI_AO_PCIE_P1_MEM>;
+					clock-names = "ss-pextp1-mem";
 					mediatek,infracfg = <&infracfg_ao>;
 					#power-domain-cells = <0>;
 				};
-- 
2.48.1

