Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D474B292B59
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 23:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751067700; cv=none; b=VygGvcV1lZXVK0kQ33K/dTqGgahKN9kwR2jGfLawGgd+yTTNHp7RasvUo6obnsYNPWRKW4TCqkAjNTAA7VhUezjLoC0z6tzRw18t3YkL4JZNvcGrtuNytxu7NqP79xaxv7CsMCEhJF0p3en8WDMeRd+6aSq7djuGkkZNbrci1I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751067700; c=relaxed/simple;
	bh=BwOGbOpYX21Ucam+bloAQXE+MG2uw4doa1iKJcVx3E8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jeHDR8mMWtuCtTFNlqSWBobGE21G6GJwCJnPp7FThCXMJcSJpdroeuPPCl44Och96fHGLx9LZy9I0yST1kVygAAMW+0AMpgYo7lYM1LG5iTFRYlSZI6lKNSG8oISuMuOrJ4dqR8MGmfaalCvxzdzOi/d43SQyICu9vaL8SluHAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=c/4RyHV5; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="c/4RyHV5"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-40b32b6af9eso948130b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751067695; x=1751672495; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T+UAVQwWtySu3Zk+qmcMSCJQC906a/pI5jwVttXUTqw=;
        b=c/4RyHV5LFVZY25p8iaZpt+nO0QlnZMazPvsJIMgNf66hBEcOYoByP58hhgQg5KaMa
         9USCnhOKAeUyr+mDYz8NZ8AaxKEUJzl3ME6ItBs6lLj2mLpEfmBixBV6jzNhlELziGsQ
         y/6nqATHDCmY4yQBvP+5oBx2sPYaanAjXxrpywvXB0rz+YU2pzVhbX86mWp4qWJDetm0
         CzcIHJ4R6HonzeI4q/z4guJzMYy2qyRrrxUrMDyR2w6fYNRVSZ9PWDILNdqS4B6qLUm8
         PWH6LpEQXPWQoiZRI+x55hJPcg6Z6/oz+AbjA8CGQrf/hPOgk8GkXVij57nJ57JflpvN
         lprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751067695; x=1751672495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T+UAVQwWtySu3Zk+qmcMSCJQC906a/pI5jwVttXUTqw=;
        b=qiRd+g7GvyR2gHG52yU7R+5m3qcokf4Z2Im6R/HTbheJ7f2qI61h0aW5kGLnbA8blN
         YIpwVpLqOU/Nfkhl394dhgBM9iRBH0JUr8MarZujlB6Sy/N73TC2uXhzRJ4KvEW5mcib
         o//EwdmholpBDktWWvWshW3/m8Bo92reakY8/oMbUNKyaJtU/LvjkjbryYr7Y/tSoRdb
         n9p2Hk2dZ/rrG/W4asghr83iXMylxkyO6bvcWXFyGK6TBVOYwsN5UH2hXS6Utmsa1jSW
         vXA34rcgM+s9cF2Bgza7iHeQfGdPKiZl8p919+wfgBcH4LGY5s6EBKml2OW3uMHvAqZR
         sucg==
X-Forwarded-Encrypted: i=1; AJvYcCVNkI7h3LKvyPaoN0LPYkVpAkQK1YTFv0CJx8qXLgK3+BS6k7p1h9LerX2mXnIxiY1Bj9WjDufEOkTVQoA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxicgFE8BeXxlQ5r1bh546orfB3t8Iu7BglScxy4cTT/YeggZPu
	VR7GnNCvvZj3t6Oly8avBd3ZjfTeciFKrkXHyJ1gtTuuRWXZKWtGNMOhXIujYrLiH2U=
X-Gm-Gg: ASbGnct2hyOqDS9zj3xE0wvL+klm7XIwcgUv199TBmi7H6ZoVZvICGXh4IM7R7n8w3L
	BhN2mG6gGBE6WlXWuTGMaHdt6cDWjrmoHptBPTwRB7jCIc3Cm9XUxdfWqsctsIET2iSAsXRlFvy
	mG/a6TLD62Vbty7rFLQcQfoJwkUX6Xe+7vINfEku1O9eRS5OEJTSDrEQxvOaipkB3/U1LLjuASM
	9pDJ3hUFtcJY1iF+dHwoHphxfhwHBd//Np15TjzgmRMbWs6LvjbtcBPPNNy3nwATIzvba7yCF07
	b2Z7ZzBh07cHHi+/OwZt2VzG/vNblOvwI84TYUQhJ8Jjr33Vun2RCM+R9GQfygO0FVU=
X-Google-Smtp-Source: AGHT+IEEal1CHZFE2diTHOLP0GoeRMSm7uX29+4AaRfusxidF+4Qf49WxkGfDDk/SU7EpttCBYtIow==
X-Received: by 2002:a05:6808:6546:10b0:40b:441e:26d9 with SMTP id 5614622812f47-40b441e278amr1295330b6e.34.1751067694612;
        Fri, 27 Jun 2025 16:41:34 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:1715:453e:e133:7d6])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b322ae4e9sm568483b6e.17.2025.06.27.16.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 16:41:34 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 27 Jun 2025 18:40:05 -0500
Subject: [PATCH v2 09/11] spi: offload trigger: add ADI Util Sigma-Delta
 SPI driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-iio-adc-ad7173-add-spi-offload-support-v2-9-f49c55599113@baylibre.com>
References: <20250627-iio-adc-ad7173-add-spi-offload-support-v2-0-f49c55599113@baylibre.com>
In-Reply-To: <20250627-iio-adc-ad7173-add-spi-offload-support-v2-0-f49c55599113@baylibre.com>
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
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoXywO9aGuRzF5vZuZtzDPnjeRPdxcPRyFFJxjK
 NlFurig58GJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaF8sDgAKCRDCzCAB/wGP
 wHMsCACKqyWrzMOsC8J5fk7Tjyev2WUWNBJmCTjLk25r/rQxhS05JnWztTWyRiBqtesqo8Ub+Hb
 3qRXEdJ2zomGRifijM+qMaWUhsacJcEhp3xiw3v4iRQqaK7mey8O0iiSCtn+IdoSMOtGZOyLwWp
 HmSIZeVchs9mm7uj1y/quAqG84lhy2/XFMt8PqIt/tgyYTQ51LRxwS0m+Zhn4TFFEvKhlHG5VgU
 BkZXbhK40UXIdhSJm/9jv4GSkqQ3Ht3koU/9aElpGYUZQ7u3QUBnvMfwLxM6HGZk6y3JPEyH5OF
 iLoi4pDCoMM5Jt1Kp0yXeCtvQxR3y4FH+2kukwenYQlXtUxe
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

