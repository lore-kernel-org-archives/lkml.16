Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AFF3BBF2
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747211855; cv=none; b=lLPpt2eKXIQWkmOFfpciTYoHcz9YuAHsu4e3fnv4hipkZohGpFfcUUX0oC5ki/3IYK3lSrRLR8UCjb7GeXZR2s7qWS4vTNlCKLvbx1d7HSC+UykVDNaAnVI8rsv5wa+s1sXZ/NGd8CEzDwT17AXMQx3HaO//N6RkhtBnOYhqTAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747211855; c=relaxed/simple;
	bh=MaKC8G01CZTOxwxGgHV7gKPYPUouJRHCJlWK0BbTmGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sBvaSVntuKLBqvTjFwzmKTq4POfalTC1PwNM/1W/D2Zai+G8eVjOq0mV3N/c+dS3IDLDUaADleu52ihYzaixWuvyb5OkwBMPmTsCDKKBmnkmFn2TcXnEkrP7htPjI+3SRGgaav7aRkWSluu/mQVLOj7bR6jtMz7sfE57SJXwWBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b2FoKBC3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b2FoKBC3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69EB8C4CEE9;
	Wed, 14 May 2025 08:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747211854;
	bh=MaKC8G01CZTOxwxGgHV7gKPYPUouJRHCJlWK0BbTmGs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b2FoKBC3uWBEU3M80++9Vk54XWu5CUnoeTrHCpD+KOJfXMwMesUYvyAUc8v1f+r6X
	 F088IHjr2cbsRwPUsjbsNyYiWT2618wCDac4WiXS4WYR2uefDXSHx9FqOSTInEalYR
	 2nlcvP/HuYJ/DJd2Xwpg/amc/5vlAZyh1K5MmsfEZqKSpKD/7Eq2O/G+Y5MPpcoD6T
	 MKQ9gOVKOWzlozX6Lnx6A+1pj1wedqceJKujn5IOfP5AznN8MgXcNDWRUiuvVYmsww
	 82ghfW1aJwliOe/P989173V1nuOVUXvdmO87/6y49WLlUApKmyCisMe2H8F8fJ/9Q9
	 DRgaC0BcVcI+g==
Date: Wed, 14 May 2025 10:37:30 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [RFC PATCH v2 4/6] x86/boot: Set 5-level paging CPU cap before
 entering C code
Message-ID: <aCRWSpS8B-B26AB6@gmail.com>
References: <20250513111157.717727-8-ardb+git@google.com>
 <20250513111157.717727-12-ardb+git@google.com>
 <aCRRJ_ahL2IRXxcj@gmail.com>
 <CAMj1kXF0Kc+--5rOqcVKoF-NhYfzA2rioaWsB09VK1hJ49nG+w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXF0Kc+--5rOqcVKoF-NhYfzA2rioaWsB09VK1hJ49nG+w@mail.gmail.com>


* Ard Biesheuvel <ardb@kernel.org> wrote:

> > > -     if (IS_ENABLED(CONFIG_X86_5LEVEL) && (native_read_cr4() & X86_CR4_LA57))
> > > -             setup_force_cpu_cap(X86_FEATURE_5LEVEL_PAGING);
> 
> Note that at this point, we'll likely still have to force clear the 
> original X86_FEATURE_LA57 bit, to address the issue that Kirill 
> raised that user space is now likely to conflate the "la57" cpuinfo 
> string with 5-level paging being in use.

No, I think the general outcome of your series is fine and clean in 
terms of kernel-internal logic, and I wouldn't mess up that clarity 
with user ABI quirks: and we can solve the /proc/cpuinfo ABI 
compatibility requirement by exposing X86_FEATURE_5LEVEL_PAGING as 
'la57', and renaming X86_FEATURE_LA57 to X86_FEATURE_LA57_HW and 
exposing it as a (new) la57_hw flag, or so.

Thanks,

	Ingo
