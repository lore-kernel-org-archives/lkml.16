Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20A118A6A7;
	Sat, 19 Apr 2025 09:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745055305; cv=none; b=oizJ+nQyUnjqDven+NifbErX39rcldR+Fr0wnxZGW6bBh78F1HyHlXQ/kpWNM9KI46yvlZ4+D9vbMaGqUgc9V1Upc1QRPgqLZN+UY/SAEi5kD3CMtwTCPmVvqQwPn/1pH0j3cHNOWOxYlbk3Yxep8sOHKH7I/IxJKsyTuqty0ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745055305; c=relaxed/simple;
	bh=WolXuewx7OlA5cu8AF4VVhCTZxn5SojxszGM0R0x200=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mabsmheDKMo0ElHakIZAvC3gCVUtwXrapuMIyLUOnTDCkyLUR1nhH9HiOa2xmIs4+hGtOzdZ3bv+VXpAtyjjbwku0Cad9KjeUs1zWmnjy92EevWb1/4pG50/0AVfOjFVEtI7MJWjjugkQCG3XsXKzFyg7nt0j4Afu/+dmIXxdj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=WU8mhadh; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="WU8mhadh"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53J9Yw8m474476
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 19 Apr 2025 04:34:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745055298;
	bh=gft5NuX6qVKgd8gTmf59OKqmKGXTRiwgf8HWTh+DF7E=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=WU8mhadhngmBa/ah+C0F72oEmz78Ms2gn+eanhVvPcR7ZOEnNWmG4iR28aVcX2dXV
	 2AX40nlSeWZpui7cVZjUDOeTu3NeMtupeU+WwgKhVyGIRRvXnRYCqKtxcgs6WlJPpq
	 Fdm5arMpuSnKko7k63wAfw0f0MihaK2U6ViXMW7k=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53J9YwXf087851
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 19 Apr 2025 04:34:58 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 19
 Apr 2025 04:34:58 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 19 Apr 2025 04:34:57 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53J9Ys4F081127;
	Sat, 19 Apr 2025 04:34:55 -0500
Message-ID: <4144abf5-82aa-49db-82d7-c1429c12292e@ti.com>
Date: Sat, 19 Apr 2025 15:04:54 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: ti: k3-am68-sk: Enable DSI on
 DisplayPort-0
To: Jayesh Choudhary <j-choudhary@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <devarsht@ti.com>, <linux-kernel@vger.kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <kristo@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <u-kumar1@ti.com>
References: <20250411105155.303657-1-j-choudhary@ti.com>
 <20250411105155.303657-8-j-choudhary@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250411105155.303657-8-j-choudhary@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 4/11/2025 4:21 PM, Jayesh Choudhary wrote:
> Enable DSI support for AM68-SK platform.
>
> Add DT node for DSI2eDP bridge. The DSI to eDP bridge is sn65dsi86
> on the board.
>
> Add the endpoint nodes to describe connection from:
> DSS => DSI => SN65DSI86 bridge => DisplayPort-0
>
> Set status for all required nodes for DisplayPort-0 as 'okay'.
>
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>   .../boot/dts/ti/k3-am68-sk-base-board.dts     | 96 +++++++++++++++++++
>   1 file changed, 96 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
> index 11522b36e0ce..df54de2d8236 100644
> --- a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
> @@ -124,6 +124,35 @@ transceiver4: can-phy3 {
>   		max-bitrate = <5000000>;
>   	};
>   
> +	edp0_refclk: clock-edp0-refclk {
> +		#clock-cells = <0>;
> +		compatible = "fixed-clock";
> +		clock-frequency = <19200000>;
> +	};

I assume on this board and through out series, display is DP not eDP.

do you see possibility to change wording from eDP to DP


> +
> +	dp0_pwr_3v3: fixedregulator-dp0-pwr {
> +		compatible = "regulator-fixed";
> +		regulator-name = "dp0-pwr";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&exp2 2 GPIO_ACTIVE_HIGH>;     /*P0 - DP0_3V3 _EN */
> +		enable-active-high;
> +		regulator-always-on;
> +	};
> +
> [..]
