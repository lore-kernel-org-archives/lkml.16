Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41ED2BD025;
	Tue, 10 Jun 2025 14:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749564494; cv=pass; b=h57SaQ+MMfQiL6QHoADjF3fddjPrLBhyHvfixZ26hBFn0cKG8QRVbVDmmCgLDLL5lbqV19phVg7mQp6GyN4PBR74jgfl3cI1roHn4hceKhmLvZxKzAbOBllPIpno/dWYvJKTu4WgTz+pnT5dtnj1mbvW49qmZ1OtTYlmYG/nJDI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749564494; c=relaxed/simple;
	bh=uJMB3RmoFmNJqBV7ekNdfelHXQHZizUIa4ub+tYRYMc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NowU7uFczqGFNf1W1ajfDAt3i9KpC9Tdyy9YsKgne2SDpm2nGiXlWz36JUodHT2+H56Qc5p291nNgxlaFY8DmJXBxpmcPTNo5708YqInVNxfUkrUaYphSK8oxh4gqSO6chbDjqJXj+FW4nyvkf1xdUzCE/XT5M6sUVe8/slIGx4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=EbVqAWGA; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="EbVqAWGA"
ARC-Seal: i=1; a=rsa-sha256; t=1749564463; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gWfx0BGM1hQo1k0tw3zygoJYbLU4qklsHcATVLoyJ9bbYxZk3xOg3+rO9AbI7//aMEjsfXUDoKqoLwOae4WA9f5T3ljW9G0wlRTHk+hBoOI8Gi2t5O4njYKipvcRN9Q3rsWLppoRIW0uoIWtQ9phVKxKynCuQklTFAOVh2Vydag=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749564463; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=j1pxA+bc+vNKzjIaRT1KaTq/RuyMnrlK34dQ5cfd5BU=; 
	b=KPyOhN1dxwAvPM5hsYyC2YZ0ZYNYYkKDCjZvNsezpA4E5O/y/TygIiKOEOsqgOi5JII5drLekhVB6YocNre3Sw2u0jqgeZRmxhAJ4UuwDI9xdAs05C2PtICbSCfzZVme8R0R4EeaeFFobQF89K2WvwGn9UnykF/iJ3Jhmql83ZU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749564463;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=j1pxA+bc+vNKzjIaRT1KaTq/RuyMnrlK34dQ5cfd5BU=;
	b=EbVqAWGAKd9Dx/Gn/M8eNOQC+b0+M2vHmTef1gBtdx3H/JYZTU+cVF/Z6ZKtBGgY
	1XgC/EG/Z3VmKzFGqLlnWXX7sdhp+NLtRGDc+XnwASyaAk2MGyzBL+IcBXqBdfh1yc+
	3VivezSgvfLVCH2XylMmT40L53aAfq0GFtb+Bncc=
Received: by mx.zohomail.com with SMTPS id 1749564462150218.33676348396068;
	Tue, 10 Jun 2025 07:07:42 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 10 Jun 2025 16:07:10 +0200
Subject: [PATCH v4 2/4] phy: rockchip: usbdp: move orientation handling
 further down
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-rk3576-sige5-usb-v4-2-7e7f779619c1@collabora.com>
References: <20250610-rk3576-sige5-usb-v4-0-7e7f779619c1@collabora.com>
In-Reply-To: <20250610-rk3576-sige5-usb-v4-0-7e7f779619c1@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>
Cc: Alexey Charkov <alchark@gmail.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
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

