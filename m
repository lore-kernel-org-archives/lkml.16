Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9272C324C;
	Thu,  5 Jun 2025 02:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749091441; cv=none; b=a8Qd9rZt7s4hjpJoffdl38QtuAOiAlQ5IFAdr+wGdQ1w3zsXYCgsd/TSfR8guueATO9iapffkThgKJ1wIBg9RHERRWClitrQAW+pFNlAEJ2yN9Q/Ds2lP0zf8+4djjYh6urZanfkk0ZBzl78PECCYoU3/2b8fQCiynYGscu5lQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749091441; c=relaxed/simple;
	bh=4GDvJfCxxN3w4XhJtKut9dr/C+eomdDqI6rkODQn1VA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qTogHLre6TviNazEEo4ypEpdtiTUV5NdmxNSe1rDQx/m0lh1lN8uTprx9EgTtSIDar6SYzNl9VP+9KCnlQtl2I9/h4dSwbzzGVvUP+stYGM1toezq9JMZN4VPQBprHtch/Z0n+wSfUnJ3UAXP9sex3w8qGMO+hjYeZ8+WfG5otA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IhyjMWPW; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IhyjMWPW"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so5205565e9.1;
        Wed, 04 Jun 2025 19:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749091437; x=1749696237; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BFSrb8j+TsZDDx26k/IZM4ETWwV2iNubnWTQvXXtJow=;
        b=IhyjMWPWumB21ge99c/s9SbvAMJ9tMUvO3Ob4eHGsfcAJ3avdqwzpj1r0RbSJOcv8q
         ouIKEilI64rgOZowXv2A9aqmUHq/TzqQVXJWAAszC6NfPR66BkhZHr3rO480wa5+hiu3
         x6AsThGUl6iqsZD9zpQa24CD9p/qsCi+yHBrpdj08Uzedkk23IBxQfyexQ69N5rJASpU
         xLfXo6NJvsA/qWvGT99ze2bv8U4sAE2AXWFCSEKVluZyhERNmbf9khPltqMesY0kjexW
         6fNsHze7Vz0p6id5Wbz9fFCTixIwnKPyAwfX9z0V2RGOWPSQNVjli9JYzr1jnMO5toPO
         Uiug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749091437; x=1749696237;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BFSrb8j+TsZDDx26k/IZM4ETWwV2iNubnWTQvXXtJow=;
        b=qPNCCG/e1rJEaUEgo28KN7LHq2wRIRdLb18hH+jp9+fS1K0g5zejp+TbS/gx9UT4QB
         g1IDjjgUsMC0CjL25S4YzYK2BOSpqQ1r31Fa7MtfHBmBVd5CrEXTrqPgsODDGWII8pYS
         LvXOar+IeDV6t4bp0mXKVng9eEiFG9E6r/Hv1RXKDknhIfvWDZg82HygPeRI0eGcOWVy
         s9oxqQeTRdAU1DKwgErcUkjkIwRsP9aNSfD3JX6RNvfQndkCHygh5a8nZR6L3UV38+JH
         MHcEUq4P9gQtKjwEBroGSiYRII4jLqCzhEgDy+j4dsKF5Ee7CCGQU1JqB2DsVbX3A/Jx
         /lTA==
X-Forwarded-Encrypted: i=1; AJvYcCXFuEkO7qXD4LB8pXxVUabd1u3aCdB5g8cqUba6lEBA0Xbsf+PRk8pfpgyGtc/LwiB+qqEvI2KMvCfQ@vger.kernel.org, AJvYcCXyM9MnsQZQlN/V9MD+iwh8PCUNnAXqsYvSVWhP9G1a+9+PEXCZQ7m8UA7CqyWCGHMi3648k5dRFpTMlNP6@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6/Io2o2uou4nH6Tqsi53Xfy+cnEcogNW1X725qan9YHMNC5Gg
	lIDlLMMkyPEi/YCBRCDlRWvNbK1Yg8xFbSBl4XPN30mLBz4Za45g47BSZdv/qIKTX4vqEiJgebp
	Pr06oOsPazmjpZEgKhPRh6aar2QB7tEM=
X-Gm-Gg: ASbGncuoGQYTZF4J0HNikRuNWi5Dn4aELVmuJL/mGUeRk2TmtjWCXJjw91X0n3glfzn
	CLp2mwo8hSC3diXC/Q/qNCSQ1IRtJGLntulDTHwpehyBgDMU4i5G/CNRHKz87R8FylrMhakxyKS
	fH05p+Szhqewt6sBAcF28QWVd6sd4UtX7AAVz5X8rvinXTtDig3fZHPQMTyK5mq+A=
X-Google-Smtp-Source: AGHT+IFSSZj0ukXU+2d3TU2Y4BCGC/2FaXL1ZAZo0ytno6jkv2ETLaLY19ZjsW9GYPHc8YHRKr8hlJ3OUwdWgf0Zwq8=
X-Received: by 2002:a05:6000:240c:b0:3a4:f038:af87 with SMTP id
 ffacd0b85a97d-3a51d967d58mr4094685f8f.47.1749091436596; Wed, 04 Jun 2025
 19:43:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com> <20250603-sige5-updates-v1-3-717e8ce4ab77@gmail.com>
In-Reply-To: <20250603-sige5-updates-v1-3-717e8ce4ab77@gmail.com>
From: Jimmy Hon <honyuenkwun@gmail.com>
Date: Wed, 4 Jun 2025 21:43:45 -0500
X-Gm-Features: AX0GCFt-8bMRNRfnCBvnWW5DVHg0Cj_xQytd5HCYOhhrfd9EqhtKt0epNoFKT20
Message-ID: <CALWfF7JOJSihtfqrFiZtTxnzvoU6FP3WXuWjYOVaAvjPJZWWgg@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: enable wifi on ArmSoM Sige5
To: Alexey Charkov <alchark@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> +&sdio {
> +       bus-width = <4>;
> +       cap-sdio-irq;
> +       disable-wp;
> +       keep-power-in-suspend;
> +       mmc-pwrseq = <&sdio_pwrseq>;
> +       no-sd;
> +       no-mmc;
> +       non-removable;
> +       sd-uhs-sdr50;
> +       sd-uhs-sdr104;
> +       vmmc-supply = <&vcc_3v3_s3>;
> +       vqmmc-supply = <&vcc_1v8_s3>;
> +       wakeup-source;
> +       status = "okay";
> +};

When you enable the sdio node on your v1.2 board with the broadcom
chip (using SYN43752), does the btsdio.ko bind to the device and
create an extra rfkill bluetooth node?

If so, you'll want to blacklist the SYN43752 chip in the btsdio.ko.
Similar to https://github.com/jimmyhon/linux/commit/81c14dc2dea2ceaea8d390188b352d32e278abc8
The original logic was introduced in
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/bluetooth/btsdio.c?id=b4cdaba274247c9c841c6a682c08fa91fb3aa549

Jimmy
