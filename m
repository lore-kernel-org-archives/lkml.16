Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDD51A9B58;
	Fri, 25 Apr 2025 20:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745613030; cv=none; b=m1V8/AosS5dTeaT7so+IBFaa8jeElui/Ty9TCqXDZAtxe0rg/6446lsPd+ZM8PPJvxliIwfjPnYO6T+R5lhTrMW5Vad+tZuOGzuygQKczUETZF11+COXzmnfmv342OjiAPcAhDOgBgYLDYi5bO7hR1aMOwj/uU03TypHtawfB6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745613030; c=relaxed/simple;
	bh=pxPsTSSuze5Uru55U2WmKqbPrLrZUwPhrD4KPyph8OE=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jceTp7d/Ghg54VZsi0/6EGkBFpARQlbILJ09nOjFjGccJ3MoRN4NVVSBKJz0k3u3mWjORD/KlwO0T2N9Pnnsnz3hnScmgJ0onBspFMEJfXJt6m08tQE095+abU8qzP2w+z59Ng0mXWQkZmwPCTYeKQozT3vMUQXuCiXoTHyADS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=XmzXZhed; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="XmzXZhed"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PKUI4t2267675
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 15:30:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745613018;
	bh=Y7NoyDY9Dn6QVm3qjGWsuSrg+qy6pFgw5ECsoArjewM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=XmzXZhedXXAIAjXF7RbhZY/1hUYkv9aofAu/d0J/hGiEwK+XSQlSf+6aqQiCX834w
	 ZkRdbbkNjtDivyI9FtcgY4FvmQhkl10IiYoUXeavSvfq23XpPhOIRev0bWPfPsnxFE
	 NHL69zY/5uBIfdOzjUzck2ZAHzFpYnmS/lIH72u4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PKUInC018335
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 15:30:18 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 15:30:17 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 15:30:17 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PKUHLk051233;
	Fri, 25 Apr 2025 15:30:17 -0500
Date: Fri, 25 Apr 2025 15:30:17 -0500
From: Nishanth Menon <nm@ti.com>
To: Matt Coster <matt.coster@imgtec.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Frank Binns
	<frank.binns@imgtec.com>,
        Alessio Belle <alessio.belle@imgtec.com>,
        Alexandru
 Dadu <alexandru.dadu@imgtec.com>,
        Luigi Santivetti
	<luigi.santivetti@imgtec.com>,
        Randolph Sapp <rs@ti.com>, Darren Etheridge
	<detheridge@ti.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: ti: k3-am62: New GPU binding details
Message-ID: <20250425203017.dzppbtl3euy4rmc4@ranking>
References: <20250422-bxs-4-64-dts-v3-0-ec6657bde135@imgtec.com>
 <20250422-bxs-4-64-dts-v3-1-ec6657bde135@imgtec.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250422-bxs-4-64-dts-v3-1-ec6657bde135@imgtec.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 16:26-20250422, Matt Coster wrote:
> Use the new compatible string and power domain name as introduced in
> commit 2c01d9099859 ("dt-bindings: gpu: img: Future-proofing
> enhancements")[1].
> 
> [1]: https://lore.kernel.org/r/20250410-sets-bxs-4-64-patch-v1-v6-1-eda620c5865f@imgtec.com

Please remove the lore link in the commit message, commit sha
reference is sufficient, url could be used in the diffstat section to
provide reference.

> 
> Reviewed-by: Randolph Sapp <rs@ti.com>
> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
> ---
> Changes in v3:
> - None
> - Link to v2: https://lore.kernel.org/r/20250417-bxs-4-64-dts-v2-1-9f8c09233114@imgtec.com
> Changes in v2:
> - Add Randolph's Rb
> - Link to v1: https://lore.kernel.org/r/20250415-bxs-4-64-dts-v1-1-f7d3fa06625d@imgtec.com
> 
> This patch was previously sent as [DO NOT MERGE]:
> https://lore.kernel.org/r/20250410-sets-bxs-4-64-patch-v1-v6-17-eda620c5865f@imgtec.com
> ---
>  arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> index 7d355aa73ea2116723735f70b9351cefcd8bc118..d17b25cae196b08d24adbe7c913ccaba7eed37eb 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
> @@ -691,12 +691,14 @@ ospi0: spi@fc40000 {
>  	};
>  
>  	gpu: gpu@fd00000 {
> -		compatible = "ti,am62-gpu", "img,img-axe";
> +		compatible = "ti,am62-gpu", "img,img-axe-1-16m", "img,img-axe",
> +			     "img,img-rogue";
>  		reg = <0x00 0x0fd00000 0x00 0x20000>;
>  		clocks = <&k3_clks 187 0>;
>  		clock-names = "core";
>  		interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
>  		power-domains = <&k3_pds 187 TI_SCI_PD_EXCLUSIVE>;
> +		power-domain-names = "a";
>  	};
>  
>  	cpsw3g: ethernet@8000000 {
> 
> -- 
> 2.49.0
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
