Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7A42C3251
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 05:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748843910; cv=none; b=UcdUUKFfpnLnPCY+f0F5oAkxEv3qs0rdryMUlzjJF+vmc/2VEHoZhnA++pB0efIwufFMHuaNjIOGGJx7fSjUzchg3wOYtswmuoS11qWeHVRqKrjQ9VrylqGx5DRKKy+ugcQu4s4qapLZw2EwqeOUWtzb1DlHgIV/z3VBFyEaGpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748843910; c=relaxed/simple;
	bh=BlAccEP7azyMG34bgH8C4z4l7+9bBb4IqMdJOIlkm+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DFfrY5VDWZ6Pfmsthcwq6fXApNPC5edBm/F/fDjIY6Da6yzvSoSJBgskIwf3zi9QtG2v/3dQR/WU6vL6j4yfILg+vvNx46yPhLjdjDQMl/kXd1Qx78/pUcTI7CH9QcLQbi6uxZllCSIu2EgHb9XuBxd//4/AFPoMfiRhMLxiwGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uLyBT-0004cf-Q8; Mon, 02 Jun 2025 07:58:07 +0200
Message-ID: <1214db7b-dc79-4a3a-a1cc-0b09b3216d30@pengutronix.de>
Date: Mon, 2 Jun 2025 07:58:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: imx8mp-nominal: Explicitly configure
 nominal VPU clocks
To: Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 aford@beaconembedded.com, m.felsch@pengutronix.de, imx@lists.linux.dev,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org
References: <20250530221713.54804-1-aford173@gmail.com>
 <20250530221713.54804-4-aford173@gmail.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20250530221713.54804-4-aford173@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

Hello Adam,

On 31.05.25 00:17, Adam Ford wrote:
> In preparation for increasing the default VPU clocks to overdrive,
> configure the nominal values first to avoid running the nominal
> devices out of spec when imx8mp.dtsi is changed.

Thanks for keeping imx8mp-nominal.dtsi users in mind.

> 
> Signed-off-by: Adam Ford <aford173@gmail.com>

Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Cheers,
Ahmad

> ---
>  .../boot/dts/freescale/imx8mp-nominal.dtsi     | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi
> index 2ce1860b244d..f269f7a004fc 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi
> @@ -89,4 +89,22 @@ &media_blk_ctrl {
>  			       <1039500000>;
>  };
>  
> +&vpu_g1 {
> +	assigned-clocks = <&clk IMX8MP_CLK_VPU_G1>;
> +	assigned-clock-parents = <&clk IMX8MP_VPU_PLL_OUT>;
> +	assigned-clock-rates = <600000000>;
> +};
> +
> +&vpu_g2 {
> +	assigned-clocks = <&clk IMX8MP_CLK_VPU_G2>;
> +	assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>;
> +	assigned-clock-rates = <500000000>;
> +};
> +
> +&vpumix_blk_ctrl {
> +	assigned-clocks = <&clk IMX8MP_VPU_PLL>, <&clk IMX8MP_CLK_VPU_BUS>;
> +	assigned-clock-parents = <0>, <&clk IMX8MP_VPU_PLL_OUT>;
> +	assigned-clock-rates = <600000000>, <600000000>;
> +};
> +
>  /delete-node/ &{noc_opp_table/opp-1000000000};


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
