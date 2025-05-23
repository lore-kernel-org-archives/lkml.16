Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C0C19C540
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 09:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747990962; cv=none; b=ifL+oHDGPmGpknwCE2S3akIqVydyMddpUUfRO8R0r+uYZmHHjs4IbBYwbswjzSY1oQPCZ9YqLNw4Cn3IoR3w0z42AshvhgN+j8PMIMleIOx2EYgSKwE5ZLwQrKyMeo6SpkIPA2FftzDRBnhukT245+yITrlKQn1srUF0XXDjoW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747990962; c=relaxed/simple;
	bh=t+2wg/im9GsjlMOMyqD6Y8bP0GtfueucqSW1F/TEN7Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MTzxenA106ySj3XTWgpSDdtTpE832hekTs37fJbst9c4Noo0zOFj8NzrF7K+Ka8Z7HhQSJZFO3K8SYKlrC+XEcg9X3RqYFXLxB+r9XYA0fJ7XyRWtcj0LNPQ4EYatqA1y5NJJVBzQbTtZCr7PEDTWvGtUplLPOCXMyaz8lT0GdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=dauq8cOb; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="dauq8cOb"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-44b1f5b917fso5905645e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 02:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747990959; x=1748595759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jKpkNV3SXeHqrS6D+3v2aMiEBXZmPFC/PcnbOJXtLFY=;
        b=dauq8cObDrFn+66ZE0vzes2dsb1/uRaeVvvt3SEZcPYnPVMSFFtwDl4u8zNp+xZCDV
         AvX8qcytzdgPnAPTjR1qMab7JBDzeNuQZ7IKq1nKvuqxoLMIZsmZFs9i6GenivHWSSfw
         zS3LAAkGrbxA9+FV2W45wSBLUtL5NNMzJQ6IhNKXVdCYyjIStg6+xMGGQuUsQxQK+9uo
         UnbS7mCGKVthLlDvIxgn6sVIXg9MA1ANSI5r1qDdl3Jhk4q2QxKbiiiJ6hSwQEUO3dog
         l0X8re/kwpGQGFdpRErFHf18X23oeZ1S1EsVxe/5b/OHPks3jrxNLdmLa2TK40IKe1Dg
         SWKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747990959; x=1748595759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jKpkNV3SXeHqrS6D+3v2aMiEBXZmPFC/PcnbOJXtLFY=;
        b=rE+YSuqZ1IOWS5PPxpSbnQ2tqw9RCqSLQbZH8ToRGPBdVC7v8SOZgALSCOJzaT/V51
         bnajzQEEfBzpDmUH6tFqdupZUPby8WlyO4Jdhc38IzfgxIEOFdgK3E7gLZ50i8AdZ9Dh
         TtRihC14uIPbshiAG8gj3odt9jjNZ/LkuKoPgOCRZMQ2q31FM4DtMiJnxjBDAUD9ofZx
         eZWQxLNInOV9lJO0LW9/5PL/Xg5f1KDCG6IpXJeR4xzwl7CmmGqb3RM1LwlsQFjMYjpK
         Qn4C7PMvabzIzDpNb6g0kbR9eU6XL1vDGdqyBtktYeDJLqpNNgtJ/uBpmTMatXPPVa7P
         OUuA==
X-Forwarded-Encrypted: i=1; AJvYcCWb9XM7ON7kRyvFeDNs5b0/U9/R/BlhjhphT6Ii/WUOuwxBhW1bAS3oGpofEADsgJcOXSooBH+5xK+95po=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsfenSCHzZuCUSMwgmFNPH80jMZDXtWSQTApaGhSBcPwg9ufPd
	XLvJPPUPrUluSSdgFLuYzKuU8PktU5KiF2XD/5AJ4PRBBPRAhK9FoDfo//XcR5B3KpE=
X-Gm-Gg: ASbGncvgY+Ya1YslAWj6K9+oK2jLsAlf9CPRmBn7dnKFJZY28IveIpSC9g3fC6forc1
	OQ3KpVx5k+eEut6dj930ejDKRREH5qy2XR/9tEC2UsXuXgiZ4whIPc0bdEN4RP8y8/dRoeOM6cV
	L02sEnO0S5+95tIbk2BKqevJI3b6VDS1O51zEgr63+9GU29HDDcQ2Q0PTwbaYgsKpV/fwzaxW52
	TZfICgKvAMkZs/+1fbyJZaZwZySFV5QusEvkXmlO0D7GZh8/dttsrViEEZOthbSPf4MrE8LuFRH
	SODhhZAVChLwIEzPy/xZUTBFXbrEhv23H6iyUl9QJwmMPSAEu1n7V7Tyoa/AacwbsCxkfG8H8cE
	ziwpEe5Ok9yz85+uLkhipinVPUrQShnyMYSY=
X-Google-Smtp-Source: AGHT+IEfkCWtnAz2Ut+c/RcaUv20GrBbxbWsIafWK74cV7/A73jY8Tz1YTzdvhIqsTKB5dPUtwo4Wg==
X-Received: by 2002:a05:600c:384e:b0:43d:abd:ad1c with SMTP id 5b1f17b1804b1-44b6cc097cbmr26260005e9.6.1747990958674;
        Fri, 23 May 2025 02:02:38 -0700 (PDT)
Received: from [192.168.0.2] (host-80-116-51-117.pool80116.interbusiness.it. [80.116.51.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f24b6471sm134043205e9.24.2025.05.23.02.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 02:02:38 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Fri, 23 May 2025 11:00:52 +0200
Subject: [PATCH v3 2/2] iio: dac: adi-axi-dac: use unique bus free check
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-ad3552r-fix-bus-read-v3-2-310e726dd964@baylibre.com>
References: <20250523-ad3552r-fix-bus-read-v3-0-310e726dd964@baylibre.com>
In-Reply-To: <20250523-ad3552r-fix-bus-read-v3-0-310e726dd964@baylibre.com>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Nuno Sa <nuno.sa@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3183;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=OUNkS1ULu9ll48ccHn6oE6CpzPsdxL2j22mLRTgDSiA=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYsgwsEw51T0z9kPcyv0HovNmdZV+K//OMJs300WO93/Al
 wteh31iO0pZGMS4GGTFFFnqEiNMQm+HSikvYJwNM4eVCWQIAxenAEykuJ+Rof+a2E9LyVOMtzc8
 ne2Z7p+18Uuhnn1OObPS0vhPNpn5sowMfa+6bJ0VatnP5Fmt59Ti+JW1jc1BIW5Wvv7BtXW2HFO
 5AA==
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

From: Angelo Dureghello <adureghello@baylibre.com>

Use a unique function for the bus free check by polling, to reduce
duplicated code. An error is always thrown in case of timeout.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 drivers/iio/dac/adi-axi-dac.c | 42 ++++++++++++++++++++++--------------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/drivers/iio/dac/adi-axi-dac.c b/drivers/iio/dac/adi-axi-dac.c
index 5ee077c58d7f9730aec8a9c9dff5b84108b3a47e..de959ab116e26f98385d5f5c259d6d1e01a448d9 100644
--- a/drivers/iio/dac/adi-axi-dac.c
+++ b/drivers/iio/dac/adi-axi-dac.c
@@ -635,15 +635,26 @@ static int axi_dac_ddr_disable(struct iio_backend *back)
 			       AXI_DAC_CNTRL_2_SDR_DDR_N);
 }
 
+static int axi_dac_wait_bus_free(struct axi_dac_state *st)
+{
+	u32 val;
+	int ret;
+
+	ret = regmap_read_poll_timeout(st->regmap, AXI_DAC_UI_STATUS_REG, val,
+		FIELD_GET(AXI_DAC_UI_STATUS_IF_BUSY, val) == 0, 10,
+		100 * KILO);
+	if (ret == -ETIMEDOUT)
+		dev_err(st->dev, "AXI bus timeout\n");
+
+	return ret;
+}
+
 static int axi_dac_data_stream_enable(struct iio_backend *back)
 {
 	struct axi_dac_state *st = iio_backend_get_priv(back);
-	int ret, val;
+	int ret;
 
-	ret = regmap_read_poll_timeout(st->regmap,
-				AXI_DAC_UI_STATUS_REG, val,
-				FIELD_GET(AXI_DAC_UI_STATUS_IF_BUSY, val) == 0,
-				10, 100 * KILO);
+	ret = axi_dac_wait_bus_free(st);
 	if (ret)
 		return ret;
 
@@ -734,12 +745,9 @@ static int __axi_dac_bus_reg_write(struct iio_backend *back, u32 reg,
 	if (ret)
 		return ret;
 
-	ret = regmap_read_poll_timeout(st->regmap,
-				AXI_DAC_UI_STATUS_REG, ival,
-				FIELD_GET(AXI_DAC_UI_STATUS_IF_BUSY, ival) == 0,
-				10, 100 * KILO);
-	if (ret == -ETIMEDOUT)
-		dev_err(st->dev, "AXI read timeout\n");
+	ret = axi_dac_wait_bus_free(st);
+	if (ret)
+		return ret;
 
 	/* Cleaning always AXI_DAC_CUSTOM_CTRL_TRANSFER_DATA */
 	return regmap_clear_bits(st->regmap, AXI_DAC_CUSTOM_CTRL_REG,
@@ -760,7 +768,6 @@ static int axi_dac_bus_reg_read(struct iio_backend *back, u32 reg, u32 *val,
 {
 	struct axi_dac_state *st = iio_backend_get_priv(back);
 	int ret;
-	u32 ival;
 
 	guard(mutex)(&st->lock);
 
@@ -773,10 +780,7 @@ static int axi_dac_bus_reg_read(struct iio_backend *back, u32 reg, u32 *val,
 	if (ret)
 		return ret;
 
-	ret = regmap_read_poll_timeout(st->regmap,
-				AXI_DAC_UI_STATUS_REG, ival,
-				FIELD_GET(AXI_DAC_UI_STATUS_IF_BUSY, ival) == 0,
-				10, 100 * KILO);
+	ret = axi_dac_wait_bus_free(st);
 	if (ret)
 		return ret;
 
@@ -787,7 +791,7 @@ static int axi_dac_bus_set_io_mode(struct iio_backend *back,
 				   enum ad3552r_io_mode mode)
 {
 	struct axi_dac_state *st = iio_backend_get_priv(back);
-	int ival, ret;
+	int ret;
 
 	if (mode > AD3552R_IO_MODE_QSPI)
 		return -EINVAL;
@@ -800,9 +804,7 @@ static int axi_dac_bus_set_io_mode(struct iio_backend *back,
 	if (ret)
 		return ret;
 
-	return regmap_read_poll_timeout(st->regmap, AXI_DAC_UI_STATUS_REG, ival,
-			FIELD_GET(AXI_DAC_UI_STATUS_IF_BUSY, ival) == 0, 10,
-			100 * KILO);
+	return axi_dac_wait_bus_free(st);
 }
 
 static void axi_dac_child_remove(void *data)

-- 
2.49.0

