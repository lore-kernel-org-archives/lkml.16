Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DAE2E11AE;
	Wed, 25 Jun 2025 19:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750878463; cv=none; b=TjeOIMeqXlOut/C80B0Dn2mAj0c7Ry0gp3vIfsh68qmw7dluPn2HTRp27gWIZsvAt7WUnxuG1jmmLcAL60LEmtdfqJEaJcakDJolanlcbkU+SzZt+kFOqi29w2XaNl6CQbvw0iKWNN2gyZTcz5kCEXlYhLLiB+zyRTdJBc6vmTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750878463; c=relaxed/simple;
	bh=NTjjLVl+LeSllJP6R1f53QYe43vLG0TwGoSH4vgeBpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C31JmDJgg6s0HsEe5mt2SflWDQajMuBRiiNta3ep+THFux0TNbBUYF9tSsLPM62hdFbQUzrjEE85cpWipgmIS+tzkB2Gy91ipfNWDErEInkBNtmvyzWL1huNT9eNMpV3WFb9jik9n4chUjy9DtF+65xlPuuG39q3OKZadAbcWBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tnLTQT9X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tnLTQT9X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7745CC4CEEA;
	Wed, 25 Jun 2025 19:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750878463;
	bh=NTjjLVl+LeSllJP6R1f53QYe43vLG0TwGoSH4vgeBpU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tnLTQT9XyDCKDpGmH6TieOM5dQPInWDIgXpXHByydzTLNwqm1C3EX9AMWa5DjAuxW
	 y/wnjIYacb/tCgGLuXP/8cwQYpCkW1eN4uPsIxUAJLUh8Frp60b+ZzSVnmh6BVnLZS
	 u9RCORJJV7fWpihkmRjzUEa3m+bARSmow8P6HwObyFyxowoGiWRxwoBBl0MKQ+a0xG
	 N5KMjkKPzYLRHNrXP4w3Q4KmRVbW7wBbHj6CUWyn89aJjWgyT6eGRyCTque+ahhzYC
	 SYmg1BoTFRvaKDjhkfZGrQ4Z+rDprpAKqho3egcQ4jMBiDdTfMCiInFNKy01MAjoQi
	 HxLxJb0Ewj8NQ==
Date: Wed, 25 Jun 2025 21:07:38 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, Uladzislau Rezki <urezki@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 2/2] rust: support align and NUMA id in allocations
Message-ID: <aFxI-rjvktSe3h8M@cassiopeiae>
References: <20250625062917.3379804-1-vitaly.wool@konsulko.se>
 <20250625063026.3379921-1-vitaly.wool@konsulko.se>
 <aFxGQWG_81Peu7mP@cassiopeiae>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFxGQWG_81Peu7mP@cassiopeiae>

On Wed, Jun 25, 2025 at 08:56:05PM +0200, Danilo Krummrich wrote:
> On Wed, Jun 25, 2025 at 08:30:26AM +0200, Vitaly Wool wrote:
> > Add support for large (> PAGE_SIZE) alignments in Rust allocators
> > (Kmalloc support for large alignments is limited to the requested
> > size, which is a reasonable limitation anyway).
> 
> Please split this..
> 
> > Besides, add support for NUMA id to Vmalloc.
> 
> and this into separate patches.
> 
> Please also add some information to the commit message what you need node
> support for. Do you also have patches to add node support to Box and Vec?
> 
> > 
> > Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
> > ---
> >  rust/helpers/slab.c            |  8 +++++--
> >  rust/helpers/vmalloc.c         |  4 ++--
> >  rust/kernel/alloc.rs           | 28 ++++++++++++++++++++++--
> >  rust/kernel/alloc/allocator.rs | 40 +++++++++++++++++++---------------
> >  rust/kernel/alloc/kvec.rs      |  3 ++-
> >  5 files changed, 59 insertions(+), 24 deletions(-)
> > 
> > diff --git a/rust/helpers/slab.c b/rust/helpers/slab.c
> > index a842bfbddcba..221c517f57a1 100644
> > --- a/rust/helpers/slab.c
> > +++ b/rust/helpers/slab.c
> > @@ -3,13 +3,17 @@
> >  #include <linux/slab.h>
> >  
> >  void * __must_check __realloc_size(2)
> > -rust_helper_krealloc(const void *objp, size_t new_size, gfp_t flags)
> > +rust_helper_krealloc(const void *objp, size_t new_size, unsigned long align, gfp_t flags, int nid)
> 
> This should have a comment making it obvious why the function has two arguments
> that are discarded. I think we should even separate it with an additional inline
> function.
> 
> I do agree with discarding the align argument, given that it's not exposed to
> users though the Allocator API.

What I meant is that proper alignment is implied when krealloc() succeeds.

> I do disagree with discarding the nid argument though, since you change the
> generic Allocator::realloc() API to take a node argument, which for KREALLOC and
> KVREALLOC is silently discarded. If we introduce it, we should do so for all
> three allocators.
> 
> >  {
> > +	if (WARN_ON(new_size & (align - 1)))
> > +		return NULL;
> 
> I don't think we should have this WARN_ON(). If we want to warn about this, we
> should already do so on the Rust side. The helper functions in this file should
> not contain any logic.
> 
> >  	return krealloc(objp, new_size, flags);
> >  }
> >  
> >  void * __must_check __realloc_size(2)
> > -rust_helper_kvrealloc(const void *p, size_t size, gfp_t flags)
> > +rust_helper_kvrealloc(const void *p, size_t size, unsigned long align, gfp_t flags, int nid)
> >  {
> > +	if (WARN_ON(size & (align - 1)))
> > +		return NULL;
> >  	return kvrealloc(p, size, flags);
> >  }
> 
> Same as above.

This is actually different though, here kvrealloc() may succeed even if the
requested alignment is not fulfilled, so this is incorrect.
