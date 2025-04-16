Received: from mxout4.routing.net (mxout4.routing.net [134.0.28.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B1123817F;
	Wed, 16 Apr 2025 09:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744797272; cv=none; b=KNjqsUUT1m+OuMd/ERgkY9nydMtTmdKODZxfEo1H2RjseQBNI05FwoNWEqvIlhKqO8wILlr5JCJKFaZjva4uCGJpy+KQUdktsN9HLYDzPjfsJPVnIVYJVykZpggh/WF4zbN3WDr+ja9S/3Yn8CyZbLh6yKJ8n/Mh6ZEZdZOsJhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744797272; c=relaxed/simple;
	bh=75LJ2+MGXPl3iHbcC0Ozkg40P53VaqzfB8RywROL95A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qyDIzlCni5hVB9Oj1VK+ukXHQ8CEE+Xq10l3Owjc4uF2wavIDTvEJlEbgxXgLOCD9vF/vXBC3GL0ChvQk3WXHVlWXAajcyN+cFuG3qqXA+jlgNkVeatLkVl0D21XxRqYtsOCeChEPYHTT9ZwIEAqNd3/UXUkZmGteO4+kQZ3T4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=LO3/i1Gi; arc=none smtp.client-ip=134.0.28.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="LO3/i1Gi"
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout4.routing.net (Postfix) with ESMTP id 52A8810120A;
	Wed, 16 Apr 2025 09:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1744797262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WwQBx5fEB+uvLYfypIdunG+zLMu/9QNNGo72DjZopiw=;
	b=LO3/i1GiLZ/5iIBRfVfr5RyXRrZ/Vg41LIGx+uVsOa72fDur3fwrbHHuZGC8fzKdTiLnkk
	ZOas2dJNW5dZavmvotOWGPMtK5ZcLwgeYjs9nxLVRk839T1vi3teujDfwce8+aj7KZ/rL1
	JbJbtUYEsn2/Y5re/PZOdVhrfPjQGek=
Received: from frank-u24.. (fttx-pool-80.245.72.47.bambit.de [80.245.72.47])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 68167360C65;
	Wed, 16 Apr 2025 09:54:21 +0000 (UTC)
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
Subject: [PATCH v3 6/8] phy: mediatek: xsphy: support type switch by pericfg
Date: Wed, 16 Apr 2025 11:53:58 +0200
Message-ID: <20250416095402.90543-7-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416095402.90543-1-linux@fw-web.de>
References: <20250416095402.90543-1-linux@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: d04aa45f-1d93-4d11-ada7-f6a9fc71389d

From: Daniel Golle <daniel@makrotopia.org>

Patch from Sam Shih <sam.shih@mediatek.com> found in MediaTek SDK
released under GPL.

Get syscon and use it to set the PHY type.
Extend support to PCIe and SGMII mode in addition to USB2 and USB3.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
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

