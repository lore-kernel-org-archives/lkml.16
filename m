Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1416A24DD15
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 22:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750458096; cv=none; b=FULdKy42nDNdkWobYdwOgk3eOu8xOz1jB4wRc1FjnrSG/tR1i/WK6TUkgH2vcvd8Qp1YIi5ZLD+mvIvlPGhTkInWduP9r5ZYECLts/D/HGbN7aIjiALgtwtZK1+BjjyRZIAgdIrPQ/Qu2Ukw1N2QFmfA2EaC+yubDYNaug5FLos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750458096; c=relaxed/simple;
	bh=BwOGbOpYX21Ucam+bloAQXE+MG2uw4doa1iKJcVx3E8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T4XqOo3Ti7WE7Esw4hFVFJuCEylWvMio/Sk7Tju8Qb2RzNFZJB1CaO7WJkLJ+EjwHjngoqmdLwo6Wzr2KbfAPUiAru8JMupIXYrceYEM6qFoS3yZpy9RLL4K3rzPyt+CF6nko1mSiO1fCPMjJ6wA8F1dY1T06qJ4aQPYPyipyyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=t7hAizm5; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="t7hAizm5"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-60402c94319so1246083eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750458094; x=1751062894; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T+UAVQwWtySu3Zk+qmcMSCJQC906a/pI5jwVttXUTqw=;
        b=t7hAizm5KZjZ94mIDfS8HasjKUN7hVoZi91Vy9RWOuqGBHNtzu4Jab1/ryzybZiWfc
         hNK2fG0/sw/RPLgGb0IXluZe7RFGLfRKfrgq1Qat1g8KCDpgFgh5DZqkqSqsFwj0NBSr
         Zl9bnKb4Kd9dIk9U/11pMZwtVDzXMh0vYYaIb3/4XfHClW8fVoCKqA7RYLyRrLod4hbu
         b2PNa1/gUtlnpGpxvjbDF9X1wa+drBp0tS789TrlMf86+eGCDP46ug3tzL+ICexBRCMy
         23milim/3D0sVhqeHbwlh8dcldeQxQvjhx5MDTAIH60swcAbsmFcQGSBmh6ni0rKIIf7
         5HkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750458094; x=1751062894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T+UAVQwWtySu3Zk+qmcMSCJQC906a/pI5jwVttXUTqw=;
        b=XgpCdM6kwGY2lRRVjiNt2UYxRwnIemqVD6NVvIeEFW3BX9HN8LaE0qD3olTTnGPgkt
         qvHEPXuZEXhpk8xoFz+NZCDHQ4w6xtTtaG9j3P2AcPvdn7MYosPgck2xNw+2OnPuWOrE
         /5oBt04vHBcUDfBy+uB2GomqLF6FHYTp/IzL8f65FMlYkeggxKlvv0yBCzrq++ltflZM
         QjPWkuTSJZUII67zF3TdF7IcyLSiHnX85Y56QDkCvO/IM5YDWrohkb42L7krDBxRIicC
         1ABX0BxXdRJFUwFkHq+pZUXQQeBYrThpEbQyF1QwVozrjnHFTz53TU4ztm1pIOQmpS+y
         Ziog==
X-Forwarded-Encrypted: i=1; AJvYcCV1kxqz4vt3C7Ga5UssbN+H7s2bvIAMxgSpkejVDOr+LA6rJpBrv8NkIIrYwTDtVJG+yqNOoWmiCedg94Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLEjhZsgvJBcSPCQ2+s8g7UR5tsLCBBgTf/ZF5vm6vm+QYbtvK
	rBSCIy0404l+ynFbR3Cq7xNikcb1Q6E23Fp7CKCeOFFV7R1jzqA9pv2WjWFqS96/w3Q=
X-Gm-Gg: ASbGncviBZ/9dnlNZ2d8gKkM36PxqjK7af1117ukMGWtOCYcobK8TmGElolXRDZ+F/0
	3iWSOgAZ/1yE/SwaK8KcTyCYgzJGH0aDwYsC4Bxls4Xf7svm1IxQKWg99Eq1r7JKbp0RE5XYhjA
	0TKnEIbp1li0R68qR7IIRHXWgik5cJOPyFC4OI6jySwlypyXc5SPRf+kJN0kVIPRgMA7Ln08xYa
	UqGeqKPwjH5q3fyboLCn0/yM4D1Ew9wahEeXOPv0z49BHZd3D4A4wRG1+H9Kztip+v/e9ftVF81
	rtClPvdv24RdXD0yyJANJsmGR24TBFoZKGj8f9DPZ+3Dj9THujubxAcKNLrwtA6+6hlQ
X-Google-Smtp-Source: AGHT+IGVhQ/Ygrt+I/n1VtjMi0eU63wKILJBqUt+HqZ6TRpY8gF1Tzp20x9EKk4Yh7WxzmQ7OeIS9w==
X-Received: by 2002:a05:6870:6391:b0:29d:c85f:bc8c with SMTP id 586e51a60fabf-2eeee659b1cmr3012485fac.36.1750458094166;
        Fri, 20 Jun 2025 15:21:34 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:c4bf:cf27:203c:f8b0])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ef481fe06esm7561fac.35.2025.06.20.15.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 15:21:33 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 20 Jun 2025 17:20:13 -0500
Subject: [PATCH 7/9] spi: offload trigger: add ADI Util Sigma-Delta SPI
 driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-iio-adc-ad7173-add-spi-offload-support-v1-7-0766f6297430@baylibre.com>
References: <20250620-iio-adc-ad7173-add-spi-offload-support-v1-0-0766f6297430@baylibre.com>
In-Reply-To: <20250620-iio-adc-ad7173-add-spi-offload-support-v1-0-0766f6297430@baylibre.com>
To: Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4261; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=BwOGbOpYX21Ucam+bloAQXE+MG2uw4doa1iKJcVx3E8=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoVd7KWtgTjPbi3YZhrvUDq6yz9ko4YaApYPN8R
 eK4qzisj4aJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaFXeygAKCRDCzCAB/wGP
 wEgoCACN3bes1vX7AMC+4MNdXRnYbEFoqA8WJVnkVD0Wx1WeMt5VbVMGgmEnDkcWbCThlGEABTf
 9MxzQgP+DopACd4sLshxxLkkZujWXbnPcLXMrzew18nifeQuON0xoay33Y7mHgXsJ1XDvLMW71H
 2zCqpnVO/WmJkp6C2mUVpot9j1y5MNZ7t/hOqcYqkQquCwdjSqRPuIe7+06GM2ebwkWrTuIRQNB
 +oM5uTBpp4l6UWSPh5fSII20PpG/MMdxm+eM8YQ0jho1P5cZdKAMKX1CLV/ywe1UVpaz67oiIu9
 NI313wXUtu0tSS8uMp02IGJI+VVnxbOYHhJIh3MlJ/hQYtFC
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Add a new driver for the ADI Util Sigma-Delta SPI FPGA IP core.

This is used to trigger a SPI offload based on a RDY signal from an ADC
while masking out other signals on the same line.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 MAINTAINERS                                        |  2 +-
 drivers/spi/Kconfig                                |  5 ++
 drivers/spi/Makefile                               |  1 +
 .../spi/spi-offload-trigger-adi-util-sigma-delta.c | 59 ++++++++++++++++++++++
 4 files changed, 66 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 60ba572be7f5b48c0ab1d0d9724e19e335e8761b..4ed4977deb6ddc545be39b5c1d5e9959e9fe64cf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23357,7 +23357,7 @@ F:	include/linux/mtd/spi-nor.h
 
 SPI OFFLOAD
 R:	David Lechner <dlechner@baylibre.com>
-F:	drivers/spi/spi-offload-trigger-pwm.c
+F:	drivers/spi/spi-offload-trigger-*.c
 F:	drivers/spi/spi-offload.c
 F:	include/linux/spi/offload/
 K:	spi_offload
diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index c51da3fc3604977b05388687e5e64a58370186c4..e69f060d3875c168a2dc701a372e47b8ffd33268 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -1355,6 +1355,11 @@ if SPI_OFFLOAD
 
 comment "SPI Offload triggers"
 
+config SPI_OFFLOAD_TRIGGER_ADI_UTIL_SD
+	tristate "SPI offload trigger using ADI sigma-delta utility"
+	help
+	  SPI offload trigger from ADI sigma-delta utility FPGA IP block.
+
 config SPI_OFFLOAD_TRIGGER_PWM
 	tristate "SPI offload trigger using PWM"
 	depends on PWM
diff --git a/drivers/spi/Makefile b/drivers/spi/Makefile
index 4ea89f6fc531625060255ecff237470927e1f041..51f9f16ed734424ff10672a04f2ec166dc637e0b 100644
--- a/drivers/spi/Makefile
+++ b/drivers/spi/Makefile
@@ -170,3 +170,4 @@ obj-$(CONFIG_SPI_SLAVE_SYSTEM_CONTROL)	+= spi-slave-system-control.o
 
 # SPI offload triggers
 obj-$(CONFIG_SPI_OFFLOAD_TRIGGER_PWM)	+= spi-offload-trigger-pwm.o
+obj-$(CONFIG_SPI_OFFLOAD_TRIGGER_ADI_UTIL_SD) += spi-offload-trigger-adi-util-sigma-delta.o
diff --git a/drivers/spi/spi-offload-trigger-adi-util-sigma-delta.c b/drivers/spi/spi-offload-trigger-adi-util-sigma-delta.c
new file mode 100644
index 0000000000000000000000000000000000000000..035d088d4d33d6d32146a340381bb167f080e085
--- /dev/null
+++ b/drivers/spi/spi-offload-trigger-adi-util-sigma-delta.c
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 Analog Devices Inc.
+ * Copyright (C) 2025 BayLibre, SAS
+ */
+
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/spi/offload/provider.h>
+
+static bool adi_util_sigma_delta_match(struct spi_offload_trigger *trigger,
+				       enum spi_offload_trigger_type type,
+				       u64 *args, u32 nargs)
+{
+	return type == SPI_OFFLOAD_TRIGGER_DATA_READY && nargs == 0;
+}
+
+static const struct spi_offload_trigger_ops adi_util_sigma_delta_ops = {
+	.match = adi_util_sigma_delta_match,
+};
+
+static int adi_util_sigma_delta_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct spi_offload_trigger_info info = {
+		.fwnode = dev_fwnode(dev),
+		.ops = &adi_util_sigma_delta_ops,
+	};
+	struct clk *clk;
+
+	clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "Failed to get clock\n");
+
+	return devm_spi_offload_trigger_register(dev, &info);
+}
+
+static const struct of_device_id adi_util_sigma_delta_of_match_table[] = {
+	{ .compatible = "adi,util-sigma-delta-spi", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, adi_util_sigma_delta_of_match_table);
+
+static struct platform_driver adi_util_sigma_delta_driver = {
+	.probe  = adi_util_sigma_delta_probe,
+	.driver = {
+		.name = "adi-util-sigma-delta-spi",
+		.of_match_table = adi_util_sigma_delta_of_match_table,
+	},
+};
+module_platform_driver(adi_util_sigma_delta_driver);
+
+MODULE_AUTHOR("David Lechner <dlechner@baylibre.com>");
+MODULE_DESCRIPTION("ADI Sigma-Delta SPI offload trigger utility driver");
+MODULE_LICENSE("GPL");

-- 
2.43.0

