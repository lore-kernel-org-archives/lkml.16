Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D43E22FF5D
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 22:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738882106; cv=none; b=Qv7nwbUAfQT4EDf7IkDsziIcIdmWJeeB70vrxCUQemhVnzqkKlZ3DYS2MYALJSy+NyNU18cvDj+Sb4PIO3TV7Uas9Yd4zxtH8s14hwOE6DIpp/Zp1QG9U9Yj3oFJPK/c79eAwaAooj35QDYcJvqCvlNks50ixeLdW2BGKI18eN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738882106; c=relaxed/simple;
	bh=P5NoUCJg7G5qsRzfSkKNlCbJJziL6lLPrb5ko7sGuBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CLAg2YE1LcogReEeeDJGEE44dbrHcaNWUq2u5O3iBFA+x0f3aOCKEjHeFnLeahnVebtOEEJlDAY1nGXqx8YX+degirh/hGMyJqo8equCWzoiSI5MMan514zBA/jHGm8edK9Jp/Q5dntIA4oe++cda1ecm9kATtQ12RxTWgaG1Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=qRqu9P+K; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="qRqu9P+K"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-71fbb0d035dso905090a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 14:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738882102; x=1739486902; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kXql2LNKpg2iJS7/BXdVqEWK4gXiK1Iis7jUGxkm/8M=;
        b=qRqu9P+KKhJbgbm37JwvIZaxVM3wMe5XOKFyQ8SedXc2dh73bjTbZuIJjplQyFQ2Xc
         xtLcVaeY4quREaEpy3a9QYzVV5y0KJCVUoZHvwrfgJBZlAKVuyzIa9sqZ930jAcTcSMq
         ruf1yRKFyBxMFCVfHZLIpHFdykj37N2X7z9R9VaqJ8VJMNzg6/SDgY6LdCim1kJUYOr2
         QF46YNItU38/81p4v748JYa9ir/KFX9dvfT/kHhRAXPaIB0coVzMFESFTHosPIiKbAPq
         nGUGkNxXBrsr4hl8IZ+V2058ZqJahSjXlaf/sYp+8gI8GsvGUt8PBgPjdFCJKgeGk7aU
         v7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738882102; x=1739486902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kXql2LNKpg2iJS7/BXdVqEWK4gXiK1Iis7jUGxkm/8M=;
        b=t+P1S/LK9QJoguaPUJfmXQH3Q8Y7DRQXuB28QLdK+TpLuGUntvC38LCKGy2ENVv/GK
         ZQld4fGaH0XNPNcNEg+u2/gKmVKGt5aFhVSHGXqLFFfo2Gjy5mPcAC8+G6NKFO4+c1SX
         fjEVdV9A9F4rEE5QNdWaS0cXfb1w+3JsiBYaAKwJHCUEjUEcxrIT8uK/oTJjdBRonp35
         KgJ+g/gDHzBrnJufQeWWOwiLgbGEkAos4IBgBoHscYj47/y9Jm7SQpfCUTJM1z94ONHZ
         53LtyqAaZsus6Fju55Y7toQkaAYnLE6mIxmIQHl0coKMB4y+m1hpfgxKTTm1ds1m/JlC
         2hPw==
X-Forwarded-Encrypted: i=1; AJvYcCXSUcbZdrpeTqIylIW/alrQPjAPyYc3/lBQMbl64WJxC6RbkRy9MLIKZUbKDPXQ1iqS+NRAVNcVat9pkgc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSoKnf5wDDqKf7ZS7crqCVaVmCJK2+OZ5k+UceNgRZnvDRJufB
	sW7znt8OZiML0NHZ1qhbk21Fxj76/gqO9cYprBGZSCerZJMS5koyDSCNjApcIAs=
X-Gm-Gg: ASbGncsNaNA9waarXPhRfna8Y7Gr1SPglUP+Rnq/FqLc6BdniN3SdckGmB7usZ+/sFI
	QReLiIgHHrUx30Sm9mA4iRykoA9IkbYAdzm0X7pqKDJvnx68EBzPA1KQr7xv4DtwDf/3Yy2hsH5
	lbV0ShTo8O8QZYQE94qRkISbyYnqWqxbZf583JyqDaNfAn4tSCQ8DitDOuxaRH55XtsuVNUmoEL
	Cg79Pp7hawnVUj4Xe37drtJjoivkqX5yUqBszXMOCumhhh9cg//Wpc8UHPkuExHO67IVCNBac60
	0lFwrYaMspQ3JTEEEnF7BIIn6WdMdxrVEJsxG2mH59NHigU=
X-Google-Smtp-Source: AGHT+IFiFjinAKAnXyIV7RGC3+Xe5Ny6G8kVNZ77hCnDk++KNDJly3JOvlipHi0kVubWlIsfK4Ezzw==
X-Received: by 2002:a05:6830:6e0b:b0:71e:5a:f4f4 with SMTP id 46e09a7af769-726b88b89cemr713244a34.25.1738882102556;
        Thu, 06 Feb 2025 14:48:22 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726af95bbb5sm510986a34.41.2025.02.06.14.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 14:48:22 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 06 Feb 2025 16:48:15 -0600
Subject: [PATCH v2 01/13] gpiolib: add gpiod_multi_set_value_cansleep()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-gpio-set-array-helper-v2-1-1c5f048f79c3@baylibre.com>
References: <20250206-gpio-set-array-helper-v2-0-1c5f048f79c3@baylibre.com>
In-Reply-To: <20250206-gpio-set-array-helper-v2-0-1c5f048f79c3@baylibre.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Peter Rosin <peda@axentia.se>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-iio@vger.kernel.org, linux-mmc@vger.kernel.org, 
 netdev@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-sound@vger.kernel.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2

Add a new gpiod_multi_set_value_cansleep() helper function with fewer
parameters than gpiod_set_array_value_cansleep().

Calling gpiod_set_array_value_cansleep() can get quite verbose. In many
cases, the first arguments all come from the same struct gpio_descs, so
having a separate function where we can just pass that cuts down on the
boilerplate.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 include/linux/gpio/consumer.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index db2dfbae8edbd12059826183b1c0f73c7a58ff40..278a197a9deba11dadbff0b58507df91be658f34 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -655,4 +655,11 @@ static inline void gpiod_unexport(struct gpio_desc *desc)
 
 #endif /* CONFIG_GPIOLIB && CONFIG_GPIO_SYSFS */
 
+static inline int gpiod_multi_set_value_cansleep(struct gpio_descs *descs,
+						 unsigned long *value_bitmap)
+{
+	return gpiod_set_array_value_cansleep(descs->ndescs, descs->desc,
+					      descs->info, value_bitmap);
+}
+
 #endif

-- 
2.43.0

