Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290211885B4;
	Sat,  3 May 2025 20:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746303333; cv=none; b=G8g1XYKQlUAcyU69ColEywQOt5Qw+u4f6QaoKtTnG55ciAs4cKN9bUyy7IvqodFl0+8RhKOHQQdNql4jTzlQ0xeqCNipmKW1WCWzgNcCoB5h2p5AEZzBu1VWfibea0btoUG0W19MRzPiU8UMVI5Tls/3WBFk9hWVc+Aq+OD/v3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746303333; c=relaxed/simple;
	bh=9I/sWQtpZViWyGi5M9fn2OyPiwQvWlLcqnBkwYv/Jas=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N9V6aaIr7GFuZhChG81d7/C6oX6yep/ryA3dyUmOpbi5b1TaAyxoGBdGDOV1/9/f9Z4faCulNJm+s19fXPrjcXeUXTxpTemeJGOK1JCNpVD45cj4TKpLtoaBlca5neAqlA50cguzAAyOyd01GtaViAz+hQTZsz6mFgxPEXP61UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=yVd335sG; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="yVd335sG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=f1bGcGDZkcMjtDsFXsTQIqCO4bWB1SufYWtStJKzTEs=; b=yVd335sGwdCJ6BrPo5XYqA2h8e
	6tI9gG1XjG3+rCKTVXK5hikaHjG5IYA27GiulLKRpI6qK8nhWNadW1c+KwIOff+T0gBuwPTW35bD2
	IE7K3sdlMXI0nyj6IMXKOTRdQWNvqXWG20y7ptgu7yHRcSoG6mhKRHExaYBn+4V1a0lhgumwEI8nT
	HvvoEzktKFwAZOmx56Zebw8H7fBeUzKTWlDrLl/OL6TIe7OdAJ4Nqkx/H5rY+zOLv++UCY8koGOdM
	9zM3dr0uBU1qwUP3O/o37I+0q4vwQxqv3hqFnFkFT8QwAGHTp/ObsfwjnqglW7BhC/0LNV24QG8w8
	Mg43eVcw==;
Received: from i53875bbc.versanet.de ([83.135.91.188] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uBJGh-0001hY-Um; Sat, 03 May 2025 22:15:28 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: vkoul@kernel.org,
	kishon@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] phy: rockchip: inno-usb2: add phy definition for rk3036
Date: Sat,  3 May 2025 22:15:11 +0200
Message-ID: <20250503201512.991277-3-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250503201512.991277-1-heiko@sntech.de>
References: <20250503201512.991277-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The usb2phy on rk3036 is very similar to rk3128 but not 100% identical.
While most registers and bits are the same, a small fraction did get moved
around.

So we can re-use the phy-tuning function, but need a new set a bits.
The biggest change might be that the phy on rk3036 does not support the
charger detection, that rk3128 (and newer phys) have.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index b5e6a864deeb..32fdd64d7c2a 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -1583,6 +1583,37 @@ static int rk3588_usb2phy_tuning(struct rockchip_usb2phy *rphy)
 	return ret;
 }
 
+static const struct rockchip_usb2phy_cfg rk3036_phy_cfgs[] = {
+	{
+		.reg = 0x17c,
+		.num_ports	= 2,
+		.phy_tuning	= rk3128_usb2phy_tuning,
+		.clkout_ctl	= { 0x017c, 11, 11, 1, 0 },
+		.port_cfgs	= {
+			[USB2PHY_PORT_OTG] = {
+				.phy_sus	= { 0x017c, 8, 0, 0, 0x1d1 },
+				.bvalid_det_en	= { 0x017c, 14, 14, 0, 1 },
+				.bvalid_det_st	= { 0x017c, 15, 15, 0, 1 },
+				.bvalid_det_clr	= { 0x017c, 15, 15, 0, 1 },
+				.ls_det_en	= { 0x017c, 12, 12, 0, 1 },
+				.ls_det_st	= { 0x017c, 13, 13, 0, 1 },
+				.ls_det_clr	= { 0x017c, 13, 13, 0, 1 },
+				.utmi_bvalid	= { 0x014c, 8, 8, 0, 1 },
+				.utmi_id	= { 0x014c, 11, 11, 0, 1 },
+				.utmi_ls	= { 0x014c, 10, 9, 0, 1 },
+
+			},
+			[USB2PHY_PORT_HOST] = {
+				.phy_sus	= { 0x0194, 8, 0, 0, 0x1d1 },
+				.ls_det_en	= { 0x0194, 14, 14, 0, 1 },
+				.ls_det_st	= { 0x0194, 15, 15, 0, 1 },
+				.ls_det_clr	= { 0x0194, 15, 15, 0, 1 }
+			}
+		},
+	},
+	{ /* sentinel */ }
+};
+
 static const struct rockchip_usb2phy_cfg rk3128_phy_cfgs[] = {
 	{
 		.reg = 0x17c,
@@ -2204,6 +2235,7 @@ static const struct rockchip_usb2phy_cfg rv1108_phy_cfgs[] = {
 
 static const struct of_device_id rockchip_usb2phy_dt_match[] = {
 	{ .compatible = "rockchip,px30-usb2phy", .data = &rk3328_phy_cfgs },
+	{ .compatible = "rockchip,rk3036-usb2phy", .data = &rk3036_phy_cfgs },
 	{ .compatible = "rockchip,rk3128-usb2phy", .data = &rk3128_phy_cfgs },
 	{ .compatible = "rockchip,rk3228-usb2phy", .data = &rk3228_phy_cfgs },
 	{ .compatible = "rockchip,rk3308-usb2phy", .data = &rk3308_phy_cfgs },
-- 
2.47.2

