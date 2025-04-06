Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8E119D882
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 19:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743969547; cv=none; b=MMyy7nq3S3V8VHdVAFoPcmrlyp1K1iRx3X5+EAGapiE64DhEuPG5mHvbXwt1BVbDvogqfHs3iSuRmek5dDz5uriZ9xUPBSwGr8ilNe35vVdMPTgoTdip3M8z6zz/KqIHenEAS5StgSjuYK4m+aq2TEugn8A4EXEtP0wKC0PAfho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743969547; c=relaxed/simple;
	bh=DUla9+p5r8C0yNX9gzDL4CLbxH7aHNhbKcNDbGisa+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fxPCXpXEIWburkYlxMxQZXz4BRk9DbtYlQdtfs5SdFn3EKv3oYiM5V1LLp3QuwbkzfB71FbbeZTPeiHUin0vd4rsuNGDAlOY5rlVfGJc4n8FWOK03Z3ON3RzxWMMwl/CkIssqD6/9kJS1maxAzk1TuqxhJY+QLl4CkG7KpOQUKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=r3kq5Ee+; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="r3kq5Ee+"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-af519c159a8so3226611a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 12:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1743969544; x=1744574344; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cSV5brJCU8FRwDjADDTtVWC1mi4xZgKh3TRBBKKlcb0=;
        b=r3kq5Ee+SM40UUg1BYtsIRai96rsutbIE/EZp7Ry8PRsFoCOLiYOlZiLTv09uGlpS0
         6rlPEzCN80LwP7qqO0GWLncoe5SByqQ0XfJmFGsZCkNGidboKoeGZPxTpHYfukGJ7Bx/
         bBS39UkA1ZEnOg+8s4sJH8kUmyL52SEQCUmSKvY2a1ykFpLMa4oFd7/I8bd/1rLGp90o
         6sYEpNqhB8mk6/U4RcE/owo6GY/QbbnyDzo6XZV3pbR+RhL8yJCisQLsjgPjjW8vhTVr
         Qo7Xds3PvRIO+XYjpzLbNJyZIRoYTiZ2KwpLXDlRDQR+ZUXaAjyGyua0JL63V5CVN88J
         qvxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743969544; x=1744574344;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cSV5brJCU8FRwDjADDTtVWC1mi4xZgKh3TRBBKKlcb0=;
        b=UIwOv2GFtI0tTt4eKtHSV9D2CohZ52f8YCDnt9hXWHOQkxe9bCHKLUTV76xhjNIYEG
         wxHKTllLS3XHHTJ1pXDighlsbQ17/6yLdkRNWF5AdoGWHKWjhIzjpmuiUtKrBh6ICslU
         j5E8OFhV96rdlGc+v3ImuXDabLI6VQN7KCMRSxEHtgIsqOswTz7PIR9c2/8O/58DZj07
         6T0dtMgGL3IP75rFOQ1k6D+uRBLNh9s4m6MKgw7bzeUzpcZ3OPM/LCnethlPaUmXnhvA
         /OIHUkWK9qdmww2KKjIJk6pHx0aVQQO2FyboUijbs26RsCzLHzz0Hm9YCDMIbB3q9GSQ
         9xeg==
X-Forwarded-Encrypted: i=1; AJvYcCVkqIca80e4DPvplOsZ2zBaFgDD//Sts3VnImXNPAdb38ZMijnFANZURTvXOvF56yCWAxLmnSSSs/a4iP4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAO7Q+ZCh8pODI8jbC/aUFoRnWiuLUGe7x8FiSiklUdjGUZss8
	+Cv+xIvpC0k3SvdVnbDDjCSafcJvT/XhYBlVp9nAsePyM+lEjRqR6oY61Pu2h/U=
X-Gm-Gg: ASbGncs/+Amsx6aV4faWo3n/WYzg8x5c3fhQOAJmjFtEICuROp73laksQSIFF87YrK7
	cKxgSBqI3OnRLsM5dfu1I+VthSTCAuS+OvqDkGBKS2quVvR9kbMOOkr0haXN596yXHTv3fDyFaI
	kEJLfTPnEw/JQ8O87SORCS9yrx8ejRqK7d0ijR7HaO1crihkJrA+s/gLOi0Tcr3AHupfG7x4vKy
	B+94r8qgYIzby5X+c6F9+Ea0JdIGJ67vFymV2QYMPKNqZAx1z8PzdM2bdPiZjrFOLTL07WpB/I9
	hzm0AAgYjGqC5yXYIIxPMwim
X-Google-Smtp-Source: AGHT+IFHfOOl6mZeB5Mp3Yf4a024PZQ1azNnZAt0Xlq5r9Sp57KSEDZ9mlf7RbY8QgX4UurEi2QyFw==
X-Received: by 2002:a17:90b:274c:b0:2fe:a545:4c85 with SMTP id 98e67ed59e1d1-306a6268598mr13951024a91.27.1743969544093;
        Sun, 06 Apr 2025 12:59:04 -0700 (PDT)
Received: from x1 ([97.115.235.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057ca47ec7sm8413268a91.15.2025.04.06.12.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 12:59:03 -0700 (PDT)
Date: Sun, 6 Apr 2025 12:59:01 -0700
From: Drew Fustini <drew@pdp7.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, guoren@kernel.org,
	wefu@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, jszhang@kernel.org,
	p.zabel@pengutronix.de, m.szyprowski@samsung.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v7 1/3] dt-bindings: clock: thead: Add TH1520 VO clock
 controller
Message-ID: <Z/LdBTtAj2+J5nbb@x1>
References: <20250403094425.876981-1-m.wilczynski@samsung.com>
 <CGME20250403094431eucas1p21412dff1c24aae077fdfeef08e0f802b@eucas1p2.samsung.com>
 <20250403094425.876981-2-m.wilczynski@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403094425.876981-2-m.wilczynski@samsung.com>

On Thu, Apr 03, 2025 at 11:44:23AM +0200, Michal Wilczynski wrote:
> Add device tree bindings for the TH1520 Video Output (VO) subsystem
> clock controller. The VO sub-system manages clock gates for multimedia
> components including HDMI, MIPI, and GPU.
> 
> Document the VIDEO_PLL requirements for the VO clock controller, which
> receives its input from the AP clock controller. The VIDEO_PLL is a
> Silicon Creations Sigma-Delta (integer) PLL typically running at 792 MHz
> with maximum FOUTVCO of 2376 MHz.
> 
> This binding complements the existing AP sub-system clock controller
> which manages CPU, DPU, GMAC and TEE PLLs.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../bindings/clock/thead,th1520-clk-ap.yaml   | 17 ++++++++--
>  .../dt-bindings/clock/thead,th1520-clk-ap.h   | 34 +++++++++++++++++++
>  2 files changed, 48 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml b/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
> index 0129bd0ba4b3..9d058c00ab3d 100644
> --- a/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
> +++ b/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
> @@ -8,7 +8,8 @@ title: T-HEAD TH1520 AP sub-system clock controller
>  
>  description: |
>    The T-HEAD TH1520 AP sub-system clock controller configures the
> -  CPU, DPU, GMAC and TEE PLLs.
> +  CPU, DPU, GMAC and TEE PLLs. Additionally the VO subsystem configures
> +  the clock gates for the HDMI, MIPI and the GPU.
>  
>    SoC reference manual
>    https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf
> @@ -20,14 +21,24 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: thead,th1520-clk-ap
> +    enum:
> +      - thead,th1520-clk-ap
> +      - thead,th1520-clk-vo
>  
>    reg:
>      maxItems: 1
>  
>    clocks:
>      items:
> -      - description: main oscillator (24MHz)
> +      - description: |
> +          One input clock:
> +          - For "thead,th1520-clk-ap": the clock input must be the 24 MHz
> +            main oscillator.
> +          - For "thead,th1520-clk-vo": the clock input must be the VIDEO_PLL,
> +            which is configured by the AP clock controller. According to the
> +            TH1520 manual, VIDEO_PLL is a Silicon Creations Sigma-Delta PLL
> +            (integer PLL) typically running at 792 MHz (FOUTPOSTDIV), with
> +            a maximum FOUTVCO of 2376 MHz.
>  
>    "#clock-cells":
>      const: 1
> diff --git a/include/dt-bindings/clock/thead,th1520-clk-ap.h b/include/dt-bindings/clock/thead,th1520-clk-ap.h
> index a199784b3512..09a9aa7b3ab1 100644
> --- a/include/dt-bindings/clock/thead,th1520-clk-ap.h
> +++ b/include/dt-bindings/clock/thead,th1520-clk-ap.h
> @@ -93,4 +93,38 @@
>  #define CLK_SRAM3		83
>  #define CLK_PLL_GMAC_100M	84
>  #define CLK_UART_SCLK		85
> +
> +/* VO clocks */
> +#define CLK_AXI4_VO_ACLK		0
> +#define CLK_GPU_MEM			1
> +#define CLK_GPU_CORE			2
> +#define CLK_GPU_CFG_ACLK		3
> +#define CLK_DPU_PIXELCLK0		4
> +#define CLK_DPU_PIXELCLK1		5
> +#define CLK_DPU_HCLK			6
> +#define CLK_DPU_ACLK			7
> +#define CLK_DPU_CCLK			8
> +#define CLK_HDMI_SFR			9
> +#define CLK_HDMI_PCLK			10
> +#define CLK_HDMI_CEC			11
> +#define CLK_MIPI_DSI0_PCLK		12
> +#define CLK_MIPI_DSI1_PCLK		13
> +#define CLK_MIPI_DSI0_CFG		14
> +#define CLK_MIPI_DSI1_CFG		15
> +#define CLK_MIPI_DSI0_REFCLK		16
> +#define CLK_MIPI_DSI1_REFCLK		17
> +#define CLK_HDMI_I2S			18
> +#define CLK_X2H_DPU1_ACLK		19
> +#define CLK_X2H_DPU_ACLK		20
> +#define CLK_AXI4_VO_PCLK		21
> +#define CLK_IOPMP_VOSYS_DPU_PCLK	22
> +#define CLK_IOPMP_VOSYS_DPU1_PCLK	23
> +#define CLK_IOPMP_VOSYS_GPU_PCLK	24
> +#define CLK_IOPMP_DPU1_ACLK		25
> +#define CLK_IOPMP_DPU_ACLK		26
> +#define CLK_IOPMP_GPU_ACLK		27
> +#define CLK_MIPIDSI0_PIXCLK		28
> +#define CLK_MIPIDSI1_PIXCLK		29
> +#define CLK_HDMI_PIXCLK			30
> +
>  #endif
> -- 
> 2.34.1
> 

Reviewed-by: Drew Fustini <drew@pdp7.com>

I think this makes sense and dt_binding_check looks clean.

Thanks,
Drew
