Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F3128E37
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 12:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744894287; cv=none; b=R3X22AXfdd14Spw2eM8xT3FWbGJT0vT00amZWoInoxEROpiZ4zJZumICCrSG9ivTLOkBKDaSOayVaQ2eo/4p3KVb/w1YOaxE+eckxh+afYQbaowDJwC79625QDdDysV5B883YVsIakR7mkOLeurSlSALw3nJJ04lu2MseBfQ8Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744894287; c=relaxed/simple;
	bh=finCUyOvZ93fHQQHowdbV2oBQnSPddqlzRWdOojWUCM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nLF1AQhKYGu61DxpYdJxWEsVVGdnUiVtc2fe3DtyBc3nBPxB4Hk9oSCwJvo2CUhppCkTbuoX7e7Fxg/koZ5Eg2I0rrLiZ/GhKy+Awcwj20lx6T0xAloHVhDzM0ThZflRfolIL6IqTmmWuUvDKOJjVNpYpM9iw/m/wubuIpnXhFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=fBUo2TEO; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="fBUo2TEO"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso925871f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 05:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744894284; x=1745499084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZBnT+laCLNXh7PPiZXzKy4njYMHGDmfdn70a/ZEI08=;
        b=fBUo2TEOrcYKtt9DyhrdFAjgYOZHO+FZuW+ntDZCAjWAoj3tRu1BycigOMqZLrRajO
         fetwvAgf1UWl79lGv+NFErX0frMREFEooVLy2MdnzdBl1+8siO5ggZ3bGQ65Qmaf/ui5
         GpP4vHWH9gNGwX3e9Aooq1rpR72ulEpSg92neowQCeUFegjpsaSD+1j3w3dKaKKUQ2xE
         VPzjEbkvsoNVEkK21s94yJmHmHWyfoB8Yo8CKO9YtXBGc9Of6Hm7mUiOtWfqpQhtQtbG
         owJ0Z6Fni/FmDZ/NvrXnjp3SZZEvgf+nPv/o6E165uTqKQk4QXnqG1Gyb1aGZpOU/w3g
         Hb5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744894284; x=1745499084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zZBnT+laCLNXh7PPiZXzKy4njYMHGDmfdn70a/ZEI08=;
        b=PsuoUTNHRpxEcSFy5SWH30UtQhny+vjjLeeKvrP7H/pLml/NQYFokiug7KaJPPNM5k
         mR+vJ9Cq415ev/7EZOnLMIMltRJOI6MFZO/EXxqRh2Orxne1RpASaYnWLVs+niBrH8zr
         +GWEm/FqDiNRKnDXWX4B+oBTN9Z/eEBINykDzf75ajApi7EZfo2Jdbd8GPFR7/nUKPqN
         m4uDY6FdokevjAjGlG8S0TXM9BEzR1+SN81QSzmSZ7uVJsv1YBxKgENLAyw+R1+DXRK4
         YtnwmD/PZLExhyxC27cRhW3qXxzz0ybKWGT3ZIr4eSbMLuIXxpFXFsIqXfMnbIlQjzVo
         601w==
X-Forwarded-Encrypted: i=1; AJvYcCXf+AYIkAZLSDuLiVRXTwyE1pA6WGreH72/p2nWHlCTHg7R5W+IYleUr9IFi7S4/M8gdnF2UNB5RjF6elA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk6aAcjR8GSgmgy488US9fZDmu56vwNw7o7FEsZmyesjFWBvyy
	a9FYFDWv/yo8Wnxoq4AcwwtIQYlmfm05zYkaMYpYrLicSWFraN0PIcPx2hwikWg=
X-Gm-Gg: ASbGncsw57Z2L+TflJs5El9wBSHVDkiYknQbmL/8Gqge4wnFHq3JutLtmjYCVFcBI1Q
	W87yYrTHtPJ1iocRE/SUV7Mk0x7n+s525exXHdo97k8Ue8Mb6OEmG7S4K/YX/pKlHjW+Z39lvpm
	XsAJ65ARrX64T82l7B4A5rCw6lScxr5WJEIYAozk21+E4Ppa7dfRRmFfiFo3yZgI/RcYsjiZ+uB
	k/S0gTdOoMyhDIOmaWzqpRHbsHm1GMJD5IndebQNtUsg3P5oylJ0Xx8YI5+XYxE2VD3Mtr2TobW
	34sdEY9C3eGaTYWVAXMoDa2/1EeS6JWBixpFXWXl
X-Google-Smtp-Source: AGHT+IHWpz34DsT6CiGwP8Mk2YiPstdWoj5p0fGSBttIO+3O5nzKajqSlAzAnGfNnQDRebcAkb9t5g==
X-Received: by 2002:a05:6000:240c:b0:390:ff25:79c8 with SMTP id ffacd0b85a97d-39ee5b16110mr5425769f8f.20.1744894284417;
        Thu, 17 Apr 2025 05:51:24 -0700 (PDT)
Received: from brgl-pocket.lan ([2001:861:4445:5860:9b49:d51a:4244:693c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4f2b72sm52293375e9.19.2025.04.17.05.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 05:51:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 0/8] gpiolib: Some cleanups
Date: Thu, 17 Apr 2025 14:51:22 +0200
Message-ID: <174489427928.8397.10007467605798515698.b4-ty@bgdev.pl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250416095645.2027695-1-andriy.shevchenko@linux.intel.com>
References: <20250416095645.2027695-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 16 Apr 2025 12:55:08 +0300, Andy Shevchenko wrote:
> Just a three groups of cleanups (some of them may be dependent to the previous
> ones compile and logically wise, but I am only aware about couple of patches,
> i.e. 3 & 4).
> 
> In v2:
> - split one patch to two (Linus)
> - added tags (Linus)
> 
> [...]

Applied, thanks!

[1/8] gpiolib: Make taking gpio_lookup_lock consistent
      https://git.kernel.org/brgl/linux/c/6a40e6c5be2a22d724ed195393442653a2cf9a1f
[2/8] gpiolib: Convert to use guard()() for gpio_machine_hogs_mutex
      https://git.kernel.org/brgl/linux/c/4ccbf7bc68cad35061e1f1b4c280fd736855a2b0
[3/8] gpiolib: Print actual error when descriptor contains an error pointer
      https://git.kernel.org/brgl/linux/c/c240ccd62764e036bd5e1f426fcdebe69e15d7df
[4/8] gpiolib: Revert "Don't WARN on gpiod_put() for optional GPIO"
      https://git.kernel.org/brgl/linux/c/960460b7b43957f3fb6b7856d5273f370e20ac9a
[5/8] gpiolib: Move validate_desc() and Co upper in the code
      https://git.kernel.org/brgl/linux/c/dc5881036291c412d673d11b19d392f25349a70f
[6/8] gpiolib: Call validate_desc() when VALIDATE_DESC() can't be used
      https://git.kernel.org/brgl/linux/c/197184384759ce0b7ae5fa17c9a6e272a3d28626
[7/8] gpiolib: Reuse return variable in gpiod_to_irq()
      https://git.kernel.org/brgl/linux/c/78998fa9887af032a2fc0f9ad0269af62439d848
[8/8] gpiolib: Remove redundant assignment of return variable
      https://git.kernel.org/brgl/linux/c/bfe489117ab2a5c16e4f8ab6863e61726338558d

Best regards,
-- 
Bartosz Golaszewski <brgl@bgdev.pl>
