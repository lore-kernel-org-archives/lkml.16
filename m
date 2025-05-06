Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF9272608
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 17:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746553179; cv=none; b=Wi2+4P3HwR7y/yu1hL19Am1KLldotkYo8TU2NaPQq3CXgmMheJopYlV0Jt98Jn4DRMPtJvyFG9VTxVnj0uK02DAZFl0IBSiH3T8t5IPNy/EgedKG6eVbSSpL0bvIhWMcV43ZqnmVbyUtMXpmR2tamJjaOk8X4NT9H+Wh7/nbsAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746553179; c=relaxed/simple;
	bh=ygC4jeJ8dWSsHiXwImyCmJalRyiQe/eP76J9UZQgQsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q66o/tXt6PADxDa64yAfAj7sZBeFUwT3iQpHF33Gd82GNSab26wNOgOHpUgcnl+m1KacooVdQl7H2pCmTxyzzkEkCZd3f5tCHcVSBNCCoNThhCXOU8chMv9H8lJWHUdYuw37p1cmAPw8OWDaxII3JJ3/A8VlxDzNoHF/dnUqnVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jyVnlM1s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jyVnlM1s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB19DC4CEE4;
	Tue,  6 May 2025 17:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746553179;
	bh=ygC4jeJ8dWSsHiXwImyCmJalRyiQe/eP76J9UZQgQsc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jyVnlM1smlHuUOTVJUf5GLKZZ2XWFHsPe+XCaedvtmEzmJ6ns5eWhBOOzU53XEPdY
	 VFDXx6/fBNFkEUBq0GLR8USN63L6zidBFF2RNwfD8v3gQ/Pnib0G7HlnsjQVLfcao5
	 4ffyX49tf0Ho8QokxrYD8XZ+Qbgn7UeyocLOewbNZtRtj/REDC/F5tZm+3NDdLplUX
	 fXnGEEWqQr+PwtZO2iOcw+f0j+aYFI4vzQNOHs/ugplls3kk3hwFJQM+PEzcCP9kJ8
	 bcuyA/ovbPVrr8jDy2G31tlQgZLr+x8BQ/3YkCkVld+R/e70iXZu79BpVP5UMZr5ri
	 Rg5awkXmLntpA==
Date: Tue, 6 May 2025 19:39:35 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: Re: [RFC PATCH 3/3] x86/boot: Use alternatives based selector for
 5-level paging constants
Message-ID: <aBpJV7fJNyfb7tSx@gmail.com>
References: <20250506154532.1281909-5-ardb+git@google.com>
 <20250506154532.1281909-8-ardb+git@google.com>
 <CAHk-=whrcutH0LcMmaeJxxMeYpw2R5T80yoQAXbrRHNSTCB0Pw@mail.gmail.com>
 <CAMj1kXFSae=stazUv8doka-zLOnDdXXR4ASxHKe5f97ikg3V2A@mail.gmail.com>
 <CAHk-=whxP5Ywpv-U=2NPFhk929VHB9_kdp10+HFJQ4VxEGdX9A@mail.gmail.com>
 <CAMj1kXGwYXXpjPgDwjKMEZJkuGJ8ZuCpMpc7fTvo58PNtu-czA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXGwYXXpjPgDwjKMEZJkuGJ8ZuCpMpc7fTvo58PNtu-czA@mail.gmail.com>


* Ard Biesheuvel <ardb@kernel.org> wrote:

> > All of those change depending on
> > whether we do 5-level page tables or not, so the whole argument that
> > "pgtable_l5_enabled() is special" is just wrong to begin with.
> >
> 
> In my original patch, which is the one Ingo objected to, 
> pgtable_l5_enabled() is unambiguously based on whether CR4.LA57 is 
> set.

So I didn't really object to the simplification aspect - I was 
criticizing the current state of LA57 handling, regardless of your 
patch. In fact in that thread I supported the simplification aspect:

  > > Anyway, I'm not against Ard's simplification patch as a first step, and
  > > any optimizations can be layered on top of that.

But in hindsight I can see how my first reply came away as 
disagreement...

> In the light of the above, care to comment on the previous approach?
> 
> https://lore.kernel.org/all/20250504095230.2932860-28-ardb+git@google.com/
> 
> That also uses the ALTERNATIVE_TERNARY() so the CR4 access gets
> patched away, and I'm happy to take suggestions how to improve that.

I still think we should introduce a LA57_ENABLED synthethic cpufeature 
flag or so for the MM constants and all the late facilities, and go 
from there.

Thanks,

	Ingo
