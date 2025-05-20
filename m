Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF571BD9F0
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 18:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747766162; cv=none; b=bBVOjhOOBYRnVmln+4kYkZ56SxIRKtKtmzs7euREjIxLzP3zgJxcx8tH9/BdyilU46YVetvT5dEuPtR2J5gkWkgjrt2QQVXINT7gUlXy6fp0HKZNXitwv+dRiP+CPme3tN/BtLF8sdQi19gYYBAeheqOEY5DOrjSYEffrPTZLTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747766162; c=relaxed/simple;
	bh=/saHgBRVimx7l/qJ5nYDikrV8tFAWgPZS8P52xVacw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=amVr/qhwotRVsi59RyYy2aVGQEMh0hvuciuLnCP33F0Gtj/b7f+pHdFf4NN6eWj7W3gnAROnmfxzBIqkaznOVlpzaLXX65LacUm93K0CL4+8wp0bERKtWUW6j7Uq7rh6/Dx3G74Yql8FdCVqqW07lidUbWqsVDrHKAy4H7tGPUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=QQ8RgJIp; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="QQ8RgJIp"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 75B2040E01CF;
	Tue, 20 May 2025 18:35:58 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id itcKw6iaH3hF; Tue, 20 May 2025 18:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1747766155; bh=qwLau223cMPR9J1P5GGB7D9i6EY2sDIlAypqDtaFyYU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QQ8RgJIp67Xqij7hCTS9RYAZBGnvTE2PHyz8r7Ew/hu4zyZUAplCOGq0a7HVrsDcc
	 zkV6dVqDZ2/ZqTYZErSw0lJM0herl2r6pNs+iMAPhYtK+Yg3+UAPcNhv2nYzJ6bU/z
	 AYcIdHbv9nBnoDqKKDXzpTLFeWOrnLFtxFSO87g/5bV8XRcMDKTdxbz5AB0bW1KwY7
	 ui6fgs4BFzg475Wr5squP7UT/kC5+wn4RN73BCws+tKDUjPr/bLYMiWv105gEv6vXk
	 puLD5TC8H5ttYAUGH8Tn8VgYu7zI3guR1hAck/0Zi2MHcxDx4VHJcmoBcxkbjhp9xy
	 1Ir2ZpsmM8uTL1+cB19GhmOOdArjJtVzpdeEDPx/du+ZCgC0Q8aD7nw6yDU0CxmQtM
	 2yPjv2mIVP3iXUtLnViGiqhbvOQTknC36pc/zVIy0oJ/mZE1JhggdnqJj7kxw+QYXv
	 6X0BBAIBy6MoZu0vzYJ4nM27N8BPx/Cra/EIUsqi8mKWMoTN0XJd9i34eBL3CyybT7
	 3wSmyll31o26H7up+b+uth/vKkUza5ng/bpZ+ufIV8N+cwdD7M57IwAc6kf1JPtDCc
	 Y8Qatt7TGJnJt9eHeqc9U3lVJcGt+Gi3JqwpYG6y2+zlH96NJ7EQqKXiA6G6SqCfUX
	 pgG2KEu0vsNejIFUfJjn1chE=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id DA22C40E0163;
	Tue, 20 May 2025 18:35:46 +0000 (UTC)
Date: Tue, 20 May 2025 20:35:40 +0200
From: Borislav Petkov <bp@alien8.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ard Biesheuvel <ardb@kernel.org>,
	"Kirill A. Shutemov" <kirill@shutemov.name>,
	Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, Ingo Molnar <mingo@kernel.org>,
	Brian Gerst <brgerst@gmail.com>
Subject: Re: [PATCH v5 2/7] x86/mm: Use a single cache hot per-CPU variable
 to record pgdir_shift
Message-ID: <20250520183540.GQaCzLfHsGoWtt_6ZV@fat_crate.local>
References: <20250520104138.2734372-9-ardb+git@google.com>
 <20250520104138.2734372-11-ardb+git@google.com>
 <awmpxjln22i5zmnv3wcwhzvpbbjqmhiw3onmpq66owbtdoujs5@f336cwpvlasn>
 <CAMj1kXE+2P6_y0SnmtmD=J42pe67itnr5jQs6NxjMTvV7HHp0A@mail.gmail.com>
 <20250520143532.GMaCyTNJqH_T2LR8q5@fat_crate.local>
 <CAMj1kXFxRZWsML_5FZvZjwOPO8cvsAwDqvX1686bqqfqkD_PHg@mail.gmail.com>
 <20250520173825.GOaCy-Eekk661c94ne@fat_crate.local>
 <CAMj1kXHpFK+=1gdo11Msw9w6gh2f-4gnSCkyA5kaB_x4mafS5A@mail.gmail.com>
 <20250520180101.GPaCzDXW2MlArU71xe@fat_crate.local>
 <CAHk-=whdFESwxUMvyMGuXzpCA6cm0d5kAc57fGWkWs0DLEi9qw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=whdFESwxUMvyMGuXzpCA6cm0d5kAc57fGWkWs0DLEi9qw@mail.gmail.com>

On Tue, May 20, 2025 at 11:28:28AM -0700, Linus Torvalds wrote:
> What happens if pgtable_l5_enabled() is made to use  __raw_cpu_read()?
> With a compiler that is new enough to support USE_X86_SEG_SUPPORT?

Before we go play with this more, I see the same thing with gcc-13 and gcc-14
on debian.

Those should be fairly new, I'd think...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
