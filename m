Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C45213EFE3
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 06:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744698052; cv=none; b=EPrhhkV4CpKosNLPBZoEQaqonLQc/wdpFjMCm8pl1PJ9l1Z1y5efe9DcwTcvbCeZQfpjeDPREWOCte3oJsEbYACj5poEIfFmdFro3y1kN+TXkCDjEDJctYXZzLr/um94bPJ9MgEE0YHtHrWMTumgdMx9iV+Hd0u72vr6Qt+pKVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744698052; c=relaxed/simple;
	bh=1wXOBOgYQVNqr+xMFUAAYMAmc5Wy2T1Eoh8nZ0KLltY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Qev+CAuYmR4LRuyKWmYapMbCg0tDnyItWGdxaiNDSmjGemMgLIOIwwFFhGMeAPlXH5/ldvmUvLeHkdDwy3yOPzPE+4Exbvkz8uDCLdTN1/tORhuJL9oDJKXwNZH4mfcBoavOxR8rulCpyWAK4NmdfYM9QpOV1YdU3cPBY6zy8O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ig8QJL1X; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ig8QJL1X"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5ed1d8ff85dso818561a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 23:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744698049; x=1745302849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/rfhPeoEjzIHtAc7j+jocnOEOsiVdj1SVq02z7sozKs=;
        b=ig8QJL1Xhqwwy0hLREy+2K7hmZMcxyrN4K6Lxe+TrFw8rZqJZJOS+tHfsOPuh0S0vD
         vtaeJxABSLClVsbFlQtenxdHomUawuGUZen6+zUb9lCwz2AWP/hPf7HzA3Ah25BXrSKu
         NmYpqpM0hNmO9FxeJtXHpMYoxZWsc0NhruOQupkmq3b0juoNK+v+okKrk403nxArvRaX
         5QmswtVN6Bm+4kzy1MGO2/HRY59Y2pQZVXRhA4Uwn9LKPa9Z1SCagCcCYvMK8GRmxP8+
         ZNs0ELxqu6igbpX4O/pdn9caw/fJ7+Yxxh86iUuUNxJLxhT524Kdzad35GilE3cZFnmD
         vkbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744698049; x=1745302849;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/rfhPeoEjzIHtAc7j+jocnOEOsiVdj1SVq02z7sozKs=;
        b=An7FFOTLrOP5BvuSsvZ73Ctbq2L/yQudhpzQj2eKg20Ec6pzr/66EiFNGVPVdb7yPC
         2FLK1imbEQD3cOdw7qWGtdIxoG1kfFapC4MBFV4ukGT84tUI/XhQObGFUuRfiVZPsWR0
         sFKDPQlxqD1TYNpdPILQ+AOsOTyH3Vs4qWt/7PdXZwgVLJF3g/quo95YB5ZoK7sRKOSI
         +19NFhBpWPqzBE9QugKi/shSKZb8Zz8XOx/RvoUTPaXyai46RsYW3NKyiCyJRujtwtlz
         SwKF7Cd4TnGxc+pTc63h+SfbNQlTSs+tDJSbmyFMZ99nwXml0NJk3kQbn87JRIYmKpK1
         o5Hw==
X-Forwarded-Encrypted: i=1; AJvYcCXjHjUMG5H4LJfuNUSJxAUrZFELlyqCSSgTBI1kZCoH8yY1I0mxAvsp2zq9mbthatgbZnZyIn3oAgDuDZw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFA9+kFA9QNaHy9JgOhx6af8fD2C4qKTNUtuFXToeuk3dU+pny
	iQDQMLSXjkocXecOiruUJe06MJYwu4+AVpVU/9Uo/petIXIdIKWDlqw3IsyHGok=
X-Gm-Gg: ASbGncuBgmZRDe/9rZAsWmn4LdCLcz+xD+dPWBvC34CcGXUvPwblVWI2MHv04Id0PmF
	Ah5m3OwG0I3NW6WLpfriGFy8dz38N8wnKBK261mTrCDdZPEornlTK1VLa4JZmvkKS/nsgZeb/Np
	DDSwvd+B1jo6QQJt5cUh2UyNIKGw0YYUMcobhL+Jll+n9XjaKfYMZA7LfW/zjRa1brWIon736Ub
	xABM1ylSxF7/ZNC7QL3fZmVYK206gorkKTr93y8KhzTQj3MzVqGswfF2Jo/szm6O3k2JHlVaJJe
	z64WVH2Om3HQFguVwwS75F/6aAkdLVZ2sSfG5o6g96hdsf0F9mnm+P+WlZS/7UpG6QHeCbUWfAC
	cBz/2zkQboHqwgW8=
X-Google-Smtp-Source: AGHT+IEhbVvbM/D9UHsiRmzPL9GGSfYHw1Hou6MhR4w4bWsSUPkFLFMOaIpV5Zft9r0xm9z2VHFeZg==
X-Received: by 2002:a17:907:d850:b0:ac7:3911:250f with SMTP id a640c23a62f3a-acad36a20a5mr446907666b.14.1744698048611;
        Mon, 14 Apr 2025 23:20:48 -0700 (PDT)
Received: from [192.168.1.26] (46.150.74.144.lvv.nat.volia.net. [46.150.74.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb4129sm1053861866b.98.2025.04.14.23.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 23:20:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-memory-v1-0-5ab0282a9da7@linaro.org>
References: <20250407-gpiochip-set-rv-memory-v1-0-5ab0282a9da7@linaro.org>
Subject: Re: [PATCH 0/2] memory: omap-gpmc: improve the GPIO chip
 implementation
Message-Id: <174469804731.15476.5829884320265602221.b4-ty@linaro.org>
Date: Tue, 15 Apr 2025 08:20:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 07 Apr 2025 09:21:18 +0200, Bartosz Golaszewski wrote:
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. However, this
> driver doesn't even need the set() callback so let's remove it
> altogether.
> 
> 
> [...]

Applied, thanks!

[1/2] memory: omap-gpmc: use the dedicated define for GPIO direction
      https://git.kernel.org/krzk/linux-mem-ctrl/c/a63f9903a56fabe17a0c71dd0c291499d28214c5
[2/2] memory: omap-gpmc: remove GPIO set() and direction_output() callbacks
      https://git.kernel.org/krzk/linux-mem-ctrl/c/1f34b5a9f09696eaf464c6ed06a055ed9cde3425

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

