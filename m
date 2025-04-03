Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3C9250BED
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 14:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743691982; cv=none; b=KuA+lgApwyO7a4d9Xt+EIgJ7gZb4fyZPgm5ggQMMtpi2fZYogl6Qj849DxeVRpM7gUssAKESb11ASttFLeTY0JHj9vYHtV0G+Ty2uvMaJ+f1Z9eQnpsMOLyHeQeyoAtfuLLmKE5JD6xrFplkSFIhLhnk2dJnH2SRBKUILy3ABFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743691982; c=relaxed/simple;
	bh=TwxUKv0HjQmyu3PqtYqNXw8LFD8vSrsVj95vtFrImdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n0yATq+7Oy91NOuIy95w35Oz6LZGj95avf0PqYQ/LygS+F8MYPCcANtM3xhL2FCXsSWUGpLZGQlFsvsRANwlmxoqL35YkCDtKC/SdIxn+EsgF9SnMjebK1QMk1YrWvrE4K4X++reevqk+8a48AFjjpyBCq7Rai4JDK/02FQI49Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O0gHZaz5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O0gHZaz5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48C90C4CEE7;
	Thu,  3 Apr 2025 14:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743691982;
	bh=TwxUKv0HjQmyu3PqtYqNXw8LFD8vSrsVj95vtFrImdg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O0gHZaz5RJkepwcCv/17xhxTUbixLwVPI1eHcclWmq2YJeuexK3rEqEimHcn0NRhP
	 2cS7JVLZ9QqCzY+OZWuRsMtPJ9lnjM+/v7SGQC7e39u/LYVNQV9DKI+2WH872GB/9w
	 04Qca2vyBzAfQBzM7NVwxdIQcwBqwVjR3W+pU3xDNXA0u27BCnq/36ECH/ikkleuGe
	 qdl/dJeVJ3w1CYg9cYd+i49b+VGLFY6aCT2rJKWhnfRDI15yfh+79XGPgyi3k7/Ayh
	 RdzgxYQjb0MJVyTt7Wdn86Q/b41sDg2kako3Y/g4H6z8klRiZ3Rq8RH5Jx6uwVIFHu
	 MAgMNxurcghhA==
Date: Thu, 3 Apr 2025 16:52:57 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	Peter Zijlstra <a.p.zijlstra@chello.nl>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [GIT PULL] objtool fixes
Message-ID: <Z-6gyQk2WlHc4DNw@gmail.com>
References: <Z-xFKa5hiQ5urVwS@gmail.com>
 <CAHk-=wgqa0B9OV+EAQ34-VOUAeVB2o2bXnZXQDG7u+Z=4Cmw8w@mail.gmail.com>
 <n7p2rtrq6vvfteu5szlubng4wj6akgn45suekjdxojrpuxr6dp@oxjfxawkv3xs>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <n7p2rtrq6vvfteu5szlubng4wj6akgn45suekjdxojrpuxr6dp@oxjfxawkv3xs>


* Josh Poimboeuf <jpoimboe@kernel.org> wrote:

> On Wed, Apr 02, 2025 at 10:58:15AM -0700, Linus Torvalds wrote:

> > Apparently nobody else ever looks at generated code, but dammit, the
> > clac/stac code generation has turned the ugly up to 11.

BTW., I do look at generated code, and I know others do too, but at the 
.o most of the time, not at the .s code, via two ways:

      1) objdump --disassemble-all .o
    
      2) perf top's live kernel function annotation and disassembler 
         feature that uses /dev/mem. (While turning off KASLR, 
         ptr-obfuscation, turning perf_event_paranoid up to 11^H -1, 
         etc.)

Such output is more readable to me:

   # [ __memmove_avx_unaligned_erms annotated screen: ]

   0.00  1ea:   vzeroupper      
              ← retq            
                nop             
         1f0:   testq      %rcx,%rcx
              ↑ je         1ea  
         1f5:   vmovdqu    0x20(%rsi), %ymm5
                vmovdqu    0x40(%rsi), %ymm6
                leaq       -0x81(%rdi,%rdx),%rcx
                vmovdqu    0x60(%rsi), %ymm7
                vmovdqu    -0x20(%rsi,%rdx), %ymm8
                subq       %rdi,%rsi
                andq       $-0x20,%rcx
                addq       %rcx,%rsi
                nop             
   5.87  220:   vmovdqu    0x60(%rsi), %ymm1
   8.09         vmovdqu    0x40(%rsi), %ymm2
  10.34         vmovdqu    0x20(%rsi), %ymm3
  11.29         vmovdqu    (%rsi), %ymm4
  13.45         addq       $-0x80,%rsi
  13.47         vmovdqa    %ymm1,0x60(%rcx)
  11.26         vmovdqa    %ymm2,0x40(%rcx)
   9.16         vmovdqa    %ymm3,0x20(%rcx)
   7.45         vmovdqa    %ymm4,(%rcx)
   4.98         addq       $-0x80,%rcx
   4.57         cmpq       %rcx,%rdi
              ↑ jb         220  
                vmovdqu    %ymm0, (%rdi)
                vmovdqu    %ymm5, 0x20(%rdi)
                vmovdqu    %ymm6, 0x40(%rdi)
                vmovdqu    %ymm7, 0x60(%rdi)
                vmovdqu    %ymm8, -0x20(%rdx,%rdi)
                vzeroupper      
              ← retq            
                nop             
                nop             

( and the 'P' key within perf-top will print this out into the separate
  __memmove_avx_unaligned_erms.annotation for editor based inspection.   )

because:
    
     - this kind of disassembler output is more standardized, 
       regardless of compiler used,
    
     - it's generally less messy looking,
    
     - it gives ground-truth instead of being some intermediate layer
       in the toolchain that might or might not be the real deal,

     - it shows alignment and the various other effects linkers may 
       apply,

     - there's profiling data overlaid if it's a perf top run,

     - and on a live kernel it also sees through the kernel's various
       layers of runtime patching code obfuscation facilities, also
       known as: alternative-instructions, tracepoints and jump labels.

The compiler's .s is really a last-ditch way to look at generated 
machine code, for me at least.

> >
> > Yes, the altinstruction replacement thing was already making the
> > generated asm hard to read, but now it's *also* adding this garbage to
> > it:
> >
> >         911:
> >         .pushsection .discard.annotate_insn,"M",@progbits,8
> >         .long 911b - .
> >         .long 6
> >         .popsection
> > 
> > which is just pure unadulterated pointless noise.
> > 
> > That "annotation #6" is WORTHLESS.
> > 
> > Dammit, objtool could have figured that annotation out ON ITS OWN
> > without generating shit in our code. It's not like it doesn't already
> > look at alternatives, and it's not like it couldn't just have seen
> > "oh, look, it's a nop instruction with a clac/stac instruction as an
> > alternative".
> 
> Ugh, fragile hard-coded special cases like that are exactly what we're
> trying to get away from.  They make the code unmaintainable and they end
> up triggering false positives, just like the one fixed by that patch in
> the first place.

So the problem is, by reducing objtool complexity a bit:

   # 1154bbd326de objtool: Fix X86_FEATURE_SMAP alternative handling

   8 files changed, 37 insertions(+), 89 deletions(-)

and fixing these two false positive warnings where the 'objtool looks 
at the alternatives code' heuristics failed:

  arch/x86/mm/fault.o: warning: objtool: do_user_addr_fault+0x8ec: __stack_chk_fail() missing __noreturn in .c/.h or NORETURN() in noreturns.h
  arch/x86/mm/fault.o: warning: objtool: do_user_addr_fault+0x8f1: unreachable instruction

... we have now uglified the kernel's .s asm output space for all 
affected stac()/clac() using functions:

    starship:~/tip> diff -up usercopy.s.before usercopy.s.after
    --- usercopy.s.before	2025-04-03 16:33:07.286944538 +0200
    +++ usercopy.s.after	2025-04-03 16:32:41.770041092 +0200
    @@ -78,11 +78,16 @@ copy_from_user_nmi:
     # ./include/linux/uaccess.h:244: 	current->pagefault_disabled++;
     	addl	$1, 2748(%rdx)	#, _25->pagefault_disabled
     # ./include/linux/uaccess.h:266: 	barrier();
    -# ./arch/x86/include/asm/smap.h:35: 	alternative("", "stac", X86_FEATURE_SMAP);
    +# ./arch/x86/include/asm/smap.h:35: 	alternative(ANNOTATE_IGNORE_ALTERNATIVE "", "stac", X86_FEATURE_SMAP);
     #APP
     # 35 "./arch/x86/include/asm/smap.h" 1
     	# ALT: oldinstr
     771:
    +	911:
    +	.pushsection .discard.annotate_insn,"M",@progbits,8
    +	.long 911b - .
    +	.long 6
    +	.popsection
     	
     772:
     # ALT: padding
    @@ -140,10 +145,15 @@ copy_from_user_nmi:
      .popsection
     
     # 0 "" 2
    -# ./arch/x86/include/asm/smap.h:29: 	alternative("", "clac", X86_FEATURE_SMAP);
    +# ./arch/x86/include/asm/smap.h:29: 	alternative(ANNOTATE_IGNORE_ALTERNATIVE "", "clac", X86_FEATURE_SMAP);
     # 29 "./arch/x86/include/asm/smap.h" 1
     	# ALT: oldinstr
     771:
    +	911:
    +	.pushsection .discard.annotate_insn,"M",@progbits,8
    +	.long 911b - .
    +	.long 6
    +	.popsection
     	
     772:
     # ALT: padding

Is there a way to make this more compact, more readable?

Or if not, we just have to do the more fragile thing I suspect?
It's a tool after all.

Thanks,

	Ingo
