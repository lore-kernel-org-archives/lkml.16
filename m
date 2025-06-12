Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7147926C39C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 14:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749740351; cv=none; b=WM5jK//1NeBuOa/6C/d5Q5YqgYX+Pnup9Bf5L0jlvptwLvs5wTzbb9Qe21TF66F93IxojvVtzr7FJ7r1A65wtLNQ4STr34e5Ih/LuLa43g3NfCWDXKPkW/+QPSdg/bhpvdj5OA2dOM/GLqJKlehI1TXMU2YJJRBaws1v/wH9m8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749740351; c=relaxed/simple;
	bh=ojBGHXn1vUpJycK6ORdZXXJtOHf8zF7gSm+mZb22HOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RNU2LycxUaCChNO2+CAvynddw53lIOkBSueKiYm4QhUUka6FOZhbpDu05SDLWDQ2KvyML2dBHdHt1JDFOT9ZnXbyO2s/Ub/wpzxAAOSNLppwe8oQxlhfzSJQ4psapI76aTtCHl6y9mE8EKipi7RMTBQbx0xipixg+LnHBSPNGW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ILHIinid; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ILHIinid"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DE08C4CEEA;
	Thu, 12 Jun 2025 14:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749740350;
	bh=ojBGHXn1vUpJycK6ORdZXXJtOHf8zF7gSm+mZb22HOM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ILHIinidwPTFzHnyloqn7k3FKs4AAV6Pd9HoxU5EmEQxYWmeiffMvgFuYpYPe07o2
	 L5EbA02mRawCu3O2f0IVBasaV2TzKq2Yq4Lby50b2M0a/2ai8i4dj8S3excj4cNPIe
	 C2sL+fdCG2Zca5gw476eA2UOK7eF02v1f/WbY7nnhQhubS955sPnjGnJE8UVtalPJw
	 LMYZXGrMDaDPNigF7Mz6ax3tUVHAcKD7IlcKn0ltKRCY2+0oipeRWolygoY1YQaahk
	 hyF9Z6Cx0/r4Ld/PPRwFIULRWUz/dgX7O8w4PurKxTnIDlXqC90YWxN+OyYbBZrn+F
	 7KuWwr+CenVIw==
Date: Thu, 12 Jun 2025 15:59:06 +0100
From: Will Deacon <will@kernel.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64/mm: Ensure lazy_mmu_mode never nests
Message-ID: <20250612145906.GB12912@willie-the-truck>
References: <20250606135654.178300-1-ryan.roberts@arm.com>
 <aEgeQCCzRt-B8_nW@arm.com>
 <3cad01ea-b704-4156-807e-7a83643917a8@arm.com>
 <aEhKSq0zVaUJkomX@arm.com>
 <b567a16a-8d80-4aab-84c2-21cbc6a6a35d@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b567a16a-8d80-4aab-84c2-21cbc6a6a35d@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Jun 10, 2025 at 05:37:20PM +0100, Ryan Roberts wrote:
> On 10/06/2025 16:07, Catalin Marinas wrote:
> > On Tue, Jun 10, 2025 at 02:41:01PM +0100, Ryan Roberts wrote:
> >> On 10/06/2025 13:00, Catalin Marinas wrote:
> >>> On Fri, Jun 06, 2025 at 02:56:52PM +0100, Ryan Roberts wrote:
> >>>> Commit 1ef3095b1405 ("arm64/mm: Permit lazy_mmu_mode to be nested")
> >>>> provided a quick fix to ensure that lazy_mmu_mode continues to work when
> >>>> CONFIG_DEBUG_PAGEALLOC is enabled, which can cause lazy_mmu_mode to
> >>>> nest.
> >>>>
> >>>> The solution in that patch is the make the implementation tolerant to
> >>>
> >>> s/is the make/is to make/
> >>>
> >>>> nesting; when the inner nest exits lazy_mmu_mode, we exit then the outer
> >>>> exit becomes a nop. But this sacrifices the optimization opportunity for
> >>>> the remainder of the outer user.
> >>> [...]
> >>>> I wonder if you might be willing to take this for v6.16? I think its a neater
> >>>> solution then my first attempt - Commit 1ef3095b1405 ("arm64/mm: Permit
> >>>> lazy_mmu_mode to be nested") - which is already in Linus's master.
> >>>>
> >>>> To be clear, the current solution is safe, I just think this is much neater.
> >>>
> >>> Maybe better, though I wouldn't say much neater. One concern I have is
> >>> about whether we'll get other such nesting in the future and we need to
> >>> fix them in generic code. Here we control __kernel_map_pages() but we
> >>> may not for other cases.
> >>>
> >>> Is it the fault of the arch code that uses apply_to_page_range() via
> >>> __kernel_map_pages()? It feels like it shouldn't care about the lazy
> >>> mode as that's some detail of the apply_to_page_range() implementation.
> >>> Maybe this API should just allow nesting.
> >>
> >> I don't think it is possible to properly support nesting:
> >>
> >> enter_lazy_mmu
> >>     for_each_pte {
> >>         read/modify-write pte
> >>
> >>         alloc_page
> >>             enter_lazy_mmu
> >>                 make page valid
> >>             exit_lazy_mmu
> >>
> >>         write_to_page
> >>     }
> >> exit_lazy_mmu
> >>
> >> This example only works because lazy_mmu doesn't support nesting. The "make page
> >> valid" operation is completed by the time of the inner exit_lazy_mmu so that the
> >> page can be accessed in write_to_page. If nesting was supported, the inner
> >> exit_lazy_mmu would become a nop and write_to_page would explode.
> > 
> > What I meant is for enter/exit_lazy_mmu to handle a kind of de-nesting
> > themselves: enter_lazy_mmu would emit the barriers if already in lazy
> > mode, clear pending (well, it doesn't need to do this but it may be
> > easier to reason about in terms of flattening). exit_lazy_mmu also needs
> > to emit the barriers but leave the lazy mode on if already on when last
> > entered. This does need some API modifications to return the old mode on
> > enter and get an argument for exit. But the correctness wouldn't be
> > affected since exit_lazy_mmu still emits the barriers irrespective of
> > the nesting level.
> 
> Ahh I see what you mean now; exit always emits barriers but only the last exit
> clears TIF_LAZY_MMU.
> 
> I think that's much cleaner, but we are changing the API which needs changes to
> all the arches and my attempt at [1] didn't really gain much enthusiasm.

To be honest, I don't think the proposal in this series is really
improving what we have. Either we support nested lazy mode or we don't;
having __kernel_map_pages() mess around with the lazy mmu state because
it somehow knows that set_memory_valid() is going to use it is fragile
and ugly.

So I'm incined to leave the current code as-is, unless we can remove it
in favour of teaching the core code how to handle it instead.

Cheers,

Will
