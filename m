Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A2A21ABB1
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 20:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231070; cv=none; b=KmgpD608pkchwBKMHZebmX19txJPW0HySW2qUFVo9p9Scqg0ACd8/+awtvW271vLEqBbEtnC0yJShDTQM/5B2oidzL5T6B54h6XxZJfBUae3andi+XtJxv+zb4IPu4nEYlA+wElSKLxYHqosUqtK5TKy4RFSwHcBVLIQey5aZC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231070; c=relaxed/simple;
	bh=A9x4QRTRgUNIGXpjcMRyDI9R/QUKGRcSDlVPrGn61fc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hDDwMt4Sve0fpmsCuBZSA/osIjZc1P/6YCFSWxUnm52uF8KrCX4XBFpnJ5LkEo4dkxeTw5yhIXvl1E20VWbw1vmbujdyYrYD0+3Xuf2KxH5I83B9El3ax+7bzWc35H2UzP3P6V58K86rLHoJu/NcqyI1+ZLzDYD88OQNXBbwKkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JwGfu0L0; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JwGfu0L0"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso21035066b.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 13:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231061; x=1744835861; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jI8JhkQt5M0C3/UdNCND2uJaFFyLk5YIBZciiyMnzdw=;
        b=JwGfu0L0UKldZbOQi8KwIVefxSDJcHDq5yVAltDl/ZMfHd+GrPa91vT1T90V5Xp3Do
         BAupXHo8iXxj3pz66sJ2LplvCm+uav2U2exS4GHllma/n7UztLwZ0hgjStCGjuIjsGbF
         zDfcg/5QaeGNxqw7BRXWTeMTd5hO5UJRxBtfW9tdaSAZqd7a4wz1KgRM6l8xOECndpxf
         IJokSetxQg4eF1hSnf+m8SUX408meL6V9Vwf6bVFZo8ohId7xnofoDpjBadXhtQUzYBP
         TawfjNkuuTzEv74x6mMeScXwFtysbRCJPVZRP6vukIUJNrwz6ZVCWdVug9+dtfsGSRBW
         z3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231061; x=1744835861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jI8JhkQt5M0C3/UdNCND2uJaFFyLk5YIBZciiyMnzdw=;
        b=khuYWi/0pc5yujWxXBrtBCdAwEZvI88qFPxqmV2Xa4jAg8GplFaIUqLhQxDJc/ah5X
         UREh68v5OLv3XLxK86hYR4t359ZZO+hNX/PYMrA+sXrQo7GqIWGQeTlaheXDN2hI26L4
         MgXRzNmLsssIGEeTpMX66Uu1oJlsV7VFF0sGBThvsg/vBBpCtqYjbZ91joqZzYQ6t+ez
         1Gu20aqf/3UIEkO3GmxTcRefYEkiIjtsWzV9wHSNk7YoNn9p433ffhI0iVpwWAc3viBd
         Hc/8VncmXUuKFhWjp9EBCINvKDCDMtxtVrRZRL/0rgjCdfQYTULJRsYY3Y71DUMVaRul
         aKew==
X-Forwarded-Encrypted: i=1; AJvYcCW8+/JGyvXfdalK/GuueAtKWsZpeWG5DEEBqdHLC1Qfehx5feX5Wz8AnlXIrTVaIOq3qTG4CUdygYgxbyg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUJw60Wmw7Cnn+CYrGmGWxIrU6N1W099k7SK9T3IQOFGHKB0Gt
	93m+R4uzdw8U+XKYjFNZGE97u27jGPLyfmq477YktV/9b6k7FYwJXH+xuDmU/34=
X-Gm-Gg: ASbGncs+To8qBYBE+OqzLwTI1oip0BJUnKgEGK/ieKVZ/zGlWMS7lSchk131dVSNgan
	p0lfZKVoVUzivPCp53fKKc++bvVmIplRTPa/qBKRwOIqkFCDfBQpXJ86/QxueLclHhx9X2Hzh0c
	WOIa5jdHDRRid5a+HuQ5WM5LiUT+pfiOmx0CF5whOhK0faf72dRb6lFvsxgZFIpYCRJJ/wGch+i
	aZ9VCh1lzjgUCs6Z8LI4Xdkap2px3/bRZytZwiQ0tg3putuld+rFHb+IqSZZfsvehb1oVUN1UXd
	loBvIrbVLkXPAqtBEAgb2J7j5w7FMNmbqHgxijXmdPlc/FzMbHRExum78qRdWBZnIhjFguxXmvT
	hmqibD/tjM1JyT9WylQ2cZuXEBrw=
X-Google-Smtp-Source: AGHT+IEBr6kEi5N0kVfrU69c2eMzZPUUcJ4BYVystn83LFyvx9TUXz1zdc7j3nGfMkGEvg+haxQNUQ==
X-Received: by 2002:a17:906:478d:b0:ac7:e36e:545a with SMTP id a640c23a62f3a-acabd3ba014mr6923966b.37.1744231061352;
        Wed, 09 Apr 2025 13:37:41 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:41 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:44 +0100
Subject: [PATCH v4 23/32] mfd: sec: Add myself as module author
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-23-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Add myself as module author, so people know whom to complain to about
after the recent updates.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v4:
- Lee:
  - don't sort module_author entries alphabetically
  - update commit message
---
 drivers/mfd/sec-common.c | 1 +
 drivers/mfd/sec-i2c.c    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index 448300ab547c10d81f9f2b2798d54c8a03c714d8..42d55e70e34c8d7cd68cddaecc88017e259365b4 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -296,5 +296,6 @@ EXPORT_SYMBOL_GPL(sec_pmic_pm_ops);
 MODULE_AUTHOR("Chanwoo Choi <cw00.choi@samsung.com>");
 MODULE_AUTHOR("Krzysztof Kozlowski <krzk@kernel.org>");
 MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
+MODULE_AUTHOR("André Draszik <andre.draszik@linaro.org>");
 MODULE_DESCRIPTION("Core driver for the Samsung S5M");
 MODULE_LICENSE("GPL");
diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
index 2ccb494c8c024361c78e92be71ce9c215757dd89..3132b849b4bc445cf18b2ef362092137a9b618c9 100644
--- a/drivers/mfd/sec-i2c.c
+++ b/drivers/mfd/sec-i2c.c
@@ -234,5 +234,6 @@ static struct i2c_driver sec_pmic_i2c_driver = {
 module_i2c_driver(sec_pmic_i2c_driver);
 
 MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
+MODULE_AUTHOR("André Draszik <andre.draszik@linaro.org>");
 MODULE_DESCRIPTION("I2C driver for the Samsung S5M");
 MODULE_LICENSE("GPL");

-- 
2.49.0.604.gff1f9ca942-goog

