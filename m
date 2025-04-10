Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D63268684
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 09:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744277708; cv=none; b=t67FWJn9uCq+A01fynK2yDeUjwjW2U+xezam7VwXTHw0AU0Jz7uOf8UnF2UE3iq39WjTSo7PMeMqD0duUgzOpOe9kfWlVvoXNvOFZ/xf9lKfQYXDXhKlHUAIfjQSCARFce/hXh2j0bkBHY43kpXXQXiy0OB7bA1zULebw5BfbaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744277708; c=relaxed/simple;
	bh=DoFdNFWoCcdwBqgFx7axqjS23MMKsUrQ/U/HOonOanY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gKOr5uMmyJ+JZqcZm2MIAryyJ18R/eyMGT4I8RZumQknJmbg8D9g1gFY/6V2+iPDkdLtpEzJ/GKgFZN6qZ336DEa3uA0U4stEe0jeTyrDzH+bzRXibfCWv4SgkYyz+P9sgGzovo9vqbP1esHxNuha6ySs4h3Q4kBub4qwLVT2pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Zaa6PS6d; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Zaa6PS6d"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so6831495e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 02:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744277703; x=1744882503; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c8Y49U7vyylV9HBlgThwXQyGyZVwK1RahyBl6+GUslY=;
        b=Zaa6PS6dNq8J8uH6qJYt4wIAT6ofYXV7gX/A1Yc20ga7kfOqRsALlQGRi49/1idFnF
         hILVamUUo7JkFwlkeiPlgpvGE00nSlRzX+05XzvYTP9G+TxRNmMKQ0nEeNvALBSI3IhZ
         4l8p5uXcV37p8C67gadzYQFIvYEbLawMxfmwx00+p8EC6KHk3+sO4RPDFeiEeu8s170E
         3HfEhGKjlYFYeqAue6iw7jaRNROWFUfPfAMn4CcuqNIDzxM74hzia/U+JLv1qk4SlWYX
         3PaQj1prWSBHrj/JWyo/zkKODnN8Lq2LlXrCr0+oEN6NstQSpSnD8JDNpU3JwSEB54V9
         WIiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744277703; x=1744882503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c8Y49U7vyylV9HBlgThwXQyGyZVwK1RahyBl6+GUslY=;
        b=CGztKaU6aOu37b0Epyudf/QMAJRVieU1+REMrZoKEBtUTbPCckIrPu0/CHJtSOFteL
         eL54NYJH6dd4D1fDhCWNvw4W3JgwleCmmnjX87swEiZWuR+P7VZjk5m6ux1KWunKk5vT
         GrwD2279Cn/3NIO8jCgQUuWX24A54dvBLDNAj6eQGV09kggEUYmZdvhT7NLMjYdMTWys
         ln8RirVdZsG61Lo0WcvS6+j/XvOqCH2v0v8xqOqrFykZBt2+cie7f+I4NyRxacuAx9yc
         FOnHPWHpM1XHpRAVk/jK2l+vXoySeqAdRR6ZWsY11tfMOGonMOYZYqzav8+/9fANsg1l
         wSzw==
X-Forwarded-Encrypted: i=1; AJvYcCVZRK42cL1d8NgvErfDLwdchFqcQdfz+0EFsgxgvMipF5/f8MvEy5y7wTZHlpLmmyaSivcbqi8jsd8BVIo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgAmnLCEvvztiMr+xFfqu3vkE5ltOh1dP3y5nknNRAy8qa7BMs
	qNadcdUij+WnMXlYEuzTT4cUiU+Eh/G9bXl/FfTtqw/o2Lcb8vKNH41xBxN8mFs=
X-Gm-Gg: ASbGncvN6YLKH6EuTIYEnPWxZrcifyGTLIBk469vAPMCmhHp7yDHRWue4FC43AynrWm
	YtJ3zbUmlZJKl6EvwomxcB+k/G6bxYHPsvjyGs8R0MtrrbNx2qo3qBEwJtxW8ApJfPgJ55NCtXo
	fUApqApDSFAnOhTw9K3uCtJ/XlLXRZvdEmif/r3TF0csZx4I31koqc4GI+e774HKSH/gZjRCXf+
	slZq+vfjrPeegv9HE2h+PoYVROVpEyr+inesdwbfgk7gCNEx2OXOzPQ7J5+pe2kNaEE3uipgB0b
	0YBRLLmZGRh/3B+dgfTSz9pN3mWnOuloEg==
X-Google-Smtp-Source: AGHT+IFO/7yb5gwVk+EjcAiXS674jHL4dkOWAIJi2cH5g/WNiQpu8cbZDAfyXKFMDWcxeA32KO35qg==
X-Received: by 2002:a05:600c:a05:b0:439:643a:c8d5 with SMTP id 5b1f17b1804b1-43f2fd29c65mr18806345e9.0.1744277703398;
        Thu, 10 Apr 2025 02:35:03 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:7c4f:f9d1:94e0:53f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f206264a1sm49698435e9.9.2025.04.10.02.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 02:35:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 10 Apr 2025 11:34:44 +0200
Subject: [PATCH 2/6] pinctrl: qcom: msm: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-gpiochip-set-rv-pinctrl-qcom-v1-2-6a6891338aae@linaro.org>
References: <20250410-gpiochip-set-rv-pinctrl-qcom-v1-0-6a6891338aae@linaro.org>
In-Reply-To: <20250410-gpiochip-set-rv-pinctrl-qcom-v1-0-6a6891338aae@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1588;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=usX00XKi8pnUCUTjAeiAi0APuP7ga/Kkn40N9cscMzg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn95DDa/89BnXHtA4+4Ni8Mh9nKIEx8RLUu6TiL
 7c/JWsquH+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/eQwwAKCRARpy6gFHHX
 csL2D/9v1+J7NExhtOLP7S+W7lAyKvwFupRyUslizgwMatXixYiYi+QieSXSPPKQPM4VTj1KIWN
 n0FBazRjFNa3MaBdENT984m9UNUnwFOhviyywDuswR1ZU9fE/qZG73efOY2xo2gc9Ddb/kzDdHd
 9Y0W2naMHv+Mw7/A77hWpAHVpNq3DzKfqGiZXHZxCWrU0bISk2Yov9g9IlHzpIGHhglJKT9ujAn
 uDnf0lhqQhtHIFvojPpLEwzKQ0KztXkUu6+EuL3bThCO7oy01OeGDO5XnwiKm52aHPYqki3+Gy0
 P4I7OyFoVEgx4cW0RtMHLezTk0WekAwzt/xLjkhKeG3b74ceX11Cloa5fJofuwkA4ylLgBqwrv1
 59QxWmyWLxGR5ctwp3mdTdjpz0EJn9wWGQAdzhG5jM2iV9bPosMsKZm0u0TOUzJ9+6KnTf7GEBk
 NTJ6tMYgmFIEmF060FKrEsnjnt17Dc44lVjY2BHZqo4WHcTKycJzZrlh1M2QoD+Tu5zQ+BpAeV8
 uTsy7DQ3Zx7tbNX3DG6pW4NvOuxLS3l9pddMEgJI+p/zCsUXeQgSmgDNoom09iBJ7bvF7OUUO6H
 Cs6ZlNM1tb5SvmhkROfMQAkSPC7k0MmRkKbAqhaKMFxf2QP1kuZRNsL6pjELKXiQDbzjNUVFfvZ
 0relZsbl8+PJkAw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 82f0cc43bbf4..9ec15ae4a104 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -637,7 +637,7 @@ static int msm_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!(val & BIT(g->in_bit));
 }
 
-static void msm_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int msm_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	const struct msm_pingroup *g;
 	struct msm_pinctrl *pctrl = gpiochip_get_data(chip);
@@ -656,6 +656,8 @@ static void msm_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	msm_writel_io(val, pctrl, g);
 
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
+
+	return 0;
 }
 
 #ifdef CONFIG_DEBUG_FS
@@ -792,7 +794,7 @@ static const struct gpio_chip msm_gpio_template = {
 	.direction_output = msm_gpio_direction_output,
 	.get_direction    = msm_gpio_get_direction,
 	.get              = msm_gpio_get,
-	.set              = msm_gpio_set,
+	.set_rv           = msm_gpio_set,
 	.request          = gpiochip_generic_request,
 	.free             = gpiochip_generic_free,
 	.dbg_show         = msm_gpio_dbg_show,

-- 
2.45.2

