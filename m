Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD17296166;
	Thu, 10 Apr 2025 14:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744296086; cv=none; b=igd0ac/ewfrO1GCpPlqfL+Od5hj0fg1vXzmB7/5ma5dgr96RQi0bACYixuK/8eGnfoXEFa1LZ2NNo0HnCYffS47Q9ZwYbzNbWixT+tRqwwoyDx222OKHACz5E7GonOsp0XWWJvkxiOR0QZvaaY4rmsmdGoaZ7dZaqSpYIZHQVz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744296086; c=relaxed/simple;
	bh=/HMc0JhJW/eWI/Og54IU+HGy/usAh26oQ7bJsIEeyMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bX1TiytCsShwSRSpvIBelxBQVDzVACY6TWy9L/CoR7vkJ7osg2tmf8Usp0ZMkucxvCkqu52btg/yce0F5L0gOjCzcLZ2lREMbFTsM0F/1acNKYWboOSc5S9hkMP/jI95VaUuV5XFdFeaRKvGarvvjz9biQLT4/vTR2hpDAbPeJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QOM7GeFx; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QOM7GeFx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744296081;
	bh=/HMc0JhJW/eWI/Og54IU+HGy/usAh26oQ7bJsIEeyMo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QOM7GeFxPXGry18AKYkRQQTzRMomsn/QlC5gp9W6KocCTGyglAhBXZmkLP+iZt/9j
	 eiVQWftip1DBET55o2R8HyqYszZNLG6JDK7ljfH54jvYnPWvOPC92MAe3fqaezpIu0
	 BjsL5qe5FYLV6zq1Q0w3MQVX1DOSq04tHjuRqmtTd6anwWoEE4yHFsAApvx5STRUj2
	 Mj3Br+V/DSMU74EvFZA/IGGoDcuy4DwGzILaAn4ogfKOmT3mXz+OzuBAE0YDGViqj5
	 6YLvppk4fMfYwIrQJYXBIXStLhDg3Z+7ce52C0q6XcmPMjDbwywvVjrwPeQEfczkXB
	 gYZf7LFGHxVcg==
Received: from IcarusMOD.eternityproject.eu (fi-19-199-243.service.infuturo.it [151.19.199.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 639C317E10F7;
	Thu, 10 Apr 2025 16:41:18 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	y.oudjana@protonmail.com,
	lukas.bulwahn@redhat.com,
	u.kleine-koenig@baylibre.com,
	geert+renesas@glider.be,
	amergnat@baylibre.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 2/3] clk: mediatek: Add main clocks drivers for Dimensity 1200 MT6893
Date: Thu, 10 Apr 2025 16:41:09 +0200
Message-ID: <20250410144110.476197-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410144110.476197-1-angelogioacchino.delregno@collabora.com>
References: <20250410144110.476197-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add drivers for the main system clock controllers present in the
MediaTek Dimensity 1200 (MT6893) SoC.
This adds support for the PLLs and topck/infra muxes and gates.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/Kconfig                 |   9 +
 drivers/clk/mediatek/Makefile                |   3 +
 drivers/clk/mediatek/clk-mt6893-apmixedsys.c | 137 +++
 drivers/clk/mediatek/clk-mt6893-infra_ao.c   | 185 ++++
 drivers/clk/mediatek/clk-mt6893-topckgen.c   | 880 +++++++++++++++++++
 5 files changed, 1214 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt6893-apmixedsys.c
 create mode 100644 drivers/clk/mediatek/clk-mt6893-infra_ao.c
 create mode 100644 drivers/clk/mediatek/clk-mt6893-topckgen.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 5f8e6d68fa14..64204e07ed47 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -373,6 +373,15 @@ config COMMON_CLK_MT6797_VENCSYS
 	help
 	  This driver supports MediaTek MT6797 vencsys clocks.
 
+config COMMON_CLK_MT6893
+	tristate "System clock driver for MediaTek Dimensity 1200 MT6893"
+	depends on ARM64 || COMPILE_TEST
+	select COMMON_CLK_MEDIATEK
+	select COMMON_CLK_MEDIATEK_FHCTL
+	default ARM64
+	help
+	  This driver supports MediaTek Dimensity 1200 MT6893 basic clocks.
+
 config COMMON_CLK_MT7622
 	tristate "Clock driver for MediaTek MT7622"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index 6efec95406bd..b9b101eceda0 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -34,6 +34,9 @@ obj-$(CONFIG_COMMON_CLK_MT6797_IMGSYS) += clk-mt6797-img.o
 obj-$(CONFIG_COMMON_CLK_MT6797_MMSYS) += clk-mt6797-mm.o
 obj-$(CONFIG_COMMON_CLK_MT6797_VDECSYS) += clk-mt6797-vdec.o
 obj-$(CONFIG_COMMON_CLK_MT6797_VENCSYS) += clk-mt6797-venc.o
+obj-$(CONFIG_COMMON_CLK_MT6893) += clk-mt6893-apmixedsys.o clk-mt6893-topckgen.o \
+				   clk-mt6893-infra_ao.o
+
 obj-$(CONFIG_COMMON_CLK_MT2701) += clk-mt2701.o
 obj-$(CONFIG_COMMON_CLK_MT2701_AUDSYS) += clk-mt2701-aud.o
 obj-$(CONFIG_COMMON_CLK_MT2701_BDPSYS) += clk-mt2701-bdp.o
diff --git a/drivers/clk/mediatek/clk-mt6893-apmixedsys.c b/drivers/clk/mediatek/clk-mt6893-apmixedsys.c
new file mode 100644
index 000000000000..044f275acd4f
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt6893-apmixedsys.c
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025 Collabora Ltd
+ *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+#include <dt-bindings/clock/mediatek,mt6893-clk.h>
+
+#include "clk-fhctl.h"
+#include "clk-mtk.h"
+#include "clk-pll.h"
+#include "clk-pllfh.h"
+
+#define MT6893_PLL_FMAX		(3800UL * MHZ)
+#define MT6893_PLL_FMIN		(1500UL * MHZ)
+#define MT6893_INTEGER_BITS	(8)
+
+#define PLL(_id, _name, _reg, _pwr_reg, _en_mask, _flags,		\
+	     _rst_bar_mask, _pcwbits, _pd_reg,				\
+	     _tuner_reg, _tuner_en_reg, _tuner_en_bit, _pcw_reg) {	\
+		.id = _id,						\
+		.name = _name,						\
+		.reg = _reg,						\
+		.pwr_reg = _pwr_reg,					\
+		.en_mask = _en_mask,					\
+		.flags = _flags,					\
+		.rst_bar_mask = _rst_bar_mask,				\
+		.fmax = MT6893_PLL_FMAX,				\
+		.fmin = MT6893_PLL_FMIN,				\
+		.pcwbits = _pcwbits,					\
+		.pcwibits = MT6893_INTEGER_BITS,			\
+		.pd_reg = _pd_reg,					\
+		.pd_shift = 24,						\
+		.tuner_reg = _tuner_reg,				\
+		.tuner_en_reg = _tuner_en_reg,				\
+		.tuner_en_bit = _tuner_en_bit,				\
+		.pcw_reg = _pcw_reg,					\
+		.pcw_shift = 0,						\
+		.pcw_chg_reg = 0,					\
+		.en_reg = 0,						\
+		.pll_en_bit = 0,					\
+	}
+
+static const struct mtk_pll_data plls[] = {
+	/*
+	 * armpll_ll/armpll_bl(x)/ccipll are main clock source of AP MCU,
+	 * should not be closed in Linux world.
+	 */
+	PLL(CLK_APMIXED_ARMPLL_LL, "armpll_ll", 0x208, 0x214, 0,
+	    PLL_AO, BIT(0), 22, 0x020c, 0, 0, 0, 0x20c),
+	PLL(CLK_APMIXED_ARMPLL_BL0, "armpll_bl0", 0x218, 0x224, 0,
+	    PLL_AO, BIT(0), 22, 0x021c, 0, 0, 0, 0x21c),
+	PLL(CLK_APMIXED_ARMPLL_BL1, "armpll_bl1", 0x228, 0x234, 0,
+	    PLL_AO, BIT(0), 22, 0x022c, 0, 0, 0, 0x22c),
+	PLL(CLK_APMIXED_ARMPLL_BL2, "armpll_bl2", 0x238, 0x244, 0,
+	    PLL_AO, BIT(0), 22, 0x023c, 0, 0, 0, 0x23c),
+	PLL(CLK_APMIXED_ARMPLL_BL3, "armpll_bl3", 0x248, 0x254, 0,
+	    PLL_AO, BIT(0), 22, 0x024c, 0, 0, 0, 0x24c),
+	PLL(CLK_APMIXED_CCIPLL, "ccipll", 0x258, 0x264, 0,
+	    PLL_AO, BIT(0), 22, 0x025c, 0, 0, 0, 0x25c),
+	PLL(CLK_APMIXED_MAINPLL, "mainpll", 0x340, 0x34c, GENMASK(31, 24),
+	    HAVE_RST_BAR | PLL_AO, BIT(23), 22, 0x0344, 0, 0, 0, 0x344),
+	PLL(CLK_APMIXED_UNIVPLL, "univpll", 0x308, 0x314, GENMASK(31, 24),
+	    HAVE_RST_BAR, BIT(23), 22, 0x030c, 0, 0, 0, 0x30c),
+	PLL(CLK_APMIXED_MSDCPLL, "msdcpll", 0x350, 0x35c, 0,
+	    0, BIT(0), 22, 0x354, 0, 0, 0, 0x354),
+	PLL(CLK_APMIXED_MMPLL, "mmpll", 0x360, 0x36c, GENMASK(31, 24),
+	    HAVE_RST_BAR, BIT(23), 22, 0x364, 0, 0, 0, 0x364),
+	PLL(CLK_APMIXED_ADSPPLL, "adsppll", 0x370, 0x37c, 0,
+	    0, BIT(0), 22, 0x374, 0, 0, 0, 0x374),
+	PLL(CLK_APMIXED_MFGPLL, "mfgpll", 0x268, 0x274, 0,
+	    0, BIT(0), 22, 0x26c, 0, 0, 0, 0x26c),
+	PLL(CLK_APMIXED_TVDPLL, "tvdpll", 0x380, 0x38c, 0,
+	    0, BIT(0), 22, 0x384, 0, 0, 0, 0x384),
+	PLL(CLK_APMIXED_APLL1, "apll1", 0x318, 0x328, 0,
+	    0, BIT(0), 32, 0x31c, 0x040, 0x00c, 0, 0x320),
+	PLL(CLK_APMIXED_APLL2, "apll2", 0x32c, 0x33c, 0,
+	    0, BIT(0), 32, 0x330, 0x044, 0x00c, 5, 0x334),
+	PLL(CLK_APMIXED_MPLL, "mpll", 0x32c, 0x39c, 0,
+	    PLL_AO, BIT(0), 22, 0x394, 0, 0, 0, 0x394),
+	PLL(CLK_APMIXED_APUPLL, "apupll", 0x3a0, 0x3ac, 0,
+	    0, BIT(0), 22, 0x3a4, 0, 0, 0, 0x3a4),
+};
+
+static const struct of_device_id of_match_clk_mt6893_apmixed[] = {
+	{ .compatible = "mediatek,mt6893-apmixedsys", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, of_match_clk_mt6893_apmixed);
+
+static int clk_mt6893_apmixed_probe(struct platform_device *pdev)
+{
+	struct clk_hw_onecell_data *clk_data;
+	struct device_node *node = pdev->dev.of_node;
+	int ret;
+
+	clk_data = mtk_devm_alloc_clk_data(&pdev->dev, ARRAY_SIZE(plls));
+	if (!clk_data)
+		return -ENOMEM;
+
+	ret = mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
+	if (ret)
+		return ret;
+
+	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, clk_data);
+
+	return 0;
+}
+
+static void clk_mt6893_apmixed_remove(struct platform_device *pdev)
+{
+	struct device_node *node = pdev->dev.of_node;
+	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
+
+	of_clk_del_provider(node);
+	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
+}
+
+static struct platform_driver clk_mt6893_apmixed_drv = {
+	.probe = clk_mt6893_apmixed_probe,
+	.remove = clk_mt6893_apmixed_remove,
+	.driver = {
+		.name = "clk-mt6893-apmixed",
+		.of_match_table = of_match_clk_mt6893_apmixed,
+	},
+};
+module_platform_driver(clk_mt6893_apmixed_drv);
+
+MODULE_AUTHOR("AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>");
+MODULE_DESCRIPTION("MediaTek MT6893 apmixedsys clocks driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-mt6893-infra_ao.c b/drivers/clk/mediatek/clk-mt6893-infra_ao.c
new file mode 100644
index 000000000000..bc73e5d2146f
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt6893-infra_ao.c
@@ -0,0 +1,185 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025 Collabora Ltd
+ *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+ */
+
+#include <dt-bindings/clock/mediatek,mt6893-clk.h>
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+#include "clk-gate.h"
+#include "clk-mtk.h"
+
+static const struct mtk_gate_regs infra_ao0_cg_regs = {
+	.set_ofs = 0x80,
+	.clr_ofs = 0x84,
+	.sta_ofs = 0x90,
+};
+
+static const struct mtk_gate_regs infra_ao1_cg_regs = {
+	.set_ofs = 0x88,
+	.clr_ofs = 0x8c,
+	.sta_ofs = 0x94,
+};
+
+static const struct mtk_gate_regs infra_ao2_cg_regs = {
+	.set_ofs = 0xd0,
+	.clr_ofs = 0xd4,
+	.sta_ofs = 0xd8,
+};
+
+static const struct mtk_gate_regs infra_ao3_cg_regs = {
+	.set_ofs = 0xa4,
+	.clr_ofs = 0xa8,
+	.sta_ofs = 0xac,
+};
+
+static const struct mtk_gate_regs infra_ao4_cg_regs = {
+	.set_ofs = 0xc0,
+	.clr_ofs = 0xc4,
+	.sta_ofs = 0xc8,
+};
+
+#define GATE_INFRA_AO0_FLAGS(_id, _name, _parent, _shift, _flag)                \
+	GATE_MTK_FLAGS(_id, _name, _parent, &infra_ao0_cg_regs, _shift, \
+		&mtk_clk_gate_ops_setclr, _flag)
+
+#define GATE_INFRA_AO0(_id, _name, _parent, _shift)	\
+	GATE_INFRA_AO0_FLAGS(_id, _name, _parent, _shift, 0)
+
+#define GATE_INFRA_AO1_FLAGS(_id, _name, _parent, _shift, _flag)		\
+	GATE_MTK_FLAGS(_id, _name, _parent, &infra_ao1_cg_regs, _shift,	\
+		&mtk_clk_gate_ops_setclr, _flag)
+
+#define GATE_INFRA_AO1(_id, _name, _parent, _shift)	\
+	GATE_INFRA_AO1_FLAGS(_id, _name, _parent, _shift, 0)
+
+#define GATE_INFRA_AO2(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &infra_ao2_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+#define GATE_INFRA_AO2_FLAGS(_id, _name, _parent, _shift, _flag)		\
+	GATE_MTK_FLAGS(_id, _name, _parent, &infra_ao2_cg_regs, _shift,	\
+		&mtk_clk_gate_ops_setclr, _flag)
+
+#define GATE_INFRA_AO3_FLAGS(_id, _name, _parent, _shift, _flag)		\
+	GATE_MTK_FLAGS(_id, _name, _parent, &infra_ao3_cg_regs, _shift,	\
+		&mtk_clk_gate_ops_setclr, _flag)
+
+#define GATE_INFRA_AO3(_id, _name, _parent, _shift)	\
+	GATE_INFRA_AO3_FLAGS(_id, _name, _parent, _shift, 0)
+
+#define GATE_INFRA_AO4_FLAGS(_id, _name, _parent, _shift, _flag)		\
+	GATE_MTK_FLAGS(_id, _name, _parent, &infra_ao4_cg_regs, _shift,	\
+		&mtk_clk_gate_ops_setclr, _flag)
+
+#define GATE_INFRA_AO4(_id, _name, _parent, _shift)	\
+	GATE_INFRA_AO4_FLAGS(_id, _name, _parent, _shift, 0)
+
+static const struct mtk_gate infra_ao_clks[] = {
+	/* INFRA_AO0 */
+	GATE_INFRA_AO0(CLK_INFRA_AO_PMIC_TMR, "infra_ao_pmic_tmr", "pwrap_ulposc_sel", 0),
+	GATE_INFRA_AO0(CLK_INFRA_AO_PMIC_AP, "infra_ao_pmic_ap", "pwrap_ulposc_sel", 1),
+	GATE_INFRA_AO0(CLK_INFRA_AO_GCE, "infra_ao_gce", "axi_sel", 8),
+	GATE_INFRA_AO0(CLK_INFRA_AO_GCE2, "infra_ao_gce2", "axi_sel", 9),
+	GATE_INFRA_AO0(CLK_INFRA_AO_THERM, "infra_ao_therm", "axi_sel", 10),
+	GATE_INFRA_AO0(CLK_INFRA_AO_I2C0, "infra_ao_i2c0", "i2c_sel", 11),
+	GATE_INFRA_AO0(CLK_INFRA_AO_I2C1, "infra_ao_i2c1", "i2c_sel", 12),
+	GATE_INFRA_AO0(CLK_INFRA_AO_I2C2, "infra_ao_i2c2", "i2c_sel", 13),
+	GATE_INFRA_AO0(CLK_INFRA_AO_I2C3, "infra_ao_i2c3", "i2c_sel", 14),
+	GATE_INFRA_AO0(CLK_INFRA_AO_PWM_HCLK, "infra_ao_pwm_hclk", "axi_sel", 15),
+	GATE_INFRA_AO0(CLK_INFRA_AO_PWM1, "infra_ao_pwm1", "pwm_sel", 16),
+	GATE_INFRA_AO0(CLK_INFRA_AO_PWM2, "infra_ao_pwm2", "pwm_sel", 17),
+	GATE_INFRA_AO0(CLK_INFRA_AO_PWM3, "infra_ao_pwm3", "pwm_sel", 18),
+	GATE_INFRA_AO0(CLK_INFRA_AO_PWM4, "infra_ao_pwm4", "pwm_sel", 19),
+	GATE_INFRA_AO0(CLK_INFRA_AO_PWM, "infra_ao_pwm", "pwm_sel", 21),
+	GATE_INFRA_AO0(CLK_INFRA_AO_UART0, "infra_ao_uart0", "uart_sel", 22),
+	GATE_INFRA_AO0(CLK_INFRA_AO_UART1, "infra_ao_uart1", "uart_sel", 23),
+	GATE_INFRA_AO0(CLK_INFRA_AO_UART2, "infra_ao_uart2", "uart_sel", 24),
+	GATE_INFRA_AO0(CLK_INFRA_AO_UART3, "infra_ao_uart3", "uart_sel", 25),
+	GATE_INFRA_AO0(CLK_INFRA_AO_GCE_26M, "infra_ao_gce_26m", "axi_sel", 27),
+	GATE_INFRA_AO0(CLK_INFRA_AO_CQ_DMA_FPC, "infra_ao_dma", "axi_sel", 28),
+	GATE_INFRA_AO0(CLK_INFRA_AO_BTIF, "infra_ao_btif", "axi_sel", 31),
+	/* INFRA_AO1 */
+	GATE_INFRA_AO1(CLK_INFRA_AO_SPI0, "infra_ao_spi0", "spi_sel", 1),
+	GATE_INFRA_AO1(CLK_INFRA_AO_MSDC0, "infra_ao_msdc0", "axi_sel", 2),
+	GATE_INFRA_AO1(CLK_INFRA_AO_MSDC1, "infra_ao_msdc1", "axi_sel", 4),
+	GATE_INFRA_AO1(CLK_INFRA_AO_MSDC0_SRC, "infra_ao_msdc0_clk", "msdc50_0_sel", 6),
+	GATE_INFRA_AO1(CLK_INFRA_AO_AUXADC, "infra_ao_auxadc", "clk26m", 10),
+	GATE_INFRA_AO1(CLK_INFRA_AO_CPUM, "infra_ao_cpum", "axi_sel", 11),
+	GATE_INFRA_AO1(CLK_INFRA_AO_CCIF1_AP, "infra_ao_ccif1_ap", "axi_sel", 12),
+	GATE_INFRA_AO1(CLK_INFRA_AO_CCIF1_MD, "infra_ao_ccif1_md", "axi_sel", 13),
+	GATE_INFRA_AO1(CLK_INFRA_AO_MSDC1_SRC, "infra_ao_msdc1_clk", "msdc30_1_sel", 16),
+	GATE_INFRA_AO1(CLK_INFRA_AO_AP_DMA_PS, "infra_ao_ap_dma_ps", "axi_sel", 18),
+	GATE_INFRA_AO1(CLK_INFRA_AO_DEVICE_APC, "infra_ao_dapc", "axi_sel", 20),
+	GATE_INFRA_AO1(CLK_INFRA_AO_CCIF_AP, "infra_ao_ccif_ap", "axi_sel", 23),
+	GATE_INFRA_AO1(CLK_INFRA_AO_AUDIO, "infra_ao_audio", "axi_sel", 25),
+	GATE_INFRA_AO1(CLK_INFRA_AO_CCIF_MD, "infra_ao_ccif_md", "axi_sel", 26),
+	GATE_INFRA_AO1(CLK_INFRA_AO_DXCC_SEC_CORE, "infra_ao_secore", "dxcc_sel", 27),
+	/* INFRA_AO2 */
+	GATE_INFRA_AO2(CLK_INFRA_AO_APDMA, "infra_ao_apdma", "infra_ao_ap_dma_ps", 31),
+	/* INFRA_AO3 */
+	GATE_INFRA_AO3(CLK_INFRA_AO_SSUSB, "infra_ao_ssusb", "usb_sel", 1),
+	GATE_INFRA_AO3(CLK_INFRA_AO_DISP_PWM, "infra_ao_disp_pwm", "disp_pwm_sel", 2),
+	GATE_INFRA_AO3(CLK_INFRA_AO_DPMAIF, "infra_ao_dpmaif_ck", "axi_sel", 3),
+	GATE_INFRA_AO3(CLK_INFRA_AO_AUDIO_26M_BCLK, "infra_ao_audio26m", "clk26m", 4),
+	GATE_INFRA_AO3(CLK_INFRA_AO_SPI1, "infra_ao_spi1", "spi_sel", 6),
+	GATE_INFRA_AO3(CLK_INFRA_AO_I2C4, "infra_ao_i2c4", "i2c_sel", 7),
+	GATE_INFRA_AO3(CLK_INFRA_AO_SPI2, "infra_ao_spi2", "spi_sel", 9),
+	GATE_INFRA_AO3(CLK_INFRA_AO_SPI3, "infra_ao_spi3", "spi_sel", 10),
+	GATE_INFRA_AO3(CLK_INFRA_AO_UNIPRO_SYSCLK, "infra_ao_unipro_sysclk", "ufs_sel", 11),
+	GATE_INFRA_AO3(CLK_INFRA_AO_UFS_MP_SAP_BCLK, "infra_ao_ufs_bclk", "clk26m", 13),
+	GATE_INFRA_AO3(CLK_INFRA_AO_I2C5, "infra_ao_i2c5", "i2c_sel", 18),
+	GATE_INFRA_AO3(CLK_INFRA_AO_I2C5_ARBITER, "infra_ao_i2c5a", "i2c_sel", 19),
+	GATE_INFRA_AO3(CLK_INFRA_AO_I2C5_IMM, "infra_ao_i2c5_imm", "i2c_sel", 20),
+	GATE_INFRA_AO3(CLK_INFRA_AO_I2C1_ARBITER, "infra_ao_i2c1a", "i2c_sel", 21),
+	GATE_INFRA_AO3(CLK_INFRA_AO_I2C1_IMM, "infra_ao_i2c1_imm", "i2c_sel", 22),
+	GATE_INFRA_AO3(CLK_INFRA_AO_I2C2_ARBITER, "infra_ao_i2c2a", "i2c_sel", 23),
+	GATE_INFRA_AO3(CLK_INFRA_AO_I2C2_IMM, "infra_ao_i2c2_imm", "i2c_sel", 24),
+	GATE_INFRA_AO3(CLK_INFRA_AO_SPI4, "infra_ao_spi4", "spi_sel", 25),
+	GATE_INFRA_AO3(CLK_INFRA_AO_SPI5, "infra_ao_spi5", "spi_sel", 26),
+	GATE_INFRA_AO3(CLK_INFRA_AO_CQ_DMA, "infra_ao_cq_dma", "axi_sel", 27),
+	GATE_INFRA_AO3(CLK_INFRA_AO_UFS, "infra_ao_ufs", "ufs_sel", 28),
+	GATE_INFRA_AO3(CLK_INFRA_AO_AES, "infra_ao_aes", "aes_ufsfde_sel", 29),
+	GATE_INFRA_AO3(CLK_INFRA_AO_SSUSB_XHCI, "infra_ao_ssusb_xhci", "ssusb_xhci_sel", 31),
+	/* INFRA_AO4 */
+	GATE_INFRA_AO4(CLK_INFRA_AO_MSDC0_SELF, "infra_ao_msdc0sf", "msdc50_0_sel", 0),
+	GATE_INFRA_AO4(CLK_INFRA_AO_MSDC1_SELF, "infra_ao_msdc1sf", "msdc50_0_sel", 1),
+	GATE_INFRA_AO4(CLK_INFRA_AO_MSDC2_SELF, "infra_ao_msdc2sf", "msdc50_0_sel", 2),
+	GATE_INFRA_AO4(CLK_INFRA_AO_I2C6, "infra_ao_i2c6", "i2c_sel", 6),
+	GATE_INFRA_AO4(CLK_INFRA_AO_AP_MSDC0, "infra_ao_ap_msdc0", "axi_sel", 7),
+	GATE_INFRA_AO4(CLK_INFRA_AO_MD_MSDC0, "infra_ao_md_msdc0", "axi_sel", 8),
+	GATE_INFRA_AO4(CLK_INFRA_AO_I2C7, "infra_ao_i2c7", "i2c_sel", 22),
+	GATE_INFRA_AO4(CLK_INFRA_AO_I2C8, "infra_ao_i2c8", "i2c_sel", 23),
+	GATE_INFRA_AO4(CLK_INFRA_AO_FBIST2FPC, "infra_ao_fbist2fpc", "msdc50_0_sel", 24),
+	GATE_INFRA_AO4_FLAGS(CLK_INFRA_AO_DEVICE_DAPC_SYNC, "infra_ao_dapc_sync", "axi_sel", 25,
+			     CLK_IS_CRITICAL),
+	GATE_INFRA_AO4(CLK_INFRA_AO_DPMAIF_MAIN, "infra_ao_dpmaif_main", "dpmaif_main_sel", 26),
+	GATE_INFRA_AO4(CLK_INFRA_AO_SPI6_CK, "infra_ao_spi6_ck", "spi_sel", 30),
+	GATE_INFRA_AO4(CLK_INFRA_AO_SPI7_CK, "infra_ao_spi7_ck", "spi_sel", 31),
+};
+
+static const struct mtk_clk_desc infra_ao_desc = {
+	.clks = infra_ao_clks,
+	.num_clks = ARRAY_SIZE(infra_ao_clks),
+};
+
+static const struct of_device_id of_match_clk_mt6893_infra_ao[] = {
+	{ .compatible = "mediatek,mt6893-infracfg-ao", .data = &infra_ao_desc },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, of_match_clk_mt6893_infra_ao);
+
+static struct platform_driver clk_mt6893_infra_ao_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt6893-infra_ao",
+		.of_match_table = of_match_clk_mt6893_infra_ao,
+	},
+};
+module_platform_driver(clk_mt6893_infra_ao_drv);
+
+MODULE_AUTHOR("AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>");
+MODULE_DESCRIPTION("MediaTek MT6893 infracfg clocks driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-mt6893-topckgen.c b/drivers/clk/mediatek/clk-mt6893-topckgen.c
new file mode 100644
index 000000000000..69039623938e
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt6893-topckgen.c
@@ -0,0 +1,880 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ * Copyright (c) 2025 Collabora Ltd.
+ *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+ */
+
+#include <dt-bindings/clock/mediatek,mt6893-clk.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+
+#include "clk-gate.h"
+#include "clk-mtk.h"
+#include "clk-mux.h"
+
+static DEFINE_SPINLOCK(mt6893_clk_lock);
+
+static const struct mtk_fixed_clk top_fixed_clks[] = {
+	FIXED_CLK(CLK_TOP_ULPOSC, "ulposc", NULL, 260000000),
+};
+
+static const struct mtk_fixed_factor top_divs[] = {
+	FACTOR(CLK_TOP_MAINPLL_D3, "mainpll_d3", "mainpll", 1, 3),
+	FACTOR(CLK_TOP_MAINPLL_D4, "mainpll_d4", "mainpll", 1, 4),
+	FACTOR(CLK_TOP_MAINPLL_D4_D2, "mainpll_d4_d2", "mainpll", 1, 8),
+	FACTOR(CLK_TOP_MAINPLL_D4_D4, "mainpll_d4_d4", "mainpll", 1, 16),
+	FACTOR(CLK_TOP_MAINPLL_D4_D8, "mainpll_d4_d8", "mainpll", 1, 32),
+	FACTOR(CLK_TOP_MAINPLL_D4_D16, "mainpll_d4_d16", "mainpll", 1, 64),
+	FACTOR(CLK_TOP_MAINPLL_D5, "mainpll_d5", "mainpll", 1, 5),
+	FACTOR(CLK_TOP_MAINPLL_D5_D2, "mainpll_d5_d2", "mainpll", 1, 10),
+	FACTOR(CLK_TOP_MAINPLL_D5_D4, "mainpll_d5_d4", "mainpll", 1, 20),
+	FACTOR(CLK_TOP_MAINPLL_D5_D8, "mainpll_d5_d8", "mainpll", 1, 40),
+	FACTOR(CLK_TOP_MAINPLL_D6, "mainpll_d6", "mainpll", 1, 6),
+	FACTOR(CLK_TOP_MAINPLL_D6_D2, "mainpll_d6_d2", "mainpll", 1, 12),
+	FACTOR(CLK_TOP_MAINPLL_D6_D4, "mainpll_d6_d4", "mainpll", 1, 24),
+	FACTOR(CLK_TOP_MAINPLL_D6_D8, "mainpll_d6_d8", "mainpll", 1, 48),
+	FACTOR(CLK_TOP_MAINPLL_D7, "mainpll_d7", "mainpll", 1, 7),
+	FACTOR(CLK_TOP_MAINPLL_D7_D2, "mainpll_d7_d2", "mainpll", 1, 14),
+	FACTOR(CLK_TOP_MAINPLL_D7_D4, "mainpll_d7_d4", "mainpll", 1, 28),
+	FACTOR(CLK_TOP_MAINPLL_D7_D8, "mainpll_d7_d8", "mainpll", 1, 56),
+	FACTOR(CLK_TOP_MAINPLL_D9, "mainpll_d9", "mainpll", 1, 9),
+	FACTOR(CLK_TOP_UNIVPLL_D2, "univpll_d2", "univpll", 1, 2),
+	FACTOR(CLK_TOP_UNIVPLL_D3, "univpll_d3", "univpll", 1, 3),
+	FACTOR(CLK_TOP_UNIVPLL_D4, "univpll_d4", "univpll", 1, 4),
+	FACTOR(CLK_TOP_UNIVPLL_D4_D2, "univpll_d4_d2", "univpll", 1, 8),
+	FACTOR(CLK_TOP_UNIVPLL_D4_D4, "univpll_d4_d4", "univpll", 1, 16),
+	FACTOR(CLK_TOP_UNIVPLL_D4_D8, "univpll_d4_d8", "univpll", 1, 32),
+	FACTOR(CLK_TOP_UNIVPLL_D5, "univpll_d5", "univpll", 1, 5),
+	FACTOR(CLK_TOP_UNIVPLL_D5_D2, "univpll_d5_d2", "univpll", 1, 10),
+	FACTOR(CLK_TOP_UNIVPLL_D5_D4, "univpll_d5_d4", "univpll", 1, 20),
+	FACTOR(CLK_TOP_UNIVPLL_D5_D8, "univpll_d5_d8", "univpll", 1, 40),
+	FACTOR(CLK_TOP_UNIVPLL_D5_D16, "univpll_d5_d16", "univpll", 1, 80),
+	FACTOR(CLK_TOP_UNIVPLL_D6, "univpll_d6", "univpll", 1, 6),
+	FACTOR(CLK_TOP_UNIVPLL_D6_D2, "univpll_d6_d2", "univpll", 1, 12),
+	FACTOR(CLK_TOP_UNIVPLL_D6_D4, "univpll_d6_d4", "univpll", 1, 24),
+	FACTOR(CLK_TOP_UNIVPLL_D6_D8, "univpll_d6_d8", "univpll", 1, 48),
+	FACTOR(CLK_TOP_UNIVPLL_D6_D16, "univpll_d6_d16", "univpll", 1, 96),
+	FACTOR(CLK_TOP_UNIVPLL_D7, "univpll_d7", "univpll", 1, 7),
+	FACTOR(CLK_TOP_UNIVPLL_D7_D2, "univpll_d7_d2", "univpll", 1, 14),
+	FACTOR(CLK_TOP_UNIVPLL_192M_D2, "univpll_192m_d2", "univpll", 1, 26),
+	FACTOR(CLK_TOP_UNIVPLL_192M_D4, "univpll_192m_d4", "univpll", 1, 52),
+	FACTOR(CLK_TOP_UNIVPLL_192M_D8, "univpll_192m_d8", "univpll", 1, 104),
+	FACTOR(CLK_TOP_UNIVPLL_192M_D16, "univpll_192m_d16", "univpll", 1, 208),
+	FACTOR(CLK_TOP_UNIVPLL_192M_D32, "univpll_192m_d32", "univpll", 1, 416),
+	FACTOR(CLK_TOP_USB20_192M, "usb20_192m_ck", "univpll", 1, 13),
+	FACTOR(CLK_TOP_USB20_PLL_D2, "usb20_pll_d2", "univpll", 1, 26),
+	FACTOR(CLK_TOP_USB20_PLL_D4, "usb20_pll_d4", "univpll", 1, 52),
+	FACTOR(CLK_TOP_MPLL_D2, "mpll_d2", "mpll", 1, 2),
+	FACTOR(CLK_TOP_MPLL_D4, "mpll_d4", "mpll", 1, 4),
+	FACTOR(CLK_TOP_APLL1_D2, "apll1_d2", "apll1", 1, 2),
+	FACTOR(CLK_TOP_APLL1_D4, "apll1_d4", "apll1", 1, 4),
+	FACTOR(CLK_TOP_APLL1_D8, "apll1_d8", "apll1", 1, 8),
+	FACTOR(CLK_TOP_APLL2_D2, "apll2_d2", "apll2", 1, 2),
+	FACTOR(CLK_TOP_APLL2_D4, "apll2_d4", "apll2", 1, 4),
+	FACTOR(CLK_TOP_APLL2_D8, "apll2_d8", "apll2", 1, 8),
+	FACTOR(CLK_TOP_ADSPPLL_D4, "adsppll_d4", "adsppll", 1, 4),
+	FACTOR(CLK_TOP_ADSPPLL_D5, "adsppll_d5", "adsppll", 1, 5),
+	FACTOR(CLK_TOP_ADSPPLL_D6, "adsppll_d6", "adsppll", 1, 6),
+	FACTOR(CLK_TOP_MMPLL_D3, "mmpll_d3", "mmpll", 1, 3),
+	FACTOR(CLK_TOP_MMPLL_D4, "mmpll_d4", "mmpll", 1, 4),
+	FACTOR(CLK_TOP_MMPLL_D4_D2, "mmpll_d4_d2", "mmpll", 1, 8),
+	FACTOR(CLK_TOP_MMPLL_D4_D4, "mmpll_d4_d4", "mmpll", 1, 16),
+	FACTOR(CLK_TOP_MMPLL_D5, "mmpll_d5", "mmpll", 1, 5),
+	FACTOR(CLK_TOP_MMPLL_D5_D2, "mmpll_d5_d2", "mmpll", 1, 10),
+	FACTOR(CLK_TOP_MMPLL_D5_D4, "mmpll_d5_d4", "mmpll", 1, 20),
+	FACTOR(CLK_TOP_MMPLL_D6, "mmpll_d6", "mmpll", 1, 6),
+	FACTOR(CLK_TOP_MMPLL_D6_D2, "mmpll_d6_d2", "mmpll", 1, 12),
+	FACTOR(CLK_TOP_MMPLL_D7, "mmpll_d7", "mmpll", 1, 7),
+	FACTOR(CLK_TOP_MMPLL_D9, "mmpll_d9", "mmpll", 1, 9),
+	FACTOR(CLK_TOP_APUPLL_D2, "apupll_d2", "apupll", 1, 2),
+	FACTOR(CLK_TOP_TVDPLL_D2, "tvdpll_d2", "tvdpll", 1, 2),
+	FACTOR(CLK_TOP_TVDPLL_D4, "tvdpll_d4", "tvdpll", 1, 4),
+	FACTOR(CLK_TOP_TVDPLL_D8, "tvdpll_d8", "tvdpll", 1, 8),
+	FACTOR(CLK_TOP_TVDPLL_D16, "tvdpll_d16", "tvdpll", 1, 16),
+	FACTOR(CLK_TOP_MSDCPLL_D2, "msdcpll_d2", "msdcpll", 1, 2),
+	FACTOR(CLK_TOP_MSDCPLL_D4, "msdcpll_d4", "msdcpll", 1, 4),
+	FACTOR(CLK_TOP_MSDCPLL_D8, "msdcpll_d8", "msdcpll", 1, 8),
+	FACTOR(CLK_TOP_MSDCPLL_D16, "msdcpll_d16", "msdcpll", 1, 16),
+	FACTOR(CLK_TOP_OSC_D2, "osc_d2", "ulposc", 1, 2),
+	FACTOR(CLK_TOP_OSC_D4, "osc_d4", "ulposc", 1, 4),
+	FACTOR(CLK_TOP_OSC_D8, "osc_d8", "ulposc", 1, 8),
+	FACTOR(CLK_TOP_OSC_D16, "osc_d16", "ulposc", 1, 16),
+	FACTOR(CLK_TOP_OSC_D10, "osc_d10", "ulposc", 1, 10),
+	FACTOR(CLK_TOP_OSC_D20, "osc_d20", "ulposc", 1, 20),
+	FACTOR(CLK_TOP_TVDPLL_MAINPLL_D2, "tvdpll_mainpll_d2_ck", "mainpll", 1, 2),
+};
+
+static const char * const axi_parents[] = {
+	"clk26m",
+	"mainpll_d4_d4",
+	"mainpll_d7_d2",
+	"mainpll_d4_d2",
+	"mainpll_d5_d2",
+	"mainpll_d6_d2",
+	"osc_d4"
+};
+
+static const char * const spm_parents[] = {
+	"clk26m",
+	"osc_d10",
+	"mainpll_d7_d4",
+	"clk32k"
+};
+
+static const char * const scp_parents[] = {
+	"clk26m",
+	"univpll_d5",
+	"mainpll_d6_d2",
+	"mainpll_d6",
+	"univpll_d6",
+	"mainpll_d4_d2",
+	"mainpll_d5_d2",
+	"univpll_d4_d2"
+};
+
+static const char * const bus_aximem_parents[] = {
+	"clk26m",
+	"mainpll_d7_d2",
+	"mainpll_d4_d2",
+	"mainpll_d5_d2",
+	"mainpll_d6"
+};
+
+static const char * const disp_parents[] = {
+	"clk26m",
+	"univpll_d6_d2",
+	"mainpll_d5_d2",
+	"mmpll_d6_d2",
+	"univpll_d5_d2",
+	"univpll_d4_d2",
+	"mmpll_d7",
+	"univpll_d6",
+	"mainpll_d4",
+	"mmpll_d5_d2"
+};
+
+static const char * const mdp_parents[] = {
+	"clk26m",
+	"mainpll_d5_d2",
+	"mmpll_d6_d2",
+	"mainpll_d4_d2",
+	"univpll_d4_d2",
+	"mainpll_d6",
+	"univpll_d6",
+	"mainpll_d4",
+	"tvdpll",
+	"univpll_d4",
+	"mmpll_d5_d2"
+};
+
+static const char * const img_parents[] = {
+	"clk26m",
+	"univpll_d4",
+	"tvdpll",
+	"mainpll_d4",
+	"univpll_d5",
+	"mmpll_d6",
+	"univpll_d6",
+	"mainpll_d6",
+	"mmpll_d4_d2",
+	"mainpll_d4_d2",
+	"mmpll_d6_d2",
+	"mmpll_d5_d2"
+};
+
+static const char * const ipe_parents[] = {
+	"clk26m",
+	"mainpll_d4",
+	"mmpll_d6",
+	"univpll_d6",
+	"mainpll_d6",
+	"univpll_d4_d2",
+	"mainpll_d4_d2",
+	"mmpll_d6_d2",
+	"mmpll_d5_d2"
+};
+
+static const char * const dpe_parents[] = {
+	"clk26m",
+	"mainpll_d4",
+	"mmpll_d6",
+	"univpll_d6",
+	"mainpll_d6",
+	"univpll_d4_d2",
+	"univpll_d5_d2",
+	"mmpll_d6_d2"
+};
+
+static const char * const cam_parents[] = {
+	"clk26m",
+	"mainpll_d4",
+	"mmpll_d6",
+	"univpll_d4",
+	"univpll_d5",
+	"univpll_d6",
+	"mmpll_d7",
+	"univpll_d4_d2",
+	"mainpll_d4_d2",
+	"univpll_d6_d2"
+};
+
+static const char * const ccu_parents[] = {
+	"clk26m",
+	"mainpll_d4",
+	"mmpll_d6",
+	"mainpll_d6",
+	"mmpll_d7",
+	"univpll_d4_d2",
+	"mmpll_d6_d2",
+	"mmpll_d5_d2",
+	"univpll_d5",
+	"univpll_d6_d2"
+};
+
+static const char * const dsp_parents[] = {
+	"clk26m",
+	"mainpll_d4_d4",
+	"univpll_d6_d2",
+	"mainpll_d4_d2",
+	"univpll_d4_d2",
+	"mainpll_d6",
+	"mmpll_d7",
+	"mmpll_d6",
+	"univpll_d5",
+	"mmpll_d5",
+	"tvdpll",
+	"tvdpll_mainpll_d2_ck",
+	"univpll_d4",
+	"mainpll_d3",
+	"apupll_d2",
+	"mmpll_d4"
+};
+
+static const char * const dsp1_parents[] = {
+	"clk26m",
+	"mainpll_d4_d4",
+	"univpll_d6_d2",
+	"mainpll_d4_d2",
+	"univpll_d4_d2",
+	"mainpll_d6",
+	"mmpll_d7",
+	"mmpll_d6",
+	"univpll_d5",
+	"mmpll_d5",
+	"tvdpll",
+	"tvdpll_mainpll_d2_ck",
+	"univpll_d4",
+	"mainpll_d3",
+	"apupll_d2",
+	"univpll_d3"
+};
+
+static const char * const dsp5_parents[] = {
+	"clk26m",
+	"mainpll_d4_d4",
+	"univpll_d6_d2",
+	"mainpll_d4_d2",
+	"univpll_d4_d2",
+	"mainpll_d6",
+	"univpll_d6",
+	"mmpll_d6",
+	"univpll_d5",
+	"mainpll_d4",
+	"tvdpll",
+	"univpll_d4",
+	"mmpll_d4",
+	"mainpll_d3",
+	"univpll_d3",
+	"apupll_d2"
+};
+
+static const char * const dsp7_parents[] = {
+	"clk26m",
+	"mainpll_d4_d4",
+	"univpll_d6_d2",
+	"mainpll_d4_d2",
+	"univpll_d4_d2",
+	"mainpll_d6",
+	"mmpll_d7",
+	"univpll_d6",
+	"mmpll_d6",
+	"univpll_d5",
+	"mmpll_d5",
+	"tvdpll",
+	"tvdpll_mainpll_d2_ck",
+	"univpll_d4",
+	"mainpll_d3",
+	"univpll_d3"
+};
+
+static const char * const ipu_if_parents[] = {
+	"clk26m",
+	"univpll_d6_d4",
+	"mainpll_d4_d4",
+	"univpll_d6_d2",
+	"mainpll_d4_d2",
+	"univpll_d4_d2",
+	"mainpll_d6",
+	"mmpll_d7",
+	"univpll_d6",
+	"mmpll_d6",
+	"univpll_d5",
+	"mmpll_d5",
+	"tvdpll",
+	"tvdpll_mainpll_d2_ck",
+	"univpll_d4",
+	"apupll_d2"
+};
+
+static const char * const mfg_parents[] = {
+	"clk26m",
+	"mfgpll",
+	"univpll_d6",
+	"mainpll_d5_d2"
+};
+
+static const char * const camtg_parents[] = {
+	"clk26m",
+	"univpll_192m_d8",
+	"univpll_d6_d8",
+	"univpll_192m_d4",
+	"univpll_d6_d16",
+	"clk13m",
+	"univpll_192m_d16",
+	"univpll_192m_d32"
+};
+
+static const char * const uart_parents[] = {
+	"clk26m",
+	"univpll_d6_d8"
+};
+
+static const char * const spi_parents[] = {
+	"clk26m",
+	"mainpll_d5_d4",
+	"mainpll_d6_d4",
+	"msdcpll_d4"
+};
+
+static const char * const msdc50_0_h_parents[] = {
+	"clk26m",
+	"mainpll_d4_d2",
+	"mainpll_d6_d2"
+};
+
+static const char * const msdc50_0_parents[] = {
+	"clk26m",
+	"msdcpll",
+	"msdcpll_d2",
+	"univpll_d4_d4",
+	"mainpll_d6_d2",
+	"univpll_d4_d2"
+};
+
+static const char * const msdc30_1_parents[] = {
+	"clk26m",
+	"univpll_d6_d2",
+	"mainpll_d6_d2",
+	"mainpll_d7_d2",
+	"msdcpll_d2"
+};
+
+static const char * const audio_parents[] = {
+	"clk26m",
+	"mainpll_d5_d8",
+	"mainpll_d7_d8",
+	"mainpll_d4_d16"
+};
+
+static const char * const aud_intbus_parents[] = {
+	"clk26m",
+	"mainpll_d4_d4",
+	"mainpll_d7_d4"
+};
+
+static const char * const pwrap_ulposc_parents[] = {
+	"osc_d10",
+	"clk26m",
+	"osc_d4",
+	"osc_d8",
+	"osc_d16"
+};
+
+static const char * const atb_parents[] = {
+	"clk26m",
+	"mainpll_d4_d2",
+	"mainpll_d5_d2"
+};
+
+static const char * const sspm_parents[] = {
+	"clk26m",
+	"mainpll_d5_d2",
+	"univpll_d5_d2",
+	"mainpll_d4_d2",
+	"univpll_d4_d2",
+	"mainpll_d6"
+};
+
+static const char * const dp_parents[] = {
+	"clk26m",
+	"tvdpll_d2",
+	"tvdpll_d4",
+	"tvdpll_d8",
+	"tvdpll_d16"
+};
+
+static const char * const scam_parents[] = {
+	"clk26m",
+	"mainpll_d5_d4"
+};
+
+static const char * const disp_pwm_parents[] = {
+	"clk26m",
+	"univpll_d6_d4",
+	"osc_d2",
+	"osc_d4",
+	"osc_d16"
+};
+
+static const char * const usb_parents[] = {
+	"clk26m",
+	"univpll_d5_d4",
+	"univpll_d6_d4",
+	"univpll_d5_d2"
+};
+
+static const char * const i2c_parents[] = {
+	"clk26m",
+	"mainpll_d4_d8",
+	"univpll_d5_d4"
+};
+
+static const char * const seninf_parents[] = {
+	"clk26m",
+	"univpll_d4_d4",
+	"univpll_d6_d2",
+	"univpll_d4_d2",
+	"univpll_d7",
+	"univpll_d6",
+	"mmpll_d6",
+	"univpll_d5"
+};
+
+static const char * const dxcc_parents[] = {
+	"clk26m",
+	"mainpll_d4_d2",
+	"mainpll_d4_d4",
+	"mainpll_d4_d8"
+};
+
+static const char * const aud_engen1_parents[] = {
+	"clk26m",
+	"apll1_d2",
+	"apll1_d4",
+	"apll1_d8"
+};
+
+static const char * const aud_engen2_parents[] = {
+	"clk26m",
+	"apll2_d2",
+	"apll2_d4",
+	"apll2_d8"
+};
+
+static const char * const aes_ufsfde_parents[] = {
+	"clk26m",
+	"mainpll_d4",
+	"mainpll_d4_d2",
+	"mainpll_d6",
+	"mainpll_d4_d4",
+	"univpll_d4_d2",
+	"univpll_d6"
+};
+
+static const char * const ufs_parents[] = {
+	"clk26m",
+	"mainpll_d4_d4",
+	"mainpll_d4_d8",
+	"univpll_d4_d4",
+	"mainpll_d6_d2",
+	"mainpll_d5_d2",
+	"msdcpll_d2"
+};
+
+static const char * const aud_1_parents[] = {
+	"clk26m",
+	"apll1"
+};
+
+static const char * const aud_2_parents[] = {
+	"clk26m",
+	"apll2"
+};
+
+static const char * const adsp_parents[] = {
+	"clk26m",
+	"mainpll_d6",
+	"mainpll_d5_d2",
+	"univpll_d4_d4",
+	"univpll_d4",
+	"univpll_d6",
+	"adsppll"
+};
+
+static const char * const dpmaif_main_parents[] = {
+	"clk26m",
+	"univpll_d4_d4",
+	"mainpll_d6",
+	"mainpll_d4_d2",
+	"univpll_d4_d2"
+};
+
+static const char * const venc_parents[] = {
+	"clk26m",
+	"mmpll_d7",
+	"mainpll_d6",
+	"univpll_d4_d2",
+	"mainpll_d4_d2",
+	"univpll_d6",
+	"mmpll_d6",
+	"mainpll_d5_d2",
+	"mainpll_d6_d2",
+	"mmpll_d9",
+	"univpll_d4_d4",
+	"mainpll_d4",
+	"univpll_d4",
+	"univpll_d5",
+	"univpll_d5_d2",
+	"tvdpll_mainpll_d2_ck"
+};
+
+static const char * const vdec_parents[] = {
+	"clk26m",
+	"univpll_192m_d2",
+	"univpll_d5_d4",
+	"mainpll_d5",
+	"mainpll_d5_d2",
+	"mmpll_d6_d2",
+	"univpll_d5_d2",
+	"mainpll_d4_d2",
+	"univpll_d4_d2",
+	"univpll_d7",
+	"mmpll_d7",
+	"mmpll_d6",
+	"univpll_d5",
+	"mainpll_d4",
+	"univpll_d4",
+	"univpll_d6"
+};
+
+static const char * const camtm_parents[] = {
+	"clk26m",
+	"univpll_d7",
+	"univpll_d6_d2",
+	"univpll_d4_d2"
+};
+
+static const char * const pwm_parents[] = {
+	"clk26m",
+	"univpll_d4_d8"
+};
+
+static const char * const audio_h_parents[] = {
+	"clk26m",
+	"univpll_d7",
+	"apll1",
+	"apll2"
+};
+
+static const char * const mcupm_parents[] = {
+	"clk26m",
+	"mainpll_d7_d2",
+	"mainpll_d7_d4"
+};
+
+static const char * const spmi_mst_parents[] = {
+	"clk26m",
+	"clk13m",
+	"osc_d8",
+	"osc_d10",
+	"osc_d16",
+	"osc_d20",
+	"clk32k"
+};
+
+static const char * const dvfsrc_parents[] = {
+	"clk26m",
+	"osc_d10"
+};
+
+static const char * const apll_mck_parents[] = {
+	"aud_1_sel",
+	"aud_2_sel"
+};
+
+static const struct mtk_mux top_mtk_muxes[] = {
+	/*
+	 * CLK_CFG_0
+	 * axi_sel and bus_aximem_sel are bus clocks, should not be closed by Linux.
+	 * spm_sel and scp_sel are main clocks in always-on co-processor.
+	 */
+	MUX_GATE_CLR_SET_UPD_FLAGS(CLK_TOP_AXI_SEL, "axi_sel", axi_parents,
+				   0x010, 0x014, 0x018, 0, 3, 7, 0x04, 0,
+				   CLK_IS_CRITICAL | CLK_SET_RATE_PARENT),
+	MUX_GATE_CLR_SET_UPD_FLAGS(CLK_TOP_SPM_SEL, "spm_sel", spm_parents,
+				   0x010, 0x014, 0x018, 8, 2, 15, 0x04, 1,
+				   CLK_IS_CRITICAL | CLK_SET_RATE_PARENT),
+	MUX_GATE_CLR_SET_UPD_FLAGS(CLK_TOP_SCP_SEL, "scp_sel", scp_parents,
+				   0x010, 0x014, 0x018, 16, 3, 23, 0x04, 2,
+				   CLK_IS_CRITICAL | CLK_SET_RATE_PARENT),
+	MUX_GATE_CLR_SET_UPD_FLAGS(CLK_TOP_BUS_AXIMEM_SEL, "bus_aximem_sel", bus_aximem_parents,
+				   0x010, 0x014, 0x018, 24, 3, 31, 0x04, 3,
+				   CLK_IS_CRITICAL | CLK_SET_RATE_PARENT),
+	/* CLK_CFG_1 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DISP_SEL, "disp_sel",
+			     disp_parents, 0x020, 0x024, 0x028, 0, 4, 7, 0x04, 4),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_MDP_SEL, "mdp_sel",
+			     mdp_parents, 0x020, 0x024, 0x028, 8, 4, 15, 0x04, 5),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_IMG1_SEL, "img1_sel",
+			     img_parents, 0x020, 0x024, 0x028, 16, 4, 23, 0x04, 6),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_IMG2_SEL, "img2_sel",
+			     img_parents, 0x020, 0x024, 0x028, 24, 4, 31, 0x04, 7),
+	/* CLK_CFG_2 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_IPE_SEL, "ipe_sel",
+			     ipe_parents, 0x030, 0x034, 0x038, 0, 4, 7, 0x04, 8),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DPE_SEL, "dpe_sel",
+			     dpe_parents, 0x030, 0x034, 0x038, 8, 3, 15, 0x04, 9),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_CAM_SEL, "cam_sel",
+			     cam_parents, 0x030, 0x034, 0x038, 16, 4, 23, 0x04, 10),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_CCU_SEL, "ccu_sel",
+			     ccu_parents, 0x030, 0x034, 0x038, 24, 4, 31, 0x04, 11),
+	/* CLK_CFG_3 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DSP_SEL, "dsp_sel",
+			     dsp_parents, 0x040, 0x044, 0x048, 0, 4, 7, 0x04, 12),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DSP1_SEL, "dsp1_sel",
+			     dsp1_parents, 0x040, 0x044, 0x048, 8, 4, 15, 0x04, 13),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DSP2_SEL, "dsp2_sel",
+			     dsp1_parents, 0x040, 0x044, 0x048, 16, 4, 23, 0x04, 14),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DSP3_SEL, "dsp3_sel",
+			     dsp1_parents, 0x040, 0x044, 0x048, 24, 4, 31, 0x04, 15),
+	/* CLK_CFG_4 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DSP4_SEL, "dsp4_sel",
+			     dsp1_parents, 0x050, 0x054, 0x058, 0, 4, 7, 0x04, 16),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DSP5_SEL, "dsp5_sel",
+			     dsp5_parents, 0x050, 0x054, 0x058, 8, 4, 15, 0x04, 17),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DSP6_SEL, "dsp6_sel",
+			     dsp5_parents, 0x050, 0x054, 0x058, 16, 4, 23, 0x04, 18),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DSP7_SEL, "dsp7_sel",
+			     dsp7_parents, 0x050, 0x054, 0x058, 24, 4, 31, 0x04, 19),
+	/* CLK_CFG_5 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_IPU_IF_SEL, "ipu_if_sel",
+			     ipu_if_parents, 0x060, 0x064, 0x068, 0, 4, 7, 0x04, 20),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_MFG_SEL, "mfg_sel",
+			     mfg_parents, 0x060, 0x064, 0x068, 8, 2, 15, 0x04, 21),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_CAMTG_SEL, "camtg_sel",
+			     camtg_parents, 0x060, 0x064, 0x068, 16, 3, 23, 0x04, 22),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_CAMTG2_SEL, "camtg2_sel",
+			     camtg_parents, 0x060, 0x064, 0x068, 24, 3, 31, 0x04, 23),
+	/* CLK_CFG_6 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_CAMTG3_SEL, "camtg3_sel",
+			     camtg_parents, 0x070, 0x074, 0x078, 0, 3, 7, 0x04, 24),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_CAMTG4_SEL, "camtg4_sel",
+			     camtg_parents, 0x070, 0x074, 0x078, 8, 3, 15, 0x04, 25),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_UART_SEL, "uart_sel",
+			     uart_parents, 0x070, 0x074, 0x078, 16, 1, 23, 0x04, 26),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_SPI_SEL, "spi_sel",
+			     spi_parents, 0x070, 0x074, 0x078, 24, 2, 31, 0x04, 27),
+	/* CLK_CFG_7 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_MSDC50_0_HCLK_SEL, "msdc50_0_h_sel",
+			     msdc50_0_h_parents, 0x080, 0x084, 0x088, 0, 2, 7, 0x04, 28),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_MSDC50_0_SEL, "msdc50_0_sel",
+			     msdc50_0_parents, 0x080, 0x084, 0x088, 8, 3, 15, 0x04, 29),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_MSDC30_1_SEL, "msdc30_1_sel",
+			     msdc30_1_parents, 0x080, 0x084, 0x088, 16, 3, 23, 0x04, 30),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_AUDIO_SEL, "audio_sel",
+			     audio_parents, 0x080, 0x084, 0x088, 24, 2, 31, 0x08, 0),
+	/* CLK_CFG_8 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_AUD_INTBUS_SEL, "aud_intbus_sel",
+			     aud_intbus_parents, 0x090, 0x094, 0x098, 0, 2, 7, 0x08, 1),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_PWRAP_ULPOSC_SEL, "pwrap_ulposc_sel",
+			     pwrap_ulposc_parents, 0x090, 0x094, 0x098, 8, 3, 15, 0x08, 2),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_ATB_SEL, "atb_sel",
+			     atb_parents, 0x090, 0x094, 0x098, 16, 2, 23, 0x08, 3),
+	MUX_GATE_CLR_SET_UPD_FLAGS(CLK_TOP_SSPM_SEL, "sspm_sel", sspm_parents,
+				   0x090, 0x094, 0x098, 24, 3, 31, 0x08, 4,
+				   CLK_IS_CRITICAL | CLK_SET_RATE_PARENT),
+	/* CLK_CFG_9 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DP_SEL, "dp_sel",
+			     dp_parents, 0x0a0, 0x0a4, 0x0a8, 0, 3, 7, 0x08, 5),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_SCAM_SEL, "scam_sel",
+			     scam_parents, 0x0a0, 0x0a4, 0x0a8, 8, 1, 15, 0x08, 6),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DISP_PWM_SEL, "disp_pwm_sel",
+			     disp_pwm_parents, 0x0a0, 0x0a4, 0x0a8, 16, 3, 23, 0x08, 7),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_USB_TOP_SEL, "usb_sel",
+			     usb_parents, 0x0a0, 0x0a4, 0x0a8, 24, 2, 31, 0x08, 8),
+	/* CLK_CFG_10 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_SSUSB_XHCI_SEL, "ssusb_xhci_sel",
+			     usb_parents, 0x0b0, 0x0b4, 0x0b8, 0, 2, 7, 0x08, 9),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_I2C_SEL, "i2c_sel",
+			     i2c_parents, 0x0b0, 0x0b4, 0x0b8, 8, 2, 15, 0x08, 10),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_SENINF_SEL, "seninf_sel",
+			     seninf_parents, 0x0b0, 0x0b4, 0x0b8, 16, 3, 23, 0x08, 11),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_SENINF1_SEL, "seninf1_sel",
+			     seninf_parents, 0x0b0, 0x0b4, 0x0b8, 24, 3, 31, 0x08, 12),
+	/* CLK_CFG_11 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_SENINF2_SEL, "seninf2_sel",
+			     seninf_parents, 0x0c0, 0x0c4, 0x0c8, 0, 3, 7, 0x08, 13),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_SENINF3_SEL, "seninf3_sel",
+			     seninf_parents, 0x0c0, 0x0c4, 0x0c8, 8, 3, 15, 0x08, 14),
+	MUX_GATE_CLR_SET_UPD_FLAGS(CLK_TOP_DXCC_SEL, "dxcc_sel", dxcc_parents,
+				   0x0c0, 0x0c4, 0x0c8, 16, 2, 23, 0x08, 15,
+				   CLK_IS_CRITICAL | CLK_SET_RATE_PARENT),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_AUD_ENGEN1_SEL, "aud_engen1_sel",
+			     aud_engen1_parents, 0x0c0, 0x0c4, 0x0c8, 24, 2, 31, 0x08, 16),
+	/* CLK_CFG_12 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_AUD_ENGEN2_SEL, "aud_engen2_sel",
+			     aud_engen2_parents, 0x0d0, 0x0d4, 0x0d8, 0, 2, 7, 0x08, 17),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_AES_UFSFDE_SEL, "aes_ufsfde_sel",
+			     aes_ufsfde_parents, 0x0d0, 0x0d4, 0x0d8, 8, 3, 15, 0x08, 18),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_UFS_SEL, "ufs_sel",
+			     ufs_parents, 0x0d0, 0x0d4, 0x0d8, 16, 3, 23, 0x08, 19),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_AUD_1_SEL, "aud_1_sel",
+			     aud_1_parents, 0x0d0, 0x0d4, 0x0d8, 24, 1, 31, 0x08, 20),
+	/* CLK_CFG_13 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_AUD_2_SEL, "aud_2_sel",
+			     aud_2_parents, 0x0e0, 0x0e4, 0x0e8, 0, 1, 7, 0x08, 21),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_ADSP_SEL, "adsp_sel",
+			     adsp_parents, 0x0e0, 0x0e4, 0x0e8, 8, 3, 15, 0x08, 22),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_DPMAIF_MAIN_SEL, "dpmaif_main_sel",
+			     dpmaif_main_parents, 0x0e0, 0x0e4, 0x0e8, 16, 3, 23, 0x08, 23),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_VENC_SEL, "venc_sel",
+			     venc_parents, 0x0e0, 0x0e4, 0x0e8, 24, 4, 31, 0x08, 24),
+	/* CLK_CFG_14 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_VDEC_SEL, "vdec_sel",
+			     vdec_parents, 0x0f0, 0x0f4, 0x0f8, 0, 4, 7, 0x08, 25),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_VDEC_LAT_SEL, "vdec_lat_sel",
+			     vdec_parents, 0x0f0, 0x0f4, 0x0f8, 8, 4, 15, 0x08, 26),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_CAMTM_SEL, "camtm_sel",
+			     camtm_parents, 0x0f0, 0x0f4, 0x0f8, 16, 2, 23, 0x08, 27),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_PWM_SEL, "pwm_sel",
+			     pwm_parents, 0x0f0, 0x0f4, 0x0f8, 24, 1, 31, 0x08, 28),
+	/* CLK_CFG_15 */
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_AUDIO_H_SEL, "audio_h_sel",
+			     audio_h_parents, 0x100, 0x104, 0x108, 0, 2, 7, 0x08, 29),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_CAMTG5_SEL, "camtg5_sel",
+			     camtg_parents, 0x100, 0x104, 0x108, 8, 3, 15, 0x0c, 30),
+	MUX_GATE_CLR_SET_UPD(CLK_TOP_CAMTG6_SEL, "camtg6_sel",
+			     camtg_parents, 0x100, 0x104, 0x108, 16, 3, 23, 0x0c, 0),
+	MUX_GATE_CLR_SET_UPD_FLAGS(CLK_TOP_MCUPM_SEL, "mcupm_sel", mcupm_parents,
+				   0x100, 0x104, 0x108, 24, 2, 31, 0x0c, 1,
+				   CLK_IS_CRITICAL | CLK_SET_RATE_PARENT),
+	/* CLK_CFG_16 */
+	MUX_GATE_CLR_SET_UPD_FLAGS(CLK_TOP_SPMI_MST_SEL, "spmi_mst_sel", spmi_mst_parents,
+				   0x110, 0x114, 0x118, 0, 3, 7, 0x0c, 2,
+				   CLK_IS_CRITICAL | CLK_SET_RATE_PARENT),
+	MUX_GATE_CLR_SET_UPD_FLAGS(CLK_TOP_DVFSRC_SEL, "dvfsrc_sel", dvfsrc_parents,
+				   0x110, 0x114, 0x118, 8, 1, 15, 0x0c, 3,
+				   CLK_IS_CRITICAL | CLK_SET_RATE_PARENT),
+};
+
+static const struct mtk_clk_divider top_adj_divs[] = {
+	DIV_ADJ(CLK_TOP_APLL1_CK_DIV0, "apll1_div0", "aud_engen1_sel", 0x320, 24, 4),
+	DIV_ADJ(CLK_TOP_APLL2_CK_DIV0, "apll2_div0", "aud_engen2_sel", 0x320, 28, 4),
+};
+
+static const struct mtk_composite top_composites[] = {
+	MUX(CLK_TOP_APLL_I2S0_MCK_SEL, "apll_i2s0_mck_sel", apll_mck_parents, 0x320, 8, 1),
+	MUX(CLK_TOP_APLL_I2S1_MCK_SEL, "apll_i2s1_mck_sel", apll_mck_parents, 0x320, 9, 1),
+	MUX(CLK_TOP_APLL_I2S2_MCK_SEL, "apll_i2s2_mck_sel", apll_mck_parents, 0x320, 10, 1),
+	MUX(CLK_TOP_APLL_I2S3_MCK_SEL, "apll_i2s3_mck_sel", apll_mck_parents, 0x320, 11, 1),
+	MUX(CLK_TOP_APLL_I2S4_MCK_SEL, "apll_i2s4_mck_sel", apll_mck_parents, 0x320, 12, 1),
+	MUX(CLK_TOP_APLL_I2S5_MCK_SEL, "apll_i2s5_mck_sel", apll_mck_parents, 0x328, 20, 1),
+	MUX(CLK_TOP_APLL_I2S6_MCK_SEL, "apll_i2s6_mck_sel", apll_mck_parents, 0x334, 24, 1),
+	MUX(CLK_TOP_APLL_I2S7_MCK_SEL, "apll_i2s7_mck_sel", apll_mck_parents, 0x334, 25, 1),
+	MUX(CLK_TOP_APLL_I2S8_MCK_SEL, "apll_i2s8_mck_sel", apll_mck_parents, 0x334, 26, 1),
+	MUX(CLK_TOP_APLL_I2S9_MCK_SEL, "apll_i2s9_mck_sel", apll_mck_parents, 0x334, 27, 1),
+
+	DIV_GATE(CLK_TOP_APLL12_CK_DIV0, "apll12_div0", "apll_i2s0_mck_sel",
+		 0x320, 2, 0x324, 8, 0),
+	DIV_GATE(CLK_TOP_APLL12_CK_DIV1, "apll12_div1", "apll_i2s1_mck_sel",
+		 0x320, 3, 0x324, 8, 8),
+	DIV_GATE(CLK_TOP_APLL12_CK_DIV2, "apll12_div2", "apll_i2s2_mck_sel",
+		 0x320, 4, 0x324, 8, 16),
+	DIV_GATE(CLK_TOP_APLL12_CK_DIV3, "apll12_div3", "apll_i2s3_mck_sel",
+		 0x320, 5, 0x324, 8, 24),
+	DIV_GATE(CLK_TOP_APLL12_CK_DIV4, "apll12_div4", "apll_i2s4_mck_sel",
+		 0x320, 6, 0x328, 8, 0),
+	DIV_GATE(CLK_TOP_APLL12_CK_DIVB, "apll12_divb", "apll12_div4",
+		 0x320, 7, 0x328, 8, 8),
+	DIV_GATE(CLK_TOP_APLL12_CK_DIV5_LSB, "apll12_div5_lsb", "apll_i2s5_mck_sel",
+		 0x0328, 16, 0x328, 4, 28),
+	DIV_GATE(CLK_TOP_APLL12_CK_DIV5_MSB, "apll12_div5_msb", "apll_i2s5_mck_sel",
+		 0x0328, 16, 0x334, 4, 0),
+	DIV_GATE(CLK_TOP_APLL12_CK_DIV6, "apll12_div6", "apll_i2s6_mck_sel",
+		 0x0334, 20, 0x338, 8, 0),
+	DIV_GATE(CLK_TOP_APLL12_CK_DIV7, "apll12_div7", "apll_i2s7_mck_sel",
+		 0x0334, 21, 0x338, 8, 8),
+	DIV_GATE(CLK_TOP_APLL12_CK_DIV8, "apll12_div8", "apll_i2s8_mck_sel",
+		 0x0334, 22, 0x338, 8, 16),
+	DIV_GATE(CLK_TOP_APLL12_CK_DIV9, "apll12_div9", "apll_i2s9_mck_sel",
+		 0x0334, 23, 0x338, 8, 24),
+};
+
+/* Register mux notifier for MFG mux */
+static int clk_mt6893_reg_mfg_mux_notifier(struct device *dev, struct clk *clk)
+{
+	struct mtk_mux_nb *mfg_mux_nb;
+	int i;
+
+	mfg_mux_nb = devm_kzalloc(dev, sizeof(*mfg_mux_nb), GFP_KERNEL);
+	if (!mfg_mux_nb)
+		return -ENOMEM;
+
+	for (i = 0; i < ARRAY_SIZE(top_mtk_muxes); i++)
+		if (top_mtk_muxes[i].id == CLK_TOP_MFG_SEL)
+			break;
+	if (i == ARRAY_SIZE(top_mtk_muxes))
+		return -EINVAL;
+
+	mfg_mux_nb->ops = top_mtk_muxes[i].ops;
+	mfg_mux_nb->bypass_index = 0; /* Bypass to 26M crystal */
+
+	return devm_mtk_clk_mux_notifier_register(dev, clk, mfg_mux_nb);
+}
+
+static const struct mtk_clk_desc topck_desc = {
+	.fixed_clks = top_fixed_clks,
+	.num_fixed_clks = ARRAY_SIZE(top_fixed_clks),
+	.factor_clks = top_divs,
+	.num_factor_clks = ARRAY_SIZE(top_divs),
+	.mux_clks = top_mtk_muxes,
+	.num_mux_clks = ARRAY_SIZE(top_mtk_muxes),
+	.composite_clks = top_composites,
+	.num_composite_clks = ARRAY_SIZE(top_composites),
+	.divider_clks = top_adj_divs,
+	.num_divider_clks = ARRAY_SIZE(top_adj_divs),
+	.clk_lock = &mt6893_clk_lock,
+	.clk_notifier_func = clk_mt6893_reg_mfg_mux_notifier,
+	.mfg_clk_idx = CLK_TOP_MFG_SEL,
+};
+
+static const struct of_device_id of_match_clk_mt6893_topck[] = {
+	{ .compatible = "mediatek,mt6893-topckgen", .data = &topck_desc },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, of_match_clk_mt6893_topck);
+
+static struct platform_driver clk_mt6893_topck_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt6893-topck",
+		.of_match_table = of_match_clk_mt6893_topck,
+	},
+};
+module_platform_driver(clk_mt6893_topck_drv);
+
+MODULE_AUTHOR("AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>");
+MODULE_DESCRIPTION("MediaTek MT6893 top clock generators driver");
+MODULE_LICENSE("GPL");
-- 
2.49.0

