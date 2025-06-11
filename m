Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64CB2367DE;
	Wed, 11 Jun 2025 08:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749629986; cv=none; b=lRgX0dV/29R/t4QvOTaKeT9WxFT3Z49zpEfbCWDI3DRWzAIYMq3QfOT2/+jlAVxqhMqNSipiZsKfuOX940qJKSk2074Uzsfw1AtVsy7F5ZMjzm8P+HgDY8RtPpTz6bxQamn9S4x9UVDncyyDsIfUCwKzQnydE/j7wBJg2vBwvd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749629986; c=relaxed/simple;
	bh=y1iAw7dIheA8lTbNK69UaIJvv7hUqSuSoYo34RqHKyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dwIG8CEgWo4KZkPWdW3Yl/CRvPGq97Q9U7wvBbc0WpRryhbJRKODMEJWT1mUAcxiEXbn9ZrG7vYObVI3PvQZTxyGYjK8CfFPC+0qsJN7x7ZZvd8pK3YYO5u7Ot2iqdd72cudMI0QleQXaIw+c4EjiiwOJKBilrthgv3qMMU2aJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g3Zmt9KT; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g3Zmt9KT"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2e95ab2704fso3984641fac.3;
        Wed, 11 Jun 2025 01:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749629984; x=1750234784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZN6IMaS1grsEGw7muFXYaAlvNxM7Dm22+G096tEuWY=;
        b=g3Zmt9KTdwYn3RcJ8757Gp1h/Nt/nHQEUOe1mH869ZOaescRdYUYM1k4yP3L4iN4q6
         PuOj5hsuIxC7AcagJKfJWa9Lw6z5X3ZmUeuuab2pKjyRLP1tVPBpBbIUWnFqp9PoVfmy
         2RfAXA5+Pq27RozqsCxbREyMxtgUKYKxVVRSKyUo+KOFnKBUoGyeoYKJsZDuSZfqr45v
         pfG+d35/jfEi30lobAE0pwr0XX3hhAtvvVlfdsqo0wsaTwC+V7xouBrCzpjsgk1z68WU
         gB1hM7qFfXHrcuDJORFe6rdew5doqKHyIFhaFgNjrFg7BuJO8vE9qLzV9h/fv3QmYmyK
         /jvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749629984; x=1750234784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QZN6IMaS1grsEGw7muFXYaAlvNxM7Dm22+G096tEuWY=;
        b=dKETpxgeubfberTmPV8FI91W360ZLK1CZ/JMaS8IznFDAydiqTKyt3N+tHQmhVYtkw
         Trr3jgAIlFEKNP/MBaeZVRpnJWlY1Oc12221m17IGUDF7NXqnpZUv7CU9YihBvPaINhb
         +sgGyH6ZIa6gZbPDElNTraQRrn3tCjwmChmosB3BDR1URQOigFPBnQPABArtUfM9mQui
         iaU2MEs1G7evkUs11ez9HKeGqqH3P+r2eyLjfyCNUcH284wkVDc79F+TWEHWEcEjQftj
         lSqbr0AHDbwPiXBeO8PULuXimFRCXBDorAJJ7cvR+F/1fyijhQwOuxMojgJELjcMcjPZ
         ZhTA==
X-Forwarded-Encrypted: i=1; AJvYcCUvao1gJHXGjKwzS+cKHtclWegFussEFVPHXJrUhwMP0bBAq1H11SDIoDGR2NFy6ESIjlUZHeBOrZBx@vger.kernel.org, AJvYcCWqX90sIVsP0ms2WmNbLkOlQmpVDY0kxgaqeQZx5i8V7wqS47MT4HjGm21ggWJ2163o+c69aWAFK54QrNZl@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6+CcOt61TCbquXt7JXebMQqFK8KaEDHPUBnv145b1Zg0PE/mV
	mq9qX5bKt9+477V6g4L1yxsbRjT2kFcrQXYCIIwmL1dpsfl4QOy5iW9xwCPdropi
X-Gm-Gg: ASbGncuCfC2ldwGhdE9lGerE7DZsMWZkeHm/yus5LhPmJKfmyf98mFNKwOtrxR8+6FI
	ZDf71EqehzUd9QBERAj4U05h41sFlNIyODZYfunoWJgruk44ZBSc0sKu6Te/ebW0ZleAgzHxjix
	/b8RqD2NqjXOVTU5SWPOH/5l63DGz8QAarpfHQVXkexsSImYVMM8xzyXLX6XiJy6WJa1vtGzB2I
	Er7XuyKK9FcQXWFwCNmXrVDmBunv4igm/SRKaO4yr2S+Xr84PxavYPYIBGUK+W3tMfbNkDDNzNs
	oRNzJxfH4UdcMoEGrsybJp/agbJCCCx6Rlvgjw==
X-Google-Smtp-Source: AGHT+IGaw2QolG2EOFbc9/YuiQ+KRkR/yOIdu75VBT0o1UfV4DERkOF20ZE/NN/PCZ7PlCumHRZTeQ==
X-Received: by 2002:a05:620a:1a26:b0:7c7:bb3f:fd40 with SMTP id af79cd13be357-7d3a9547490mr313297885a.5.1749629971966;
        Wed, 11 Jun 2025 01:19:31 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d25a536b91sm825762485a.32.2025.06.11.01.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:19:31 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v4 2/2] phy: sophgo: Add USB 2.0 PHY driver for Sophgo CV18XX/SG200X
Date: Wed, 11 Jun 2025 16:18:03 +0800
Message-ID: <20250611081804.1196397-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611081804.1196397-1-inochiama@gmail.com>
References: <20250611081804.1196397-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add USB 2.0 PHY driver for Sophgo CV18XX/SG200X. Currently
this driver does not support OTG mode as lack of document.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/phy/Kconfig                  |   1 +
 drivers/phy/Makefile                 |   1 +
 drivers/phy/sophgo/Kconfig           |  19 +++
 drivers/phy/sophgo/Makefile          |   2 +
 drivers/phy/sophgo/phy-cv1800-usb2.c | 222 +++++++++++++++++++++++++++
 5 files changed, 245 insertions(+)
 create mode 100644 drivers/phy/sophgo/Kconfig
 create mode 100644 drivers/phy/sophgo/Makefile
 create mode 100644 drivers/phy/sophgo/phy-cv1800-usb2.c

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 58c911e1b2d2..678dd0452f0a 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -122,6 +122,7 @@ source "drivers/phy/renesas/Kconfig"
 source "drivers/phy/rockchip/Kconfig"
 source "drivers/phy/samsung/Kconfig"
 source "drivers/phy/socionext/Kconfig"
+source "drivers/phy/sophgo/Kconfig"
 source "drivers/phy/st/Kconfig"
 source "drivers/phy/starfive/Kconfig"
 source "drivers/phy/sunplus/Kconfig"
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index c670a8dac468..bfb27fb5a494 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -35,6 +35,7 @@ obj-y					+= allwinner/	\
 					   rockchip/	\
 					   samsung/	\
 					   socionext/	\
+					   sophgo/	\
 					   st/		\
 					   starfive/	\
 					   sunplus/	\
diff --git a/drivers/phy/sophgo/Kconfig b/drivers/phy/sophgo/Kconfig
new file mode 100644
index 000000000000..2c943bbe1f81
--- /dev/null
+++ b/drivers/phy/sophgo/Kconfig
@@ -0,0 +1,19 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Phy drivers for Sophgo platforms
+#
+
+if ARCH_SOPHGO || COMPILE_TEST
+
+config PHY_SOPHGO_CV1800_USB2
+	tristate "Sophgo CV18XX/SG200X USB 2.0 PHY support"
+	depends on MFD_SYSCON
+	depends on USB_SUPPORT
+	select GENERIC_PHY
+	help
+	  Enable this to support the USB 2.0 PHY used with
+	  the DWC2 USB controller in Sophgo CV18XX/SG200X
+	  series SoC.
+	  If unsure, say N.
+
+endif # ARCH_SOPHGO || COMPILE_TEST
diff --git a/drivers/phy/sophgo/Makefile b/drivers/phy/sophgo/Makefile
new file mode 100644
index 000000000000..318060661759
--- /dev/null
+++ b/drivers/phy/sophgo/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_PHY_SOPHGO_CV1800_USB2)	+= phy-cv1800-usb2.o
diff --git a/drivers/phy/sophgo/phy-cv1800-usb2.c b/drivers/phy/sophgo/phy-cv1800-usb2.c
new file mode 100644
index 000000000000..1d21db7f875b
--- /dev/null
+++ b/drivers/phy/sophgo/phy-cv1800-usb2.c
@@ -0,0 +1,222 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 Inochi Amaoto <inochiama@outlook.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/bitfield.h>
+#include <linux/debugfs.h>
+#include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_gpio.h>
+#include <linux/platform_device.h>
+#include <linux/phy/phy.h>
+#include <linux/regmap.h>
+#include <linux/spinlock.h>
+
+#define REG_USB_PHY_CTRL		0x048
+
+#define PHY_ID_OVERWRITE_EN		BIT(6)
+#define PHY_ID_OVERWRITE_MODE		BIT(7)
+#define PHY_ID_OVERWRITE_MODE_HOST	FIELD_PREP(BIT(7), 0)
+#define PHY_ID_OVERWRITE_MODE_DEVICE	FIELD_PREP(BIT(7), 1)
+
+#define PHY_APP_CLK_RATE		125000000
+#define PHY_LPM_CLK_RATE		12000000
+#define PHY_STB_CLK_RATE		333334
+
+struct cv1800_usb_phy {
+	struct phy	*phy;
+	struct regmap	*syscon;
+	spinlock_t	lock;
+	struct clk	*usb_app_clk;
+	struct clk	*usb_lpm_clk;
+	struct clk	*usb_stb_clk;
+	bool		support_otg;
+};
+
+static int cv1800_usb_phy_set_mode(struct phy *_phy,
+				   enum phy_mode mode, int submode)
+{
+	struct cv1800_usb_phy *phy = phy_get_drvdata(_phy);
+	unsigned int regval = 0;
+	int ret;
+
+	switch (mode) {
+	case PHY_MODE_USB_DEVICE:
+		regval = PHY_ID_OVERWRITE_EN | PHY_ID_OVERWRITE_MODE_DEVICE;
+		break;
+	case PHY_MODE_USB_HOST:
+		regval = PHY_ID_OVERWRITE_EN | PHY_ID_OVERWRITE_MODE_HOST;
+		break;
+	case PHY_MODE_USB_OTG:
+		if (!phy->support_otg)
+			return 0;
+
+		ret = regmap_read(phy->syscon, REG_USB_PHY_CTRL, &regval);
+		if (ret)
+			return ret;
+
+		regval = FIELD_GET(PHY_ID_OVERWRITE_MODE, regval);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return regmap_update_bits(phy->syscon, REG_USB_PHY_CTRL,
+				  PHY_ID_OVERWRITE_EN | PHY_ID_OVERWRITE_MODE,
+				  regval);
+}
+
+static ssize_t dr_mode_write(struct file *file, const char __user *_buf,
+			     size_t count, loff_t *ppos)
+{
+	struct seq_file *seq = file->private_data;
+	struct cv1800_usb_phy *phy = seq->private;
+	enum phy_mode mode;
+	char buf[16];
+
+	if (copy_from_user(&buf, _buf, min_t(size_t, sizeof(buf) - 1, count)))
+		return -EFAULT;
+
+	if (sysfs_streq(buf, "host"))
+		mode = PHY_MODE_USB_DEVICE;
+	else if (sysfs_streq(buf, "peripheral"))
+		mode = PHY_MODE_USB_DEVICE;
+	else if (sysfs_streq(buf, "otg"))
+		mode = PHY_MODE_USB_OTG;
+	else
+		return -EINVAL;
+
+	return cv1800_usb_phy_set_mode(phy->phy, mode, 0);
+}
+
+static int dr_mode_show(struct seq_file *seq, void *v)
+{
+	struct cv1800_usb_phy *phy = seq->private;
+	unsigned long flags;
+	unsigned int regval;
+	bool is_host = true;
+	int ret;
+
+	spin_lock_irqsave(&phy->lock, flags);
+	ret = regmap_read(phy->syscon, REG_USB_PHY_CTRL, &regval);
+	spin_unlock_irqrestore(&phy->lock, flags);
+
+	if (ret)
+		return ret;
+
+	if (regval & PHY_ID_OVERWRITE_MODE)
+		is_host = false;
+
+	if (!(regval & PHY_ID_OVERWRITE_EN))
+		seq_puts(seq, "otg: ");
+
+	seq_puts(seq, is_host ? "host\n" : "peripheral\n");
+
+	return 0;
+}
+
+DEFINE_SHOW_STORE_ATTRIBUTE(dr_mode);
+
+static int cv1800_usb_phy_set_clock(struct cv1800_usb_phy *phy)
+{
+	int ret;
+
+	ret = clk_set_rate(phy->usb_app_clk, PHY_APP_CLK_RATE);
+	if (ret)
+		return ret;
+
+	ret = clk_set_rate(phy->usb_lpm_clk, PHY_LPM_CLK_RATE);
+	if (ret)
+		return ret;
+
+	ret = clk_set_rate(phy->usb_stb_clk, PHY_STB_CLK_RATE);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct phy_ops cv1800_usb_phy_ops = {
+	.set_mode	= cv1800_usb_phy_set_mode,
+	.owner		= THIS_MODULE,
+};
+
+static int cv1800_usb_phy_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device *parent = dev->parent;
+	struct cv1800_usb_phy *phy;
+	struct phy_provider *phy_provider;
+	int ret;
+
+	if (!parent)
+		return -ENODEV;
+
+	phy = devm_kmalloc(dev, sizeof(*phy), GFP_KERNEL);
+	if (!phy)
+		return -ENOMEM;
+
+	phy->syscon = syscon_node_to_regmap(parent->of_node);
+	if (IS_ERR_OR_NULL(phy->syscon))
+		return -ENODEV;
+
+	phy->support_otg = false;
+
+	spin_lock_init(&phy->lock);
+
+	phy->usb_app_clk = devm_clk_get_enabled(dev, "app");
+	if (IS_ERR(phy->usb_app_clk))
+		return dev_err_probe(dev, PTR_ERR(phy->usb_app_clk),
+			"Failed to get app clock\n");
+
+	phy->usb_lpm_clk = devm_clk_get_enabled(dev, "lpm");
+	if (IS_ERR(phy->usb_lpm_clk))
+		return dev_err_probe(dev, PTR_ERR(phy->usb_lpm_clk),
+			"Failed to get lpm clock\n");
+
+	phy->usb_stb_clk = devm_clk_get_enabled(dev, "stb");
+	if (IS_ERR(phy->usb_stb_clk))
+		return dev_err_probe(dev, PTR_ERR(phy->usb_stb_clk),
+			"Failed to get stb clock\n");
+
+	phy->phy = devm_phy_create(dev, NULL, &cv1800_usb_phy_ops);
+	if (IS_ERR(phy->phy))
+		return dev_err_probe(dev, PTR_ERR(phy->phy),
+			"Failed to create phy\n");
+
+	ret = cv1800_usb_phy_set_clock(phy);
+	if (ret)
+		return ret;
+
+	debugfs_create_file("dr_mode", 0644, phy->phy->debugfs,
+			    phy, &dr_mode_fops);
+
+	phy_set_drvdata(phy->phy, phy);
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+
+	return PTR_ERR_OR_ZERO(phy_provider);
+}
+
+static const struct of_device_id cv1800_usb_phy_ids[] = {
+	{ .compatible = "sophgo,cv1800b-usb2-phy" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, cv1800_usb_phy_ids);
+
+static struct platform_driver cv1800_usb_phy_driver = {
+	.probe = cv1800_usb_phy_probe,
+	.driver = {
+		.name = "cv1800-usb2-phy",
+		.of_match_table = cv1800_usb_phy_ids,
+	 },
+};
+module_platform_driver(cv1800_usb_phy_driver);
+
+MODULE_AUTHOR("Inochi Amaoto <inochiama@outlook.com>");
+MODULE_DESCRIPTION("CV1800/SG2000 SoC USB 2.0 PHY driver");
+MODULE_LICENSE("GPL");
-- 
2.49.0

