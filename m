Received: from mxout4.routing.net (mxout4.routing.net [134.0.28.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35F818DB1A;
	Sun, 13 Apr 2025 09:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744535285; cv=none; b=tikRoJvkpMKLecTEv3/tx1amHN69be3wOUdyePp/857cXjT5Y+unviBMabiavMqIWiDvuHztD9fTS0GnlXbBW+uTK4CVIbCYnopD0bLl9RrW5P5oLFNvywayYNaqbWXV4+DXhpvbWqY7NY054kaSs0Y/QDbiPc2iOoPVSvN5RVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744535285; c=relaxed/simple;
	bh=lw2J3rDsFRflVycd5/Obpm10DfH+/mPUhQtjUa3WdqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cDxPT8XF6RXvc//1meRsEokqIMYOoIjWkpJJlhLdZzOZeYWo5T9wGaGJFxDbpPXFKsN3OIUKj0bFyH0cWGFF8bCj0FXxse+Ur7xotrB51YF+2beNVnVmpCvuEHLaFOtVB2wINVLDocWaW0MOWcOBkcUR9aNVaThR/Fdh2ikQ6LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=UmZtL6jg; arc=none smtp.client-ip=134.0.28.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="UmZtL6jg"
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout4.routing.net (Postfix) with ESMTP id 48A2B1004D0;
	Sun, 13 Apr 2025 08:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1744534695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ib+KhWCrUSc+adJVmrX0XIz7ASiUmHJbOHL7A4bL+YA=;
	b=UmZtL6jgI0cyBG7f71Ee/uZxE5PK2Aj4cICeBnSmw2bChWLWVpZqIVq7lh+k7mYtdNgDuJ
	Cs+2MIvkgE/TKpaEW3DWkcPs1i9oU//GkVuNQtl8ROCEsDK+F9B22o+t3skCy+HyOyQv4N
	WIkYjWr//pftCpbYr1pa6U2DQSgG9vM=
Received: from frank-u24.. (fttx-pool-194.15.86.153.bambit.de [194.15.86.153])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id 67BC94006C;
	Sun, 13 Apr 2025 08:58:14 +0000 (UTC)
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
Subject: [RFC 4/5] phy: mediatek: xsphy: support type switch by pericfg
Date: Sun, 13 Apr 2025 10:58:04 +0200
Message-ID: <20250413085806.8544-5-linux@fw-web.de>
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
X-Mail-ID: 69e800a6-6e8a-4e39-b54f-7c2364b9dec1

From: Daniel Golle <daniel@makrotopia.org>

Patch from Sam Shih <sam.shih@mediatek.com> found in MediaTek SDK
released under GPL.

Get syscon and use it to set the PHY type.
Extend support to PCIe and SGMII mode in addition to USB2 and USB3.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/phy/mediatek/phy-mtk-xsphy.c | 85 +++++++++++++++++++++++++++-
 1 file changed, 84 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/mediatek/phy-mtk-xsphy.c b/drivers/phy/mediatek/phy-mtk-xsphy.c
index 7c248f5cfca5..c0ddb9273cc3 100644
--- a/drivers/phy/mediatek/phy-mtk-xsphy.c
+++ b/drivers/phy/mediatek/phy-mtk-xsphy.c
@@ -11,10 +11,12 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/iopoll.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 
 #include "phy-mtk-io.h"
 
@@ -81,12 +83,22 @@
 #define XSP_SR_COEF_DIVISOR	1000
 #define XSP_FM_DET_CYCLE_CNT	1024
 
+/* PHY switch between pcie/usb3/sgmii */
+#define USB_PHY_SWITCH_CTRL	0x0
+#define RG_PHY_SW_TYPE		GENMASK(3, 0)
+#define RG_PHY_SW_PCIE		0x0
+#define RG_PHY_SW_USB3		0x1
+#define RG_PHY_SW_SGMII		0x2
+
 struct xsphy_instance {
 	struct phy *phy;
 	void __iomem *port_base;
 	struct clk *ref_clk;	/* reference clock of anolog phy */
 	u32 index;
 	u32 type;
+	struct regmap *type_sw;
+	u32 type_sw_reg;
+	u32 type_sw_index;
 	/* only for HQA test */
 	int efuse_intr;
 	int efuse_tx_imp;
@@ -259,6 +271,10 @@ static void phy_parse_property(struct mtk_xsphy *xsphy,
 			inst->efuse_intr, inst->efuse_tx_imp,
 			inst->efuse_rx_imp);
 		break;
+	case PHY_TYPE_PCIE:
+	case PHY_TYPE_SGMII:
+		/* nothing to do */
+		break;
 	default:
 		dev_err(xsphy->dev, "incompatible phy type\n");
 		return;
@@ -305,6 +321,62 @@ static void u3_phy_props_set(struct mtk_xsphy *xsphy,
 				     RG_XTP_LN0_RX_IMPSEL, inst->efuse_rx_imp);
 }
 
+/* type switch for usb3/pcie/sgmii */
+static int phy_type_syscon_get(struct xsphy_instance *instance,
+			       struct device_node *dn)
+{
+	struct of_phandle_args args;
+	int ret;
+
+	/* type switch function is optional */
+	if (!of_property_present(dn, "mediatek,syscon-type"))
+		return 0;
+
+	ret = of_parse_phandle_with_fixed_args(dn, "mediatek,syscon-type",
+					       2, 0, &args);
+	if (ret)
+		return ret;
+
+	instance->type_sw_reg = args.args[0];
+	instance->type_sw_index = args.args[1] & 0x3; /* <=3 */
+	instance->type_sw = syscon_node_to_regmap(args.np);
+	of_node_put(args.np);
+	dev_info(&instance->phy->dev, "type_sw - reg %#x, index %d\n",
+		 instance->type_sw_reg, instance->type_sw_index);
+
+	return PTR_ERR_OR_ZERO(instance->type_sw);
+}
+
+static int phy_type_set(struct xsphy_instance *instance)
+{
+	int type;
+	u32 offset;
+
+	if (!instance->type_sw)
+		return 0;
+
+	switch (instance->type) {
+	case PHY_TYPE_USB3:
+		type = RG_PHY_SW_USB3;
+		break;
+	case PHY_TYPE_PCIE:
+		type = RG_PHY_SW_PCIE;
+		break;
+	case PHY_TYPE_SGMII:
+		type = RG_PHY_SW_SGMII;
+		break;
+	case PHY_TYPE_USB2:
+	default:
+		return 0;
+	}
+
+	offset = instance->type_sw_index * BITS_PER_BYTE;
+	regmap_update_bits(instance->type_sw, instance->type_sw_reg,
+			   RG_PHY_SW_TYPE << offset, type << offset);
+
+	return 0;
+}
+
 static int mtk_phy_init(struct phy *phy)
 {
 	struct xsphy_instance *inst = phy_get_drvdata(phy);
@@ -325,6 +397,10 @@ static int mtk_phy_init(struct phy *phy)
 	case PHY_TYPE_USB3:
 		u3_phy_props_set(xsphy, inst);
 		break;
+	case PHY_TYPE_PCIE:
+	case PHY_TYPE_SGMII:
+		/* nothing to do, only used to set type */
+		break;
 	default:
 		dev_err(xsphy->dev, "incompatible phy type\n");
 		clk_disable_unprepare(inst->ref_clk);
@@ -403,12 +479,15 @@ static struct phy *mtk_phy_xlate(struct device *dev,
 
 	inst->type = args->args[0];
 	if (!(inst->type == PHY_TYPE_USB2 ||
-	      inst->type == PHY_TYPE_USB3)) {
+	      inst->type == PHY_TYPE_USB3 ||
+	      inst->type == PHY_TYPE_PCIE ||
+	      inst->type == PHY_TYPE_SGMII)) {
 		dev_err(dev, "unsupported phy type: %d\n", inst->type);
 		return ERR_PTR(-EINVAL);
 	}
 
 	phy_parse_property(xsphy, inst);
+	phy_type_set(inst);
 
 	return inst->phy;
 }
@@ -510,6 +589,10 @@ static int mtk_xsphy_probe(struct platform_device *pdev)
 			dev_err(dev, "failed to get ref_clk(id-%d)\n", port);
 			return PTR_ERR(inst->ref_clk);
 		}
+
+		retval = phy_type_syscon_get(inst, child_np);
+		if (retval)
+			return retval;
 	}
 
 	provider = devm_of_phy_provider_register(dev, mtk_phy_xlate);
-- 
2.43.0

