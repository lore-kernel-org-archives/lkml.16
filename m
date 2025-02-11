Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F211FCFFE
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 12:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739275808; cv=none; b=UVigYXLdAJqrJ7jdz5RMkX7xFiet2Er4+W+3Q7ROuzGK2eoPBblOxdAEP6KH8/IEHpuvG1xWdoGII8T8mjpn8C4dUhkOcKpxACbWxr6tZYudsix8//1jq3e0O8JA23p/MadnCFIwXSucXSRaoQ0XET9RU0DRiAQ+AAbfjF8E1m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739275808; c=relaxed/simple;
	bh=wXwa0E1M0BKOGtuEr1FqMmPc8bR9UmruxdeB5zto9+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fnSP/+BiGMRS9nalSLcy33taXS/jn2IRR9H88cQNYO0q4eKzINaEGL1coPUx4rcxqld14PNaJHAYNpxa0uJqB/ngki615dO8DFptCyCoLn9ajnJrgbqvSMQXEjoBfCRcXDgl2IonLacHSx7dp90InsmYiXHxCcdNsXnH8kzFckc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=MKO8qZe1; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="MKO8qZe1"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38ddc36b81dso1548290f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 04:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739275804; x=1739880604; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r482wJny7pIn2us9/LYT8FUnmdRdfE6AyUJxQwiteLw=;
        b=MKO8qZe1Py3yorCBWx/vvw69kTfL+tdrKfOqNNF/VnXczf2NNEud9HtGYlhLk8vzDL
         ByuHxmv9pFRH9ef5pCY2N4Rq7EDzShCo+02nGaREYMQ62bLvxtBF59wxOL3beDzCDdEO
         mk5r/Yw+EDygA/ZmyR2cD1Ed6gaosACkKHLNzuNEmOKHGebvZkayfHoULyUNbuWi1r1G
         CjsMd7WnvmHRcajEveQy7bIe4KcLKEgEIybTf9bopqyZRwHfr57CEl5Pccu4bKvMEkrA
         epHlEDx6Lq1Uecr8Bi6hlj0Uh0y+AcT08ofKet1LrkQeKBKTJYavscDlV4HQakADGIeu
         5aaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739275804; x=1739880604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r482wJny7pIn2us9/LYT8FUnmdRdfE6AyUJxQwiteLw=;
        b=OoayJeR1fhFfdlT8XGitLVkltUVNAWxTsfPh2mkM3QjPh4iLirB3Fxq+pM56GrywHJ
         +aP/4IkWMuJwmMe3ZVMh7VNi+U12ocggk2RSWaPjo/Z8pUVNTkXG/eoJepE1o7JU8O3Q
         4AAXVZzAZ5TVk+pTWkbuDHEZUwVNs8EtD85384onBNunOUG9qA5uVFvAo6rJ92AmNz32
         2o7qNUyGA3NDT7M3aFBf9eGPwFOI6zt7fmsO3xRHnxeneP8Khm0IsLldVsWg/iczNIGx
         gV9aCON3f+9X8Ra0wncMFiRVGg+keUpyWLwf//HZdA8jCY4K/juHkC0jaCLMYrebCfXR
         +9bg==
X-Forwarded-Encrypted: i=1; AJvYcCVUNMMC3Ker0VsxbcYkZLIbzrLtzG2THOmdIC+hg/B89Z5kVrNHcz+44RvbfbZk7H+UPgOSRg7y25Cq4/0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjQ+iREWL3WMWXMkompE8XnP0GyAF+/XyXQeYqLaWMvay3ok1H
	iOBAEanpsHvwUp+2bof47Oa1LP3+FwrtMlGVaRVyn2dsU6bEf3KXEYC3RCpPzV0=
X-Gm-Gg: ASbGncv+FNHGPpltLGb5Cbd0jj2QDbPWd1GdpjrIt9mMxDiGibtOhbemwIGON9JFDM2
	Pwa+UsEcC7bJ/wpGHDZPBRaIcjQej0gADURNOK++Lt3eSSJ95tPyibsmA0oErnrd43wXbRdISba
	Jq7L4ca8f7oY3JZYhZyiXoN7KovYxJ5jk4igIBP38j2pcg1OSnXDXbEvuHuh3Gsc7Y4YiJvmQtR
	J/JtCUzyEYOHThzNCO8ezbIuR3XVBvY8yLny0jVn5gkJ804p0XP52KmfCYKhSP9jCv6YCHneMKi
	0ba8vvw=
X-Google-Smtp-Source: AGHT+IGm1WkQZSm2qsw7HP5G90EX3T9fCEEa3NdUWmfxnPUwB/BOLSiGfP2dRRFgiiDIkTs1z6MEFQ==
X-Received: by 2002:a05:6000:1fa8:b0:38d:d59c:c9d6 with SMTP id ffacd0b85a97d-38de43c6f60mr2704980f8f.21.1739275804641;
        Tue, 11 Feb 2025 04:10:04 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:561:8978:1d41:636a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd4342502sm9152327f8f.26.2025.02.11.04.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:10:04 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Feb 2025 13:09:37 +0100
Subject: [PATCH 03/14] gpiolib: rework the wrapper around
 gpio_chip::set_multiple()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-gpio-set-retval-v1-3-52d3d613d7d3@linaro.org>
References: <20250211-gpio-set-retval-v1-0-52d3d613d7d3@linaro.org>
In-Reply-To: <20250211-gpio-set-retval-v1-0-52d3d613d7d3@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Michael Walle <mwalle@kernel.org>, 
 Bamvor Jian Zhang <bamv2005@gmail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Keerthy <j-keerthy@ti.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pwm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3178;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=7EHwjLmMOp5i1lwV4E9OqV8YPFD4rMKN4X3bOQqQoMs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnqz4WlB6wl7VuviO9RVP4ZQ6IKfVuQCqI4ys9F
 FlywPa/RK+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6s+FgAKCRARpy6gFHHX
 cuW8D/sEVQ1GIHY94+MF7SYD7ldcMrKEKxbzIl/A8HiMMe1jD4KIkkZbC7w/0v0KkPXbyFGm6Ka
 ielhuHHRavv4ZDgXysHqoKqa73JgWrXT61tx7z03DSQOHYUnB3AcvReHdj3XR9ETlrNcMMs/MbS
 Uewo20cZnAozyHwSHfeBNoZKl8UGkDhuTc4lZywz7swislpBXTRq8prFT0zxVJFQh6TzaFyB0RG
 ValuOi/AfTVzTSfjDh0b9I14y7gORbTEgb3sJwMXlP5gP5J7nzG9xyagLaXzeATeV1Oyu4bciOY
 RAp94HfhlAd1MsBGTFU7ZWUoNyk9d6t7uL2WpkCl4LAyLArEM3jLb/zElsmGSj5W1DBJosGLlyO
 dztgOpEIneqO9f2i4Q4+9wcuiCYSxzvSgefxz95yJMaunV92k7eyVFOg9yv1FQiqiAMJovyaude
 abM9xPj9M4tlDF2vsKMtEz/n6mrGeHDee3gvvwWLIa3fpUrFlW8ozGcJJFqBQAo5EPd8EYvm9D/
 z/p3eohmgMQ/SlUY/tjiNFwJxZ6MMt56YANTxzZFGkEZCmnBosc5AoFnYdgOB07CLLhDz+R03xj
 yftVC8stTz6IOa4bU2wsk/6UOM2Ct8Kato4d6PjJLSPHiXgwyhTuaHTn9SpdPBOUPShof4GIcAX
 5exXsv+hV0xnqsw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Make the existing wrapper around gpio_chip::set_multiple() consistent
with the one for gpio_chip::set(): make it return int, add a lockdep
assertion, warn on missing set callback and move the code a bit for
better readability.

Add return value checks in all call places.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c | 45 ++++++++++++++++++++++++++++++++-------------
 1 file changed, 32 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 7826bfb72104..1f078a20ce3d 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3468,19 +3468,32 @@ static int gpiod_set_raw_value_commit(struct gpio_desc *desc, bool value)
  *        defines which outputs are to be changed
  * @bits: bit value array; one bit per output; BITS_PER_LONG bits per word
  *        defines the values the outputs specified by mask are to be set to
+ *
+ * Returns: 0 on success, negative error number on failure.
  */
-static void gpio_chip_set_multiple(struct gpio_chip *gc,
-				   unsigned long *mask, unsigned long *bits)
+static int gpiochip_set_multiple(struct gpio_chip *gc,
+				 unsigned long *mask, unsigned long *bits)
 {
+	unsigned int i;
+
+	lockdep_assert_held(&gc->gpiodev->srcu);
+
+	if (WARN_ON(unlikely(!gc->set_multiple && !gc->set)))
+		return -EOPNOTSUPP;
+
 	if (gc->set_multiple) {
 		gc->set_multiple(gc, mask, bits);
-	} else {
-		unsigned int i;
-
-		/* set outputs if the corresponding mask bit is set */
-		for_each_set_bit(i, mask, gc->ngpio)
-			gpiochip_set(gc, i, test_bit(i, bits));
+		return 0;
 	}
+
+	/* set outputs if the corresponding mask bit is set */
+	for_each_set_bit(i, mask, gc->ngpio) {
+		ret = gpiochip_set(gc, i, test_bit(i, bits));
+		if (ret)
+			break;
+	}
+
+	return ret;
 }
 
 int gpiod_set_array_value_complex(bool raw, bool can_sleep,
@@ -3489,7 +3502,7 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 				  struct gpio_array *array_info,
 				  unsigned long *value_bitmap)
 {
-	int i = 0;
+	int i = 0, ret;
 
 	/*
 	 * Validate array_info against desc_array and its size.
@@ -3506,8 +3519,11 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 			bitmap_xor(value_bitmap, value_bitmap,
 				   array_info->invert_mask, array_size);
 
-		gpio_chip_set_multiple(array_info->chip, array_info->set_mask,
-				       value_bitmap);
+		ret = gpiochip_set_multiple(array_info->chip,
+					    array_info->set_mask,
+					    value_bitmap);
+		if (ret)
+			return ret;
 
 		i = find_first_zero_bit(array_info->set_mask, array_size);
 		if (i == array_size)
@@ -3584,8 +3600,11 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 		} while ((i < array_size) &&
 			 gpio_device_chip_cmp(desc_array[i]->gdev, guard.gc));
 		/* push collected bits to outputs */
-		if (count != 0)
-			gpio_chip_set_multiple(guard.gc, mask, bits);
+		if (count != 0) {
+			ret = gpiochip_set_multiple(guard.gc, mask, bits);
+			if (ret)
+				return ret;
+		}
 
 		if (mask != fastpath_mask)
 			bitmap_free(mask);

-- 
2.45.2

