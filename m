Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5721C75E2
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 20:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744662382; cv=none; b=feGLZPM1WkMyhHqJ5Z6D8/fyJSq1hgKwm7DJ0FB7SzEFzl3+9vDD5JzKwgmIhd7B+VhcVyxmk6o/TdBneDGg/iettsIaeealqysPjlcA2p2o/iUqRsLmNtaTSUVMw5CasFGNlKAzYH5KkMUKyFQcxiXy3Fi7648uZN/XuLHMbTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744662382; c=relaxed/simple;
	bh=iBs+aKRDJ7M7roaZ4THHof2CSfvuprVGdvuAkyf+vYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sqEaYeDw8FglZaOded//XHFNqfpFOBG0cJn1Iy9Pl66vl66EoTUVr18/54RPG7Ycl8eEQq9/OEEF/SATsTZ759qbHfyDklqwLZSTkhMkBJUDAjq8904cx2O81UR+YiW09hmLKMEw0GSU574j0UjLBUaVzTCaBLyVTVMtukiKUMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=itFfqqCK; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="itFfqqCK"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39c1ee0fd43so4626477f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 13:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744662379; x=1745267179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nvNmFSACobqMSZp4wEbaxtSHKBqkIkOhCMM6s/FWtxE=;
        b=itFfqqCKjUeIdXzuV4EX4ImNR6zexn672sWf/mWOmAwpRLSnhSRG4V1pKeUaTz3lyl
         +GTui2NtecI5zLysVl/PedwX6qHde+A4LwsY282MOdSiSQKgSftS4QVxQDrlJf1axbpq
         3O6rIPOn5Je8ESjioMXDFN/5ZjpnTWQ8xs6K2bW4yqt3KKo/oYfkbknAvlro4ltphCf1
         sLDpULfC1lQMhL4+m6BPVgtmQ5s/2sAwE53XL3VfARrAD39+hY4eTbECEr0v+lC+OE2f
         8GZOqjPpjU1E6JoA+gnLT1MUbs5vD9l0EcdCCS0TtpSKyuDcNzYOsR7S0y20fP5WJgv3
         1uMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744662379; x=1745267179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nvNmFSACobqMSZp4wEbaxtSHKBqkIkOhCMM6s/FWtxE=;
        b=DGmUi36tbS9h2W6GTZ/ljj+m/yNXBKz1DmtgdwEeMkfoqGoXAWWu8YFQRbQpfK5Dw6
         3sZKWWAl49AcpHbRmh2YRcgsaTynVsSkwiT/W6RXLV28s65ql0Fr3ggsJnkOFoyXNzuo
         vCy04r3JI72bzZrvzmhPok5cuH3y7RLs9cqBL27Z8eC/jdJnKF3YvWTxi5JF9V053SBf
         VTdwILJVPsloAWYSUa6L7/8N2QrIWAE6syT/0PlIuAb6eIw48Jvkx150uaikHdTNyLwE
         KsH/dO6+cwI0hx3LKvu4d8ERjy7GVMyXAjVCX9B9GjelVc39T8fitxk2iyipjnjzYVk0
         PdHw==
X-Forwarded-Encrypted: i=1; AJvYcCVCANr3HRWszBv0bSq2q0Wtb1pA/IOheCJYlx1aFmkeGMcYgcRkGqumptPp7L1cDorz4HF6OWWv7JER/IM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAtAqPBc9Tq9S5RDkK5tmoWejtVi2qeDWOjz/M/IL2L6OhnhDM
	NXjVd/hfTjwITVMHEuivVXhCHgXrgXmAT2WH9Q1fnLN1f3NpVnUbl4V2F6ML+zw=
X-Gm-Gg: ASbGncvgkh1mWRUnAXmVmp2qFHsTvNIKpMTMyMsIMgVCO/Y+2vvs2gSF40wnE04+v5x
	uqn8tsg0bEd7aEpiDNT3Pup+eVtYEOb+1/YUJnPuFrQo7IcAHZ91JK+OyUtJmjGeF4TnZq88i9S
	WgRgKYwi2c+SJAFNnxvYcoXu6Jtfz2cqvieB5kRnu1o1F20FtQJcTTsh9fm+BbDeq8VIGmMx8VR
	OUqztUNtSPcL31FZW6U15ptUoMEoXfKc8r0NzKg6kIS+DaI4wgdtYv6STXzmgioBO9fLcplM5e5
	Xw+L/oufGdRjD6h+mxGHCfYDdGLbU6+VFYQK
X-Google-Smtp-Source: AGHT+IFuDUIgj/D/cN3IBnUD9RJzcG1WoLZxxnJQx2bCsy9FAjjPxuG+fuJ3T3TcBdKtR3haLjrBYA==
X-Received: by 2002:a5d:6daa:0:b0:39c:dfa:d347 with SMTP id ffacd0b85a97d-39ea51f4467mr12141770f8f.2.1744662378981;
        Mon, 14 Apr 2025 13:26:18 -0700 (PDT)
Received: from brgl-pocket.. ([2a01:e0a:81f:5e10:5368:1715:4c6b:8be6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae964073sm11872229f8f.9.2025.04.14.13.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 13:26:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Koichiro Den <koichiro.den@canonical.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] gpio: aggregator: Fix Smatch warnings
Date: Mon, 14 Apr 2025 22:26:16 +0200
Message-ID: <174466237012.5065.7312812236129842983.b4-ty@bgdev.pl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1744452787.git.dan.carpenter@linaro.org>
References: <cover.1744452787.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 12 Apr 2025 13:14:53 +0300, Dan Carpenter wrote:
> Fix some static checker warnings from Smatch:
> https://github.com/error27/smatch
> 
> Dan Carpenter (5):
>   gpio: aggregator: fix "_sysfs" prefix check in
>     gpio_aggregator_make_group()
>   gpio: aggregator: Fix gpio_aggregator_line_alloc() checking
>   gpio: aggregator: Return an error if there are no GPIOs in
>     gpio_aggregator_parse()
>   gpio: aggregator: Fix error code in gpio_aggregator_activate()
>   gpio: aggregator: Fix leak in gpio_aggregator_parse()
> 
> [...]

Applied, thanks!

[1/5] gpio: aggregator: fix "_sysfs" prefix check in gpio_aggregator_make_group()
      https://git.kernel.org/brgl/linux/c/eebfcb98cdc0228f5e1b7407f9db1c602bd8e545
[2/5] gpio: aggregator: Fix gpio_aggregator_line_alloc() checking
      https://git.kernel.org/brgl/linux/c/2e8636ca340002f3ac31383622911a1aa75fb086
[3/5] gpio: aggregator: Return an error if there are no GPIOs in gpio_aggregator_parse()
      https://git.kernel.org/brgl/linux/c/db1baf69e563fc222a75c0add5c76f437c717ac0
[4/5] gpio: aggregator: Fix error code in gpio_aggregator_activate()
      https://git.kernel.org/brgl/linux/c/05b43de95add3d787a7a88378086bf01c10b3f40
[5/5] gpio: aggregator: Fix leak in gpio_aggregator_parse()
      https://git.kernel.org/brgl/linux/c/d945ff52642d98eb6fa191f88a9cfde729129395

Best regards,
-- 
Bartosz Golaszewski <brgl@bgdev.pl>
