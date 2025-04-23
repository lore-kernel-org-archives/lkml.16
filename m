Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F6119E82A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 07:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745392523; cv=none; b=f3+VKYZGqSTyVecUBwnDMxplGmddW08UTy49sXgjrGZxzkb8Y0OEEbqfgDLSP0V9VHmRV24P1W3MfwpyLXY1SpwJgDAPhvve7g2pP4GkLm9GswglfxzflQm8zc3r6M8EQloq6CXbyge8KmHaXOb0CBT/8T8HzAjZRMFaiyvmBFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745392523; c=relaxed/simple;
	bh=GkZqNijLEREjgRCyxLO9ZWn6Syhz3Qs1P6LxUc7FAUQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GnQaJF5XD92RDW/EXheTV4t/Sg+Mi8vVX1MlUrsJoGk/DwyQm7K1jte9/T2elba7JJGBPFPtqOprlZhxR0Mxo/Xm8Rge1dYAyq8IJmPJKgPp9JMwVsDiJQreyvRsYlu9AGRG1iFT/zfE4cHTZwcRM8GqGI36j5eSEqDfOOI1ANg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=E0NYy58u; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="E0NYy58u"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39d83782ef6so419599f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 00:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745392517; x=1745997317; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R0bNDTv+LkOZiuFXKOWgCql95LZI/mk8z3mrtaxkHEY=;
        b=E0NYy58uyqW2qnwuHJX8ueh9k4zi6r5APAOFYbb1ktr8haA+TVZ9Oe6s9rG25LU61d
         VU+unr6xNI5BV5X6A64MrUlUVsRDinzVTjuqG6TuKC8nmSswGYTaXz7orcd685weWogr
         8Ep1vRgjC6/X7z8v8DXTD97Fk0Lty3suTGxS8i0DoYge41GyYjeNYmorV6qXP18AMuP0
         Pvv5UJmWKwzL6NQrAkSBtzosZsWNyWbgp+LU3OoBXDmUkyj3Iusp2ZzSi+TrYpCVp89m
         3lQHNcSJdm4mcMlHbF4n3zA99udypIC7Ss5pJmd8bLovLf1qm24hkF3Lg0qwqxRDv9yP
         zJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392517; x=1745997317;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R0bNDTv+LkOZiuFXKOWgCql95LZI/mk8z3mrtaxkHEY=;
        b=ljvz2I19FMswYMd0CtE1lDU5T85b1yiiBFVSNpRCFbRLwMWmNzTYg7I1Tfxsee6s0e
         8x008nlH8IWXCwi1J57iawbuEnemD+EpJn8tmMbkPBb0JZGLOFm7lO1QgW2mzn+ZkO85
         f8co6chtlixGuDTjuI9xU2g+pZva/+mGmYOdN8UxHNFEGAVD3NRGCrEzFG5he4cVWwIu
         TRtYS+JBFXbJfK4PO02Z3vnQuwNPHOFCLnRPsCRSJl9Ne8yvf1BMHWGCz/C/Hm5wsLzl
         2IbE/4m4Wmx+F2AcFAbQ5hRMN3/lKVZ2lPzcn9Ix+S4tJQc0NIu9KUwUeluW6I9myI9O
         Tc7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVM7KAdm/L7lc2TxK41J2Rnj2J060WCPeW53Ig9wMKSYkpfsPm4e6LvGnbpdp9FcfH19A142Z0wVOEbvNg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1PO2Oci7uMfXygxNf6oZpR0L31Y7AUCbT8dE4ckK5Uo3wOLZ2
	JLWJZBYj635AD+2Rb4yMJjTOdHdCyhnqmJNgNV1uCe275NLPqwJXYuYzWu6RMxDJuW1jSnYsID0
	hqss=
X-Gm-Gg: ASbGnctB1midhtcjyLujuollXJZCnUkbs/CbvNnCE+gnsJmnoRCyu0pzi2BqdhtlDQv
	9MwKtZ3Tb7kZJyUMLxPqNipgmR4ni2X7FEndWf3BF6/14XWOfE/nH/OEHw9ukGVcMnXKCOUHbhe
	vvVNYnkRf7oR6ScqwsXaNiptnrX5+h8cFqv4P29OJpcYACX3mtsLRGi6jWpmE9+Y4rIICsWzgbo
	95mS6TJjtc9mh3mKprXjxCX5pgJ4b8qEx11xbG9FrHkrvH/pv80+gYAZPBzqldvMVZBaz372IC6
	lUfSYgEBpBm8uY5k+K6qy8sULDkhSvtWpg==
X-Google-Smtp-Source: AGHT+IH9m7S47Z/jCJ7Q3TFpGFMrRhaPorWIcAZkoI6/0ohfBThJXsrLnX1OsA7yjjcCF0WIrr4Zhg==
X-Received: by 2002:a05:6000:1a8e:b0:39f:d0a:5b23 with SMTP id ffacd0b85a97d-3a067243e1emr1216191f8f.17.1745392517460;
        Wed, 23 Apr 2025 00:15:17 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493446sm17696935f8f.74.2025.04.23.00.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:15:16 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 09:15:03 +0200
Subject: [PATCH 01/12] gpio: imx-scu: don't check the GPIO range
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-gpio-part2-v1-1-b22245cde81a@linaro.org>
References: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
In-Reply-To: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Lixu Zhang <lixu.zhang@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1257;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=sDwXikOtbtT66flaRPMOQLEk1wgtXlmWPUc5xrs2aGM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJOAJtVfy51LcVaIdW/Da1I0wLQ4NQEa0Ef9t
 G5TUun9q2KJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAiTgAAKCRARpy6gFHHX
 cle/EACTYLfKBloBbJL+EzHJRUixJm8o1vusIAehFajv6F5jqFGdV1ieqz/FHdEKoul2HSfpboN
 B/VwA/JclRFH+9K71ISjvlxdHUOXVWAeC79M8RCXb2sjR1SL484Vi7SATqK1heYF6HyqgLi5DU9
 x5I+yC8SJhMmPkzCqsxF+6jMOZJamDy7JMJpu+6scjGlhAJRpx+mtulebQRcP1MzXS1vxOzfwQh
 3HSHO5/1pxJBi8sKMdmSJC0CWJkNWvPbFdcU9QHZTd4QgQjKnmLXo+vSp1zDwt8ZKveMOMkEfuw
 tXCYwfV6yDWn6AzenUdyisI7KrqI7jPLO573nh25LJpw/XODieasvx10z4wEKC4Kxru84R27Rko
 4cxtTyxZ2PaXsKERURrnq573AU1Utt1jpkAazgPp7UCOqwJ4hKBWEz21qTP1Mz+EqupY8X/pgC/
 4vGCUNQ3VMb9eo4dDzS9X0LPH8yzcpC9or77pBIvatjwyn86D/o3wFctdvh+vFuZVDMyA3/MSPH
 /0vY5IpKOzCtFt4Ba2qHVQ4SnprInqtEYD0kNt3RnB12yFauaAuFcMXTTGlAyheOUDHN68AAIn8
 tSoCKbhVVSrrbS2ctGybfv148pl38wC/byXGntzu5EwOvAca2IlqfIyzzJoMBEBZYlA0yeDQhpi
 DDM1nncdH9HwCPw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Core GPIO code already does this for drivers, no need to duplicate the
check.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-imx-scu.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/gpio/gpio-imx-scu.c b/drivers/gpio/gpio-imx-scu.c
index 13baf465aedf..403d03f18122 100644
--- a/drivers/gpio/gpio-imx-scu.c
+++ b/drivers/gpio/gpio-imx-scu.c
@@ -37,9 +37,6 @@ static int imx_scu_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	int level;
 	int err;
 
-	if (offset >= chip->ngpio)
-		return -EINVAL;
-
 	mutex_lock(&priv->lock);
 
 	/* to read PIN state via scu api */
@@ -60,9 +57,6 @@ static void imx_scu_gpio_set(struct gpio_chip *chip, unsigned int offset, int va
 	struct scu_gpio_priv *priv = gpiochip_get_data(chip);
 	int err;
 
-	if (offset >= chip->ngpio)
-		return;
-
 	mutex_lock(&priv->lock);
 
 	/* to set PIN output level via scu api */
@@ -77,9 +71,6 @@ static void imx_scu_gpio_set(struct gpio_chip *chip, unsigned int offset, int va
 
 static int imx_scu_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 {
-	if (offset >= chip->ngpio)
-		return -EINVAL;
-
 	return GPIO_LINE_DIRECTION_OUT;
 }
 

-- 
2.45.2

