Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08396DCE1
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 08:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743323803; cv=none; b=IX1NbAIc+SB++XEJV07k8niKp8vwz/ITYHogNT6l8OshVj9I7FB9/fT4iJag+gM1g9GihGM2beMC02tFdFzIwWoBlE25jY69r43u1UnBofZpTkr4dlFVGJ02myL01H/GuWo9Y6VtwG8RbtVawMTvaZEgNbL4oadtBnW92VD5N10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743323803; c=relaxed/simple;
	bh=kOFOJm39FkXH+rwD+36WlO5jTjLl36ZB3AYPctsbP88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wv69ofUF4dGU0ifMfbVX95FNF7W6uIWNx/E6ooNovf6cnVssl7/IiSYQeghJw4O643HvD0STKHQnG2LryOy2KwVn/Qv3P5Frn59iTkn+g9DQUiSblMU+aECBBSM5MFv0i/vCV/YU14TUy6JN6zCU6JgllBpxvYpiP66ys8BTyGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B1H9fmPw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B1H9fmPw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18A1FC4CEDD;
	Sun, 30 Mar 2025 08:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743323802;
	bh=kOFOJm39FkXH+rwD+36WlO5jTjLl36ZB3AYPctsbP88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B1H9fmPwgNZ8nM0tHdayf7Ir9hlQgGnpZPiRWgV94jiu7g8SP3pgHLHY5s2MlRYul
	 9pCKDTNJbGboAItH7ZuQFjJpvWyOfAjJFQMyK7Q+dDywXIPuuQpPGlmIyq0Jz/bRMi
	 HxjYlDNgLXzIC8oES4Hs60N78eVn31UrlDlV1/MmR3PHPZhowZZvCcTrBFQF2CHVlZ
	 fbMzHmERVLTUq8jiXHMuZwBLcj0TkUo6Ce/mGkgxaMd1VSI+Wq9yryJ5edJLQKO20C
	 AeiNKSwhMwJYx8NprmqCf/ti597kztA2EAtgtXv8JZtDAwKNywIXtJD1IqIkEfEE1Q
	 R4r1jzkSN5xPA==
Date: Sun, 30 Mar 2025 11:36:34 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Dev Jain <dev.jain@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, catalin.marinas@arm.com,
	will@kernel.org, gshan@redhat.com, steven.price@arm.com,
	suzuki.poulose@arm.com, tianyaxiong@kylinos.cn, ardb@kernel.org,
	david@redhat.com, urezki@gmail.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: pageattr: Explicitly bail out when changing
 permissions for vmalloc_huge mappings
Message-ID: <Z-kCkh1XWX8Rwjwz@kernel.org>
References: <20250328062103.79462-1-dev.jain@arm.com>
 <Z-cnmklGUojMzsUF@kernel.org>
 <deedf5e2-4a25-4c1f-a5d8-a661a2eb16d2@arm.com>
 <Z-jzouwNZwk8Ft-j@kernel.org>
 <b7be0b9c-89fa-470d-8f6d-7db6282b3c68@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7be0b9c-89fa-470d-8f6d-7db6282b3c68@arm.com>

On Sun, Mar 30, 2025 at 01:53:57PM +0530, Dev Jain wrote:
> 
> 
> On 30/03/25 1:02 pm, Mike Rapoport wrote:
> > On Sat, Mar 29, 2025 at 09:46:56AM +0000, Ryan Roberts wrote:
> > > On 28/03/2025 18:50, Mike Rapoport wrote:
> > > > On Fri, Mar 28, 2025 at 11:51:03AM +0530, Dev Jain wrote:
> > > > > arm64 uses apply_to_page_range to change permissions for kernel VA mappings,
> > > > 
> > > >                                                       for vmalloc mappings ^
> > > > 
> > > > arm64 does not allow changing permissions to any VA address right now.
> > > > 
> > > > > which does not support changing permissions for leaf mappings. This function
> > > > > will change permissions until it encounters a leaf mapping, and will bail
> > > > > out. To avoid this partial change, explicitly disallow changing permissions
> > > > > for VM_ALLOW_HUGE_VMAP mappings.
> > > > > 
> > > > > Signed-off-by: Dev Jain <dev.jain@arm.com>
> > > 
> > > I wonder if we want a Fixes: tag here? It's certainly a *latent* bug.
> > 
> > We have only a few places that use vmalloc_huge() or VM_ALLOW_HUGE_VMAP and
> > if there was a code that plays permission games on these allocations, x86
> > set_memory would blow up immediately, so I don't think Fixes: is needed
> > here.
> 
> But I think x86 can handle this (split_large_page() in __change_page_attr())
> ?

Yes, but it also updates corresponding direct map entries when vmalloc
permissions change and the direct map update presumes physical contiguity
of the range. 

> > > > > ---
> > > > >   arch/arm64/mm/pageattr.c | 4 ++--
> > > > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> > > > > index 39fd1f7ff02a..8337c88eec69 100644
> > > > > --- a/arch/arm64/mm/pageattr.c
> > > > > +++ b/arch/arm64/mm/pageattr.c
> > > > > @@ -96,7 +96,7 @@ static int change_memory_common(unsigned long addr, int numpages,
> > > > >   	 * we are operating on does not result in such splitting.
> > > > >   	 *
> > > > >   	 * Let's restrict ourselves to mappings created by vmalloc (or vmap).
> > > > > -	 * Those are guaranteed to consist entirely of page mappings, and
> > > > > +	 * Disallow VM_ALLOW_HUGE_VMAP vmalloc mappings so that
> > > > 
> > > > I'd keep mention of page mappings in the comment, e.g
> > > > 
> > > > 	* Disallow VM_ALLOW_HUGE_VMAP mappings to guarantee that only page
> > > > 	* mappings are updated and splitting is never needed.
> > > > 
> > > > With this and changelog updates Ryan asked for
> > > > 
> > > > Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > > > 
> > > > 
> > > > >   	 * splitting is never needed.
> > > > >   	 *
> > > > >   	 * So check whether the [addr, addr + size) interval is entirely
> > > > > @@ -105,7 +105,7 @@ static int change_memory_common(unsigned long addr, int numpages,
> > > > >   	area = find_vm_area((void *)addr);
> > > > >   	if (!area ||
> > > > >   	    end > (unsigned long)kasan_reset_tag(area->addr) + area->size ||
> > > > > -	    !(area->flags & VM_ALLOC))
> > > > > +	    ((area->flags & (VM_ALLOC | VM_ALLOW_HUGE_VMAP)) != VM_ALLOC))
> > > > >   		return -EINVAL;
> > > > >   	if (!numpages)
> > > > > -- 
> > > > > 2.30.2
> > > > > 
> > > > 
> > > 
> > 
> 

-- 
Sincerely yours,
Mike.
