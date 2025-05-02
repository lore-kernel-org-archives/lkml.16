Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2152BB13;
	Fri,  2 May 2025 07:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746172791; cv=none; b=KiMnfVU6jbV/La0y347UHzFYEl6y0rH6qsgKCsp8I6m9AVuoQxQausq7FmMPLN7YU7FQ0EZtF6+8Bh2a/+9g4vGIWbGd2qxdJbh/29KN/9yOW5fbAVCzuHDZvnjii+I8djHFsirGiRWwmUOX8h0JGEjCJtff/k1h9v1y7ea5ppU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746172791; c=relaxed/simple;
	bh=8o9Amn6fGEJ3KHJ1jVt9uUt8lYBeTP/kg3QyltEBKcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YqZCnelby/gqECvCKwbcZNhAyppzE9litcucQNnv57tFVC5ZAiklM7Up8hYOLLFwjBUL91OX5VcicayrUc0+7pa5yUkw7VaXfXO0R8JlXnYE+7vMiHpvjihE0tN//MYBAT3ZqOP94bK/mCQ14Z428LnAMbE+nv/zo4xDyAQN4S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ll3oZaWd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ll3oZaWd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B9EDC4CEE4;
	Fri,  2 May 2025 07:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746172791;
	bh=8o9Amn6fGEJ3KHJ1jVt9uUt8lYBeTP/kg3QyltEBKcQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ll3oZaWdgmF4ZQJjH6AgtV6xQ2ag0tthmL9xYR49JLHI2fTa6hxflJno5YYqPwvR3
	 7IqnonCGTkMLblW5s33Y5q22vrVUOoZ5BCMvSzIXJRXJFwmCyHhVb2PlSUhRd1n0te
	 kRPJL/p+7yLXy+rSWOGE+fo9JT38O6AJVxZwd43znOMi9p54O2hlXMU0E/5lYhsHdN
	 cs+5Sw54CPWa5ma6JZGKCaHmqFNMm/fkcB6ZiE5zOvq5MIwBIT2eQW2GH+WWrJecxK
	 XrbCuqpEjuRFQqp+ODyDRhkF5ijgv5FdKjebWOIedxVIrKJi/fD26zkp6v5dhtU2om
	 tT+hpuVroVyHA==
Date: Fri, 2 May 2025 09:59:42 +0200
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
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 21/22] irqchip/gic-v5: Add GICv5 IWB support
Message-ID: <aBR7bk62H3PEUbfi@lpieralisi>
References: <20250424-gicv5-host-v2-0-545edcaf012b@kernel.org>
 <20250424-gicv5-host-v2-21-545edcaf012b@kernel.org>
 <867c31j20i.wl-maz@kernel.org>
 <aBIlOrqLtbB5e7B/@lpieralisi>
 <86y0vgh35t.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86y0vgh35t.wl-maz@kernel.org>

On Thu, May 01, 2025 at 02:27:26PM +0100, Marc Zyngier wrote:
> On Wed, 30 Apr 2025 14:27:22 +0100,
> Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> > 
> > On Wed, Apr 30, 2025 at 12:57:01PM +0100, Marc Zyngier wrote:
> > > On Thu, 24 Apr 2025 11:25:32 +0100,
> > > Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> > > > 
> > > > The GICv5 architecture implements the Interrupt Wire Bridge (IWB) in
> > > > order to support wired interrupts that cannot be connected directly
> > > > to an IRS and instead uses the ITS to translate a wire event into
> > > > an IRQ signal.
> > > > 
> > > > An IWB is a special ITS device with its own deviceID; upon probe,
> > > > an IWB calls into the ITS driver to allocate DT/ITT tables for its
> > > > events (ie wires).
> > > > 
> > > > An IWB is always associated with a single ITS in the system.
> > > > 
> > > > An IWB is connected to an ITS and it has its own deviceID for all
> > > > interrupt wires that it manages; the IWB input wire number is
> > > > exposed to the ITS as an eventID. This eventID is not programmable
> > > > and therefore requires special handling in the ITS driver.
> > > > 
> > > > Add an IWB driver in order to:
> > > > 
> > > > - Probe IWBs in the system and allocate ITS tables
> > > > - Manage IWB IRQ domains
> > > > - Handle IWB input wires state (enable/disable)
> > > > - Add the required IWB IRQchip representation
> > > > - Handle firmware representation to Linux IRQ translation
> > > > 
> > > > Co-developed-by: Sascha Bischoff <sascha.bischoff@arm.com>
> > > > Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> > > > Co-developed-by: Timothy Hayes <timothy.hayes@arm.com>
> > > > Signed-off-by: Timothy Hayes <timothy.hayes@arm.com>
> > > > Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> > > > Cc: Thomas Gleixner <tglx@linutronix.de>
> > > > Cc: Marc Zyngier <maz@kernel.org>
> > > > ---
> > > >  drivers/irqchip/Makefile         |   2 +-
> > > >  drivers/irqchip/irq-gic-v5-its.c |  68 ++++++--
> > > >  drivers/irqchip/irq-gic-v5-iwb.c | 356 +++++++++++++++++++++++++++++++++++++++
> > > >  drivers/irqchip/irq-gic-v5.c     |   2 +
> > > >  drivers/irqchip/irq-gic-v5.h     |  28 +++
> > > >  5 files changed, 437 insertions(+), 19 deletions(-)
> > > > 
> > > > diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
> > > > index 4280395e3bdff7858102f0b4eaaea1121cace52f..7bfb2369fbe494a64b72308d95ae33de93c6b8c6 100644
> > > > --- a/drivers/irqchip/Makefile
> > > > +++ b/drivers/irqchip/Makefile
> > > > @@ -37,7 +37,7 @@ obj-$(CONFIG_ARM_GIC_V3_ITS)		+= irq-gic-v3-its.o irq-gic-v4.o
> > > >  obj-$(CONFIG_ARM_GIC_V3_ITS_FSL_MC)	+= irq-gic-v3-its-fsl-mc-msi.o
> > > >  obj-$(CONFIG_PARTITION_PERCPU)		+= irq-partition-percpu.o
> > > >  obj-$(CONFIG_ARM_GIC_V5)		+= irq-gic-v5.o irq-gic-v5-irs.o
> > > > -obj-$(CONFIG_ARM_GIC_V5_ITS)		+= irq-gic-v5-its.o
> > > > +obj-$(CONFIG_ARM_GIC_V5_ITS)		+= irq-gic-v5-its.o irq-gic-v5-iwb.o
> > > >  obj-$(CONFIG_HISILICON_IRQ_MBIGEN)	+= irq-mbigen.o
> > > >  obj-$(CONFIG_ARM_NVIC)			+= irq-nvic.o
> > > >  obj-$(CONFIG_ARM_VIC)			+= irq-vic.o
> > > > diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
> > > > index da349b4709cc5ec8978859237838f039389ca4a1..b5eb4dbfe2296dc6620889eb9291b542cae4aeb6 100644
> > > > --- a/drivers/irqchip/irq-gic-v5-its.c
> > > > +++ b/drivers/irqchip/irq-gic-v5-its.c
> > > > @@ -786,9 +786,8 @@ static struct gicv5_its_dev *gicv5_its_find_device(struct gicv5_its_chip_data *i
> > > >  	return dev ? dev : ERR_PTR(-ENODEV);
> > > >  }
> > > >  
> > > > -static struct gicv5_its_dev *gicv5_its_alloc_device(
> > > > -				struct gicv5_its_chip_data *its, int nvec,
> > > > -				u32 dev_id)
> > > > +struct gicv5_its_dev *gicv5_its_alloc_device(struct gicv5_its_chip_data *its,
> > > > +					     int nvec, u32 dev_id, bool is_iwb)
> > > >  {
> > > >  	struct gicv5_its_dev *its_dev;
> > > >  	int ret;
> > > > @@ -815,6 +814,7 @@ static struct gicv5_its_dev *gicv5_its_alloc_device(
> > > >  	its_dev->device_id = dev_id;
> > > >  	its_dev->num_events = nvec;
> > > >  	its_dev->num_mapped_events = 0;
> > > > +	its_dev->is_iwb = is_iwb;
> > > >  
> > > >  	ret = gicv5_its_device_register(its, its_dev);
> > > >  	if (ret) {
> > > > @@ -827,9 +827,11 @@ static struct gicv5_its_dev *gicv5_its_alloc_device(
> > > >  
> > > >  	/*
> > > >  	 * This is the first time we have seen this device. Hence, it is not
> > > > -	 * shared.
> > > > +	 * shared, unless it is an IWB that is a shared ITS device by
> > > > +	 * definition, its eventids are hardcoded and never change - we allocate
> > > > +	 * it once for all and never free it.
> > > 
> > > I'm not convinced the IWB should be treated differently from any other
> > > device. Its lifetime is not tied to its inputs, so all that's needed
> > > is to probe it, get a bunch of interrupts, and that's about it.
> > 
> > I need to check again how this works for devices requesting wires
> > from an IWB if we don't allow ITS device sharing.
> 
> There is no sharing. Each IWB has its own devid, and the endpoint
> drivers don't have to know about anything ITS related.

I patched the IWB driver to work like an MBIgen.

It looks like the msi_prepare() ITS callback (ie where the its_device is
allocated) is called everytime an endpoint device driver requests a
wired IRQ through:

gicv5_its_msi_prepare+0x68c/0x6f8
its_pmsi_prepare+0x16c/0x1b8
__msi_domain_alloc_irqs+0x70/0x448
__msi_domain_alloc_irq_at+0xf8/0x194
msi_device_domain_alloc_wired+0x88/0x10c
irq_create_fwspec_mapping+0x3a0/0x4c0
irq_create_of_mapping+0xc0/0xe8
of_irq_get+0xa0/0xe4
platform_get_irq_optional+0x54/0x1c4
platform_get_irq+0x1c/0x50

so it becomes "shared" if multiple IWB wires are requested by endpoint
drivers.

I don't have an MBIgen enabled platform but I don't see how it could
behave differently but it could be that I have stared at this code
path for too long.

> > > The other thing is that the IWB really is a standalone thing. It
> > > shouldn't have its fingers in the ITS code, and should only rely on
> > > the core infrastructure to get its interrupts.
> > > 
> > > As much as I dislike it, the MBIGEN actually provides a decent example
> > > of how this could be structured.
> > 
> > We wrote that code already, I should have posted it. An MBIgen can
> > programme the eventids it sents to the ITS, an IWB can't. So yes,
> > I can make an IWB MBIgen like but the ITS code has to know it is
> > allocating an IRQ for an IWB - one way or another, the eventids
> > are not programmable.
> 
> They are not programmable on the MBIGEN either, despite what the code
> does. Everything on this HW is hardcoded.

I don't understand then how in the GICv3 ITS we can guarantee that the
eventid we "allocate" for a wire matches the one sent on the MBIgen->ITS
bus. AFAICS, the ITS eventid is an offset from the LPI base that is
allocated dynamically.

Let's say an endpoint driver requires wire X. The ITS, in
its_alloc_device_irq() grabs a bit from the lpi_map bitmap that has
nothing to do with X.

I don't get how the two can be made to match unless we do something
like I am going to do with the IWB.

This, unless mbigen_write_msi_msg() does something with the
X<->{msg->data} translation (if that function does nothing it should be
removed because it is really misleading).

I am sorry to drone on about this but we have been raking our brains
over this and I would like to understand how this works once for all.

> > I will try to post a v3 with the code in it so that I can get flamed
> > and find a solution to this niggle.
> 
> Nobody is flaming you, Lorenzo.

Absolutely, that's not what I meant, sorry, I am really really grateful
and honestly very happy about all the help provided.

I was referring to the disgusting OF compatible hack I posted, I really
don't like it (and good news, we don't need it either).

> We're just trying to get to a point where the code is in a good enough
> shape to be merged.

Absolutely, no questions, massive thanks.

Lorenzo
