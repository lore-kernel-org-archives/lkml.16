Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB9023E25E
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 22:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738882121; cv=none; b=ZdtPYrx+0CDJgMkBeZ/aS/JpGCpYhzAXUyH5VyiZXKIp/iaRFeAGE1d+rUWlkd9tb+VVZq9jFhgwPcssJdN2C79MAqAtG74MYwTfO94h1LP/kDRgU/irYD6zjYwXrqxhDrUqa2psnbrv+Tjk832kNvNVyW5c31RWrwVKrMtKxxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738882121; c=relaxed/simple;
	bh=QtC6oLxmw2DvbNfS+XsWeQUt9WZBo54DTtz6cY2CdFQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XZqDCvv7lU0f7GqcKQmJuMwE+cW2yH2p/3fIGoi+bs+KmQM3Ju/CKQdTiZxKW1y2y6S21+29EK9BKXPPrgbAhtRdcs5e82UYuVqQ2ROTkrf/n4BgpEg04kSUPcPqoveVsPVYeidAFIBkq/QJ2jKa4kUyyPfHOz7ZSX3vc9EwJX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=1sEwRXSP; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="1sEwRXSP"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3eb790888c6so468131b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 14:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738882118; x=1739486918; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rir37DR+dGjXzV88JkfAUftf+GWLKbTzx84djPKNaJM=;
        b=1sEwRXSPntOwPL0HtxKu1P9TX7+3wpt5WQsiyHQORN94tjNVCzbYGJvmZZiPuRVJON
         LEJ9kzfwBTaJ85prxenb1UydBZpqGC9lSXKqyw160PqQweRLqvnijFB3uYdYw2lsnQmS
         5sKotPh2YZK2VNWHK9TWNPYoUf7WwLhzknWMqCQ7RbbysDgucCyQLz7ZfUJWvMRCqt3A
         l9SQuE5ICQ+UhvT9g9Swjkd3gqz/31JuaM6vVNiGnODbxjGMUUKDDGienS5fG/F0kTsl
         E3iPtSor9mzm2ko7Lcmp+wKGqdl64Nhg6MAQlRzVogpQ1NczgfTiap67dK8vAQu5fwKi
         +Pig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738882118; x=1739486918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rir37DR+dGjXzV88JkfAUftf+GWLKbTzx84djPKNaJM=;
        b=ki6MsjTfQQ9uKxgKZWOF94NNMm0bORWfrB/TatTUsENPmt/LaqfXIS5ovYEp5iDWqW
         W386UtBqBdheOouQ10qmGsX1W1H35k3RzOdGD3oSliqAE2lJE916keb8fyUd1a2gv5JK
         2KFHkPr9G4oxYrbjPlu6ovZ0dCaOHr1OON6iBKBLmYJNUyf2D8nPBw9KFr02iavxTlA0
         je5ILMvCZDwoFojNTiC2lt4XeQwnmDrU8FnOeot5Xjd4YuV2of/zihEfr0p4XFqoWNsa
         ewUz0wU4ZmgEhfBUo+thYYuLoj89dsQZb5iIKGJInKnUtaFHpaOMdc2bBZiys4pTCOCG
         5cfw==
X-Forwarded-Encrypted: i=1; AJvYcCXbPv+yck8XibXmbyUNjCrmZ6BPaQ6Wjo2AWV0rKUmIzQ3e1jf8xw+5lqGTE7VgnS23W7d954yRHU8jUKc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGDxhZ+XV5cds4HIqOG+M/IZSbbeH7HXSUs8uEj2ViUVS+dNwI
	+XVUSdCpOCKsTFJEGOc9TukRRKHuW00I12VOAL1/qZ/lokaNeT5vya/tWBJT4Z0=
X-Gm-Gg: ASbGncvWIr+/rPMi01QAjtUCiBvLe4/0nPX/D9P5/9k5AKqoj7K5SPpMsbp4+YJo/y6
	6yf9RBTwNr4fcPqNiPZBQmgDNZREte/2WdE77Dx+nUJpvNwizEOvC/IbPgrQH/26a02YpYDF2u0
	tFzvqbPl9jZF8pdSUhKOwMte/th5AMlf0KJ7fOubuKpxEi/KRm+hYX7V5LtNrAoHwYY88jY5fri
	kMxlLdwWwO63DwjxYGkElB9KLmxW3/O74as1mI3XFzm1TmaKXANkgFKD7wSa2vBHysynQ303fxA
	IL4JP9zMbxVLKJQ7AveDDGLwfiAeI/dQ6PL1HtbKXMjYXs8=
X-Google-Smtp-Source: AGHT+IHg1dkR38vC+BOfsqdfTGHavmIhAar+M8vjgAZ97yt8yxkX/PgUDRgvY/W1hOK9akNHaGFBHA==
X-Received: by 2002:a05:6808:2f09:b0:3e4:d4ca:2774 with SMTP id 5614622812f47-3f392318adamr932419b6e.20.1738882118361;
        Thu, 06 Feb 2025 14:48:38 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726af95bbb5sm510986a34.41.2025.02.06.14.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 14:48:37 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 06 Feb 2025 16:48:26 -0600
Subject: [PATCH v2 12/13] phy: mapphone-mdm6600: use
 gpiod_multi_set_value_cansleep
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-gpio-set-array-helper-v2-12-1c5f048f79c3@baylibre.com>
References: <20250206-gpio-set-array-helper-v2-0-1c5f048f79c3@baylibre.com>
In-Reply-To: <20250206-gpio-set-array-helper-v2-0-1c5f048f79c3@baylibre.com>
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

