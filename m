Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47A0141987
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 06:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749106074; cv=none; b=kUGsDJd0rBbI6t7v1qIOZK8TAXf01rBhumdVIA12HqqzNh3sW2Kb2WY/nwlKtDK++/T/Fh2lAl3nKFJnFB0N/bhyS+bA10fqKssGbcL0G4rM5dk0MGUyqK6jl4cnph09SIJKOVCmjLoiem3Elq0bsfoJJM95l8qiqC+9nh1wLBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749106074; c=relaxed/simple;
	bh=LphIixm2U6bTC8EwIvMeBprro1C4ApSqd9LbcXniXGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ek/H+A55yWnFU4q8S7kBJHKxFhwBFWYGPtuwMFzgpWYD/f2CQ2NcCgyeJXa/+SbH1y3xK6kPNuTB3oMPjjJE0FcXihoxzw5tutsJjjNisCVKoYnacGmDcn9K9uQcr9HphQomfXU2hJro7x0x/dWa5PmTYD47uEphfHtqHu9Fj1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P3yKLe9f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P3yKLe9f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96FC8C4CEE7;
	Thu,  5 Jun 2025 06:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749106074;
	bh=LphIixm2U6bTC8EwIvMeBprro1C4ApSqd9LbcXniXGg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P3yKLe9f2CWW02MQUZgkLMtuVa//3TWcD/mGeKP+RB9o0wOjfYB4ujOXX792t/rJJ
	 skpC54U7LcXjRrBznKnaDnF3luNPRwmLAqrm8ohnBPltBtU0a+jTZ+qcxInVGryRR/
	 Vr5GA8r953s/M78NPihLhyhVeoLD2dwb3/B4h7yGB5l9BBGjlH09oAnwasNc6wo7+q
	 HnD/hG8Ui0pMBF+sG9ji6DGcGhOwqCVavywqf1ywRibRzK8KSIllwQjVdQACd9OoKk
	 HCQPRebtcVC7q/cZYWkFwenzyUb4qEpF7zZYvEAc7Xg5zSOSCziyCV80Ovl5mw5ChP
	 BEPANb+Eq75Mw==
Date: Thu, 5 Jun 2025 08:47:47 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Em Sharnoff <sharnoff@neon.tech>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-mm@kvack.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
	Oleg Vasilev <oleg@neon.tech>,
	Arthur Petukhovsky <arthur@neon.tech>,
	Stefan Radig <stefan@neon.tech>, Misha Sakhnov <misha@neon.tech>
Subject: Re: [PATCH] x86/mm: Handle alloc failure in phys_*_init()
Message-ID: <aEE9k5XLBWPnHJbu@gmail.com>
References: <9f4c0972-a123-4cc3-89f2-ed3490371e65@neon.tech>
 <aEE6_S2a-1tk1dtI@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEE6_S2a-1tk1dtI@gmail.com>


* Ingo Molnar <mingo@kernel.org> wrote:

> 
> * Em Sharnoff <sharnoff@neon.tech> wrote:
> 
> > tl;dr:
> > 
> > * When setting up page table mappings for physical addresses after boot,
> >   alloc_low_page() uses GFP_ATOMIC, which is allowed to fail.
> > * This isn't currently handled, and results in a null pointer
> >   dereference when it occurs.
> > * This allocation failure can happen during memory hotplug.
> > 
> > To handle failure, change phys_pud_init() and similar functions to
> > return zero if allocation failed (either directly or transitively), and
> > convert that to -ENOMEM in arch_add_memory().
> 
> > +		/*
> > +		 * Bail only after updating pgd/p4d to keep progress from p4d across retries.
> > +		 */
> > +		if (!paddr_last)
> > +			return 0;
> > +
> >  		pgd_changed = true;
> 
> > -	init_memory_mapping(start, start + size, params->pgprot);
> > +	if (!init_memory_mapping(start, start + size, params->pgprot))
> > +		return -ENOMEM;
> 
> I agree that it makes total sense to fix all this (especially since you 
> are actively triggering it), but have you tried also changing it away 
> from GFP_ATOMIC? There's no real reason why it should be GFP_ATOMIC 
> AFAICS, other than some historic inertia that nobody bothered to fix.
> 
> Plus, could you please change the return flow from this zero 
> special-case over to something like ERR_PTR(-ENOMEM) and IS_ERR()?
> 
> *Technically* zero is a valid physical address, although we 
> intentionally never use it in the kernel AFAIK and wouldn't ever put a 
> page table there either. ERR_PTR()/IS_ERR() is much easier on the eyes 
> than the zero special-case.

Small correction: since this is a PTE pointer, this is a kernel virtual 
address, which can never be zero - only physical addresses can be zero 
(but even they aren't in practice.).

My main point wrt. using ERR_PTR()/IS_ERR() instead of 0 remains.

Thanks,

	Ingo
