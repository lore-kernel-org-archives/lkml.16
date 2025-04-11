Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29126278E6D;
	Fri, 11 Apr 2025 11:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744370820; cv=none; b=jt6RTc8DP/6ixrzNyDwm/of0HKl67uDNaxZ93qPqrQwEFeirVTQcykRGvy34fte3z8/RWuhXlWpcRVzCBYCSBpP3ST+b84LOWfr/Ln8AMDakt8+X7kRVHPmRIQh38mRSMSXG+w5nltG4UOpW2Q5M7B2lKpi9BTxukEpttNtdA4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744370820; c=relaxed/simple;
	bh=mI/ozsZ8Y6S9acmqLsBXGFaif7oHOC/C7Y77zKPoVr0=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k02MopqWFEILUSSSYKhhNEGjLGdIqd4w4K9c52S7rUhuvQfiVdAb8ckBWNL5McdniwmcIHvdYOmxGC2Cx7pAPWLBhLa/p5Rb5HDEC2+F18uM2VXuIYA4K6NkDln2+jWM7C0OuoKg6oTWyIs5/CX2HUALp3ynYCEiuDJAfdoF8J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ZSrDs/NU; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZSrDs/NU"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53BBQqvC2109141
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 06:26:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744370812;
	bh=h7nuwgLYxSWvEr+B62ZngX9a1kKC+J1LhPwwVf57ZJQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ZSrDs/NUAgyzHgZyMxpwagAp//2hRg2I4NZ1MGMOsSWj6hXpSe25WVsTh/aTr7uci
	 g51r9zLNRwdyt4wT82dWl5mqtH4DWmxEBRM/YFbrTmLWO4cXTugLteH07JFRdoDtgU
	 Dr+DcWjDLrA4t8uX9+4i0Fe5JuGdU/RxSXFxHmpo=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53BBQqS6029456
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Apr 2025 06:26:52 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Apr 2025 06:26:51 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Apr 2025 06:26:51 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53BBQpqG088464;
	Fri, 11 Apr 2025 06:26:51 -0500
Date: Fri, 11 Apr 2025 06:26:51 -0500
From: Nishanth Menon <nm@ti.com>
To: Anurag Dutta <a-dutta@ti.com>
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <u-kumar1@ti.com>,
        <vaishnav.a@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-j721e-common-proc-board: Add
 bootph-all to HBMC nodes
Message-ID: <20250411112651.4kt4qgiz4ikylbwi@onboard>
References: <20250411082637.2271746-1-a-dutta@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250411082637.2271746-1-a-dutta@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 13:56-20250411, Anurag Dutta wrote:
> Add bootph-all to HBMC controller and hyperflash nodes for successful
> hyperflash boot on j721e-evm.
> 
> Signed-off-by: Anurag Dutta <a-dutta@ti.com>
> ---
> 
> Test logs : https://gist.github.com/anuragdutta731/90a492589557c2ec2881e1de50a62006
> 
>  arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
> index 4421852161dd..9ada749f16ba 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
> @@ -570,6 +570,13 @@ &usb1 {
>  	maximum-speed = "high-speed";
>  };
>  
> +&hbmc {
> +	bootph-all;

Documentation/devicetree/bindings/dts-coding-style.rst
Please add an EoL

> +	flash@0,0 {
> +		bootph-all;
> +	};
> +};

Why &hbmc, why not in the SoM.dtsi?

> +
>  &ospi1 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&mcu_fss0_ospi1_pins_default>;
> -- 
> 2.34.1
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
