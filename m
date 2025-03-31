Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EF8221F36
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 15:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743434984; cv=none; b=Xnv4Yd/WZjgpeYdtpde8PUOEtezrWoKAX71jUf3FcBuxyRo9HQDRD9uNDXE1pkf4Os55zN+NwETKirxi7GacQiC+J4vcBa2QlRqISpZnVtJPA97dyBMJS6KRsQuki29FFCw1GM26oJluuwbk34gCHLzGgASJ+cP7sIHfE3goS9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743434984; c=relaxed/simple;
	bh=XM0Wc925oQpfnMZ9NmBW3Yp4tWILKrYUSzQLo6dbTfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FPSImPIW8NhaJeyjkNPL+osy2VRZLSCeiWsfdTF8PqvZAKiAXNmA08riz6mRA0IdPEIm7xsXiO56MgZf/6AU7FmSuru24Mvberm9rlY7qTYx2tJZOGMwwS7RlD/RT7www6dTxlYB6pqE22EmkwjRoRmwmY//jz0hWElj4RTyGkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YOOhWv42; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YOOhWv42"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0991C4CEE4;
	Mon, 31 Mar 2025 15:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743434983;
	bh=XM0Wc925oQpfnMZ9NmBW3Yp4tWILKrYUSzQLo6dbTfc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YOOhWv4246e6oyAX3ms6hyGviM1Gj2yAdIDaFZReABbW3lA0KGrqN7opB5OXmbrmN
	 ezhfdTCiSsAaFwMVcJLGkFo4K6lFp+/cQ7YC+IorvTKCzI2rL/xPv79mifMQmb1iaU
	 uZuA334G5tiVVRN3mArWpy8AeIy69MOhIwfSAOQIPL+LsAJgCqATGh2hHqHET9wUW/
	 6GYEs3krQdJrKYemWWqH0hiEqSz0z45BeyhC7Z9k5tnjcZTEWN/VMRVRmHUWFcD7WE
	 6e+KLdGtvNcGnb+epZkEJlf6gQfRt4Cq5xXgM/NtN/2ovT9D71e869hYB745WL0qtj
	 xbMv2dX/vdipA==
Date: Mon, 31 Mar 2025 08:29:41 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [GIT PULL] objtool fixes and updates
Message-ID: <reikdbyyvobo5vu2r4n55znptefmbcvcxoovrcenwatu32vo3e@nivvxsxwbvuk>
References: <Z-cSQXJKMyBSfAAc@gmail.com>
 <20250329153242.GAZ-gSmu8qiXufR04k@fat_crate.local>
 <CAHk-=wjqLm+eTuyLR_84vWOZK+AkhV==r=PcuAt3+3nf68SjOw@mail.gmail.com>
 <20250330231355.GFZ-nQM6NPcC7nWl__@fat_crate.local>
 <sdjfftubzcheo3dpejml54t6axfjfrd7pk6mnbkpb2n7alpfzn@6l6bldqfturq>
 <Z-piwUbLx-OitJrv@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z-piwUbLx-OitJrv@gmail.com>

On Mon, Mar 31, 2025 at 11:39:13AM +0200, Ingo Molnar wrote:
> I'm wondering why LKP didn't pick up the primary warning, only the 
> final warning that skips duplicate warnings, which is kinda totally 
> useless in isolation:

At least it alerted us to the other loongarch warnings we hadn't seen ;-)

>     `-- arch-loongarch-kernel-traps.o:warning:objtool:show_stack:skipping-duplicate-warning(s)
>
> Maybe we should just do what is below - output a single warning, a bit 
> like lockdep.

Yeah, "skipping duplicate warnings" isn't technically a warning so it
probably shouldn't be presented as one.

I'll just revert 0a7fb6f07e3a and go back to the simple "one warning per
function" which worked fine before.

-- 
Josh
