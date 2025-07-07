Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0223828A407
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 07:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751874634; cv=none; b=eQQu52bHQVXbt7VKtcnqX7T3nWPHk5FcmHa9Yv3KZ0aB7MW8dm4b2o/92LUyp9QMO3Kkomh+G9syoDYiHfMMwlUTq+/+6w/99l9IToVdQu2cbdw1AJv82eXD/bnHIfoCSV4Hc/iFYLxnMFMtaSLavVzeyHcdtqVoudOYFzmISWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751874634; c=relaxed/simple;
	bh=7ouLYNojBK8YtI9q7Mvr6a4rawM5cEtpGwkrd35ZmBo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SqU33LoDcuH76AJBorCbVU/pnKio7jf0SVrVwVOEuN2EblC6TNCT145i7sIyr1lM0F1EYfVcyT7BiekvBkNpzU+mLTOawI/Zhi+VRVachYLmr4w3qi4WpYgV00WUB230K9QPoObFUYgWKPOJCBuK8uqjUV+Iy/glRPPWMYBfA0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ijLl3wTi; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ijLl3wTi"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so1879534f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 00:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751874631; x=1752479431; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nKIG6360x9EOzMXFyVuOt0+qxmmOCbAUWOq9FvMmdEc=;
        b=ijLl3wTiZpsEhz8QzfQFq4GP2CbLt1KlFp4hFHxcSio3jQ03H0Rzmh/o0zfZyM3pY9
         lzRP8drK1yp0rHiYK4VUaDpWVU1hJywLmVfwZXzRMLt7FFUL66ltFUBtzjbzYgEqsE/I
         oqvSRyzahARe6ymWhxoEYHULLNhVgkUPVOKYGGL93Wj8VKqD/3PtutaXXIrCi2kiwq9E
         8EAND2+hE48lSOaP16ZQCvZlzIHjPj6iCR0L7rW8nEkXWZkae7V1uaBCUHAKTzzg18E7
         tKDLvWXWwfBmtpmGRpATXFUzkw9a8hfJXgxJL2xYiluit94VxMjl/gKSHqkM0Lbm5RV3
         k7MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751874631; x=1752479431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nKIG6360x9EOzMXFyVuOt0+qxmmOCbAUWOq9FvMmdEc=;
        b=wI+yVOY00o8Glja/LbWXLDGUIPBvjssFpW9IeoiKi77vg/zKClzulXIg9e5Vl3eA9Z
         TyrxeD9aN7bRBRUmKHAS93R655Ho0Khz/5nno5vg4SA2wwBsOixrANfoL9ZvgjBLCdXI
         EadFMtG5GvkrvhhBRpQvhCrKHNRFSL0uvIe87E8fudUOpHniTUSO9X/NS0xqu/xGIAcg
         5gy5PykXHB6BRmFModG+5YHRU3cAvMsIMhuRVnquj0XalfQInBFzTmg7P2+ooX/r1Rde
         0jEerhF1Qju1jfibH5XxyoaYy35R3Ii6yNN0I1gkkFpJEWHWEwTN+vk3A+UUNB2otw1N
         RG0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUuCcjG2Fwz29GfXO6jBm03f2VK7NmdZLLXHuEqupc/qPwYpXCnO2sFUFsAwEkg5CKfI+YIO9IYsDaQcBI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMFWfyhEigHJWr7JIEod2w2BYYYXBbYItaval/Rp7gc8mq0JEW
	Xfc3XlZTDd6DCywcD4CK/1oSM+KL8CIXMt142DXM1Mbd54Q/AzpIABzjdal1JfLAepY=
X-Gm-Gg: ASbGncv0U7QOLYnEarQqoOaO3UFhLo3jyp/3oxb5mzzZJyFGCkjBgpmHImFD0vZOdEX
	QY9fyPuw1/JKLSQhfTZzKUvg3z/+PtKFdCrODwXIP82SpCbW0hFQUnd0cZ/7U3QFQ2jFJgPWq+s
	C32i7WV7+jnlE0cTL5Ie+HVFz9XTusdkN0nDgXBxCCBgcZaCxvr22kxZ/oevykM4kHM4sBQETAY
	7jKci2lbsvwiezo3S+vCItv2XXZMHHd372ZYk1Aijaxyf9pny1XMxLpJUM+g9zo5IkLFJMes1cm
	jKNVgmhIExbPdp5NmXWs6V6OmhXchxpaYv9K/k17RCeBX17HVGqmfTJn3D1n6m76bck=
X-Google-Smtp-Source: AGHT+IGnSqLeLz4f4OlYPyWFl1B12Re+pZQxqbUbOij/xJOfJOGrlBFuuxidA355YJED2LEeFyFJGw==
X-Received: by 2002:a05:6000:200c:b0:3b3:9c56:b825 with SMTP id ffacd0b85a97d-3b4955895fbmr9795564f8f.22.1751874631294;
        Mon, 07 Jul 2025 00:50:31 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3cf3:a61f:85ed:69db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b1893479sm104215455e9.39.2025.07.07.00.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:50:30 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Jul 2025 09:50:21 +0200
Subject: [PATCH 08/12] gpio: twl6040: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-gpiochip-set-rv-gpio-round4-v1-8-35668aaaf6d2@linaro.org>
References: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
In-Reply-To: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Viresh Kumar <vireshk@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, linux-arm-kernel@lists.infradead.org, 
 virtualization@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1686;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=WdoaTovljRVdfcPXoOOpPCv/dUUU3fxtmp6eCVydmWU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoa3w7TnJ01R7z2+UX47L227yzd8aywcscqE3m4
 m+QNrchCa+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGt8OwAKCRARpy6gFHHX
 chuuEADWLZ0PhkJxuIIyFZpFqaQyNO+F2toxso5+gZ3uWKMxU46ds+vGbE/iA7kMN9669g+9rLZ
 C/K5a6cwcsdBh/kjSJXGC2cFI3B3y2rJgdLl2BdKowgiSFuXKgE1wg9ZtDdFfiMeaGfdzTN8wSd
 1X5x1jmE2/Dq5yPn12l7WoQrILfZMgB60shK9eXFPgFp2iL73Bk/wmah6skSo0ur2g5j3hSd+rV
 wa934N/PjDweLSFnkdaHjmSwTjPEZNPCaHW268ZUda/xhgcE1tR9XjIaSkYJKhmd4ga+Mk13fyp
 IkLIcd+6osDn7hDo/noQL3p5pkJRarD4wQ0pqR8ChCqRLqJb1OURx/Tl/Q7akeXtHetpp1O7rr2
 HbjxlvJ1hewJJg4qSvUsCHcUdrN4aDxpAtIy7TFTz+p4dnVf1WW0SrcJlgxBwjQHkwllrf+FYTc
 8MEiSlKjzg1qw4AGnMIm62hECJHxHyaAU2yjM3ys8p82rajD0BfXUYQqXcGZXV0dLxv6iVbSSwz
 0yq1ZKlyjplFPa9G4x8GUP6XGsN73FRba6S7CRO2yuXeEWR1yCKnudofXyNSdltRl3tn5rAfh/A
 va4XB4TxLbdGZ74JTSeh+UCzg77MjlSMZWwOnku7Y8m5+E+6otkV2Da6/OULGTFs9otJ7Rn+wH+
 tCPE7laRozoAEJA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-twl6040.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-twl6040.c b/drivers/gpio/gpio-twl6040.c
index b9171bf66168f054e9eddef8417bef6d8f197f3c..b9c0d54d12f43242444f12a2bd8b6988d1511466 100644
--- a/drivers/gpio/gpio-twl6040.c
+++ b/drivers/gpio/gpio-twl6040.c
@@ -44,7 +44,8 @@ static int twl6040gpo_direction_out(struct gpio_chip *chip, unsigned offset,
 	return 0;
 }
 
-static void twl6040gpo_set(struct gpio_chip *chip, unsigned offset, int value)
+static int twl6040gpo_set(struct gpio_chip *chip, unsigned int offset,
+			  int value)
 {
 	struct twl6040 *twl6040 = gpiochip_get_data(chip);
 	int ret;
@@ -52,14 +53,14 @@ static void twl6040gpo_set(struct gpio_chip *chip, unsigned offset, int value)
 
 	ret = twl6040_reg_read(twl6040, TWL6040_REG_GPOCTL);
 	if (ret < 0)
-		return;
+		return ret;
 
 	if (value)
 		gpoctl = ret | BIT(offset);
 	else
 		gpoctl = ret & ~BIT(offset);
 
-	twl6040_reg_write(twl6040, TWL6040_REG_GPOCTL, gpoctl);
+	return twl6040_reg_write(twl6040, TWL6040_REG_GPOCTL, gpoctl);
 }
 
 static struct gpio_chip twl6040gpo_chip = {
@@ -68,7 +69,7 @@ static struct gpio_chip twl6040gpo_chip = {
 	.get			= twl6040gpo_get,
 	.direction_output	= twl6040gpo_direction_out,
 	.get_direction		= twl6040gpo_get_direction,
-	.set			= twl6040gpo_set,
+	.set_rv			= twl6040gpo_set,
 	.can_sleep		= true,
 };
 

-- 
2.48.1

