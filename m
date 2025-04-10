Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA32E28F92C;
	Thu, 10 Apr 2025 14:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744296087; cv=none; b=luLfGtKnSqGL6DfwfOtiKl3Hb9uIdkmj5v+cCbG1wLZZQEoeFmXx/OGUyiMtFxogJ66nd4ENIZy7iJz9ZG11fsz/aRTx5zcGED7tJq/jpb6z2F6rgDpjGYkXrH+FS673YkdiGXSvRHdVGYaYOETt1kz3OWUEDIrbWh230H+1hh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744296087; c=relaxed/simple;
	bh=bt5ltddMpCdVtI51AV4dO7Se1+OQULRrOBMBGQLtaPA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e+VyOwO6VKbQg0DNcCrXhfCaCHBEAiQ9uapWGjyxdV/PHRxaPSW8kBVP7CsbxEO5ELcSpDxlLRK7B06uL9F1FXT8B2Qa1ECR4yL6XVh7sL9YoiVzsVmMC+8oFI3ycwao0NrneMlGNeHVXsrxzoBgX6URYKBvmaCds6oDahU7600=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZA9s14Gc; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZA9s14Gc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744296083;
	bh=bt5ltddMpCdVtI51AV4dO7Se1+OQULRrOBMBGQLtaPA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZA9s14GcPXQdbcxyX9y9EdrcyubEa48EkQL2U4mc2guV+mGK0deqbCLfMK4Zw1qFk
	 HiujRAYWBmWAlfq/D/UbdL72bUSztvY7pPdg96rd9Z52K4gYIKPRT82xjD3dLBf9Jv
	 AwgKBquK1LL5lTocOEuL3/E7wbzwg5EH1727PTKzHTlLQI+YOm68Od+JI+eFtmj1mW
	 x7OK+iW5jC808+dALgplSMRJrSbs2c0hMNEoXV40XCU/c5t4T1uR8jYkUrMi9a8tb2
	 lRy9ai6mho7MaTwBgOsXpreUuXM/CI2z5L2PUh/O3Rizs1+GtXeO0ERK4yifsA/apI
	 nJh5LfBDN2YEg==
Received: from IcarusMOD.eternityproject.eu (fi-19-199-243.service.infuturo.it [151.19.199.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 854EA17E14EF;
	Thu, 10 Apr 2025 16:41:21 +0200 (CEST)
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
Subject: [PATCH v1 3/3] clk: mediatek: mt6893: Add peripheral and multimedia clock drivers
Date: Thu, 10 Apr 2025 16:41:10 +0200
Message-ID: <20250410144110.476197-4-angelogioacchino.delregno@collabora.com>
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

Add support for the peripheral (imp_iic_wrap for i2c, scp_adsp for
the System Companion Processor's AudioDSP clock output) and
multimedia clock drivers (Multimedia Data Path, Display, GPU and
video encoders/decoders) that are present in the MediaTek
Dimensity 1200 (MT6893) SoC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/Kconfig                  |  49 +++++++
 drivers/clk/mediatek/Makefile                 |   7 +
 .../clk/mediatek/clk-mt6893-imp_iic_wrap.c    |  94 +++++++++++++
 drivers/clk/mediatek/clk-mt6893-mdp.c         | 116 ++++++++++++++++
 drivers/clk/mediatek/clk-mt6893-mfg.c         |  51 +++++++
 drivers/clk/mediatek/clk-mt6893-mm.c          | 129 ++++++++++++++++++
 drivers/clk/mediatek/clk-mt6893-scp_adsp.c    |  52 +++++++
 drivers/clk/mediatek/clk-mt6893-vdec.c        |  98 +++++++++++++
 drivers/clk/mediatek/clk-mt6893-venc.c        |  72 ++++++++++
 9 files changed, 668 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt6893-imp_iic_wrap.c
 create mode 100644 drivers/clk/mediatek/clk-mt6893-mdp.c
 create mode 100644 drivers/clk/mediatek/clk-mt6893-mfg.c
 create mode 100644 drivers/clk/mediatek/clk-mt6893-mm.c
 create mode 100644 drivers/clk/mediatek/clk-mt6893-scp_adsp.c
 create mode 100644 drivers/clk/mediatek/clk-mt6893-vdec.c
 create mode 100644 drivers/clk/mediatek/clk-mt6893-venc.c

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 64204e07ed47..ff8a87112969 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -382,6 +382,55 @@ config COMMON_CLK_MT6893
 	help
 	  This driver supports MediaTek Dimensity 1200 MT6893 basic clocks.
 
+config COMMON_CLK_MT6893_IMP_IIC_WRAP
+	tristate "Clock driver for MediaTek MT6893 imp_iic_wrap"
+	depends on COMMON_CLK_MT6893
+	default COMMON_CLK_MT6893
+	help
+	  This driver supports MediaTek MT6893 imp_iic_wrap clocks.
+
+config COMMON_CLK_MT6893_MDPSYS
+	tristate "Clock driver for MediaTek MT6893 mdpsys"
+	depends on COMMON_CLK_MT6893
+	default COMMON_CLK_MT6893
+	help
+	  This driver supports MediaTek MT6893 mdpsys clocks.
+
+config COMMON_CLK_MT6893_MFGCFG
+	tristate "Clock driver for MediaTek MT6893 mfgcfg"
+	depends on COMMON_CLK_MT6893
+	default COMMON_CLK_MT6893
+	help
+	  This driver supports MediaTek MT6893 mfgcfg clocks.
+
+config COMMON_CLK_MT6893_MMSYS
+	tristate "Clock driver for MediaTek MT6893 mmsys"
+	depends on COMMON_CLK_MT6893
+	default COMMON_CLK_MT6893
+	help
+	  This driver supports MediaTek MT6893 mmsys clocks.
+
+config COMMON_CLK_MT6893_SCP_ADSP
+	tristate "Clock driver for MediaTek MT6893 scp_adsp"
+	depends on COMMON_CLK_MT6893
+	default COMMON_CLK_MT6893
+	help
+	  This driver supports MediaTek MT6893 scp_adsp clocks.
+
+config COMMON_CLK_MT6893_VDECSYS
+	tristate "Clock driver for MediaTek MT6893 vdecsys"
+	depends on COMMON_CLK_MT6893
+	default COMMON_CLK_MT6893
+	help
+	  This driver supports MediaTek MT6893 vdecsys and vdecsys_soc clocks.
+
+config COMMON_CLK_MT6893_VENCSYS
+	tristate "Clock driver for MediaTek MT6893 vencsys"
+	depends on COMMON_CLK_MT6893
+	default COMMON_CLK_MT6893
+	help
+	  This driver supports MediaTek MT6893 vencsys clocks.
+
 config COMMON_CLK_MT7622
 	tristate "Clock driver for MediaTek MT7622"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
index b9b101eceda0..73004e318702 100644
--- a/drivers/clk/mediatek/Makefile
+++ b/drivers/clk/mediatek/Makefile
@@ -36,6 +36,13 @@ obj-$(CONFIG_COMMON_CLK_MT6797_VDECSYS) += clk-mt6797-vdec.o
 obj-$(CONFIG_COMMON_CLK_MT6797_VENCSYS) += clk-mt6797-venc.o
 obj-$(CONFIG_COMMON_CLK_MT6893) += clk-mt6893-apmixedsys.o clk-mt6893-topckgen.o \
 				   clk-mt6893-infra_ao.o
+obj-$(CONFIG_COMMON_CLK_MT6893_IMP_IIC_WRAP) += clk-mt6893-imp_iic_wrap.o
+obj-$(CONFIG_COMMON_CLK_MT6893_MDPSYS) += clk-mt6893-mdp.o
+obj-$(CONFIG_COMMON_CLK_MT6893_MFGCFG) += clk-mt6893-mfg.o
+obj-$(CONFIG_COMMON_CLK_MT6893_MMSYS) += clk-mt6893-mm.o
+obj-$(CONFIG_COMMON_CLK_MT6893_SCP_ADSP) += clk-mt6893-scp_adsp.o
+obj-$(CONFIG_COMMON_CLK_MT6893_VDECSYS) += clk-mt6893-vdec.o
+obj-$(CONFIG_COMMON_CLK_MT6893_VENCSYS) += clk-mt6893-venc.o
 
 obj-$(CONFIG_COMMON_CLK_MT2701) += clk-mt2701.o
 obj-$(CONFIG_COMMON_CLK_MT2701_AUDSYS) += clk-mt2701-aud.o
diff --git a/drivers/clk/mediatek/clk-mt6893-imp_iic_wrap.c b/drivers/clk/mediatek/clk-mt6893-imp_iic_wrap.c
new file mode 100644
index 000000000000..49416ba7b768
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt6893-imp_iic_wrap.c
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ * Copyright (c) 2025 Collabora Ltd
+ *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+
+#include <dt-bindings/clock/mediatek,mt6893-clk.h>
+
+#include "clk-gate.h"
+#include "clk-mtk.h"
+
+static const struct mtk_gate_regs imp_iic_wrap_cg_regs = {
+	.set_ofs = 0xe08,
+	.clr_ofs = 0xe04,
+	.sta_ofs = 0xe00,
+};
+
+#define GATE_IMP_IIC_WRAP(_id, _name, _parent, _shift)				\
+	GATE_MTK_FLAGS(_id, _name, _parent, &imp_iic_wrap_cg_regs, _shift,	\
+		&mtk_clk_gate_ops_setclr, CLK_OPS_PARENT_ENABLE)
+
+static const struct mtk_gate imp_iic_wrap_c_clks[] = {
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_C_AP_I2C0, "imp_iic_wrap_c_ap_i2c0", "i2c_sel", 0),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_C_AP_I2C10, "imp_iic_wrap_c_ap_i2c10", "i2c_sel", 1),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_C_AP_I2C11, "imp_iic_wrap_c_ap_i2c11", "i2c_sel", 2),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_C_AP_I2C12, "imp_iic_wrap_c_ap_i2c12", "i2c_sel", 3),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_C_AP_I2C13, "imp_iic_wrap_c_ap_i2c13", "i2c_sel", 4),
+};
+
+static const struct mtk_gate imp_iic_wrap_e_clks[] = {
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_E_AP_I2C3, "imp_iic_wrap_e_ap_i2c3", "i2c_sel", 0),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_E_AP_I2C9, "imp_iic_wrap_e_ap_i2c9", "i2c_sel", 1),
+};
+
+static const struct mtk_gate imp_iic_wrap_n_clks[] = {
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_N_AP_I2C5, "imp_iic_wrap_n_ap_i2c5", "i2c_sel", 0),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_N_AP_I2C6, "imp_iic_wrap_n_ap_i2c6", "i2c_sel", 1),
+};
+
+static const struct mtk_gate imp_iic_wrap_s_clks[] = {
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_S_AP_I2C1, "imp_iic_wrap_s_ap_i2c1", "i2c_sel", 0),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_S_AP_I2C2, "imp_iic_wrap_s_ap_i2c2", "i2c_sel", 1),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_S_AP_I2C4, "imp_iic_wrap_s_ap_i2c4", "i2c_sel", 2),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_S_AP_I2C7, "imp_iic_wrap_s_ap_i2c7", "i2c_sel", 3),
+	GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_S_AP_I2C8, "imp_iic_wrap_s_ap_i2c8", "i2c_sel", 4),
+};
+
+static const struct mtk_clk_desc imp_iic_wrap_c_desc = {
+	.clks = imp_iic_wrap_c_clks,
+	.num_clks = ARRAY_SIZE(imp_iic_wrap_c_clks),
+};
+
+static const struct mtk_clk_desc imp_iic_wrap_e_desc = {
+	.clks = imp_iic_wrap_e_clks,
+	.num_clks = ARRAY_SIZE(imp_iic_wrap_e_clks),
+};
+
+static const struct mtk_clk_desc imp_iic_wrap_n_desc = {
+	.clks = imp_iic_wrap_n_clks,
+	.num_clks = ARRAY_SIZE(imp_iic_wrap_n_clks),
+};
+
+static const struct mtk_clk_desc imp_iic_wrap_s_desc = {
+	.clks = imp_iic_wrap_s_clks,
+	.num_clks = ARRAY_SIZE(imp_iic_wrap_s_clks),
+};
+
+static const struct of_device_id of_match_clk_mt6893_imp_iic_wrap[] = {
+	{ .compatible = "mediatek,mt6893-imp-iic-wrap-c", .data = &imp_iic_wrap_c_desc },
+	{ .compatible = "mediatek,mt6893-imp-iic-wrap-e", .data = &imp_iic_wrap_e_desc },
+	{ .compatible = "mediatek,mt6893-imp-iic-wrap-n", .data = &imp_iic_wrap_n_desc },
+	{ .compatible = "mediatek,mt6893-imp-iic-wrap-s", .data = &imp_iic_wrap_s_desc },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, of_match_clk_mt6893_imp_iic_wrap);
+
+static struct platform_driver clk_mt6893_imp_iic_wrap_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt6893-imp_iic_wrap",
+		.of_match_table = of_match_clk_mt6893_imp_iic_wrap,
+	},
+};
+module_platform_driver(clk_mt6893_imp_iic_wrap_drv);
+
+MODULE_AUTHOR("AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>");
+MODULE_DESCRIPTION("MediaTek MT6893 I2C Wrapper clocks driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-mt6893-mdp.c b/drivers/clk/mediatek/clk-mt6893-mdp.c
new file mode 100644
index 000000000000..73ccded6447a
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt6893-mdp.c
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2020 MediaTek Inc.
+ * Copyright (c) 2025 Collabora Ltd
+ *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+#include <dt-bindings/clock/mediatek,mt6893-clk.h>
+
+#include "clk-gate.h"
+#include "clk-mtk.h"
+
+static const struct mtk_gate_regs mdp0_cg_regs = {
+	.set_ofs = 0x104,
+	.clr_ofs = 0x108,
+	.sta_ofs = 0x100,
+};
+
+static const struct mtk_gate_regs mdp1_cg_regs = {
+	.set_ofs = 0x114,
+	.clr_ofs = 0x118,
+	.sta_ofs = 0x110,
+};
+
+static const struct mtk_gate_regs mdp2_cg_regs = {
+	.set_ofs = 0x124,
+	.clr_ofs = 0x128,
+	.sta_ofs = 0x120,
+};
+
+#define GATE_MDP0(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &mdp0_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+#define GATE_MDP1(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &mdp1_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+#define GATE_MDP2(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &mdp2_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate mdp_clks[] = {
+	/* MDP0 */
+	GATE_MDP0(CLK_MDP_RDMA0, "mdp_rdma0", "mdp_sel", 0),
+	GATE_MDP0(CLK_MDP_FG0, "mdp_fg0", "mdp_sel", 1),
+	GATE_MDP0(CLK_MDP_HDR0, "mdp_hdr0", "mdp_sel", 2),
+	GATE_MDP0(CLK_MDP_AAL0, "mdp_aal0", "mdp_sel", 3),
+	GATE_MDP0(CLK_MDP_RSZ0, "mdp_rsz0", "mdp_sel", 4),
+	GATE_MDP0(CLK_MDP_TDSHP0, "mdp_tdshp0", "mdp_sel", 5),
+	GATE_MDP0(CLK_MDP_TCC0, "mdp_tcc0", "mdp_sel", 6),
+	GATE_MDP0(CLK_MDP_WROT0, "mdp_wrot0", "mdp_sel", 7),
+	GATE_MDP0(CLK_MDP_RDMA2, "mdp_rdma2", "mdp_sel", 8),
+	GATE_MDP0(CLK_MDP_AAL2, "mdp_aal2", "mdp_sel", 9),
+	GATE_MDP0(CLK_MDP_RSZ2, "mdp_rsz2", "mdp_sel", 10),
+	GATE_MDP0(CLK_MDP_COLOR0, "mdp_color0", "mdp_sel", 11),
+	GATE_MDP0(CLK_MDP_TDSHP2, "mdp_tdshp2", "mdp_sel", 12),
+	GATE_MDP0(CLK_MDP_TCC2, "mdp_tcc2", "mdp_sel", 13),
+	GATE_MDP0(CLK_MDP_WROT2, "mdp_wrot2", "mdp_sel", 14),
+	GATE_MDP0(CLK_MDP_MUTEX0, "mdp_mutex0", "mdp_sel", 15),
+	GATE_MDP0(CLK_MDP_RDMA1, "mdp_rdma1", "mdp_sel", 16),
+	GATE_MDP0(CLK_MDP_FG1, "mdp_fg1", "mdp_sel", 17),
+	GATE_MDP0(CLK_MDP_HDR1, "mdp_hdr1", "mdp_sel", 18),
+	GATE_MDP0(CLK_MDP_AAL1, "mdp_aal1", "mdp_sel", 19),
+	GATE_MDP0(CLK_MDP_RSZ1, "mdp_rsz1", "mdp_sel", 20),
+	GATE_MDP0(CLK_MDP_TDSHP1, "mdp_tdshp1", "mdp_sel", 21),
+	GATE_MDP0(CLK_MDP_TCC1, "mdp_tcc1", "mdp_sel", 22),
+	GATE_MDP0(CLK_MDP_WROT1, "mdp_wrot1", "mdp_sel", 23),
+	GATE_MDP0(CLK_MDP_RDMA3, "mdp_rdma3", "mdp_sel", 24),
+	GATE_MDP0(CLK_MDP_AAL3, "mdp_aal3", "mdp_sel", 25),
+	GATE_MDP0(CLK_MDP_RSZ3, "mdp_rsz3", "mdp_sel", 26),
+	GATE_MDP0(CLK_MDP_COLOR1, "mdp_color1", "mdp_sel", 27),
+	GATE_MDP0(CLK_MDP_TDSHP3, "mdp_tdshp3", "mdp_sel", 28),
+	GATE_MDP0(CLK_MDP_TCC3, "mdp_tcc3", "mdp_sel", 29),
+	GATE_MDP0(CLK_MDP_WROT3, "mdp_wrot3", "mdp_sel", 30),
+	GATE_MDP0(CLK_MDP_APB_BUS, "mdp_apb_bus", "mdp_sel", 31),
+	/* MDP1 */
+	GATE_MDP1(CLK_MDP_MMSYSRAM, "mdp_mmsysram", "mdp_sel", 0),
+	GATE_MDP1(CLK_MDP_APMCU_GALS, "mdp_apmcu_gals", "mdp_sel", 1),
+	GATE_MDP1(CLK_MDP_SMI0, "mdp_smi0", "mdp_sel", 4),
+	GATE_MDP1(CLK_MDP_IMG_DL_ASYNC0, "mdp_img_dl_async0", "mdp_sel", 5),
+	GATE_MDP1(CLK_MDP_IMG_DL_ASYNC1, "mdp_img_dl_async1", "mdp_sel", 6),
+	GATE_MDP1(CLK_MDP_IMG_DL_ASYNC2, "mdp_img_dl_async2", "mdp_sel", 7),
+	GATE_MDP1(CLK_MDP_SMI1, "mdp_smi1", "mdp_sel", 8),
+	GATE_MDP1(CLK_MDP_IMG_DL_ASYNC3, "mdp_img_dl_async3", "mdp_sel", 9),
+	GATE_MDP1(CLK_MDP_SMI2, "mdp_smi2", "mdp_sel", 12),
+	/* MDP2 */
+	GATE_MDP2(CLK_MDP_IMG0_IMG_DL_ASYNC0, "mdp_img0_dl_as0", "img1_sel", 0),
+	GATE_MDP2(CLK_MDP_IMG0_IMG_DL_ASYNC1, "mdp_img0_dl_as1", "img1_sel", 1),
+	GATE_MDP2(CLK_MDP_IMG1_IMG_DL_ASYNC2, "mdp_img1_dl_as2", "img2_sel", 8),
+	GATE_MDP2(CLK_MDP_IMG1_IMG_DL_ASYNC3, "mdp_img1_dl_as3", "img2_sel", 9),
+};
+
+static const struct mtk_clk_desc mdp_desc = {
+	.clks = mdp_clks,
+	.num_clks = ARRAY_SIZE(mdp_clks),
+};
+
+static const struct of_device_id of_match_clk_mt6893_mdp[] = {
+	{ .compatible = "mediatek,mt6893-mdpsys", .data = &mdp_desc },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, of_match_clk_mt6893_mdp);
+
+static struct platform_driver clk_mt6893_mdp_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt6893-mdp",
+		.of_match_table = of_match_clk_mt6893_mdp,
+	},
+};
+module_platform_driver(clk_mt6893_mdp_drv);
+
+MODULE_AUTHOR("AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>");
+MODULE_DESCRIPTION("MediaTek MT6893 Multimedia Data Path clocks driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-mt6893-mfg.c b/drivers/clk/mediatek/clk-mt6893-mfg.c
new file mode 100644
index 000000000000..37e7db835440
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt6893-mfg.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ * Copyright (c) 2025 Collabora Ltd
+ */
+
+#include <dt-bindings/clock/mediatek,mt6893-clk.h>
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+#include "clk-gate.h"
+#include "clk-mtk.h"
+
+static const struct mtk_gate_regs mfgcfg_cg_regs = {
+	.set_ofs = 0x4,
+	.clr_ofs = 0x8,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_MFG(_id, _name, _parent, _shift)				\
+	GATE_MTK_FLAGS(_id, _name, _parent, &mfgcfg_cg_regs, _shift,	\
+		       &mtk_clk_gate_ops_setclr, CLK_SET_RATE_PARENT)
+
+static const struct mtk_gate mfgcfg_clks[] = {
+	GATE_MFG(CLK_MFGCFG_BG3D, "mfgcfg_bg3d", "mfg_pll_sel", 0),
+};
+
+static const struct mtk_clk_desc mfgcfg_desc = {
+	.clks = mfgcfg_clks,
+	.num_clks = ARRAY_SIZE(mfgcfg_clks),
+};
+
+static const struct of_device_id of_match_clk_mt6893_mfgcfg[] = {
+	{ .compatible = "mediatek,mt6893-mfgcfg", .data = &mfgcfg_desc },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, of_match_clk_mt6893_mfgcfg);
+
+static struct platform_driver clk_mt6893_mfgcfg_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt6893-mfgcfg",
+		.of_match_table = of_match_clk_mt6893_mfgcfg,
+	},
+};
+
+module_platform_driver(clk_mt6893_mfgcfg_drv);
+
+MODULE_DESCRIPTION("MediaTek MT6893 GPU mfg clocks driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-mt6893-mm.c b/drivers/clk/mediatek/clk-mt6893-mm.c
new file mode 100644
index 000000000000..b41dde6f3149
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt6893-mm.c
@@ -0,0 +1,129 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2020 MediaTek Inc.
+ * Copyright (c) 2025 Collabora Ltd
+ *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+#include <dt-bindings/clock/mediatek,mt6893-clk.h>
+
+static const struct mtk_gate_regs mm0_cg_regs = {
+	.set_ofs = 0x104,
+	.clr_ofs = 0x108,
+	.sta_ofs = 0x100,
+};
+
+static const struct mtk_gate_regs mm1_cg_regs = {
+	.set_ofs = 0x114,
+	.clr_ofs = 0x118,
+	.sta_ofs = 0x110,
+};
+
+static const struct mtk_gate_regs mm2_cg_regs = {
+	.set_ofs = 0x1a4,
+	.clr_ofs = 0x1a8,
+	.sta_ofs = 0x1a0,
+};
+
+#define GATE_MM0(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &mm0_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+#define GATE_MM1(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &mm1_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+#define GATE_MM2(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &mm2_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
+static const struct mtk_gate mm_clks[] = {
+	/* MM0 */
+	GATE_MM0(CLK_MM_DISP_RSZ0, "mm_disp_rsz0", "disp_sel", 0),
+	GATE_MM0(CLK_MM_DISP_RSZ1, "mm_disp_rsz1", "disp_sel", 1),
+	GATE_MM0(CLK_MM_DISP_OVL0, "mm_disp_ovl0", "disp_sel", 2),
+	GATE_MM0(CLK_MM_INLINE, "mm_inline", "disp_sel", 3),
+	GATE_MM0(CLK_MM_MDP_TDSHP4, "mm_mdp_tdshp4", "disp_sel", 4),
+	GATE_MM0(CLK_MM_MDP_TDSHP5, "mm_mdp_tdshp5", "disp_sel", 5),
+	GATE_MM0(CLK_MM_MDP_AAL4, "mm_mdp_aal4", "disp_sel", 6),
+	GATE_MM0(CLK_MM_MDP_AAL5, "mm_mdp_aal5", "disp_sel", 7),
+	GATE_MM0(CLK_MM_MDP_HDR4, "mm_mdp_hdr4", "disp_sel", 8),
+	GATE_MM0(CLK_MM_MDP_HDR5, "mm_mdp_hdr5", "disp_sel", 9),
+	GATE_MM0(CLK_MM_MDP_RSZ4, "mm_mdp_rsz4", "disp_sel", 10),
+	GATE_MM0(CLK_MM_MDP_RSZ5, "mm_mdp_rsz5", "disp_sel", 11),
+	GATE_MM0(CLK_MM_MDP_RDMA4, "mm_mdp_rdma4", "disp_sel", 12),
+	GATE_MM0(CLK_MM_MDP_RDMA5, "mm_mdp_rdma5", "disp_sel", 13),
+	GATE_MM0(CLK_MM_DISP_FAKE_ENG0, "mm_disp_fake_eng0", "disp_sel", 14),
+	GATE_MM0(CLK_MM_DISP_FAKE_ENG1, "mm_disp_fake_eng1", "disp_sel", 15),
+	GATE_MM0(CLK_MM_DISP_OVL0_2L, "mm_disp_ovl0_2l", "disp_sel", 16),
+	GATE_MM0(CLK_MM_DISP_OVL1_2L, "mm_disp_ovl1_2l", "disp_sel", 17),
+	GATE_MM0(CLK_MM_DISP_OVL2_2L, "mm_disp_ovl2_2l", "disp_sel", 18),
+	GATE_MM0(CLK_MM_DISP_MUTEX, "mm_disp_mutex", "disp_sel", 19),
+	GATE_MM0(CLK_MM_DISP_OVL1, "mm_disp_ovl1", "disp_sel", 20),
+	GATE_MM0(CLK_MM_DISP_OVL3_2L, "mm_disp_ovl3_2l", "disp_sel", 21),
+	GATE_MM0(CLK_MM_DISP_CCORR0, "mm_disp_ccorr0", "disp_sel", 22),
+	GATE_MM0(CLK_MM_DISP_CCORR1, "mm_disp_ccorr1", "disp_sel", 23),
+	GATE_MM0(CLK_MM_DISP_COLOR0, "mm_disp_color0", "disp_sel", 24),
+	GATE_MM0(CLK_MM_DISP_COLOR1, "mm_disp_color1", "disp_sel", 25),
+	GATE_MM0(CLK_MM_DISP_POSTMASK0, "mm_disp_postmask0", "disp_sel", 26),
+	GATE_MM0(CLK_MM_DISP_POSTMASK1, "mm_disp_postmask1", "disp_sel", 27),
+	GATE_MM0(CLK_MM_DISP_DITHER0, "mm_disp_dither0", "disp_sel", 28),
+	GATE_MM0(CLK_MM_DISP_DITHER1, "mm_disp_dither1", "disp_sel", 29),
+	GATE_MM0(CLK_MM_DSI0_MM_CLK, "mm_dsi0_mm_clk", "disp_sel", 30),
+	GATE_MM0(CLK_MM_DSI1_MM_CLK, "mm_dsi1_mm_clk", "disp_sel", 31),
+	/* MM1 */
+	GATE_MM1(CLK_MM_DISP_GAMMA0, "mm_disp_gamma0", "disp_sel", 0),
+	GATE_MM1(CLK_MM_DISP_GAMMA1, "mm_disp_gamma1", "disp_sel", 1),
+	GATE_MM1(CLK_MM_DISP_AAL0, "mm_disp_aal0", "disp_sel", 2),
+	GATE_MM1(CLK_MM_DISP_AAL1, "mm_disp_aal1", "disp_sel", 3),
+	GATE_MM1(CLK_MM_DISP_WDMA0, "mm_disp_wdma0", "disp_sel", 4),
+	GATE_MM1(CLK_MM_DISP_WDMA1, "mm_disp_wdma1", "disp_sel", 5),
+	GATE_MM1(CLK_MM_DISP_UFBC_WDMA0, "mm_disp_ufbc_wdma0", "disp_sel", 6),
+	GATE_MM1(CLK_MM_DISP_UFBC_WDMA1, "mm_disp_ufbc_wdma1", "disp_sel", 7),
+	GATE_MM1(CLK_MM_DISP_RDMA0, "mm_disp_rdma0", "disp_sel", 8),
+	GATE_MM1(CLK_MM_DISP_RDMA1, "mm_disp_rdma1", "disp_sel", 9),
+	GATE_MM1(CLK_MM_DISP_RDMA4, "mm_disp_rdma4", "disp_sel", 10),
+	GATE_MM1(CLK_MM_DISP_RDMA5, "mm_disp_rdma5", "disp_sel", 11),
+	GATE_MM1(CLK_MM_DISP_DSC_WRAP, "mm_disp_dsc_wrap", "disp_sel", 12),
+	GATE_MM1(CLK_MM_DP_INTF_MM_CLK, "mm_dp_intf_mm_clk", "disp_sel", 13),
+	GATE_MM1(CLK_MM_DISP_MERGE0, "mm_disp_merge0", "disp_sel", 14),
+	GATE_MM1(CLK_MM_DISP_MERGE1, "mm_disp_merge1", "disp_sel", 15),
+	GATE_MM1(CLK_MM_SMI_COMMON, "mm_smi_common", "disp_sel", 19),
+	GATE_MM1(CLK_MM_SMI_GALS, "mm_smi_gals", "disp_sel", 23),
+	GATE_MM1(CLK_MM_SMI_INFRA, "mm_smi_infra", "disp_sel", 27),
+	GATE_MM1(CLK_MM_SMI_IOMMU, "mm_smi_iommu", "disp_sel", 31),
+	/* MM2 */
+	GATE_MM2(CLK_MM_DSI0_INTF_CLK, "mm_dsi0_intf_clk", "disp_sel", 0),
+	GATE_MM2(CLK_MM_DSI1_INTF_CLK, "mm_dsi1_intf_clk", "disp_sel", 8),
+	GATE_MM2(CLK_MM_DP_INTF_INTF_CLK, "mm_dp_intf_intf_clk", "dp_sel", 16),
+	GATE_MM2(CLK_MM_CK_26_MHZ, "mm_26_mhz", "clk26m", 24),
+	GATE_MM2(CLK_MM_CK_32_KHZ, "mm_32_khz", "clk32k", 25),
+};
+
+static const struct mtk_clk_desc mm_desc = {
+	.clks = mm_clks,
+	.num_clks = ARRAY_SIZE(mm_clks),
+};
+
+static const struct platform_device_id clk_mt6893_mm_id_table[] = {
+	{ .name = "clk-mt6893-mm", .driver_data = (kernel_ulong_t)&mm_desc },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(platform, clk_mt6893_mm_id_table);
+
+static struct platform_driver clk_mt6893_mm_drv = {
+	.probe = mtk_clk_pdev_probe,
+	.remove = mtk_clk_pdev_remove,
+	.driver = {
+		.name = "clk-mt6893-mm",
+	},
+	.id_table = clk_mt6893_mm_id_table,
+};
+module_platform_driver(clk_mt6893_mm_drv);
+
+MODULE_AUTHOR("AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>");
+MODULE_DESCRIPTION("MediaTek MT6893 MultiMedia clocks driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-mt6893-scp_adsp.c b/drivers/clk/mediatek/clk-mt6893-scp_adsp.c
new file mode 100644
index 000000000000..9a02c54c2e5b
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt6893-scp_adsp.c
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2020 MediaTek Inc.
+ * Copyright (c) 2025 Collabora Ltd
+ *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+#include <dt-bindings/clock/mediatek,mt6893-clk.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+static const struct mtk_gate_regs scp_adsp_cg_regs = {
+	.set_ofs = 0x180,
+	.clr_ofs = 0x180,
+	.sta_ofs = 0x180,
+};
+
+#define GATE_SCP_ADSP(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &scp_adsp_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr)
+
+static const struct mtk_gate scp_adsp_clks[] = {
+	GATE_SCP_ADSP(CLK_SCP_ADSP_AUDIODSP, "scp_adsp_audiodsp", "adsp_sel", 0),
+};
+
+static const struct mtk_clk_desc scp_adsp_desc = {
+	.clks = scp_adsp_clks,
+	.num_clks = ARRAY_SIZE(scp_adsp_clks),
+};
+
+static const struct of_device_id of_match_clk_mt6893_scp_adsp[] = {
+	{ .compatible = "mediatek,mt6893-scp-adsp", .data = &scp_adsp_desc },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, of_match_clk_mt6893_scp_adsp);
+
+static struct platform_driver clk_mt6893_scp_adsp_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt6893-scp_adsp",
+		.of_match_table = of_match_clk_mt6893_scp_adsp,
+	},
+};
+module_platform_driver(clk_mt6893_scp_adsp_drv);
+
+MODULE_AUTHOR("AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>");
+MODULE_DESCRIPTION("MediaTek MT6893 SCP AudioDSP clocks driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-mt6893-vdec.c b/drivers/clk/mediatek/clk-mt6893-vdec.c
new file mode 100644
index 000000000000..4816f7710d9e
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt6893-vdec.c
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2020 MediaTek Inc.
+ * Copyright (c) 2025 Collabora Ltd
+ *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+#include <dt-bindings/clock/mediatek,mt6893-clk.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+static const struct mtk_gate_regs vdec0_cg_regs = {
+	.set_ofs = 0x0,
+	.clr_ofs = 0x4,
+	.sta_ofs = 0x0,
+};
+
+static const struct mtk_gate_regs vdec1_cg_regs = {
+	.set_ofs = 0x200,
+	.clr_ofs = 0x204,
+	.sta_ofs = 0x200,
+};
+
+static const struct mtk_gate_regs vdec2_cg_regs = {
+	.set_ofs = 0x8,
+	.clr_ofs = 0xc,
+	.sta_ofs = 0x8,
+};
+
+#define GATE_VDEC0(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &vdec0_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
+
+#define GATE_VDEC1(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &vdec1_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
+
+#define GATE_VDEC2(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &vdec2_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
+
+static const struct mtk_gate vdec_clks[] = {
+	/* VDEC0 */
+	GATE_VDEC0(CLK_VDEC_VDEC, "vdec_vdec", "vdec_sel", 0),
+	GATE_VDEC0(CLK_VDEC_ACTIVE, "vdec_active", "vdec_sel", 4),
+	GATE_VDEC0(CLK_VDEC_VDEC_ENG, "vdec_vdec_eng", "vdec_sel", 8),
+	/* VDEC1 */
+	GATE_VDEC1(CLK_VDEC_LAT, "vdec_lat", "vdec_sel", 0),
+	GATE_VDEC1(CLK_VDEC_LAT_ACTIVE, "vdec_lat_active", "vdec_sel", 4),
+	GATE_VDEC1(CLK_VDEC_LAT_ENG, "vdec_lat_eng", "vdec_sel", 8),
+	/* VDEC2 */
+	GATE_VDEC2(CLK_VDEC_LARB1, "vdec_larb1", "vdec_sel", 0),
+};
+
+static const struct mtk_gate vdec_soc_clks[] = {
+	/* VDEC_SOC0 */
+	GATE_VDEC0(CLK_VDEC_SOC_VDEC, "vdec_soc_vdec", "vdec_sel", 0),
+	GATE_VDEC0(CLK_VDEC_SOC_VDEC_ACTIVE, "vdec_soc_vdec_active", "vdec_sel", 4),
+	GATE_VDEC0(CLK_VDEC_SOC_VDEC_ENG, "vdec_soc_vdec_cken_eng", "vdec_sel", 8),
+	/* VDEC_SOC1 */
+	GATE_VDEC1(CLK_VDEC_SOC_LAT, "vdec_soc_lat", "vdec_sel", 0),
+	GATE_VDEC1(CLK_VDEC_SOC_LAT_ACTIVE, "vdec_soc_lat_active", "vdec_sel", 4),
+	GATE_VDEC1(CLK_VDEC_SOC_LAT_ENG, "vdec_soc_lat_eng", "vdec_sel", 8),
+	/* VDEC_SOC2 */
+	GATE_VDEC2(CLK_VDEC_SOC_LARB1, "vdec_soc_larb1", "vdec_sel", 0),
+};
+
+static const struct mtk_clk_desc vdec_desc = {
+	.clks = vdec_clks,
+	.num_clks = ARRAY_SIZE(vdec_clks),
+};
+
+static const struct mtk_clk_desc vdec_soc_desc = {
+	.clks = vdec_soc_clks,
+	.num_clks = ARRAY_SIZE(vdec_soc_clks),
+};
+
+static const struct of_device_id of_match_clk_mt6893_vdec[] = {
+	{ .compatible = "mediatek,mt6893-vdecsys", .data = &vdec_desc },
+	{ .compatible = "mediatek,mt6893-vdecsys-soc", .data = &vdec_soc_desc },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, of_match_clk_mt6893_vdec);
+
+static struct platform_driver clk_mt6893_vdec_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt6893-vdec",
+		.of_match_table = of_match_clk_mt6893_vdec,
+	},
+};
+module_platform_driver(clk_mt6893_vdec_drv);
+
+MODULE_AUTHOR("AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>");
+MODULE_DESCRIPTION("MediaTek MT6893 Video Decoders clocks driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/clk-mt6893-venc.c b/drivers/clk/mediatek/clk-mt6893-venc.c
new file mode 100644
index 000000000000..d0e88ef3778d
--- /dev/null
+++ b/drivers/clk/mediatek/clk-mt6893-venc.c
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2020 MediaTek Inc.
+ * Copyright (c) 2025 Collabora Ltd
+ *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+#include <dt-bindings/clock/mediatek,mt6893-clk.h>
+
+#include "clk-mtk.h"
+#include "clk-gate.h"
+
+static const struct mtk_gate_regs venc_cg_regs = {
+	.set_ofs = 0x4,
+	.clr_ofs = 0x8,
+	.sta_ofs = 0x0,
+};
+
+#define GATE_VENC(_id, _name, _parent, _shift)	\
+	GATE_MTK(_id, _name, _parent, &venc_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
+
+static const struct mtk_gate venc0_clks[] = {
+	GATE_VENC(CLK_VENC0_SET0_LARB, "venc0_set0_larb", "venc_sel", 0),
+	GATE_VENC(CLK_VENC0_SET1_VENC, "venc0_set1_venc", "venc_sel", 4),
+	GATE_VENC(CLK_VENC0_SET2_JPGENC, "venc0_set2_jpgenc", "venc_sel", 8),
+	GATE_VENC(CLK_VENC0_SET3_JPGDEC, "venc0_set2_jpgdec", "venc_sel", 12),
+	GATE_VENC(CLK_VENC0_SET4_JPGDEC_C1, "venc0_set2_jpgdec_c1", "venc_sel", 16),
+	GATE_VENC(CLK_VENC0_SET5_GALS, "venc0_set5_gals", "venc_sel", 28),
+};
+
+static const struct mtk_clk_desc venc0_desc = {
+	.clks = venc0_clks,
+	.num_clks = ARRAY_SIZE(venc0_clks),
+};
+
+static const struct mtk_gate venc1_clks[] = {
+	GATE_VENC(CLK_VENC1_SET0_LARB, "venc1_set0_larb", "venc_sel", 0),
+	GATE_VENC(CLK_VENC1_SET1_VENC, "venc1_set1_venc", "venc_sel", 4),
+	GATE_VENC(CLK_VENC1_SET2_JPGENC, "venc1_set2_jpgenc", "venc_sel", 8),
+	GATE_VENC(CLK_VENC1_SET3_JPGDEC, "venc1_set2_jpgdec", "venc_sel", 12),
+	GATE_VENC(CLK_VENC1_SET4_JPGDEC_C1, "venc1_set2_jpgdec_c1", "venc_sel", 16),
+	GATE_VENC(CLK_VENC1_SET5_GALS, "venc1_set5_gals", "venc_sel", 28),
+};
+
+static const struct mtk_clk_desc venc1_desc = {
+	.clks = venc1_clks,
+	.num_clks = ARRAY_SIZE(venc1_clks),
+};
+
+static const struct of_device_id of_match_clk_mt6893_venc[] = {
+	{ .compatible = "mediatek,mt6893-vencsys-c0", .data = &venc0_desc },
+	{ .compatible = "mediatek,mt6893-vencsys-c1", .data = &venc1_desc },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, of_match_clk_mt6893_venc);
+
+static struct platform_driver clk_mt6893_venc_drv = {
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
+	.driver = {
+		.name = "clk-mt6893-venc",
+		.of_match_table = of_match_clk_mt6893_venc,
+	},
+};
+module_platform_driver(clk_mt6893_venc_drv);
+
+MODULE_AUTHOR("AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>");
+MODULE_DESCRIPTION("MediaTek MT6893 Video Encoders clocks driver");
+MODULE_LICENSE("GPL");
-- 
2.49.0

