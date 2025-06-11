Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6819A22F743;
	Wed, 11 Jun 2025 08:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749631468; cv=none; b=GPGJmZ+8IOgNy1GqcmK4HGp68UV5ypp9o8BAOLXgv+y5ozl+901e54k2d4XkjUvlFL+Goxu/NNJkSiseKKwMjDwoi7hJm5+jz89hx1WgnTDUuAT4SHkvZKYOg+Tl4l67juiFRhQTlPtnVTfMe6qaxP2mmQNpaA07hqym6UyDkW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749631468; c=relaxed/simple;
	bh=dvVszUT3uPnC8KVtpUToYPZN6IJed63lQs2gw3TajmA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FTHs/IdLXYHTCx41qePYpu9JsrTZ7SCiNWR0VoPgYOlpqyeSIuMSoPywzbl0KzQRM419Ahwfanrrt2j85H/8Vxarh3E8FvYQqIzZelVEC3eH/tiMV+MMloKSipOb2b7GtP2Z6T87UUQSbnxsbv1Tm1xW54UfpPSYH20AwgG2WGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=moCuXXqH; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="moCuXXqH"
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55B8i8Ua2533730;
	Wed, 11 Jun 2025 03:44:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749631448;
	bh=r/cyKR2BsbAs5v8uav5PPYzVgWDC4zvIuT9U7aRUONw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=moCuXXqHLP+0D+vqVQclCh4tbsQ6iiR+bG+lhm8pX4ZJnIL/an6z/l1VSujr3cn1z
	 /HCQEYpwIMR40v9FfCK/p7CrzFreXytB4r8iwWqK7RTwG+2gVosKZgQXvWbj8bs1Yt
	 CZgMYs6cADT1VuUBIYjOebRulZ4I82SdpfkYFnSc=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55B8i8Xt1593423
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 11 Jun 2025 03:44:08 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 11
 Jun 2025 03:44:07 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 11 Jun 2025 03:44:07 -0500
Received: from [172.24.227.245] (uda0132425.dhcp.ti.com [172.24.227.245])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55B8i4VB067349;
	Wed, 11 Jun 2025 03:44:05 -0500
Message-ID: <98e04654-a693-494d-9f60-930b6a4cd84a@ti.com>
Date: Wed, 11 Jun 2025 14:14:03 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am642-evm-pcie0-ep: Add boot phase
 tag to "pcie0_ep"
To: Hrushikesh Salunke <h-salunke@ti.com>, <nm@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <s-vadapalli@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <danishanwar@ti.com>
References: <20250610054920.2395509-1-h-salunke@ti.com>
Content-Language: en-US
From: Vignesh Raghavendra <vigneshr@ti.com>
In-Reply-To: <20250610054920.2395509-1-h-salunke@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea



On 10/06/25 11:19, Hrushikesh Salunke wrote:
> AM64X SoC has one instance of PCIe which is PCIe0. To support PCIe boot
> on AM64X SoC, PCIe0 needs to be in endpoint mode and it needs to be
> functional at all stages of PCIe boot process. Thus add the
> "bootph-all" boot phase tag to "pcie0_ep" device tree node.
> 
> Signed-off-by: Hrushikesh Salunke <h-salunke@ti.com>
> ---
> This patch is based on commit
> 475c850a7fdd Add linux-next specific files for 20250606
> 
> Changes since v1
> As per feedback from Nishanth, changed the position of "bootph-all"
> tag, according to ordering rules for device tree properties.
> 
> v1 : https://lore.kernel.org/all/20250609115930.w2s6jzg7xii55dlu@speckled/
> 
>  arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso b/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso
> index 432751774853..a7e8d4ea98ac 100644
> --- a/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso
> +++ b/arch/arm64/boot/dts/ti/k3-am642-evm-pcie0-ep.dtso
> @@ -46,6 +46,7 @@ pcie0_ep: pcie-ep@f102000 {
>  		max-functions = /bits/ 8 <1>;
>  		phys = <&serdes0_pcie_link>;
>  		phy-names = "pcie-phy";
> +		bootph-all;
>  		ti,syscon-pcie-ctrl = <&pcie0_ctrl 0x0>;
>  	};
>  };

Are the patches for PCIe boot support merged to U-Boot or such other
bootloader repo?

-- 
Regards
Vignesh
https://ti.com/opensource

