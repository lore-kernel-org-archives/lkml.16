Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42426D27E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 07:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745392522; cv=none; b=kNHSsimUtQPMay+eF9DzsfIvrNZlUClQy5s97EpaEg3tbgXB3eGRBg9wl90ld+Gw+p+3AGMkTPpUxNprLNi/j44ZeTNiCHRE2VBn5vu7N5q+CE+le0R2lMRqpuM6f3wm2wQzXOM8V3T8o/jDsA+SGIZ0BOhUwq0nauL7wxJfOlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745392522; c=relaxed/simple;
	bh=2cFJXYo0w8FqSMoLTGOzW7U788xqfufg1/ACcV2UDhI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lb+t6K1nFrPPhVRmTQ9vTKb6HugpvHzapEXSYFBgVHamG99xthwk/aa+7f2JOd7e4z4u0S5qMzYi0aCvBqQiSNyL5WuaTbDWsugnmyyp9gJAT68ZGYy5zRNGuwtP8coix/Xi8afOROzBi5FkDXaq3pilGaD5xKP6kJRtCKD4C6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cZX0wPgz; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cZX0wPgz"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso3752010f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 00:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745392518; x=1745997318; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1jpIbuhGqJno2oGiD2+OmhnBmP+B6R6TyA8FsjUZXAA=;
        b=cZX0wPgzyn2GdQ6bS+2KAx9wR76eRw2cJUmq28vK7LArhApUA2/i7BcKdkrFUmyPmL
         K/SsUgM2m60rn1JKy1XIW36en07Lecq2wLwAOg/d82HaUQUuTTUgdyyx+DQK6Ntj+8vq
         aJ9kh/RY1hws9Do78EJIzMlgkrb6KcymRWnCHmbJaJ/tRItth2zVfPxuMe3zSy+CvjlT
         SwXFed4whBxJPj2KsASqyyHpMCvxM9fiGv+YgStZCMBHRuUGUZFpvw8hJ4siWhecPvoa
         +rmq4Ow5l7Ey9g1EYenuOuSP8AzCyNSh02IzgnlhmDEC37Mmbu5qPpmX+sLnVSSK/wZd
         rT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745392518; x=1745997318;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1jpIbuhGqJno2oGiD2+OmhnBmP+B6R6TyA8FsjUZXAA=;
        b=JiACw314hrQr+LPjAaT1K36hSha0/HbMI604WRIgfbX8y3hGGCRRBLsNnUCjTPnWc1
         vU4vYjmjFjZAMXSDen5MoQWVbWJT4z1E7gKrH6rINEQfmTlrfZ/WFi4HzSrGh1SVvAB5
         w4uJSGfjTcHm/sNl3hG4u77IHz5jvkZ+zV3GxBNHGbGa8aMZXDbbT850TdydAxLXXYnO
         GVqlFZyh3+1kvdKpuO2/j+q5k21PwuPiBO8tCseNKMYNiDTboilx8+nWSpCpfH4A7bc6
         Zp54jsFr+1iDlbo+BsGA/Jgdloypsq6N8EQIP+qpkPJloEq+W7gB7SV3qN9NMGddJpHR
         HFtA==
X-Forwarded-Encrypted: i=1; AJvYcCUb/AoH2zGw10wRnI+lQQ+bs7QmF/QlKSutqYgR3GcmcN+hSHc7zuMdSn/7POU62IylvHrBmKbQCrD4Rvw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzP/HoIZcxfFnn5pN/jV9Q16U8NUbQ70mbxFlzxlQ43lnLYKhMH
	yi45riuJKk6KkPbx3u38j/cNIdMpZ3qOB0pjpPdgLHvvFn4QSzoyONX7FlM4ZYg=
X-Gm-Gg: ASbGncv8oQOrimfPkWdr3rzgWNQroufid5TrRfOvncOpi7rmgnN2N6ZxSYW39+72JLK
	MFghrgjDrG+vi1GSZTy9ND4tehXMnslXu3yYS/tu4/CegJ0mcrdUVfzxxdBrE2AvOndNudF+Bq3
	wFYBvJN4J0CtHdoyl1vlWwlxjtu2RovC8OOoqiVBdW5m2PVNlsFm6l6SAUtTPdzDn3Afkcaiduv
	FLk7SVCK4u0kkAyfpNLvBoabHW35zlkFie0WKUSIs6rSygVAERsBnsfOtBVA+keA9hyHvPRt0dX
	vfjQr2MjnUKEDK1rVF4/xDxj9W+Tew2uuQ==
X-Google-Smtp-Source: AGHT+IGnUpS9ou6nffd7s4SVUQaTSNl4pQx4m4r5Zz5uifmJEfnPn7s/u9+lgkiPgaAvunq1Xc6dfA==
X-Received: by 2002:a05:6000:4310:b0:39c:119f:27c4 with SMTP id ffacd0b85a97d-39efba5b778mr13229816f8f.30.1745392518529;
        Wed, 23 Apr 2025 00:15:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493446sm17696935f8f.74.2025.04.23.00.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:15:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 23 Apr 2025 09:15:04 +0200
Subject: [PATCH 02/12] gpio: imx-scu: use lock guards
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-gpiochip-set-rv-gpio-part2-v1-2-b22245cde81a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1992;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=MkOnT4yNUZeyHThpCK5EaJBEstX46Cy8bj/Sje8L+og=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCJOBKq6/ZTVbZPDWRuhYrH8TZUsVagJXdkY5i
 QrnwxvwAYeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAiTgQAKCRARpy6gFHHX
 ckEeD/9l4SbUhQKoQaEIERaYqDCzXTHhqB5KuenMgC5r/g5sYiqxqQjudVfEJavtD4haF+6aS9o
 xBIvX9GLhKUl5ZIikmZsrdlMshgyIY28XvfD/BydQE7ZJUgLGaEW4ZjytZz1E/tb5W1O/0WR0NY
 hshNdM49zRWRWZX1Nj4xFECkTnuriQt6vmLJPjpTRc9vO6lI6hRu44vwjuC1+TrsGWo8E6drr5H
 shZ1C+A2LYp6h2edfZQsuuJb5IDheLLXrvKO4LqnN15DZFRU6Y6wTy/WreZUw6PZm7I0cUftKdc
 0ScZ/KPtiTI0XPv3J5Q/skCvJBb8trn1KYQCEEo4Mr2kmHiKvQbTocvrnd9vHZm6iiCV9DUqHgE
 tZMYBL/xY6sxHdGwez2RZp3AwIv45VDRo9qEEPgDwPAjZSPISB9pOVdqLbIcTQqz4dAWvTiPBb2
 tlYO46y6cpcw+IgSpYcXNJJR69S76gYbbfqTlXnIbrvHyPBN/aFH/dMKoKT5FPIz1PhwVILoE2Y
 6dyGGas9foRrvCR4ndO+4uzKrs8XDjvws3vVumzhIUtsJ0W7NHvpiVOHfg7OW3efAMUSP8oyphB
 byaiS/R0pIxiZ+DHEKog1C2cE0qzDut0dyfGx+V+wagrqQ3BRdYAo1aT06StAe6hSgK/ej4OGdU
 +WVTqdlbOWnq5cw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Simplify the code by using lock guards from cleanup.h with the driver's
mutex.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-imx-scu.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-imx-scu.c b/drivers/gpio/gpio-imx-scu.c
index 403d03f18122..99df95e65820 100644
--- a/drivers/gpio/gpio-imx-scu.c
+++ b/drivers/gpio/gpio-imx-scu.c
@@ -6,8 +6,10 @@
  * to control the PIN resources on SCU domain.
  */
 
+#include <linux/cleanup.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/gpio/driver.h>
 #include <linux/platform_device.h>
 #include <linux/firmware/imx/svc/rm.h>
@@ -37,13 +39,11 @@ static int imx_scu_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	int level;
 	int err;
 
-	mutex_lock(&priv->lock);
-
-	/* to read PIN state via scu api */
-	err = imx_sc_misc_get_control(priv->handle,
-			scu_rsrc_arr[offset], 0, &level);
-	mutex_unlock(&priv->lock);
-
+	scoped_guard(mutex, &priv->lock) {
+		/* to read PIN state via scu api */
+		err = imx_sc_misc_get_control(priv->handle,
+					      scu_rsrc_arr[offset], 0, &level);
+	}
 	if (err) {
 		dev_err(priv->dev, "SCU get failed: %d\n", err);
 		return err;
@@ -57,13 +57,11 @@ static void imx_scu_gpio_set(struct gpio_chip *chip, unsigned int offset, int va
 	struct scu_gpio_priv *priv = gpiochip_get_data(chip);
 	int err;
 
-	mutex_lock(&priv->lock);
-
-	/* to set PIN output level via scu api */
-	err = imx_sc_misc_set_control(priv->handle,
-			scu_rsrc_arr[offset], 0, value);
-	mutex_unlock(&priv->lock);
-
+	scoped_guard(mutex, &priv->lock) {
+		/* to set PIN output level via scu api */
+		err = imx_sc_misc_set_control(priv->handle,
+					      scu_rsrc_arr[offset], 0, value);
+	}
 	if (err)
 		dev_err(priv->dev, "SCU set (%d) failed: %d\n",
 				scu_rsrc_arr[offset], err);

-- 
2.45.2

