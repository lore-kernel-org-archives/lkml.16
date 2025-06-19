Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7542556E
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 02:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750301421; cv=none; b=sgovaqMWxGgxs8nvDCjweifdFQJwH6fD9XnrgZ01HEXh2UvsoTzb3N9HW2RbtCSyzHvBsQf5/kpCI78QcU1W3J9dkmB/Qe+mMQfd0cpGvEVYS3Q5We8cmlzjXqGUK8M/8LcQACY1yYV+BRIQ4J5SnZ5u3lmqgXmzrb8gU3AgqQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750301421; c=relaxed/simple;
	bh=iJcBSfG+nm1MBrPhYrWZUr0TYe4Yf60WLTUAK/r6mlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ESUetTOOlRV0L0ZeI6d0H/tHpTq7y+tT5liggTJ4S344OqXFzm8NvF+hNvjKhIexqllcw70LYzTW6znvJQGXhxW1fkpQsKlvetZGWpZLVEYejEsF6FyzGgOlmma1rWIspbr3T3wUhHeb7OD56cqD0GmAxqMoya3WfSmzBcRsMIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=zClKA5Nd; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="zClKA5Nd"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7fd35b301bdso393511a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 19:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1750301419; x=1750906219; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tB8e1qVEfhuTIR6cCezHfjL1333Oy60fxLgjuSXst14=;
        b=zClKA5NdFcZ7xzosWBVTfvmjeZPelkG4jwrzZbQyED0OmTl33fOCymfsbml1aK8kpS
         9RPQQi47CRyXeiYOKxKUtzgRn6kp+42sc0jRVTyMZbk/YyOmzAIXJpGFtjcmiYMpwSFg
         BpiiDip0wgt4aHHg4ylo4fPxR/0PpQpo1px11+/UNF5KnxbPfVhqNNv8bfISlgrj8K0m
         T6nyAKD8jXiZK9YWJbNk+GM2uMjlBpqqNaWfETMCwX+Nt+lI1FP0c0MkCyDLY3+90LAt
         yexXJsaieGoEt/z+o8QCYZk2u6GppGJJf9v+5bJmXyxKTk05cEy0VVjJrhK7VZLBAYW8
         ZqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750301419; x=1750906219;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tB8e1qVEfhuTIR6cCezHfjL1333Oy60fxLgjuSXst14=;
        b=BO60PK7M5dwFWa+ZYhsGwEM7AkRWdNCL02hTQz1nL5g8rKMJvVRl1ftptbUd9++QrI
         gRus/2UZLwv/UqifQk8p8tTCR+8xjp3d4ktbFpitoKirZk/CM9h2DJnpD9g0KvvicTtv
         r45Lc8LK76pWFSj+To6FB+BT+1gEDWLTfyCfknuEiilvUi2Ratm6ttvt8qYoYMvUfUiO
         j3+NeR5ivP9RzXNesgTeweFEF5lFdM1NV+hYTqlsNQIG0bNgcW4s8rnAwJ/o0XoFaeMo
         h9FcJFx4uR7vTt4sCu2xXwPa3mjDukvYbNZp0G5Xx3KiwpuGfnREOXYnRexGgIRxmtjP
         Ny9A==
X-Forwarded-Encrypted: i=1; AJvYcCXaOef6dFz5UxCZQxzhUb8IG4yZq2g4/ScHwGnw6UQetzfq/kMagmfHf/jgL7d5jEpSXgdzNJ6B5/aRmss=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdVC+OAjsiqsgKyWJ4mYJT6gspOmS3tnieQRmKFAe+JihyGRCM
	X8mof7CZwfwtq/7SeOXqZuzImw68nYPuHrYEv1JEufNcAxqJUTG/ZBm+7ZDCz1nqAg8=
X-Gm-Gg: ASbGncuCOa62tMnJTXzpqDXPUkVQoeaaI7a8m9z88HL/Zf+O9v7nuKqeA1cRjGLqrpX
	v1JW9CIKTJ99eaI+Aq00rFEUobIX5OkykdpelrMsHkFs+NOkPvzBNllgY/f+XB9ePsn+vbRnW1P
	+x03P0qZRV/+2SxnCeLhtCWA9h8b62kupoPdNMECJs+SMF1psjORCOHMlcZn3U/uWd2FimMH84g
	agHlDR2QSRQ1Xv2jhsMxp+HqQ/fsozURx9dRZnfId+dAxp+rxZaUxmCy8jr/i8IUqr40Ox+5L3H
	HHbFjjiQHFFR+q8TAHhMgykxB4JX0F9xFN6q1UExoWZ5+kVE2N+i06HCtAUdMvWgu7KPls4=
X-Google-Smtp-Source: AGHT+IFubn9Xjjn7fmMto+xZqblm2yd0WPXfa0iuVG1BkV+6lAGb7+2YAe7yAyYCgSsbecVsjsPVIw==
X-Received: by 2002:a17:90b:524b:b0:311:ab20:159a with SMTP id 98e67ed59e1d1-313f1d1c00cmr26840306a91.29.1750301418839;
        Wed, 18 Jun 2025 19:50:18 -0700 (PDT)
Received: from x1 (97-120-250-80.ptld.qwest.net. [97.120.250.80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a25617asm985583a91.33.2025.06.18.19.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 19:50:18 -0700 (PDT)
Date: Wed, 18 Jun 2025 19:50:16 -0700
From: Drew Fustini <drew@pdp7.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 7/8] riscv: dts: thead: th1520: Add IMG BXM-4-64 GPU
 node
Message-ID: <aFN66I9GsCb9qC4G@x1>
References: <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com>
 <CGME20250618102233eucas1p228b24f58e4cb3d15b0f273530b582cea@eucas1p2.samsung.com>
 <20250618-apr_14_for_sending-v5-7-27ed33ea5c6f@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618-apr_14_for_sending-v5-7-27ed33ea5c6f@samsung.com>

On Wed, Jun 18, 2025 at 12:22:13PM +0200, Michal Wilczynski wrote:
> Add a device tree node for the IMG BXM-4-64 GPU present in the T-HEAD
> TH1520 SoC used by the Lichee Pi 4A board. This node enables support for
> the GPU using the drm/imagination driver.
> 
> By adding this node, the kernel can recognize and initialize the GPU,
> providing graphics acceleration capabilities on the Lichee Pi 4A and
> other boards based on the TH1520 SoC.
> 
> Add fixed clock gpu_mem_clk, as the MEM clock on the T-HEAD SoC can't be
> controlled programatically.
> 
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index f3f5db0201ab8c0306d4d63072a1573431e51893..c8447eef36c3a6e92d768658b6b19dfeb59a47c4 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -225,6 +225,13 @@ aonsys_clk: clock-73728000 {
>  		#clock-cells = <0>;
>  	};
>  
> +	gpu_mem_clk: mem-clk {
> +		compatible = "fixed-clock";
> +		clock-frequency = <0>;
> +		clock-output-names = "gpu_mem_clk";
> +		#clock-cells = <0>;
> +	};
> +
>  	stmmac_axi_config: stmmac-axi-config {
>  		snps,wr_osr_lmt = <15>;
>  		snps,rd_osr_lmt = <15>;
> @@ -500,6 +507,21 @@ clk: clock-controller@ffef010000 {
>  			#clock-cells = <1>;
>  		};
>  
> +		gpu: gpu@ffef400000 {
> +			compatible = "thead,th1520-gpu", "img,img-bxm-4-64",
> +				     "img,img-rogue";
> +			reg = <0xff 0xef400000 0x0 0x100000>;
> +			interrupt-parent = <&plic>;
> +			interrupts = <102 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk_vo CLK_GPU_CORE>,
> +				 <&gpu_mem_clk>,
> +				 <&clk_vo CLK_GPU_CFG_ACLK>;
> +			clock-names = "core", "mem", "sys";
> +			power-domains = <&aon TH1520_GPU_PD>;
> +			power-domain-names = "a";
> +			resets = <&rst TH1520_RESET_ID_GPU>;
> +		};
> +
>  		rst: reset-controller@ffef528000 {
>  			compatible = "thead,th1520-reset";
>  			reg = <0xff 0xef528000 0x0 0x4f>;
> 
> -- 
> 2.34.1
> 

Reviewed-by: Drew Fustini <drew@pdp7.com>
