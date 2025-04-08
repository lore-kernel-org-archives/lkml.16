Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5673F261589
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 07:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744096880; cv=none; b=GAZBfaZ7aYau6t2hiUDsZjsgVO5/zvz+C+pOVhv8iTDaw++PFp6wH1t7YrRvcUFt5pIuuTqTANDwdKXSFNAVoBOqjJKc9kAaTt8yeUfZLM/OaSk1UGSYhcrbO0w9W04RE/b7LkFhdCtZM+Zl+oh8rgiWGv/NUnscT6OcotYqOb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744096880; c=relaxed/simple;
	bh=Z8NuRiiGre336HaXLG/p2D9NiyCslGW/FZNW9rsdegA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VsVUHGgmmvksWyZdC4Ms1NM3AmKNm26G8Ddgz9wQ1EDn+9dcVvutJCEfcx2Ji+V+ZaQlkMT+o6LxODQP9wa4kxRmaOdpOV7ZY+sWC9o4afcgZZogt/uaqZknaBoRCqy2OwRkI27260qogEvrQMm9SztizMxxAwwwSOc4ADJlFeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ZIIVnpyl; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ZIIVnpyl"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso48081345e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 00:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744096876; x=1744701676; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k5VNPwmH2aw3WXLnBPncXSTUgUkesspgvkr7nkorUo4=;
        b=ZIIVnpylzxesCTIqs+EPKUi348pnFN7m+yGw7Fjp5hj12zguTNyQNKrW8ccnCw6zdZ
         BYQMkWzAPBWcgilvs4dK/weYpHLqmMB5IbOPv87Q5CbaoHLhP6rFjSJIXt/6f1Yc2bmv
         YDoer9pusvy5G2EQQKxKuIX+F3BFg4qI/TslcqYOGxZOL40P5cM3JR4pTUT5GLvMd10w
         H1eBIRsWeLWQ8Rqq/HkwnJV8OmliUYldt2/6mmw52kN1VvOrCvVfPFjdMhwMrDKqo7Fe
         9M4rk7CP66alTs+D7lWEdDYLi8CEg8R6ey3ykQw0GZkvxz7mD18ckKvsUkkWSul/xCpP
         6aPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744096876; x=1744701676;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k5VNPwmH2aw3WXLnBPncXSTUgUkesspgvkr7nkorUo4=;
        b=xAJ6esfrHXsLJiUTXAJGevQR9DWWMLk6vilwAd9Dr27gSR1Rhn2Z4LGhVX+lq2q4cO
         STn8Pll0lElwg+Y6CbMDvA3b9OMY/xbfqSJk9Uw0GkA/pHbREB2KDecs0E5Ya0d/IDhs
         Xh0u2epwncN9/0n2ZwgNpE8b7gNQ2+rbTfQl9dy0qMeoYVr4xmo3eCDl2GWRQNq+SyDO
         p0ujHMsYJhNJS4nU+wzkWho5Fy2dY1A7M6te4tYB38WLJxRpRcnmnXXmrlbLiKaoMH03
         tK2sliyD2jQVWq9ky1MqVwjLVxZXiGl/MErujRROWo3VySES4BKspe9ixAGoCWT6hBBf
         VJ9w==
X-Forwarded-Encrypted: i=1; AJvYcCXGKkDwwgwoDnQCTVF9x9reFqlxccXo28eLwqWetf1uVO0vv6VW/PBNYsGm/uKYi2GAAHkLi9sFzHkcpTQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yybb06+ZhrIUFcgr7l9Ug3y+OdcAFNI+YENP+iqY0YlhsKlnamr
	Lbtt0Vr96RZYlz/8VETIr5nE/zsuFu6vBiBuqiMGp4IzEdcZUzZFZDWHioxj8i4=
X-Gm-Gg: ASbGncvDqmmwRiB2s5oaKO3xWutoVKvLMsMSTVcxUowdoc0F4BYjFDiCnDULTDnV6c+
	eedUQXLkfSb0NEh5unM8nXKzFIszaPJlGPspd1ysEoCNp9l8/fPchd/FiIwdq02vD/q4GrmVuDS
	UD2tYP1FJ2i81zwYWyypbxz4RS/FHmQHZXWycMAu3DidaLJGS7Zoc4YNTPwRcpGoPlUENAjRnoz
	G5/3SRGHVPOQ5goCp/fgi/gouk+hRW0TqNrpB/6ylZdxjmltCCAAyYLETt3ZHYiDqPvS1/A1lg5
	ipbo2U57JMbruLp9EBvAoNOiR8/kQRykXd6Tdw==
X-Google-Smtp-Source: AGHT+IH4VtW25T5J+PjGlIaZ6M22QPow4uOtnfupdUllT2Fkt12p4tk7DF0T4P47TDZZTHY0VBHcAw==
X-Received: by 2002:a05:600c:3103:b0:43d:300f:fa4a with SMTP id 5b1f17b1804b1-43ecf89dd3emr156314595e9.12.1744096875649;
        Tue, 08 Apr 2025 00:21:15 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec342a1fesm154404135e9.3.2025.04.08.00.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:21:15 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:21:11 +0200
Subject: [PATCH 3/5] powerpc: 44x/gpio: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-powerpc-v1-3-73dc1ebc6ef1@linaro.org>
References: <20250408-gpiochip-set-rv-powerpc-v1-0-73dc1ebc6ef1@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-powerpc-v1-0-73dc1ebc6ef1@linaro.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Anatolij Gustschin <agust@denx.de>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1553;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=LL68VEJKE/MtZ6G9TyrymTnHIDLdTmXeqNGFDYstqEM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9M5msWyg7dgLldXdctL+ZK3AKOwzmS8REEK9k
 9AhwWrSKiaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TOZgAKCRARpy6gFHHX
 cigSD/9n9tAkmdjxn5eCjtFyUMEDYwobZytzV5we7jp4QTTClSMwVsjxPVdAuelo19SzpC5P1u0
 M63rtFA7UKIfwCv0qVMtTIjOfE5qekRqcE3rpWVC57w0YF1CCGAPPzX4gSvo4ldTxlu7j9Olyrg
 ZQn3QFnmn1IZKayoceAC15tLVl/eZ3IIX19k0JbnpHAUOesg3uiENYp7k5EMprGRKfUJp9sVGBi
 jw84x4E9W3dLHqOBTZgyxW8Ro/FZRteiUscoL10ecKjUZZ9toN1tt4dPuJr6U0hoGXZoVudteyo
 QSuCQ0tEqeHw4rm+fcKwwN/uE0U5ytmA3sr/g/eKPGTI487XQvuglX53vuusbrdEv8QlU4d3ReS
 Swe/4oyn+0HH1lqg1HVljkPFwE7PLSiRNCC5zvR2mqieXeCtTGiml4ml3rtCjWSnuwYP31q8ceh
 pDDlxxguynZwDlBEAy0HRpWqynT06o/p2vpwEpHkCKj71/iV/+H/3obtyjiI5e/WfMNvDBjszrg
 fl6TFPIiat950nUVd8hSd5ClC2Q8MY6OaTz6z5BdELRjbZy7cy3TDLR9zL+yfbANqQyfEVoJAWz
 wayOYSs1wPhwIm6pa0PfDng2DFrmIImzJSvnJrJTXLCD6abuuSpjIY7MGu2mTBoj2F5pJQiRBIh
 h/cCOIUgu6sJ2Qg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/powerpc/platforms/44x/gpio.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/44x/gpio.c b/arch/powerpc/platforms/44x/gpio.c
index e5f2319e5cbe..d540e261d85a 100644
--- a/arch/powerpc/platforms/44x/gpio.c
+++ b/arch/powerpc/platforms/44x/gpio.c
@@ -75,8 +75,7 @@ __ppc4xx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 		clrbits32(&regs->or, GPIO_MASK(gpio));
 }
 
-static void
-ppc4xx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
+static int ppc4xx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct ppc4xx_gpio_chip *chip = gpiochip_get_data(gc);
 	unsigned long flags;
@@ -88,6 +87,8 @@ ppc4xx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	spin_unlock_irqrestore(&chip->lock, flags);
 
 	pr_debug("%s: gpio: %d val: %d\n", __func__, gpio, val);
+
+	return 0;
 }
 
 static int ppc4xx_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
@@ -179,7 +180,7 @@ static int __init ppc4xx_add_gpiochips(void)
 		gc->direction_input = ppc4xx_gpio_dir_in;
 		gc->direction_output = ppc4xx_gpio_dir_out;
 		gc->get = ppc4xx_gpio_get;
-		gc->set = ppc4xx_gpio_set;
+		gc->set_rv = ppc4xx_gpio_set;
 
 		ret = of_mm_gpiochip_add_data(np, mm_gc, ppc4xx_gc);
 		if (ret)

-- 
2.45.2

