Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548431F78ED
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 20:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738355115; cv=none; b=cfRp+jH2/E39Mb6lyTfeDU0bdB6Z0IIiJARYJPsYC2GoXXyEwG3zrYH2NvRIjh+pE03+Dpy+eiiyQbJTwGy7xCWmTm51rRjEH+uO7D9nSEI1+AVS8Y5hE8rktU7cwsEkej5qhmTXZdXV0cEXR6oFniyAMIu3fENmuaad1lszi4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738355115; c=relaxed/simple;
	bh=9CicIm6xDarlbk67AANQJSF1s3m5MgjSBlIRcxjc/Fo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WSlGA2CfeMN85XV6S3ArOe/iQ5Oxz0w0n3B3Ww2lsKqU0iHOk6pER0vnmRcLMy5TAuQ+d4sw/v5YXLsW7xw1LBegcC7l6AeIqlYI8S3KhYTeSmlCeuUdSp0YMTNs+J5tnFKu8NyOdgBbXgCAyp6eqoXKvzj/PahxdBMUSHTd40o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=wlI+CUIC; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="wlI+CUIC"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2b29662f823so620736fac.3
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 12:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738355112; x=1738959912; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q8dlq+1FyobpCXd9TkKRwFwRft57r9IiORFW/g/tAaA=;
        b=wlI+CUICXgXZ59m2jPFbdGv2J3EAl6YkI5OUi/o+5HQFg88HspRlr0dr1Ize9/zZhX
         vgbpaxsjqQ/QqRq1yjMqvW9qbxX33uCRK4wTRB91evDI5+FGRFEuBDaMCqG/MQZpJC3/
         bCWmxqxUDHoywe7tnFcOdgK2yuwPKsY+vyODObT6GFruCueLz/oc+ccc/9kSiZ+XWO8E
         8hdmqDBq4XpUmELiwQFDfZpCjeeFhJdOkm6M20lOsf8VzfgOqD5FaKNCKmDUeS++Fdp6
         Xq3mCVUjEVhfX7aQ5E0CD3QkC7ZwhZ9xffOXr1M0hlZ8bVJXGwPCZbNeTgRpOff8wAZW
         z6Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738355112; x=1738959912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q8dlq+1FyobpCXd9TkKRwFwRft57r9IiORFW/g/tAaA=;
        b=Ukp6vkTtT1SQ90SZNT0xxa3dkQleXgrOPiL7D0glsSdq4LIiDBRvshifNZwLcTg7wY
         pePhZ+zBG1HAXFlACdQx/FJgqRVYL3ZZp+8bO6wX/iM8j8FYjwcohN6oDxI4mU8hkaZx
         r+A/gt2sQGKQtPMPvBmCigzvwxUrF3ubD9ZSHXiQzlxSr27AHvfCBJQwTJAEGk68mgjn
         COmRVng2OpSp1a7X3dU6k6tQJHYUNf0eyITVghU59t7J4QVwdw88Nyfv0tVaEmjm1vvS
         FSNZtN61xymoYH8Aq8K3Jeez1UdbDCOEhWx3aHVc85CCvuHupkCPTmOmp/UihCbQsq1Y
         r2eg==
X-Forwarded-Encrypted: i=1; AJvYcCWkTWA6sbWLg255NDEdEUi6byJ8e04znckIUrhp7jAPTdu3yVllXCx+2AkAPd4nwTWimU1tSAPcvuxfkBA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZHEuR15eC7Joc7z0fASTdaYmbbcJ7EKYE5XUIFJx1O150y/HL
	F5sA0zulkHDbpu5Wl4rqYeMwPzPg20RoSuFjnBONQxk0PFkYEALjxQIJhUQg3dc=
X-Gm-Gg: ASbGncsm8dmg7mV+xRo6L23aKTspJ7UrZ2grwZo/krTELy7QYRjMHoOQzhWBl1o6co0
	7VCp8uBwfajV6GM77L0z/GNxlgSs1NzUpl/oZW9d4ZJ4tCgD/rION7W1K0R4xSCAhK54aTmIzrZ
	Js1SqzYlfZw8UjdX6dqUZCoOKFuwmE7Dsf0V0skrpLj+SvUedbHIeCYeoBQPOhoX8z/wSRXq0m6
	30pG2wQmRWaPjDrS/U09/1bTXjqrl1Vy8v/2WCEUpVF8gkNgk5U+zVVKIxkOocXT3WAIGoez2E/
	ZPJH5W9Aw0FItCiDqJctafGty3QNP9ZBFIZV1sx0M3zajDo=
X-Google-Smtp-Source: AGHT+IEOPFpYcNvsoJvtChI72uu39YNNI5XV7tV2UH+PWhk+hEwEt/BHCYYItie+9RSXj9400mKLXw==
X-Received: by 2002:a05:6871:2106:b0:29e:2caf:8cc with SMTP id 586e51a60fabf-2b32f30c9fcmr7202349fac.37.1738355112453;
        Fri, 31 Jan 2025 12:25:12 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b35623d2ffsm1403157fac.22.2025.01.31.12.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 12:25:11 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 31 Jan 2025 14:24:50 -0600
Subject: [PATCH 10/13] mux: gpio: use gpiods_set_array_value_cansleep
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-gpio-set-array-helper-v1-10-991c8ccb4d6e@baylibre.com>
References: <20250131-gpio-set-array-helper-v1-0-991c8ccb4d6e@baylibre.com>
In-Reply-To: <20250131-gpio-set-array-helper-v1-0-991c8ccb4d6e@baylibre.com>
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
 linux-sound@vger.kernel.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2

Reduce verbosity by using gpiods_set_array_value_cansleep() instead of
gpiods_set_array_value_cansleep().

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/mux/gpio.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mux/gpio.c b/drivers/mux/gpio.c
index cc5f2c1861d4a22d984bcd37efb98dd3561ee765..fdfb3407543dc3c2563750b013754ceb3390e39a 100644
--- a/drivers/mux/gpio.c
+++ b/drivers/mux/gpio.c
@@ -28,9 +28,7 @@ static int mux_gpio_set(struct mux_control *mux, int state)
 
 	bitmap_from_arr32(values, &value, BITS_PER_TYPE(value));
 
-	gpiod_set_array_value_cansleep(mux_gpio->gpios->ndescs,
-				       mux_gpio->gpios->desc,
-				       mux_gpio->gpios->info, values);
+	gpiods_set_array_value_cansleep(mux_gpio->gpios, values);
 
 	return 0;
 }

-- 
2.43.0

