Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602EE22DFA1
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010303; cv=none; b=fX5goGdPaBT8MWOS16zlNck7CTtv/ir/cvofRr70CzFzo671C6lwCb8YvbslU53pdRtxsNGy+OR3nz0JIy2WisD5r+Pc376/KNU7zGIMP7Wnzw5wtEy33io61dt6Mz1ny205QaxQ+BYC5i0CiBHhtcGjffbSlmEni8gYdQ41wtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010303; c=relaxed/simple;
	bh=pPqlQo3DRiKCcYkAQJQaHw1DlE2TLJ3LSJd2MBRf7n8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YBSqvNmCxfGO3y4gbO9F7oSnPJdPqMl4qQ0sncJ7eYrRxG/Wv6Gh/5tYTaqhpixdVbpcGJ6aPhLiODBDRHTSlVN46R3NyMTF3EGlejsXfWzzPdETTr5NsWHzFomZC8yTFBoTkBQYYhD8rcPnIgO78Uad/kv093wnnQlvnxDQ8T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=g9XNPaNQ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="g9XNPaNQ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso19958875e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 00:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010299; x=1744615099; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iwTUwTMxyTj7zTjMDARLn6ufuL/C/9AMOfMQrrdFbkc=;
        b=g9XNPaNQC4oYWVm+6h9gAbhMNlt10ukp1wIcvu4SNr744z4QPV+paD/6y+LcBNL+mO
         8K5msOvoN3yuPt5BVl4f24CfWLkRv5ILmIeWyZFQfncpP7EMy2A2GwOG91cxJFTIXYA1
         n1PSSml65vvaCmurFfs1ad1KC61zMX3osIkMWGI7KG2hofDmChw8yzxE36niBKS8Ed55
         4Uh17Ycku4Yb/t7Z+II8+Utl8vcw602jtNeoXXHIVnzlh6VFytv4JUoMx7zn6icsFfem
         sATjf8LoHbEF88SMhLrZIQwTvrhBbkeoNmroGgdl1rFLWsm/q+d/9rX8eQm4oq1WwgW5
         NZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010299; x=1744615099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iwTUwTMxyTj7zTjMDARLn6ufuL/C/9AMOfMQrrdFbkc=;
        b=MH5/+77+LKwDP619rblLvtdfzvg34vBtKUDlmquL6A26Gx13IExoTNMcBsS/0xOoY/
         ZU22qf/K9QOJtK45+a+gNdDw0+pEe4A1/9FdskVMqyIpTz4/1cFHWTUyWtjJfPUiwmww
         s13gVrEK/VwCanNbwAI0c2Q0E8R9igOT8C72U8IoFn8OtfIUB8ASxJs3EX5xgZCHvZSt
         ZEpFi6IYUa59yEwm2+ay2RZ8xgIrh3n5CDRw8dgYNhPlVE7jayyMdGgA9ben9105rYU7
         q/Vj2Y8OjbLBP3xLYjYvrgEKeP+R0OP0zXA4++VzY+MNeKzAh1+Gh0ALMfbIehd/MCF/
         pxGw==
X-Forwarded-Encrypted: i=1; AJvYcCWJ4IlMSTGGjRt0Ji98uUTBoTu/2z9SrZ+GajT3lHshOJaBgUlsdvvZD0EBdwfet7lbZvD5Z3AL82f1bws=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqFuWsDtMyrmvSweDCAl1nEW9VijsL0erbzsNegvGdkWSKcGXB
	gipjPt/ABFcwQH+R2yynh+ryxvp/4cauggqezI1RUra5/QIgEaXR/E7SBz/k/iI=
X-Gm-Gg: ASbGncupB8aqhtTwMgXMzV4205k4JE/lqfArAHgg+dyOfAw4brEnJXlJfk6eCeNLeE0
	pGDpTTp0lbwOD1enExTocR7Mt0k6wsL5YPWr5M9IIgn90HCfX0yI+L9NXSN5FEfnYNQn4ZqHSU2
	2Q93iumBlQ7rZSU9Mf0/5B74xQ1RmqraCgek8gvuBVtSN+0SGkLyY13eoToZl5GBKgCPF1w2jK0
	s6iKL50LmRLOtp2WCVXmM9wAQ3PTY6LT3rOXQN9Tfuoc0qKAOJ9hIbtz8PH32xpvc+328jFt92N
	+DKVZ5/X6NWVPFDbb3kWmDqGMjAoojRaMzP5Aw==
X-Google-Smtp-Source: AGHT+IENyUPV18NEnfoEqkpsuV3ny2o8e5zb4W3ikuWG0pOkgQW6APi65lXejXodbaP0Kv+lSKhT4A==
X-Received: by 2002:a05:600c:4e12:b0:43c:fc04:6d34 with SMTP id 5b1f17b1804b1-43ed0d9cdd5mr81345135e9.20.1744010299665;
        Mon, 07 Apr 2025 00:18:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1630f21sm125224455e9.8.2025.04.07.00.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:18:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:18:14 +0200
Subject: [PATCH 6/7] iio: addac: ad74413r: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-iio-v1-6-8431b003a145@linaro.org>
References: <20250407-gpiochip-set-rv-iio-v1-0-8431b003a145@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-iio-v1-0-8431b003a145@linaro.org>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3029;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=BJlj3nSl7FlGTWhuoQWXENcxnJ6fTBwNzUrL3zDx7YM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83wz/6gN2pZ9uZ2J+TYi+fGOTYcTCr9DNcV5+
 qpKmZTNKJ6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N8MwAKCRARpy6gFHHX
 cp7nEACa2YrkHZJCjXew4GaYZASgQgQyOjwAV2GmYwTYK44E+6Aw80cdMUo3tuT4PSZquNigb1O
 nf7NvCHVazoztyDuI3Osn23FD4Fu1RO1UpDQUHTIilQw9SYIHFhTlVFI+UxIPgYDcP9xZON95F+
 /7vzLMsdAnRQlRuytyKrF9CBGha/mdaHUMeEsnn/82D614ulI/GvsTjy++aZnW6bdoQuFEmeOCD
 VslRezlE3Wt+c6nBHDT3fEU/ki3GedAeFuvCTvZFkmaBvtlAqlGf/noKYoAHfwEBUq7X6DRLClJ
 lXKDnYLzQT6Hk6LjVV+J/WCzWk1Y0auf6lK3+KjmkVNwcETajEg+dPiGGlnYAPM7Nj4zmz0GQtH
 r7BCw4blQ8UEH+UNkdmRNmqg1Vrtfr2PjLVumVCgZT0f7WXWShrmuoUJ5UdTDZ2VeGEc3myU04m
 61cjAit6toCB/KeBd6hfQf0LfbvD5fzdCrKcN5Es7H8qevzJCE+/5vir8yLpnCPQQRp+J+n2GVQ
 go9JuCjSZYqHaTXQpNJl36LeIrdRfMMxVBaLCFuQL696lXjLG2ko9gg/xN2w7Z6R2piCd8gx5Il
 xFlq9sf9zFl1/w31j/GR/+XguCtd75ekavgtf1nBdXhOBScmh3uz3fKEbWXRZ3ap+TRa7T0M26c
 1dqfu27ctqfFDVQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/iio/addac/ad74413r.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/iio/addac/ad74413r.c b/drivers/iio/addac/ad74413r.c
index f14d12b03da6..adfa14c4b06f 100644
--- a/drivers/iio/addac/ad74413r.c
+++ b/drivers/iio/addac/ad74413r.c
@@ -276,8 +276,8 @@ static int ad74413r_set_comp_drive_strength(struct ad74413r_state *st,
 }
 
 
-static void ad74413r_gpio_set(struct gpio_chip *chip,
-			      unsigned int offset, int val)
+static int ad74413r_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			     int val)
 {
 	struct ad74413r_state *st = gpiochip_get_data(chip);
 	unsigned int real_offset = st->gpo_gpio_offsets[offset];
@@ -286,16 +286,16 @@ static void ad74413r_gpio_set(struct gpio_chip *chip,
 	ret = ad74413r_set_gpo_config(st, real_offset,
 				      AD74413R_GPO_CONFIG_LOGIC);
 	if (ret)
-		return;
+		return ret;
 
-	regmap_update_bits(st->regmap, AD74413R_REG_GPO_CONFIG_X(real_offset),
-			   AD74413R_GPO_CONFIG_DATA_MASK,
-			   val ? AD74413R_GPO_CONFIG_DATA_MASK : 0);
+	return regmap_update_bits(st->regmap,
+				  AD74413R_REG_GPO_CONFIG_X(real_offset),
+				  AD74413R_GPO_CONFIG_DATA_MASK,
+				  val ? AD74413R_GPO_CONFIG_DATA_MASK : 0);
 }
 
-static void ad74413r_gpio_set_multiple(struct gpio_chip *chip,
-				       unsigned long *mask,
-				       unsigned long *bits)
+static int ad74413r_gpio_set_multiple(struct gpio_chip *chip,
+				      unsigned long *mask, unsigned long *bits)
 {
 	struct ad74413r_state *st = gpiochip_get_data(chip);
 	unsigned long real_mask = 0;
@@ -309,15 +309,15 @@ static void ad74413r_gpio_set_multiple(struct gpio_chip *chip,
 		ret = ad74413r_set_gpo_config(st, real_offset,
 			AD74413R_GPO_CONFIG_LOGIC_PARALLEL);
 		if (ret)
-			return;
+			return ret;
 
 		real_mask |= BIT(real_offset);
 		if (*bits & offset)
 			real_bits |= BIT(real_offset);
 	}
 
-	regmap_update_bits(st->regmap, AD74413R_REG_GPO_PAR_DATA,
-			   real_mask, real_bits);
+	return regmap_update_bits(st->regmap, AD74413R_REG_GPO_PAR_DATA,
+				  real_mask, real_bits);
 }
 
 static int ad74413r_gpio_get(struct gpio_chip *chip, unsigned int offset)
@@ -1424,8 +1424,8 @@ static int ad74413r_probe(struct spi_device *spi)
 		st->gpo_gpiochip.ngpio = st->num_gpo_gpios;
 		st->gpo_gpiochip.parent = st->dev;
 		st->gpo_gpiochip.can_sleep = true;
-		st->gpo_gpiochip.set = ad74413r_gpio_set;
-		st->gpo_gpiochip.set_multiple = ad74413r_gpio_set_multiple;
+		st->gpo_gpiochip.set_rv = ad74413r_gpio_set;
+		st->gpo_gpiochip.set_multiple_rv = ad74413r_gpio_set_multiple;
 		st->gpo_gpiochip.set_config = ad74413r_gpio_set_gpo_config;
 		st->gpo_gpiochip.get_direction =
 			ad74413r_gpio_get_gpo_direction;

-- 
2.45.2

