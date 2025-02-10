Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E6F1F4629
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 16:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739203979; cv=none; b=T1P4gC8ZU+2jCP0RvAMxjZiE+uIfptBt4nbwIAk60HTYkoz2FivFQ6vZbTmGdPMohIEo0x/Rm3gbJga2aUCnJCi0reoaxMfsNZAL4KiWmfmkEu8LmhJ1JstlEffez3LksUWT5nZFgYgPsVeKxM+uaxEmxPOtLsz51a4E7YapLEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739203979; c=relaxed/simple;
	bh=kcGcQmYrsxutulGmVDS42pWg73BmAmjH7DDLdDu+NPQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cyv8o0+7Syg1ja5XSr9b/uHmXRAFggy0Vra0sy068/BvIiBUXicYv+QHqUgQpPh7UZ/GBnpMwwWpVwV0TQGQdSOGWZUoWqS0UAp1qvomhKC9XizmZSf4RSHXprnsTVD5TKByYZl+4s/sdd6n5RZfp8VgDA3i6YEk3BBTdV0PZHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=EiuXY6i/; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="EiuXY6i/"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43948021a45so8005475e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 08:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739203975; x=1739808775; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1C+if+YKEqJpi1bYoVHKAsnjMOtHNz/pBwh9W+PhPBw=;
        b=EiuXY6i/MRFwPgPw4skFo9Q7OhEaJRxvQogcqEGt1pdU9NPkt+t4v0bvwiQZb3vp46
         H5AXLbvuknVzR+g88sWG0FW8i1i4VeQld15fqcomcDFh/whYdUt/nDdwPFbZFU0fL0gR
         J45/XDXCw4Hyt/1wSvggHlTPgUAqchuCAO2OQyCs8GRBtrAGIuFDL7D2W+Fso0P/EkVP
         KYBaZv8cInOmb7jptQ5NqdPvU0X2g23Czs0EVqbzIU9Lu39XDnc67RNxxjS/i9+cm5Em
         gNpUGFZPlIvWE6YeHy/HHvoeUQSgpD+Qv5pq1CwDIdpLb32SfavLihXiEmyqOzKV6Ewp
         LNcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739203975; x=1739808775;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1C+if+YKEqJpi1bYoVHKAsnjMOtHNz/pBwh9W+PhPBw=;
        b=RrF0yJ6WQiyqOXmiRDQCelzRgP1m5O5WwbUcjE+O9rvlBCIFJtJFepCOzRJls76xJC
         wyb2m0gjrI84sto/Ake3ZwBMgViGbHu56Abzd5G7DqqHB7PtjqZ2kHr5mqHwrfel9aIy
         zb/WnO6LCp6I3J3xcrH3RMuMjkfEQysEMhtiF+mjxzgYN6P5TUdaLJGvMW+qcP1Jksdf
         RuqEeb5cHNdk3d9tbRPbk7oCtaRCZAq7HOONFrQ3G2Hde592pDuG8mwurBVxtRqNYrZK
         joMwkYEW9yNWXBj+8Yhd14qhsjQCh+p0xodZgWDKsLMStQ5w8WdAZ7fQe6ihyPu8c7EP
         88ug==
X-Forwarded-Encrypted: i=1; AJvYcCVUFTQX/s+x5lAxgfDX9gRjqm7tWJcfkCuveXM1Y64HJLI79HiwxHXq3dKiICtrVbbZsAnkgYJIKGTJYC0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwogsHtinBaPdg5YOO5Ww+6eOxstgIkXtuDBJJEn78MxokBT3M9
	1+KclVblHj974x+t/ld8naImfwJvBGB4m+Y4oHskKMasNTAn1btDNnWJS/Sh66U=
X-Gm-Gg: ASbGnct5/8nYbVLyIKQAXQr1Waj1b+LCAhRh2VF0i9/5eZwBwKiOhEigH8kDvuUMfuM
	NJc78diddtZzCigyUluBT0uB6SK2bPROrvPBAYSM0r8ZNK89I6uksxWFrz+CscD6Nn12negSeHd
	ucDR5ot29wnEJcLQ+CuGLF03TA6D4H5Y9Je6faztNSi27DpuUJm0D71ji6cSzWzLBiE5aAloGax
	YKgiOLT+lWk60mg5BZdcNLTwBye2v+p7WiG/rIE31cwF1b9+XpFZDsQ3GE2JdFauXcvkpaDx5Qb
	PqxlilRa9YC4YlZlyzHoIfNdtNSsQrzoPsKXh9AJVXe44JvebaE6+Io4Xa+sloo=
X-Google-Smtp-Source: AGHT+IGuGl/koZTTMgPYM0KjMaUoO3aLh+70LVpTD0ygQeKoCwymAreIkWoD/pXb0RvkUatuAU1IoQ==
X-Received: by 2002:a05:600c:1da8:b0:434:a75b:5f59 with SMTP id 5b1f17b1804b1-43924971286mr113884265e9.3.1739203975266;
        Mon, 10 Feb 2025 08:12:55 -0800 (PST)
Received: from [127.0.1.1] (host-87-8-15-130.retail.telecomitalia.it. [87.8.15.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dc9ffcdsm146637945e9.15.2025.02.10.08.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 08:12:54 -0800 (PST)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Mon, 10 Feb 2025 17:10:56 +0100
Subject: [PATCH v4 6/9] iio: adc: adi-axi-adc: add support for AD7606
 register writing
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-wip-bl-ad7606_add_backend_sw_mode-v4-6-160df18b1da7@baylibre.com>
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

From: Guillaume Stols <gstols@baylibre.com>

Since we must access the bus parallel bus using a custom procedure,
let's add a specialized compatible, and define specialized callbacks for
writing the registers using the parallel interface.

Signed-off-by: Guillaume Stols <gstols@baylibre.com>
Co-developed-by: Angelo Dureghello <adureghello@baylibre.com>
Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 drivers/iio/adc/adi-axi-adc.c | 81 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/drivers/iio/adc/adi-axi-adc.c b/drivers/iio/adc/adi-axi-adc.c
index 3e1a997ace76..225ea0497ba9 100644
--- a/drivers/iio/adc/adi-axi-adc.c
+++ b/drivers/iio/adc/adi-axi-adc.c
@@ -27,6 +27,7 @@
 #include <linux/iio/buffer.h>
 #include <linux/iio/iio.h>
 
+#include "ad7606_bus_iface.h"
 /*
  * Register definitions:
  *   https://wiki.analog.com/resources/fpga/docs/axi_adc_ip#register_map
@@ -73,6 +74,12 @@
 #define ADI_AXI_ADC_REG_DELAY(l)		(0x0800 + (l) * 0x4)
 #define   AXI_ADC_DELAY_CTRL_MASK		GENMASK(4, 0)
 
+#define ADI_AXI_REG_CONFIG_WR			0x0080
+#define ADI_AXI_REG_CONFIG_RD			0x0084
+#define ADI_AXI_REG_CONFIG_CTRL			0x008c
+#define   ADI_AXI_REG_CONFIG_CTRL_READ		0x03
+#define   ADI_AXI_REG_CONFIG_CTRL_WRITE		0x01
+
 #define ADI_AXI_ADC_MAX_IO_NUM_LANES		15
 
 #define ADI_AXI_REG_CHAN_CTRL_DEFAULTS		\
@@ -80,6 +87,10 @@
 	 ADI_AXI_REG_CHAN_CTRL_FMT_EN |		\
 	 ADI_AXI_REG_CHAN_CTRL_ENABLE)
 
+#define ADI_AXI_REG_READ_BIT			0x8000
+#define ADI_AXI_REG_ADDRESS_MASK		0xff00
+#define ADI_AXI_REG_VALUE_MASK			0x00ff
+
 struct axi_adc_info {
 	unsigned int version;
 	const struct iio_backend_info *backend_info;
@@ -311,6 +322,75 @@ static struct iio_buffer *axi_adc_request_buffer(struct iio_backend *back,
 	return iio_dmaengine_buffer_setup(st->dev, indio_dev, dma_name);
 }
 
+static int axi_adc_raw_write(struct iio_backend *back, u32 val)
+{
+	struct adi_axi_adc_state *st = iio_backend_get_priv(back);
+
+	regmap_write(st->regmap, ADI_AXI_REG_CONFIG_WR, val);
+	regmap_write(st->regmap, ADI_AXI_REG_CONFIG_CTRL,
+		     ADI_AXI_REG_CONFIG_CTRL_WRITE);
+	fsleep(100);
+	regmap_write(st->regmap, ADI_AXI_REG_CONFIG_CTRL, 0x00);
+	fsleep(100);
+
+	return 0;
+}
+
+static int axi_adc_raw_read(struct iio_backend *back, u32 *val)
+{
+	struct adi_axi_adc_state *st = iio_backend_get_priv(back);
+
+	regmap_write(st->regmap, ADI_AXI_REG_CONFIG_CTRL,
+		     ADI_AXI_REG_CONFIG_CTRL_READ);
+	fsleep(100);
+	regmap_read(st->regmap, ADI_AXI_REG_CONFIG_RD, val);
+	regmap_write(st->regmap, ADI_AXI_REG_CONFIG_CTRL, 0x00);
+	fsleep(100);
+
+	return 0;
+}
+
+static int ad7606_bus_reg_read(struct iio_backend *back, u32 reg, u32 *val)
+{
+	struct adi_axi_adc_state *st = iio_backend_get_priv(back);
+	int addr;
+
+	guard(mutex)(&st->lock);
+
+	/*
+	 * The address is written on the highest weight byte, and the MSB set
+	 * at 1 indicates a read operation.
+	 */
+	addr = FIELD_PREP(ADI_AXI_REG_ADDRESS_MASK, reg) | ADI_AXI_REG_READ_BIT;
+	axi_adc_raw_write(back, addr);
+	axi_adc_raw_read(back, val);
+
+	/* Write 0x0 on the bus to get back to ADC mode */
+	axi_adc_raw_write(back, 0);
+
+	return 0;
+}
+
+static int ad7606_bus_reg_write(struct iio_backend *back, u32 reg, u32 val)
+{
+	struct adi_axi_adc_state *st = iio_backend_get_priv(back);
+	u32 buf;
+
+	guard(mutex)(&st->lock);
+
+	/* Write any register to switch to register mode */
+	axi_adc_raw_write(back, 0xaf00);
+
+	buf = FIELD_PREP(ADI_AXI_REG_ADDRESS_MASK, reg) |
+	      FIELD_PREP(ADI_AXI_REG_VALUE_MASK, val);
+	axi_adc_raw_write(back, buf);
+
+	/* Write 0x0 on the bus to get back to ADC mode */
+	axi_adc_raw_write(back, 0);
+
+	return 0;
+}
+
 static void axi_adc_free_buffer(struct iio_backend *back,
 				struct iio_buffer *buffer)
 {
@@ -498,6 +578,7 @@ static const struct axi_adc_info adc_ad7606 = {
 /* Match table for of_platform binding */
 static const struct of_device_id adi_axi_adc_of_match[] = {
 	{ .compatible = "adi,axi-adc-10.0.a", .data = &adc_generic },
+	{ .compatible = "adi,axi-ad7606x", .data = &adc_ad7606 },
 	{ /* end of list */ }
 };
 MODULE_DEVICE_TABLE(of, adi_axi_adc_of_match);

-- 
2.47.0

