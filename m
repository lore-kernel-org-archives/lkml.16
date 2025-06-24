Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.76.142.27])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB84825C821;
	Tue, 24 Jun 2025 10:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.76.142.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750761209; cv=none; b=c+xGxwwS10Z+ASOxKh1NeEqAogJoIkJ8akbrzDY6/WzpRn6NlC1i5AR0fdIc1vFc2iHL7qWsHfN4lA05X4WOmcvqSZAmdpMQ9ycfaw1NMoStr4GdeDYVvzd4Kn2hd8XDqHIZBrU/WeKBhnYBMRvRPKSs5R/ftMbP0kHiIJ8dXJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750761209; c=relaxed/simple;
	bh=0wnNS+z4JgN8kpfhovGDYfxOA1R4/M8rxQlpe2fijek=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CW7GrYQ+fenNLgTQnB7kB3hx7BvxU+LAwQDdMsR+4UhretKF3iZy2wIzNAYCm7h0wtUDQo7oasHTY4mgJTleroxu0vGnkJlLJXlRPvOt9SXpaXZgbJIqyK+aypgQld5vA7o8Fkg9AppORjG8tEgvCRjZ1JXjGdrLtuN2eEX9pvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=13.76.142.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0005152DT.eswin.cn (unknown [10.12.96.41])
	by app2 (Coremail) with SMTP id TQJkCgAXtpTsflpowbCkAA--.54498S2;
	Tue, 24 Jun 2025 18:33:17 +0800 (CST)
From: dongxuyang@eswincomputing.com
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: ningyu@eswincomputing.com,
	linmin@eswincomputing.com,
	huangyifeng@eswincomputing.com,
	Xuyang Dong <dongxuyang@eswincomputing.com>
Subject: [PATCH v3 2/2] clock: eswin: Add eic7700 clock driver
Date: Tue, 24 Jun 2025 18:33:14 +0800
Message-Id: <20250624103314.400-1-dongxuyang@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20250624103212.287-1-dongxuyang@eswincomputing.com>
References: <20250624103212.287-1-dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:TQJkCgAXtpTsflpowbCkAA--.54498S2
X-Coremail-Antispam: 1UD129KBjvAXoWDtr4Utr48JrW3KFyfJFWDArb_yoWDAF1fWo
	WUWF4DJr18t34IyrZxCrWfu34Y93Z7A3sFvrs5Xr1IyFnrGF17KryxCF4Ygr1ftryYkr97
	Awn5GrWfurWjqFWUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUYb7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20EY4v20xva
	j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
	x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8
	Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
	xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0E
	n4kS14v26r1q6r43MxkIecxEwVCm-wCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFyl
	IxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIx
	AIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2
	jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUpwZcUUUUU=
X-CM-SenderInfo: pgrqw5xx1d0w46hv4xpqfrz1xxwl0woofrz/

From: Xuyang Dong <dongxuyang@eswincomputing.com>

This driver depends on the CCF framework implementation.
  Based on this driver, other modules in the SoC can use the APIs
  provided by CCF to perform clock-related operations.
  The driver supports eic7700 series chips.

Signed-off-by: Yifeng Huang <huangyifeng@eswincomputing.com>
Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>
---
 drivers/clk/Kconfig             |    1 +
 drivers/clk/Makefile            |    1 +
 drivers/clk/eswin/Kconfig       |   10 +
 drivers/clk/eswin/Makefile      |    8 +
 drivers/clk/eswin/clk-eic7700.c | 3809 +++++++++++++++++++++++++++++++
 drivers/clk/eswin/clk-eic7700.h |  194 ++
 drivers/clk/eswin/clk.c         |  972 ++++++++
 drivers/clk/eswin/clk.h         |  213 ++
 8 files changed, 5208 insertions(+)
 create mode 100644 drivers/clk/eswin/Kconfig
 create mode 100644 drivers/clk/eswin/Makefile
 create mode 100644 drivers/clk/eswin/clk-eic7700.c
 create mode 100644 drivers/clk/eswin/clk-eic7700.h
 create mode 100644 drivers/clk/eswin/clk.c
 create mode 100644 drivers/clk/eswin/clk.h

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 19c1ed280fd7..cf52d705206d 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -497,6 +497,7 @@ source "drivers/clk/actions/Kconfig"
 source "drivers/clk/analogbits/Kconfig"
 source "drivers/clk/baikal-t1/Kconfig"
 source "drivers/clk/bcm/Kconfig"
+source "drivers/clk/eswin/Kconfig"
 source "drivers/clk/hisilicon/Kconfig"
 source "drivers/clk/imgtec/Kconfig"
 source "drivers/clk/imx/Kconfig"
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 42867cd37c33..8ac67ad2cbc2 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -118,6 +118,7 @@ obj-$(CONFIG_CLK_BAIKAL_T1)		+= baikal-t1/
 obj-y					+= bcm/
 obj-$(CONFIG_ARCH_BERLIN)		+= berlin/
 obj-$(CONFIG_ARCH_DAVINCI)		+= davinci/
+obj-$(CONFIG_ARCH_ESWIN)		+= eswin/
 obj-$(CONFIG_ARCH_HISI)			+= hisilicon/
 obj-y					+= imgtec/
 obj-y					+= imx/
diff --git a/drivers/clk/eswin/Kconfig b/drivers/clk/eswin/Kconfig
new file mode 100644
index 000000000000..f2284c2d790d
--- /dev/null
+++ b/drivers/clk/eswin/Kconfig
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config COMMON_CLK_EIC7700
+	bool "EIC7700 Clock Driver"
+	depends on ARCH_ESWIN
+	help
+	  Build the Eswin EIC7700 SoC clock driver based on the
+	  common clock framework. This driver provides support
+	  for the clock control on the Eswin EIC7700 SoC,
+	  which is essential for managing clock rates and power management.
diff --git a/drivers/clk/eswin/Makefile b/drivers/clk/eswin/Makefile
new file mode 100644
index 000000000000..a3139e34ee22
--- /dev/null
+++ b/drivers/clk/eswin/Makefile
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Eswin Clock specific Makefile
+#
+
+obj-y	+= clk.o
+
+obj-$(CONFIG_COMMON_CLK_EIC7700)	+= clk-eic7700.o
diff --git a/drivers/clk/eswin/clk-eic7700.c b/drivers/clk/eswin/clk-eic7700.c
new file mode 100644
index 000000000000..978f481aea78
--- /dev/null
+++ b/drivers/clk/eswin/clk-eic7700.c
@@ -0,0 +1,3809 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025, Beijing ESWIN Computing Technology Co., Ltd.. All rights reserved.
+ *
+ * ESWIN EIC7700 Clk Provider Driver
+ *
+ * Authors:
+ *	Yifeng Huang <huangyifeng@eswincomputing.com>
+ *	Xuyang Dong <dongxuyang@eswincomputing.com>
+ */
+
+#include "clk.h"
+#include "clk-eic7700.h"
+#include <dt-bindings/clock/eswin,eic7700-clock.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/kernel.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+
+/* clock parent list */
+static const char *const mux_u_cpu_root_3mux1_gfree_p[] = {
+	"clk_pll_cpu", "clk_clk_u84_core_lp", "fixed_rate_clk_xtal_24m"
+};
+
+static u32 mux_u_cpu_root_3mux1_gfree_p_table[] = { 0x000000, 0x000001,
+						    0x000002 };
+
+static const char *const mux_u_cpu_aclk_2mux1_gfree_p[] = {
+	"fixed_factor_u_cpu_div2", "mux_u_cpu_root_3mux1_gfree"
+};
+
+static const char *const dsp_aclk_root_2mux1_gfree_mux_p[] = {
+	"fixed_rate_clk_spll2_fout1", "fixed_rate_clk_spll0_fout1"
+};
+
+static const char *const d2d_aclk_root_2mux1_gfree_mux_p[] = {
+	"fixed_rate_clk_spll2_fout1",
+	"fixed_rate_clk_spll0_fout1",
+};
+
+static const char *const ddr_aclk_root_2mux1_gfree_mux_p[] = {
+	"fixed_rate_clk_spll2_fout1",
+	"fixed_rate_clk_spll0_fout1",
+};
+
+static const char *const mshcore_root_3mux1_0_mux_p[] = {
+	"fixed_rate_clk_spll0_fout3", "fixed_rate_clk_spll2_fout3",
+	"fixed_rate_clk_xtal_24m"
+};
+
+static u32 mshcore_root_3mux1_0_mux_p_table[] = { 0x000000, 0x000001,
+						  0x100000 };
+
+static const char *const mshcore_root_3mux1_1_mux_p[] = {
+	"fixed_rate_clk_spll0_fout3", "fixed_rate_clk_spll2_fout3",
+	"fixed_rate_clk_xtal_24m"
+};
+
+static u32 mshcore_root_3mux1_1_mux_p_table[] = { 0x000000, 0x000001,
+						  0x100000 };
+
+static const char *const mshcore_root_3mux1_2_mux_p[] = {
+	"fixed_rate_clk_spll0_fout3", "fixed_rate_clk_spll2_fout3",
+	"fixed_rate_clk_xtal_24m"
+};
+
+static u32 mshcore_root_3mux1_2_mux_p_table[] = { 0x000000, 0x000001,
+						  0x100000 };
+
+static const char *const npu_llclk_3mux1_gfree_mux_p[] = {
+	"clk_clk_npu_llc_src0", "clk_clk_npu_llc_src1",
+	"fixed_rate_clk_vpll_fout1"
+};
+
+static u32 npu_llclk_3mux1_gfree_mux_p_table[] = { 0x000000, 0x000001,
+						   0x000002 };
+
+static const char *const npu_core_3mux1_gfree_mux_p[] = {
+	"fixed_rate_clk_spll1_fout1", "fixed_rate_clk_vpll_fout1",
+	"fixed_rate_clk_spll2_fout2"
+};
+
+static u32 npu_core_3mux1_gfree_mux_p_table[] = { 0x000000, 0x000001,
+						  0x000002 };
+
+static const char *const npu_e31_3mux1_gfree_mux_p[] = {
+	"fixed_rate_clk_spll1_fout1", "fixed_rate_clk_vpll_fout1",
+	"fixed_rate_clk_spll2_fout2"
+};
+
+static u32 npu_e31_3mux1_gfree_mux_p_table[] = { 0x000000, 0x000100, 0x000200 };
+
+static const char *const vi_aclk_root_2mux1_gfree_mux_p[] = {
+	"fixed_rate_clk_spll0_fout1", "fixed_rate_clk_spll2_fout1"
+};
+
+static const char *const mux_u_vi_dw_root_2mux1_p[] = {
+	"fixed_rate_clk_vpll_fout1", "fixed_rate_clk_spll0_fout1"
+};
+
+static const char *const mux_u_vi_dvp_root_2mux1_gfree_p[] = {
+	"fixed_rate_clk_vpll_fout1", "fixed_rate_clk_spll0_fout1"
+};
+
+static const char *const mux_u_vi_dig_isp_root_2mux1_gfree_p[] = {
+	"fixed_rate_clk_vpll_fout1", "fixed_rate_clk_spll0_fout1"
+};
+
+static const char *const mux_u_vo_aclk_root_2mux1_gfree_p[] = {
+	"fixed_rate_clk_spll0_fout1", "fixed_rate_clk_spll2_fout1"
+};
+
+static const char *const mux_u_vo_pixel_root_2mux1_p[] = {
+	"fixed_rate_clk_vpll_fout1", "fixed_rate_clk_spll2_fout2"
+};
+
+static const char *const mux_u_vcdec_root_2mux1_gfree_p[] = {
+	"fixed_rate_clk_spll0_fout1", "fixed_rate_clk_spll2_fout1"
+};
+
+static const char *const mux_u_vcaclk_root_2mux1_gfree_p[] = {
+	"fixed_rate_clk_spll0_fout1", "fixed_rate_clk_spll2_fout1"
+};
+
+static const char *const mux_u_syscfg_clk_root_2mux1_gfree_p[] = {
+	"divder_u_sys_cfg_div_dynm", "fixed_rate_clk_xtal_24m"
+};
+
+static const char *const mux_u_bootspi_clk_2mux1_gfree_p[] = {
+	"divder_u_bootspi_div_dynm", "fixed_rate_clk_xtal_24m"
+};
+
+static const char *const mux_u_scpu_core_clk_2mux1_gfree_p[] = {
+	"divder_u_scpu_core_div_dynm", "fixed_rate_clk_xtal_24m"
+};
+
+static const char *const mux_u_lpcpu_core_clk_2mux1_gfree_p[] = {
+	"divder_u_lpcpu_core_div_dynm", "fixed_rate_clk_xtal_24m"
+};
+
+static const char *const mux_u_vo_mclk_2mux_ext_mclk_p[] = {
+	"divder_u_vo_mclk_div_dynm", "fixed_rate_ext_mclk"
+};
+
+static const char *const mux_u_aondma_axi2mux1_gfree_p[] = {
+	"divder_u_aondma_axi_div_dynm", "fixed_rate_clk_xtal_24m"
+};
+
+static const char *const mux_u_rmii_ref_2mux1_p[] = {
+	"fixed_factor_u_hsp_rmii_ref_div6", "fixed_rate_lpddr_ref_bak"
+};
+
+static const char *const mux_u_eth_core_2mux1_p[] = {
+	"fixed_rate_clk_spll1_fout3", "fixed_rate_lpddr_ref_bak"
+};
+
+static const char *const mux_u_sata_phy_2mux1_p[] = {
+	"divder_u_sata_phy_ref_div_dynm", "fixed_rate_lpddr_ref_bak"
+};
+
+/* fixed rate clocks */
+static struct eswin_fixed_rate_clock eic7700_fixed_rate_clks[] = {
+	{
+		EIC7700_XTAL_24M,
+		"fixed_rate_clk_xtal_24m",
+		NULL,
+		0,
+		24000000,
+	},
+	{
+		EIC7700_XTAL_32K,
+		"fixed_rate_clk_xtal_32k",
+		NULL,
+		0,
+		32768,
+	},
+	{
+		EIC7700_SPLL0_FOUT1,
+		"fixed_rate_clk_spll0_fout1",
+		NULL,
+		0,
+		1600000000,
+	},
+	{
+		EIC7700_SPLL0_FOUT2,
+		"fixed_rate_clk_spll0_fout2",
+		NULL,
+		0,
+		800000000,
+	},
+	{
+		EIC7700_SPLL0_FOUT3,
+		"fixed_rate_clk_spll0_fout3",
+		NULL,
+		0,
+		400000000,
+	},
+	{
+		EIC7700_SPLL1_FOUT1,
+		"fixed_rate_clk_spll1_fout1",
+		NULL,
+		0,
+		1500000000,
+	},
+	{
+		EIC7700_SPLL1_FOUT2,
+		"fixed_rate_clk_spll1_fout2",
+		NULL,
+		0,
+		300000000,
+	},
+	{
+		EIC7700_SPLL1_FOUT3,
+		"fixed_rate_clk_spll1_fout3",
+		NULL,
+		0,
+		250000000,
+	},
+	{
+		EIC7700_SPLL2_FOUT1,
+		"fixed_rate_clk_spll2_fout1",
+		NULL,
+		0,
+		2080000000,
+	},
+	{
+		EIC7700_SPLL2_FOUT2,
+		"fixed_rate_clk_spll2_fout2",
+		NULL,
+		0,
+		1040000000,
+	},
+	{
+		EIC7700_SPLL2_FOUT3,
+		"fixed_rate_clk_spll2_fout3",
+		NULL,
+		0,
+		416000000,
+	},
+	{
+		EIC7700_VPLL_FOUT1,
+		"fixed_rate_clk_vpll_fout1",
+		NULL,
+		0,
+		1188000000,
+	},
+	{
+		EIC7700_VPLL_FOUT2,
+		"fixed_rate_clk_vpll_fout2",
+		NULL,
+		0,
+		594000000,
+	},
+	{
+		EIC7700_VPLL_FOUT3,
+		"fixed_rate_clk_vpll_fout3",
+		NULL,
+		0,
+		49500000,
+	},
+	{
+		EIC7700_APLL_FOUT2,
+		"fixed_rate_clk_apll_fout2",
+		NULL,
+		0,
+		0,
+	},
+	{
+		EIC7700_APLL_FOUT3,
+		"fixed_rate_clk_apll_fout3",
+		NULL,
+		0,
+		0,
+	},
+	{
+		EIC7700_EXT_MCLK,
+		"fixed_rate_ext_mclk",
+		NULL,
+		0,
+		0,
+	},
+	{
+		EIC7700_LPDDR_REF_BAK,
+		"fixed_rate_lpddr_ref_bak",
+		NULL,
+		0,
+		50000000,
+	},
+};
+
+static struct eswin_pll_clock eic7700_pll_clks[] = {
+	{
+		EIC7700_APLL_FOUT1,
+		"clk_apll_fout1",
+		NULL,
+		EIC7700_REG_OFFSET_APLL_CFG_0,
+		0,
+		1,
+		12,
+		6,
+		20,
+		12,
+		EIC7700_REG_OFFSET_APLL_CFG_1,
+		4,
+		24,
+		EIC7700_REG_OFFSET_APLL_CFG_2,
+		1,
+		3,
+		16,
+		3,
+		EIC7700_REG_OFFSET_PLL_STATUS,
+		4,
+		1,
+	},
+	{
+		EIC7700_PLL_CPU,
+		"clk_pll_cpu",
+		NULL,
+		EIC7700_REG_OFFSET_MCPUT_PLL_CFG_0,
+		0,
+		1,
+		12,
+		6,
+		20,
+		12,
+		EIC7700_REG_OFFSET_MCPUT_PLL_CFG_1,
+		4,
+		24,
+		EIC7700_REG_OFFSET_MCPUT_PLL_CFG_2,
+		1,
+		3,
+		16,
+		3,
+		EIC7700_REG_OFFSET_PLL_STATUS,
+		5,
+		1,
+	},
+};
+
+/* fixed factor clocks */
+static struct eswin_fixed_factor_clock eic7700_fixed_factor_clks[] = {
+	{
+		EIC7700_FIXED_FACTOR_U_CPU_DIV2,
+		"fixed_factor_u_cpu_div2",
+		"mux_u_cpu_root_3mux1_gfree",
+		1,
+		2,
+		0,
+	},
+
+	{
+		EIC7700_FIXED_FACTOR_U_CLK_1M_DIV24,
+		"fixed_factor_u_clk_1m_div24",
+		"fixed_rate_clk_xtal_24m",
+		1,
+		24,
+		0,
+	},
+
+	{
+		EIC7700_FIXED_FACTOR_U_MIPI_TXESC_DIV10,
+		"fixed_factor_u_mipi_txesc_div10",
+		"clk_clk_sys_cfg",
+		1,
+		10,
+		0,
+	},
+
+	{
+		EIC7700_FIXED_FACTOR_U_U84_CORE_LP_DIV2,
+		"fixed_factor_u_u84_core_lp_div2",
+		"gate_clk_spll0_fout2",
+		1,
+		2,
+		0,
+	},
+
+	{
+		EIC7700_FIXED_FACTOR_U_SCPU_BUS_DIV2,
+		"fixed_factor_u_scpu_bus_div2",
+		"mux_u_scpu_core_clk_2mux1_gfree",
+		1,
+		2,
+		0,
+	},
+
+	{
+		EIC7700_FIXED_FACTOR_U_LPCPU_BUS_DIV2,
+		"fixed_factor_u_lpcpu_bus_div2",
+		"mux_u_lpcpu_core_clk_2mux1_gfree",
+		1,
+		2,
+		0,
+	},
+
+	{
+		EIC7700_FIXED_FACTOR_U_PCIE_CR_DIV2,
+		"fixed_factor_u_pcie_cr_div2",
+		"clk_clk_sys_cfg",
+		1,
+		2,
+		0,
+	},
+
+	{
+		EIC7700_FIXED_FACTOR_U_PCIE_AUX_DIV4,
+		"fixed_factor_u_pcie_aux_div4",
+		"clk_clk_sys_cfg",
+		1,
+		4,
+		0,
+	},
+
+	{
+		EIC7700_FIXED_FACTOR_U_PVT_DIV20,
+		"fixed_factor_u_pvt_div20",
+		"fixed_rate_clk_xtal_24m",
+		1,
+		20,
+		0,
+	},
+
+	{
+		EIC7700_FIXED_FACTOR_U_HSP_RMII_REF_DIV6,
+		"fixed_factor_u_hsp_rmii_ref_div6",
+		"fixed_rate_clk_spll1_fout2",
+		1,
+		6,
+		0,
+	},
+};
+
+static struct eswin_mux_clock eic7700_mux_clks[] = {
+	{
+		EIC7700_MUX_U_CPU_ROOT_3MUX1_GFREE,
+		"mux_u_cpu_root_3mux1_gfree",
+		mux_u_cpu_root_3mux1_gfree_p,
+		ARRAY_SIZE(mux_u_cpu_root_3mux1_gfree_p),
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_U84_CLK_CTRL,
+		0,
+		BIT_MASK(0) | BIT_MASK(1),
+		0,
+		mux_u_cpu_root_3mux1_gfree_p_table,
+	},
+
+	{
+		EIC7700_MUX_U_CPU_ACLK_2MUX1_GFREE,
+		"mux_u_cpu_aclk_2mux1_gfree",
+		mux_u_cpu_aclk_2mux1_gfree_p,
+		ARRAY_SIZE(mux_u_cpu_aclk_2mux1_gfree_p),
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_U84_CLK_CTRL,
+		20,
+		1,
+		0,
+	},
+
+	{
+		EIC7700_MUX_U_DSP_ACLK_ROOT_2MUX1_GFREE,
+		"mux_u_dsp_aclk_root_2mux1_gfree",
+		dsp_aclk_root_2mux1_gfree_mux_p,
+		ARRAY_SIZE(dsp_aclk_root_2mux1_gfree_mux_p),
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_DSP_ACLK_CTRL,
+		0,
+		1,
+		0,
+	},
+
+	{
+		EIC7700_MUX_U_D2D_ACLK_ROOT_2MUX1_GFREE,
+		"mux_u_d2d_aclk_root_2mux1_gfree",
+		d2d_aclk_root_2mux1_gfree_mux_p,
+		ARRAY_SIZE(d2d_aclk_root_2mux1_gfree_mux_p),
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_D2D_ACLK_CTRL,
+		0,
+		1,
+		0,
+	},
+
+	{
+		EIC7700_MUX_U_DDR_ACLK_ROOT_2MUX1_GFREE,
+		"mux_u_ddr_aclk_root_2mux1_gfree",
+		ddr_aclk_root_2mux1_gfree_mux_p,
+		ARRAY_SIZE(ddr_aclk_root_2mux1_gfree_mux_p),
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_DDR_CLK_CTRL,
+		16,
+		1,
+		0,
+	},
+
+	{ EIC7700_MUX_U_MSHCORE_ROOT_3MUX1_0, "mux_u_mshcore_root_3mux1_0",
+	  mshcore_root_3mux1_0_mux_p, ARRAY_SIZE(mshcore_root_3mux1_0_mux_p),
+	  CLK_SET_RATE_PARENT, EIC7700_REG_OFFSET_MSHC0_CORECLK_CTRL, 0,
+	  BIT_MASK(0) | BIT_MASK(20), 0, mshcore_root_3mux1_0_mux_p_table },
+
+	{
+		EIC7700_MUX_U_MSHCORE_ROOT_3MUX1_1,
+		"mux_u_mshcore_root_3mux1_1",
+		mshcore_root_3mux1_1_mux_p,
+		ARRAY_SIZE(mshcore_root_3mux1_1_mux_p),
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_MSHC1_CORECLK_CTRL,
+		0,
+		BIT_MASK(0) | BIT_MASK(20),
+		0,
+		mshcore_root_3mux1_1_mux_p_table,
+	},
+
+	{ EIC7700_MUX_U_MSHCORE_ROOT_3MUX1_2, "mux_u_mshcore_root_3mux1_2",
+	  mshcore_root_3mux1_2_mux_p, ARRAY_SIZE(mshcore_root_3mux1_2_mux_p),
+	  CLK_SET_RATE_PARENT, EIC7700_REG_OFFSET_MSHC2_CORECLK_CTRL, 0,
+	  BIT_MASK(0) | BIT_MASK(20), 0, mshcore_root_3mux1_2_mux_p_table },
+
+	{ EIC7700_MUX_U_NPU_LLCLK_3MUX1_GFREE, "mux_u_npu_llclk_3mux1_gfree",
+	  npu_llclk_3mux1_gfree_mux_p, ARRAY_SIZE(npu_llclk_3mux1_gfree_mux_p),
+	  CLK_SET_RATE_PARENT, EIC7700_REG_OFFSET_NPU_LLC_CTRL, 0,
+	  BIT_MASK(0) | BIT_MASK(1), 0, npu_llclk_3mux1_gfree_mux_p_table },
+
+	{ EIC7700_MUX_U_NPU_CORE_3MUX1_GFREE, "mux_u_npu_core_3mux1_gfree",
+	  npu_core_3mux1_gfree_mux_p, ARRAY_SIZE(npu_core_3mux1_gfree_mux_p),
+	  CLK_SET_RATE_PARENT, EIC7700_REG_OFFSET_NPU_CORE_CTRL, 0,
+	  BIT_MASK(0) | BIT_MASK(1), 0, npu_core_3mux1_gfree_mux_p_table },
+
+	{ EIC7700_MUX_U_NPU_E31_3MUX1_GFREE, "mux_u_npu_e31_3mux1_gfree",
+	  npu_e31_3mux1_gfree_mux_p, ARRAY_SIZE(npu_e31_3mux1_gfree_mux_p),
+	  CLK_SET_RATE_PARENT, EIC7700_REG_OFFSET_NPU_CORE_CTRL, 0,
+	  BIT_MASK(8) | BIT_MASK(9), 0, npu_e31_3mux1_gfree_mux_p_table },
+
+	{
+		EIC7700_MUX_U_VI_ACLK_ROOT_2MUX1_GFREE,
+		"mux_u_vi_aclk_root_2mux1_gfree",
+		vi_aclk_root_2mux1_gfree_mux_p,
+		ARRAY_SIZE(vi_aclk_root_2mux1_gfree_mux_p),
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_VI_ACLK_CTRL,
+		0,
+		1,
+		0,
+	},
+
+	{
+		EIC7700_MUX_U_VI_DW_ROOT_2MUX1,
+		"mux_u_vi_dw_root_2mux1",
+		mux_u_vi_dw_root_2mux1_p,
+		ARRAY_SIZE(mux_u_vi_dw_root_2mux1_p),
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_VI_DWCLK_CTRL,
+		0,
+		1,
+		0,
+	},
+
+	{
+		EIC7700_MUX_U_VI_DVP_ROOT_2MUX1_GFREE,
+		"mux_u_vi_dvp_root_2mux1_gfree",
+		mux_u_vi_dvp_root_2mux1_gfree_p,
+		ARRAY_SIZE(mux_u_vi_dvp_root_2mux1_gfree_p),
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_VI_DVP_CLK_CTRL,
+		0,
+		1,
+		0,
+	},
+
+	{
+		EIC7700_MUX_U_VI_DIG_ISP_ROOT_2MUX1_GFREE,
+		"mux_u_vi_dig_isp_root_2mux1_gfree",
+		mux_u_vi_dig_isp_root_2mux1_gfree_p,
+		ARRAY_SIZE(mux_u_vi_dig_isp_root_2mux1_gfree_p),
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_VI_DIG_ISP_CLK_CTRL,
+		0,
+		1,
+		0,
+	},
+
+	{
+		EIC7700_MUX_U_VO_ACLK_ROOT_2MUX1_GFREE,
+		"mux_u_vo_aclk_root_2mux1_gfree",
+		mux_u_vo_aclk_root_2mux1_gfree_p,
+		ARRAY_SIZE(mux_u_vo_aclk_root_2mux1_gfree_p),
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_VO_ACLK_CTRL,
+		0,
+		1,
+		0,
+	},
+
+	{
+		EIC7700_MUX_U_VO_PIXEL_ROOT_2MUX1,
+		"mux_u_vo_pixel_root_2mux1",
+		mux_u_vo_pixel_root_2mux1_p,
+		ARRAY_SIZE(mux_u_vo_pixel_root_2mux1_p),
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_VO_PIXEL_CTRL,
+		0,
+		1,
+		0,
+	},
+
+	{
+		EIC7700_MUX_U_VCDEC_ROOT_2MUX1_GFREE,
+		"mux_u_vcdec_root_2mux1_gfree",
+		mux_u_vcdec_root_2mux1_gfree_p,
+		ARRAY_SIZE(mux_u_vcdec_root_2mux1_gfree_p),
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_VCDEC_ROOTCLK_CTRL,
+		0,
+		1,
+		0,
+	},
+
+	{
+		EIC7700_MUX_U_VCACLK_ROOT_2MUX1_GFREE,
+		"mux_u_vcaclk_root_2mux1_gfree",
+		mux_u_vcaclk_root_2mux1_gfree_p,
+		ARRAY_SIZE(mux_u_vcaclk_root_2mux1_gfree_p),
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_VC_ACLK_CTRL,
+		0,
+		1,
+		0,
+	},
+
+	{
+		EIC7700_MUX_U_SYSCFG_CLK_ROOT_2MUX1_GFREE,
+		"mux_u_syscfg_clk_root_2mux1_gfree",
+		mux_u_syscfg_clk_root_2mux1_gfree_p,
+		ARRAY_SIZE(mux_u_syscfg_clk_root_2mux1_gfree_p),
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_SYSCFG_CLK_CTRL,
+		0,
+		1,
+		0,
+	},
+
+	{
+		EIC7700_MUX_U_BOOTSPI_CLK_2MUX1_GFREE,
+		"mux_u_bootspi_clk_2mux1_gfree",
+		mux_u_bootspi_clk_2mux1_gfree_p,
+		ARRAY_SIZE(mux_u_bootspi_clk_2mux1_gfree_p),
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_BOOTSPI_CLK_CTRL,
+		0,
+		1,
+		0,
+	},
+
+	{
+		EIC7700_MUX_U_SCPU_CORE_CLK_2MUX1_GFREE,
+		"mux_u_scpu_core_clk_2mux1_gfree",
+		mux_u_scpu_core_clk_2mux1_gfree_p,
+		ARRAY_SIZE(mux_u_scpu_core_clk_2mux1_gfree_p),
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_SCPU_CORECLK_CTRL,
+		0,
+		1,
+		0,
+	},
+
+	{
+		EIC7700_MUX_U_LPCPU_CORE_CLK_2MUX1_GFREE,
+		"mux_u_lpcpu_core_clk_2mux1_gfree",
+		mux_u_lpcpu_core_clk_2mux1_gfree_p,
+		ARRAY_SIZE(mux_u_lpcpu_core_clk_2mux1_gfree_p),
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_LPCPU_CORECLK_CTRL,
+		0,
+		1,
+		0,
+	},
+
+	{
+		EIC7700_MUX_U_VO_MCLK_2MUX_EXT_MCLK,
+		"mux_u_vo_mclk_2mux_ext_mclk",
+		mux_u_vo_mclk_2mux_ext_mclk_p,
+		ARRAY_SIZE(mux_u_vo_mclk_2mux_ext_mclk_p),
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_VO_MCLK_CTRL,
+		0,
+		1,
+		0,
+	},
+
+	{
+		EIC7700_MUX_U_AONDMA_AXI2MUX1_GFREE,
+		"mux_u_aondma_axi2mux1_gfree",
+		mux_u_aondma_axi2mux1_gfree_p,
+		ARRAY_SIZE(mux_u_aondma_axi2mux1_gfree_p),
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_AON_DMA_CLK_CTRL,
+		20,
+		1,
+		0,
+	},
+
+	{
+		EIC7700_MUX_U_RMII_REF_2MUX,
+		"mux_u_rmii_ref_2mux1",
+		mux_u_rmii_ref_2mux1_p,
+		ARRAY_SIZE(mux_u_rmii_ref_2mux1_p),
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_ETH0_CTRL,
+		2,
+		1,
+		0,
+	},
+
+	{
+		EIC7700_MUX_U_ETH_CORE_2MUX1,
+		"mux_u_eth_core_2mux1",
+		mux_u_eth_core_2mux1_p,
+		ARRAY_SIZE(mux_u_eth_core_2mux1_p),
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_ETH0_CTRL,
+		1,
+		1,
+		0,
+	},
+
+	{
+		EIC7700_MUX_U_SATA_PHY_2MUX1,
+		"mux_u_sata_phy_2mux1",
+		mux_u_sata_phy_2mux1_p,
+		ARRAY_SIZE(mux_u_sata_phy_2mux1_p),
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_SATA_OOB_CTRL,
+		9,
+		1,
+		0,
+	},
+};
+
+/*
+ * The hardware decides value 0, 1 and 2 both means 2 divsor, so we add these tables.
+ * When using these tables, the clock framework will use the last member
+ * being 0 as a marker to indicate the end of the table,
+ * So an additional member is required.
+ */
+static struct clk_div_table u_3_bit_special_div_table[8 + 1];
+static struct clk_div_table u_4_bit_special_div_table[16 + 1];
+static struct clk_div_table u_6_bit_special_div_table[64 + 1];
+static struct clk_div_table u_7_bit_special_div_table[128 + 1];
+static struct clk_div_table u_8_bit_special_div_table[256 + 1];
+static struct clk_div_table u_11_bit_special_div_table[2048 + 1];
+static struct clk_div_table u_16_bit_special_div_table[65536 + 1];
+
+static struct eswin_divider_clock eic7700_div_clks[] = {
+	{ EIC7700_DIVDER_U_SYS_CFG_DIV_DYNM, "divder_u_sys_cfg_div_dynm",
+	  "fixed_rate_clk_spll0_fout3", 0, EIC7700_REG_OFFSET_SYSCFG_CLK_CTRL,
+	  4, 3, CLK_DIVIDER_ROUND_CLOSEST, u_3_bit_special_div_table },
+
+	{ EIC7700_DIVDER_U_NOC_NSP_DIV_DYNM, "divder_u_noc_nsp_div_dynm",
+	  "fixed_rate_clk_spll2_fout1", 0, EIC7700_REG_OFFSET_NOC_CLK_CTRL, 0,
+	  3, CLK_DIVIDER_ROUND_CLOSEST, u_3_bit_special_div_table },
+
+	{ EIC7700_DIVDER_U_BOOTSPI_DIV_DYNM, "divder_u_bootspi_div_dynm",
+	  "gate_clk_spll0_fout2", 0, EIC7700_REG_OFFSET_BOOTSPI_CLK_CTRL, 4, 6,
+	  CLK_DIVIDER_ROUND_CLOSEST, u_6_bit_special_div_table },
+
+	{ EIC7700_DIVDER_U_SCPU_CORE_DIV_DYNM, "divder_u_scpu_core_div_dynm",
+	  "fixed_rate_clk_spll0_fout1", 0, EIC7700_REG_OFFSET_SCPU_CORECLK_CTRL,
+	  4, 4, CLK_DIVIDER_ROUND_CLOSEST, u_4_bit_special_div_table },
+
+	{ EIC7700_DIVDER_U_LPCPU_CORE_DIV_DYNM, "divder_u_lpcpu_core_div_dynm",
+	  "fixed_rate_clk_spll0_fout1", 0,
+	  EIC7700_REG_OFFSET_LPCPU_CORECLK_CTRL, 4, 4,
+	  CLK_DIVIDER_ROUND_CLOSEST, u_4_bit_special_div_table },
+
+	{ EIC7700_DIVDER_U_GPU_ACLK_DIV_DYNM, "divder_u_gpu_aclk_div_dynm",
+	  "fixed_rate_clk_spll0_fout1", 0, EIC7700_REG_OFFSET_GPU_ACLK_CTRL, 4,
+	  4, CLK_DIVIDER_ROUND_CLOSEST, u_4_bit_special_div_table },
+
+	{ EIC7700_DIVDER_U_DSP_ACLK_DIV_DYNM, "divder_u_dsp_aclk_div_dynm",
+	  "clk_clk_dsp_root", 0, EIC7700_REG_OFFSET_DSP_ACLK_CTRL, 4, 4,
+	  CLK_DIVIDER_ROUND_CLOSEST, u_4_bit_special_div_table },
+
+	{ EIC7700_DIVDER_U_D2D_ACLK_DIV_DYNM, "divder_u_d2d_aclk_div_dynm",
+	  "mux_u_d2d_aclk_root_2mux1_gfree", 0,
+	  EIC7700_REG_OFFSET_D2D_ACLK_CTRL, 4, 4, CLK_DIVIDER_ROUND_CLOSEST,
+	  u_4_bit_special_div_table },
+
+	{ EIC7700_DIVDER_U_DDR_ACLK_DIV_DYNM, "divder_u_ddr_aclk_div_dynm",
+	  "mux_u_ddr_aclk_root_2mux1_gfree", 0, EIC7700_REG_OFFSET_DDR_CLK_CTRL,
+	  20, 4, CLK_DIVIDER_ROUND_CLOSEST, u_4_bit_special_div_table },
+
+	{ EIC7700_DIVDER_U_HSP_ACLK_DIV_DYNM, "divder_u_hsp_aclk_div_dynm",
+	  "fixed_rate_clk_spll0_fout1", 0, EIC7700_REG_OFFSET_HSP_ACLK_CTRL, 4,
+	  4, CLK_DIVIDER_ROUND_CLOSEST, u_4_bit_special_div_table },
+
+	{ EIC7700_DIVDER_U_ETH_TXCLK_DIV_DYNM_0,
+	  "divder_u_eth_txclk_div_dynm_0", "mux_u_eth_core_2mux1", 0,
+	  EIC7700_REG_OFFSET_ETH0_CTRL, 4, 7, CLK_DIVIDER_ROUND_CLOSEST,
+	  u_7_bit_special_div_table },
+
+	{ EIC7700_DIVDER_U_ETH_TXCLK_DIV_DYNM_1,
+	  "divder_u_eth_txclk_div_dynm_1", "mux_u_eth_core_2mux1", 0,
+	  EIC7700_REG_OFFSET_ETH1_CTRL, 4, 7, CLK_DIVIDER_ROUND_CLOSEST,
+	  u_7_bit_special_div_table },
+
+	{ EIC7700_DIVDER_U_MSHC_CORE_DIV_DYNM_0,
+	  "divder_u_mshc_core_div_dynm_0", "mux_u_mshcore_root_3mux1_0", 0,
+	  EIC7700_REG_OFFSET_MSHC0_CORECLK_CTRL, 4, 12, CLK_DIVIDER_ONE_BASED },
+
+	{ EIC7700_DIVDER_U_MSHC_CORE_DIV_DYNM_1,
+	  "divder_u_mshc_core_div_dynm_1", "mux_u_mshcore_root_3mux1_1", 0,
+	  EIC7700_REG_OFFSET_MSHC1_CORECLK_CTRL, 4, 12, CLK_DIVIDER_ONE_BASED },
+
+	{ EIC7700_DIVDER_U_MSHC_CORE_DIV_DYNM_2,
+	  "divder_u_mshc_core_div_dynm_2", "mux_u_mshcore_root_3mux1_2", 0,
+	  EIC7700_REG_OFFSET_MSHC2_CORECLK_CTRL, 4, 12, CLK_DIVIDER_ONE_BASED },
+
+	{ EIC7700_DIVDER_U_PCIE_ACLK_DIV_DYNM, "divder_u_pcie_aclk_div_dynm",
+	  "fixed_rate_clk_spll2_fout2", 0, EIC7700_REG_OFFSET_PCIE_ACLK_CTRL, 4,
+	  4, CLK_DIVIDER_ROUND_CLOSEST, u_4_bit_special_div_table },
+
+	{ EIC7700_DIVDER_U_NPU_ACLK_DIV_DYNM, "divder_u_npu_aclk_div_dynm",
+	  "fixed_rate_clk_spll0_fout1", 0, EIC7700_REG_OFFSET_NPU_ACLK_CTRL, 4,
+	  4, CLK_DIVIDER_ROUND_CLOSEST, u_4_bit_special_div_table },
+
+	{ EIC7700_DIVDER_U_NPU_LLC_SRC0_DIV_DYNM,
+	  "divder_u_npu_llc_src0_div_dynm", "fixed_rate_clk_spll0_fout1", 0,
+	  EIC7700_REG_OFFSET_NPU_LLC_CTRL, 4, 4, CLK_DIVIDER_ROUND_CLOSEST,
+	  u_4_bit_special_div_table },
+
+	{ EIC7700_DIVDER_U_NPU_LLC_SRC1_DIV_DYNM,
+	  "divder_u_npu_llc_src1_div_dynm", "fixed_rate_clk_spll2_fout1", 0,
+	  EIC7700_REG_OFFSET_NPU_LLC_CTRL, 8, 4, CLK_DIVIDER_ROUND_CLOSEST,
+	  u_4_bit_special_div_table },
+
+	{ EIC7700_DIVDER_U_NPU_CORECLK_DIV_DYNM,
+	  "divder_u_npu_coreclk_div_dynm", "mux_u_npu_core_3mux1_gfree", 0,
+	  EIC7700_REG_OFFSET_NPU_CORE_CTRL, 4, 4, CLK_DIVIDER_ONE_BASED },
+
+	{ EIC7700_DIVDER_U_NPU_E31_DIV_DYNM, "divder_u_npu_e31_div_dynm",
+	  "mux_u_npu_e31_3mux1_gfree", 0, EIC7700_REG_OFFSET_NPU_CORE_CTRL, 12,
+	  4, CLK_DIVIDER_ONE_BASED },
+
+	{ EIC7700_DIVDER_U_VI_ACLK_DIV_DYNM, "divder_u_vi_aclk_div_dynm",
+	  "mux_u_vi_aclk_root_2mux1_gfree", 0, EIC7700_REG_OFFSET_VI_ACLK_CTRL,
+	  4, 4, CLK_DIVIDER_ROUND_CLOSEST, u_4_bit_special_div_table },
+
+	{ EIC7700_DIVDER_U_VI_DW_DIV_DYNM, "divder_u_vi_dw_div_dynm",
+	  "mux_u_vi_dw_root_2mux1", 0, EIC7700_REG_OFFSET_VI_DWCLK_CTRL, 4, 4,
+	  CLK_DIVIDER_ROUND_CLOSEST, u_4_bit_special_div_table },
+
+	{ EIC7700_DIVDER_U_VI_DVP_DIV_DYNM, "divder_u_vi_dvp_div_dynm",
+	  "mux_u_vi_dig_root_2mux1_gfree", 0,
+	  EIC7700_REG_OFFSET_VI_DVP_CLK_CTRL, 4, 4, CLK_DIVIDER_ROUND_CLOSEST,
+	  u_4_bit_special_div_table },
+
+	{ EIC7700_DIVDER_U_VI_DIG_ISP_DIV_DYNM, "divder_u_vi_dig_isp_div_dynm",
+	  "mux_u_vi_dig_isp_root_2mux1_gfree", 0,
+	  EIC7700_REG_OFFSET_VI_DIG_ISP_CLK_CTRL, 4, 4,
+	  CLK_DIVIDER_ROUND_CLOSEST, u_4_bit_special_div_table },
+
+	{ EIC7700_DIVDER_U_VI_SHUTTER_DIV_DYNM_0,
+	  "divder_u_vi_shutter_div_dynm_0", "fixed_rate_clk_vpll_fout2", 0,
+	  EIC7700_REG_OFFSET_VI_SHUTTER0, 4, 7, CLK_DIVIDER_ROUND_CLOSEST,
+	  u_7_bit_special_div_table },
+
+	{ EIC7700_DIVDER_U_VI_SHUTTER_DIV_DYNM_1,
+	  "divder_u_vi_shutter_div_dynm_1", "fixed_rate_clk_vpll_fout2", 0,
+	  EIC7700_REG_OFFSET_VI_SHUTTER1, 4, 7, CLK_DIVIDER_ROUND_CLOSEST,
+	  u_7_bit_special_div_table },
+
+	{ EIC7700_DIVDER_U_VI_SHUTTER_DIV_DYNM_2,
+	  "divder_u_vi_shutter_div_dynm_2", "fixed_rate_clk_vpll_fout2", 0,
+	  EIC7700_REG_OFFSET_VI_SHUTTER2, 4, 7, CLK_DIVIDER_ROUND_CLOSEST,
+	  u_7_bit_special_div_table },
+
+	{ EIC7700_DIVDER_U_VI_SHUTTER_DIV_DYNM_3,
+	  "divder_u_vi_shutter_div_dynm_3", "fixed_rate_clk_vpll_fout2", 0,
+	  EIC7700_REG_OFFSET_VI_SHUTTER3, 4, 7, CLK_DIVIDER_ROUND_CLOSEST,
+	  u_7_bit_special_div_table },
+
+	{ EIC7700_DIVDER_U_VI_SHUTTER_DIV_DYNM_4,
+	  "divder_u_vi_shutter_div_dynm_4", "fixed_rate_clk_vpll_fout2", 0,
+	  EIC7700_REG_OFFSET_VI_SHUTTER4, 4, 7, CLK_DIVIDER_ROUND_CLOSEST,
+	  u_7_bit_special_div_table },
+
+	{ EIC7700_DIVDER_U_VI_SHUTTER_DIV_DYNM_5,
+	  "divder_u_vi_shutter_div_dynm_5", "fixed_rate_clk_vpll_fout2", 0,
+	  EIC7700_REG_OFFSET_VI_SHUTTER5, 4, 7, CLK_DIVIDER_ROUND_CLOSEST,
+	  u_7_bit_special_div_table },
+
+	{ EIC7700_DIVDER_U_VO_ACLK_DIV_DYNM, "divder_u_vo_aclk_div_dynm",
+	  "mux_u_vo_aclk_root_2mux1_gfree", 0, EIC7700_REG_OFFSET_VO_ACLK_CTRL,
+	  4, 4, CLK_DIVIDER_ROUND_CLOSEST, u_4_bit_special_div_table },
+
+	{ EIC7700_DIVDER_U_IESMCLK_DIV_DYNM, "divder_u_iesmclk_div_dynm",
+	  "fixed_rate_clk_spll0_fout3", 0, EIC7700_REG_OFFSET_VO_IESMCLK_CTRL,
+	  4, 4, CLK_DIVIDER_ROUND_CLOSEST, u_4_bit_special_div_table },
+
+	{ EIC7700_DIVDER_U_VO_PIXEL_DIV_DYNM, "divder_u_vo_pixel_div_dynm",
+	  "mux_u_vo_pixel_root_2mux1", 0, EIC7700_REG_OFFSET_VO_PIXEL_CTRL, 4,
+	  6, CLK_DIVIDER_ROUND_CLOSEST, u_6_bit_special_div_table },
+
+	{ EIC7700_DIVDER_U_VO_MCLK_DIV_DYNM, "divder_u_vo_mclk_div_dynm",
+	  "clk_apll_fout1", 0, EIC7700_REG_OFFSET_VO_MCLK_CTRL, 4, 8,
+	  CLK_DIVIDER_ROUND_CLOSEST, u_8_bit_special_div_table },
+
+	{ EIC7700_DIVDER_U_VO_CEC_DIV_DYNM, "divder_u_vo_cec_div_dynm",
+	  "fixed_rate_clk_vpll_fout2", 0, EIC7700_REG_OFFSET_VO_PHY_CLKCTRL, 16,
+	  16, CLK_DIVIDER_ROUND_CLOSEST, u_16_bit_special_div_table },
+
+	{ EIC7700_DIVDER_U_VC_ACLK_DIV_DYNM, "divder_u_vc_aclk_div_dynm",
+	  "mux_u_vcaclk_root_2mux1_gfree", 0, EIC7700_REG_OFFSET_VC_ACLK_CTRL,
+	  4, 4, CLK_DIVIDER_ROUND_CLOSEST, u_4_bit_special_div_table },
+
+	{ EIC7700_DIVDER_U_JD_DIV_DYNM, "divder_u_jd_div_dynm",
+	  "clk_clk_vc_root", 0, EIC7700_REG_OFFSET_JD_CLK_CTRL, 4, 4,
+	  CLK_DIVIDER_ROUND_CLOSEST, u_4_bit_special_div_table },
+
+	{ EIC7700_DIVDER_U_JE_DIV_DYNM, "divder_u_je_div_dynm",
+	  "clk_clk_vc_root", 0, EIC7700_REG_OFFSET_JE_CLK_CTRL, 4, 4,
+	  CLK_DIVIDER_ROUND_CLOSEST, u_4_bit_special_div_table },
+
+	{ EIC7700_DIVDER_U_VE_DIV_DYNM, "divder_u_ve_div_dynm",
+	  "clk_clk_vc_root", 0, EIC7700_REG_OFFSET_VE_CLK_CTRL, 4, 4,
+	  CLK_DIVIDER_ROUND_CLOSEST, u_4_bit_special_div_table },
+
+	{ EIC7700_DIVDER_U_VD_DIV_DYNM, "divder_u_vd_div_dynm",
+	  "clk_clk_vc_root", 0, EIC7700_REG_OFFSET_VD_CLK_CTRL, 4, 4,
+	  CLK_DIVIDER_ROUND_CLOSEST, u_4_bit_special_div_table },
+
+	{ EIC7700_DIVDER_U_G2D_DIV_DYNM, "divder_u_g2d_div_dynm",
+	  "clk_clk_dsp_root", 0, EIC7700_REG_OFFSET_G2D_CTRL, 4, 4,
+	  CLK_DIVIDER_ROUND_CLOSEST, u_4_bit_special_div_table },
+
+	{ EIC7700_DIVDER_U_AONDMA_AXI_DIV_DYNM, "divder_u_aondma_axi_div_dynm",
+	  "fixed_rate_clk_spll0_fout1", 0, EIC7700_REG_OFFSET_AON_DMA_CLK_CTRL,
+	  4, 4, CLK_DIVIDER_ROUND_CLOSEST, u_4_bit_special_div_table },
+
+	{ EIC7700_DIVDER_U_CRYPTO_DIV_DYNM, "divder_u_crypto_div_dynm",
+	  "fixed_rate_clk_spll0_fout1", 0, EIC7700_REG_OFFSET_SPACC_CLK_CTRL, 4,
+	  4, CLK_DIVIDER_ROUND_CLOSEST, u_4_bit_special_div_table },
+
+	{ EIC7700_DIVDER_U_SATA_PHY_REF_DIV_DYNM,
+	  "divder_u_sata_phy_ref_div_dynm", "fixed_rate_clk_spll1_fout2", 0,
+	  EIC7700_REG_OFFSET_SATA_OOB_CTRL, 0, 4, CLK_DIVIDER_ROUND_CLOSEST,
+	  u_4_bit_special_div_table },
+
+	{
+		EIC7700_DIVDER_U_DSP_0_ACLK_DIV_DYNM,
+		"divder_u_dsp_0_aclk_div_dynm",
+		"gate_dspt_aclk",
+		0,
+		EIC7700_REG_OFFSET_DSP_CFG_CTRL,
+		19,
+		1,
+	},
+
+	{
+		EIC7700_DIVDER_U_DSP_1_ACLK_DIV_DYNM,
+		"divder_u_dsp_1_aclk_div_dynm",
+		"gate_dspt_aclk",
+		0,
+		EIC7700_REG_OFFSET_DSP_CFG_CTRL,
+		20,
+		1,
+	},
+
+	{
+		EIC7700_DIVDER_U_DSP_2_ACLK_DIV_DYNM,
+		"divder_u_dsp_2_aclk_div_dynm",
+		"gate_dspt_aclk",
+		0,
+		EIC7700_REG_OFFSET_DSP_CFG_CTRL,
+		21,
+		1,
+	},
+
+	{
+		EIC7700_DIVDER_U_DSP_3_ACLK_DIV_DYNM,
+		"divder_u_dsp_3_aclk_div_dynm",
+		"gate_dspt_aclk",
+		0,
+		EIC7700_REG_OFFSET_DSP_CFG_CTRL,
+		22,
+		1,
+	},
+
+	{ EIC7700_DIVDER_U_AON_RTC_DIV_DYNM, "divder_u_aon_rtc_div_dynm",
+	  "clk_clk_1m", 0, EIC7700_REG_OFFSET_RTC_CLK_CTRL, 21, 11,
+	  CLK_DIVIDER_ROUND_CLOSEST, u_11_bit_special_div_table },
+
+	{ EIC7700_DIVDER_U_U84_RTC_TOGGLE_DIV_DYNM,
+	  "divder_u_u84_rtc_toggle_dynm", "fixed_rate_clk_xtal_24m", 0,
+	  EIC7700_REG_OFFSET_RTC_CLK_CTRL, 16, 5,
+	  CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ROUND_CLOSEST },
+
+};
+
+/*
+ *	these clks should init early to cost down the whole clk module init time
+ */
+
+static struct eswin_clock eic7700_clks_early_0[] = {
+	{
+		EIC7700_CLK_CLK_DSP_ROOT,
+		"clk_clk_dsp_root",
+		"mux_u_dsp_aclk_root_2mux1_gfree",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_CLK_VC_ROOT,
+		"clk_clk_vc_root",
+		"mux_u_vcdec_root_2mux1_gfree",
+		CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct eswin_clock eic7700_clks_early_1[] = {
+	{
+		EIC7700_CLK_CLK_SYS_CFG,
+		"clk_clk_sys_cfg",
+		"mux_u_syscfg_clk_root_2mux1_gfree",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_CLK_D2DDR_ACLK,
+		"clk_clk_d2ddr_aclk",
+		"divder_u_ddr_aclk_div_dynm",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_CLK_AONDMA_AXI_ST3,
+		"clk_clk_aondma_axi_st3",
+		"mux_u_aondma_axi2mux1_gfree",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_CLK_G2D_ST2,
+		"clk_clk_g2d_st2",
+		"divder_u_g2d_div_dynm",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_CLK_MIPI_TXESC,
+		"clk_clk_mipi_txesc",
+		"fixed_factor_u_mipi_txesc_div10",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_CLK_VI_ACLK_ST1,
+		"clk_clk_vi_aclk_st1",
+		"divder_u_vi_aclk_div_dynm",
+		CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct eswin_gate_clock eic7700_gate_clks[] = {
+	{
+		EIC7700_GATE_CLK_CPU_EXT_SRC_CORE_CLK_0,
+		"gate_clk_cpu_ext_src_core_clk_0",
+		"mux_u_cpu_root_3mux1_gfree",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_U84_CLK_CTRL,
+		28,
+		0,
+	},
+
+	{
+		EIC7700_GATE_CLK_CPU_EXT_SRC_CORE_CLK_1,
+		"gate_clk_cpu_ext_src_core_clk_1",
+		"mux_u_cpu_root_3mux1_gfree",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_U84_CLK_CTRL,
+		29,
+		0,
+	},
+
+	{
+		EIC7700_GATE_CLK_CPU_EXT_SRC_CORE_CLK_2,
+		"gate_clk_cpu_ext_src_core_clk_2",
+		"mux_u_cpu_root_3mux1_gfree",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_U84_CLK_CTRL,
+		30,
+		0,
+	},
+
+	{
+		EIC7700_GATE_CLK_CPU_EXT_SRC_CORE_CLK_3,
+		"gate_clk_cpu_ext_src_core_clk_3",
+		"mux_u_cpu_root_3mux1_gfree",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_U84_CLK_CTRL,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_CLK_CPU_TRACE_CLK_0,
+		"gate_clk_cpu_trace_clk_0",
+		"mux_u_cpu_root_3mux1_gfree",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_U84_CLK_CTRL,
+		24,
+		0,
+	},
+
+	{
+		EIC7700_GATE_CLK_CPU_TRACE_CLK_1,
+		"gate_clk_cpu_trace_clk_1",
+		"mux_u_cpu_root_3mux1_gfree",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_U84_CLK_CTRL,
+		25,
+		0,
+	},
+
+	{
+		EIC7700_GATE_CLK_CPU_TRACE_CLK_2,
+		"gate_clk_cpu_trace_clk_2",
+		"mux_u_cpu_root_3mux1_gfree",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_U84_CLK_CTRL,
+		26,
+		0,
+	},
+
+	{
+		EIC7700_GATE_CLK_CPU_TRACE_CLK_3,
+		"gate_clk_cpu_trace_clk_3",
+		"mux_u_cpu_root_3mux1_gfree",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_U84_CLK_CTRL,
+		27,
+		0,
+	},
+
+	{
+		EIC7700_GATE_CLK_CPU_TRACE_COM_CLK,
+		"gate_clk_cpu_trace_com_clk",
+		"mux_u_cpu_aclk_2mux1_gfree",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_U84_CLK_CTRL,
+		23,
+		0,
+	},
+
+	{
+		EIC7700_GATE_CLK_CPU_CLK,
+		"gate_clk_cpu_clk",
+		"mux_u_cpu_aclk_2mux1_gfree",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_U84_CLK_CTRL,
+		28,
+		0,
+	}, /*same as EIC7700_GATE_CLK_CPU_EXT_SRC_CORE_CLK_0 */
+
+	{
+		EIC7700_GATE_CLK_SPLL0_FOUT2,
+		"gate_clk_spll0_fout2",
+		"fixed_rate_clk_spll0_fout2",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_SPLL0_CFG_2,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_NOC_NSP_CLK,
+		"gate_noc_nsp_clk",
+		"divder_u_noc_nsp_div_dynm",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_NOC_CLK_CTRL,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_CLK_BOOTSPI,
+		"gate_clk_bootspi",
+		"mux_u_bootspi_clk_2mux1_gfree",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_BOOTSPI_CLK_CTRL,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_CLK_BOOTSPI_CFG,
+		"gate_clk_bootspi_cfg",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_BOOTSPI_CFGCLK_CTRL,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_CLK_SCPU_CORE,
+		"gate_clk_scpu_core",
+		"mux_u_scpu_core_clk_2mux1_gfree",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_SCPU_CORECLK_CTRL,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_CLK_SCPU_BUS,
+		"gate_clk_scpu_bus",
+		"fixed_factor_u_scpu_bus_div2",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_SCPU_BUSCLK_CTRL,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_CLK_LPCPU_CORE,
+		"gate_clk_lpcpu_core",
+		"mux_u_lpcpu_core_clk_2mux1_gfree",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_LPCPU_CORECLK_CTRL,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_CLK_LPCPU_BUS,
+		"gate_clk_lpcpu_bus",
+		"fixed_factor_u_lpcpu_bus_div2",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_LPCPU_BUSCLK_CTRL,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_GPU_ACLK,
+		"gate_gpu_aclk",
+		"divder_u_gpu_aclk_div_dynm",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_GPU_ACLK_CTRL,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_GPU_GRAY_CLK,
+		"gate_gpu_gray_clk",
+		"fixed_rate_clk_xtal_24m",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_GPU_GRAY_CTRL,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_GPU_CFG_CLK,
+		"gate_gpu_cfg_clk",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_GPU_CFG_CTRL,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_DSPT_ACLK,
+		"gate_dspt_aclk",
+		"divder_u_dsp_aclk_div_dynm",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_DSP_ACLK_CTRL,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_DSPT_CFG_CLK,
+		"gate_dspt_cfg_clk",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_DSP_CFG_CTRL,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_D2D_ACLK,
+		"gate_d2d_aclk",
+		"divder_u_d2d_aclk_div_dynm",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_D2D_ACLK_CTRL,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_D2D_CFG_CLK,
+		"gate_d2d_cfg_clk",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_D2D_CFG_CTRL,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_TCU_ACLK,
+		"gate_tcu_aclk",
+		"clk_clk_d2ddr_aclk",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_TCU_ACLK_CTRL,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_TCU_CFG_CLK,
+		"gate_tcu_cfg_clk",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_TCU_CFG_CTRL,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_DDRT_CFG_CLK,
+		"gate_ddrt_cfg_clk",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_DDR_CLK_CTRL,
+		9,
+		0,
+	},
+
+	{
+		EIC7700_GATE_DDRT0_P0_ACLK,
+		"gate_ddrt0_p0_aclk",
+		"clk_clk_d2ddr_aclk",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_DDR_CLK_CTRL,
+		4,
+		0,
+	},
+
+	{
+		EIC7700_GATE_DDRT0_P1_ACLK,
+		"gate_ddrt0_p1_aclk",
+		"clk_clk_d2ddr_aclk",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_DDR_CLK_CTRL,
+		5,
+		0,
+	},
+
+	{
+		EIC7700_GATE_DDRT0_P2_ACLK,
+		"gate_ddrt0_p2_aclk",
+		"clk_clk_d2ddr_aclk",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_DDR_CLK_CTRL,
+		6,
+		0,
+	},
+
+	{
+		EIC7700_GATE_DDRT0_P3_ACLK,
+		"gate_ddrt0_p3_aclk",
+		"clk_clk_d2ddr_aclk",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_DDR_CLK_CTRL,
+		7,
+		0,
+	},
+
+	{
+		EIC7700_GATE_DDRT0_P4_ACLK,
+		"gate_ddrt0_p4_aclk",
+		"clk_clk_d2ddr_aclk",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_DDR_CLK_CTRL,
+		8,
+		0,
+	},
+
+	{
+		EIC7700_GATE_DDRT1_P0_ACLK,
+		"gate_ddrt1_p0_aclk",
+		"clk_clk_d2ddr_aclk",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_DDR1_CLK_CTRL,
+		4,
+		0,
+	},
+
+	{
+		EIC7700_GATE_DDRT1_P1_ACLK,
+		"gate_ddrt1_p1_aclk",
+		"clk_clk_d2ddr_aclk",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_DDR1_CLK_CTRL,
+		5,
+		0,
+	},
+
+	{
+		EIC7700_GATE_DDRT1_P2_ACLK,
+		"gate_ddrt1_p2_aclk",
+		"clk_clk_d2ddr_aclk",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_DDR1_CLK_CTRL,
+		6,
+		0,
+	},
+
+	{
+		EIC7700_GATE_DDRT1_P3_ACLK,
+		"gate_ddrt1_p3_aclk",
+		"clk_clk_d2ddr_aclk",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_DDR1_CLK_CTRL,
+		7,
+		0,
+	},
+
+	{
+		EIC7700_GATE_DDRT1_P4_ACLK,
+		"gate_ddrt1_p4_aclk",
+		"clk_clk_d2ddr_aclk",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_DDR1_CLK_CTRL,
+		8,
+		0,
+	},
+
+	{
+		EIC7700_GATE_CLK_HSP_ACLK,
+		"gate_clk_hsp_aclk",
+		"divder_u_hsp_aclk_div_dynm",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_HSP_ACLK_CTRL,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_CLK_HSP_CFGCLK,
+		"gate_clk_hsp_cfgclk",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_HSP_CFG_CTRL,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_PCIET_ACLK,
+		"gate_pciet_aclk",
+		"divder_u_pcie_aclk_div_dynm",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_PCIE_ACLK_CTRL,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_PCIET_CFG_CLK,
+		"gate_pciet_cfg_clk",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_PCIE_CFG_CTRL,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_PCIET_CR_CLK,
+		"gate_pciet_cr_clk",
+		"fixed_factor_u_pcie_cr_div2",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_PCIE_CFG_CTRL,
+		0,
+		0,
+	},
+
+	{
+		EIC7700_GATE_PCIET_AUX_CLK,
+		"gate_pciet_aux_clk",
+		"fixed_factor_u_pcie_aux_div4",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_PCIE_CFG_CTRL,
+		1,
+		0,
+	},
+
+	{
+		EIC7700_GATE_NPU_ACLK,
+		"gate_npu_aclk",
+		"divder_u_npu_aclk_div_dynm",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_NPU_ACLK_CTRL,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_NPU_CFG_CLK,
+		"gate_npu_cfg_clk",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_NPU_ACLK_CTRL,
+		30,
+		0,
+	},
+
+	{
+		EIC7700_GATE_NPU_LLC_ACLK,
+		"gate_npu_llc_aclk",
+		"mux_u_npu_llclk_3mux1_gfree",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_NPU_LLC_CTRL,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_NPU_CLK,
+		"gate_npu_clk",
+		"divder_u_npu_coreclk_div_dynm",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_NPU_CORE_CTRL,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_NPU_E31_CLK,
+		"gate_npu_e31_clk",
+		"divder_u_npu_e31_div_dynm",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_NPU_CORE_CTRL,
+		30,
+		0,
+	},
+
+	{
+		EIC7700_GATE_VI_ACLK,
+		"gate_vi_aclk",
+		"clk_clk_vi_aclk_st1",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_VI_ACLK_CTRL,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_VI_CFG_CLK,
+		"gate_vi_cfg_clk",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_VI_ACLK_CTRL,
+		30,
+		0,
+	},
+
+	{
+		EIC7700_GATE_VI_DIG_DW_CLK,
+		"gate_vi_dig_dw_clk",
+		"divder_u_vi_dw_div_dynm",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_VI_DWCLK_CTRL,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_VI_DVP_CLK,
+		"gate_vi_dvp_clk",
+		"divder_u_vi_dvp_div_dynm",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_VI_DVP_CLK_CTRL,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_VI_DIG_ISP_CLK,
+		"gate_vi_dig_isp_clk",
+		"divder_u_vi_dig_isp_div_dynm",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_VI_DIG_ISP_CLK_CTRL,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_VI_SHUTTER_0,
+		"gate_vi_shutter_0",
+		"divder_u_vi_shutter_div_dynm_0",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_VI_SHUTTER0,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_VI_SHUTTER_1,
+		"gate_vi_shutter_1",
+		"divder_u_vi_shutter_div_dynm_1",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_VI_SHUTTER1,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_VI_SHUTTER_2,
+		"gate_vi_shutter_2",
+		"divder_u_vi_shutter_div_dynm_2",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_VI_SHUTTER2,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_VI_SHUTTER_3,
+		"gate_vi_shutter_3",
+		"divder_u_vi_shutter_div_dynm_3",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_VI_SHUTTER3,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_VI_SHUTTER_4,
+		"gate_vi_shutter_4",
+		"divder_u_vi_shutter_div_dynm_4",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_VI_SHUTTER4,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_VI_SHUTTER_5,
+		"gate_vi_shutter_5",
+		"divder_u_vi_shutter_div_dynm_5",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_VI_SHUTTER5,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_VI_PHY_TXCLKESC,
+		"gate_vi_phy_txclkesc",
+		"clk_clk_mipi_txesc",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_VI_PHY_CLKCTRL,
+		0,
+		0,
+	},
+
+	{
+		EIC7700_GATE_VI_PHY_CFG,
+		"gate_vi_phy_cfg",
+		"fixed_rate_clk_xtal_24m",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_VI_PHY_CLKCTRL,
+		1,
+		0,
+	},
+
+	{
+		EIC7700_GATE_VO_ACLK,
+		"gate_vo_aclk",
+		"divder_u_vo_aclk_div_dynm",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_VO_ACLK_CTRL,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_VO_CFG_CLK,
+		"gate_vo_cfg_clk",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_VO_ACLK_CTRL,
+		30,
+		0,
+	},
+
+	{
+		EIC7700_GATE_VO_HDMI_IESMCLK,
+		"gate_vo_hdmi_iesmclk",
+		"divder_u_iesmclk_div_dynm",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_VO_IESMCLK_CTRL,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_VO_PIXEL_CLK,
+		"gate_vo_pixel_clk",
+		"divder_u_vo_pixel_div_dynm",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_VO_PIXEL_CTRL,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_VO_I2S_MCLK,
+		"gate_vo_i2s_mclk",
+		"mux_u_vo_mclk_2mux_ext_mclk",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_VO_MCLK_CTRL,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_VO_CR_CLK,
+		"gate_vo_cr_clk",
+		"clk_clk_mipi_txesc",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_VO_PHY_CLKCTRL,
+		1,
+		0,
+	},
+
+	{
+		EIC7700_GATE_VC_ACLK,
+		"gate_vc_aclk",
+		"divder_u_vc_aclk_div_dynm",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_VC_ACLK_CTRL,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_VC_CFG_CLK,
+		"gate_vc_cfg_clk",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_VC_CLKEN_CTRL,
+		0,
+		0,
+	},
+
+	{
+		EIC7700_GATE_VC_JE_CLK,
+		"gate_vc_je_clk",
+		"divder_u_je_div_dynm",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_JE_CLK_CTRL,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_VC_JD_CLK,
+		"gate_vc_jd_clk",
+		"divder_u_jd_div_dynm",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_JD_CLK_CTRL,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_VC_VE_CLK,
+		"gate_vc_ve_clk",
+		"divder_u_ve_div_dynm",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_VE_CLK_CTRL,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_VC_VD_CLK,
+		"gate_vc_vd_clk",
+		"divder_u_vd_div_dynm",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_VD_CLK_CTRL,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_G2D_CFG_CLK,
+		"gate_g2d_cfg_clk",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_G2D_CTRL,
+		28,
+		0,
+	},
+
+	{
+		EIC7700_GATE_G2D_CLK,
+		"gate_g2d_clk",
+		"clk_clk_g2d_st2",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_G2D_CTRL,
+		30,
+		0,
+	},
+
+	{
+		EIC7700_GATE_G2D_ACLK,
+		"gate_g2d_aclk",
+		"clk_clk_g2d_st2",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_G2D_CTRL,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_CLK_AONDMA_CFG,
+		"gate_clk_aondma_cfg",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_AON_DMA_CLK_CTRL,
+		30,
+		0,
+	},
+
+	{
+		EIC7700_GATE_AONDMA_ACLK,
+		"gate_aondma_aclk",
+		"clk_clk_aondma_axi_st3",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_AON_DMA_CLK_CTRL,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_AON_ACLK,
+		"gate_aon_aclk",
+		"clk_clk_aondma_axi_st3",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_AON_DMA_CLK_CTRL,
+		29,
+		0,
+	},
+
+	{
+		EIC7700_GATE_TIMER_CLK_0,
+		"gate_time_clk_0",
+		"fixed_rate_clk_xtal_24m",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_TIMER_CLK_CTRL,
+		0,
+		0,
+	},
+
+	{
+		EIC7700_GATE_TIMER_CLK_1,
+		"gate_time_clk_1",
+		"fixed_rate_clk_xtal_24m",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_TIMER_CLK_CTRL,
+		1,
+		0,
+	},
+
+	{
+		EIC7700_GATE_TIMER_CLK_2,
+		"gate_time_clk_2",
+		"fixed_rate_clk_xtal_24m",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_TIMER_CLK_CTRL,
+		2,
+		0,
+	},
+
+	{
+		EIC7700_GATE_TIMER_CLK_3,
+		"gate_time_clk_3",
+		"fixed_rate_clk_xtal_24m",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_TIMER_CLK_CTRL,
+		3,
+		0,
+	},
+
+	{
+		EIC7700_GATE_TIMER_PCLK_0,
+		"gate_timer_pclk_0",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_TIMER_CLK_CTRL,
+		4,
+		0,
+	},
+
+	{
+		EIC7700_GATE_TIMER_PCLK_1,
+		"gate_timer_pclk_1",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_TIMER_CLK_CTRL,
+		5,
+		0,
+	},
+
+	{
+		EIC7700_GATE_TIMER_PCLK_2,
+		"gate_timer_pclk_2",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_TIMER_CLK_CTRL,
+		6,
+		0,
+	},
+
+	{
+		EIC7700_GATE_TIMER_PCLK_3,
+		"gate_timer_pclk_3",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_TIMER_CLK_CTRL,
+		7,
+		0,
+	},
+
+	{
+		EIC7700_GATE_TIMER3_CLK8,
+		"gate_timer3_clk8",
+		"fixed_rate_clk_vpll_fout3",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_TIMER_CLK_CTRL,
+		8,
+		0,
+	},
+
+	{
+		EIC7700_GATE_CLK_RTC_CFG,
+		"gate_clk_rtc_cfg",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_RTC_CLK_CTRL,
+		2,
+		0,
+	},
+
+	{
+		EIC7700_GATE_CLK_RTC,
+		"gate_clk_rtc",
+		"divder_u_aon_rtc_div_dynm",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_RTC_CLK_CTRL,
+		1,
+		0,
+	},
+
+	{
+		EIC7700_GATE_CLK_PKA_CFG,
+		"gate_clk_pka_cfg",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_PKA_CLK_CTRL,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_CLK_SPACC_CFG,
+		"gate_clk_spacc_cfg",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_SPACC_CLK_CTRL,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_CLK_CRYPTO,
+		"gate_clk_crypto",
+		"divder_u_crypto_div_dynm",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_SPACC_CLK_CTRL,
+		30,
+		0,
+	},
+
+	{
+		EIC7700_GATE_CLK_TRNG_CFG,
+		"gate_clk_trng_cfg",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_TRNG_CLK_CTRL,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_CLK_OTP_CFG,
+		"gate_clk_otp_cfg",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_OTP_CLK_CTRL,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_CLK_MAILBOX_0,
+		"gate_clk_mailbox_0",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_LSP_CLK_EN1,
+		0,
+		0,
+	},
+
+	{
+		EIC7700_GATE_CLK_MAILBOX_1,
+		"gate_clk_mailbox_1",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_LSP_CLK_EN1,
+		1,
+		0,
+	},
+
+	{
+		EIC7700_GATE_CLK_MAILBOX_2,
+		"gate_clk_mailbox_2",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_LSP_CLK_EN1,
+		2,
+		0,
+	},
+
+	{
+		EIC7700_GATE_CLK_MAILBOX_3,
+		"gate_clk_mailbox_3",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_LSP_CLK_EN1,
+		3,
+		0,
+	},
+
+	{
+		EIC7700_GATE_CLK_MAILBOX_4,
+		"gate_clk_mailbox_4",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_LSP_CLK_EN1,
+		4,
+		0,
+	},
+
+	{
+		EIC7700_GATE_CLK_MAILBOX_5,
+		"gate_clk_mailbox_5",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_LSP_CLK_EN1,
+		5,
+		0,
+	},
+
+	{
+		EIC7700_GATE_CLK_MAILBOX_6,
+		"gate_clk_mailbox_6",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_LSP_CLK_EN1,
+		6,
+		0,
+	},
+
+	{
+		EIC7700_GATE_CLK_MAILBOX_7,
+		"gate_clk_mailbox_7",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_LSP_CLK_EN1,
+		7,
+		0,
+	},
+
+	{
+		EIC7700_GATE_CLK_MAILBOX_8,
+		"gate_clk_mailbox_8",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_LSP_CLK_EN1,
+		8,
+		0,
+	},
+
+	{
+		EIC7700_GATE_CLK_MAILBOX_9,
+		"gate_clk_mailbox_9",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_LSP_CLK_EN1,
+		9,
+		0,
+	},
+
+	{
+		EIC7700_GATE_CLK_MAILBOX_10,
+		"gate_clk_mailbox_10",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_LSP_CLK_EN1,
+		10,
+		0,
+	},
+
+	{
+		EIC7700_GATE_CLK_MAILBOX_11,
+		"gate_clk_mailbox_11",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_LSP_CLK_EN1,
+		11,
+		0,
+	},
+
+	{
+		EIC7700_GATE_CLK_MAILBOX_12,
+		"gate_clk_mailbox_12",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_LSP_CLK_EN1,
+		12,
+		0,
+	},
+
+	{
+		EIC7700_GATE_CLK_MAILBOX_13,
+		"gate_clk_mailbox_13",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_LSP_CLK_EN1,
+		13,
+		0,
+	},
+
+	{
+		EIC7700_GATE_CLK_MAILBOX_14,
+		"gate_clk_mailbox_14",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_LSP_CLK_EN1,
+		14,
+		0,
+	},
+
+	{
+		EIC7700_GATE_CLK_MAILBOX_15,
+		"gate_clk_mailbox_15",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_LSP_CLK_EN1,
+		15,
+		0,
+	},
+
+	{
+		EIC7700_GATE_LSP_I2C0_PCLK,
+		"gate_i2c0_pclk",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_LSP_CLK_EN0,
+		7,
+		0,
+	},
+
+	{
+		EIC7700_GATE_LSP_I2C1_PCLK,
+		"gate_i2c1_pclk",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_LSP_CLK_EN0,
+		8,
+		0,
+	},
+
+	{
+		EIC7700_GATE_LSP_I2C2_PCLK,
+		"gate_i2c2_pclk",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_LSP_CLK_EN0,
+		9,
+		0,
+	},
+
+	{
+		EIC7700_GATE_LSP_I2C3_PCLK,
+		"gate_i2c3_pclk",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_LSP_CLK_EN0,
+		10,
+		0,
+	},
+
+	{
+		EIC7700_GATE_LSP_I2C4_PCLK,
+		"gate_i2c4_pclk",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_LSP_CLK_EN0,
+		11,
+		0,
+	},
+
+	{
+		EIC7700_GATE_LSP_I2C5_PCLK,
+		"gate_i2c5_pclk",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_LSP_CLK_EN0,
+		12,
+		0,
+	},
+
+	{
+		EIC7700_GATE_LSP_I2C6_PCLK,
+		"gate_i2c6_pclk",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_LSP_CLK_EN0,
+		13,
+		0,
+	},
+
+	{
+		EIC7700_GATE_LSP_I2C7_PCLK,
+		"gate_i2c7_pclk",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_LSP_CLK_EN0,
+		14,
+		0,
+	},
+
+	{
+		EIC7700_GATE_LSP_I2C8_PCLK,
+		"gate_i2c8_pclk",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_LSP_CLK_EN0,
+		15,
+		0,
+	},
+
+	{
+		EIC7700_GATE_LSP_I2C9_PCLK,
+		"gate_i2c9_pclk",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_LSP_CLK_EN0,
+		16,
+		0,
+	},
+
+	{
+		EIC7700_GATE_LSP_WDT0_PCLK,
+		"gate_lsp_wdt0_pclk",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_LSP_CLK_EN0,
+		28,
+		0,
+	},
+
+	{
+		EIC7700_GATE_LSP_WDT1_PCLK,
+		"gate_lsp_wdt1_pclk",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_LSP_CLK_EN0,
+		29,
+		0,
+	},
+
+	{
+		EIC7700_GATE_LSP_WDT2_PCLK,
+		"gate_lsp_wdt2_pclk",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_LSP_CLK_EN0,
+		30,
+		0,
+	},
+
+	{
+		EIC7700_GATE_LSP_WDT3_PCLK,
+		"gate_lsp_wdt3_pclk",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_LSP_CLK_EN0,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_LSP_SSI0_PCLK,
+		"gate_lsp_ssi0_pclk",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_LSP_CLK_EN0,
+		26,
+		0,
+	},
+
+	{
+		EIC7700_GATE_LSP_SSI1_PCLK,
+		"gate_lsp_ssi1_pclk",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_LSP_CLK_EN0,
+		27,
+		0,
+	},
+
+	{
+		EIC7700_GATE_LSP_UART0_PCLK,
+		"gate_lsp_uart0_pclk",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_LSP_CLK_EN0,
+		17,
+		0,
+	},
+
+	{
+		EIC7700_GATE_LSP_UART1_PCLK,
+		"gate_lsp_uart1_pclk",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_LSP_CLK_EN0,
+		18,
+		0,
+	},
+
+	{
+		EIC7700_GATE_LSP_UART2_PCLK,
+		"gate_lsp_uart2_pclk",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_LSP_CLK_EN0,
+		19,
+		0,
+	},
+
+	{
+		EIC7700_GATE_LSP_UART3_PCLK,
+		"gate_lsp_uart3_pclk",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_LSP_CLK_EN0,
+		20,
+		0,
+	},
+
+	{
+		EIC7700_GATE_LSP_UART4_PCLK,
+		"gate_lsp_uart4_pclk",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_LSP_CLK_EN0,
+		21,
+		0,
+	},
+
+	{
+		EIC7700_GATE_LSP_TIMER_PCLK,
+		"gate_lsp_timer_pclk",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_LSP_CLK_EN0,
+		25,
+		0,
+	},
+
+	{
+		EIC7700_GATE_LSP_FAN_PCLK,
+		"gate_lsp_fan_pclk",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_LSP_CLK_EN0,
+		0,
+		0,
+	},
+
+	{
+		EIC7700_GATE_LSP_PVT_PCLK,
+		"gate_lsp_pvt_pclk",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_LSP_CLK_EN0,
+		1,
+		0,
+	},
+
+	{
+		EIC7700_GATE_LSP_PVT0_CLK,
+		"gate_pvt0_clk",
+		"fixed_factor_u_pvt_div20",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_LSP_CLK_EN1,
+		16,
+		0,
+	},
+
+	{
+		EIC7700_GATE_LSP_PVT1_CLK,
+		"gate_pvt1_clk",
+		"fixed_factor_u_pvt_div20",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_LSP_CLK_EN1,
+		17,
+		0,
+	},
+
+	{
+		EIC7700_GATE_VC_JE_PCLK,
+		"gate_vc_je_pclk",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_VC_CLKEN_CTRL,
+		2,
+		0,
+	},
+
+	{
+		EIC7700_GATE_VC_JD_PCLK,
+		"gate_vc_jd_pclk",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_VC_CLKEN_CTRL,
+		1,
+		0,
+	},
+
+	{
+		EIC7700_GATE_VC_VE_PCLK,
+		"gate_vc_ve_pclk",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_VC_CLKEN_CTRL,
+		5,
+		0,
+	},
+
+	{
+		EIC7700_GATE_VC_VD_PCLK,
+		"gate_vc_vd_pclk",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_VC_CLKEN_CTRL,
+		4,
+		0,
+	},
+
+	{
+		EIC7700_GATE_VC_MON_PCLK,
+		"gate_vc_mon_pclk",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_VC_CLKEN_CTRL,
+		3,
+		0,
+	},
+
+	{
+		EIC7700_GATE_HSP_MSHC0_CORE_CLK,
+		"gate_hsp_mshc0_core_clk",
+		"divder_u_mshc_core_div_dynm_0",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_MSHC0_CORECLK_CTRL,
+		16,
+		0,
+	},
+
+	{
+		EIC7700_GATE_HSP_MSHC1_CORE_CLK,
+		"gate_hsp_mshc1_core_clk",
+		"divder_u_mshc_core_div_dynm_1",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_MSHC1_CORECLK_CTRL,
+		16,
+		0,
+	},
+
+	{
+		EIC7700_GATE_HSP_MSHC2_CORE_CLK,
+		"gate_hsp_mshc2_core_clk",
+		"divder_u_mshc_core_div_dynm_2",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_MSHC2_CORECLK_CTRL,
+		16,
+		0,
+	},
+
+	{
+		EIC7700_GATE_HSP_SATA_RBC_CLK,
+		"gate_hsp_sata_rbc_clk",
+		"fixed_rate_clk_spll1_fout2",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_SATA_RBC_CTRL,
+		0,
+		0,
+	},
+
+	{
+		EIC7700_GATE_HSP_SATA_OOB_CLK,
+		"gate_hsp_sata_oob_clk",
+		"mux_u_sata_phy_2mux1",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_SATA_OOB_CTRL,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_HSP_DMA0_CLK_TEST,
+		"gate_hsp_dma0_clk_test",
+		"gate_clk_hsp_aclk",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_HSP_ACLK_CTRL,
+		1,
+		0,
+	},
+
+	{
+		EIC7700_GATE_HSP_DMA0_CLK,
+		"gate_hsp_dma0_clk",
+		"gate_clk_hsp_aclk",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_HSP_ACLK_CTRL,
+		0,
+		0,
+	},
+
+	{
+		EIC7700_GATE_HSP_ETH0_CORE_CLK,
+		"gate_hsp_eth0_core_clk",
+		"divder_u_eth_txclk_div_dynm_0",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_ETH0_CTRL,
+		0,
+		0,
+	},
+
+	{
+		EIC7700_GATE_HSP_ETH1_CORE_CLK,
+		"gate_hsp_eth1_core_clk",
+		"divder_u_eth_txclk_div_dynm_1",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_ETH1_CTRL,
+		0,
+		0,
+	},
+
+	{
+		EIC7700_GATE_HSP_RMII_REF_0,
+		"gate_hsp_rmii_ref_0",
+		"mux_u_rmii_ref_2mux1",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_ETH0_CTRL,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_HSP_RMII_REF_1,
+		"gate_hsp_rmii_ref_1",
+		"mux_u_rmii_ref_2mux1",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_ETH1_CTRL,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_AON_I2C0_PCLK,
+		"gate_aon_i2c0_pclk",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_I2C0_CLK_CTRL,
+		31,
+		0,
+	},
+
+	{
+		EIC7700_GATE_AON_I2C1_PCLK,
+		"gate_aon_i2c1_pclk",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+		EIC7700_REG_OFFSET_I2C1_CLK_CTRL,
+		31,
+		0,
+	},
+};
+
+static struct eswin_clock eic7700_clks[] = {
+	{
+		EIC7700_CLK_CPU_EXT_SRC_CORE_CLK_0,
+		"clk_cpu_ext_src_core_clk_0",
+		"gate_clk_cpu_ext_src_core_clk_0",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_CPU_EXT_SRC_CORE_CLK_1,
+		"clk_cpu_ext_src_core_clk_1",
+		"gate_clk_cpu_ext_src_core_clk_1",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_CPU_EXT_SRC_CORE_CLK_2,
+		"clk_cpu_ext_src_core_clk_2",
+		"gate_clk_cpu_ext_src_core_clk_2",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_CPU_EXT_SRC_CORE_CLK_3,
+		"clk_cpu_ext_src_core_clk_3",
+		"gate_clk_cpu_ext_src_core_clk_3",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_CPU_TRACE_CLK_0,
+		"clk_cpu_trace_clk_0",
+		"gate_clk_cpu_trace_clk_0",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_CPU_TRACE_CLK_1,
+		"clk_cpu_trace_clk_1",
+		"gate_clk_cpu_trace_clk_1",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_CPU_TRACE_CLK_2,
+		"clk_cpu_trace_clk_2",
+		"gate_clk_cpu_trace_clk_2",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_CPU_TRACE_CLK_3,
+		"clk_cpu_trace_clk_3",
+		"gate_clk_cpu_trace_clk_3",
+		CLK_SET_RATE_PARENT,
+	},
+
+	{
+		EIC7700_CLK_CPU_TRACE_COM_CLK,
+		"clk_cpu_trace_com_clk",
+		"gate_clk_cpu_trace_com_clk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_CPU_CLK,
+		"clk_cpu_clk",
+		"gate_clk_cpu_clk",
+		CLK_SET_RATE_PARENT,
+	},
+
+	{
+		EIC7700_CLK_CLK_1M,
+		"clk_clk_1m",
+		"fixed_factor_u_clk_1m_div24",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_NOC_CFG_CLK,
+		"clk_noc_cfg_clk",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_NOC_NSP_CLK,
+		"clk_noc_nsp_clk",
+		"gate_noc_nsp_clk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_CLK_BOOTSPI,
+		"clk_clk_bootspi",
+		"gate_clk_bootspi",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_CLK_BOOTSPI_CFG,
+		"clk_clk_bootspi_cfg",
+		"gate_clk_bootspi_cfg",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_CLK_U84_CORE_LP,
+		"clk_clk_u84_core_lp",
+		"fixed_factor_u_u84_core_lp_div2",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_CLK_SCPU_CORE,
+		"clk_clk_scpu_core",
+		"gate_clk_scpu_core",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_CLK_SCPU_BUS,
+		"clk_clk_scpu_bus",
+		"gate_clk_scpu_bus",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_CLK_LPCPU_CORE,
+		"clk_clk_lpcpu_core",
+		"gate_clk_lpcpu_core",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_CLK_LPCPU_BUS,
+		"clk_clk_lpcpu_bus",
+		"gate_clk_lpcpu_bus",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_GPU_ACLK,
+		"clk_gpu_aclk",
+		"gate_gpu_aclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_GPU_GRAY_CLK,
+		"clk_gpu_gray_clk",
+		"gate_gpu_gray_clk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_GPU_CFG_CLK,
+		"clk_gpu_cfg_clk",
+		"gate_gpu_cfg_clk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_DSPT_ACLK,
+		"clk_dspt_aclk",
+		"gate_dspt_aclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_DSPT_CFG_CLK,
+		"clk_dspt_cfg_clk",
+		"gate_dspt_cfg_clk",
+		CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
+	},
+	{
+		EIC7700_CLK_D2D_ACLK,
+		"clk_d2d_aclk",
+		"gate_d2d_aclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_D2D_CFG_CLK,
+		"clk_d2d_cfg_clk",
+		"gate_d2d_cfg_clk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_TCU_ACLK,
+		"clk_tcu_aclk",
+		"gate_tcu_aclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_TCU_CFG_CLK,
+		"clk_tcu_cfg_clk",
+		"gate_tcu_cfg_clk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_DDRT_CFG_CLK,
+		"clk_ddrt_cfg_clk",
+		"gate_ddrt_cfg_clk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_DDRT0_P0_ACLK,
+		"clk_ddrt0_p0_aclk",
+		"gate_ddrt0_p0_aclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_DDRT0_P1_ACLK,
+		"clk_ddrt0_p1_aclk",
+		"gate_ddrt0_p1_aclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_DDRT0_P2_ACLK,
+		"clk_ddrt0_p2_aclk",
+		"gate_ddrt0_p2_aclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_DDRT0_P3_ACLK,
+		"clk_ddrt0_p3_aclk",
+		"gate_ddrt0_p3_aclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_DDRT0_P4_ACLK,
+		"clk_ddrt0_p4_aclk",
+		"gate_ddrt0_p4_aclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_DDRT1_P0_ACLK,
+		"clk_ddrt1_p0_aclk",
+		"gate_ddrt1_p0_aclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_DDRT1_P1_ACLK,
+		"clk_ddrt1_p1_aclk",
+		"gate_ddrt1_p1_aclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_DDRT1_P2_ACLK,
+		"clk_ddrt1_p2_aclk",
+		"gate_ddrt1_p2_aclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_DDRT1_P3_ACLK,
+		"clk_ddrt1_p3_aclk",
+		"gate_ddrt1_p3_aclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_DDRT1_P4_ACLK,
+		"clk_ddrt1_p4_aclk",
+		"gate_ddrt1_p4_aclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_HSP_ACLK,
+		"clk_hsp_aclk",
+		"gate_clk_hsp_aclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_HSP_CFG_CLK,
+		"clk_hsp_cfg_clk",
+		"gate_clk_hsp_cfgclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_HSP_SATA_RBC_CLK,
+		"clk_hsp_sata_rbc_clk",
+		"gate_hsp_sata_rbc_clk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_HSP_SATA_OOB_CLK,
+		"clk_hsp_sata_oob_clk",
+		"gate_hsp_sata_oob_clk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_HSP_SATA_PHY_REF,
+		"clk_hsp_sata_phy_ref",
+		"gate_hsp_sata_oob_clk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_HSP_SATA_PMALIVE_CLK,
+		"clk_hsp_sata_pmalive_clk",
+		"gate_hsp_sata_oob_clk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_HSP_ETH_APP_CLK,
+		"clk_hsp_eth_app_clk",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_HSP_ETH_CSR_CLK,
+		"clk_hsp_eth_csr_clk",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_HSP_ETH0_CORE_CLK,
+		"clk_hsp_eth0_core_clk",
+		"gate_hsp_eth0_core_clk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_HSP_ETH1_CORE_CLK,
+		"clk_hsp_eth1_core_clk",
+		"gate_hsp_eth1_core_clk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_HSP_MSHC0_CORE_CLK,
+		"clk_hsp_mshc0_core_clk",
+		"gate_hsp_mshc0_core_clk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_HSP_MSHC1_CORE_CLK,
+		"clk_hsp_mshc1_core_clk",
+		"gate_hsp_mshc1_core_clk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_HSP_MSHC2_CORE_CLK,
+		"clk_hsp_mshc2_core_clk",
+		"gate_hsp_mshc2_core_clk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_HSP_MSHC0_TMR_CLK,
+		"clk_hsp_mshc0_tmr_clk",
+		"clk_clk_1m",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_HSP_MSHC1_TMR_CLK,
+		"clk_hsp_mshc1_tmr_clk",
+		"clk_clk_1m",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_HSP_MSHC2_TMR_CLK,
+		"clk_hsp_mshc2_tmr_clk",
+		"clk_clk_1m",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_HSP_USB0_SUSPEND_CLK,
+		"clk_hsp_usb0_suspend_clk",
+		"clk_clk_1m",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_HSP_USB1_SUSPEND_CLK,
+		"clk_hsp_usb1_suspend_clk",
+		"clk_clk_1m",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_PCIET_ACLK,
+		"clk_pciet_aclk",
+		"gate_pciet_aclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_PCIET_CFG_CLK,
+		"clk_pciet_cfg_clk",
+		"gate_pciet_cfg_clk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_PCIET_CR_CLK,
+		"clk_pciet_cr_clk",
+		"gate_pciet_cr_clk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_PCIET_AUX_CLK,
+		"clk_pciet_aux_clk",
+		"gate_pciet_aux_clk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_NPU_ACLK,
+		"clk_npu_aclk",
+		"gate_npu_aclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_NPU_CFG_CLK,
+		"clk_npu_cfg_clk",
+		"gate_npu_cfg_clk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_CLK_NPU_LLC_SRC0,
+		"clk_clk_npu_llc_src0",
+		"divder_u_npu_llc_src0_div_dynm",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_CLK_NPU_LLC_SRC1,
+		"clk_clk_npu_llc_src1",
+		"divder_u_npu_llc_src1_div_dynm",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_NPU_LLC_ACLK,
+		"clk_npu_llc_aclk",
+		"gate_npu_llc_aclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_NPU_CLK,
+		"clk_npu_clk",
+		"gate_npu_clk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_NPU_E31_CLK,
+		"clk_npu_e31_clk",
+		"gate_npu_e31_clk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_VI_ACLK,
+		"clk_vi_aclk",
+		"gate_vi_aclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_VI_DIG_DW_CLK,
+		"clk_vi_dig_dw_clk",
+		"gate_vi_dig_dw_clk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_VI_CFG_CLK,
+		"clk_vi_cfg_clk",
+		"gate_vi_cfg_clk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_VI_DVP_CLK,
+		"clk_vi_dvp_clk",
+		"gate_vi_dvp_clk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_VI_DIG_ISP_CLK,
+		"clk_vi_dig_isp_clk",
+		"gate_vi_dig_isp_clk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_VI_SHUTTER_0,
+		"clk_vi_shutter_0",
+		"gate_vi_shutter_0",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_VI_SHUTTER_1,
+		"clk_vi_shutter_1",
+		"gate_vi_shutter_1",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_VI_SHUTTER_2,
+		"clk_vi_shutter_2",
+		"gate_vi_shutter_2",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_VI_SHUTTER_3,
+		"clk_vi_shutter_3",
+		"gate_vi_shutter_3",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_VI_SHUTTER_4,
+		"clk_vi_shutter_4",
+		"gate_vi_shutter_4",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_VI_SHUTTER_5,
+		"clk_vi_shutter_5",
+		"gate_vi_shutter_5",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_VI_PHY_TXCLKESC,
+		"clk_vi_phy_txclkesc",
+		"gate_vi_phy_txclkesc",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_VI_PHY_CFG,
+		"clk_vi_phy_cfg",
+		"gate_vi_phy_cfg",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_VO_ACLK,
+		"clk_vo_aclk",
+		"gate_vo_aclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_VO_CFG_CLK,
+		"clk_vo_cfg_clk",
+		"gate_vo_cfg_clk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_VO_HDMI_IESMCLK,
+		"clk_vo_hdmi_iesmclk",
+		"gate_vo_hdmi_iesmclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_VO_PIXEL_CLK,
+		"clk_vo_pixel_clk",
+		"gate_vo_pixel_clk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_VO_I2S_MCLK,
+		"clk_vo_i2s_mclk",
+		"gate_vo_i2s_mclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_VO_CR_CLK,
+		"clk_vo_cr_clk",
+		"gate_vo_cr_clk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_VO_CEC_CLK,
+		"clk_vo_cec_clk",
+		"divder_u_vo_cec_div_dynm",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_VC_ACLK,
+		"clk_vc_aclk",
+		"gate_vc_aclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_VC_CFG_CLK,
+		"clk_vc_cfg_clk",
+		"gate_vc_cfg_clk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_VC_JE_CLK,
+		"clk_vc_je_clk",
+		"gate_vc_je_clk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_VC_JD_CLK,
+		"clk_vc_jd_clk",
+		"gate_vc_jd_clk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_VC_VE_CLK,
+		"clk_vc_ve_clk",
+		"gate_vc_ve_clk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_VC_VD_CLK,
+		"clk_vc_vd_clk",
+		"gate_vc_vd_clk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_G2D_CFG_CLK,
+		"clk_g2d_cfg_clk",
+		"gate_g2d_cfg_clk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_G2D_CLK,
+		"clk_g2d_clk",
+		"gate_g2d_clk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_G2D_ACLK,
+		"clk_g2d_aclk",
+		"gate_g2d_aclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_AONDMA_CFG,
+		"clk_aondma_cfg",
+		"gate_clk_aondma_cfg",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_AONDMA_ACLK,
+		"clk_aondma_aclk",
+		"gate_aondma_aclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_AON_ACLK,
+		"clk_aon_aclk",
+		"gate_aon_aclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_TIMER_CLK_0,
+		"clk_timer_clk_0",
+		"gate_time_clk_0",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_TIMER_CLK_1,
+		"clk_timer_clk_1",
+		"gate_time_clk_1",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_TIMER_CLK_2,
+		"clk_timer_clk_2",
+		"gate_time_clk_2",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_TIMER_CLK_3,
+		"clk_timer_clk_3",
+		"gate_time_clk_3",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_TIMER_PCLK_0,
+		"clk_timer_pclk_0",
+		"gate_timer_pclk_0",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_TIMER_PCLK_1,
+		"clk_timer_pclk_1",
+		"gate_timer_pclk_1",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_TIMER_PCLK_2,
+		"clk_timer_pclk_2",
+		"gate_timer_pclk_2",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_TIMER_PCLK_3,
+		"clk_timer_pclk_3",
+		"gate_timer_pclk_3",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_TIMER3_CLK8,
+		"clk_timer3_clk8",
+		"gate_timer3_clk8",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_CLK_RTC_CFG,
+		"clk_clk_rtc_cfg",
+		"gate_clk_rtc_cfg",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_CLK_RTC,
+		"clk_clk_rtc",
+		"gate_clk_rtc",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_CLK_PKA_CFG,
+		"clk_clk_pka_cfg",
+		"gate_clk_pka_cfg",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_CLK_SPACC_CFG,
+		"clk_clk_spacc_cfg",
+		"gate_clk_spacc_cfg",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_CLK_CRYPTO,
+		"clk_clk_crypto",
+		"gate_clk_crypto",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_CLK_TRNG_CFG,
+		"clk_clk_trng_cfg",
+		"gate_clk_trng_cfg",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_CLK_OTP_CFG,
+		"clk_clk_otp_cfg",
+		"gate_clk_otp_cfg",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_CLMM_CFG_CLK,
+		"clk_clmm_cfg_clk",
+		"clk_clk_sys_cfg",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_CLMM_DEB_CLK,
+		"clk_clmm_deb_clk",
+		"clk_clk_1m",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_MAILBOX_0,
+		"clk_mailbox0",
+		"gate_clk_mailbox_0",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_MAILBOX_1,
+		"clk_mailbox1",
+		"gate_clk_mailbox_1",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_MAILBOX_2,
+		"clk_mailbox2",
+		"gate_clk_mailbox_2",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_MAILBOX_3,
+		"clk_mailbox3",
+		"gate_clk_mailbox_3",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_MAILBOX_4,
+		"clk_mailbox4",
+		"gate_clk_mailbox_4",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_MAILBOX_5,
+		"clk_mailbox5",
+		"gate_clk_mailbox_5",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_MAILBOX_6,
+		"clk_mailbox6",
+		"gate_clk_mailbox_6",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_MAILBOX_7,
+		"clk_mailbox7",
+		"gate_clk_mailbox_7",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_MAILBOX_8,
+		"clk_mailbox8",
+		"gate_clk_mailbox_8",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_MAILBOX_9,
+		"clk_mailbox9",
+		"gate_clk_mailbox_9",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_MAILBOX_10,
+		"clk_mailbox10",
+		"gate_clk_mailbox_10",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_MAILBOX_11,
+		"clk_mailbox11",
+		"gate_clk_mailbox_11",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_MAILBOX_12,
+		"clk_mailbox12",
+		"gate_clk_mailbox_12",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_MAILBOX_13,
+		"clk_mailbox13",
+		"gate_clk_mailbox_13",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_MAILBOX_14,
+		"clk_mailbox14",
+		"gate_clk_mailbox_14",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_MAILBOX_15,
+		"clk_mailbox15",
+		"gate_clk_mailbox_15",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_LSP_I2C0_PCLK,
+		"clk_i2c0_pclk",
+		"gate_i2c0_pclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_LSP_I2C1_PCLK,
+		"clk_i2c1_pclk",
+		"gate_i2c1_pclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_LSP_I2C2_PCLK,
+		"clk_i2c2_pclk",
+		"gate_i2c2_pclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_LSP_I2C3_PCLK,
+		"clk_i2c3_pclk",
+		"gate_i2c3_pclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_LSP_I2C4_PCLK,
+		"clk_i2c4_pclk",
+		"gate_i2c4_pclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_LSP_I2C5_PCLK,
+		"clk_i2c5_pclk",
+		"gate_i2c5_pclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_LSP_I2C6_PCLK,
+		"clk_i2c6_pclk",
+		"gate_i2c6_pclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_LSP_I2C7_PCLK,
+		"clk_i2c7_pclk",
+		"gate_i2c7_pclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_LSP_I2C8_PCLK,
+		"clk_i2c8_pclk",
+		"gate_i2c8_pclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_LSP_I2C9_PCLK,
+		"clk_i2c9_pclk",
+		"gate_i2c9_pclk",
+		CLK_SET_RATE_PARENT,
+	},
+
+	{
+		EIC7700_CLK_LSP_WDT0_PCLK,
+		"clk_lsp_wdt0_pclk",
+		"gate_lsp_wdt0_pclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_LSP_WDT1_PCLK,
+		"clk_lsp_wdt1_pclk",
+		"gate_lsp_wdt1_pclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_LSP_WDT2_PCLK,
+		"clk_lsp_wdt2_pclk",
+		"gate_lsp_wdt2_pclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_LSP_WDT3_PCLK,
+		"clk_lsp_wdt3_pclk",
+		"gate_lsp_wdt3_pclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_LSP_SSI0_PCLK,
+		"clk_lsp_ssi0_pclk",
+		"gate_lsp_ssi0_pclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_LSP_SSI1_PCLK,
+		"clk_lsp_ssi1_pclk",
+		"gate_lsp_ssi1_pclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_LSP_UART0_PCLK,
+		"clk_lsp_uart0_pclk",
+		"gate_lsp_uart0_pclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_LSP_UART1_PCLK,
+		"clk_lsp_uart1_pclk",
+		"gate_lsp_uart1_pclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_LSP_UART2_PCLK,
+		"clk_lsp_uart2_pclk",
+		"gate_lsp_uart2_pclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_LSP_UART3_PCLK,
+		"clk_lsp_uart3_pclk",
+		"gate_lsp_uart3_pclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_LSP_UART4_PCLK,
+		"clk_lsp_uart4_pclk",
+		"gate_lsp_uart4_pclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_LSP_TIMER_PCLK,
+		"clk_lsp_timer_pclk",
+		"gate_lsp_timer_pclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_LSP_FAN_PCLK,
+		"clk_lsp_fan_pclk",
+		"gate_lsp_fan_pclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_LSP_PVT_PCLK,
+		"clk_lsp_pvt_pclk",
+		"gate_lsp_pvt_pclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_PVT_CLK_0,
+		"clk_pvt0_clk",
+		"gate_pvt0_clk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_PVT_CLK_1,
+		"clk_pvt1_clk",
+		"gate_pvt1_clk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_VC_JE_PCLK,
+		"clk_vc_je_pclk",
+		"gate_vc_je_pclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_VC_JD_PCLK,
+		"clk_vc_jd_pclk",
+		"gate_vc_jd_pclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_VC_VE_PCLK,
+		"clk_vc_ve_pclk",
+		"gate_vc_ve_pclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_VC_VD_PCLK,
+		"clk_vc_vd_pclk",
+		"gate_vc_vd_pclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_VC_MON_PCLK,
+		"clk_vc_mon_pclk",
+		"gate_vc_mon_pclk",
+		CLK_SET_RATE_PARENT,
+	},
+
+	{
+		EIC7700_CLK_HSP_DMA0_CLK,
+		"clk_hsp_dma0_clk",
+		"gate_hsp_dma0_clk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_HSP_DMA0_CLK_TEST,
+		"clk_hsp_dma0_clk_TEST",
+		"gate_hsp_dma0_clk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_HSP_RMII_REF_0,
+		"clk_hsp_rmii_ref_0",
+		"gate_hsp_rmii_ref_0",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_HSP_RMII_REF_1,
+		"clk_hsp_rmii_ref_1",
+		"gate_hsp_rmii_ref_1",
+		CLK_SET_RATE_PARENT,
+	},
+
+	{
+		EIC7700_CLK_DSP_ACLK_0,
+		"clk_dsp_aclk_0",
+		"divder_u_dsp_0_aclk_div_dynm",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_DSP_ACLK_1,
+		"clk_dsp_aclk_1",
+		"divder_u_dsp_1_aclk_div_dynm",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_DSP_ACLK_2,
+		"clk_dsp_aclk_2",
+		"divder_u_dsp_2_aclk_div_dynm",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_DSP_ACLK_3,
+		"clk_dsp_aclk_3",
+		"divder_u_dsp_3_aclk_div_dynm",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_CLK_U84_RTC_TOGGLE,
+		"clk_clk_u84_rtc_toggle",
+		"divder_u_u84_rtc_toggle_dynm",
+		CLK_SET_RATE_PARENT,
+	},
+
+	{
+		EIC7700_CLK_AON_I2C0_PCLK,
+		"clk_aon_i2c0_pclk",
+		"gate_aon_i2c0_pclk",
+		CLK_SET_RATE_PARENT,
+	},
+	{
+		EIC7700_CLK_AON_I2C1_PCLK,
+		"clk_aon_i2c1_pclk",
+		"gate_aon_i2c1_pclk",
+		CLK_SET_RATE_PARENT,
+	},
+};
+
+static void special_div_table_init(struct clk_div_table *table, int table_size)
+{
+	int i;
+
+	if (table_size < 3)
+		return;
+
+	if (!table)
+		return;
+
+	/*The hardware decides value 0, 1 and 2 both means 2 divsor*/
+	for (i = 0; i < 3; i++) {
+		table[i].val = i;
+		table[i].div = 2;
+	}
+	for (i = 3; i < table_size - 1; i++) {
+		table[i].val = i;
+		table[i].div = i;
+	}
+	table[table_size - 1].val = 0;
+	table[table_size - 1].div = 0;
+}
+
+static int eswin_cpu_clk_init(struct platform_device *pdev)
+{
+	struct clk *cpu_clk;
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	u32 default_freq;
+	int ret = 0;
+	char name[128] = { 0 };
+
+	ret = of_property_read_u32(np, "cpu-default-frequency", &default_freq);
+	if (ret) {
+		dev_info(dev, "cpu-default-frequency not set\n");
+		return ret;
+	}
+	sprintf(name, "%s", "clk_cpu_ext_src_core_clk_0");
+
+	cpu_clk = __clk_lookup(name);
+	if (!cpu_clk)
+		return dev_err_probe(dev, -EINVAL, "Failed to lookup CPU clock\n");
+
+	ret = clk_set_rate(cpu_clk, default_freq);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to set CPU frequency\n");
+
+	return 0;
+}
+
+static int eswin_clk_probe(struct platform_device *pdev)
+{
+	struct eswin_clock_data *clk_data;
+
+	clk_data = eswin_clk_init(pdev, EIC7700_NR_CLKS);
+	if (!clk_data)
+		return dev_err_probe(&pdev->dev, -EAGAIN, "failed to get clk data!\n");
+
+	special_div_table_init(u_3_bit_special_div_table,
+			       ARRAY_SIZE(u_3_bit_special_div_table));
+	special_div_table_init(u_4_bit_special_div_table,
+			       ARRAY_SIZE(u_4_bit_special_div_table));
+	special_div_table_init(u_6_bit_special_div_table,
+			       ARRAY_SIZE(u_6_bit_special_div_table));
+	special_div_table_init(u_7_bit_special_div_table,
+			       ARRAY_SIZE(u_7_bit_special_div_table));
+	special_div_table_init(u_8_bit_special_div_table,
+			       ARRAY_SIZE(u_8_bit_special_div_table));
+	special_div_table_init(u_11_bit_special_div_table,
+			       ARRAY_SIZE(u_11_bit_special_div_table));
+	special_div_table_init(u_16_bit_special_div_table,
+			       ARRAY_SIZE(u_16_bit_special_div_table));
+
+	eswin_clk_register_fixed_rate(&pdev->dev, eic7700_fixed_rate_clks,
+				      ARRAY_SIZE(eic7700_fixed_rate_clks),
+				      clk_data);
+	eswin_clk_register_pll(eic7700_pll_clks, ARRAY_SIZE(eic7700_pll_clks),
+			       clk_data, &pdev->dev);
+
+	eswin_clk_register_fixed_factor(&pdev->dev, eic7700_fixed_factor_clks,
+					ARRAY_SIZE(eic7700_fixed_factor_clks),
+					clk_data);
+	eswin_clk_register_mux(&pdev->dev, eic7700_mux_clks,
+			       ARRAY_SIZE(eic7700_mux_clks),
+			       clk_data);
+	eswin_clk_register_clk(&pdev->dev, eic7700_clks_early_0,
+			       ARRAY_SIZE(eic7700_clks_early_0), clk_data);
+	eswin_clk_register_divider(&pdev->dev, eic7700_div_clks,
+				   ARRAY_SIZE(eic7700_div_clks), clk_data);
+	eswin_clk_register_clk(&pdev->dev, eic7700_clks_early_1,
+			       ARRAY_SIZE(eic7700_clks_early_1), clk_data);
+	eswin_clk_register_gate(&pdev->dev, eic7700_gate_clks,
+				ARRAY_SIZE(eic7700_gate_clks), clk_data);
+	eswin_clk_register_clk(&pdev->dev, eic7700_clks, ARRAY_SIZE(eic7700_clks),
+			       clk_data);
+
+	eswin_cpu_clk_init(pdev);
+
+	return 0;
+}
+
+static const struct of_device_id eswin_clock_dt_ids[] = {
+	{
+		.compatible = "eswin,eic7700-clock",
+	},
+	{ /* sentinel */ }
+};
+
+static struct platform_driver eswin_clock_driver = {
+	.probe	= eswin_clk_probe,
+	.driver = {
+		.name	= "eswin-clock",
+		.of_match_table	= eswin_clock_dt_ids,
+	},
+};
+module_platform_driver(eswin_clock_driver);
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Yifeng Huang <huangyifeng@eswincomputing.com>");
+MODULE_AUTHOR("Xuyang Dong <dongxuyang@eswincomputing.com>");
diff --git a/drivers/clk/eswin/clk-eic7700.h b/drivers/clk/eswin/clk-eic7700.h
new file mode 100644
index 000000000000..6f680f83f48d
--- /dev/null
+++ b/drivers/clk/eswin/clk-eic7700.h
@@ -0,0 +1,194 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2025, Beijing ESWIN Computing Technology Co., Ltd.. All rights reserved.
+ *
+ * Authors:
+ *	Yifeng Huang <huangyifeng@eswincomputing.com>
+ *	Xuyang Dong <dongxuyang@eswincomputing.com>
+ */
+
+#ifndef __CLK_EIC7700_H__
+#define __CLK_EIC7700_H__
+
+/*REG OFFSET OF SYS-CRG*/
+#define EIC7700_REG_OFFSET_SPLL0_CFG_0 0X0000
+#define EIC7700_REG_OFFSET_SPLL0_CFG_1 0X0004
+#define EIC7700_REG_OFFSET_SPLL0_CFG_2 0X0008
+#define EIC7700_REG_OFFSET_SPLL0_DSKEWCAL 0X000C
+#define EIC7700_REG_OFFSET_SPLL0_SSC 0X0010
+#define EIC7700_REG_OFFSET_SPLL1_CFG_0 0X0014
+#define EIC7700_REG_OFFSET_SPLL1_CFG_1 0X0018
+#define EIC7700_REG_OFFSET_SPLL1_CFG_2 0X001C
+#define EIC7700_REG_OFFSET_SPLL1_DSKEWCAL 0X0020
+#define EIC7700_REG_OFFSET_SPLL1_SSC 0X0024
+#define EIC7700_REG_OFFSET_SPLL2_CFG_0 0X0028
+#define EIC7700_REG_OFFSET_SPLL2_CFG_1 0X002C
+#define EIC7700_REG_OFFSET_SPLL2_CFG_2 0X0030
+#define EIC7700_REG_OFFSET_SPLL2_DSKEWCAL 0X0034
+#define EIC7700_REG_OFFSET_SPLL2_SSC 0X0038
+#define EIC7700_REG_OFFSET_VPLL_CFG_0 0X003C
+#define EIC7700_REG_OFFSET_VPLL_CFG_1 0X0040
+#define EIC7700_REG_OFFSET_VPLL_CFG_2 0X0044
+#define EIC7700_REG_OFFSET_VPLL_DSKEWCAL 0X0048
+#define EIC7700_REG_OFFSET_VPLL_SSC 0X004C
+#define EIC7700_REG_OFFSET_APLL_CFG_0 0X0050
+#define EIC7700_REG_OFFSET_APLL_CFG_1 0X0054
+#define EIC7700_REG_OFFSET_APLL_CFG_2 0X0058
+#define EIC7700_REG_OFFSET_APLL_DSKEWCAL 0X005C
+#define EIC7700_REG_OFFSET_APLL_SSC 0X0060
+#define EIC7700_REG_OFFSET_MCPUT_PLL_CFG_0 0X0064
+#define EIC7700_REG_OFFSET_MCPUT_PLL_CFG_1 0X0068
+#define EIC7700_REG_OFFSET_MCPUT_PLL_CFG_2 0X006C
+#define EIC7700_REG_OFFSET_MCPUT_PLL_DSKEWCAL 0X0070
+#define EIC7700_REG_OFFSET_MCPUT_PLL_SSC 0X0074
+#define EIC7700_REG_OFFSET_DDRT_PLL_CFG_0 0X0078
+#define EIC7700_REG_OFFSET_DDRT_PLL_CFG_1 0X007C
+#define EIC7700_REG_OFFSET_DDRT_PLL_CFG_2 0X0080
+#define EIC7700_REG_OFFSET_DDRT_PLL_DSKEWCAL 0X0084
+#define EIC7700_REG_OFFSET_DDRT_PLL_SSC 0X0088
+#define EIC7700_REG_OFFSET_PLL_STATUS 0X00A4
+#define EIC7700_REG_OFFSET_NOC_CLK_CTRL 0X100
+#define EIC7700_REG_OFFSET_BOOTSPI_CLK_CTRL 0X104
+#define EIC7700_REG_OFFSET_BOOTSPI_CFGCLK_CTRL 0X108
+#define EIC7700_REG_OFFSET_SCPU_CORECLK_CTRL 0X10C
+#define EIC7700_REG_OFFSET_SCPU_BUSCLK_CTRL 0X110
+#define EIC7700_REG_OFFSET_LPCPU_CORECLK_CTRL 0X114
+#define EIC7700_REG_OFFSET_LPCPU_BUSCLK_CTRL 0X118
+#define EIC7700_REG_OFFSET_TCU_ACLK_CTRL 0X11C
+#define EIC7700_REG_OFFSET_TCU_CFG_CTRL 0X120
+#define EIC7700_REG_OFFSET_DDR_CLK_CTRL 0X124
+#define EIC7700_REG_OFFSET_DDR1_CLK_CTRL 0X128
+#define EIC7700_REG_OFFSET_GPU_ACLK_CTRL 0X12C
+#define EIC7700_REG_OFFSET_GPU_CFG_CTRL 0X130
+#define EIC7700_REG_OFFSET_GPU_GRAY_CTRL 0X134
+#define EIC7700_REG_OFFSET_DSP_ACLK_CTRL 0X138
+#define EIC7700_REG_OFFSET_DSP_CFG_CTRL 0X13C
+#define EIC7700_REG_OFFSET_D2D_ACLK_CTRL 0X140
+#define EIC7700_REG_OFFSET_D2D_CFG_CTRL 0X144
+#define EIC7700_REG_OFFSET_HSP_ACLK_CTRL 0X148
+#define EIC7700_REG_OFFSET_HSP_CFG_CTRL 0X14C
+#define EIC7700_REG_OFFSET_SATA_RBC_CTRL 0X150
+#define EIC7700_REG_OFFSET_SATA_OOB_CTRL 0X154
+#define EIC7700_REG_OFFSET_ETH0_CTRL 0X158
+#define EIC7700_REG_OFFSET_ETH1_CTRL 0X15C
+#define EIC7700_REG_OFFSET_MSHC0_CORECLK_CTRL 0X160
+#define EIC7700_REG_OFFSET_MSHC1_CORECLK_CTRL 0X164
+#define EIC7700_REG_OFFSET_MSHC2_CORECLK_CTRL 0X168
+#define EIC7700_REG_OFFSET_MSHC_USB_SLWCLK 0X16C
+#define EIC7700_REG_OFFSET_PCIE_ACLK_CTRL 0X170
+#define EIC7700_REG_OFFSET_PCIE_CFG_CTRL 0X174
+#define EIC7700_REG_OFFSET_NPU_ACLK_CTRL 0X178
+#define EIC7700_REG_OFFSET_NPU_LLC_CTRL 0X17C
+#define EIC7700_REG_OFFSET_NPU_CORE_CTRL 0X180
+#define EIC7700_REG_OFFSET_VI_DWCLK_CTRL 0X184
+#define EIC7700_REG_OFFSET_VI_ACLK_CTRL 0X188
+#define EIC7700_REG_OFFSET_VI_DIG_ISP_CLK_CTRL 0X18C
+#define EIC7700_REG_OFFSET_VI_DVP_CLK_CTRL 0X190
+#define EIC7700_REG_OFFSET_VI_SHUTTER0 0X194
+#define EIC7700_REG_OFFSET_VI_SHUTTER1 0X198
+#define EIC7700_REG_OFFSET_VI_SHUTTER2 0X19C
+#define EIC7700_REG_OFFSET_VI_SHUTTER3 0X1A0
+#define EIC7700_REG_OFFSET_VI_SHUTTER4 0X1A4
+#define EIC7700_REG_OFFSET_VI_SHUTTER5 0X1A8
+#define EIC7700_REG_OFFSET_VI_PHY_CLKCTRL 0X1AC
+#define EIC7700_REG_OFFSET_VO_ACLK_CTRL 0X1B0
+#define EIC7700_REG_OFFSET_VO_IESMCLK_CTRL 0X1B4
+#define EIC7700_REG_OFFSET_VO_PIXEL_CTRL 0X1B8
+#define EIC7700_REG_OFFSET_VO_MCLK_CTRL 0X1BC
+#define EIC7700_REG_OFFSET_VO_PHY_CLKCTRL 0X1C0
+#define EIC7700_REG_OFFSET_VC_ACLK_CTRL 0X1C4
+#define EIC7700_REG_OFFSET_VCDEC_ROOTCLK_CTRL 0X1C8
+#define EIC7700_REG_OFFSET_G2D_CTRL 0X1CC
+#define EIC7700_REG_OFFSET_VC_CLKEN_CTRL 0X1D0
+#define EIC7700_REG_OFFSET_JE_CLK_CTRL 0X1D4
+#define EIC7700_REG_OFFSET_JD_CLK_CTRL 0X1D8
+#define EIC7700_REG_OFFSET_VD_CLK_CTRL 0X1DC
+#define EIC7700_REG_OFFSET_VE_CLK_CTRL 0X1E0
+#define EIC7700_REG_OFFSET_AON_DMA_CLK_CTRL 0X1E4
+#define EIC7700_REG_OFFSET_TIMER_CLK_CTRL 0X1E8
+#define EIC7700_REG_OFFSET_RTC_CLK_CTRL 0X1EC
+#define EIC7700_REG_OFFSET_PKA_CLK_CTRL 0X1F0
+#define EIC7700_REG_OFFSET_SPACC_CLK_CTRL 0X1F4
+#define EIC7700_REG_OFFSET_TRNG_CLK_CTRL 0X1F8
+#define EIC7700_REG_OFFSET_OTP_CLK_CTRL 0X1FC
+#define EIC7700_REG_OFFSET_LSP_CLK_EN0 0X200
+#define EIC7700_REG_OFFSET_LSP_CLK_EN1 0X204
+#define EIC7700_REG_OFFSET_U84_CLK_CTRL 0X208
+#define EIC7700_REG_OFFSET_SYSCFG_CLK_CTRL 0X20C
+#define EIC7700_REG_OFFSET_I2C0_CLK_CTRL 0X210
+#define EIC7700_REG_OFFSET_I2C1_CLK_CTRL 0X214
+#define EIC7700_REG_OFFSET_DFT_CLK_CTRL 0X280
+#define EIC7700_REG_OFFSET_SYS_SWRST_VALUE 0X300
+#define EIC7700_REG_OFFSET_CLR_RST_STATUS 0X304
+#define EIC7700_REG_OFFSET_DIE_STATUS 0X308
+#define EIC7700_REG_OFFSET_CLR_BOOT_INFO 0X30C
+#define EIC7700_REG_OFFSET_SCPU_BOOT_ADDRESS 0X310
+#define EIC7700_REG_OFFSET_LPCPU_BOOT_ADDRESS 0X314
+#define EIC7700_REG_OFFSET_NPUE31_BOOT_ADDRESS 0X318
+#define EIC7700_REG_OFFSET_U84_BOOT_ADDRESS0_HI 0X31C
+#define EIC7700_REG_OFFSET_U84_BOOT_ADDRESS0_LOW 0X320
+#define EIC7700_REG_OFFSET_U84_BOOT_ADDRESS1_HI 0X324
+#define EIC7700_REG_OFFSET_U84_BOOT_ADDRESS1_LOW 0X328
+#define EIC7700_REG_OFFSET_U84_BOOT_ADDRESS2_HI 0X32C
+#define EIC7700_REG_OFFSET_U84_BOOT_ADDRESS2_LOW 0X330
+#define EIC7700_REG_OFFSET_U84_BOOT_ADDRESS3_HI 0X334
+#define EIC7700_REG_OFFSET_U84_BOOT_ADDRESS3_LOW 0X338
+#define EIC7700_REG_OFFSET_BOOT_SEL_STAT 0X33C
+#define EIC7700_REG_OFFSET_BOOT_SPI_CFG 0X340
+#define EIC7700_REG_OFFSET_SNOC_RST_CTRL 0X400
+#define EIC7700_REG_OFFSET_GPU_RST_CTRL 0X404
+#define EIC7700_REG_OFFSET_DSP_RST_CTRL 0X408
+#define EIC7700_REG_OFFSET_D2D_RST_CTRL 0X40C
+#define EIC7700_REG_OFFSET_DDR_RST_CTRL 0X410
+#define EIC7700_REG_OFFSET_TCU_RST_CTRL 0X414
+#define EIC7700_REG_OFFSET_NPU_RST_CTRL 0X418
+#define EIC7700_REG_OFFSET_HSPDMA_RST_CTRL 0X41C
+#define EIC7700_REG_OFFSET_PCIE_RST_CTRL 0X420
+#define EIC7700_REG_OFFSET_I2C_RST_CTRL 0X424
+#define EIC7700_REG_OFFSET_FAN_RST_CTRL 0X428
+#define EIC7700_REG_OFFSET_PVT_RST_CTRL 0X42C
+#define EIC7700_REG_OFFSET_MBOX_RST_CTRL 0X430
+#define EIC7700_REG_OFFSET_UART_RST_CTRL 0X434
+#define EIC7700_REG_OFFSET_GPIO_RST_CTRL 0X438
+#define EIC7700_REG_OFFSET_TIMER_RST_CTRL 0X43C
+#define EIC7700_REG_OFFSET_SSI_RST_CTRL 0X440
+#define EIC7700_REG_OFFSET_WDT_RST_CTRL 0X444
+#define EIC7700_REG_OFFSET_LSP_CFGRST_CTRL 0X448
+#define EIC7700_REG_OFFSET_U84_RST_CTRL 0X44C
+#define EIC7700_REG_OFFSET_SCPU_RST_CTRL 0X450
+#define EIC7700_REG_OFFSET_LPCPU_RST_CTRL 0X454
+#define EIC7700_REG_OFFSET_VC_RST_CTRL 0X458
+#define EIC7700_REG_OFFSET_JD_RST_CTRL 0X45C
+#define EIC7700_REG_OFFSET_JE_RST_CTRL 0X460
+#define EIC7700_REG_OFFSET_VE_RST_CTRL 0X468
+#define EIC7700_REG_OFFSET_G2D_RST_CTRL 0X46C
+#define EIC7700_REG_OFFSET_VI_RST_CTRL 0X470
+#define EIC7700_REG_OFFSET_DVP_RST_CTRL 0X474
+#define EIC7700_REG_OFFSET_ISP0_RST_CTRL 0X478
+#define EIC7700_REG_OFFSET_ISP1_RST_CTRL 0X47C
+#define EIC7700_REG_OFFSET_SHUTTER_RST_CTRL 0X480
+#define EIC7700_REG_OFFSET_VO_PHYRST_CTRL 0X484
+#define EIC7700_REG_OFFSET_VO_I2SRST_CTRL 0X488
+#define EIC7700_REG_OFFSET_VO_RST_CTRL 0X48C
+#define EIC7700_REG_OFFSET_BOOTSPI_RST_CTRL 0X490
+#define EIC7700_REG_OFFSET_I2C1_RST_CTRL 0X494
+#define EIC7700_REG_OFFSET_I2C0_RST_CTRL 0X498
+#define EIC7700_REG_OFFSET_DMA1_RST_CTRL 0X49C
+#define EIC7700_REG_OFFSET_FPRT_RST_CTRL 0X4A0
+#define EIC7700_REG_OFFSET_HBLOCK_RST_CTRL 0X4A4
+#define EIC7700_REG_OFFSET_SECSR_RST_CTRL 0X4A8
+#define EIC7700_REG_OFFSET_OTP_RST_CTRL 0X4AC
+#define EIC7700_REG_OFFSET_PKA_RST_CTRL 0X4B0
+#define EIC7700_REG_OFFSET_SPACC_RST_CTRL 0X4B4
+#define EIC7700_REG_OFFSET_TRNG_RST_CTRL 0X4B8
+#define EIC7700_REG_OFFSET_TIMER0_RST_CTRL 0X4C0
+#define EIC7700_REG_OFFSET_TIMER1_RST_CTRL 0X4C4
+#define EIC7700_REG_OFFSET_TIMER2_RST_CTRL 0X4C8
+#define EIC7700_REG_OFFSET_TIMER3_RST_CTRL 0X4CC
+#define EIC7700_REG_OFFSET_RTC_RST_CTRL 0X4D0
+#define EIC7700_REG_OFFSET_MNOC_RST_CTRL 0X4D4
+#define EIC7700_REG_OFFSET_RNOC_RST_CTRL 0X4D8
+#define EIC7700_REG_OFFSET_CNOC_RST_CTRL 0X4DC
+#define EIC7700_REG_OFFSET_LNOC_RST_CTRL 0X4E0
+
+#endif /* __CLK_EIC7700_H__ */
diff --git a/drivers/clk/eswin/clk.c b/drivers/clk/eswin/clk.c
new file mode 100644
index 000000000000..3999f100f8c4
--- /dev/null
+++ b/drivers/clk/eswin/clk.c
@@ -0,0 +1,972 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025, Beijing ESWIN Computing Technology Co., Ltd.. All rights reserved.
+ *
+ * Authors:
+ *	Yifeng Huang <huangyifeng@eswincomputing.com>
+ *	Xuyang Dong <dongxuyang@eswincomputing.com>
+ */
+
+#include "clk.h"
+#include <dt-bindings/clock/eswin,eic7700-clock.h>
+#include <linux/clk.h>
+#include <linux/clkdev.h>
+#include <linux/clk-provider.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/slab.h>
+#include <linux/util_macros.h>
+
+static struct clk_hw *eswin_clk_find_parent(struct eswin_clock_data *data,
+					    char *parent_name)
+{
+	int i;
+	struct clk *clks;
+
+	for (i = 0; i < data->clk_data.clk_num; i++) {
+		clks = data->clk_data.clks[i];
+		if (!clks)
+			continue;
+
+		if (!strcmp(__clk_get_name(clks), parent_name))
+			return __clk_get_hw(clks);
+	}
+	return NULL;
+}
+
+struct eswin_clock_data *eswin_clk_init(struct platform_device *pdev,
+					int nr_clks)
+{
+	struct eswin_clock_data *clk_data;
+	struct clk **clk_table;
+	void __iomem *base;
+	struct device *dev;
+
+	dev = &pdev->dev;
+	base = of_iomap(dev->of_node, 0);
+	if (!base) {
+		dev_err(dev, "failed to map clock registers\n");
+		goto err;
+	}
+	clk_data = kzalloc(sizeof(*clk_data), GFP_KERNEL);
+	if (!clk_data)
+		goto err;
+
+	clk_data->base = base;
+	clk_table = kcalloc(nr_clks, sizeof(*clk_table), GFP_KERNEL);
+	if (!clk_table)
+		goto err_data;
+
+	clk_data->clk_data.clks = clk_table;
+	clk_data->clk_data.clk_num = nr_clks;
+	spin_lock_init(&clk_data->lock);
+
+	of_clk_add_provider(pdev->dev.of_node, of_clk_src_onecell_get,
+			    &clk_data->clk_data);
+	return clk_data;
+
+err_data:
+	kfree(clk_data);
+err:
+	return NULL;
+}
+
+int eswin_clk_register_fixed_rate(struct device *dev,
+				  const struct eswin_fixed_rate_clock *clks,
+				  int nums, struct eswin_clock_data *data)
+{
+	struct clk *clk;
+	int i;
+
+	for (i = 0; i < nums; i++) {
+		char *name = kzalloc(strlen(clks[i].name) + 2 * sizeof(char) +
+					     sizeof(int),
+				     GFP_KERNEL);
+		sprintf(name, "%s", clks[i].name);
+
+		clk = clk_register_fixed_rate(NULL, name, clks[i].parent_name,
+					      clks[i].flags,
+					      clks[i].fixed_rate);
+		if (IS_ERR(clk)) {
+			kfree(name);
+			while (i--)
+				clk_unregister_fixed_rate(data->clk_data.clks[clks[i].id]);
+			return dev_err_probe(dev, IS_ERR(clk), "failed to register clock\n");
+		}
+		data->clk_data.clks[clks[i].id] = clk;
+		kfree(name);
+	}
+
+	return 0;
+}
+
+static int eswin_clk_set_cpu_volatge(struct gpio_desc *cpu_voltage_gpio,
+				     enum voltage_level target_volatge)
+{
+	if (!cpu_voltage_gpio)
+		return -EINVAL;
+
+	switch (target_volatge) {
+	case VOLTAGE_0_9V:
+		gpiod_set_value(cpu_voltage_gpio, 1);
+		break;
+	case VOLTAGE_0_8V:
+		gpiod_set_value(cpu_voltage_gpio, 0);
+		break;
+	default:
+		pr_err("%s %d: unsupport  volatge %d\n", __func__, __LINE__,
+		       target_volatge);
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static int eswin_calc_pll(u32 *frac_val, u32 *postdiv1_val, u32 *fbdiv_val,
+			  u32 *refdiv_val, u64 rate,
+			  const struct eswin_clk_pll *clk)
+{
+	int ret = 0;
+
+	switch (clk->id) {
+	case EIC7700_APLL_FOUT1:
+		switch (rate) {
+		case APLL_LOW_FREQ:
+			*frac_val = 10603200;
+			*postdiv1_val = 0;
+			*fbdiv_val = 37;
+			*refdiv_val = 1;
+			break;
+		case APLL_HIGH_FREQ:
+		default:
+			*frac_val = 14092861;
+			*postdiv1_val = 0;
+			*fbdiv_val = 163;
+			*refdiv_val = 1;
+			break;
+		}
+		break;
+	case EIC7700_PLL_CPU:
+		switch (rate) {
+		case CLK_FREQ_1800M:
+			*frac_val = 0;
+			*postdiv1_val = 0;
+			*fbdiv_val = 300;
+			*refdiv_val = 1;
+			break;
+		case CLK_FREQ_1700M:
+			*frac_val = 5592405;
+			*postdiv1_val = 0;
+			*fbdiv_val = 283;
+			*refdiv_val = 1;
+			break;
+		case CLK_FREQ_1600M:
+			*frac_val = 11184810;
+			*postdiv1_val = 0;
+			*fbdiv_val = 266;
+			*refdiv_val = 1;
+			break;
+		case CLK_FREQ_1500M:
+			*frac_val = 0;
+			*postdiv1_val = 0;
+			*fbdiv_val = 250;
+			*refdiv_val = 1;
+			break;
+		case CLK_FREQ_1300M:
+			*frac_val = 11184810;
+			*postdiv1_val = 0;
+			*fbdiv_val = 216;
+			*refdiv_val = 1;
+			break;
+		case CLK_FREQ_1200M:
+			*frac_val = 0;
+			*postdiv1_val = 0;
+			*fbdiv_val = 200;
+			*refdiv_val = 1;
+			break;
+		case CLK_FREQ_1000M:
+			*frac_val = 11184810;
+			*postdiv1_val = 0;
+			*fbdiv_val = 166;
+			*refdiv_val = 1;
+			break;
+		case CLK_FREQ_900M:
+			*frac_val = 0;
+			*postdiv1_val = 0;
+			*fbdiv_val = 150;
+			*refdiv_val = 1;
+			break;
+		case CLK_FREQ_800M:
+			*frac_val = 5592405;
+			*postdiv1_val = 0;
+			*fbdiv_val = 133;
+			*refdiv_val = 1;
+			break;
+		case CLK_FREQ_700M:
+			*frac_val = 11184810;
+			*postdiv1_val = 0;
+			*fbdiv_val = 116;
+			*refdiv_val = 1;
+			break;
+		case CLK_FREQ_600M:
+			*frac_val = 0;
+			*postdiv1_val = 0;
+			*fbdiv_val = 100;
+			*refdiv_val = 1;
+			break;
+		case CLK_FREQ_500M:
+			*frac_val = 5592405;
+			*postdiv1_val = 0;
+			*fbdiv_val = 83;
+			*refdiv_val = 1;
+			break;
+		case CLK_FREQ_400M:
+			*frac_val = 11184810;
+			*postdiv1_val = 0;
+			*fbdiv_val = 66;
+			*refdiv_val = 1;
+			break;
+		case CLK_FREQ_200M:
+			*frac_val = 5592405;
+			*postdiv1_val = 0;
+			*fbdiv_val = 33;
+			*refdiv_val = 1;
+			break;
+		case CLK_FREQ_100M:
+			*frac_val = 11184810;
+			*postdiv1_val = 0;
+			*fbdiv_val = 16;
+			*refdiv_val = 1;
+			break;
+		case CLK_FREQ_1400M:
+		default:
+			*frac_val = 5592405;
+			*postdiv1_val = 0;
+			*fbdiv_val = 233;
+			*refdiv_val = 1;
+			break;
+		}
+		break;
+	default:
+		ret = -EINVAL;
+		pr_err("%s %d, Invalid pll set req, rate %lld, clk id %d\n",
+		       __func__, __LINE__, rate, clk->id);
+		break;
+	}
+	return ret;
+}
+
+static bool cpu_no_boost_1_6ghz;
+static int __init cpu_no_boost_1_6ghz_setup(char *__unused)
+{
+	cpu_no_boost_1_6ghz = true;
+	return 1;
+}
+__setup("cpu_no_boost_1_6ghz", cpu_no_boost_1_6ghz_setup);
+
+#define to_pll_clk(_hw) container_of(_hw, struct eswin_clk_pll, hw)
+static int clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
+			    unsigned long parent_rate)
+{
+	struct eswin_clk_pll *clk = to_pll_clk(hw);
+	u32 frac_val = 0, postdiv1_val, fbdiv_val, refdiv_val;
+	u32 val;
+	int ret;
+	struct clk *clk_cpu_mux = NULL;
+	struct clk *clk_cpu_lp_pll = NULL;
+	struct clk *clk_cpu_pll = NULL;
+	int try_count = 0;
+	bool lock_flag = false;
+	char clk_cpu_mux_name[50] = { 0 };
+	char clk_cpu_lp_pll_name[50] = { 0 };
+	char clk_cpu_pll_name[50] = { 0 };
+	enum voltage_level cpu_target_volatge;
+
+	ret = eswin_calc_pll(&frac_val, &postdiv1_val, &fbdiv_val, &refdiv_val,
+			     (u64)rate, clk);
+	if (ret)
+		return ret;
+
+	/*
+	 * we must switch the cpu to other clk before we change the cpu pll
+	 */
+	if (clk->id == EIC7700_PLL_CPU) {
+		sprintf(clk_cpu_mux_name, "%s",
+			"mux_u_cpu_root_3mux1_gfree");
+		sprintf(clk_cpu_lp_pll_name, "%s",
+			"clk_clk_u84_core_lp");
+		sprintf(clk_cpu_pll_name, "%s", "clk_pll_cpu");
+
+		clk_cpu_mux = __clk_lookup(clk_cpu_mux_name);
+		if (!clk_cpu_mux) {
+			pr_err("%s %d, failed to get %s\n", __func__, __LINE__,
+			       clk_cpu_mux_name);
+			return -EINVAL;
+		}
+		clk_cpu_lp_pll = __clk_lookup(clk_cpu_lp_pll_name);
+		if (!clk_cpu_lp_pll) {
+			pr_err("%s %d, failed to get %s\n", __func__, __LINE__,
+			       clk_cpu_lp_pll_name);
+			return -EINVAL;
+		}
+		ret = clk_prepare_enable(clk_cpu_lp_pll);
+		if (ret) {
+			pr_err("%s %d, failed to enable %s, ret %d\n", __func__,
+			       __LINE__, clk_cpu_lp_pll_name, ret);
+			return ret;
+		}
+		clk_cpu_pll = __clk_lookup(clk_cpu_pll_name);
+		if (!clk_cpu_pll) {
+			pr_err("%s %d, failed to get %s\n", __func__, __LINE__,
+			       clk_cpu_pll_name);
+			clk_disable_unprepare(clk_cpu_lp_pll);
+			return -EINVAL;
+		}
+
+		ret = clk_set_parent(clk_cpu_mux, clk_cpu_lp_pll);
+		if (ret) {
+			pr_err("%s %d, failed to switch %s to %s, ret %d\n",
+			       __func__, __LINE__, clk_cpu_mux_name,
+			       clk_cpu_lp_pll_name, ret);
+			clk_disable_unprepare(clk_cpu_lp_pll);
+			return -EPERM;
+		}
+		/*
+		 * The CPU clock has now switched to the LP_PLL,
+		 * so we can adjust the CPU's supply voltage
+		 * If the board cpu voltage does not support boosting to 0.9V,
+		 * then the frequency cannot exceed 1.6GHz.
+		 */
+		switch (rate) {
+		case CLK_FREQ_1800M:
+		case CLK_FREQ_1700M:
+			cpu_target_volatge = VOLTAGE_0_9V;
+			ret = eswin_clk_set_cpu_volatge(clk->cpu_voltage_gpio,
+							cpu_target_volatge);
+			if (ret) {
+				pr_warn("failed to change cpu volatge to %d mV, not support rate %ld\n",
+					cpu_target_volatge, rate);
+				goto switch_back;
+			} else {
+				if (clk->cpu_current_volatge !=
+				    cpu_target_volatge) {
+					pr_info("cpu volatge change to %d mV, target rate %ld\n",
+						cpu_target_volatge, rate);
+					clk->cpu_current_volatge =
+						cpu_target_volatge;
+				}
+			}
+			break;
+		case CLK_FREQ_1600M:
+		case CLK_FREQ_1500M:
+			cpu_target_volatge = (true == cpu_no_boost_1_6ghz) ?
+						     VOLTAGE_0_8V :
+						     VOLTAGE_0_9V;
+			ret = eswin_clk_set_cpu_volatge(clk->cpu_voltage_gpio,
+							cpu_target_volatge);
+			if (ret) {
+				pr_warn("failed to change cpu volatge to %d mV, not support rate %ld\n",
+					cpu_target_volatge, rate);
+				goto switch_back;
+			} else {
+				if (clk->cpu_current_volatge !=
+				    cpu_target_volatge) {
+					pr_info("cpu volatge change to %d mV, target rate %ld\n",
+						cpu_target_volatge, rate);
+					clk->cpu_current_volatge =
+						cpu_target_volatge;
+				}
+			}
+			break;
+		default:
+			ret = eswin_clk_set_cpu_volatge(clk->cpu_voltage_gpio,
+							VOLTAGE_0_8V);
+			if (!ret) {
+				if (clk->cpu_current_volatge != VOLTAGE_0_8V) {
+					pr_info("cpu volatge change to %d mV, target rate %ld\n",
+						VOLTAGE_0_8V, rate);
+					clk->cpu_current_volatge = VOLTAGE_0_8V;
+				}
+			}
+			/*
+			 * For boards that do not support voltage switching,
+			 * the voltage is maintained at 0.8V.
+			 * Therefore, this is also considered successful.
+			 */
+			ret = 0;
+			break;
+		}
+	}
+
+	/*first disable pll */
+	val = readl_relaxed(clk->ctrl_reg0);
+	val &= ~(((1 << clk->pllen_width) - 1) << clk->pllen_shift);
+	val |= 0 << clk->pllen_shift;
+	writel_relaxed(val, clk->ctrl_reg0);
+
+	val = readl_relaxed(clk->ctrl_reg0);
+	val &= ~(((1 << clk->fbdiv_width) - 1) << clk->fbdiv_shift);
+	val &= ~(((1 << clk->refdiv_width) - 1) << clk->refdiv_shift);
+	val |= refdiv_val << clk->refdiv_shift;
+	val |= fbdiv_val << clk->fbdiv_shift;
+	writel_relaxed(val, clk->ctrl_reg0);
+
+	val = readl_relaxed(clk->ctrl_reg1);
+	val &= ~(((1 << clk->frac_width) - 1) << clk->frac_shift);
+	val |= frac_val << clk->frac_shift;
+	writel_relaxed(val, clk->ctrl_reg1);
+
+	val = readl_relaxed(clk->ctrl_reg2);
+	val &= ~(((1 << clk->postdiv1_width) - 1) << clk->postdiv1_shift);
+	val |= postdiv1_val << clk->postdiv1_shift;
+	writel_relaxed(val, clk->ctrl_reg2);
+
+	/*at last, enable pll */
+	val = readl_relaxed(clk->ctrl_reg0);
+	val &= ~(((1 << clk->pllen_width) - 1) << clk->pllen_shift);
+	val |= 1 << clk->pllen_shift;
+	writel_relaxed(val, clk->ctrl_reg0);
+
+	/*
+	 * usually the pll wil lock in 50us
+	 */
+	do {
+		usleep_range(refdiv_val * 80, refdiv_val * 80 * 2);
+		val = readl_relaxed(clk->status_reg);
+		if (val & 1 << clk->lock_shift) {
+			lock_flag = true;
+			break;
+		}
+	} while (try_count++ < 10);
+
+	if (!lock_flag) {
+		pr_err("%s %d, failed to lock the cpu pll, cpu will work on low power pll\n",
+		       __func__, __LINE__);
+		return -EBUSY;
+	}
+
+switch_back:
+	if (clk->id == EIC7700_PLL_CPU) {
+		ret = clk_set_parent(clk_cpu_mux, clk_cpu_pll);
+		if (ret) {
+			pr_err("%s %d, failed to switch %s to %s, ret %d\n",
+			       __func__, __LINE__, clk_cpu_mux_name,
+			       clk_cpu_pll_name, ret);
+			return -EPERM;
+		}
+		clk_disable_unprepare(clk_cpu_lp_pll);
+	}
+	return ret;
+}
+
+static unsigned long clk_pll_recalc_rate(struct clk_hw *hw,
+					 unsigned long parent_rate)
+{
+	struct eswin_clk_pll *clk = to_pll_clk(hw);
+	u64 frac_val, fbdiv_val, refdiv_val;
+	u32 postdiv1_val;
+	u32 val;
+	u64 rate;
+
+	val = readl_relaxed(clk->ctrl_reg0);
+	val = val >> clk->fbdiv_shift;
+	val &= ((1 << clk->fbdiv_width) - 1);
+	fbdiv_val = val;
+
+	val = readl_relaxed(clk->ctrl_reg0);
+	val = val >> clk->refdiv_shift;
+	val &= ((1 << clk->refdiv_width) - 1);
+	refdiv_val = val;
+
+	val = readl_relaxed(clk->ctrl_reg1);
+	val = val >> clk->frac_shift;
+	val &= ((1 << clk->frac_width) - 1);
+	frac_val = val;
+
+	val = readl_relaxed(clk->ctrl_reg2);
+	val = val >> clk->postdiv1_shift;
+	val &= ((1 << clk->postdiv1_width) - 1);
+	postdiv1_val = val;
+
+	switch (clk->id) {
+	case EIC7700_APLL_FOUT1:
+		switch (frac_val) {
+		case 14092861:
+			rate = APLL_HIGH_FREQ;
+			break;
+		case 10603200:
+			rate = APLL_LOW_FREQ;
+			break;
+		default:
+			pr_err("%s %d, clk id %d, unknown frac_val %llu\n",
+			       __func__, __LINE__, clk->id, frac_val);
+			rate = 0;
+			break;
+		}
+		break;
+	case EIC7700_PLL_CPU:
+		switch (fbdiv_val) {
+		case 300:
+			rate = CLK_FREQ_1800M;
+			break;
+		case 283:
+			rate = CLK_FREQ_1700M;
+			break;
+		case 266:
+			rate = CLK_FREQ_1600M;
+			break;
+		case 250:
+			rate = CLK_FREQ_1500M;
+			break;
+		case 216:
+			rate = CLK_FREQ_1300M;
+			break;
+		case 200:
+			rate = CLK_FREQ_1200M;
+			break;
+		case 166:
+			rate = CLK_FREQ_1000M;
+			break;
+		case 150:
+			rate = CLK_FREQ_900M;
+			break;
+		case 133:
+			rate = CLK_FREQ_800M;
+			break;
+		case 116:
+			rate = CLK_FREQ_700M;
+			break;
+		case 100:
+			rate = CLK_FREQ_600M;
+			break;
+		case 83:
+			rate = CLK_FREQ_500M;
+			break;
+		case 66:
+			rate = CLK_FREQ_400M;
+			break;
+		case 33:
+			rate = CLK_FREQ_200M;
+			break;
+		case 16:
+			rate = CLK_FREQ_100M;
+			break;
+		case 233:
+			rate = CLK_FREQ_1400M;
+			break;
+		default:
+			pr_err("%s %d, clk id %d, unknown fbdiv_val %llu\n",
+			       __func__, __LINE__, clk->id, fbdiv_val);
+			rate = 0;
+			break;
+		}
+		break;
+	default:
+		pr_err("%s %d, unknown clk id %d\n", __func__, __LINE__,
+		       clk->id);
+		rate = 0;
+		break;
+	}
+	return rate;
+}
+
+static long clk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
+			       unsigned long *parent_rate)
+{
+	struct eswin_clk_pll *clk = to_pll_clk(hw);
+	int index;
+	u64 round_rate = 0;
+
+	/*Must be sorted in ascending order*/
+	u64 apll_clk[] = { APLL_LOW_FREQ, APLL_HIGH_FREQ };
+	u64 cpu_pll_clk[] = { CLK_FREQ_100M,  CLK_FREQ_200M,  CLK_FREQ_400M,
+			      CLK_FREQ_500M,  CLK_FREQ_600M,  CLK_FREQ_700M,
+			      CLK_FREQ_800M,  CLK_FREQ_900M,  CLK_FREQ_1000M,
+			      CLK_FREQ_1200M, CLK_FREQ_1300M, CLK_FREQ_1400M,
+			      CLK_FREQ_1500M, CLK_FREQ_1600M, CLK_FREQ_1700M,
+			      CLK_FREQ_1800M };
+
+	switch (clk->id) {
+	case EIC7700_APLL_FOUT1:
+		index = find_closest(rate, apll_clk, ARRAY_SIZE(apll_clk));
+		round_rate = apll_clk[index];
+		break;
+	case EIC7700_PLL_CPU:
+		index = find_closest(rate, cpu_pll_clk,
+				     ARRAY_SIZE(cpu_pll_clk));
+		round_rate = cpu_pll_clk[index];
+		break;
+	default:
+		pr_err("%s %d, unknown clk id %d\n", __func__, __LINE__,
+		       clk->id);
+		round_rate = 0;
+		break;
+	}
+	return round_rate;
+}
+
+static const struct clk_ops eswin_clk_pll_ops = {
+	.set_rate = clk_pll_set_rate,
+	.recalc_rate = clk_pll_recalc_rate,
+	.round_rate = clk_pll_round_rate,
+};
+
+void eswin_clk_register_pll(struct eswin_pll_clock *clks, int nums,
+			    struct eswin_clock_data *data, struct device *dev)
+{
+	void __iomem *base = data->base;
+	struct eswin_clk_pll *p_clk = NULL;
+	struct clk *clk = NULL;
+	struct clk_init_data init;
+	int i;
+	static struct gpio_desc *cpu_voltage_gpio;
+
+	p_clk = devm_kzalloc(dev, sizeof(*p_clk) * nums, GFP_KERNEL);
+
+	if (!p_clk)
+		return;
+	/*
+	 *In the D2D system, the boost operation is performed using the GPIO on Die0.
+	 *However, the same GPIO pin cannot be acquired twice, so special handling is implemented:
+	 *Once the GPIO is acquired,the other driver simply uses it directly
+	 */
+	cpu_voltage_gpio =
+		IS_ERR_OR_NULL(cpu_voltage_gpio) ?
+			devm_gpiod_get(dev, "cpu-voltage", GPIOD_OUT_HIGH) :
+			cpu_voltage_gpio;
+	if (IS_ERR_OR_NULL(cpu_voltage_gpio)) {
+		dev_warn(dev, "failed to get cpu volatge gpio\n");
+		cpu_voltage_gpio = NULL;
+	} else {
+		/*cpu default freq is 1400M, the volatge should be VOLTAGE_0_8V*/
+		eswin_clk_set_cpu_volatge(cpu_voltage_gpio, VOLTAGE_0_8V);
+	}
+	for (i = 0; i < nums; i++) {
+		char *name = kzalloc(strlen(clks[i].name) + 2 * sizeof(char) +
+					     sizeof(int),
+				     GFP_KERNEL);
+		const char *parent_name =
+			clks[i].parent_name ?
+				kzalloc(strlen(clks[i].parent_name) +
+						2 * sizeof(char) + sizeof(int),
+					GFP_KERNEL) :
+				NULL;
+		sprintf(name, "%s", clks[i].name);
+		if (parent_name) {
+			sprintf((char *)parent_name, "%s",
+				clks[i].parent_name);
+		}
+
+		init.name = name;
+		init.flags = 0;
+		init.parent_names = parent_name ? &parent_name : NULL;
+		init.num_parents = parent_name ? 1 : 0;
+		init.ops = &eswin_clk_pll_ops;
+
+		p_clk->id = clks[i].id;
+		p_clk->ctrl_reg0 = base + clks[i].ctrl_reg0;
+		p_clk->pllen_shift = clks[i].pllen_shift;
+		p_clk->pllen_width = clks[i].pllen_width;
+		p_clk->refdiv_shift = clks[i].refdiv_shift;
+		p_clk->refdiv_width = clks[i].refdiv_width;
+		p_clk->fbdiv_shift = clks[i].fbdiv_shift;
+		p_clk->fbdiv_width = clks[i].fbdiv_width;
+
+		p_clk->ctrl_reg1 = base + clks[i].ctrl_reg1;
+		p_clk->frac_shift = clks[i].frac_shift;
+		p_clk->frac_width = clks[i].frac_width;
+
+		p_clk->ctrl_reg2 = base + clks[i].ctrl_reg2;
+		p_clk->postdiv1_shift = clks[i].postdiv1_shift;
+		p_clk->postdiv1_width = clks[i].postdiv1_width;
+		p_clk->postdiv2_shift = clks[i].postdiv2_shift;
+		p_clk->postdiv2_width = clks[i].postdiv2_width;
+
+		p_clk->status_reg = base + clks[i].status_reg;
+		p_clk->lock_shift = clks[i].lock_shift;
+		p_clk->lock_width = clks[i].lock_width;
+
+		p_clk->hw.init = &init;
+		p_clk->cpu_voltage_gpio = cpu_voltage_gpio;
+		p_clk->cpu_current_volatge = VOLTAGE_0_8V;
+		clk = clk_register(dev, &p_clk->hw);
+		if (IS_ERR(clk)) {
+			devm_kfree(dev, p_clk);
+			dev_err(dev, "%s: failed to register clock %s\n",
+				__func__, clks[i].name);
+			continue;
+		}
+
+		data->clk_data.clks[clks[i].id] = clk;
+		p_clk++;
+
+		kfree(name);
+		kfree(parent_name);
+	}
+}
+
+int eswin_clk_register_fixed_factor(struct device *dev,
+				    const struct eswin_fixed_factor_clock *clks,
+				    int nums, struct eswin_clock_data *data)
+{
+	struct clk *clk;
+	int i;
+
+	for (i = 0; i < nums; i++) {
+		char *name = kzalloc(strlen(clks[i].name) + 2 * sizeof(char) +
+					     sizeof(int),
+				     GFP_KERNEL);
+		char *parent_name =
+			kzalloc(strlen(clks[i].parent_name) + 2 * sizeof(char) +
+					sizeof(int),
+				GFP_KERNEL);
+		sprintf(name, "%s", clks[i].name);
+		sprintf(parent_name, "%s", clks[i].parent_name);
+
+		clk = clk_register_fixed_factor(NULL, name, parent_name,
+						clks[i].flags, clks[i].mult,
+						clks[i].div);
+		if (IS_ERR(clk)) {
+			kfree(name);
+			kfree(parent_name);
+			while (i--)
+				clk_unregister_fixed_factor(data->clk_data.clks[clks[i].id]);
+			return dev_err_probe(dev, IS_ERR(clk), "failed to register clock\n");
+		}
+		data->clk_data.clks[clks[i].id] = clk;
+
+		kfree(name);
+		kfree(parent_name);
+	}
+
+	return 0;
+}
+
+int eswin_clk_register_mux(struct device *dev,
+			   const struct eswin_mux_clock *clks, int nums,
+			   struct eswin_clock_data *data)
+{
+	struct clk *clk;
+	void __iomem *base = data->base;
+	int i;
+	int j;
+
+	for (i = 0; i < nums; i++) {
+		char *name = kzalloc(strlen(clks[i].name) + 2 * sizeof(char) +
+					     sizeof(int),
+				     GFP_KERNEL);
+
+		char **parent_names = kzalloc(sizeof(char *) *
+			 clks[i].num_parents, GFP_KERNEL);
+		sprintf(name, "%s", clks[i].name);
+
+		for (j = 0; j < clks[i].num_parents; j++) {
+			parent_names[j] =
+				kzalloc(strlen(clks[i].parent_names[j]) +
+						2 * sizeof(char) + sizeof(int),
+					GFP_KERNEL);
+			sprintf(parent_names[j], "%s", clks[i].parent_names[j]);
+		}
+		clk = clk_register_mux_table(NULL, name,
+					     (const char *const *)parent_names,
+					     clks[i].num_parents, clks[i].flags,
+					     base + clks[i].offset, clks[i].shift, clks[i].mask,
+					     clks[i].mux_flags, clks[i].table, &data->lock);
+		if (IS_ERR(clk)) {
+			kfree(name);
+			for (j = 0; j < clks[i].num_parents; j++)
+				kfree(parent_names[j]);
+
+			kfree(parent_names);
+			while (i--)
+				clk_unregister_mux(data->clk_data.clks[clks[i].id]);
+			return dev_err_probe(dev, IS_ERR(clk), "failed to register clock\n");
+		}
+
+		if (clks[i].alias)
+			clk_register_clkdev(clk, clks[i].alias, NULL);
+
+		data->clk_data.clks[clks[i].id] = clk;
+
+		kfree(name);
+		for (j = 0; j < clks[i].num_parents; j++)
+			kfree(parent_names[j]);
+
+		kfree(parent_names);
+	}
+	return 0;
+}
+
+int eswin_clk_register_divider(struct device *dev,
+			       const struct eswin_divider_clock *clks, int nums,
+			       struct eswin_clock_data *data)
+{
+	struct clk *clk;
+	void __iomem *base = data->base;
+	int i;
+	struct clk_hw *clk_hw;
+	struct clk_hw *parent_hw;
+	struct clk_parent_data parent_data;
+
+	for (i = 0; i < nums; i++) {
+		char *name = kzalloc(strlen(clks[i].name) + 2 * sizeof(char) +
+					     sizeof(int),
+				     GFP_KERNEL);
+		char *parent_name =
+			kzalloc(strlen(clks[i].parent_name) + 2 * sizeof(char) +
+					sizeof(int),
+				GFP_KERNEL);
+		sprintf(name, "%s", clks[i].name);
+		sprintf(parent_name, "%s", clks[i].parent_name);
+		parent_hw = eswin_clk_find_parent(data, parent_name);
+		parent_data.name = parent_name;
+		parent_data.hw = parent_hw;
+		parent_data.fw_name = NULL;
+		clk_hw = clk_hw_register_divider_table_parent_data(NULL, name,
+								   &parent_data, clks[i].flags,
+			base + clks[i].offset, clks[i].shift, clks[i].width,
+			clks[i].div_flags, clks[i].table, &data->lock);
+		if (IS_ERR(clk_hw)) {
+			kfree(name);
+			kfree(parent_name);
+			while (i--)
+				clk_unregister_divider(data->clk_data.clks[clks[i].id]);
+			return dev_err_probe(dev, IS_ERR(clk), "failed to register clock\n");
+		}
+		clk = clk_hw->clk;
+		if (clks[i].alias)
+			clk_register_clkdev(clk, clks[i].alias, NULL);
+
+		data->clk_data.clks[clks[i].id] = clk;
+		kfree(name);
+		kfree(parent_name);
+	}
+	return 0;
+}
+
+int eswin_clk_register_gate(struct device *dev,
+			    const struct eswin_gate_clock *clks, int nums,
+			    struct eswin_clock_data *data)
+{
+	struct clk *clk;
+	void __iomem *base = data->base;
+	int i;
+	struct clk_hw *clk_hw;
+	struct clk_hw *parent_hw;
+	struct clk_parent_data parent_data;
+
+	for (i = 0; i < nums; i++) {
+		char *name = kzalloc(strlen(clks[i].name) + 2 * sizeof(char) +
+					     sizeof(int),
+				     GFP_KERNEL);
+		char *parent_name =
+			kzalloc(strlen(clks[i].parent_name) + 2 * sizeof(char) +
+					sizeof(int),
+				GFP_KERNEL);
+		sprintf(name, "%s", clks[i].name);
+		sprintf(parent_name, "%s", clks[i].parent_name);
+		parent_hw = eswin_clk_find_parent(data, parent_name);
+		parent_data.name = parent_name;
+		parent_data.hw = parent_hw;
+		parent_data.fw_name = NULL;
+		clk_hw = clk_hw_register_gate_parent_data(NULL, name,
+							  &parent_data, clks[i].flags,
+			base + clks[i].offset, clks[i].bit_idx,
+			clks[i].gate_flags, &data->lock);
+		if (IS_ERR(clk_hw)) {
+			kfree(name);
+			kfree(parent_name);
+			while (i--)
+				clk_unregister_gate(data->clk_data.clks[clks[i].id]);
+			return dev_err_probe(dev, IS_ERR(clk_hw), "failed to register clock\n");
+		}
+		clk = clk_hw->clk;
+		if (clks[i].alias)
+			clk_register_clkdev(clk, clks[i].alias, NULL);
+
+		data->clk_data.clks[clks[i].id] = clk;
+		kfree(name);
+		kfree(parent_name);
+	}
+	return 0;
+}
+
+static const struct clk_ops clk_dummpy_ops = {
+};
+
+static struct clk *eswin_register_clk(struct eswin_clock_data *data,
+				      struct device *dev, const char *name,
+			       const char *parent_name, unsigned long flags,
+			       spinlock_t *lock)
+{
+	struct eswin_clock *eclk;
+	struct clk *clk;
+	struct clk_init_data init;
+	struct clk_parent_data parent_data;
+	struct clk_hw *parent_hw;
+
+	eclk = kzalloc(sizeof(*eclk), GFP_KERNEL);
+	if (!eclk)
+		return ERR_PTR(-ENOMEM);
+
+	init.ops = &clk_dummpy_ops;
+
+	init.name = name;
+	init.flags = flags;
+	init.parent_names = NULL;
+	init.num_parents = (parent_name ? 1 : 0);
+	init.parent_data = &parent_data;
+
+	parent_hw = eswin_clk_find_parent(data, (char *)parent_name);
+	parent_data.name = parent_name;
+	parent_data.hw = parent_hw;
+	parent_data.fw_name = NULL;
+
+	eclk->hw.init = &init;
+
+	clk = clk_register(dev, &eclk->hw);
+	if (IS_ERR(clk))
+		kfree(eclk);
+
+	return clk;
+}
+
+int eswin_clk_register_clk(struct device *dev,
+			   const struct eswin_clock *clks, int nums,
+			   struct eswin_clock_data *data)
+{
+	struct clk *clk;
+	int i;
+
+	for (i = 0; i < nums; i++) {
+		char *name = kzalloc(strlen(clks[i].name) + 2 * sizeof(char) +
+					     sizeof(int),
+				     GFP_KERNEL);
+		char *parent_name =
+			kzalloc(strlen(clks[i].parent_name) + 2 * sizeof(char) +
+					sizeof(int),
+				GFP_KERNEL);
+		sprintf(name, "%s", clks[i].name);
+		sprintf(parent_name, "%s", clks[i].parent_name);
+		clk = eswin_register_clk(data, NULL, name, parent_name,
+					 clks[i].flags, &data->lock);
+		if (IS_ERR(clk)) {
+			kfree(name);
+			kfree(parent_name);
+			while (i--)
+				clk_unregister_gate(data->clk_data.clks[clks[i].id]);
+			return dev_err_probe(dev, PTR_ERR(clk), "failed to get clk!\n");
+		}
+
+		if (clks[i].alias)
+			clk_register_clkdev(clk, clks[i].alias, NULL);
+
+		data->clk_data.clks[clks[i].id] = clk;
+		kfree(name);
+		kfree(parent_name);
+	}
+	return 0;
+}
diff --git a/drivers/clk/eswin/clk.h b/drivers/clk/eswin/clk.h
new file mode 100644
index 000000000000..b36cd37c0abc
--- /dev/null
+++ b/drivers/clk/eswin/clk.h
@@ -0,0 +1,213 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2025, Beijing ESWIN Computing Technology Co., Ltd.. All rights reserved.
+ *
+ * Authors:
+ *	Yifeng Huang <huangyifeng@eswincomputing.com>
+ *	Xuyang Dong <dongxuyang@eswincomputing.com>
+ */
+
+#ifndef __ESWIN_CLK_H__
+#define __ESWIN_CLK_H__
+
+#include <linux/clk-provider.h>
+#include <linux/io.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+
+#define CLK_FREQ_1800M 1800000000
+#define CLK_FREQ_1700M 1700000000
+#define CLK_FREQ_1600M 1600000000
+#define CLK_FREQ_1500M 1500000000
+#define CLK_FREQ_1400M 1400000000
+#define CLK_FREQ_1300M 1300000000
+#define CLK_FREQ_1200M 1200000000
+#define CLK_FREQ_1000M 1000000000
+#define CLK_FREQ_900M 900000000
+#define CLK_FREQ_800M 800000000
+#define CLK_FREQ_700M 700000000
+#define CLK_FREQ_600M 600000000
+#define CLK_FREQ_500M 500000000
+#define CLK_FREQ_400M 400000000
+#define CLK_FREQ_200M 200000000
+#define CLK_FREQ_100M 100000000
+#define CLK_FREQ_24M 24000000
+
+#define APLL_HIGH_FREQ 983040000
+#define APLL_LOW_FREQ 225792000
+
+struct eswin_clock_data {
+	struct clk_onecell_data clk_data;
+	void __iomem *base;
+	spinlock_t lock; /* protect register read-modify-write cycle */
+};
+
+struct eswin_clock {
+	unsigned int id;
+	char *name;
+	const char *parent_name;
+	unsigned long flags;
+	struct clk_hw hw;
+	const char *alias;
+};
+
+struct eswin_fixed_rate_clock {
+	unsigned int id;
+	char *name;
+	const char *parent_name;
+	unsigned long flags;
+	unsigned long fixed_rate;
+};
+
+struct eswin_fixed_factor_clock {
+	unsigned int id;
+	char *name;
+	const char *parent_name;
+	unsigned long mult;
+	unsigned long div;
+	unsigned long flags;
+};
+
+struct eswin_mux_clock {
+	unsigned int id;
+	const char *name;
+	const char *const *parent_names;
+	u8 num_parents;
+	unsigned long flags;
+	unsigned long offset;
+	u8 shift;
+	u32 mask;
+	u8 mux_flags;
+	u32 *table;
+	const char *alias;
+};
+
+struct eswin_divider_clock {
+	unsigned int id;
+	const char *name;
+	const char *parent_name;
+	unsigned long flags;
+	unsigned long offset;
+	u8 shift;
+	u8 width;
+	u8 div_flags;
+	struct clk_div_table *table;
+	const char *alias;
+};
+
+struct eswin_gate_clock {
+	unsigned int id;
+	const char *name;
+	const char *parent_name;
+	unsigned long flags;
+	unsigned long offset;
+	u8 bit_idx;
+	u8 gate_flags;
+	const char *alias;
+};
+
+struct eswin_pll_clock {
+	u32 id;
+	const char *name;
+	const char *parent_name;
+	const u32 ctrl_reg0;
+	const u8 pllen_shift;
+	const u8 pllen_width;
+	const u8 refdiv_shift;
+	const u8 refdiv_width;
+	const u8 fbdiv_shift;
+	const u8 fbdiv_width;
+
+	const u32 ctrl_reg1;
+	const u8 frac_shift;
+	const u8 frac_width;
+
+	const u32 ctrl_reg2;
+	const u8 postdiv1_shift;
+	const u8 postdiv1_width;
+	const u8 postdiv2_shift;
+	const u8 postdiv2_width;
+
+	const u32 status_reg;
+	const u8 lock_shift;
+	const u8 lock_width;
+};
+
+enum voltage_level {
+	VOLTAGE_0_9V = 900, // Represents 0.9V in millivolts
+	VOLTAGE_0_8V = 800 // Represents 0.8V in millivolts
+};
+
+struct eswin_clk_pll {
+	struct clk_hw hw;
+	u32 id;
+	void __iomem *ctrl_reg0;
+	u8 pllen_shift;
+	u8 pllen_width;
+	u8 refdiv_shift;
+	u8 refdiv_width;
+	u8 fbdiv_shift;
+	u8 fbdiv_width;
+
+	void __iomem *ctrl_reg1;
+	u8 frac_shift;
+	u8 frac_width;
+
+	void __iomem *ctrl_reg2;
+	u8 postdiv1_shift;
+	u8 postdiv1_width;
+	u8 postdiv2_shift;
+	u8 postdiv2_width;
+
+	void __iomem *status_reg;
+	u8 lock_shift;
+	u8 lock_width;
+	struct gpio_desc *cpu_voltage_gpio;
+	enum voltage_level cpu_current_volatge;
+};
+
+struct eswin_clock_data *eswin_clk_init(struct platform_device *pdev, int nr_clks);
+int eswin_clk_register_fixed_rate(struct device *dev,
+				  const struct eswin_fixed_rate_clock *clks, int nums,
+				  struct eswin_clock_data *data);
+
+void eswin_clk_register_pll(struct eswin_pll_clock *clks, int nums,
+			    struct eswin_clock_data *data, struct device *dev);
+
+int eswin_clk_register_fixed_factor(struct device *dev,
+				    const struct eswin_fixed_factor_clock *clks,
+				    int nums, struct eswin_clock_data *data);
+int eswin_clk_register_mux(struct device *dev,
+			   const struct eswin_mux_clock *clks, int nums,
+			   struct eswin_clock_data *data);
+
+int eswin_clk_register_divider(struct device *dev,
+			       const struct eswin_divider_clock *clks,
+				   int nums, struct eswin_clock_data *data);
+int eswin_clk_register_gate(struct device *dev,
+			    const struct eswin_gate_clock *clks, int nums,
+			    struct eswin_clock_data *data);
+
+int eswin_clk_register_clk(struct device *dev,
+			   const struct eswin_clock *clks, int nums,
+			   struct eswin_clock_data *data);
+
+#define eswin_clk_unregister(type)                                 \
+	static inline void eswin_clk_unregister_##type(            \
+		const struct eswin_##type##_clock *clks, int nums, \
+		struct eswin_clock_data *data)                     \
+	{                                                          \
+		struct clk **clocks = data->clk_data.clks;         \
+		int i;                                             \
+		for (i = 0; i < nums; i++) {                       \
+			int id = clks[i].id;                       \
+			if (clocks[id])                            \
+				clk_unregister_##type(clocks[id]); \
+		}                                                  \
+	}
+
+eswin_clk_unregister(fixed_rate) eswin_clk_unregister(fixed_factor)
+	eswin_clk_unregister(mux) eswin_clk_unregister(divider)
+		eswin_clk_unregister(gate)
+
+#endif /* __ESWIN_CLK_H__ */
-- 
2.17.1

