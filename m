Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FB5192D97
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744682674; cv=none; b=jkWphdEAjYlXkCZiAYjdPahtqlHB6OvZkHJMiL4KPKXMyant8YDHjB73RqyFm9f7szlhnixM7Al+22gW76u7Lkj/njFp53ocxz5nS0Z4Z6KNrGVtmyW1C7v3KaIRV41gmBFdi6BapxoKnW3LXd7jsK43wZI8iqgD4B1MQHk9/mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744682674; c=relaxed/simple;
	bh=tEDXzDkWlHgvvbX/JljUt2UxkVPnnZQtkQIAfB5Q7M8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lfHYtCwmjYkpGaoGcqMF4avoSZm1EgQopE0yILY2YOgUn2PAk8JWPNvTMLv0Y1wyarxqIO6bQ0xwK3VjffYaBnAuHFkCthGoY1JKQSsWtG2+RRnNVARBX/Ep+Bt0FsbVyrsq6Ya7FSku9pex8O7ZfC6+m/ozbKwfCH7em8rXRsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=v7IVIRgi; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="v7IVIRgi"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so4299369a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 19:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1744682672; x=1745287472; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vVKNwOsV5XMrSrMJnf19rxwG/iaJAJwZinmx64BUP7k=;
        b=v7IVIRgiEm06f5Sl1Ma+KA1tWciebQ/fDrAGee/jEludo/aWshcp+MAoUaXs0iL+qZ
         30kgwwr1ZxNS/fqcNP3IpW06bYrHW/q/4yeFRsO83bbi36t0YOnkwP8DbwPG/VsWd9Zk
         pY197cus+iTFVu8j6vM2XV0j38nZ3thbMBn+jMLL+Ey5vR/MmbQaCTTXCiJ+NYweXWPi
         r0BtIVbEDQjWa0dyeyv4+Lewf4QOZMVb+l9DQFhfgm+yxwb1qNM7973/RkPL2JULbUa2
         23XmYrMMMbzxa5IGhZvaxx1YmkK2bMU0ZNE071W/yY9OMkshH1ojP7IJTUlYxZIUwhdZ
         n9ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744682672; x=1745287472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vVKNwOsV5XMrSrMJnf19rxwG/iaJAJwZinmx64BUP7k=;
        b=VE9cY2WNnmrqRKeaUcSGtTO79dUQ2qbS659J/OVZubZLRVjrSFHPnCE7B5Ho7h0xpP
         vBW64Lq4ODw1cD1nMZ3AGsgEq+H/nvMeczRB6FgSkevUieby/DFimCnwpUNvBtZ807k0
         9Wz5OARkBJXrh3Xba31Fb9DPszbk4bQofBNJ0oiKMMzudn0itxuC0jdRwmWzdneY9pM2
         d9qE440Le6S/JNm15WyMPKu9363I4u2kt0pL9Bm4wyOAaMMXpDibfZpJKpKjJHPLKzgE
         d0Hih4yNCyzgIi6XeyPe/0CCUbz0vXNszt5rfj8MFpl0CEOpclmQc+OSyogfQy21GnjH
         IYdA==
X-Forwarded-Encrypted: i=1; AJvYcCVsSSV6kcoM+JWmNWHP0EvE2+D7DasA3htaTAnMW2i0IjuX4V1gQFP3LH6l6iTeBAmaneZTLuLsnxYuVtk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjBnvzCjKeND/huTYAYhtUhWTy709CHoGZVGIp6/F5SPa9W6Xa
	ashjzK18/++De5iPmtzziz/xtNdcNpYBCwxdSALW61dGM39NVj3+bGfi1wQyqdI=
X-Gm-Gg: ASbGncsKpjwBE0kdAMEQ6h70GF0eCUR7xPJxHFh/BfIwM9uXaREPbkJSNO2EcQhMmMC
	9QDZ0A/yxvpIsTaFytoQSIZPFeOVlhDpAQCIdVs3zcREqDCkGfcMyP7vhmKx7gy9g/jt3ievmG5
	b3YRBaQkAqFFXwfSkk0Bi+a/3CUTC4JXYkTJ2EJTyWXH+h09o9PFRW/ET+yu3yyFFkhmi0NZaTQ
	tTJznE/dys+t+VVqUsyw1RyxKUpcDAVCzYCpQKLNxjD3xn5ZbUgTmP8JQM81b+5dkXBAV+avVgb
	thFR+6nDETdLjqybAZKzOpzQsT29NplTF4B3vRXQiGbFqUg=
X-Google-Smtp-Source: AGHT+IEGINtwuIIvAG2vOyy+05/hzxGzcyCN3rLg9V0W9dc2TsjoIN0MbhxjBGLcyWirEoR5Ps2qpQ==
X-Received: by 2002:a17:90a:d64d:b0:2f9:c144:9d13 with SMTP id 98e67ed59e1d1-308237b9f43mr17682243a91.24.1744682672433;
        Mon, 14 Apr 2025 19:04:32 -0700 (PDT)
Received: from x1 (97-120-122-6.ptld.qwest.net. [97.120.122.6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd12b4d5sm13372486a91.25.2025.04.14.19.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 19:04:31 -0700 (PDT)
Date: Mon, 14 Apr 2025 19:04:29 -0700
From: Drew Fustini <drew@pdp7.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, guoren@kernel.org,
	wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com,
	matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, ulf.hansson@linaro.org, jszhang@kernel.org,
	p.zabel@pengutronix.de, m.szyprowski@samsung.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v5 19/21] riscv: dts: thead: Introduce power domain nodes
 with aon firmware
Message-ID: <Z/2+rbhsaBP0DQop@x1>
References: <20250219140239.1378758-1-m.wilczynski@samsung.com>
 <CGME20250219140315eucas1p10f08d297580edd114f4c487c1fbffa8d@eucas1p1.samsung.com>
 <20250219140239.1378758-20-m.wilczynski@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219140239.1378758-20-m.wilczynski@samsung.com>

On Wed, Feb 19, 2025 at 03:02:37PM +0100, Michal Wilczynski wrote:
> The DRM Imagination GPU requires a power-domain driver. In the T-HEAD
> TH1520 SoC implements power management capabilities through the E902
> core, which can be communicated with through the mailbox, using firmware
> protocol.
> 
> Add AON node, which servers as a power-domain controller.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index 197df1f32b25..474f31576a1b 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -6,6 +6,7 @@
>  
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/clock/thead,th1520-clk-ap.h>
> +#include <dt-bindings/power/thead,th1520-power.h>
>  
>  / {
>  	compatible = "thead,th1520";
> @@ -229,6 +230,13 @@ stmmac_axi_config: stmmac-axi-config {
>  		snps,blen = <0 0 64 32 0 0 0>;
>  	};
>  
> +	aon: aon {
> +		compatible = "thead,th1520-aon";
> +		mboxes = <&mbox_910t 1>;
> +		mbox-names = "aon";
> +		#power-domain-cells = <1>;
> +	};
> +
>  	soc {
>  		compatible = "simple-bus";
>  		interrupt-parent = <&plic>;
> -- 
> 2.34.1
> 

Reviewed-by: Drew Fustini <drew@pdp7.com>

I tested this on top of 6.15-rc1 and found no issues.

-Drew
