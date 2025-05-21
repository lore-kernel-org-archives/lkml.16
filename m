Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0311620FA97
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 15:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747841390; cv=none; b=FJvsMvcRiCjH+7GbdFT8B1uehzeNrwpEwN36+Eb/w1ncsLVWxP4MBooBQ00/z1NUkIPu/w83ySs/CXns3sMcUmRUMOyZgoHkKxoLFKKD0f1D46VaGVafgkhD+wLacw/Fr9PRVnpVRR81HRUQD2uuZahNeR+C0iiEToFTLWr2FPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747841390; c=relaxed/simple;
	bh=HL9EzZa1dzD8DKRZvyO9uObUEZsbxJbHSlkR7zC3wzE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bjQ+bSpk4ek8TFGc9psXzJRB9+PToUI5ZZa3B746YelDtAS4DvnfgUY8ljPr1N7FqB4TWQhYG4GMdPcTJ5XBFPhSvp3P4+RN0OnM6VYZK6v8kn2hAEISpBmpVLNxy6yxZAZhuEnYVsD92UYSBaFW+6BGJmXS8Gd7N7J4CLvGpLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=s0+xod5B; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=XM6s92RS; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="s0+xod5B";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="XM6s92RS"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747841387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kKkEtmr9JckLML+vUD08UD8mMuu6nxdoJSVQGs1RUd0=;
	b=s0+xod5BLYW9KulcM7O1W5Q4BLROjJ0Aifqi0li7nIS2Amxd1jevf3NuYpUO3U+Mb9/pai
	I+c9EM6RvaBi3bB2RsgiUYHCzKS+/qD+NIN8bUkFGD4xHswuWnNrRcnlthrRYLiQ/H427Z
	GW28bTu2Bs0u03ZvnJ0V5OxqXGeuvP3HDTtad+TSTsYfljrLkvK+1Th1fcW/MbkyHDW5mp
	8wA9rp3wIRSHt9KnVo+whICGHt6GgQfDsW5dzj0nmgSGRudxtsw7BiIBKKzVgb5ompAjQT
	nJj4TZxenfUAhBEHkN6QT+uCM9fIC6oxmMqBM1FKEN1CcOPfwjcthlrT+QUcAA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747841387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kKkEtmr9JckLML+vUD08UD8mMuu6nxdoJSVQGs1RUd0=;
	b=XM6s92RSv+OzRcXi2rKVpG+yt2spUH9M8C9J5k4ut7nZiOSv17i1tRfi0Bre5xt2bldf3A
	y7K0nTrwXwhafxBA==
To: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Sascha Bischoff
 <sascha.bischoff@arm.com>, Timothy Hayes <timothy.hayes@arm.com>
Subject: Re: [PATCH v2 5/5] irqchip/gic-v3-its: Use allocation size from the
 prepare call
In-Reply-To: <86v7pwekum.wl-maz@kernel.org>
References: <20250513163144.2215824-1-maz@kernel.org>
 <20250513163144.2215824-6-maz@kernel.org> <8734d1iwcp.ffs@tglx>
 <86wmacewjr.wl-maz@kernel.org> <87zff8hk1x.ffs@tglx>
 <86v7pwekum.wl-maz@kernel.org>
Date: Wed, 21 May 2025 17:29:46 +0200
Message-ID: <871psirnh1.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, May 19 2025 at 15:28, Marc Zyngier wrote:
> On Mon, 19 May 2025 13:16:58 +0100,
> Thomas Gleixner <tglx@linutronix.de> wrote:
>> > Maybe. It is rather unclear to me what this "dynamic allocation"
>> > actually provides in terms of guarantees to the endpoint driver.
>> 
>> It allows the driver to avoid allocating a gazillion of interrupts
>> upfront during initialization. Instead it can allocate them on demand,
>> when e.g. a queue is initialized. Of course that means that such an
>> allocation can fail, but so can request_irq() and other things. I'm not
>> sure what you mean with guarantees here.
>
> What is the endpoint driver allowed to expect in terms of continuity
> of allocation in the IRQ space? If this is solely limited to MSI-X,
> then the answer probably is "none whatsoever", and the driver should
> only manage the MSI descriptor index.
>
> Can any other MSI-like mechanism end-up with multiple allocations and
> require extra alignment/contiguity guarantees in the hwirq space, more
> or less similar to what MultiMSI requires? Because that'd be much
> harder to provide.

It's only relevant to MSI-X today. That's the only facility, which
actually provides an interface _if_ the underlying parent supports it.

static const struct msi_domain_template pci_msix_template = {
       ....
	.info = {
		.flags			= MSI_COMMON_FLAGS | MSI_FLAG_PCI_MSIX |
					  MSI_FLAG_PCI_MSIX_ALLOC_DYN,
		.bus_token		= DOMAIN_BUS_PCI_DEVICE_MSIX,
	},
};

That's the device domain template, which requests the functionality and
the core then checks whether the parent domain supports it. If so the
functionality is enabled.

Thanks,

        tglx
