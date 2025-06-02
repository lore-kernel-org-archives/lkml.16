Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14DD2C3253;
	Mon,  2 Jun 2025 19:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748893043; cv=none; b=Uj6f9r3DayaFBHkkTiUxtVoGQ96GsA+XFJIfNtl8vPJQCJerl1AN3m+HWrqAEvFUmN3ow84DnBhFcDRw5u2F+ALN2eSghAThgt+4MFZ50t/Es8STQpyNPE3Y4cSL9Jw5loouU/p9gkuC4aXsa+TjhsIA60ogpp3GDORN2vRd6pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748893043; c=relaxed/simple;
	bh=XyBUMdc8BNgiW/6GsAohYe2BT+yj7XsDCeo0Ex9PN1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=usW9MFNy5OkQa8vX8NzuImI1DBwhooX+lsAW4uaZPhJKT8PpEfZu77eYCLTcXOtOaOwJppPtlHrik6pfW2D87fVOTJuetW/WrKriSutMehp3f63NZxHSRKbphesxXOwGzEAXecol5U3HopCoYJbo9/E/2gDChXQOv177/PJt8ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xoeu36Q0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xoeu36Q0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1107C4CEEB;
	Mon,  2 Jun 2025 19:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748893043;
	bh=XyBUMdc8BNgiW/6GsAohYe2BT+yj7XsDCeo0Ex9PN1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xoeu36Q0WQdCvy2wAxU5k22bfDSzMz30EG8Q4P5fqDF14gC3i6XakT0uIZFA+BEwn
	 x2LfgtgIPzlTLv9t1CzVlM1iyb3+q7DY/9591Kk/uYGZ1hCGUpVxsjG3GUvHotZRH5
	 Wy81BNPvj1GOpD1CICkhfrvcAgBPAcxqkcyybrVmv5pKuyHk+5oSYAlaTceFGCE42F
	 ZN4Hz6xP4z0Qs6riXnTciiP7nYGLM6fyfO4mTbE8qkLp5qyFb4hWTfhs2qTVzwUXCF
	 Y2Cc/Arjb/pw12pLvphNWwGjfO8kSO68hF6o4Pi+QHPK9Ix6RKRdLpnzFTxXsuDm5h
	 JFBUvwe45XllQ==
Date: Mon, 2 Jun 2025 12:37:18 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG?] clang miscompilation of inline ASM with overlapping
 input/output registers
Message-ID: <20250602193718.GA915101@ax162>
References: <20250602102825-42aa84f0-23f1-4d10-89fc-e8bbaffd291a@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250602102825-42aa84f0-23f1-4d10-89fc-e8bbaffd291a@linutronix.de>

Hi Thomas,

On Mon, Jun 02, 2025 at 10:29:30AM +0200, Thomas Weißschuh wrote:
> I observed a surprising behavior of clang around inline assembly and register
> variables, differing from GCC.
> 
> Consider the following snippet:
> 
> 	$ cat repro.c
> 	int main(void)
> 	{
> 		register long in asm("eax");
> 		register long out asm("eax");
> 
> 		in = 0;
> 		asm volatile("nop" : "+r" (out) : "r" (in));
> 
> 		return out;
> 	}
> 
> The relevant part is that the inline ASM has input and output register
> variables both using the same register and the input one is assigned to.
> 
> 
> Compile with clang (19.1.7, tested on godbolt.org with trunk):
> 
> 	$ clang -O2 repro.c
> 	$ llvm-objdump --disassemble-symbols=main a.out
> 	0000000000001120 <main>:
> 	    1120: 90                           	nop
> 	    1121: c3                           	retq
> 
> The store of the variable "in" has been optimized away.
> 
> 
> Compile with gcc (15.1.1, also tested on godbolt.org with trunk):
> 
> 	$ gcc -O2 repro.c
> 	$ llvm-objdump --disassemble-symbols=main a.out
> 	0000000000001020 <main>:
> 	    1020: 31 c0                        	xorl	%eax, %eax
> 	    1022: 90                           	nop
> 	    1023: c3                           	retq
> 	    1024: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
> 	    102e: 66 90                        	nop
> 
> The store to "eax" is preserved.
> 
> 
> As far as I can see gcc is correct here. As the variable is used as an input to
> ASM the compiler can not optimize away.
> On other architectures the same effect can be observed.
> 
> 
> The real kernel example for this issue is in the loongarch vDSO code from
> arch/loongarch/include/asm/vdso/gettimeofday.h:
> 
> 	static __always_inline long clock_gettime_fallback(
> 						clockid_t _clkid,
> 						struct __kernel_timespec *_ts)
> 	{
> 		register clockid_t clkid asm("a0") = _clkid;
> 		register struct __kernel_timespec *ts asm("a1") = _ts;
> 		register long nr asm("a7") = __NR_clock_gettime;
> 		register long ret asm("a0");
> 
> 		asm volatile(
> 		"       syscall 0\n"
> 		: "+r" (ret)
> 		: "r" (nr), "r" (clkid), "r" (ts)
> 		: "$t0", "$t1", "$t2", "$t3", "$t4", "$t5", "$t6", "$t7",
> 		 "$t8", "memory");
> 
> 		return ret;
> 	}
> 
> Here both "clkid" and "ret" are stored in "a0". I can't point to the concrete
> disassembly here because it is inlined into a much larger block of code
> and removing the inlining hides the bug.
> Also in my tests the bug only manifests for "_clkid" in the interval [16, 23].
> Other values work by chance.
> Removing the aliasing by dropping "ret" and using "clkid" for both input and
> output produces correct results.
> 
> Is this a clang bug, is the code broken or am I missing something?

For the record, inline assembly semantics are a little out of my
wheelhouse. Bill can probably comment more on what might be happening
internally within clang/LLVM here but it does seem like there could be a
clang code generation bug. Looking at the example you provided and GCC's
assembly and local register documentation, which has a very similar
example, it looks like the issue disappears when using "=r" for the
output constaint instead of "+r".

https://godbolt.org/z/jo3T8o3hj

Looking at the constraint string in both the unoptimized and optimized
IR, it looks like eax appears an input twice in the list for broken(),
likely because "+r" was internally expanded to "=r" for the output and
"r" for the input. In the optimized IR, we can see that the first eax
will be the 2 that was assigned but the second eax is "undef"
(undefined), which follows from the unoptimized IR. What I am guessing
happens based on my investigation with '-mllvm -opt-bisect-limit=' on
x86 is the second eax "wins" over the first one that has the actual
value. Using an undef value is UB so the backend removes the initial
write to eax altogether.

It definitely seems like this could be handled better on the clang side
but I do think that switching the constraints to "=r" would be a proper
fix, as "+r" is really an overspecification and that matches an almost
identical example in the GCC local register documentation:

https://gcc.gnu.org/onlinedocs/gcc-15.1.0/gcc/Local-Register-Variables.html

Cheers,
Nathan
