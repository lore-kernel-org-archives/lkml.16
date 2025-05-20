Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4184825DB1C
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 17:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747762731; cv=none; b=HWW55EDXEg7jCCmo2+O9WbWZD19JUqgxOc6EcFmmLowvhKxT9YSKD2nfC+RQvtk2TYaST/1nch2gWdpg/UJ9qjPjMCGw95FywFO3JCN12QMlTJsqHO2T6D6c1Sz7lJ64KZSqrQj7R8Uthgsb4A1Tqy6O7PYrtWDFD0fQq4Q4Hko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747762731; c=relaxed/simple;
	bh=iAUoL/52t+st96cB0ZOxOPA1qkeU8SNK8OhZgEnvdHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZsfR0C+cAQVi+0uttHh7LlOsEbF0qhgrcu1bkwSTXukJ1ZymjWSUVDh5DdpaQ4jS38iguYlh9bx4L+l7KFL5QJoSK9CxtG5Ni5qS2g6f01HXBVNcyNYdCd80axkLpBmTkjNau4f0OwxYQyWVR+NDPy0inPg2qTQmIAtEwz25MUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=aKSBAalB; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="aKSBAalB"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id F080240E01CF;
	Tue, 20 May 2025 17:38:46 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id rQWe8kpt5JsK; Tue, 20 May 2025 17:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1747762719; bh=g/8IH3IE+m0fl0pm15mLfHxbYuGrWo9VU9GchKHSZTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aKSBAalBKfHv61Z68GnAFT3ZIrK1RTILjBiyuNIiyOOljiwEna34tgXWEYzWjn5jR
	 uThCzroYStCNeDKrI6vzIbztFHmljw3EGL14OR8jTcY5ajvu1sWfPL0FfR/OSMDC70
	 6BDeaHRsi3+DFeVkxsmDBax7TfnuElGVFBC1Hoxu+M/bTqRmmUQeWmx+vD7xdeSfDV
	 6GUOb6IIMZzrv0q4HOxPXCA35hkY+EoNaUjutZ0b/+Qbc7DltGy4AhkOs9y5evTbOq
	 Yu98eAouX/sv22dx4hMr2SYWjDXZd0XEcmo3c57HnTl9aXtpLc8u3jfVP6hICMUFnz
	 NVyQP9FEmsGfho6wrj8jH9wfMO6g97N2fcLx2+mdfXa4ns0//IHy61HL2kfaYGebIj
	 Erbwyd1zcBw5QaI0ton5vMXTImrHvbo5Ep5+eNnpOh+qicIDr4WVGNJp8zAVI/Y5tk
	 ODmohBMcTSnaLt7lPvP7YrXsKmN2ZmLLptqGLZULjn/qS19V4Z2jMTIfNcFOwr58h6
	 xwExtkerLdngpQxJVHM3Bd4sWGWrrk3f4NaFXeWTdAU4ctjOA6aGWGTM1YHFDqYN2E
	 Xd2jz9GF3UeMusbBxqky98hk6WJdrwEGvcY/Ohs3KOTAYbnLO/tApbgHpsOGKhPVqR
	 gKOtjo/W57WVkDAWT9FOs250=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 84F5840E016A;
	Tue, 20 May 2025 17:38:31 +0000 (UTC)
Date: Tue, 20 May 2025 19:38:25 +0200
From: Borislav Petkov <bp@alien8.de>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>,
	Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, Ingo Molnar <mingo@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Brian Gerst <brgerst@gmail.com>
Subject: Re: [PATCH v5 2/7] x86/mm: Use a single cache hot per-CPU variable
 to record pgdir_shift
Message-ID: <20250520173825.GOaCy-Eekk661c94ne@fat_crate.local>
References: <20250520104138.2734372-9-ardb+git@google.com>
 <20250520104138.2734372-11-ardb+git@google.com>
 <awmpxjln22i5zmnv3wcwhzvpbbjqmhiw3onmpq66owbtdoujs5@f336cwpvlasn>
 <CAMj1kXE+2P6_y0SnmtmD=J42pe67itnr5jQs6NxjMTvV7HHp0A@mail.gmail.com>
 <20250520143532.GMaCyTNJqH_T2LR8q5@fat_crate.local>
 <CAMj1kXFxRZWsML_5FZvZjwOPO8cvsAwDqvX1686bqqfqkD_PHg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMj1kXFxRZWsML_5FZvZjwOPO8cvsAwDqvX1686bqqfqkD_PHg@mail.gmail.com>

On Tue, May 20, 2025 at 07:03:37PM +0200, Ard Biesheuvel wrote:
> No. But if you had read the next couple of patches, you would have
> noticed that PGDIR_SHIFT, PTRS_PER_P4D and pgtable_l5_enabled() will
> all be derived from this variable, and the latter currently uses code
> patching (in cpu_feature_enabled())
> 
> This is also explained in the cover letter btw

Yes, I saw that.

The question remains: are the *users* - PGDIR_SHIFT, etc - on some hot path
which I'm not seeing?

For example pgd_index() is called in a bunch of places and I guess that adds
up. But without measuring that, we won't know for sure.

Looking at an example:

# ./arch/x86/include/asm/pgtable_64_types.h:32:         return this_cpu_read_stable(__pgdir_shift);
#APP
# 32 "./arch/x86/include/asm/pgtable_64_types.h" 1
        movb %gs:__pgdir_shift(%rip), %cl       #, pfo_val__
# 0 "" 2

...

        movq    40(%rdi), %rax  # ppd_20(D)->vaddr, tmp128
        shrq    %cl, %rax       # pfo_val__, tmp128
# arch/x86/boot/startup/sme.c:105:      pgd_p = ppd->pgd + pgd_index(ppd->vaddr);
        movq    8(%rdi), %rcx   # ppd_20(D)->pgd, ppd_20(D)->pgd
# arch/x86/boot/startup/sme.c:105:      pgd_p = ppd->pgd + pgd_index(ppd->vaddr);
        andl    $511, %eax      #, tmp130
# arch/x86/boot/startup/sme.c:105:      pgd_p = ppd->pgd + pgd_index(ppd->vaddr);
        leaq    (%rcx,%rax,8), %rsi     #, pgd_p

that looks like two insns to me: the RIP-relative mov to %cl and then the
shift.

If you use a "normal" variable, that would be also two insns, no?

Or am I way off?

Because if not, the percpu thing doesn't buy you anything...

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
