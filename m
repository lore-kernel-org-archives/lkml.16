Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC922C327E;
	Tue,  3 Jun 2025 09:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748942798; cv=none; b=Nm99Gjd4fH1g+BCSQRK69tNXZGwGqaxbVeEQpKhwaFJJJgpdy1IvtZvCEIIFpVG6nyZeul+8Gl5LnTP2hq7wDZ/Q9sH4K6WAO91DKkOE9HDRZ0J6wbhpC+ckd8vVq/ToT+4LzrtAtM1oq9L4aylwefz8C6FxLg57jgMTIpUh89k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748942798; c=relaxed/simple;
	bh=rWu/iFNHJMc0RBPfQaaAnGb4tKaHlTC491HIdR4jnJs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=H5Y9SSzzFulGAYlbwBY33BXNwX/KGKx6iibIU8yvr16lv3o1itPDNaRhpNlq5vNiKRLuHzwo3roxq1QFH4BgeD8dYgs0e+++GHuyTB8UtXeMyPxTZ6oL9jFKSpYkGjK1p5iqFV71ba6sRQjCVe2sOM2+5Le/Z6M9YtUF4Z784LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=c6fYdD2C; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="c6fYdD2C"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5539QUqM479564;
	Tue, 3 Jun 2025 04:26:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748942790;
	bh=Ar3GGAb+/pAvjf2tv2l9yKeAgpPBlAH6wYuKkop+dTc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=c6fYdD2Cmg3lp7IfgHeapSSfZ/o9v7TnEqybHqLSreuxzk7dhZJJxNpLsM/jGx+7I
	 6uJJPNybqPuCTx9euftMDYW5ezkSN53LpgNoEoQr8J0T2NeTAKvKyhj6XPqtq2pJGw
	 kdMwUs1EAMtDDXhgkdTCwwjcbOU0amOqE7zVsQTg=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5539QUmK1226445
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 3 Jun 2025 04:26:30 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Jun 2025 04:26:30 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Jun 2025 04:26:30 -0500
Received: from [172.24.227.151] (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5539QQrT222532;
	Tue, 3 Jun 2025 04:26:27 -0500
Message-ID: <b6b752c8-020b-47be-a77a-84161f8e7267@ti.com>
Date: Tue, 3 Jun 2025 14:56:26 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH] arm64: dts: ti: k3-j784s4-mcu-wakeup: Configure
 wkup_uart0 with clock settings
To: Udit Kumar <u-kumar1@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250603042448.783956-1-u-kumar1@ti.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <20250603042448.783956-1-u-kumar1@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 03/06/25 09:54, Udit Kumar wrote:
> From: Bhavya Kapoor <b-kapoor@ti.com>
>
> This commit adds the assigned-clocks and assigned-clock-parents
> properties for wkup_uart0 in J784S4. Specifically, the assigned-clocks
> property is set to reference the clock identified by
> "wkup_usart_mcupll_bypass_out0", ensuring the UART operates with the
> correct clock source.
>
> The assigned-clock-parents property specifies "wkup_usart_clksel_out0"
> as the parent clock. This configuration is critical for establishing
> the proper clocking hierarchy, enabling the UART device to function
> reliably across different baud rates.
>
> Signed-off-by: Bhavya Kapoor <b-kapoor@ti.com>
> ---
> Link to v1: https://lore.kernel.org/all/20241009072056.3511346-1-b-kapoor@ti.com/
>
>  arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi


Also $Subject line needs to be correct for k3-j784s4-j742s2-mcu-wakeup-common.dtsi file.

Thanks,
Beleswar

> index 52e2965a3bf5..1146bc5990ea 100644
> --- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi
> @@ -310,6 +310,8 @@ wkup_uart0: serial@42300000 {
>  		interrupts = <GIC_SPI 897 IRQ_TYPE_LEVEL_HIGH>;
>  		clocks = <&k3_clks 397 0>;
>  		clock-names = "fclk";
> +		assigned-clocks = <&k3_clks 397 0>;
> +		assigned-clock-parents = <&k3_clks 397 1>;
>  		power-domains = <&k3_pds 397 TI_SCI_PD_EXCLUSIVE>;
>  		status = "disabled";
>  	};
