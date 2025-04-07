Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D56022A1C0
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010720; cv=none; b=MyqUeN0o5i0j/H4k3R/TfVRVpTPLp3tGgCe2jZddrv1AkIpYdEIDb7FF2G5UbwX31eLoVtOTGNufEOHQFWPP2pNFspkmAPC+TX8U8wW5AOH7tlz6gpFqARqFb8jR0jor+Qep9kc03ynqRpc2kAQlvGY/+TmWTnogCmpJ1/LHdFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010720; c=relaxed/simple;
	bh=Prc7ZQGfNozvrtOxILubIzCFpEeilKn7XV651voXe2k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jj3KzRDeBy5Gy3F34uKuS8Uw5kAsmupLzKVbdeQB6dICXFEExqzbML2ZQ+aJ/TYHstZFhHyTz4fywYr0pU8T/PVsR7R6UD/KlTqGCLbpz3pdOZZ6gr6CKKRjd9aXFK0u198T9gIspfql/IJy6J022jyWpRoa3AjkR9JXzNivvVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=TLT4cirI; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="TLT4cirI"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso43439665e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 00:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010715; x=1744615515; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MnVN0MpczLkEDgwadDfeBqxEW1P+A1QSp2nDzzdpi6A=;
        b=TLT4cirIMmusAA+xoZOgjMbPCQgIfd8DSBvmkB2cZj1sNrppdsE3UVrT0N7FF8HrFX
         POob1GlzRRF+9nLR4Cb+SlqLBUWm69WUBPq6/6Q52SbbdKhl4shfhl8ap9hiXNsoxXs7
         gsogOXownA/0tnGuHF3Am9BjzkDUnEOFYl9wu0yKRP85tdHmGXRddeyWB94F/igT//Dv
         h3ONY7ksh7BcXUrM0IZPHpSstvMYl00LyZj4AUla4jeM6y00hfqOyUQqeAmp/+ngCX7c
         edbshTUKLHDhhzxhSdlESzWPJeyDPA3R3wqD0ODXr0UZK/SMk0854Fs7trI5JICa4tyP
         hM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010715; x=1744615515;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MnVN0MpczLkEDgwadDfeBqxEW1P+A1QSp2nDzzdpi6A=;
        b=JDR/GbfAh0GtSKpIQsopUE/EVG3bgUgOePwkY/hbUrW04LQz1voXyWmSEe0jcyVXIV
         D0/Ek1c0imSc7s6JAcveEPVe5ZQ5NMzqw6LpDBrY81KLhBtDtTM/MUKINWZyLfJOIbME
         kZ5+qvokbsLtnCHhLq/H3J3hZMBdQlJ3sV35AeyFD0fvmiAafxmk/nUOSwpwDjNWn6JQ
         rDjRs/ELn5L21V2GQMUgXNiCit9BYo6MHKMsaYIov7i8MocFL/wkDT7s90p6RnbArBgi
         2+a9XpiIWmBPhaqTxH5wnpPhfN7bp435ksVs1sqBHTPRJAMS2u9Y5Qd7Zkqx1oky+D2V
         RrDw==
X-Forwarded-Encrypted: i=1; AJvYcCXvz2FApxei39LyNdzH56NNPeApPv5zE2bALQeuenbvWRBf/oMBhhVzbWuCBNYQCkRkPnOgEnju3/Y++UU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTsA44v9ZLVTW/4EVusHxPyRpFYuPdLrZueIf+vLAu72x8hSDD
	9iun6pxoo6eJ9eiJB2KaTmKFqWydHfoj4G1+hgxWYEFC+zhPcToUVxQH8v+rATo=
X-Gm-Gg: ASbGncuP2ln8rC6TLlZIzo0GAg9gXde+RkDeBBTg/jFw1s0vBcJAU2VRyf2a40U98ii
	07jTos9jVX9GPlFkPQDeGlfDoYdF8aHa2Xbh3lvNDq089y+1ZKfg8j9CCF2RcwmmcUp1qKHu/mY
	atU2TtfZ8O7X2QOj14aZyzR08T8xsKiNmOQCoGZnfia8MlMfBVidWcji2l3z2H+PgXlhZaFUONb
	C4dLQCrxLUeLkOz9L03GhvBN3+R3BQcbctE/IB+spZPBBx/BAHWMwsUb4PNpwep5PVjc4YE6pax
	raxFYMELFvYTwmL9Oa9cdJsOjxH6AIwtfQGF0g==
X-Google-Smtp-Source: AGHT+IE/f19AoM6Az3l7Xyqer3FX+ieZJNJDpM/zL32nl3jIO6y4wdzTUjtoUC0Le+JSSZIAus27UQ==
X-Received: by 2002:a05:600c:198d:b0:43c:fb95:c76f with SMTP id 5b1f17b1804b1-43ed0bc78b1mr80887705e9.9.1744010715516;
        Mon, 07 Apr 2025 00:25:15 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b760bsm11303051f8f.55.2025.04.07.00.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:25:15 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:25:10 +0200
Subject: [PATCH 4/4] MIPS: txx9: gpio: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-mips-v1-4-e7f74a4eee2b@linaro.org>
References: <20250407-gpiochip-set-rv-mips-v1-0-e7f74a4eee2b@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-mips-v1-0-e7f74a4eee2b@linaro.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2783;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=RM83TMmttGBfN8Aws0eTMuJGsdWJN0kaVhypXbBAAg4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn833X/Jd0X+RdsM2OyLYk7AxksU5N4I7QxAzzl
 HTkTxiR9g+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N91wAKCRARpy6gFHHX
 cu+1D/9pMXIAQ7FZrn4LHNe4zoqyf/Kdy+6SR3MUywhlpohBD+P3UVHlLEDZq5eyqX3IVSzSS7E
 J/vwroiJoR+BNtVwtDwYk3cboLS12Fd9zA5kjV3LKKKdd8vn2DSHbKFJYLCEgfq7xc1Aan3kiui
 4fD4yoHW5+u0E7HKzCVajx2U/+wFe0Sww5ygsRcHOT32RgbloPmEo/T5lPF2BgtQqfj26Nz2Hgo
 WIRJAKRx9J62DJ5IhUvY1UyOiPVY/5HxoqOTVWRmec6FOb4o2oRuBNYswOwYCCKgMdEU90PT8x6
 Ot7unxi9yiHobYm0UzJLX37L+qeShJN+yzacik22tqY1bL8MwHnndx7I2Vq0N23HNet1WjnEtkW
 7TAUvTTi6uv/adUdQ7WjYlXoTFUMN+NfZQXREh7eeo0jt6SW2dx6ccpNIFqXeFet9ndmIGBWNzb
 3wR59oBYe2XPOZbbbiEboZ8Vu3gQoFXMQM0g5zMNfgcp+c9J0bS7b9aGF5NKea6v7ldKAq6nnyu
 OnI4lawlw+XWVYlYGjbzjNYNJyoBUw3o0JWVvpkDXgurUKM1m3IXtLKr0dnhnSUwzpUP+JPkm2a
 17YTr1kuyWkfwMqaaYu5ut/MfuCutas0FjaFjXiSOQQ+DCc5AuOHBjiYJuWqrTbwnuBVy7l1tpT
 LOcD4W8XyhcXFkw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the drivers to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/mips/kernel/gpio_txx9.c   | 8 +++++---
 arch/mips/txx9/generic/setup.c | 8 +++++---
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/mips/kernel/gpio_txx9.c b/arch/mips/kernel/gpio_txx9.c
index 8c083612df9d..027fb57d0d79 100644
--- a/arch/mips/kernel/gpio_txx9.c
+++ b/arch/mips/kernel/gpio_txx9.c
@@ -32,14 +32,16 @@ static void txx9_gpio_set_raw(unsigned int offset, int value)
 	__raw_writel(val, &txx9_pioptr->dout);
 }
 
-static void txx9_gpio_set(struct gpio_chip *chip, unsigned int offset,
-			  int value)
+static int txx9_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			 int value)
 {
 	unsigned long flags;
 	spin_lock_irqsave(&txx9_gpio_lock, flags);
 	txx9_gpio_set_raw(offset, value);
 	mmiowb();
 	spin_unlock_irqrestore(&txx9_gpio_lock, flags);
+
+	return 0;
 }
 
 static int txx9_gpio_dir_in(struct gpio_chip *chip, unsigned int offset)
@@ -68,7 +70,7 @@ static int txx9_gpio_dir_out(struct gpio_chip *chip, unsigned int offset,
 
 static struct gpio_chip txx9_gpio_chip = {
 	.get = txx9_gpio_get,
-	.set = txx9_gpio_set,
+	.set_rv = txx9_gpio_set,
 	.direction_input = txx9_gpio_dir_in,
 	.direction_output = txx9_gpio_dir_out,
 	.label = "TXx9",
diff --git a/arch/mips/txx9/generic/setup.c b/arch/mips/txx9/generic/setup.c
index 1e67fecd466e..0586ca7668b4 100644
--- a/arch/mips/txx9/generic/setup.c
+++ b/arch/mips/txx9/generic/setup.c
@@ -603,8 +603,8 @@ static int txx9_iocled_get(struct gpio_chip *chip, unsigned int offset)
 	return !!(data->cur_val & (1 << offset));
 }
 
-static void txx9_iocled_set(struct gpio_chip *chip, unsigned int offset,
-			    int value)
+static int txx9_iocled_set(struct gpio_chip *chip, unsigned int offset,
+			   int value)
 {
 	struct txx9_iocled_data *data = gpiochip_get_data(chip);
 	unsigned long flags;
@@ -616,6 +616,8 @@ static void txx9_iocled_set(struct gpio_chip *chip, unsigned int offset,
 	writeb(data->cur_val, data->mmioaddr);
 	mmiowb();
 	spin_unlock_irqrestore(&txx9_iocled_lock, flags);
+
+	return 0;
 }
 
 static int txx9_iocled_dir_in(struct gpio_chip *chip, unsigned int offset)
@@ -653,7 +655,7 @@ void __init txx9_iocled_init(unsigned long baseaddr,
 	if (!iocled->mmioaddr)
 		goto out_free;
 	iocled->chip.get = txx9_iocled_get;
-	iocled->chip.set = txx9_iocled_set;
+	iocled->chip.set_rv = txx9_iocled_set;
 	iocled->chip.direction_input = txx9_iocled_dir_in;
 	iocled->chip.direction_output = txx9_iocled_dir_out;
 	iocled->chip.label = "iocled";

-- 
2.45.2

