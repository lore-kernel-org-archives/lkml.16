Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D6F2980B4
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558815; cv=none; b=ReIYkXnT5FbdeN1ObGa2ZkrU7WYDtTkV0QbEpHJJrpRvdnBcSDBuQbnW5BPoS5HiW1x1cf2NfAx3AkaAw+kvgOIv+xb1ZXHCWbXk8QAxjc0u0mVaGIdeta5yeQGMNJv9T7fvSvVI3gpFpxY0cZD/lptZEl1QFmVgybk/eNX4BNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558815; c=relaxed/simple;
	bh=Lm78y8CFPM8ZaJ+Z4IY455wU/Cs/n37OItmLKqf9FjE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SFjBTOvDB+DJTHb9crkheLlsHGgw3VTpWFMsJDql07dtFgQs8QE2wHQ2/T34jTnFazXfgHSkkc8s91C3zQ63nQ0GWklftBfDbMhOgUGRdE2anA849ghZ+mCVcyinRt6K71KVuPCjOiiSQfwt6rvBvbJIgph4smKsEmHHCTghJQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=X9POp9IX; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="X9POp9IX"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a36748920cso4817857f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 05:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558811; x=1750163611; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nL73BX48X8AKgopehjQyiYACuD4u/nSLpuXvgAof4w8=;
        b=X9POp9IX/rRhrd1W3QcH3B24uJLBLs4kbUIQ8Euskt4i0QPyIE2rngdaT5bqLW3ufh
         klaRpCEP3l4Ma8L66qEoiUrjOvDSi/uOt0ysPB7ZXmUOhhGDcpIVyKxTaHnJK8GD0uoQ
         e+1JdAEC/+mW4kJ+AGxgCFtfDz5ujNWkZtnd+2B6o94R1uESABM22FV7AR3VdLFHHAxH
         Z2tNJRmf1ZEn96yeXSZ/MuasSA88XINdedbAyFkziTLZRSH+kBp5uMZnxT+HnfPum2Ln
         /C5RRdLGRzDS38Y4vOE3Kkbne60+N1wlA8T4y8mk9qLc9++NIJ93Wk1f+JK6XaQonI07
         PV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558811; x=1750163611;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nL73BX48X8AKgopehjQyiYACuD4u/nSLpuXvgAof4w8=;
        b=wdEFoLHoMzdESGf0gHoifNJbokR9IVkN+mWIykmK5ZOAemyo2QwnCW55OQKOvw7c4p
         mqJziG/aDU23mA+MRttRGJWZ0YRRP/6tLqs8b2pjnvY1OHDj8aSMt4w+9O/mD6oyvs03
         1w8kebZn7Ft9lfjaMsLIx3qL5XHKnXCEZ9nYVoCjlsuc6IbLt6YkZR/zUls16IRrl1m/
         Z3PkmrpZ+n3ued6OVtXdgvHw2+IrPWTkcKN2VbO675/nT9R5i7k9BGPi9J7iVXj3bg/P
         79ZTazuTF3l0rAv6v8FYRvZhzV5wQ23mD2ul1GgZWdmODFGv/vJ2DcUDOML1dC9RJ59R
         9fUA==
X-Forwarded-Encrypted: i=1; AJvYcCU5GSRefnNt1Bk7Zg1oTDAJPlLWcbh1mDU1hWEQa9SOfdgQVgYoGpGeKycUjYmMHT3r4AUqO7a7MMWqrq8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMvNJP98K52giEHpLRoRhpVDik9rG99CHjKlzjw63L7fmkfJps
	bDRkFqKn6JWkqUWcdwlpFdTVSuhJA23pjUPYiZPcw8mdnMbbwUC2INTkkjPGGDE/2kY=
X-Gm-Gg: ASbGnct9Kr2GbfvVzOCDQDnqgMXvurr7PIuVZg/QQDXnX85lnI89sSQ5Po1Qw0cG4ee
	dMGH8/bXKQOGjib0EUgFrReRUIT+HmtNbH5GezO/aegUuLV8UIPrrOLcdRbMNQEuNX2QvAwtM2X
	+aOeZzdigInUtHdjVpEd7X8gfIapWEbqQdXHz3KtoW04BrjgHDmufyyWutd/8ILSQtUSqN+v7N8
	U6n+aFRp9RrdCpEsj+dMjzg4ADUmXOJC5qlrO9tVJXkx6+iB5sEK1eZO5oqXRvyrdFcYm58N5Ll
	WcrIyPvScKv/5S/tBLqy9oq4ZTXJClsWswQ+rVpIvBsXpmCXqhn9+A==
X-Google-Smtp-Source: AGHT+IEiNibcNMiVsbQHF+47L41QAAVONmrgvcTQ9HOwW+eRgKNTCeQ/gU2brhJ6L5+0fDStZI1sQg==
X-Received: by 2002:a05:6000:240e:b0:3a5:1c3c:8d8d with SMTP id ffacd0b85a97d-3a531cb237emr14618808f8f.55.1749558811315;
        Tue, 10 Jun 2025 05:33:31 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243661csm12290668f8f.53.2025.06.10.05.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:33:31 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:33:18 +0200
Subject: [PATCH 08/12] gpio: nomadik: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-gpio-v1-8-3a9a3c1472ff@linaro.org>
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Grygorii Strashko <grygorii.strashko@ti.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 openbmc@lists.ozlabs.org, linux-omap@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1622;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=8SMFcEMP/yadOAddKphU2LRj+bMl3thvtyJ4brm1q7k=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCYPNZX7SmF68qJHpheQB5Bvy2U+bFuaYHRkk
 DPVGcTa+SWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmDwAKCRARpy6gFHHX
 coOIEACRhw6kCcmI6Qk5Uj1hqmX0byLLYekHcBjVu6C0ctu5rgUkddKMjGT6YzbWLvwnGp/o+az
 B7cu6TULK+CGHrcSoGO/JBAtpG0vLkNjQIDPjUr0j75ifLhmeuE0jvgszHFIFyVSHSOdthyj9w2
 rsEmzCLFLsSXCDgBh2oFj2EhfJhxZI8rkjn3ox02VOjRjDrtAt/aEljk/mSrvKj4Tq9biIjCIgo
 o53nCEEkmYf6kgeNtBRKqfNg0ddAaneqdwzZ7Sh25b72vVSBWwaBVZ6d6S/RsrYndL3woYZ87Xm
 /dePA8YZOs3Ectoylv+V7MZcEGuIZro5nVhzeMBOYZiBUXedMjRsm87FW9+ltwQUiAeZfQz+6zI
 nNOeWzApu4vwd0hMs9rtxT3GRXGaQKpXx+mGZBn1Yq80KptRmM/VUbh9rfGHjmet99x9gtRchCh
 2ACbns1aWtM+B5mgT7GFsDeG46pOv50D5+6uuGsTdssLU10ve6GAQpD6S3ks30fY9kQY8/FsvE2
 RKDd5G0DJ4BmukghAk+CEvLjouL/qWS+JDyjagXehsDB16fWjwSmxOKHF+TmaOC2M1uS9qiz5wS
 /6f3WIunj+fATUaxSl5bQdqcPthCVIh7B8BN296a5zC1QRO20KkJF/m6PNIGSKzstuOJNOLhYE0
 d6QPrHLcpkEmVsw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-nomadik.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.c
index fa19a44943fd7ae167079b34a48f669a38ec4ae7..296d13845b3009a52068ecacd8d2d6a25eede9d6 100644
--- a/drivers/gpio/gpio-nomadik.c
+++ b/drivers/gpio/gpio-nomadik.c
@@ -347,8 +347,8 @@ static int nmk_gpio_get_input(struct gpio_chip *chip, unsigned int offset)
 	return value;
 }
 
-static void nmk_gpio_set_output(struct gpio_chip *chip, unsigned int offset,
-				int val)
+static int nmk_gpio_set_output(struct gpio_chip *chip, unsigned int offset,
+			       int val)
 {
 	struct nmk_gpio_chip *nmk_chip = gpiochip_get_data(chip);
 
@@ -357,6 +357,8 @@ static void nmk_gpio_set_output(struct gpio_chip *chip, unsigned int offset,
 	__nmk_gpio_set_output(nmk_chip, offset, val);
 
 	clk_disable(nmk_chip->clk);
+
+	return 0;
 }
 
 static int nmk_gpio_make_output(struct gpio_chip *chip, unsigned int offset,
@@ -672,7 +674,7 @@ static int nmk_gpio_probe(struct platform_device *pdev)
 	chip->direction_input = nmk_gpio_make_input;
 	chip->get = nmk_gpio_get_input;
 	chip->direction_output = nmk_gpio_make_output;
-	chip->set = nmk_gpio_set_output;
+	chip->set_rv = nmk_gpio_set_output;
 	chip->dbg_show = nmk_gpio_dbg_show;
 	chip->can_sleep = false;
 	chip->owner = THIS_MODULE;

-- 
2.48.1

