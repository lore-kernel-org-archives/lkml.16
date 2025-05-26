Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9293F1E5B7D;
	Mon, 26 May 2025 22:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748299738; cv=none; b=EaRU0tNSvTZaJn3wlypqLn/VA4/P3g4r7oylw+Q64zn5wjuf6R+HPhjP7hVAouf5YVoajOVSQIYora+6xxATupL4tv6P1Y6t/dZA/qDxYkORUSKiyHBX3qsw1W5iVjOBhCoDfxSNNtzlny2+Pp5r1GaBHGmUVCezQ8oYT5FNjws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748299738; c=relaxed/simple;
	bh=uolzGkj7lS4cxGcaNey6Eo8aZi3ZI/PC2nzy7WLFnLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lOg6o20M1vI7QBDKAUU3d9nnKfioGxmVHFlYTWSn6rFCo9Kx+vbzUfGdBkG+22vH453Wc6V/VWyFAAMusNpaUuvoeDUJD/mqzYm6Zn2eflahEx9zK80UjvrdKITgUIdeWotngGZe1yniGdE52V1KxY0B5LIujqgzCL7gWs4u7ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sk8DcRYd; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sk8DcRYd"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c559b3eb0bso147187685a.1;
        Mon, 26 May 2025 15:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748299735; x=1748904535; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DxU+IS3NoOt3HdLFHXPgdhqzIwbodDbspZNewqvS2bY=;
        b=Sk8DcRYdiaqHHS9iuSdgklR4XwDPirnjlOsQS8dHQbWrwOq1gzz3e2RlqvEXTukv6V
         oi6BJMAywu7brcHEX0J1wjBf6LMQRDrOMrW2sofsIPz1pSxWw3bZCnxIV3tW4qoyp9tq
         YI87rTT/IijYW2yLrnbwQbo4KE6rv2hEbUAAiZc18oTQAkRtmMCWqfOXOFZ5hOM46DyZ
         JSsElGztbeRHYdRUcZ/HBLGK3+TgL1PPLMlTjIlb8daABWlbBR/EFfKcDOWlu9lWWh2I
         CKZJ35joeLWyFWtb/DEsuioJJSlgOIuttkqyuVVVsSyXizWG9wFEpd2qU43pekfd+N6T
         ZUAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748299735; x=1748904535;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DxU+IS3NoOt3HdLFHXPgdhqzIwbodDbspZNewqvS2bY=;
        b=f9iiR7HrOeRY3rTruw7UYA/xASxhvqDE5/sb9vozJ4NlbBkvVLE+sSWD6dEvNDegLM
         cKXY3IidvNe/5jiul9OD0okXrKacxpDc8YPO8TyfsJfwx0rzB61ErhIsc+dCcUAgMeiG
         9yZh6e4N6V/52QtGU+Btd3+zDyNj0vV3iO+7qVPGZZQ44rIA7ufA7+NfT0rUoTGfkhxF
         ESZhM08jOTv3ihGHEQ6IoJVwbm2l4g5rOqinTTiIubYEP8RL/WBI8WL1UAqM1Td8az4T
         Ph+d5w/q3R3WcZ5PMbW7TFl3WYjig7pMhzg/Nt4jTUpGFJ29/V0yValReOxFRhuBgBlD
         6CUg==
X-Forwarded-Encrypted: i=1; AJvYcCV9vxD24gZlqQsONgB6ws4QOz/w5zmgv1USmxxu0f+QfBREqAxJAm+89dqrqyAwJR4n531xJGUe+2xSFck4@vger.kernel.org, AJvYcCWrWWkommKv9aXnN0bF9OhWaC7biFzTLwGIzqpATcVZfUFpQI7FK5JZAbLKxF+QTGePTRSjfLTUQDNS@vger.kernel.org
X-Gm-Message-State: AOJu0YyaAGByMmQp882PRx3HsODAbxHfGdFB3laRPpf3NsMO0qgsLsFS
	NJ8czAPOKJm2vo6nWHPvNekHA6q5XQTHNCtOuK2oZHDLdypKfOqIa7c7
X-Gm-Gg: ASbGncs/fC4SI3/rEEjidIgkU7FbkZX0bVXjBIKvM6pHJlhYdlpBJCsPgL/b9C+3UpU
	inEfdBNcOOOfKVudGVWKFwe+db7UlSwGMmc5V278/6v/t1unMloiJgG2zq6vANxXxIyWOA0rlSG
	gepPLpFNA98i0EoEWcyA+RgtDLm/iHLdu+kvdGGMj5RHpUk7aPOJJ9RuYsW0Kk5a4K8OvEsOMWk
	L6HmXGLXjvytQkvq+WcFWrA+dJ1hM8EWLhk84P3cVxlrvhdc1vldvwShaSsZzzy+2cun8GJ5rAk
	XlK/c+48sJ4kPyaIAcRKYeORVdY=
X-Google-Smtp-Source: AGHT+IGb426KXAna7tUbXhwL2CIur79DWxmDcI/E5an7rbk9SRJUL7gdvaP3a93TzMAL6SvIIh8Q5w==
X-Received: by 2002:ad4:4ea2:0:b0:6f5:41b8:47ed with SMTP id 6a1803df08f44-6fa9ce38689mr191223316d6.0.1748299735279;
        Mon, 26 May 2025 15:48:55 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6faa050c0b8sm36106276d6.74.2025.05.26.15.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 15:48:54 -0700 (PDT)
Date: Tue, 27 May 2025 06:48:08 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: sophgo: cv18xx: Add RTCSYS device node
Message-ID: <ykswyhohgty646c5s7pow46dn5gjvgvpq7vq46kbh2gf2f5hub@xabjhqv7pzfn>
References: <20250513203128.620731-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513203128.620731-1-alexander.sverdlin@gmail.com>

On Tue, May 13, 2025 at 10:31:25PM +0200, Alexander Sverdlin wrote:
> Add the RTCSYS MFD node: in Cvitek CV18xx and its successors RTC Subsystem
> is quite advanced and provides SoC power management functions as well.
> 
> The SoC family also contains DW8051 block (Intel 8051 compatible CPU core)
> and an associated SRAM. The corresponding control registers are mapped into
> RTCSYS address space as well.
> 
> Link: https://github.com/sophgo/sophgo-doc/tree/main/SG200X/TRM
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
>  arch/riscv/boot/dts/sophgo/cv180x.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

I am happy to see the rtc driver is merged. So I will queue this
patch for the next rc1. If you need a rebase, please let me know.

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>

> diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> index ed06c3609fb2..280c45bd3b3d 100644
> --- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> @@ -307,5 +307,17 @@ dmac: dma-controller@4330000 {
>  			snps,data-width = <2>;
>  			status = "disabled";
>  		};
> +
> +		rtc@5025000 {
> +			compatible = "sophgo,cv1800b-rtc", "syscon";
> +			reg = <0x5025000 0x2000>;
> +			interrupts = <SOC_PERIPHERAL_IRQ(1) IRQ_TYPE_LEVEL_HIGH>,
> +				     <SOC_PERIPHERAL_IRQ(2) IRQ_TYPE_LEVEL_HIGH>,
> +				     <SOC_PERIPHERAL_IRQ(3) IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "alarm", "longpress", "vbat";
> +			clocks = <&clk CLK_RTC_25M>,
> +				 <&clk CLK_SRC_RTC_SYS_0>;
> +			clock-names = "rtc", "mcu";
> +		};
>  	};
>  };
> -- 
> 2.49.0
> 
