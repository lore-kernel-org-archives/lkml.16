Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD211C6FF5;
	Wed,  7 May 2025 10:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746612096; cv=none; b=AQvO1KNH8GCrM1cd67pzYNGB13ZNsHTHkOrJUIsZ5Ltz6LKSDZahLz5I1+soNzzAL021zrbNoWG6fwz+wDaRfnkTkG6cDP+usKUIDDsu0s9wQdrbn00gNAm5KuiKf81mtvCo6LjHBtMZWnXC20ueJ/une43YQyQeCqYY4yOogf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746612096; c=relaxed/simple;
	bh=mGf1AsLPf5v5y8NvTo2qOGgB267TYsDCzDgn89qfu7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QbLcVNwpShPdR2tF49xAICJU/Me6PgjsDUjjEJgYngtEn+eEid/8A8ldN3BOhjz4+OHd8/VGT8rfjG6x6ZTXgZL6NTNS+D6mSZGI9VhZ36CybuAS6l2TA7UtN5FXAWD40OBIwgwEAAU81yiZB5e+rWpNqZQuTmQiKiXb8rrsclI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ItXBZxzL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ItXBZxzL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C6ADC4CEEE;
	Wed,  7 May 2025 10:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746612095;
	bh=mGf1AsLPf5v5y8NvTo2qOGgB267TYsDCzDgn89qfu7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ItXBZxzLez3WffVEhLRjWkb0m1A7x4XxacKIgzrvtNvY5q3euBOrXn+CDEm5vW6Zt
	 rpw0Wf7x5Eb6++2SG/3J8w/3NiaHLUIuR0vBjUx7NyJ0ABD8Pek+EGk9BqJheoHBLd
	 FeBZCGP7cYpLFmZB77J7TVaCJPooT5PfUYRaWZ8JNp+5g8AdTtCupCgh0FftyeMjrQ
	 DhgCKhflKdb0nqC8AyPQ5DUE6CgCWvoroD5nBZSoRjARQ85KCyauh7tpt4/RSJaCYr
	 P/D7XabeNq/owsOqZnDK3HaOJK/7UNC6R5+Q44EwDFwvKcxOOElu3feCg1vOiS2Mhi
	 Nf6eyEvSg99tw==
Date: Wed, 7 May 2025 12:01:28 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 00/25] Arm GICv5: Host driver implementation
Message-ID: <aBsveM5PqbZ9Jq4f@lpieralisi>
References: <20250506-gicv5-host-v3-0-6edd5a92fd09@kernel.org>
 <86frhhhm18.wl-maz@kernel.org>
 <aBsRvOzse7z39dkh@lpieralisi>
 <86bjs4hjmv.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86bjs4hjmv.wl-maz@kernel.org>

On Wed, May 07, 2025 at 10:09:44AM +0100, Marc Zyngier wrote:
> On Wed, 07 May 2025 08:54:36 +0100,
> Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> > 
> > On Tue, May 06, 2025 at 03:05:39PM +0100, Marc Zyngier wrote:
> > > On Tue, 06 May 2025 13:23:29 +0100,
> > > Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> > > > 
> > > > =============
> > > > 2.5 GICv5 IWB
> > > > =============
> > > > 
> > > > The IWB driver has been dropped owing to issues encountered with
> > > > core code DOMAIN_BUS_WIRED_TO_MSI bus token handling:
> > > > 
> > > > https://lore.kernel.org/lkml/87tt6310hu.wl-maz@kernel.org/
> > > 
> > > This problem does not have much to do with DOMAIN_BUS_WIRED_TO_MSI.
> > > 
> > > The issues are that:
> > > 
> > > - the core code calls into the .prepare domain on a per-interrupt
> > >   basis instead of on a per *device* basis. This is a complete
> > >   violation of the MSI API, because .prepare is when you are supposed
> > >   to perform resource reservation (in the GICv3 parlance, that's ITT
> > >   allocation + MAPD command).
> > > 
> > > - the same function calls .prepare for a *single* interrupt,
> > >   effectively telling the irqchip "my device has only one interrupt".
> > >   Because I'm super generous (and don't like wasting precious bytes),
> > >   I allocate 32 LPIs at the minimum. Only snag is that I could do with
> > >   300+ interrupts, and calling repeatedly doesn't help at all, since
> > >   we cannot *grow* an ITT.
> > 
> > On the IWB driver code that I could not post I noticed that it is
> > true that the .prepare callback is called on a per-interrupt basis
> > but the vector size is the domain size (ie number of wires) which
> > is correct AFAICS, so the ITT size should be fine I don't get why
> > it would need to grow.
> 
> Look again. The only reason you are getting something that *looks*
> correct is that its_pmsi_prepare() has this nugget:
> 
> 	/* Allocate at least 32 MSIs, and always as a power of 2 */
> 	nvec = max_t(int, 32, roundup_pow_of_two(nvec));
> 
> and that the IWB is, conveniently, in sets of 32. However, the caller
> of this function (__msi_domain_alloc_irqs()) passes a  nvec value that
> is always exactly *1* when allocating an interrupt.

nvec is one but this does not work for the reason above, it works
because of AFAICS (for the IWB set-up I have):

	msi_info = msi_get_domain_info(domain);
	if (msi_info->hwsize > nvec)
		nvec = msi_info->hwsize;

> 
> So you're just lucky that I picked a minimum ITT size that matches the
> IWB on your model.

Not really, we test with wires above 32, we end up calling .prepare()
with the precise number of wires, don't know why that does not work for
the MBIgen (possibly because the interrupt-controller platform devices
are children of the "main" MBIgen platform device ? The IWB one is created
by OF code, MBIgen has to create children, maybe that's what is
going wrong with the device/domain hierarchy ?).

> Configure your IWB to be, let's say, 256 interrupts and use the last
> one, and you'll have a very different behaviour.

See above.

> > The difference with this series is that on v3 LPIs are allocated
> > on .prepare(), we allocate them on .alloc().
> 
> Absolutely not. Even on v3, we never allocate LPIs in .prepare(). We
> allocate the ITT, perform the MAPD, and that's it. That's why it's
> called *prepare*.

I supposed that's what its_lpi_alloc() does in its_create_device() but
OK, won't mention that any further.

> > So yes, calling .prepare on a per-interrupt basis looks like a bug
> > but if we allow reusing a deviceID (ie the "shared" thingy) it could
> > be harmless.
> 
> Harmless? No. It is really *bad*. It means you lose any sort of sane
> tracking of what owns the ITT and how you can free things. Seeing a
> devid twice is the admission that we have no idea of what is going on.
> 
> GICv3 is already in that sorry state, but I am hopeful that GICv5 can
> be a bit less crap.

Well, GICv5 will have to cope with designs, hopefully deviceIDs sharing
is a thing of the past I am not eulogizing the concept :)

> > > So this code needs to be taken to the backyard and beaten into shape
> > > before we can make use of it. My D05 (with its collection of MBIGENs)
> > > only works by accident at the moment, as I found out yesterday, and
> > > GICv5 IWB is in the same boat, since it reuses the msi-parent thing,
> > > and therefore the same heuristic.
> > > 
> > > I guess not having the IWB immediately isn't too big a deal, but I
> > > really didn't expect to find this...
> > 
> > To be honest, it was expected. We found these snags while designing
> > the code (that explains how IWB was structured in v1 - by the way)
> > but we didn't know if the behaviour above was by construction, we
> > always thought "we must be making a mistake".
> 
> Then why didn't you report it? We could have caught this very early
> on, before the fscked-up code was in a stable release...

We spotted it late March - planned to discuss the IWB design while
reviewing v5.

Thanks,
Lorenzo
