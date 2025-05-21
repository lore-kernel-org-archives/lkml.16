Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A56F22B8B9;
	Wed, 21 May 2025 07:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747812704; cv=none; b=HVYeMS/Mjv0YxzZnpSgbo534LqY8vz6CxnZ8OT3iCG2dF4MofwPX2xfeW4zeFsL3ctN5uACX6bcYGhMX0rOVmvcGKADp12Mt4mGbxcnJVEAxVHWEGxpwlnwvFKOzcQNdSCm0LzUTM79qPmf07bpPjCnO09SFbSwwRQKFAjAAEt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747812704; c=relaxed/simple;
	bh=m88lqQJ1ivvA36g7P3O18bCRbixD3RDFJ8xZLwXrm0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iKzHMJmfp5Un/bGxETiRlp+gl5OrC7Oa5malK4sPxzk+u3UIKF06cAdJc9R7cEMEH5GvFnq2Us8ZVR8yFK/DOR3L0KtWwizlhB1Fa1lNDdxH5YQrGod8KtUlTnkUwxCCSbqkmxq8DCLKnN8Wu0ORfpuFHHTGNid9RHlpfWikM5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=g0XjGnbs; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="g0XjGnbs"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9ED0E1483EA6;
	Wed, 21 May 2025 09:31:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1747812700; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=vQJzbvORYC3qBJW5bkNYYbLB/XMom/qkj5UONQP+FfI=;
	b=g0XjGnbsgpvNRMG+QRiSHGkKupascOtHMHBsxB1DJMyIKHlEX0gMY3tzgzOt+F6GW6MBj4
	TrAIRx3z7QjRY0LF2B5sNJPrSVmZjkNDCwb+doQyB2ROUoHxAQbAVxdOQBa0X/uG4weZCT
	WMExvCvZW9gFzxy5+H3SdL1GBcJL/ucyTWSeHTPbgeb0AWOSsAEYjJjt/V2qRaExN/wCqg
	xjW+QXt0pdNzXFSndEFTqhvgl5GY7S8vOyP5Rc+b0fEbR2lC6vdHa/riz1gsB8VVQTVWQI
	Td2+bRb2z39L9tN0EYFJ04egtO7BLrBWgFiUqbvyVCMQyr8mcD3Xfw9kXqKbUg==
Date: Wed, 21 May 2025 09:31:38 +0200
From: Alexander Dahl <ada@thorsis.com>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, tudor.ambarus@linaro.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] ARM: dts: microchip: sama5d27_som1: rename
 spi-cs-setup-ns property to spi-cs-setup-delay-ns
Message-ID: <20250521-outsource-unholy-8c063337eb6f@thorsis.com>
Mail-Followup-To: Manikandan Muralidharan <manikandan.m@microchip.com>,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, tudor.ambarus@linaro.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
References: <20250521054309.361894-1-manikandan.m@microchip.com>
 <20250521054309.361894-2-manikandan.m@microchip.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521054309.361894-2-manikandan.m@microchip.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3

Hello,

Am Wed, May 21, 2025 at 11:13:07AM +0530 schrieb Manikandan Muralidharan:
> The naming scheme for delay properties includes "delay" in the name,
> so renaming spi-cs-setup-ns property to spi-cs-setup-delay-ns.
> 
> Fixes: 09ce8651229b ("ARM: dts: at91-sama5d27_som1: Set sst26vf064b SPI NOR flash at its maximum frequency")
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
> changes in v2:
> - add fixes tag
> ---
>  arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi b/arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi
> index 8ac85dac5a96..13c28e92b17e 100644
> --- a/arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi
> +++ b/arch/arm/boot/dts/microchip/at91-sama5d27_som1.dtsi
> @@ -44,7 +44,7 @@ flash@0 {
>  					compatible = "jedec,spi-nor";
>  					reg = <0>;
>  					spi-max-frequency = <104000000>;
> -					spi-cs-setup-ns = <7>;
> +					spi-cs-setup-delay-ns = <7>;
>  					spi-tx-bus-width = <4>;
>  					spi-rx-bus-width = <4>;
>  					m25p,fast-read;

Reviewed-by: Alexander Dahl <ada@thorsis.com>

Greets
Alex

