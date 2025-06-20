Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE82129A312;
	Fri, 20 Jun 2025 13:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750427715; cv=none; b=Gt+fD03KxBiWXKXIQj3ilH2cPdaqPiKKHBB1ADGBtCl9rxsWCU5mMKodeEJUZsyiwqC0lv2ShXLp4dnXQPSJiz4AS6rJxPdyq0hqLghpaWuqJphfyZ1U4gJsylpkO5K4hchePM5TfmZECffHbMW7cXefq9k6aqB197hs0t7nkvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750427715; c=relaxed/simple;
	bh=3PisGD+bIkaVX3xpM+5mvXdr5gHqL2tBzXirYz2SS/8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fo1gbEfkCqP1NgbLpEJNpjn7PjMR1TGkr4uPnMWBx/9mF17y5vMAvwIkORZVSYSEyauHetrz4xafyAfbwx8j0UQapumOcGxUYuiKKV+qSk8+g4nrWFceR9gF3snk7xAcOk7I+uQBhzRoUw9kjWJUt0giQ/idwx6aCOPNygOU1Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA0A516F2;
	Fri, 20 Jun 2025 06:54:53 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9FCF33F58B;
	Fri, 20 Jun 2025 06:55:11 -0700 (PDT)
Date: Fri, 20 Jun 2025 14:55:08 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: allwinner: a523: Add UART1 pins
Message-ID: <20250620145508.4d483885@donnerap.manchester.arm.com>
In-Reply-To: <20250619173007.3367034-5-wens@kernel.org>
References: <20250619173007.3367034-1-wens@kernel.org>
	<20250619173007.3367034-5-wens@kernel.org>
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

On Fri, 20 Jun 2025 01:30:06 +0800
Chen-Yu Tsai <wens@kernel.org> wrote:

> From: Chen-Yu Tsai <wens@csie.org>
> 
> UART1 is normally used to connect to the Bluetooth side of a Broadcom
> WiFi+BT combo chip. The connection uses 4 pins.
> 
> Add pinmux nodes for UART1, one for the RX/TX pins, and one for the
> RTS/CTS pins.

Interestingly there is only one possible set of pins for UART1, so the
naming is correct. Which would also mean we can insert the pinctrl-0
property in the UART DT node in the .dtsi file already.
Regardless, checked against the manual:

> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> index 30613a0b1124..6f62201fd739 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -168,6 +168,20 @@ uart0_pb_pins: uart0-pb-pins {
>  				allwinner,pinmux = <2>;
>  				function = "uart0";
>  			};
> +
> +			/omit-if-no-ref/
> +			uart1_pins: uart1-pins {
> +				pins = "PG6", "PG7";
> +				function = "uart1";
> +				allwinner,pinmux = <2>;
> +			};
> +
> +			/omit-if-no-ref/
> +			uart1_rts_cts_pins: uart1-rts-cts-pins {
> +				pins = "PG8", "PG9";
> +				function = "uart1";
> +				allwinner,pinmux = <2>;
> +			};
>  		};
>  
>  		ccu: clock-controller@2001000 {

