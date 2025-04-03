Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABD724EF7E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 15:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743694398; cv=none; b=iMn+Yd/+RIoogO5wzDiw0z9oCVx30MK+Yj+wFtEmM4y9Sz4/bsXyj5QBLO062jpA+CHGavg71AZykNzTyrIVQQqm++gon0tYzeiPh3XBCOZAY4O2WgMBxhx14/MzFsgu4pBnlxSaQAAZZqJkYUDE5GG9Hy1VYiHXURtXbwxYq/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743694398; c=relaxed/simple;
	bh=ufjUDM89RawRCNzrV+LPJbRRqemTtPTO/ze4aF8X8zA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PprAOW85coKEiKNVDW0djnRu4180oi+36jg//MD+pZB2pQQm83EzXOtxAKbncdnzfHPoo8zR6dHPZwIxRzgEIWkySzPWzfeiJXZyRP5MxjaoiHolIEXz4qzZ1FQmBOxwrihDtYUSTePo4Yt6Eb5YnXTnpygPdrr8Kr0Mhxazq5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aTwoc6uq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aTwoc6uq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF3C9C4CEE3;
	Thu,  3 Apr 2025 15:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743694397;
	bh=ufjUDM89RawRCNzrV+LPJbRRqemTtPTO/ze4aF8X8zA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aTwoc6uqJ7IztpPnBZyEj4bH4c63rfWvyvcYpRSxySu7jiUl1f9cixO2j2yzdDa6R
	 ICWJoLvpHHZLr/rYioyXtUd+/24FSSDjXFSUJMhMbhlVAdo3mh2kf1SN4j659VVU33
	 cqpJJX7CME2VFGisyAFATyvu9COBg9o/ItAHV6BtEi2Wme1I2rH6l7xO4Q6zyKBQ7X
	 CiM+OMY8KgXpwXe/6LrbDO8SpWQtYhT+HtXrV7dE0myEYd9oqPFq2jSnhG3KOPS1PD
	 cYqT8C2nUKnN33uJvx3tCYI+nM9GfXWyw5QGKYNzmIR2epGTuB+3XL0XYULB33X37n
	 m/D9I8A1jGkOw==
Date: Thu, 3 Apr 2025 17:33:13 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	Peter Zijlstra <a.p.zijlstra@chello.nl>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [GIT PULL] objtool fixes
Message-ID: <Z-6qOYmsBDw8xN4E@gmail.com>
References: <Z-xFKa5hiQ5urVwS@gmail.com>
 <CAHk-=wgqa0B9OV+EAQ34-VOUAeVB2o2bXnZXQDG7u+Z=4Cmw8w@mail.gmail.com>
 <n7p2rtrq6vvfteu5szlubng4wj6akgn45suekjdxojrpuxr6dp@oxjfxawkv3xs>
 <Z-6gyQk2WlHc4DNw@gmail.com>
 <aanudixqjhm7asrp5tzsx5vc7pctei5bskdhdxk5up2g6gvqbz@z7owxfn6krgt>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aanudixqjhm7asrp5tzsx5vc7pctei5bskdhdxk5up2g6gvqbz@z7owxfn6krgt>


* Josh Poimboeuf <jpoimboe@kernel.org> wrote:

> On Thu, Apr 03, 2025 at 04:52:57PM +0200, Ingo Molnar wrote:
> >     +# ./arch/x86/include/asm/smap.h:35: 	alternative(ANNOTATE_IGNORE_ALTERNATIVE "", "stac", X86_FEATURE_SMAP);
> >      #APP
> >      # 35 "./arch/x86/include/asm/smap.h" 1
> >      	# ALT: oldinstr
> >      771:
> >     +	911:
> >     +	.pushsection .discard.annotate_insn,"M",@progbits,8
> >     +	.long 911b - .
> >     +	.long 6
> >     +	.popsection
> >      	
> >      772:
> >      # ALT: padding
> >     @@ -140,10 +145,15 @@ copy_from_user_nmi:
> >       .popsection
> >      
> >      # 0 "" 2
> >     -# ./arch/x86/include/asm/smap.h:29: 	alternative("", "clac", X86_FEATURE_SMAP);
> >     +# ./arch/x86/include/asm/smap.h:29: 	alternative(ANNOTATE_IGNORE_ALTERNATIVE "", "clac", X86_FEATURE_SMAP);
> >      # 29 "./arch/x86/include/asm/smap.h" 1
> >      	# ALT: oldinstr
> >      771:
> >     +	911:
> >     +	.pushsection .discard.annotate_insn,"M",@progbits,8
> >     +	.long 911b - .
> >     +	.long 6
> >     +	.popsection
> >      	
> >      772:
> >      # ALT: padding
> > 
> > Is there a way to make this more compact, more readable?
> 
> Put it all one line?  I'm open to ideas :-)

I suppose there's no way to make the '6' a bit less magic at this 
point, we are post-processed already. :-/

Thanks,

	Ingo
