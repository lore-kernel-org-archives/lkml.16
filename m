Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C5E1F4191
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 19:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745781474; cv=none; b=oCR3P9bDD51TPjxdDWo+oySMq3IgiCG5sBNAyGbOBbuj6nnWTA0wxdYFSyEWiD2zq/X1yd4lpVyqJrcjk7ve8SuCX1/aOyEUP5t99/9EOQrs+8Dq9oluzprMkkvjT/rrh3BlKzCgThOcwo25Tls0Muow2v+vmf0D+Bz8Hxmn7qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745781474; c=relaxed/simple;
	bh=6IC2F8aYqTVehjmi3m8+mzcbglCyO+wk3F4hmLvIM0Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JUZaW/t0nYav5hZ0VGBC+h/JeaX3x2I/R9LIAhsJvbvgHOJpO1Z3a5n+Jlgqp3M/yTwwr+ifqhbtZydI2pMPr/o27hUFnCOzU9Uk0viXci/IuFrV1pHFn/8M2wCy6tijUZBmNGW2GkqGZXxwGm0aky6FAPO3mXSzO0sDIgnbLSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pCUtoO0J; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pCUtoO0J"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5f37f45e819so665397a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 12:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745781470; x=1746386270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oiImoVKJXxF5Kkx3zdXXXFlWOb+F7YBai/OtGKstv94=;
        b=pCUtoO0JwGlhkX3yxHX55k59+tKUxZQobYv69Q+jzGU0aoRwyiAWthYBYOMpdvcy79
         ME23KPbgERwXMCfYBuudfxYOztUfIudKYfIvG/bDCHBmHLAN38uUludkr2jOAZ1R8hpj
         Jb5MQE9ETkm6pIFH9PZJlSrduXzedANQM84EUYGg/6hyrTsUpyZEk6eMD01U9Qd9BHXT
         rwLZ1046xrChZS7Not6KDrRgQ/IqNWmSIubZ2KE4n/hoJE8PGHyDBu/7ZuFuXpl1ChgF
         ZpqMfU8Bw2xs6gRjBiWGQeoQWth/QzMq2Ekeqgp+Gsxk6gvE2KTcXM/T8uKB0/1hzOr1
         sxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745781470; x=1746386270;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oiImoVKJXxF5Kkx3zdXXXFlWOb+F7YBai/OtGKstv94=;
        b=OFJVMqlx50myOoYKmr/N4UBRGCs1PNogyYpFvlnnK93FVf7+Y7LccDRwKY5Jv/EMsX
         e2qaxdr1puA5JlhUZSQ21AfqC9MaxaTWRRaaZFJQeHG8OxAjAE8daXM7lAd0yWA+OqQL
         I7aYZ+fougLsKjFHL/SJs4APAoNh6GcqfA4LU4SEVWg+z85pOFCrLqjNQD3NGsUsnIed
         1fNPUH0omcDVUlE9Jic/EDIXNXHjlBMcpj9lQEglr8j+KtHmB7mu8Riy3dvhjZzoInI0
         PRRAx2i4PlgisM7JUCezEvPsfN52U+ZNKsx7b7zC8ygV6+bB2dcKa0z08hflI5NJXI6Z
         ueRg==
X-Forwarded-Encrypted: i=1; AJvYcCVO7ttXqAHh8S4X2jlidjuqjUmXhBnQUaOM9MBRxpUU5EG0cTvvcnta62ZXTDkYhCm8PkpWdWdJ4LX0B6s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLNeFFOF03t/E9V3PxgLgi5J3VawgjdZrVywIynxuMof2umOWN
	qrkgx9hCOpG1j7knA1NtUz4KpmMJBsjPPZzOWKJiRvCKz6D0J7JoXcDJaskODmM=
X-Gm-Gg: ASbGnctkIOFsDKAbZkcsINGVgNXOucv4yBlFGdgUtpqK5RKObIki8t1ANY9i3pzl0AK
	gpQDifOkRiyo/W9ABu/+3r9kpUC26eCi8ABzKWcy36gdtI18muFhqwPdm/O5bn0GWsQ9Lb72Vvo
	35kXHYUITa99NmUNnaokJVnyBz9VoC5KcK36uXYheABNN7emWCml1RvDS6Mj4rnNQOlBnsKwrlW
	wa9s7DYOol+Rnw1HsokZfzehnfZc3IhA4D7XLo/gwFLQxxKZVGlGxYB83G+qe6x1SFSjP3r3FuZ
	oV7JH8toQFND+CksznQyDMcdA00ibnvpn17RDy6E1Kfl7UTSpyTqQytnOfU=
X-Google-Smtp-Source: AGHT+IGubP2iCTuCyZ6yE7PZ7fqh1WFD1EalA/6wRofWBfLKR0gPhAxQUDuoA/JPJLBw75qeR6aCjg==
X-Received: by 2002:a05:6402:1d49:b0:5f4:cb60:b1bf with SMTP id 4fb4d7f45d1cf-5f72297d704mr2493639a12.5.1745781470559;
        Sun, 27 Apr 2025 12:17:50 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f70110791bsm4547238a12.13.2025.04.27.12.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 12:17:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
 linux-mips@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
In-Reply-To: <20250424-gpiochip-set-rv-pinctrl-part2-v1-12-504f91120b99@linaro.org>
References: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
 <20250424-gpiochip-set-rv-pinctrl-part2-v1-12-504f91120b99@linaro.org>
Subject: Re: (subset) [PATCH 12/12] pinctrl: samsung: use new GPIO line
 value setter callbacks
Message-Id: <174578146801.16256.5835084697538702793.b4-ty@linaro.org>
Date: Sun, 27 Apr 2025 21:17:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 24 Apr 2025 10:35:35 +0200, Bartosz Golaszewski wrote:
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> 

Applied, thanks!

[12/12] pinctrl: samsung: use new GPIO line value setter callbacks
        https://git.kernel.org/pinctrl/samsung/c/0a5b9be31f78898c7d6e7778377e8ab6ab0399d2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

