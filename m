Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97552820A4
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 08:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749543130; cv=none; b=RojrE93DmM6zqwlV/vKl6JaGXwgQmvdglHqUTRUqHrRBaDi85CFPgSFQ9XWsjcvlHggrQE7gO0L/XL5eq/RX4hT3D+IoRS4aq+J53e0i0IMdtNHWBzjYPFG6C8ZEMFnSSLw8Upf7OUO7yLbXTE3Z/PGlIE7jqYKPDodFK4YtD2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749543130; c=relaxed/simple;
	bh=v2CT6plJIgNl22pzwKw1D3YejkQkKza1J01LiUDlcu0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jw6ZpeLLshKLTZB+O5cHJjeE6fsV94bIFB4PfWd6tWn8g5sB5QgdwocnFCBtCBc+RLw4M43qYj0pVb1+3virhOHSiZFptTuhiisRPpkhHDq7xP3uYOD5a8albxuZurh9pY/j+tv+dlP3xvNVpuLSO3kU2xqCZaG6Tt7jS6k5hGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nUJZDlkb; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nUJZDlkb"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45300c82c1cso8576085e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 01:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749543127; x=1750147927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yho1AYPPcSyhpFNf11EN63wRjrUMMghOh4GvyBpFQxk=;
        b=nUJZDlkbBm5vttk3sySpcJHq8ezQTRBwOuEhUiKUTueYiRzHx2gzRalgkt/0rnUgNj
         PPU9c1iOjNQXgn7JPAJY18m5+dKHYmOTDjW99GNxyZIaBC4onOusR3ja8uGUIdjzmRQZ
         uj2E0LcYCewrZWYgoHx9ZsnVmn3ySwPanqMnF/U0Rn3lAPpormMNcU6fn1NEM4OjD8iX
         tuWBjJeEoKFGzdHzAfClsr00UL0NuVWAyTWO9ZYTD9uVfCHNtYAf/zXZo3un9x4Mkgwy
         5LG5v77NGOvXBv8q8aZ37j4AJ4qBmnldFCNcXArZBK4wAH6Dd0HyiVMqYVnoAUJIl4ur
         ZARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749543127; x=1750147927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yho1AYPPcSyhpFNf11EN63wRjrUMMghOh4GvyBpFQxk=;
        b=eGpXj3m1NuCbFqqyeCePkI6x9ZZFvzzHWMjRKw+oq9CqDD93hW7PoMcURsCsRn1Wm/
         2C46HBpKr1WPW14rzPYCIm1A3netzgkdao1KIAW1Cs2KRI7BruWftMbY7BPjWwoOtTAx
         KOuXpbEtOqBAQOwKntdSsYh4T2JD1jbqVofbnpWPgIKqPUC0QRHNBwN2mdHwVAzH8ELF
         Q2VrtxgOwUkEc5Yjr7zNwA7s0rL+e9JFz99Eehthz3qzWXaTip5fxJvEsn2uR/WV4Evf
         De+nmGvxBeruRZjyxJHm4zlar+txqPguH0V+kIyPHc8ddwapUMB5r4Yp9NZfOIW3FcrD
         UOLA==
X-Forwarded-Encrypted: i=1; AJvYcCU/X6wzZDnzu26piKVxxoQtBB37FIDB8aetruxoxGHrCZlsD3vnGSG4JCD8PFdII5YbVP7IuwUXWAlMxtM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0CKdNDtAAO9cAe3wsrd/0mXwl+GkFFr8PHTHo6M92XbqG08vB
	SMPcan1UmG0RZ7ySezpUC2Ly4iDMKwInBQWzvSesHgqdBRIsXc0XZ8uSsaPnutTgKVA=
X-Gm-Gg: ASbGncvd2zxhuldGFB6q/VYzboPN1WEKLK4wSey+UA7xioT29DW0/lQ34v8Fino+iRw
	jcmDYx6cbrfuKtTHTEcCto+ImicKoG5lBYu8Qujy1Uzy4K8p/1US9UIvgdO6aTF/sLDtOZMKIEk
	UPZg/sPfI1h/YjL1KNxs9utyqbOMziZlACCsrUCM7jCxIsUO8oQrzlW9QSmu9s2QkktME3Ri89S
	tRxosiGpRqv27aW7QN08OdTI23R1ZMDO2aXpSp94InYtolo9zN9/N1zsN1PIas3OXK/nwrpaywP
	o3wOJAavyI0C5B9tZoL/9N7CP/Thr5x7dnr5DriJphXoUv6uQtdcFaRdkHJbKkA5OWiCGSI=
X-Google-Smtp-Source: AGHT+IGOtNoadr72JztV6ZhAT+ubSCYHDknKz2gb1C9ZO0My9Ib2KVUPVReo+n/L60M1Q/VEFy9cMA==
X-Received: by 2002:a05:600c:3587:b0:43c:f6c6:578c with SMTP id 5b1f17b1804b1-452013ab6b1mr159226445e9.15.1749543127060;
        Tue, 10 Jun 2025 01:12:07 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730b9b3esm130838565e9.25.2025.06.10.01.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:12:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: gpio: convert nxp,lpc1850-gpio.txt to yaml format
Date: Tue, 10 Jun 2025 10:11:54 +0200
Message-ID: <174954311123.28634.2017679231712927757.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250602144259.944257-1-Frank.Li@nxp.com>
References: <20250602144259.944257-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 02 Jun 2025 10:42:58 -0400, Frank Li wrote:
> Convert nxp,lpc1850-gpio.txt to yaml format.
> 
> Additional changes:
> - remove interrupt-controller and #interupt-cells from required list to
>   match existed dts files.
> - remove gpio consumer in examples.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: gpio: convert nxp,lpc1850-gpio.txt to yaml format
      https://git.kernel.org/brgl/linux/c/114ab5afdf6640d40c8982170ea78c127c983dad

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
