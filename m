Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5FD1F9F61
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 09:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746610859; cv=none; b=dLxFG8kojD/KYlpxN0lj+y3UZGvxbaQpgIxc/ttPdUiZ1wQzyLxjzq3tiXteQOCLWzNkVKo/e+lZ70IQ8qPphYako/zpacFd0SFEf6FZHDh1flY3vB76JeJR/pYC1+DXJM3ZbulVBhuf4UvJrWn8DdRA7hGorm7YljnPveIWmCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746610859; c=relaxed/simple;
	bh=bs6YtQ1JU4Jn2bZj4Pglpua0bzQp27vGMklQDNpTXPQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fUQbvne9NaW509EzVpbe91XJcOyEoiMfQacJy7vY+pVysg7qj025NycL2Pb0oiNUv32J2xWMKwEGW4LPKEy2o1OEecM9bfWp5MCGKzYDXQTs3/Yw9GDgVu35ztga9+rb+KlnPr36H9A8zk8awiVII1fdJ6um025uzL9uw50PVUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qyoSRpfQ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qyoSRpfQ"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cf861f936so11063125e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 02:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746610856; x=1747215656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SsMa39hOSR7BVVNPX8WISfqJOyg0i9Y558xWbDK1MN4=;
        b=qyoSRpfQ6hzPlbZ2wxKugE/yCXIxcjoQn0mGmKJsEVvfqXE6xzlRejSOSPDe3oLO0v
         2Oezco4hSuHi9Q6C3/CowezHtZnPx79KR1igZCU7ybzkyJcODROeOz/0bSUS1cMc77o+
         2yWrSvQRen60AAfQUFABuBBLggR1Eeimuz+FZ9EWumLcSxKfAn7YK/7DCu9uxLYPTIty
         Xr/b7n+vd8Tm0Trfbmmu6ZKUDV7BFjD0KmSxW6L9bP0ACb1IM0LhdP5siTOv8GBFVD+n
         cVTYv7OrIPafHQIboweaJwN3HvOR9qjINX2GXU4bP5/bKRQMg9WYYnHi8EzoYqLpdDmV
         eTLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746610856; x=1747215656;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SsMa39hOSR7BVVNPX8WISfqJOyg0i9Y558xWbDK1MN4=;
        b=l5MikufW+InvCc5NccvueeWTFapCggacqBt+MgtHEl9tjbA/VUZrvYpBqjiDY++cPk
         QgyiCk3POoWfPjb4AvRjXDOg1tEWkYrHf9OOMCNm++Zc/qTb3zQQkHxd4+NHGPhyBqOp
         74iNjNEQUYdH6pWZwHJTV0YxKDbM4CEqMF4qyR1ipgB0qOjasUTi4Pd63lc937nxXM0S
         cc3pgLaTDt1REM2LPuwmOOkrHx3RHxBWeTx0RETKZCCwK2tQgqeeXV7ulKe6+lec1c3s
         YTU3VIvG62J41rq5FTXi5GuoGfTElbIZMz3QKhMA3z0vp56g3hccTPdGlg4kyPYXE3Cm
         mHQg==
X-Forwarded-Encrypted: i=1; AJvYcCVQblibsX/pk/eIiV2FI0V/Lzbyd8na+57VH+qv33NfmTBjclGWJa9LUD+01+k6NGBv3IoUrhWXkw/43CQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTWmgM6Pue/X7R1Nq7Wih20H2O6YzB0OVuZaalTksa+Yb+dCEV
	oE41LtUaAuVsWNaHe0TcQ7vpKKqlfZ3cJvlPJB42TOQbdNGFGMuoAHMM4NTm0mg=
X-Gm-Gg: ASbGncstoOPJvKjnZGuFZBwWo73YQKFH3KXrLj6qACb0pfs+VKKMfkA00fq6+tuX1ci
	z+9gyQLofc1gENzm5JZIeHsjH07MHo5U+9tWJAX9kwkl6rkieyvtqaWz8U2HHXjaNHZ7iExhFvz
	g4hxLjN6/rxUKtEMC0fzMr6O1+2Hw3QKyCTh3NCOllWQZcqPP86vnu99aK4xzNXhk1WCPI8P9vd
	+GsoUDRraSRhe+mBv9zzfCVp/S8XK59NY0JXorIyv45ux2d1d/MSCtVLvcTyewib3NSVijNdeVV
	v4XANcUs57rEDAEKhM1DngnyF18xq1Q61WaqMfuo5v9CbbKF55bioDtTPOE=
X-Google-Smtp-Source: AGHT+IHHRs9t+0O91vMmvLRz0jrF3T3wosfwokty0h5PfPEgbCXS3pXL2K3J+ylcQS0xgqc/9SJF9w==
X-Received: by 2002:a05:600c:a36d:b0:43b:c844:a4ba with SMTP id 5b1f17b1804b1-441d44c28edmr7459275e9.3.1746610856002;
        Wed, 07 May 2025 02:40:56 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441d438e7f0sm25374535e9.29.2025.05.07.02.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 02:40:55 -0700 (PDT)
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
Message-Id: <174661085466.105567.8801540643758026671.b4-ty@linaro.org>
Date: Wed, 07 May 2025 11:40:54 +0200
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
      https://git.kernel.org/krzk/linux-mem-ctrl/c/4a98ec836a201d34ac27636960c2c81d9b3b7e19
[2/3] memory: Add STM32 Octo Memory Manager driver
      https://git.kernel.org/krzk/linux-mem-ctrl/c/8181d061dcff140fd5a40e568d8adb81f1403a28
[3/3] MAINTAINERS: add entry for STM32 OCTO MEMORY MANAGER driver
      https://git.kernel.org/krzk/linux-mem-ctrl/c/02eaee70babd860d76dc23f9165f4496d0ffe77f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

