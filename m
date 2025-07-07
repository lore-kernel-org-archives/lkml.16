Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C1728D823
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 07:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751874636; cv=none; b=aH3XX2TU88mBxZ7pz55tOWwEg7v/bVWdChsLP1g8cG7ij14JaPGJEH85FrhSrbpaqU/VwKUbYqsOfbWg9+c1dDnCv5eWIwquEEKAnpDNj1UTSzsfihbHK2azRV2noqC2olLZNxyQ6a0By9LtjunMZPc8E85sicJ4meq6d48YC/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751874636; c=relaxed/simple;
	bh=bB+qdsup3HKdiJRxvtUZ+z4bOpAuwrIw+6PCi56KZQc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TRnznIbnK1MQaITF16XMy/eFDm928hLh1+76v+FSZqw1dU2y6qlGYhjtoTKSZrSA11d+abUjVTwgD3b6x88oxU/3tF4gDITN6ip/3GhDxQGhNuWGaDpaph3Foy4McdAUdcbE/00jnHzPNaZzz3ZEdovq9d5f/0fEkTgBZDV8im0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=V6husbgb; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="V6husbgb"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a4ef2c2ef3so2592239f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 00:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751874632; x=1752479432; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IrEXsrmsMuzA+1ugG+tl/Uw8h+zTajU0t+jnzMkT9nk=;
        b=V6husbgbwsZh9fIZ6KOakEUxBVr13pKVj9hrOLs6DtLqS7C1NBvt3yqX8BAXLUUEqf
         F+MenZqZeIZomEqJHwthWEPzy+IHZ7joyn4jefxV2T+RTaQZ6ySGFuAOdIIAcdw/Bd+A
         uj401mk3iZjqF552X5WrZ4Cc+jeebHxeTWWRqbf8RauRFxzVqYg9jwXOStJzUqBI120F
         Rf3EPBEfna0AM7LjUrPKsseqlRFpNmGwGw6ztEjZgX7kwV8wRcnFed7lMQl8ZqRqn04C
         Q8MpWJJAX7L1ZROhssUWvj8+Ns+XSjUqX75WYuZvKU74P1PYHbb31cZVLrc5dd/DVK/E
         aB6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751874632; x=1752479432;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IrEXsrmsMuzA+1ugG+tl/Uw8h+zTajU0t+jnzMkT9nk=;
        b=eY7voQChYnJQJ8yxuPBd3GX9GCJfhmIBKsb287GXFtcreKXv81awVOI0XQViGo+3wl
         stP3tGwh2UzYkVu4RS8bD7EBDDXzwQfIO29X/7t9oorJcM5SPCNTkjfJxiHTjV+/2BWC
         X/b2jwcUbaGp8BsFX5MDLwY98L8Eyvboluk7/mPvIayBqV7P8ZCv816vvjQya5jteFDv
         IbRmqoejlht28npA8JM4CWPiQUPNwvqAF3CftGI1/94cR+YnIHcy9NUrFcxhr1JeeO+p
         hLuemRMlDYNZrjCmuUWxY27+tF1NU12lDsMBzY/VLg979E5XiFI19nWMxC7aB20qvz4n
         +pGg==
X-Forwarded-Encrypted: i=1; AJvYcCWZhCzo3h2A3HUYSskb7+gh01PM8o4HC1JxqTCfGuUhfZXTbzjp4hEC0K35Et5ORstKExMQhJ6kMUzZD8A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoIOLWtown8A+UGtcckbou/ocbAgmgpt1EW4WZ/YCuu6Sj4/5a
	D1wjW2pXc0t5lGhrDmQyHl8OemPWj1YFnR/RtBMAwOcWh2sJx72ObQwLeBnonqCzLmM=
X-Gm-Gg: ASbGncv/gNP+5TelPJQrAxNOfAq6Th6jwfS7KSHz+QXh3+EP5eL2dO5dvWVgTxt/EcM
	9JEofJHIdARQiuUTtjNVLerfJFBfdAsyQl+/g3FSCwRiWRMQvbRnE+8BZRK2Eo+ViF6mx4/ciQP
	RuvpZiRKSRZc5XS0m9CC/woOrpMn8M5eJRK9G73iEd0URYqXjn4bUR+20MxC68EUwGdBQlNmo2s
	yi///rys6IaLNyfUrnZSTj+FdTvdchZAeQVwuv0PmVDXJ7Njzc/74+hPxMPYfBQ5WfV6KUKH6Xa
	mAl8W4anWDdtKg8MDrUw9N0CEnydH9DybMyMF+4t+e7hQj2JNRwPmqmR
X-Google-Smtp-Source: AGHT+IHws7BTgvMwOHb/0fBxy+8f3J4P98k7LhETEkFH9aAE9cXx7D21DbjCELzGj9RNQtFyairGWg==
X-Received: by 2002:a05:6000:2008:b0:3a6:da76:38b0 with SMTP id ffacd0b85a97d-3b497013ecamr9654486f8f.25.1751874632251;
        Mon, 07 Jul 2025 00:50:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3cf3:a61f:85ed:69db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b1893479sm104215455e9.39.2025.07.07.00.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:50:31 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Jul 2025 09:50:22 +0200
Subject: [PATCH 09/12] gpio: twl6040: set line value in .direction_out()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-gpiochip-set-rv-gpio-round4-v1-9-35668aaaf6d2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1456;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Ny+P9Gso1Z/D1GfvAgTj4CRCkIVwJInh/rnW4mX9aZc=;
 b=kA0DAAoBEacuoBRx13IByyZiAGhrfDui2kwMyLze1B+VgydmH/CxA8d3hCROGBTtuDeM+EhWN
 IkCMwQAAQoAHRYhBBad62wLw8RgE9LHnxGnLqAUcddyBQJoa3w7AAoJEBGnLqAUcddyJwsQAJux
 AaGxAEjlCH5FUm7Nx9OKDXdHlFxNrkFQ9QNylf5YpMHGmZ30INP3Is5LpN9xuflbZSf4KsYfYpQ
 xk3/uhHjyszowQ8Y3fENt7agn/Bk8GER5L8WbW21wYLgDWNKoSgShgk0DhkwIpDh+hOqZRXzrep
 q8lnDX5prFNHSG+b/63ZD+NovstwhNvVPg+sYHDDJHHmwrXuyuMziumwH9XqXo4xD8b1bxpsIkR
 oABQK6RNtQddFxJCiCCpg92iodNyCeevtNWB9DEKNT0ZAbqsz/k7vyzutCQarEPdpEhLbZeAAuF
 sQ3rp7OZJOaOQ0O1GiJmk5uR2iAaghn63kJsUN0KkA53gY9+154bOtjf2XvdjS9rLyRX1vzF3rq
 Ik1uGkb4XHNmR7IbLxgGiYd/RsLRY+jo4wDAYfPzbU2yQudZDPvxwcjnRCTctgIlRIReri5apYI
 z8eZYANfP4Q35Z+o/JFxtcEAP8PXEPq/V15Q56Q/71E1o80UOYI4JWXhP65jF/ZKj6MHpSmsJBV
 3u6RHZTWBjfMLIZE5dgL9uFk4IMLRAw6GqNC6ZLCWOzB3WQwhY7UnoPLwQRdyHdmAmXt5jfkNwI
 j4UrJMDJL8THSFsjbsnVckdlMdJ6J8O2nZ2zVuaH9zgWLzcnrSsTQx4C/5iiwNhTIUx/zPDc+DB
 REiJf
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

It's ok for a GPIO controller to be output-only but the .direction_out()
callback must also set the requested line value.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-twl6040.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-twl6040.c b/drivers/gpio/gpio-twl6040.c
index b9c0d54d12f43242444f12a2bd8b6988d1511466..b2196b62b528cd0a2df2c4a4c4869ad172d6e2cd 100644
--- a/drivers/gpio/gpio-twl6040.c
+++ b/drivers/gpio/gpio-twl6040.c
@@ -37,13 +37,6 @@ static int twl6040gpo_get_direction(struct gpio_chip *chip, unsigned offset)
 	return GPIO_LINE_DIRECTION_OUT;
 }
 
-static int twl6040gpo_direction_out(struct gpio_chip *chip, unsigned offset,
-				    int value)
-{
-	/* This only drives GPOs, and can't change direction */
-	return 0;
-}
-
 static int twl6040gpo_set(struct gpio_chip *chip, unsigned int offset,
 			  int value)
 {
@@ -63,6 +56,13 @@ static int twl6040gpo_set(struct gpio_chip *chip, unsigned int offset,
 	return twl6040_reg_write(twl6040, TWL6040_REG_GPOCTL, gpoctl);
 }
 
+static int twl6040gpo_direction_out(struct gpio_chip *chip, unsigned int offset,
+				    int value)
+{
+	/* This only drives GPOs, and can't change direction */
+	return twl6040gpo_set(chip, offset, value);
+}
+
 static struct gpio_chip twl6040gpo_chip = {
 	.label			= "twl6040",
 	.owner			= THIS_MODULE,

-- 
2.48.1

