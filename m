Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC94E1EEA4D
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 06:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750056464; cv=none; b=IXx+39uOqi9tGBhep/4eAzjEqtxea3mVgLI7YzthbkNEZyjuyQHzClS82TGt6w8D9sra1BxjAZgGXhrsisKA9HT3oDcscmwa7HBohgrP06enYOJeLXqZUa+P1ByeuIEB5byEgV1dVJYalO67rw2LD79ZTCCN+DWBgZuviPlJbi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750056464; c=relaxed/simple;
	bh=lhDBabnMGa6gVzwwG3E0BbqVgM0h91lBKMw72syQGWI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nox+ZtuTBrs/r+3aBPpyi72mzPazEQe43hR/Ne7Y7If07qYehpMIDAm5SLky8ekfWb3BAsKp9CdwXaXr4wOWr748hsYImxlNNuB1GnS7VKRUlNyOp+XOXWhuNgs3SN1vkeUgKQqtCRS8dQkYOZDVrbnd2KkCEvdWySSHBKX/GF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=iTT2n4nP; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="iTT2n4nP"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55G6lEx32513225;
	Mon, 16 Jun 2025 01:47:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750056434;
	bh=S6BXEeXEeozfsESlUOgc0qg+v45RGU438oFQpmXKSRM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=iTT2n4nP4qEtPX0ec4eDDmY3BA/YS2jQHeGcMGlB1k8o1cgL9CS6eds3XIzBVXhVd
	 89g01phPxJEusVac+zYdECeunvVo97dhf+udfTbin2NUMxbOq/OWsCqU7QKV+b58zz
	 nMt8Ua+m0kxIB9xJ9pdqMlSTYETh67xl3CbaMJIU=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55G6lEVU720022
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 16 Jun 2025 01:47:14 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 16
 Jun 2025 01:47:14 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 16 Jun 2025 01:47:14 -0500
Received: from uda0492258.dhcp.ti.com (dhcp-172-24-227-169.dhcp.ti.com [172.24.227.169])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55G6l6Cn3805820;
	Mon, 16 Jun 2025 01:47:10 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <vkoul@kernel.org>, <kishon@kernel.org>, <sjakhade@cadence.com>,
        <rogerq@kernel.org>, <christophe.jaillet@wanadoo.fr>,
        <u.kleine-koenig@baylibre.com>, <eballetb@redhat.com>,
        <make24@iscas.ac.cn>
CC: <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH v4 1/2] phy: cadence-torrent: Add PCIe multilink configuration for 100 MHz refclk
Date: Mon, 16 Jun 2025 12:17:04 +0530
Message-ID: <20250616064705.3225758-2-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250616064705.3225758-1-s-vadapalli@ti.com>
References: <20250616064705.3225758-1-s-vadapalli@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

From: Swapnil Jakhade <sjakhade@cadence.com>

Add register sequences to support PCIe multilink configuration for 100MHz
reference clock. Maximum two PCIe links are supported.

Signed-off-by: Swapnil Jakhade <sjakhade@cadence.com>
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Reviewed-by: Roger Quadros <rogerq@kernel.org>
---

v3:
https://lore.kernel.org/r/20250109121614.754466-2-s-vadapalli@ti.com/
Changes since v3:
- Rebased on next-20250616.
- Collected Reviewed-by tag from:
  Roger Quadros <rogerq@kernel.org>

Regards,
Siddharth.

 drivers/phy/cadence/phy-cadence-torrent.c | 130 +++++++++++++++++++++-
 1 file changed, 129 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/cadence/phy-cadence-torrent.c b/drivers/phy/cadence/phy-cadence-torrent.c
index a281c0dfae97..1c5e96e2a188 100644
--- a/drivers/phy/cadence/phy-cadence-torrent.c
+++ b/drivers/phy/cadence/phy-cadence-torrent.c
@@ -197,6 +197,7 @@
 #define RX_SDCAL1_INIT_TMR		0x004CU
 #define RX_SDCAL1_ITER_TMR		0x004DU
 #define RX_CDRLF_CNFG			0x0080U
+#define RX_CDRLF_CNFG2			0x0081U
 #define RX_CDRLF_CNFG3			0x0082U
 #define RX_SIGDET_HL_FILT_TMR		0x0090U
 #define RX_REE_GCSM1_CTRL		0x0108U
@@ -204,6 +205,7 @@
 #define RX_REE_GCSM1_EQENM_PH2		0x010AU
 #define RX_REE_GCSM2_CTRL		0x0110U
 #define RX_REE_PERGCSM_CTRL		0x0118U
+#define RX_REE_PEAK_UTHR		0x0142U
 #define RX_REE_ATTEN_THR		0x0149U
 #define RX_REE_TAP1_CLIP		0x0171U
 #define RX_REE_TAP2TON_CLIP		0x0172U
@@ -212,6 +214,7 @@
 #define RX_DIAG_DFE_CTRL		0x01E0U
 #define RX_DIAG_DFE_AMP_TUNE_2		0x01E2U
 #define RX_DIAG_DFE_AMP_TUNE_3		0x01E3U
+#define RX_DIAG_REE_DAC_CTRL		0x01E4U
 #define RX_DIAG_NQST_CTRL		0x01E5U
 #define RX_DIAG_SIGDET_TUNE		0x01E8U
 #define RX_DIAG_PI_RATE			0x01F4U
@@ -3131,6 +3134,101 @@ static void cdns_torrent_phy_remove(struct platform_device *pdev)
 	cdns_torrent_clk_cleanup(cdns_phy);
 }
 
+/* Multi link PCIe configuration */
+static const struct cdns_reg_pairs ml_pcie_link_cmn_regs[] = {
+	{0x0002, PHY_PLL_CFG},
+	{0x0601, CMN_PDIAG_PLL0_CLK_SEL_M0}
+};
+
+static const struct cdns_reg_pairs ml_pcie_xcvr_diag_ln_regs[] = {
+	{0x0100, XCVR_DIAG_HSCLK_SEL},
+	{0x0001, XCVR_DIAG_HSCLK_DIV},
+	{0x0812, XCVR_DIAG_PLLDRC_CTRL}
+};
+
+static const struct cdns_torrent_vals ml_pcie_link_cmn_vals = {
+	.reg_pairs = ml_pcie_link_cmn_regs,
+	.num_regs = ARRAY_SIZE(ml_pcie_link_cmn_regs),
+};
+
+static const struct cdns_torrent_vals ml_pcie_xcvr_diag_ln_vals = {
+	.reg_pairs = ml_pcie_xcvr_diag_ln_regs,
+	.num_regs = ARRAY_SIZE(ml_pcie_xcvr_diag_ln_regs),
+};
+
+/* Multi link PCIe, 100 MHz Ref clk, no SSC */
+static const struct cdns_reg_pairs ml_pcie_100_no_ssc_cmn_regs[] = {
+	{0x0003, CMN_PLL0_VCOCAL_TCTRL},
+	{0x0003, CMN_PLL1_VCOCAL_TCTRL}
+};
+
+static const struct cdns_reg_pairs ml_pcie_100_no_ssc_rx_ln_regs[] = {
+	{0x0019, RX_REE_TAP1_CLIP},
+	{0x0019, RX_REE_TAP2TON_CLIP},
+	{0x0008, RX_REE_PEAK_UTHR},
+	{0x018E, RX_CDRLF_CNFG},
+	{0x2E33, RX_CDRLF_CNFG2},
+	{0x0001, RX_DIAG_ACYA},
+	{0x0C21, RX_DIAG_DFE_AMP_TUNE_2},
+	{0x0002, RX_DIAG_DFE_AMP_TUNE_3},
+	{0x0005, RX_DIAG_REE_DAC_CTRL}
+};
+
+static const struct cdns_torrent_vals ml_pcie_100_no_ssc_cmn_vals = {
+	.reg_pairs = ml_pcie_100_no_ssc_cmn_regs,
+	.num_regs = ARRAY_SIZE(ml_pcie_100_no_ssc_cmn_regs),
+};
+
+static const struct cdns_torrent_vals ml_pcie_100_no_ssc_rx_ln_vals = {
+	.reg_pairs = ml_pcie_100_no_ssc_rx_ln_regs,
+	.num_regs = ARRAY_SIZE(ml_pcie_100_no_ssc_rx_ln_regs),
+};
+
+/* Multi link PCIe, 100 MHz Ref clk, internal SSC */
+static const struct cdns_reg_pairs ml_pcie_100_int_ssc_cmn_regs[] = {
+	{0x0004, CMN_PLL0_DSM_DIAG_M0},
+	{0x0004, CMN_PLL1_DSM_DIAG_M0},
+	{0x0509, CMN_PDIAG_PLL0_CP_PADJ_M0},
+	{0x0509, CMN_PDIAG_PLL1_CP_PADJ_M0},
+	{0x0F00, CMN_PDIAG_PLL0_CP_IADJ_M0},
+	{0x0F00, CMN_PDIAG_PLL1_CP_IADJ_M0},
+	{0x0F08, CMN_PDIAG_PLL0_FILT_PADJ_M0},
+	{0x0F08, CMN_PDIAG_PLL1_FILT_PADJ_M0},
+	{0x0064, CMN_PLL0_INTDIV_M0},
+	{0x0050, CMN_PLL1_INTDIV_M0},
+	{0x0002, CMN_PLL0_FRACDIVH_M0},
+	{0x0002, CMN_PLL1_FRACDIVH_M0},
+	{0x0044, CMN_PLL0_HIGH_THR_M0},
+	{0x0036, CMN_PLL1_HIGH_THR_M0},
+	{0x0002, CMN_PDIAG_PLL0_CTRL_M0},
+	{0x0002, CMN_PDIAG_PLL1_CTRL_M0},
+	{0x0001, CMN_PLL0_SS_CTRL1_M0},
+	{0x0001, CMN_PLL1_SS_CTRL1_M0},
+	{0x011B, CMN_PLL0_SS_CTRL2_M0},
+	{0x011B, CMN_PLL1_SS_CTRL2_M0},
+	{0x006E, CMN_PLL0_SS_CTRL3_M0},
+	{0x0058, CMN_PLL1_SS_CTRL3_M0},
+	{0x000E, CMN_PLL0_SS_CTRL4_M0},
+	{0x0012, CMN_PLL1_SS_CTRL4_M0},
+	{0x0C5E, CMN_PLL0_VCOCAL_REFTIM_START},
+	{0x0C5E, CMN_PLL1_VCOCAL_REFTIM_START},
+	{0x0C56, CMN_PLL0_VCOCAL_PLLCNT_START},
+	{0x0C56, CMN_PLL1_VCOCAL_PLLCNT_START},
+	{0x0003, CMN_PLL0_VCOCAL_TCTRL},
+	{0x0003, CMN_PLL1_VCOCAL_TCTRL},
+	{0x00C7, CMN_PLL0_LOCK_REFCNT_START},
+	{0x00C7, CMN_PLL1_LOCK_REFCNT_START},
+	{0x00C7, CMN_PLL0_LOCK_PLLCNT_START},
+	{0x00C7, CMN_PLL1_LOCK_PLLCNT_START},
+	{0x0005, CMN_PLL0_LOCK_PLLCNT_THR},
+	{0x0005, CMN_PLL1_LOCK_PLLCNT_THR}
+};
+
+static const struct cdns_torrent_vals ml_pcie_100_int_ssc_cmn_vals = {
+	.reg_pairs = ml_pcie_100_int_ssc_cmn_regs,
+	.num_regs = ARRAY_SIZE(ml_pcie_100_int_ssc_cmn_regs),
+};
+
 /* SGMII and QSGMII link configuration */
 static const struct cdns_reg_pairs sgmii_qsgmii_link_cmn_regs[] = {
 	{0x0002, PHY_PLL_CFG}
@@ -4531,7 +4629,7 @@ static const struct cdns_torrent_vals sl_sgmii_xcvr_diag_ln_vals = {
 	.num_regs = ARRAY_SIZE(sl_sgmii_xcvr_diag_ln_regs),
 };
 
-/* Multi link PCIe, 100 MHz Ref clk, internal SSC */
+/* For PCIe (with some other protocol), 100 MHz Ref clk, internal SSC */
 static const struct cdns_reg_pairs pcie_100_int_ssc_cmn_regs[] = {
 	{0x0004, CMN_PLL0_DSM_DIAG_M0},
 	{0x0004, CMN_PLL0_DSM_DIAG_M1},
@@ -4670,6 +4768,7 @@ static const struct cdns_torrent_vals_entry link_cmn_vals_entries[] = {
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_DP, TYPE_USB), &usb_dp_link_cmn_vals},
 
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE, TYPE_NONE), NULL},
+	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE, TYPE_PCIE), &ml_pcie_link_cmn_vals},
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE, TYPE_SGMII), &pcie_sgmii_link_cmn_vals},
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE, TYPE_QSGMII), &pcie_sgmii_link_cmn_vals},
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE, TYPE_USB), &pcie_usb_link_cmn_vals},
@@ -4706,6 +4805,7 @@ static const struct cdns_torrent_vals_entry xcvr_diag_vals_entries[] = {
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_DP, TYPE_USB), &dp_usb_xcvr_diag_ln_vals},
 
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE, TYPE_NONE), NULL},
+	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE, TYPE_PCIE), &ml_pcie_xcvr_diag_ln_vals},
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE, TYPE_SGMII), &pcie_sgmii_xcvr_diag_ln_vals},
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE, TYPE_QSGMII), &pcie_sgmii_xcvr_diag_ln_vals},
 	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE, TYPE_USB), &pcie_usb_xcvr_diag_ln_vals},
@@ -4756,6 +4856,10 @@ static const struct cdns_torrent_vals_entry cmn_vals_entries[] = {
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_NONE, EXTERNAL_SSC), NULL},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_NONE, INTERNAL_SSC), &sl_pcie_100_int_ssc_cmn_vals},
 
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_PCIE, NO_SSC), &ml_pcie_100_no_ssc_cmn_vals},
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_PCIE, EXTERNAL_SSC), &ml_pcie_100_no_ssc_cmn_vals},
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_PCIE, INTERNAL_SSC), &ml_pcie_100_int_ssc_cmn_vals},
+
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_SGMII, NO_SSC), &pcie_100_no_ssc_cmn_vals},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_SGMII, EXTERNAL_SSC), &pcie_100_no_ssc_cmn_vals},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_SGMII, INTERNAL_SSC), &pcie_100_int_ssc_cmn_vals},
@@ -4838,6 +4942,10 @@ static const struct cdns_torrent_vals_entry cdns_tx_ln_vals_entries[] = {
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_NONE, EXTERNAL_SSC), NULL},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_NONE, INTERNAL_SSC), NULL},
 
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_PCIE, NO_SSC), NULL},
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_PCIE, EXTERNAL_SSC), NULL},
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_PCIE, INTERNAL_SSC), NULL},
+
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_SGMII, NO_SSC), NULL},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_SGMII, EXTERNAL_SSC), NULL},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_SGMII, INTERNAL_SSC), NULL},
@@ -4920,6 +5028,10 @@ static const struct cdns_torrent_vals_entry cdns_rx_ln_vals_entries[] = {
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_NONE, EXTERNAL_SSC), &pcie_100_no_ssc_rx_ln_vals},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_NONE, INTERNAL_SSC), &pcie_100_no_ssc_rx_ln_vals},
 
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_PCIE, NO_SSC), &ml_pcie_100_no_ssc_rx_ln_vals},
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_PCIE, EXTERNAL_SSC), &ml_pcie_100_no_ssc_rx_ln_vals},
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_PCIE, INTERNAL_SSC), &ml_pcie_100_no_ssc_rx_ln_vals},
+
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_SGMII, NO_SSC), &pcie_100_no_ssc_rx_ln_vals},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_SGMII, EXTERNAL_SSC), &pcie_100_no_ssc_rx_ln_vals},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_SGMII, INTERNAL_SSC), &pcie_100_no_ssc_rx_ln_vals},
@@ -5038,6 +5150,10 @@ static const struct cdns_torrent_vals_entry ti_tx_ln_vals_entries[] = {
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_NONE, EXTERNAL_SSC), NULL},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_NONE, INTERNAL_SSC), NULL},
 
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_PCIE, NO_SSC), NULL},
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_PCIE, EXTERNAL_SSC), NULL},
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_PCIE, INTERNAL_SSC), NULL},
+
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_SGMII, NO_SSC), NULL},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_SGMII, EXTERNAL_SSC), NULL},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_SGMII, INTERNAL_SSC), NULL},
@@ -5154,6 +5270,10 @@ static const struct cdns_torrent_vals_entry ti_j7200_cmn_vals_entries[] = {
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_NONE, EXTERNAL_SSC), NULL},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_NONE, INTERNAL_SSC), &sl_pcie_100_int_ssc_cmn_vals},
 
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_PCIE, NO_SSC), &ml_pcie_100_no_ssc_cmn_vals},
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_PCIE, EXTERNAL_SSC), &ml_pcie_100_no_ssc_cmn_vals},
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_PCIE, INTERNAL_SSC), &ml_pcie_100_int_ssc_cmn_vals},
+
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_SGMII, NO_SSC), &pcie_100_no_ssc_cmn_vals},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_SGMII, EXTERNAL_SSC), &pcie_100_no_ssc_cmn_vals},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_SGMII, INTERNAL_SSC), &pcie_100_int_ssc_cmn_vals},
@@ -5236,6 +5356,10 @@ static const struct cdns_torrent_vals_entry ti_j7200_tx_ln_vals_entries[] = {
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_NONE, EXTERNAL_SSC), NULL},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_NONE, INTERNAL_SSC), NULL},
 
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_PCIE, NO_SSC), NULL},
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_PCIE, EXTERNAL_SSC), NULL},
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_PCIE, INTERNAL_SSC), NULL},
+
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_SGMII, NO_SSC), NULL},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_SGMII, EXTERNAL_SSC), NULL},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_SGMII, INTERNAL_SSC), NULL},
@@ -5318,6 +5442,10 @@ static const struct cdns_torrent_vals_entry ti_j7200_rx_ln_vals_entries[] = {
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_NONE, EXTERNAL_SSC), &pcie_100_no_ssc_rx_ln_vals},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_NONE, INTERNAL_SSC), &pcie_100_no_ssc_rx_ln_vals},
 
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_PCIE, NO_SSC), &pcie_100_no_ssc_rx_ln_vals},
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_PCIE, EXTERNAL_SSC), &pcie_100_no_ssc_rx_ln_vals},
+	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_PCIE, INTERNAL_SSC), &pcie_100_no_ssc_rx_ln_vals},
+
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_SGMII, NO_SSC), &pcie_100_no_ssc_rx_ln_vals},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_SGMII, EXTERNAL_SSC), &pcie_100_no_ssc_rx_ln_vals},
 	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_SGMII, INTERNAL_SSC), &pcie_100_no_ssc_rx_ln_vals},
-- 
2.34.1

