Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5328722D79B
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 07:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749626882; cv=none; b=QvTojwt5kUIkPzG/qEy9KbrgxDEV2vMDq++3usFOpo/RF9XTDAuzK3fgQSW6601MgCrCPrHrGcUcOteEDHrywMnNZxWn+2AX0hDbZbsLqxtOFyxE/216Mx11dUGzODbiVGS1tK0qbZ3cukzsEibqZ55FlMScw9Kra/IkWayyTZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749626882; c=relaxed/simple;
	bh=RS4CyQB+rgcczv2KGEGJBmS0LZsJo7kx7f6neyBFGR8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GCiUHln4lYQWRmHzTb0gEGGMFW3Nk9weD9p6olYGWmW2TGJecG34FCkltfvid3ZXz5yOD7zkXqJTC+0DI3MSsL/IP/pM9bWotWjGYKwrto6LxLCFuFB2ZoHIi+Trv83QCW+9y9KoB9EHXE5LdX+ekyngofpNf3KdYt0klsg3t1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kYjUR9Oi; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kYjUR9Oi"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a5123c1533so3613776f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 00:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749626879; x=1750231679; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4jEAzpdm9dv0stSM/DeKw+5NkfJshNWGxpEezo0eZW0=;
        b=kYjUR9OiDxVzMtnGucpT3TpfV0Dw+o8F+dKBn7Q5plMAogAhV5iii0D3NOGuCj+UFd
         IZvMYgYRQMoucu4B5f5VX9ISSycY4GXkWJ6fHwWyFOY/Mm9Vf+SYB2Vv+vuXbOAAGmAH
         seDvsHwotJg+zp0S+lczl5Qj2WLCF/qlq12607wc6CzY/+XKOxBtUVlK2cXZDhwghhr0
         b886N9iy7StUFhUOaEa6id/tduMJEwcN6av92NrkVU/Vh8hDQfKMjjmkflrozI3Pr2jj
         tSStajEZoKqeSmTDrBpma05vZAQRMuliS0mbHFDggSHKQj567PR/iXVFE70VyFk+S2wW
         E0ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749626879; x=1750231679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4jEAzpdm9dv0stSM/DeKw+5NkfJshNWGxpEezo0eZW0=;
        b=kuJBGJfpQQs382XIOZVKQHG9rO6iUW6AU2s5UiM9Bf6PZgH+hMBrcA41hBeSlj+2AK
         F4wZGzQOAQgDR13L8/4n2NOzZ3wtcl8jKvzLjrG9vfdXyIDUPtUK2HTUX8ke+Xk4Ab1y
         uj+j2Y9+gX1Oyv/gLxarMs1xsqGsjf62SGnjbzWxX+CQJiOQz/PtlIjSBv6MzsIm85VO
         aSbCSE0FW6+DDD0y1MF0Xp/F0juBilphZASCGgHpFHp2nMBDwWxTeB2YbXGp1cW0fNev
         2m6VPj//n8Zoe6Rkv5tD9Sfi+uVjzdSbjevfkYYyO5fMD9db4qCaxlcRBoeBT/s2Q6o/
         bajg==
X-Forwarded-Encrypted: i=1; AJvYcCVztiQHFYJmxRVDifMqRxoi/SgQC/b26vwo+qd9I3TjaEtiPyOJzfWzgeeP34gitD2w2FleLTcDGQbGUyE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOSuCRwzqJWDiDTEL3XDkQDoj0YoKQye8WBASm4NwjeF44Vn7X
	oxlI4ERuOTvnqZHZSlgftCuEJr39EtLK7rDm6kNl0nGijYurhTuwOiErsSyPQRoaXrw=
X-Gm-Gg: ASbGncuTJ0y9mQY0/Uzxw2izRCeOxvRUz+4PS3fT6/5EqnTHl08XAqq/14x0rQpDAri
	kuqnc/PfbsoqXnDkJjL0a6VVBfsKxGQ44crMsxktYc+O/vJYvm8+c9CJ2PwwKh4a/nnq0a9qs1K
	AV7M0c2PSlIfW9Kvbny1Vz/Axcsn0hwdFdQFTmIllUvGs/PEuMLgFjUdg2Ta7SYOtuHtxOC3CfB
	9kHjdM6RkzT24mDWa2AbYp3KGZEUHP05dPg599rWkd9dh+qksX/k+E1Ks+jUK9lOPsC12F4aSJr
	qq9XNFoSsiBCBh6csGAELZtl6R5o2eSuv/j8Tio5MTCOZcMj01Prnpx+
X-Google-Smtp-Source: AGHT+IE0hJOzY7LJtTMTbdjEazmpPBmb/gf43dyCP5jRg9hLuZEXiN8v7yfIQF4Wwppejxa8WDnCdw==
X-Received: by 2002:a5d:5f91:0:b0:3a4:f8fa:9c94 with SMTP id ffacd0b85a97d-3a558aad4efmr1275728f8f.13.1749626879627;
        Wed, 11 Jun 2025 00:27:59 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3994:acce:fbc8:2f34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532463e11sm14572552f8f.90.2025.06.11.00.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 00:27:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 11 Jun 2025 09:27:52 +0200
Subject: [PATCH 1/5] pinctrl: renesas: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-gpiochip-set-rv-pinctrl-renesas-v1-1-ad169a794ef0@linaro.org>
References: <20250611-gpiochip-set-rv-pinctrl-renesas-v1-0-ad169a794ef0@linaro.org>
In-Reply-To: <20250611-gpiochip-set-rv-pinctrl-renesas-v1-0-ad169a794ef0@linaro.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1383;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=EF2NoiLrO5mFY3b4LKo/6fs7QDwtljXgSNhM7dbgzb4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSS/8hfi7DIiO6cnBLKJaBzV0cLclvzDD2zI/C
 1pgZlb8eh+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEkv/AAKCRARpy6gFHHX
 cgN+D/9yKqC26tQL2PDABM3NvnjwOYV04jiZL7pXY60pHNF4z7Q4f38JGIhZ5D6vVxE9Dd/OKl7
 tnEBx/4h0k5qPwLlgOiudnPZm8N8Jaiwf7ceGomrAX6lVjDbR3kj6eYv3OWRHXMz9gUCBE4HFG9
 KFMC/N+cMx/nOX45dGlGewHJ8VljyTjWpkt2/X6XtgeZtIzBFHWYW3Wb7NJtGZRO7I4O8W/fSMR
 PkVphbCdRXuO0daeV/zTooc8kRgxfrRtEou/53hFGnnlZlUEGg9Z+koPw2lIX0xHelSW6mzkABv
 d/Gc0BSLyEnj6RuT2Wnnh5nSiWnLB5rTBLY9AkddadsMKDaVb0fx5FaImn52VkDUoC+XH+7eDNW
 lJHRCFneMyLJn+mJdUXOnJOxvsADC4bNsdtc4MXZL3UBOvvYyXXRGyY1SoLXhyFLYUBALbedIHW
 HM6WNUjs3XJqP8jqzYP9YjUtbRFN/1H0DpBJXuvRq+JoEDvOh9oDe/QqMSRW9V+xIl4UpZavlA8
 vEXem45p9khNG0nE0WmHYIXQ5/AcSGQqRHOORf2HN0QdTLnm1x0fa3KIhx9cTEnROvuEJAtkAE/
 52C2bdklgNhjE3FVcMxtsiIP9jPw4cUF1BCf7vaN1cDrlUuJGo24xbbjQFX+pxpTbvX+sG/cTDh
 Uob1rONI6jG7HKA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/renesas/gpio.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/gpio.c b/drivers/pinctrl/renesas/gpio.c
index a5136dacaaf212ee711262c599f3e273b01b6670..8efbdc1b0078c3bdea3064b31422f8e60698ef49 100644
--- a/drivers/pinctrl/renesas/gpio.c
+++ b/drivers/pinctrl/renesas/gpio.c
@@ -189,9 +189,11 @@ static int gpio_pin_get(struct gpio_chip *gc, unsigned offset)
 	return (gpio_read_data_reg(chip, reg->info) >> pos) & 1;
 }
 
-static void gpio_pin_set(struct gpio_chip *gc, unsigned offset, int value)
+static int gpio_pin_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	gpio_pin_set_value(gpiochip_get_data(gc), offset, value);
+
+	return 0;
 }
 
 static int gpio_pin_to_irq(struct gpio_chip *gc, unsigned offset)
@@ -232,7 +234,7 @@ static int gpio_pin_setup(struct sh_pfc_chip *chip)
 	gc->direction_input = gpio_pin_direction_input;
 	gc->get = gpio_pin_get;
 	gc->direction_output = gpio_pin_direction_output;
-	gc->set = gpio_pin_set;
+	gc->set_rv = gpio_pin_set;
 	gc->to_irq = gpio_pin_to_irq;
 
 	gc->label = pfc->info->name;

-- 
2.48.1

