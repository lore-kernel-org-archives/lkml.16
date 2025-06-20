Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06ADD227B87
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 07:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750404656; cv=none; b=lXH6kIrvVWvyV4AQyYFQ4iNftnm1Ue3uXJQqIup+5RP1FeSFYAxKNftHFKMY2rGcLEDkfRUwsUVkTZArbF9FTq3XwVs0McfVLHs99vzELBkXjzTNWSTDQTaRVut9snE6V7U7PJbXl8JgSCpzUr/5SBM1m7gwkeCljvSqjXFK810=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750404656; c=relaxed/simple;
	bh=KKkikw+ldQAL40/WCXMhIRy5mUo0Ek9714W6tXVS/f0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WqbdABoHTd+ORAtf4WmVqRuv9rbJSpfVwFY/MsHYdK+AUjZ4rnjTsQ/nhMic/hgG6cqIfnrE/A7Tg/xesVnBcpGGkxTgPka0rKmqnpLocXpyOfDAwqWh3SKlcBniGoaCeGKHAU1fVMZy9mV0450AzS6zp79uNgWU8Wq44IXIURQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ho0KbX2e; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ho0KbX2e"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a510432236so1184247f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 00:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750404651; x=1751009451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aMmMmYnx/RQ3vI3T1tYWhR85q77J/om0I7AHSKI4iF0=;
        b=ho0KbX2evH/bSZkAVWqMlaPmb6TdnU85P0FTrbO1UZ7GCam0vDUj4MHq/3RCiRONgU
         zu1TaYEnFwnYN2UUV7qWtgLlzobFfgl+w2MK1vTp/LxCV1GxcQzZscxtg9P7bGKWVFr5
         fZI0VVrsSwpPP0p9X5BtzxdZgTYNypgntsjnfS6e+oaZrOnPAfSK+EcMoQPCkqr1doY6
         pf1NsvzfvJp7UWpFfCveJvdJGPGzwNFLLEU0i8bAElU4V+DjTeHrqh0G7RNK9yeSNYA4
         ENAz7Itw0BjiPtIP4buRO9X2Wd1oBYUmccLvoanflLhpm6lP8BGPhM30LX6DHQOEg20q
         WBBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750404651; x=1751009451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aMmMmYnx/RQ3vI3T1tYWhR85q77J/om0I7AHSKI4iF0=;
        b=QSnpMhnMcJ1A4nWcy3FMOiXH60axoKY/FKr57g6ZLT9H8pgaCo4cUANXYoufzw9oLA
         wRW+j1ryjlaC399d9NiaJzLscoSTkjybiJTktFRL+G5PwS+BhIY1GQi1GGa8sYRjppa3
         QYtdlGBXXR4fb1bx+zkg9o7l8dgma8y7ujRl1U2vgp2+POrlZSEkCeWj9SqL8Y6pzjec
         lZuHHGohRkVFShT03IPG/oC5vRVSbBc1+EhKWlbythqBTK2P8ShhB7RxDiWk/YEgxzqJ
         4waKT2bndJO2x+NJtRQS2beYAtNZEEzPgHpzq7dFuk83AsXlEc1QzQChlZl1XyC0EdhZ
         XD1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUOmHbXQbSnozyFLUgsWqGSSfK7muaMmEarRxk9UPRWRYLScGucHO5IDfsVKCoEkx6bHOBnhKMY2HZQ+zY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhxq4wek9/5dO78jGCrkEAjYavvdX9TyZj5hJKfRBMDYokeohs
	JTbE85QSc/WbNVIeU99cxYVc2smMk730ue7pYC87fsBXoJsqBxdCypUzP0R0eHO0Yy4=
X-Gm-Gg: ASbGncu7rbcdzUd0njsnXnK0cRNOhAtsNBFGVDYEOBZbZx3P/v68iSHp0XeTWUtGgT9
	xaRNankRSfD+1xHpZib8eU8BD53sp0DamFXsxrmrcrv73+jldHVATIvbSEZkrEy+LEmTSqIa+Nq
	21BZL1O8dSvZgfrDbox3E3mo7sLrHETb1vN4/aJL7T5sL4ih3eosA4/4b4z+o26cJKv4an4xhek
	PnVhSQkpJ+yHbpvZisiX80efChxYhBp0y2FKViOZWpa9m7Lrn6mhfNVXtbHWRzt5qoQs0XSNVF3
	aSLmvIbaWKPPvDDeiNCWxLGrapkrUbhaZHcM1Ap8vM7rvdvZmKrwIszPAoXhBssHQNCHteGjAg=
	=
X-Google-Smtp-Source: AGHT+IG/mCcLgpUC262IBgRgyYgvBXplwXLsMQ0cCVJlGvrj3T2MuEhyZGA+wJQSTpfv76q9iM6GcA==
X-Received: by 2002:adf:b609:0:b0:3a5:2670:e220 with SMTP id ffacd0b85a97d-3a6d131803dmr918969f8f.32.1750404651016;
        Fri, 20 Jun 2025 00:30:51 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:69fe:2655:53a6:f735])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646cb57fsm16448935e9.1.2025.06.20.00.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 00:30:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Kent Gibson <warthog618@gmail.com>,
	=?UTF-8?q?Jan=20L=C3=BCbbe?= <jlu@pengutronix.de>,
	Marek Vasut <marex@denx.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH RFC/RFT 00/15] gpio: sysfs: add a per-chip export/unexport attribute pair
Date: Fri, 20 Jun 2025 09:30:49 +0200
Message-ID: <175040464299.26030.15007866194948582213.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org>
References: <20250610-gpio-sysfs-chip-export-v1-0-a8c7aa4478b1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 10 Jun 2025 16:38:15 +0200, Bartosz Golaszewski wrote:
> Following our discussion[1], here's a proposal for extending the sysfs
> interface with attributes not referring to GPIO lines by their global
> numbers in a backward compatible way.
> 
> Long story short: there is now a new class device for each GPIO chip.
> It's called chipX where X is the ID of the device as per the driver
> model and it lives next to the old gpiochipABC where ABC is the GPIO
> base. Each new chip class device has a pair of export/unexport
> attributes which work similarly to the global ones under /sys/class/gpio
> but take hardware offsets within the chip as input, instead of the
> global numbers. Finally, each exported line appears at the same time as
> the global /sys/class/gpio/gpioABC as well as per-chip
> /sys/class/gpio/chipX/gpioY sysfs group.
> 
> [...]

Applied, thanks!

[01/15] Documentation: gpio: undocument removed behavior
        https://git.kernel.org/brgl/linux/c/5ed0d32805c19cfa5f03a25ec7e041dc845d3062
[02/15] Documentation: gpio: document the active_low field in the sysfs ABI
        https://git.kernel.org/brgl/linux/c/1ae86030745013d9d54fc287c1ce875f7ddd99e6
[03/15] gpio: sysfs: call mutex_destroy() in gpiod_unexport()
        https://git.kernel.org/brgl/linux/c/e1f02b40a741aac47016765c21b61e91d19aa1ec
[04/15] gpio: sysfs: refactor the coding style
        https://git.kernel.org/brgl/linux/c/dc665b5248f90aa2dc74ecc1f2ebb731a6f5afd6
[05/15] gpio: sysfs: remove unneeded headers
        https://git.kernel.org/brgl/linux/c/982ec96c3876349e65e60c7b4fd91d767099837e
[06/15] gpio: sysfs: remove the mockdev pointer from struct gpio_device
        https://git.kernel.org/brgl/linux/c/fd19792851db77e74cff4e2dc772d25a83cdc34d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
