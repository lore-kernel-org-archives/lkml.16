Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCF310E9
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 13:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746366647; cv=none; b=s9Vnt6N9AIbzu3Y95/ypoO2I6gHTD/JNL2Y7vdbAmjvjH+RqgNVKn8U8xPdGjNXsG1Me/TwZoUk9wZwkMGYi1gs3orm0Bup7makjZGUA7ZI81+VnNRrU6kUKtuqfqlJQkthrKISl67/bNP/noc/K+5+U1HiSrscyIr7u2sndztM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746366647; c=relaxed/simple;
	bh=Esu7uoANV9CFGiL9FIg/9JrPWLL4imdX/uOgpNs+CZw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Omvd0TqkVwaCl8ISSVepE3fAxfUTSlX/DBiSM/4HO8kelzpw4c677X6t0fMq0kn0jN8N1ILeNLpqDay7ZQfYpHwc1HrOW59TNZSjDSl0nJXNilOmgUmIiaxfRVNOXKYUTx65FB2L6Yw+4crZvLH3sxwmV1mU7cgxeiJj/VhG8A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KLtF/tqY; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KLtF/tqY"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43ceeb85ab2so3716005e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 06:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746366644; x=1746971444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+WxkHYKUkzW4ER/6Z9ItH8b6boPBxhsY28VmZL6mAc=;
        b=KLtF/tqYlJIVYbLC0juVwC+cLVHSKWLNhElb7Qmq5wU/EcCK9AHa1chBbHAAjLr7AI
         zvX1FMI1nHXHCl8APTKYNITkQ+wfRZd5PlcZYtFPBLfbwNIdRuLaTCuLusXU8Ff0OV4z
         McYX42riCG3U3IUW+E5dcKa0PWE1VG972O0eVnY2zH9R5seUQmUaLmVjZkTPdv08U2f0
         NcdhmeNadxNc8OR7VZbQdx5fgZafYABtqPrnv9wGorO1yeyjyg4puDxaFw59iCnamt4V
         D63D5Bg+CMyUm4r2XbylR79jYevWBAk4coMgqvubBjCNV2sKiHOPwsaE9cU7dEC9xqR3
         MUUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746366644; x=1746971444;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z+WxkHYKUkzW4ER/6Z9ItH8b6boPBxhsY28VmZL6mAc=;
        b=LQCzp7crO7r7iP/UnEA6CGwrAl0TRpHfs9vdcKo1GAKt5NGl+LsFyMxzGkeMAxyF6W
         4QwM4QywJqiC736bsk7XOgZF3TO+uCSjaGw8gBpKejKz1ll73zB+aoEtVxaRCRWpzoKq
         E0Ot0GqWCTVH8LthZQAmECwqoHDI3eFOp3JDsU5+uHCaZF/NP+4Qb/OeBhj6YndDxBWo
         zU1YFwYjhy0Nc7FUs9jb6jL8kZLjP3DEw5JnVIvn9Ve0Xfh6H/Q6xhp0Svu7Dc5xazv0
         OHgBaTYBoNO3mwfz7lSh1mdii3Ei0vRYrE2epQ+WjtKi2bTSlcjnX8AuUCy6cE9Ut/b8
         SinQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0Edp8Eyd2viuf1NiGxH+5wQoMnNTJ0naWEthT6PfvEI1kFdXijddoJVMfXvECFm8wyHojauLJKqjxT0Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVVQBS3H6NfaQbozbBpi/rYGni68lsx+wwd00iYjPuZIrY9QH6
	oOy5vDYB/GDIMLMiOLRhJSEy2VGttjJKMXz/dQlf8P7z026GIorcfej9rTuvcf4=
X-Gm-Gg: ASbGncvay0lgNZqQ+dDeZxLUgFPrT3POsVTiTjYh6RAFvWaNUtNCmOvMdddlMVhH7/7
	tud+TpLu/Gj3o2bSr2ZGx8lXumYEahDcS8WyFpsS3vF0gqL/ZhLyxakyClEXVHssUvpTl9k+FaZ
	/YFx2JkxDUbDIkPmff2XrjqwtdRPqc9O9YYyIFKIzAVD7eJivl2lndO3Hk61gpVKWgqVVoRFmpZ
	YphQTyWNk7lVnvQaG6+NYukVqJ68mSamPNueyS3H9603zArjzFzwX7MdnWVVbHUudxoTP+bAfIz
	nwtKcZhQpwWIldeTKNnjDiUE/WMGVMw6DwuM7aF8TNafk+6IBnp0FCaZJ24=
X-Google-Smtp-Source: AGHT+IEYCOZ+iY0a8P6rTepTPbdUWPxKR+5HMLJYKNnujHoa+RcUI4iTDfxw5wNiB9aCsPGWAf+6xg==
X-Received: by 2002:a5d:64ef:0:b0:3a0:86f3:451f with SMTP id ffacd0b85a97d-3a099af1f69mr2481210f8f.12.1746366643823;
        Sun, 04 May 2025 06:50:43 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae7bbesm7343717f8f.49.2025.05.04.06.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 06:50:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: christophe.kerello@foss.st.com, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250428-upstream_ospi_v6-v11-0-1548736fd9d2@foss.st.com>
References: <20250428-upstream_ospi_v6-v11-0-1548736fd9d2@foss.st.com>
Subject: Re: [PATCH v11 0/3] Add STM32MP25 SPI NOR support
Message-Id: <174636664232.45285.4829080141383638928.b4-ty@linaro.org>
Date: Sun, 04 May 2025 15:50:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 28 Apr 2025 10:58:29 +0200, Patrice Chotard wrote:
> This series adds SPI NOR support for STM32MP25 SoCs from STMicroelectronics.
> 
> On STM32MP25 SoCs family, an Octo Memory Manager block manages the muxing,
> the memory area split, the chip select override and the time constraint
> between its 2 Octo SPI children.
> 
> Due to these depedencies, this series adds support for:
>   - Octo Memory Manager driver.
>   - Octo SPI driver.
>   - yaml schema for Octo Memory Manager and Octo SPI drivers.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: memory-controllers: Add STM32 Octo Memory Manager controller
      https://git.kernel.org/krzk/linux-mem-ctrl/c/43eb1b288072641b7de8f5d5c15bde69e6e8589a
[2/3] memory: Add STM32 Octo Memory Manager driver
      https://git.kernel.org/krzk/linux-mem-ctrl/c/daee9b249992a88cb64fb6a67eeb333d359c6242
[3/3] MAINTAINERS: add entry for STM32 OCTO MEMORY MANAGER driver
      https://git.kernel.org/krzk/linux-mem-ctrl/c/ab455b75de7351a0277be3261af180e326b74605

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

