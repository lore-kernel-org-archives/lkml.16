Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554FE23F40A
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 08:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751273974; cv=none; b=rwwjktYSaOSs0DkB56YrHa4d+LfmJfQuINbgXTp8YekvVKQ/qqKjiinLLvuDLM0+OdYUi0Flw7fJ0K7g76FJEgHTStQEXqizEns5I6I79M4c1LtsbkpU5CQNJacWwledHY6+g2X0QOfLhaeaODPHgjIgzltKJB2IFfCcggL81Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751273974; c=relaxed/simple;
	bh=Skthqz2mGmaVU/SfI6yZ1FxB5gCAJZQrc6MHuNMoGsE=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:MIME-Version:
	 Content-Type; b=rcWw9Smutb3ahho2Ccn1gvURRxtl3fOMK4JW497jv04ePAVuPGqy6U4SOtmQh1HDYSH0JppmuGpbjwPyyjNjefnRx2HbS8W5h5HfZ7pY1A7L0Ft90RVmpngmLXJKsS8j1tW7BheAuo4m0qU2+fV8c7V4d/TNzvQX538SCGVgAZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=U6mqQVC8; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=IFZ8/U9Q; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="U6mqQVC8";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IFZ8/U9Q"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751273970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=tLe7TOXoCAoj8LxI3gDkgpaKkUGcA1IXZjIu7n3dQ8E=;
	b=U6mqQVC8AqElmiW3izk43DYsf8ppZf3bdcjAliMTAw14YQJ+yHJ3YNEsC0D7qiYJBLnKtT
	Bd9I/HNAdZLG/o9bS0KtBOvaD2JoNx4jhPEXvqYJ74GFjIPS2wyx29QjAzSLgo/YFb6zae
	j9iCO9EexEgbBXlZSoWYzuZID6zZY2ET/iNwue0sc8VEQy6YBbDwmK4I0ft85hKLlDzSPY
	RcbiAn8Gf2KDjqPIotFVlDDQkpg3AMv6VmFE/EMLgQcJnWkdx3K/LgoRWazu6j3+Y7Nsaj
	mDnTF1ku4prHRLRvgpDsO3hCX4rA/xPJLENAyoWK1UWQRch2UXA1FVLVLw94fA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751273970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=tLe7TOXoCAoj8LxI3gDkgpaKkUGcA1IXZjIu7n3dQ8E=;
	b=IFZ8/U9QdKHV90tmMrhoqOyp+wCtvZ3NQqRoPgyEFHesJokQaq5wvLU58qJDL9MKCtTS46
	YkTqYymLUgoPSrCA==
To: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] irqchip/msi-lib: Honor the MSI_FLAG_PCI_MSI_MASK_PARENT
 flag
In-Reply-To: <86o6vjelw2.wl-maz@kernel.org>
Date: Mon, 30 Jun 2025 10:59:29 +0200
Message-ID: <87ecv1ob9q.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, May 23 2025 at 10:06, Marc Zyngier wrote:
> On Sat, 17 May 2025 20:59:10 +0100,
> Thomas Gleixner <tglx@linutronix.de> wrote:
>> 
>> On Sat, May 17 2025 at 11:30, Marc Zyngier wrote:
>> > +	/*
>> > +	 * If the parent domain insists on being in charge of masking, obey
>> > +	 * blindly. The default mask/unmask become the shutdown/enable
>> > +	 * callbacks, ensuring that we correctly start/stop the interrupt.
>> > + 	 * We make a point in not using the irq_disable() in order to
>> > +	 * preserve the "lazy disable" behaviour.
>> > +	 */
>> > +	if (info->flags & MSI_FLAG_PCI_MSI_MASK_PARENT) {
>> > +		chip->irq_shutdown	= chip->irq_mask;
>> > +		chip->irq_enable	= chip->irq_unmask;
>> 
>> This is only correct, when the chip does not have dedicated
>> irq_shutdown/enable callbacks.
>
> The chip structure provided by the PCI MSI code doesn't provide such
> callback, meaning that they are unused for the whole hierarchy.

Fair enough, but it still stinks.

>> And I really hate the asymmetry of this.
>
> So do I, but that's how the lazy disable thing currently works. Drop
> the bizarre asymmetry on irq_disable, and we can make this nicely
> symmetric as well.

Well, it's not that bizarre and it has a massive performance win if the
thing does not need to go out to the hardware in some scenarios. Don't
ask about the main use case. Mentioning it is probably considered a
violation of the United Nations Convention Against Torture (UNCAT).

>> > +		chip->irq_mask		= irq_chip_mask_parent;
>> > +		chip->irq_unmask	= irq_chip_unmask_parent;
>> > +	}
>> 
>> I'm still trying to understand, what's the actual problem is you are
>> trying to solve.
>
> I'm trying to remove some overhead from machines that don't need to
> suffer from this nonsense double masking. Specially in VMs when
> masking/unmasking requires *two* extremely costly exits (write +
> synchronising read-back). This change reduces the overhead
> significantly by only masking where it actually matters.
>
>> MSIs are edge type interrupts, so the interrupt handling hotpath usually
>> does not mask at all. The only time masking happens is when it's lazy
>> disabled or during affinity changes, which is not the end of the world.
>
> And that's part of the problem. The lazy disable ends up being way
> more costly than it should when the interrupt fires during the
> "disabled but not quite" phase, and in turn makes the critical section
> delineated by disable_irq()/enable_irq() more expensive.
>
> So while, as you put it, it's "not the end of the world", this seems
> to me like a valuable optimisation.

I understand, but this needs more thoughts. Doing this wholesale for all
potential PCI/MSI parent domains which require MASK_PARTN makes me more
than nervous.

> Another possible improvement would be to teach the PCI code it can
> still rely on masking even when the endpoint is not capable of masking
> individual MSIs.

Well, it relies on that today already if the underlying parent domain is
capable of masking. If not, it hopes that nothing bad happens, which is
the only option we have :(

It get's worse when the device does not support masking _and_ the parent
domain does not provide immutable MSI messages because then the MSI
message write becomes a horrorshow. For illustration see the mess in
arch/x86/kernel/apic/msi.c::msi_set_affinity(), which is a violation of
above mentioned convention as well. Despite the fact that this has been
known for decades, RISC-V went ahead and replicated that trainwreck in
the IMSIC IP block. Oh well....

I sat down and stared at it in the few moments where the heat wave did
not completely shutdown my brain. As usual this ended in a larger
cleanup and overhaul... At the end I went and created a new pair of chip
callbacks and the corresponding logic around it. A preview of the whole
pile is at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irq/msi

Thanks,

        tglx









