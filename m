Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37FA246BB5
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 07:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750317014; cv=none; b=TY2ufrW3TgoXl+JluPnM/9xfPA+1wqsDd8fWldaQbbSEoKzOySTVw/e2Npp3wkYqyVzHukRV3KNDJ4KkRMKvceGMExFUZdh0neBv3EA1wqzP4v9kRURv8impxLEr+r2IwHE1f/RVsuwFxKJkKbJUL2mUv7wyBaJI5LxgcgNkWvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750317014; c=relaxed/simple;
	bh=idDFcxqcaZi9ITOA6O7O8mllE4ghKzrrd7yNzSOM2L4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OKGlLvvWYJG17tGMS+YITC+pepZ39Uxdh5THNGltpFTg6BfdZfPWE03fm997pO65n9mxQmj4ej/JwWeWvF9U8ga7OnTannChaqR5GoPagBHn7GYemdEsL7aoJx4U+7xVDUfxCLkvcVcOagPI59bkzy2u+hW6PB4X+YvqCF9iL0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zR6pnixk; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zR6pnixk"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a57c8e247cso435087f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 00:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750317010; x=1750921810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xJ7WKC8SwlHWnkxUpPjJRL3c4L2d7RoKGqvzAae/doc=;
        b=zR6pnixkCp6zsjJXT0jpVG9em6OAYlr60twEB/Tnwh9XI+3ZEmAHkb9wA/wD9NEQKh
         vqGFjJdypKx/+/2nRpH5UPVmgmbFDEstlJxOUccLZRv7YDNXGGpWdtJyvYAua3eE1b3c
         eETtsyfiSJYQrJ+oQBOzBX1C281aLpvRIcpGmy9BOFsr/jvNCdhrFpjaFD3OJ1tsmLgF
         t+4BawXxhbMYqDS/2r5h4Jr9La1wUdzdyVlfTZTxQInLMc6FyPAk4z7BpyymRr4ceSLh
         c4IKRk37UuTtsn+iGXzcPv9wvXOf5NpYNp4dKPCGb1VFcZI6Bv3eDejNZ12+LQ8ph3rW
         sMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750317010; x=1750921810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xJ7WKC8SwlHWnkxUpPjJRL3c4L2d7RoKGqvzAae/doc=;
        b=Gj2l0MoJ2Iu0Tghfie1RJE0sTGAUIrCAOgRS1py3Pj07pD4uvCcDMBi3rExum2U44M
         0VMTFqHlfWrbzmRyxUwOw9+YPNdM2DqDrLZEU57yDOCf+fNSD76i5MnoT/xJLGeHehHP
         iGv/XKYpUBBiMCjLq1tnNFN6/vLBUFPBYQCtVzPv28qAEcZn0NCFypDtg1cA6yAK3CfE
         k7ELdpugMFzvxaVvoZ0WTNbTfJxw83vt2Npjy2Q06Vj2jl9AlQRdNojVhvWhGGdvwJ4r
         AVyn+MLQSww5hn1vQ+JEhc+LZa4DdeGFu1W8KwrmIJWx3rFTwKjWuyQb0rcYlX7NP0r8
         W5RQ==
X-Forwarded-Encrypted: i=1; AJvYcCVllvDV2tyaHNR0vGz9X1FrxlEWG1uGKkpxsJ97wXTaKKFQGIcqx9Sqzz2Il4cIbmxe8lcxDfVJ4cp2tdo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwltieBmkplOx5YWA2mQTObw7zr3LFUS9KPJ7CP11bkiRMxTjg
	wdby1Xsx6O5ZXgFASbVxVE1EjXKwpE+UJ27pH1MjUP0RaT62S5oMi8uFHMUxc3CqKX4=
X-Gm-Gg: ASbGnctHHHgly7XiwcdafhgGrjt4LQ7+SBwgY8CjHga2V7nQFVBbmG3e03xJ+MfVlcr
	NZX0VaxjB4wmRkp3gQ5wEZg71NeW7FiMq7Y/89XPCyjEY5Ec13Ck+BEBJ5c4tzBmIXS8Xk1K727
	hNu2O5MSDHGdu0vrBNmZFTDYcS5GE01m3zvugJDrtBgVpEEeaylYETcey6n/0tAGMRxjxRJBo2o
	YA9WTf7ow7zsQJrm22A44vlpR/yrANQFOwxs08Qe0rY27LRc+LfHyBOpzIF8ZqLxlTWkT2XyFYp
	JcB3VPI1y50wUkJQZW4pJEO9JWAa2FElBwEseyQ37BTow0acCfISnfbBzH0EGFU=
X-Google-Smtp-Source: AGHT+IHzP+i1T5dB4ay7/aTiSPYaINe2A3Zw6rt9PEf6xWeqmugHB7dSuPeuV0xJhfe2MdtyIcwRZQ==
X-Received: by 2002:a05:6000:1881:b0:3a4:e5fa:73f0 with SMTP id ffacd0b85a97d-3a572397846mr17415430f8f.20.1750317009976;
        Thu, 19 Jun 2025 00:10:09 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:c485:fe15:c9ab:c72f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b628ecsm18982991f8f.92.2025.06.19.00.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 00:10:09 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <clement.legoffic@foss.st.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH v5 0/9] Introduce HDP support for STM32MP platforms
Date: Thu, 19 Jun 2025 09:10:08 +0200
Message-ID: <175031700235.8154.11042956002137082224.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250613-hdp-upstream-v5-0-6fd6f0dc527c@foss.st.com>
References: <20250613-hdp-upstream-v5-0-6fd6f0dc527c@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 13 Jun 2025 12:14:11 +0200, Clément Le Goffic wrote:
> This patch series introduces the Hardware Debug Port (HDP) support for
> STM32MP platforms.
> 
> It includes updates to the mmio gpio driver, the addition of device tree
> bindings, the HDP driver, and updates to the device tree files for
> STM32MP13, STM32MP15,
> and STM32MP25 SoCs.
> The series also updates the MAINTAINERS file to include myself as the
> maintainer for the STM32 HDP driver and adds the necessary
> pinmux configurations for HDP pins on STM32MP157C-DK2 as example.
> 
> [...]

Applied, thanks!

[1/9] gpio: mmio: add BGPIOF_NO_INPUT flag for GPO gpiochip
      https://git.kernel.org/brgl/linux/c/deefc7083414de81aad102b60f0390f600d7eb79

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
