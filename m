Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570A91E1C26
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 10:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739184736; cv=none; b=JJhVHIbfMrDlD13PxJqRhteNdg4cU312n6ocydpgjfE21X3kmhrs0cG/73ZJw5ut14we2RR0I+vRuL05gkElqqyg2TuiFYfhXpQcP8r7lwSVM19yZyNAb6CmxizevpoyRd0bbZ7aMJn0AoOvQRQeSTt5d4Uostf6Ntr1cQ3/BM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739184736; c=relaxed/simple;
	bh=V6WoqRuA4KI05FV1+v4Oy7g4HufVg8Bs8TaRncykJPI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pnLrw7/Rk6wzOOZJSzJmmbydOZwVrilPTnQ/uIFLDo81uicaFOvf/2HjLzmphR9dprxl4lSPGNmQHxe1B+NylmbIndKVwzGW15cN1/RkwTO+dN1dQ1VKAiPqBeyoyYZR8pA+4kEFrW4VSjIJdX16uqTTnr5AKocaqE9uaCc4g5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=VgIXrlWf; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="VgIXrlWf"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38dc0cd94a6so1843415f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 02:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739184732; x=1739789532; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LENKvGX4vcq9UheVuJ0AMEOpXRzUqJjB/uWgFb41XbQ=;
        b=VgIXrlWfT5IAZfuqHO8Tx74JYjImtjYpLJdAaL5kzcGpHR1jGE8Yw43LNgu0tiHqL7
         R0tE/595Ae+JJ0ieIxU+lI867V8/wPDuQWuOu4tRBlSqOy69EjCJtYhVyGoWhyP4vqbg
         m+ETKwGHKmDhfbsniJ6LlHSihuhTFJXzGMEpjx0+ZtJecyHg2V/qu7DdDzgqvATXySdI
         3oLKxZ5HBI/W/Yy+fGu4+SfLmgnt7j+YXirvJoldB6TDUh20oDozmKW+taVhTyaChG9Q
         /lP79wWkxbCATIRer8KXKepu2POP4MPT/vqpUsy0lbR7aMv0RcfWEqH+ujv0MIRg3pGG
         Mt9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739184732; x=1739789532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LENKvGX4vcq9UheVuJ0AMEOpXRzUqJjB/uWgFb41XbQ=;
        b=HJIBhDrOSZspDDKfggSvVxwB4bQIryaVjSaphwY/0zEU2SzADKf+OU+qRZ1DLmcTtW
         bXbijkk3ihplTRWJZl/6Sae2Une/EOKwEawqi0381DDydGibGpF+WDtsTl2P7MbhGWII
         0NMW9/lNbdG3T6YnUA+pNymSHUCR7HOh38zbMsGmhC1PshNeyfyAE2DMPpqhjtVtvK/l
         8sEa3IUGL5G/0H3hy1IiOUejW3yEagAAvyCgSN8FHpAmMTrZb07ZwRDCv5eFwK6VW6b5
         UIjyCpLY2t9Ysl8grFec7m4b9jrJNtyIG+Gc2vdHgX6gk565qv680euoURtOS0mtksdz
         9kqg==
X-Forwarded-Encrypted: i=1; AJvYcCU+etHXJftJxToD9KmMoz8jBRqOoU7gFS6AQ9m2inPlo73AxT4BclzRVFwq/VMUl6XAWE7o7C0HimlSU5g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzO8L843vrAKNBLEyg9JLLVJbszQ3wlUpkvvnOuQnTY7+kyINaR
	D5JFELQjbvD0Z/J/1Efkdq+Y6qhztX3uGWuuzpx3ocEy/eb6UFX3/XH3ZxU1jtdLFTad4k1NS38
	v6lE=
X-Gm-Gg: ASbGnctb0+AjrudB/QsU01IUYs04wrWsNKWRircLyaHWta5WAOZJKmgKeiOqr6dHg11
	8ViTLtk3xCvtvlXL14cJ51Op2qQTfvvgW8tFF31bsfdyCihpxs4MZ4TtleRjzP1rBGbRh6zSmRU
	Sq4ykezrWXBLJZcNIz3Y4Taca63GKtLq/8lEJDO8ur5IiFfRg9SqSLGeiZJ/q7mZuUqspQPxilF
	4hoA8Ahz6PzwoMyG45n2shJvCDqLS1E1H/7Uu6di9oChTtV7xb1zL4y/eJWtO+VK6Ilms7uoEpT
	wCel+hdW
X-Google-Smtp-Source: AGHT+IGcts0QLUB4a77mWTRAzfoRCt4VM8k7qsgfMeWESQ+XzkXt5a40ga/6FmpFrd0x0OUpy75nFQ==
X-Received: by 2002:a05:6000:4012:b0:38d:e378:20f7 with SMTP id ffacd0b85a97d-38de37821c5mr46131f8f.41.1739184732183;
        Mon, 10 Feb 2025 02:52:12 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f3e9:47d0:94c6:777f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc53ae9c0sm10557919f8f.101.2025.02.10.02.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 02:52:11 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 10 Feb 2025 11:52:00 +0100
Subject: [PATCH 6/8] gpiolib: sanitize the return value of
 gpio_chip::direction_output()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-gpio-sanitize-retvals-v1-6-12ea88506cb2@linaro.org>
References: <20250210-gpio-sanitize-retvals-v1-0-12ea88506cb2@linaro.org>
In-Reply-To: <20250210-gpio-sanitize-retvals-v1-0-12ea88506cb2@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2266;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=v5PaGseLV+iX53DOub4sqpS1V3bIng/nrHtGLctVVdQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnqdpT05VU7QlrO9fymh6SdG4wxJ+svHmCP6bdk
 bYTEogd8/6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6naUwAKCRARpy6gFHHX
 ciQAD/0Y/GW+31oLwGIVNlHfLMDdu64zc6BxN76j5jU+SUqFRhYTXjvnrhNEj8N6eYT83mfS0xI
 EUpIOfTnApVbqXF9er69IkYITWOrB7kdv8kdlk0KYSJEVVkthBYzgwHDppdNjcMRqrGzoO7/SOP
 Jfcjb6h1eFVONFj7XIvPRaBwMKVoZsp8f/eUHanFvdvZBnuOQkQspsyHRcZNNTI2gt3dEHi/Sr1
 Ao+CAANEx8bc/t322NflWuhwEyL7hjV6juc4soB5MuAEvjL3rmri2mXfHG7Qqm0tcFmSfKMqGMY
 v2p7w0MH8lwpsyKh0EyUuFXx6LiB8lmTulv+5mSSBkZBOseUz2uSoNCT578EwS/GmJLGltrGCUd
 12e79Jdzg/YHg1FR5PYRrj1N5/23swbeqRiQXUXI5ZXCEwHr21y6XRwvTfuX+fUbYkamZlSgJb3
 R8dnGO5rJ1q7J6QARkgrZsu50cRgelpXBdxhp9Jdpvce2S5enJQK0VGDoew3c6a6Hf4FOc9wfGC
 vc9jIaUdd+xumNRLcl+N5ZM0elXqBSPYYGFxxmjt+bGyp+Ae1YMKthq4qkRTPsIFJGOIHPwsL8V
 EUrF3Flnm3EdT4yFKIcP10LQsbU3i2pgZWxugBzL7BXHOB2HtKlKmgIfcVsQCIZiW6dw2Wr+VtV
 cy7E2gz6ZN2Zb7Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The return value of the direction_output() callback may be propagated to
user-space. As per the API contract it can only return 0 or a negative
error number. Add a wrapper around the callback calls that filters out
anything else.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 7255f4df6a8b..1f75ae6e208c 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2683,6 +2683,23 @@ int gpio_set_debounce_timeout(struct gpio_desc *desc, unsigned int debounce)
 	return ret;
 }
 
+static int gpiochip_direction_output(struct gpio_chip *gc, unsigned int offset,
+				     int value)
+{
+	int ret;
+
+	lockdep_assert_held(&gc->gpiodev->srcu);
+
+	if (WARN_ON(!gc->direction_output))
+		return -EOPNOTSUPP;
+
+	ret = gc->direction_output(gc, offset, value);
+	if (ret > 0)
+		ret = -EBADE;
+
+	return ret;
+}
+
 /**
  * gpiod_direction_input - set the GPIO direction to input
  * @desc:	GPIO to set to input
@@ -2780,8 +2797,8 @@ static int gpiod_direction_output_raw_commit(struct gpio_desc *desc, int value)
 	}
 
 	if (guard.gc->direction_output) {
-		ret = guard.gc->direction_output(guard.gc,
-						 gpio_chip_hwgpio(desc), val);
+		ret = gpiochip_direction_output(guard.gc,
+						gpio_chip_hwgpio(desc), val);
 	} else {
 		/* Check that we are in output mode if we can */
 		if (guard.gc->get_direction) {
@@ -3433,7 +3450,7 @@ static void gpio_set_open_drain_value_commit(struct gpio_desc *desc, bool value)
 	if (value) {
 		ret = guard.gc->direction_input(guard.gc, offset);
 	} else {
-		ret = guard.gc->direction_output(guard.gc, offset, 0);
+		ret = gpiochip_direction_output(guard.gc, offset, 0);
 		if (!ret)
 			set_bit(FLAG_IS_OUT, &desc->flags);
 	}
@@ -3458,7 +3475,7 @@ static void gpio_set_open_source_value_commit(struct gpio_desc *desc, bool value
 		return;
 
 	if (value) {
-		ret = guard.gc->direction_output(guard.gc, offset, 1);
+		ret = gpiochip_direction_output(guard.gc, offset, 1);
 		if (!ret)
 			set_bit(FLAG_IS_OUT, &desc->flags);
 	} else {

-- 
2.45.2

