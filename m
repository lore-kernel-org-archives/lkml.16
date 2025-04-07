Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0135225403
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010717; cv=none; b=XWHqMMuM6jG+CLtMYuuvPPUbmJz65cfXlRIKaOR9qTgrnmgRFHzE9KSbA9se5KIxdBqJSnvAw9RGJEZ6nbz91rqDyMwDTSmAVJo1VOZ3OuV99xUQ+2nLw/S334npj21vGDS0BBlaKKIOfDsQnzy/I8cA1l+nt3EmmxW71bIT5kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010717; c=relaxed/simple;
	bh=zPFQTxsu9KrfRO7qIWKrD8w2tFvy9Vh5/igl74bqvnI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gW+6TlTmPt5IipPdZXyGkM7q6Pej3/huy8KqpVVOOmuD9RvVpXCDeWlGo1DVwPp9G+O8qP/hxt6jm4XggG+rUkWCMn0xHH85G9shYC7QLXkExMpPjaebvq5n0+m/Gcakpy7lioX1SRK5zP5MaZK1IP5FWT0Ax8oGUKEightNa4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=QXTxvB+u; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QXTxvB+u"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39129fc51f8so3146063f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 00:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010713; x=1744615513; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WUo/CGbtBVvw4imrMqD2aY6g1pYyX/Iq7KegZMsusa8=;
        b=QXTxvB+uqrbJjQhfkriNvxpXRuqomIeJaFPkTfsXT2O912jk78burkdykkqaDitUQI
         VxtZH6R0j8RoBs0Sqsb8RIG/AvTpcyoTYvQ7OgoenrY0juS5Bjj34WBy1WcHSXaWP5r8
         jJvFwSzsln1fr187X3ZFwrF0r2RGrJla0HULXwXYpA1xWpZSskDN8fzHQG1ySk6sbW1v
         tNfTr9QaARauvlEkDD1XdZNl69uB3zvKRTyVHokAIh337vB6OlL5ZacqMbRvyyycd6Xr
         2NKjc+kTIt8CtZVP1mM0Xgbwkxi6s0dyD7+RNbuv+KxwcqgS8UjWiJh5aCU0+ty5VUB8
         VVTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010713; x=1744615513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WUo/CGbtBVvw4imrMqD2aY6g1pYyX/Iq7KegZMsusa8=;
        b=PxRxpx8B5znhkmznG1gcVbpgYxoOvQlSvPO7oR1+e4HzA+R3ZOlT3xhWGEFMWPLTv5
         ZBueass3iuNrs++15aDOBPfvWb6jPTh31L5DaWKwNyfRtp1nMgUPp1busQhWRySZZEPc
         5fM2a1z0xv7XuJhgaWlgSv+N4eDYchgoPyKQtngMB/MghlWabQ1Bes7NfFE1a+6HHxF6
         XeXTHxu38PD1OjmR7dva3z9b0wkQ2Ck27reqI7CXGp2YPr2O9l9yhBXht1emozHVvy4S
         4Q121Jgf1o+o2IaaIIdfEbNjR+qjx2Hj/btf889hjInC/U3+HbmN2JvWts4BiJL7u8LD
         L+bA==
X-Forwarded-Encrypted: i=1; AJvYcCVyVU7kZuqNjgyC3iubDaiSRIkaf20BFVNgKC3/yxYJpKPr5hry1Y+1b85+RmGR1ql93FHL0PotBH6k0Jg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbPt/hbNEumzJnr5bEl/HimVNjSN88LPy5PzaUaFuOmC2BD4wO
	nCuIHUfRFKEvt1KXrign+l63maLZPE40AyE2s8yDPE28WU/sHaA2v5TGCSa5+b8=
X-Gm-Gg: ASbGncsvPbhO9fYVr1A8ojfwowNkhHXmexl8yK9qdj9sooW/sYhl4LWs3b9KOqHnq3W
	X4+c2BXhtiOTdwhx04fDSkIzdTb/tryPGfu1TMXWMnAHcBUjGVEcCYWeSaTlcTI0cZ9Udcj7hQ8
	DhYXM5ireLjdFHolrhbrDoKMQantBwNDK9YPJulOM7rbDX/F/58HXWmIgrREsHydKjLWwoa4mAi
	boKfHG28FLA8uK4dvsIVKVfxTKPoSN57dZzG6I1HcE7mALz4JzwgGESp26bk/uqA2V7JMqqiN7Z
	bGZzI+8i2uvthu6UmKnpeKRgZOeAEi88nO2Lyw==
X-Google-Smtp-Source: AGHT+IFZIu6StM8ElkRE+r6BIYiBUWx6cTIS/f7UqaoT/hdn+OorxGZiBS8LLsETi1nO8uCS+7rsyQ==
X-Received: by 2002:a05:6000:1886:b0:38f:2ddd:a1bb with SMTP id ffacd0b85a97d-39d0864b966mr7660682f8f.8.1744010712872;
        Mon, 07 Apr 2025 00:25:12 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b760bsm11303051f8f.55.2025.04.07.00.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:25:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:25:07 +0200
Subject: [PATCH 1/4] MIPS: rb532: gpio: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-mips-v1-1-e7f74a4eee2b@linaro.org>
References: <20250407-gpiochip-set-rv-mips-v1-0-e7f74a4eee2b@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-mips-v1-0-e7f74a4eee2b@linaro.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1306;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=uG5xobKQ/BCqBbmPWIob9NsHTVtZMYwi25uBBftiBYo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn833WAv5DpLvQ/18Q2vsoL0ibVRB6cyZ0AoLfy
 goRiAcKusmJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N91gAKCRARpy6gFHHX
 cplDEACpEWXa+/sW0az+OMmWA4dZHqyLntzrc0ZqCvrhHPe/R4wI7JV8uLW74+WppTO/GwvAtGI
 NwOAI3x63sYa6Bw2F9UuVTchSJCKTc7Fu7Jk4IXy5KDqCyM8Rx2K7ZPsJAijoP8AlSnsni9fUmI
 Hby/KNJlIMn8jABhNXo1mwW1MJcUEL55/lzebyuut6OEWud1BQxk9RW8vIq1ipOBf/q1baQAHxQ
 IxuVO0MlPAvg7aJRNbGQNzqZIGAQOdRMyTvVZM0K/MxSL7VydjwjgZlaWKUxSfnB8uZJ+5+INvt
 MdTL0dDHnqGVt65nf2r0yNnFmLVRy6BTBoj7eDU87MXk7kprt1jvPt4KLUp1ywlMoN+mqBEfzP4
 eGwELyWO8AY7FQfwJKU+KW42oam8MLsBaWdzVPVeNx2jRrKe6r/I31ROfwL85Gou5cDEiBhOipn
 X7pks6NXTb1Zxk+mZK9FvE7EzC10P1E4woDAIJWrZ8GBDeMKzQMIoC0jDGnbGmEBP+ZDG/+R+HI
 T2WqB/CxlNNwwmpy2VeS1RPVnRSoDYPIBYIg53W7U6dyKETPwNxsaszkN4A/eTU19/USccW/sCZ
 50dRsahzy0p/McaOlptmTXREd0SyMzxhlhd94EbE0s/qi8BswRxyiOYudjO/bjPho2MOgpa5y1b
 5mZGodWhpbKjmNA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/mips/rb532/gpio.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/mips/rb532/gpio.c b/arch/mips/rb532/gpio.c
index ea6ebfea4a67..0e47cd59b6cb 100644
--- a/arch/mips/rb532/gpio.c
+++ b/arch/mips/rb532/gpio.c
@@ -105,13 +105,15 @@ static int rb532_gpio_get(struct gpio_chip *chip, unsigned offset)
 /*
  * Set output GPIO level
  */
-static void rb532_gpio_set(struct gpio_chip *chip,
-				unsigned offset, int value)
+static int rb532_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			  int value)
 {
 	struct rb532_gpio_chip	*gpch;
 
 	gpch = gpiochip_get_data(chip);
 	rb532_set_bit(value, offset, gpch->regbase + GPIOD);
+
+	return 0;
 }
 
 /*
@@ -162,7 +164,7 @@ static struct rb532_gpio_chip rb532_gpio_chip[] = {
 			.direction_input	= rb532_gpio_direction_input,
 			.direction_output	= rb532_gpio_direction_output,
 			.get			= rb532_gpio_get,
-			.set			= rb532_gpio_set,
+			.set_rv			= rb532_gpio_set,
 			.to_irq			= rb532_gpio_to_irq,
 			.base			= 0,
 			.ngpio			= 32,

-- 
2.45.2

