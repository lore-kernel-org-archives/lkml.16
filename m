Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512D8218E99
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 07:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750319281; cv=none; b=Mc7PSj1/bWAJZt6jps9h5dr3Qs7ZhyS/CbkTnrueQ1whr9DFF/AzzS/HweC7FctQdaMrIepMXGXbfny47Mj29jjG+M2xK7s9zyamHF4wkgBIZmAgGJo92EPq95SkBvvLjowBLb15vKzRAJ+ERml/d7lulX2cLRvM/N8HGwhyYKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750319281; c=relaxed/simple;
	bh=9RxV2f5jGRHC8J0lp7Rn9tySB+H/jH/XSMKH1KGDHSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kYi7KZ+mi60Vyo6wUrWHhOtLRKQOmqpXg6xSt0BUBk8OVzqnTAAOUSC4ANdYz6gZoz1Zb9orTimaxX43qddZZFsfBjazm4Bpu9/Zd0qbqwSzkbQ4YqQ6jp6YcB1yRrcv70pBrJJ37vJXKb6Re8lKCGv9hgCTuwQ5oXJkI5PBnIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ALACq7S4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ALACq7S4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFB5EC4CEEA;
	Thu, 19 Jun 2025 07:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750319280;
	bh=9RxV2f5jGRHC8J0lp7Rn9tySB+H/jH/XSMKH1KGDHSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ALACq7S441S8kzDmyBiLleqzFRDMLJ6zdu3dY4NwgzdvYXYPBP1NGV/3nOHNeuhA7
	 TFgkZvc5wcnojR2vUr4gvb/evMMjk9Jx3OyhrXeRquUbanRiQIcR2MkKY0eVZH+MUz
	 C1ddWIZ73Z1XPimyjetXok7U9l3ok7KYHjvmygbyR4+kH7WQSU3HEfTG1uJ1FUdRLU
	 yqbu8SZJT/coXErw3m5jOSVWMRVTIsAo1/c0KChNwwrxh91JhtNkE4n0xBdU/99qtz
	 9RavDJnIe1Cp1w8XDZBp4GNc5sScApk5BYdKFwYJ+rmdQ6JYFBIbACaAC4ttJ7yxf4
	 H0lglBO/zJ7ug==
Date: Thu, 19 Jun 2025 10:47:54 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, nik.borisov@suse.com
Subject: Re: double free in alternatives/retpoline
Message-ID: <aFPAqgGlStOAoOcB@kernel.org>
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

Hi Dave,

On Thu, Jun 19, 2025 at 01:31:19PM +1000, Dave Airlie wrote:
> On Thu, 19 Jun 2025 at 12:33, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Wed, 18 Jun 2025 at 19:08, Dave Airlie <airlied@gmail.com> wrote:
> > >
> > > I've just tried to boot Linux master with KASAN enabled on a laptop here, and it showing a slab UAF for apply_retpolines.

Does oops happen in core code or when a module is loaded?
Can you share the kernel config?

> > > I haven't had a chance to bisect yet, and unfortunately I only have a photo of the oops.

Could still be useful :)

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

its_fini_core() is called after all pages for the core kernel are
allocated, so there should be no reallocs that use its_pages.pages after
that. 

Modules use a different array stored in the module structure itself and
that array is freed together with the reset of the module when the module
is removed.

Obviously I overlooked something because there's that UAF splat, but it's
not that module initialization reuses the same its_pages.

> > But I might be completely barking up the wrong tree and mis-reading
> > things entirely. PeterZ? Mike?
> 
> I wonder if the module code also needs the same treatment,
> 
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

This surely won't hurt, but I'd like to understand first why there was a
UAF spat at the first place.
 
> Dave.
> >
> >              Linus

-- 
Sincerely yours,
Mike.
