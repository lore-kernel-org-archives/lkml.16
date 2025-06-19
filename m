Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF62B20E33F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 08:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750320421; cv=none; b=B4UP3AQ/u+/5Zz8Vr3l8M3RlfJFUyUyL+z9fTkX9C7iLOXEzDYdu8A0nH4j4B2ozrkrUCIYdGAZ/C1b6KVSAnE8ulMZOcokPoEzm1ebtYfEUS8c8Jx5wGuApz0OK3Bg+8jNFUUcrn/AG9C1crryHPRAY2goXfOTHcnZg0R+QWSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750320421; c=relaxed/simple;
	bh=ve8p+S7dI1CylXMjs0YRpxXRpIWdjM1DDiCSuJN8dVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cDdmAtiCym0TOYC6EfBhG/rrsBx0zrlnbEb2qTVYDlqEdhN5RBaW0+VVa5DopEdfd2pryVDYx2v56i5qvnvt6yyCSDXeWbuwdsO8O2AVn8lPa6Pqg7KedJd7o98AF3doXh0mlcLQiFmX9UxlWQsmIogTMSg7k93rDyWXwO8/Av4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g3i0KpRQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g3i0KpRQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74173C4CEEA;
	Thu, 19 Jun 2025 08:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750320418;
	bh=ve8p+S7dI1CylXMjs0YRpxXRpIWdjM1DDiCSuJN8dVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g3i0KpRQRQstR8eBNxF8HAj0y+vmjoHEg88uPEs4GXm0JY8MSNdVO7wY/7P0nhA6H
	 hrQuY/VGRQ/oTXoAp52gXdE0FdOrUdWiQ4aTy5lIfHZzS+J5+xvnV3snCauaDjjtg/
	 SCMeH0jEPu3+RCjeUTHD2WGM4uCWAAMk6MJcVfI0oSKTLjzX8JV5Bv+FcoplpXTIEI
	 6gsJbIz1CvXHbX2Qdv1tNZ7WK9VgkdsEn6RJC5ZluwXdnYYpusurwAqNluCDsSyYC0
	 LqcfT0L8nPPMcyvOsm68iz6P5a+n4nSFHiXzxLBD2HKWpl3Hk0nFGvLAiLVTZJ/v77
	 7sTftju7IUsIw==
Date: Thu, 19 Jun 2025 11:06:53 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, nik.borisov@suse.com,
	Lukas Bulwahn <lbulwahn@redhat.com>
Subject: Re: double free in alternatives/retpoline
Message-ID: <aFPFHSLd_b538ovf@kernel.org>
References: <CAPM=9ty750Ex93+9d6DJ1hFJE8XuhXOf7Q7dgXryvhGYLwHbdg@mail.gmail.com>
 <CAHk-=wgd=MdzRHO=bV=g0G0mMV+7ek-q2WnQ8P5sxwJdau-t=g@mail.gmail.com>
 <CAPM=9tyG7+6ZQuBQY=nwiPxywWgVtOHus7cH-KjKMgn+0ADv8Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPM=9tyG7+6ZQuBQY=nwiPxywWgVtOHus7cH-KjKMgn+0ADv8Q@mail.gmail.com>

On Thu, Jun 19, 2025 at 01:31:19PM +1000, Dave Airlie wrote:
> On Thu, 19 Jun 2025 at 12:33, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > [ Adding Mike Rapoport ]
> >
> > On Wed, 18 Jun 2025 at 19:08, Dave Airlie <airlied@gmail.com> wrote:
> > >
> > > I've just tried to boot Linux master with KASAN enabled on a laptop here, and it showing a slab UAF for apply_retpolines.
> > >
> > > I haven't had a chance to bisect yet, and unfortunately I only have a photo of the oops.
> >
> > Hmm.
> >
> > I think it's due to commit a82b26451de1 ("x86/its: explicitly manage
> > permissions for ITS pages").
> >
> > Maybe I'm mis-reading it entirely, but I think that "its_fini_core()"
> > thing is entirely bogus. It does that
> >
> >         kfree(its_pages.pages);
> >
> > but as far as I can tell, that thing is happily used later by module
> > initialization.
> >
> > Freeing the pages that have been used and marked ROX sounds like it
> > should be fine, but I think it should also do
> >
> >         its_pages.pages = NULL;
> >         its_pages->num = 0;
> >
> > so that any subsequent user that comes along due to modules or
> > whatever and does __its_alloc() will DTRT wrt the realloc().
> >
> > But I might be completely barking up the wrong tree and mis-reading
> > things entirely. PeterZ? Mike?
> 
> I wonder if the module code also needs the same treatment,

Looking more closely, there is a typo in its_alloc(), it uses CONFIG_MODULE
to choose an its_array to reallocate while it should have been using
CONFIG_MODULES.

Lukas Bulwahn sent a fix for that:

https://lore.kernel.org/all/20250616100432.22941-1-lukas.bulwahn@redhat.com
 
> diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
> index 6455f7f751b3..4653881a4ab3 100644
> --- a/arch/x86/kernel/alternative.c
> +++ b/arch/x86/kernel/alternative.c
> @@ -182,6 +182,7 @@ static void its_fini_core(void)
>      if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
>          its_pages_protect(&its_pages);
>      kfree(its_pages.pages);
> +    its_pages.pages = NULL;
>  }
> 
>  #ifdef CONFIG_MODULES
> (1/2) Stage this hunk [y,n,q,a,d,j,J,g,/,e,p,?]? y
> @@ -220,6 +221,8 @@ void its_free_mod(struct module *mod)
>          execmem_free(page);
>      }
>      kfree(mod->arch.its_pages.pages);
> +    mod->arch.its_pages.pages = NULL;
> +    mod->arch.its_pages.num = 0;
>  }
>  #endif /* CONFIG_MODULES */
> 
> boots for me, but I've no idea what is required or sufficient.
> 
> Dave.
> >
> >              Linus

-- 
Sincerely yours,
Mike.
