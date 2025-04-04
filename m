Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E25E18B0F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 23:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743808580; cv=none; b=YMkmnOGsWDHQMqkI08tb86hsoJ3212IjvvwHIMNBnSo7Qyh5PYNHFjJSeW1VUlbZktQYuUlCVXv84A6Cb8t+vBba5S9lWYM2N2ipC35LB9WjOcWPZbQ02FNDMT+k1eHcP7bdUoh5dzMsFYa7aqLfL9F8FOr6uQPO9xAPHvImCZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743808580; c=relaxed/simple;
	bh=yNO7vWgggiE6AdvJSHy8J2QpJuEdjH5HDBasbGJJTPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LtRK9R7ctwPv5WKTFtr45GODO8GO+N7CwTnWqxEF6iBPCmbwX9dEuRfpmGxoQQZBWS/dEfrEPjlb9s7P1niyThbQ+GYZXLVGT9HHlBzFOH/jKQ2F3Fexrt7r7T1/EzuWSnaQqT9AClHoZkHC2HOIHPxLQOfsLqZyLYPztBYOFFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=ld78S7jW; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="ld78S7jW"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-aee79a0f192so1637074a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 16:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1743808578; x=1744413378; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xi0GUgnEAFI8Tq5WlnIINEkOrw3m9T6yA0HO5ypDLqM=;
        b=ld78S7jWfq03eeAQvOvquil/IQn02ZsiGEtkqEOIgJOhAv+ZMPuQzx/NEpqpxZDtbk
         Ni5D1Zbm/dN8pBNOzOjzEf5ixsVpgBdXVdeI5tsO39f9koTq7QbZQFmSTqk0VZ/HvrlO
         ru1GO0qRSpC8D1jXQPtsFLlaU/XjjHdzO38TOOnLKKxj1i0VpWz9j+k6gzTMBUnSBcpK
         mrRupWShO9+HQh0KV+6PtMJZz9e/b6IDhdr1C+WH0z3ojYKb6NdvqQ4fM+XJ0VfcKi46
         YHcR0eeJqlbrbh7ozWn/2mzeoGJaWEhehARU7SHvg5ER1fmrkpDRVkZ1JXFH9vnPvRDc
         u+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743808578; x=1744413378;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xi0GUgnEAFI8Tq5WlnIINEkOrw3m9T6yA0HO5ypDLqM=;
        b=XnNi+1NMUag6EzSur8Qwu+8l2lzy6GVj60buxwMU49UG6cTpxnmTxhF8pyDrfBrmIM
         prFzt4GEJoRNKr01zOSKbYEklepapj3a0BqDOIH1RpvQlasGCeQy73qF3VwmKSAcsQNm
         SsY2TUOtY6UsGRiYbOC/tVBTwpZVXSdbw+5RVzPpRcWh0H1bhZVFUbKMEW/sMGLIqtlv
         VN0+8Eu7oNm6HI5/xdm0oQFL9x2ox5iI6uVtF4j9oS0Ax+LhdYKjG7Bp4VgqTakpS1o1
         Q8lKURI6mgif6rGzBGrBM+c1JenGEf4RwumrFEmf0bmicnMjRt1srmza8cL5cdXguG9S
         k9zA==
X-Forwarded-Encrypted: i=1; AJvYcCV1KMJrWhzv/QLesTVapoNsW/1jUw+Opb82bkkRSfAz2sm+ahfsOU16CdBsgo1Bw0UaZ/uG9zQR7TS0oPg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxA+gGPYtZEOR2NL7Y3l4hyzEmwDkIsadctjS2/QX1Na0knmzqR
	HIy+8G0lK8NejcFtyl9/eZIBTiFyF0K9VZzP2A2nKjLcVbpN7EERzYDy/ZdY76E=
X-Gm-Gg: ASbGncsaN3cw/cgmOi6D0CCl7EXEm2wkO8fxDPIBlzsW9VHhlGhQCdShxLPjVRBpH0f
	KdmeHrkDGTXGvPAR9FTwp/6C4sdNaPCDO4dQPU0fjo0LGcQIv8C8RP9gIxjDq4WdJIFwQZwEgsm
	/I0XWVMFnChv6j/PEYSorcUSOD+jCpNstXQuyUwhUryoqz31dNKXGzAqp0W9MIyYXwprEB7bAVF
	eXSTBcSfPUiTBJHICqiP9RkOwXdGB7IZx3uCkqZS0yge2sew2wDnX5CEOxQC6wRTPGE1xSZNcZf
	8aBrfJ2LmpxG3/5ZNrKJ8LpI
X-Google-Smtp-Source: AGHT+IHC31M9P+ufU9NLoFJjA+hcOFrxMJv1oldOlZ6NzGrsyiNFFvfRRMA/XiiS+ri4Zo313E4eog==
X-Received: by 2002:a17:90a:d006:b0:305:2d68:8d39 with SMTP id 98e67ed59e1d1-306af71ce82mr1669762a91.12.1743808578500;
        Fri, 04 Apr 2025 16:16:18 -0700 (PDT)
Received: from x1 ([97.115.235.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-305841a8ae7sm4115878a91.12.2025.04.04.16.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 16:16:18 -0700 (PDT)
Date: Fri, 4 Apr 2025 16:16:16 -0700
From: Drew Fustini <drew@pdp7.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, guoren@kernel.org,
	wefu@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, jszhang@kernel.org,
	p.zabel@pengutronix.de, m.szyprowski@samsung.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v7 3/3] riscv: dts: thead: Add device tree VO clock
 controller
Message-ID: <Z/BoQIXKEhL3/q50@x1>
References: <20250403094425.876981-1-m.wilczynski@samsung.com>
 <CGME20250403094433eucas1p2da03e00ef674c1f5aa8d41f2a7371319@eucas1p2.samsung.com>
 <20250403094425.876981-4-m.wilczynski@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403094425.876981-4-m.wilczynski@samsung.com>

On Thu, Apr 03, 2025 at 11:44:25AM +0200, Michal Wilczynski wrote:
> VO clocks reside in a different address space from the AP clocks on the
> T-HEAD SoC. Add the device tree node of a clock-controller to handle
> VO address space as well.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index 527336417765..d4cba0713cab 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -489,6 +489,13 @@ clk: clock-controller@ffef010000 {
>  			#clock-cells = <1>;
>  		};
>  
> +		clk_vo: clock-controller@ffef528050 {
> +			compatible = "thead,th1520-clk-vo";
> +			reg = <0xff 0xef528050 0x0 0xfb0>;

Thanks for your patch. It is great to have more of the clocks supported
upstream.

The TH1520 System User Manual shows 0xFF_EF52_8000 for VO_SUBSYS on page
205. Is there a reason you decided to use 0xFF_EF52_8050 as the base?

I see on page 213 that the first register for VO_SUBSYS starts with
VOSYS_CLK_GATE at offset 0x50. I figure you did this to have the
CCU_GATE macros use offset of 0x0 instead 0x50.

I kind of think the reg property using the actual base address
(0xFF_EF52_8000) makes more sense as that's a closer match to the tables
in the manual. But I don't have a strong preference if you think think
using 0xef528050 makes the CCU_GATE macros easier to read.

-Drew
