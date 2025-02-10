Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349BC261399
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 22:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739227089; cv=none; b=kvDuBg/TFvev71sVT9cRIAEa67C3UtJBbHfq/0Ky3NPyaZUuaI7XTZMRXSyWuy6taEs0QyKmaHZEp14ZBN2Gxob2baabQt1EmHUkbromkw6YtV2B32rLqZ2N9py7fYnidic1acLhHiqBid7gXb/O1y5yJGVLdmSEasYtMgxPw1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739227089; c=relaxed/simple;
	bh=DTPgNGmkXhUVKQ7XC6/DETbHbqjA5xVWJi+TJtvGAQA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ao5c3CObKbtGP1VbWDl5FXuW7VYod9ujfB8lmUQ57zS81C59L66f98gFiT0VohedaTtIXzHn5tf0UhDntPiOFGEdJE72iyAtkczBeAe8AHOf4LMYP/4ZPfmH4twceU9VtTG6aVWtQzR32fI+TX3nA0SXJCC9pxsk/7ghudtUj+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=LTcJkq0b; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="LTcJkq0b"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3f3a52134b5so732472b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 14:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739227087; x=1739831887; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/aqCjYxf4gSpR0G6gRQq6zdrmHAVbQWmkyM76ZxN2F8=;
        b=LTcJkq0bR7PqP6F7wNnr7kEwpB4IF+ENhJyvzgS8fx9V1DHttG4+yB9aXdX2XtYqey
         ImnOvKF1kPCn+B+hvwptAIyqjFNAhCVoYf4R7MYlBP3TdUek2RvoXt9ei+lvtG1TpNZR
         ldm6VIh8HdBroOf+FV63AN3VmfB3IcIuE04PXtVLjGk/7zP69+7IGc8rwtxn8G0PW7LR
         93iucsg1kEq8zsf/UOq2z0xlzl/mjinkGJli56pIiLAyo+aYgXx8EtjBhb+XdWAeo8b8
         pNiGcAzR3dQcfld0oLNZt3rK+u/gbZ8n4OevvpuU/QoE7LeRXbkQSsHY2H3sg33vaU0C
         lNDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739227087; x=1739831887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/aqCjYxf4gSpR0G6gRQq6zdrmHAVbQWmkyM76ZxN2F8=;
        b=EFVRLKcFupymGvkZWjdW3TPwkQ9/1vfqDmhDnRLYW05gumlBPKBWFmvQWS2nvBJcPB
         9KExQwZh//H2i5QAtMAbVeg6zroomRq/zDUOVi+qekwGahJwIUV4nGLjpZPetdW4tUl3
         DEKHgVf0Iq9dQCed/9Y5m/XLuct6pcP9+Ht+TwSdBdOnpU/SuzRvUrlm0VUlEfOGjr2Y
         KsuzUCOgzz6kJEZiUyufK74YAvzK3DoKeEBrNxpKsCtslxecfYyOgsZSxO9X9FjLMFED
         s3TmvVhxq795YJUPSB2m8A1jr2UFQAUor1sv/qlExzq14SuBehOcZjBA491jNHc7s7VR
         YGCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwgOMoRxd2pa4J64OA2LLovwsF2yjKVbv4yfEt86E5ONIADHMRnU4H5XxuUdRw7YLzhFeLCyE+uFYoViw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVQeBj2Z6zYktGzTYPFgYqN16qNqyeV+uOM83h4X3+jgRvFr+W
	+ACwZPOFSOMlWQro1gMFTsFTDSG2Pqs4KwAKDARlhtIhY9BW+vOoiMi1xsSnPYc=
X-Gm-Gg: ASbGncur61wIKQh5mDwqBfFIQTeDGCz8ZDK2gI2bVvQin6siFED03PBre6fmfcmRrdj
	F1JC6wmlTlB8u4L4aOv8ye+O18BZ1dTWD+MPsK0v6LyDxMNF49KbBs60MgXh6Kv8bISlHwNlpcw
	3o6qieYkAocuS+5dW1dYcC12s6Z4OBu6a+Mv48TuMv4fu8X7iKlkxiHAhSQv7mjp78Z00au91Ef
	EFurko1j6Ad/uBwoku7ITCB4AOOxpCRAnxCXI3uFibVEpcVsbaoPQ5kSZg21h5AS0Yoz45pcpNO
	kErgaG36Sel8DLC/wF6j6vERGAcyJJazN2HNva9z9uLs9eY=
X-Google-Smtp-Source: AGHT+IFodsa1xU/+j9iOyHK4zd5srfGLBws68RU1hOd0Hvn3EqSmNLjWe0xJTDgUwSiCbolk4Lse1g==
X-Received: by 2002:a05:6808:23cb:b0:3eb:5f1a:d083 with SMTP id 5614622812f47-3f3c2633408mr767124b6e.20.1739227087286;
        Mon, 10 Feb 2025 14:38:07 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f389ed1ca2sm2521820b6e.11.2025.02.10.14.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 14:38:05 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 10 Feb 2025 16:33:38 -0600
Subject: [PATCH v3 12/15] mux: gpio: use gpiod_multi_set_value_cansleep
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-gpio-set-array-helper-v3-12-d6a673674da8@baylibre.com>
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
 linux-sound@vger.kernel.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2

Reduce verbosity by using gpiod_multi_set_value_cansleep() instead of
gpiod_set_array_value_cansleep().

Acked-by: Peter Rosin <peda@axentia.se>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/mux/gpio.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mux/gpio.c b/drivers/mux/gpio.c
index cc5f2c1861d4a22d984bcd37efb98dd3561ee765..5710879cd47f89b6ef4458d6b4419a1fe9ad349f 100644
--- a/drivers/mux/gpio.c
+++ b/drivers/mux/gpio.c
@@ -28,9 +28,7 @@ static int mux_gpio_set(struct mux_control *mux, int state)
 
 	bitmap_from_arr32(values, &value, BITS_PER_TYPE(value));
 
-	gpiod_set_array_value_cansleep(mux_gpio->gpios->ndescs,
-				       mux_gpio->gpios->desc,
-				       mux_gpio->gpios->info, values);
+	gpiod_multi_set_value_cansleep(mux_gpio->gpios, values);
 
 	return 0;
 }

-- 
2.43.0

