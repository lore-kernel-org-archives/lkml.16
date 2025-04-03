Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E6418DB36
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 15:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743694999; cv=none; b=VSvD0VJssHUa3U+U19EZgAYhGSC73KeOFt5nlpgX4tqO6z3HUQiTs0zDCQ4wSIgEcqS5sWkUuDybsjCp5hExTMr8NOiVy5ouNFUgj8X37cgcOREUH8BoNdLCf+Av6YyUMsWWHfv5/tL2ax4zJgcsku6QF+y6Zu973zYA9Ri++bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743694999; c=relaxed/simple;
	bh=jWXYSPl/hm/GgZxHfKImAu4/3Wuad5jHrqPKz4QxS1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tXBHTtEYeGZeidoBOpHLtyMrJfLqQO3sz2qsm+eDlcEXh6lwlfrMBYF7YE8n8qvZ5G00BQjHXfs1PZ6C9cPuWEjMwbUmQA/88K1/SvDjTPoy7K+NXBIgaoMn7Dl9zk43K4vc/MQUzjvpy2JCuEUCYHwJFMS1DtGGx3HdnOZ8OkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cemFjweE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cemFjweE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07DEEC4CEE3;
	Thu,  3 Apr 2025 15:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743694998;
	bh=jWXYSPl/hm/GgZxHfKImAu4/3Wuad5jHrqPKz4QxS1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cemFjweEG9Fx/2yqM7JsiiimpAPM0qbdY/XTkm4/iuu07IwlTFv1ZqYDwa8+BS7I9
	 ghqVAEd4q99jL+M5O5/hb2pNpZRZr2u1aLKbaOSmjCX41vyxBjHPUyw4y8lrl1CZ+f
	 AnZLuYef3UOQVRJOWeVTa5LVpLZ4T3KHWwEhd/HTCwhFqKskDzoFHk7D27VRjn7wdP
	 OyHu3N0gSzs1tzo0eegJpAhxx3icQkffbe4b9wz66rlqfUB7J+j/OVZNRG6I8ZLndP
	 W7n9uJGklNQOUWSKDgqhWi72qJKzdIrFs2B7ozwrIVHoyG6GVeUaIws9u2QGwxxC0r
	 3F254KXU1RyPQ==
Date: Thu, 3 Apr 2025 08:43:16 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [GIT PULL] objtool fixes
Message-ID: <sqn3nlc6q26h5dnwnrsikg3mthxv4o7litoilsgufq4sdhcfqd@hp4goo43hdof>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aanudixqjhm7asrp5tzsx5vc7pctei5bskdhdxk5up2g6gvqbz@z7owxfn6krgt>

On Thu, Apr 03, 2025 at 08:23:55AM -0700, Josh Poimboeuf wrote:
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

How about adding a comment and making it one line like so?

# OBJTOOL ANNOTATION
911: .pushsection .discard.annotate_insn,"M",@progbits,8; .long 911b - .; .long 6; .popsection

-- 
Josh
