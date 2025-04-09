Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A64F25D542
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 10:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744195315; cv=none; b=elXDRbEUoYARp6W5f61q4w8ELAkxijDMhnVCdR+D5nW71vdakwZg4kuaOdwewMDia6V3dB3lVpNsvP1RQUKJxjVkn05M7qHUgu6BOOyslIukonz3XHauCqhcSbN8QuUyaoJGvGlFGBcZ0qo1q5ZYiLa2R6iumZo7kEoBJxhzQhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744195315; c=relaxed/simple;
	bh=u4imxXMhWH+lE0stnEdXi80NbKFnl0KzUsQSbsGJErk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Py78TCnbXlI5ehLPvV3BNwRRA2zwVZPoiBpQEZV/n9CLGwTwV1ERl/D+r1svkcB8w+iTsOXgn/hY1vWF2plo59SA1I+H3SDPmFwuz/R6NhwVuW4cLpwAoBxPTKKXVo7Q5klKqO/kOrfXHX6LRx8iu/NECtlhVqDhzjNXgtWqXdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vGXkogIk; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vGXkogIk"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-703cd93820fso61816017b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 03:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744195312; x=1744800112; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zbx/nnTrG6Q4jtzUnp3dgghp62oCSk+raqpc9aCKiZs=;
        b=vGXkogIkxu7sqj+W+yucDQ0EzdgVKFBipazVeSrcRjkp9nGViIB27x/6BFHebfVZ9j
         5LS913tTymyCQUFL2kseOUI4xUCb+nChHAfT/bfOiXzEVOnp0TEXTAXOY8+oLDyJdKuP
         utA8OzzKjcLaSXnw9g3aXo2uc/wd6z+X0getZcoWZJ3qkiNWx1RX5D3js6fWkuMr9/bM
         HTmsg0JBUUxxO6pcsF8vwZ/Iq4YT1JMpW8pQDpT2hoT68HWXyrpuJoa/aVzQ6Md0RMfI
         3MfTkB6r8G8YyWvqeRhDx4MpTLhv/lq7Aoh4Qtiu1H3B1F3TZ78N5arOh9Fkm7SnzucQ
         az/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744195312; x=1744800112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zbx/nnTrG6Q4jtzUnp3dgghp62oCSk+raqpc9aCKiZs=;
        b=ooyq1GTr7rhNrFZG0QJltNGvfeCrQQTrS97KUFzmd6lBHkG4D0ll2E1xEkTDcpqAE0
         +geOYmLzQTFu1JMiD1Db5lLcpkQtbl+dW5q+gv7zJeWhTgrxLBexpdAYSiiZt/LKKA52
         SGW0wZhkkZOcdwEUJIjKwQrDcgwg0muidZgVTVmcJPo3HOsjUqjmKKz0P6/e29Zz4RTH
         /3fkOSUQfyWSZnCcxFVr4Z97vmDSEFJQzpjRcBfiG3Op2o9gGGDzITbF4+IPbVtshmon
         2Ug4VYUIOKPGVDS0fuwNFGRB6NCUI2ozNd8D04ngGh7E5x2gZkKtz5Qjq5WQY9P8CUij
         0WSA==
X-Forwarded-Encrypted: i=1; AJvYcCWShhzH41Mq2+ajTX7a56wRZkLotJXL2TCUGqAd72EXoWU8AFJWOw4LCB1d0CD+tgyBuReaCeBhI4Hv3co=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3Jb0TzJOqhXoaYLQjRvYNGuod3m+k8vXeGNdk92nqOGuvRjhs
	kiV9pRwmnVZ/LGW9/oJ3ESaUnJjRc6PorxE1XRs3TvtaJoxOAbWYloqcBvmY++ASrA7IVW8pCHc
	I4U2Di+xXarei7mJ2OjrxP0kHRd+MzS1yEOGp/w==
X-Gm-Gg: ASbGnct4Xn9VPWbENdqPb+Hz2wOKRv4evK43PGb1WldRvctCnwALlLmW0GuhdcGb5p5
	R/ZGznDBOyd7bobpFFiHo1Tynats2CEtO2F7ziiuX3Jc/z/mvMosL19CxYbtBdDkwWWd10Cm1JC
	qvvZMx2yK8Mb5TE7jxuN6RbwsdjKrn9N2pCg==
X-Google-Smtp-Source: AGHT+IFcW3dVYG/NllcMUbiQFPsaC2kMGwBB25zgb5C4LoLaPrqyxQ+CvN8joNvk0vnecmPTbBGtAkQPDSjYEggyHcE=
X-Received: by 2002:a05:690c:4889:b0:6fd:4485:9255 with SMTP id
 00721157ae682-7053ae70affmr35816427b3.24.1744195312358; Wed, 09 Apr 2025
 03:41:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250409093031eucas1p2222e9dc4d354e9b66b7183922c0fb3cf@eucas1p2.samsung.com>
 <20250409093025.2917087-1-m.wilczynski@samsung.com> <20250409093025.2917087-2-m.wilczynski@samsung.com>
In-Reply-To: <20250409093025.2917087-2-m.wilczynski@samsung.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 9 Apr 2025 12:41:16 +0200
X-Gm-Features: ATxdqUGWw59JsfUXBmewm_-nQPR1HPGJKXnfN1JdqM3oC2wFfjOLFi3_5CNvBz8
Message-ID: <CAPDyKFpoSwKAmiWyvNt1fVyu6=NU1oVOmQLVuzX_bG=-5KrM2Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: firmware: thead,th1520: Add clocks
 and resets
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, 
	guoren@kernel.org, wefu@redhat.com, p.zabel@pengutronix.de, 
	m.szyprowski@samsung.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Apr 2025 at 11:30, Michal Wilczynski <m.wilczynski@samsung.com> wrote:
>
> Prepare for handling GPU clock and reset sequencing through a generic
> power domain by adding clock and reset properties to the TH1520 AON
> firmware bindings.
>
> The T-HEAD TH1520 GPU requires coordinated management of two clocks
> (core and sys) and two resets (GPU and GPU CLKGEN). Due to SoC-specific
> requirements, the CLKGEN reset must be carefully managed alongside clock
> enables to ensure proper GPU operation, as discussed on the mailing list
> [1].
>
> Since the coordination is now handled through a power domain, only the
> programmable clocks (core and sys) are exposed. The GPU MEM clock is
> ignored, as it is not controllable on the TH1520 SoC.
>
> This approach follows upstream maintainers' recommendations [1] to
> avoid SoC-specific details leaking into the GPU driver or clock/reset
> frameworks directly.
>
> [1] - https://lore.kernel.org/all/38d9650fc11a674c8b689d6bab937acf@kernel.org/
>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../bindings/firmware/thead,th1520-aon.yaml   | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml b/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
> index bbc183200400..8075874bcd6b 100644
> --- a/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
> +++ b/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
> @@ -25,6 +25,16 @@ properties:
>    compatible:
>      const: thead,th1520-aon
>
> +  clocks:
> +    items:
> +      - description: GPU core clock
> +      - description: GPU sys clock
> +
> +  clock-names:
> +    items:
> +      - const: gpu-core
> +      - const: gpu-sys

These clocks don't look like they belong to the power-domain node, but
rather the GPU's node.

Or is this in fact the correct description of the HW?

> +
>    mboxes:
>      maxItems: 1
>
> @@ -32,13 +42,27 @@ properties:
>      items:
>        - const: aon
>
> +  resets:
> +    items:
> +      - description: GPU reset
> +      - description: GPU CLKGEN reset
> +
> +  reset-names:
> +    items:
> +      - const: gpu
> +      - const: gpu-clkgen
> +

Ditto for the reset.

>    "#power-domain-cells":
>      const: 1
>
>  required:
>    - compatible
> +  - clocks
> +  - clock-names
>    - mboxes
>    - mbox-names
> +  - resets
> +  - reset-names
>    - "#power-domain-cells"
>
>  additionalProperties: false
> @@ -47,7 +71,11 @@ examples:
>    - |
>      aon: aon {
>          compatible = "thead,th1520-aon";
> +        clocks = <&clk_vo 0>, <&clk_vo 1>;
> +        clock-names = "gpu-core", "gpu-sys";
>          mboxes = <&mbox_910t 1>;
>          mbox-names = "aon";
> +        resets = <&rst 0>, <&rst 1>;
> +        reset-names = "gpu", "gpu-clkgen";
>          #power-domain-cells = <1>;
>      };
> --
> 2.34.1
>

That said, it's still possible to make both the clocks and reset being
managed from the genpd provider. I will comment on that separately for
patch2.

Kind regards
Uffe
