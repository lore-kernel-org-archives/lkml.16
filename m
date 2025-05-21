Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263BB2356D9;
	Wed, 21 May 2025 07:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747812623; cv=none; b=hcrJncVJJTlOa7on+QfcI2IpvL+H4RJ/UrPxWAdECFZUav5GEhPIrDwhiH+1JSada95/lx09TMJ1WFrBTmsu6RrtTClwTHtO4T2eF1qsOu7hcrubPtTtAtVESxNFA9g74FcTueoX92C0Trt7AAstKSAiJI4Ug0whPGXHEQzhzBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747812623; c=relaxed/simple;
	bh=RrOTdFVp7DeBvVaeYM6StjNUZpgeqFpaiCHnjI8Fq/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ho9D28CAf1oWUIrjaQ0KvlM7AD+K809LSsyMKoViTsyHswnV0N0f9TLSdbcRY4vcnO1juBrYAHyJ//gW0LafYW+6P2XyWKA0nvNqz1gG7B1SHJHnSTahRyHcVV6tUhKQPnJuPp16bMpn/do3RderR3CFT1Ft1kmsYqIaUDRhcAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=e2Rt85Bn; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="e2Rt85Bn"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3B3811483EA6;
	Wed, 21 May 2025 09:30:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1747812612; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=Jo8cDLQM3XMzIjXRy1b2U7Wev2UzC+Jh4i47p9UAFJw=;
	b=e2Rt85BnKH4vIZC4SMCYgE+VHtVydmzHlADpiI55GysxSWakB+8jM9dwIAslliK4XJ2RCP
	fB1jWqW4sY/NoyY5SmWT/4hwIbCID0H5tDIEJTMoK4wHUyGvU95O82mC7V5LpHVFAqk76D
	j4+jrkZyjhfv7czCa4y+aSIpg4ctlk+ynpoDyqZ9cZe9MbsGFnswGGPO2KU58G7HX9Yqfl
	K1WptAZQMQ4WzWg1ocaRb9OibQ/rHfg3AvBwsOp32hU1Fl4dpMjmCAcv2m8VCNQ3v3fV7k
	dEMdFusTjfZAzfjv1i34ZESVjgRc+Mi8WwpAYMhGPTx5oxrSdduCKUd3A9ov3Q==
Date: Wed, 21 May 2025 09:30:04 +0200
From: Alexander Dahl <ada@thorsis.com>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, tudor.ambarus@linaro.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] ARM: dts: microchip: sam9x60ek: rename
 spi-cs-setup-ns property to spi-cs-setup-delay-ns
Message-ID: <20250521-sandstorm-uncross-b3917c33371d@thorsis.com>
Mail-Followup-To: Manikandan Muralidharan <manikandan.m@microchip.com>,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, tudor.ambarus@linaro.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
References: <20250521054309.361894-1-manikandan.m@microchip.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521054309.361894-1-manikandan.m@microchip.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3

Hello,

Am Wed, May 21, 2025 at 11:13:06AM +0530 schrieb Manikandan Muralidharan:
> The naming scheme for delay properties includes "delay" in the name,
> so renaming spi-cs-setup-ns property to spi-cs-setup-delay-ns.
> 
> Fixes: 2c0a1faa4da5 ("ARM: dts: at91: sam9x60ek: Set sst26vf064b SPI NOR flash at its maximum frequency")
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
> changes in v2:
> - add fixes tag
> ---
>  arch/arm/boot/dts/microchip/at91-sam9x60ek.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/microchip/at91-sam9x60ek.dts b/arch/arm/boot/dts/microchip/at91-sam9x60ek.dts
> index cdc56b53299d..c1ff3248bd8f 100644
> --- a/arch/arm/boot/dts/microchip/at91-sam9x60ek.dts
> +++ b/arch/arm/boot/dts/microchip/at91-sam9x60ek.dts
> @@ -609,7 +609,7 @@ flash@0 {
>  		compatible = "jedec,spi-nor";
>  		reg = <0>;
>  		spi-max-frequency = <104000000>;
> -		spi-cs-setup-ns = <7>;
> +		spi-cs-setup-delay-ns = <7>;
>  		spi-tx-bus-width = <4>;
>  		spi-rx-bus-width = <4>;
>  		m25p,fast-read;

Reviewed-by: Alexander Dahl <ada@thorsis.com>

Greets
Alex

