Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90BE42A87;
	Wed,  4 Jun 2025 19:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749063699; cv=pass; b=rfBHr4y/QK9pEyTX+oDA6vczaFpyx0BbZxrH8PtHk3UNuz3xRvKkrZ2VCdFElmM/30AiMRyirsSKwFGaYx3MMcH1bOfKZVd/fMp04kTPEa4/mtSFVrbCG6USxwdgW0p7r+BMrv8k9joDCtuK/SS6RTAVZKkWZU0E1iPyc9gcRQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749063699; c=relaxed/simple;
	bh=SOnrepsUwPOPme6HxYyDAp3IOHter7CNwPduJeBDi9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u6U5vf+anuKJvTSpQPevhVrFYktbHFH4gW7l2jGnohMs/b0epw6iW3PmDB/e2zhCqOCMzAoSgISoKndbsI+ZEHql+FFC20C2L5UfyK0qtdoEild1DUNF7qUy8hLwruhfr6LisUnpRGIK8NqBk2qZshdA/uyB4M/Bl64zSZZQMl8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=cPBbrC+j; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="cPBbrC+j"
ARC-Seal: i=1; a=rsa-sha256; t=1749063687; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hUZbeOaldCTjbNvHXnX0G72M5BW9GejfrJ9UZJmeBTi+Fknig7vKZnLgpp4395QZcHCksZOkjDGEFwV61C+iwUACY/kCOowEBMoMYJOyHcm/2Jrs4c+bKNrNeap01G34BCMqGyIvt4zaXP7UuVxyWBfNH2y6D5Htz62lvUKwOro=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749063687; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=RR07ZJb8JV1Gn3LQ5leTmhQEEeyoSF6a+ry7Y8x0k4k=; 
	b=b/4blPvALM0jm4+1EnZtq3tYPK77jJcnnFzvhTJgpZL4WnR1B49em+e1xPzwDpyVIGmkMof9S2VeJW4suNesUk8kipw0WBz20N4W1pCEcO51lPCijFS8nXH6EU1/YeQhw78HD/YU7HxsgIgKjM+KIfeQjNmMUcmWa9CldKg4dnE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749063687;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=RR07ZJb8JV1Gn3LQ5leTmhQEEeyoSF6a+ry7Y8x0k4k=;
	b=cPBbrC+jF6wKlqbdkGk/TQz0dU7RSQZTij2iqSiQNILpLtaUuczypAivoSr4+iUU
	fzbSSSBlbI49220TxrtPcsA8Y3aRSrOxDY27yGgmc/qGGAFQpcnJuzMqiybCRi8KfkP
	lo13DsX2Nb4P6mdVAmcpFOFfNcetvjmnamBeTXDQ=
Received: by mx.zohomail.com with SMTPS id 1749063684919734.5257602364985;
	Wed, 4 Jun 2025 12:01:24 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Alexey Charkov <alchark@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexey Charkov <alchark@gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: enable wifi on ArmSoM Sige5
Date: Wed, 04 Jun 2025 21:01:20 +0200
Message-ID: <11432858.nUPlyArG6x@workhorse>
In-Reply-To: <20250603-sige5-updates-v1-3-717e8ce4ab77@gmail.com>
References:
 <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <20250603-sige5-updates-v1-3-717e8ce4ab77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Tuesday, 3 June 2025 19:01:15 Central European Summer Time Alexey Charkov wrote:
> ArmSoM Sige5 uses a soldered-on SDIO connected WiFi module. Namely,
> board v1.1 uses a Realtek based BL-M8852BS2, while v1.2 uses a Broadcom
> based BW3752-50B1.

Okay, so there's two board revisions, which makes this patch and the
following that adds bluetooth a problem. This patch here doesn't
seem to actually add the SDIO Wi-Fi module node where it'll differ,
so skirts around the issue AFAIU. It might also be that it's not
needed for you and I just don't notice because I have v1.1 where the
SDIO driver for that module doesn't exist yet iirc.

But what we should think about is first doing
- probably add a new compatible for armsom,sige5-v1.2
- git mv arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts \
         arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtsi
- commit here like Sebastian Reichel had to do for [1]
- create a new arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
  that includes the dtsi and moves the model and compatible property
  there. Make sure the model includes v1.1 in the name, compatible
  should remain the same
- commit here that will be a squash commit like Sebastian Reichel
  had to do in [2]
- create a new arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2.dts,
  could be adding the Wi-Fi node here to cut down on how many patches we
  do. I assume you only have the v1.2 board and can't test the older Wi-Fi,
  which is fine.
  compatible should probably be something like
    compatible = "armsom,sige5-v1.2", "armsom,sige5", "rockchip,rk3576";
  Don't forget to change the model property as well.

I know this will be a royal PITA, especially considering they'll likely
never produce v1.1 again and it now hogs the name, but keeping the
current dts as 1.1 may be the best way forward, as it keeps compat (though
the Wi-Fi changes won't affect anything already in there) and will stop
people from accidentally picking the higher number better DTS like what
happens with rockpro64 all the time where the non-numbered DTS is 2.1 and
the numbered one is 2.0 and people keep picking 2.0.

> 
> Add required device tree nodes in the SoC .dtsi for the SDIO controller
> and pinctrl / clock wiring in the board .dts for the module itself.
> 
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
>  .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 36 ++++++++++++++++++++++
>  arch/arm64/boot/dts/rockchip/rk3576.dtsi           | 16 ++++++++++
>  2 files changed, 52 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> index 7ce1fb1380b0863c902fdd9cbc7454ee6011cf92..dcd033859398312f7693bebb7f080ee4f2ecaa32 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> @@ -219,6 +219,15 @@ vcc_5v0_host: regulator-vcc-5v0-host {
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&usb_host_pwren>;
>  	};
> +
> +	sdio_pwrseq: sdio-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		clocks = <&hym8563>;
> +		clock-names = "ext_clock";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wifi_reg_on>;
> +		reset-gpios = <&gpio1 RK_PC6 GPIO_ACTIVE_LOW>;
> +	};
>  };
>  
>  &combphy1_psu {
> @@ -781,6 +790,16 @@ usb_host_pwren: usb-host-pwren {
>  			rockchip,pins = <4 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
>  		};
>  	};
> +
> +	wireless-wlan {
> +		wifi_wake_host: wifi-wake-host {
> +			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_down>;
> +		};
> +
> +		wifi_reg_on: wifi-reg-on {
> +			rockchip,pins = <1 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
>  };
>  
>  &sai1 {
> @@ -808,6 +827,23 @@ &sdhci {
>  	status = "okay";
>  };
>  
> +&sdio {
> +	bus-width = <4>;
> +	cap-sdio-irq;
> +	disable-wp;
> +	keep-power-in-suspend;
> +	mmc-pwrseq = <&sdio_pwrseq>;
> +	no-sd;
> +	no-mmc;
> +	non-removable;
> +	sd-uhs-sdr50;
> +	sd-uhs-sdr104;
> +	vmmc-supply = <&vcc_3v3_s3>;
> +	vqmmc-supply = <&vcc_1v8_s3>;
> +	wakeup-source;
> +	status = "okay";
> +};
> +
>  &sdmmc {
>  	bus-width = <4>;
>  	cap-mmc-highspeed;
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi

Okay, I think adding the sdio node to the SoC dtsi should be a separate
patch before this one.

> index 1086482f04792325dc4c22fb8ceeb27eef59afe4..a09582470bb7f654b711308da1e51fa8571ca1e8 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> @@ -1695,6 +1695,22 @@ sdmmc: mmc@2a310000 {
>  			status = "disabled";
>  		};
>  
> +		sdio: mmc@2a320000 {
> +			compatible = "rockchip,rk3576-dw-mshc", "rockchip,rk3288-dw-mshc";
> +			reg = <0x0 0x2a320000 0x0 0x4000>;
> +			clocks = <&cru HCLK_SDIO>, <&cru CCLK_SRC_SDIO>;
> +			clock-names = "biu", "ciu";
> +			fifo-depth = <0x100>;
> +			interrupts = <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>;
> +			max-frequency = <200000000>;
> +			pinctrl-0 = <&sdmmc1m0_clk &sdmmc1m0_cmd &sdmmc1m0_bus4>;
> +			pinctrl-names = "default";
> +			power-domains = <&power RK3576_PD_SDGMAC>;
> +			resets = <&cru SRST_H_SDIO>;
> +			reset-names = "reset";
> +			status = "disabled";
> +		};
> +
>  		sdhci: mmc@2a330000 {
>  			compatible = "rockchip,rk3576-dwcmshc", "rockchip,rk3588-dwcmshc";
>  			reg = <0x0 0x2a330000 0x0 0x10000>;
> 
>

So in conclusion:
- bindings patch adding v1.2 compatible
- SoC dtsi patch for the sdio node
- git mv patch
- rk3576-armsom-sige5.dts patch, ask maintainer to squash it into the
  previous patch, make it obvious by giving it the same subject or something
- rk3576-armsom-sige5-v1.2.dts patch

Sorry to drop all this on you, it's a little unpleasant and in-the-woods
with regards to preparing a patch series. Basically, the reason why I've
held off on this for the moment is that I don't have a v1.2 board and my
v1.1 board's Wi-Fi module doesn't seem to be supported (yet).

Kind regards,
Nicolas Frattaroli

[1]: https://lore.kernel.org/linux-rockchip/20250508-rock5bp-for-upstream-v2-1-677033cc1ac2@kernel.org/
[2]: https://lore.kernel.org/linux-rockchip/20250508-rock5bp-for-upstream-v2-2-677033cc1ac2@kernel.org/



