Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [83.223.78.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929D91B808
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 19:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.78.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750533709; cv=none; b=IK6ZtFToVDhWw1wfBPkTVr1mB9aTVUx3B3xU0iGhGaXR3Wh+4pGqw2y/51s9Up/zec+E1xmwTOEraStkH2ajqVKQLdXEvu25dWMMbAb+N6PJc5IPoc3WEw6UIO6ifHiEGTheynf48ynOrSFJ9nga77CPD22o3cno3wmSrYRq2S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750533709; c=relaxed/simple;
	bh=7YOmcViDMjQUpQfX69bUAC7MW7x0u9ZPwZwJPlmrUP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pgbQi9sT7yW9R3fQUy/R5YF7WqNRPLx+L6O9PuYekwwcHZ48YJrfi2HvhYwFjwUQtS0nvZBDQIcksqHGtOu+XjbN1jx3GFBjZ1xvnWY/ceVHfkSrmcOIQ8+wGgz7cDcgR46c53ogd+hxBvOKI5lFWi0mJ6h7/syk7e5MXHZGnm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=83.223.78.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id D826B2020E5A;
	Sat, 21 Jun 2025 21:21:45 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id C52381EFFA; Sat, 21 Jun 2025 21:21:45 +0200 (CEST)
Date: Sat, 21 Jun 2025 21:21:45 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Ahmed Salem <x0rw3ll@gmail.com>
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [RFC PATCH] amd64-agp: do not bind to pci driver if probing fails
Message-ID: <aFcGSaxeaDphIhUU@wunner.de>
References: <c5kqcudzrcafm24nr5ixgalhxdkxl3uoueerjlp6tbksj3hzy7@klytjugpkvdm>
 <aFZ_YJH30f1WDneD@wunner.de>
 <7rv3j2it6wbv4gu7jgsews3niste5y52h67scwwjpblhy2royh@hqfmpbjzdj77>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7rv3j2it6wbv4gu7jgsews3niste5y52h67scwwjpblhy2royh@hqfmpbjzdj77>

On Sat, Jun 21, 2025 at 07:15:31PM +0300, Ahmed Salem wrote:
> On 25/06/21 11:46AM, Lukas Wunner wrote:
> > On Sat, Jun 21, 2025 at 04:55:52AM +0300, Ahmed Salem wrote:
> > > --- a/drivers/char/agp/amd64-agp.c
> > > +++ b/drivers/char/agp/amd64-agp.c
> > > @@ -768,10 +768,15 @@ int __init agp_amd64_init(void)
> > >  
> > >  		/* Look for any AGP bridge */
> > >  		agp_amd64_pci_driver.id_table = agp_amd64_pci_promisc_table;
> > > -		err = driver_attach(&agp_amd64_pci_driver.driver);
> > > -		if (err == 0 && agp_bridges_found == 0) {
> > > +		if ((int *)agp_amd64_pci_driver.probe != 0) {
> > >  			pci_unregister_driver(&agp_amd64_pci_driver);
> > >  			err = -ENODEV;
> > > +		} else {
> > > +			err = driver_attach(&agp_amd64_pci_driver.driver);
> > > +			if (err == 0 && agp_bridges_found == 0) {
> > > +				pci_unregister_driver(&agp_amd64_pci_driver);
> > > +				err = -ENODEV;
> > > +			}
> > 
> > Is the "probe" member in agp_amd64_pci_driver overwritten with a
> > zero pointer anywhere?  I don't see that it is, so it seems the
> > else-branch is never entered.
> 
> That is a great question. I thought since pci_register_driver calls the
> probe function, it would return with or without a zero, saving that
> value in the .probe member.

You'd have to add parentheses and parameters, i.e.

  agp_amd64_pci_driver.probe(...)

to invoke the probe hook directly.  However, that wouldn't be an
acceptable approach, one needs to go through the API of the
driver core and not do things behind the driver core's back.


> > I had already prepared a fix for this, but waited for 0-day to
> > crunch through it.  I've just submitted it, so that's what I had
> > in mind:
> > 
> > https://lore.kernel.org/r/f8ff40f35a9a5836d1371f60e85c09c5735e3c5e.1750497201.git.lukas@wunner.de/
> 
> That one I've seen even prior to catching this one, and this is
> originally what I had in mind based on what commit 6fd024893911
> ("amd64-agp: Probe unknown AGP devices the right way") removed (i.e.
> !pci_find_capability) when you suggested checking for caps beforehand,
> but I figured "why make other calls when .probe already does it right
> off the bat?"

Right, it is somewhat silly, but this driver is for 20+ year old hardware
which is likely no longer in heavy use, the driver itself isn't actively
maintained anymore and might be dropped in a few years, so this approach
seemed like the least ugly and most acceptable option.

The real crime was to probe *any* PCI device and even make that the
default.  I think vfio_pci is probably the only other driver that
probes *any* PCI device and it does that only if requested by user
space I believe.  We'd risk regressing users if we changed the
"probe everything by default" behavior, so that's not a good option.

Thanks,

Lukas
