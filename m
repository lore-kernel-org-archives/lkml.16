Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF6C23183A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 08:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751445943; cv=none; b=bt4/oE46iYOraXnSZZgO3JpTntHj+Ts9h9LvG0IlCFqs2e3VFF2KRCboT+Io/GUf6DsZ7ZiI53oVYozRAq35Dm7CA+GIWyfvUEXJDf8dPGfm77bZ8VSumQXgHwpDiVbwHTXS2VhthJ2JnWRhhevNaDTAu0Zhf2Yu22ELmUDsgoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751445943; c=relaxed/simple;
	bh=WAFN3XMGJl1YSCRSRQ49asmYULSwnRZTgEOnMEgM9kI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f2e//srxAAQ+E3uFw1pDvbpFy9Z3/jlUfqNp7LlVCOjACbQpkpp6V+k/LZnRQgAhoJLYhe4w9xt4ywnxMEj6asDU1jvQ0AJKdxW8TXmR6d4PWHPr0qugHg/gjOu2ZbsZ7SzLMvxxhrUjOSpVPpqtY0gQcBjjlpvz8ThCLNEtrR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=KJ6O/cCq; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="KJ6O/cCq"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a4ef2c2ef3so3613886f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 01:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751445940; x=1752050740; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eT32Fo8JzyMKt5wvkWJtbuCECu+UVVsWJUiz4fSfT0s=;
        b=KJ6O/cCqtMNNgYnMau6uatdkqTeTWbE8bTWNz5Brmfc6hRBNzO+SjV6dAeKTYez01j
         7mBSFqJ+NJhAETDqoss3Sv+B0VNfvSY2ZkAJ84Chn39wZNR/wvk1k6oA+xUuDzA3ZwdS
         +SugGRThsDZgyRCG91tkxFP1GkXr8SBmWzMtfGX8YzN6E64KDSf12ryWPeYnCjuKRDbp
         URcFegRLkieClV2yAlO1dO598IarfBECdwZmSpY2rghC5aLmfWJdc4r7es4pretvm5B2
         4FBBh4bgrhPIzlpvj9SGELdQYvYPkWUvM+g50x8P3drhGvTdGxexPkJDGOl/1K0+pDZC
         N2/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751445940; x=1752050740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eT32Fo8JzyMKt5wvkWJtbuCECu+UVVsWJUiz4fSfT0s=;
        b=G8uaCty69nCt1fRWLgEQlHdnuofBHOY+Pul1edA+YEuyqjBnP9AkSmwSGrOhCVt02Y
         xlggf9c8S34xwAjrGzKjsWJ5gXMfmF0MApaeWhi2pAHVDD71rpxHs68b28YGtV1gfIco
         ZSIdTf4zPmZHxqG6b/Il4EUKdsv4YFe4k1KQLj9J5a09zogzqjFFc+t4lwWzU47kQeIE
         JsRKkOeRfpZ46VuWW0eUnSzff+Ul/aWK+zJiZJLn/WzC1si8j+gfL52YLCh/RX7HsQAo
         JrLF2CJTYn5XAxXevyxPqljgn9kcPkTBR7uNYXDC0sY/uGx+cy8aheApiakFqW+T8Qgs
         9TXA==
X-Forwarded-Encrypted: i=1; AJvYcCW1FbfUnpojt8Ykl8I1VAUhByzA/pNH7FyhTJozoPJ2YJJ5X0kq2pyTseVsm8SuMLVcQ5m7DIbLbzlgznU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXmdEfBKgphVjM9UWDOQIgOCH9gwBU4JvM5l/YdTd45r8Zg1FA
	J65NlNw5UfWihXW5zvDDe3b3jF/NqY4RH2DzEdfx2/wWLQNzrThN4wGZ0pZzVfWF7hk=
X-Gm-Gg: ASbGncuAY6KzAhbyhP865KasrT+xPGvV7IOUVQbgMiVr54wuDoheCJVofAFUmg1y5zP
	KzBYbYjFipnryJ0RMTtFD+cnYVmb+b/y8jz1hBzLpvjLXey790VKkTCShj9by0l0U1bbK4qoZBz
	nXbTqV32nV79UlCLlC6bmHI2Hef3YfYPXwgdJhdQS8I4HzWYUynvPNoEzeDmrXgTn1hRC4WR8Pm
	VNfo4nj0WbmmsajZoHynDvopk6DzFyaUoAwd944cgOTwf6w9BdHJu4knHfT7rWB/oA9ZabxXrIt
	MguZqqcyhU7qUh2+kcLzrz27gpaSSbSMyM2vljSEYj5SDi9DyVAmlw==
X-Google-Smtp-Source: AGHT+IHG3Yj+dH/J1LSuzIb/KvrqdHiuMNAs7+JHPwiQz+8EIfOrd3c/qJCkVCObtKeDO0K6/uKVYQ==
X-Received: by 2002:a05:6000:4611:b0:3a6:ec1d:1cba with SMTP id ffacd0b85a97d-3b1fea90838mr1441696f8f.20.1751445939834;
        Wed, 02 Jul 2025 01:45:39 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52a26sm15620571f8f.51.2025.07.02.01.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 01:45:38 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 02 Jul 2025 10:45:31 +0200
Subject: [PATCH RFC 1/5] pinctrl: allow to mark pin functions as
 requestable GPIOs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-pinctrl-gpio-pinfuncs-v1-1-ed2bd0f9468d@linaro.org>
References: <20250702-pinctrl-gpio-pinfuncs-v1-0-ed2bd0f9468d@linaro.org>
In-Reply-To: <20250702-pinctrl-gpio-pinfuncs-v1-0-ed2bd0f9468d@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5275;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=VoXODpXI27tHlO4yOhmbyOjvm5AV1TRNRVTTPs+jIns=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZPGvlSUBKMn73XM8CBhUX3vLu3W2QtZGA8zPI
 hpUN2TYdDSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGTxrwAKCRARpy6gFHHX
 cpnZEACWs8czQlfIRRQH1G6v7fzPiWMAdQ+g29fdQS2NJufJm3dWG3YIcKTFaAo2i4981K7JDy5
 WRwLdGrY/OuAjE7s6/YRi8hT5klrMWD6R9Mzc2LSg368EqxUlTYZkXFcOT6XPuzlHmy/TLAq8HF
 jokOjYQTEfECNshM+Lxl1Q0UZdBhpvISVJJjTgx/oJ2i9owI/CRhm55V+u3Z8n4ox3qOoVN31XY
 +MgAQo0kGIRwHt90Ua4Yz66WxcU86Wh4iITMx42EFi68HaHsAZf5ernKb88suNf029SDMCWA44F
 RJqUxqfqFD/Rv3JZSqUbAbJTZIhwN62c1C/kXx6JFMVBfiqmJtgRW8BlNQ0+iwICAou8lbHmnVX
 mxPG4T/fURdaG+sum2aLEDBdDcK1oGVViRzNJQWJ7IA+9wAGDz8dCG2cR18L4zvGXjowqliXgrY
 O4xFA/GFC3t0u84BONgayXP5+uFhimQs+6MkP7QBujDykZNYR9aDb+3bDgrp9j4yJDyJf/9CHoN
 14ZbxJJCvW5YgOnTtBd519HkYpw6htYmJtPGpSgnlInDJD5C+lF6HmM5oMVRbY9dq9bsBSNR7+D
 3+XkpGCoNeHhZ/HGuLz+g8HKkqIHWvIlg+8WtT+GIKasj0xhlCqVwGz9LWCnhUHFxYEHS+tv+y6
 zyy62yylszHnA3w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The name of the pin function has no real meaning to pinctrl core and is
there only for human readability of device properties. Some pins are
muxed as GPIOs but for "strict" pinmuxers it's impossible to request
them as GPIOs if they're bound to a devide - even if their function name
explicitly says "gpio". Add a new field to struct pinfunction that
allows to pass additional flags to pinctrl core. While we could go with
a boolean "is_gpio" field, a flags field is more future-proof.

If the PINFUNCTION_FLAG_GPIO is set for a given function, the pin muxed
to it can be requested as GPIO even on strict pin controllers. Add a new
callback to struct pinmux_ops - function_is_gpio() - that allows pinmux
core to inspect a function and see if it's a GPIO one.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinmux.c        | 17 +++++++++++++++--
 include/linux/pinctrl/pinctrl.h | 14 ++++++++++++++
 include/linux/pinctrl/pinmux.h  |  2 ++
 3 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 0743190da59e819d1c72c1ed1ece72f206d60d65..49855e6c49616d70bf9c805fc7c11ef41284dc52 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -89,13 +89,19 @@ bool pinmux_can_be_used_for_gpio(struct pinctrl_dev *pctldev, unsigned int pin)
 {
 	struct pin_desc *desc = pin_desc_get(pctldev, pin);
 	const struct pinmux_ops *ops = pctldev->desc->pmxops;
+	const struct pinctrl_setting_mux *mux_setting = desc->mux_setting;
+	bool func_is_gpio = false;
 
 	/* Can't inspect pin, assume it can be used */
 	if (!desc || !ops)
 		return true;
 
 	guard(mutex)(&desc->mux_lock);
-	if (ops->strict && desc->mux_usecount)
+	if (ops->function_is_gpio && mux_setting)
+		func_is_gpio = ops->function_is_gpio(pctldev,
+						     mux_setting->func);
+
+	if (ops->strict && desc->mux_usecount && !func_is_gpio)
 		return false;
 
 	return !(ops->strict && !!desc->gpio_owner);
@@ -116,7 +122,9 @@ static int pin_request(struct pinctrl_dev *pctldev,
 {
 	struct pin_desc *desc;
 	const struct pinmux_ops *ops = pctldev->desc->pmxops;
+	const struct pinctrl_setting_mux *mux_setting;
 	int status = -EINVAL;
+	bool func_is_gpio = false;
 
 	desc = pin_desc_get(pctldev, pin);
 	if (desc == NULL) {
@@ -126,11 +134,16 @@ static int pin_request(struct pinctrl_dev *pctldev,
 		goto out;
 	}
 
+	mux_setting = desc->mux_setting;
+
 	dev_dbg(pctldev->dev, "request pin %d (%s) for %s\n",
 		pin, desc->name, owner);
 
 	scoped_guard(mutex, &desc->mux_lock) {
-		if ((!gpio_range || ops->strict) &&
+		if (ops->function_is_gpio && mux_setting)
+			func_is_gpio = ops->function_is_gpio(pctldev,
+							     mux_setting->func);
+		if ((!gpio_range || ops->strict) && !func_is_gpio &&
 		    desc->mux_usecount && strcmp(desc->mux_owner, owner)) {
 			dev_err(pctldev->dev,
 				"pin %s already requested by %s; cannot claim for %s\n",
diff --git a/include/linux/pinctrl/pinctrl.h b/include/linux/pinctrl/pinctrl.h
index d138e18156452e008f24ca06358fcab45135632f..1a8084e2940537f8f0862761d3e47c56c8783193 100644
--- a/include/linux/pinctrl/pinctrl.h
+++ b/include/linux/pinctrl/pinctrl.h
@@ -11,6 +11,7 @@
 #ifndef __LINUX_PINCTRL_PINCTRL_H
 #define __LINUX_PINCTRL_PINCTRL_H
 
+#include <linux/bits.h>
 #include <linux/types.h>
 
 struct device;
@@ -206,16 +207,20 @@ extern int pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
 				  const char *pin_group, const unsigned int **pins,
 				  unsigned int *num_pins);
 
+#define PINFUNCTION_FLAG_GPIO	BIT(0)
+
 /**
  * struct pinfunction - Description about a function
  * @name: Name of the function
  * @groups: An array of groups for this function
  * @ngroups: Number of groups in @groups
+ * @flags: Additional pin function flags
  */
 struct pinfunction {
 	const char *name;
 	const char * const *groups;
 	size_t ngroups;
+	unsigned long flags;
 };
 
 /* Convenience macro to define a single named pinfunction */
@@ -226,6 +231,15 @@ struct pinfunction {
 		.ngroups = (_ngroups),			\
 	}
 
+/* Same as PINCTRL_PINFUNCTION() but for the GPIO category of functions */
+#define PINCTRL_GPIO_PINFUNCTION(_name, _groups, _ngroups)	\
+(struct pinfunction) {						\
+		.name = (_name),				\
+		.groups = (_groups),				\
+		.ngroups = (_ngroups),				\
+		.flags = PINFUNCTION_FLAG_GPIO,			\
+	}
+
 #if IS_ENABLED(CONFIG_OF) && IS_ENABLED(CONFIG_PINCTRL)
 extern struct pinctrl_dev *of_pinctrl_get(struct device_node *np);
 #else
diff --git a/include/linux/pinctrl/pinmux.h b/include/linux/pinctrl/pinmux.h
index d6f7b58d6ad0cce421aad80463529c9ccc65d68e..6db6c3e1ccc2249d4b4204e6fc19bf7b4397cc81 100644
--- a/include/linux/pinctrl/pinmux.h
+++ b/include/linux/pinctrl/pinmux.h
@@ -66,6 +66,8 @@ struct pinmux_ops {
 				    unsigned int selector,
 				    const char * const **groups,
 				    unsigned int *num_groups);
+	bool (*function_is_gpio) (struct pinctrl_dev *pctldev,
+				  unsigned int selector);
 	int (*set_mux) (struct pinctrl_dev *pctldev, unsigned int func_selector,
 			unsigned int group_selector);
 	int (*gpio_request_enable) (struct pinctrl_dev *pctldev,

-- 
2.48.1

