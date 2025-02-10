Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879CC1F4618
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 16:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739203978; cv=none; b=a6uRnapsqVzsXc1nTZ1kDUCO0lCSOVlaQy6knctFw3jC+TorV0sPPRVZlVmFfmtVnhxJAoJbvU+3UDy0SCSaGjO5PIhGtet85VlMHA6TZGTIQIhfkmvQnKxo5WCjdS/4P8SGUNh8iHWp7j4ajA1kDopsP8lPzf3zHJRPO8Evzz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739203978; c=relaxed/simple;
	bh=y7IjFtUIINl7cRYxyBtc6keo4179kmfVu625qHuoAp8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LpRcjBi6mYvQDrJ93X7+eFwERE8DN2Q/pUO60DIzhX9P0sF2I6rJWT5LYfJSwwoMnIGDUD/t43GZtf57Sfavk3BrIxUdnse7sqSMRRa74R3ppiAgqaajMq7+1PwN+Re7f3lgXkwTpBpU0wgQNjTg3cjNT7q9ClND7E6GKbUD/fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=2rJneaiX; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="2rJneaiX"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4394c192285so2352925e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 08:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739203974; x=1739808774; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SVE2q3k6JdjZ4UFWVjIakaD9BHRuhH1Hcjnsp1m4Lmk=;
        b=2rJneaiXYkNjglL16S9xgk7vlN4F8+gkSOPikaxLqhmHsIOUneKK5tL27aW6KnCefH
         B7wo6RL4vt7yLkr84BP7h7iWDgcj2H1yUkWNTKYrOt0X23rtrGTSBOU1J4G46/rWTzCG
         HVQFS4qc/4+O30n3itfx0yX5saqOWeP11DH6sunTVGe8C+kg2Hrnz0XPF++NH/Q23zHk
         bwxBcfKtcjqCeJlBVxo7rcofUwPFLAqn87ivd0umJ/emQrEbB0qfOYfdt558OIAGD0kV
         xFNo3RvoJ8si/FJ3rirOFhKTJjSg0JUcid/Fr7HpVzJrz2gUlfZjQ95UnpEps1C2Inpf
         OVXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739203974; x=1739808774;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SVE2q3k6JdjZ4UFWVjIakaD9BHRuhH1Hcjnsp1m4Lmk=;
        b=R0SEMqIcbRUbOS/9v5dOYC5WEMvAiGFJBaXyO9GlZ/8FjbhnH118fTwxcEXFeaB8Br
         IusYjAfOO5M2xKfaN6SlPAsZcbrCTT7t1JabLu1RcFgVEtaxXYapgQLqlijANdUJyNJV
         IcPN3Jr2EjcPW8MJl+boBXA+SY6kneFSmxVLZBoMcZO7ocGMB/TtAu67nPHLNyhYcTVG
         mieynweY5OMgml/ExLc5BMg5sH8f+lxB2pyCEf/8T7N9VcGfn1SCEHxVBeuyZidBtkWQ
         p3cjJLGp2Q0wQJV7171sLsvusSKZVG/EPlst0gXyj/8Of2+cmHOe00cwifbtMVY1F1EI
         ae+A==
X-Forwarded-Encrypted: i=1; AJvYcCUcG4MZ/s393flLN/leVytKbTZ5oRo7GBK7yonZh8ql315SjuCKjTMqdmx/hW+KWkQF6fH0/fULRdRdRsU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwikCDAip3utnBZixqKZUCBrhy7XTjS+1p2Y30JJT8nilSjezKb
	l3fBEWxoz8nTw+0o4h/5RK8sEwp3rDB+k2oGTfNE6xrQJ8UBed5opRhNFLWrm1A=
X-Gm-Gg: ASbGncvXdqVywbjV1KtO+H6veev6jpPCAqbfhNdYOqNMr9BkKPWHQrKPJ4zgDhEN9ek
	XsD5NxppVPe8G+3RNkE6yXxm4oFy3q9CDQA/ZmmWwdcXhi8740OcDxlRCyDhZKohRGVnMZUY5RQ
	0fFfXgOjFd+7HI8unTkcxMTPkWdZlKFjkIpaDxumoOPLR1fsrzRO7EYe9CLE+piThUAmz7IqHPe
	yrIFNflYcgrxTklI5ODL5R5BEHRuQCgDUGry/P1NkWyPcz+wWAzbIZr5cdt9qNceCrXUIeeRj79
	VV1ZcmpTKgHaZOF7F/IHAGxVQHn43846C42sUeC8fxRZFHFFKnVjZ1wKO1w6s9c=
X-Google-Smtp-Source: AGHT+IGzddC47+pjDSvR9mwpmYyJVcplPKxTatIFBpfXmDpOUncoCIJE66zoIcUqHQlugsyEqtyVjA==
X-Received: by 2002:a05:600c:4650:b0:439:403a:6b77 with SMTP id 5b1f17b1804b1-439403a6d76mr56761835e9.10.1739203973800;
        Mon, 10 Feb 2025 08:12:53 -0800 (PST)
Received: from [127.0.1.1] (host-87-8-15-130.retail.telecomitalia.it. [87.8.15.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dc9ffcdsm146637945e9.15.2025.02.10.08.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 08:12:53 -0800 (PST)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Mon, 10 Feb 2025 17:10:55 +0100
Subject: [PATCH v4 5/9] iio: adc: adi-axi-adc: add platform children
 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-wip-bl-ad7606_add_backend_sw_mode-v4-5-160df18b1da7@baylibre.com>
References: <20250210-wip-bl-ad7606_add_backend_sw_mode-v4-0-160df18b1da7@baylibre.com>
In-Reply-To: <20250210-wip-bl-ad7606_add_backend_sw_mode-v4-0-160df18b1da7@baylibre.com>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Jonathan Cameron <jic23@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandru Ardelean <aardelean@baylibre.com>, 
 David Lechner <dlechner@baylibre.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 linux-fbdev@vger.kernel.org, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Guillaume Stols <gstols@baylibre.com>, 
 Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.1

From: Angelo Dureghello <adureghello@baylibre.com>

This is a preparation for the next commit adding support for register
read and write functions on AD7606.
Since sometimes a bus will be used, it has been agreed during ad3552's
driver implementation that the device's driver bus is the backend, whose
device node will be a child node.
To provide the special callbacks for setting the register, axi-adc needs
to pass them to the child device's driver through platform data.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 drivers/iio/adc/ad7606_bus_iface.h | 16 ++++++++++
 drivers/iio/adc/adi-axi-adc.c      | 65 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/drivers/iio/adc/ad7606_bus_iface.h b/drivers/iio/adc/ad7606_bus_iface.h
new file mode 100644
index 000000000000..f2c979a9b7f3
--- /dev/null
+++ b/drivers/iio/adc/ad7606_bus_iface.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2010-2024 Analog Devices Inc.
+ * Copyright (c) 2025 Baylibre, SAS
+ */
+#ifndef __LINUX_PLATFORM_DATA_AD7606_H__
+#define __LINUX_PLATFORM_DATA_AD7606_H__
+
+struct iio_backend;
+
+struct ad7606_platform_data {
+	int (*bus_reg_read)(struct iio_backend *back, u32 reg, u32 *val);
+	int (*bus_reg_write)(struct iio_backend *back, u32 reg, u32 val);
+};
+
+#endif /* __LINUX_PLATFORM_DATA_AD7606_H__ */
diff --git a/drivers/iio/adc/adi-axi-adc.c b/drivers/iio/adc/adi-axi-adc.c
index b38e8a27af94..3e1a997ace76 100644
--- a/drivers/iio/adc/adi-axi-adc.c
+++ b/drivers/iio/adc/adi-axi-adc.c
@@ -334,6 +334,36 @@ static const struct regmap_config axi_adc_regmap_config = {
 	.reg_stride = 4,
 };
 
+static void axi_adc_child_remove(void *data)
+{
+	platform_device_unregister(data);
+}
+
+static int axi_adc_create_platform_device(struct adi_axi_adc_state *st,
+					  struct fwnode_handle *child)
+{
+	struct platform_device_info pi = {
+	    .parent = st->dev,
+	    .name = fwnode_get_name(child),
+	    .id = PLATFORM_DEVID_AUTO,
+	    .fwnode = child,
+	    .data = st->info->pdata,
+	    .size_data = st->info->pdata_sz,
+	};
+	struct platform_device *pdev;
+	int ret;
+
+	pdev = platform_device_register_full(&pi);
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
+
+	ret = devm_add_action_or_reset(st->dev, axi_adc_child_remove, pdev);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static const struct iio_backend_ops adi_axi_adc_ops = {
 	.enable = axi_adc_enable,
 	.disable = axi_adc_disable,
@@ -417,6 +447,28 @@ static int adi_axi_adc_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, ret,
 				     "failed to register iio backend\n");
 
+	device_for_each_child_node_scoped(&pdev->dev, child) {
+		int val;
+
+		if (!st->info->has_child_nodes)
+			return dev_err_probe(&pdev->dev, -EINVAL,
+					     "invalid fdt axi-dac compatible.");
+
+		/* Processing only reg 0 node */
+		ret = fwnode_property_read_u32(child, "reg", &val);
+		if (ret)
+			return dev_err_probe(&pdev->dev, ret,
+					     "invalid reg property.");
+		if (val != 0)
+			return dev_err_probe(&pdev->dev, -EINVAL,
+					     "invalid node address.");
+
+		ret = axi_adc_create_platform_device(st, child);
+		if (ret)
+			return dev_err_probe(&pdev->dev, -EINVAL,
+					     "cannot create device.");
+	}
+
 	dev_info(&pdev->dev, "AXI ADC IP core (%d.%.2d.%c) probed\n",
 		 ADI_AXI_PCORE_VER_MAJOR(ver),
 		 ADI_AXI_PCORE_VER_MINOR(ver),
@@ -430,6 +482,19 @@ static const struct axi_adc_info adc_generic = {
 	.backend_info = &adi_axi_adc_generic,
 };
 
+static const struct ad7606_platform_data ad7606_pdata = {
+	.bus_reg_read = ad7606_bus_reg_read,
+	.bus_reg_write = ad7606_bus_reg_write,
+};
+
+static const struct axi_adc_info adc_ad7606 = {
+	.version = ADI_AXI_PCORE_VER(10, 0, 'a'),
+	.backend_info = &adi_axi_adc_generic,
+	.pdata = &ad7606_pdata,
+	.pdata_sz = sizeof(ad7606_pdata),
+	.has_child_nodes = true,
+};
+
 /* Match table for of_platform binding */
 static const struct of_device_id adi_axi_adc_of_match[] = {
 	{ .compatible = "adi,axi-adc-10.0.a", .data = &adc_generic },

-- 
2.47.0

