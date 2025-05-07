Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A92028C2A2;
	Wed,  7 May 2025 16:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746636988; cv=none; b=FtU0uVWl2tZxzg3q4KvtwAruqkORtxEvAwpNa72gS3KVHnCDGC0fDo9HBFwclVymYAb0CFZkYA+EkAKlMBVZFNh2xcI4ynabk8U3WaR+nkKB7UKbe/6LmZeuVTv9yNrZu+SmlZlYPn2/ZAPw+d95mep6Q6cz8wq4KKYsRO1IGto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746636988; c=relaxed/simple;
	bh=G8yG7fiD+drVoJWsnr3QQsegC7Q9gGFV/6SDPFVmP6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gpuaoM8Fx6F3n8uodbgY2m7JIXOpYmR8Ylb/zvrhOEYUswf/hoWu5BLOY7LmB8H6Bx4uzaHoPsgXvMFjmeycx6ajLmA9eT+z8SwGDxQEdJZKGb1540UPEo8mWH0pPoOeSUscfItGfahL4wepc+8PEReB5YeeO05B26aREeLpwqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Y7QuOjyR; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Y7QuOjyR"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 547GuEaL867288
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 May 2025 11:56:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746636974;
	bh=jaKjSlRu1WXVw9EyzBu98dAha3ndJFifpvhWA7RJcL0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Y7QuOjyRoihv73KpXsYifbOAk6x4QsVI6fW4QQBJdSrKOmKzhOjO4CvF7deYIM3WG
	 3W+/fw6+VaZH8okE5sHfhXFC/dNjDXRCgFp5I5GCwYSSMmaUs2vPwhspDqWm1MxVdC
	 rcCm+mdsuba4+nL+qLF115rV59CoL1eT7lr0h/Dc=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 547GuEOq064996
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 May 2025 11:56:14 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 May 2025 11:56:14 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 May 2025 11:56:14 -0500
Received: from [128.247.81.19] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 547GuDWE130295;
	Wed, 7 May 2025 11:56:14 -0500
Message-ID: <d4f21cdc-bb0c-4c78-aeea-f6e5c75fa5f1@ti.com>
Date: Wed, 7 May 2025 11:56:13 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] arm64: dts: ti: k3-am62a7-sk: Set wakeup-source
 system-states
To: Markus Schneider-Pargmann <msp@baylibre.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Vishal Mahaveer <vishalm@ti.com>,
        Kevin
 Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>,
        Sebin Francis
	<sebin.francis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>
References: <20250421-topic-am62-dt-partialio-v6-15-v1-0-6ced30aafddb@baylibre.com>
 <20250421-topic-am62-dt-partialio-v6-15-v1-6-6ced30aafddb@baylibre.com>
Content-Language: en-US
From: Kendall Willis <k-willis@ti.com>
In-Reply-To: <20250421-topic-am62-dt-partialio-v6-15-v1-6-6ced30aafddb@baylibre.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 4/21/25 03:14, Markus Schneider-Pargmann wrote:
> The CANUART pins of mcu_mcan0, mcu_mcan1, mcu_uart0 and wkup_uart0 are
> powered during Partial-IO and IO+DDR and are capable of waking up the
> system in these states. Specify the states in which these units can do a
> wakeup on this board.
> 
> Note that the UARTs are not capable of wakeup in Partial-IO because of
> of a UART mux on the board not being powered during Partial-IO.
> 
> Add pincontrol definitions for mcu_mcan0 and mcu_mcan1 for wakeup from
> Partial-IO. Add these as wakeup pinctrl entries for both devices.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
>   arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 76 +++++++++++++++++++++++++++++++++
>   1 file changed, 76 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> index 1c9d95696c839a51b607839abb9429a8de6fa620..724d9a6f3c575fe35496fdd9e17d6d8e33869f92 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> @@ -741,3 +741,79 @@ dpi1_out: endpoint {
>   		};
>   	};
>   };
> +
> +&mcu_mcan0 {
> +	pinctrl-names = "default", "wakeup";
> +	pinctrl-0 = <&mcu_mcan0_tx_pins_default>, <&mcu_mcan0_rx_pins_default>;
> +	pinctrl-1 = <&mcu_mcan0_tx_pins_default>, <&mcu_mcan0_rx_pins_wakeup>;
> +	wakeup-source = <&system_partial_io>,
> +			<&system_io_ddr>,
> +			<&system_deep_sleep>,
> +			<&system_mcu_only>,
> +			<&system_standby>;
> +	status = "okay";
> +};
> +
> +&mcu_mcan1 {
> +	pinctrl-names = "default", "wakeup";
> +	pinctrl-0 = <&mcu_mcan1_tx_pins_default>, <&mcu_mcan1_rx_pins_default>;
> +	pinctrl-1 = <&mcu_mcan1_tx_pins_default>, <&mcu_mcan1_rx_pins_wakeup>;
> +	wakeup-source = <&system_partial_io>,
> +			<&system_io_ddr>,
> +			<&system_deep_sleep>,
> +			<&system_mcu_only>,
> +			<&system_standby>;
> +	status = "okay";
> +};
> +
> +&mcu_uart0 {
> +	wakeup-source = <&system_io_ddr>,
> +			<&system_deep_sleep>,
> +			<&system_mcu_only>,
> +			<&system_standby>;
> +};
> +
> +&wkup_uart0 {
> +	wakeup-source = <&system_io_ddr>,
> +			<&system_deep_sleep>,
> +			<&system_mcu_only>,
> +			<&system_standby>;
> +};
Hi Markus,

I noticed wkup_uart0 is already referenced earlier in the dts. Could the 
wakeup-source property be added into the first reference?
> +
> +&mcu_pmx0 {
Same thing with mcu_pmx0. Is there a reason for separating it from when 
it was referenced originally?
> +	mcu_mcan0_tx_pins_default: mcu-mcan0-tx-default-pins {
> +		pinctrl-single,pins = <
> +			AM62X_IOPAD(0x034, PIN_OUTPUT, 0) /* (D6) MCU_MCAN0_TX */
> +		>;
> +	};
> +
> +	mcu_mcan0_rx_pins_default: mcu-mcan0-rx-default-pins {
> +		pinctrl-single,pins = <
> +			AM62X_IOPAD(0x038, PIN_INPUT, 0) /* (B3) MCU_MCAN0_RX */
> +		>;
> +	};
> +
> +	mcu_mcan0_rx_pins_wakeup: mcu-mcan0-rx-wakeup-pins {
> +		pinctrl-single,pins = <
> +			AM62X_IOPAD(0x038, PIN_INPUT | WKUP_EN, 0) /* (B3) MCU_MCAN0_RX */
> +		>;
> +	};
> +
> +	mcu_mcan1_tx_pins_default: mcu-mcan1-tx-default-pins {
> +		pinctrl-single,pins = <
> +			AM62X_IOPAD(0x03c, PIN_OUTPUT, 0) /* (E5) MCU_MCAN1_TX */
> +		>;
> +	};
> +
> +	mcu_mcan1_rx_pins_default: mcu-mcan1-rx-default-pins {
> +		pinctrl-single,pins = <
> +			AM62X_IOPAD(0x040, PIN_INPUT, 0) /* (D4) MCU_MCAN1_RX */
> +		>;
> +	};
> +
> +	mcu_mcan1_rx_pins_wakeup: mcu-mcan1-rx-wakeup-pins {
> +		pinctrl-single,pins = <
> +			AM62X_IOPAD(0x040, PIN_INPUT | WKUP_EN, 0) /* (D4) MCU_MCAN1_RX */
> +		>;
> +	};
> +};Additionally, this patch does not apply cleanly to linux-next and needs 
to be fixed and rebased.

Best,
Kendall Willis
> 

