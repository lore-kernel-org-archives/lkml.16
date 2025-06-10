Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52AC28B418
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749548411; cv=none; b=HUp16nk9MMLQM/c9CmF3qe6EG8PqnXF6uPPJTlpyS35xWRs2AmXMuhfLR2mfHmtKpi5D0yjpRyCJ3Vfok2REV0zdSkg9PNt42tcFcexAw/PSFo+z+ACRM8C4WI6yLRcQriA7xW/tBppY81OTKCVr5JPeri5I+dZpL5WUNQ7gC7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749548411; c=relaxed/simple;
	bh=T9Vg0wvW1hKLtDwEAea/F673Ap81+xfLRjMRIOwyjuI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cz8+o864F43JKXTyPHRsu6+mIPiQgcG5T19fbAZkzrokmEs3Roz5mjRZRQO/gS3F6pIkrtWidgKiKxpjNup80l513w9A8jTghF8qcwP6yKOmAAIcbEZB1d3PTJtDTDEf0C3gx0bVp+7u1Srph44N/1Df25h1mbOs3hOsvy1cgXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OzqChnGo; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OzqChnGo"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a525eee2e3so3923886f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 02:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749548407; x=1750153207; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vu79p97CBMbqD0WMqfE3aKDFszV913MMxxhgM+UJYyI=;
        b=OzqChnGoW0qbCITrv2TIRwFSYLPSURQK4wMIdeiRqUNyyFg3yH9ClxwKx9TKcnNLQ2
         hDNFJF4R0KtiTMqGR6PzyK4uEF4jm9+QW8uZtcpXXO+i6MMT/erMgs8sbSq5GHs8rLCD
         79BB2hBhLq4dlOOO0xbdKJRfKmjrvKyO1c/yFJo0xMy4UCvFYWTcUU6IgZfTLG6/x77O
         AkvtP6mw/yAz8riTZBF45pRtY/9YLmimiIytJaiSu0csVJh0Lc+x/Isdky+O1c5jKr0H
         XpEyiYiWzEpljwoHSKTVVce1orDHPTt5O54VJxBAtt6+hW9fX9OuprC2HbUHnabMIL+Q
         EA1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749548407; x=1750153207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vu79p97CBMbqD0WMqfE3aKDFszV913MMxxhgM+UJYyI=;
        b=G0tVDBJm/8hQO5Ad7G3uRe/ChwXQd4UaoeqCKhOQRlP5hzUGtwZRBsZFc6nyLrzHUL
         v2yboJkrVGRdw9z5S9OtjrhBptQk0y7j2qEDr2dDm1vWphlEhD+IAzqQZP4tcoAM68l5
         f0my930o4KhwTCtZLs+G+Uj3jMU3ZuMGNPep4ZixRDEo2DiopTkTpwfXUQq1Tu6uYmlS
         Ne6g2vcFY5XpdNk7QM3ori3MD3buLgWpljUEvKD6rHlwHg+aEhWMZSW7z3zeXG8d5lUS
         j7rFGix/TWFTXhnDMB39Eb6g+Ctiwrl8yJL2SeLH1VoQIme3xnwAK3CKqqINTlDgasPQ
         hnHA==
X-Forwarded-Encrypted: i=1; AJvYcCVHGs4CyToiULn6fzGoxizR9G4KsPoPSfkQhFaE2GIRlfKdEfFb4HhZdlb+cJV8CT2wlH475EHtYVMRLIg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoIcxyUtZ5I55AcT+PliHn/e+QA2ku75nedrTfmZbZEj+eScXr
	jEkbNO3Q/prSUqW7siDztQefMQ/GHattp7Z2TenugyzjrTr/bazzRGCu66ZcIRvglokV1SGubrk
	3zGUV
X-Gm-Gg: ASbGncsHGJKEcNVRV6GHQCuncQHz4rbFoN61DKHHtXOGnEvbSS5lPeM3mhrfWWztbF6
	BPx4XC5yWezH7PxAST0z7Fu/fIlhjRNerzlAOo/u/0t5u5xM5Ri12xmWTH7UiofqruNQSDTBIej
	xLzJFFNn/jVNhNf45Po6EjCc03Y2faN8Pih3ONLUJbLAnEELUErIvhCdg63I5T4gg+mOpqqL17k
	lPvqb64W7k+IoI2F28UFM4iW0GSgmWK+LCUgZkdwSL3Alm9Ae8Qwlpgq6qPJ98N8xktg4Ay7+qn
	kTPBWlE+6VsdceqBX1WMCFc6lJLtQToG0YLjmdIZ1rlBmE79+xOXZyy71kZqYS0=
X-Google-Smtp-Source: AGHT+IGBG5AnZ7WoS8T+OydhEHnGXvZC2sik/ScM1rf811UK1oAyJzo7QEcRs9ivB+TFGJzULnkUsw==
X-Received: by 2002:a5d:64ee:0:b0:3a4:dde7:ee12 with SMTP id ffacd0b85a97d-3a531abd96cmr13532032f8f.53.1749548407047;
        Tue, 10 Jun 2025 02:40:07 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45213709729sm134388355e9.19.2025.06.10.02.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:40:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 11:39:58 +0200
Subject: [PATCH RESEND 1/3] Input: ad7879 - use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-input-v1-1-5875240b48d8@linaro.org>
References: <20250610-gpiochip-set-rv-input-v1-0-5875240b48d8@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-input-v1-0-5875240b48d8@linaro.org>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1770;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Ob3eXl0xtZ14fRcS+tLz8GnDtyJ7+FiNafvHBBXvo6Y=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoR/108QZzPPewPOLCuwF0wrlBiAIdz285fQ8Cg
 yfxWynooDeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEf9dAAKCRARpy6gFHHX
 clZMD/4zlTpQ/Em6ds233GBUxVYyRYs3ly2on+t22u5TSDWKle1HmPyCKtQ3NFc2HC3mgEzdSxo
 O+jitDlbR/FZdPU99p+U1KoyOBoQiV0qVkO3r9kMqr7kIPsc+9hWgpA9Kb/CH/43xWO8ocS6WCJ
 JuPRGq4AWBQVvXPz4JCxiUTVm/ENKwo3kh00c4b/hfvas3aiXaDQz0fTzteBwAsOh4MOi0RPnHL
 r4SDH6FxJ83PE+aMmdYr0bF17zXPc7vChLfphkZeO4L4ydG1tX4AxrY8YrUh4jvieXaiAPf1Paw
 7F91CQzYgiYyXec5tSf/ksKVpWUKDOHod1NkXW+tvpOkDSzDQ668Pv+7RapSOZAPWOynN2g8R4o
 zjH85MuxUwasRX1PvPZ936EQ403f5MyiIU6jwrCALxecq+wrVY/6BdX1nh1JIIAXCZgOhvArsti
 wSG1YYl5Bl1OvfloIrQCvTOUmit9IcA3+llxsoBvE71nMrQ09gWBkcCtNDhto/HkAWumDnhOxu4
 JJ9TKmcuw+SfVF2vV0cgrQSGFUVd2z/w6nimULd4bpSe7dpsQDwgbZ7JxcofVTE1NF8SM3d3MRX
 Q58T7OW6PrrZko30LaGLS7Ed/Xklt3gLPOs/zMVOHNcOSs/k+aaSSqDges4dh1UZc73BmsaFv1i
 8x5iq/VflHs6NgA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/input/touchscreen/ad7879.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/ad7879.c b/drivers/input/touchscreen/ad7879.c
index f9db5cefb25bca45e18e80fafc9cad5dd78f4f68..d2a3a5e016b6a5416846e8a9edf906c891d4038a 100644
--- a/drivers/input/touchscreen/ad7879.c
+++ b/drivers/input/touchscreen/ad7879.c
@@ -444,10 +444,11 @@ static int ad7879_gpio_get_value(struct gpio_chip *chip, unsigned gpio)
 	return !!(val & AD7879_GPIO_DATA);
 }
 
-static void ad7879_gpio_set_value(struct gpio_chip *chip,
-				  unsigned gpio, int value)
+static int ad7879_gpio_set_value(struct gpio_chip *chip, unsigned int gpio,
+				 int value)
 {
 	struct ad7879 *ts = gpiochip_get_data(chip);
+	int ret;
 
 	mutex_lock(&ts->mutex);
 	if (value)
@@ -455,8 +456,10 @@ static void ad7879_gpio_set_value(struct gpio_chip *chip,
 	else
 		ts->cmd_crtl2 &= ~AD7879_GPIO_DATA;
 
-	ad7879_write(ts, AD7879_REG_CTRL2, ts->cmd_crtl2);
+	ret = ad7879_write(ts, AD7879_REG_CTRL2, ts->cmd_crtl2);
 	mutex_unlock(&ts->mutex);
+
+	return ret;
 }
 
 static int ad7879_gpio_add(struct ad7879 *ts)
@@ -472,7 +475,7 @@ static int ad7879_gpio_add(struct ad7879 *ts)
 	ts->gc.direction_input = ad7879_gpio_direction_input;
 	ts->gc.direction_output = ad7879_gpio_direction_output;
 	ts->gc.get = ad7879_gpio_get_value;
-	ts->gc.set = ad7879_gpio_set_value;
+	ts->gc.set_rv = ad7879_gpio_set_value;
 	ts->gc.can_sleep = 1;
 	ts->gc.base = -1;
 	ts->gc.ngpio = 1;

-- 
2.48.1

