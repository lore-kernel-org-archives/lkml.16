Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E6F225766
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 08:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738831060; cv=none; b=MU4DzAdcILNAdooSKRXiFoyJxiiHm1bdR70dN6X3JLVxDCkTPtjjCNv8YTdhaFDXdvjXg3DcNoCk45VF4kwkq88LtQnjvZu58WlsmyMUmH4DBdZTCO/OOb2DObeXHVPKdp2z4QvbX1EcuwmC/jkGS1T3qpHDbCe4EM8F1T2ktyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738831060; c=relaxed/simple;
	bh=b61mwkGmKa7qLwio/HyZKSIj9qw2WfofAWA65lWGS5Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YTXzhpsbvC/eIT7fjOsRWwGUcBS9Wh7ozDMPGZflTrVYvYaHDOFAIkEcOg7DTqIVGNvtc330H4FAJ15ggte/Od6GiHccr+tmeDbfIuwN1gb7vaN5e/vi+NsDtaqEvyOs2XO56WYyQULoiFePijE+rYE5klpRtHPtXTy8eKWbXh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ivrbQ/e5; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ivrbQ/e5"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38dabb11eaaso279428f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 00:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738831055; x=1739435855; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6cGRhVGZQ/G+JhIHlnkJGdUnMYCYKnsKq6xNumw1bc8=;
        b=ivrbQ/e5ShXADrc6AAc8BkSjaLLbr6Ez1K0/SiFxe5Z6vEmVZLSqv01sdDzBkhYCDP
         5iAHuGn+VJpKEuGcgQpAHa67XiGjykeI6YboOUtUAXJpyjDn7GmB3eT2qf933RT77Wrr
         EHMmIyOInibBXdCfQK+QSTtEIU0RChvXxmII7ZCa3QUfKBEy8EW4luHK2GzlXbJ03uy5
         XRdmm15AIm6VrL4ahemVS+TCsu/AWSPo83lL0fneINAJjwne0916U7Wo5SpZjjEI4Od9
         xYaAzvAXDYfzB+14gh68FQ4/YPKcyQxPS+UFArANUlgmtexYm3YX8+ji3ankmvk3cxDG
         FV+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738831055; x=1739435855;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6cGRhVGZQ/G+JhIHlnkJGdUnMYCYKnsKq6xNumw1bc8=;
        b=wK1HxS9amRe6p9kuGZvBwH2WhUqIDQnxD9VLw1n+bffyXPKA+IJ06NiIrdRTgfcFgF
         x5yu4UJX9YD7y1uVOJGkpTtjSpPHYY4SjaaBh1KMR+Sv7AHEjpBIWlcoArOi4Ipl92X/
         gllqIUtseEscBDhlbAlqpRHhFX6AJDaHxQksGyOrcV7xX7SVtfPW0Xu6rzyNj6Lm9cM2
         mRMz9qnKAF9oXDqK4SBAqzEsNj1v/b/7VJ49PA5UQBtouPHxULNR0BPTN8MCQh/kthZU
         sdJE+HYdsYed2d8Pm/N20Dem7TE4gj16OTbcFM8ryJ7mxTmgyDL9oHB2UL5QKhI8e+j5
         dkWg==
X-Forwarded-Encrypted: i=1; AJvYcCWPphjDwt/X+zINqX4zqVTmMPT8ODc7HPTz4cd102P7/DqxHy1q6nX9eKempZ+UsjoUrOL5H4E1etUXAKc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwujGU+2gW+VpfUJ6uJA5Xeb8R+cdhp0IPwdA27wSOOF19vfJPJ
	WHYclE2NiInpfMj+Z3zhqnWTVhH5o+FfMqSyzxTvdUHdoYiBMN60OLuI9E7NZLn6Ku/EIs3X4pk
	o
X-Gm-Gg: ASbGncuHUcQnzYDtaKX6wr7uLrtqNSonqJT+PA0pHhsgXcUTxQ1y8Jr9XNC1QYcC29j
	LvDX4TLe6XjlDQmcSyNBSFMah2QYhEhmKSxOf1S254/+/oadz+mlfrUDeqmwb5cgV5eaSH2KVQR
	W45UMTp0KrStGOtLDOYaQEIxAvGzqPn/f3SCibGAw6vIdzzBz2GMIEWlXbC5bhH7FVdfLOTZDxN
	9YM9Wv+5aNsrAECQan2si5R90eXKGm3C7JRvIMDL6LKf05otSz+VQ3VSaFu3OGc4+6KMzcPWNY9
	PvZWN9hPRo6g10Yqm3TYht/ry+QUgpi3kyOB6OqvrRmaKjEj79iY8S0XViCFQtO90Zbsx9w=
X-Google-Smtp-Source: AGHT+IFEG8qEl6QSztrpodBzSY7VlToA8lHWWeoXxXNowmla1vTj/PrZ5CLSg0ktKg2rUsp7PG4yPg==
X-Received: by 2002:a5d:6d09:0:b0:38a:88b8:97a9 with SMTP id ffacd0b85a97d-38db4861134mr4288492f8f.2.1738831055250;
        Thu, 06 Feb 2025 00:37:35 -0800 (PST)
Received: from [127.0.1.1] (host-95-244-234-244.retail.telecomitalia.it. [95.244.234.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391da9648dsm11948095e9.7.2025.02.06.00.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 00:37:34 -0800 (PST)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Thu, 06 Feb 2025 09:36:14 +0100
Subject: [PATCH] iio: dac: adi-axi-dac: drop io_mode check
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-wip-bl-ad3552r-axi-v0-iio-testing-carlos-v1-1-863a4b2af4ea@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAH10pGcC/x3NQQrCQAxA0auUrA3EyFTwKuIincYaKDMlKbVQe
 ncHl2/z/wGhbhrw6A5w3SyslobrpYP8kTIp2tgMTJyIqcevLTjMKOMtJXaU3XAjNKu4aqxWJsz
 icw2kO2mWoZfEAi23uL5t/6+er/P8AWZr9qR6AAAA
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Nuno Sa <nuno.sa@analog.com>, Jonathan Cameron <jic23@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.1

From: Angelo Dureghello <adureghello@baylibre.com>

Drop mode check, producing the following robot test warning:

smatch warnings:
drivers/iio/dac/adi-axi-dac.c:731 axi_dac_bus_set_io_mode()
  warn: always true condition '(mode >= 0) => (0-u32max >= 0)'

The range check results not useful since these are the only
plausible modes for enum ad3552r_io_mode.

Fixes: 493122c53af1 ("iio: dac: adi-axi-dac: add bus mode setup")
Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 drivers/iio/dac/adi-axi-dac.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/iio/dac/adi-axi-dac.c b/drivers/iio/dac/adi-axi-dac.c
index ac4c96c4ccf3..bcaf365feef4 100644
--- a/drivers/iio/dac/adi-axi-dac.c
+++ b/drivers/iio/dac/adi-axi-dac.c
@@ -728,9 +728,6 @@ static int axi_dac_bus_set_io_mode(struct iio_backend *back,
 	struct axi_dac_state *st = iio_backend_get_priv(back);
 	int ival, ret;
 
-	if (!(mode >= AD3552R_IO_MODE_SPI && mode <= AD3552R_IO_MODE_QSPI))
-		return -EINVAL;
-
 	guard(mutex)(&st->lock);
 
 	ret = regmap_update_bits(st->regmap, AXI_DAC_CUSTOM_CTRL_REG,

---
base-commit: c667ed738d7d1a01e9b946ef47cae113b0a05bee
change-id: 20250206-wip-bl-ad3552r-axi-v0-iio-testing-carlos-070ecab6a52a

Best regards,
-- 
Angelo Dureghello <adureghello@baylibre.com>

