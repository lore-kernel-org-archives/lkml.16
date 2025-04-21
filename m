Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437A32F3E;
	Mon, 21 Apr 2025 16:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745252816; cv=none; b=J48Q70cVH6GKpDRDKY01akBoijz1fseQA0sw+IO7VZhQSJ1Afp9kSV7orwL8O04W0q3CFkVi7t5gtk9na8jYVkjH3Rnzku1rym1+h1+AxJvVUb8zkM2hhoS4W1moQYbVcTgl8BQTqxaT6MUkDqLZZy+0VpfzafAmC11jBgI6lM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745252816; c=relaxed/simple;
	bh=gLdgu4xGalp9UqGe7kdJZNbUMZUF2lFo8Lj3SOi2Ndw=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fZnZZEeeP/3N6dp/Bru4yjvJyQf/MvJ1hWyWBOnipF645PBjyWAjG7vAo//VY4yfLcNJAFoZaIjcugyLVOiB9SAkjHs4hJxtzdWQHd7Ch9+7SVcMM4Ak6IbJTdquChWvvB8cchoACNuyaP1m/Ub6kM8G3M9G5LWTF6h552DwExU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ek8u6t2a; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ek8u6t2a"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53LGQkZt977236
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 11:26:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745252806;
	bh=NOkTFt5afGtWmJT4daNzlW4YdB3Z+gtk51dZotU6Cfw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ek8u6t2a2s2W62cgSUPx2eRd9aYk9LWADhwY8mlR6/5yXCe2D8mAtNryYIBb2vTR8
	 KpvU3jhBsNPLbga4Ka5MrlvvUp4bmwWxmoYvu6gmfLFsqN/3q/vU4ukbqhSmSdbYM+
	 zy2TWzymLegG38ArF+BUeyuUMGWobep0Z2XcCzpQ=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53LGQjbt086996
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Apr 2025 11:26:45 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Apr 2025 11:26:45 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Apr 2025 11:26:45 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53LGQj8E087352;
	Mon, 21 Apr 2025 11:26:45 -0500
Date: Mon, 21 Apr 2025 11:26:45 -0500
From: Bryan Brattlof <bb@ti.com>
To: Nishanth Menon <nm@ti.com>
CC: Judith Mendez <jm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Hari Nagalla <hnagalla@ti.com>,
        Beleswar
 Prasad <b-padhi@ti.com>, Andrew Davis <afd@ti.com>,
        Markus Schneider-Pargmann
	<msp@baylibre.com>,
        Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>
Subject: Re: [PATCH v7 06/11] arm64: dts: ti: k3-am62a7-sk: Enable IPC with
 remote processors
Message-ID: <20250421162645.gkgthbl6t2xemnbz@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250415153147.1844076-1-jm@ti.com>
 <20250415153147.1844076-7-jm@ti.com>
 <20250419150451.v3jgtgp4yisou65u@bryanbrattlof.com>
 <20250421114042.riw2kw472murjzcc@surfer>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250421114042.riw2kw472murjzcc@surfer>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On April 21, 2025 thus sayeth Nishanth Menon:
> On 10:04-20250419, Bryan Brattlof wrote:
> > On April 15, 2025 thus sayeth Judith Mendez:
> > > From: Devarsh Thakkar <devarsht@ti.com>
> > > 
> > > For each remote proc, reserve memory for IPC and bind the mailbox
> > > assignments. Two memory regions are reserved for each remote processor.
> > > The first region of 1MB of memory is used for Vring shared buffers
> > > and the second region is used as external memory to the remote processor
> > > for the resource table and for tracebuffer allocations.
> > > 
> > > Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> > > Signed-off-by: Hari Nagalla <hnagalla@ti.com>
> > > Signed-off-by: Judith Mendez <jm@ti.com>
> > > Acked-by: Andrew Davis <afd@ti.com>
> > > Reviewed-by: Beleswar Padhi <b-padhi@ti.com>
> > > Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > > ---
> > >  arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 96 +++++++++++++++++++++++--
> > >  1 file changed, 90 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> > > index 1c9d95696c839..7d817b447c1d0 100644
> > > --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> > > +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> > > @@ -52,6 +52,42 @@ linux,cma {
> > >  			linux,cma-default;
> > >  		};
> > >  
> > > +		c7x_0_dma_memory_region: c7x-dma-memory@99800000 {
> > > +			compatible = "shared-dma-pool";
> > > +			reg = <0x00 0x99800000 0x00 0x100000>;
> > > +			no-map;
> > > +		};
> > > +
> > > +		c7x_0_memory_region: c7x-memory@99900000 {
> > > +			compatible = "shared-dma-pool";
> > > +			reg = <0x00 0x99900000 0x00 0xf00000>;
> > > +			no-map;
> > > +		};
> > > +
> > 
> > I know this has been a push for our IPC and MCU+ teams for a couple 
> > windows now, though I do want to point out that some AM62A devices 
> > (AM62A12AQMSIAMBRQ1) will not even have a C7x. 
> > 
> > It's relatively easy to cut nodes out that describe the hardware in the 
> > bootloaders, but once we start configuring them to demo something it 
> > becomes impossible to unwind that during boot.
> > 
> > We can clam we only support the superset devices but I just wanted to 
> > make this email so I could point people to it when they inevitably ask 
> > why their parts do not work out of the box with Linux.
> > 
> > Naked-by: Bryan Brattlof <bb@ti.com>
> 
> 
> I am confused. I do not see support for AM62A1 in upstream. We have
> AM62A7-SK in upstream. I am not sure what direction you are suggesting
> here.

All I'm trying to point out is for every part we upstream there are >10 
times the number of parts that for one reason or another will not make 
it to these upstream repositories.

Most of these parts will have trivial changes like having lower CPU 
counts, some will not have a GPU, MCU, PRU, or display, or maybe it's 
just a package change and the thermal zones are different, or it's just 
the speeds the IP can confidently run at, or it could be as simple as 
DDR part changes. Each variant will be mostly the superset device with 
one or two nodes disabled or modified in some way.

For a while now, without configuring the remote cores to demo anything, 
it's been relatively seamless to support these variants in the 
bootloaders by disabling or modifying the nodes that do not exist so 
Linux can at least boot to a shell and provides a great foundation for 
others to start their development

If we want to use these boards to demo a advanced usecases we can do 
that but I worry it will come at the cost of supporting all the part 
variants.

My hope was we could define the board as minimally as possible here so 
we can maximize their flexibility with what timers, mailboxes and memory 
carve-outs each remote processor uses.

~Bryan
