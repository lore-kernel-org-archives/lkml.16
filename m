Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BF419AD8B;
	Tue,  3 Jun 2025 17:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748973114; cv=pass; b=CpmMeT74DhPgOLkgjn1ChM7b4yuTu0Wq954piRnz71/WwqGC4AEoGgPR2x9SLO/ACY/Z/9CW8BDpjP0sBJ8mK3FicfDmndd7mTQjIJam/xnw8K0K2SPlZ4dkY61FCafKp3hfiP2i6sQQwWMGpVpBbC5C97mrhFZRpKJJxxqmuF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748973114; c=relaxed/simple;
	bh=ZaPBgTtwKrFJSsXWO465adNlU44dYWbKY2QZ5mAwgzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aMJSrHkG29N0/V9gjH6HzYNCIR7HMysW4CnrIlmOHP74EWRV8wE63keT86th2CzWOxwTC9XZP6YP7nnLNwh3oKrm7GxymH3Ce7sQydMTzMdMjTDqoWTOXV7MYHqXDYvhqDQH9wD3yXCWhACCfN0U82GXyVqlkuydaDhiWoa58T0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=kCjJlCR/; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="kCjJlCR/"
ARC-Seal: i=1; a=rsa-sha256; t=1748973101; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cwppZ0xPjdeZLGuqauc+f+pjWK4k3RTNFCFmtM8ColWmVvEGdhCQQvUEB+L9q9pGYACt39z/7j6KirtpCROy7Gw87M9YMk0Sox3i3rxMScCng9BW8lvCdrjUTCytS3ZH7Dggp3WEbQ3UATGf+ozzL5WfaNdFp7S8GncFtWcHYXM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1748973101; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=MCO2JfgA6MZjGeikR+UYa6kqv35vCusCT+lHwuEV5jw=; 
	b=UB1PaqFqtqLLdCbyptmnXfnKr7J5lesbIGpid7SsaiLOvRkUTFTQpvAcbIHZyQyHCiJkdf6Tjnn8EDWgNOyXS2ro4rk5/ascQUZrV5rJ7t523kGy4Ztdl5OT1pugR9Bw8F1X2h0qNM0z5nwfsQMbkLiqa8fAsw4XcwUG+hZownk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1748973101;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=MCO2JfgA6MZjGeikR+UYa6kqv35vCusCT+lHwuEV5jw=;
	b=kCjJlCR/uH3QHQmfL0xEKGOiZYIf9B4JnUaQMlGMczeNLZ3us1+y8N8VQOtZGwGn
	ukvU1orFjkKnd0Vl3ORTXUYfP5gAx0nfr66sqMrvcR9Fya465K6aA9ntPK/7erpq2H5
	dyI1wvBL4O1cA7naGi3UBo+RxthfH52U+Da66KSU=
Received: by mx.zohomail.com with SMTPS id 1748973100013134.58818864329407;
	Tue, 3 Jun 2025 10:51:40 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 linux-rockchip@lists.infradead.org, Alexey Charkov <alchark@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexey Charkov <alchark@gmail.com>
Subject:
 Re: [PATCH 2/4] arm64: dts: rockchip: enable USB A ports on ArmSoM Sige5
Date: Tue, 03 Jun 2025 19:51:35 +0200
Message-ID: <5590100.Sb9uPGUboI@workhorse>
In-Reply-To: <20250603-sige5-updates-v1-2-717e8ce4ab77@gmail.com>
References:
 <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <20250603-sige5-updates-v1-2-717e8ce4ab77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Tuesday, 3 June 2025 19:01:14 Central European Summer Time Alexey Charkov wrote:
> Enable the two USB type A ports (USB2 and USB3) present on the ArmSoM
> Sige5 board.
> 
> Both ports use just one xHCI controller, with the USB 2.0 signals fed
> off the same USB OTG PHY through an onboard hub. VBUS of both ports is
> controlled by the same GPIO regulator (VCC_USBHOST in the schematics,
> toggled by GPIO4 RK_PA6).
> 
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
>  .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 

This is already done here:

https://lore.kernel.org/linux-rockchip/20250507-rk3576-sige5-usb-v3-4-89bf5a614ccf@collabora.com/

> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> index d9c129be55a0d997e04e6d677cdc98fb50353418..7ce1fb1380b0863c902fdd9cbc7454ee6011cf92 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
> @@ -205,6 +205,24 @@ vcc_3v3_ufs_s0: regulator-vcc-ufs-s0 {
>  		regulator-max-microvolt = <3300000>;
>  		vin-supply = <&vcc_5v0_sys>;
>  	};
> +
> +	vcc_5v0_host: regulator-vcc-5v0-host {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_5v0_host";
> +		regulator-boot-on;
> +		regulator-always-on;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		enable-active-high;
> +		gpio = <&gpio4 RK_PA4 GPIO_ACTIVE_HIGH>;
> +		vin-supply = <&vcc_5v0_device>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&usb_host_pwren>;
> +	};
> +};
> +
> +&combphy1_psu {
> +	status = "okay";
>  };
>  
>  &cpu_b0 {
> @@ -757,6 +775,12 @@ pcie_reset: pcie-reset {
>  			rockchip,pins = <2 RK_PB4 RK_FUNC_GPIO &pcfg_pull_up>;
>  		};
>  	};
> +
> +	usb {
> +		usb_host_pwren: usb-host-pwren {
> +			rockchip,pins = <4 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
>  };
>  
>  &sai1 {
> @@ -798,11 +822,25 @@ &sdmmc {
>  	status = "okay";
>  };
>  
> +&u2phy1 {
> +	status = "okay";
> +};
> +
> +&u2phy1_otg {
> +	phy-supply = <&vcc_5v0_host>;
> +	status = "okay";
> +};
> +
>  &uart0 {
>  	pinctrl-0 = <&uart0m0_xfer>;
>  	status = "okay";
>  };
>  
> +&usb_drd1_dwc3 {
> +	dr_mode = "host";
> +	status = "okay";
> +};
> +
>  &vop {
>  	status = "okay";
>  };
> 
> 




