Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFD31E835B;
	Thu, 10 Apr 2025 16:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744302778; cv=none; b=na/A7A3YDSggWIhmz7/ANyJxNoeAeZkUuiRiaK9Ws6wn1XMVfVdF/dH3gyrThoOuzrGeLzU8HSVtTdUuVhzefkOkTe0ZrPvLiVzCF0RZTTqPELs1IolumeANvS+j19qDsyKLVi0JulMkpwndbaiFT8Ksi3HfzkvJc9enYz2nhJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744302778; c=relaxed/simple;
	bh=W+KBvBmUBQxYMM+SM1C+l8F5u52QLsfsuEheevSFjuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MMus3DYZSwc6FCOBSFuKpiGPBJ7npWG10LH5t7PZ1gc/FHwd+JdHByW7k3kb0lqSCcOqmczclUlFUQFl1nus02Igdy4trqKwn47BaDgoXNp2mP4TdN0eqQreu5sImCMjBL+nXKFHZggQMerUTRJbdsIkxfmqM9jQGfihW3JJ0mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FFj9JS7e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FFj9JS7e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15CB2C4CEE8;
	Thu, 10 Apr 2025 16:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744302778;
	bh=W+KBvBmUBQxYMM+SM1C+l8F5u52QLsfsuEheevSFjuA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FFj9JS7eGsAjExLx+npY5TEH/ifiwKlMQ5UJREfhJpGWv1+dYumGlAzij41mxlpuo
	 wGApODJhauoyczKBHbFq1spaA6Xj4T/0C762aqohiglwaZgEI5P9j/ui7xsmjfs0XI
	 jbTuzr3KiXPySfczS/Ab0iuHxWZjVCrai7apd7X7KpUVo7kX7ogDeWshxDlgWnSHpW
	 ExTTQhVzgHWwUdw/WvgfgWTImmuYRMvypqSJMq7BRnLPMEyzU1lw4E1Honv3IJETOT
	 1XU1ShBzM/cQ7PtN8mMelBTFwi6bu81S7jmI6If/9f8O0Lh0Kw/8Ltq7TxpU1sQEKn
	 QuzshxAhOeQMQ==
Date: Thu, 10 Apr 2025 09:32:54 -0700
From: Kees Cook <kees@kernel.org>
To: Nikolay Borisov <nik.borisov@suse.com>
Cc: Dan Williams <dan.j.williams@intel.com>,
	Dave Hansen <dave.hansen@intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Naveen N Rao <naveen@kernel.org>, linux-kernel@vger.kernel.org,
	x86@kernel.org, linux-coco@lists.linux.dev,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Borislav Petkov <bp@alien8.de>,
	Vishal Annapurve <vannapurve@google.com>,
	Kirill Shutemov <kirill.shutemov@linux.intel.com>,
	Kevin Loughlin <kevinloughlin@google.com>,
	Michal Hocko <mhocko@suse.com>
Subject: Re: [RFC PATCH] x86/sev: Disallow userspace access to BIOS region
 for SEV-SNP guests
Message-ID: <202504100931.DEC3D3B79@keescook>
References: <20250403120228.2344377-1-naveen@kernel.org>
 <67eedc35be77d_464ec29462@dwillia2-xfh.jf.intel.com.notmuch>
 <l34f6nqq3up23cvrgmebbufztqkvfil5eahecukw5bnqekccpj@6nbciquhwxxc>
 <1bc4c506-57ad-38aa-d56d-ed058f54708e@amd.com>
 <fd683daa-d953-48ca-8c5d-6f4688ad442c@intel.com>
 <67f5b75c37143_71fe2949b@dwillia2-xfh.jf.intel.com.notmuch>
 <202504091038.5D9B68A@keescook>
 <67f6bee647aa5_1302d294f5@dwillia2-xfh.jf.intel.com.notmuch>
 <e2933f6e-4bda-40ee-b69c-d7222082fcfd@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e2933f6e-4bda-40ee-b69c-d7222082fcfd@suse.com>

On Thu, Apr 10, 2025 at 03:03:55PM +0300, Nikolay Borisov wrote:
> 
> 
> On 9.04.25 г. 21:39 ч., Dan Williams wrote:
> > Kees Cook wrote:
> > > On Tue, Apr 08, 2025 at 04:55:08PM -0700, Dan Williams wrote:
> > > > Dave Hansen wrote:
> > > > > On 4/8/25 06:43, Tom Lendacky wrote:
> > > > > > > Tom/Boris, do you see a problem blocking access to /dev/mem for SEV
> > > > > > > guests?
> > > > > > Not sure why we would suddenly not allow that.
> > > > > 
> > > > > Both TDX and SEV-SNP have issues with allowing access to /dev/mem.
> > > > > Disallowing access to the individually troublesome regions can fix
> > > > > _part_ of the problem. But suddenly blocking access is guaranteed to fix
> > > > > *ALL* the problems forever.
> > > > 
> > > > ...or at least solicits practical use cases for why the kernel needs to
> > > > poke holes in the policy.
> > > > 
> > > > > Or, maybe we just start returning 0's for all reads and throw away all
> > > > > writes. That is probably less likely to break userspace that doesn't
> > > > > know what it's doing in the first place.
> > > > 
> > > > Yes, and a bulk of the regression risk has already been pipe-cleaned by
> > > > KERNEL_LOCKDOWN that shuts down /dev/mem and PCI resource file mmap in
> > > > many scenarios.
> > > > 
> > > > Here is an updated patch that includes some consideration for mapping
> > > > zeros for known legacy compatibility use cases.
> > [..]
> > > > diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
> > > > index bfa444a7dbb0..c8679ae1bc8b 100644
> > > > --- a/arch/x86/mm/init.c
> > > > +++ b/arch/x86/mm/init.c
> > > > @@ -867,6 +867,8 @@ void __init poking_init(void)
> > > >    */
> > > >   int devmem_is_allowed(unsigned long pagenr)
> > > >   {
> > > > +	bool platform_allowed = x86_platform.devmem_is_allowed(pagenr);
> > > > +
> > > >   	if (region_intersects(PFN_PHYS(pagenr), PAGE_SIZE,
> > > >   				IORESOURCE_SYSTEM_RAM, IORES_DESC_NONE)
> > > >   			!= REGION_DISJOINT) {
> > > > @@ -885,14 +887,20 @@ int devmem_is_allowed(unsigned long pagenr)
> > > >   	 * restricted resource under CONFIG_STRICT_DEVMEM.
> > > >   	 */
> > > >   	if (iomem_is_exclusive(pagenr << PAGE_SHIFT)) {
> > > > -		/* Low 1MB bypasses iomem restrictions. */
> > > > -		if (pagenr < 256)
> > > > +		/*
> > > > +		 * Low 1MB bypasses iomem restrictions unless the
> > > > +		 * platform says "no", in which case map zeroes
> > > > +		 */
> > > > +		if (pagenr < 256) {
> > > > +			if (!platform_allowed)
> > > > +				return 2;
> > > >   			return 1;
> > > > +		}
> > > >   		return 0;
> > > >   	}
> > > > -	return 1;
> > > > +	return platform_allowed;
> > > >   }
> > > >   void free_init_pages(const char *what, unsigned long begin, unsigned long end)
> > > 
> > > I am reminded of this discussion:
> > > https://lore.kernel.org/all/CAPcyv4iVt=peUAk1qx_EfKn7aGJM=XwRUpJftBhkUgQEti2bJA@mail.gmail.com/
> > > 
> > > As in, mmap will bypass this restriction, so if you really want the low
> > > 1MiB to be unreadable, a solution for mmap is still needed...
> > 
> > Glad you remembered that!
> > 
> > This needs a self-test to verify the assumptions here. I can circle back
> > next week or so take a look at turning this into a bigger series. If
> > someone has cycles to take this on before that I would not say no to
> > some help.
> 
> Can't we simply treat return value of 2 for range_is_allowed the same way as
> if 0 was returned in mmap_mem and simply fail the call with -EPERM?

The historical concern was that EPERM would break old tools. I don't
have any current evidence either way, though.

-- 
Kees Cook
