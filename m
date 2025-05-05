Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903781FCFFC;
	Mon,  5 May 2025 12:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746448721; cv=none; b=PHsATGip7E6IW+bD7F4gymOmV24VaRCnOzwLdobo4nDbtl1RJJOYu8riPGBIY6mFI3V83r4JGgxTLvN1jfzbORLcjSl+S47cfL7O872rosaQoB7qUKnrAk3Ld+WPqKyiM7O9QGNGPnN8+nsQdruhK9myYJsLN63xeNkXA129Tds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746448721; c=relaxed/simple;
	bh=DjPWvL+pbNYwxMHfjVA7imMUqiVf1Nxpy8ibShvLkrU=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i3PRLSjqVRqzLmQjoW61/D32Iz0C/m5eM/BfC2QGZSKWfEdrqEORQ1153qengYEdm4jSShpEa8CMwz2dDMubEH9Ish7Cg04On17LlUJAW2i/SH9JAbd8USGOaZvDPeoOpdKzOEPtoYSN/djpHCGJg+S2NuqSA9NVqCswMTf/ZCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Maj2dj09; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Maj2dj09"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 545CcXeP762189
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 May 2025 07:38:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746448713;
	bh=dz6qpzr4bWrGe4AO4WpYeTnOtWSVnS+tyHsG4borA2s=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Maj2dj09KHbCoTeBiPWG2KZsInEORj+RINL2szdtWGY1SFP59ODpTrNKBowwZ8XfW
	 ZZWiyMLRDGnjC5eWRcU7uLBryOQLMIojhV1I7u7yxSbgElKKBDCADVe6Ha3FM7QLwA
	 qNG7JL5Y0+rVw+OI1F+qs4WRwMaIMD8sPrEf1ACQ=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 545CcX4X064815
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 May 2025 07:38:33 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 May 2025 07:38:32 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 May 2025 07:38:32 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 545CcWWX066547;
	Mon, 5 May 2025 07:38:32 -0500
Date: Mon, 5 May 2025 07:38:32 -0500
From: Nishanth Menon <nm@ti.com>
To: Prasanth Babu Mantena <p-mantena@ti.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-j721e-common-proc-board: Enable OSPI1
 on J721E
Message-ID: <20250505123832.shukji5gfx3erjdq@lustiness>
References: <20250505112731.2515734-1-p-mantena@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250505112731.2515734-1-p-mantena@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 16:57-20250505, Prasanth Babu Mantena wrote:
> J721E SoM has MT25QU512AB Serial NOR flash connected to
> OSPI1 controller. Enable ospi1 node in device tree.
> 
> Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
> ---
> Test log : https://gist.github.com/PrasanthBabuMantena/9dda540dce88282117de7e0e945e24ca
>  arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
> index e3d0ef6913b2..3112b351c052 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
> @@ -571,6 +571,7 @@ &usb1 {
>  };
>  
>  &ospi1 {
> +	status = "okay";

Follow Documentation/devicetree/bindings/dts-coding-style.rst

>  	pinctrl-names = "default";
>  	pinctrl-0 = <&mcu_fss0_ospi1_pins_default>;
>  
> -- 
> 2.34.1
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
