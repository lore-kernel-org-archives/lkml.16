Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0460A24DFE8
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 15:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743693838; cv=none; b=d3ocaCQw9n9UiCgnvVnUvf49vykMP8uiJTV/VZQqGOdToD4FF3FHynwiEOoQ6M1bnyP6+I49ReWhGxpfMuhTEPaYwkdxgavWLV4Rq09f8v7X8BmKtgrywnGaJeYZ78c/jOYT+0/Zol7he0ETpTM0eJoOgveC29oOvn0hSyEEM40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743693838; c=relaxed/simple;
	bh=FwPJ05FEjAEAzaLtaR5ofcrqsKm8ladih0D+8Gw5DKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nljiLE46ONhgc+O4C7YEfz/ukpjjTwTK0TetQkT2XHD1so1oYvEybsAOwbe950aTUD75DT551TD2EXSARwEMxirPhMc17k6hd9TLDXUnxr/tgqVQCRlSOTc2y3x2+lfOVaT8ujsR7xo1eUjhbpJRahWAeOg1reqtAHQlGswNapM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FyXAuIH7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FyXAuIH7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFB1AC4CEE5;
	Thu,  3 Apr 2025 15:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743693837;
	bh=FwPJ05FEjAEAzaLtaR5ofcrqsKm8ladih0D+8Gw5DKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FyXAuIH7io2hsm2RAVujgeUJO35VVLkxq80b9YVWKAZqAImJHGNvfFIR7BMz8kRVQ
	 gbLsKaWAVUY1teDQvey+CTYjY2k3ez8oLnrmAv9kcJtscWVofLwonJCTwIu2vhoYLM
	 MHVVFcTDbd37iSjMgfAhm6jHtcYtbh63ib8PwHQUVoRL7y1ZcKV8RC9Hv8lqbDsWOe
	 fp94C4h8nHl/vntQ8DPSrgwqSbbhzLHgImbG/VP4oKAUqDHGT6rek0Vyu055Gz1zz+
	 W6UYXNRX2RX9AZxNwWRu/LF2rbVwOJMpk6ncY/eQk5KKISr6L8esRGUtmYUe+RCnTV
	 mak9QpUOVaAlA==
Date: Thu, 3 Apr 2025 08:23:55 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [GIT PULL] objtool fixes
Message-ID: <aanudixqjhm7asrp5tzsx5vc7pctei5bskdhdxk5up2g6gvqbz@z7owxfn6krgt>
References: <Z-xFKa5hiQ5urVwS@gmail.com>
 <CAHk-=wgqa0B9OV+EAQ34-VOUAeVB2o2bXnZXQDG7u+Z=4Cmw8w@mail.gmail.com>
 <n7p2rtrq6vvfteu5szlubng4wj6akgn45suekjdxojrpuxr6dp@oxjfxawkv3xs>
 <Z-6gyQk2WlHc4DNw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z-6gyQk2WlHc4DNw@gmail.com>

On Thu, Apr 03, 2025 at 04:52:57PM +0200, Ingo Molnar wrote:
>     +# ./arch/x86/include/asm/smap.h:35: 	alternative(ANNOTATE_IGNORE_ALTERNATIVE "", "stac", X86_FEATURE_SMAP);
>      #APP
>      # 35 "./arch/x86/include/asm/smap.h" 1
>      	# ALT: oldinstr
>      771:
>     +	911:
>     +	.pushsection .discard.annotate_insn,"M",@progbits,8
>     +	.long 911b - .
>     +	.long 6
>     +	.popsection
>      	
>      772:
>      # ALT: padding
>     @@ -140,10 +145,15 @@ copy_from_user_nmi:
>       .popsection
>      
>      # 0 "" 2
>     -# ./arch/x86/include/asm/smap.h:29: 	alternative("", "clac", X86_FEATURE_SMAP);
>     +# ./arch/x86/include/asm/smap.h:29: 	alternative(ANNOTATE_IGNORE_ALTERNATIVE "", "clac", X86_FEATURE_SMAP);
>      # 29 "./arch/x86/include/asm/smap.h" 1
>      	# ALT: oldinstr
>      771:
>     +	911:
>     +	.pushsection .discard.annotate_insn,"M",@progbits,8
>     +	.long 911b - .
>     +	.long 6
>     +	.popsection
>      	
>      772:
>      # ALT: padding
> 
> Is there a way to make this more compact, more readable?

Put it all one line?  I'm open to ideas :-)

> Or if not, we just have to do the more fragile thing I suspect?
> It's a tool after all.

Objtool is an integral part of the kernel.  Making it more fragile and
less maintainable has the same effect on the kernel itself.

In fact we need the toolchain to be *more* reliable than the kernel.
Otherwise problems multiply, and kernel quality goes down the tubes.

And I would rather spend time fixing actual kernel bugs than chasing
down random nonsensical warnings.

Sure, ideally the .s file would be pretty, but not at the expense of
actual robustness and functionality... Honestly I had to double check it
wasn't April 1.

-- 
Josh
