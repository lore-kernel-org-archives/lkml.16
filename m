Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4102C21E098
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 15:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750346677; cv=none; b=lc70qwHABRUmOaWHPmcimgEL+wIhuvjy4D9VafbGAl2L4WKfmrRFAp8fyuyglwj5AEEWRARtiiPPrGkydVxSAF93hqWY8l5ueG3tD64VEKVFnPu2PkE98PoMkLNDabYluZenC80ev91C1h+afbvPUFgpfQohMhrBTU1TFuEiTdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750346677; c=relaxed/simple;
	bh=NbjRBgHS6N81ErcTQ2zDQ29eXoBt4II91JaNbgMyD+A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aQnJo2yX9Zr3/hRceB7O1pIBxiSoBM5mgb1zN5B7VQAW5G9fy/qfylEKr3+UMk4bd6J2PcFyQCn9tquZXBrpk7R4/XYWW1BKIhxJu3D4pzRienMyTCKBvn6Mafk4kevG2JRZQg3BwH4frAIxFTgpyPbvmZVjTGuzefhwy/oI3UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=GxD3DMrn; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="GxD3DMrn"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-606477d77easo554728eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 08:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750346674; x=1750951474; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oF3I2fMiAeHRxAceaNHB6NVcsL7iUt3p1A5FjN7ZNCM=;
        b=GxD3DMrn834A3NEC6yNp6TpcVoo4V5ZrAago9S2PzYVl/jLdyEcpU3pLNoNYILJXE+
         MT2+t0vJo/cjXwQOeBz1LZP+9IyCehBLQuq4zcdZpnvtOfjmT2BJCSjWq8qY5lD8gvCV
         pHdPELZq+GuPHx6Alz1KeUkKQ46XrUlUeH7/7eXqS+UiA67jeHd32mqmJaMBB1MwlyCa
         tYMtlbQsHJDEGO4DYd/FDDt6YbcebIH9eV92n0tEIb8AE+QBhM8u341BZKwWYZc1gqih
         F34i9JoNuWPO2nCyHfWgIlHordaGQ0+MlYQ0qhi9YjqwfaW/uQ0Kh0Ae2qLhQx2qIZxx
         EYAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750346674; x=1750951474;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oF3I2fMiAeHRxAceaNHB6NVcsL7iUt3p1A5FjN7ZNCM=;
        b=RKd1TpzTOI4W/m87m9E3mQszXhwK4Ue7j3nZb6w3ncr12qRGrlFFAYFJ8F4ns3t4vj
         CIETfP8DImL8W+qgCTpw6hm9VJPK82NztG/nm3/zI6NuMQC4p0Z0cIagGP+b3O965As5
         oGUiJJC4J3W515iS9E6CGXnpyAQBx/LTsPl8Bwf/r0T/O4eJVpPxX4U9chPL7D/Vw9Xm
         u029MzrkuN++oFhlvBo9cpqXc7xcJGRLkTjfHwR9W0RY9z+JVVFnoXPBsgpf1JPTNOqz
         9JR9TRULBN1qPZQNHafKr0tHUo/IXeV0gFMAeLV3wyJLB/Y9P1gTmzSSGE2sDRqblE6A
         t83g==
X-Forwarded-Encrypted: i=1; AJvYcCWTuU+5YcmI1G6Io2iSbjLUSIc+J7J4glQZhVyvAYuXXy+v2tY1R04QkWo9NmSZUgROLB/MRJG8fFExH0c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWGmNGqSmEhc/Qicxmz3oo1PUwEX7K0+mySKh6lVokWRzrO+yJ
	jFjOZR8Fz2r65WC7NBHueq3Nikd+AMk4De7sYFtSPDDEHzoVHkfHnKsZAltXly/Jqd4=
X-Gm-Gg: ASbGncuZQGSXmdccGP0WlrTYiQKDd4y8y1samTgqMU3GVwZQQdH6pU2dY1ZATh2H2GM
	wVkLKvYkSb0BAM6VARJ6edg4biZuWYpkI07X4ozlEICkAZTYR7Ihe0LwsPVgd1tkaBTr8E5pewv
	e3sAZGmRda9WHyLWi9JwU9RuE7n5P9aZ37V+FoPyCXWogygDjidXu3I2FAfq9tFxPTEpHZzmjkU
	ncffiRE5kw8CXXeKnZb7zEy/ZX8fPDupgBgj4pICHkJ2ev1zhAuTB2Kz0T6wGm+hLdZUDBiE5I3
	uSZEf7DlZKsdTyji9gh8vjf7+LtAkEYGHj/SxEPClNEBDUNUbP3AlAq00cZBb/SAO+WW
X-Google-Smtp-Source: AGHT+IFfY9+XnMj7opL/quY3CmJs8pbgKYZ2HY0gDux4/arc3IVAcwHByPhAAM5rJJxhkIaBmTx0GQ==
X-Received: by 2002:a05:6820:618b:b0:60b:c4df:e901 with SMTP id 006d021491bc7-6114e9d914dmr1658054eaf.4.1750346674260;
        Thu, 19 Jun 2025 08:24:34 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:5504:5211:6fc4:c093])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6114839c976sm354374eaf.39.2025.06.19.08.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 08:24:32 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 19 Jun 2025 10:24:22 -0500
Subject: [PATCH] iio: adc: ad7380: fix adi,gain-milli property parsing
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-iio-adc-ad7380-fix-adi-gain-milli-parsing-v1-1-4c27fb426860@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAKUrVGgC/x2NSwrDMAxErxK0rkB2+nF6ldKFiWV3IHWCDaUQc
 veKLgbmwWNmp64N2uk+7NT0g461GrjTQPMr1qKMZExe/EWubmJg5Zhmy20Mwhlfq+ASUfmNZQF
 vsXXUwiFlcT5IPk8j2d7W1Oz/1+N5HD/mktjMewAAAA==
X-Change-ID: 20250619-iio-adc-ad7380-fix-adi-gain-milli-parsing-8df01280f493
To: Michael Hennerich <michael.hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Jonathan Cameron <jic23@kernel.org>, 
 Julien Stephan <jstephan@baylibre.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1560; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=NbjRBgHS6N81ErcTQ2zDQ29eXoBt4II91JaNbgMyD+A=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoVCuoZpSj7av0dpZ8IJt3GTeSPdzwJ49Wmo5Hn
 qY29xbWBS+JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaFQrqAAKCRDCzCAB/wGP
 wOuIB/wLlo5NUyfGwiuE6OeIYXz6zBFPzTtljbZDT1dSLJsklLdye5HqJgCoqWCxko1v3rncgG7
 eeSNubseJV4enobHMucl7/uR/Phf8PCdiinQo2WLb+l+ZwrJJ75Ch7e1gwRNoXnDUdLs1vZ69k4
 mrPLS40iO7bCqWlcTUwsp4olUXpPc46+49gp+8qz3En09lsNt8Vz8mMRvPklGI4pDodFR2JIYmY
 Bx1uSDMuL558E7gjVcH7riJHQzFhh80vDsqo5r7QN5G7j9TzAZtWnEA3qCS2Q8HJvdXX7bMpzti
 OUxQYUHJ3jOQQr6wf6Wv8ls0kX4UV4JQL8jjuQ9zsxsSU5z3
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Change the data type of the "adi,gain-milli" property from u32 to u16.
The devicetree binding specifies it as uint16, so we need to read it as
such to avoid an -EOVERFLOW error when parsing the property.

Fixes: c904e6dcf402 ("iio: adc: ad7380: add support for adaq4370-4 and adaq4380-4")
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ad7380.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/ad7380.c b/drivers/iio/adc/ad7380.c
index aef85093eb16cbe9cc062f8cb4239e955c8a21b6..fd17e28e279191c2603537a9bddc7eb9976c144c 100644
--- a/drivers/iio/adc/ad7380.c
+++ b/drivers/iio/adc/ad7380.c
@@ -1920,8 +1920,9 @@ static int ad7380_probe(struct spi_device *spi)
 
 	if (st->chip_info->has_hardware_gain) {
 		device_for_each_child_node_scoped(dev, node) {
-			unsigned int channel, gain;
+			unsigned int channel;
 			int gain_idx;
+			u16 gain;
 
 			ret = fwnode_property_read_u32(node, "reg", &channel);
 			if (ret)
@@ -1933,7 +1934,7 @@ static int ad7380_probe(struct spi_device *spi)
 						     "Invalid channel number %i\n",
 						     channel);
 
-			ret = fwnode_property_read_u32(node, "adi,gain-milli",
+			ret = fwnode_property_read_u16(node, "adi,gain-milli",
 						       &gain);
 			if (ret && ret != -EINVAL)
 				return dev_err_probe(dev, ret,

---
base-commit: a3245ebdfac846ce0b563a3ed474be2e15381f9f
change-id: 20250619-iio-adc-ad7380-fix-adi-gain-milli-parsing-8df01280f493

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

