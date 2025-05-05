Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564092580E2
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 21:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746478817; cv=none; b=ZSsyU+lS4DaiNFrKbp1Ej04vZ+wFIZAY/5XuI/IuwjlFfF+JrW3AQ2IElgAS1HN2i774N+rrvS29PMee0jPJA6N4MxGcjZ3ZVfAG2Hkkj5vZL8lNwF7xQAkajgZE8+Rm/DMZ7c/2hFnQn5h7exck8glbhLUUEVNKLpNggv1z9V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746478817; c=relaxed/simple;
	bh=5ufq1FfQ7+ItMWnW/bHVbCw8E2sCN/GQabyoCbiAToM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BtRDU9JeZvbsz4FetzxN8oFZdEHx7vyi2JT5SsfhWGLB0/ilvXYfKFY5wm32MBkvdp6funv4kY9ISYS9SSNXi1YZeLHRxKg/sve/5z3N4bXjxLEyVT5A3uV2eNmJVmcOG3bkBut6bXHpdOgC88LRAUcaWgBSN5j3ufNHjY9C91Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=Fc9td3m6; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="Fc9td3m6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1746478815;
 bh=D6mVc2F17QEJBHK1fhZDepaSGxODcDU0cKVXx0iYDDg=;
 b=Fc9td3m61nSny/ihFaGBpYktonG0IbPNePezmIXHp5PRSxccTl69MDQwsFOvpyNQu/VLufIyL
 53zVweULUtmKnIAfvZnTw/5eCov1jjMm18byK+m0ZFTqCbDBfFBIEuWK7FbOLcWI2OfJw0p9gx7
 qsSxTNvqZtwHljsdsYUZ4fgLiBUJ2a7b3CgH04QcI9yhXKiqj83G7C+tt+FBIqK0XKpnjLAd0IA
 BcmuQbcuz4ZqMxXOIHV7Raaf5VnP71Jqp6am8mds8yfCP/BE2KXP1wuiJFG1v7ubYTlehAIg3J0
 uJ+KUTk1RgqzZhO5dyhfVKOGtXqyznntUQdJxbq/vDzg==
X-Forward-Email-ID: 681926d746c37f8647c203a8
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.0.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <f19f11f7-c020-44a3-84fa-eb9ca48ed11f@kwiboo.se>
Date: Mon, 5 May 2025 23:00:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] arm64: dts: rockchip: Enable SD-card interface on
 Radxa E20C
To: Yao Zi <ziyao@disroot.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Shresth Prasad <shresthprasad7@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Chukun Pan <amadeus@jmu.edu.cn>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20250417143647.43860-1-ziyao@disroot.org>
 <20250417144005.43927-1-ziyao@disroot.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250417144005.43927-1-ziyao@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025-04-17 16:40, Yao Zi wrote:
> SD-card is available on Radxa E20C board.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>

SD-card is detected and working on my E20C, and this also seem to match
the schematics for E20C:

  mmc_host mmc1: Bus speed (slot 0) = 400000Hz (slot req 400000Hz, actual 400000HZ div = 0)
  mmc_host mmc1: Bus speed (slot 0) = 148500000Hz (slot req 150000000Hz, actual 148500000HZ div = 0)
  dwmmc_rockchip ffc30000.mmc: Successfully tuned phase to 215
  mmc1: new UHS-I speed SDR104 SDHC card at address 59b4
  mmcblk1: mmc1:59b4 USD00 29.5 GiB
   mmcblk1: p1

  $ cat /sys/kernel/debug/mmc1/ios
  lock:           150000000 Hz
  actual clock:   148500000 Hz
  vdd:            21 (3.3 ~ 3.4 V)
  bus mode:       2 (push-pull)
  chip select:    0 (don't care)
  power mode:     2 (on)
  bus width:      2 (4 bits)
  timing spec:    6 (sd uhs SDR104)
  signal voltage: 1 (1.80 V)
  driver type:    0 (driver type B)

So this is:

Reviewed-by: Jonas Karlman <jonas@kwiboo.se>

Regards,
Jonas

> ---
>  .../boot/dts/rockchip/rk3528-radxa-e20c.dts   | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
> index 57a446b5cbd6..09d917a0acc5 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
> @@ -17,6 +17,7 @@ / {
>  
>  	aliases {
>  		mmc0 = &sdhci;
> +		mmc1 = &sdmmc;
>  	};
>  
>  	chosen {
> @@ -108,6 +109,18 @@ vcc5v0_sys: regulator-5v0-vcc-sys {
>  		regulator-min-microvolt = <5000000>;
>  		regulator-max-microvolt = <5000000>;
>  	};
> +
> +	vccio_sd: regulator-vccio-sd {
> +		compatible = "regulator-gpio";
> +		gpios = <&gpio4 RK_PB6 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&sdmmc_vol_ctrl_h>;
> +		regulator-name = "vccio_sd";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <3300000>;
> +		states = <1800000 0x0>, <3300000 0x1>;
> +		vin-supply = <&vcc5v0_sys>;
> +	};
>  };
>  
>  &pinctrl {
> @@ -130,6 +143,12 @@ wan_led_g: wan-led-g {
>  			rockchip,pins = <4 RK_PC0 RK_FUNC_GPIO &pcfg_pull_none>;
>  		};
>  	};
> +
> +	sdmmc {
> +		sdmmc_vol_ctrl_h: sdmmc-vol-ctrl-h {
> +			rockchip,pins = <4 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
>  };
>  
>  &saradc {
> @@ -148,6 +167,17 @@ &sdhci {
>  	status = "okay";
>  };
>  
> +&sdmmc {
> +	bus-width = <4>;
> +	cap-mmc-highspeed;
> +	cap-sd-highspeed;
> +	disable-wp;
> +	sd-uhs-sdr104;
> +	vmmc-supply = <&vcc_3v3>;
> +	vqmmc-supply = <&vccio_sd>;
> +	status = "okay";
> +};
> +
>  &uart0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&uart0m0_xfer>;

