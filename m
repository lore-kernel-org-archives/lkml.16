Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B519C22FAD4
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 16:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744131490; cv=none; b=lNmi9qtirlHfT0e6wDiEgG7CHL2D/8wPVH/6aOfjL8yKl1qB5vUA1ZgiBgqE8uWewr9qT7ATfPGPVqXfMPttf26JgO+urCgdrTvGUXo/6tkrA2PYP6HpXZEj3ZZQNG+oTjogw1Hv7n8Tc6wDr2h8NZ0GtCWyVXjkYPWZpxe+UcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744131490; c=relaxed/simple;
	bh=rV3IzZIww9h+n+TZSLe0bsGFVsLuLTB1QeJQm73XtYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tMj+8E68BxvRZeEO9QiJ4FRTxRJt0ohmG+QyjBQVkcRqAFLo6Dw85lVtZEEEA2SNz6T82zNoApIzZDXVSgQyDeQwW5vBhqlsKn5WPrpgnwmcRU5kdh5hjUcTlYSz0agzUyHTbgVUO42j+h2X2ojdZel0oSJVLgTudLfNPxhiXMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Bu52mfrR; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Bu52mfrR"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3913958ebf2so5140504f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 09:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744131487; x=1744736287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8uGIqPGo3/RzZiaVHiqgzYEtP/BWLkkvzIhLsqEr0Mg=;
        b=Bu52mfrR9gg/GsWJn1mi1Yu52lTp3lnp8bPjxi8/qQofmR7/pZNZE4+q2LQe17kNW2
         k6EjwJlh8RniJlTaPPL2gy+vRgScx8Dz5Tycjow42+MLm9tDvRISje/2wbd2UdcJ+sSL
         vEE6tPLag1/dmvt6UkUptbJqBy0AOUN/uP0Z/hi12ILxsJeDvefkJAZ2IdOJk4gLocna
         3tZwJEeFWfCZVf1UvFkEsRRoppLwQ9ajRtwT/N5Vhhj9IT2b/9uX1VCvmQ0IcPCF+4Qj
         KsUIMnFXlFOzW6HRknABFSn/M7/U9sVEYTYGbdy+/5KAqAQsPVheHvBzqnwDc4x9q92K
         7uEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744131487; x=1744736287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8uGIqPGo3/RzZiaVHiqgzYEtP/BWLkkvzIhLsqEr0Mg=;
        b=RxY1lRwUCAwZ2sa29e9fK/pHGnD88o8ux33zu72DuivDEjjBIpWVAQdoFxh+mIeC1R
         JzLn9Ps12Xvg217g0ORe4AiJZJ2Ozi/5sEw5Im1rj0VHnnsGv4NPZOwu2GdEq1ylFrF0
         Q/J+zN+dZ7knT1zS8xZPWi2oXpm/i9920j4ZpDW7VG5TZa02O8QYZyhzBeCHXHVfG2f5
         U/pSX2BEz/7RaUBYBiqwvMKPTTVTnmZL5Ehh+d/ywNCFYC6iTOQDOxiC1MtNPlUkV9tU
         jhdJHAFgj+eiaUjT5VzlJdKg0OwyAKPX3ao6fpx4IaeZhScnpBZbMsuBm4bbtYVzQqmJ
         Tj9g==
X-Forwarded-Encrypted: i=1; AJvYcCUxoS0gMLF0YxZViitQY0Srz7S7mpLD8jo378h4TM9ywrZNC8dzL/j7iBY90fvLBU6R6nSEL0m3pY3PjJ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGfoxL7NSSNGFwu6cCwleDvac/6nAAJ9BOtv3g/1lzXEbuaTd2
	jkRTKn1qVdrPNg/DhjqV1Sp+QcFg1L9440VbZDtno4zDfrwt0OPWdJ2KK9QEgQM=
X-Gm-Gg: ASbGncu5ULsSrO3kBB2hOjsYiI+YWeYm0fx6Wzp2kgtUp8X9zFiKLs98RumFhxRup01
	yJIvf9mgHbyQZ5bPks6BD9zHGGQLXhTAX1KbAEUoYc9yMsDQfgKYR5wxrrg91J59g7RSZldtsxE
	27egDNscmPMys56QZDX6YAiKjDVGA0ZvxI88wAZUD+MmsJz8tdfi0sngKKdZ/zUK/CLH2V75TnH
	MRikRSCFnbl2yRm3rNcqFoYap5uXB14JgP7Q/g9uMEu2dqUnm0OUXFp6Fjd0MOJJMgSmWsr9/+6
	SivZMiSkMqtuRwVUmWbBlQnY6+nNg2o5WOZWKzBip2d6
X-Google-Smtp-Source: AGHT+IFGsRSNGsLurl8DoyFapSJyV7TtJ4uGe3SGSEX3BrkLYJ/yVCM++z6f1tjo7zrernLeUKYo4Q==
X-Received: by 2002:a5d:5f4e:0:b0:390:f9d0:5df with SMTP id ffacd0b85a97d-39d6fd3647fmr10095287f8f.52.1744131486678;
        Tue, 08 Apr 2025 09:58:06 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a6a60sm15141709f8f.29.2025.04.08.09.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 09:58:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Yixun Lan <dlan@gentoo.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alex Elder <elder@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v4] gpiolib: support parsing gpio three-cell interrupts scheme
Date: Tue,  8 Apr 2025 18:58:05 +0200
Message-ID: <174413148280.131421.6673320812296091453.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250408-04-gpio-irq-threecell-v4-1-fd170d5e2d2b@gentoo.org>
References: <20250408-04-gpio-irq-threecell-v4-1-fd170d5e2d2b@gentoo.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 08 Apr 2025 23:11:20 +0800, Yixun Lan wrote:
> gpio irq which using three-cell scheme should always call
> instance_match() function to find the correct irqdomain.
> 
> The select() function will be called with !DOMAIN_BUS_ANY,
> so for specific gpio irq driver, it need to set bus token
> explicitly, something like:
>   irq_domain_update_bus_token(girq->domain, DOMAIN_BUS_WIRED);
> 
> [...]

Applied, thanks!

[1/1] gpiolib: support parsing gpio three-cell interrupts scheme
      https://git.kernel.org/brgl/linux/c/27986833e8e675b6c17654d13623590a46f9033e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
