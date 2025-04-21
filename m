Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311EE264619;
	Mon, 21 Apr 2025 11:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745235867; cv=none; b=fWAMI11NfxV0d/Vy1iz2w+8Jm9GYWfuAZzyELjzBmS0ZEu/SA/HYGXDsUItC/xrQuq2dZk7Q6mzso8ebU6MH7LqH/tgxwrnudeb94NtKoDE3wzG954yTLbY5ot0ehZ997PTTXRw1X65RqW+TyeZS58RVWf8zxBpNq4AgWZec0ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745235867; c=relaxed/simple;
	bh=K2yDIHrClKJMzFSfH79towDwJE2UtYL4T0nd7cHxXio=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oyGx0YjbzIk5kV0UNusT/OZOOTgOHK0/bF/Z+a7v5s+V2LBoSCRrsvEliaAuAArmcN7gXZgLShsjrkQ/orl5yUR7M98G/M9W3eXpEZ5PksXcrQlizFu5r8eyzPqGCFKlu1ro4z8ct29H4MoxpD+8HR2jwG3WF2Oea2MEtQZ/yho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=PPPHtQpM; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="PPPHtQpM"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53LBiLBC1538159
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 06:44:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745235861;
	bh=dgV536aKTURayOABQgXkmovr+QyXvP7zhUmjnkrwm5M=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=PPPHtQpMHPxFn0vUFkBubAbpbv9Y9otaMEmRss1vSJxtNZ/DTA9cZ4owWfweKhkdx
	 ojw6FHIYrP1URZJUqqryZYePV5kOrYOYbhX9PQ2qYomf+/CWEwDMJ0wd1fBhz8z4T5
	 QeH9nCcIFPEbFhKMKmjad3nVmkE4ycgDs1dK4m24=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53LBiLC0008738
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Apr 2025 06:44:21 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Apr 2025 06:44:21 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Apr 2025 06:44:21 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53LBiLat113661;
	Mon, 21 Apr 2025 06:44:21 -0500
Date: Mon, 21 Apr 2025 06:44:21 -0500
From: Nishanth Menon <nm@ti.com>
To: Anurag Dutta <a-dutta@ti.com>
CC: <vigneshr@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] arm64: dts: ti: k3-j721e-som-p0: Add bootph-all to
 HBMC node
Message-ID: <20250421114421.pj6vceavzjl2qkky@filing>
References: <20250416060754.2393701-1-a-dutta@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250416060754.2393701-1-a-dutta@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 11:37-20250416, Anurag Dutta wrote:
> Add bootph-all to HBMC controller node for successful hyperflash
> boot on j721e-evm
> 
> Signed-off-by: Anurag Dutta <a-dutta@ti.com>
> ---
> Test log : https://gist.github.com/anuragdutta731/103e84e84f013093fa089803719d997d
> 
> Changelog : v1:
> 1. Added bootph-all to hbmc node in k3-j721e-som-p0.dtsi
> 2. Removed bootph-all from v1 patch from flash@0,0 node
> 
> Link to v1 : https://lore.kernel.org/all/20250411082637.2271746-1-a-dutta@ti.com/
> 
>  arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi
> index 0722f6361cc8..5665b9490003 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi
> @@ -440,6 +440,7 @@ &hbmc {
>  	pinctrl-0 = <&mcu_fss0_hpb0_pins_default>;
>  	ranges = <0x00 0x00 0x05 0x00000000 0x4000000>, /* 64MB Flash on CS0 */
>  		 <0x01 0x00 0x05 0x04000000 0x800000>; /* 8MB RAM on CS1 */
> +	bootph-all;
>  
>  	flash@0,0 {
>  		compatible = "cypress,hyperflash", "cfi-flash";

This node already has bootph-all, only the child nodes need bootph
properties. Am i missing something?

> -- 
> 2.34.1
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
