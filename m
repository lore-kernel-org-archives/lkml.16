Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21EA1E51F5
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 17:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745257221; cv=none; b=go7qE9TDmugTYqK5XbK1k3Sdz/VNjjyhJ+xxKdTUtzGtCeEfk5T6S47VrzFvKrRmj78Oc++B2PAaZl15CgLk32SByW95iXBW1+OZE/DjbWhrZ9vbpn6ZutGQMxo34TS+E7UINwb/p2WaUi7t6npJEy8OdiQJhJj+UJN5QDdW32k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745257221; c=relaxed/simple;
	bh=PDMX/gz7bhm8/YvqOGZSqtmA9Ej+TwrV8JeRfvfYLxM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V0HUKt9yIYYtZdJ4ML+G/sNyb1CEo6XAzSii0S8F+Eku4A2QDNgwmACPnUZsAvjZaGDOhcA3ttUi40LwSnfONyOM9pRoAzwohsCDUWG6vly9H8iVceUIx7I51Q+q08n7C43wj9FWwUqYuwkppR4UP9NwOS6TlAdOCWZFJ/wyIz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=wmbyjvsf; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="wmbyjvsf"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6ecfc7fb2aaso40626276d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 10:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745257219; x=1745862019; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/kIVu58H//mZx9i9dCRDIy5r3dYFEIXqq3Oo6gJVw3Q=;
        b=wmbyjvsfDSLZSi5D5NQm/snAH4oBfxM2NwSeNukHmdcHYEzXSYxi4YyMK0ipZyREZ2
         gvvZ0lGyp979aEEphpQ599cOd77V5Csu/E7sj4pHJGII0JETH9HStHYv6UfrUL2R0TLR
         BrdjG98Ojq5NPeutZDC57G7SG4/GZtxeKSZf17l0021uUFeEgwhYDofWUivO1SH4j7qW
         Ax/ktckmhUJKs8kt2bMRS/FEHtwsZaT8Ow7ObzTbO431LKC0kE3w0CVgQ8qMP7+Fxxce
         YJxDCTaklsPMDR+oiJTjwCIvh+vNSde+PVkBm0befcURowYo6OY84DQ+bUQrnnceh5uq
         zNrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745257219; x=1745862019;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/kIVu58H//mZx9i9dCRDIy5r3dYFEIXqq3Oo6gJVw3Q=;
        b=KxN/VBOF7pLI4IEmd+CKfyKZTHOD7bLTT+O8h5dq0U2NfLr4ygMbC3SwCjFJlVNQeD
         qhX4pU5eqk+ZCtkn3WfKR+sDja+PLr6kcn+gp5hXSPEWupCE9AZUi3dnYvdS383kskzd
         80IEhoS3hW7ljXE307OfPuX0qhrwY/f9dAVotjeYhi/ZTRQtyShkFbbPZPPdQlHR6ryt
         ZKhma1XxFZXTvRr7YY5Xj77dLtzzzPK6Jl+qBX9cTF02Ml7O5sotCs831sDww4ReGufP
         J5lZruGHcPl5Xo85EYlf6Hn/OOLCfH68xa6dcrS40vmdgZSaYWQqhEMubS8txxsUl+XW
         Qs0w==
X-Forwarded-Encrypted: i=1; AJvYcCVjHIm6zNlb6ltb2pLPh+Xthbz8txQJvMtPtLYy5mPPvcp2DrBZwpCX5L/qR5kjbyIjxdNHTgpq9CmfaBA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxab8cRjSbkkWLaHkbkCCPyEz1HxfVJpQSAvPMO8JVsO5sGUDjE
	6ChXtbqxlPTkINNcTQ3/rmUreK8aMz5SDsAwsfaoA3WctzgpCRB82tkSaUNNF2Y=
X-Gm-Gg: ASbGncvurylkbXDEGoLkM/UpiHV6xzCvQB46N4aHIvSS3zwtRFWfc/B4h97+jEYPBK1
	ywXfO40cFhmQ7pMTIdO2JeReqpEko9+E+NYAN4cDLOqbkx3pm6h184iqQ71CQ0pxaOcGxB4J5QB
	BvCe03A4Rw6KTRsQmC/7k6eY7RXxgGsVjGrcxYkS5q0tM9Ri4Mo9zrm8vqFiSmltuZcfjwGEp1F
	+GkCNT45o5iYNK7my1hdnzlVuIV9pvJso0/qhflAYCozOMPdkZ8mW0xCFSPyuAvazsab5X9b6S2
	i6HuldG7kmzUf8jv2BnJHEr9CWsY8jlaFomRcOnxyp+s2UCZGcXdqf4h/vSv5gLSbsrKOTpjSOe
	nvy6ZQJr4SsI11ZU=
X-Google-Smtp-Source: AGHT+IF+vsdmKg2vXpeajIoJuLo47wQiw/dv7wnI49ZF4AY0SLVO/f7XcVPIz2huHaNJ7F/AqME9ng==
X-Received: by 2002:a05:6214:500f:b0:6eb:2f7a:45b0 with SMTP id 6a1803df08f44-6f2c46baaaamr274256056d6.38.1745257218647;
        Mon, 21 Apr 2025 10:40:18 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2af120esm46284596d6.1.2025.04.21.10.40.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 10:40:18 -0700 (PDT)
Message-ID: <2d086fee-47d5-4be2-8b86-bf1cac6af803@riscstar.com>
Date: Mon, 21 Apr 2025 12:40:17 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Acquire clocks for UART
To: Yixun Lan <dlan@gentoo.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Haylen Chu <heylenay@4d2.org>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250419-05-dts-clock-v1-0-1cce5d59aba2@gentoo.org>
 <20250419-05-dts-clock-v1-2-1cce5d59aba2@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250419-05-dts-clock-v1-2-1cce5d59aba2@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/18/25 10:32 PM, Yixun Lan wrote:
> The K1 SoC features two clocks for UART controller,
> Acquire them explicitly in the driver.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

I had an almost identical patch queued up to do this.

I think I'd mention explicitly in this description that you
are removing the clock-frequency property from all these nodes
(it is required to do this, otherwise the clock properties are
ignored by of_platform_serial_setup() in "8250_of.c").

Two more requests below.  Otherwise this looks good.

If you address all three of my comments, feel free to add:

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   arch/riscv/boot/dts/spacemit/k1.dtsi | 36 +++++++++++++++++++++++++++---------
>   1 file changed, 27 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index 153fd1160182b42fe1a2f7f042c9c1da90f63b0c..415e1c3e1c78db987cbb65759adc26e98aaa24d3 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -360,8 +360,10 @@ syscon_apbc: system-control@d4015000 {
>   		uart0: serial@d4017000 {
>   			compatible = "spacemit,k1-uart", "intel,xscale-uart";
>   			reg = <0x0 0xd4017000 0x0 0x100>;
> +			clocks = <&syscon_apbc CLK_UART0>,
> +				 <&syscon_apbc CLK_UART0_BUS>;
> +			clock-names = "core", "bus";
>   			interrupts = <42>;
> -			clock-frequency = <14857000>;
>   			reg-shift = <2>;
>   			reg-io-width = <4>;
>   			status = "disabled";
> @@ -370,8 +372,10 @@ uart0: serial@d4017000 {
>   		uart2: serial@d4017100 {
>   			compatible = "spacemit,k1-uart", "intel,xscale-uart";
>   			reg = <0x0 0xd4017100 0x0 0x100>;
> +			clocks = <&syscon_apbc CLK_UART2>,
> +				 <&syscon_apbc CLK_UART2_BUS>;
> +			clock-names = "core", "bus";
>   			interrupts = <44>;
> -			clock-frequency = <14857000>;
>   			reg-shift = <2>;
>   			reg-io-width = <4>;
>   			status = "disabled";
> @@ -380,8 +384,10 @@ uart2: serial@d4017100 {
>   		uart3: serial@d4017200 {
>   			compatible = "spacemit,k1-uart", "intel,xscale-uart";
>   			reg = <0x0 0xd4017200 0x0 0x100>;
> +			clocks = <&syscon_apbc CLK_UART3>,
> +				 <&syscon_apbc CLK_UART3_BUS>;
> +			clock-names = "core", "bus";
>   			interrupts = <45>;
> -			clock-frequency = <14857000>;
>   			reg-shift = <2>;
>   			reg-io-width = <4>;
>   			status = "disabled";
> @@ -390,8 +396,10 @@ uart3: serial@d4017200 {
>   		uart4: serial@d4017300 {
>   			compatible = "spacemit,k1-uart", "intel,xscale-uart";
>   			reg = <0x0 0xd4017300 0x0 0x100>;
> +			clocks = <&syscon_apbc CLK_UART4>,
> +				 <&syscon_apbc CLK_UART4_BUS>;
> +			clock-names = "core", "bus";
>   			interrupts = <46>;
> -			clock-frequency = <14857000>;
>   			reg-shift = <2>;
>   			reg-io-width = <4>;
>   			status = "disabled";
> @@ -400,8 +408,10 @@ uart4: serial@d4017300 {
>   		uart5: serial@d4017400 {
>   			compatible = "spacemit,k1-uart", "intel,xscale-uart";
>   			reg = <0x0 0xd4017400 0x0 0x100>;
> +			clocks = <&syscon_apbc CLK_UART5>,
> +				 <&syscon_apbc CLK_UART5_BUS>;
> +			clock-names = "core", "bus";
>   			interrupts = <47>;
> -			clock-frequency = <14857000>;
>   			reg-shift = <2>;
>   			reg-io-width = <4>;
>   			status = "disabled";
> @@ -410,8 +420,10 @@ uart5: serial@d4017400 {
>   		uart6: serial@d4017500 {
>   			compatible = "spacemit,k1-uart", "intel,xscale-uart";
>   			reg = <0x0 0xd4017500 0x0 0x100>;
> +			clocks = <&syscon_apbc CLK_UART6>,
> +				 <&syscon_apbc CLK_UART6_BUS>;
> +			clock-names = "core", "bus";
>   			interrupts = <48>;
> -			clock-frequency = <14857000>;
>   			reg-shift = <2>;
>   			reg-io-width = <4>;
>   			status = "disabled";
> @@ -420,8 +432,10 @@ uart6: serial@d4017500 {
>   		uart7: serial@d4017600 {
>   			compatible = "spacemit,k1-uart", "intel,xscale-uart";
>   			reg = <0x0 0xd4017600 0x0 0x100>;
> +			clocks = <&syscon_apbc CLK_UART7>,
> +				 <&syscon_apbc CLK_UART7_BUS>;
> +			clock-names = "core", "bus";
>   			interrupts = <49>;
> -			clock-frequency = <14857000>;
>   			reg-shift = <2>;
>   			reg-io-width = <4>;
>   			status = "disabled";
> @@ -431,7 +445,9 @@ uart8: serial@d4017700 {
>   			compatible = "spacemit,k1-uart", "intel,xscale-uart";
>   			reg = <0x0 0xd4017700 0x0 0x100>;
>   			interrupts = <50>;
> -			clock-frequency = <14857000>;
> +			clocks = <&syscon_apbc CLK_UART8>,
> +				 <&syscon_apbc CLK_UART8_BUS>;
> +			clock-names = "core", "bus";

Please insert the clocks and clock-names properties *above* the
interrupts property, as you did for all of the above.

>   			reg-shift = <2>;
>   			reg-io-width = <4>;
>   			status = "disabled";
> @@ -441,7 +457,9 @@ uart9: serial@d4017800 {
>   			compatible = "spacemit,k1-uart", "intel,xscale-uart";
>   			reg = <0x0 0xd4017800 0x0 0x100>;
>   			interrupts = <51>;
> -			clock-frequency = <14857000>;
> +			clocks = <&syscon_apbc CLK_UART9>,
> +				 <&syscon_apbc CLK_UART9_BUS>;
> +			clock-names = "core", "bus";

Same comment here.

					-Alex

>   			reg-shift = <2>;
>   			reg-io-width = <4>;
>   			status = "disabled";
> 

