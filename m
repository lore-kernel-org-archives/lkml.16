Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8051E5713
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 20:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745352311; cv=none; b=nZNG1XgKp7Cwrchokvgf66patjsj8udAyhSsbPpZM+65h0PutVSzAVpy7JjEJVs4fxtZz7qK6NKDS/wxg5xSxalfLD76p8JU3+wQA3C1O9eoC/fGiqkd6PBcf44gvWX/qpuz73OgS9tZpO51BjTZ8yD1VU9BmdA+okZ58CVXYBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745352311; c=relaxed/simple;
	bh=xFHQhHkKXvs05doAfsznQLayUhPlGSZPNuI+sXiMrXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lvF6h0ykZfvpz9/04cN9zhfFBedLM+CtcpY7yQdvtS7sIdva2EvfyfA/IKilWzKcSlaz+NmrdEnZE9PQkWnCxLKwcmiyM9EVueEdt1M6d/2uNIW5SQgSuDAZPQBF3LF/JSDnYpHAA9ZYncVoMFPckuIdXWIPl8H0kBBQdxDh9zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ospJAptx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ospJAptx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A759C4CEE9;
	Tue, 22 Apr 2025 20:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745352310;
	bh=xFHQhHkKXvs05doAfsznQLayUhPlGSZPNuI+sXiMrXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ospJAptxHxLUelU7Ly0iCMazWOKM2usET54Rrl/Mir4lKO9zH+WrNoZ3mflpejbCp
	 T5EeF/KE2bBmPPUPoXul9fGID5BxBMrW4hvVUKqYPkqdgoyqcMRu3UvajsqjHFnDkF
	 u6ipwsWH32CAoe9WPsxxTXrge5HgDF+SrY5FbcUs8PZ0E8tu5IExUlPq4xrMVBN/Op
	 w8HokUwSAORlCdDRUFMJeVlbn6DF8l1dGveW3puPIGQ9MxRTPb/vM2pIF095l+UJat
	 WX7+8KcBC+Da6JlWgaUiiH1YEm8o+EL+hyeIPFn/hKF+NWINyoKdurgcDgFleP50eD
	 nAr4yyPWyZoGQ==
Date: Tue, 22 Apr 2025 22:05:06 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org,
	linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v2] noinstr: Use asm_inline() in
 instrumentation_{begin,end}()
Message-ID: <aAf2crZau98tHFSn@gmail.com>
References: <165d2a0b882050f3f6cc0315af66cd2d16e5925b.1744676674.git.jpoimboe@kernel.org>
 <aAeFYB7E2QiRNeoM@gmail.com>
 <CAFULd4bo0NGzZGLEs+pYoOJrDVLyKt2=Piug-LtU-WhFGwYTzQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFULd4bo0NGzZGLEs+pYoOJrDVLyKt2=Piug-LtU-WhFGwYTzQ@mail.gmail.com>


* Uros Bizjak <ubizjak@gmail.com> wrote:

> > That still doesn't make it clear where the apparently ~10 
> > instructions per inlining come from, right?
> 
> The growth is actually from different inlining decisions, that cover 
> not only inlining of small functions, but other code blocks (hot vs. 
> cold, tail duplication, etc) too. The compiler uses certain 
> thresholds to estimate inlining gain (thresholds are different for 
> -Os and -O2). Artificially bloated functions that don't use 
> asm_inline() fall under this threshold (IOW, the inlining would 
> increase size too much), so they are not inlined; code blocks that 
> enclose unfixed asm clauses are treated differently than when they 
> use asm_inline() instead of asm(). When asm_inline() is introduced, 
> the size of the function (and consequently inlining gain) is 
> estimated more accurately, the estimated size is lower, so there is 
> more inlining happening.
> 
> I'd again remark that the code size is not the right metric when 
> compiling with -O2.

Understood, but still we somehow have to be able to measure whether the 
marking of these primitives with asm_inline() is beneficial in 
isolation - even if on a real build the noise of GCC's overall inlining 
decisions obscure the results - and may even reverse them.

Is there a way to coax GCC into a mode of build where such changes can 
be measured in a better fashion?

For example would setting -finline-limit=1000 or -finline-limit=10 (or 
some other well-chosen inlining threshold value, or tweaking any of the 
inliner parameters via --param values?), just for the sake of 
measurement, give us more representative .text size change values?

Because, ideally, if we do these decisions correctly at the asm() 
level, compilers will, eventually, after a few decades, catch up
and do the right thing as well. ;-)

Thanks,

	Ingo
