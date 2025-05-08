Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B72B22A4C2;
	Thu,  8 May 2025 13:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746709955; cv=none; b=tc2/W2UNLBg6hOPpeuxpYmp+7/L13K37SG7bN+JNx8fpO9rqqigA4Vdmz0w6Kmi5J6aEFP3drfbPfq3ZzidAuyjKfs2pUrKptI2mp0g9fnifC5KS4ttepVOVBtD8abS3FJvzLUF1bozC9PjKW7fbPMLv42MZqxwd7fpoU0WPJ/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746709955; c=relaxed/simple;
	bh=jlcRilYX7peOZ/+pmYJ5TIjhNaZ7fe7Zb3g11aiWnBg=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p5vjOGkABr19oXqOwJllQg71ZpIN8rvVTVFEkotsL6NiHkPXkMBZ1Jm4a5TRQBbGfLl1EWBahWEb28XwuXt/57X0dCXNGxbadLQUf7ZtSVhAHAkdve5SMkPyECDeHWdYHVhk1m+PyjnUULlk357ac4qAOJzfAvb1Gj1QmcCvTsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=YE4k+Arr; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="YE4k+Arr"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 548DCQ2N1092122
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 8 May 2025 08:12:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746709946;
	bh=mAddO9XD18HNr+EJVhV4ZhI1UqzDS7MDou3XJj7yQ5A=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=YE4k+Arrg9CJe3iHRwAVCsct6lXZ5zYVV7YAM/JEfGSQ45FgKo85LjbziCQR/DnQ3
	 OH6dL0OWi7uzaDCAceO+FiYHVAat0ASCZMqoS4A2K3K2oakmnBoGRRCS4ABfASDrpL
	 N7GmMKM4slwdDhEn+oK2vfA+9O/ARzPbiYKk6qYk=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 548DCQmi064520
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 May 2025 08:12:26 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 May 2025 08:12:25 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 May 2025 08:12:25 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 548DCPtB075372;
	Thu, 8 May 2025 08:12:25 -0500
Date: Thu, 8 May 2025 08:12:25 -0500
From: Bryan Brattlof <bb@ti.com>
To: Nishanth Menon <nm@ti.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 2/3] arm64: dts: ti: k3-am62l: add initial
 infrastructure
Message-ID: <20250508131225.xsc5exb6skkvmlpy@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250507-am62lx-v5-0-4b57ea878e62@ti.com>
 <20250507-am62lx-v5-2-4b57ea878e62@ti.com>
 <20250508-illegal-caracara-from-hyperborea-b77eda@kuoka>
 <bd33bfa6-9d31-457d-a1bf-66151e92900b@kernel.org>
 <20250508123359.k72q4u45wzms7uaw@handpick>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250508123359.k72q4u45wzms7uaw@handpick>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On May  8, 2025 thus sayeth Nishanth Menon:
> On 08:56-20250508, Krzysztof Kozlowski wrote:
> > On 08/05/2025 08:52, Krzysztof Kozlowski wrote:
> > > On Wed, May 07, 2025 at 10:09:20PM GMT, Bryan Brattlof wrote:
> > >> +
> > >> +	uart6: serial@2860000 {
> > >> +		compatible = "ti,am64-uart", "ti,am654-uart";
> > >> +		reg = <0x00 0x02860000 0x00 0x100>;
> > >> +		interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
> > >> +		power-domains = <&scmi_pds 82>;
> > >> +		clocks = <&scmi_clk 322>;
> > >> +		clock-names = "fclk";
> > >> +		status = "disabled";
> > >> +	};
> > >> +
> > >> +	conf: syscon@9000000 {
> > >> +		compatible = "syscon", "simple-mfd";
> > > 
> > > Not much improved here. You cannot have such compatibles alone and the
> > > bindings test this.
> > > 
> > > Are you sure you tested this?
> > I now tested it and I am 100% sure you did not.
> > 
> > Use tools and computers instead of humans for finding trivial issues.
> > This is not really acceptable.
> 
> Agree.
> 
> Bryan,
> In addition to bisect fails in this series, I see the following
> dtbs_check errors:
> 
> arch/arm64/boot/dts/ti/k3-am62l3-evm.dtb: serial@0: clock-names:0: 'fclk' was expected
> arch/arm64/boot/dts/ti/k3-am62l3-evm.dtb: spi@fc40000: '#address-cells' is a dependency of '#size-cells'
> arch/arm64/boot/dts/ti/k3-am62l3-evm.dtb: syscon@43000000: compatible: ['syscon', 'simple-mfd'] is too short
> arch/arm64/boot/dts/ti/k3-am62l3-evm.dtb: syscon@9000000: 'reg' is a required property
> 
> I suggest doing a revisit of this for the next window.
> 
> PS: https://github.com/nmenon/kernel_patch_verify is a tool I use and
> maintain which might help alleviate some of the easy checklist items -
> but this is probably not an authoritative tool and making sure, but if
> it helps you, please do use it - it is containerized for easy env setup
> (you could run kpv -V -C -L -3 for example on this series and get this:
> https://gist.github.com/nmenon/83f7e6924539d1c7e2eb6c5a4ee82706 )

Yeah I apologize everyone. I was working at little late and didn't 
notice my tooling to catch this stuff failed on me :/

I'll try again for the next window

Thanks for the reviews
~Bryan
