Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D466F29552A;
	Tue, 17 Jun 2025 09:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750151247; cv=none; b=EY1YXGhE5Wpn7qkxs6LfTGNZZI0tSbyf+QszFsK3gJixh6c++ho7oxCKtdneubnzI7r/m5WAOVIayGAsLLrpLzWI2VWNpcmvp3ywBE5rNmsUuMl/SpOG2ED3SGStA5y5qnDc/dXWNCDAQalHqqzrl0WbvqzG+KuKGRN5+ZWoQzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750151247; c=relaxed/simple;
	bh=d+dyV6+8o/m9hnxTruh+bX3GYcHKO9kkCoHEp8YpTPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t2pYE8tXjyuYema4Rsd8OYMUwnpw23tUT4qLVdMsCl0zTKFhuwJTW8VzAqQMQhhZRkS6v/8BQ076cqiwEIo2asGiuKIh53ahmmZkGGoaCkCXwy8por44kTMaMYlf+iUnLUE+YQ2Kc/LF2PRYuhoskQXYDtjEht0kzhgUkOpYzeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=udjkKEhZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="udjkKEhZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81874C4CEE3;
	Tue, 17 Jun 2025 09:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750151247;
	bh=d+dyV6+8o/m9hnxTruh+bX3GYcHKO9kkCoHEp8YpTPw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=udjkKEhZiBJZXRaQOIi+Kte9fF0f4tojEXCYaBXhs52QIkY4vLi1MXUfqt+y5gmU4
	 4I/90PaR13m07oNHCZG1XpE/ojqRL9Jq+HBqOysop/AiZ2KbsN/6L/MzHZH8nwKrs1
	 NYuAVTKL9jAYVb7x73jcwMf13xSiLhIUhk4PL2wP5z9YyNVN+7ROcacESHhNo27djh
	 vg3Wvv1h27kzTGlk62k4yoZW11YspUA6dd5s5LX3j+mLLghQCRy9RgiXqU4sDXofxH
	 fUs+cau/opTrtqqoo1Y+JLSJmXDFsPeIfF5NhY4Guzej92eDbFZhcSAulBkYTw/Ll/
	 q0UNJzToEpMXw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79D6BC7115B;
	Tue, 17 Jun 2025 09:07:27 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Tue, 17 Jun 2025 10:54:45 +0200
Subject: [PATCH 4/5] phy: rockchip: phy-rockchip-inno-csidphy: add support
 for rk3588 variant
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-rk3588-csi-dphy-v1-4-84eb3b2a736c@collabora.com>
References: <20250616-rk3588-csi-dphy-v1-0-84eb3b2a736c@collabora.com>
In-Reply-To: <20250616-rk3588-csi-dphy-v1-0-84eb3b2a736c@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750150493; l=2785;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=wIvkTfx5p7asQqRE6ZowFTwrVX3fTKBqDPaE5VUrGmU=;
 b=WUajPaJyRXJCRO4z/Nr5IJPT1r7i6jSpEW5MfqDZyghW5BslEBXEeXgkw8ocDJ/cjV0k5YCaF
 IwbJL6eadG5A9FtESWu4ZkEHmOs6FBS7pB33AHWXWk914T8WAf+PxMY
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com

From: Michael Riesch <michael.riesch@collabora.com>

The Rockchip RK3588 MIPI CSI-2 DPHY can be supported using the existing
phy-rockchip-inno-csidphy driver, the notable differences being
 - the control bits in the GRF
 - the additional reset line
Add support for this variant.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-csidphy.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
index 75533d071025..0840be668bfd 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
@@ -30,6 +30,8 @@
 #define RK3568_GRF_VI_CON0		0x0340
 #define RK3568_GRF_VI_CON1		0x0344
 
+#define RK3588_CSIDPHY_GRF_CON0		0x0000
+
 /* PHY */
 #define CSIDPHY_CTRL_LANE_ENABLE		0x00
 #define CSIDPHY_CTRL_LANE_ENABLE_CK		BIT(6)
@@ -115,6 +117,12 @@ static const struct dphy_reg rk3568_grf_dphy_regs[] = {
 	[GRF_DPHY_CSIPHY_CLKLANE_EN] = PHY_REG(RK3568_GRF_VI_CON0, 1, 8),
 };
 
+static const struct dphy_reg rk3588_grf_dphy_regs[] = {
+	[GRF_DPHY_CSIPHY_FORCERXMODE] = PHY_REG(RK3588_CSIDPHY_GRF_CON0, 4, 0),
+	[GRF_DPHY_CSIPHY_DATALANE_EN] = PHY_REG(RK3588_CSIDPHY_GRF_CON0, 4, 4),
+	[GRF_DPHY_CSIPHY_CLKLANE_EN] = PHY_REG(RK3588_CSIDPHY_GRF_CON0, 1, 8),
+};
+
 struct hsfreq_range {
 	u32 range_h;
 	u8 cfg_bit;
@@ -373,6 +381,15 @@ static const struct dphy_drv_data rk3568_mipidphy_drv_data = {
 	.grf_regs = rk3568_grf_dphy_regs,
 };
 
+static const struct dphy_drv_data rk3588_mipidphy_drv_data = {
+	.pwrctl_offset = -1,
+	.ths_settle_offset = RK3568_CSIDPHY_CLK_WR_THS_SETTLE,
+	.calib_offset = RK3568_CSIDPHY_CLK_CALIB_EN,
+	.hsfreq_ranges = rk1808_mipidphy_hsfreq_ranges,
+	.num_hsfreq_ranges = ARRAY_SIZE(rk1808_mipidphy_hsfreq_ranges),
+	.grf_regs = rk3588_grf_dphy_regs,
+};
+
 static const struct of_device_id rockchip_inno_csidphy_match_id[] = {
 	{
 		.compatible = "rockchip,px30-csi-dphy",
@@ -394,6 +411,10 @@ static const struct of_device_id rockchip_inno_csidphy_match_id[] = {
 		.compatible = "rockchip,rk3568-csi-dphy",
 		.data = &rk3568_mipidphy_drv_data,
 	},
+	{
+		.compatible = "rockchip,rk3588-csi-dphy",
+		.data = &rk3588_mipidphy_drv_data,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, rockchip_inno_csidphy_match_id);
@@ -435,7 +456,7 @@ static int rockchip_inno_csidphy_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->pclk);
 	}
 
-	priv->rst = devm_reset_control_get(dev, "apb");
+	priv->rst = devm_reset_control_array_get(dev, RESET_CONTROL_EXCLUSIVE);
 	if (IS_ERR(priv->rst)) {
 		dev_err(dev, "failed to get system reset control\n");
 		return PTR_ERR(priv->rst);

-- 
2.39.5


