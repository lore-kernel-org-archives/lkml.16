Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5372C1FF60E
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 11:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746445077; cv=none; b=KQ0S/LsioWxvAJ9M6oVlyIvp/uJiko7bh7rZWGlIFPGTxGJ3e9Hl7Jzfv9NrIPHwg+dymWgEGutr9TrBsux6vi1ehcEyCecVtxwwaF9RztuxtuvniAcS5baypu7ubgh/iekVI9Kh+G+I+vhjDEqlmrpdrI00h+aVi1Hijko9YGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746445077; c=relaxed/simple;
	bh=msIu5pu5l6E3KRgt1qjtII1INljwPzQsjxoJDPpqKng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pl0tpXEiWfv5Zpzp/NEU8U+i+RvJJpdD8olE7RLaE9SFTrdyrTmvrddA6C4NG/ZyfBMARHX52rU/QaT2XQBFCPzTVBp0GeqKy4zh+Y8TMnZpwr+nhsgtp0jFLOTijkjOFJi+e+2iX6LjB0WqvjU257zMA3NilkgWQ1bg6Df7Qdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FpDJsqaL; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FpDJsqaL"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a07a7b4ac7so1792397f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 04:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746445073; x=1747049873; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v3kJw4Q1b9fZtWhj0ZAhlfc3rScj6eP/tzzAKRlMKnY=;
        b=FpDJsqaLx3U+IXm8VUJ94WB9L83Xsx/k42msz5Z8pd+WWa9wvcefdXFnAQKuUbXR3P
         c4GEOg8hPUrvRIq5GUG0US4wn1ESqvdqnRH+VxL1r88PPPSKJdw2rFcF/Qp2gnTSCniU
         BdQs9Ty1zkEFTI3fn7QPIjDMljY1dR5olxJmx6yrWyFHu9F2gjGbkrauI9s5XQ6DrLUb
         QbCtvriTjNvLGFWXEaAHi2LBEqaAwvF/qUSEwxtUd887GpoxRTjIJUyfya9ofsyTTU8j
         rEA7F5LGWaCwXfHNxZnc/sMSwtzDcurCn4GdIUWJLZRoZHU7V3L3FMS4hL1dTfwt9HvE
         DhiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746445073; x=1747049873;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v3kJw4Q1b9fZtWhj0ZAhlfc3rScj6eP/tzzAKRlMKnY=;
        b=koanSP7WVpUei6hNIbLsVu6s4/HhvhWyWRYqAWW0cXuTntDaA3PJby8Yzb/YN1Qa+8
         uHnAn5MXCw3iPReljQLrTw50BP+H7tm6+EwLAKLzn9Nbp052n1uoFliQ+zgQwBD4Vg2E
         Ov8LQE6y+2nlsVy5r13ec6L5orCmjau4XzQEd/9PS95JgesATxA+BdnlUAeUDFg0aqB7
         v803ZPaawRrv0ST/Qoih9Pv31UpgYvTsCg68H83MgNeOyh+kYyMXx8TdsLEJPhRTYTLc
         j3oHms1V67Zj6aiG+P/3E94CjXrfiefJnjAaCBLzFJqOrjCF72PvqQD7CH4+owM4fi4W
         XvGQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7Lr2RCW8+pEeGN4iVUJgCthGhloJR57WWZn4AFnSdCevAaPvjHPEYfG3s/QVIs6bC8UngTmogrT39GrY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtKxtHmjpLSSmysIWGdtOxHP/tWCYOtHi1+o6Q11D5k1aJCQAX
	IeOtrvmXE5qvi4Gemw8irDUKX7HNH9+daTSdJn8OjRl1mu9V704+yNvIbBdg9Jc=
X-Gm-Gg: ASbGncuprAyEXC0v4p5TrdXSmhl1pnpfwZEeStSDi3123TNLQox5R84HC0SR0wOmk6G
	M09b9YNS3xRnUrvRbHNdyRbpMz66J7s8d8ewmzXYrOAJ1CgfYKOWe3BcCO88Z88N+lnbD1X13qi
	iHO2frRNOIffII3cOLWcpHSWQKkHP0NHl8xAJAIxDrl8ptSxVrKqoFkc4hnzVtAsZ1UwSnioutJ
	kss+LEwuGkwdwRuO64VnO/Ml91hjsaa//dJ3SA9m5g1QmgkAufl84flOMPepnrvcFThLw86htI2
	l3lGTLTUph2ONz9lb90ybXAmZOE5lRz9DSj4bnLNZIh7vg==
X-Google-Smtp-Source: AGHT+IGPxugxwn+CsjAzxvLOzVE663H1t3E4BLdwFviF5LobM1IDVpFgBNA5rWFTXIgUJVgNZmuhHw==
X-Received: by 2002:a05:6000:400e:b0:3a0:839c:271f with SMTP id ffacd0b85a97d-3a09fdbcdfcmr5292749f8f.47.1746445073614;
        Mon, 05 May 2025 04:37:53 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a099b17260sm10423126f8f.98.2025.05.05.04.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 04:37:53 -0700 (PDT)
Date: Mon, 5 May 2025 14:37:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takahiro AKASHI <akashi.tkhro@gmail.com>
Subject: [RFC 3/7] pinctrl: introduce pinctrl_gpio_get_config()
Message-ID: <0e982ace876920162d27a521f5f460b1dd6fc929.1746443762.git.dan.carpenter@linaro.org>
References: <cover.1746443762.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1746443762.git.dan.carpenter@linaro.org>

From: AKASHI Takahiro <takahiro.akashi@linaro.org>

This is a counterpart of pinctrl_gpio_set_config(), which will initially
be used to implement gpio_get interface in SCMI pinctrl based GPIO driver.

Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pinctrl/core.c           | 35 ++++++++++++++++++++++++++++++++
 include/linux/pinctrl/consumer.h |  9 ++++++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 4bdbf6bb26e2..4310f9e2118b 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -30,6 +30,7 @@
 #include <linux/pinctrl/consumer.h>
 #include <linux/pinctrl/devinfo.h>
 #include <linux/pinctrl/machine.h>
+#include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinctrl.h>
 
 #include "core.h"
@@ -937,6 +938,40 @@ int pinctrl_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 }
 EXPORT_SYMBOL_GPL(pinctrl_gpio_set_config);
 
+/**
+ * pinctrl_gpio_get_config() - Get the config for a given GPIO pin
+ * @gc: GPIO chip structure from the GPIO subsystem
+ * @offset: hardware offset of the GPIO relative to the controller
+  * @config: the configuration to query.  On success it holds the result
+ */
+int pinctrl_gpio_get_config(struct gpio_chip *gc, unsigned int offset, unsigned long *config)
+{
+	struct pinctrl_gpio_range *range;
+	const struct pinconf_ops *ops;
+	struct pinctrl_dev *pctldev;
+	int ret, pin;
+
+	ret = pinctrl_get_device_gpio_range(gc, offset, &pctldev, &range);
+	if (ret)
+		return ret;
+
+	ops = pctldev->desc->confops;
+	if (!ops || !ops->pin_config_get)
+		return -EINVAL;
+
+	mutex_lock(&pctldev->mutex);
+	pin = gpio_to_pin(range, gc, offset);
+	ret = ops->pin_config_get(pctldev, pin, config);
+	mutex_unlock(&pctldev->mutex);
+
+	if (ret)
+		return ret;
+
+	*config = pinconf_to_config_argument(*config);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(pinctrl_gpio_get_config);
+
 static struct pinctrl_state *find_state(struct pinctrl *p,
 					const char *name)
 {
diff --git a/include/linux/pinctrl/consumer.h b/include/linux/pinctrl/consumer.h
index 73de70362b98..e5815b3382dc 100644
--- a/include/linux/pinctrl/consumer.h
+++ b/include/linux/pinctrl/consumer.h
@@ -35,6 +35,8 @@ int pinctrl_gpio_direction_output(struct gpio_chip *gc,
 				  unsigned int offset);
 int pinctrl_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 				unsigned long config);
+int pinctrl_gpio_get_config(struct gpio_chip *gc, unsigned int offset,
+			    unsigned long *config);
 
 struct pinctrl * __must_check pinctrl_get(struct device *dev);
 void pinctrl_put(struct pinctrl *p);
@@ -96,6 +98,13 @@ pinctrl_gpio_direction_output(struct gpio_chip *gc, unsigned int offset)
 	return 0;
 }
 
+static inline int
+pinctrl_gpio_get_config(struct gpio_chip *gc, unsigned int offset,
+			unsigned long *config)
+{
+	return 0;
+}
+
 static inline int
 pinctrl_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 			    unsigned long config)
-- 
2.47.2

