Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8092379C0
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 03:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746156919; cv=none; b=bRL4ldmqHA0meKuvUtMJ0odvbxrwDdQnIyIhPSc47h/PdHQKkUFRUyDmSJQta5owSz9OIm0wbb88w3CBajEyhoPym6MC8nC1zTWvUkDOKWP0HKUXhg38hY68gb04xTGq5d5c9m08Mz95yE5NPX9N/q8LBYKWSNLk2HI4I8+dq40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746156919; c=relaxed/simple;
	bh=/AqwtxrtSX92HB+ltd96zxBnqRXnaKye3tK5eqTrdl4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lN8V54M5OVyCkCCt0BtsoSZHT56XMFQLPmhf3xpKirMF7TdCpYaY9iwPwr5h1dfF+EsmpDVbgaHS1xBHgITk9YUA9Xqc1BDWtjkeXkpKrL3f/5Te/ner0iSSl2zPKHCvR7UYhl5CaQwf7hL9/109hucTNE4oyafE4RFnYJQvcV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=DWGmmypD; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="DWGmmypD"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5423YsRC321198
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 May 2025 22:34:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746156894;
	bh=5KWOJEGKQS82scl1TDsAbW4xFotjv57FL8CFCVogxNw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=DWGmmypDzhWwsACSHz2wQpcp+1odtFj88Y2PF/HDMlhQAQYqzcxDzQMu2jb5GkQbB
	 NFTSbS0UtMPfli63YJkgbOM6cnCuBiUwPPl3sxg8WJ+6xKTWDl9ypm8sUQsnPOkAst
	 NtXTFaAReXDL4r2HYWjUwWHs1OGQeVmt7LMVWY0A=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5423Ys19055232
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 May 2025 22:34:54 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 1
 May 2025 22:34:53 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 1 May 2025 22:34:53 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5423Yrhn061439;
	Thu, 1 May 2025 22:34:53 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <vkoul@kernel.org>, <kishon@kernel.org>, <mripard@kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <sakari.ailus@linux.intel.com>, <u.kleine-koenig@baylibre.com>,
        <vigneshr@ti.com>, <aradhya.bhatia@linux.dev>, <s-jain1@ti.com>,
        <r-donadkar@ti.com>, <tomi.valkeinen@ideasonboard.com>,
        <devarsht@ti.com>
Subject: [PATCH v3 1/2] phy: cadence: cdns-dphy: Fix PLL lock and O_CMN_READY polling
Date: Fri, 2 May 2025 09:04:50 +0530
Message-ID: <20250502033451.2291330-2-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20250502033451.2291330-1-devarsht@ti.com>
References: <20250502033451.2291330-1-devarsht@ti.com>
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
machine gets enabled (by programming DPHY_CMN_SSM register), but driver was
polling them before the common state machine was enabled. To fix this :

- Add new function callbacks for polling on PLL lock and O_CMN_READY
  assertion.
- As state machine and clocks get enabled in power_on callback only, move
  the clock related programming part from configure callback to power_on
  callback and poll for the PLL lockup and O_CMN_READY assertion after
  state machine gets enabled.
- The configure callback only saves the PLL configuration received from the
  client driver which will be applied later on in power_on callback.
- Add checks to ensure configure is called before power_on and state
  machine is in disabled state before power_on callback is called.
- Disable state machine in power_off so that client driver can
  re-configure the PLL by following up a power_off, configure, power_on
  sequence.

Cc: stable@vger.kernel.org
Fixes: 7a343c8bf4b5 ("phy: Add Cadence D-PHY support")
Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
V3:
- Move out clock programming logic to power_on as PLL polling and enable
  can happen only after SSM enable
- Disable state machine on power off

V2: 
- Return error code on polling timeout
- Moved out calibration logic to separate patch

 drivers/phy/cadence/cdns-dphy.c | 109 +++++++++++++++++++++++++-------
 1 file changed, 85 insertions(+), 24 deletions(-)

diff --git a/drivers/phy/cadence/cdns-dphy.c b/drivers/phy/cadence/cdns-dphy.c
index ed87a3970f83..a94109a63788 100644
--- a/drivers/phy/cadence/cdns-dphy.c
+++ b/drivers/phy/cadence/cdns-dphy.c
@@ -79,6 +79,7 @@ struct cdns_dphy_cfg {
 	u8 pll_ipdiv;
 	u8 pll_opdiv;
 	u16 pll_fbdiv;
+	u64 hs_clk_rate;
 	unsigned int nlanes;
 };
 
@@ -99,6 +100,8 @@ struct cdns_dphy_ops {
 	void (*set_pll_cfg)(struct cdns_dphy *dphy,
 			    const struct cdns_dphy_cfg *cfg);
 	unsigned long (*get_wakeup_time_ns)(struct cdns_dphy *dphy);
+	int (*wait_for_pll_lock)(struct cdns_dphy *dphy);
+	int (*wait_for_cmn_ready)(struct cdns_dphy *dphy);
 };
 
 struct cdns_dphy {
@@ -108,6 +111,8 @@ struct cdns_dphy {
 	struct clk *pll_ref_clk;
 	const struct cdns_dphy_ops *ops;
 	struct phy *phy;
+	bool is_configured;
+	bool is_powered;
 };
 
 /* Order of bands is important since the index is the band number. */
@@ -191,6 +196,26 @@ static unsigned long cdns_dphy_get_wakeup_time_ns(struct cdns_dphy *dphy)
 	return dphy->ops->get_wakeup_time_ns(dphy);
 }
 
+static int cdns_dphy_wait_for_pll_lock(struct cdns_dphy *dphy)
+{
+	int ret = 0;
+
+	if (dphy->ops->wait_for_pll_lock)
+		ret = dphy->ops->wait_for_pll_lock(dphy);
+
+	return ret;
+}
+
+static int cdns_dphy_wait_for_cmn_ready(struct cdns_dphy *dphy)
+{
+	int ret = 0;
+
+	if (dphy->ops->wait_for_cmn_ready)
+		ret = dphy->ops->wait_for_cmn_ready(dphy);
+
+	return ret;
+}
+
 static unsigned long cdns_dphy_ref_get_wakeup_time_ns(struct cdns_dphy *dphy)
 {
 	/* Default wakeup time is 800 ns (in a simulated environment). */
@@ -232,7 +257,6 @@ static unsigned long cdns_dphy_j721e_get_wakeup_time_ns(struct cdns_dphy *dphy)
 static void cdns_dphy_j721e_set_pll_cfg(struct cdns_dphy *dphy,
 					const struct cdns_dphy_cfg *cfg)
 {
-	u32 status;
 
 	/*
 	 * set the PWM and PLL Byteclk divider settings to recommended values
@@ -249,13 +273,6 @@ static void cdns_dphy_j721e_set_pll_cfg(struct cdns_dphy *dphy,
 
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
@@ -263,6 +280,23 @@ static void cdns_dphy_j721e_set_psm_div(struct cdns_dphy *dphy, u8 div)
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
@@ -278,6 +312,8 @@ static const struct cdns_dphy_ops j721e_dphy_ops = {
 	.get_wakeup_time_ns = cdns_dphy_j721e_get_wakeup_time_ns,
 	.set_pll_cfg = cdns_dphy_j721e_set_pll_cfg,
 	.set_psm_div = cdns_dphy_j721e_set_psm_div,
+	.wait_for_pll_lock = cdns_dphy_j721e_wait_for_pll_lock,
+	.wait_for_cmn_ready = cdns_dphy_j721e_wait_for_cmn_ready,
 };
 
 static int cdns_dphy_config_from_opts(struct phy *phy,
@@ -298,6 +334,7 @@ static int cdns_dphy_config_from_opts(struct phy *phy,
 		return ret;
 
 	opts->wakeup = cdns_dphy_get_wakeup_time_ns(dphy) / 1000;
+	cfg->hs_clk_rate = opts->hs_clk_rate;
 
 	return 0;
 }
@@ -334,13 +371,23 @@ static int cdns_dphy_validate(struct phy *phy, enum phy_mode mode, int submode,
 static int cdns_dphy_configure(struct phy *phy, union phy_configure_opts *opts)
 {
 	struct cdns_dphy *dphy = phy_get_drvdata(phy);
-	struct cdns_dphy_cfg cfg = { 0 };
-	int ret, band_ctrl;
-	unsigned int reg;
+	int ret = 0;
 
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
+	int ret = 0, band_ctrl;
+	u32 reg;
+
+	if (!dphy->is_configured || dphy->is_powered)
+		return -EINVAL;
 
 	/*
 	 * Configure the internal PSM clk divider so that the DPHY has a
@@ -363,9 +410,9 @@ static int cdns_dphy_configure(struct phy *phy, union phy_configure_opts *opts)
 	 * Configure the DPHY PLL that will be used to generate the TX byte
 	 * clk.
 	 */
-	cdns_dphy_set_pll_cfg(dphy, &cfg);
+	cdns_dphy_set_pll_cfg(dphy, &dphy->cfg);
 
-	band_ctrl = cdns_dphy_tx_get_band_ctrl(opts->mipi_dphy.hs_clk_rate);
+	band_ctrl = cdns_dphy_tx_get_band_ctrl(dphy->cfg.hs_clk_rate);
 	if (band_ctrl < 0)
 		return band_ctrl;
 
@@ -373,19 +420,26 @@ static int cdns_dphy_configure(struct phy *phy, union phy_configure_opts *opts)
 	      FIELD_PREP(DPHY_BAND_CFG_RIGHT_BAND, band_ctrl);
 	writel(reg, dphy->regs + DPHY_BAND_CFG);
 
-	return 0;
-}
+	/* Start TX state machine. */
+	writel(DPHY_CMN_SSM_EN | DPHY_CMN_TX_MODE_EN,
+	       dphy->regs + DPHY_CMN_SSM);
 
-static int cdns_dphy_power_on(struct phy *phy)
-{
-	struct cdns_dphy *dphy = phy_get_drvdata(phy);
+	ret = cdns_dphy_wait_for_pll_lock(dphy);
+	if (ret) {
+		dev_err(&dphy->phy->dev, "Failed to lock PLL with err %d\n", ret);
+		return ret;
+	}
+
+	ret = cdns_dphy_wait_for_cmn_ready(dphy);
+	if (ret) {
+		dev_err(&dphy->phy->dev, "O_CMN_READY signal failed to assert with err %d\n", ret);
+		return ret;
+	}
 
 	clk_prepare_enable(dphy->psm_clk);
 	clk_prepare_enable(dphy->pll_ref_clk);
 
-	/* Start TX state machine. */
-	writel(DPHY_CMN_SSM_EN | DPHY_CMN_TX_MODE_EN,
-	       dphy->regs + DPHY_CMN_SSM);
+	dphy->is_powered = true;
 
 	return 0;
 }
@@ -393,10 +447,17 @@ static int cdns_dphy_power_on(struct phy *phy)
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

