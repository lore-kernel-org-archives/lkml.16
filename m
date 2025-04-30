Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C99248F75;
	Wed, 30 Apr 2025 13:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746019650; cv=none; b=bG+WRoomJzNdDPsMbg35OKDCBlTZLrCuXuG7z4mKIkUx4w+YPSjqr7IZ6r+1/MFR7NniVNswR7ZXQGiF3Hf6FwwhTe2/UWBwbx0fDZyr07UVZaSR7F+lK1OI94IAIJjwQ+cz4q7N9HmDtSxwaYxJI97gBp0o7261wIcPhUlM47Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746019650; c=relaxed/simple;
	bh=Yn79ILWkMhejVZU/NmRTknuHJiU3am0yYKmjKtjhyMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ELDs14Ixmh5re09GneQTbPoJps3fc1jErzKNgwei6z7O/ygO5nWWXu7Z5jesUt6pfem/NGbcvaQr0xaFMk+ffn08vIILsjDjbbopvXi79ZWdi0rVCjzrvh19WeXlWD92e3aeD705rWH5T/eaJVSgcDX4BT5EiRtO1Jknrj0Csrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FjM9kVLc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FjM9kVLc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FDFCC4CEE9;
	Wed, 30 Apr 2025 13:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746019650;
	bh=Yn79ILWkMhejVZU/NmRTknuHJiU3am0yYKmjKtjhyMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FjM9kVLc1KgEXTTKxa4ljsBfos0w3g7vvcQ0tSiDuZuK2s4/oLdusZuYCRieTQ+3N
	 A+FRHX8M0lf1TFd7TzvX8J1CAkM5tUev2yoWChU3sGPjDICFWAh2/fkJ8yFVigUZxj
	 NYBoLiXWJZf0zw/me2ZSp+kMgoH3O1Fjb1ozQ4LXU4Eqh4QiUICwiP71rgYjxtdrdY
	 5cWJsSyuJ9NwHZu2QtI3+PB4EInJth0oP3x4GNlIthd5VOPRBQMNNYRdkjMpS7C8LD
	 KjeapLDglBb2g81eW8rxdOvN15bqWsjISlgQaUjMZ7bcJd5G6yydNPGctWGQ6rGucD
	 /fiiBvqav0Eyw==
Date: Wed, 30 Apr 2025 15:27:22 +0200
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
Message-ID: <aBIlOrqLtbB5e7B/@lpieralisi>
References: <20250424-gicv5-host-v2-0-545edcaf012b@kernel.org>
 <20250424-gicv5-host-v2-21-545edcaf012b@kernel.org>
 <867c31j20i.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <867c31j20i.wl-maz@kernel.org>

On Wed, Apr 30, 2025 at 12:57:01PM +0100, Marc Zyngier wrote:
> On Thu, 24 Apr 2025 11:25:32 +0100,
> Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> > 
> > The GICv5 architecture implements the Interrupt Wire Bridge (IWB) in
> > order to support wired interrupts that cannot be connected directly
> > to an IRS and instead uses the ITS to translate a wire event into
> > an IRQ signal.
> > 
> > An IWB is a special ITS device with its own deviceID; upon probe,
> > an IWB calls into the ITS driver to allocate DT/ITT tables for its
> > events (ie wires).
> > 
> > An IWB is always associated with a single ITS in the system.
> > 
> > An IWB is connected to an ITS and it has its own deviceID for all
> > interrupt wires that it manages; the IWB input wire number is
> > exposed to the ITS as an eventID. This eventID is not programmable
> > and therefore requires special handling in the ITS driver.
> > 
> > Add an IWB driver in order to:
> > 
> > - Probe IWBs in the system and allocate ITS tables
> > - Manage IWB IRQ domains
> > - Handle IWB input wires state (enable/disable)
> > - Add the required IWB IRQchip representation
> > - Handle firmware representation to Linux IRQ translation
> > 
> > Co-developed-by: Sascha Bischoff <sascha.bischoff@arm.com>
> > Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> > Co-developed-by: Timothy Hayes <timothy.hayes@arm.com>
> > Signed-off-by: Timothy Hayes <timothy.hayes@arm.com>
> > Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Marc Zyngier <maz@kernel.org>
> > ---
> >  drivers/irqchip/Makefile         |   2 +-
> >  drivers/irqchip/irq-gic-v5-its.c |  68 ++++++--
> >  drivers/irqchip/irq-gic-v5-iwb.c | 356 +++++++++++++++++++++++++++++++++++++++
> >  drivers/irqchip/irq-gic-v5.c     |   2 +
> >  drivers/irqchip/irq-gic-v5.h     |  28 +++
> >  5 files changed, 437 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
> > index 4280395e3bdff7858102f0b4eaaea1121cace52f..7bfb2369fbe494a64b72308d95ae33de93c6b8c6 100644
> > --- a/drivers/irqchip/Makefile
> > +++ b/drivers/irqchip/Makefile
> > @@ -37,7 +37,7 @@ obj-$(CONFIG_ARM_GIC_V3_ITS)		+= irq-gic-v3-its.o irq-gic-v4.o
> >  obj-$(CONFIG_ARM_GIC_V3_ITS_FSL_MC)	+= irq-gic-v3-its-fsl-mc-msi.o
> >  obj-$(CONFIG_PARTITION_PERCPU)		+= irq-partition-percpu.o
> >  obj-$(CONFIG_ARM_GIC_V5)		+= irq-gic-v5.o irq-gic-v5-irs.o
> > -obj-$(CONFIG_ARM_GIC_V5_ITS)		+= irq-gic-v5-its.o
> > +obj-$(CONFIG_ARM_GIC_V5_ITS)		+= irq-gic-v5-its.o irq-gic-v5-iwb.o
> >  obj-$(CONFIG_HISILICON_IRQ_MBIGEN)	+= irq-mbigen.o
> >  obj-$(CONFIG_ARM_NVIC)			+= irq-nvic.o
> >  obj-$(CONFIG_ARM_VIC)			+= irq-vic.o
> > diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
> > index da349b4709cc5ec8978859237838f039389ca4a1..b5eb4dbfe2296dc6620889eb9291b542cae4aeb6 100644
> > --- a/drivers/irqchip/irq-gic-v5-its.c
> > +++ b/drivers/irqchip/irq-gic-v5-its.c
> > @@ -786,9 +786,8 @@ static struct gicv5_its_dev *gicv5_its_find_device(struct gicv5_its_chip_data *i
> >  	return dev ? dev : ERR_PTR(-ENODEV);
> >  }
> >  
> > -static struct gicv5_its_dev *gicv5_its_alloc_device(
> > -				struct gicv5_its_chip_data *its, int nvec,
> > -				u32 dev_id)
> > +struct gicv5_its_dev *gicv5_its_alloc_device(struct gicv5_its_chip_data *its,
> > +					     int nvec, u32 dev_id, bool is_iwb)
> >  {
> >  	struct gicv5_its_dev *its_dev;
> >  	int ret;
> > @@ -815,6 +814,7 @@ static struct gicv5_its_dev *gicv5_its_alloc_device(
> >  	its_dev->device_id = dev_id;
> >  	its_dev->num_events = nvec;
> >  	its_dev->num_mapped_events = 0;
> > +	its_dev->is_iwb = is_iwb;
> >  
> >  	ret = gicv5_its_device_register(its, its_dev);
> >  	if (ret) {
> > @@ -827,9 +827,11 @@ static struct gicv5_its_dev *gicv5_its_alloc_device(
> >  
> >  	/*
> >  	 * This is the first time we have seen this device. Hence, it is not
> > -	 * shared.
> > +	 * shared, unless it is an IWB that is a shared ITS device by
> > +	 * definition, its eventids are hardcoded and never change - we allocate
> > +	 * it once for all and never free it.
> 
> I'm not convinced the IWB should be treated differently from any other
> device. Its lifetime is not tied to its inputs, so all that's needed
> is to probe it, get a bunch of interrupts, and that's about it.

I need to check again how this works for devices requesting wires
from an IWB if we don't allow ITS device sharing.

> The other thing is that the IWB really is a standalone thing. It
> shouldn't have its fingers in the ITS code, and should only rely on
> the core infrastructure to get its interrupts.
> 
> As much as I dislike it, the MBIGEN actually provides a decent example
> of how this could be structured.

We wrote that code already, I should have posted it. An MBIgen can
programme the eventids it sents to the ITS, an IWB can't. So yes,
I can make an IWB MBIgen like but the ITS code has to know it is
allocating an IRQ for an IWB - one way or another, the eventids
are not programmable.

I will try to post a v3 with the code in it so that I can get flamed
and find a solution to this niggle.

Thanks,
Lorenzo
