Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C891C36
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 11:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747309786; cv=none; b=ktFw5vBx4EFfbj793YBysOmsqG8DFN8dAH5YmHQlY5kMqIf628+970sg24ir/bFoU0zFJh/ooXnWbpsNlBchNkIw2KLvySyszSilwd3LbA5EaDD1CLiLGq6sC3fyAmYrWZCUxqZwrc6KmQTh2GdBv0wtvXXJeqYojrytbJgTvE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747309786; c=relaxed/simple;
	bh=2UioyTc8dUnRDQy4y/PoFMrKb3eS/YJs/jLmCdfoC3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RdyjCUSUvydJbx5xno8UEKxd69m4/mer/ExuwkaP/2ralA/aEjjZHCoSmOGKEpmnbYFDCpGKXt8EBi/Hzv/+SIF5U3iysMcfcay6El8+Hk8uAnmhSKwuv5OE6ba0hqCCD+NOYYtjAvHVAwWNEmxy2qcbg2UTL/TQ5kFxSWgFWqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GMUt5AwH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GMUt5AwH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC4AEC4CEE7;
	Thu, 15 May 2025 11:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747309784;
	bh=2UioyTc8dUnRDQy4y/PoFMrKb3eS/YJs/jLmCdfoC3M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GMUt5AwHoreHw3uG2k4wEl0NwDDIdXF/3W/epdFZNo7ug92MP3V63y8IyLbKRiQf3
	 YCaoCjKfwoWQJZcyxaFm1RM0J1lfNYR5Nj9KZCocVT0MhOPe0oCx9nj+bEqVcKdKwZ
	 XDrz+SO4dR33NqEiTG9DqIjHtiHmO8EvtrswvL9+e8PNgYoSIcOneKs0Q7O9Ljezpe
	 IxT071IaIG1Hr7YpPeVzAcvcvs1g4xb6W75G+T+kVO9B2o2Htkgqu7MCpi0SirJHtT
	 UsdLZp/tNiQ20190LmXcTbalgnln5fJx9JjXsJcfdNhLNXYQZL7o/q4yqocxhUR26F
	 dUPTqsAxkzRGg==
Date: Thu, 15 May 2025 13:49:39 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Andy Shevchenko <andy@kernel.org>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>,
	Borislav Petkov <bp@alien8.de>, Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Kees Cook <keescook@chromium.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [PATCH 27/29] x86/boot/e820: Simplify the e820__range_remove()
 API
Message-ID: <aCXU0x6lqJ0J7W5D@gmail.com>
References: <20250421185210.3372306-1-mingo@kernel.org>
 <20250421185210.3372306-28-mingo@kernel.org>
 <aAfG0fSVFVNciAqi@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAfG0fSVFVNciAqi@smile.fi.intel.com>


* Andy Shevchenko <andy@kernel.org> wrote:

> On Mon, Apr 21, 2025 at 08:52:07PM +0200, Ingo Molnar wrote:
> > Right now e820__range_remove() has two parameters to control the
> > E820 type of the range removed:
> > 
> > 	extern void e820__range_remove(u64 start, u64 size, enum e820_type old_type, bool check_type);
> > 
> > Since E820 types start at 1, zero has a natural meaning of 'no type.
> > 
> > Consolidate the (old_type,check_type) parameters into a single (filter_type)
> > parameter:
> > 
> > 	extern void e820__range_remove(u64 start, u64 size, enum e820_type filter_type);
> > 
> > Note that both e820__mapped_raw_any() and e820__mapped_any()
> > already have such semantics for their 'type' parameter, although
> > it's currently not used with '0' by in-kernel code.
> > 
> > Also, the __e820__mapped_all() internal helper already has such
> > semantics implemented as well, and the e820__get_entry_type() API
> > uses the '0' type to such effect.
> > 
> > This simplifies not just e820__range_remove(), and synchronizes its
> > use of type filters with other E820 API functions, but simplifies
> > usage sites as well, such as parse_memmap_one(), beyond the reduction
> > of the number of parameters:
> > 
> >   -               else if (from)
> >   -                       e820__range_remove(start_at, mem_size, from, 1);
> >                   else
> >   -                       e820__range_remove(start_at, mem_size, 0, 0);
> >   +                       e820__range_remove(start_at, mem_size, from);
> > 
> > The generated code gets smaller as well:
> > 
> > 	add/remove: 0/0 grow/shrink: 0/5 up/down: 0/-66 (-66)
> > 
> > 	Function                                     old     new   delta
> > 	parse_memopt                                 112     107      -5
> > 	efi_init                                    1048    1039      -9
> > 	setup_arch                                  2719    2709     -10
> > 	e820__range_remove                           283     273     -10
> > 	parse_memmap_opt                             559     527     -32
> > 
> > 	Total: Before=22,675,600, After=22,675,534, chg -0.00%
> 
> >  extern void e820__range_add   (u64 start, u64 size, enum e820_type type);
> >  extern u64  e820__range_update(u64 start, u64 size, enum e820_type old_type, enum e820_type new_type);
> > -extern void e820__range_remove(u64 start, u64 size, enum e820_type old_type, bool check_type);
> > +extern void e820__range_remove(u64 start, u64 size, enum e820_type filter_type);
> >  extern u64  e820__range_update_table(struct e820_table *t, u64 start, u64 size, enum e820_type old_type, enum e820_type new_type);
> >  
> >  extern int  e820__update_table(struct e820_table *table);
> 
> Wondering if are going to get rid of 'extern' for the functions...

Symmetrical use of storage classes provide useful documentation:

 - I kinda like the immediate visual reminder of 'extern' that these 
   are exported API functions and not a function definition or 
   something else.

 - Just like 'static void ...' is an immediate visual reminder that the 
   following function definition is local scope, or 'static inline' in 
   a header is an immediate reminder that it's an inline API.

We use such symmetric taggint in other places: we don't write 
'unsigned' instead of 'unsigned int', just because we can.

But no strong feelings either way, as long as it's consistent within 
the subsystem. The wider kernel is certainly using both approaches.

Thanks,

	Ingo
