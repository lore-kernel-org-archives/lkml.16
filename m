Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85F926B2CA;
	Mon, 28 Apr 2025 12:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745844091; cv=pass; b=nQjDIYi9XubGFVnflIloLlplm4gHt8mMzcHvxNRO44B8IWtS2duM9bND3ac7Axc3xOHTnNPfb4rSzzWZz/B+mAspBiUT7TVDdOlcnD4dvCzNbqI3gTpOR0/dqIDlsTJCJaj4xWSDJKGKh+InPJ95k6S3luWSkHSfZpaj7c141AQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745844091; c=relaxed/simple;
	bh=U9UFlmHZeiS+KUsdbzQ0unOl01pl8YMI8AlCF7puW4Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ePchXG3PFI3zEsxZG4x5PlchjSnO16niOQi4r+c6LdkCgEFmBFqF2lrQNGirEMHaik8DQXYteE5tjJCdmuW+B/O8FWf5kyH3ByO0WYjOTiAOI7GzxphI8NVfpgiM1E6UZhmFpqVIHF4s1BRb173GMji2IVpT1v3iBf86LUbLYOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=gRdawnH3; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="gRdawnH3"
ARC-Seal: i=1; a=rsa-sha256; t=1745844062; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GBoldrKMDj733oTqKS1hlyAFbtitZ71eQATg7zXl0YQR6nWzSz6nUVY7Oc7fAbLQ3AUSAWyTN+hfJ4CpHtrgklryzd3g3hFc1KFsx9OgjcWie1q5yQvWwzWChpE8hW01WR++hXDppZYagaKBpGroF4whA1ZcVkl+z3eVWMxshFw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745844062; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=LwU7gex0UJ1teZN3gOvMhmes4l80hzx46Q/azM5ECmU=; 
	b=JUO4jq7fxeGTgG0TKjZBkZ48wluN09bk0yrvNF+JGTtrOoFM8pMKI+vtefcYBCak5NglR/6L6DCIw1xjBGKVJnc2DC2tVmFETFKv3+QA6m3IcqHD8BV2GeRS71CpiqZSo5Apo3BtpkySdiTyWFQYrHyTuyLsZLoQxSk4dHiWlIk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745844062;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=LwU7gex0UJ1teZN3gOvMhmes4l80hzx46Q/azM5ECmU=;
	b=gRdawnH3IE+hCz4MGBTQyNUNJo6Dyr4Msd6em7uVxiE7ymAjdQFn+enqCdue7rzM
	P9XWrSQS0DCtATEXdSUFVuZScXasBR8GQW+NW/rFcIxhUYH0Gs6cdJiadVHmMCewTuh
	vH08JiiDJYsc7kxq6qI2l0uEnpox63tJQPdsOxNg=
Received: by mx.zohomail.com with SMTPS id 1745844060503793.2308254516073;
	Mon, 28 Apr 2025 05:41:00 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Mon, 28 Apr 2025 20:39:46 +0800
Subject: [PATCH v3 3/3] mailbox: sophgo: add mailbox driver for CV18XX
 series SoC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-cv18xx-mbox-v3-3-ed18dfd836d1@pigmoral.tech>
References: <20250428-cv18xx-mbox-v3-0-ed18dfd836d1@pigmoral.tech>
In-Reply-To: <20250428-cv18xx-mbox-v3-0-ed18dfd836d1@pigmoral.tech>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Yuntao Dai <d1581209858@live.com>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-riscv@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745844011; l=7910;
 i=junhui.liu@pigmoral.tech; s=20250223; h=from:subject:message-id;
 bh=o0p8ArrjYHxyP4B5Ea9j/zn/GdF+46F7w3mD/fqktCE=;
 b=y994W+NuJFZSeBspou7uhkitqRO/46cOQ1dy4UF86upyTZHJUVwopDx2cJstDbGw3Ky6zOsVN
 OskilfI3wTWA7lheV/qZTbqgunF8wpqcCyVM30vZ/12vTp3Yh8mhxQD
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=ZRZkOjG47iI+To+oAo2R4KIpMwtz8r0TffJ5/nO2tcg=
X-ZohoMailClient: External

From: Yuntao Dai <d1581209858@live.com>

Add mailbox controller driver for CV18XX SoCs, which provides 8 channels
and each channel has an 8-byte FIFO.

Signed-off-by: Yuntao Dai <d1581209858@live.com>
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 drivers/mailbox/Kconfig          |  10 ++
 drivers/mailbox/Makefile         |   2 +
 drivers/mailbox/cv1800-mailbox.c | 218 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 230 insertions(+)

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index ed52db272f4d059ff60d608f40e3845411bc63f7..fd3f28d705bc00166028c372d3398f2e225aa8a7 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -36,6 +36,16 @@ config ARM_MHU_V3
 	  that provides different means of transports: supported extensions
 	  will be discovered and possibly managed at probe-time.
 
+config CV1800_MBOX
+	tristate "cv1800 mailbox"
+	depends on ARCH_SOPHGO || COMPILE_TEST
+	help
+	  Mailbox driver implementation for Sophgo CV18XX SoCs. This driver
+	  can be used to send message between different processors in SoC. Any
+	  processer can write data in a channel, and set co-responding register
+	  to raise interrupt to notice another processor, and it is allowed to
+	  send data to itself.
+
 config EXYNOS_MBOX
 	tristate "Exynos Mailbox"
 	depends on ARCH_EXYNOS || COMPILE_TEST
diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
index 9a1542b55539c673af874c5c37fbb3d438fd05d3..13a3448b327115add5ebb8c4f116e68dedd755cb 100644
--- a/drivers/mailbox/Makefile
+++ b/drivers/mailbox/Makefile
@@ -11,6 +11,8 @@ obj-$(CONFIG_ARM_MHU_V2)	+= arm_mhuv2.o
 
 obj-$(CONFIG_ARM_MHU_V3)	+= arm_mhuv3.o
 
+obj-$(CONFIG_CV1800_MBOX)	+= cv1800-mailbox.o
+
 obj-$(CONFIG_EXYNOS_MBOX)	+= exynos-mailbox.o
 
 obj-$(CONFIG_IMX_MBOX)	+= imx-mailbox.o
diff --git a/drivers/mailbox/cv1800-mailbox.c b/drivers/mailbox/cv1800-mailbox.c
new file mode 100644
index 0000000000000000000000000000000000000000..339c155fb98ddf4155a84d5208c595043fc7a7ce
--- /dev/null
+++ b/drivers/mailbox/cv1800-mailbox.c
@@ -0,0 +1,218 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2024 Sophgo Technology Inc.
+ * Copyright (C) 2024 Yuntao Dai <d1581209858@live.com>
+ * Copyright (C) 2025 Junhui Liu <junhui.liu@pigmoral.tech>
+ */
+
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kfifo.h>
+#include <linux/mailbox_client.h>
+#include <linux/mailbox_controller.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#define RECV_CPU		1
+
+#define MAILBOX_MAX_CHAN	8
+
+#define MBOX_EN_REG(cpu)	(cpu << 2)
+#define MBOX_DONE_REG(cpu)	((cpu << 2) + 2)
+#define MBOX_SET_CLR_REG(cpu)	(0x10 + (cpu << 4))
+#define MBOX_SET_INT_REG(cpu)	(0x18 + (cpu << 4))
+#define MBOX_SET_REG		0x60
+
+#define MAILBOX_CONTEXT_OFFSET	0x0400
+#define MAILBOX_CONTEXT_SIZE	0x0040
+
+#define MBOX_CONTEXT_BASE_INDEX(base, index) \
+	((u64 *)(base + MAILBOX_CONTEXT_OFFSET) + index)
+
+/**
+ * struct cv1800_mbox_chan_priv - cv1800 mailbox channel private data
+ * @idx: index of channel
+ * @cpu: send to which processor
+ */
+struct cv1800_mbox_chan_priv {
+	int idx;
+	int cpu;
+};
+
+struct cv1800_mbox {
+	struct mbox_controller mbox;
+	struct cv1800_mbox_chan_priv priv[MAILBOX_MAX_CHAN];
+	struct mbox_chan chans[MAILBOX_MAX_CHAN];
+	u64 __iomem *content[MAILBOX_MAX_CHAN];
+	void __iomem *mbox_base;
+	int recvid;
+};
+
+static irqreturn_t cv1800_mbox_isr(int irq, void *dev_id)
+{
+	struct cv1800_mbox *mbox = (struct cv1800_mbox *)dev_id;
+	size_t i;
+	int ret = IRQ_NONE;
+
+	for (i = 0; i < MAILBOX_MAX_CHAN; i++) {
+		if (mbox->content[i] && mbox->chans[i].cl) {
+			mbox_chan_received_data(&mbox->chans[i],
+						(void *)mbox->content[i]);
+			mbox->content[i] = NULL;
+			ret = IRQ_HANDLED;
+		}
+	}
+
+	return ret;
+}
+
+static irqreturn_t cv1800_mbox_irq(int irq, void *dev_id)
+{
+	struct cv1800_mbox *mbox = (struct cv1800_mbox *)dev_id;
+	u8 set, valid;
+	size_t i;
+	int ret = IRQ_NONE;
+
+	set = readb(mbox->mbox_base + MBOX_SET_INT_REG(RECV_CPU));
+
+	if (!set)
+		return ret;
+
+	for (i = 0; i < MAILBOX_MAX_CHAN; i++) {
+		valid = set & BIT(i);
+		if (valid) {
+			mbox->content[i] =
+				MBOX_CONTEXT_BASE_INDEX(mbox->mbox_base, i);
+			writeb(valid,
+			       mbox->mbox_base + MBOX_SET_CLR_REG(RECV_CPU));
+			writeb(~valid, mbox->mbox_base + MBOX_EN_REG(RECV_CPU));
+			ret = IRQ_WAKE_THREAD;
+		}
+	}
+
+	return ret;
+}
+
+static int cv1800_mbox_send_data(struct mbox_chan *chan, void *data)
+{
+	struct cv1800_mbox_chan_priv *priv =
+		(struct cv1800_mbox_chan_priv *)chan->con_priv;
+	struct cv1800_mbox *mbox = dev_get_drvdata(chan->mbox->dev);
+	int idx = priv->idx;
+	int cpu = priv->cpu;
+	u8 en, valid;
+
+	memcpy_toio(MBOX_CONTEXT_BASE_INDEX(mbox->mbox_base, idx),
+		    data, 8);
+
+	valid = BIT(idx);
+	writeb(valid, mbox->mbox_base + MBOX_SET_CLR_REG(cpu));
+	en = readb(mbox->mbox_base + MBOX_EN_REG(cpu));
+	writeb(en | valid, mbox->mbox_base + MBOX_EN_REG(cpu));
+	writeb(valid, mbox->mbox_base + MBOX_SET_REG);
+
+	return 0;
+}
+
+static bool cv1800_last_tx_done(struct mbox_chan *chan)
+{
+	struct cv1800_mbox_chan_priv *priv =
+		(struct cv1800_mbox_chan_priv *)chan->con_priv;
+	struct cv1800_mbox *mbox = dev_get_drvdata(chan->mbox->dev);
+	u8 en;
+
+	en = readb(mbox->mbox_base + MBOX_EN_REG(priv->cpu));
+
+	return !(en & BIT(priv->idx));
+}
+
+static const struct mbox_chan_ops cv1800_mbox_chan_ops = {
+	.send_data = cv1800_mbox_send_data,
+	.last_tx_done = cv1800_last_tx_done,
+};
+
+static struct mbox_chan *cv1800_mbox_xlate(struct mbox_controller *mbox,
+					   const struct of_phandle_args *spec)
+{
+	struct cv1800_mbox_chan_priv *priv;
+
+	int idx = spec->args[0];
+	int cpu = spec->args[1];
+
+	if (idx >= mbox->num_chans)
+		return ERR_PTR(-EINVAL);
+
+	priv = mbox->chans[idx].con_priv;
+	priv->cpu = cpu;
+
+	return &mbox->chans[idx];
+}
+
+static const struct of_device_id cv1800_mbox_of_match[] = {
+	{ .compatible = "sophgo,cv1800b-mailbox", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, cv1800_mbox_of_match);
+
+static int cv1800_mbox_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct cv1800_mbox *mb;
+	int irq, idx, err;
+
+	mb = devm_kzalloc(dev, sizeof(*mb), GFP_KERNEL);
+	if (!mb)
+		return -ENOMEM;
+
+	mb->mbox_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(mb->mbox_base))
+		return dev_err_probe(dev, PTR_ERR(mb->mbox_base),
+				     "Failed to map resource\n");
+
+	mb->mbox.dev = dev;
+	mb->mbox.chans = mb->chans;
+	mb->mbox.txdone_poll = true;
+	mb->mbox.ops = &cv1800_mbox_chan_ops;
+	mb->mbox.num_chans = MAILBOX_MAX_CHAN;
+	mb->mbox.of_xlate = cv1800_mbox_xlate;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	err = devm_request_threaded_irq(dev, irq, cv1800_mbox_irq,
+					cv1800_mbox_isr, IRQF_ONESHOT,
+					dev_name(&pdev->dev), mb);
+	if (err < 0)
+		return dev_err_probe(dev, err, "Failed to register irq\n");
+
+	for (idx = 0; idx < MAILBOX_MAX_CHAN; idx++) {
+		mb->priv[idx].idx = idx;
+		mb->mbox.chans[idx].con_priv = &mb->priv[idx];
+	}
+
+	platform_set_drvdata(pdev, mb);
+
+	err = devm_mbox_controller_register(dev, &mb->mbox);
+	if (err)
+		return dev_err_probe(dev, err, "Failed to register mailbox\n");
+
+	return 0;
+}
+
+static struct platform_driver cv1800_mbox_driver = {
+	.driver = {
+		.name = "cv1800-mbox",
+		.of_match_table = cv1800_mbox_of_match,
+	},
+	.probe	= cv1800_mbox_probe,
+};
+
+module_platform_driver(cv1800_mbox_driver);
+
+MODULE_DESCRIPTION("cv1800 mailbox driver");
+MODULE_LICENSE("GPL");

-- 
2.49.0

