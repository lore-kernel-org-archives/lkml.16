Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA9F26738B;
	Mon,  5 May 2025 17:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746466049; cv=pass; b=qgJCg7MEHXbJLWrLqK6G1u9AUVtM0nXMG8KT3+8mALzJ0JJN3ZVnR6oxs308BNXn4zYN8D5N4LrUFM13ntGWbZWwFp+F77b/CFDm/PkW+KMI5GKCWJIOLjujpemB48Cj2MbUcog3lHo+lixXarMxY1p0ETFN6ro3Z7MyrEzfhcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746466049; c=relaxed/simple;
	bh=uJMB3RmoFmNJqBV7ekNdfelHXQHZizUIa4ub+tYRYMc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BBwOTxRRM8Sjytb5okz1HdIMAYNmlUdPyCY6kDOIhGBBaZ8Wfxn4u0KH1wpmgvVAe+3k3ie5W3rxrFtwYnEToBA1w11X76o1/Uy0Hel6qa73hOhE3hJvtFelEULSKflEL6QzXVwWueomyjCxhWHFNw6lslsmm0juXYRMW1FLrlY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=OUrrSne5; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="OUrrSne5"
ARC-Seal: i=1; a=rsa-sha256; t=1746466024; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fmdldmq8dsLmVPIYQxY161qfznq7mmrK8ujgoFnjIkPzEUJPSVMYY8y5ut+Yq4vXdqkP7SKZwhP5Wzyxjbfh23I44QYTp86SllgnvqLBSe8GpGFEIykN0WimXb520kO/YGOZ3b+ekHfa4G2XZ6i9Zyqt9/BSN7dbMWLD/wrZW/E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746466024; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=j1pxA+bc+vNKzjIaRT1KaTq/RuyMnrlK34dQ5cfd5BU=; 
	b=H/LgMSug9gBuSTlAAoH89EXEnXLoIAxQxgP849j+D/LKlY5Q9uHQD6StWX71fuu7j6GqLOaXDO+Jdb7zwLk80/AES7sltnb449RnuCwoPZxPzoZT3MWTb1fewhU88Ft4YcCPajAFM4AIohIiFq6Yr53LcvQIFu3tZoN7/PAtPtU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746466024;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=j1pxA+bc+vNKzjIaRT1KaTq/RuyMnrlK34dQ5cfd5BU=;
	b=OUrrSne5KQrgU8ndZn2XgYB7UVCtE6WukeUoqU9i2h8TpUfJ/GRmK3mGzruZLOa0
	jHVIZbquQBl2aWBB3hos/Jc7xVACAr5a/VaHz9O1rjwyVtjoKU7AGUXj7gpnksa99cV
	KN1nwhKSyjBK54FljqgddZXFRsw1fQcTs6BKIx90=
Received: by mx.zohomail.com with SMTPS id 1746466022200140.16841011130168;
	Mon, 5 May 2025 10:27:02 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 05 May 2025 19:26:37 +0200
Subject: [PATCH v2 2/5] phy: rockchip: usbdp: move orientation handling
 further down
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-rk3576-sige5-usb-v2-2-d5ba4305f3be@collabora.com>
References: <20250505-rk3576-sige5-usb-v2-0-d5ba4305f3be@collabora.com>
In-Reply-To: <20250505-rk3576-sige5-usb-v2-0-d5ba4305f3be@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 kernel@collabora.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2

The orientation handling code isn't referenced until very far down the
driver code.

Move it down some ways so it can later reference other driver functions
without needing forward declarations.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 100 +++++++++++++++---------------
 1 file changed, 50 insertions(+), 50 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index c066cc0a7b4f10fc3cd8779323c369360893520d..fff54900feea601c8fe6bf4c7123dfebc5661a15 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -651,56 +651,6 @@ static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
 	udphy->mode = UDPHY_MODE_DP_USB;
 }
 
-static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
-				 enum typec_orientation orien)
-{
-	struct rk_udphy *udphy = typec_switch_get_drvdata(sw);
-
-	mutex_lock(&udphy->mutex);
-
-	if (orien == TYPEC_ORIENTATION_NONE) {
-		gpiod_set_value_cansleep(udphy->sbu1_dc_gpio, 0);
-		gpiod_set_value_cansleep(udphy->sbu2_dc_gpio, 0);
-		/* unattached */
-		rk_udphy_usb_bvalid_enable(udphy, false);
-		goto unlock_ret;
-	}
-
-	udphy->flip = (orien == TYPEC_ORIENTATION_REVERSE) ? true : false;
-	rk_udphy_set_typec_default_mapping(udphy);
-	rk_udphy_usb_bvalid_enable(udphy, true);
-
-unlock_ret:
-	mutex_unlock(&udphy->mutex);
-	return 0;
-}
-
-static void rk_udphy_orien_switch_unregister(void *data)
-{
-	struct rk_udphy *udphy = data;
-
-	typec_switch_unregister(udphy->sw);
-}
-
-static int rk_udphy_setup_orien_switch(struct rk_udphy *udphy)
-{
-	struct typec_switch_desc sw_desc = { };
-
-	sw_desc.drvdata = udphy;
-	sw_desc.fwnode = dev_fwnode(udphy->dev);
-	sw_desc.set = rk_udphy_orien_sw_set;
-
-	udphy->sw = typec_switch_register(udphy->dev, &sw_desc);
-	if (IS_ERR(udphy->sw)) {
-		dev_err(udphy->dev, "Error register typec orientation switch: %ld\n",
-			PTR_ERR(udphy->sw));
-		return PTR_ERR(udphy->sw);
-	}
-
-	return devm_add_action_or_reset(udphy->dev,
-					rk_udphy_orien_switch_unregister, udphy);
-}
-
 static int rk_udphy_refclk_set(struct rk_udphy *udphy)
 {
 	unsigned long rate;
@@ -1451,6 +1401,56 @@ static struct phy *rk_udphy_phy_xlate(struct device *dev, const struct of_phandl
 	return ERR_PTR(-EINVAL);
 }
 
+static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
+				 enum typec_orientation orien)
+{
+	struct rk_udphy *udphy = typec_switch_get_drvdata(sw);
+
+	mutex_lock(&udphy->mutex);
+
+	if (orien == TYPEC_ORIENTATION_NONE) {
+		gpiod_set_value_cansleep(udphy->sbu1_dc_gpio, 0);
+		gpiod_set_value_cansleep(udphy->sbu2_dc_gpio, 0);
+		/* unattached */
+		rk_udphy_usb_bvalid_enable(udphy, false);
+		goto unlock_ret;
+	}
+
+	udphy->flip = (orien == TYPEC_ORIENTATION_REVERSE) ? true : false;
+	rk_udphy_set_typec_default_mapping(udphy);
+	rk_udphy_usb_bvalid_enable(udphy, true);
+
+unlock_ret:
+	mutex_unlock(&udphy->mutex);
+	return 0;
+}
+
+static void rk_udphy_orien_switch_unregister(void *data)
+{
+	struct rk_udphy *udphy = data;
+
+	typec_switch_unregister(udphy->sw);
+}
+
+static int rk_udphy_setup_orien_switch(struct rk_udphy *udphy)
+{
+	struct typec_switch_desc sw_desc = { };
+
+	sw_desc.drvdata = udphy;
+	sw_desc.fwnode = dev_fwnode(udphy->dev);
+	sw_desc.set = rk_udphy_orien_sw_set;
+
+	udphy->sw = typec_switch_register(udphy->dev, &sw_desc);
+	if (IS_ERR(udphy->sw)) {
+		dev_err(udphy->dev, "Error register typec orientation switch: %ld\n",
+			PTR_ERR(udphy->sw));
+		return PTR_ERR(udphy->sw);
+	}
+
+	return devm_add_action_or_reset(udphy->dev,
+					rk_udphy_orien_switch_unregister, udphy);
+}
+
 static int rk_udphy_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;

-- 
2.49.0

