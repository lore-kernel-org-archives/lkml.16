Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636931F3D37
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 20:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738355091; cv=none; b=txKW7csnJq76uleT7RZbrIREuzh0T9+yrIyDOeN2yH/pdJjeUXY5iZE2CA2NtlwFUYRIx8WGyDF9etbmJY9oY/vlOl698afi+dQlTp0T+E3Nxo+Uegux/UUeuHGnJZZor7ylmetfTF3o8mIQMUXvP84rdgZUStNz4JPvKJI+wTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738355091; c=relaxed/simple;
	bh=oe7N+J9cytrMnLNUSaM/Omiuuu90wAztekXP99d069k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ruy+VY6o/V1QDnmTj5/KNZaicOuKgc/gwisQ3OOSLNJSvle/lyevBcDue3vbsjE//fmV3Q+g/cN2KqJilvFAXO2zocQGq1nK27PQKYlbjyIWK+usb48aVG2Lu8osu5wCwI37dm55tn4rdqanrX55S7/r0Xvudr6wjEAffJe80uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ueZMN8Jw; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ueZMN8Jw"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-2a0206590a7so1322859fac.0
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 12:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738355088; x=1738959888; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VExoELcV8x0LQmV6C7xp1BlVeCvht+mgfIMccHi3FPY=;
        b=ueZMN8Jwvfxq+NQV2mO6jeS6cQV/cLFNjN5CTUYEa6sBTQguN+LLIxjtEH66QaMmTv
         XaCz6U/OOKgomm2+nMFBh3Jq0MDvqnML+yfPSg+9kiIMSTzypHAweQ1bYTTu+3SJrcDL
         vZylBg681V64dP87Wuzi78d0D7c2GNNuGOdiHWrZAluukTm3GzBeMn2N9Ghv2m+O3Hbm
         ZKkFmBJjdgeHQCcdgi54aa/LExPrwHyI+pTx+2dIovWscRu/P8n7+X/MXpEQENZjzJy3
         cr4AVI8IM5sgwc+kmRMXyAXLwJS2HVPbD2CEKjvnhbEYUC/k4CnpdgzfO9JddltaCvwo
         Jh5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738355088; x=1738959888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VExoELcV8x0LQmV6C7xp1BlVeCvht+mgfIMccHi3FPY=;
        b=LJQJff7d3AITWTFC7b64Hb0B268BnOMe0xAXac21PxRf+HMVA79Wu7zeJtCiE7jQDh
         2YBxCPfSng+cU3ki1tIac0t8amiXVG9QqEHOysdz/WpK9U7gsn8kJucsW0l7WnSZvga2
         7Vxyhqp4dfXpuEMwhP2KSB5CIVFaY5jYyp/yhOJwFWFqRdk9Kh4b5vcWbhcWhsmD/gEO
         yoQwjqrgDhT8DlhJF26dZORigbFcY6VFUkClOmfD9vBSPaT2Ft4eSiO2zhdbQovHTcIH
         bbZu9SGR8ckjqMJUo/PJ71V727W3tc9RW0ahq1tpSlKVWOHkXZWHRgGvL/KCV5MV31ZB
         bAog==
X-Forwarded-Encrypted: i=1; AJvYcCUMLgxOZ8l+j/+cCCR0nWWkWkpvL2nQCzXEbOf6VejRlXpZiKTQktCD8HPJ7yZLoZRIVYS1ftxJKfQOxOw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUZ0AF4AN+TQ/3rZSzOAsCcvJNYTsXlBKb9cLy9mWRnEYvSm/i
	qbWdKSIzREmhL4/VjIUMoCg2HhSIw4DtLlJara0VLGLs3pnkoRjmr+TP8V6pErk=
X-Gm-Gg: ASbGncvZKUe7NhDDToNF4yINWxNec9sitJ/zTaZWUouQzzP2JV0yE48XcYrpM/jMz0P
	cImRBvkkydmcy7JwRzYDuhfGgYvWH76yiuMw3c7JU8mU6WLLE5qu+lx2BJWfvwFqAQ+Mp4Memt6
	vLbVqLPRIPY43Ur7dFDe32CR4VSVSXkuVwFfsuGpTUKUwkDckhTjgsOO9pe7Fi2FXaPzC9YoHW/
	7IG73Zp455pnUwzCnF9GcxCwWqeXeyweQo583llG2Fwow6Kq5dqPBGmndZ81El80OMTf3mntf9I
	gG5/DsbNpd9RO8Gz75tQZlOKAJlDP5XdWfMwiYfYp6pGFUg=
X-Google-Smtp-Source: AGHT+IG48amD1C5d4QahkI7FJNfsOoMi2CtgfNG8+gnzn0CcyJBNzM/PkTQMiDNqV/T79ZK3cKZLjg==
X-Received: by 2002:a05:6871:a012:b0:29e:5297:a2a7 with SMTP id 586e51a60fabf-2b32f3ca389mr8811438fac.30.1738355088436;
        Fri, 31 Jan 2025 12:24:48 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b35623d2ffsm1403157fac.22.2025.01.31.12.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 12:24:47 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 31 Jan 2025 14:24:41 -0600
Subject: [PATCH 01/13] gpiolib: add gpiods_set_array_value_cansleep()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-gpio-set-array-helper-v1-1-991c8ccb4d6e@baylibre.com>
References: <20250131-gpio-set-array-helper-v1-0-991c8ccb4d6e@baylibre.com>
In-Reply-To: <20250131-gpio-set-array-helper-v1-0-991c8ccb4d6e@baylibre.com>
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

Add a new gpiods_set_array_value_cansleep() helper function with fewer
parameters than gpiod_set_array_value_cansleep().

Calling gpiod_set_array_value_cansleep() can get quite verbose. In many
cases, the first arguments all come from the same struct gpio_descs, so
having a separate function where we can just pass that cuts down on the
boilerplate.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 include/linux/gpio/consumer.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index db2dfbae8edbd12059826183b1c0f73c7a58ff40..1c9bb3cb1ee80fe52aabf5bd24b1d128eff2bc99 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -655,4 +655,11 @@ static inline void gpiod_unexport(struct gpio_desc *desc)
 
 #endif /* CONFIG_GPIOLIB && CONFIG_GPIO_SYSFS */
 
+static inline int gpiods_set_array_value_cansleep(struct gpio_descs *descs,
+						  unsigned long *value_bitmap)
+{
+	return gpiod_set_array_value_cansleep(descs->ndescs, descs->desc,
+					      descs->info, value_bitmap);
+}
+
 #endif

-- 
2.43.0

