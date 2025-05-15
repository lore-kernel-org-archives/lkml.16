Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5529E1F8BC6
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747321383; cv=none; b=e6zX7pNUZUB6ioeTrXitvCphLFpshHKzoCmGFUHX24Y9qDcMvTggEvyrBFXXtooZd+ErpYNQHPxSUfqkJ32+5TRB+tRWT9H8SAa+0OA6YPPcX7048L95qwEo4cbKPbJecZZr+2Al3yEn5iuCuwMBvpxcUld3vQrFsbcf4IugeOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747321383; c=relaxed/simple;
	bh=RjN4yIlj0arsZ7ZteAOHwkzgOTyLc93krkDfvT8tzcs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ur3ZbfTQCx+L2WOlJYFK7L5ap/3zv6LI5sK6/hk3OPnw1JB4uniL6EjD4hYKtRqO3fE0JWA5nda6PdL5o0IguzIvC6GOvLyMjAjbsGg0kbM1qX80/VlFLa2YXkxpSQVTKa/IHYI8F5XGc/OR7nxBk1RRLjGLC48v36g1VX4/6No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=pe8X5LfK; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="pe8X5LfK"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so5708305e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747321379; x=1747926179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yxsp6oGjuNOX+xuFU08PlzO35fGhJ/ry3v7K7kSTtzM=;
        b=pe8X5LfK9+vs1FlWyAThGSvNpSUAiayXY5s30jZX1C+C1Lx5vleD+8OGbRZIALmkTm
         0GEDg3Jb05sXdkRg604pPnn09RP1exc5N9PhWjdWY+Rer+SXbNPHN4qKOG1Mi4Jhqed3
         1RxAZeqkXMthUXwM5eHdjKNwIPa2FpDzjaghIbC9XjU80MQNhUmKEi7noCd4TUYyQNAS
         CRtGpvUDJeNx32oGEuwG1ssLYyQKivMAZUmPj/95kPVY7rUyYM8crj7RZbTMqIxlzaoC
         +l2yaiVCE/Cqg+QO10sx+uGKheAP0a5fCGbtMSkl16NKgcuvHNV9TMFPtCHezdH+hOgq
         Yg6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747321379; x=1747926179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yxsp6oGjuNOX+xuFU08PlzO35fGhJ/ry3v7K7kSTtzM=;
        b=uvEgJpPe8ichDtui/6qKpoEoEnP6poEeL8Ij4c8VVu16HVfxA0FKlfYZE/b4sTUKzR
         SaQzr6x7q7fcE8AGAVT1q9aCWDgpUsbzaCBrPaO7YqMnrCZRSmuXNEYpiz0i2FrA7ZeE
         SLAAbyzKy3PyHmfIvLilmm9AtMbMXjOnlI0jK/vAgWfiKywudn5jqAh2W3vaEVzNsU0m
         bYF6+qHOi3xSxYIMoNc3PQSPHJW7g0C6C4fnfwVWLqc/teLdS1+rMFIshPb/MZclNyXi
         bRcpp3bqoyJYrKGb+Apz4Qp4ckcH08fSRf5+19GisaOO0YZmUZO9KzKDttuRVrOY7MY+
         g04g==
X-Forwarded-Encrypted: i=1; AJvYcCW0Ec9F9BCfA62T5+0H3MCFqnUrrPy8J3dyiXae8kz2IgFOCyBgTTE8lYR3wiWWtlfJDZuZgNoyZxxISwE=@vger.kernel.org
X-Gm-Message-State: AOJu0YynwZ1QIECMwVuQoj0MxMx/ZQP79PNas9OzpCkU/XW4LQNjPVNK
	SzEXGyoh0eSz4ICbAP/EujUDb1zCYwe1+/Bw6cSsBXEu2VVYlhHhqwkojjzJsi8=
X-Gm-Gg: ASbGnctppqYtlOos1NngQ3Pj92hVyPNio3vHAwgETDgob0JtWQRU5ggtqUsujBwK2vM
	MXhc+x9XANa6j56WBrIJ8fJEKsBVSSF5Ti7u8EUH8dD3QL2ixp5WapD9SO/e54NIsoCxrNB7YWO
	27JwbQhg/foLqCzrU1CUf2QW330fVi4M3Q+VgBa6LZMXp0Jd84XFy3SkGeZw95cv+lKIcpA9MqH
	9/Sm8m5SlFBLKIZuZB9gamdPrIHhRxGR8z5Qh/x0lqDR3oW1jrRsdIHq3Bp703I/lASD49HG1Si
	VBQb22RIVBNs7QoyFnscsOOPSKJtziYvgwWI9tyyU+MndROyukvySydOXIUWnZk9rISM2IjFi48
	jbgmpOOc+FPCH1TVwgSHYPoGA
X-Google-Smtp-Source: AGHT+IGdEWIBywfQs4PZp4JdP7brwhiYv1KCdKAMM4y/BZUvPvXwZEzy3DFDz/jA4oHanSe7ld+P5Q==
X-Received: by 2002:a05:600c:358b:b0:43d:42b:e186 with SMTP id 5b1f17b1804b1-442f20e8141mr72625715e9.8.1747321378848;
        Thu, 15 May 2025 08:02:58 -0700 (PDT)
Received: from brgl-uxlite.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3368e3fsm74756025e9.2.2025.05.15.08.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 08:02:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Ray Jui <rjui@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Keerthy <j-keerthy@ti.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH RFC 0/9] gpio: make irq_chip immutable
Date: Thu, 15 May 2025 17:02:53 +0200
Message-ID: <174732137152.17517.12381683522631139304.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250509-gpio-v1-0-639377c98288@nxp.com>
References: <20250509-gpio-v1-0-639377c98288@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 09 May 2025 12:45:31 +0800, Peng Fan (OSS) wrote:
> This might be a bit late to post this patchset, since it is almost rc6,
> but no rush here. Not expect this patchset be in 6.16.
> 
> This is an effort to make irq_chip immutable to elimnate the kernel
> warning "not an immutable chip, please consider fixing!"
> 
> The major changes
> - add "gpiochip_disable_irq(gc, hwirq)" to end of mask hook
> - add "gpiochip_enable_irq(gc, hwirq)" to start of unmask hook
> - add IMMUTABLE flag
> - add GPIOCHIP_IRQ_RESOURCE_HELPERS
> 
> [...]

Applied, thanks!

[1/9] gpio: bcm-kona: make irq_chip immutable
      https://git.kernel.org/brgl/linux/c/7b04f98027afd2cc329d00191dfc8284b382565d
[2/9] gpio: grgpio: Make irq_chip immutable
      https://git.kernel.org/brgl/linux/c/a30be40bf1d4437646b6885e7e4e71530e6f82c1
[3/9] gpio: lpc18xx: Make irq_chip immutable
      https://git.kernel.org/brgl/linux/c/289e42df1358abf85e49a140f7224c2abd170b2e
[4/9] gpio: mpc8xxx: Make irq_chip immutable
      https://git.kernel.org/brgl/linux/c/7688a54d5b53f2e3160c00f19b00bc601fa3ec98
[5/9] gpio: davinci: Update irq chip data
      https://git.kernel.org/brgl/linux/c/62be72bdb00ef52a0d0f02ce077e36b1f48ef0ae
[6/9] gpio: davinci: Make irq_chip immutable
      https://git.kernel.org/brgl/linux/c/3f50bb3124d76653de0bcfe251faa357711e3ae6
[7/9] gpio: xgene-sb: Make irq_chip immutable
      https://git.kernel.org/brgl/linux/c/580b3264cb252cae00fa62d58443af09c25f7d61
[8/9] gpio: timberdale: Make irq_chip immutable
      https://git.kernel.org/brgl/linux/c/2993d2dd8ff4e8257a88d4d3f8ffc6df95928b94
[9/9] gpio: pxa: Make irq_chip immutable
      https://git.kernel.org/brgl/linux/c/20117cf426b677e7aced4e7a1b2b37f6080a46dc

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
