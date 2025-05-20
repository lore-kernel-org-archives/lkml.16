Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B353B4C9D
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 18:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747764084; cv=none; b=tHba7vHm683F0jZPqMLwoZLd+Htp5+1a0wpyZptKkChGH+KIBMXKW4lYU2qBm9z+8u/ue7PTmqxhcNx1H1vEYWABQpxZLwRW+r22/3EZt2JtQR1U6AHvo7wymiB7ZPCCjBJtxqB4qPz2mWb3J37aVe8K5H9GYg1fr9VZGLEIyi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747764084; c=relaxed/simple;
	bh=ZfP9uP9mEfZH/qD6TuMh31ayOhCzoqLXgrzZ4gWV3oc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LHbNFsSYIevjkH1UieInnk1h7on0+Wj5duEZzOYmvR/Aqdeh1vED83shIrjUDKhZPMmegxp8O9w+1g5czJ17y4L+Ta291H3qTASphTgIFMh0p5Z2CBB2dXooA51/jl4e7YbT2wrKxHl7d0Hquyk21k7g8QYtVKWZGQkREPK87Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Jo9fkX4M; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Jo9fkX4M"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 039E740E0163;
	Tue, 20 May 2025 18:01:20 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id zmNaqe0VPYw5; Tue, 20 May 2025 18:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1747764076; bh=TXIhutX3goEJ1TZKkfSJRw3z4YKDC8u8Si3u8vDphbI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jo9fkX4MaINhSqGdz+4J3WGUznQqxo2m1W0dP8xNENN6Ssj6xeUndElgLMdya4Gr+
	 8TwimEcvHf9ZVOlXlYP6NmpRKox60RbSRaU8leoUzwDPhmuBjOAI15j1bO8WxRUySF
	 N3mK6mWaDMRjLff5hWQrTsWk+yhwOu/fSFukPxk0OKDqmDAzPJAsXKAIG2HxRLD8P9
	 QWzmg4wx0bFmxPNV4Xg1yW0lRjWorUeIPathDx+/lVjZ8N7jSkPn8uFRDlyuKVLK+N
	 Zceo8ckzi1I7U29JW/0UkFnHzNQPpZRs6H6IHxa189g95GUuuy2BaGdVi355xY8P3l
	 79Ojy4pXmXIyJyi4snmXKC5K23G0IfsmR4p8ZYDQluyTlg9YRc/lK8lDSgfTh06Oon
	 jHwojlxe9rNlABznTenDPuHBH+m0CgJtwLv5V2U2p5T3hUwxbSL9qViUODAj6R9RBL
	 g3T/gogmWQLrLTgVw4WgUFP50F9JrM531IdObA9uhDqCbFBRIc4vlSYijG+DHH6Mw0
	 5khVFaVVNSEpJpXcliwaxYXNSmmimHzpJRVgwvRfd3sXSmJfh955rMAcOARVAgflFx
	 wnBE9O5LKmeqJH1LOhiCXwgsB1iGukUzoJzXjpTdu2lmiT5wS4QkN06zPOSvgXqrQC
	 WMrlLp/+yi6puv3H8eTVM/Jo=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id D5A2140E01CF;
	Tue, 20 May 2025 18:01:07 +0000 (UTC)
Date: Tue, 20 May 2025 20:01:01 +0200
From: Borislav Petkov <bp@alien8.de>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>,
	Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, Ingo Molnar <mingo@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Brian Gerst <brgerst@gmail.com>
Subject: Re: [PATCH v5 2/7] x86/mm: Use a single cache hot per-CPU variable
 to record pgdir_shift
Message-ID: <20250520180101.GPaCzDXW2MlArU71xe@fat_crate.local>
References: <20250520104138.2734372-9-ardb+git@google.com>
 <20250520104138.2734372-11-ardb+git@google.com>
 <awmpxjln22i5zmnv3wcwhzvpbbjqmhiw3onmpq66owbtdoujs5@f336cwpvlasn>
 <CAMj1kXE+2P6_y0SnmtmD=J42pe67itnr5jQs6NxjMTvV7HHp0A@mail.gmail.com>
 <20250520143532.GMaCyTNJqH_T2LR8q5@fat_crate.local>
 <CAMj1kXFxRZWsML_5FZvZjwOPO8cvsAwDqvX1686bqqfqkD_PHg@mail.gmail.com>
 <20250520173825.GOaCy-Eekk661c94ne@fat_crate.local>
 <CAMj1kXHpFK+=1gdo11Msw9w6gh2f-4gnSCkyA5kaB_x4mafS5A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMj1kXHpFK+=1gdo11Msw9w6gh2f-4gnSCkyA5kaB_x4mafS5A@mail.gmail.com>

On Tue, May 20, 2025 at 07:46:33PM +0200, Ard Biesheuvel wrote:
> Look at pgtable_l5_enabled() please, that is the important one.

OMG. :-)

# 32 "./arch/x86/include/asm/pgtable_64_types.h" 1
        movb %gs:__pgdir_shift(%rip), %al       #, pfo_val__
# 0 "" 2
# ./arch/x86/include/asm/pgtable.h:1178:        if (!pgtable_l5_enabled())
#NO_APP
        testb   $1, %al #, pfo_val__

I hadn't seen his fun yet:

!(pgdir_shift() & 1)

> The variable access is identical in terms of instructions, the only
> difference is the %gs offset being applied, and the fact that using
> cache hot data is guaranteed not to increase the number of cachelines
> covering the working set of any existing workload (the region is
> bounded to a fixed number of cachelines)

Yes, but look at all the callers. I hardly see any serious hot paths to care
about the %gs offset being applied.

And I'll be really surprised if that *shows* in any sensible benchmark...

Also, it doesn't make any sense for a *global* system property - what paging
level the machine uses - to be in a *per-CPU* variable. That's a global value
which is the same everywhere. So why waste space?

> Happy to keep this as a simple __ro_after_init variable if there is
> consensus between the tip maintainers that we don't need this perf

Yeah, IMO, no need. But let's see what the others say.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
