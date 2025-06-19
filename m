Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2E71A314C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 01:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750297852; cv=none; b=ch9AKpUbJVbWC4JO0uzk7CuVcbRhHvMjPlt+IJFuG8yA3+yX0ZcaAG2xui7bbIpTNJmFsJKj3Qusb19Zk2WnRkEdUHi7rY8bMIBgda1OuXKF1H5ERAYQyeYGlDmtZQTV4V9wr4Zh94f7g8xWNycxWja46yfCA4P19lghfNx+35w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750297852; c=relaxed/simple;
	bh=LJIIB8Y9KBiJiHVobgfRu8lyn8BY9L9gB/pucGaNm4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AyCuqg66h1engjT1wLE5WlFeQHXDTapMf0BXaPbX9lqmHpjiIj9d9/RFvlx/rlMsYzkgsO+t/2fHrKmKpHrRGdzBn01fPX1+PIEr/UmFxnoyeyZY/AZRtfmIuDY+rofNR590ErEPFSZ5pG6h1bcUnMZUUxpgj0m4kln4eM6O6aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=zn0uKbAg; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="zn0uKbAg"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-313f928718eso142640a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 18:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1750297851; x=1750902651; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=77PKh9SalLpybL3AAe7PoOLwMgQqtz9KiJ/uaTkWDSw=;
        b=zn0uKbAgSrLAvfDqV19BsF/Dt/jnN/PCgcpL+67bPnrihGF53lfSk3MyzGmTDP9FHd
         0ixUSsncp8J4U3gYoHVAcjhh1iqIYc/6J92wp45EmGAueHOjViZMFpNA690efLuVqbXw
         qFuYkM8n1oBLBSM/+tKqTB/MlNLM5Cvzuozp2vleI57k1W8WsRMYwr9zAXa5AHatGbvi
         +CrjzEw1U76ydJonHk9DyHLOExOGCntbzhMwUEklcl5LKtLl0xWyFkydOTuOwgw5gAhc
         ZJgNIXWLx6VE52aRN2NbjbzdXN39R2zk5i10bzIy18Rw/SZdIOAA05b/MfADPUJUn0yf
         VJFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750297851; x=1750902651;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=77PKh9SalLpybL3AAe7PoOLwMgQqtz9KiJ/uaTkWDSw=;
        b=nu5FUXXxrjX9MhfgHUNSzSAWZOdAowtzqIZ6LOsSzkKVJI2/YtqhhkI47UIBsJxb+2
         eoEUsN4bw3WPWsleQ0AV8bVKx0WwAw+cIhEYmTcrgXv7IKGw8O/iprrO5Yo8L88rWO6D
         aVRvKlW9zhwBKKeyHapZeAEhXMJRqHDsmNIhBP6wqZzkltUJsDwODOKCt8TI7aCZHVOF
         yWbOVQyFPwXxCqRedc6uISZDIsvyWw8HPneDxkAIjfVeRs+NDFHvRpmEJwujUMPMZ7b8
         74GWpXT2ldmYuOdPhxXqd470Lagb45VoJfF2yrPQhenn1wRF8jRTePpnE/Pe3yPTiB6/
         HNNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBmYfT0YEiJZh8sVEAOSO80xHCaqlTectHWX9FibkUbYPZmLOMTbDyB8aqBpol0Oqy793dVekoR+V3LHQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ4L4GAhYm8Q8rR1zhbVO/rybJYXqgAwwSV4jmCSz7BWN2hPNr
	+ylB506B4xPr/nzWS4VcPXui7Ydf18lj2ASwALMsgWv+1cnsiSo4iaEhJl3JgX/dbGQ=
X-Gm-Gg: ASbGncuWzl64Zrn4trHrW1oLorwRZyfN7rDQaEOcxN/ry+fLequRM94d8rfXVZtqECy
	ywMslEarJcGN67gzlQfBx9qVWQ6njMudKeV18iMH1dDzpRsJ/wOFqqqTj31H024zYFQ9XIpGv6K
	Q8+/8fewL0qlhuXmTwD2706RJDzKOGba1QDW5u3WVK5jlMBG+gyaL26mYHqM/43cv5ueJwyj+GZ
	0RI5Q1Shv++CJRGkkQVd5/6CEGCVIJRb0+FWl/2USRNrvh7QI/T9b6o/PoarhG+DiTav8FfHTbo
	xQm95LBIgkiG5IH66p7ayPBMJQoPakLXqnVUyOWjF6ifm8YYN8RICbUtjwHoPWMSi/35eIk=
X-Google-Smtp-Source: AGHT+IEH8ENEIXXiapQFn7dY5pW85bznCSDAM8YeveXgruCVaip94nhm+ZCyfl9XM7JJOLVmNJsDyw==
X-Received: by 2002:a17:90b:586b:b0:312:39c1:c9cf with SMTP id 98e67ed59e1d1-313f1be1c89mr31855817a91.7.1750297850614;
        Wed, 18 Jun 2025 18:50:50 -0700 (PDT)
Received: from x1 (97-120-250-80.ptld.qwest.net. [97.120.250.80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a226f7asm811267a91.10.2025.06.18.18.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 18:50:50 -0700 (PDT)
Date: Wed, 18 Jun 2025 18:50:48 -0700
From: Drew Fustini <drew@pdp7.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 2/8] dt-bindings: firmware: thead,th1520: Add resets
 for GPU clkgen
Message-ID: <aFNs+PLgw1jqqiUm@x1>
References: <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com>
 <CGME20250618102227eucas1p26e8968805092c3ce0ecbe84e9724a6e2@eucas1p2.samsung.com>
 <20250618-apr_14_for_sending-v5-2-27ed33ea5c6f@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618-apr_14_for_sending-v5-2-27ed33ea5c6f@samsung.com>

On Wed, Jun 18, 2025 at 12:22:08PM +0200, Michal Wilczynski wrote:
> Extend the TH1520 AON to describe the GPU clkgen reset line, required
> for proper GPU clock and reset sequencing.
> 
> The T-HEAD TH1520 GPU requires coordinated management of two clocks
> (core and sys) and two resets (GPU core reset and GPU clkgen reset).
> Only the clkgen reset is exposed at the AON level, to support SoC
> specific initialization handled through a dedicated auxiliary power
> sequencing driver. The GPU core reset remains described in the GPU
> device node, as from the GPU driver's perspective, there is only a
> single reset line [1].
> 
> This follows upstream maintainers' recommendations [2] to abstract SoC
> specific details into the PM domain layer rather than exposing them to
> drivers directly.
> 
> Link: https://lore.kernel.org/all/816db99d-7088-4c1a-af03-b9a825ac09dc@imgtec.com/ - [1]
> Link: https://lore.kernel.org/all/38d9650fc11a674c8b689d6bab937acf@kernel.org/ - [2]
> 
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml b/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
> index bbc183200400de7aadbb21fea21911f6f4227b09..3365124c7fd4736922717bd31caa13272f4a4ea6 100644
> --- a/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
> +++ b/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
> @@ -32,6 +32,13 @@ properties:
>      items:
>        - const: aon
>  
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: gpu-clkgen
> +
>    "#power-domain-cells":
>      const: 1
>  
> 
> -- 
> 2.34.1
> 

Reviewed-by: Drew Fustini <drew@pdp7.com>

I'm wondering what tree this should go through. Ulf took the original
patch that created the binding.

Thanks,
Drew
