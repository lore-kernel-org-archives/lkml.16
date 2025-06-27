Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6203C293C76
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 09:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751017746; cv=none; b=XYPhSLXCH788NWWbbgxfRcRjK2cflPhHGYeeGC+MJ/VYS2OyUOvoUv74okWdQiXqlVZXZm8+N5BkDyHSMN3LnukOj+lyKAhNjipFPqt3kvWQZZMz6eoZzjkEzpOskzHSP2ts88dfngYa3VNvR423BphyGuHc5Sd4XiB9uHsM0yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751017746; c=relaxed/simple;
	bh=cqXn+yrbHLZwwi6rnTeesjrupenkLBrgxPePZVcxmu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rKWM8oOP0Xd3K5OVl2aLtw46j9aIMzgfYJiBv+iAwUASS6bsSAY7eCS70zlf4XfyIgMkhAM3uqB148ShwyChKAAikUaH+AaEWmllhtLxWMGN+a2ROdjANNlmlx9255H7J3vsUYpes0E7x9kXlURDdubVeRwF5G1LFc3cb28uFZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=IRa8OV+i; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3/t7LYlS; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IRa8OV+i";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3/t7LYlS"
Date: Fri, 27 Jun 2025 11:49:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751017743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AMAKGN3DCjxCnMwPzKP2GWHT0WEI2uJUsaP5kWI4Hj4=;
	b=IRa8OV+iToo0MMIWZDoH+ZhERGufvGcISFA7hfSf8TSf0emx6tEh3PsfRIaynIWaUZnLWd
	C9EHU9s+nFaPVbXVwjtLW/HAIz9bj+jotEcEpd715+5IwXrXFY2RbOg1qeDofBkrYGwAhg
	bnRRJcrtDQ2rgp1n2jGHEsuRmZ911iGHRcbF4Y+YyFwz9/7Op89cf/cAFhcGBNupZLr7tn
	FW6y7j4KtoDrQHMl4hWZTHSLkCippUGHCA0G3VgojFjRFtw6+hmHPkVNSgcrijxygryjPq
	f5upp46kmJiUdCW7Nu495P6LLzOCCfPU+85DgQ7dinofVtrjF0x1pZ8YkxwtYA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751017743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AMAKGN3DCjxCnMwPzKP2GWHT0WEI2uJUsaP5kWI4Hj4=;
	b=3/t7LYlSAqK5KoR23AtUxCxXiu36e/JFCJDyoeLH7qokzy7+OrBbAPkL52IvkdAt+ljLg1
	N5F5HTKU+kpyA/Dg==
From: Nam Cao <namcao@linutronix.de>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	linux-um@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] um: virt-pci: Switch to
 msi_create_parent_irq_domain()
Message-ID: <20250627094901.bkxjYmHj@linutronix.de>
References: <cover.1750947651.git.namcao@linutronix.de>
 <b911c2f15c031354850eee277a773832890c3c17.1750947651.git.namcao@linutronix.de>
 <45f44f0298259abf1862b965805307b7c01a279d.camel@sipsolutions.net>
 <20250627084943.nCYOI4Vp@linutronix.de>
 <94de787f4c3ad6fc3a44c50c2a5d5311861ddd6c.camel@sipsolutions.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94de787f4c3ad6fc3a44c50c2a5d5311861ddd6c.camel@sipsolutions.net>

On Fri, Jun 27, 2025 at 11:23:58AM +0200, Johannes Berg wrote:
> On Fri, 2025-06-27 at 10:49 +0200, Nam Cao wrote:
> > 
> > Thanks for testing! The later kernel crash should be fixed with:
> > 
> > diff --git a/arch/um/drivers/virt-pci.c b/arch/um/drivers/virt-pci.c
> > index e51a9357934da..557d93aea00a1 100644
> > --- a/arch/um/drivers/virt-pci.c
> > +++ b/arch/um/drivers/virt-pci.c
> > @@ -407,7 +407,6 @@ static const struct irq_domain_ops um_pci_inner_domain_ops = {
> >  
> >  #define UM_PCI_MSI_FLAGS_REQUIRED (MSI_FLAG_USE_DEF_DOM_OPS		| \
> >  				   MSI_FLAG_USE_DEF_CHIP_OPS		| \
> > -				   MSI_FLAG_PCI_MSI_MASK_PARENT		| \
> >  				   MSI_FLAG_NO_AFFINITY)
> 
> Can confirm that.
> 
> > I have no immediate idea about the lockdep warn, I don't see how the
> > MSI_FLAG_PCI_MSI_MASK_PARENT flag can be related to that. Probably there's
> > another problem, let me stare at it..

My understanding of UM is limited, but I think I get it. We dereference a
NULL pointer and get SIGSEGV. We go into that code path and lockdep yells.

With the NULL pointer deref removed, we won't go into that path, so it
should be good.

> Seems to go away as well, perhaps it's due to taking some wrong path
> with the flag just prior to the crash?
> 
> IOW, works for me with the above change with no crash and no lockdep
> warning either.

I will send v2.

Nam
