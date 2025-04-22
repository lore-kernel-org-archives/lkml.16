Received: from mxout4.routing.net (mxout4.routing.net [134.0.28.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6179028CF73;
	Tue, 22 Apr 2025 13:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745328305; cv=none; b=XR39tj9a5BiMC8UldeHuhjDoF3FSTdNslslOLCFVURg32mLJ6nNiimGOmBRRJk+yr6UmNmna2X7DOngx7gANNyGRNdyHojZh8II3ArJjfIEXsNFBXLmpW9bWMAd6HeTyUJvpJcQ5cIq7uuZRR9IDAxDf+Yf1++vp5L7HOHR2OTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745328305; c=relaxed/simple;
	bh=deut4ZYqkcVgWjS4Uw29TFCku8mZ64yPAZgRPoQIWdg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kwgcFR5nl6J5De34m6zmz6Ht9WijscdkWnTg43jLgjlrTJ7YK5QFWc7fn9C6PVy7V5j8HrSHbdsNU+o+bOXVuLzRIuvmobO4iv11ykYnO9bHYGbyY/I1QNDfCSrT0o3w7jF9cuPNGRFwJWWpeNDPR643L9DPe9gdSp0K3DH7dBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=CrDWJScJ; arc=none smtp.client-ip=134.0.28.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="CrDWJScJ"
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
	by mxout4.routing.net (Postfix) with ESMTP id 3032C10095D;
	Tue, 22 Apr 2025 13:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1745328296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qDQBMTPiiPjxF7DC5uGdU/8r5EOacgDwnKHqoNPCrU4=;
	b=CrDWJScJzPB+c5joJI/OKPnlekALfiX2skGYLR4uKpTqEfxkJFWJ4gE2s4pe5yHfMs1auN
	CQ1MWHsEbVYbg0urNlD0q+MVDPVNjjjBMs2vOneOH3bHgVq6X3M0jL6Frtu7g+LJcWv8h7
	ld/8LWWP+mKklwZziRG8tr3aSeZHeOY=
Received: from frank-u24.. (fttx-pool-217.61.156.53.bambit.de [217.61.156.53])
	by mxbox4.masterlogin.de (Postfix) with ESMTPSA id 504B0801F5;
	Tue, 22 Apr 2025 13:24:55 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Daniel Golle <daniel@makrotopia.org>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v4 7/8] arm64: dts: mediatek: mt7988: Add xsphy for ssusb0/pcie2
Date: Tue, 22 Apr 2025 15:24:30 +0200
Message-ID: <20250422132438.15735-8-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422132438.15735-1-linux@fw-web.de>
References: <20250422132438.15735-1-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 3df57c91-f0e1-43d9-be6f-95cea4f19eca

From: Frank Wunderlich <frank-w@public-files.de>

First usb and third pcie controller on mt7988 need a xs-phy to work
properly.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v3:
- drop unneeded properties and compatibles from topmisc
- change offset to have clean syscon (without power controller)
v4:
- fix unit adress of topmisc
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 36 +++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index 88b56a24efca..a59f8708f0ef 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -334,6 +334,8 @@ usb@11190000 {
 				 <&infracfg CLK_INFRA_133M_USB_HCK>,
 				 <&infracfg CLK_INFRA_USB_XHCI>;
 			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck", "xhci_ck";
+			phys = <&xphyu2port0 PHY_TYPE_USB2>,
+			       <&xphyu3port0 PHY_TYPE_USB3>;
 			status = "disabled";
 		};
 
@@ -398,6 +400,9 @@ pcie2: pcie@11280000 {
 			pinctrl-0 = <&pcie2_pins>;
 			status = "disabled";
 
+			phys = <&xphyu3port0 PHY_TYPE_PCIE>;
+			phy-names = "pcie-phy";
+
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
 			interrupt-map = <0 0 0 1 &pcie_intc2 0>,
@@ -548,6 +553,37 @@ tphyu3port0: usb-phy@11c50700 {
 			};
 		};
 
+
+		topmisc: system-controller@11d10084 {
+			compatible = "mediatek,mt7988-topmisc",
+				     "syscon";
+			reg = <0 0x11d10084 0 0xff80>;
+		};
+
+		xs-phy@11e10000 {
+			compatible = "mediatek,mt7988-xsphy",
+				     "mediatek,xsphy";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			status = "disabled";
+
+			xphyu2port0: usb-phy@11e10000 {
+				reg = <0 0x11e10000 0 0x400>;
+				clocks = <&infracfg CLK_INFRA_USB_UTMI>;
+				clock-names = "ref";
+				#phy-cells = <1>;
+			};
+
+			xphyu3port0: usb-phy@11e13000 {
+				reg = <0 0x11e13400 0 0x500>;
+				clocks = <&infracfg CLK_INFRA_USB_PIPE>;
+				clock-names = "ref";
+				#phy-cells = <1>;
+				mediatek,syscon-type = <&topmisc 0x194 0>;
+			};
+		};
+
 		clock-controller@11f40000 {
 			compatible = "mediatek,mt7988-xfi-pll";
 			reg = <0 0x11f40000 0 0x1000>;
-- 
2.43.0

