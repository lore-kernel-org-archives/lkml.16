Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FFC20D505
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 08:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746001713; cv=none; b=V0JsVhBh1W1SBxrxsHyHaLh4L6VEv38iUD0luu+Ve4EkvZcr/0//ubIuT8hN0Ot2GpnPzmUU5i430v6rD4/nqvozZeRfrdji9nfynmehtJh88mazo/L+PdRx1NmgmQ+UeL3VBzGy4XWmgP91wDZyrXToULqJeLeUkL9f6kSg+3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746001713; c=relaxed/simple;
	bh=Tgj0b8wEyAscpECMyq6oZdPbM5PjpTjZ9DzPNxVUtdo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=idQADvCLurazqvXNeb0oGLxxFgvBJFYCfjSyjbY3lMCC8qMCHamD+j076jvk+H4Lz5aPrqK0x0Z3i0Sot8ZNoPgqxnB83koN98qMchS8WrcbB9gXyR6fBiJAxmbjqbDjE4bks6k5fjS42t2VfOVvE2imtO4vxGhMYF4+kIO1o1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ugWvjkNX; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ugWvjkNX"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39ee57c0b8cso7730706f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746001710; x=1746606510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQU+bng+xkR7HviR9k3Fod5rLUwRR2Wp2EYNWSD72hA=;
        b=ugWvjkNXL5AIJubLY2lUDW3CnP1LC969ErMeH6em7rkDxWsBBmjXnH4pF7L04oKasQ
         bgaW/E0iGMgYJLh8nNoltlHKhl6onZnNi7L/2ke0UtKbsnhZD2KmEBuErlVcVX9+EGCr
         8unU9UISL5k2UxI6jpMUGugHkJ60O328HtDL9inrIJzUAPKxXEzKkePNnsSTa1ShIFVw
         I73BxUmeesIcKQagc6tKBiGyF/NBYyHcCv2papLTNBzZZjiB1NEhzAmYJfW3OmVQDQfw
         qzHDcZj25eOxq1poHfs0RofbDAxzbatYx/SIK1FZG4hNLrbPEWsaDo9iabvCB2wH7rTf
         htgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746001710; x=1746606510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iQU+bng+xkR7HviR9k3Fod5rLUwRR2Wp2EYNWSD72hA=;
        b=eu42vv+bRCVB+mh4b819SMrw/id7R5bPPyaPm4o+gPIjfwEI7zyPS4EyUpMBLQM63V
         XybzU45LaSbwXi6YJRpcbOV+fGhPdZtUgHUhnjlX8Dz5xLich00tfdX5cMsrvvmqAg8v
         CNC6A8rMJec2l27obN9HGSa24AsAsrcTv8K3TjirQBNCSAfIRKLgAO87uNoOlRunsZAu
         DuglzYHcu7AzpsAruEv3/w2bXPbQ4GB+b3eA96A1LKjvPzCnP1emy7tzIQ2WKHU/LnwU
         SUQ7PfrpcuDAoxSIF+I1ULA7GwA5sn+xrgrnHHEji0eE/3dpBuAXRTUTDIPUy8dCBa6J
         TqDw==
X-Forwarded-Encrypted: i=1; AJvYcCU5i8tpZeK6GnuRyVlY1jfbwdzjpvPCCP9v3bfMcf79WRW7NVSRtFSYGO27mmH63tE51H7loyE5ayHkQUg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrJhh7dpaSHG6F7XswXJa15W/WkUbN/r5ibf8GgI73q028XB9N
	zkhoQtbIONMGlMfWCkaCKfxeOJlumualAkSRQCYuuZVu//Hsr8gkP9ShUmJlsTM=
X-Gm-Gg: ASbGncu8F2dK97J+D7AN324rcSzbiUKSPH8m2u0OfsApVI6UIjO1BGb7yBqCDXMrZ/+
	K0ZZuIXurTHeYvAe5x0r1yCqBl/Cb2SNhhMl9ppAOJIo9mNjRokwRluW89U1tyStnZdZPjxJxmR
	2jNhlwr7wJUtk9SjWsriBQd37VLgMwePPQrtSzl12DXreuDZyHSkC9J9hgqnozx/lhU2d0gaMIx
	Al9i/nqI73ASUE/Eoo4ss+0ogcLNsmFP/bD+bH0gL+k5lltMhH/t0ZUMzjM5j1ImrN1/4nQeqZO
	gfu0eMrwsNMfhkBvJL9UzNDBnmBVFtp4n+5vYcEIurPOfcbYcmzH
X-Google-Smtp-Source: AGHT+IHgMvuDAt895ICDc0XLDGqBuslTtH+D05AWu6mlFg6UPu208Udg0K1dATfjFDOpPEGc7f862A==
X-Received: by 2002:a05:600c:3516:b0:43c:fdbe:43be with SMTP id 5b1f17b1804b1-441b1f61398mr18443775e9.27.1746001709493;
        Wed, 30 Apr 2025 01:28:29 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6298:7254:d3df:f23e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2aecedcsm16496835e9.15.2025.04.30.01.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 01:28:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Lixu Zhang <lixu.zhang@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/12] gpio: convert more GPIO chips to using new value setters - part 2 for v6.16
Date: Wed, 30 Apr 2025 10:28:27 +0200
Message-ID: <174600170555.13323.4628945373721333783.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
References: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 23 Apr 2025 09:15:02 +0200, Bartosz Golaszewski wrote:
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> another round of GPIO controllers.
> 
> 

Applied, thanks!

[01/12] gpio: imx-scu: don't check the GPIO range
        https://git.kernel.org/brgl/linux/c/57bbc60be45b750073acc7d94aaccc4e652319a1
[02/12] gpio: imx-scu: use lock guards
        https://git.kernel.org/brgl/linux/c/dd6d13abb4c363f49ddca2697a781945cf80ad89
[03/12] gpio: imx-scu: destroy the mutex in detach path
        https://git.kernel.org/brgl/linux/c/68ef71400d0e7a9049c36cd0954ecc67521b0bc8
[04/12] gpio: imx-scu: use new line value setter callbacks
        https://git.kernel.org/brgl/linux/c/40150dda92cd8718a367a32ac345dce05f788a16
[05/12] gpio: it87: use new line value setter callbacks
        https://git.kernel.org/brgl/linux/c/ef877a159072ca31ed183b086c41fb9951521886
[06/12] gpio: janz-ttl: use new line value setter callbacks
        https://git.kernel.org/brgl/linux/c/3444049044ce24c2a2bc98c6e30d189451147b63
[07/12] gpio: kempld: use new line value setter callbacks
        https://git.kernel.org/brgl/linux/c/0c5fa4ee5a2256cd2d37bd0d0dda5d4fbbb30281
[08/12] gpio: ljca: use new line value setter callbacks
        https://git.kernel.org/brgl/linux/c/722332f58aa82b92c857b053426dd46e09988e38
[09/12] gpio: logicvc: use new line value setter callbacks
        https://git.kernel.org/brgl/linux/c/ba2ce44332142a86bb0e9246d40b97d6cc191c5d
[10/12] gpio: loongson-64bit: use new line value setter callbacks
        https://git.kernel.org/brgl/linux/c/145c4d7052fd15d20e5165305b3296a026a40747
[11/12] gpio: loongson: use new line value setter callbacks
        https://git.kernel.org/brgl/linux/c/7d34d9fbab771779a2b365934fdafff32bddd029
[12/12] gpio: lp3943: use new line value setter callbacks
        https://git.kernel.org/brgl/linux/c/127da457c4e01bd6e4b8a126aaf1be1a6c03fc0b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
