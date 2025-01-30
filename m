Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B9D1B21A9
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 15:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738250272; cv=none; b=XHX2slZt9V53nylhaI6R60BcPOvFlUTV8Hjh2/GJXS0vyzP0qdkw9KvUKKqg9ZmIm7O3chTXi2eAtMyc9YszMZW/E0e1gu645ebQ0pWqDymtn49ldRF5t7ia6dla28ccuIuDCqFC3BLr5Uaf+wqqrUNpkZWTAX8QMEeUSJqOD64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738250272; c=relaxed/simple;
	bh=6ylCH7U/vW4/FEZFAhVKrMrMxuLT8/cOjUnllYss+Hw=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MDlntMtk332u3XLAuIwof4f0VTcBYQMkB2N5YMrd2OuEjKlSYVjqrdtPDRLaY4BC0ZPaogWN60+4VsWCyciUUNS+sCAAOm7FmCrDwtNPPrLtv6I5hQ6o0MJsv8TZlmhS5nsxA6vKDgn0AXeKRUObdRXYnU4/45zwTgLkFVheMZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=InBVI5dv; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="InBVI5dv"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50UFHWbE2317888
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Jan 2025 09:17:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738250252;
	bh=EmAzshRQ/eoyUa15a7shiw9xP+4OVwraDsIOrNlYrEc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=InBVI5dvdr+EFtv8wa94f9gAgJNSMaV+krTmaEpGqs+Kdf1s3s1zzbhcGgml8Jpaz
	 iwh7ySbjDRev86GjagsJnUmVCJpGK9i5YBsSGlnk/qpvOQ3aSrgdYlFjY3MuQDDRtl
	 a1LLk02Pje7MiM4bwBgFaTFb/7KY2RJsXO5lLpeo=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50UFHWYQ050333
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 30 Jan 2025 09:17:32 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 30
 Jan 2025 09:17:32 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 30 Jan 2025 09:17:32 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50UFHWxD069097;
	Thu, 30 Jan 2025 09:17:32 -0600
Date: Thu, 30 Jan 2025 09:17:32 -0600
From: Nishanth Menon <nm@ti.com>
To: Andrew Halaney <ajhalaney@gmail.com>
CC: Daniel Schultz <D.Schultz@phytec.de>,
        Andrew Halaney
	<ahalaney@redhat.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>,
        Siddharth Vadapalli <s-vadapalli@ti.com>,
        "vigneshr@ti.com" <vigneshr@ti.com>, "srk@ti.com" <srk@ti.com>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: defconfig: Enable PCI_J721E
Message-ID: <20250130151732.affkcg2w74op3vne@shorty>
References: <20240807-pci-j721e-defconfig-v1-1-b97e5f4564f6@redhat.com>
 <8b700897-1653-49f2-8fba-e5fce13a5447@phytec.de>
 <20250122145822.4ewsmkk6ztbeejzf@slashing>
 <wqravmnyudex3wcwhkbcbanxsqrmplpq5fmyueyaniya2dkqec@axu7nmb2xbbp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <wqravmnyudex3wcwhkbcbanxsqrmplpq5fmyueyaniya2dkqec@axu7nmb2xbbp>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 07:38-20250130, Andrew Halaney wrote:
> On Wed, Jan 22, 2025 at 08:58:22AM -0600, Nishanth Menon wrote:
> > On 14:53-20250122, Daniel Schultz wrote:
> > > can someone please apply this patch? It's actually required by all TI 
> > > AM6 devices with PCIe, e.g. AM64x.
> > > 
> > > - Daniel
> > > 
> > > On 07.08.24 22:15, Andrew Halaney wrote:
> > > > Enable PCI_J721E for usage in both host and endpoint modes.
> > > > This is used by boards such as Texas Instrument's SK-AM69 and
> > > > J784S4XEVM.
> > > >
> > > > Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> > > Tested-By: Daniel Schultz <d.schultz@phytec.de>
> > > > ---
> > > >   arch/arm64/configs/defconfig | 2 ++
> > > >   1 file changed, 2 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > > > index 01dd286ba7ef0..e5222dbedd387 100644
> > > > --- a/arch/arm64/configs/defconfig
> > > > +++ b/arch/arm64/configs/defconfig
> > > > @@ -225,6 +225,8 @@ CONFIG_PCIE_RCAR_HOST=y
> > > >   CONFIG_PCIE_RCAR_EP=y
> > > >   CONFIG_PCIE_ROCKCHIP_HOST=m
> > > >   CONFIG_PCI_XGENE=y
> > > > +CONFIG_PCI_J721E_HOST=y
> > > > +CONFIG_PCI_J721E_EP=y
> > > >   CONFIG_PCI_IMX6_HOST=y
> > > >   CONFIG_PCI_LAYERSCAPE=y
> > > >   CONFIG_PCI_HISI=y
> > 
> > please make them as modules. no point in growing the default Image file.
> > 
> 
> The PCI_J721E_HOST config only supports builtin, which I think has
> something to do with [0] (but I only re-skimmed that this morning
> briefly). I don't have the hardware any more, so I can't test what goes
> on if you make it a module etc unfortunately.
> 
> [0] https://lore.kernel.org/all/86o73j3vea.wl-maz@kernel.org/

https://lore.kernel.org/all/20230817120823.1158766-1-a-verma1@ti.com/
needs to be refreshed. With that we can go ahead and enable PCIE as
module. I have requested TI teams to get it back on radar.

To give a context on why: Overall, we are pushing as a armv8 community
to lower the size of Image and move the drivers to modules overall -
this is to facilitate other platforms and armv9 architectures to also
be enabled in out default defconfig.

https://lore.kernel.org/linux-arm-kernel/20240821110054.35u5ubgaogzjv6c4@rover/
was a discussion on the topic previously. my stance that I articulated
in the thread has been: if not mmc/NFS needs, please convert the driver
to be capable of modules and request to enable it.

However, I want to be able to move to initramfs default with all drivers
(8250, tisci, ....) also as modules.. Upstream poky builds of
genericarm64 is trying to get there.. but there are few more drivers to
finish the conversion before we flip the in upstream defconfig towards
initramfs. I did give a headsup on #linux-ti IRC that this change is
incoming, to allow folks to be prepared for it.. hopefully we get there
in the next 1-2 windows.

So, stuff like PCIe, I cannot accept as built-in :(

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
