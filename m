Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2FF207A32
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747209849; cv=none; b=bBc3EXA5UjqNJm14ILSMQ1qpOR7oAp0Vnf99Hyx46xlVDTARUmr6uy2zBiUPry8Dqyt026bUDk+BbsXencF9VY8wC3ZtlHJ9hIwJGrkpB3f3v/2skRljLB3d3dssgSB4PUAk+iVV1N1yD6nySLQ04GEN/8MtbcGHATV9Qs1SM28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747209849; c=relaxed/simple;
	bh=fbaIeF9T9zQq3+Oa51mLipNNMu6oRKrC9MRneYEGGE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MR875xH2O8BCIxiDnENaS77HKnc2KE1RtOuEpa1YqzcaN7CnZZPHUONpedPxEIpS78VI6yps23+H1xaHDGKtjFsAkjMo01hdhrE9OlS2Eh0OFgJJAgiZePRsJE+lS7tCDhpL1AeK4m2b7dVACB3xZbjhtz4Gf5eLhoI/KG6R3sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JIxCJhiZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JIxCJhiZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCFDBC4CEF1;
	Wed, 14 May 2025 08:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747209849;
	bh=fbaIeF9T9zQq3+Oa51mLipNNMu6oRKrC9MRneYEGGE4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JIxCJhiZE0idh7FedDhWn7V8InWOV54mdvPRph2S/jUN6PlQI2HQfYecQTgyMgRVy
	 YHTkXu3ISq3PGspnh8XDwjIcLvLnJ/WrnBHFaOKg/G81nYfb2+0MGaK/w8U32A3qO7
	 gzl26mm2qCFz+W9n/brZJqVhRE7M0fOOQxLiV4R8v3l3j0WMc4CjXb2d4+4D3VLuTJ
	 2w1RCamb7n2XMkmjQfXfe4J5y/HixjHof9pldf60XqzQL4UORgQFZ7GFXhyRnI/kal
	 Y4YlfZ5iL1AxkEZyJCpIk3Uyn0KxlCKvrfg/zAwIsO2A6gOgcJ7efloHwEwklTu0ws
	 yEes7q/nR4hJQ==
Date: Wed, 14 May 2025 10:04:05 +0200
From: Ingo Molnar <mingo@kernel.org>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [RFC PATCH v2 2/6] x86/cpu: Use a new feature flag for 5 level
 paging
Message-ID: <aCROdV_fIygO8OoM@gmail.com>
References: <20250513111157.717727-8-ardb+git@google.com>
 <20250513111157.717727-10-ardb+git@google.com>
 <7uh3pi23cdd5r2t6ln5p2z2htgmzo5b6omlhb6vyddobcbqqnt@nyujbhsnpioh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7uh3pi23cdd5r2t6ln5p2z2htgmzo5b6omlhb6vyddobcbqqnt@nyujbhsnpioh>


* Kirill A. Shutemov <kirill@shutemov.name> wrote:

> On Tue, May 13, 2025 at 01:12:00PM +0200, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> > 
> > Currently, the LA57 CPU feature flag is taken to mean two different
> > things at once:
> > - whether the CPU implements the LA57 extension, and is therefore
> >   capable of supporting 5 level paging;
> > - whether 5 level paging is currently in use.
> > 
> > This means the LA57 capability of the hardware is hidden when a LA57
> > capable CPU is forced to run with 4 levels of paging. It also means the
> > the ordinary CPU capability detection code will happily set the LA57
> > capability and it needs to be cleared explicitly afterwards to avoid
> > inconsistencies.
> > 
> > Separate the two so that the CPU hardware capability can be identified
> > unambigously in all cases.
> 
> Unfortunately, there's already userspace that use la57 flag in
> /proc/cpuinfo as indication that 5-level paging is active. :/
> 
> See va_high_addr_switch.sh in kernel selftests for instance.

Kernel selftests do not really count if that's the only userspace that 
does this - but they indeed increase the likelihood that some external 
userspace uses /proc/cpuinfo in that fashion. Does such external 
user-space code exist?

Thanks,

	Ingo
