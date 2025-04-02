Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4DC20AF87
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 04:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743566844; cv=none; b=dkGNzK0hib64/d2jqfQdvThtf5lmOb3XnRKIHhlE/FaY7OBZspiUSgS45IgYMjMcbRq0Kl9v5gNpEU3QQ2uEs39jC8mYUpOpesBaOhSS6vfisFLhHqEeSBsEhrI4fV2JWwUR8MDkOubNH+X0CdqAS1D+uThB/qigxdBTj9OM2OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743566844; c=relaxed/simple;
	bh=OdPGvTBVKoT/ROHFILBpL3TyVOLveTsdXoRjYYvGBhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JYxdha5au7o0dHmOq1ovV0udzWqCpJDqxnSR+CxWFm6B7r2MLOqQxaqBlHilnSV6GnJc3XKgcEYNDsfUVyDs6sL+FZTZdDpD9Abo5aIA+jwWfJSliHS39K6/QfuyGn/R1sEkumkQdRE1fQSto+/DrRoLxdp6X195lwLiyUrOwV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lZjYA31y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lZjYA31y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D3D3C4CEDD;
	Wed,  2 Apr 2025 04:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743566844;
	bh=OdPGvTBVKoT/ROHFILBpL3TyVOLveTsdXoRjYYvGBhE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lZjYA31yzCM9c0O3eXmmDKXBYvsQH8vpkazoLC14MTIxctEWnjwPkSLGbMTFF5AWc
	 4iWkLcHkSuAJBbFUbXkGiIjDepVTjCZ3f0ZQOriZ3Ln3tYiGOdXYgiAxM6L75/3Bqk
	 edYwmwtNMy4GcoYEoL9A9aHZBU7SpGkDSI7yk3puRReNeJWrmk0Ff6mUeMEVVzoqFt
	 HFawJPHYBp+A6mC5eOr7EqekTbQXUxJ/vJh0Zt4eTAm29CS614Iv8gROH2HIEnYewF
	 Y1pAJVRu/BR7W/CANRxzfnO3zwezgRPeidsOdE41FJeY/SLxS/IscD5ZPwypAd3orB
	 ECVm87SArO5xw==
Date: Wed, 2 Apr 2025 06:07:19 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 11/49] x86/alternatives: Remove the confusing, inaccurate
 & unnecessary 'temp_mm_state_t' abstraction
Message-ID: <Z-y3958dG_giqfjw@gmail.com>
References: <20250328132704.1901674-1-mingo@kernel.org>
 <20250328132704.1901674-12-mingo@kernel.org>
 <20250401143624.GI5880@noisy.programming.kicks-ass.net>
 <Z-w5INj77OkbFDQe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-w5INj77OkbFDQe@gmail.com>


* Ingo Molnar <mingo@kernel.org> wrote:

> 
> * Peter Zijlstra <peterz@infradead.org> wrote:
> 
> > On Fri, Mar 28, 2025 at 02:26:26PM +0100, Ingo Molnar wrote:
> > > So the temp_mm_state_t abstraction used by use_temporary_mm() and
> > > unuse_temporary_mm() is super confusing:
> > 
> > I thing I see what you're saying, but we also still have these patches
> > pending:
> > 
> >   https://lkml.kernel.org/r/20241119162527.952745944@infradead.org
> > 
> > :-(
> 
> Yeah, so I think we should do your queue on top of mine, the
> whole temp_mm_state_t abstraction was rather nonsensical,
> and we shouldn't be iterating confusing code...
> 
> I've ported patches #1 and #3 from your queue on top, see
> attached below - these should be the two that represent 99%
> of the conflicts between these two efforts AFAICS.
> 
> Does that work for you?

To make this an easier decision, I've ported Andy's and your patches on 
top of the x86/alternatives series, into WIP.x86/mm, resolving the 
conflicts, with a few touchups:

  git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.x86/mm

Seems to work fine, after some light testing.

I'll send it out for another round of review if that's fine to you.

Thanks,

	Ingo

==========>

git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.x86/mm

Andy Lutomirski (5):
      x86/events, x86/insn-eval: Remove incorrect current->active_mm references
      x86/mm: Make use/unuse_temporary_mm() non-static
      x86/mm: Allow temporary mms when IRQs are on
      x86/efi: Make efi_enter/leave_mm use the *_temporary_mm() machinery
      x86/mm: Opt in to IRQs-off activate_mm()

Peter Zijlstra (2):
      x86/mm: Add mm argument to unuse_temporary_mm()
      x86/mm: Remove 'mm' argument from unuse_temporary_mm() again

 arch/x86/Kconfig                   |  1 +
 arch/x86/events/core.c             |  9 ++++-
 arch/x86/include/asm/mmu_context.h |  5 ++-
 arch/x86/kernel/alternative.c      | 64 -----------------------------------
 arch/x86/lib/insn-eval.c           | 13 +++++--
 arch/x86/mm/tlb.c                  | 69 ++++++++++++++++++++++++++++++++++++++
 arch/x86/platform/efi/efi_64.c     |  7 ++--
 7 files changed, 94 insertions(+), 74 deletions(-)
