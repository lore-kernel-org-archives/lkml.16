Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C709C266572
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 11:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745840177; cv=none; b=DGLsGdyCgUaH9bOmw36uaWacZlq/xMWOSqUdlpJQC0n/jrSHc67ITAQFYmUP3oPHcTT+wzlRppPF8tYGOmIrpGb4b/PLU1Bhfly89fnT77OmoVvE++Qrx4V7O8MUw1CWjzfTXQzvS2I4SXGEGDhWs3YBdv4Bax2k7zT54xChCfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745840177; c=relaxed/simple;
	bh=67naAq6PaOnmLaFvOJjsKwjzFRydR4gqw9YwWryCiu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SP2mvz3xHNfIrAFjLJEHq8B9wswdHg4vZ8j2MH5+IRQy/5FGpsLTTpgNhGoXwyt1Zt1FMhAEK+ieoA03VUmLIQdbSVK7FLj7IJnZXKuIn/kkEX6uN+RceBylnqJqYdlNtRCXGxYFfVOX80xDKrvY7DREwCoK60LIav2XAr3sNkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CxKL/Qvv; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CxKL/Qvv"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac345bd8e13so649733866b.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 04:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745840171; x=1746444971; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y1SeDKzAY59zgt06duce0OM9cMi2NLYeW3dVCsmXbnM=;
        b=CxKL/QvvLgqRDd4+mRgNceme00CwcEbkeMhyYOJ4YLWYCyVHZjFlJrk4U2uxTjeQoG
         TN/ogrV0h6cQ8xqVfb6OkmIFOPsdfdtRBZnALHIXm7TP79zzNUROi/PR02fZNguQaKWi
         a+eEn5Y2Xg3pwLxjprqq2oCmaYQORv1VXXYa8ry8RntaG23wmcYUPgeS4qcdNoWGL7iq
         P98EcWywuDPb/M+m6sjdovs/itjPi1tTlyP64aFR48Msgt4QLWtVLbGyYfPPXbdYhIKA
         Tj21o/jns/gJf1WdtaLiFjHcAYDYyCL1tEv6Vx1TfgvFiYW3wQXWd4t1+lhl/abTQvTP
         mHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745840171; x=1746444971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y1SeDKzAY59zgt06duce0OM9cMi2NLYeW3dVCsmXbnM=;
        b=D2vNKStpLnBisjAJnzkRC0E/pntEVte/2PLpXET2JlRj6L3Au4vyQ+ZKnP7mibqNoE
         Y5VFpPP+CpL8frkd71WaqCypEyFSMApXTKmRD12G8JXp2hIV4OEtAeqcnYlzfFxQQzG6
         fbUTeHy9fBtS422iLEeHmbHCxgp4csoRttHX/m+e6HWTVHhT12RZ5gWk7T3dRF1j/qGZ
         InYt0viRQD2yZvuBa15QuJAQGYsuo+OvKMI9ES0vwTEAhCWz+iv81nRZoTMadJ/qqpUv
         SeTSDcogsNAfpOw9XABPF2Zg7nYaWSXJ5dusHBjP4Pc+kUvxvcGnw3f/VdOWGllN77lw
         MBNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWh0htPTRxglfx7h3yf+RVI0NQzK1zK5DAz+JCTSqZPI+hT+02wEh0Emapu0dD3Mzip+/mwBj7QhGYRjCY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKyc7SNHmv/AlNUEECqJCkkPC5g/TiXC64HXvVDs2xehm5xERk
	JF4ZQlGVL65bJXNI+xPJ/KjXR4NAAdjwfGIqYODkGwaBZUfj2h2JNW6UIJzQcSQ=
X-Gm-Gg: ASbGncsiLIUhXVxfU90h22JhtN6ia19LxPFN4nGt/QjUdvSUvlkDaWwSAspKrRYiDfi
	hTYC2wdezmNulQlrrGDP8yL4yHFP4jBx0Ds5JwLFtENyIOJ3VfQqB17u0g4UuSvZx7WrpvLUNR4
	vPyMH/ElAmybFkffdlv4uzUOlDoaoU/AnpFV9ykMUNaQP9zGt+mX3Z1vWqQKbTMV1JMLBmc7bvm
	9AaJMpX9bmIOfHURxklQyKsVQxWdZZ6ETEaog060MdYLoChxg4YhKBslL7UPN5he3p8zu+wzThg
	8lJsgBpbNiuVKAy/ixJodr1ez9/yOTRyu7etApbIsYEclb4rW2hK0Y5kZMtzbSi3iSKrkxaZxKo
	zSJe/BuoTPE+d2u2+YILBt6aqz9jT1laPe/A=
X-Google-Smtp-Source: AGHT+IEQKqUnOi9LJRluVJSKKi6ho4LnD4kuGHHT39sJpMZJZSAboOxJLIAEoM43CqcKxg8JKKcueA==
X-Received: by 2002:a17:907:9493:b0:acb:5583:6fe4 with SMTP id a640c23a62f3a-ace7104e803mr983179266b.6.1745840170741;
        Mon, 28 Apr 2025 04:36:10 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6edb1580sm619937766b.175.2025.04.28.04.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 04:36:10 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 28 Apr 2025 12:36:09 +0100
Subject: [PATCH v7 6/6] nvmem: max77759: add Maxim MAX77759 NVMEM driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250428-max77759-mfd-v7-6-edfe40c16fe8@linaro.org>
References: <20250428-max77759-mfd-v7-0-edfe40c16fe8@linaro.org>
In-Reply-To: <20250428-max77759-mfd-v7-0-edfe40c16fe8@linaro.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-hardening@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The Maxim MAX77759 is a companion PMIC for USB Type-C applications and
includes Battery Charger, Fuel Gauge, temperature sensors, USB Type-C
Port Controller (TCPC), NVMEM, and a GPIO expander.

This driver exposes the non volatile memory using the platform device
registered by the core MFD driver.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
v5:
* follow API updates of max77759 core driver

v2:
* align sentinel in max77759_nvmem_of_id[] with other max77759 drivers
 (Christophe)
---
 MAINTAINERS                    |   1 +
 drivers/nvmem/Kconfig          |  12 ++++
 drivers/nvmem/Makefile         |   2 +
 drivers/nvmem/max77759-nvmem.c | 156 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 171 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8ec9a09bed546fd9033a7cb977ac3c0533edbb30..139b44a2ea123a28b5357d65adc69ae4e373f0f7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14663,6 +14663,7 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/*/maxim,max77759*.yaml
 F:	drivers/gpio/gpio-max77759.c
 F:	drivers/mfd/max77759.c
+F:	drivers/nvmem/max77759-nvmem.c
 F:	include/linux/mfd/max77759.h
 
 MAXIM MAX77802 PMIC REGULATOR DEVICE DRIVER
diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index 8671b7c974b933e147154bb40b5d41b5730518d2..3de07ef524906ad24a89e58abdfe93529a83c80f 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -154,6 +154,18 @@ config NVMEM_LPC18XX_OTP
 	  To compile this driver as a module, choose M here: the module
 	  will be called nvmem_lpc18xx_otp.
 
+config NVMEM_MAX77759
+	tristate "Maxim Integrated MAX77759 NVMEM Support"
+	depends on MFD_MAX77759
+	default MFD_MAX77759
+	help
+	  Say Y here to include support for the user-accessible storage found
+	  in Maxim Integrated MAX77759 PMICs. This IC provides space for 30
+	  bytes of storage.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called nvmem-max77759.
+
 config NVMEM_MESON_EFUSE
 	tristate "Amlogic Meson GX eFuse Support"
 	depends on (ARCH_MESON || COMPILE_TEST) && MESON_SM
diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
index 5b77bbb6488bf89bfb305750a1cbf4a6731a0a58..a9d03cfbbd27e68d40f8c330e72e20378b12a481 100644
--- a/drivers/nvmem/Makefile
+++ b/drivers/nvmem/Makefile
@@ -34,6 +34,8 @@ obj-$(CONFIG_NVMEM_LPC18XX_EEPROM)	+= nvmem_lpc18xx_eeprom.o
 nvmem_lpc18xx_eeprom-y			:= lpc18xx_eeprom.o
 obj-$(CONFIG_NVMEM_LPC18XX_OTP)		+= nvmem_lpc18xx_otp.o
 nvmem_lpc18xx_otp-y			:= lpc18xx_otp.o
+obj-$(CONFIG_NVMEM_MAX77759)		+= nvmem-max77759.o
+nvmem-max77759-y			:= max77759-nvmem.o
 obj-$(CONFIG_NVMEM_MESON_EFUSE)		+= nvmem_meson_efuse.o
 nvmem_meson_efuse-y			:= meson-efuse.o
 obj-$(CONFIG_NVMEM_MESON_MX_EFUSE)	+= nvmem_meson_mx_efuse.o
diff --git a/drivers/nvmem/max77759-nvmem.c b/drivers/nvmem/max77759-nvmem.c
new file mode 100644
index 0000000000000000000000000000000000000000..48727cdfd392bd686a524202f9752a19def9b115
--- /dev/null
+++ b/drivers/nvmem/max77759-nvmem.c
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright 2020 Google Inc
+// Copyright 2025 Linaro Ltd.
+//
+// NVMEM driver for Maxim MAX77759
+
+#include <linux/dev_printk.h>
+#include <linux/device.h>
+#include <linux/device/driver.h>
+#include <linux/err.h>
+#include <linux/mfd/max77759.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/nvmem-provider.h>
+#include <linux/overflow.h>
+#include <linux/platform_device.h>
+#include <linux/string.h>
+
+#define MAX77759_NVMEM_OPCODE_HEADER_LEN 3
+/*
+ * NVMEM commands have a three byte header (which becomes part of the command),
+ * so we need to subtract that.
+ */
+#define MAX77759_NVMEM_SIZE (MAX77759_MAXQ_OPCODE_MAXLENGTH \
+			     - MAX77759_NVMEM_OPCODE_HEADER_LEN)
+
+struct max77759_nvmem {
+	struct device *dev;
+	struct max77759 *max77759;
+};
+
+static bool max77759_nvmem_is_valid(unsigned int offset, size_t bytes)
+{
+	return (offset + bytes - 1 <= MAX77759_NVMEM_SIZE);
+}
+
+static int max77759_nvmem_reg_read(void *priv, unsigned int offset,
+				   void *val, size_t bytes)
+{
+	struct max77759_nvmem *nvmem = priv;
+	DEFINE_FLEX(struct max77759_maxq_command, cmd, cmd, length,
+		    MAX77759_NVMEM_OPCODE_HEADER_LEN);
+	DEFINE_FLEX(struct max77759_maxq_response, rsp, rsp, length,
+		    MAX77759_MAXQ_OPCODE_MAXLENGTH);
+	int ret;
+
+	if (!max77759_nvmem_is_valid(offset, bytes)) {
+		dev_err(nvmem->dev, "outside NVMEM area: %u / %zu\n",
+			offset, bytes);
+		return -EINVAL;
+	}
+
+	cmd->cmd[0] = MAX77759_MAXQ_OPCODE_USER_SPACE_READ;
+	cmd->cmd[1] = offset;
+	cmd->cmd[2] = bytes;
+	rsp->length = bytes + MAX77759_NVMEM_OPCODE_HEADER_LEN;
+
+	ret = max77759_maxq_command(nvmem->max77759, cmd, rsp);
+	if (ret < 0)
+		return ret;
+
+	if (memcmp(cmd->cmd, rsp->rsp, MAX77759_NVMEM_OPCODE_HEADER_LEN)) {
+		dev_warn(nvmem->dev, "protocol error (read)\n");
+		return -EIO;
+	}
+
+	memcpy(val, &rsp->rsp[MAX77759_NVMEM_OPCODE_HEADER_LEN], bytes);
+
+	return 0;
+}
+
+static int max77759_nvmem_reg_write(void *priv, unsigned int offset,
+				    void *val, size_t bytes)
+{
+	struct max77759_nvmem *nvmem = priv;
+	DEFINE_FLEX(struct max77759_maxq_command, cmd, cmd, length,
+		    MAX77759_MAXQ_OPCODE_MAXLENGTH);
+	DEFINE_FLEX(struct max77759_maxq_response, rsp, rsp, length,
+		    MAX77759_MAXQ_OPCODE_MAXLENGTH);
+	int ret;
+
+	if (!max77759_nvmem_is_valid(offset, bytes)) {
+		dev_err(nvmem->dev, "outside NVMEM area: %u / %zu\n",
+			offset, bytes);
+		return -EINVAL;
+	}
+
+	cmd->cmd[0] = MAX77759_MAXQ_OPCODE_USER_SPACE_WRITE;
+	cmd->cmd[1] = offset;
+	cmd->cmd[2] = bytes;
+	memcpy(&cmd->cmd[MAX77759_NVMEM_OPCODE_HEADER_LEN], val, bytes);
+	cmd->length = bytes + MAX77759_NVMEM_OPCODE_HEADER_LEN;
+	rsp->length = cmd->length;
+
+	ret = max77759_maxq_command(nvmem->max77759, cmd, rsp);
+	if (ret < 0)
+		return ret;
+
+	if (memcmp(cmd->cmd, rsp->rsp, cmd->length)) {
+		dev_warn(nvmem->dev, "protocol error (write)\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int max77759_nvmem_probe(struct platform_device *pdev)
+{
+	struct nvmem_config config = {
+		.dev = &pdev->dev,
+		.name = dev_name(&pdev->dev),
+		.id = NVMEM_DEVID_NONE,
+		.type = NVMEM_TYPE_EEPROM,
+		.ignore_wp = true,
+		.size = MAX77759_NVMEM_SIZE,
+		.word_size = sizeof(u8),
+		.stride = sizeof(u8),
+		.reg_read = max77759_nvmem_reg_read,
+		.reg_write = max77759_nvmem_reg_write,
+	};
+	struct max77759_nvmem *nvmem;
+
+	nvmem = devm_kzalloc(&pdev->dev, sizeof(*nvmem), GFP_KERNEL);
+	if (!nvmem)
+		return -ENOMEM;
+
+	nvmem->dev = &pdev->dev;
+	nvmem->max77759 = dev_get_drvdata(pdev->dev.parent);
+
+	config.priv = nvmem;
+
+	return PTR_ERR_OR_ZERO(devm_nvmem_register(config.dev, &config));
+}
+
+static const struct of_device_id max77759_nvmem_of_id[] = {
+	{ .compatible = "maxim,max77759-nvmem", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, max77759_nvmem_of_id);
+
+static struct platform_driver max77759_nvmem_driver = {
+	.driver = {
+		.name = "max77759-nvmem",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+		.of_match_table = max77759_nvmem_of_id,
+	},
+	.probe = max77759_nvmem_probe,
+};
+
+module_platform_driver(max77759_nvmem_driver);
+
+MODULE_AUTHOR("André Draszik <andre.draszik@linaro.org>");
+MODULE_DESCRIPTION("NVMEM driver for Maxim MAX77759");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:max77759-nvmem");

-- 
2.49.0.850.g28803427d3-goog

