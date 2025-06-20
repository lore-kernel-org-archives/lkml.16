Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBF233F7
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 14:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750429860; cv=none; b=X+jE5fGR1aL/QzYcTGjGSsFV1dv3sVr8MjKrT2+kCDF+3alyhFlfKfIoW0NGfkZU218h09jwq0TFgYvWHQNQHalIQLO8MlYKJNEJ/2P2aJpgs/hLX5AmNHT8DR6sS5A8+QVtf3muB2mQVPQS11DC5ijOA2YGMYt+ZSJdQnAG83k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750429860; c=relaxed/simple;
	bh=d+tBbnXnuP1Aw18tSmzyeeXf7BJTncfiaueZLDk2Uss=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rxAnKQu9KEsvVxLBePjnGtl95c1Tdz4WmG6QREHUTiOtgio30drppG1MJk6eAirU0BGc/JAhDY+k6c9ViNXE4ivUz5nAuNlBVpn/x6Nipxc58a6prxhibf1nRXUOpfpd0PBCrLOJyQFb6T8AcTC4K3OSXu4JwrtVAv9nn9vQYaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=qnpQakUv; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="qnpQakUv"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-73a01a7bee7so593554a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 07:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750429856; x=1751034656; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tmVzPllUaqBQmdNyvqNOvQadtFWcR0uWxu6A+vRIQOk=;
        b=qnpQakUvfv6xC5ZiXu4rcIFTUjgTlOt1kP19i356MyxTPADTKyrVIvGcEGdgt31Tx+
         EL98viIpkMDuZj9WlUeIwRDIrYWSf50jzoimRFaUk4N4Pda6aOe7UPufifpj9ngB4/en
         f86d3T3vSZdcuHCyjQLgojgdbzAcEe55uJsqK+cowiWN0Pmb7CAMTp2jYI4qqaKGuGls
         Ck1b3r2p4pwzYOaXO15G3jLMiIq9JuZXBuuY29q5XsYvJJiVfisEnPH+pVqHTmjAhypn
         1Nmt5yrLViPPQs7pwB1k68FDgc/f1E32kfLkSVmppoTVAickIJDrnTy4Z4QivkxF6NQs
         AJMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750429856; x=1751034656;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tmVzPllUaqBQmdNyvqNOvQadtFWcR0uWxu6A+vRIQOk=;
        b=mQZapPu/U54N2zJJZ0y+SdN7UOaHPTbBBwD0aOi7qPDFdECok9QMyiYfde9XQUcEmZ
         FTtWJ0efRXppYuruCiK5iFXXXOXdM+nzqSPdm5Q3BcrLTHfQizTg26YBy6Fv/GkAMBva
         Kedr5ylKC5xR/i8De/aU/YwJvjtrExdrP2YRG2O7JXpVky0RuOvI8y5WPrJ9iKGyabOQ
         FwmC9zSyvoky4ZZRh/AgRNaCnFEWbciSNJxso5qDS/L/EtDTnQSfJCjzaFHncLdE1CyK
         PIPpjSPtm7bItA4qEKsZT5vpmNEyxdI+iyVGKN/KDPum20mo98sltYvz7R2GdhtRbUrH
         Z7kQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2cE4AUmfmq+eKEw45BaB+tOYM8ANAxWpG2Z9JehWHJnL1ygE6RlUxkOZ3zsOGmL/aJTU5HGfLnnQSacI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4s75Z0PtZhYj/gCRHeA+ViXjXlonBOWr/NRjUxzPjtjyZa7qJ
	cCo0tnwWS0S0xf8Hw1WsEsrPJmOtz2EiJ+V8WncQ9Se51clniiu2yGV0WVJWU88wDf4=
X-Gm-Gg: ASbGnctbDtiDci2a3hfNKqLdR0DMF1WfNgnXZnf1zTAjv6KTmlpcCbtPYyxlsuot6br
	jgJjQYI/3UbK/0zFNp9PjevHu5kBGEPdJ12KA/n6Eo7/Ginl1YxMwczSuwvsa/akv/ITvvKvIln
	lA92P1A0vYe94fRDQ4l9NpgvlKU53mTWxhZZqrEvIPBP3lFuxfdvx8t5tYaMgYuZMcuvQSD4kKk
	rqpJ/t3LpsgWuNdwQTG1mNieT7H3XDfnu7vX8XfJicDJekHVivEYL0QEhPIM6JGhoAo0cOBks56
	GRQ7FcYIDWUzEGrO37+GVl2rfnYRZ14Pajp/UAP9q5flQ7J9PiNwBYAKRNUbGn7U3TpN
X-Google-Smtp-Source: AGHT+IE5BGR5eu1dD9FL/WEy166Q11BDwtcIqP3DcfSqW35EFvZ8EFw5B9tD/CYrVGXprrda6Pe9DA==
X-Received: by 2002:a05:6870:910e:b0:2ea:1e5d:8ad3 with SMTP id 586e51a60fabf-2eeee4e051cmr1972468fac.22.1750429856053;
        Fri, 20 Jun 2025 07:30:56 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:c4bf:cf27:203c:f8b0])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ef38d748acsm94328fac.47.2025.06.20.07.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 07:30:54 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 20 Jun 2025 09:30:46 -0500
Subject: [PATCH] iio: adc: ad7173: simplify clock enable/disable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-iio-adc-ad7173-simplify-clock-enable-disable-v1-1-8bc693b190ec@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAJVwVWgC/x2NQQrCMBBFr1Jm7cAkoU3xKuIinUx1MCYlAVFK7
 27o4vF5m/92aFJVGlyHHap8tGnJXcxlAH6G/BDU2B0s2ZEmS6haMETueOMdNn1vSdcfcir8Qsl
 hSYJR27mLmyO5mb03BP1yq7Lq98zd7sfxBxNOsfp+AAAA
X-Change-ID: 20250620-iio-adc-ad7173-simplify-clock-enable-disable-b38d038c7710
To: Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2457; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=d+tBbnXnuP1Aw18tSmzyeeXf7BJTncfiaueZLDk2Uss=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoVXCXb0etDEOZnBOuv6Q2xcyNDwD1UJcWltQNr
 luBjK9N5R6JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaFVwlwAKCRDCzCAB/wGP
 wPA3B/9i74EUAUY8X2yyavKWZpnmUCbbdxISHcQ2OLJIGLjkaRXr6i7vlhoDPfrVn2yJ2621Gwq
 Ly1erEAknplvwnnEPIaH6oiFq8wca//qb6X9roMLLMFIu3tYg4o9CCnY+OkXlt8pZtP/7YG5gDx
 Con5qY4rKuB8pWcINB9SA7s2YOObBzGIsSJWqeqFnvBESugvt6Gez+7RDeZXoMZy9Xuvy8f3Vcf
 zuaZj0HJRhBXPSNt18ilRRdctzouJQt8eqPc4D8IB2cf4s9OhwnZz8897ZXcyn73k1+uMOawJNZ
 9ldcSn1r9HnOhV5+sHeynwQWhqoLeu4uz3Co1J5xg4I9Laqn
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Use devm_clk_get_enabled() instead of devm_clk_get(),
clk_prepare_enable(), devm_add_action_or_reset() to simplify the
code as it effectively does the same thing.

We can also drop ext_clk from struct ad7173_state since it is not used
anywhere else.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ad7173.c | 24 +++++-------------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/iio/adc/ad7173.c b/drivers/iio/adc/ad7173.c
index d75adb88af206f6123f5d556c2f5426dc313b662..dd9fa35555c79ead5a1b88d1dc6cc3db122502be 100644
--- a/drivers/iio/adc/ad7173.c
+++ b/drivers/iio/adc/ad7173.c
@@ -228,7 +228,6 @@ struct ad7173_state {
 	struct ida cfg_slots_status;
 	unsigned long long config_usage_counter;
 	unsigned long long *config_cnts;
-	struct clk *ext_clk;
 	struct clk_hw int_clk_hw;
 	struct regmap *reg_gpiocon_regmap;
 	struct gpio_regmap *gpio_regmap;
@@ -1344,11 +1343,6 @@ static void ad7173_disable_regulators(void *data)
 	regulator_bulk_disable(ARRAY_SIZE(st->regulators), st->regulators);
 }
 
-static void ad7173_clk_disable_unprepare(void *clk)
-{
-	clk_disable_unprepare(clk);
-}
-
 static unsigned long ad7173_sel_clk(struct ad7173_state *st,
 				    unsigned int clk_sel)
 {
@@ -1718,22 +1712,14 @@ static int ad7173_fw_parse_device_config(struct iio_dev *indio_dev)
 					   AD7173_ADC_MODE_CLOCKSEL_INT);
 		ad7173_register_clk_provider(indio_dev);
 	} else {
+		struct clk *clk;
+
 		st->adc_mode |= FIELD_PREP(AD7173_ADC_MODE_CLOCKSEL_MASK,
 					   AD7173_ADC_MODE_CLOCKSEL_EXT + ret);
-		st->ext_clk = devm_clk_get(dev, ad7173_clk_sel[ret]);
-		if (IS_ERR(st->ext_clk))
-			return dev_err_probe(dev, PTR_ERR(st->ext_clk),
+		clk = devm_clk_get_enabled(dev, ad7173_clk_sel[ret]);
+		if (IS_ERR(clk))
+			return dev_err_probe(dev, PTR_ERR(clk),
 					     "Failed to get external clock\n");
-
-		ret = clk_prepare_enable(st->ext_clk);
-		if (ret)
-			return dev_err_probe(dev, ret,
-					     "Failed to enable external clock\n");
-
-		ret = devm_add_action_or_reset(dev, ad7173_clk_disable_unprepare,
-					       st->ext_clk);
-		if (ret)
-			return ret;
 	}
 
 	return ad7173_fw_parse_channel_config(indio_dev);

---
base-commit: 7461179e080df770240850a126cc7dbffad195c8
change-id: 20250620-iio-adc-ad7173-simplify-clock-enable-disable-b38d038c7710

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

