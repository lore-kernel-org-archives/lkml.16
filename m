Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4FC21D3D1
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010184; cv=none; b=gdlShDukTeqOQccPHfmiLLKU+VWI8ej9eEPPonhf87CnxhgaDErWA+isqYA4rD4s+N96DGdb1p/gAb4ggAaFsclCdDub+lkAHtvIyXbE99+1cNG5EP+MeBCit3k7opQbxe5rxt2t0jo/TzQG5Zjis7fN2k1ip254ppXTyzkX5yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010184; c=relaxed/simple;
	bh=+lVN69TWmBJGkcCx4RTC68T2V1dx9edleF2Xorkmk58=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tnyVdFilJ97qZ2PTkfhk5ykZOjO26Ti28UExUed9dU1YTKn9hpyxeMUy89XA1Lsc53LIkRd+8u4LIOadmZ5+EWP+qDYjeEPv1dluwvFlUSS1rKfeLUF6G8J8PG0PJ4dVW1hH/iPa+1UvnRbiEAlXPkmzTkKc+SeZlcZODQWO894=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ZVBPpOKU; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ZVBPpOKU"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so39780745e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 00:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010180; x=1744614980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GzYz0IrNb1aiDrsSJo07WBOcsPBauEosyVEV2lACwJU=;
        b=ZVBPpOKUwPdzc4MAAf3QhRUVFiMWxaB0/J0WfxlJ1909UJsRm57kr2buVus+B9rRXE
         +FOPMsko1J2V0FJv9w/7GjbArzfQvyjdonqT22iMXLxVzvfn3IddfV5iFyzTjuj5V1q0
         upXBo0GG42yqYfeSd4LESsxjYTE/hbTHykq6MI6EvXaJ6tf10W7SHxrMlgZ37rbAV1o/
         gQFGawWxBnXwE0A0cgT2IXuto+GQ1CK5sEpPz/b9AH2d+grn96xHb0pnpRPkFoxiwSnm
         QPmgh5UK8GhLhcbNk8CSEyeWMjv4auKtCDknkxZAL9u2+pLuU8oSt0UKnj8HOG878Onb
         +/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010180; x=1744614980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GzYz0IrNb1aiDrsSJo07WBOcsPBauEosyVEV2lACwJU=;
        b=QiSnGRcxPBh8XNDJacrUYMe6ZORsyltSE+/kXaW48iMCgSZ2H0FWHCDhR7LcR7DkdE
         pkXutv+pUxtN9BfIYyziiB+JJAXeNhqgR8xuOtrwA9HU+eMLg85OrkuAAyOZfFqPIZFl
         RzXNJ3mRwPaD1ZgoW0HUNKdMbwTRiyRR/McLpULnU3ojv5MBJo3jLWEsMqYyPWVCn/yw
         ieZV/eQK0x+fQbiJSCp/RhpioJzsPF8VpggkyTeU8fp1H0DB/G7r/xtQvuNo3+1yL26R
         eaLS1WUTBYQjT0zcIP66wOZJvKUmn6lbSN7UBxXzfdTSh7V1al+IWFCpKpIsBHCPNPEH
         1vcw==
X-Forwarded-Encrypted: i=1; AJvYcCWuQC0cLGoapoaXYNfmb5c31PQo8JGxzphZAFyhdVEvzFtbDuu+JqPdmn2buzh8YWzVNvZM5QFiIsnVqfc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/1oQlXVxtJCC2EpST1AcCZMyDBPebk5EbRTLXao+85bzGCAeX
	VVPI7MSD9QTxiKzg53S1eXx7DD+0MnJ4hzEb6jrnT3IQ3dgAiyUGgFJiyO8+Rnk=
X-Gm-Gg: ASbGncvEvgruCj8NUcicxYnU3jt3xdIhqPdGHJY0y3f5lgNxMJ+47kem0Xv7tah6EMr
	G2gWSsrC+pWLIsl9l7684jbiyRFV285SUbOP45YP04DYSDAdM9gIMnn5uvNsQrzFmOg/FaGQRs2
	Q93QvjcR/Aq6NEWPsk4SZSRYhZ+d8THcjk3/GMrA3LRQCp+n/of0+tPnaYYUuVHCXqO0xbnj0un
	5OK7lLmdz4Zqop1ET4ltS7Wu3sJdWw+coOyHRNaZh8dcFT6L0nyT7cj392Un3eZfl1kv43vq0o1
	GIf5iBVuiL/0Kp54ExjdnUKb6/88Y/BKusvRTg==
X-Google-Smtp-Source: AGHT+IE8TYDZRnZ10si9IEbVCRrw3jYRuGhAUnbXwYdDSJ2w1xK6P2L+5C7YzmeuYk3QEjBUh3buGw==
X-Received: by 2002:a05:600c:45cc:b0:43d:fa59:be39 with SMTP id 5b1f17b1804b1-43ecfa19d6bmr74584255e9.33.1744010180653;
        Mon, 07 Apr 2025 00:16:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364ec90sm120728725e9.27.2025.04.07.00.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:16:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:16:17 +0200
Subject: [PATCH 2/2] hwmon: (pmbus/ucd9000) Use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-hwmon-v1-2-1fa38f34dc07@linaro.org>
References: <20250407-gpiochip-set-rv-hwmon-v1-0-1fa38f34dc07@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-hwmon-v1-0-1fa38f34dc07@linaro.org>
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2406;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=lT9LPgVcdHog5NKMsZeYq1JZn6VFGMZndrir3r18U4Y=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83vCqvelR6492PjchFZZRoSHlU+ZhyIQkbCAi
 C73EkHOFW6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N7wgAKCRARpy6gFHHX
 cng3EADUg97oz9I2TXygVlGc1U9x9LK/8rlGl/jqTG6LheeWfX7J3EEzlWFXZfpPqbkFkmfV8wU
 DbVpr7KLtP7c5csddJS9nXfNEsVgUQyyGXda1Ebl9mwp52cW30ksqbggYSGDdGEB0HGqUmfxYk3
 m823XzZgo6I0cGW4Nu0mXGQYa7zYEzqBwUxUnlwD5AuertOLIvY9QX/tyEqgZFBaDYH7pS1NCFv
 QScrGVh9EfQVw1UQja2OAV4mNaS2T+Imv5tJHhVfnQMjME5Fry6rLPluck1n5HTSYQwzbxq1gvZ
 1bucSP8YkAA80DsXfuO3sLdbyuoNfrT1AGF+ctPMNpOatseRBEv53H9yV+HMDIq5Bx33LRTarPq
 WmQxc2i7IUTZF3b2S0TJxXwR91G11XLC/gBcUOD/48oTnvxQ6K/lc+Bcuj5k69ZxD24rGK390bz
 y3xtMwrdnf2IcXj8sU61NuCyqYaprm+LS1fI9l1Tk71h2n3eaLxjOaNb8iMdrVF98xSzMAIgoRN
 REEmYF4Ja5Ul78RibwlXRKJCk6OM0HfgeGiWd3vpnw2doQOrHLkpgIQmduQf8NiNw6Drdk8m2Ys
 g8lWedA8sSZgR1RxfrQdwXiTVvmxIviO4hGS2zNa3eh3GYgDiy1zPpXSAWpwN/HOC5jIc7YJKA7
 brtDUlwn9DxuD5Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/hwmon/pmbus/ucd9000.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
index 9b0eadc81a2e..2bc8cccb01fd 100644
--- a/drivers/hwmon/pmbus/ucd9000.c
+++ b/drivers/hwmon/pmbus/ucd9000.c
@@ -212,8 +212,8 @@ static int ucd9000_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	return !!(ret & UCD9000_GPIO_CONFIG_STATUS);
 }
 
-static void ucd9000_gpio_set(struct gpio_chip *gc, unsigned int offset,
-			     int value)
+static int ucd9000_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			    int value)
 {
 	struct i2c_client *client = gpiochip_get_data(gc);
 	int ret;
@@ -222,17 +222,17 @@ static void ucd9000_gpio_set(struct gpio_chip *gc, unsigned int offset,
 	if (ret < 0) {
 		dev_dbg(&client->dev, "failed to read GPIO %d config: %d\n",
 			offset, ret);
-		return;
+		return ret;
 	}
 
 	if (value) {
 		if (ret & UCD9000_GPIO_CONFIG_STATUS)
-			return;
+			return 0;
 
 		ret |= UCD9000_GPIO_CONFIG_STATUS;
 	} else {
 		if (!(ret & UCD9000_GPIO_CONFIG_STATUS))
-			return;
+			return 0;
 
 		ret &= ~UCD9000_GPIO_CONFIG_STATUS;
 	}
@@ -244,7 +244,7 @@ static void ucd9000_gpio_set(struct gpio_chip *gc, unsigned int offset,
 	if (ret < 0) {
 		dev_dbg(&client->dev, "Failed to write GPIO %d config: %d\n",
 			offset, ret);
-		return;
+		return ret;
 	}
 
 	ret &= ~UCD9000_GPIO_CONFIG_ENABLE;
@@ -253,6 +253,8 @@ static void ucd9000_gpio_set(struct gpio_chip *gc, unsigned int offset,
 	if (ret < 0)
 		dev_dbg(&client->dev, "Failed to write GPIO %d config: %d\n",
 			offset, ret);
+
+	return ret;
 }
 
 static int ucd9000_gpio_get_direction(struct gpio_chip *gc,
@@ -362,7 +364,7 @@ static void ucd9000_probe_gpio(struct i2c_client *client,
 	data->gpio.direction_input = ucd9000_gpio_direction_input;
 	data->gpio.direction_output = ucd9000_gpio_direction_output;
 	data->gpio.get = ucd9000_gpio_get;
-	data->gpio.set = ucd9000_gpio_set;
+	data->gpio.set_rv = ucd9000_gpio_set;
 	data->gpio.can_sleep = true;
 	data->gpio.base = -1;
 	data->gpio.parent = &client->dev;

-- 
2.45.2

