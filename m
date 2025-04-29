Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48832C2AD4
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 13:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745932086; cv=none; b=LMNf1wFk5ndh6fhZz3QPVKviP9vxBJBskoQmHMxBq33ZROCZYQlQZaCQ0to/TJdn6AOxt6JH7udFDpsqTHiKK6HZ3icn2zzZoYfQPE7bV6sj1eiMWrxBEDJOW5wcFstScCBzrHGJNb+CEnxz64cRZcrlvdxeKSXj6f97SAFqekI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745932086; c=relaxed/simple;
	bh=FIbVVo0rbRRf8O8fRJ5PXCBl/H6IaHSYl1ya1qer2mU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kKFdIRMwX00xbo7LCC2k+5iiFqj4Pl2MQeUbnuBpjjd43bMIlHSXciv1mHSMUmtzeeNdhEQqd2xkOB4+RF/l6qQErlyVMk9s0Dvb/A25r+dGAcnCGDeCnoEqaHSSgfRhzoxHGp6PDR8fvZ+fFH5QLwY660W1H5hwkdCd0X8VfuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=dTqUYaw2; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="dTqUYaw2"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso53290765e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745932081; x=1746536881; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rq7rXh1qobsxmTnH95x5w2HXYH7sLiudkYRgxpX7OF4=;
        b=dTqUYaw2SODnCmkeuWbsEOkHFBD/aJgkdMQeXBRBOh6XYyE5oAxz2C3zqgsKcotJad
         C9TfGxYMrpD7Ih3tB0nseQjD1I1ExH0VE68WnSU/jnExynBdNQwDKlNhM5bBef+3nTjo
         HXs4I23orxEDg9wdvriu15jPA7FKkZIY6KaG2hU3Ae0uumY8J+i4VAwOlWLXX+NXPrGV
         Ts8izUBI8PNP5ciEyLqSya6mlnOWF/SUVyU4wd1TIXgIETDPBW60MUXs++8Noa85IRgL
         GrRUDItsS1HK0OLbMIoBa7QUst99Lr+nKbUOn+NQNmrULsyVV6TQGPN2CXXmFj9zW/di
         ujVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745932081; x=1746536881;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rq7rXh1qobsxmTnH95x5w2HXYH7sLiudkYRgxpX7OF4=;
        b=vAOQKdeAerUZTc4hMB+vboCg/w4jYhsB+ZvzQXmQ7qRtjoG9YXsSxM+3Qlp6TmHGE6
         YVm/YZM2g0BW36bsavgRaYKAvwdFVAdlthMYzSTXj8xsC00uEht2gHud6PRBJnoGsux4
         3puKu/rOXO2/5orZxDtYX+IcMcUiFic//H8xXF6EdJQ6sx/3MohZrmiRRvudjgaTEUNs
         XQhFaYCoUH8bL1ysV/yDt/FMH2KAtaHG0TdlRJBmZeKMMKYbRDELj6ZFS1VkCei28IHT
         V8KOIGGVuXmhrxrFzJDzDh5tIN9iB6vGlBODfKPr6BbEaZMxBvUMaPccQYdqF3osHCA0
         vuDw==
X-Forwarded-Encrypted: i=1; AJvYcCW2YuwXyLlcKPDIeePg/qtJpcc1/sSF+YBAnwdUgQguIPuq4Fg5GAKrs8dQP83Ppovez44cN223PoCeSRA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVewFNQy9rWf9QQiiLKJxdFi8jPPZ4k5IJuW+oH3pvFqPjdM+2
	+APPGj84RxG1046fF6pI5AAD1AWy8+S9YmA3+epkeVoDdSPTMShtqbNV/5dpoNOSPAAH+QcLkgv
	e
X-Gm-Gg: ASbGnctxaiGFVjhj1SMLIcryViWc5c8uQQNnRkYHvUEETurUxKYhtzWBbVjhDhicjR6
	5lJ9rLclJcbjE4Ng6G0MDxYdST9iScoWazl96Q/ChH5UBTAjuwG45fiuUyO7xopu/4ZfySSG/io
	TGM+CyBet2tnApgmiayCTwoj2/Rjyrdojpfdmek7gRu3fqkxfi7AFam9mbmPTfJQRX8pkfKT+i5
	isNFJKy74q79lBk5gT7qqyt6Ux5vMBJf2Wb6YNBxuyUSfZF0mOGNGVTfJjaiGoLidmijjZHxByw
	34WlQlwvkcxYxDyGMroc0kmSmpjTmLoI6ZJWeIMVp+pvWM01IoqeE2zz1DSdI2HleoY5BFmG7ym
	C2hPnM1SEbEMD
X-Google-Smtp-Source: AGHT+IHH7kPdFloz0enES8t+pHJLMxDsC3PA7QswfkYDa1uwoQfq8JQ8Oti/EC5RpCr0OlT7L+7QAw==
X-Received: by 2002:a05:600c:83ce:b0:43c:f87c:24ce with SMTP id 5b1f17b1804b1-440ab8460fcmr106121275e9.21.1745932080995;
        Tue, 29 Apr 2025 06:08:00 -0700 (PDT)
Received: from [192.168.0.2] (host-87-8-31-78.retail.telecomitalia.it. [87.8.31.78])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a5310ad2sm155550565e9.21.2025.04.29.06.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 06:08:00 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Subject: [PATCH 0/5] iio: adc: add ad7606 calibration support
Date: Tue, 29 Apr 2025 15:06:44 +0200
Message-Id: <20250429-wip-bl-ad7606-calibration-v1-0-eb4d4821b172@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOTOEGgC/x3MQQqEMAxA0atI1hPIpNpBrzK4iBo1ICqtqCDe3
 eLyL96/IGowjVBlFwTdLdoyp/h+MmhHmQdF61IDExeUc4mHrdhMKN3Pk8dWJmuCbEkhk7jSiyd
 XMCS/Bu3tfN//+r4f/5nzV2sAAAA=
X-Change-ID: 20250429-wip-bl-ad7606-calibration-20a396a60352
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 devicetree@vger.kernel.org, Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1455;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=FIbVVo0rbRRf8O8fRJ5PXCBl/H6IaHSYl1ya1qer2mU=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYsgQOPfcgcvmpc7GWyE/xGfcN7mw9FsBR9IZ7/krjwpzJ
 eUKJkeodpSyMIhxMciKKbLUJUaYhN4OlVJewDgbZg4rE8gQBi5OAZiI4VuGf3oLT9/976hx87vC
 Wh+jq/e0oy23mP07y1+emTXXSXlH02+G/7HZzA/CZn2pm6D87sSOZyce+V00/1Oz8HDvz4kXmWt
 UHnICAA==
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

Add gain, offset and phase (as a delay) calibration support, for
ad7606b, ad7606c16 and ad7606c18.

Calibration is available for devices with software mode capability. 

Offset and phase calibration is configurable by sysfs attributes, while
gain calibration value in ohms must match the external RFilter value,
when an external RFilter is available, so implemented through a specific
devicetree "adi,rfilter-ohms" property.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Angelo Dureghello (5):
      Documentation: ABI: IIO: add calibphase_delay documentation
      iio: core: add ADC phase calibration definition
      iio: adc: ad7606: add offset and phase calibration support
      dt-bindings: iio: adc: adi,ad7606: add gain calibration support
      iio: adc: ad7606: add gain calibration support

 Documentation/ABI/testing/sysfs-bus-iio            |  20 ++
 .../devicetree/bindings/iio/adc/adi,ad7606.yaml    |  14 ++
 drivers/iio/adc/ad7606.c                           | 213 +++++++++++++++++++++
 drivers/iio/adc/ad7606.h                           |  13 ++
 drivers/iio/industrialio-core.c                    |   1 +
 include/linux/iio/types.h                          |   1 +
 6 files changed, 262 insertions(+)
---
base-commit: e22e3d5089987cb4250801623026992b2ba4645d
change-id: 20250429-wip-bl-ad7606-calibration-20a396a60352

Best regards,
-- 
Angelo Dureghello <adureghello@baylibre.com>

