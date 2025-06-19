Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EF9277CB3
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 09:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750323783; cv=none; b=Y4OABeh1XD2paqmOm95dweU9T0HNec5cZ+44Xj2aUukaAY6Ogsldp2D3ZmNncjJlTj/kM50j8r1D/D8k7cLbhFW6xyKFuSNgFAmT+1OJqvr5QvakEu7EkWjmpskRZ4tEDguJal6v6hms4EOGSqSw0rg2t1S8cpkJXUKZcvbDHWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750323783; c=relaxed/simple;
	bh=RHhsm7qDV/S77GnvCkhXBQEgEK7PlbbKz4uXoVUAEnY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fqBQ2gIELNbgPpV2jWPBflG3JjzbgdByyJreMWxT6Ai3X/yywe9LZptm/sSIRPzBy33sJdA6biWpVzKxx+IzpnjW7qh9xDoSLmnYu3e3CZzOmy1tmdMVgrSOnBKGFHNTGKZNvlAM2qQwJTtaQaOhgcn1i8zSAfeOxTZy0BTFOD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=D/sljmd5; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="D/sljmd5"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a54700a463so294580f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 02:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750323779; x=1750928579; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/hW/L8M5a/DDRbhy1aA2Xk2zg+bIWaNZ2wLOptUOeRQ=;
        b=D/sljmd5cvn68XlrR04NmgT19TsbuH0Jp1m43pZ5N29XLGB6HZo52BnM4pkomYe1ho
         61DexNKVb9fxkH2tZdbohvn2mUvNPgSvvwvAZ5LJkHF/30DClD/DwH1pRafERRvNhBHX
         T/UJ6CMSC9fUKHbmipvQHNEhC/jREakx+5StqitT9wrrnOHcQBIrYKT5BRVvNJ+yUf+j
         vDCo+CD0dLT+WXNurpTpKut7I8OOls4+zFOrnEQyyHwT+VFVT7pbP1EfjSpu7RpRsljX
         mh1QxZOrutW2LJtHh3zW0jF5QlDeTfTsL7Su2VCuCZ5NgeN1DvItNhnk1Pm+07CcEYRD
         ZRdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750323779; x=1750928579;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/hW/L8M5a/DDRbhy1aA2Xk2zg+bIWaNZ2wLOptUOeRQ=;
        b=tcaUM4IzAtRKcgPm61VP+ytICK2OdZZhafDTERF14NTjVi1Vcodio7zs1laxPvKDxE
         Vr9KaHAGmJ3ABVdnpwjFAgsM2tSabrAeHaE3bmhcqh8/seDSN6+lvH+ewS3hD7Onk/pn
         PQxsEX2TG6cYZqoGiFyEyHZ5WsPPJZrE4NswFKTFQw2nBz31Y7KK6bmM+u347QYPpF0F
         f5LrAOTHO3XJC9RrL9RWrRMc0BYXyaI/9ixjf2U+6VxU/3Eq9jPs9fjQrhNWRuyO+ByK
         bVv/x4ZexlBHEl+Z8UIXY5YCRTDi77AYBwG3xkNfmhNFrO1R29kFWO2ytnH2ql2a00ju
         8rLA==
X-Forwarded-Encrypted: i=1; AJvYcCX8/jwfMDvi7zpuAIm3rbGcqMmhqgJIlWrPiNVppqM5i14xkZzemMjDOA44RfUGLwLb/ldwj53oQkEtf44=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1shiipyBjDasp0KYGG1DiSz9eFWw9c9za573eP7hYybHTBE9+
	688LjJw/LVzSahXYCLwOiRwlltfmngVKekXTdPe/RaZLaTEoxkq118upbatakc0obJEna/b1WI9
	U5kiFY4k=
X-Gm-Gg: ASbGncs5MYRpi3qy3lQRrAA8jbsQ9l8YDVH1H8tlQw+T9LzM9zC6lQWPm/3aJsIMfz1
	UwW0LQOYIjSQf8FjtWJ9+VNlKPkJi36eGx1T1S3NlBWrUY5q2Vp9EXKc6xnVh8QEECz1dh476n+
	Qy6BSemRxHvqUqtN2woppyfTVU6IfLp4ZE2eRkMLu75IVP9ApO75YBt/ndVL15NMSjGli25q7Vp
	zMOy3CfD3DVBfwfymegzHjL4lOnUwGvs+tfjSZbXlTo6o0Lu5bOnhShozkIct0wlzsJGacEkf0P
	FfM9enmQfMKacS/n7ZQPPg0e1k60BO3eYRaSAD5/CNoHUXfVwQ+MKfDNKpFRrW/MQE4=
X-Google-Smtp-Source: AGHT+IEVovGyRuHtUimuo4236mDnH1SercDpE4v+HsXfDaDrjXnnjAwRmZXB1cHF6Q8aIYGsc7zGFA==
X-Received: by 2002:a05:6000:2511:b0:3a4:f7e7:3630 with SMTP id ffacd0b85a97d-3a6c96be03dmr2350646f8f.15.1750323779231;
        Thu, 19 Jun 2025 02:02:59 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c485:fe15:c9ab:c72f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b798d3sm18874645f8f.100.2025.06.19.02.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 02:02:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Jun 2025 11:02:41 +0200
Subject: [PATCH v2 2/2] USB: serial: cp210x: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-gpiochip-set-rv-usb-serial-v2-2-8c43e4a4c810@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2176;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=MuvtdQbJLcxQJZXLZZx6q5p9m1EdL4f/pCEbUZgm6os=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoU9I/I9ng4/h8FujpF9nrsgWA6sjpbQdEtRsKN
 aSB/v8kFyyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFPSPwAKCRARpy6gFHHX
 cl8XEADVeyfIFgSHdaEr/OyMQe8OUZF+dsbM7K0Jd29+NHwseuiXMzhYGaArbJA3wNhOZ3kERnm
 EaQM7JSoZo0ooAlr9QB9Ni8U1NQ0oDv5GRc0gUFeLEmVBQcY+0MWAVGjdSgozNqGQDW5N5Ow8K3
 PtNGDBaINPXNdf95/19TPVcIdjERGPtpGDB0NTDVnbifQi/WErdRqFchllmQ0TEBOl/IItpI/0n
 ixw+8IVK/afN33CSd+qIYYTvjovMkGdrohP3H3jkB4GkHK6bjo1+4gehmZv4OGVATcBK5uopAdT
 tuqj3D0J6R2ShviAHpUlCsuUeuvbL7vY4kb3Dx08P9KWcyyp05yeJqahuFKms/lnHdT/gB1SDlq
 qPTojaHqslGbaE3Mdp2LxqcsX5MJt68vvnvhXOJYNbF83q6DF/sFyVGGMYCOZfn7U7TpSRhQFZx
 SeaJrgOZ/9C3odT87QviC/7ovoS9cCNgvbUhavc1BFNc7pQd+We+rR4JgRYep92dTPBl82WlQUH
 C75vRsqF7hwnrIlOyZWifNmdsWmvKvgQHV/woLp4OfdnYe88Eq9W5x1wmyGO9YIwUY+W15bHMDr
 i03leCvaCoaDJQmtlJBModZPGscI3BijKP2Tth8nela02SIg4uSi3r0r9p/ymbeGfKCviTF9k+F
 liPWlHVDVoCLNwQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/usb/serial/cp210x.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
index 9960ac2b10b719192dfbab0a6e81b2cf80f40d36..cfa1d68c7919b998b645143096696bdea9ee4423 100644
--- a/drivers/usb/serial/cp210x.c
+++ b/drivers/usb/serial/cp210x.c
@@ -1504,7 +1504,7 @@ static int cp210x_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 	return !!(mask & BIT(gpio));
 }
 
-static void cp210x_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
+static int cp210x_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
 {
 	struct usb_serial *serial = gpiochip_get_data(gc);
 	struct cp210x_serial_private *priv = usb_get_serial_data(serial);
@@ -1559,7 +1559,10 @@ static void cp210x_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
 	if (result < 0) {
 		dev_err(&serial->interface->dev, "failed to set GPIO value: %d\n",
 				result);
+		return result;
 	}
+
+	return 0;
 }
 
 static int cp210x_gpio_direction_get(struct gpio_chip *gc, unsigned int gpio)
@@ -1599,9 +1602,8 @@ static int cp210x_gpio_direction_output(struct gpio_chip *gc, unsigned int gpio,
 	struct cp210x_serial_private *priv = usb_get_serial_data(serial);
 
 	priv->gpio_input &= ~BIT(gpio);
-	cp210x_gpio_set(gc, gpio, value);
 
-	return 0;
+	return cp210x_gpio_set(gc, gpio, value);
 }
 
 static int cp210x_gpio_set_config(struct gpio_chip *gc, unsigned int gpio,
@@ -1960,7 +1962,7 @@ static int cp210x_gpio_init(struct usb_serial *serial)
 	priv->gc.direction_input = cp210x_gpio_direction_input;
 	priv->gc.direction_output = cp210x_gpio_direction_output;
 	priv->gc.get = cp210x_gpio_get;
-	priv->gc.set = cp210x_gpio_set;
+	priv->gc.set_rv = cp210x_gpio_set;
 	priv->gc.set_config = cp210x_gpio_set_config;
 	priv->gc.init_valid_mask = cp210x_gpio_init_valid_mask;
 	priv->gc.owner = THIS_MODULE;

-- 
2.48.1

