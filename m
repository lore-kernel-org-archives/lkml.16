Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F0A21421E;
	Mon, 21 Apr 2025 21:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745272172; cv=none; b=hEsic8Ayoii5V23TG2VVCBucyDjt5oTJf+pFeOnCV0bCOivXtwVLnmjL9C1JHWeNg9TRoW6uLAcgSVXyh3qlvurBkgZXh1FwQRf/Lye7fjV5e9fZIRX/QQtXe2Zt104SvsD8dTAE51CWYsSTYrvDHbLPvHLXue9BxHNFGwjMgO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745272172; c=relaxed/simple;
	bh=wNe+4eVWaZ3z5oTjAuJ2rhomULtbBLZ3Tw06HaMc350=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EBomYT6nNXD9JmVrHsgLtx5y22XYTUkEOBwGT/Z88+1KfZUm4oIbl8ZNnu/koSUxNuMMQFD1omi8Sc/VdFLtIdgc2Q7H1gAmijIe5xz5k7enHF+HW0ajgX29rjGy/TVjXhxjfxD6IQOd12LDS7KU6asjLEIDsKuc2UDwurLOZFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=EmkcAMYQ; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="EmkcAMYQ"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53LLnOwm1750060
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 16:49:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745272164;
	bh=4R5lIrEITgRelBgyvvkhiMtiiZDusJzmv1k212Y6hlA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=EmkcAMYQIhCdlYJdDd8/cRhHV3x7ntswzFYils6/rJuz7+iRWHf7LIYYLxuB7tPJm
	 fG7ZHDPuewyNs3yiEdv1lUbpGht3zGxdsLFfZSZ23W8sgKPryEZBd8EU8No+3kJTOl
	 aK6tVB01+7kO6/dvyxlLPYI5ikTON3lnjTJufPQg=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53LLnOvX001704
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Apr 2025 16:49:24 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Apr 2025 16:49:24 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Apr 2025 16:49:24 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53LLnOCj040900;
	Mon, 21 Apr 2025 16:49:24 -0500
Date: Mon, 21 Apr 2025 16:49:24 -0500
From: Bryan Brattlof <bb@ti.com>
To: Andrew Davis <afd@ti.com>
CC: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Hari Nagalla
	<hnagalla@ti.com>,
        Beleswar Prasad <b-padhi@ti.com>,
        Markus
 Schneider-Pargmann <msp@baylibre.com>,
        Devarsh Thakkar <devarsht@ti.com>
Subject: Re: [PATCH v7 06/11] arm64: dts: ti: k3-am62a7-sk: Enable IPC with
 remote processors
Message-ID: <20250421214924.a52pakut7nzrbufc@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250415153147.1844076-1-jm@ti.com>
 <20250415153147.1844076-7-jm@ti.com>
 <20250419150451.v3jgtgp4yisou65u@bryanbrattlof.com>
 <20250421114042.riw2kw472murjzcc@surfer>
 <20250421162645.gkgthbl6t2xemnbz@bryanbrattlof.com>
 <54cbad41-3508-4ffa-99f5-df5618a8fd4c@ti.com>
 <3f95eb2c-d9ea-4acd-a57f-3ffdd43fd505@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3f95eb2c-d9ea-4acd-a57f-3ffdd43fd505@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On April 21, 2025 thus sayeth Andrew Davis:
> On 4/21/25 2:05 PM, Judith Mendez wrote:
> > Hi Bryan,
> > 
> > On 4/21/25 11:26 AM, Bryan Brattlof wrote:
> > > On April 21, 2025 thus sayeth Nishanth Menon:
> > > > On 10:04-20250419, Bryan Brattlof wrote:
> > > > > On April 15, 2025 thus sayeth Judith Mendez:
> > > > > > From: Devarsh Thakkar <devarsht@ti.com>
> > > > > > 
> > > > > > For each remote proc, reserve memory for IPC and bind the mailbox
> > > > > > assignments. Two memory regions are reserved for each remote processor.
> > > > > > The first region of 1MB of memory is used for Vring shared buffers
> > > > > > and the second region is used as external memory to the remote processor
> > > > > > for the resource table and for tracebuffer allocations.
> > > > > > 
> > > > > > Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> > > > > > Signed-off-by: Hari Nagalla <hnagalla@ti.com>
> > > > > > Signed-off-by: Judith Mendez <jm@ti.com>
> > > > > > Acked-by: Andrew Davis <afd@ti.com>
> > > > > > Reviewed-by: Beleswar Padhi <b-padhi@ti.com>
> > > > > > Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > > > > > ---
> > > > > >   arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 96 +++++++++++++++++++++++--
> > > > > >   1 file changed, 90 insertions(+), 6 deletions(-)
> > > > > > 
> > > > > > diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> > > > > > index 1c9d95696c839..7d817b447c1d0 100644
> > > > > > --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> > > > > > +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> > > > > > @@ -52,6 +52,42 @@ linux,cma {
> > > > > >               linux,cma-default;
> > > > > >           };
> > > > > > +        c7x_0_dma_memory_region: c7x-dma-memory@99800000 {
> > > > > > +            compatible = "shared-dma-pool";
> > > > > > +            reg = <0x00 0x99800000 0x00 0x100000>;
> > > > > > +            no-map;
> > > > > > +        };
> > > > > > +
> > > > > > +        c7x_0_memory_region: c7x-memory@99900000 {
> > > > > > +            compatible = "shared-dma-pool";
> > > > > > +            reg = <0x00 0x99900000 0x00 0xf00000>;
> > > > > > +            no-map;
> > > > > > +        };
> > > > > > +
> > > > > 
> > > > > I know this has been a push for our IPC and MCU+ teams for a couple
> > > > > windows now, though I do want to point out that some AM62A devices
> > > > > (AM62A12AQMSIAMBRQ1) will not even have a C7x.
> > > > > 
> > > > > It's relatively easy to cut nodes out that describe the hardware in the
> > > > > bootloaders, but once we start configuring them to demo something it
> > > > > becomes impossible to unwind that during boot.
> > > > > 
> > > > > We can clam we only support the superset devices but I just wanted to
> > > > > make this email so I could point people to it when they inevitably ask
> > > > > why their parts do not work out of the box with Linux.
> > > > > 
> > > > > Naked-by: Bryan Brattlof <bb@ti.com>
> > > > 
> > > > 
> > > > I am confused. I do not see support for AM62A1 in upstream. We have
> > > > AM62A7-SK in upstream. I am not sure what direction you are suggesting
> > > > here.
> > > 
> > > All I'm trying to point out is for every part we upstream there are >10
> > > times the number of parts that for one reason or another will not make
> > > it to these upstream repositories.
> > > 
> > > Most of these parts will have trivial changes like having lower CPU
> > > counts, some will not have a GPU, MCU, PRU, or display, or maybe it's
> > > just a package change and the thermal zones are different, or it's just
> > > the speeds the IP can confidently run at, or it could be as simple as
> > > DDR part changes. Each variant will be mostly the superset device with
> > > one or two nodes disabled or modified in some way.
> > > 
> > > For a while now, without configuring the remote cores to demo anything,
> > > it's been relatively seamless to support these variants in the
> > > bootloaders by disabling or modifying the nodes that do not exist so
> > > Linux can at least boot to a shell and provides a great foundation for
> > > others to start their development
> > > 
> > > If we want to use these boards to demo a advanced usecases we can do
> > > that but I worry it will come at the cost of supporting all the part
> > > variants.
> > > 
> > > My hope was we could define the board as minimally as possible here so
> > > we can maximize their flexibility with what timers, mailboxes and memory
> > > carve-outs each remote processor uses.
> > > 
> > 
> > Is it not agreed upon to support the superset device upstream? It seems
> > like what we need is a detailed whitepaper on board bring-up for each
> > part variant instead of NOT adding support for the superset device
> > upstream approach.
> > 
> 
> We would still support the superset device upstream, Bryan is simply
> suggesting (correct me if I'm wrong) a different way of supporting
> the superset device such that later adding support for the cutdowns
> is less painful.
> 
> To this I 100% agree, and I've suggested the same before in
> cases where we know a subset device is in the works. Sometimes
> plans for a cutdown happen after we have added support and that
> makes a bit of a mess (see J78424 / J742s2). Even when we know
> this is going to happen we still make a mess of DT which we end
> up having to clean up later (see AM62p / J722s).
> 

Exactly. We will typically have the AM62A7 superset plan well in advance 
then as the platform ages we start defining cutdowns that may or may not 
function depending on the behavior of the drivers which creates the 
weird DT layout and even worse some fraction of the subset devices that 
may or may not boot and no indication if it even should.

Separating the core description of the hardware, so Zephyr, U-Boot, 
Coreboot, Barebox and whoever else can use and modify it, from the 
allocation/configuration of the hardware while Linux is running is the 
only way (in my eyes) this can possibly scale.

>
> Easy manipulation of the DT in this way was one of the promises
> of "System Device Trees". Until we have that, the next best thing
> is DT overlays. The solution here then is to factor out the components
> we know will be conditional into a device tree overlays. These
> overlays will be applied by default to form the superset DT as the
> out-of-box supported device, while also allowing easy removal without
> having the bootloader perform complex DT surgery. Win-Win
> 
> The plan we agreed on for this series (back in v2 IIRC) is to add
> these items as part of the base board DT to match what is already
> done for all our other devices. *then* we factor it out from all
> devices in one go to make that series more coherent.
> 
> So if that sounds good, Bryan feel free to un-NAK this and we
> we will be sure to make your task of supporting all these subset
> devices much easier in the follow up series :)

I can get behind that plan but I do still worry about how this scales. 
Many distributions are starting to look at UKIs as the solution to the 
exploding number of DTBs. Adding overlays will just add plutonium to 
this compressed DTB blob best-fit walk.

Un-Naked-by: Bryan Brattlof <bb@ti.com>

~Bryan
