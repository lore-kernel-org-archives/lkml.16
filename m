Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1651280CD9;
	Fri, 20 Jun 2025 09:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750411432; cv=none; b=rKL6+kGSwf7yb0hAslQ0rBvT6KiCwyY4+rhios+A9d3mnDxUEU+D7PIm4FqZReGw/+E093HmLLCr5sabJI82PfEmf8peLUQOCODrqGZNsv+mnQQztKactuGEHMvvSC5jW9MqarNTHRaj+FwVvjms3BMHfGd91xBQ15I/hTB5BYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750411432; c=relaxed/simple;
	bh=gFqKMGB+599gWiIDRuPwLjV0AGFzK9hvlcYgaGWzgvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T+POmuoUb3NC01yPoeOspeCyZcO5j6I7fG34hoiGW3bwSURuggHwvaCqiJsjiadL+4FmrSneVP8TPO4XfRL5xl6L+hOoyz3AzfoirRjJwtvI53eECDcCOHQgqjGvCH9RkXGTK1cqQPMBaS3i6MwIXr5APNNOyETLBcchUZveR3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uRNalUTQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uRNalUTQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13606C4CEED;
	Fri, 20 Jun 2025 09:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750411432;
	bh=gFqKMGB+599gWiIDRuPwLjV0AGFzK9hvlcYgaGWzgvY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uRNalUTQ5gxcjvSaBaopQhZFUT6v9dCfyTuq9SEEvAtoGA7gQDel3vreSKWnZIXIs
	 a3BqJe3+kgEPbRgUCEXcMC6AgKxnZ8jnx+B0YWA0aTb0JsjJ6K6+6HRYdf2+cpRvjs
	 5TWmbfeXAglJ2sVFzVGxaMsmKMAbJaudbip8N7bG40c0agXcZlHtzxsYgvPjxT8dis
	 uyR42v2Fzw8HLgY112XHfv7G1ekIHDnHjvauUvqtD3r24kBfBq14HaBGnYfSw1ukig
	 835Kk5pYJ3DQFi+9bGebYH50tSgdxn4v7A7VQozKxvSgLqM7CxeazzRliEXnhsgmk/
	 L7S0Ghv5/5uDw==
Message-ID: <47a7209a-5f8b-40d0-9bba-19339fd4fc5b@kernel.org>
Date: Fri, 20 Jun 2025 11:23:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: freescale: Add Mettler-Toledo
 Snowflake V2 support
To: Wojciech Dubowik <Wojciech.Dubowik@mt.com>, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Marek Vasut <marex@denx.de>, Frieder Schrempf <frieder.schrempf@kontron.de>,
 Markus Niebel <Markus.Niebel@tq-group.com>, Frank Li <Frank.Li@nxp.com>,
 =?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>,
 Michael Walle <mwalle@kernel.org>, Heiko Schocher <hs@denx.de>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Max Merchel <Max.Merchel@ew.tq-group.com>, Tim Harvey
 <tharvey@gateworks.com>, Primoz Fiser <primoz.fiser@norik.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner
 <heiko@sntech.de>, Manivannan Sadhasivam <mani@kernel.org>,
 Kever Yang <kever.yang@rock-chips.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Tobias Graemer <Tobias.Graemer@mt.com>
References: <20250620084512.31147-1-Wojciech.Dubowik@mt.com>
 <20250620084512.31147-4-Wojciech.Dubowik@mt.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250620084512.31147-4-Wojciech.Dubowik@mt.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/06/2025 10:41, Wojciech Dubowik wrote:
> +
> +	ili2511: ili2511@41 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


> +		compatible = "ilitek,ili251x";
> +		reg = <0x41>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_touch>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&gpio3 16 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	lvds: lvds@2c {
> +		compatible = "ti,sn65dsi83";
> +		reg = <0x2c>;
> +		vcc-supply = <&reg_sn65dsi83_1v8>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_sn65dsi83>;
> +		status = "okay";

Was it disabled anywhere?

> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				bridge_in: endpoint {
> +					remote-endpoint = <&mipi_dsi_out>;
> +					data-lanes = <1 2>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +				bridge_out: endpoint {
> +					remote-endpoint = <&panel_in>;
> +					data-lanes = <4 3 2 1>;
> +				};
> +			};
> +		};
> +	};
> +
> +	usbc-cc-controller@61 {
> +		compatible = "ti,tusb320";
> +		reg = <0x61>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_usbc_controller>;
> +		interrupts-extended = <&gpio1 6 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +};
> +
> +&mipi_dsi {
> +	status = "okay";
> +	vddio-supply = <&reg_sn65dsi83_1v8>;
> +	assigned-clocks = <&clk IMX8MM_CLK_DSI_CORE>,
> +			  <&clk IMX8MM_VIDEO_PLL1_OUT>,
> +			  <&clk IMX8MM_CLK_DSI_PHY_REF>;
> +	assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_266M>,
> +			  <&clk IMX8MM_VIDEO_PLL1_BYPASS>,
> +			  <&clk IMX8MM_CLK_24M>;
> +	assigned-clock-rates = <266000000>, <594000000>, <12000000>;
> +	samsung,pll-clock-frequency = <12000000>;
> +	samsung,burst-clock-frequency = <891000000>;
> +	samsung,esc-clock-frequency = <54000000>;
> +};
> +
> +&mipi_dsi_out {
> +	remote-endpoint = <&bridge_in>;
> +};
> +
> +&lcdif {
> +	status = "okay";
> +};
> +
> +&gpu_2d {
> +	status = "okay";
> +};
> +
> +&gpu_3d {
> +	status = "okay";
> +};
> +
> +&ecspi1 {
> +	status = "disabled";
> +};
> +
> +&gpio1 {
> +	bootph-pre-ram;
> +};
> +
> +&gpio2 {
> +	bootph-pre-ram;
> +};
> +
> +&gpio3 {
> +	bootph-pre-ram;
> +};
> +
> +&gpio4 {
> +	bootph-pre-ram;
> +};
> +
> +&gpio5 {
> +	bootph-pre-ram;
> +	status_led_controller_oe: status-led-controller-hog {
> +		gpio-hog;
> +		gpios = <4 GPIO_ACTIVE_HIGH>;
> +		output-low;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_hog_status_led_controller>;
> +	};
> +};
> +
> +&pca9450 {
> +	bootph-pre-ram;
> +};
> +
> +&{/soc@0/bus@30800000/i2c@30a20000/pmic@25/regulators} {

There is no label to override it? Probably should be added.


> +	bootph-pre-ram;
> +};
> +




> +&usbotg2 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	disable-over-current;
> +	dr_mode = "host";
> +	status = "okay";
> +
> +	usb1@1 {

usb@

Why usb1?

> +		reg = <1>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		usbnet: ethernet@1 {
> +			compatible = "usb424,9500";
> +			reg = <1>;
> +			mac-address = [ 00 00 00 00 00 00 ];
> +		};
> +	};
> +};



Best regards,
Krzysztof
