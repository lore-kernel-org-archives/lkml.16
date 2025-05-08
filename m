Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9304C2153CE;
	Thu,  8 May 2025 10:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746701094; cv=none; b=PKRwE/ZOftllo9G92YO5ftdU9O/jzKg3k79dEx+Dl4f4XTO5zeLue+cqkWF+31fIthSKdIgi2pG7v8YR6L165JbgRF0qlUst70rBZa0vdSTJvkvlRg6sa+0t+FXpbSL9gMzbqUKRfOpyMvcbMXPu2HWaOIO8lfAWHxuDgH8LXIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746701094; c=relaxed/simple;
	bh=xqnW9kopq8l64iCs7XUKDphBW5xsrquQhMRe7SGLz5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fE/0ePiS5/BHorft23gIQZ54iELlSaxiDg1J4ewe0TXbMIiOj8Q0iX+3obyq64rIvrFA9X8zb86Ecu4usMQCC8lrQ2Y14TEjPQNipvqZ644vjq1n3FehkH8ljUdzntWjIh58Uy4oRjz2p20ODf7pi/tCj/p2mLEpRoUXpSy4BiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lWJmVqVj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lWJmVqVj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3043C4CEE7;
	Thu,  8 May 2025 10:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746701094;
	bh=xqnW9kopq8l64iCs7XUKDphBW5xsrquQhMRe7SGLz5E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lWJmVqVjUrPhFLOrmOrc8VrQDhLMQb1iYqhL9i4oEafgAhAvl/TqYIXHy3Ufs9UBJ
	 xeiq9bCza5XLv4OV8VeSS5XZT84c7tpc8G6sjbaA/vipFOsT7FmLU4aoP2wdBbQXpC
	 yt4XbnmbN0lIavQMNQQUKrLQE/Hyh3SxrRShDR0uWIMcXh3wdiKMC38xIgtYG3qpmu
	 lcWWbhY2GdZuGSkXJ6E80ecvj+sD/Bqu1OZGdzIp/6n5Y3mQnbxo/7W3Dc/1dDzdTt
	 2JXOUM3wqyOVSyrZP2pVpD3hZjyvD97cIYXiu6E/i8imGyuSvvt3JCj6aZJYsQnrsG
	 XByNzTryEvqMw==
Date: Thu, 8 May 2025 12:44:45 +0200
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
Subject: Re: [PATCH v3 20/25] irqchip/gic-v5: Add GICv5 PPI support
Message-ID: <aByLHdktOLUk8HCN@lpieralisi>
References: <20250506-gicv5-host-v3-0-6edd5a92fd09@kernel.org>
 <20250506-gicv5-host-v3-20-6edd5a92fd09@kernel.org>
 <87zffpn5rk.ffs@tglx>
 <86a57ohjey.wl-maz@kernel.org>
 <87ecx0mt9p.ffs@tglx>
 <867c2sh6jx.wl-maz@kernel.org>
 <874ixwmpto.ffs@tglx>
 <aBxgceQBRA6vBK7o@lpieralisi>
 <864ixvh4ss.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <864ixvh4ss.wl-maz@kernel.org>

On Thu, May 08, 2025 at 09:42:27AM +0100, Marc Zyngier wrote:
> On Thu, 08 May 2025 08:42:41 +0100,
> Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> > 
> > On Wed, May 07, 2025 at 04:57:07PM +0200, Thomas Gleixner wrote:
> > > On Wed, May 07 2025 at 14:52, Marc Zyngier wrote:
> > > > On Wed, 07 May 2025 14:42:42 +0100,
> > > > Thomas Gleixner <tglx@linutronix.de> wrote:
> > > >> 
> > > >> On Wed, May 07 2025 at 10:14, Marc Zyngier wrote:
> > > >> > On Tue, 06 May 2025 16:00:31 +0100,
> > > >> > Thomas Gleixner <tglx@linutronix.de> wrote:
> > > >> >> 
> > > >> >> How does this test distinguish between LEVEL_LOW and LEVEL_HIGH? It only
> > > >> >> tests for level, no? So the test is interesting at best ...
> > > >> >
> > > >> > There is no distinction between HIGH and LOW, RISING and FALLING, in
> > > >> > any revision of the GIC architecture.
> > > >> 
> > > >> Then pretending that there is a set_type() functionality is pretty daft
> > > >
> > > > You still need to distinguish between level and edge when this is
> > > > programmable (which is the case for a subset of the PPIs).
> > > 
> > > Fair enough, but can we please add a comment to this function which
> > > explains this oddity.
> > 
> > Getting back to this, I would need your/Marc's input on this.
> > 
> > I think it is fair to remove the irq_set_type() irqchip callback for
> > GICv5 PPIs because there is nothing to set, as I said handling mode
> > for these IRQs is fixed. I don't think this can cause any trouble
> > (IIUC a value within the IRQF_TRIGGER_MASK should be set on requesting
> > an IRQ to "force" the trigger to be programmed and even then core code
> > would not fail if the irq_set_type() irqchip callback is not
> > implemented).
> > 
> > I am thinking about *existing* drivers that request GICv3 PPIs with
> > values in IRQF_TRIGGER_MASK set (are there any ? Don't think so but you
> > know better than I do), when we switch over to GICv5 we would have no
> > irq_set_type() callback for PPIs but I think we are still fine, not
> > implementing irqchip.irq_set_type() is correct IMO.
> 
> Nobody seems to use a hardcoded trigger (well, there is one exception,
> but that's to paper over a firmware bug).

That's what I get if I remove the PPI irq_set_type() callback (just one
timer, removed others because they add nothing) and enable debug for
kernel/irq/manage.c (+additional printout):

 genirq: No set_type function for IRQ 70 (GICv5-PPI)
  __irq_set_trigger+0x13c/0x180
  __setup_irq+0x3d8/0x7c0
  __request_percpu_irq+0xbc/0x114
  arch_timer_register+0x84/0x140
  arch_timer_of_init+0x180/0x1d0
  timer_probe+0x74/0x124
  time_init+0x18/0x58
  start_kernel+0x198/0x384
  __primary_switched+0x88/0x90

 arch_timer: check_ppi_trigger irq 70 flags 8
 genirq: enable_percpu_irq irq 70 type 8
 genirq: No set_type function for IRQ 70 (GICv5-PPI)
  __irq_set_trigger+0x13c/0x180
  enable_percpu_irq+0x100/0x140
  arch_timer_starting_cpu+0x54/0xb8
  cpuhp_issue_call+0x254/0x3a8
  __cpuhp_setup_state_cpuslocked+0x208/0x2c8
  __cpuhp_setup_state+0x50/0x74
  arch_timer_register+0xc4/0x140
  arch_timer_of_init+0x180/0x1d0
  timer_probe+0x74/0x124
  time_init+0x18/0x58
  start_kernel+0x198/0x384
  __primary_switched+0x88/0x90

I noticed that, if the irq_set_type() function is not implemented,
we don't execute (in __irq_set_trigger()):

irq_settings_set_level(desc);
irqd_set(&desc->irq_data, IRQD_LEVEL);

which in turn means that irqd_is_level_type(&desc->irq_data) is false
for PPIs (ie arch timers, despite being level interrupts).

An immediate side effect is that they show as edge in:

/proc/interrupts

but that's just what I could notice.

Should I set them myself in PPI translate/alloc functions ?

Removing the irq_set_type() for PPIs does not seem so innocuous, it is a
bit complex to check all ramifications, please let me know if you spot
something I have missed.

> > On the other hand, given that on GICv5 PPI handling mode is fixed,
> > do you think that in the ppi_irq_domain_ops.translate() callback,
> > I should check the type the firmware provided and fail the translation
> > if it does not match the HW hardcoded value ?
> 
> Why? The fact that the firmware is wrong doesn't change the hardware
> integration. It just indicates that whoever wrote the firmware didn't
> read the documentation.
> 
> Even more, I wonder what the benefit of having that information in the
> firmware tables if the only thing that matters in the immutable HW
> view. Yes, having it in the DT/ACPI simplifies the job of the kernel
> (only one format to parse). But it is overall useless information.

Yes, that I agree but it would force firmware bindings to special case
PPIs to remove the type (#interrupt-cells and co.).

From what I read I understand I must ignore the PPI type provided by
firmware.

> > Obviously if firmware exposes the wrong type that's a firmware bug
> > but I was wondering whether it is better to fail the firmware-to-Linux
> > IRQ translation if the firmware provided type is wrong rather than carry
> > on pretending that the type is correct (I was abusing the irq_set_type()
> > callback to do just that - namely, check that the type provided by
> > firmware matches HW but I think that's the wrong place to put it).
> 
> I don't think there is anything to do. Worse case, you spit a
> pr_warn_once() and carry on.

Thanks,
Lorenzo
