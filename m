Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9764253939
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 13:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750341120; cv=none; b=K+TtC61SLfF6WoDfX992f3QnY4eXAMh6g1/ckThBf1JorFKJqyp9Sd6Q9ubbF6hUI9+M0+pOdu6n6H3sNZ1fvdOQfMfptabBKVqDLTFiiI+IdUGCyeBAYs8lmzYs97LGua6FpHFLOWDk9F6hW24FOznDmbjxFW3sNGnJqRly5dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750341120; c=relaxed/simple;
	bh=DLY9xmMx5Ri1jviyS6Gh17qkXoF7jTjGJ2mkbLSbZhw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fFrc01UMSIUoGRM1qjrQb6xX9hk/5qkZrMUOALVxtEQ53uEJJQ8uyWWi0BvYms3OCyM/an5KcECy4AtPwEhSgo0120jWXkD7sPbXLWDcK9hF7mnsNAkxEQHFiscIDDuu3Ke/uw+Ft6kvKhEfOC1lpBo1r/u7g0b5NFVjEgEQ2wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Dt1WtA0K; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Dt1WtA0K"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3ddd2710d14so8835035ab.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 06:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750341118; x=1750945918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ifXk3bjhC2kOQzrxq9QjT/OUSbhaYYTAO2eulOUbpkA=;
        b=Dt1WtA0K+QsLwLJ6wlK7Yh2LuUhTw/Iiwq69xCcyJ83h1nhHfkm+ZY1LJahdy9rmBL
         7zEkMJiiEMSyrcHJ5QF/NZEXpa2emBfD4QbVbxStz9D644NtadweifZ/aHFl7rpkAY8J
         y5TnP+RRcU+Bx/KJoZfLcZZR4TKCEqj8oZjXhDH9uqXKDwu4ZOLXw3U1xsFfUO8axoIE
         k7/+KfT07NGdK+YRYWFKpzNzrmOcZJ5L/MxGNGAQT/B748vsg5cA5Wx+Z0FmUuzJHNUi
         mudaVwPfdIkUY/PNjcU1c0lhrAK5eUatt0oQ9ZMJH0qsockiVT0Le+0D2EJoG+6XbaIg
         0L7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750341118; x=1750945918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ifXk3bjhC2kOQzrxq9QjT/OUSbhaYYTAO2eulOUbpkA=;
        b=anwzs0a9XCFUwxJGT5W6v0fLF5/WvWPioQUxu8cvX7DQen2qxNhJEZ/Yw4J7TG2lN3
         VOp6mwqcwBJz6e0tbE5cHker1GmYEdx13Grc2PqglQqK2MeRlk1/dLBPvc4Rs1MVCjbP
         bEYpVU33cO/oWOX2modlPrmXZfXq/j2+afoQkeZ3XdeEyVe8Wblr6l9Im2gzbPbCmhza
         jyNqQYbg94M3g/xBF4CsP/gB5UYNOQ26Yy+KuERyq+JIFutA0Oc7obqMJca2qkG6XGcc
         1s25afHfyf+2I9jBGgQ9lEaP/eCHZLPFP0aBpHxUwcpEqVD42HH9i8LA48izdwnwLqMN
         ri8A==
X-Forwarded-Encrypted: i=1; AJvYcCVAu+ax9rqNwT4SL8Dcer3CY60QbyefIkGsjvJ7+HVqoaN6gofU0Z7EgeonxCjHqlRxB0XcIkktq9gTn4w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZMMJeKdFQG7n+h7L/pSPwQ1eEa25KD5wdIztI+A8fnVO1hIWT
	py5U7fmJDJWnduDYG13VmHkzSHPAsPEAjGb82T9ZxsuLnUEgujDu0FlVb9M/LOYkq2I=
X-Gm-Gg: ASbGnctCPdrhuOhyptZkhVA6hoECpy5Uc1lmkMpyO72VqOT41YQy8VFLI58+/RjCWLh
	WRebhtl2Bc+6AM8jcCdIsUgry1Z0v0kLVrYghSQSNwCgIleWLOcnvuCOGJWkARIW6yTwu16jthp
	rqaRI0nK+/6rHAzjZtF4gCqWdDUk4GzxQRu97xgCvzt7/cT8U5Z4VH/Sbui0zstfYtmgSR0AqYv
	6NwSNu9x5T8XOLRtBh8VxeLVHMQJZUAq6gvBqLMVGtZSoDpNtbnQSKYD3rvZS+9ke7L4VTSfuRY
	mpfdgr2NBG9h2D6Dc8vd2hQUsnXPtQfi3AbdgFfb1Z0Cp4722I0FjMfCypW1ez72Oa0bgc7SgPL
	X/p5OV3h9qpVZZbLSnFk5NesPC3hH8gc=
X-Google-Smtp-Source: AGHT+IH/c+HzHs3PuLiMQTaAREtVC8AGBWvZSZ9JD/Fhz39viBM1praD95gqU5zluLFC0bfpkpLkOA==
X-Received: by 2002:a05:6e02:1a8c:b0:3dc:8bb8:28bf with SMTP id e9e14a558f8ab-3de07c53a5fmr259487895ab.5.1750341117745;
        Thu, 19 Jun 2025 06:51:57 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de01a453b4sm38246015ab.47.2025.06.19.06.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 06:51:57 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	broonie@kernel.org,
	lgirdwood@gmail.com
Cc: wangruikang@iscas.ac.cn,
	dlan@gentoo.org,
	troymitchell988@gmail.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/6] mfd: spacemit: add support for SpacemiT PMICs
Date: Thu, 19 Jun 2025 08:51:46 -0500
Message-ID: <20250619135151.3206258-3-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250619135151.3206258-1-elder@riscstar.com>
References: <20250619135151.3206258-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for SpacemiT PMICs. Initially only the P1 PMIC is supported
but the driver is structured to allow support for others to be added.

The P1 PMIC is controlled by I2C, and is normally implemented with the
SpacemiT K1 SoC.  This PMIC provides six buck converters and 12 LDO
regulators.  It also implements a switch, watchdog timer, real-time clock,
and more, but initially we will only support its regulators.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v2: - Use module_i2c_driver()
    - Expanded Kconfig module help text
    - Add MODULE_ALIAS(), and define and use DRV_NAME

 drivers/mfd/Kconfig         | 13 ++++++
 drivers/mfd/Makefile        |  1 +
 drivers/mfd/spacemit-pmic.c | 83 +++++++++++++++++++++++++++++++++++++
 3 files changed, 97 insertions(+)
 create mode 100644 drivers/mfd/spacemit-pmic.c

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 6fb3768e3d71c..94c6361dae2f6 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1182,6 +1182,19 @@ config MFD_QCOM_RPM
 	  Say M here if you want to include support for the Qualcomm RPM as a
 	  module. This will build a module called "qcom_rpm".
 
+config MFD_SPACEMIT_PMIC
+	tristate "SpacemiT PMIC"
+	depends on ARCH_SPACEMIT || COMPILE_TEST
+	depends on I2C && OF
+	select MFD_CORE
+	select REGMAP_I2C
+	default ARCH_SPACEMIT
+	help
+	  This option enables support for SpacemiT I2C based PMICs.  At
+	  this time only the P1 PMIC (used with the K1 SoC) is supported.
+	  To compile this driver as a module, choose M here.  The module
+	  will be called "spacemit-pmic".
+
 config MFD_SPMI_PMIC
 	tristate "Qualcomm SPMI PMICs"
 	depends on ARCH_QCOM || COMPILE_TEST
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 79495f9f3457b..59d1ec8db3a3f 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -266,6 +266,7 @@ obj-$(CONFIG_MFD_SUN4I_GPADC)	+= sun4i-gpadc.o
 obj-$(CONFIG_MFD_STM32_LPTIMER)	+= stm32-lptimer.o
 obj-$(CONFIG_MFD_STM32_TIMERS) 	+= stm32-timers.o
 obj-$(CONFIG_MFD_MXS_LRADC)     += mxs-lradc.o
+obj-$(CONFIG_MFD_SPACEMIT_PMIC)	+= spacemit-pmic.o
 obj-$(CONFIG_MFD_SC27XX_PMIC)	+= sprd-sc27xx-spi.o
 obj-$(CONFIG_RAVE_SP_CORE)	+= rave-sp.o
 obj-$(CONFIG_MFD_ROHM_BD71828)	+= rohm-bd71828.o
diff --git a/drivers/mfd/spacemit-pmic.c b/drivers/mfd/spacemit-pmic.c
new file mode 100644
index 0000000000000..f6cae41baa77a
--- /dev/null
+++ b/drivers/mfd/spacemit-pmic.c
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 by RISCstar Solutions Corporation.  All rights reserved.
+ * Derived from code from:
+ *	Copyright (C) 2024 Troy Mitchell <troymitchell988@gmail.com>
+ */
+
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+#include <linux/types.h>
+
+#define MOD_NAME	"spacemit-pmic"
+
+struct spacemit_pmic_data {
+	const struct regmap_config *regmap_config;
+	const struct mfd_cell *mfd_cells;	/* array */
+	size_t mfd_cell_count;
+};
+
+static const struct regmap_config p1_regmap_config = {
+	.reg_bits	= 8,
+	.val_bits	= 8,
+	.max_register	= 0xaa,
+};
+
+/* The name field defines the *driver* name that should bind to the device */
+static const struct mfd_cell p1_cells[] = {
+	{
+		.name		= "spacemit-p1-regulator",
+	},
+};
+
+static const struct spacemit_pmic_data p1_pmic_data = {
+	.regmap_config	= &p1_regmap_config,
+	.mfd_cells	= p1_cells,
+	.mfd_cell_count	= ARRAY_SIZE(p1_cells),
+};
+
+static int spacemit_pmic_probe(struct i2c_client *client)
+{
+	const struct spacemit_pmic_data *data;
+	struct device *dev = &client->dev;
+	struct regmap *regmap;
+
+	/* We currently have no need for a device-specific structure */
+	data = of_device_get_match_data(dev);
+	regmap = devm_regmap_init_i2c(client, data->regmap_config);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap),
+				     "regmap initialization failed");
+
+	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO,
+				    data->mfd_cells, data->mfd_cell_count,
+				    NULL, 0, NULL);
+}
+
+static const struct of_device_id spacemit_pmic_match[] = {
+	{
+		.compatible	= "spacemit,p1",
+		.data		= &p1_pmic_data,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, spacemit_pmic_match);
+
+static struct i2c_driver spacemit_pmic_i2c_driver = {
+	.driver	= {
+		.name		= MOD_NAME,
+		.of_match_table	= spacemit_pmic_match,
+	},
+	.probe	= spacemit_pmic_probe,
+};
+
+module_i2c_driver(spacemit_pmic_i2c_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("SpacemiT multi-function PMIC driver");
+MODULE_ALIAS("platform:" MOD_NAME);
-- 
2.45.2

