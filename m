Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AFC20D50C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 07:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744617429; cv=none; b=KVD6QQE4N1nqe81xbVqW8KZLGwhOfKpNALaY4SsFf5wa19rn+4LOS3qaw7bZ6LoaSm5+DjXpFTovLYoBURngg1I14laLRVbVlick9dbtD84RpNadV5iV2SwRLJb6+XwnbICx6IHAhQ2bWG++gzIjv5Py+/YzAUZvojjHYCJqmvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744617429; c=relaxed/simple;
	bh=OZcVLDBmdH3tfDJZDUmmMgYqN7UFiuEKdBpTP2SqbNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VtjujsUs5rxP/qmjwYRD2ZYWVb6QfdD9+Xvn8lbtOVEODX2NrecXaAogsv3IByOU2SNlK5swolQs408mGJ3ylYLN4Go8KpqCo5Z3A9FRUtrc1usXVr0GQjeY8cZkpmWU4BTalYXiscmBBbli/SpWGTV4WBBojWIabPrhfWJkqVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ipXG6X7l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ipXG6X7l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A481C4CEE2;
	Mon, 14 Apr 2025 07:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744617429;
	bh=OZcVLDBmdH3tfDJZDUmmMgYqN7UFiuEKdBpTP2SqbNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ipXG6X7lSOLoFlZEwRzC1/r6fCVCnizOv7NQFj4BCY7X3n28mlzRPjjoprTZe2hhq
	 33dSTszAG652rty3AbTjA1JS1BYftLayEwwrFJFZ+rG/GJSuSWPxHn4ZYGZsD9e37u
	 ZUxBNSFsds/yzm1dHKsEj9EReQorstI3BRrJR5pGH63UfF1XDALK8IyOPrtYlZ75ob
	 78wlsAtlq9c/xrzCYu2Tb2pahL/3kG+BNIVsyH2cinFEE3TygX0TN1F9H6IDOkNIF5
	 jw0Cb1H9AD2VBwz8TW5zbBe/R4kWYsN4n2PVxRzjVEoFtdOawKP808ZxVXrmr7boLp
	 7fWnBOCfunIsg==
Date: Mon, 14 Apr 2025 09:57:04 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: linux-kernel@vger.kernel.org, Paul Menzel <pmenzel@molgen.mpg.de>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH] genksyms: Handle typeof_unqual keyword and __seg_{fs,gs}
 qualifiers
Message-ID: <Z_y_0OXXn5v8Ngvr@gmail.com>
References: <20250413220749.270704-1-ubizjak@gmail.com>
 <Z_y3OIQECdVo6YJL@gmail.com>
 <CAFULd4Z=ErsRwzLvQ7yjqXG684UT5D07RoRqVPJhsEh4fxqqyQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFULd4Z=ErsRwzLvQ7yjqXG684UT5D07RoRqVPJhsEh4fxqqyQ@mail.gmail.com>


* Uros Bizjak <ubizjak@gmail.com> wrote:

> On Mon, Apr 14, 2025 at 9:20 AM Ingo Molnar <mingo@kernel.org> wrote:
> >
> >
> > * Uros Bizjak <ubizjak@gmail.com> wrote:
> >
> > > Handle typeof_unqual, __typeof_unqual and __typeof_unqual__ keywords
> > > using TYPEOF_KEYW token in the same way as typeof keyword.
> > >
> > > Also ignore x86 __seg_fs and __seg_gs named address space qualifiers
> > > using X86_SEG_KEYW token in the same way as const, volatile or
> > > restrict qualifiers.
> > >
> > > Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> > > Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
> > > Closes: https://lore.kernel.org/lkml/81a25a60-de78-43fb-b56a-131151e1c035@molgen.mpg.de/
> > > Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > Cc: Ingo Molnar <mingo@kernel.org>
> > > Cc: Borislav Petkov <bp@alien8.de>
> > > ---
> > >  scripts/genksyms/keywords.c | 7 +++++++
> > >  scripts/genksyms/parse.y    | 5 ++++-
> > >  2 files changed, 11 insertions(+), 1 deletion(-)
> >
> > Thanks, applied to tip:core/urgent.
> >
> > I've also added this tag for context:
> >
> >   Fixes: ac053946f5c4 ("compiler.h: introduce TYPEOF_UNQUAL() macro")
> 
> Heh, I intentionally removed it because the patch now fixes genksyms.

There's meritocratical value in generously accepting blame, even if you 
are only 10% to blame. ;-)

	Ingo
