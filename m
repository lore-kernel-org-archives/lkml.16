Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56A8238D21;
	Wed, 16 Apr 2025 11:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744802838; cv=none; b=RnatGaev7u3IgsELWTKHCuA2jtyKAbn+SsseXSLqx6Os7BLf+iJ1wgVfew96tweiBgWoUJOXw8/sLbsO2i6GU/EPd5t3eZtuAzuSBsQGnzWx+uDZrlzhhdFt6C2qNugS7IWKfnLez3pHgH0bSbPbs67vRffBg5ksEyg2EOEoG3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744802838; c=relaxed/simple;
	bh=fP9KkjGia1IUh+mvVubksKWH4EgyftWq4ARssiLuiQY=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kLFP3jV1TwHnDzhft5XoQ1fqa3BQGObAzAVYNSfc/vLz+UjULbAAPIK7PjsCGld3Nu1Ncm9zXZElxG+jejhXovh3DRRtaxfiFBAcBp+/zxCZgd+WthSMiKbbN5m5rHtsf9FPV+ihWf+nolrGogtkVxGpWqYBXVG0NL5Fpvlq6Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=lAVlsfKm; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="lAVlsfKm"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53GBR1IO301190
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 06:27:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744802821;
	bh=1bumGY4Rkup09Edkp7lgPPesdSqcgIYPU6gyKBvwdmM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=lAVlsfKmco68CVbzMk4LZGE9qz7P5UCp5VQaopkjKKgwJaxaQEg59QR69+z7MFve1
	 lOOgRO306dmbPFPvy+JqlQPEckREYrwpSrejsg1fhw5lQsRDFN+d8HKKTbtvo85Fgd
	 1RPpfN4XQW5hwX+ze3AoprxJ7ZnpAWpVcxqaasPU=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53GBR1YW018214
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 16 Apr 2025 06:27:01 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 16
 Apr 2025 06:27:00 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 16 Apr 2025 06:27:00 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53GBR0gD078534;
	Wed, 16 Apr 2025 06:27:00 -0500
Date: Wed, 16 Apr 2025 06:27:00 -0500
From: Nishanth Menon <nm@ti.com>
To: Randolph Sapp <rs@ti.com>
CC: Matt Coster <matt.coster@imgtec.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Frank Binns
	<frank.binns@imgtec.com>,
        Alessio Belle <alessio.belle@imgtec.com>,
        Alexandru
 Dadu <alexandru.dadu@imgtec.com>,
        Luigi Santivetti
	<luigi.santivetti@imgtec.com>,
        Darren Etheridge <detheridge@ti.com>
Subject: Re: [PATCH 2/2] arm64: dts: ti: k3-j721s2: Add GPU node
Message-ID: <20250416112700.t3zqihsmn24jaiub@purse>
References: <20250415-bxs-4-64-dts-v1-0-f7d3fa06625d@imgtec.com>
 <20250415-bxs-4-64-dts-v1-2-f7d3fa06625d@imgtec.com>
 <D97HVW413ESX.1EEP5D4O6HMOG@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <D97HVW413ESX.1EEP5D4O6HMOG@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 15:29-20250415, Randolph Sapp wrote:
> On Tue Apr 15, 2025 at 11:20 AM CDT, Matt Coster wrote:
> > The J721S2 binding is based on the TI downstream binding in commit
> > 54b0f2a00d92 ("arm64: dts: ti: k3-j721s2-main: add gpu node") from [1]
> > but with updated compatible strings.
> >
> > The clock[2] and power[3] indices were verified from docs, but the
> > source of the interrupt index remains elusive.
> >
> 
> For future reference, interrupt maps are present in the TRM. "Table 6-89. GPU0
> Hardware Requests" explicitly calls it out "GPU0 | GPU0_MISC_0_IRQ_0 |
> GIC500_SPI_IN_56 | COMPUTE_CLUSTER0 | GPU0 interrupt request". Subtract 32 from
> that pin number to get the DT number.

Now that the mystery is resolved, could we update the commit message?
> 
> That comment aside, this series seems fine to me.
> Reviewed-by: Randolph Sapp <rs@ti.com>
> 
> > [1]: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel
> > [2]: https://downloads.ti.com/tisci/esd/latest/5_soc_doc/j721s2/clocks.html
> > [3]: https://downloads.ti.com/tisci/esd/latest/5_soc_doc/j721s2/devices.html
> >
> > Signed-off-by: Matt Coster <matt.coster@imgtec.com>
> > ---
> > This patch was previously sent as [DO NOT MERGE]:
> > https://lore.kernel.org/r/20250410-sets-bxs-4-64-patch-v1-v6-18-eda620c5865f@imgtec.com
> > ---
> >  arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
> > index 92bf48fdbeba45ecca8c854db5f72fd3666239c5..a79ac41b2c1f51b7193e6133864428bd35a5e835 100644
> > --- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
> > +++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
> > @@ -2048,4 +2048,16 @@ watchdog8: watchdog@23f0000 {
> >  		/* reserved for MAIN_R5F1_1 */
> >  		status = "reserved";
> >  	};
> > +
> > +	gpu: gpu@4e20000000 {
> > +		compatible = "ti,j721s2-gpu", "img,img-bxs-4-64", "img,img-rogue";
> > +		reg = <0x4e 0x20000000 0x00 0x80000>;
> > +		clocks = <&k3_clks 130 1>;
> > +		clock-names = "core";
> > +		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
> > +		power-domains = <&k3_pds 130 TI_SCI_PD_EXCLUSIVE>,
> > +				<&k3_pds 373 TI_SCI_PD_EXCLUSIVE>;
> > +		power-domain-names = "a", "b";
> > +		dma-coherent;
> > +	};
> >  };
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
