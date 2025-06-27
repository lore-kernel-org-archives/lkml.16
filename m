Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DCD1DFE1
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 13:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751032251; cv=none; b=gMgV8zFuowGzyvHnzbx3FLumTzxRcQd9fYVQ77hOU3NM5WHfUd9QZ6LWsYNtpHGXe+0WjtSwD2atXB66pnsai5vN2Y9Fm03t3Mey68qWbLTQtz14YjcFGTezCFou/2fpFzLargbW4/vREEQAGqTAJfKeuYl1Wdiuc0VTCdHwKKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751032251; c=relaxed/simple;
	bh=bSX+/UXmvh3czyFYzpAGgii4+gkqBkrTG0gsPeQ3R+c=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W7I2mK2aSU9o+2taRA4iQIfJj9+f17JQPyRpC5gz2vYMovbydx/hC+3i1N1zxzc3Pdy5gk/SNxNOUCfFHWFjHEbKKL0UrC2hFAJun+LB2u0hI1RsmxubxJNmcKJ3rbT5dXUhBDeTtYj1yVqW9BKViM5r7lIFnBemoM8W2+hbh40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dxUkuXII; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dxUkuXII"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-747ef5996edso1807117b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 06:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751032249; x=1751637049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Er5yzRbxAzEONxojnd+XiqNzcC4mWTkPWEuVaxn0Exk=;
        b=dxUkuXIIAsPe2rHSTv+lSw469PDrjjWSiHLE17tvMHOKwle7Qagow3WmeAOk3PBwlR
         aGWuxtpuT64mab/B1PnWU5pysr2EiPeYsHqPtsY0gKgJCYFfT+i4xsWdhUu4ycV72YKv
         AO24Tc4tQQYXnwddAfakocLgbpMUhgJ2Zy2akGuCitCt5hUQHaVx1RuqpFLClbdH1ifh
         fEwCQwCJ/7pYdcr8WN7x5tGeM4S7yaOWPgVyN/j2e8bcvqlP4aGV9Om59qhjSv74Mg0y
         Xgpi1YahUt1c65jjnrH1y+ZhH83pMswaFanJShhdbZv/GdCyJY1Y+lWfB/6tKcKStrJm
         lRiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751032249; x=1751637049;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Er5yzRbxAzEONxojnd+XiqNzcC4mWTkPWEuVaxn0Exk=;
        b=FjwpEXf4nHWfjtztpwhaUr9dRg4Xozj+AxEvQrppCxfj7JrfeLaUhmaVlb0PxCww4S
         rqRXqtiu7HzlHETe39L8aRX5tXwvLZZkMK61NC56C3BBIVfdoLAwNHr690SNpKNnmRCW
         e4EeYDRD3bHI7o6hBmgWhvWhI74r1TiJckPjgB6DHqt/58pmilB+ZpPpEWV0hPlwlrdH
         /53bxFD7S3Tlarf/8oF715M8DzClCv7FmijejODt+GUp31Bvqy9nkk8eAZO4Er8AAFZb
         nZ+VfaysJjnEZ9fM0FVeoE85vb3RDaCLulhfPs9g6McpDwNrCWfFauZ1+Cm49XpZ9Q5A
         7sSw==
X-Forwarded-Encrypted: i=1; AJvYcCUX16u6cqesZtocxTjsXcT0ucSa6HEGhSqK0ixshM2pRAXSNMdCn0+5GHOB4f/4Ebrqx+3EdrIKqNZB+lg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQuuhS9DyT1e9XHIh6Mjh09IgnqeEBtQwKvV+ECOQzgGhYzkRY
	i7EyeU3doGAvmJ+aQl+bgelQbNjNf7LI9aqMf6NavpL8WmvB3YQ8xmD8
X-Gm-Gg: ASbGncuYNbvGhDyLU0rkCHscGNyMHIQBodTeb/il5sLF0z0wyhJU0mtYvIFU3z5I7wk
	M8Adgn2Ioa0KJonqMmWCqx1kmjrXFcnmAGDIVgTKU+P8myAlFXxHZaGhp3BsuIbUYzpnj+gM5DE
	RLtrQDfjH272E/noOmhKipnIIWkOl315VtiBfq6cJiBrfbA/mqRaVxAdWcChKyv3SihCZJwJ3t0
	8QOpkseNbBCP4OMPDOm3AKNk+WTyUYNQXya1T+OOhR96cA19sgFCkA0Rcee0nXqL4/peS224PVL
	ROvM4k81UjeB9hHbYe1FeyeNhvb8q+xM0X2UNWBkCOc6OdaX75MAPs6vYmSRq47LQgc/fd4bi6b
	hiTilCMcoZ2YRgJ3XvrKJTaxu1Zexce5x0xgsN6wtMxvhcjbh
X-Google-Smtp-Source: AGHT+IHm0tIQwqMArAkM6EsZ4e/IJxZXd3aeraDsPj/38phu/wRCS2B3aMR4ToaySdgBCXkERG+hHw==
X-Received: by 2002:a05:6a00:2302:b0:748:1bac:ad5f with SMTP id d2e1a72fcca58-74af6f22722mr4532045b3a.12.1751032246276;
        Fri, 27 Jun 2025 06:50:46 -0700 (PDT)
Received: from mars.local.gmail.com (221x241x217x81.ap221.ftth.ucom.ne.jp. [221.241.217.81])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e3008194sm1698813a12.9.2025.06.27.06.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 06:50:45 -0700 (PDT)
Date: Fri, 27 Jun 2025 22:50:41 +0900
Message-ID: <m2sejl47ke.wl-thehajime@gmail.com>
From: Hajime Tazaki <thehajime@gmail.com>
To: benjamin@sipsolutions.net
Cc: linux-um@lists.infradead.org,
	ricarkol@google.com,
	Liam.Howlett@oracle.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 09/13] x86/um: nommu: signal handling
In-Reply-To: <3b407ed711c5d7e1819da7513c3e320699473b2d.camel@sipsolutions.net>
References: <cover.1750594487.git.thehajime@gmail.com>
	<548dcef198b79a4f8eb166481e39abe6e13ed2e3.1750594487.git.thehajime@gmail.com>
	<3b407ed711c5d7e1819da7513c3e320699473b2d.camel@sipsolutions.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/26.3 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable


Hello,

thanks for the comment on the complicated part of the kernel (signal).

On Wed, 25 Jun 2025 08:20:03 +0900,
Benjamin Berg wrote:
>=20
> Hi,
>=20
> On Mon, 2025-06-23 at 06:33 +0900, Hajime Tazaki wrote:
> > This commit updates the behavior of signal handling under !MMU
> > environment. It adds the alignment code for signal frame as the frame
> > is used in userspace as-is.
> >=20
> > floating point register is carefully handling upon entry/leave of
> > syscall routine so that signal handlers can read/write the contents of
> > the register.
> >=20
> > It also adds the follow up routine for SIGSEGV as a signal delivery runs
> > in the same stack frame while we have to avoid endless SIGSEGV.
> >=20
> > Signed-off-by: Hajime Tazaki <thehajime@gmail.com>
> > ---
> > =A0arch/um/include/shared/kern_util.h=A0=A0=A0 |=A0=A0 4 +
> > =A0arch/um/nommu/Makefile=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
|=A0=A0 2 +-
> > =A0arch/um/nommu/os-Linux/signal.c=A0=A0=A0=A0=A0=A0 |=A0 13 ++
> > =A0arch/um/nommu/trap.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 | 194 ++++++++++++++++++++++++++
> > =A0arch/x86/um/nommu/do_syscall_64.c=A0=A0=A0=A0 |=A0=A0 6 +
> > =A0arch/x86/um/nommu/os-Linux/mcontext.c |=A0 11 ++
> > =A0arch/x86/um/shared/sysdep/mcontext.h=A0 |=A0=A0 1 +
> > =A0arch/x86/um/shared/sysdep/ptrace.h=A0=A0=A0 |=A0=A0 2 +-
> > =A08 files changed, 231 insertions(+), 2 deletions(-)
> > =A0create mode 100644 arch/um/nommu/trap.c
> >=20
> > [SNIP]
> > diff --git a/arch/x86/um/nommu/os-Linux/mcontext.c b/arch/x86/um/nommu/=
os-Linux/mcontext.c
> > index c4ef877d5ea0..955e7d9f4765 100644
> > --- a/arch/x86/um/nommu/os-Linux/mcontext.c
> > +++ b/arch/x86/um/nommu/os-Linux/mcontext.c
> > @@ -6,6 +6,17 @@
> > =A0#include <sysdep/mcontext.h>
> > =A0#include <sysdep/syscalls.h>
> > =A0
> > +static void __userspace_relay_signal(void)
> > +{
> > + /* XXX: dummy syscall */
> > + __asm__ volatile("call *%0" : : "r"(__kernel_vsyscall), "a"(39) :);
> > +}
>=20
> 39 is NR__getpid, I assume?
>=20
> The "call *%0" looks like it is code for retpolin, I think this would
> currently just segfault.

# if you mean retpolin as zpoline,

zploine uses `call *%rax` so, this is not about zpoline.

> > +void set_mc_userspace_relay_signal(mcontext_t *mc)
> > +{
> > + mc->gregs[REG_RIP] =3D (unsigned long) __userspace_relay_signal;
> > +}
> > +

This is a bit scary code which I tried to handle when SIGSEGV is
raised by host for a userspace program running on UML (nommu).

# and I should remember my XXX tag is important to fix....

let me try to explain what happens and what I tried to solve.

The SEGV signal from userspace program is delivered to userspace but
if we don't fix the code raising the signal, after (um) rt_sigreturn,
it will restart from $rip and raise SIGSEGV again.

# so, yes, we've already relied on host and um's rt_sigreturn to
  restore various things.

when a uml userspace crashes with SIGSEGV,

- host kernel raises SIGSEGV (at original $rip)
- caught by uml process (hard_handler)
- raise a signal to uml userspace process (segv_handler)
- handler ends (hard_handler)
- (host) run restorer (rt_sigreturn, registered by (libc)sigaction,
  not (host) rt_sigaction)
- return back to the original $rip
- (back to top)

this is the case where endless loop is happened.
um's sa_handler isn't called as rt_sigreturn (um) isn't called.
and the my original attempt (__userspace_relay_signal) is what I tried.

I agree that it is lazy to call a dummy syscall (indeed, getpid).
I'm trying to introduce another routine to jump into userspace and
call (um) rt_sigreturn after (host) rt_sigreturn.

> And this is really confusing me. The way I am reading it, the code
> tries to do:
>    1. Rewrite RIP to jump to __userspace_relay_signal
>    2. Trigger a getpid syscall (to do "nothing"?)
>    3. Let do_syscall_64 fire the signal from interrupt_end

correct.

> However, then that really confuses me, because:
>  * If I am reading it correctly, then this approach will destroy the
>    contents of various registers (RIP, RAX and likely more)
>  * This would result in an incorrect mcontext in the userspace signal
>    handler (which could be relevant if userspace is inspecting it)
>  * However, worst, rt_sigreturn will eventually jump back
>    into__userspace_relay_signal, which has nothing to return to.
>  * Also, relay_signal doesn't use this? What happens for a SIGFPE, how
>    is userspace interrupted immediately in that case?

relay_signal shares the same goal of this, indeed.
but the issue with `mc->gregs[REG_RIP]` (endless signals) still exists
I guess.

> Honestly, I really think we should take a step back and swap the
> current syscall entry/exit code. That would likely also simplify
> floating point register handling, which I think is currently
> insufficient do deal with the odd special cases caused by different
> x86_64 hardware extensions.
>=20
> Basically, I think nommu mode should use the same general approach as
> the current SECCOMP mode. Which is to use rt_sigreturn to jump into
> userspace and let the host kernel deal with the ugly details of how to
> do that.

I looked at how MMU mode (ptrace/seccomp) does handle this case.

In nommu mode, we don't have external process to catch signals so, the
nommu mode uses hard_handler() to catch SEGV/FPE of userspace
programs.  While mmu mode calls segv_handler not in a context of
signal handler.

# correct me if I'm wrong.

thus, mmu mode doesn't have this situation.


I'm attempting various ways; calling um's rt_sigreturn instead of
host's one, which doesn't work as host restore procedures (unblocking
masked signals, restoring register states, etc) aren't called.

I'll update here if I found a good direction, but would be great if
you see how it should be handled.

-- Hajime

> I believe that this requires a second "userspace" sigaltstack in
> addition to the current "IRQ" sigaltstack. Then switching in between
> the two (note that the "userspace" one is also used for IRQs if those
> happen while userspace is executing).
>=20
> So, in principle I would think something like:
>  * to jump into userspace, you would:
>     - block all signals
>     - set "userspace" sigaltstack
>     - setup mcontext for rt_sigreturn
>     - setup RSP for rt_sigreturn
>     - call rt_sigreturn syscall
>  * all signal handlers can (except pure IRQs):
>     - check on which stack they are
>       -> easy to detect whether we are in kernel mode
>     - for IRQs one can probably handle them directly (and return)
>     - in user mode:
>        + store mcontext location and information needed for rt_sigreturn
>        + jump back into kernel task stack
>  * kernel task handler to continue would:
>     - set sigaltstack to IRQ stack
>     - fetch register from mcontext
>     - unblock all signals
>     - handle syscall/signal in whatever way needed
>=20
> Now that I wrote about it, I am thinking that it might be possible to
> just use the kernel task stack for the signal stack. One would probably
> need to increase the kernel stack size a bit, but it would also mean
> that no special code is needed for "rt_sigreturn" handling. The rest
> would remain the same.
>=20
> Thoughts?
>=20
> Benjamin
>=20
> > [SNIP]
>=20
