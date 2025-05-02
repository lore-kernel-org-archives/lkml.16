Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F2121FF22;
	Fri,  2 May 2025 07:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746172148; cv=none; b=uYGxji2XIXkb30O60zgT4evg9fyluUZkv+5MBrWiGEIr867oaC4hHHoO2++s1MqjyzJ0fSOSwyW3arWOjseK5XrkXV+h+bN03et9op37kMW7rpVLBMMIh8NKNZp21KM8pSeNiaBYb9kAcZjgmyLFw8nbtzNP2xn6+M5Bsfj08FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746172148; c=relaxed/simple;
	bh=oYv8bsdem3fGUgaGGpXJVflIaHVCd3b2DUks+2+OuLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=twuLtycGhRefutJFPfZR6FXong765YC4c3I9Fh5GmB4YrYSwq9jbiKSS7j7Co9g14ssxLkKcc0LeWUCwL4ylh2OmOrEd16AobjSAXXJYWYAsaPsZ9/YIuqTcVqA2XblhQxlurTs/0OqOgdzggP6hmfnCL1ltau5KDk8VUyrojTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=rf0WrmKY; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="rf0WrmKY"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5427mcH2361756
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 02:48:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746172118;
	bh=4LqHMCcK2l/V1M+MRFnOp7hwBiMnH0PyGKsakcx8Vu4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=rf0WrmKYKQOaRfLqXQkErznRX00xbww/2tmuOYEGfDRAOIkoUfW/GrLJDFJ+cPaWx
	 ViNK9XvI/6X1wNerCLuFqNAyCe+XavbvaEw1qt8c7SvNT4SvtD9VBi0uydqdDmQ7bG
	 nsWaHdTw8Xs5Q/DaJ8BTA+SWpdWSS/ouSwPI1/lQ=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5427mcsv045384
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 02:48:38 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 02:48:37 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 02:48:37 -0500
Received: from [172.24.227.193] (devarsh-precision-tower-3620.dhcp.ti.com [172.24.227.193])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5427mWwB079020;
	Fri, 2 May 2025 02:48:33 -0500
Message-ID: <6cf6f0f4-6559-4d74-ab69-1ccdf131512d@ti.com>
Date: Fri, 2 May 2025 13:18:32 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH v1 1/4] arm64: dts: ti: k3-am62p5-sk: Add regulator nodes
 for AM62P
To: Rishikesh Donadkar <r-donadkar@ti.com>, <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>, <y-abhilashchandra@ti.com>,
        <s-jain1@ti.com>, <jai.luthra@linux.dev>,
        <jai.luthra@ideasonboard.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <imx@lists.linux.dev>
References: <20250429154133.3377962-1-r-donadkar@ti.com>
 <20250429154133.3377962-2-r-donadkar@ti.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20250429154133.3377962-2-r-donadkar@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 29/04/25 21:11, Rishikesh Donadkar wrote:
> Add regulator node for AM62P-SK
> 
> VCC_3V3_MAIN is the output of LM5141-Q1, and it serves as an input to
> TPS22965DSGT which produces VCC_3V3_SYS [1]
> 
> VCC_3V3_SYS servers as vin-supply for peripherals like CSI [1].
> 
> Link: https://www.ti.com/lit/zip/sprr487 [1]
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>

Reviewed-by: Devarsh Thakkar <devarsht@ti.com>

Regards
Devarsh
> ---
>  arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> index c2f55cc5a8ebc..0af33fccb96bf 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
> @@ -115,6 +115,28 @@ vddshv_sdio: regulator-3 {
>  		bootph-all;
>  	};
>  
> +	vcc_3v3_main: regulator-4 {
> +		/* output of LM5141-Q1 */
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_3v3_main";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vmain_pd>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	vcc_3v3_sys: regulator-5 {
> +		/* output of TPS222965DSGT */
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_3v3_sys";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vcc_3v3_main>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
>  	leds {
>  		compatible = "gpio-leds";
>  		pinctrl-names = "default";

