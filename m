Received: from mxout3.routing.net (mxout3.routing.net [134.0.28.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A50863CB;
	Sun, 13 Apr 2025 09:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744535069; cv=none; b=ZHRl4kbALDVqC2vCQw3N7phhvdsl3LbgQz6rk6MiaNQkMAW84t7ZtD/MVFj85N2kSfwHi+0wwqCC47r4aFiSTXZ5po3aMyt8vQ0KtVeHRbFOZOthy9+5iCgJokkuNQfn4o8qrss6f8mx+M8iFVUeEMVGsJHDy+1XH1j7s/tbW74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744535069; c=relaxed/simple;
	bh=PbhWn/+pnrNkNBgud89PAjBem9DGk+oL1/wMyS48/G8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j2YFOS7VOxhR/csphV45tWjWc3+kF1xpTvk6/VyycVrXmnzxLWjjWzFMiU2nofaLEC00BRqwXn85VluhSWnb/0+VIF0MtlLdXKCTrQ9vaysFwqB2vQVg+xhqnXwaqF9X0b2M3LMaqOfQ/61CWC9HL7ELHba3txaBYZiaHHi9h3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=ZjnUgL6A; arc=none smtp.client-ip=134.0.28.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="ZjnUgL6A"
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout3.routing.net (Postfix) with ESMTP id 155CE60536;
	Sun, 13 Apr 2025 08:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1744534696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fUg/DncS2AhYG89VBxFJm1aq8shzU0lzttlOs1DPzvU=;
	b=ZjnUgL6ARihXC/nQO4jManNDUvZw6u+ojM0IQH9iESkQE8HMOY166SZ/i4TH41Yccj0yk9
	0tpOCkWLhxjn8fCV5/kpZCig7MQx8AWMZhZz7GfhgS4SYZVu7fAlIPV9Ybokzwu1ChNSD1
	MY0azaWWbG1pUBbOyk4ybi8mTNQFC0A=
Received: from frank-u24.. (fttx-pool-194.15.86.153.bambit.de [194.15.86.153])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id 2D57940089;
	Sun, 13 Apr 2025 08:58:15 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	Daniel Golle <daniel@makrotopia.org>,
	Sam Shih <sam.shih@mediatek.com>,
	MandyJH Liu <mandyjh.liu@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC 5/5] arm64: dts: mediatek: mt7988: Add xsphy for ssusb0/pcie2
Date: Sun, 13 Apr 2025 10:58:05 +0200
Message-ID: <20250413085806.8544-6-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250413085806.8544-1-linux@fw-web.de>
References: <20250413085806.8544-1-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: bf08c37c-044c-4f9f-90b3-b87e6ed8eae5

From: Frank Wunderlich <frank-w@public-files.de>

First usb and third pcie controller on mt7988 need a xs-phy to work
properly.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 39 +++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index 88b56a24efca..10525d977007 100644
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
@@ -548,6 +553,40 @@ tphyu3port0: usb-phy@11c50700 {
 			};
 		};
 
+		topmisc: power-controller@11d10000 {
+			compatible = "mediatek,mt7988-topmisc", "syscon",
+				     "mediatek,mt7988-power-controller";
+			reg = <0 0x11d10000 0 0x10000>;
+			#clock-cells = <1>;
+			#power-domain-cells = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
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
+				mediatek,syscon-type = <&topmisc 0x218 0>;
+			};
+		};
+
 		clock-controller@11f40000 {
 			compatible = "mediatek,mt7988-xfi-pll";
 			reg = <0 0x11f40000 0 0x1000>;
-- 
2.43.0

