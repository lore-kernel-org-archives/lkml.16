Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653D7223DD6;
	Thu,  8 May 2025 12:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746706252; cv=none; b=DrDFx3dSg5H0XYSEYJc+pLkJW3JI7elYB3hrlcJwNBltcuMfeSnTWcOjm6+o/pNx9q5//XbVQa0P3LW4aZnX0c2SjLSbdTEEHosewzptZVhYnQ2vGXv9cJ/akWP86C/hc9itfPVpAz0o5AhkYN1CWLNy9Am/KSjnqqeZpc5jmSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746706252; c=relaxed/simple;
	bh=HmZK9JZOA2Q9fjChjb96bqxOPBEDH70vQ+8hoaBSyxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=paKoLW99tKWE1EADv98zWAddN445P09nTSfx6YNmM3GW6+nBYH2KyHFNGT7EG4BmXttHHmZXBaHsPUa0dE09yNzYjWuqOlftt0B/Jvk8vlWMMmLtFtxKdRMMBUGrO156dTTKX4YsJ6T4emeIFuaXvlAh5glxWZZ91d8mB1KnejI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=D009CDIO; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="D009CDIO"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0AF7114800B7;
	Thu,  8 May 2025 14:05:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1746705914; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=QlRB9Iaokfu0oipHLYE3CeIxI9maDwC7586JM6Zrrcs=;
	b=D009CDIO4uX44xO7JFbCItOhC77Mhdg1qz/LCj1MPQummr1uvp6uLhO14nYwCQbamhPH1m
	J4c+BPCmtCJ3iRq65gWS0BdqEXeKQMLIaz7WGMUauKPvAJSAQu1kmDT5Wi5ufXQoB+l4NZ
	T4HIhGpm276h0WvaRvgeSbtc3jWvYsfni4jgFzAYgDMR7Sx/L+NRkfPJMshTaHrUVlb3WW
	7nKVWDSw1JIAPI0LBLnghBb7S0qAvYKezgfyNgl5aOQwkLwuZAo4QEL2RExD1Llu+phqjG
	2EmE6QmVpj7oT36SECecjm+USZfsC2QtC2HVno7OpWrjA8UVpbCC2FKc7xDTrg==
Date: Thu, 8 May 2025 14:05:07 +0200
From: Alexander Dahl <ada@thorsis.com>
To: Michael Klein <michael@fossekall.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ARM: dts: bananapi: add support for PHY LEDs
Message-ID: <20250508-strategy-simmering-20a48db6b6dd@thorsis.com>
Mail-Followup-To: Michael Klein <michael@fossekall.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
References: <20250507182005.8660-1-michael@fossekall.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507182005.8660-1-michael@fossekall.de>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3

Hallo Michael,

Am Wed, May 07, 2025 at 08:20:04PM +0200 schrieb Michael Klein:
> The RTL8211E ethernet PHY driver has recently gained support for
> controlling PHY LEDs via /sys/class/leds. The Bananapi M1 has three
> LEDs connected to the RTL8211E PHY. Add the corresponding nodes to
> the device tree.
> 
> v2: Refine commit message

This changelog should usually go below the '---' so it won't end up in
the commit message, but in the e-mail only.

Greets
Alex

> 
> Signed-off-by: Michael Klein <michael@fossekall.de>
> ---
>  .../boot/dts/allwinner/sun7i-a20-bananapi.dts | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts b/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts
> index 46ecf9db2324..d8b362c9661a 100644
> --- a/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts
> +++ b/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts
> @@ -48,6 +48,7 @@
>  
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/leds/common.h>
>  
>  / {
>  	model = "LeMaker Banana Pi";
> @@ -169,6 +170,32 @@ &ir0 {
>  &gmac_mdio {
>  	phy1: ethernet-phy@1 {
>  		reg = <1>;
> +
> +		leds {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			led@0 {
> +				reg = <0>;
> +				color = <LED_COLOR_ID_GREEN>;
> +				function = LED_FUNCTION_LAN;
> +				linux,default-trigger = "netdev";
> +			};
> +
> +			led@1 {
> +				reg = <1>;
> +				color = <LED_COLOR_ID_AMBER>;
> +				function = LED_FUNCTION_LAN;
> +				linux,default-trigger = "netdev";
> +			};
> +
> +			led@2 {
> +				reg = <2>;
> +				color = <LED_COLOR_ID_BLUE>;
> +				function = LED_FUNCTION_LAN;
> +				linux,default-trigger = "netdev";
> +			};
> +		};
>  	};
>  };
>  
> -- 
> 2.39.5
> 
> 
