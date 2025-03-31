Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E9521170D
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 16:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743437231; cv=none; b=bTFAmko1i9EyvbaTvYo1mY0/I+NvGBDF5jIoaPMy4nRYTS49R0jkWGlXVssqNEM9vpq7ysFFJDc29DGnFg2BG+IkkGf5A30x8lGjQunu7J/Y2Bs0Z8FOqZrgQb2EVza8H82rzaqDuw/mrPGcfkoFcfAY23GlVH9NJklAG+HJNjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743437231; c=relaxed/simple;
	bh=1IdX6lYLY25XiDpQmcnXRViGBkK4KP4zc6HhTX3eT4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nDZY3GGXYouZGNPrj2GDHA8rOAN6VL0keutdEH3RujiG9CL7khoqvavBrp7WuIcy8Km7lWRGtq0oxIZVdpKOZjbW3W72uT+NRhRbU9yzfoVeW3xt/BLVL6y59dhQJFMHa03Csybb4Z2v5x81tfVPyDVpWldNZVoM2Y9hfmBcVgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W2loaDyT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W2loaDyT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 204CEC4CEE3;
	Mon, 31 Mar 2025 16:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743437229;
	bh=1IdX6lYLY25XiDpQmcnXRViGBkK4KP4zc6HhTX3eT4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W2loaDyTnmW0rGqQH5R55d7duySP7bXyEgAAYjLFQB365Grhco/bZ2Op9FGzYgswd
	 R6PLgSyzTmKnOrOqEJYAD2+PyRQtJ3m2QD3863GhZGDVnoJNnS0WYf1y5Fne4y33vv
	 B137YFy/uF8GCeht89/Nm5ODU73KVMR9fy++HZUJqkkZ6DxjBiHjOo7U2lCISxby7Z
	 BrPjGXQDQgnl8i0+E6JrjLiXa/8SuoT1VcDYhkX2dFjoO0KnvqjKtmEtgU++22E1Yq
	 w1pqXQeLUkNSifdW8yw1Milg9UTlQC32k6yJk8stHmGqmMRSoA38hC7/6WYFukPFCG
	 HkI85HlEBtvxA==
Date: Mon, 31 Mar 2025 18:07:05 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [GIT PULL] objtool fixes and updates
Message-ID: <Z-q9qbTGxNGICG4c@gmail.com>
References: <Z-cSQXJKMyBSfAAc@gmail.com>
 <20250329153242.GAZ-gSmu8qiXufR04k@fat_crate.local>
 <CAHk-=wjqLm+eTuyLR_84vWOZK+AkhV==r=PcuAt3+3nf68SjOw@mail.gmail.com>
 <20250330231355.GFZ-nQM6NPcC7nWl__@fat_crate.local>
 <sdjfftubzcheo3dpejml54t6axfjfrd7pk6mnbkpb2n7alpfzn@6l6bldqfturq>
 <Z-piwUbLx-OitJrv@gmail.com>
 <reikdbyyvobo5vu2r4n55znptefmbcvcxoovrcenwatu32vo3e@nivvxsxwbvuk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <reikdbyyvobo5vu2r4n55znptefmbcvcxoovrcenwatu32vo3e@nivvxsxwbvuk>


* Josh Poimboeuf <jpoimboe@kernel.org> wrote:

> On Mon, Mar 31, 2025 at 11:39:13AM +0200, Ingo Molnar wrote:
> > I'm wondering why LKP didn't pick up the primary warning, only the 
> > final warning that skips duplicate warnings, which is kinda totally 
> > useless in isolation:
> 
> At least it alerted us to the other loongarch warnings we hadn't seen ;-)

There's that :-)

> >     `-- arch-loongarch-kernel-traps.o:warning:objtool:show_stack:skipping-duplicate-warning(s)
> >
> > Maybe we should just do what is below - output a single warning, a bit 
> > like lockdep.
> 
> Yeah, "skipping duplicate warnings" isn't technically a warning so it 
> probably shouldn't be presented as one.
> 
> I'll just revert 0a7fb6f07e3a and go back to the simple "one warning 
> per function" which worked fine before.

Thanks! Our experience with lockdep is that the fewer warnings per 
build/bootup, the better: the value of secondary warnings is 
diminishing, sometimes even negative.

It might even be OK to generate just one objtool warning per .o file.

	Ingo
