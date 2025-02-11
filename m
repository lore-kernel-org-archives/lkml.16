Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556771FBEAB
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 12:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739275809; cv=none; b=QANJPtFWpFnLcaffvlmtZiyKSkF8Ej0F8bC8Mu3jW+v/qOwHK+WvLoRaz1cKS6PulAL/YFch6aFt0uIUmqi/uTffwnwGNXKOJw80TinvfcOWkYgwqrOz5YZlDQhlLSq5/g/FdUnhYpnqiNdIiei/fMAD9dnlqVWVlJL4QpY5AT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739275809; c=relaxed/simple;
	bh=caKhfxtRFMp/EYZR8ylZh3Qlurb7Wy9UqMcdz0OG2as=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lzeZQGJPv2vvalQ3imMmGWx2dCiCQTPbNCofQvckIAP20wnXY0gcQmCr7JoTZiBnKokepAn/qMRcu9c3eUYeJyIY4VcfhiAmWqQbCrT1KO1T/icrpFw4QUOjKTUp4csFKsOaCy7pIoQMmpMfWHP4/OX6LYZZF0HWIOXxapgb8z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=09VUB9Gq; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="09VUB9Gq"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38dd91c313bso1438122f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 04:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739275805; x=1739880605; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YB5pK+oicJDwPB8Q0nFLhIRVf54jMTA5bcMsE6iZ+04=;
        b=09VUB9GqdzNkKIr2xORY+cZ+vFaigKWdkg2V+alYu0mFG0rViMoheV6DX7TE/0UxCR
         hLyPoaAp5gO8Yi3PwjRMBW+5OuvI6ujfNGx0yyaYxYGRaamIdZbRHYNiUE0ybE1Tm8+Y
         l/ngD6YHIGa6ciMSA73voMmRK0AOL9XOEBc9Jj2i3lnODlhUin7NtyOtvr3I8jz1gxzU
         3k6w5114GB021WP5qziSgf+N1iGjMW2AOl5KPj2O+sJjNhIDPwSeCR3qBv4sc+mLXVCV
         M6a+vwaFOCbV87KehRyFTUkGeKaQ3QiRdVpEFIFHIIn+xy5DYJGdjHU4qVgPf8qYW9sg
         YGiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739275805; x=1739880605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YB5pK+oicJDwPB8Q0nFLhIRVf54jMTA5bcMsE6iZ+04=;
        b=jge1yzJFJIP7UpT2dYH6K2adaQxh303IPWJZfWuchatJbIaySpWpNWQcrCODTOXo17
         Gh2E1mvPQXEy+wOGYiycS+nHPZ6UmNbZk7Cwz3h45m/omF8iClyipZPz6f4HVeQWQstd
         9xlJFAdUzxLuVQPsf+n5s5QPs4hTijbKzmOod5hUVpUYYcCbfCmX6RBup4VcHOYEZQQ2
         NVIi+sgT4bZvzwBq+PbD1EtKbtWQVnpYlPKYolqSLFctuHtLRxBD7DDG7sNd7/4DF8GD
         h1LIOYMmNRTw+xGPbzHAjKzSfKUd62l+PvrfTBjUo6GC18fIHQwr4kFuFV0gHg//1D4S
         GCEg==
X-Forwarded-Encrypted: i=1; AJvYcCUNCB6zXimfsqRIRKNAottuX7Le8arObRL94WUT0+l0yphfv/dqN38kHblV8m63gs6d4OfULhcGYFHrhdE=@vger.kernel.org
X-Gm-Message-State: AOJu0YymFVMZaJHa4l261Pllfu2zhHHVk2g2dBDemvubbXeaCF2YbmyY
	fdKl1y2x0PDPNng6s+mPxF+EB6/00mgwa5rc/qE3b7O06ynSbJN26pnOCH/Fo8I=
X-Gm-Gg: ASbGncuFQtqfDRQBcLd7mzKzFdpHejA/5zWs5/FE1ET6bKFrxDzn/riu8+snPFO7ns/
	wlplY7Z0BnRJW6MEWCVYB4osmHouqwTQ+gljRhON1Ewj2aRfQxz6iBy4RyJ3cJ/BRZP9/2JSzeG
	D68KPJutR5ISVJa45EytKGVX3aGzya925Fx++m/NoVVMscic4pS/cpA0Eyt5Ykevz1hQ9w6ZDkh
	ihwRI/LXiqLGF5ZkXeoiN1RLq1raLhwaFg7B1h2VAT35jBojnYJsGPq+7nWhe4NZjkvtZzyaA/Z
	1OGd7pA=
X-Google-Smtp-Source: AGHT+IHYHO39FYN9fqzxuulSr07JHo1uzefPIt87F1jvA2dDEDL04bAJrSOp1VwnvFvuELyXPcAF8g==
X-Received: by 2002:a5d:5887:0:b0:385:e429:e59e with SMTP id ffacd0b85a97d-38de41c608bmr2481781f8f.52.1739275805525;
        Tue, 11 Feb 2025 04:10:05 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:561:8978:1d41:636a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd4342502sm9152327f8f.26.2025.02.11.04.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:10:05 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Feb 2025 13:09:38 +0100
Subject: [PATCH 04/14] gpiolib: introduce gpio_chip setters that return
 values
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-gpio-set-retval-v1-4-52d3d613d7d3@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3651;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=PqwP4DdGtYYvgPMEjhHMWkD10+jKqk8KGLWSnN3SmPc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnqz4W3+44nQ16vPqyxAePOsKaJyxohjnqd0KpT
 NuNoYQsnFOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6s+FgAKCRARpy6gFHHX
 chgfEACzRCcnf+4m5DpSw182YLXuZErPrxL0A62O8H7l8svfDNzjQJiWI995glAAgJDKRyX9YFZ
 wC67eV1f25gGJbelW8EsQDfnTRQ9xF+MeQ9KuwyiTzFKynPPG+0ADusMK99YZgX3LiWZptryiNY
 J4qmtw4Yw2Q7EGIJoDxW1RvyO0QsV2YU/+YeUuTwfMA0ax/rl/7skgYhnatYv1oUFjmhMFTMDaY
 ohiUWQHczNS6Di8c7JdxqiZpE1FjgKGXgLNYLw1aSuAEQzEn4tErp8+snpfQ4IflYHkjF3PcDa0
 43IzeuTvqAW16p/TV41sMQMLK9EJCdlUYRMIcDWVBD5SYHenZkgQNguX/h+XewNbClO/15nqZgR
 v+JyOxCaXi44Vzpx3g9jU27XtaVNtF/RJG6UC9LM3YsYA9QJiChYhTZ2a93xmLWIg4fN/b8kqaP
 TAKroL0sQgaD7OCISNstYXxUL9OFZtwJ5I7z3lHFNT28Lxyd3iP1+4kXgTYb1dIjlKJPn3S/p7n
 UrDNEsm2Svti0jVMoX/sGpX7n97oFT1Sp2U83iN2MHHRFWisttHXm9n7ow4I9OEWXQZjVw9DPdf
 LXEoQ7ULJtSZS4+2aci/n4zgVqfNLF7E003IooHaW/yZSrReVTfz5Q4++15HttkhesFpI2HofOQ
 Li1fGOyaUEQBWYw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add new variants of the set() and set_multiple() callbacks that have
integer return values allowing to indicate failures to users of the GPIO
consumer API. Until we convert all GPIO providers treewide to using
them, they will live in parallel to the existing ones.

Make sure that providers cannot define both. Prefer the new ones and
only use the old ones as fallback.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c      | 28 ++++++++++++++++++++++++++--
 include/linux/gpio/driver.h | 10 ++++++++++
 2 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 1f078a20ce3d..5f3a8f1b7757 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -926,6 +926,11 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	int base = 0;
 	int ret = 0;
 
+	/* Only allow one set() and one set_multiple(). */
+	if ((gc->set && gc->set_rv) ||
+	    (gc->set_multiple && gc->set_multiple_rv))
+		return -EINVAL;
+
 	/*
 	 * First: allocate and populate the internal stat container, and
 	 * set up the struct device.
@@ -2749,11 +2754,21 @@ int gpiod_direction_input_nonotify(struct gpio_desc *desc)
 
 static int gpiochip_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
+	int ret;
+
 	lockdep_assert_held(&gc->gpiodev->srcu);
 
-	if (WARN_ON(unlikely(!gc->set)))
+	if (WARN_ON(unlikely(!gc->set && !gc->set_rv)))
 		return -EOPNOTSUPP;
 
+	if (gc->set_rv) {
+		ret = gc->set_rv(gc, offset, value);
+		if (ret > 0)
+			ret = -EBADE;
+
+		return ret;
+	}
+
 	gc->set(gc, offset, value);
 	return 0;
 }
@@ -3475,12 +3490,21 @@ static int gpiochip_set_multiple(struct gpio_chip *gc,
 				 unsigned long *mask, unsigned long *bits)
 {
 	unsigned int i;
+	int ret;
 
 	lockdep_assert_held(&gc->gpiodev->srcu);
 
-	if (WARN_ON(unlikely(!gc->set_multiple && !gc->set)))
+	if (WARN_ON(unlikely(!gc->set_multiple && !gc->set_multiple_rv)))
 		return -EOPNOTSUPP;
 
+	if (gc->set_multiple_rv) {
+		ret = gc->set_multiple_rv(gc, mask, bits);
+		if (ret > 0)
+			ret = -EBADE;
+
+		return ret;
+	}
+
 	if (gc->set_multiple) {
 		gc->set_multiple(gc, mask, bits);
 		return 0;
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 2dd7cb9cc270..ac42f0164d5f 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -346,6 +346,10 @@ struct gpio_irq_chip {
  *	stores them in "bits", returns 0 on success or negative error
  * @set: assigns output value for signal "offset"
  * @set_multiple: assigns output values for multiple signals defined by "mask"
+ * @set_rv: assigns output value for signal "offset", returns 0 on success or
+ *          negative error value
+ * @set_multiple_rv: assigns output values for multiple signals defined by
+ *                   "mask", returns 0 on success or negative error value
  * @set_config: optional hook for all kinds of settings. Uses the same
  *	packed config format as generic pinconf.
  * @to_irq: optional hook supporting non-static gpiod_to_irq() mappings;
@@ -441,6 +445,12 @@ struct gpio_chip {
 	void			(*set_multiple)(struct gpio_chip *gc,
 						unsigned long *mask,
 						unsigned long *bits);
+	int			(*set_rv)(struct gpio_chip *gc,
+					  unsigned int offset,
+					  int value);
+	int			(*set_multiple_rv)(struct gpio_chip *gc,
+						   unsigned long *mask,
+						   unsigned long *bits);
 	int			(*set_config)(struct gpio_chip *gc,
 					      unsigned int offset,
 					      unsigned long config);

-- 
2.45.2

