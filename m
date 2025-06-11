Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCC82918C8
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749651895; cv=none; b=PJwb4/FWzErc3wZgkWjwtK6+aamrehw3CsxW9EiSwV7zxeY7Rg4F3HKAbRUUkCmGhO46uJaIOt+pGiurmkS9Rgdo0KWx7iwUxQKFYd06fcXb7Q13QmNfNeE0UUzzwHbwheGnjkf83ujlfQeE4fUoWNTm0LTcFydAM0CeZwPzQmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749651895; c=relaxed/simple;
	bh=0pFFVLiadvRKJfp9oRpjGBZXTkAEH4RLqokRpyU3hNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MbFb+Vf8j6cNcgYB0naE3cKgiCfT4THvlX1LobPTj3XWGzuy0pCn8OWRzR5bTZGTULSNmNmy/ts1D7bk0oseiwv+3qaKHY3IVfeiTPX1B+zJOVkaIwxctLjLVePsP8yX+j6gnl799B27t/uJGFlE5hf7zP1ipxZUjYLdZNEkrL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PnoxANcO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PnoxANcO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73C94C4CEE3;
	Wed, 11 Jun 2025 14:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749651895;
	bh=0pFFVLiadvRKJfp9oRpjGBZXTkAEH4RLqokRpyU3hNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PnoxANcOiROH0JAJ+dD6ydDG+gtWix627OJpwfYFc838aWCL7DXqOvrnv+Kv4m+tJ
	 Mi2AVr45Afb6IrdqYRn0pDNEq0M662aLylqA2dQjJWyapOTQB1iw7BnuBuOvMXGwsi
	 7BqGUXdFRAOaANPNkLkd2KZzuj2bQwbldVL1hVRwxUY6Rg2cwGj9hoXYkRLeZr86NV
	 1tZue9HUMV+1TJYOVYXJ6LjwJJMMVE/jatoNZIETYJAcRTrKU9cESd7GOpV4E5Kf03
	 5pTL0lUvqZAK6EyjnwhoorQJPPLxBWPBJzrZM+cGbkjVM6D8IIdOTSzRn+xwCODqux
	 WRiE1TNIIYZTQ==
Date: Wed, 11 Jun 2025 19:48:30 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nikolay Borisov <nik.borisov@suse.com>, 
	linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>
Subject: Re: [PATCH 3/3] [RFC] x86/devmem: remove low 1MB hack for x86-64
Message-ID: <bacfa3yzt7di4kknssqbs3fi6nrcwpx7pfr64sw4sh66hsdtiq@bloccxuohvur>
References: <20250520152030.1499670-1-arnd@kernel.org>
 <20250520152030.1499670-3-arnd@kernel.org>
 <682e5029e88e0_1626e1008e@dwillia2-xfh.jf.intel.com.notmuch>
 <73120bb4-7eae-49e7-be50-1fac67d351c2@app.fastmail.com>
 <683f3c91c033f_1626e10021@dwillia2-xfh.jf.intel.com.notmuch>
 <0dbb52fb-9e37-4b3e-a247-5946f08b846f@app.fastmail.com>
 <683f4eb8248cf_3e7010086@dwillia2-xfh.jf.intel.com.notmuch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <683f4eb8248cf_3e7010086@dwillia2-xfh.jf.intel.com.notmuch>

On Tue, Jun 03, 2025 at 12:36:24PM -0700, Dan Williams wrote:
> Arnd Bergmann wrote:
> > On Tue, Jun 3, 2025, at 20:18, Dan Williams wrote:
> > > [add Naveen]
> > >
> > > Arnd Bergmann wrote:
> > >> On Thu, May 22, 2025, at 00:14, Dan Williams wrote:
> > >> > Arnd Bergmann wrote:
> > >>
> > >> The third one maps the BIOS area at 0xf0000, and as far as I can tell
> > >> the hack explicitly allowed mapping that even though it is marked
> > >> busy on x86-64 since 5d94e81f69d4 ("x86: Introduce pci_map_biosrom()").
> > >> 
> > >> Is there any downside to marking this one non-busy and still allowing
> > >> the ROM to be mapped? Would that bring back the issue of conflicting
> > >> mapping flags between kernel and userspace?
> > >
> > > For the confidential VM case I expect the answer is "yes" per this patch
> > > attempt:
> > >
> > > http://lore.kernel.org/20250403120228.2344377-1-naveen@kernel.org
> > 
> > I thought the problem here was the read() on /dev/mem, not
> > the mmap(), are you sure it's both?
> > 
> > With this patch [3/3], the memremap() hack for mem_read() goes away on
> > 64-bit, so there should be no way it gets mapped again using that,
> > and the generic devmem_is_allowed() just forbids it as well.
> > 
> > The mmap() access in turn goes through this function
> > 
> > pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
> >                                 unsigned long size, pgprot_t vma_prot)
> > {
> >         if (!phys_mem_access_encrypted(pfn << PAGE_SHIFT, size))
> >                 vma_prot = pgprot_decrypted(vma_prot);
> > 
> >         return vma_prot;
> > }
> > 
> > which I would expect to return the correct vma_prot value already.
> 
> My understanding is that while that gets the correct vma_prot and solves
> the TDX problem it leaves the SEV-SNP problem that the range may not be
> "accepted" ('pvalidate' invoked for the range) at the time the mapping
> is established. So rather than try to make sure ROMs are accepted early
> the proposal is just block altogether.
> 
> Naveen, did I get that right?

That's correct. This patch series doesn't help address that issue, where 
the mmap() is a problem too.

Thanks,
Naveen

