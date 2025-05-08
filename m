Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C53822332B;
	Thu,  8 May 2025 12:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746707668; cv=none; b=emxlyG13g97/Pn4b3ClmAhmtLTidcypL9QdaKLvE5rIKmCI8pTY98Rm14tbV6w8wvMTQWm9Z+BYAR0fPqN53vj5UclUpttSiw3Bo0LuGOcSVEBstiYxiqxtZFLHHymEyuGFnrnxaIGyWlat/KBDju9vbM25Rj872tZTyKB8+SGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746707668; c=relaxed/simple;
	bh=xiKbxdt8+5AZr1b1CIHbKL+QvyDptDXPVRJXI7EII2Q=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uafE+MN0y05uaXPa0KHbmN6F7UQAfoGSzvzGPvu7Pkh6l9HlfwRMtSu3kuH/pzJFDgbM8LCj3lncCWIFyNhc4MVsqf64lUVgWjQWeCkm+jUujF3EMkaFUPWSBMGcaRsxMVCS/EUyo+e04Wh98Erm+WU6L4IutgvjSpFeOZRbI2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=aTp1UTED; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="aTp1UTED"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 548CXx4r1861770
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 8 May 2025 07:33:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746707639;
	bh=F6fnSSy58jOAFukWndBiel7ol37QH7BTey2iymzdWF8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=aTp1UTED+pWJfvS+7BSiGkIivvMcMQWkiuK0Kl5Jp9gYgzAZPNjmnqYX1qHFxQQqi
	 qq7F2x12jl4TZCIbxL5oJnAj4IGVvhlB0teEt41gBXTLQX8TF20X+piNubcEfDm421
	 XGi1G04H4cNdWx2KHbAW+ind4Fb3NapywNq9A3LM=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 548CXxuG034750
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 May 2025 07:33:59 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 May 2025 07:33:59 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 May 2025 07:33:59 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 548CXx0T075359;
	Thu, 8 May 2025 07:33:59 -0500
Date: Thu, 8 May 2025 07:33:59 -0500
From: Nishanth Menon <nm@ti.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bryan Brattlof <bb@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 2/3] arm64: dts: ti: k3-am62l: add initial
 infrastructure
Message-ID: <20250508123359.k72q4u45wzms7uaw@handpick>
References: <20250507-am62lx-v5-0-4b57ea878e62@ti.com>
 <20250507-am62lx-v5-2-4b57ea878e62@ti.com>
 <20250508-illegal-caracara-from-hyperborea-b77eda@kuoka>
 <bd33bfa6-9d31-457d-a1bf-66151e92900b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <bd33bfa6-9d31-457d-a1bf-66151e92900b@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 08:56-20250508, Krzysztof Kozlowski wrote:
> On 08/05/2025 08:52, Krzysztof Kozlowski wrote:
> > On Wed, May 07, 2025 at 10:09:20PM GMT, Bryan Brattlof wrote:
> >> +
> >> +	uart6: serial@2860000 {
> >> +		compatible = "ti,am64-uart", "ti,am654-uart";
> >> +		reg = <0x00 0x02860000 0x00 0x100>;
> >> +		interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
> >> +		power-domains = <&scmi_pds 82>;
> >> +		clocks = <&scmi_clk 322>;
> >> +		clock-names = "fclk";
> >> +		status = "disabled";
> >> +	};
> >> +
> >> +	conf: syscon@9000000 {
> >> +		compatible = "syscon", "simple-mfd";
> > 
> > Not much improved here. You cannot have such compatibles alone and the
> > bindings test this.
> > 
> > Are you sure you tested this?
> I now tested it and I am 100% sure you did not.
> 
> Use tools and computers instead of humans for finding trivial issues.
> This is not really acceptable.

Agree.

Bryan,
In addition to bisect fails in this series, I see the following
dtbs_check errors:

arch/arm64/boot/dts/ti/k3-am62l3-evm.dtb: serial@0: clock-names:0: 'fclk' was expected
arch/arm64/boot/dts/ti/k3-am62l3-evm.dtb: spi@fc40000: '#address-cells' is a dependency of '#size-cells'
arch/arm64/boot/dts/ti/k3-am62l3-evm.dtb: syscon@43000000: compatible: ['syscon', 'simple-mfd'] is too short
arch/arm64/boot/dts/ti/k3-am62l3-evm.dtb: syscon@9000000: 'reg' is a required property

I suggest doing a revisit of this for the next window.

PS: https://github.com/nmenon/kernel_patch_verify is a tool I use and
maintain which might help alleviate some of the easy checklist items -
but this is probably not an authoritative tool and making sure, but if
it helps you, please do use it - it is containerized for easy env setup
(you could run kpv -V -C -L -3 for example on this series and get this:
https://gist.github.com/nmenon/83f7e6924539d1c7e2eb6c5a4ee82706 )

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
