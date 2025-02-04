Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0B214A4F0;
	Tue,  4 Feb 2025 11:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738668707; cv=none; b=SvwgR3L+ysgLW6+UUCNzlepqUwpIEMbFARGjT+8bQ1AvAlAmqiiMRl9GJJlc3toGswxEuJ7r9u9d9WVoExRUg0qZ9uaqHQypgaIrAqgsHc3JefMmzXauLae3HJrbu1efAExdhuCz+e5kN+drSjCnmykMIRPLopDzJ6nOKIhnUkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738668707; c=relaxed/simple;
	bh=UilKA/GCwKXN1/JS4HWOL1WdCcqsazQphEXmaBIxL/8=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=uNtFDZHhOTubqKEjdu+IBaq7giF7tYF39ri3sajvozMH1UeDxxtG9t8xHLiO0d4xVhoO1swI4xRq0kGv0n6gato1fQr2HhJuHwPQNmbhf3j6Z6o+AP2jl6ecB3x3x+mMEV1W1kZEhjrvI7okldDuOnf472jdve4gNt4iYTDW+vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=V8PQztR5; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="V8PQztR5"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1738668702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0rFwU8+gCEjDdXJtEJfGflM5ucC0PAuf7opUByCC9nM=;
	b=V8PQztR5xcJdnhXb4kJEvkq8L/EIFTdhE5YQjOhV1UqtTYumzFEtWd6AezT8UZMulpnXjk
	vax9g1O9TR3hOF2aR86zTeBi+AyTtf3MtF7FGzjR6Z9HQQZZkprdi5yxSrcNDbweuIf2b/
	fq1tve4eEhOA4mkUdh7qMaaLD+i7/o5LmGVtbVCE9KpH5I0todAJaozzCKbIHqEInYWxjd
	B3qjTUyQXiG3enkpoMZ7QvG7StKum8kePuYDWS9EafIi6PlaDVWIcgWdmMXjBNKC+qlycc
	uAefijPS4eZ9Fr96/Oy1st1ZIzLag2VXPazfEOwtipFru4V4U9iwXgs0WPH9rA==
Date: Tue, 04 Feb 2025 12:31:42 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Jagan
 Teki <jagan@edgeble.ai>, Niklas Cassel <cassel@kernel.org>, Michael Riesch
 <michael.riesch@wolfvision.net>, Jonas Karlman <jonas@kwiboo.se>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Quentin
 Schulz <quentin.schulz@cherry.de>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 4/4] arm64: dts: rockchip: minimal support for Pre-ICT
 tester adapter for RK3588 Jaguar
In-Reply-To: <20250131-pre-ict-jaguar-v4-4-c971e2852e8d@cherry.de>
References: <20250131-pre-ict-jaguar-v4-0-c971e2852e8d@cherry.de>
 <20250131-pre-ict-jaguar-v4-4-c971e2852e8d@cherry.de>
Message-ID: <4306ab9764cc5ae5f89e1b71e18aa037@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

On 2025-01-31 11:40, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> The Pre-ICT tester adapter connects to RK3588 Jaguar SBC through its
> proprietary Mezzanine connector.
> 
> It exposes a PCIe Gen2 1x M.2 connector and two proprietary camera
> connectors. Support for the latter will come once the rest of the 
> camera
> stack is supported.
> 
> Additionally, the adapter loops some GPIOs together as well as route
> some GPIOs to power rails.
> 
> This adapter is used for manufacturing RK3588 Jaguar to be able to test
> the Mezzanine connector is properly soldered.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
>  arch/arm64/boot/dts/rockchip/Makefile              |   4 +
>  .../dts/rockchip/rk3588-jaguar-pre-ict-tester.dtso | 171 
> +++++++++++++++++++++
>  2 files changed, 175 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile
> b/arch/arm64/boot/dts/rockchip/Makefile
> index
> ebcd16ce976ebe56a98d9685228980cd1f2f180a..a09b9c0060f8ecde582ad39f0f3e27047a31ec9c
> 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -185,6 +185,10 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) +=
> rk3588-edgeble-neu6a-wifi.dtb
>  rk3588-edgeble-neu6a-wifi-dtbs := rk3588-edgeble-neu6a-io.dtb \
>  	rk3588-edgeble-neu6a-wifi.dtbo
> 
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar-pre-ict-tester.dtb
> +rk3588-jaguar-pre-ict-tester-dtbs := rk3588-jaguar.dtb \
> +	rk3588-jaguar-pre-ict-tester.dtbo
> +
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-ep.dtb
>  rk3588-rock-5b-pcie-ep-dtbs := rk3588-rock-5b.dtb \
>  	rk3588-rock-5b-pcie-ep.dtbo

Obviously, virtually the same comments [*] I made on the patch 3/4
from this series apply here as well.

[*] 
https://lore.kernel.org/linux-rockchip/77b5d0efa6e56bb391575aeeb4d1be80@manjaro.org/
