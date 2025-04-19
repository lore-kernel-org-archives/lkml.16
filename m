Received: from sender3-op-o16.zoho.com (sender3-op-o16.zoho.com [136.143.184.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4266E1DF256;
	Sat, 19 Apr 2025 17:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745082658; cv=pass; b=FNFBtiyHrBy4MT8/nZcrjeK7xUyu5MIWYhKT5eA+7wj7/DH1e+hTDHIkuIpZuA9VO5dHbYb4K5yF7+jh4FiiA4Lv4z8TOmaRKJl45o2YfAhWySJ0/7zLzyrgGadJDMt57A1fqRK6JH/UAkrGVJlZnfun5UE1A5D95QuHelIHN84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745082658; c=relaxed/simple;
	bh=IXcNKCatrHhTiqbJ0SwW7TrfDdv/86SxWEW4C3QNSBY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cd+/zltCr/vNmWSnOS1RDMo+AVK6hdP2Sq+B5+D0ZVtuKOnqap1yQ5P16bTmhApVCx3nRGIqVWIKnC/h0HcgCqwBGbouCJbdAEAZt4eTJrKzqtagtGYNK6YUnU6qfSpiW5v/O1Sr60tCMkhrz8Bz1xSfnAZNo7P03hQNCVZbcwo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=i0y64G6O; arc=pass smtp.client-ip=136.143.184.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="i0y64G6O"
ARC-Seal: i=1; a=rsa-sha256; t=1745082638; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EBwDctke/BB3WJSW0NfUWl8LZ1KFv10ivICU2hr6w+/ACWnBY++wvxjWpEYZc88zKFx7vBNHTXtl/91d9I1mLQiIcitlxgSrAHhJGt244j0meOlvvBkaq5bISr2dijfgyzqYffLZAXg3xz8yX37E+98hwqmA0yvYZ3SBt1nxfYc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745082638; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=z6lbpBwuT8dpWkOtT1bf+/GXQeO+N6nZNuynlhhf5xI=; 
	b=TNrOOMcEfUyvMI+xMOCl2Z4S2kDn0rpgHzynyKSZFsKDuI/nUb6Ud5258Taq89qbt49QoxoBrB9t3+gypn/4axVdFbp2gmRO5rAIXdNGJDbVI6oA2IL5xUqnCXTp4AWBha9MCyPWGZbL3aRtQweWhuYujJxReamtTuxvMHvFSH4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745082638;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=z6lbpBwuT8dpWkOtT1bf+/GXQeO+N6nZNuynlhhf5xI=;
	b=i0y64G6OsY6a68HixkWUnidNVX2N5lz0/SCcsy8n5FUFlTLcKGr2vtLGGcBbZeQ4
	7AB/BCx8KlMzDgWAZCALki/1rAL24Yt02Db4iCG2BieRM3jWtmKUxpRrbhZxlm/WQKX
	q5+nT/K5Llct4f+AaGrJjpGYWGlo7kdxQr8Q7rUU=
Received: by mx.zohomail.com with SMTPS id 1745082636652767.5095650284132;
	Sat, 19 Apr 2025 10:10:36 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Sun, 20 Apr 2025 01:09:45 +0800
Subject: [PATCH v2 2/2] reset: canaan: add reset driver for Kendryte K230
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-k230-reset-v2-2-f1b4a016e438@pigmoral.tech>
References: <20250420-k230-reset-v2-0-f1b4a016e438@pigmoral.tech>
In-Reply-To: <20250420-k230-reset-v2-0-f1b4a016e438@pigmoral.tech>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Junhui Liu <junhui.liu@pigmoral.tech>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745082602; l=15740;
 i=junhui.liu@pigmoral.tech; s=20250223; h=from:subject:message-id;
 bh=IXcNKCatrHhTiqbJ0SwW7TrfDdv/86SxWEW4C3QNSBY=;
 b=Idb+EnWqgKYbdZ5Aqpq7HxIhuq1rfF5aICVukcL31uQ1Xab1QbPcby7ElqVBHdWrUzjEEJ4c4
 kPFwJqUj805DOwm+Af35i51KtgwRO7pdHFWqc0N22Id2yAhk2BcDa4o
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=ZRZkOjG47iI+To+oAo2R4KIpMwtz8r0TffJ5/nO2tcg=
X-ZohoMailClient: External

Add support for the resets on Canaan Kendryte K230 SoC. The driver
support CPU0, CPU1, L2 cache flush, hardware auto clear and software
clear resets.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>

---
The reset management module in the K230 SoC also provides reset time
control registers. For RST_TYPE_CPU0, RST_TYPE_CPU1 and RST_TYPE_SW_DONE,
the time period when reset is applyed/removed but the clock is stopped
can be set up to 15*0.25 = 3.75 us. For some RST_TYPE_HW_DONE cases, the
time period can be set up to 255*0.25 = 63.75 us. For RST_TYPE_FLUSH,
the reset bit will automatically cleared by hardware when flush done.

Although the current reset driver does not support configuration of
reset time registers, delay has been added to the assert, deassert and
reset functions to accommodate the longest reset time.

Besides, although some reset types have done bits, the reference manual
does not explicitly indicate whether the hardware removes reset or the
clock stop time period has passed when done bits toggle. Therefore, I
think it is a safer way to keep delay for reset types with done bits.

link: https://kendryte-download.canaan-creative.com/developer/k230/HDK/K230%E7%A1%AC%E4%BB%B6%E6%96%87%E6%A1%A3/K230_Technical_Reference_Manual_V0.3.1_20241118.pdf
---
 drivers/reset/Kconfig      |   9 ++
 drivers/reset/Makefile     |   1 +
 drivers/reset/reset-k230.c | 355 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 365 insertions(+)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 99f6f9784e6865faddf8621ccfca095778c4dc47..248138ffba3bfbf859c74ba1aed7ba2f72819f7a 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -140,6 +140,15 @@ config RESET_K210
 	  Say Y if you want to control reset signals provided by this
 	  controller.
 
+config RESET_K230
+	tristate "Reset controller driver for Canaan Kendryte K230 SoC"
+	depends on ARCH_CANAAN || COMPILE_TEST
+	depends on OF
+	help
+	  Support for the Canaan Kendryte K230 RISC-V SoC reset controller.
+	  Say Y if you want to control reset signals provided by this
+	  controller.
+
 config RESET_LANTIQ
 	bool "Lantiq XWAY Reset Driver" if COMPILE_TEST
 	default SOC_TYPE_XWAY
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 31f9904d13f9c3a107fc1ee1ec9f9baba016d101..13fe94531bea1eb91268b1804e1321b167815a4b 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -20,6 +20,7 @@ obj-$(CONFIG_RESET_IMX7) += reset-imx7.o
 obj-$(CONFIG_RESET_IMX8MP_AUDIOMIX) += reset-imx8mp-audiomix.o
 obj-$(CONFIG_RESET_INTEL_GW) += reset-intel-gw.o
 obj-$(CONFIG_RESET_K210) += reset-k210.o
+obj-$(CONFIG_RESET_K230) += reset-k230.o
 obj-$(CONFIG_RESET_LANTIQ) += reset-lantiq.o
 obj-$(CONFIG_RESET_LPC18XX) += reset-lpc18xx.o
 obj-$(CONFIG_RESET_MCHP_SPARX5) += reset-microchip-sparx5.o
diff --git a/drivers/reset/reset-k230.c b/drivers/reset/reset-k230.c
new file mode 100644
index 0000000000000000000000000000000000000000..492d2274893675b0ff1967426c8fa9e75aed1791
--- /dev/null
+++ b/drivers/reset/reset-k230.c
@@ -0,0 +1,355 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2016-2017 Linaro Ltd.
+ * Copyright (C) 2022-2024 Canaan Bright Sight Co., Ltd
+ * Copyright (C) 2024-2025 Junhui Liu <junhui.liu@pigmoral.tech>
+ */
+
+#include <linux/cleanup.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/reset-controller.h>
+#include <linux/spinlock.h>
+
+#include <dt-bindings/reset/canaan,k230-rst.h>
+
+/**
+ * enum k230_rst_type - K230 reset types
+ * @RST_TYPE_CPU0: Reset type for CPU0
+ *	Automatically clears, has write enable and done bit, active high
+ * @RST_TYPE_CPU1: Reset type for CPU1
+ *	Manually clears, has write enable and done bit, active high
+ * @RST_TYPE_FLUSH: Reset type for CPU L2 cache flush
+ *	Automatically clears, has write enable, no done bit, active high
+ * @RST_TYPE_HW_DONE: Reset type for hardware auto clear
+ *	Automatically clears, no write enable, has done bit, active high
+ * @RST_TYPE_SW_DONE: Reset type for software manual clear
+ *	Manually clears, no write enable and done bit,
+ *	active high if ID is RST_SPI2AXI, otherwise active low
+ */
+enum k230_rst_type {
+	RST_TYPE_CPU0,
+	RST_TYPE_CPU1,
+	RST_TYPE_FLUSH,
+	RST_TYPE_HW_DONE,
+	RST_TYPE_SW_DONE,
+};
+
+struct k230_rst_map {
+	u32			offset;
+	enum k230_rst_type	type;
+	u32			done;
+	u32			reset;
+};
+
+struct k230_rst {
+	struct reset_controller_dev	rcdev;
+	struct device			*dev;
+	void __iomem			*base;
+	spinlock_t			lock;
+};
+
+static const struct k230_rst_map k230_resets[] = {
+	[RST_CPU0]		= { 0x4,  RST_TYPE_CPU0,    BIT(12), BIT(0) },
+	[RST_CPU1]		= { 0xc,  RST_TYPE_CPU1,    BIT(12), BIT(0) },
+	[RST_CPU0_FLUSH]	= { 0x4,  RST_TYPE_FLUSH,   0,       BIT(4) },
+	[RST_CPU1_FLUSH]	= { 0xc,  RST_TYPE_FLUSH,   0,       BIT(4) },
+	[RST_AI]		= { 0x14, RST_TYPE_HW_DONE, BIT(31), BIT(0) },
+	[RST_VPU]		= { 0x1c, RST_TYPE_HW_DONE, BIT(31), BIT(0) },
+	[RST_HS]		= { 0x2c, RST_TYPE_HW_DONE, BIT(4),  BIT(0) },
+	[RST_HS_AHB]		= { 0x2c, RST_TYPE_HW_DONE, BIT(5),  BIT(1) },
+	[RST_SDIO0]		= { 0x34, RST_TYPE_HW_DONE, BIT(28), BIT(0) },
+	[RST_SDIO1]		= { 0x34, RST_TYPE_HW_DONE, BIT(29), BIT(1) },
+	[RST_SDIO_AXI]		= { 0x34, RST_TYPE_HW_DONE, BIT(30), BIT(2) },
+	[RST_USB0]		= { 0x3c, RST_TYPE_HW_DONE, BIT(28), BIT(0) },
+	[RST_USB1]		= { 0x3c, RST_TYPE_HW_DONE, BIT(29), BIT(1) },
+	[RST_USB0_AHB]		= { 0x3c, RST_TYPE_HW_DONE, BIT(30), BIT(0) },
+	[RST_USB1_AHB]		= { 0x3c, RST_TYPE_HW_DONE, BIT(31), BIT(1) },
+	[RST_SPI0]		= { 0x44, RST_TYPE_HW_DONE, BIT(28), BIT(0) },
+	[RST_SPI1]		= { 0x44, RST_TYPE_HW_DONE, BIT(29), BIT(1) },
+	[RST_SPI2]		= { 0x44, RST_TYPE_HW_DONE, BIT(30), BIT(2) },
+	[RST_SEC]		= { 0x4c, RST_TYPE_HW_DONE, BIT(31), BIT(0) },
+	[RST_PDMA]		= { 0x54, RST_TYPE_HW_DONE, BIT(28), BIT(0) },
+	[RST_SDMA]		= { 0x54, RST_TYPE_HW_DONE, BIT(29), BIT(1) },
+	[RST_DECOMPRESS]	= { 0x5c, RST_TYPE_HW_DONE, BIT(31), BIT(0) },
+	[RST_SRAM]		= { 0x64, RST_TYPE_HW_DONE, BIT(28), BIT(0) },
+	[RST_SHRM_AXIM]		= { 0x64, RST_TYPE_HW_DONE, BIT(30), BIT(2) },
+	[RST_SHRM_AXIS]		= { 0x64, RST_TYPE_HW_DONE, BIT(31), BIT(3) },
+	[RST_NONAI2D]		= { 0x6c, RST_TYPE_HW_DONE, BIT(31), BIT(0) },
+	[RST_MCTL]		= { 0x74, RST_TYPE_HW_DONE, BIT(31), BIT(0) },
+	[RST_ISP]		= { 0x80, RST_TYPE_HW_DONE, BIT(29), BIT(6) },
+	[RST_ISP_DW]		= { 0x80, RST_TYPE_HW_DONE, BIT(28), BIT(5) },
+	[RST_DPU]		= { 0x88, RST_TYPE_HW_DONE, BIT(31), BIT(0) },
+	[RST_DISP]		= { 0x90, RST_TYPE_HW_DONE, BIT(31), BIT(0) },
+	[RST_GPU]		= { 0x98, RST_TYPE_HW_DONE, BIT(31), BIT(0) },
+	[RST_AUDIO]		= { 0xa4, RST_TYPE_HW_DONE, BIT(31), BIT(0) },
+	[RST_TIMER0]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(0) },
+	[RST_TIMER1]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(1) },
+	[RST_TIMER2]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(2) },
+	[RST_TIMER3]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(3) },
+	[RST_TIMER4]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(4) },
+	[RST_TIMER5]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(5) },
+	[RST_TIMER_APB]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(6) },
+	[RST_HDI]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(7) },
+	[RST_WDT0]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(12) },
+	[RST_WDT1]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(13) },
+	[RST_WDT0_APB]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(14) },
+	[RST_WDT1_APB]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(15) },
+	[RST_TS_APB]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(16) },
+	[RST_MAILBOX]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(17) },
+	[RST_STC]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(18) },
+	[RST_PMU]		= { 0x20, RST_TYPE_SW_DONE, 0,       BIT(19) },
+	[RST_LS_APB]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(0) },
+	[RST_UART0]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(1) },
+	[RST_UART1]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(2) },
+	[RST_UART2]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(3) },
+	[RST_UART3]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(4) },
+	[RST_UART4]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(5) },
+	[RST_I2C0]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(6) },
+	[RST_I2C1]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(7) },
+	[RST_I2C2]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(8) },
+	[RST_I2C3]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(9) },
+	[RST_I2C4]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(10) },
+	[RST_JAMLINK0_APB]	= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(11) },
+	[RST_JAMLINK1_APB]	= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(12) },
+	[RST_JAMLINK2_APB]	= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(13) },
+	[RST_JAMLINK3_APB]	= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(14) },
+	[RST_CODEC_APB]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(17) },
+	[RST_GPIO_DB]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(18) },
+	[RST_GPIO_APB]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(19) },
+	[RST_ADC]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(20) },
+	[RST_ADC_APB]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(21) },
+	[RST_PWM_APB]		= { 0x24, RST_TYPE_SW_DONE, 0,       BIT(22) },
+	[RST_SHRM_APB]		= { 0x64, RST_TYPE_SW_DONE, 0,       BIT(1) },
+	[RST_CSI0]		= { 0x80, RST_TYPE_SW_DONE, 0,       BIT(0) },
+	[RST_CSI1]		= { 0x80, RST_TYPE_SW_DONE, 0,       BIT(1) },
+	[RST_CSI2]		= { 0x80, RST_TYPE_SW_DONE, 0,       BIT(2) },
+	[RST_CSI_DPHY]		= { 0x80, RST_TYPE_SW_DONE, 0,       BIT(3) },
+	[RST_ISP_AHB]		= { 0x80, RST_TYPE_SW_DONE, 0,       BIT(4) },
+	[RST_M0]		= { 0x80, RST_TYPE_SW_DONE, 0,       BIT(7) },
+	[RST_M1]		= { 0x80, RST_TYPE_SW_DONE, 0,       BIT(8) },
+	[RST_M2]		= { 0x80, RST_TYPE_SW_DONE, 0,       BIT(9) },
+	[RST_SPI2AXI]		= { 0xa8, RST_TYPE_SW_DONE, 0,       BIT(0) }
+};
+
+static inline struct k230_rst *to_k230_rst(struct reset_controller_dev *rcdev)
+{
+	return container_of(rcdev, struct k230_rst, rcdev);
+}
+
+static void k230_rst_clear_done(struct k230_rst *rstc, unsigned long id,
+				bool write_en)
+{
+	const struct k230_rst_map *rmap = &k230_resets[id];
+	u32 reg;
+
+	guard(spinlock_irqsave)(&rstc->lock);
+
+	reg = readl(rstc->base + rmap->offset);
+	reg |= rmap->done; /* write 1 to clear */
+	if (write_en)
+		reg |= rmap->done << 16;
+	writel(reg, rstc->base + rmap->offset);
+}
+
+static int k230_rst_wait_and_clear_done(struct k230_rst *rstc, unsigned long id,
+					bool write_en)
+{
+	const struct k230_rst_map *rmap = &k230_resets[id];
+	u32 reg;
+	int ret;
+
+	ret = readl_poll_timeout(rstc->base + rmap->offset, reg,
+				 reg & rmap->done, 10, 1000);
+	if (ret) {
+		dev_err(rstc->dev, "Wait for reset done timeout\n");
+		return ret;
+	}
+
+	k230_rst_clear_done(rstc, id, write_en);
+
+	return 0;
+}
+
+static void k230_rst_update(struct k230_rst *rstc, unsigned long id,
+			    bool assert, bool write_en, bool active_low)
+{
+	const struct k230_rst_map *rmap = &k230_resets[id];
+	u32 reg;
+
+	guard(spinlock_irqsave)(&rstc->lock);
+
+	reg = readl(rstc->base + rmap->offset);
+	if (assert ^ active_low)
+		reg |= rmap->reset;
+	else
+		reg &= ~rmap->reset;
+	if (write_en)
+		reg |= rmap->reset << 16;
+	writel(reg, rstc->base + rmap->offset);
+}
+
+static int k230_rst_assert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	struct k230_rst *rstc = to_k230_rst(rcdev);
+
+	switch (k230_resets[id].type) {
+	case RST_TYPE_CPU1:
+		k230_rst_update(rstc, id, true, true, false);
+		break;
+	case RST_TYPE_SW_DONE:
+		k230_rst_update(rstc, id, true, false,
+				id == RST_SPI2AXI ? false : true);
+		break;
+	case RST_TYPE_CPU0:
+	case RST_TYPE_FLUSH:
+	case RST_TYPE_HW_DONE:
+		return -EOPNOTSUPP;
+	}
+
+	/*
+	 * The time period when reset is applied but the clock is stopped for
+	 * RST_TYPE_CPU1 and RST_TYPE_SW_DONE can be set up to 3.75us. Delay
+	 * 10us to ensure proper reset timing.
+	 */
+	udelay(10);
+
+	return 0;
+}
+
+static int k230_rst_deassert(struct reset_controller_dev *rcdev,
+			     unsigned long id)
+{
+	struct k230_rst *rstc = to_k230_rst(rcdev);
+	int ret = 0;
+
+	switch (k230_resets[id].type) {
+	case RST_TYPE_CPU1:
+		k230_rst_update(rstc, id, false, true, false);
+		ret = k230_rst_wait_and_clear_done(rstc, id, true);
+		break;
+	case RST_TYPE_SW_DONE:
+		k230_rst_update(rstc, id, false, false,
+				id == RST_SPI2AXI ? false : true);
+		break;
+	case RST_TYPE_CPU0:
+	case RST_TYPE_FLUSH:
+	case RST_TYPE_HW_DONE:
+		return -EOPNOTSUPP;
+	}
+
+	/*
+	 * The time period when reset is removed but the clock is stopped for
+	 * RST_TYPE_CPU1 and RST_TYPE_SW_DONE can be set up to 3.75us. Delay
+	 * 10us to ensure proper reset timing.
+	 */
+	udelay(10);
+
+	return ret;
+}
+
+static int k230_rst_reset(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	struct k230_rst *rstc = to_k230_rst(rcdev);
+	const struct k230_rst_map *rmap = &k230_resets[id];
+	u32 reg;
+	int ret = 0;
+
+	switch (rmap->type) {
+	case RST_TYPE_CPU0:
+		k230_rst_clear_done(rstc, id, true);
+		k230_rst_update(rstc, id, true, true, false);
+		ret = k230_rst_wait_and_clear_done(rstc, id, true);
+
+		/*
+		 * The time period when reset is applied and removed but the
+		 * clock is stopped for RST_TYPE_CPU0 can be set up to 7.5us.
+		 * Delay 10us to ensure proper reset timing.
+		 */
+		udelay(10);
+
+		break;
+	case RST_TYPE_FLUSH:
+		k230_rst_update(rstc, id, true, true, false);
+
+		/* Wait flush request bit auto cleared by hardware */
+		ret = readl_poll_timeout(rstc->base + rmap->offset, reg,
+					!(reg & rmap->reset), 10, 1000);
+		if (ret)
+			dev_err(rstc->dev, "Wait for flush done timeout\n");
+
+		break;
+	case RST_TYPE_HW_DONE:
+		k230_rst_clear_done(rstc, id, false);
+		k230_rst_update(rstc, id, true, false, false);
+		ret = k230_rst_wait_and_clear_done(rstc, id, false);
+
+		/*
+		 * The time period when reset is applied and removed but the
+		 * clock is stopped for RST_TYPE_HW_DONE can be set up to
+		 * 127.5us. Delay 200us to ensure proper reset timing.
+		 */
+		udelay(200);
+
+		break;
+	case RST_TYPE_CPU1:
+	case RST_TYPE_SW_DONE:
+		k230_rst_assert(rcdev, id);
+		ret = k230_rst_deassert(rcdev, id);
+		break;
+	}
+
+	return ret;
+}
+
+static const struct reset_control_ops k230_rst_ops = {
+	.reset		= k230_rst_reset,
+	.assert		= k230_rst_assert,
+	.deassert	= k230_rst_deassert,
+};
+
+static int k230_rst_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct k230_rst *rstc;
+
+	rstc = devm_kzalloc(dev, sizeof(*rstc), GFP_KERNEL);
+	if (!rstc)
+		return -ENOMEM;
+
+	rstc->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(rstc->base))
+		return PTR_ERR(rstc->base);
+
+	spin_lock_init(&rstc->lock);
+
+	rstc->dev		= dev;
+	rstc->rcdev.owner	= THIS_MODULE;
+	rstc->rcdev.ops		= &k230_rst_ops;
+	rstc->rcdev.nr_resets	= ARRAY_SIZE(k230_resets);
+	rstc->rcdev.of_node	= dev->of_node;
+
+	return devm_reset_controller_register(dev, &rstc->rcdev);
+}
+
+static const struct of_device_id k230_rst_match[] = {
+	{ .compatible = "canaan,k230-rst", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, k230_rst_match);
+
+static struct platform_driver k230_rst_driver = {
+	.probe = k230_rst_probe,
+	.driver = {
+		.name = "k230-rst",
+		.of_match_table = k230_rst_match,
+	}
+};
+module_platform_driver(k230_rst_driver);
+
+MODULE_AUTHOR("Junhui Liu <junhui.liu@pigmoral.tech>");
+MODULE_DESCRIPTION("Canaan K230 reset driver");
+MODULE_LICENSE("GPL");

-- 
2.49.0

