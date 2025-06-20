Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 285712989B0;
	Fri, 20 Jun 2025 13:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750427704; cv=none; b=WO5YOfpfuFGg1eE0bR3hWq4lgFtgyqNFIVbaPSHTGqJF804Icef4Bxd9sH93kiXSIEX8tofCWV64mx+KbOOJfTJPWqMZLwa/CUezeYokGEiyt6BtOVuC4+BqI/pppM4LFm3SA5swkD053Ov/56YsbfZQ/fGG08cr5Cp0Czubbxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750427704; c=relaxed/simple;
	bh=Le6qiyOhF8O82q8CmPbMXE6fHz1irEYt8vH8NVlcyC0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J8G7uA89LVYjS3V+XqyI5kpj3fEJ+tWa8j63CToORhDYDm84Ke16M9olPjkRmXYMC7LwniyKGpKMhApbDbP1MKuoqJqtAXijZUhTA3xyYNDZtCzgSFKxJHfAqwzrIY+X6adE15kJTwXD6tFEIK2+aBly6UpD4FahRvUICZJIQ9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F341A16F2;
	Fri, 20 Jun 2025 06:54:41 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB47E3F58B;
	Fri, 20 Jun 2025 06:54:59 -0700 (PDT)
Date: Fri, 20 Jun 2025 14:54:57 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] arm64: dts: allwinner: a523: Move rgmii0 pins to
 correct location
Message-ID: <20250620145448.5e48d9b0@donnerap.manchester.arm.com>
In-Reply-To: <20250619173007.3367034-4-wens@kernel.org>
References: <20250619173007.3367034-1-wens@kernel.org>
	<20250619173007.3367034-4-wens@kernel.org>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 20 Jun 2025 01:30:05 +0800
Chen-Yu Tsai <wens@kernel.org> wrote:

> From: Chen-Yu Tsai <wens@csie.org>
> 
> Nodes are supposed to be sorted by address, or if no addresses
> apply, by node name. The rgmii0 pins are out of order, possibly
> due to multiple patches adding pin mux settings conflicting.
> 
> Move the rgmii0 pins to the correct location.
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 20 +++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> index 458d7ecedacd..30613a0b1124 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -126,16 +126,6 @@ pio: pinctrl@2000000 {
>  			interrupt-controller;
>  			#interrupt-cells = <3>;
>  
> -			rgmii0_pins: rgmii0-pins {
> -				pins = "PH0", "PH1", "PH2", "PH3", "PH4",
> -				       "PH5", "PH6", "PH7", "PH9", "PH10",
> -				       "PH14", "PH15", "PH16", "PH17", "PH18";
> -				allwinner,pinmux = <5>;
> -				function = "emac0";
> -				drive-strength = <40>;
> -				bias-disable;
> -			};
> -
>  			mmc0_pins: mmc0-pins {
>  				pins = "PF0" ,"PF1", "PF2", "PF3", "PF4", "PF5";
>  				allwinner,pinmux = <2>;
> @@ -163,6 +153,16 @@ mmc2_pins: mmc2-pins {
>  				bias-pull-up;
>  			};
>  
> +			rgmii0_pins: rgmii0-pins {
> +				pins = "PH0", "PH1", "PH2", "PH3", "PH4",
> +				       "PH5", "PH6", "PH7", "PH9", "PH10",
> +				       "PH14", "PH15", "PH16", "PH17", "PH18";
> +				allwinner,pinmux = <5>;
> +				function = "emac0";
> +				drive-strength = <40>;
> +				bias-disable;
> +			};
> +
>  			uart0_pb_pins: uart0-pb-pins {
>  				pins = "PB9", "PB10";
>  				allwinner,pinmux = <2>;

