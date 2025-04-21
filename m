Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3FC126BFF;
	Mon, 21 Apr 2025 11:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745235653; cv=none; b=EQmPIt90yz4cK5gkCUCBM4vOzfUIMpbthpkFpstVBn1hkKgv7ZoH2u1yUwJCiG5kVaOOH9VB5TGbXGRbb/CNrPoGGf9UrfjZa8fO66ZrQX7C5cArXOdqf0m3JpgGw3ocXMD1wY2X0ZPrKXaRzRpACu/K8do0QxFEP4pDvKLvVls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745235653; c=relaxed/simple;
	bh=VXSlM78gVVSfw+WCIpCDUFRnxSD9qH9eab8KDWthqfU=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EYtoy7fAcGJjIwaO4ZWJhtTugmPgrU/4UVSY4FMR2ip9FURgOXz5ZLEOESKKyLINlNticKNtMxJwMKxUOdlMUSg2ZTQRl79bIfYEqEHqNF+dyFrUPrxC9u6Xrog39j0mUvisHPz+waDKCbsosKJoBAU24PaKJKua9EUWjpCSj+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=mRUydRqy; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="mRUydRqy"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53LBehE7908920
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 06:40:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745235643;
	bh=fMXw+PmwxrAjfO8VUjrovK3MKKuJexE2bKrL5R7FNS0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=mRUydRqyyHUgvdbVoUJg2XDFi0wiujx68Zz+Zf4uZtfVW8PHWHvBzhAyeE9GptwEs
	 RuhuSb8td0xm9NxguHXLUdJYfp6nQ7TZFR1Noqk2mS+Bai7iFd1zsqBibA6g8XGv17
	 eP74CrNen3NsaAvOQ9aidzkC5TeqrOtHm9GdT4YU=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53LBehK9011764
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Apr 2025 06:40:43 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Apr 2025 06:40:43 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Apr 2025 06:40:43 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53LBegd8110641;
	Mon, 21 Apr 2025 06:40:42 -0500
Date: Mon, 21 Apr 2025 06:40:42 -0500
From: Nishanth Menon <nm@ti.com>
To: Bryan Brattlof <bb@ti.com>
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
Message-ID: <20250421114042.riw2kw472murjzcc@surfer>
References: <20250415153147.1844076-1-jm@ti.com>
 <20250415153147.1844076-7-jm@ti.com>
 <20250419150451.v3jgtgp4yisou65u@bryanbrattlof.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250419150451.v3jgtgp4yisou65u@bryanbrattlof.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 10:04-20250419, Bryan Brattlof wrote:
> On April 15, 2025 thus sayeth Judith Mendez:
> > From: Devarsh Thakkar <devarsht@ti.com>
> > 
> > For each remote proc, reserve memory for IPC and bind the mailbox
> > assignments. Two memory regions are reserved for each remote processor.
> > The first region of 1MB of memory is used for Vring shared buffers
> > and the second region is used as external memory to the remote processor
> > for the resource table and for tracebuffer allocations.
> > 
> > Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> > Signed-off-by: Hari Nagalla <hnagalla@ti.com>
> > Signed-off-by: Judith Mendez <jm@ti.com>
> > Acked-by: Andrew Davis <afd@ti.com>
> > Reviewed-by: Beleswar Padhi <b-padhi@ti.com>
> > Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > ---
> >  arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 96 +++++++++++++++++++++++--
> >  1 file changed, 90 insertions(+), 6 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> > index 1c9d95696c839..7d817b447c1d0 100644
> > --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> > +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> > @@ -52,6 +52,42 @@ linux,cma {
> >  			linux,cma-default;
> >  		};
> >  
> > +		c7x_0_dma_memory_region: c7x-dma-memory@99800000 {
> > +			compatible = "shared-dma-pool";
> > +			reg = <0x00 0x99800000 0x00 0x100000>;
> > +			no-map;
> > +		};
> > +
> > +		c7x_0_memory_region: c7x-memory@99900000 {
> > +			compatible = "shared-dma-pool";
> > +			reg = <0x00 0x99900000 0x00 0xf00000>;
> > +			no-map;
> > +		};
> > +
> 
> I know this has been a push for our IPC and MCU+ teams for a couple 
> windows now, though I do want to point out that some AM62A devices 
> (AM62A12AQMSIAMBRQ1) will not even have a C7x. 
> 
> It's relatively easy to cut nodes out that describe the hardware in the 
> bootloaders, but once we start configuring them to demo something it 
> becomes impossible to unwind that during boot.
> 
> We can clam we only support the superset devices but I just wanted to 
> make this email so I could point people to it when they inevitably ask 
> why their parts do not work out of the box with Linux.
> 
> Naked-by: Bryan Brattlof <bb@ti.com>


I am confused. I do not see support for AM62A1 in upstream. We have
AM62A7-SK in upstream. I am not sure what direction you are suggesting
here.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
