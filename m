Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD62B1F4191
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 07:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751873202; cv=none; b=nEs6i+/Lr60iEqeMkcyycK8SzNepOhYp+rzNY3uowoOqXdx2I67wC56PxtMG3LxlEbF3DoC3vULYeXMNvEOI2OMcXJGEa3PTj47umH+H56dOObTX44sqZZf6+CX+89zYZUpnlh0pJ3aL5NkevEVPr0uQytxUntwk4CBZLz2ZzN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751873202; c=relaxed/simple;
	bh=BlnaHDWN5SbXEMVEI0YLSlyKahI7tFiclh4e7BkSgig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O8HVn4OEtOkpb0H7hU7YIKsn09WGC6DKS6mdR99DuQn/uO1dNoihW9hpBzqkUtc7YOxKOTVMG2ZTyJL8nJgrYUaHRRsZQ8Yk7YfvjXqwpAOrhoTF5Lo5FsvGr8AwR3m+B/B1KGEmt9nMXZKBRCk0AHkamyHd5nkiwPG2LEJCD7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mYfUxOK1; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mYfUxOK1"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so17774275e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 00:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751873199; x=1752477999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+M88naLnUJ0t8QJIK0WbEzaLOGjlUjQqADUu0a4dJSQ=;
        b=mYfUxOK1rfbRm3Dzrzv2Iy10p7w26CBSJsQpnyKQdy0eKxscjvsyLQ7bvy+oI9geFC
         afl6Do1qMI/98S1iYu2yvK6mlmdFBuGr+LJmThOryrLL2+MEupdgAwvam2hC2IKyK5Qn
         fCyN4N8gNvExxel21eOiLaNu4R2nYozHmvB1qep00GqlsVgGfSqJ4Wov1Bxb6s0fbEn1
         Ws+VwFfpwTR6Zx/lU4Lsc5e6RsWcK5m+k/D75dCZCe9nbTzC2tIE751cN592Q2dBRTlx
         m2nj620juh/5ArnZiczEinhu6JIB3cZXByBqzUDMcfTUgOp4TQxZrIMCD+8VKFdqYcBo
         HgpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751873199; x=1752477999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+M88naLnUJ0t8QJIK0WbEzaLOGjlUjQqADUu0a4dJSQ=;
        b=Cae6x3TgRlGJvVE6jklHC9klaLXi2/og2UZT2Udroe71tYZpa58QUFZ98ievfkYflH
         /tO09zFNK/BLoMxSBHJ8xtgB0Ymmerdxy9mn8aLHafoDl6hCWhTIm/tg9Ri5LT0lww+V
         fo4xWtssO35CXtPJgsJ579zbKIA6hKmvxGpfA6FX6o5VgjluK0jpXwVRBVtE6UmbTq+J
         qqk+RNqZWbRaeP0FoFFjOVafLlpBsT/L6y/YAPuGwkbprsny/RLygeuJoI7qjKRuhjan
         UnEwlzEtkVWstsL0L2oJAP4cHq7T2ryeiPXcdB/cUQ4UNyWSbqZ1lFaDxAMl/T9bxTuX
         SScg==
X-Forwarded-Encrypted: i=1; AJvYcCUQqhPfmWX6N6sTHYg5366BOG0hThP8GjHl0rLID0IvonaCcC7qpPfNCDfKiBjDs5xeNB76+m8++tSm7kQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmqEdXrIi94fotQ7tcmUwXkkkFnXENgnYg61KUHA1bTUUxslCI
	O5jl5uUvDSyhUh1crVTm91miht0XxKwcDQ9QFdBx6FvyhnP7Hhn0ACGVrwRELghZOro=
X-Gm-Gg: ASbGncvdqZDe4T6+WCfZejbKdwNUaARshjs8KHOXFO4UfP8sG64ukpOZV3XrRx+RkuX
	IWmKql3k7GgaeDrt6UUbnZpw7f22qYo+UZhVrT1GWNYro5pewekOu4GBdo0Yp7jPETx+1hLbIDC
	YqCkNKA21ZkAjfEoXry1WpSRUcpXr7T4dC5HWDhT0EE9gZ40CoLBgSqepqj+Zty6aHbDgGhitkV
	GJMrNvANtN+Nf0i75e9Z21DinNbptxGUAwSbQf7/ZdWi/7vBMEYlcsV6kaSvlxFccDNGLOTGITD
	sbKRuMC94dXYlKRDiVpm8d5MxmwT2ktbrEkkd8ZeNXnKtXlwAPJ8Q5tgZNv5oDU=
X-Google-Smtp-Source: AGHT+IH2a4FQU3gjAoeitT9FgQsVG9Ag0yKWeP/cCvV7/BHHehw8QBk9ZW19zI7R7BKdGB7OsX43CQ==
X-Received: by 2002:a05:600c:604d:b0:43c:f3e1:a729 with SMTP id 5b1f17b1804b1-454b1f69c85mr83094335e9.12.1751873198957;
        Mon, 07 Jul 2025 00:26:38 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3cf3:a61f:85ed:69db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9969aa1sm135733875e9.6.2025.07.07.00.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:26:38 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3] gpio: reg: use new GPIO line value setter callbacks
Date: Mon,  7 Jul 2025 09:26:36 +0200
Message-ID: <175187318871.9037.2163001449380297521.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250623-gpiochip-set-rv-gpio-v3-1-90f0e170a846@linaro.org>
References: <20250623-gpiochip-set-rv-gpio-v3-1-90f0e170a846@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 23 Jun 2025 09:57:16 +0200, Bartosz Golaszewski wrote:
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the legacy generic
> gpio-reg module to using them. We have to update the two legacy ARM
> platforms that use it at the same time as they call the set_multiple()
> callbacks directly (they shouldn't but it's old technical debt I
> suppose).
> 
> [...]

Applied, thanks!

[1/1] gpio: reg: use new GPIO line value setter callbacks
      https://git.kernel.org/brgl/linux/c/527db0a8811697968df30797eae2e1d5f8b6964c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
