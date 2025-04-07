Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BC9226165
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010027; cv=none; b=RJ8UCDkPMQQHr7XeQGKbcQrOzqsSSvO9fzR9PdyacmEUdGFTB8kXI1wxX4Gnsdgs/AxTGGeazielgldkBJeK7ahiRnbamg9XunIM426WtVcspFCMBs55Flp5Y0eV6NdVMEVcSc6I/T9+zCRNb48ugfJ40k2oJjEVy9iW5mYe+fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010027; c=relaxed/simple;
	bh=RMeEkXCBW8iv2Y+TFnm82PWhhfZrUm8Jf3ZdZTz0Iys=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FZGxbYVvqFc5ZmNbfezJ7m1u8dm92pR29EeEOfS6kXQ9m6vZDAeWv6v3bPKytA4dQnodu6QxPQWGW6SG+Blh279VhWLRLFWYNtI7ITObizORmClaRQyeuhzfQKbbpXV9zKe5qQgTwFHQi/DW++YJVyPcQ3UIx9cuoypWZVd5ODY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gV7LuCbS; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gV7LuCbS"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso39891625e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 00:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010023; x=1744614823; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j6qJH3D3dcBUxqtqFwZKXZHZZ2wy5A88ZUffj6LjIWU=;
        b=gV7LuCbSC9NpzJvpFjFJw6BhfhnOVkD8h8Q17Pcm00gBwdyoOXzDGMTgSXgz3GTRBa
         pOAAagRz8A6TflbdJK1MVDAB6xUQUL9XS2ntIKSm68OkMR9axn5H/dk2kAWPnUCwYAKC
         5Am24Huu2D7baoPC6NIJkWWGdEfmnHWIMREWNgOzqwwHr9iKM4NDKhQBvXX2ao1fxBeF
         8y/fz6uCOxRdyEm3+uqkKCUUm+ngRhDjuYZSIVVcRdctjHVmG1IUYWgmIrkHRyi0U99j
         5N5kDyCTSSCUVTMIQVPjoZceT7Nevh9sYq9jzgI30GOfzJGSvllywIm1MddgpOvl29A4
         cBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010023; x=1744614823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j6qJH3D3dcBUxqtqFwZKXZHZZ2wy5A88ZUffj6LjIWU=;
        b=nFrlMiUB4RxfYpMMprlFi8sNpcD/w0XEiR2RvO7ifcqT+gf3g2DKZ+dUsS/7TtH6hA
         3N0v6SV2QCaacIlmmIWXimZfJ2LE3O0rgR4pJirGVsRGhhs+XAaznprTEPg7NjBnVwav
         xNVxM7foIrioO3hPje/4eQBUV38WjFLVOGTWOf2KoQrx6vhcRlD+hwuG5Qg9dfqfv9Zo
         oN26DEauSoi8fgvyTgiloHwJ2ijLzfVPcOsPooggtjV179GUcvZbbLh8oM5gp8yCzdHU
         M1AQ1xrZVcpFPgPp65HMC5P+pb141AhdlI7L2REHAjcBmD05LFVpHoAYbWVr3GrAjfpZ
         EwnA==
X-Forwarded-Encrypted: i=1; AJvYcCXxRECDcN8e0XgvSMvuU3OrhbVXqR1m6/maAPO/YDc2S9FSpGwta7pOAFCm6koRPxtVpyRwKqKPrqmLPd0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLcmEdI9vn/P0cN+/1+mozrQWPAJe00do5XM4sdEmfUH64n3VV
	7M/gvIga/qgqvAiVO9t770TT5X0dhMHSPAc8IQfQK/kU4flDM81h6twziXNQE90=
X-Gm-Gg: ASbGncvxG5fwwasMFdecWKeZCpg5TXAqhDl2eISDAdMIKNVX1dK75BBxqTcb2dI7u+s
	omKIGCiB8hW3qO1gFXZBPTZIQWzb3ZzGx6Gwq6wmw+QfkoRXYxLCfMUuWCrVI8KHcHrgPp1FgGQ
	DCD/2CcweNv+BqE9CZ/2hyZyw/6jcpuzF+9XNQlkpYwyto8mdaJ/FR24s0YTL2DeBh0ChgFsXWR
	Zu/B4b2Oa0vcEJblDw+oSfX2QQtS8js3nfItQNk/SASnyR9uIhz0AwGJ0rMJ7Nv799JACm9PbpV
	IqHzjAOtCkoDhBQCPWbcbQNCf46Y896AomE23w==
X-Google-Smtp-Source: AGHT+IGloGrcf25Z1YboLqoCvQQRV0Y4rY1PSNSCcByOr3ebw5HNYIigUdFfZam8QEEwbOxo77ft4g==
X-Received: by 2002:a05:600c:46d0:b0:43c:e8a5:87a with SMTP id 5b1f17b1804b1-43ed0c6ba07mr105183105e9.16.1744010022878;
        Mon, 07 Apr 2025 00:13:42 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ea97895e1sm145267115e9.1.2025.04.07.00.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:13:42 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:13:20 +0200
Subject: [PATCH 11/12] gpio: ich: enable building with COMPILE_TEST=y
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-gpio-part1-v1-11-78399683ca38@linaro.org>
References: <20250407-gpiochip-set-rv-gpio-part1-v1-0-78399683ca38@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-gpio-part1-v1-0-78399683ca38@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Andy Shevchenko <andy@kernel.org>, 
 Peter Tyser <ptyser@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=743;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Y+UpgWZnyfT06S5T52WHDfnqlvKJzPXnZ8Z2mwrPslg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83sKsbO4PjLSWfJMf5W3OYBOsPDhiWwXtL98H
 1CAtL8sG8SJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N7CgAKCRARpy6gFHHX
 cjS1D/9gvmrt6260PHP7JoS6Rfa5lWXJ+VyA2eHE3JJP0cwS2nWIY/XzeKZyTFYKDhvOYh48DVB
 V6vMws3AnykW2vZJVtZELgRbWTsvHu/RWW/QJ1HGq2ooHeDB8c0pM1IBJVLFU0c/2UB8rct7Nvc
 UusLb3lAOAJPBgRwMarhEz/V5hVnQIoWGZnTsNNJOfMLzRsiHXjPp7Z/OvZy6tBwUBk28JEnlhr
 UHfeBk3qqStK/pndamJiFglWwDvaKjLLi2mMQvUw0OaZdzVU14vvDDASHOfsyO0iSf1uZ4CRVwK
 iFBlzwLS5C+xGNz2rFJiyzVpeWsEzaZalApiOOsd3l7oVF8KfCBMtkv3tNF4xcCjrwq1N3ud8RZ
 9D/lSQ/pasMj5TgkiLPJHwTydDNyqwfch9Osdvgp840YOY9m7PnuPdamnJJc+Rt1fZL48kO5WtG
 SL+U59LCZBMe4rCBvVibslejYOsIqZ7BwPeVHt0ylLgrjxE2ZxoqhTh/+QVU/CQhCTT5f99pYh8
 m6hb3qCZqy33eC1BbzWKcfVSzxAV4GCqZ4xjJvi9A74oh5e/BrgnIKWW4kXIAPU2yph61ZPJIXI
 7WA62zzI/VfBXyjOM8XK5IqVr8Hu4uEqak+/zw+A4/gayo361M+jowTLhlMhyOvItc7ZAeomCPL
 kwfMJPPYVsnFehg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Extend the build coverage by allowing to build the module with
COMPILE_TEST enabled.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index decd150810b7..c13b95813c6c 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -368,8 +368,7 @@ config GPIO_HLWD
 
 config GPIO_ICH
 	tristate "Intel ICH GPIO"
-	depends on X86
-	depends on LPC_ICH
+	depends on (X86 && LPC_ICH) || COMPILE_TEST
 	help
 	  Say yes here to support the GPIO functionality of a number of Intel
 	  ICH-based chipsets.  Currently supported devices: ICH6, ICH7, ICH8

-- 
2.45.2

