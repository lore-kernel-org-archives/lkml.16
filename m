Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDFB262D0A
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 22:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739227096; cv=none; b=KK8GtzsOEC5cAPctQjeZgG6w6HTuuNzstJsVV77BPryDQmg15VD11q9dfGCpb2mUbi5Lybz6a2SerSdMem5T8bb+jJ7pm/AFI7EK4RxFre98r0EuvpKbJrLo1RHXwpsARW1aay+5jTCMGNAV0vsyps3PqQ9cNnvkgJZJ0TQihi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739227096; c=relaxed/simple;
	bh=QtC6oLxmw2DvbNfS+XsWeQUt9WZBo54DTtz6cY2CdFQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KINSs26QmYyKy9eOoyN3a3ZufL0hsLtPzgjb9GaUsQz/rdM3x8EAg4ldduWPKK3EVjG6mVGAcDtCeg3ouGy5b9ynQ+4O/nNldRBd8bQA9eZ4wtezJqRMjW9D8x/0TgpWn0YaNFJ5sEaPhFzdtwTlCfpToWGIOErAVuTReYo5JP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=zEC5uXyi; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="zEC5uXyi"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3eb6b16f1a0so1304153b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 14:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739227094; x=1739831894; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rir37DR+dGjXzV88JkfAUftf+GWLKbTzx84djPKNaJM=;
        b=zEC5uXyiKhnWOqx5/A8Yv466JRMMJpfwQTn92/mpKZPcLRRpvvrtis3ZcZ8KXEs2bZ
         MYupPNSVfFZyhyW8mGDUXI7AkGkRPbwA5Ip8LRCzhWlJNwQ8JW1hHsZnwHNb90V0OYyN
         DyaeDXGZtV6R4og2AP/D+rqByz5AEqDCvkw+vDjbZOT/yDIPlpGbDsdU987VvJhNr3Rm
         LgUIQVTjmd6QOgHUUBpVWidY5H2scFqZbGYGkzFylqfteOf5Lui0VIZgYmrn9uwBVKfv
         iYI7mnqGc/V52O3qyFceLfV+fnXugHeokcmKk86QXw6q21/eBgjFmexD0j/GxKETOMKu
         KnJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739227094; x=1739831894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rir37DR+dGjXzV88JkfAUftf+GWLKbTzx84djPKNaJM=;
        b=rFLlXDwX4T2oZgIEmO7M2VKErEoUvr4jcMxJzbiO8OXv2KplhVezFNaE0EDZo39BB+
         O+ayzlb2X0KueHN4HnqmGKLC9f347+IYkD6tLcZq7gP6Bq1Ic8YYbgLt+4H9BF6UMiVD
         kFZro3Ddr5LEi5fgwJgHQ0eqLa33kvYRB1BBCx7S26OW1lquTbKkw/SdUE6kgM8UlEMh
         JR+WjlRA7XlmYcjO5p+Hd2YvyEJd3nB6sweZ52RF71AbUyd91vWCYUjYIO6kLUVKBgnW
         cfyn1X1IUjClyTC2agswk0lTir6iHjPYVWat8wqgXql0wzQ4aO0DGJvgf1L+69WQ3P8w
         oHOw==
X-Forwarded-Encrypted: i=1; AJvYcCW09I7gsEgiPH3B6xGU3V9XwDL4KSSVNVIGhBicEDLtCECGcw8Rk3vZQCJ//89bNp4mEOkA88YuL/lzF/w=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp4FsnK80TjpmIy/kcow7mvw+YsMzh1HqWIuqGJSHoOPtf8l2e
	CUD8+Jb+/tXEhDJYxJmQ2OkSjszcLAbzLSmxn7ebyDntHZDArRHd31vB7u/7pNo=
X-Gm-Gg: ASbGncv0ogWihxSae6kzrZ+5GXIgZTpKhJh1BlLDQ/AszU+4xiakeI2BZkhkHwN9u/5
	FZO/Yk4+zPPSprHkli6HEktHnwGb6SF5aAW7W6wSjRHB7WqUp0O6krSrdyhEO1xCAU9Q3Pg5LOs
	ODrvZiCjw6NViydZsyxR6ZtmUHnDk120kfpAekm9SYOtpsBS5dFpaLntSGY6F8yBfU/xtVqxAA3
	mayIFCSRv2G5cz0ObPktgvL/47oXxNcEE7eLZzgwsH48wJvw//BwO9HAvbE+MiC/OL79V8fn4Ox
	2mFh5Qo5ond3JfW19CyEl+wED3YIWQwpHpJG1EboRV6GxSQ=
X-Google-Smtp-Source: AGHT+IEVAt15PQdS8DVNqyeJacSiAcXpbNeOp6OkG5/0y5b43SqHZC4XrUJm46YNpLSsnE3NWRVPBQ==
X-Received: by 2002:a05:6808:150e:b0:3ea:519e:cc71 with SMTP id 5614622812f47-3f39242c9d0mr8056705b6e.39.1739227093792;
        Mon, 10 Feb 2025 14:38:13 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f389ed1ca2sm2521820b6e.11.2025.02.10.14.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 14:38:12 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 10 Feb 2025 16:33:40 -0600
Subject: [PATCH v3 14/15] phy: mapphone-mdm6600: use
 gpiod_multi_set_value_cansleep
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-gpio-set-array-helper-v3-14-d6a673674da8@baylibre.com>
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

ddata->cmd_gpios->ndescs is validated to be equal to
PHY_MDM6600_NR_CMD_LINES during driver probe, so it will have the same
value as the previously hard-coded argument.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/phy/motorola/phy-mapphone-mdm6600.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/phy/motorola/phy-mapphone-mdm6600.c b/drivers/phy/motorola/phy-mapphone-mdm6600.c
index 152344e4f7e44de0f8ab1cae6ae01a1f1c5408e9..fd0e0cd1c1cfb10fb55ed271e47b6a0bf857028e 100644
--- a/drivers/phy/motorola/phy-mapphone-mdm6600.c
+++ b/drivers/phy/motorola/phy-mapphone-mdm6600.c
@@ -177,9 +177,7 @@ static void phy_mdm6600_cmd(struct phy_mdm6600 *ddata, int val)
 
 	values[0] = val;
 
-	gpiod_set_array_value_cansleep(PHY_MDM6600_NR_CMD_LINES,
-				       ddata->cmd_gpios->desc,
-				       ddata->cmd_gpios->info, values);
+	gpiod_multi_set_value_cansleep(ddata->cmd_gpios, values);
 }
 
 /**

-- 
2.43.0

