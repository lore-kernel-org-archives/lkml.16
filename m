Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5962026290;
	Tue,  3 Jun 2025 13:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748958442; cv=none; b=TEK5rQpanitcQqSYtVrWtBM6RiWcidbdwKNDK3++Fgjbw3CF+8p7rjSaf3HfPLtKhD3WVjHv6LAboLEL4CuzOP3FR7s5wLTpAv/+9rE9TA2n49ZBmuoRvWiet1C4eJvnqTmLAPsOPKt9WeapLNFsznpFuWjZyz+eXRHXXvAePPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748958442; c=relaxed/simple;
	bh=pd1x/fpN0kCq6P0Qa6LVM1Fk0MIgZbD1MTkU81dkn7Y=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r/mjFdAP3MoNf1QyFwBkxrdhYQuXiqtfkpzNSYYgPkASrn8VG4ZKHArrlpRh/xrENN6/2iud9rlJBRRDVo+ObZYBvMe6oyAm/Vbg4tIJ0T7JSZv7vpNMPQbEaPujEvQSDfk+J5uPJHSLZ8JfjBhD3bpYChddRRnsxhnNHd8Cipw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=s1ANwLzL; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="s1ANwLzL"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 553Dl6ii532011;
	Tue, 3 Jun 2025 08:47:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748958426;
	bh=PcKTtdKPilwx5nzWIu3x8tr3E4CQQkFp+QVIsqBVgxQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=s1ANwLzLJfUcQfC7M3OLEKN9tQ6LVDiBBwW9dozg4LvJD8Dy4Zhs2PKS201Iw2yVR
	 OmWwPvgb64IZ2RFSc09gQaxIFUh/FEurCRMRv+q0448jNCVlxC0uA6+crCHpG+b37D
	 fYq5X/JCdffY1wt7La2QbTi4weAUt6b5CRX3sAtQ=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 553Dl62A1352764
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 3 Jun 2025 08:47:06 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Jun 2025 08:47:06 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Jun 2025 08:47:05 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 553Dl6nC426191;
	Tue, 3 Jun 2025 08:47:06 -0500
Date: Tue, 3 Jun 2025 08:47:05 -0500
From: Bryan Brattlof <bb@ti.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 2/3] arm64: dts: ti: k3-am62l: add initial
 infrastructure
Message-ID: <20250603134705.wjfwrhph3z6xjgvy@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250507-am62lx-v5-0-4b57ea878e62@ti.com>
 <20250507-am62lx-v5-2-4b57ea878e62@ti.com>
 <aD76wjgGqDSzinT5@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <aD76wjgGqDSzinT5@pengutronix.de>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On June  3, 2025 thus sayeth Sascha Hauer:
> Hi Bryan,
> 
> On Wed, May 07, 2025 at 10:09:20PM -0500, Bryan Brattlof wrote:
>  +
> > +	usbss0: dwc3-usb@f900000 {
> > +		compatible = "ti,am62-usb";
> > +		reg = <0x00 0x0f900000 0x00 0x800>,
> > +		      <0x00 0x0f908000 0x00 0x400>;
> > +		clocks = <&scmi_clk 329>;
> > +		clock-names = "ref";
> > +		power-domains = <&scmi_pds 95>;
> > +		#address-cells = <2>;
> > +		#size-cells = <2>;
> > +		ranges;
> > +		ti,syscon-phy-pll-refclk = <&wkup_conf 0x45000>;
> 
> This doesn't fit together. The register referenced here...
> 
> > +		status = "disabled";
> > +
> > +		usb0: usb@31000000 {
> > +			compatible = "snps,dwc3";
> > +			reg = <0x00 0x31000000 0x00 0x50000>;
> > +			interrupts = <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>, /* irq.0 */
> > +				     <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>; /* irq.0 */
> > +			interrupt-names = "host", "peripheral";
> > +			maximum-speed = "high-speed";
> > +			dr_mode = "otg";
> > +			snps,usb2-gadget-lpm-disable;
> > +			snps,usb2-lpm-disable;
> > +			bootph-all;
> > +		};
> > +	};
> > +
> > +	wkup_conf: syscon@43000000 {
> > +		compatible = "syscon", "simple-mfd";
> > +		reg = <0x00 0x43000000 0x00 0x20000>;
> 
> ...is outside the register range specified here. Consequently the DWC3
> driver doesn't probe. Increasing the register range here fixes this.
> 

Oops yeah I really messed up on this. :/

Thanks for double checking all of this
~Bryan
