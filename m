Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A2C21883F;
	Sat,  7 Jun 2025 21:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749331623; cv=none; b=et/SW9pHy3En5XcRySJvUmdlgWG3V1JSe5k9C+wnIBFGHYTsjwHIz2htYLn6O6dW6uGaTkxUOIV/2RSAEYtbytZs4BehA4Yfjer8ztwDoPCOJkCFfe0QkdUNvl0pQ23bMtVXX673SNWS53UlRm4fWbhJzpJYdXRLcVo+0nMuXFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749331623; c=relaxed/simple;
	bh=l3+AQp3YMdQmo/F9Pvjy8CZvN/WHlsa66euqNGZMEXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XnumNWI1Vzj2deYXyc4dQYBNV+v3FXdGtgCCn8BdzlJpKbekFsTK15/N68EfZVMyK7abBKzHHNdLX3j6umFFPGGWKdw1wKQOE1ldwUeWDJ1StQxXyL6HFZd2ltGGOVQpueyZuACmrm6bFtu8FshNmiBAgswY9pz1TC1EQoNETO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AMIcw+9Q; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AMIcw+9Q"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-442fda876a6so27405705e9.0;
        Sat, 07 Jun 2025 14:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749331619; x=1749936419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zi9gf/v9L57jqniopRTs+c4G172xVpuXft/oJYVknwc=;
        b=AMIcw+9Qba8YiHJXUpMTjgHgbrDrGtJ0ZjAvP0FBAeglp/u3n5fjhGTNFW8nbpI660
         f0OZg4+VWVQzttuEKpmQbGNYI2tjBRcMYq+HXEATp95RN3WAfS3ojlN/zNDTl7C0R69O
         etmbcit1YBIexsz51wgLW4lzBPJ7pp/e5FN2hpRlPVIVaosOdap0IU0TyeWZTeLOCWH6
         Ay/3/prci4vpjnjrY+I39rr67ctyutDeRUEJAdq7N7pHpmtYfJWQctVWA5muzK6s/QK2
         /N20eOUFG4NJtajHrLdVW9VzR0OP6xmENHMBCR5eHI+4j8xfAr+wHg5/Gx4hyadJc3TK
         YPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749331619; x=1749936419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zi9gf/v9L57jqniopRTs+c4G172xVpuXft/oJYVknwc=;
        b=EmuqnTywHm2cLNTx+aZmzqU+db0/WIgbHEHUhoHtRikONQdTdRH75v4+IUGtUQ1ka2
         S9SC1xrt6BLHxmGgYe8B60nqjP19s0MSdpn1AEYyl6tOfkEx2SqUQPI3WiB+ql+/jxrS
         f9CLPahZ272HNeVpE6hkzM6hOap6w2wCzTT0W/Lg3sIGvWHw79Gj6uZATCyU+t7xz3PJ
         qR/2Wuq/dt/E+u2WK6Vy/3eojHEDk5Bs2ZV10yFV/VR2Yowd+N4ZzEclrF3qkM6ye9FZ
         7p8JR2uzEL56IkVYQSCi3LlrVvuGzDEa1wTYV/ZOVRL+ScCqJBLT583H5knzSMWNaLWQ
         bG1A==
X-Forwarded-Encrypted: i=1; AJvYcCVenoRlZiaRd+tadgQQomMn0ADsCJfI51q4IZzLo+nDpi50oIG4ctNZHFxrCsxTT5yPmWmeoDeN67ogdrJj@vger.kernel.org, AJvYcCXzCSMy03UzOqf9FwiMQLMz7baMtg2t01cir1OJU8qoqLa5L7EqdMKk0cLn/L3cQvH1nz1DuWueDekV@vger.kernel.org
X-Gm-Message-State: AOJu0YxLSqMAa+JviA9d623gcTLJMfSbMddD3EftZGnooHjwxbtZ7HES
	gI34hNvSZB2S7YANkMN769aTpHstiW2u1hzhSpsSYq1LC6loJqsZW3FfnCgaoBg=
X-Gm-Gg: ASbGncu3H9OFl8iMbOHKdQ0qEfkdSkRC/GlWmf5nmH2OGoD7cJ/d4w01jjj7HHMjXW1
	PHF00PUuwUvgdmxnjrgJHhds1Kl0tE4JZl2QdG11gE8PX+xRK3CNUrsLujEljEdXa2dpbJWJPcI
	z+Pztmyk9i1TjZ+G/nSnIrt3tDdnWbGJFWVb8qYV6I05p31zXezafhhEh9gaXXCeQXNtpDL5Uk9
	fNFUT+cPZXEaiSwLgXETc4zZVg/H6eMN9lkZH5tV8v30PLSXG92pJil1y36Yj6pTk/4DVWAhJ7X
	9q7K49UmfB3sRpOeKWofMjWVBWI3jHwjfHg5zsSg2V9UgFnUMFhr+G84yw==
X-Google-Smtp-Source: AGHT+IEXsZglgrYysNJKuFsVpLjtOLOyovzfbGPTyqbi+yPegOOhLeDurGeG566vPnfh/wOzUotnbQ==
X-Received: by 2002:a05:6000:250f:b0:3a4:e7b7:3851 with SMTP id ffacd0b85a97d-3a531cf3622mr6517007f8f.58.1749331618970;
        Sat, 07 Jun 2025 14:26:58 -0700 (PDT)
Received: from alex-x1.lan ([84.226.118.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244fd02sm5449632f8f.75.2025.06.07.14.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 14:26:58 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	jens.glathe@oldschoolsolutions.biz,
	konrad.dybcio@oss.qualcomm.com
Subject: [RFC PATCH v1 2/2] regulator: Introduce dummy regulator consumer driver
Date: Sat,  7 Jun 2025 23:25:39 +0200
Message-ID: <20250607212654.126412-3-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250607212654.126412-1-alex.vinarskis@gmail.com>
References: <20250607212654.126412-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a very simple dummy consumer driver. Designed to consume
a single regulator 'vdd', the driver will power-on on probe and PM
suspend (if supported), power-off on remove and PM resume (if enabled).

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 drivers/regulator/Kconfig          |  9 ++++
 drivers/regulator/Makefile         |  1 +
 drivers/regulator/dummy-consumer.c | 85 ++++++++++++++++++++++++++++++
 3 files changed, 95 insertions(+)
 create mode 100644 drivers/regulator/dummy-consumer.c

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 6d8988387da4..eb907ecbcbe8 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -30,6 +30,15 @@ config REGULATOR_DEBUG
 	help
 	  Say yes here to enable debugging support.
 
+config REGULATOR_DUMMY_CONSUMER
+	tristate "Dummy regulator consumer support"
+	help
+	  This driver provides a dummy consumer for a device behind an
+	  USB phy (for example) that needs power supplies, but has no
+	  own device node since it's enumerated by USB.
+
+	  If unsure, say no.
+
 config REGULATOR_FIXED_VOLTAGE
 	tristate "Fixed voltage regulator support"
 	help
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index c0bc7a0f4e67..e1d1029fd87a 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -5,6 +5,7 @@
 
 
 obj-$(CONFIG_REGULATOR) += core.o dummy.o fixed-helper.o helpers.o devres.o irq_helpers.o
+obj-$(CONFIG_REGULATOR_DUMMY_CONSUMER) += dummy-consumer.o
 obj-$(CONFIG_REGULATOR_NETLINK_EVENTS) += event.o
 obj-$(CONFIG_OF) += of_regulator.o
 obj-$(CONFIG_REGULATOR_FIXED_VOLTAGE) += fixed.o
diff --git a/drivers/regulator/dummy-consumer.c b/drivers/regulator/dummy-consumer.c
new file mode 100644
index 000000000000..813c7abce660
--- /dev/null
+++ b/drivers/regulator/dummy-consumer.c
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025, Aleksandrs Vinarskis
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/regulator/consumer.h>
+
+struct dummy_consumer_data {
+	struct regulator *regulator;
+};
+
+static int dummy_consumer_probe(struct platform_device *pdev)
+{
+	struct dummy_consumer_data *data;
+	int ret;
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->regulator = devm_regulator_get(&pdev->dev, "vdd");
+	if (IS_ERR(data->regulator)) {
+		dev_err(&pdev->dev, "Failed to get regulator\n");
+		return PTR_ERR(data->regulator);
+	}
+
+	ret = regulator_enable(data->regulator);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to enable regulator: %d\n", ret);
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, data);
+
+	dev_dbg(&pdev->dev, "Dummy regulator consumer initialized\n");
+	return 0;
+}
+
+static void dummy_consumer_remove(struct platform_device *pdev)
+{
+	struct dummy_consumer_data *data = platform_get_drvdata(pdev);
+
+	regulator_disable(data->regulator);
+}
+
+static int dummy_consumer_resume(struct device *dev)
+{
+	struct dummy_consumer_data *data = dev_get_drvdata(dev);
+
+	return regulator_enable(data->regulator);
+}
+
+static int dummy_consumer_suspend(struct device *dev)
+{
+	struct dummy_consumer_data *data = dev_get_drvdata(dev);
+
+	return regulator_disable(data->regulator);
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(dummy_consumer_pm, dummy_consumer_suspend, dummy_consumer_resume);
+
+static const struct of_device_id dummy_consumer_of_match[] = {
+	{ .compatible = "regulator-dummy-consumer", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, dummy_consumer_of_match);
+
+static struct platform_driver dummy_consumer_driver = {
+	.driver = {
+		.name = "regulator-dummy-consumer",
+		.of_match_table = dummy_consumer_of_match,
+		.pm = pm_sleep_ptr(&dummy_consumer_pm),
+	},
+	.probe = dummy_consumer_probe,
+	.remove = dummy_consumer_remove,
+};
+module_platform_driver(dummy_consumer_driver);
+
+MODULE_AUTHOR("Aleksandrs Vinarskis <alex.vinarskis@gmail.com>");
+MODULE_DESCRIPTION("Dummy regulator consumer driver");
+MODULE_LICENSE("GPL");
-- 
2.45.2

