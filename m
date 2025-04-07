Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C092D225403
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010101; cv=none; b=l4qCN5tR9Wk22U7CY2wJ0OfyxE1lBsPiEeM/C68FQKVdSYdv+xRr9yRJKzwvb43eeA4Saldpzfk4eJ5P0bCrwF3O4XbL7k1TRBX8QHxx1OBLUOmxkSI+H4U2+2ULZLQcdnWeqYDAQrTz7Zl5aWxcW9ADbOV7iYuX0Y3Uegi1BYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010101; c=relaxed/simple;
	bh=MbweKfDFcHiSBs1x7OoNhsHi066QD9imvaYUduhtZOk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SBQ/W0fdSVp5jeRyEfhv5OzVvtKhPagcMuiUOrQTfpViss6Sk9O9SIe4CyAyh1q9XWh90GYHV4posmzCXcfMQNEnWekXWILELBbafSe5oOmroLlUkz//yZOsRs9NQ7nkXeNhD0Ef7t95o9DOzGVZOwBBA/6KlK7q4gVPl5aOmM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NHBJCgDr; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NHBJCgDr"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39129fc51f8so3136772f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 00:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010098; x=1744614898; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qQJq7bLNv9KR26qv53DN+VLCkGsehwu1X3TDIPfPRkk=;
        b=NHBJCgDrCYbaFuZGMF2HaAeHCHV1m0oqEqcvmlRxSLPTcLwccObx/pQQynHFcQYKAc
         eOCKhVh9k1v7J98fRpUxYd7kVVWy31rTh7YLWB3VQISZ+F3CnWvfDwoFbuff/MGCH+SA
         QkWXJvOaKD+qYZjl2zr7rdiyjzK/MSdZDYDTgkgFZJNAml6y4RPggxvTeF/1lmPwhv5I
         r8762k76nX9tVI9uE4iEB7qlnnizbkgReH6Tnb/F9FfHIM5uIPk9KWF8BDvFH1H71JoU
         2WHjMKa3+j/xSdNIIXF4VIvFbHcnK74zBXqOIuddV0NnNBIQn6lO63HcbDOLvivPcFnD
         lhOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010098; x=1744614898;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qQJq7bLNv9KR26qv53DN+VLCkGsehwu1X3TDIPfPRkk=;
        b=s8vsZkM5FVSeNu8OiXd8KLPR4GXoNBCgP06tWLCmDB6mtP1itnYTmgfSazbEppqccz
         pU4I989Wzl469O55ED//EtkGzz0sjCRmoyVvS2Dec4Fs3IwTOOkl3JR+z83aFHC9clE3
         3s8TbK3vBHH2pN3gcvPHFiaQxSgcta/V7Q3ISnzzWpRixAQSvdKh0f+TS53kWxSv3mcp
         atpWPjB1/vO9q9OScdQCkjrxSlV6xsV7zsZNIy2tiTlktXk9qo3wfHpRyWLO7zgNBobB
         5vk8dGlYBNUemctixhM9j+fryGTxPfYF7M5SVURbi1Iq2UVqS0FXvap+FhNoYsZO0ozG
         w9qA==
X-Forwarded-Encrypted: i=1; AJvYcCWgXQOewgy1m6OBU8YKfmadAanVuvUATqwI3S8UQqSnOxB9fmeOMTCXd2f39ITN1qHtRHr2vbELq59nyM0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGKtkpmQmF8i2sI3oAcrv6oJsM1Uk3fpmeSdPQnek4R1orOPac
	d/G4ksgDpT4N+QsT4NEa6y/GjO3D3N4kRpgHw/BhxXx9royGbftRQwL5nbaXr74=
X-Gm-Gg: ASbGncsXBpuvp+sdUu2wuePsQOWVpJiJGnqC/eo0LwG7g0R14iXPyd52XsbFQBgL4QG
	7FJNtA+v99rO0l0qjKUx3IqclhaGhlGd2r9BN6EG3iStYAZhhb4KLa1AWhbaYKlnOTLmWZG0E8b
	0ZeaZ+9/0IZ8RqzgD68Kjm6qto75BvhKJLEvxP1vZ6+qZReY2F2WCZIxqe/lLdRzNFKLTP0JP7g
	qTHPxDlAoWkgFuqeNFbHzgVX7Pt3rlaODOk9lE5CiL6WaLIutuHy0WE6eMEUWiiztAHlRvUL12s
	EGVfoiFA2LJDFp6z2Q7QaZ6Am1qZhLbNnEzDONQ1TEaNj/sI
X-Google-Smtp-Source: AGHT+IGP9iEwmcI9KW5YLuJo4zjunZA/QstskF0EVDjIclE0IgMIg3XGRl/bwqpue/ansqOprhfVRQ==
X-Received: by 2002:adf:9dc7:0:b0:39d:724f:a8a0 with SMTP id ffacd0b85a97d-39d724faacamr4274025f8f.58.1744010098097;
        Mon, 07 Apr 2025 00:14:58 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d9cfsm11171239f8f.78.2025.04.07.00.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:14:57 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:14:52 +0200
Subject: [PATCH] staging: greybus: use new GPIO line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-greybus-v1-1-9d4f721db7ca@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGt782cC/x3MwQ5FMBBA0V+RWZtE2xR5v/JiQY2aDc0MQsS/a
 yzP4t4blIRJ4VfcIHSw8rpkmLKAMPdLJOQxG2xlfeWcwZh4DTMnVNpQDoxC17ArhtG62jfem7a
 GXCehic/v/O+e5wUCf6oOaQAAAA==
To: Rui Miguel Silva <rmfrfs@gmail.com>, Johan Hovold <johan@kernel.org>, 
 Alex Elder <elder@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2795;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=lyZeQa2YMvW1R6DaShLQf+xZvZ4ShyP+YJTcj58/Ae4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83txCrzzqktCdet4fuf9XzYf1ZwcHfntFZErp
 4ADsauyzUWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N7cQAKCRARpy6gFHHX
 crAVD/9D1veSf7MDcWSr/6lqGTLb4aG6bDhwc7mW048pgU9xifNfOp8SgOzPHGGHRX6urg7Z/gk
 yd4lESSeEbkVRk+LdBIBFG6CZO2lcui2De1CMRvfwVi9KfazF8rHM1kqjSGD2XlVi5xxSDCi1FT
 usxfWpsVl2DOYO/Hh7UZ4YXfp1az0nPbSBSagjvtvxNVilWo0FXWS0Nh0E/lfoE7tGZJupTzkX3
 SLaVQcLtSYqtMOWM7U3uLFBm9NRRto74njjuWdjTVzHzlWHp9BxC4abWwUstkHRrc92CsE/Z+A7
 Ika8DzpqQKLXo0+Q4CpHmWDH/NKAjQsXSPnn6KtETA01GEs2f/JDxoTzo+v9oNXXagI+M7GWHKD
 k9z0fCb0lx/Yz1vQ34RDduoj0bJinM5068EedFCEIpRjXCaEcJcmobGrTXuxWHDA1S0RvgUO28E
 Uv6/v9qf0AmYdKBx7qwNpQ9U4kPFcmUH7xvG/RlLfMHSlcbSNMcRnulKXZqIXTKw+oTqkYriapo
 BCcefKnwzNERsenbpiVUVs1gBt0yVDMCPLDXbZUeTdM2ZEKL4k7qcNxuNE7g6UCF+bVD8/Wa7rl
 ntFFQYrgQSOSU211+Su3ufTL1N0h0yjF+6TnWaU85AJKfK/GxikZEjc4C4D6ySOJH10vZqqY3Gc
 4TYOf8py0zESLYg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/staging/greybus/gpio.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/greybus/gpio.c b/drivers/staging/greybus/gpio.c
index 16bcf7fc8158..f81c34160f72 100644
--- a/drivers/staging/greybus/gpio.c
+++ b/drivers/staging/greybus/gpio.c
@@ -185,8 +185,8 @@ static int gb_gpio_get_value_operation(struct gb_gpio_controller *ggc,
 	return 0;
 }
 
-static void gb_gpio_set_value_operation(struct gb_gpio_controller *ggc,
-					u8 which, bool value_high)
+static int gb_gpio_set_value_operation(struct gb_gpio_controller *ggc,
+				       u8 which, bool value_high)
 {
 	struct device *dev = &ggc->gbphy_dev->dev;
 	struct gb_gpio_set_value_request request;
@@ -195,7 +195,7 @@ static void gb_gpio_set_value_operation(struct gb_gpio_controller *ggc,
 	if (ggc->lines[which].direction == 1) {
 		dev_warn(dev, "refusing to set value of input gpio %u\n",
 			 which);
-		return;
+		return -EPERM;
 	}
 
 	request.which = which;
@@ -204,10 +204,12 @@ static void gb_gpio_set_value_operation(struct gb_gpio_controller *ggc,
 				&request, sizeof(request), NULL, 0);
 	if (ret) {
 		dev_err(dev, "failed to set value of gpio %u\n", which);
-		return;
+		return ret;
 	}
 
 	ggc->lines[which].value = request.value;
+
+	return 0;
 }
 
 static int gb_gpio_set_debounce_operation(struct gb_gpio_controller *ggc,
@@ -457,11 +459,11 @@ static int gb_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return ggc->lines[which].value;
 }
 
-static void gb_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
+static int gb_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct gb_gpio_controller *ggc = gpiochip_get_data(chip);
 
-	gb_gpio_set_value_operation(ggc, (u8)offset, !!value);
+	return gb_gpio_set_value_operation(ggc, (u8)offset, !!value);
 }
 
 static int gb_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
@@ -555,7 +557,7 @@ static int gb_gpio_probe(struct gbphy_device *gbphy_dev,
 	gpio->direction_input = gb_gpio_direction_input;
 	gpio->direction_output = gb_gpio_direction_output;
 	gpio->get = gb_gpio_get;
-	gpio->set = gb_gpio_set;
+	gpio->set_rv = gb_gpio_set;
 	gpio->set_config = gb_gpio_set_config;
 	gpio->base = -1;		/* Allocate base dynamically */
 	gpio->ngpio = ggc->line_max + 1;

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250331-gpiochip-set-rv-greybus-cd2365755186

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

