Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E55142E73
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 12:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749730803; cv=none; b=eqmsRxgFXXs+2ZKh6SjjKeqdRnHh5fozVTmEDleE/SlsoOOBXLEP6j8LZEmoYGvPiBxTfQwuQ+HZcSrMuogx9KDk0VBSDtJD6NvliV2lQyzS33dMJ07a+JnZL/zmkJ0uN3gChwSDoP7w8mjKgfVlVrueqJn8rN9I6XQInFsg1n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749730803; c=relaxed/simple;
	bh=8RbVPOBei0OznzE5G/YXwRUpXk7hMjZJk5zQXe0oe58=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i0vRcFXrIpzJ442B0YHLEgEFHmdOD3Rwvb0CY+XwsKVQMhdKtGo5WxxnhuTIxjAbq0jN72Bs/MTml/tuEMoK//S1i8EPYEwU6oh9Ay+HhPwChwTsQt1e14OSehfFd5lAMPvfBEZlsVLSSou7C8Dm5BysC2tUJJXiHrFNbJ5Ulow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=q5yzxXqG; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="q5yzxXqG"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so7797375e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 05:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749730800; x=1750335600; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VnpY5n5H847YZc4x43NYnlAWf5mCmkrD40/z7KC399w=;
        b=q5yzxXqGNtF5mEmHhUxcOUPzcE9KW4x6tICNRYfydUnrqiNNt1PeO3z2rA1PG82Hv3
         y4/RbPyRA4gQ6up25mWkDNi0Q/OU5aWZeFa5oIw5PKO+VGVxVaeA/43LVGbOQXaKH3Gv
         ulMnPhJx4endMBU6Q08DF3wQYSBAgDPQgUqgKrma+TgZZ28YzlBS4uH+RIsZl5e/jk+1
         XiSAz5m2dvowmZ4tT50N9XKC9xLUJNptAX6HX6lp7vKqmk0N/iBg9v4RNTt1gpkaA8vM
         VxWMvgZsix0way4ff9viLNV4IMCUMW9tzt532nlncYI3YHF2kB2x8tbgOpKEU6xBh+SV
         DkmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749730800; x=1750335600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VnpY5n5H847YZc4x43NYnlAWf5mCmkrD40/z7KC399w=;
        b=FKi8QSi6eJB9Gi9CuPscggmRDHJUwkHAmsw5xOYm0zcRS6n6cspy/DdI5gkAAS6R6Q
         Iyz89njy+XEUuyPo8k3P3uSO+tV11ymhhFKazfgcqMgJubIWsKshj8f/OD3AMQv2QYYg
         apHLkJWQyB9dCXYYnqtpT/rO17R9dl/stauHMeAaWGl1ewL+JdmABNDy/isjO3ysJQg7
         U0Xc7uhpHhcM1oBdMUTpKsD7nnxFBcYyk1IbCH/MgxSachj3PYJt4za1rwwILTlOWLGt
         TK3xbH1qoZzCbRKK9Co0qe9xgDHeGMRcC727uHAKBRo539AzFEcKZaBCTv9DrHGqsTQK
         wNaw==
X-Forwarded-Encrypted: i=1; AJvYcCWo6L6Uu7E5GGoFWO48IeZzUqtdKJRWbabKHU4DjM4hUzCZnE6XDEiNFA9RKwU4Ojj63QWHZ0+sIG3F4oA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh97seo5aBtO33exY8ve6UnTrcjcPULqLVL3CyKg2UnMCwI0mB
	FJjw4bMXgKT5uxCKM51/Hz5+K9eAFy7javUF3ECfvjsDe2OapDaxgoFd9wo2m/KnNno=
X-Gm-Gg: ASbGncvYGkX9RTkSsYRPtp+LE/rLMbdzwZ36NRLS6RcJfb9cMCKC5aoPBAJL5uEceky
	DgcM9Xq98mv6hxdSdnRXu4Qy7iL3niipb6r99UNgpX1cs5c1pIE3HWopyJDb9CD7SQ6Ie7TgdUg
	iipiuBITK98sbUO7ROrp83KETZpvm20F31GJZYTi6ag00Bf8a7GXEhOQJhYTTSYd4GV4h04JVZe
	3GeqvOUEz2yuryFYSTkl/F5MFv/Z118C/un7yb1DHdsq0ZXyQ8xgUjHGzYGMfhV90dUesu6p1pr
	VbhngcnwsJKosjqGYPkQtvdSn9z1P5rIBT/oQUAniEv0igH16LXWNS9U
X-Google-Smtp-Source: AGHT+IFSzUejJlK6IyeUiW5zE5+TQka18s8fQhdo+fmao703u1gkkqQvrjQHaT6gzH2kW/rpvnpnig==
X-Received: by 2002:a05:600c:1d07:b0:43d:9f2:6274 with SMTP id 5b1f17b1804b1-4532d2f2d85mr28726825e9.14.1749730799508;
        Thu, 12 Jun 2025 05:19:59 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c229sm19636035e9.6.2025.06.12.05.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 05:19:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 14:19:53 +0200
Subject: [PATCH 1/2] pinctrl: cirrus: lochnagar: use new GPIO line value
 setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-cirrus-v1-1-2d45c1f92557@linaro.org>
References: <20250612-gpiochip-set-rv-pinctrl-cirrus-v1-0-2d45c1f92557@linaro.org>
In-Reply-To: <20250612-gpiochip-set-rv-pinctrl-cirrus-v1-0-2d45c1f92557@linaro.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, David Rhodes <david.rhodes@cirrus.com>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2693;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=5iiQBlbQb60z6cXs+sdVO0QLuKZEA2otl1hVZPVSDYw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSsXtVAvnc6ZbsECs27O/Tk+Pzm16vppENAyoY
 5F5Si3P6UGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErF7QAKCRARpy6gFHHX
 csI+EACJogamuAI4Vo8DWE05XtYE75MJ+nfVzg08xvIgWf5oRbngyJk5tMligI0XJg63UEZQQsh
 aCzMiQS6T4in1wgfm9t40C4UinDe0gipPIdLfh78h+SFrl8PnT8k/m2moi0k0A8hV/MQFB8gm1U
 kqz20zH2maRZRrx5Um+kGrjQ2FmtIpzetlfSTssthDqvUVYD+48icdY1QUc0FSl+SgGLWWKf2IL
 wXJJXEO8/PkOqldIlIdUhiw1fhS1wVPG1s+HqgGtgtdE+30PLJOVFRih1Svh6l+F5/S/cucX6ek
 fNO9Ht+lgX/0Cwg1/wp01zzkEKus2eSYJeDUiUnG5wPvZyvfvZfSG/7Sv2B7JzK7wNM1MEkETnV
 VYxpvSQ7roV3rIDvPkgUKiSIIlz6kGBITt3gAYKpDy0rx78IBLWd2JkxkTvxuc3Ki3bVD5c2nuY
 6V+xGhWSi7cW87/UUiX195l55IJ4bJxWTw4aRoMLB5PV4ToQpjegPVfgdN3Wx6JFs5xhRqsIZ3r
 macJyRlB1ZzbZ7mrEvKpFD8R0wwcMuVpzmhJD8o72XFv8vWKCtRzBH8qfgpROi7mdPRttx6VCxV
 Z7dhxhnlQVcJfNSvaDewtlOsLFIDRxnSSiiO0k8uhk9dkIxV2iFTGDXy5Yo8qAp3ZqIweR4gmDT
 sSaEo63pReCpuXw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/cirrus/pinctrl-lochnagar.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/cirrus/pinctrl-lochnagar.c b/drivers/pinctrl/cirrus/pinctrl-lochnagar.c
index 0f32866a4aef2c84b99f3c56374d8dfd9150b024..dcc0a2f3c7dd56d3975c54ef3dc2726b938e4480 100644
--- a/drivers/pinctrl/cirrus/pinctrl-lochnagar.c
+++ b/drivers/pinctrl/cirrus/pinctrl-lochnagar.c
@@ -1058,13 +1058,12 @@ static const struct pinctrl_desc lochnagar_pin_desc = {
 	.confops = &lochnagar_pin_conf_ops,
 };
 
-static void lochnagar_gpio_set(struct gpio_chip *chip,
-			       unsigned int offset, int value)
+static int lochnagar_gpio_set(struct gpio_chip *chip,
+			      unsigned int offset, int value)
 {
 	struct lochnagar_pin_priv *priv = gpiochip_get_data(chip);
 	struct lochnagar *lochnagar = priv->lochnagar;
 	const struct lochnagar_pin *pin = priv->pins[offset].drv_data;
-	int ret;
 
 	value = !!value;
 
@@ -1075,29 +1074,31 @@ static void lochnagar_gpio_set(struct gpio_chip *chip,
 	case LN_PTYPE_MUX:
 		value |= LN2_OP_GPIO;
 
-		ret = lochnagar_pin_set_mux(priv, pin, value);
+		return lochnagar_pin_set_mux(priv, pin, value);
 		break;
 	case LN_PTYPE_GPIO:
 		if (pin->invert)
 			value = !value;
 
-		ret = regmap_update_bits(lochnagar->regmap, pin->reg,
-					 BIT(pin->shift), value << pin->shift);
+		return regmap_update_bits(lochnagar->regmap, pin->reg,
+					  BIT(pin->shift),
+					  value << pin->shift);
 		break;
 	default:
-		ret = -EINVAL;
 		break;
 	}
 
-	if (ret < 0)
-		dev_err(chip->parent, "Failed to set %s value: %d\n",
-			pin->name, ret);
+	return -EINVAL;
 }
 
 static int lochnagar_gpio_direction_out(struct gpio_chip *chip,
 					unsigned int offset, int value)
 {
-	lochnagar_gpio_set(chip, offset, value);
+	int ret;
+
+	ret = lochnagar_gpio_set(chip, offset, value);
+	if (ret)
+		return ret;
 
 	return pinctrl_gpio_direction_output(chip, offset);
 }
@@ -1160,7 +1161,7 @@ static int lochnagar_pin_probe(struct platform_device *pdev)
 	priv->gpio_chip.request = gpiochip_generic_request;
 	priv->gpio_chip.free = gpiochip_generic_free;
 	priv->gpio_chip.direction_output = lochnagar_gpio_direction_out;
-	priv->gpio_chip.set = lochnagar_gpio_set;
+	priv->gpio_chip.set_rv = lochnagar_gpio_set;
 	priv->gpio_chip.can_sleep = true;
 	priv->gpio_chip.parent = dev;
 	priv->gpio_chip.base = -1;

-- 
2.48.1

