Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A546129CB46
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749559434; cv=none; b=o6CWwk9mEm8ohveEETzMZ/t2IomkRxpLmL7eLSh7POgP9pDRdigKGYVwRJblyo+ok8FoIkY5mstMHatqrAIPNnxpi5L2pK6zFNCXQCxz4Sej1UHNqCruf+ytPbdBqzFAxpukwLcOsQL8gRLMlLc3IgKFBBqSj7H+N3zKADKBCkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749559434; c=relaxed/simple;
	bh=r4RwG6BMFebJJQQm/nElPujWnwGjcoRuHG9eSq+72y8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gssE+We2km21Tip7BxSrKYZITNSDmb6wFS6ZeCe8Mgr7lrHE9tjWQ9fHZdxsLWuoUyWmgw78XzrweV/EQo6TJg3CxMW0A+XxlmefnCin4L3E1YWaD9FSUFmR7FKAq4XnEDbN8p0xPtZoUqzZlUGlY7IhMxWedji+r4KHtYnNGBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=oXBj8nsG; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="oXBj8nsG"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-441d437cfaaso34137305e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 05:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749559430; x=1750164230; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xLUtgRRBMOnouMm1iY8Dj6SXphTk6G+W8VyW6WqMYqM=;
        b=oXBj8nsGHrJOjs996Eae0tfnTkud4DekyDKTeDTcjFrJonKbo1soH3fQhbonwvz7jR
         EPjGFvz5YIO/G9xqW07NAUwEcQn15smXaKIizSqX9xAUQJx13ckrccXykFnkMM/90Ndm
         tAlEdE8KLQ6sJWa9W6uLojiz8cf1F5BbQaFidHiIqCNtAyfUN1fkv8FVv3kBWrkBVoyx
         FZdn+beOSmMvKinr66u8f9DwHOm+C7caKFLXv4nqI/fpj3YHMpyBu77DKPJbdWZkuCYm
         Dua+3F2NsWWJGQo++qqf44mxgZorXiw8RfS1X8fbIF9QRMXtt6SSP0/qOpnSAmAuz4gt
         kdHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749559430; x=1750164230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xLUtgRRBMOnouMm1iY8Dj6SXphTk6G+W8VyW6WqMYqM=;
        b=DMW6pYd/KzQa9ggm4ynElrI82ozJoFIpffngcjHKEVy5nAGkedeVfTZvXl8Y6yGRV8
         KdizlqwBApaCxUN2w2yw9Jfi1+ChFw8r8XJ9/aw1PVcLye7es4De9ENj/aUPFZtKNlut
         CBi3EaxafAqdW/ajFa9jfFkHripf3a64+o5N+wP4NXETBN+cQe46UpzGLO3BQPnT5PPZ
         bxRPNYNrIyaxto+8tIRYckZRjnM758HnllIuS1+ynsNkWlTkvyz57gYGXTTkz/06LUgm
         HnGtz/MqZ9w2x8z8t8jP6KKb2FhpgIKA//B1PsIZgAvPyJXCkZFzdIb226+4yJQPjk2l
         WZpg==
X-Forwarded-Encrypted: i=1; AJvYcCV/1Nn5kNTdZRlTULeFD7WghPstjehgXY1buKsugRo6Vm7ync08JzffPxikJooonLv/cvktAzVf3qTzLd0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzky9qd0UIKYGch2FmPj/8H7DFQImXseq7z0CSvGGcyjWglqbEL
	9HqNlstqk3eReVK3U5vAxv+ILvGtDZFOWo6uiUtr7jzcq+ENb6xEuhOxH4BCKFcvQOs=
X-Gm-Gg: ASbGncvtZ+ah7HSCe4O9kE5pfwNYJ6vMU5kaRGiLf2uM/oLFzyvygsAlf9mu7e4zua0
	yA84+ObYCNAmazsZl2xBgjSD16onDCgVVxISow3vuUPKzQkuRqnIuWhgPrr3zb7HLkSgY8u7yAk
	BI0mphFwdi2b7YXE8ql0UmBIdBY5O6J62lEz3t6+1ydvHrQOCE6+ePKzHtIYJjQ0ksV3XPgs+qs
	x42bKLQ18F1QXTb+GgwtJSO5F/6pHlB1nT9u6JxvFalF1gakomfKqTZl/45/6q0EOqaGtJNnGJD
	AsYAzIxAdpF6cZAdzQRy6sVJc7yHYEKPJAd8o5V/z2DOSmT4+7KT
X-Google-Smtp-Source: AGHT+IG6O9b+F56lqI08lLY8XKEyZhqIaaup/c2qpYzgGQWIUV/qCJJUCoP124GbHllskWBK+K9W3A==
X-Received: by 2002:a05:600c:8212:b0:450:cd50:3c66 with SMTP id 5b1f17b1804b1-452014b39dfmr152226005e9.29.1749559430015;
        Tue, 10 Jun 2025 05:43:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244d15asm12553064f8f.66.2025.06.10.05.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:43:49 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:43:47 +0200
Subject: [PATCH 2/2] USB: serial: cp210x: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-usb-serial-v1-2-a9343ca109e8@linaro.org>
References: <20250610-gpiochip-set-rv-usb-serial-v1-0-a9343ca109e8@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-usb-serial-v1-0-a9343ca109e8@linaro.org>
To: Johan Hovold <johan@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2564;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=dVT8Nc93hQ3BpEvg5PDCdq8/g1ooqDkHB5uyuCp0NBk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCiDSjilmUorKMsKsYngZATf+DMV+Uyi+3fd7
 8IO1GoG4WeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgogwAKCRARpy6gFHHX
 cqlbD/9XZ/lN8YDBGrUO3cZkulCFBny0CWaBk6oUi50KNpWUX9XPaoAyybYPiy+cgI9Fe6P8Wy9
 EzvGa/8+tszfiuIV/zafCbWYKqcnWeEK2xyalS+12UMxzdN8bkTtybCtHuruzzcfuRmZt3robLy
 Qv4hsuBvB9Brqz/w3MmEZ4Ii5CkhEMsMviXUElRdXQCahQeJUV6vXGUQsVdAh+bYniQeBy1xHAl
 7d5vAYw1qf4H+yKf9479mc536CPThRqcvgE9S88DWt4n2TVUPwv+td8jYZL7+uHdDbNSCCpz0Oq
 3oMiOImZ19oh0xKvvYwwsWhkM+2+EGyUdXGDCUle4i3Eewgj+1uPshbqazt1kB8ZdrTgt2t+LhS
 3s6lNFclS3sJrckqBX6t24Po4s8lA/BwB79K6x4vWZIqqH5UL/BAVuXWl21WGAB+hjBKrNsmKLq
 ck0lIEC3DfQk4hOELytH8OSRnMHYT9Dg739GSKUlBhrIgxaxaZsbs7l9K62+aF7I7VUBvpgFsYC
 H/VlKeUMbXSbeqMF8YQp8xu62OmNjERDGwqkDhPVSr4ay63P2VCujrtzSQ1ubaNIkGeG4Oy0DFv
 5VUMAzugCwexIdh9+9wwOEIMFV5QgRNx5SldrRnNCerXJhDhDCq2Ymq+XO6+1SMReWWNjqQ0fEa
 EUUn0vWMPBh2cTw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/usb/serial/cp210x.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
index 9960ac2b10b719192dfbab0a6e81b2cf80f40d36..caeb2873a60451fb7a9a5b5d25071547b5401d52 100644
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
@@ -1522,8 +1522,8 @@ static void cp210x_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
 	mask = BIT(gpio);
 
 	result = usb_autopm_get_interface(serial->interface);
-	if (result)
-		goto out;
+	if (result < 0)
+		return result;
 
 	switch (priv->partnum) {
 	case CP210X_PARTNUM_CP2105:
@@ -1555,11 +1555,8 @@ static void cp210x_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
 	}
 
 	usb_autopm_put_interface(serial->interface);
-out:
-	if (result < 0) {
-		dev_err(&serial->interface->dev, "failed to set GPIO value: %d\n",
-				result);
-	}
+
+	return result < 0 ? result : 0;
 }
 
 static int cp210x_gpio_direction_get(struct gpio_chip *gc, unsigned int gpio)
@@ -1599,9 +1596,8 @@ static int cp210x_gpio_direction_output(struct gpio_chip *gc, unsigned int gpio,
 	struct cp210x_serial_private *priv = usb_get_serial_data(serial);
 
 	priv->gpio_input &= ~BIT(gpio);
-	cp210x_gpio_set(gc, gpio, value);
 
-	return 0;
+	return cp210x_gpio_set(gc, gpio, value);
 }
 
 static int cp210x_gpio_set_config(struct gpio_chip *gc, unsigned int gpio,
@@ -1960,7 +1956,7 @@ static int cp210x_gpio_init(struct usb_serial *serial)
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

