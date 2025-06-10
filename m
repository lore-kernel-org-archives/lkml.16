Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CCC23AB8C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749560524; cv=none; b=NIDXom+LbazaybgiPGiIIWMb1JNnL1QRmtGNwsqqdBKRJeL7D3G3F+QVVq75q/wP2TcnS4GJ8ZXK2GCrCCEATNRNoNNlMrn+Onxwe/uROXLDhmkBukdvEOAskxUsMdVL/GqltaBNvVxrH/oVf+N0iKFRFrp3WPm1tCMe/DFbXS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749560524; c=relaxed/simple;
	bh=IHmdJiBr5N3TqwbmiqEEAmSu0RL3Jke4qIbbyA6T17w=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QMpse30x7KA6CmDdL+wvVxL0uw9LPXNKJQQHmOJDJj8oblnd079Tgu7zPNTgfyfcTOjdyx0KNiYoujmoJNxMrPzXgWRaQl2CfQf6To2CGg6uq1sXhhGkYXLsxH1EBPjtZfJBCSKvIhTI3nzczjLd01XUpmJ+ZH3zf6JHF46nBwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=d91Mj03Y; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="d91Mj03Y"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55AD1csU2294498;
	Tue, 10 Jun 2025 08:01:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749560498;
	bh=qR+2qB+I+pBxrxBrQKLMvxcIS5poCYVL2NCuq3ScqwM=;
	h=From:To:CC:Subject:Date;
	b=d91Mj03YtZ9h4hdQMhBdrWass1lsKI9owxf6c6wHCuYIR+qDIpp8RagaAqMtpM6dX
	 UmDK0Eon5KeLC+Lz1g7wcDEqrc2rH/jjzhiu16WiGp1FpIFtddBzEXMGsqBlPO0fdf
	 iYzvs84mGcWi4MKd6VbnM3rX5YwCXRL7Nr8v6BYI=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55AD1ch42128236
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 10 Jun 2025 08:01:38 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 10
 Jun 2025 08:01:38 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 10 Jun 2025 08:01:38 -0500
Received: from uda0492258.dhcp.ti.com (dhcp-172-24-227-169.dhcp.ti.com [172.24.227.169])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55AD1Yq13086009;
	Tue, 10 Jun 2025 08:01:35 -0500
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <vkoul@kernel.org>, <kishon@kernel.org>, <christophe.jaillet@wanadoo.fr>,
        <sjakhade@cadence.com>, <bwawrzyn@cisco.com>,
        <u.kleine-koenig@baylibre.com>, <krzysztof.kozlowski@linaro.org>
CC: <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH] phy: cadence: Sierra: Add PCIe + USB PHY multilink configuration
Date: Tue, 10 Jun 2025 18:31:33 +0530
Message-ID: <20250610130133.2102196-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.34.1
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

Add register sequences for PCIe + USB multilink configuration for
Sierra PHY.

Signed-off-by: Swapnil Jakhade <sjakhade@cadence.com>
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

Hello,

This patch is based on linux-next tagged next-20250610.

Regards,
Siddharth.

 drivers/phy/cadence/phy-cadence-sierra.c | 180 +++++++++++++++++++++++
 1 file changed, 180 insertions(+)

diff --git a/drivers/phy/cadence/phy-cadence-sierra.c b/drivers/phy/cadence/phy-cadence-sierra.c
index 45a5c00843bf..74613382ccb0 100644
--- a/drivers/phy/cadence/phy-cadence-sierra.c
+++ b/drivers/phy/cadence/phy-cadence-sierra.c
@@ -58,8 +58,11 @@
 #define SIERRA_CMN_PLLLC1_GEN_PREG			0xC2
 #define SIERRA_CMN_PLLLC1_FBDIV_INT_PREG		0xC3
 #define SIERRA_CMN_PLLLC1_DCOCAL_CTRL_PREG		0xC5
+#define SIERRA_CMN_PLLLC1_MODE_PREG			0xC8
+#define SIERRA_CMN_PLLLC1_LF_COEFF_MODE1_PREG		0xC9
 #define SIERRA_CMN_PLLLC1_LF_COEFF_MODE0_PREG		0xCA
 #define SIERRA_CMN_PLLLC1_CLK0_PREG			0xCE
+#define SIERRA_CMN_PLLLC1_BWCAL_MODE1_PREG		0xCF
 #define SIERRA_CMN_PLLLC1_BWCAL_MODE0_PREG		0xD0
 #define SIERRA_CMN_PLLLC1_SS_TIME_STEPSIZE_MODE_PREG	0xE2
 
@@ -1541,6 +1544,137 @@ static void cdns_sierra_phy_remove(struct platform_device *pdev)
 	cdns_sierra_clk_unregister(phy);
 }
 
+/* USB refclk 100MHz, 20b, SuperSpeed opt2, ext ssc, PLL LC1, multilink */
+static const struct cdns_reg_pairs usb_100_ext_ssc_plllc1_cmn_regs[] = {
+	{0x002D, SIERRA_CMN_PLLLC1_FBDIV_INT_PREG},
+	{0x2086, SIERRA_CMN_PLLLC1_LF_COEFF_MODE1_PREG},
+	{0x2086, SIERRA_CMN_PLLLC1_LF_COEFF_MODE0_PREG},
+	{0x1005, SIERRA_CMN_PLLLC1_CLK0_PREG},
+	{0x0000, SIERRA_CMN_PLLLC1_BWCAL_MODE1_PREG},
+	{0x0000, SIERRA_CMN_PLLLC1_BWCAL_MODE0_PREG},
+	{0x0000, SIERRA_CMN_PLLLC1_SS_TIME_STEPSIZE_MODE_PREG}
+};
+
+/* USB refclk 100MHz, 20b, SuperSpeed opt2, int ssc, PLL LC1, multilink */
+static const struct cdns_reg_pairs usb_100_int_ssc_plllc1_cmn_regs[] = {
+	{0x002D, SIERRA_CMN_PLLLC1_FBDIV_INT_PREG},
+	{0x000E, SIERRA_CMN_PLLLC1_MODE_PREG},
+	{0x1005, SIERRA_CMN_PLLLC1_CLK0_PREG}
+};
+
+static const struct cdns_reg_pairs usb_100_ml_ln_regs[] = {
+	{0xFE0A, SIERRA_DET_STANDEC_A_PREG},
+	{0x000F, SIERRA_DET_STANDEC_B_PREG},
+	{0x55A5, SIERRA_DET_STANDEC_C_PREG},
+	{0x69AD, SIERRA_DET_STANDEC_D_PREG},
+	{0x0241, SIERRA_DET_STANDEC_E_PREG},
+	{0x0010, SIERRA_PSM_LANECAL_DLY_A1_RESETS_PREG},
+	{0x0014, SIERRA_PSM_A0IN_TMR_PREG},
+	{0x001D, SIERRA_PSM_A3IN_TMR_PREG},
+	{0x0004, SIERRA_PSC_LN_A3_PREG},
+	{0x0004, SIERRA_PSC_LN_IDLE_PREG},
+	{0x001F, SIERRA_PSC_TX_A0_PREG},
+	{0x0007, SIERRA_PSC_TX_A1_PREG},
+	{0x0003, SIERRA_PSC_TX_A2_PREG},
+	{0x0003, SIERRA_PSC_TX_A3_PREG},
+	{0x0FFF, SIERRA_PSC_RX_A0_PREG},
+	{0x0619, SIERRA_PSC_RX_A1_PREG},
+	{0x0003, SIERRA_PSC_RX_A2_PREG},
+	{0x0001, SIERRA_PSC_RX_A3_PREG},
+	{0x0606, SIERRA_PLLCTRL_FBDIV_MODE01_PREG},
+	{0x0001, SIERRA_PLLCTRL_SUBRATE_PREG},
+	{0x0003, SIERRA_PLLCTRL_GEN_A_PREG},
+	{0x0406, SIERRA_PLLCTRL_GEN_D_PREG},
+	{0x5211, SIERRA_PLLCTRL_CPGAIN_MODE_PREG},
+	{0x00CA, SIERRA_CLKPATH_BIASTRIM_PREG},
+	{0x2512, SIERRA_DFE_BIASTRIM_PREG},
+	{0x0000, SIERRA_DRVCTRL_ATTEN_PREG},
+	{0x823E, SIERRA_CLKPATHCTRL_TMR_PREG},
+	{0x078F, SIERRA_RX_CREQ_FLTR_A_MODE1_PREG},
+	{0x078F, SIERRA_RX_CREQ_FLTR_A_MODE0_PREG},
+	{0x7B3C, SIERRA_CREQ_CCLKDET_MODE01_PREG},
+	{0x023F, SIERRA_RX_CTLE_MAINTENANCE_PREG},
+	{0x3232, SIERRA_CREQ_FSMCLK_SEL_PREG},
+	{0x0000, SIERRA_CREQ_EQ_CTRL_PREG},
+	{0xCC44, SIERRA_CREQ_EQ_OPEN_EYE_THRESH_PREG},
+	{0x8452, SIERRA_CTLELUT_CTRL_PREG},
+	{0x4121, SIERRA_DFE_ECMP_RATESEL_PREG},
+	{0x4121, SIERRA_DFE_SMP_RATESEL_PREG},
+	{0x0002, SIERRA_DEQ_PHALIGN_CTRL},
+	{0x3200, SIERRA_DEQ_CONCUR_CTRL1_PREG},
+	{0x5064, SIERRA_DEQ_CONCUR_CTRL2_PREG},
+	{0x0030, SIERRA_DEQ_EPIPWR_CTRL2_PREG},
+	{0x5A5A, SIERRA_DEQ_ERRCMP_CTRL_PREG},
+	{0x02F5, SIERRA_DEQ_OFFSET_CTRL_PREG},
+	{0x02F5, SIERRA_DEQ_GAIN_CTRL_PREG},
+	{0xA9A9, SIERRA_DEQ_VGATUNE_CTRL_PREG},
+	{0x0014, SIERRA_DEQ_GLUT0},
+	{0x0014, SIERRA_DEQ_GLUT1},
+	{0x0014, SIERRA_DEQ_GLUT2},
+	{0x0014, SIERRA_DEQ_GLUT3},
+	{0x0014, SIERRA_DEQ_GLUT4},
+	{0x0014, SIERRA_DEQ_GLUT5},
+	{0x0014, SIERRA_DEQ_GLUT6},
+	{0x0014, SIERRA_DEQ_GLUT7},
+	{0x0014, SIERRA_DEQ_GLUT8},
+	{0x0014, SIERRA_DEQ_GLUT9},
+	{0x0014, SIERRA_DEQ_GLUT10},
+	{0x0014, SIERRA_DEQ_GLUT11},
+	{0x0014, SIERRA_DEQ_GLUT12},
+	{0x0014, SIERRA_DEQ_GLUT13},
+	{0x0014, SIERRA_DEQ_GLUT14},
+	{0x0014, SIERRA_DEQ_GLUT15},
+	{0x0014, SIERRA_DEQ_GLUT16},
+	{0x0BAE, SIERRA_DEQ_ALUT0},
+	{0x0AEB, SIERRA_DEQ_ALUT1},
+	{0x0A28, SIERRA_DEQ_ALUT2},
+	{0x0965, SIERRA_DEQ_ALUT3},
+	{0x08A2, SIERRA_DEQ_ALUT4},
+	{0x07DF, SIERRA_DEQ_ALUT5},
+	{0x071C, SIERRA_DEQ_ALUT6},
+	{0x0659, SIERRA_DEQ_ALUT7},
+	{0x0596, SIERRA_DEQ_ALUT8},
+	{0x0514, SIERRA_DEQ_ALUT9},
+	{0x0492, SIERRA_DEQ_ALUT10},
+	{0x0410, SIERRA_DEQ_ALUT11},
+	{0x038E, SIERRA_DEQ_ALUT12},
+	{0x030C, SIERRA_DEQ_ALUT13},
+	{0x03F4, SIERRA_DEQ_DFETAP_CTRL_PREG},
+	{0x0001, SIERRA_DFE_EN_1010_IGNORE_PREG},
+	{0x3C01, SIERRA_DEQ_TAU_CTRL1_FAST_MAINT_PREG},
+	{0x3C40, SIERRA_DEQ_TAU_CTRL1_SLOW_MAINT_PREG},
+	{0x1C08, SIERRA_DEQ_TAU_CTRL2_PREG},
+	{0x0033, SIERRA_DEQ_PICTRL_PREG},
+	{0x0330, SIERRA_CPICAL_TMRVAL_MODE0_PREG},
+	{0x01FF, SIERRA_CPICAL_PICNT_MODE1_PREG},
+	{0x0009, SIERRA_CPI_OUTBUF_RATESEL_PREG},
+	{0x3232, SIERRA_CPICAL_RES_STARTCODE_MODE23_PREG},
+	{0x0005, SIERRA_LFPSDET_SUPPORT_PREG},
+	{0x000F, SIERRA_LFPSFILT_NS_PREG},
+	{0x0009, SIERRA_LFPSFILT_RD_PREG},
+	{0x0001, SIERRA_LFPSFILT_MP_PREG},
+	{0x8013, SIERRA_SDFILT_H2L_A_PREG},
+	{0x8009, SIERRA_SDFILT_L2H_PREG},
+	{0x0024, SIERRA_RXBUFFER_CTLECTRL_PREG},
+	{0x0020, SIERRA_RXBUFFER_RCDFECTRL_PREG},
+	{0x4243, SIERRA_RXBUFFER_DFECTRL_PREG}
+};
+
+static const struct cdns_sierra_vals usb_100_ext_ssc_plllc1_cmn_vals = {
+	.reg_pairs = usb_100_ext_ssc_plllc1_cmn_regs,
+	.num_regs = ARRAY_SIZE(usb_100_ext_ssc_plllc1_cmn_regs),
+};
+
+static const struct cdns_sierra_vals usb_100_int_ssc_plllc1_cmn_vals = {
+	.reg_pairs = usb_100_int_ssc_plllc1_cmn_regs,
+	.num_regs = ARRAY_SIZE(usb_100_int_ssc_plllc1_cmn_regs),
+};
+
+static const struct cdns_sierra_vals usb_100_ml_ln_vals = {
+	.reg_pairs = usb_100_ml_ln_regs,
+	.num_regs = ARRAY_SIZE(usb_100_ml_ln_regs),
+};
+
 /* SGMII PHY PMA lane configuration */
 static const struct cdns_reg_pairs sgmii_phy_pma_ln_regs[] = {
 	{0x9010, SIERRA_PHY_PMA_XCVR_CTRL}
@@ -2513,6 +2647,11 @@ static const struct cdns_sierra_data cdns_map_sierra = {
 				[EXTERNAL_SSC] = &pcie_phy_pcs_cmn_vals,
 				[INTERNAL_SSC] = &pcie_phy_pcs_cmn_vals,
 			},
+			[TYPE_USB] = {
+				[NO_SSC] = &pcie_phy_pcs_cmn_vals,
+				[EXTERNAL_SSC] = &pcie_phy_pcs_cmn_vals,
+				[INTERNAL_SSC] = &pcie_phy_pcs_cmn_vals,
+			},
 		},
 	},
 	.pma_cmn_vals = {
@@ -2532,11 +2671,20 @@ static const struct cdns_sierra_data cdns_map_sierra = {
 				[EXTERNAL_SSC] = &pcie_100_ext_ssc_plllc_cmn_vals,
 				[INTERNAL_SSC] = &pcie_100_int_ssc_plllc_cmn_vals,
 			},
+			[TYPE_USB] = {
+				[NO_SSC] = &pcie_100_no_ssc_plllc_cmn_vals,
+				[EXTERNAL_SSC] = &pcie_100_ext_ssc_plllc_cmn_vals,
+				[INTERNAL_SSC] = &pcie_100_int_ssc_plllc_cmn_vals,
+			},
 		},
 		[TYPE_USB] = {
 			[TYPE_NONE] = {
 				[EXTERNAL_SSC] = &usb_100_ext_ssc_cmn_vals,
 			},
+			[TYPE_PCIE] = {
+				[EXTERNAL_SSC] = &usb_100_ext_ssc_plllc1_cmn_vals,
+				[INTERNAL_SSC] = &usb_100_int_ssc_plllc1_cmn_vals,
+			},
 		},
 		[TYPE_SGMII] = {
 			[TYPE_NONE] = {
@@ -2573,11 +2721,20 @@ static const struct cdns_sierra_data cdns_map_sierra = {
 				[EXTERNAL_SSC] = &ml_pcie_100_ext_ssc_ln_vals,
 				[INTERNAL_SSC] = &ml_pcie_100_int_ssc_ln_vals,
 			},
+			[TYPE_USB] = {
+				[NO_SSC] = &ml_pcie_100_no_ssc_ln_vals,
+				[EXTERNAL_SSC] = &ml_pcie_100_ext_ssc_ln_vals,
+				[INTERNAL_SSC] = &ml_pcie_100_int_ssc_ln_vals,
+			},
 		},
 		[TYPE_USB] = {
 			[TYPE_NONE] = {
 				[EXTERNAL_SSC] = &usb_100_ext_ssc_ln_vals,
 			},
+			[TYPE_PCIE] = {
+				[EXTERNAL_SSC] = &usb_100_ml_ln_vals,
+				[INTERNAL_SSC] = &usb_100_ml_ln_vals,
+			},
 		},
 		[TYPE_SGMII] = {
 			[TYPE_NONE] = {
@@ -2620,6 +2777,11 @@ static const struct cdns_sierra_data cdns_ti_map_sierra = {
 				[EXTERNAL_SSC] = &pcie_phy_pcs_cmn_vals,
 				[INTERNAL_SSC] = &pcie_phy_pcs_cmn_vals,
 			},
+			[TYPE_USB] = {
+				[NO_SSC] = &pcie_phy_pcs_cmn_vals,
+				[EXTERNAL_SSC] = &pcie_phy_pcs_cmn_vals,
+				[INTERNAL_SSC] = &pcie_phy_pcs_cmn_vals,
+			},
 		},
 	},
 	.phy_pma_ln_vals = {
@@ -2655,11 +2817,20 @@ static const struct cdns_sierra_data cdns_ti_map_sierra = {
 				[EXTERNAL_SSC] = &pcie_100_ext_ssc_plllc_cmn_vals,
 				[INTERNAL_SSC] = &pcie_100_int_ssc_plllc_cmn_vals,
 			},
+			[TYPE_USB] = {
+				[NO_SSC] = &pcie_100_no_ssc_plllc_cmn_vals,
+				[EXTERNAL_SSC] = &pcie_100_ext_ssc_plllc_cmn_vals,
+				[INTERNAL_SSC] = &pcie_100_int_ssc_plllc_cmn_vals,
+			},
 		},
 		[TYPE_USB] = {
 			[TYPE_NONE] = {
 				[EXTERNAL_SSC] = &usb_100_ext_ssc_cmn_vals,
 			},
+			[TYPE_PCIE] = {
+				[EXTERNAL_SSC] = &usb_100_ext_ssc_plllc1_cmn_vals,
+				[INTERNAL_SSC] = &usb_100_int_ssc_plllc1_cmn_vals,
+			},
 		},
 		[TYPE_SGMII] = {
 			[TYPE_PCIE] = {
@@ -2693,11 +2864,20 @@ static const struct cdns_sierra_data cdns_ti_map_sierra = {
 				[EXTERNAL_SSC] = &ti_ml_pcie_100_ext_ssc_ln_vals,
 				[INTERNAL_SSC] = &ti_ml_pcie_100_int_ssc_ln_vals,
 			},
+			[TYPE_USB] = {
+				[NO_SSC] = &ti_ml_pcie_100_no_ssc_ln_vals,
+				[EXTERNAL_SSC] = &ti_ml_pcie_100_ext_ssc_ln_vals,
+				[INTERNAL_SSC] = &ti_ml_pcie_100_int_ssc_ln_vals,
+			},
 		},
 		[TYPE_USB] = {
 			[TYPE_NONE] = {
 				[EXTERNAL_SSC] = &usb_100_ext_ssc_ln_vals,
 			},
+			[TYPE_PCIE] = {
+				[EXTERNAL_SSC] = &usb_100_ml_ln_vals,
+				[INTERNAL_SSC] = &usb_100_ml_ln_vals,
+			},
 		},
 		[TYPE_SGMII] = {
 			[TYPE_PCIE] = {
-- 
2.34.1

