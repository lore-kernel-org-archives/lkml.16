Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65734229B02
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 09:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750323782; cv=none; b=tUTRY3yt6Se9UGAe7QnocOhtCO9aCXZRu5TkU8CqM20jEbAVqTrm6CZKI9fWVk6x6URn7GEBGaXu2c436OfyirNuYYyVP7665CJQHceheMyRZMPK83sOgtXmlZHWkq+PQgLBZW3hKJJC6L9IfcJGSeaZIIYs+a557wPRbhQ1ibE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750323782; c=relaxed/simple;
	bh=JKlrooLoXVp4otsnMroGFsVNqHxJcoPceosfJ7R7mWc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R+7IbbV3dAeL0BQJ6+ypYx95ka37t4xskCfadb443BDQEa03Twj+Sl17/25SfusqNvYbdX5d306d2jqzzvtogJrJOoKARe4F6YDyORSp0EIF7/ux+mDd4txPihxMbJByC0xG25w3up8PK/nkCuLCqUnTqB5jNPTSJNKvmARFhTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=D5WTvK2a; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="D5WTvK2a"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a57c8e247cso532142f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 02:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750323778; x=1750928578; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eygfCzasIRR3NPibew8zyzczajRJM9GmBBR2GnMe634=;
        b=D5WTvK2aoRL/CioRJM5A7X4XmDcbSltvV+GOzLG7T7SoC+/59T+Z/9OY/540wl1TVR
         cFVA1G3FiPit03wUm00cvTYuTqndTFBN5g2fJF6pmdLsebUPVrm1gDaD2BnwUfQiownY
         +wmCxD/1lTMlN0BXPfpIQ5iLFz1vQzM9K5XaSsotJqcuFue67asg4d7VryGGOJbwfLXp
         UFoBlPNpM3r97rnDL/9aijuM2u96VEGRnZlmlQS43t0dQXE/0lyE4bDPmFcjsaOpxHNu
         kJYdDTPcMiQIKdBi0JlarTnh6lTjd6xPjO3G+kGnwdZDa2nmjaAy/IHoxX4r0Jxp/E1V
         l5hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750323778; x=1750928578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eygfCzasIRR3NPibew8zyzczajRJM9GmBBR2GnMe634=;
        b=m3x9Nae9sfQ9aFO6SwaulANEoU5abCYmlFdxznAqQLDXf/LEibFtbfMB+JLzXunVX4
         gKWCHk2XwF50KXU0iePs1CUoUix68z0G82dO6ed4Y0hcyRlh/5oYzfhAYisXe7pCGdrQ
         NQtNIMsnc3AYNxjC7zCln0GSpuaBDRP0Cac/6WASreWKfUJLi28QRvh9unJFLuXVnErO
         eNw6h0hKewslIYSvMR5sLgWUa0VC9yhSkgTJW6A02NYVgWNBfmPwQNC9oKczuB8faKI/
         snJUhy9CflUXOOieJz5Hf+6S4fmIQjPqiP92sjZ82FhJFle+RObJzNCjpol/aNFLJTFZ
         iZlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaseFLBM3hc4Gy/2ynJN+aq2FSAV0x8ucgVjofTZ/lSdA4R+1ULQ5tKmbFJs04i/WiQex6kGj5uS0jE+U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTUPHlOu0HWwRq48MKLakmeReJ++HptjC/G8JTIk+c7MlIgPRt
	tQZtPoZCBe6IVqpS7mC2QXbdydwJIdjFbxEqyPGJSAm4ZlL2yIcl+qSob91t0EnTIud11UdlrEi
	k+5UNYlk=
X-Gm-Gg: ASbGncvbZka92UrMzitk9uNXyHIjzINSmZHj3TfqwQ8V74XVWBxmU4Ak9Rnt+CxdGZF
	tktviAU7r3d3n6JqF8WrVg2jujDri9TkS4UGRK4Nx8zCvPuMhNgUnq6vSpbWLXc8IelEPNDeg9F
	GE7TuRVastrGIzNre2B90Ofip67LrEJGlD94xmDcVP5XvN6FXEwMAtZBo+Qai8EnA/Vv3uPRFWI
	YAwGiJCCzOQUTnjMdjifL9u8KAGYxDT5fxYl+kAGx6ksdjFxZtt/ofHOxUekn8PXyIpvrbceXE7
	z3lRMOIXD37Xpf7jWrjHrdB3eW/EeBkhKxzVTW1MSxAF1+nw+o4nIZFb
X-Google-Smtp-Source: AGHT+IHgy2G2c3OxJ8FYLKCk97XZ7orGJmfRGmZT4nxLuRvh8+N3r4btSfSz1pDnlP00KPLOWONdFg==
X-Received: by 2002:a05:6000:2889:b0:3a4:ec23:dba5 with SMTP id ffacd0b85a97d-3a57238b90cmr17548726f8f.5.1750323777681;
        Thu, 19 Jun 2025 02:02:57 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c485:fe15:c9ab:c72f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b798d3sm18874645f8f.100.2025.06.19.02.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 02:02:57 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Jun 2025 11:02:40 +0200
Subject: [PATCH v2 1/2] USB: serial: ftdi_sio: use new GPIO line value
 setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-gpiochip-set-rv-usb-serial-v2-1-8c43e4a4c810@linaro.org>
References: <20250619-gpiochip-set-rv-usb-serial-v2-0-8c43e4a4c810@linaro.org>
In-Reply-To: <20250619-gpiochip-set-rv-usb-serial-v2-0-8c43e4a4c810@linaro.org>
To: Johan Hovold <johan@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2752;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=8QYiaDcuByp6lX/VMJqGh5FavZ76N3lPhAN3orOxS4s=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoU9I/hrVhFLLFLkxbHZeCTZTTVqdFQCWp4jxMz
 5sxRalYDxqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFPSPwAKCRARpy6gFHHX
 cvZiD/9H/3Ifk3c/WhWIL4GwR+/l8+vp+hlvLkyjnCSVWs+EIvKF+sj7kmXowZUQ4jstuJ0OfAv
 RRFyIZAsHtwdQJs8LKmfXkmRl5L0l8fZ47Ql50mrEm16pkDBmLJqrUptcyNYGzyQgcdKks40CpU
 Y+QVG3tymEK66Z1T1CnAPyWAvN9xslGLp9zqY8AWHXXTLBY/iNIaKUhbNX6D8xyIitgIQTbRYlG
 s6K0vtbIjc0R0bFpqL4tOu6zm6alqXKtr3DBxV5ZWT/jRwx9t3W+4bNBwySyfjmPmqsOEF0Iv35
 ZwaY8RFahOUEhP3HsePlKI019JfAKjr6dDvu/9p8bK6OMjP6WWtI79kvYuzO7mDLdEn1o30LuLz
 10IZfzvek6nCE/fCBtrTJ2MoqUknWmKtIimmxkYUoX9AXXnUH2wwHjclRjtmHhX9csQoz/J1bLY
 NVOVN5qNWrUyn7R2FIGPFsvexFZntvlyWFmkkB4k/mPYY9ToOU3vNXpJ8F4YW1P9x2L0ik/rkNE
 MRUrUU0/ItO6HW8SDPrB7Y7pndfEPyAGzk3TnsG+asaOkQL+7u9V0Zxn09ivaPv/JukyilHqylu
 li/ldqtut4RyLXCgshsDOVjGLIkT3VLRTS3CZNFRGev0ouJbup+sCojKL42mUhX1BitDYv90poo
 QIJYp4ngSTaYoRw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/usb/serial/ftdi_sio.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index 6ac7a0a5cf074e0629dfdd3b2330bfa05ca31663..d0a190c6dff38f64e393c11d1bc7759e52876d4e 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -1857,10 +1857,11 @@ static int ftdi_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 	return !!(result & BIT(gpio));
 }
 
-static void ftdi_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
+static int ftdi_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
 {
 	struct usb_serial_port *port = gpiochip_get_data(gc);
 	struct ftdi_private *priv = usb_get_serial_port_data(port);
+	int result;
 
 	mutex_lock(&priv->gpio_lock);
 
@@ -1869,9 +1870,11 @@ static void ftdi_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
 	else
 		priv->gpio_value &= ~BIT(gpio);
 
-	ftdi_set_cbus_pins(port);
+	result = ftdi_set_cbus_pins(port);
 
 	mutex_unlock(&priv->gpio_lock);
+
+	return result;
 }
 
 static int ftdi_gpio_get_multiple(struct gpio_chip *gc, unsigned long *mask,
@@ -1889,19 +1892,22 @@ static int ftdi_gpio_get_multiple(struct gpio_chip *gc, unsigned long *mask,
 	return 0;
 }
 
-static void ftdi_gpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
+static int ftdi_gpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 					unsigned long *bits)
 {
 	struct usb_serial_port *port = gpiochip_get_data(gc);
 	struct ftdi_private *priv = usb_get_serial_port_data(port);
+	int result;
 
 	mutex_lock(&priv->gpio_lock);
 
 	priv->gpio_value &= ~(*mask);
 	priv->gpio_value |= *bits & *mask;
-	ftdi_set_cbus_pins(port);
+	result = ftdi_set_cbus_pins(port);
 
 	mutex_unlock(&priv->gpio_lock);
+
+	return result;
 }
 
 static int ftdi_gpio_direction_get(struct gpio_chip *gc, unsigned int gpio)
@@ -2142,9 +2148,9 @@ static int ftdi_gpio_init(struct usb_serial_port *port)
 	priv->gc.direction_output = ftdi_gpio_direction_output;
 	priv->gc.init_valid_mask = ftdi_gpio_init_valid_mask;
 	priv->gc.get = ftdi_gpio_get;
-	priv->gc.set = ftdi_gpio_set;
+	priv->gc.set_rv = ftdi_gpio_set;
 	priv->gc.get_multiple = ftdi_gpio_get_multiple;
-	priv->gc.set_multiple = ftdi_gpio_set_multiple;
+	priv->gc.set_multiple_rv = ftdi_gpio_set_multiple;
 	priv->gc.owner = THIS_MODULE;
 	priv->gc.parent = &serial->interface->dev;
 	priv->gc.base = -1;

-- 
2.48.1

