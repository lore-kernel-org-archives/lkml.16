Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD022FD58F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 12:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751633976; cv=none; b=O/sVH0rOW4rBZd0zcIOMorm7J58v0g2pfDVbqHOYshCxRv2pA/yUbJBFQg+PQ9BqMoY4PVEx1YINqIv61bG485N/rz7MxykyF8vEvgPmmatSYPK+abyOn9RYUCzjdtAwT1IL3ZMjnBt29/0eMSvp2bzS+bPXFIL3qUlk/IpN7kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751633976; c=relaxed/simple;
	bh=I0xDeoC6BnCu1H1KJPZk7UzFgTHjxKeWP9xbfBP95uI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LxQ0+t3d9vwrV+zSDHV+tPyz7GpoUvAKQEnCWS7G8Bh1z3v2WjHCYsh8tJTjDz/vmeSBnbxlEe4Xj9IrpnYaDUROn0Ay5Tn677W5aH4TKPOh5Iad/00ntTISWCB+UrCOtzsB9qafP+XWNLcEW5doG5RUILHQVFwEqyCZdb0PglM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=w3DF5gs9; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="w3DF5gs9"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 564CxIlU001124;
	Fri, 4 Jul 2025 07:59:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751633958;
	bh=6eRSYtc4VAa/ASR4kOdAWnMYS6zY1bKLsxH0AG2FRHs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=w3DF5gs9BnbGDGwGRuZ2jadzvZPwQIErAY9OQYsc3jMmhQ5zR8Gs4C8yk/hRplKSJ
	 FJbFnH58wAMpVjlTlAOwClDefcEQ0QEVpN33r+oYoBxTiKlQVQnpQAVc9Nn7iO5SQM
	 uDGb+VPUEEurgOUPAZuR204cTAXVUvDPkpu4MStw=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 564CxImn3404581
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 4 Jul 2025 07:59:18 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 4
 Jul 2025 07:59:17 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 4 Jul 2025 07:59:18 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 564CxHuZ2774155;
	Fri, 4 Jul 2025 07:59:17 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <vkoul@kernel.org>, <kishon@kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC: <aradhya.bhatia@linux.dev>, <s-jain1@ti.com>, <r-donadkar@ti.com>,
        <tomi.valkeinen@ideasonboard.com>, <j-choudhary@ti.com>,
        <a0512644@ti.com>, <devarsht@ti.com>
Subject: [PATCH v4 1/2] phy: cadence: cdns-dphy: Fix PLL lock and O_CMN_READY polling
Date: Fri, 4 Jul 2025 18:29:14 +0530
Message-ID: <20250704125915.1224738-2-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20250704125915.1224738-1-devarsht@ti.com>
References: <20250704125915.1224738-1-devarsht@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

PLL lockup and O_CMN_READY assertion can only happen after common state
machine gets enabled by programming DPHY_CMN_SSM register, but driver was
polling them before the common state machine was enabled which is
incorrect.  This is as per the DPHY initialization sequence as mentioned in
J721E TRM [1] at section "12.7.2.4.1.2.1 Start-up Sequence Timing Diagram".
It shows O_CMN_READY polling at the end after common configuration pin
setup where the common configuration pin setup step enables state machine
as referenced in "Table 12-1533. Common Configuration-Related Setup
mentions state machine"

To fix this :
- Add new function callbacks for polling on PLL lock and O_CMN_READY
  assertion.
- As state machine and clocks get enabled in power_on callback only, move
  the clock related programming part from configure callback to power_on
callback and poll for the PLL lockup and O_CMN_READY assertion after state
machine gets enabled.
- The configure callback only saves the PLL configuration received from the
  client driver which will be applied later on in power_on callback.
- Add checks to ensure configure is called before power_on and state
  machine is in disabled state before power_on callback is called.
- Disable state machine in power_off so that client driver can re-configure
  the PLL by following up a power_off, configure, power_on sequence.

[1]: https://www.ti.com/lit/zip/spruil1

Cc: stable@vger.kernel.org
Fixes: 7a343c8bf4b5 ("phy: Add Cadence D-PHY support")
Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
V4:
- Optimize wait_for_pll_lock, wait_for_cmn_ready calls to oneline
  using conditional operator
- Remove superflous init for ret variable in cdns_dphy_configure
- Enable pll and psm ref clocks before configuring PLL
- Update commit message to refer to TRM
- Rebased on top of:
  https://lore.kernel.org/all/20250618-cdns-dsi-impro-v4-4-862c841dbe02@ideasonboard.com/
  https://lore.kernel.org/all/20250618-cdns-dsi-impro-v4-5-862c841dbe02@ideasonboard.com/
  from the series:
  https://lore.kernel.org/all/20250618-cdns-dsi-impro-v4-0-862c841dbe02@ideasonboard.com/

V3:
- Move out clock programming logic to power_on as PLL polling and enable
  can happen only after SSM enable
- Disable state machine on power off

V2:
- Return error code on polling timeout
- Moved out calibration logic to separate patch

 drivers/phy/cadence/cdns-dphy.c | 124 +++++++++++++++++++++++---------
 1 file changed, 92 insertions(+), 32 deletions(-)

diff --git a/drivers/phy/cadence/cdns-dphy.c b/drivers/phy/cadence/cdns-dphy.c
index 33a42e72362e..da8de0a9d086 100644
--- a/drivers/phy/cadence/cdns-dphy.c
+++ b/drivers/phy/cadence/cdns-dphy.c
@@ -92,6 +92,8 @@ struct cdns_dphy_ops {
 	void (*set_pll_cfg)(struct cdns_dphy *dphy,
 			    const struct cdns_dphy_cfg *cfg);
 	unsigned long (*get_wakeup_time_ns)(struct cdns_dphy *dphy);
+	int (*wait_for_pll_lock)(struct cdns_dphy *dphy);
+	int (*wait_for_cmn_ready)(struct cdns_dphy *dphy);
 };
 
 struct cdns_dphy {
@@ -101,6 +103,8 @@ struct cdns_dphy {
 	struct clk *pll_ref_clk;
 	const struct cdns_dphy_ops *ops;
 	struct phy *phy;
+	bool is_configured;
+	bool is_powered;
 };
 
 /* Order of bands is important since the index is the band number. */
@@ -186,6 +190,16 @@ static unsigned long cdns_dphy_get_wakeup_time_ns(struct cdns_dphy *dphy)
 	return dphy->ops->get_wakeup_time_ns(dphy);
 }
 
+static int cdns_dphy_wait_for_pll_lock(struct cdns_dphy *dphy)
+{
+	return dphy->ops->wait_for_pll_lock ? dphy->ops->wait_for_pll_lock(dphy) : 0;
+}
+
+static int cdns_dphy_wait_for_cmn_ready(struct cdns_dphy *dphy)
+{
+	return  dphy->ops->wait_for_cmn_ready ? dphy->ops->wait_for_cmn_ready(dphy) : 0;
+}
+
 static unsigned long cdns_dphy_ref_get_wakeup_time_ns(struct cdns_dphy *dphy)
 {
 	/* Default wakeup time is 800 ns (in a simulated environment). */
@@ -227,7 +241,6 @@ static unsigned long cdns_dphy_j721e_get_wakeup_time_ns(struct cdns_dphy *dphy)
 static void cdns_dphy_j721e_set_pll_cfg(struct cdns_dphy *dphy,
 					const struct cdns_dphy_cfg *cfg)
 {
-	u32 status;
 
 	/*
 	 * set the PWM and PLL Byteclk divider settings to recommended values
@@ -244,13 +257,6 @@ static void cdns_dphy_j721e_set_pll_cfg(struct cdns_dphy *dphy,
 
 	writel(DPHY_TX_J721E_WIZ_LANE_RSTB,
 	       dphy->regs + DPHY_TX_J721E_WIZ_RST_CTRL);
-
-	readl_poll_timeout(dphy->regs + DPHY_TX_J721E_WIZ_PLL_CTRL, status,
-			   (status & DPHY_TX_WIZ_PLL_LOCK), 0, POLL_TIMEOUT_US);
-
-	readl_poll_timeout(dphy->regs + DPHY_TX_J721E_WIZ_STATUS, status,
-			   (status & DPHY_TX_WIZ_O_CMN_READY), 0,
-			   POLL_TIMEOUT_US);
 }
 
 static void cdns_dphy_j721e_set_psm_div(struct cdns_dphy *dphy, u8 div)
@@ -258,6 +264,23 @@ static void cdns_dphy_j721e_set_psm_div(struct cdns_dphy *dphy, u8 div)
 	writel(div, dphy->regs + DPHY_TX_J721E_WIZ_PSM_FREQ);
 }
 
+static int cdns_dphy_j721e_wait_for_pll_lock(struct cdns_dphy *dphy)
+{
+	u32 status;
+
+	return readl_poll_timeout(dphy->regs + DPHY_TX_J721E_WIZ_PLL_CTRL, status,
+			       status & DPHY_TX_WIZ_PLL_LOCK, 0, POLL_TIMEOUT_US);
+}
+
+static int cdns_dphy_j721e_wait_for_cmn_ready(struct cdns_dphy *dphy)
+{
+	u32 status;
+
+	return readl_poll_timeout(dphy->regs + DPHY_TX_J721E_WIZ_STATUS, status,
+			       status & DPHY_TX_WIZ_O_CMN_READY, 0,
+			       POLL_TIMEOUT_US);
+}
+
 /*
  * This is the reference implementation of DPHY hooks. Specific integration of
  * this IP may have to re-implement some of them depending on how they decided
@@ -273,6 +296,8 @@ static const struct cdns_dphy_ops j721e_dphy_ops = {
 	.get_wakeup_time_ns = cdns_dphy_j721e_get_wakeup_time_ns,
 	.set_pll_cfg = cdns_dphy_j721e_set_pll_cfg,
 	.set_psm_div = cdns_dphy_j721e_set_psm_div,
+	.wait_for_pll_lock = cdns_dphy_j721e_wait_for_pll_lock,
+	.wait_for_cmn_ready = cdns_dphy_j721e_wait_for_cmn_ready,
 };
 
 static int cdns_dphy_config_from_opts(struct phy *phy,
@@ -328,21 +353,36 @@ static int cdns_dphy_validate(struct phy *phy, enum phy_mode mode, int submode,
 static int cdns_dphy_configure(struct phy *phy, union phy_configure_opts *opts)
 {
 	struct cdns_dphy *dphy = phy_get_drvdata(phy);
-	struct cdns_dphy_cfg cfg = { 0 };
-	int ret, band_ctrl;
-	unsigned int reg;
+	int ret;
 
-	ret = cdns_dphy_config_from_opts(phy, &opts->mipi_dphy, &cfg);
-	if (ret)
-		return ret;
+	ret = cdns_dphy_config_from_opts(phy, &opts->mipi_dphy, &dphy->cfg);
+	if (!ret)
+		dphy->is_configured = true;
+
+	return ret;
+}
+
+static int cdns_dphy_power_on(struct phy *phy)
+{
+	struct cdns_dphy *dphy = phy_get_drvdata(phy);
+	int ret;
+	u32 reg;
+
+	if (!dphy->is_configured || dphy->is_powered)
+		return -EINVAL;
+
+	clk_prepare_enable(dphy->psm_clk);
+	clk_prepare_enable(dphy->pll_ref_clk);
 
 	/*
 	 * Configure the internal PSM clk divider so that the DPHY has a
 	 * 1MHz clk (or something close).
 	 */
 	ret = cdns_dphy_setup_psm(dphy);
-	if (ret)
-		return ret;
+	if (ret) {
+		dev_err(&dphy->phy->dev, "Failed to setup PSM with error %d\n", ret);
+		goto err_power_on;
+	}
 
 	/*
 	 * Configure attach clk lanes to data lanes: the DPHY has 2 clk lanes
@@ -357,40 +397,60 @@ static int cdns_dphy_configure(struct phy *phy, union phy_configure_opts *opts)
 	 * Configure the DPHY PLL that will be used to generate the TX byte
 	 * clk.
 	 */
-	cdns_dphy_set_pll_cfg(dphy, &cfg);
+	cdns_dphy_set_pll_cfg(dphy, &dphy->cfg);
 
-	band_ctrl = cdns_dphy_tx_get_band_ctrl(opts->mipi_dphy.hs_clk_rate);
-	if (band_ctrl < 0)
-		return band_ctrl;
+	ret = cdns_dphy_tx_get_band_ctrl(dphy->cfg.hs_clk_rate);
+	if (ret < 0) {
+		dev_err(&dphy->phy->dev, "Failed to get band control value with error %d\n", ret);
+		goto err_power_on;
+	}
 
-	reg = FIELD_PREP(DPHY_BAND_CFG_LEFT_BAND, band_ctrl) |
-	      FIELD_PREP(DPHY_BAND_CFG_RIGHT_BAND, band_ctrl);
+	reg = FIELD_PREP(DPHY_BAND_CFG_LEFT_BAND, ret) |
+	      FIELD_PREP(DPHY_BAND_CFG_RIGHT_BAND, ret);
 	writel(reg, dphy->regs + DPHY_BAND_CFG);
 
-	return 0;
-}
-
-static int cdns_dphy_power_on(struct phy *phy)
-{
-	struct cdns_dphy *dphy = phy_get_drvdata(phy);
-
-	clk_prepare_enable(dphy->psm_clk);
-	clk_prepare_enable(dphy->pll_ref_clk);
-
 	/* Start TX state machine. */
 	writel(DPHY_CMN_SSM_EN | DPHY_CMN_TX_MODE_EN,
 	       dphy->regs + DPHY_CMN_SSM);
 
+	ret = cdns_dphy_wait_for_pll_lock(dphy);
+	if (ret) {
+		dev_err(&dphy->phy->dev, "Failed to lock PLL with error %d\n", ret);
+		goto err_power_on;
+	}
+
+	ret = cdns_dphy_wait_for_cmn_ready(dphy);
+	if (ret) {
+		dev_err(&dphy->phy->dev, "O_CMN_READY signal failed to assert with error %d\n",
+			ret);
+		goto err_power_on;
+	}
+
+	dphy->is_powered = true;
+
 	return 0;
+
+err_power_on:
+	clk_disable_unprepare(dphy->pll_ref_clk);
+	clk_disable_unprepare(dphy->psm_clk);
+
+	return ret;
 }
 
 static int cdns_dphy_power_off(struct phy *phy)
 {
 	struct cdns_dphy *dphy = phy_get_drvdata(phy);
+	u32 reg;
 
 	clk_disable_unprepare(dphy->pll_ref_clk);
 	clk_disable_unprepare(dphy->psm_clk);
 
+	/* Stop TX state machine. */
+	reg = readl(dphy->regs + DPHY_CMN_SSM);
+	writel(reg & ~DPHY_CMN_SSM_EN, dphy->regs + DPHY_CMN_SSM);
+
+	dphy->is_powered = false;
+
 	return 0;
 }
 
-- 
2.39.1

