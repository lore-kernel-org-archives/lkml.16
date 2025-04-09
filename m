Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB2E1DF749
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 09:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744190303; cv=none; b=u5b9ixmqgcHUqO2toX6BqNd7HiSfisq1Rv3We1ANdzJoc0PVgPzG2qLeZiFrX7ui16adJe9HgA4IAem3Vndpvc6UFO49UgwxkO0aU9XdMjqPnhU1LEE43yA9jNr2mzfKADGGiHZhMfxCWIxohzMHCgOGe3mWY8+tNx+5Rz7lmII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744190303; c=relaxed/simple;
	bh=VGmVlLv/g0NSChA5cTCx5HI2+YgjvT8aXwQeEVYqWkw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lXmufX9g0SREfiVlZ+QZxEvDoqhKl1EIVGe1Xtj107VA9eH1Bu8QM0je/OpdSI047kXQzo8XEoMDFz8RSv77Reg6drt+sqgCNMbDYJizSN4cA1cUGVaPpXsrS7Gt8fpEtHQwz2jE1lrLxfe6q3H7QVbrxedJs8jQCunJTmGehKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=yFcxRibb; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="yFcxRibb"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39d83782ef6so292749f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 02:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744190300; x=1744795100; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uNsJvlRDFjThPSOtGOteiq+PCHwiQFN7KKK0wuA2YaI=;
        b=yFcxRibbiRPLTEKr8P7PzYqJSta1PzmE/3EvV9ZUgMQNN55yg9RyIDzfekoyR8jiNh
         E4ePOnN7eKcw0GoC/yLyioGTzKLa29DsZeFarpYCRt1bJdLG929RQA7Av8VOpV/Q04/A
         mmvWPBE0iWgTRIjdNgLGhZ26S784FGqaZVCoZdyjInqF1KXhl7qGKhJLCKILy/Ae+Fh4
         c94gFfvpwcKGyo1XaSE0azu0PzxU3Qmu4hYjntjhdpkLIsrmq06hC9/yNKsGBsgd4fpd
         cilVfRWZF7WTlwr4g4LV11gbg6fTfyxodXFNufgsIj2jIvEP4SZA+YbUcrEaQyykc8dC
         tLAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744190300; x=1744795100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uNsJvlRDFjThPSOtGOteiq+PCHwiQFN7KKK0wuA2YaI=;
        b=Wqwkkajoo+U+4tR94vvNVZZwH7HbW48f8ITbvwVO+L14xd0JJg12nrStTukXbIDP2l
         /8Mc5cSzTdY/E8J/nk6AJCq9tYcZ/eIGLAyffBgogZZpft4c7qDaSgFoYqNOuQoyDs+9
         nrMugryH+Sa9I9OGlaJ0sa9Qj3T0hhPrlkppqg26TMQl4Fdv9UZLFKE3YtASv+O2OLEB
         otZzehPYwOqqKrbmIA+rCStnbS00YQArrxRiPTPc4bum+fNqy/kjYgGPggiLo6dIc+pc
         nNhkfD29bp8NfSIxI9XMF3VtveIE3aZEwwgMrzYnZm83GQMG2c+lZbYHvBEmhj63sADa
         iPEg==
X-Forwarded-Encrypted: i=1; AJvYcCX/qaa6oSTG5Rt0iTlIrC4HDWy+NcxpqFMUGfbnv3Ld2IPXJYF9lYfwXIcPhMBR0e1Gzr2jufd2XsneVhc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWc4mlMdREuWzIp8RVRptwVDVQ4fNUgzd7/MEO1SWxR0ITeNXc
	8/U5xbehSkU4YYipylEY4JmghqBt0/bHUAvI3mwefwC5XXzGIszroc+UEQT71YFDU/x9F75c7F2
	Z
X-Gm-Gg: ASbGnctTH5vvZpTTg76hdxbzLpAjmbAG1/18RLDEdjfRN4udllcUrydqmu2EM2LqGsa
	rhYHVt+nrSI8s6BOP7two54NnEEiAj5W8VuEVKzxopHjITBEn0bZGinfqVjiOP6v152AgL1ie8b
	32SZaEfdgIT3d76i8CxlyS91tVtxDNuyUux9eNYSLUFfA8kTQrySU8jwkMPdZUneUqmtFeSpEVI
	bLoIN7syw57rsbs/CmKMjDeRUo9NwIgrr22Gt3qTHSTvodKCaQsD0YKbdpzTrbXlNXhPY14tFW6
	qGT6Rv8Ev5MkVSzqYkA1o0DCy6fN1Yp6zbFDCKOPGOzDnM04SCY9DQfw49S1azYzOnSeNRuwNX4
	wWL6ii4KAUtoHwKZDWA==
X-Google-Smtp-Source: AGHT+IFT9E4x39vToBiKUhyXzFBNHuX1M+gngkWvQuAa7nVGL2fuwhZZLclr4C7DEzRMZaVvnYJ7CA==
X-Received: by 2002:a5d:5f93:0:b0:38d:e0a9:7e5e with SMTP id ffacd0b85a97d-39d820a3dc6mr4896719f8f.6.1744190299971;
        Wed, 09 Apr 2025 02:18:19 -0700 (PDT)
Received: from [192.168.0.2] (host-87-15-70-119.retail.telecomitalia.it. [87.15.70.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d8938b7afsm1069482f8f.58.2025.04.09.02.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 02:18:19 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 09 Apr 2025 11:16:54 +0200
Subject: [PATCH v2 1/2] iio: dac: adi-axi-dac: fix bus read
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-ad3552r-fix-bus-read-v2-1-34d3b21e8ca0@baylibre.com>
References: <20250409-ad3552r-fix-bus-read-v2-0-34d3b21e8ca0@baylibre.com>
In-Reply-To: <20250409-ad3552r-fix-bus-read-v2-0-34d3b21e8ca0@baylibre.com>
To: Nuno Sa <nuno.sa@analog.com>, Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1333;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=9pHPKsKzptvjYiQOA8UzTeuM77FIRRsobVc0fiDL1Ac=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYkj/Zs13fbkTy0wpduvtApn7d1hVtBbc/ivRrvDYkGF6y
 cR+qaU7O0pZGMS4GGTFFFnqEiNMQm+HSikvYJwNM4eVCWQIAxenAExknxbD/xAO1WMX3uZO9Da8
 08VTts92WebTEwul8oTa5724+2ZhWirDPwtvq6+bT9hWZ9pbXcxe03hY2f3bOTvFxftqDAXca2Y
 94QQA
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

From: Angelo Dureghello <adureghello@baylibre.com>

Fix bus read function.

Testing the driver, on a random basis, wrong reads was detected, mainly
by a wrong DAC chip ID read at first boot.
Before reading the expected value from the AXI regmap, need always to
wait for busy flag to be cleared.

Fixes: e61d7178429a ("iio: dac: adi-axi-dac: extend features")
Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 drivers/iio/dac/adi-axi-dac.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/iio/dac/adi-axi-dac.c b/drivers/iio/dac/adi-axi-dac.c
index 8ed5ad1fa24cef649056bc5f4ca80abbf28b9323..5ee077c58d7f9730aec8a9c9dff5b84108b3a47e 100644
--- a/drivers/iio/dac/adi-axi-dac.c
+++ b/drivers/iio/dac/adi-axi-dac.c
@@ -760,6 +760,7 @@ static int axi_dac_bus_reg_read(struct iio_backend *back, u32 reg, u32 *val,
 {
 	struct axi_dac_state *st = iio_backend_get_priv(back);
 	int ret;
+	u32 ival;
 
 	guard(mutex)(&st->lock);
 
@@ -772,6 +773,13 @@ static int axi_dac_bus_reg_read(struct iio_backend *back, u32 reg, u32 *val,
 	if (ret)
 		return ret;
 
+	ret = regmap_read_poll_timeout(st->regmap,
+				AXI_DAC_UI_STATUS_REG, ival,
+				FIELD_GET(AXI_DAC_UI_STATUS_IF_BUSY, ival) == 0,
+				10, 100 * KILO);
+	if (ret)
+		return ret;
+
 	return regmap_read(st->regmap, AXI_DAC_CUSTOM_RD_REG, val);
 }
 

-- 
2.49.0

