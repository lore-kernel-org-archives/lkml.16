Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0442828C859
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 02:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747276367; cv=none; b=DPg2C/SpNV0g88cDZ5fDkObYNTtZGVrUqHZeag7APjweyDQYQLJAqT8spjnHS5Ad1fTq2RO0JOgLCnOtWofJhgUozGFRTrvmlMQX7ee51aFGtkAdVH1auimxN7QI1fnnD0UUvqVThCltrGvvk/1ttFyeM08tUypxhqDJACcXxaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747276367; c=relaxed/simple;
	bh=PL70VEBxzVJWg2rlrdYmTfDvsEGifEJirBP/LA1hqlI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jnRsND9e9ZLY1rCYCjXzDDd4qFNE7hEFnXxEfhKB8tJ+vbzGE0Jlp8BF+vEIayyAfd0tsRvw199Fsrwn5lwsjuwdDp4rEV/QLq7WP5eUoYl10A+Le03RLEgfUxZCWqHNQbBcOfW/KJPqTjKADEL1RCs3UMXuLW4+NrrnfF4PEIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.186])
	by gateway (Coremail) with SMTP id _____8BxXWtLUiVoYYnoAA--.50398S3;
	Thu, 15 May 2025 10:32:43 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.186])
	by front1 (Coremail) with SMTP id qMiowMCxbsVDUiVo1PnTAA--.19913S5;
	Thu, 15 May 2025 10:32:41 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Lee Jones <lee@kernel.org>,
	Corey Minyard <minyard@acm.org>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Chong Qiao <qiaochong@loongson.cn>
Subject: [PATCH v2 3/3] mfd: ls2kbmc: Add Loongson-2K BMC reset function support
Date: Thu, 15 May 2025 10:32:26 +0800
Message-ID: <eff0c02e30118c45463f4b6488c895bf3ec9edb9.1747276047.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1747276047.git.zhoubinbin@loongson.cn>
References: <cover.1747276047.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCxbsVDUiVo1PnTAA--.19913S5
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxKw48CF4UCF1xAw1UGw1xWFX_yoWfArWfpa
	y5AFy5tr4ktr1YvFZrJ3WUur4agrs0qa47Ka4Ig3Zaqa12y34kXFy8KF1aqF9xGFWkJr13
	X3yFkF47CF9rWagCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5
	McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr4
	1lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI
	8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4ApnDUUUU

Since the display is a sub-function of the Loongson-2K BMC, when the
BMC reset, the entire BMC PCIe is disconnected, including the display
which is interrupted.

Not only do you need to save/restore the relevant PCIe registers
throughout the reset process, but you also need to re-push the display
to the monitor at the end.

Co-developed-by: Chong Qiao <qiaochong@loongson.cn>
Signed-off-by: Chong Qiao <qiaochong@loongson.cn>
Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/mfd/ls2kbmc-mfd.c | 242 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 242 insertions(+)

diff --git a/drivers/mfd/ls2kbmc-mfd.c b/drivers/mfd/ls2kbmc-mfd.c
index b309f6132c24..4d35a13b3da5 100644
--- a/drivers/mfd/ls2kbmc-mfd.c
+++ b/drivers/mfd/ls2kbmc-mfd.c
@@ -9,8 +9,11 @@
  */
 
 #include <linux/aperture.h>
+#include <linux/delay.h>
 #include <linux/errno.h>
 #include <linux/init.h>
+#include <linux/iopoll.h>
+#include <linux/kbd_kern.h>
 #include <linux/kernel.h>
 #include <linux/mfd/core.h>
 #include <linux/module.h>
@@ -18,6 +21,8 @@
 #include <linux/pci_ids.h>
 #include <linux/platform_data/simplefb.h>
 #include <linux/platform_device.h>
+#include <linux/stop_machine.h>
+#include <linux/vt_kern.h>
 
 #define LS2K_DISPLAY_RES_START (SZ_16M + SZ_2M)
 #define LS2K_IPMI_RES_SIZE	0x1c
@@ -27,6 +32,9 @@
 #define LS2K_IPMI3_RES_START	(LS2K_IPMI2_RES_START + LS2K_IPMI_RES_SIZE)
 #define LS2K_IPMI4_RES_START	(LS2K_IPMI3_RES_START + LS2K_IPMI_RES_SIZE)
 
+#define LS2K_BMC_RESET_DELAY	(60 * HZ)
+#define LS2K_BMC_RESET_WAIT	(10 * HZ)
+
 static struct resource ls2k_display_resources[] = {
 	DEFINE_RES_MEM_NAMED(LS2K_DISPLAY_RES_START, SZ_4M, "simpledrm-res"),
 };
@@ -60,6 +68,227 @@ static struct mfd_cell ls2k_bmc_cells[] = {
 	MFD_CELL_RES("ls2k-ipmi-si", ls2k_ipmi4_resources),
 };
 
+static const u32 index[] = { 0x4, 0x10, 0x14, 0x18, 0x1c, 0x20, 0x24,
+			     0x30, 0x3c, 0x54, 0x58, 0x78, 0x7c, 0x80 };
+static const u32 cindex[] = { 0x4, 0x10, 0x3c };
+
+struct ls2k_bmc_pci_data {
+	u32 d80c;
+	u32 d71c;
+	u32 data[14];
+	u32 cdata[3];
+};
+
+struct ls2k_bmc_pdata {
+	struct device *dev;
+	struct work_struct reset_work;
+	unsigned long reset_time;
+	struct ls2k_bmc_pci_data pci_data;
+};
+
+static bool ls2k_bmc_bar0_addr_is_set(struct pci_dev *ppdev)
+{
+	u32 addr;
+
+	pci_read_config_dword(ppdev, PCI_BASE_ADDRESS_0, &addr);
+	addr &= PCI_BASE_ADDRESS_MEM_MASK;
+
+	return addr ? true : false;
+}
+
+static bool ls2k_bmc_check_pcie_connected(struct pci_dev *parent,
+					  struct ls2k_bmc_pdata *priv)
+{
+	void __iomem *mmio;
+	int sts, ret;
+
+	mmio = pci_iomap(parent, 0, 0x100);
+	if (!mmio)
+		return false;
+
+	writel(readl(mmio) | 0x8, mmio);
+
+	ret = readl_poll_timeout_atomic(mmio + 0xc, sts, (sts & 0x11) == 0x11,
+					1000, 1000000);
+	if (ret) {
+		pci_iounmap(parent, mmio);
+		dev_err(priv->dev, "PCIE train failed status=0x%x\n", sts);
+		return false;
+	}
+
+	pci_iounmap(parent, mmio);
+	return true;
+}
+
+static int ls2k_bmc_recover_pci_data(void *data)
+{
+	struct ls2k_bmc_pdata *priv = data;
+	struct pci_dev *pdev = to_pci_dev(priv->dev);
+	struct pci_dev *parent = pdev->bus->self;
+	bool ready, dirty;
+	u32 i;
+
+	pci_write_config_dword(parent, PCI_BASE_ADDRESS_2, 0);
+	pci_write_config_dword(parent, PCI_BASE_ADDRESS_3, 0);
+	pci_write_config_dword(parent, PCI_BASE_ADDRESS_4, 0);
+
+	for (i = 2000; i > 0 ; i--) {
+		dirty = ls2k_bmc_bar0_addr_is_set(parent);
+		if (!dirty)
+			break;
+		mdelay(1);
+	};
+
+	if (i == 0)
+		dev_warn(priv->dev, "The PCI Bar is not cleared.\n");
+
+	for (i = 0; i < ARRAY_SIZE(index); i++)
+		pci_write_config_dword(parent, index[i], priv->pci_data.data[i]);
+
+	pci_write_config_dword(parent, 0x80c, priv->pci_data.d80c);
+	pci_write_config_dword(parent, 0x71c, priv->pci_data.d71c);
+
+	/* Check if the pcie is connected */
+	ready = ls2k_bmc_check_pcie_connected(parent, priv);
+	if (!ready)
+		return ready;
+
+	dev_dbg(priv->dev, "The PCIE recovered done.\n");
+
+	/* Waiting for u-boot ddr config ready */
+	mdelay(jiffies_to_msecs(LS2K_BMC_RESET_WAIT));
+	ready = ls2k_bmc_bar0_addr_is_set(parent);
+	if (!ready)
+		return ready;
+
+	for (i = 0; i < ARRAY_SIZE(cindex); i++)
+		pci_write_config_dword(pdev, cindex[i], priv->pci_data.cdata[i]);
+
+	return 0;
+}
+
+static void ls2k_bmc_events_fn(struct work_struct *work)
+{
+	struct ls2k_bmc_pdata *priv = container_of(work, struct ls2k_bmc_pdata, reset_work);
+
+	/*
+	 * The pcie is lost when the BMC resets,
+	 * at which point access to the pcie from other CPUs
+	 * is suspended to prevent a crash.
+	 */
+	stop_machine(ls2k_bmc_recover_pci_data, priv, NULL);
+
+#ifdef CONFIG_VT
+	/* Re-push the display due to previous pcie loss. */
+	set_console(vt_move_to_console(MAX_NR_CONSOLES - 1, 1));
+#endif
+
+	dev_info(priv->dev, "Loongson-2K BMC recovered done.\n");
+}
+
+static irqreturn_t ls2k_bmc_interrupt(int irq, void *arg)
+{
+	struct ls2k_bmc_pdata *priv = arg;
+
+	if (system_state != SYSTEM_RUNNING)
+		return IRQ_HANDLED;
+
+	/* Skip interrupt in LS2K_BMC_RESET_DELAY */
+	if (time_after(jiffies, priv->reset_time + LS2K_BMC_RESET_DELAY))
+		schedule_work(&priv->reset_work);
+
+	priv->reset_time = jiffies;
+
+	return IRQ_HANDLED;
+}
+
+#define BMC_RESET_GPIO			14
+#define LOONGSON_GPIO_REG_BASE		0x1fe00500
+#define LOONGSON_GPIO_REG_SIZE		0x18
+#define LOONGSON_GPIO_OEN		0x0
+#define LOONGSON_GPIO_FUNC		0x4
+#define LOONGSON_GPIO_INTPOL		0x10
+#define LOONGSON_GPIO_INTEN		0x14
+
+/* The gpio interrupt is a watchdog interrupt that is triggered when the BMC resets. */
+static int ls2k_bmc_gpio_reset_handler(struct ls2k_bmc_pdata *priv)
+{
+	int gsi = 16 + (BMC_RESET_GPIO & 7);
+	void __iomem *gpio_base;
+	int irq, ret = 0;
+
+	/* Since Loongson-3A hardware does not support GPIO interrupt cascade,
+	 * chip->gpio_to_irq() cannot be implemented,
+	 * here acpi_register_gsi() is used to get gpio irq.
+	 */
+	irq = acpi_register_gsi(NULL, gsi, ACPI_EDGE_SENSITIVE, ACPI_ACTIVE_LOW);
+	if (irq < 0)
+		return irq;
+
+	gpio_base = ioremap(LOONGSON_GPIO_REG_BASE, LOONGSON_GPIO_REG_SIZE);
+	if (!gpio_base) {
+		ret = PTR_ERR(gpio_base);
+		goto acpi_failed;
+	}
+
+	writel(readl(gpio_base + LOONGSON_GPIO_OEN) | BIT(BMC_RESET_GPIO),
+	       gpio_base + LOONGSON_GPIO_OEN);
+	writel(readl(gpio_base + LOONGSON_GPIO_FUNC) & ~BIT(BMC_RESET_GPIO),
+	       gpio_base + LOONGSON_GPIO_FUNC);
+	writel(readl(gpio_base + LOONGSON_GPIO_INTPOL) & ~BIT(BMC_RESET_GPIO),
+	       gpio_base + LOONGSON_GPIO_INTPOL);
+	writel(readl(gpio_base + LOONGSON_GPIO_INTEN) | BIT(BMC_RESET_GPIO),
+	       gpio_base + LOONGSON_GPIO_INTEN);
+
+	ret = devm_request_irq(priv->dev, irq, ls2k_bmc_interrupt,
+			       IRQF_SHARED | IRQF_TRIGGER_FALLING, "ls2kbmc gpio", priv);
+	if (ret)
+		dev_err(priv->dev, "ls2kbmc gpio request_irq(%d) failed\n", irq);
+
+	iounmap(gpio_base);
+
+acpi_failed:
+	acpi_unregister_gsi(gsi);
+
+	return ret;
+}
+
+static void ls2k_bmc_save_pci_data(struct pci_dev *pdev, struct ls2k_bmc_pdata *priv)
+{
+	struct pci_dev *parent = pdev->bus->self;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(index); i++)
+		pci_read_config_dword(parent, index[i], &priv->pci_data.data[i]);
+
+	for (i = 0; i < ARRAY_SIZE(cindex); i++)
+		pci_read_config_dword(pdev, cindex[i], &priv->pci_data.cdata[i]);
+
+	pci_read_config_dword(parent, 0x80c, &priv->pci_data.d80c);
+	priv->pci_data.d80c = (priv->pci_data.d80c & ~(3 << 17)) | BIT(17);
+
+	pci_read_config_dword(parent, 0x71c, &priv->pci_data.d71c);
+	priv->pci_data.d71c |= BIT(26);
+}
+
+static int ls2k_bmc_pdata_initial(struct pci_dev *pdev, struct ls2k_bmc_pdata *priv)
+{
+	int ret;
+
+	ls2k_bmc_save_pci_data(pdev, priv);
+
+	INIT_WORK(&priv->reset_work, ls2k_bmc_events_fn);
+
+	ret = devm_request_irq(&pdev->dev, pdev->irq, ls2k_bmc_interrupt,
+			       IRQF_SHARED | IRQF_TRIGGER_FALLING, "ls2kbmc pcie", priv);
+	if (ret) {
+		dev_err(priv->dev, "ls2kbmc pcie request_irq(%d) failed\n", pdev->irq);
+		return ret;
+	}
+
+	return ls2k_bmc_gpio_reset_handler(priv);
+}
+
 /*
  * Currently the Loongson-2K0500 BMC hardware does not have an i2c interface to
  * adapt to the resolution.
@@ -101,12 +330,25 @@ static int ls2k_bmc_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
 	int ret = 0;
 	resource_size_t base;
+	struct ls2k_bmc_pdata *priv;
 	struct simplefb_platform_data pd;
 
 	ret = pci_enable_device(dev);
 	if (ret)
 		return ret;
 
+	priv = devm_kzalloc(&dev->dev, sizeof(*priv), GFP_KERNEL);
+	if (IS_ERR(priv)) {
+		ret = -ENOMEM;
+		goto disable_pci;
+	}
+
+	priv->dev = &dev->dev;
+
+	ret = ls2k_bmc_pdata_initial(dev, priv);
+	if (ret)
+		goto disable_pci;
+
 	ret = ls2k_bmc_get_video_mode(dev, &pd);
 	if (ret)
 		goto disable_pci;
-- 
2.47.1

