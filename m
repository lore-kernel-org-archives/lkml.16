Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047762500C9
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 18:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743704671; cv=none; b=L4iRkEuYfR4AexYT276eDOOVjrOfXWNB4smcvFYD9rVq97RaMqk3qgh0DRY3pwu32McNrNL4n+ptrkQjozQk4WxI1duSKhQ4pUy8VeDyxvNv/ELbppBt5BpeCHSp2yBl5IUVnOIsOuPr74Yqzrz44JQ1d4QOIbWy5FUCc8Xdwgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743704671; c=relaxed/simple;
	bh=eKiNBl3hKX5kOYhzinZRwSz9lxBXiMmK0OZVHt0k04U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UZChm1OkJOCeywyXVdOG4uqk4Wwv9z1zqJNWonjB85NZzBctjQaY46oto/jIfg5nOwu3FPqyQX2P/v+d0iyPf7Z7QkntcbF1ssoOvlqgApb/BUFdHRJBOjd4APEIfxNb0MRR8kmFcabNlJ7JXi4gIw5R8/FgoMMRZorBqNYnM3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k2/umCRJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k2/umCRJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 274DDC4CEE3;
	Thu,  3 Apr 2025 18:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743704670;
	bh=eKiNBl3hKX5kOYhzinZRwSz9lxBXiMmK0OZVHt0k04U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k2/umCRJw7vfMclLbjDY8HJI5z14nIbheSPfTy9BvZLcBMmG5VCfCyQ1YH7CcrjFz
	 IB9HDBfzJTpoWBGat2l3oIzQNwxSHPfqr6YOgw5s/N1Dg7URuXBeks+EJW07VS+npx
	 FEaNT4ukb2/VQ4QShqxXboAmMZ+eqCDRJghFy09Adpmq7mGSCgjlK6r9mRXh1exfg3
	 fjlKNleJuYc065sqDTIaB1iSieMUQ3ocpksat14VBHejvSiI43vOD08+3AF4tEUqa7
	 pA/KsIKao+woY1DzRkxbNrCmb9ti8rGHlQ6gjpRnmR01R0RSfIlHdsIyefj6d60nfM
	 xc6RSaa7+941A==
Date: Thu, 3 Apr 2025 11:24:28 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org, 
	Peter Zijlstra <a.p.zijlstra@chello.nl>, Thomas Gleixner <tglx@linutronix.de>, 
	Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [GIT PULL] objtool fixes
Message-ID: <mp26sywwsgekejs7fvsjhym3zunh4y42z2mkw5txi37dolas3l@zup3ny7bceaw>
References: <Z-xFKa5hiQ5urVwS@gmail.com>
 <CAHk-=wgqa0B9OV+EAQ34-VOUAeVB2o2bXnZXQDG7u+Z=4Cmw8w@mail.gmail.com>
 <n7p2rtrq6vvfteu5szlubng4wj6akgn45suekjdxojrpuxr6dp@oxjfxawkv3xs>
 <Z-6gyQk2WlHc4DNw@gmail.com>
 <aanudixqjhm7asrp5tzsx5vc7pctei5bskdhdxk5up2g6gvqbz@z7owxfn6krgt>
 <sqn3nlc6q26h5dnwnrsikg3mthxv4o7litoilsgufq4sdhcfqd@hp4goo43hdof>
 <CAHk-=wh2WtMskQ7ASnDJ_n0ZJs4hueEXsurwQpEvzmx-aZKFag@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wh2WtMskQ7ASnDJ_n0ZJs4hueEXsurwQpEvzmx-aZKFag@mail.gmail.com>

On Thu, Apr 03, 2025 at 09:06:11AM -0700, Linus Torvalds wrote:
> Josh, what's wrong with just disassembling the damn instruction?
> 
> It's what objtool does.
> 
> By all means add annotations for when the kernel does something
> *special*, and the annotation is "this violates the usual rules".
> Those kinds of annotations make perfect sense, and are a "don't
> complain about this, because I know I'm doing something odd".
> 
> So annotations for things like non-standard stack frames etc are a good thing.
> 
> But dammit, clac/stac is *not* that. Quite the reverse. clac/stac *is*
> the usual rule. clac/stac *is* the annotation.

There's also smap_save() / smap_restore().  For the latter we'd need to
look for alternatives with "push reg; popf", which is definitely not
SMAP-specific.  So we'd need to start reading feature bits again, which
ends up even worse than what we had before.

I still don't see what's wrong with something like this:

  # OBJTOOL (IGNORE_ALTERNATIVE)
  911: .pushsection .discard.annotate_insn,"M",@progbits,8; .long 911b - .; .long 6; .popsection

Now compare that with an alternative:

# ./arch/x86/include/asm/cpufeature.h:101: 	asm goto(ALTERNATIVE_TERNARY("jmp 6f", %c[feature], "", "jmp %l[t_no]")
#APP
# 101 "./arch/x86/include/asm/cpufeature.h" 1
	# ALT: oldinstr
771:
	# ALT: oldinstr
771:
	jmp 6f
772:
# ALT: padding
.skip -(((775f-774f)-(772b-771b)) > 0) * ((775f-774f)-(772b-771b)),0x90
773:
.pushsection .altinstructions,"a"
 .long 771b - .
 .long 774f - .
 .4byte ( 3*32+21)
 .byte 773b-771b
 .byte 775f-774f
.popsection
.pushsection .altinstr_replacement, "ax"
# ALT: replacement
774:
	jmp .L250	#
775:
.popsection

772:
# ALT: padding
.skip -(((775f-774f)-(772b-771b)) > 0) * ((775f-774f)-(772b-771b)),0x90
773:
.pushsection .altinstructions,"a"
 .long 771b - .
 .long 774f - .
 .4byte 516	#
 .byte 773b-771b
 .byte 775f-774f
.popsection
.pushsection .altinstr_replacement, "ax"
# ALT: replacement
774:
	
775:
.popsection
.pushsection .altinstr_aux,"ax"
6:
 testb $16, boot_cpu_data+112(%rip)	#,
 jnz .L249	#
 jmp .L250	#
.popsection

# 0 "" 2
#NO_APP

-- 
Josh
