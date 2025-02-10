Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF9C25B69B
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 22:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739227077; cv=none; b=BcVuWH7B1bPeT5vKJjzj2DfMmqn0LraxfJsIBJNALvxcEahkS2pBclfutVFW0hrFCY5pjSeHZR0gUg4/nNthyNkDTO8+oi3PiV/eVdeRPpdzYK46rX59n9jb31duaWe9PAM6spGE3vlJB6NchZjCn9HTxW1Ugzc+uqSpBLEpuqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739227077; c=relaxed/simple;
	bh=DEtDLgJv5UYwZaak4CnPj1ALmi7rrV6hWuddp/nLJio=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BXYU28OZa19UtOKS6povsYxFE1b/sECzArbWDO8CfddkYAPyB1AZdPxpDJNdkaOy9FQrRdENa5DytKLkp1ibz6FPK1xJx3PRowoIof8ha5KHmNgSiaNjla9zzsXS5eV51CHH32pjXOC5TQdngD9Eum694MwH1vOoLwbh78F4Ekc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=vujvn9q1; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="vujvn9q1"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3f3ac204922so1247842b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 14:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739227074; x=1739831874; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GMcrxDurUnSK2SHairVKflMalwdh2XVxdj0wjaWv8sM=;
        b=vujvn9q16sHkCxjODesonUK7YfToaWCovqp1meHYAiAMGuxuvuxvtjgT7kb4u9Rr6V
         swRcw0YIojKyBSboU0wstCJdaRggX8BRWH4M6uBpGT8p1fBitXYbaydpvLWzCEQjAgyH
         NK8GDJF94FCeuET5MshCx5YbGjJaWqAgw3WdWfpWFRjlu/QtI/QggzM5FO97TiYmaxBz
         PAABk2lpH9oFI0pUI/2JkcpFJHdPWUeviNglFTcXNGwMqsgsZIHJYDsnSsc9LP95ZXSs
         ERAcFCFmZaDh5TkuKpoMUw8CZYx5ReOtYpGtHricMbLSB2JZJizhsvkfgo09Zkf0S9Pe
         pc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739227074; x=1739831874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GMcrxDurUnSK2SHairVKflMalwdh2XVxdj0wjaWv8sM=;
        b=G2RuVDOpzHrnpyDr4bRKhszkVXnjkPhyqAsgGkG/CO3K5tTINvrUSDTxRziKrAYjrr
         vcDXm7cAqjyhogilLqRRZHpsXECguTfRvRXvZ0C0UoBZQ9vNocxeK7pj5jPgAHH/INeq
         CuAJv/QSMBVaitJAOaI2fxkwR+F8YEYQgjbboyQEXMYgszibTJ632KKcDHlPLJomkyp7
         4o5Kb4A4MP8yExe7rOFn7eDMAoMa4ZEn5qjiI+Awfwz0ZnMka1H1wmEoYK8u4oLXwviK
         dDT12BaKB1ANlRz3rq73HRVqEkBT51Y9PIPFJpNbAaYf6/YBx0oTZFM1GuCFrSbJ6bux
         EIyA==
X-Forwarded-Encrypted: i=1; AJvYcCUt75mD6kiJ4HfeZNtgABLjU6VuK/Imkf+XQ+oqz48mioWLRDEsYBXOkT0WBXbQmXbJoq2OZnrSzBQX73Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWlc4PSRRTHS8njscvJUFe4EolJBlLbzzHvksvoSid5xssRd12
	tE2ral9xR2FryNHyaYitFjAvvRmc08TG4f2JmlVqG6DnhxoG0b4Am71PMnB13a8=
X-Gm-Gg: ASbGncvslS7sJoyX46JngOeROvEsZs3/TFVBcFHnbW0CQdqn3HRsLer4yU8h6I2Fh0F
	6PsbeOIg/sE+8QbE04LikQQ4qBLJg7ilHGnEaFLYM/4GBUMfSKZOET5+ao+0/fPab1xjZioyD80
	wzcAJgPwjHXEJoGuWp4okb6uYD13ndPY7lAc+AFG4L6zKeguzhHznXFVH5hJ1hY785RB9bLWWlE
	+q8vrF7IIQ4JSsIjPm3t2rEUwaSC14bmNaUxTZRTK90NH2AetLML84L3Wv//InZ58Eqqe71kLfe
	1F8mtM92tP0o83Ww2Id/MwhLSpxz1fF4QL819wcV+NcVKcM=
X-Google-Smtp-Source: AGHT+IHpQCMO/UtYCFM9csSv77tlAPoKshLmX0/bTL0+YDtp28Q6Z4e9EVZz3B9NbqVlL1P+vOnPrw==
X-Received: by 2002:a05:6808:1a19:b0:3eb:39f5:de8b with SMTP id 5614622812f47-3f392362d24mr10975894b6e.32.1739227074492;
        Mon, 10 Feb 2025 14:37:54 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f389ed1ca2sm2521820b6e.11.2025.02.10.14.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 14:37:53 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 10 Feb 2025 16:33:34 -0600
Subject: [PATCH v3 08/15] iio: amplifiers: hmc425a: use
 gpiod_multi_set_value_cansleep
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-gpio-set-array-helper-v3-8-d6a673674da8@baylibre.com>
References: <20250210-gpio-set-array-helper-v3-0-d6a673674da8@baylibre.com>
In-Reply-To: <20250210-gpio-set-array-helper-v3-0-d6a673674da8@baylibre.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Peter Rosin <peda@axentia.se>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-iio@vger.kernel.org, linux-mmc@vger.kernel.org, 
 netdev@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-sound@vger.kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2

Reduce verbosity by using gpiod_multi_set_value_cansleep() instead of
gpiod_set_array_value_cansleep().

Passing NULL as the 3rd argument to gpiod_set_array_value_cansleep()
only needs to be done if the array was constructed manually, which is
not the case here. This change effectively replaces that argument with
st->gpios->array_info. The possible side effect of this change is that
it could make setting the GPIOs more efficient.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/amplifiers/hmc425a.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/amplifiers/hmc425a.c b/drivers/iio/amplifiers/hmc425a.c
index 2ee4c0d70281e24c1c818249b86d89ebe06d4876..d9a359e1388a0f3eb5909bf668ff82102286542b 100644
--- a/drivers/iio/amplifiers/hmc425a.c
+++ b/drivers/iio/amplifiers/hmc425a.c
@@ -161,8 +161,7 @@ static int hmc425a_write(struct iio_dev *indio_dev, u32 value)
 
 	values[0] = value;
 
-	gpiod_set_array_value_cansleep(st->gpios->ndescs, st->gpios->desc,
-				       NULL, values);
+	gpiod_multi_set_value_cansleep(st->gpios, values);
 	return 0;
 }
 

-- 
2.43.0

