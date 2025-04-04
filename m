Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1009D1B4242
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 18:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743792924; cv=none; b=ReMrXq6CwwjS5Ia2ohnAeIB0MY2rRVON4wNduzuto2NneM59+ht9+0sU/F5ZRHPQiqeKG42yWuOVzVFKAwyeMdt3oCGWsKRUIs3ta+diGaf7jonUghmmyg0nXkh8miZbkwrrLWX75kzlOd56uZr71UjnWA+OU5L+RCb6yHvgqNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743792924; c=relaxed/simple;
	bh=VfeedzAG7UGtPpSXuBMYVnF8aSHrgVbQjdxnN8frKgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ccLNW717LYkZ77Owqo2JsCY2oWLWQCSOrdCaKNQMAHZgxps2YxTzc8uVqhuV6V9EEyMB/BmIIcFvBWQQ1jvrodBSut3blGw9lqm8dPBDrvLSHsISXx2NsUQII93a9Cwnrb/d4yNbgEiCi0Saja09ez2gm8NYB1dPd+SJp4XpdoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=DOLIei0e; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="DOLIei0e"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-227aaa82fafso22502845ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 11:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1743792921; x=1744397721; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=32troSjWvB/PDlVrpO70BnGFukXnYd/0VAcsVL2VxIE=;
        b=DOLIei0ecBYGFmicWeKfI87N/P67NqV9YEsJR1Nc7HvTZqxxIhVEpIo1lsB0YKg5qa
         L/BxUwXOuJvF0/LV5vxUjG30mMi5XHqiGguC8u3bg0d+HOF6ADEbYnPaOqf/HRrnLxCj
         hy/9t4Of0LEas01mlWuodDDJnqlZIIO2/y56CPaiob5Fh8d4n/GbIAYC/p1WMfKuvsZy
         wqk4VaAbqlD0luES9CaXDhDNG/56ytgbPBUENTxl/585/D7g1OfoHu52dH9YCSBCwSy4
         2Zcm/8hWDjlUMpQ8ms/Zl3BtPFrgChehC7iirN3Ej0iZ8EqQS4QPpPOE7aoNHvNrIys/
         IM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743792921; x=1744397721;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=32troSjWvB/PDlVrpO70BnGFukXnYd/0VAcsVL2VxIE=;
        b=qbj8wPQ/PlAIpZ6LWX35ELag2k0Xt/8B9Vs584BeRUa1GGL9Gl2Kxpin8B4ryQ41JN
         faDhL1pCZLOq3Ci0LweYptQvoYsJxvNnbv1zUO0g6SHmm5bM2v+Mh7d3Bwfp8t+Nmc5I
         Q3M6i3beYxkDK43IqHRt+HZdXu969faRoEP1ODRIrbuNUxyw6EcDmt8X+nmYEvklZtEi
         xNnxTKK+u7QcCx6B7R6ldVYOtVs0s/C9huHljQOs6P21KQYG/DYtpvTsJ4frKhwHY8kL
         l89sdcgXaZYq0xooVZ4rI4dYVdUGNtNK8XrQ6vskADh18iJ8srzIqhic0IVgQsrYfY0E
         Tx4g==
X-Forwarded-Encrypted: i=1; AJvYcCUFxlnkkyQPW+iXcyCL/p4RMKy0eJ3S5Gjesve5+zN24WSnu/z/Yeg6A/0I/ml5qw5KQ+NAAzpcanYXRgU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfVJt2krEf/kRf2sAzO4LCSZk8/A1tPMTFGqHNfmjQU1Vh8q3B
	Ac/O24+ZbALu2IEJqvR01M7bC66Xp41Zo92etMej9TInioEfKanczFZL3st0IYk=
X-Gm-Gg: ASbGncv8ddIH0o0ZeXw/gyPfFYwQFbsBU54QiZMXHknh1JMXlxWVA+N4cV2L4OkJdmt
	mUzNayCBsvuP7OIVRYjvVlXIcAmiBpPdDjsLB9JZsWyIc9IqdBZztHdOUeIsY/LR3uwQFKOS1q2
	o/vf0u+TK5NMy6MMBYr2yADmhqcHxf1gi5hG9Z1FxPFtawG0uo3Mjld7RP1BWJ8oxKqfE1CUXg4
	hzUWdl2o6gEsLIC8QOUNswdKAQ0uuy88ig3KCfW5gdLfI5oG82vV9igzAFIc5HjB2z5cp9KKnH8
	J8bkExvDCJ4mdDlYjtwQNkvp+acK0fA5ldM=
X-Google-Smtp-Source: AGHT+IECmYP3SjonjrfaeQPGWit3y+M9U7cHmSeJkMMAtjCbnPOJUL/PaAkD08+LqlcqZzBhgLpMMw==
X-Received: by 2002:a17:902:ef10:b0:216:53fa:634f with SMTP id d9443c01a7336-22a8a1d4617mr66236245ad.48.1743792921190;
        Fri, 04 Apr 2025 11:55:21 -0700 (PDT)
Received: from x1 ([97.115.235.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866e4c2sm35763515ad.199.2025.04.04.11.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 11:55:20 -0700 (PDT)
Date: Fri, 4 Apr 2025 11:55:17 -0700
From: Drew Fustini <drew@pdp7.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>,
	Conor Dooley <conor@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	guoren@kernel.org, wefu@redhat.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	jszhang@kernel.org, ulf.hansson@linaro.org,
	m.szyprowski@samsung.com, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v8 5/5] riscv: Enable PM_GENERIC_DOMAINS for T-Head SoCs
Message-ID: <Z/ArFVx6l5Urh9KV@x1>
References: <20250311171900.1549916-1-m.wilczynski@samsung.com>
 <CGME20250311172035eucas1p104dcbae706bec735194a1dc4a30db969@eucas1p1.samsung.com>
 <20250311171900.1549916-6-m.wilczynski@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311171900.1549916-6-m.wilczynski@samsung.com>

On Tue, Mar 11, 2025 at 06:19:00PM +0100, Michal Wilczynski wrote:
> T-Head SoCs feature separate power domains (power islands) for major
> components like the GPU, Audio, and NPU. To manage the power states of
> these components effectively, the kernel requires generic power domain
> support.
> 
> This commit enables `CONFIG_PM_GENERIC_DOMAINS` for T-Head SoCs,
> allowing the power domain driver for these components to be compiled and
> integrated. This ensures proper power management and energy efficiency
> on T-Head platforms.
> 
> By selecting `PM_GENERIC_DOMAINS`, we provide the necessary framework
> for the power domain drivers to function correctly on RISC-V
> architecture with T-Head SoCs.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  arch/riscv/Kconfig.socs | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 1916cf7ba450..83833ded8908 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -53,6 +53,7 @@ config ARCH_THEAD
>  	bool "T-HEAD RISC-V SoCs"
>  	depends on MMU && !XIP_KERNEL
>  	select ERRATA_THEAD
> +	select PM_GENERIC_DOMAINS if PM
>  	help
>  	  This enables support for the RISC-V based T-HEAD SoCs.
>  
> -- 
> 2.34.1
> 

Reviewed-by: Drew Fustini <drew@pdp7.com>

Conor - would you be able to take this Kconfig.socs patch?

Thanks,
Drew
