Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2F72236FC
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 18:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749840968; cv=none; b=gPi8f9dG6KBWlSQIeC8GihErLrd0Vz0olvBXMkdNhMWNPHmErgo1nWZEpijO9UMxEjwrJvSMcSX29xuf+vSFElnPkLEYawkZgGoRGgO13BKGqVob+8/hJrdt7iamv+wg7iR2nJYxA8VpK3VcfG1mL/sUNpBy0a9FjM+wMYHoFw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749840968; c=relaxed/simple;
	bh=++uE2N5iG8oRabYWPvqc1xZ0NdyMvXJg7Pp68u6U0pM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uS+WtPYvjD76j/H+OT0SVzjb0pVH1KoZcPUlqezFm4prmPZN1NUQMlw5BphCdTe12exjvMujjVS7XC0k6y2mjvOM3gUYRpQTpwKdwMshCiDF2ls4sUdk9E6wYK+f2dZ0luzA+jfESOTvvYP+5oxqIHPK4ZTXKw9kIQwsYIWFZ4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=XEG/9Xy7; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="XEG/9Xy7"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-60ef6bf2336so1850859eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 11:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749840965; x=1750445765; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y1TYF3o9MJosGx0HwGV/hmhcmkYfIUKomItVW1Sq2k0=;
        b=XEG/9Xy7FO1vU5/j+/WvQX1TgyX7jBXF0IAxcmzqC0N0A0K+/uXkRG7KjkBRaLKF5B
         vNfo3BjYW0Mdl2JEgsEdLXSXra1LK031HqsJLeHYpQoUXLEf/Jz5VFiT7+4wwufZC7SN
         5U3GhCY9KUs8lac0cNfPqBgFXt/Ehsb3ffimBVvtBqyIDhWJNSuL6azXvv/Xot3RMaYT
         Gj7Oq5FVIGJ9qz1sKR7QAKtbI2LggkcPzSkXFEXOnrKSslYMA0Pdr5ZuTwTTCXz2D340
         gv2HNZNwatBmMvGk+KqpRHyZcqrmM2D7q43h3CtGltviJ8tGS9PRt+ZzTfx09KPr/GOv
         EOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749840965; x=1750445765;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y1TYF3o9MJosGx0HwGV/hmhcmkYfIUKomItVW1Sq2k0=;
        b=OGeYrOKvS8oKcSDY31Xbf5Q2o2yqsI2Jx/6jmqWiaNlawJi9+1/YmXRHOh+6CapKpZ
         JtPjqldXO8QzJ2K/wFFEtoHGUwLA3gAXNnVlkqq9r8Mkt8g0WekHvnrG4G+0MjFOkS5d
         kmBTtXcQbKtica6oQyeLc/ZlZL0oVCiU2KblmkOocSSN+Xf4a9lnVgEnLkH/vhzB5vlV
         1f6d4+19TgaTrlz98WBbFILc2xF9VXY4roSJlqHry0OFw5Fha+hyMzbhMOjODfcEjW4g
         5OuwukBMezYEzOEsbycjMFvv3iorz94PCueJjHlNNZUi/iA1VnKxC0/K7o3ow7NJLQ3E
         Ik8w==
X-Forwarded-Encrypted: i=1; AJvYcCXzTPhNJrHIAUKtg06BZ1Wv0W+cl0gWn3MlfJB+TfPB2jldHX6N1MbYUp1uRQiKFptxpaBI61dfjMqxClY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxIoeohTnCAXf0rllL3KYU75mlQnCNZw9bfWtRIHOoTHeVRYPh
	RJ/XYDt4lIf3ei1Kpx4WwhenINehzxDA4MRBNf3NtC0juVBm6cQBqVc5KbLybUpEubE=
X-Gm-Gg: ASbGncuiKwNmeIsffTMhooVIkoeybw2fLl0kbpiGsDZ0SKY06lV4rGukEBRMC5PftDe
	Sye9QVpR+nNu8XcZpt1mLTA9tyDsIhtViKNxdz/nLP90SvnA0oswO7wJYVPo8kXeEDE0G655adj
	Z0lH2YkOuWY31HZ3L33zrmhS5gXoxKnA9R39Gn8dWFl4rOhKYcolYAmzQN64ZUeskB6cCvwMfvN
	BJly4HrOFBU9gmKROUDfZbI0G+XngSEbkgSx7FoLlwkW8IhMnGeu8Mhjr0s7TduAhWOJvGOBQ4f
	sTNO9/RSoygxJYKiVCThTbTkPhrwca9oTod7pMZ+IFEZNBtc3N8o6yahWaVrVS0pmD8=
X-Google-Smtp-Source: AGHT+IH2MWQtTOQvVuN+GKtLbqMqE9OuQOP/DXYYureGIwrlvQ2mli5y2ygIXgHzv9OAPmZM88lIWg==
X-Received: by 2002:a05:6820:814:b0:60f:3442:96b9 with SMTP id 006d021491bc7-61110ff7a50mr540561eaf.3.1749840964805;
        Fri, 13 Jun 2025 11:56:04 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4647:c57:a73c:39d8])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-61108f07e08sm256244eaf.27.2025.06.13.11.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 11:56:03 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Subject: [PATCH v5 0/3] bus: ts-nbus: use gpiod_multi_set_value_cansleep
Date: Fri, 13 Jun 2025 13:55:27 -0500
Message-Id: <20250613-gpio-set-array-helper-v5-0-273fab50cc8e@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB90TGgC/4XPSwrCMBCA4atI1kbyapq48h7iYpJMbUBtSaRYp
 Hc37UYRi8t/YL5hniRjipjJfvMkCYeYY3crUW03xLdwOyONoTQRTFSMS07PfexoxjuFlGCkLV5
 6TNQFBVIYWbMgSdntEzbxsbjHU+k25nuXxuXMwOfpP3HglFFruTfeOxU0HhyMl+gS7nx3JTM6i
 DckmF6DRIG4rxqmTFNbL39A8gPibA2SBQoadC11rQKYH5B6Q5qvvqYK1DijwTplLbgvaJqmF0B
 RaAOYAQAA
X-Change-ID: 20250131-gpio-set-array-helper-bd4a328370d3
To: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>, 
 Andy Shevchenko <andy.shevchenko@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1915; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=++uE2N5iG8oRabYWPvqc1xZ0NdyMvXJg7Pp68u6U0pM=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoTHQn8OH/6JMhZq0tcuH66PDJbaNGfuO8EYGYf
 bqSi4lTXkqJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEx0JwAKCRDCzCAB/wGP
 wL11CACbdE4hxkOjFwtT6N/riTIylQaavW5TjgmkT2kDkqqVPKqqdQWBLEm2iIfONpmkvV381ux
 q/GgBKcW+hxEM9ILrT6MdgN1qyScmpXBTc/ra3ZJz2DSy9qJ5rXnscay+TKk4pir4VOAcHOxlPn
 yPtfIKBKbMX+KyfrGZPYgHNJ2P9juYzDw5q8IeOKwFhVmZcIfgA0LhxvYARl1BapQgrsdgZguIV
 IlkPzlwZJvp9EK1LdJzfM/YAZAU4vQL5+txUhPx3fPDe1WT4F3nqvc8FFjGYdDWhRnARqyh3K1F
 5U5hNpVM8/xLMR6ZpRqinew/FouDHnrMpFM7b716qLzHhw52
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

This is what remains from "gpiolib: add gpiod_multi_set_value_cansleep"
that didn't get applied yet for the bus subsystem. So I have changed
the subject line accordingly.

Arnd,

There was no maintainer listed in MAINTAINERS for the ts-nbus driver
and it looks like you have picked up patches for it in the past. Could
you please pick up these as well?

---
Changes in v5:
- Fix undeclared variable in ts_nbus_reset_bus()
- Link to v4: https://lore.kernel.org/r/20250611-gpio-set-array-helper-v4-0-fb86a9b499ab@baylibre.com

Changes in v4:
- Dropped all non-ts-nbus patches.
- Fixed a reported issue with uninitialized variables.
- Link to v3: https://lore.kernel.org/r/20250210-gpio-set-array-helper-v3-0-d6a673674da8@baylibre.com

Changes in v3:
- Added IS_ERR_OR_NULL() check to gpiod_multi_set_value_cansleep()
- Added new patches to clean up accessing bitmap directly (ts-nbus, ad2s1210).
- Added function prefix for max3191x.
- Removed unnecessary braces in ad7606 patch.
- Picked up additional trailers.
- Link to v2: https://lore.kernel.org/r/20250206-gpio-set-array-helper-v2-0-1c5f048f79c3@baylibre.com

Changes in v2:
- Renamed new function from gpiods_multi_set_value_cansleep() to
  gpiod_multi_set_value_cansleep()
- Fixed typo in name of replaced function in all commit messages.
- Picked up trailers.
- Link to v1: https://lore.kernel.org/r/20250131-gpio-set-array-helper-v1-0-991c8ccb4d6e@baylibre.com

---
David Lechner (3):
      bus: ts-nbus: validate ts,data-gpios array size
      bus: ts-nbus: use gpiod_multi_set_value_cansleep
      bus: ts-nbus: use bitmap_set_value8()

 drivers/bus/ts-nbus.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)
---
base-commit: 19a60293b9925080d97f22f122aca3fc46dadaf9
change-id: 20250131-gpio-set-array-helper-bd4a328370d3

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

