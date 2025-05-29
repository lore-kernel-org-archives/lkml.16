Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B1E219A7D
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 09:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748510162; cv=none; b=FKHoSiHfJeWAvqO7lGjx4IVM3mNfssiNIZnDU6BmNdS+ZoZYyl4UwkgRT78oy9WuNo4goAY6WrOoc5NPKqZTz/C5lia1pIfvjaXZqExntPmBPoyK0Ok26rzjJMJreADyl2rsD47Y4dQYXp9amMcwlB69ZSQimquVJfiJInfOct8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748510162; c=relaxed/simple;
	bh=EuVopUch3RvcMm8wwL4YgvpMZfFl3NzeePoEsn6JRZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OHYRxqAFPeyG2NXEp37Yyoo9PZJnXF6XH7n25NnNZ/I70K3cx6/9rFSu1gXZe6qlz0QR/ep9qyud57VmQ1xfwQZrKGlDAz9wEFydIpDelIEFI1zE8dTgfvRc5VehSosD16gk/+BDX+uaT+brI1qYjBm4ANOrtmbFl/C1QGEHDRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=uGVg0411; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="uGVg0411"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-442f4a3a4d6so4687425e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 02:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748510158; x=1749114958; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lmgqoKB1/8SUojJrwigc9jIEEcoeGxp7/cQDPaSjq8M=;
        b=uGVg04111x4ebYSbS/+cu1Ijo0fP8cy1LAfXasWe+SIwCgJTZ98EsC+a2db7O33c+d
         ETJADGql4CkTfMP3dRSCsCWlCkygJiUOPokkTsSdyhodJq2jGKsSHg200gchzbBt+9Uc
         RHLgjdtyepJZSuaaVMOWmi72QHdQGGcxSMndZ1DOMe/Yj789BJ7VQgZzeZfGUHi8xfK+
         xIN7KTyHirZg78PJ1kq+m0hCTk9JmpXRIHDMgygfqgkZJdUUwyRzMh7OPn9VvVC04CVE
         8qduLHuFv+Du6Sw5ja5kwleeavuR1tF5XnD3Ygn4xKHrEZYM/VDtqsYpPCCO5ub/tkuf
         TCWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748510158; x=1749114958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lmgqoKB1/8SUojJrwigc9jIEEcoeGxp7/cQDPaSjq8M=;
        b=ndF2lxaA84eZDvgh2tuRtbjsNoT3/XaSxB0Kiub15TbFO8fVG5ztJe4ucL+u+LQYob
         W1qSaQs91RtwQ/sHi6dRV7eNTn8KsAKN5JMEhvbZao02RdAVC8K1wD8E4joxkIN4coWZ
         UkWqFpaodaejV2V+LPerAngYIpmdn9v1YcZjJuY/o1u4WqQpXH42ztGYQoCCJDqHgtIF
         Ehc91lfWzYEbu3XmYuKnoZVJI50a+1178ApjKYEfnHPYtFeb9DBqDqUi7/Buhk0zveWx
         keen5ia9A8VTqGTLRjSGHLZWfaRD5pNzuCztY7NAfaxOC6sd/IcpAq/yJ6UT0WImmfvj
         9kDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFKNkw2+HyoySuqKh1XuhMK49nd0FC1Vhbr1Zci138vtEbZKBEWCs75qYI75lTjMbRi+0Yp+m53X8hwWM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyW/7driM1T2CzhEuZAlisVkI5rhUsfX0p4e/tbUspKoMjEir2W
	191N4DY+SK+s45lpD7Xp+hh8jUrN3uxXytm0CiTuZMbavOuSO67jigOwlAD0AGY/+4k=
X-Gm-Gg: ASbGnct5hTyb6iMV3avLolcFSTwu9HXGKlLKFwrqDf6y+Kba3l7sk8plILV6p/egn1Z
	oEyzqnzRNN0eUmOLSlF56m4Wxf5u0Nn7AZfWvLl8n2VS6aXC+ko1pVs1lj0sZHnepIYevK55sC3
	YyBErLkgu+HtOCwHv+vAAmUbsEouc3+IjJiIrscp2RWj07vvPghd62cuiUSKnXIMO/FYWHuaMgi
	lKfkwk+vBdWXY1hhIMG4f/VeV/jGCeJeP8WUIl5aEssxJByXSYmscv+7s2WoOc/oxOaR561CxWD
	UtUdQn7JEdp1aghlw4ThmBjlhkgqqhmmeBL7djciQ4Kr8y7uO4eWC9wQf90GQWFoK9ds4L/Wfdq
	VXrs6pSrS5bXQDxKkWRx2eqh9lUXcFdE=
X-Google-Smtp-Source: AGHT+IEvLfj9BL1ztMv9CtDCi1fKM3delubMKoMo6AZBVoD7y6ZKAUIZodqOon+tI100H4Dxv9BUVw==
X-Received: by 2002:a05:600c:450b:b0:439:8878:5029 with SMTP id 5b1f17b1804b1-450ce81cd83mr27275015e9.2.1748510158379;
        Thu, 29 May 2025 02:15:58 -0700 (PDT)
Received: from [192.168.0.2] (host-80-116-51-117.retail.telecomitalia.it. [80.116.51.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450cfc348bdsm14318475e9.33.2025.05.29.02.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 02:15:57 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Thu, 29 May 2025 11:13:54 +0200
Subject: [PATCH 1/2] iio: adc: ad7606: enable Vdrive power supply
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-wip-bl-ad7606-reference-voltages-v1-1-9b8f16ef0f20@baylibre.com>
References: <20250529-wip-bl-ad7606-reference-voltages-v1-0-9b8f16ef0f20@baylibre.com>
In-Reply-To: <20250529-wip-bl-ad7606-reference-voltages-v1-0-9b8f16ef0f20@baylibre.com>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=907;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=WbJxk5bQxvmJFaViamimQiGxr43ZTZXKFb47GKJ4NwQ=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYsiwUK0y3GE+8d1820V5z3j0kyYVcO3hm/Cw7An/porti
 Un7l2x61lHKwiDGxSArpshSlxhhEno7VEp5AeNsmDmsTCBDGLg4BWAiOgYM/6xux644UX75XQTf
 pIU5uxRXV5yJYOtLl/+a5r5w0amXV7MZGW6eb+HeE2e32YSxaqvNr3NGkmvCzSI05JqfRR5brZj
 6mxcA
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

From: Angelo Dureghello <adureghello@baylibre.com>

Enable Vdrive power supply. The "vdrive-supply" property is mandatory,
already declared in fdt dt_schema.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 drivers/iio/adc/ad7606.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/iio/adc/ad7606.c b/drivers/iio/adc/ad7606.c
index 185243dee86ed2e9ebc43b578003d0c010e97a9f..3bbe9c05b5edbc11e8016c995c6ab64104836e7b 100644
--- a/drivers/iio/adc/ad7606.c
+++ b/drivers/iio/adc/ad7606.c
@@ -1330,6 +1330,11 @@ int ad7606_probe(struct device *dev, int irq, void __iomem *base_address,
 		return dev_err_probe(dev, ret,
 				     "Failed to enable specified AVcc supply\n");
 
+	ret = devm_regulator_get_enable(dev, "vdrive");
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to enable Vdrive supply\n");
+
 	st->chip_info = chip_info;
 
 	if (st->chip_info->oversampling_num) {

-- 
2.49.0

