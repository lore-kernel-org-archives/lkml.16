Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E87A2E8880
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 13:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750251741; cv=none; b=AkQ54dviHXJ7v+E8Dy8+L4hoQJPL8RVsqKNEN16WcXtvZEJDRoVZo8pp9odTbzTByQh8e12Agz17NjgJGfDU5H+S8W4DKuAoLJWDmkRAG2xIwVVnZfsU9XmoV0XaIybj2n9ARsqts2bGa5n+8RirMXL0mDn935tyt+1tbUF6i68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750251741; c=relaxed/simple;
	bh=GSMsqi9mIqLCsQJ4FsQ/aBe6k2Ec3MNCIfPAzIYK7ks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jAaFl1p2Ld4Jg+93aVcOkpalAiekXLirJYZs1p8DGSKLmzqJvNqCl0QLZQ21+D0FlRdutgXQiidRyhQZgNawZvOKZvO3Wtdqdv8KmRVtjLEhOJ5bMg72eHzVajio776f9MFAZ32ptQe9iCdyPU1GZWDZ//Y9iukw2x2gLOalMsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jRWhYb71; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jRWhYb71"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a4fb9c2436so3988068f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 06:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750251735; x=1750856535; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AH0Steq2qqIiSJsDn+92JXuGk7wz9S22mj+i5N9AA4k=;
        b=jRWhYb71K4GCutpelBJ5Ohp40xFGhixcuo/dRl1mbkX2QuykR41jZdmJdthx0jJa24
         i7KvEl05iw0XvkI0x8qrM//1Ubt6ciWNMPXd3jNcfN167KqPGJRjXxS/K3vhF2eEradL
         DL+5Nfpn4HOPi6/ug1xA5amvAOS+Tz/242BLRK6LLSlYnOxLqK7GF3YoXO7hXAzyXqWZ
         sPSVKP59i+TsLtYSifg5ySoJpKSmGIs/XxhFBtgO6qLCmXWw1CEhA/OsG7WCGwxMt7uG
         Tcq1Wn+1aQZRIbvTQC4aH1HLVRAm+FzXO0dm0RKzlVRNEHizhCog9u4GWvDz35s1oPFk
         5ykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750251735; x=1750856535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AH0Steq2qqIiSJsDn+92JXuGk7wz9S22mj+i5N9AA4k=;
        b=IggKb140gfs7PRYFRVzu3vwM320EUw1ixt8mnCbpJ/EJDNtTg4EhtTnHJnto+vyGOB
         Mgjzf5FyvbV64ZENAw4EMKTU/9dupB5zd/jrLG9AwTdJ6iK3cQr87hn79bTSS+9DD3/t
         0B/pBnGuxsQ2GJL8BiELbK14B6zJ0Yye4gZE8rQclbjIhuMnPxVgMuaK4KhympLdHMmj
         u8/PZ+ZX48oCrNIls1XK/Ccl91UNPGfSbwa82coLuoa6n4ib2dtUogElZcRgjBOyodxI
         ZN26c9et2DixYNVu4Q4rXatKiYbeC3wYR2G0pFxeUqU5JNLuf34BzNzYgWSvv2EYMUjp
         uSCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUz4xPs6FD3cn+nWwJKBcYmA4U0qAESZU+9Ek87CtO3Ju4Hf9o1gFxl8Wj591URiNzzmINoMZaUU5oltjg=@vger.kernel.org
X-Gm-Message-State: AOJu0YztXNg7469gauW8qkXbm3wIPX3F1l9qDxJergNxKsxwp9SdmwEY
	bQpexHEuQHcGcKaKKYkkYw1h73dLlscA8zUvbDqCKEadZYVt71jV6dvqPRwj3J6z/Cw=
X-Gm-Gg: ASbGncssuWNgCPecpoHXpeX+rXcZ0//ARMSVw5I725Lk6S+I1KCl/koOT+320YppyCB
	N7xh52s7DK2Py62AJWlENlPXNXc7C+DCo81kBjYoANXgVXrrBYOPK17qZLbvK2wDGb4KFnWnzKs
	+2+dtGAtNkh0A83Xiqqdc+yQyUq+rJqNKOsgjDLh8B911rv+zx0YrlOaIxY6C+kvXfLKMc1KMsG
	f6sRKs8L8nRsd/rCFGedEo9L93CbD0LXMwiI/gubtWfX5w6w1CSv/9DeGSfvD0AGoeIAISs4YBj
	U89Yry06yv5EtB1FSNq5vtH7t3cwKZKl8Lz1BygUlYD20tHeuapJuJk=
X-Google-Smtp-Source: AGHT+IEhGYD8rPoQTR0NvIwKKBaqZP1caPoUwsbeD3e3vlQF0mkMGzzBTiVfbGBa/VJ+41wnK7MJUg==
X-Received: by 2002:adf:9c83:0:b0:3a5:7944:c9b with SMTP id ffacd0b85a97d-3a579440d3cmr11204956f8f.16.1750251733814;
        Wed, 18 Jun 2025 06:02:13 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ad8:9ec2:efc8:7797])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b08c99sm17043595f8f.63.2025.06.18.06.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 06:02:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 15:02:07 +0200
Subject: [PATCH 2/2] gpio: mmio: don't use legacy GPIO chip setters
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-gpio-mmio-fix-setter-v1-2-2578ffb77019@linaro.org>
References: <20250618-gpio-mmio-fix-setter-v1-0-2578ffb77019@linaro.org>
In-Reply-To: <20250618-gpio-mmio-fix-setter-v1-0-2578ffb77019@linaro.org>
To: Klara Modin <klarasmodin@gmail.com>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2884;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=TIwebD7wWsPr3/j9GB3hInJeu/m3jlEpiVULpw4XriU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoUrjS9dqDSVf56sYvtxzf3Ws9zK0fSUjUmTabo
 KhnPcnNcHKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFK40gAKCRARpy6gFHHX
 ch/ED/wNMcjqlojE5KBbR+JsUmiuDzwcVj6yuSnCRbCpxWsSXAMMlFMhO9zKtuf8vg0dymZ01Sq
 MC25JKpSkIzRvrNgYQLkqboSYhL9VJt09I3LleYYmPUarepFnaXytWA4Y65xSGFi1wOocDhjuwg
 MbryYqSN2rbASkUemBSu7xlw5Q14zu5aVDy5B14G5E2zlpQBmK7N38bTbmOYzOUmw1uT3iIJ8gE
 7ZgC8CQCCb3Wv1FFO7XQ8dbTQYRx8nYTmYIicwG03jOSuFMcbA3ut6cr6v7DbwaqczJmrdFiM9W
 e2pk1QPvT8AUQtpjhl5n7PJOCjvHfdR4RWPNSD8CP4ZktU5DWh0tlKuKOT3h4CK6Uaf2l6hpZAG
 o4AIl6BrOI9tlfq25/STr4+iwYZI8TXyaerb0jVBI/jca8jFcy6w82u6n9lUMwOv20Vbc0wWkfD
 tOA5thyYPx8dUWPiKNvYZ+MDx+bj6KR32pv/N+H+EB9b+FePtPGLV0wWG4t4WOZzJLoWTiJo8PJ
 6c4RMPk4zz4hDiAMYLjm0x11/on5zwI6Nk0yvxvrnA6QpBqV0jcfCEyoHmHwA9092qWAAmu81WE
 cguN5YUlVGfb2/iqqzVQw/7XDN7I7APpPpurpadJrcWtFB6Fo3f7AUfrl2WMh1Dh5q4DVBVy/BV
 PVnTLVUOLeIsk5g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We've converted this driver to using the new GPIO line value setters but
missed the instances where the legacy callback is accessed directly using
the function pointer. This will lead to a NULL-pointer dereference as
this pointer is no longer populated. The issue needs fixing locally as
well as in the already converted previously users of gpio-mmio.

Fixes: b908d35d0003 ("gpio: mmio: use new GPIO line value setter callbacks")
Reported-by: Klara Modin <klarasmodin@gmail.com>
Closes: https://lore.kernel.org/all/2rw2sncevdiyirpdovotztlg77apcq2btzytuv5jnm55aqhlne@swtts3hl53tw/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-74xx-mmio.c | 2 +-
 drivers/gpio/gpio-en7523.c    | 2 +-
 drivers/gpio/gpio-mmio.c      | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-74xx-mmio.c b/drivers/gpio/gpio-74xx-mmio.c
index c7ac5a9ffb1fd1cc9439e3320d54574bf0cebbf6..3ba21add3a1c669171578ceaf9cc1728c060d401 100644
--- a/drivers/gpio/gpio-74xx-mmio.c
+++ b/drivers/gpio/gpio-74xx-mmio.c
@@ -100,7 +100,7 @@ static int mmio_74xx_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 	struct mmio_74xx_gpio_priv *priv = gpiochip_get_data(gc);
 
 	if (priv->flags & MMIO_74XX_DIR_OUT) {
-		gc->set(gc, gpio, val);
+		gc->set_rv(gc, gpio, val);
 		return 0;
 	}
 
diff --git a/drivers/gpio/gpio-en7523.c b/drivers/gpio/gpio-en7523.c
index 69834db2c1cf26be379c0deca38dda889202f706..c08069d0d1045e9df4a76cad4600bf25d4e3a7c5 100644
--- a/drivers/gpio/gpio-en7523.c
+++ b/drivers/gpio/gpio-en7523.c
@@ -50,7 +50,7 @@ static int airoha_dir_set(struct gpio_chip *gc, unsigned int gpio,
 	iowrite32(dir, ctrl->dir[gpio / 16]);
 
 	if (out)
-		gc->set(gc, gpio, val);
+		gc->set_rv(gc, gpio, val);
 
 	iowrite32(output, ctrl->output);
 
diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 9169eccadb238efe944d494054b1e009f16eee7f..57622f45d33e0695f97c7e0fa40e64f9fd5df1e0 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -362,7 +362,7 @@ static int bgpio_dir_out_err(struct gpio_chip *gc, unsigned int gpio,
 static int bgpio_simple_dir_out(struct gpio_chip *gc, unsigned int gpio,
 				int val)
 {
-	gc->set(gc, gpio, val);
+	gc->set_rv(gc, gpio, val);
 
 	return bgpio_dir_return(gc, gpio, true);
 }
@@ -427,14 +427,14 @@ static int bgpio_dir_out_dir_first(struct gpio_chip *gc, unsigned int gpio,
 				   int val)
 {
 	bgpio_dir_out(gc, gpio, val);
-	gc->set(gc, gpio, val);
+	gc->set_rv(gc, gpio, val);
 	return bgpio_dir_return(gc, gpio, true);
 }
 
 static int bgpio_dir_out_val_first(struct gpio_chip *gc, unsigned int gpio,
 				   int val)
 {
-	gc->set(gc, gpio, val);
+	gc->set_rv(gc, gpio, val);
 	bgpio_dir_out(gc, gpio, val);
 	return bgpio_dir_return(gc, gpio, true);
 }

-- 
2.48.1

