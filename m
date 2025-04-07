Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28FB185920
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010827; cv=none; b=MaGsadfQXMEeuJ8S47KZdsZmssTOIJFXvrgsOsXDClTnz9l47zXNaZfgePMxs/JQjPzh8x8AUJnVLM4IXCWbgt3TAlXkX/pL16YoA2QA34mHzNer9akRFKNs6JRkXZT5xxp+/oypHaJQVG4h90QtIwoZhQIXQvkf4OSDWp64l8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010827; c=relaxed/simple;
	bh=Q2hvduva6KqQkHASyRGukCcsvLKULC9rmnwEVzjrJTc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LwPvbgDxOKC1VGMlXaxXmhS4r++S0wF6QHKBGF+tiIRIzuYsISbn5bqIHhq11FLGht9DLNFpTeinZNZFbCQQlCEtE64PUHneqgD27BZOI7qJ8nhiJuAylg3mEPa2PDfn/qk/U+r9aRyfd1kkHVgTPqRQf2imHCVowtRZasxsWuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=QVKDmJBf; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QVKDmJBf"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac6e8cf9132so422416666b.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 00:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010824; x=1744615624; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ibROZn0IFJz5QzV4WaY8wi22jP2cRYC3gjXYgtkdD7g=;
        b=QVKDmJBfdITVImVujb4L9Tx+HpN3gAg5I8F/AlQ1b+x/yciQDI6JbLtJ2DF8r6tglU
         HECMWKNWdtD3bRdxN6GU0HpWrQ6seElCswCf8CtkDdxY68T+YMelkYA3pl6QLn3E5ubu
         9/OFlCZcrt3SVR+neD7KRCkjzJvmhOdKzb7m0GWOLg+vtHAMauRuFz15gjaiFR/AyTPe
         KraKfTvKjgNtWJFA/KtVE3D2PjOsJws2ATP8qo77VRg680+71Cc6/z9DBpxUu8bn+1qx
         1hyARWxQ4yZ0+ifOHosqDd8BJ01MsUEOmwQqVwdxXF+BUOSHa2qDCvV9G1OQwXz9FQqC
         93tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010824; x=1744615624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ibROZn0IFJz5QzV4WaY8wi22jP2cRYC3gjXYgtkdD7g=;
        b=LdkLCJwRsg3km5Kges7+aCHp5tRhpQhheqEsnqy9vzqCoxg+MWXwcd+pJNUqd4/Qe3
         6HT6zBjEEEeqimKtiY/dHX078fbrBXYpKHubFZJUtd/4ToYGZ+boXFp+LOGHnbR4I5sl
         w8olkEvLcI8VmlA1CXKLKCkLq862WceXAhGye+s6YkfqfFIeUG8yv9FMEJKrA3f2Lni7
         lzf9P7dsbY9U254ICmMbT3pkF+/yz6OZe18KvYz+/rDz82OIbE3+Zq+21nFM8cILP5s3
         ukrPEXz1GxHOotW1WQ08GUDCSJdLdjvHB1WwALKWY9gR1k5wxRU1k4xprS4G7lg0pzRw
         1fNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVt9tSu0frwxxrdSzbPybxh0lG05zpkIPW2EHuR70PmMFPLOg7PulV7HdT0RSBtT68jS3Qt5OKXWn2T5Ys=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNymEMAbvXtdVo9HX0zdI8ApffSpUaXouCG09mcD0qJRPUlCG9
	ut6RqSdy3JwE38xoPKTQMLkimVv56N4Qjb+T+iZVYZBKvt5305QS+9S1pcrHdA2tsrrZhuI29tE
	twRU=
X-Gm-Gg: ASbGnctB/TtthHr6+p/UYHYy+ChEDezk6ehnIRXSK8TsDSAVgCLVOQZrenjyoAz+bDn
	EqMlXFPfQ4qaXtsKY5J9zmgZ5tE+o23q1CSQKWTa0GDl9o5a/wZkUltFxCzbR9froM8JkMfWz+O
	Zi40rjI4F00ryWCacuSqFc4/QmS1Qa+yrQ5CU7E1gX4KRRetEFzE2mK+2yNFmZ5e7j0deiT8vc0
	yF7spMYetWyi6qSlvGxSeIwpOybX2ZKaj5g5+teXdcSSsy9hMpp6OBysKXPiU+qFST4QIQ03iY+
	LGRQ1W3NDhCqWRZj44idu2ZjS6a9t7dsIu2L0g==
X-Google-Smtp-Source: AGHT+IEkHVJgOyU9xGp655NX5EHCzYygkvYDzVBi2Npjvs/0OWrQOPdns3JjSlF95Cj2KJnmKf8UhA==
X-Received: by 2002:a05:600c:198b:b0:43c:f1b8:16ad with SMTP id 5b1f17b1804b1-43ecfa0572cmr131452905e9.30.1744010353699;
        Mon, 07 Apr 2025 00:19:13 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364c959sm120215145e9.25.2025.04.07.00.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:19:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:19:10 +0200
Subject: [PATCH 1/3] Input: ad7879 - use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-input-v1-1-a8b45b18e79c@linaro.org>
References: <20250407-gpiochip-set-rv-input-v1-0-a8b45b18e79c@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-input-v1-0-a8b45b18e79c@linaro.org>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1714;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=foyELHbizbcWk/j9r8xiniRZm26jVuqeFRwl7mGDslU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83xvMsVuyrAN8UuFJvWiCgwJIhVanOjs5RyNU
 f6v6R7ldHKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N8bwAKCRARpy6gFHHX
 cjBhEADJTqfjnpnZK+R+cF6dWcfSD6GmueJNC9Q1SYVFVHW+TQvc3mi2GfaIHJIqqkmrqMSa7VV
 LWzNtodZD6j9I49JZvliGWrbph/MS2MniyULfTw/GMwmhPwZYpi9g5+4cwopCvfPbMUouldhvUO
 cp8vdggCPeBpOaWx/AmYIEeSB/Oy8RofO4vsuvh5/elW3GueigH8vQlas2CQYBndd0kk8OEgdZY
 e4/wFB5pNg5mKqxB7byMuFhmkDtdSEHWP+O1H5+66MQVXNJU/Iy++0DvU1fQJZumxIZxQPIFXCb
 k9yOgd6MtU4N3gcM5dtjsIt+BIVmmn+VDbGrlIvJrk6AmyD0JdtgwDITtnWE5BQTCLkbDtZXM8b
 q+B+ct9iHNr54/R3EPgziIWcCf7cW/FrGqWZE2g3gq/NVmo42KTfZxcY6L6BfW+N6QlI2UtiThG
 62dx7KHW75jBQTWMU1nC6IX+5KC4S6XtY881B8phngJLNcmh3c9itLogh95f229if6u/ktqZIBK
 Mh9Tx8iQMLEyFE383FA6SQQYC2gghSl7zYDqqw5QZmdGbjpEaufAfPbZmRQC9a8pwGE/Dbf8Y1D
 W+9NBHCzUnLCeJtFZlh9Li4FwhHBoRNA1DbM1nJwK+1Br8ruCTsUWJ0mSgmUTC0INmrSfQsN5F6
 wJFGm3Ml2SPjJdg==
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
index f661e199b63c..12fc39f9e784 100644
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
2.45.2

