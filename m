Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EC9136347;
	Sat, 19 Apr 2025 09:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745054634; cv=none; b=d85Yn4Fnj2BzKfVPtYpzV7vsmM+zlVqOLl7jbswGm9bK8WFBD+HM5plTPtqwiSJ5zEBaDbmm/f8oeQDjBvVPpY7NeNRTbhgrhLgmut8x/W4RgmfdlhbeeaKvz5mfiP/XT0FCYjlaAdsg2qmsUsC+PfHqUecq2hZVKNUmzHa4ihk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745054634; c=relaxed/simple;
	bh=phzhUntHk6ukb2d20bQw4EG+EEERA44Yo2C7eccyh2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gUlbJ9H7Y2biymra7ZadoRHjVAEsPuWIAjLNTRj8a/HHWRwhk9ktzVvQPiPpffuBkCdOmSWUhbCUn250XEDRoe+bF7p3DtdiuwKwUKephlK/f1Frb5RpBTwjpeu6J4Gb+wasbTm6sRDwno1vlE0OuGRANj/2576WtyB5IEpq4XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=DtpOHdcp; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="DtpOHdcp"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53J9NkGq467719
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 19 Apr 2025 04:23:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745054626;
	bh=Us1OPcT95pYq6Zs+MqELVB/1+jFKO5SGLPxS8Hzr2No=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=DtpOHdcpz1VGX4Ip/XrqrqmLvNjnw7B4R30mGpLAoTgjc6skbLjzEMEuT90916WF+
	 OdQzVRIkwYDMqH1FaMjNPSiYH1CJjzp/8txIpb6j6PY+uHl76+oaIpJp3UBg6zMNYk
	 P9ejHC1MGQ8Bgjler7jLp7Kqpmf4jWQ42InDWntc=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53J9NkSO110970
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 19 Apr 2025 04:23:46 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 19
 Apr 2025 04:23:45 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 19 Apr 2025 04:23:45 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53J9NgGE070413;
	Sat, 19 Apr 2025 04:23:42 -0500
Message-ID: <ab27873e-cada-4135-a617-5d4567a4eaa5@ti.com>
Date: Sat, 19 Apr 2025 14:53:41 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] arm64: dts: ti: k3-j721s2-common-proc-board: Add
 main_i2c4 instance
To: Jayesh Choudhary <j-choudhary@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <devarsht@ti.com>, <linux-kernel@vger.kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <kristo@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <u-kumar1@ti.com>
References: <20250411105155.303657-1-j-choudhary@ti.com>
 <20250411105155.303657-5-j-choudhary@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250411105155.303657-5-j-choudhary@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 4/11/2025 4:21 PM, Jayesh Choudhary wrote:
> Add dt node for main_i2c4 instance along with required pinmuxing.
> Also add the gpio expander 'exp4' required by display connector.
>
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>   .../dts/ti/k3-j721s2-common-proc-board.dts    | 21 +++++++++++++++++++
>   1 file changed, 21 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
> index e2fc1288ed07..f691ae4c19e6 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
> @@ -148,6 +148,13 @@ J721S2_IOPAD(0x060, PIN_INPUT_PULLUP, 13) /* (AC27) MCASP2_AXR1.I2C3_SDA */
>   		>;
>   	};
>   
> +	main_i2c4_pins_default: main-i2c4-default-pins {
> +		pinctrl-single,pins = <
> +			J721S2_IOPAD(0x014, PIN_INPUT_PULLUP, 8) /* (AD25) I2C4_SCL */
> +			J721S2_IOPAD(0x010, PIN_INPUT_PULLUP, 8) /* (AF28) I2C4_SDA */
> +		>;
> +	};
> +
>   	main_i2c5_pins_default: main-i2c5-default-pins {
>   		pinctrl-single,pins = <
>   			J721S2_IOPAD(0x01c, PIN_INPUT, 8) /* (Y24) MCAN15_TX.I2C5_SCL */
> @@ -370,6 +377,20 @@ exp2: gpio@22 {
>   	};
>   };
>   
> +&main_i2c4 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&main_i2c4_pins_default>;
> +	clock-frequency = <400000>;
> +
> +	exp4: gpio@20 {
> +		compatible = "ti,tca6408";
> +		reg = <0x20>;
> +		gpio-controller;
> +		#gpio-cells = <2>;

I suggest to add, gpio-line-names as well for this gpio expander.


> +	};
> +};
> +
>   &main_i2c5 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&main_i2c5_pins_default>;
