Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A7F27602A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 13:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745328791; cv=none; b=HYZNGx/QkzrPdMad/bpeKEsvDUMPCxkBEDFC8k3ZGZeLMnWFt/olpC6/qB2+7owxNvhilroj2SrpkeA5v9cGHoXEAo1/zIl3g57FiCIrS/jeLcUlTJ0K6J2IFyKLTX8y4lMUC3AOTwy2j0CYpiR9v4B55pqhvELq8loDM1y9+8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745328791; c=relaxed/simple;
	bh=q/6CCrSW8phqSBPkpH010TjRR+i0QEufdIffPLwtHUY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SjNRYoSrKyuE5OgLQtouxNmydIxf0BdBw5AfP5+puKorhhWTxX6tTaOhVQnEcCBz2vuv2Su4wCKvcdm821mQq3ZbWUFzNxs8Foi/xOuGt5FyDnF+g4muEXC41nB48NGHG4DbE+kix7xf+HiFCnMDaZNH47SuSHkELBPe89sIUXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qlyvKFZV; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qlyvKFZV"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39c1efc4577so2746648f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 06:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745328787; x=1745933587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yuA+DRO9E1tyLrWVf0Ph2bREIdSD9F6RcY3stJZGVO8=;
        b=qlyvKFZVIvVIVDa9TeFiS2R4W6nTFQ4+kJvj14rAjtXpYsQS662uVrFyEEXfUSdu+p
         3ybc2K8sUW1exVQpZ/NBxAAFl9SzzF+VyNNMcyhz8jRuY2EOnn9NPCUoTPd/4r3MMUFg
         iRTfGAs7GBIHahQhL4EWovGabBABjQrCtin0yDgMAWss+I/h0OAWeM/R5/ttZKk5sY6k
         1kjdm+ycYYIQq+obtGy4co6UcHjk56oKNsJ6eCG8reqEKUhfqadMviF8kg1roO445O7V
         Z52t4cNU5oWfwPps+TP96Qk/skbdI0xPtn1GTLJBPGRU+BSolJoFIPQ/tyQfDtiE092P
         JP9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745328787; x=1745933587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yuA+DRO9E1tyLrWVf0Ph2bREIdSD9F6RcY3stJZGVO8=;
        b=DzI8cA3dAdgeFcmMN2R6ogxZer2cTxigOknc0uoL2B4Bs5+KpelOaGZWHzrVDrymXy
         4OQZkeEOPHyQ8ByZRXY9u4VwJLUM5VYQ5xGuOtDP4ohgf18eqijwTGvZ5kYWQ0nw7CHW
         aC/8avJ/rkUYjeJcDP4piIvF+e3FrlQPsfc3D3NRoCANUqJsB3MZPPxAWYY4X4D7wzI2
         o1ZmNdoUigQA3APs/jxaAo10x3J6mXaDg57B4O5KibDBfeYOoZwdJQpv8bhOIoUhx1AL
         BbHel4e32f8xPHoZ7A7vA38q2TTzbzgrjSKNcCMLytoTaD3OGoMMcuZGV564WZ/1HxYM
         DWrg==
X-Forwarded-Encrypted: i=1; AJvYcCWxmWmbmieZa+6lLNcWomCSUbrXxbv1xTxLUCKx+BDuxgfEpN1CNd0OZvaBsC8zHuqnHzMeh9rIBn6Evoo=@vger.kernel.org
X-Gm-Message-State: AOJu0YytRx18AYSLO8+EdiLIcdzgoZ7suH6S9/Kf7QUR801LTBsEYTjq
	7vlScRWW92si7AmI4/eZ01ysBBeR/Q7IDwElGo5wq3YpMkIWvf4DNLArl5J9kG0=
X-Gm-Gg: ASbGncsyHtqhQjansx5q4Vr29e9drKIeRh2xFbhuoJtJO6tXsS3qSdtdmmhWgejAc7e
	CetlScDu/3qLFp054lqffNaNKKhKxhlim8irHaf1Im2Qv9uhLzYG39fsqU5XEcxpaH++X9DeDmm
	S4/c9YUsAJNPbH/GnIFvIMyRwaW/kRU2a1K2n46SWQJNy6WejHYTz+z/1KtODCvFTgknuTDbQlk
	ze4vgs0hYrt9HQAUZWzB1nsj431bWkH78Ggg9aBIO1dxLe5QUq/wg5S5b+c240dwqXCyx8bBj38
	doKADl4QCSXVhKd/wc5fF67q6zMdbkIDlOsDowiK
X-Google-Smtp-Source: AGHT+IEhQDKeWLIVzz2Udu0XaAUPZv9+0Kz1RuszB1QZpHAzEY1d0mfRIv5ucw2BFOHGS2etZxtuog==
X-Received: by 2002:a5d:5f54:0:b0:391:22a9:4408 with SMTP id ffacd0b85a97d-39efba4ad94mr12003104f8f.16.1745328787223;
        Tue, 22 Apr 2025 06:33:07 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8807:1a1a:7a0f:60c6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4331a9sm15548965f8f.36.2025.04.22.06.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 06:33:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] gpio: Restrict GPIO_ICH to compile testing with HAS_IOPORT
Date: Tue, 22 Apr 2025 15:33:05 +0200
Message-ID: <174532878331.89556.16615131669980136153.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250418-gpio-ich-fix-build-without-ioport-v1-1-83fc753438ec@kernel.org>
References: <20250418-gpio-ich-fix-build-without-ioport-v1-1-83fc753438ec@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 18 Apr 2025 16:17:20 -0400, Nathan Chancellor wrote:
> When building gpio-ich.c for a platform that does not have IO port
> access like s390, there are several errors due to the use of inl() and
> outl() throughout the driver:
> 
>   drivers/gpio/gpio-ich.c: In function 'ichx_read_bit':
>   include/asm-generic/io.h:578:14: error: call to '_inl' declared with attribute error: inl() requires CONFIG_HAS_IOPORT
> 
> [...]

Applied, thanks!

[1/1] gpio: Restrict GPIO_ICH to compile testing with HAS_IOPORT
      https://git.kernel.org/brgl/linux/c/29f4c4da74acfbd54f5ad2dfafe1a8f93af00431

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
