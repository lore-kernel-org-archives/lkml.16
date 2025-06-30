Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19A222338
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 01:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751245446; cv=none; b=alU5g/bHKA8x43I2HncjShj/ZkrRYZlMUctLOjGb9UZH9orMpfK5ZwHmHbdcDUvUqkux+7IbyJwz6Ikm7pLkOoKvQbfFz0825oNnKwEqWpJEcJJvoWgHHjCxENcHx4bAyY4HkFgOxyO4R0KlhpuJBJp1S9szOvoK08v4U2kyNQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751245446; c=relaxed/simple;
	bh=S5zTCvRDmkZzjtvTl9GTNC8tCozafhNWs8rvB4gUDDY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u9a+AXDZBK3wE5dJ7prQb1jNJ7iwGVhxbHLhkO5wB0nBuB+GxEfSJsrU5i2NDWiNTqutaO6l9/6Ph/gd6816beaFvJbhZlDw/iML1THDXQ4zT+fMQiXzD1gbcg16MxgUSXY5eJ2owpBMRsA+2E42UXsDIIEHoww1l7PShWokVsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mVmt35k/; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mVmt35k/"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-747fc77bb2aso1420124b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 18:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751245444; x=1751850244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SlOAT/47QVs7CQTjytp1gWpZj88+lZThU0ABfu6V9ew=;
        b=mVmt35k/MaP2Sz1f66AjF7GzqO9h953/mbF07gIT88G0Dp2Vux+qiWL+s80X8TaVUD
         ZymsjdUTYl5yxJhorxW+1628LKFj3Y7NijbxzVCCGC7KoyJaERopDmY5fh4PhwtFgSyW
         fXoeY6TmHsTUA+3P34RkK2m6SobyE3EhDn76H+NuGkckaB30El13pT3vZA4oY5w8J95N
         FBWcZaRNHW1KDLT8Hb6ZW7DAjoc2q7KFbjn0WHhUiI/7EjD9nUT1CcCu0ilDo02uTA2s
         vwxBL88p3H23o2a/ToifWWGeAxA5WuGsfsXubE9mRTsGH2Gja6srwzSXGJg53jzIo3lj
         Fjbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751245444; x=1751850244;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SlOAT/47QVs7CQTjytp1gWpZj88+lZThU0ABfu6V9ew=;
        b=T3Os+ySF/0VBBT/tnazvGOkIusNM7cdvJkRATt0RK0B723/Nf8z7PKWLaEd4A1crEV
         ZOVGe2KmZLPjXRYujcUT7WDA0EmUxBPVM62svw0I5TvcvstKKsNKx62KAbPGjnNw0RUy
         6lNaHzaFFYKFFaouiHzBtS1gljaQBVDZ8XHJQX3RSg0qt7nS1l3PFA7jjAm63OpqyxUW
         w0+j/yAddlurfT/e+NiOOdz0v5yTc9J/CDOeFBO3b6uiM4nsdvXypWbVi/EgxAoyJWiZ
         veo5ZoGL2lzMj/Cpij7r+3k8CBFKnBf3ms9KcHjkDDXzxb2GnVL4dlzyeDck73VI17U+
         6rHg==
X-Forwarded-Encrypted: i=1; AJvYcCVCMentN4YLAxLxSu3/YCnROj0f/POIXOZYKXlcQkKMKJAwDQX8WLev6qS1We0luUH9PS4UhD8oQ6gvi4w=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywydgw/y3eEhSY7rxQabFqF2rEoSAXueeTIaCgKnTmdrCHzXSpR
	DwvJj/icyAcu0+aaSLt8o7slw9xhVJeUfyTiyX4BeuwMUykjiuBTvpD92T/6mA==
X-Gm-Gg: ASbGnctYokwqt5S7OVYQfGbtO2/l+5J7DkPvpxrbAWKgXRXok7mHslPoChoyJxzsTaT
	SfrTX0/LbrB+LXIZtxFesH4CBUpSxGK5MGlhxOrokb3J2ruQ+QeSbBkRGKC+LxwUBovxJ5sWAIU
	Jw7nxtuohoN5F+5qT4fKFO/laebuH7Nh1rvO+QRj9wMxTn9EQNppUer6SOa/V5t2ceEQ08Gs6Yi
	SKqvN/b+AFMfx6RZ3PdlsfHwzshsYrkFoKPZWE9Q0r0tS9JeGT8m06GUO91Lw9eg0dNzkLGJezE
	oEUGbd1LDQvlUXXP/Wfe3k6B3s0NSpfLwaweqddvrgtGup+J5ykgWbjL1+aNQ3G7gg0LrPcESu3
	JdOjH7HksqboynysfNnb3QuJZStAWWAhAk6plE0sNL/CzACZSrZ9xl6euZOc=
X-Google-Smtp-Source: AGHT+IHkXJytyRhZUeC401afzY6yfzKABPO7AHRa1WPBnc8Z/NN/IJ7+8l2r99Z4yrTKx1FuMO5Tsw==
X-Received: by 2002:a05:6a00:cc1:b0:736:54c9:df2c with SMTP id d2e1a72fcca58-74af6f227a3mr13983922b3a.15.1751245443894;
        Sun, 29 Jun 2025 18:04:03 -0700 (PDT)
Received: from mars.local.gmail.com (221x241x217x81.ap221.ftth.ucom.ne.jp. [221.241.217.81])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af540b203sm7582860b3a.8.2025.06.29.18.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 18:04:03 -0700 (PDT)
Date: Mon, 30 Jun 2025 10:04:00 +0900
Message-ID: <m2plem3urj.wl-thehajime@gmail.com>
From: Hajime Tazaki <thehajime@gmail.com>
To: benjamin@sipsolutions.net
Cc: linux-um@lists.infradead.org,
	ricarkol@google.com,
	Liam.Howlett@oracle.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 09/13] x86/um: nommu: signal handling
In-Reply-To: <734965ac85b2c4cf481cc98ac53052fd5064d30e.camel@sipsolutions.net>
References: <cover.1750594487.git.thehajime@gmail.com>
	<548dcef198b79a4f8eb166481e39abe6e13ed2e3.1750594487.git.thehajime@gmail.com>
	<3b407ed711c5d7e1819da7513c3e320699473b2d.camel@sipsolutions.net>
	<m2sejl47ke.wl-thehajime@gmail.com>
	<734965ac85b2c4cf481cc98ac53052fd5064d30e.camel@sipsolutions.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/26.3 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable


Hello Benjamin,

On Sat, 28 Jun 2025 00:02:05 +0900,
Benjamin Berg wrote:
>=20
> Hi,
>=20
> On Fri, 2025-06-27 at 22:50 +0900, Hajime Tazaki wrote:
> > thanks for the comment on the complicated part of the kernel (signal).
>=20
> This stuff isn't simple.
>=20
> Actually, I am starting to think that the current MMU UML kernel also
> needs a redesign with regard to signal handling and stack use in that
> case. My current impression is that the design right now only permits
> voluntarily scheduling. More specifically, scheduling in response to an
> interrupt is impossible.
>=20
> I suppose that works fine, but it also does not seem quite right.

thanks for the info.  it's very useful to understand what's going on.

(snip)

> > > > +void set_mc_userspace_relay_signal(mcontext_t *mc)
> > > > +{
> > > > + mc->gregs[REG_RIP] =3D (unsigned long) __userspace_relay_signal;
> > > > +}
> > > > +
> >=20
> > This is a bit scary code which I tried to handle when SIGSEGV is
> > raised by host for a userspace program running on UML (nommu).
> >=20
> > # and I should remember my XXX tag is important to fix....
> >=20
> > let me try to explain what happens and what I tried to solve.
> >=20
> > The SEGV signal from userspace program is delivered to userspace but
> > if we don't fix the code raising the signal, after (um) rt_sigreturn,
> > it will restart from $rip and raise SIGSEGV again.
> >=20
> > # so, yes, we've already relied on host and um's rt_sigreturn to
> > =A0 restore various things.
> >=20
> > when a uml userspace crashes with SIGSEGV,
> >=20
> > - host kernel raises SIGSEGV (at original $rip)
> > - caught by uml process (hard_handler)
> > - raise a signal to uml userspace process (segv_handler)
> > - handler ends (hard_handler)
> > - (host) run restorer (rt_sigreturn, registered by (libc)sigaction,
> > =A0 not (host) rt_sigaction)
> > - return back to the original $rip
> > - (back to top)
> >=20
> > this is the case where endless loop is happened.
> > um's sa_handler isn't called as rt_sigreturn (um) isn't called.
> > and the my original attempt (__userspace_relay_signal) is what I tried.
> >=20
> > I agree that it is lazy to call a dummy syscall (indeed, getpid).
> > I'm trying to introduce another routine to jump into userspace and
> > call (um) rt_sigreturn after (host) rt_sigreturn.
> >=20
> > > And this is really confusing me. The way I am reading it, the code
> > > tries to do:
> > > =A0=A0 1. Rewrite RIP to jump to __userspace_relay_signal
> > > =A0=A0 2. Trigger a getpid syscall (to do "nothing"?)
> > > =A0=A0 3. Let do_syscall_64 fire the signal from interrupt_end
> >=20
> > correct.
> >=20
> > > However, then that really confuses me, because:
> > > =A0* If I am reading it correctly, then this approach will destroy the
> > > =A0=A0 contents of various registers (RIP, RAX and likely more)
> > > =A0* This would result in an incorrect mcontext in the userspace sign=
al
> > > =A0=A0 handler (which could be relevant if userspace is inspecting it)
> > > =A0* However, worst, rt_sigreturn will eventually jump back
> > > =A0=A0 into__userspace_relay_signal, which has nothing to return to.
> > > =A0* Also, relay_signal doesn't use this? What happens for a SIGFPE, =
how
> > > =A0=A0 is userspace interrupted immediately in that case?
> >=20
> > relay_signal shares the same goal of this, indeed.
> > but the issue with `mc->gregs[REG_RIP]` (endless signals) still exists
> > I guess.
>=20
> Well, endless signals only exist as long as you exit to the same
> location. My suggestion was to read the user state from the mcontext
> (as SECCOMP mode does it) and executing the signal right away, i.e.:

thanks too;  below is my understanding.

>  * Fetch the current registers from the mcontext

I guess this is already done in sig_handler_common().

>  * Push the signal context onto the userspace stack

(guess) this is already done on handle_signal() =3D> setup_signal_stack_si(=
).

>  * Modify the host mcontext to set registers for the signal handler

this is something which I'm not well understanding.
- do you mean the host handler when you say "for the signal handler" ?
  or the userspace handler ?
- if former (the host one), maybe mcontext is already there so, it
  might not be the one you mentioned.
- if the latter, how the original handler (the host one,
  hard_handler()) works ? even if we can call userspace handler
  instead of the host one, we need to call the host handler (and
  restorer).  do we call both ?
- and by "to set registers", what register do you mean ? for the
  registers inspected by userspace signal handler ?  but if you set a
  register, for instance RIP, as the fault location to the host
  register, it will return to RIP after handler and restart the fault
  again ?

>  * Jump back to userspace by doing a "return"

this is still also unclear to me.

it would be very helpful if you point the location of the code (at
uml/next tree) on how SECCOMP mode does.  I'm also looking at but
really hard to map what you described and the code (sorry).

all of above runs within hard_handler() in nommu mode on SIGSEGV.
my best guess is this is different from what ptrace/seccomp do.

> Said differently, I really prefer deferring as much logic as possible
> to the host. This is both safer and easier to understand. Plus, it also
> has the advantage of making it simpler to port UML to other
> architectures.

okay.

>=20
> > > Honestly, I really think we should take a step back and swap the
> > > current syscall entry/exit code. That would likely also simplify
> > > floating point register handling, which I think is currently
> > > insufficient do deal with the odd special cases caused by different
> > > x86_64 hardware extensions.
> > >=20
> > > Basically, I think nommu mode should use the same general approach as
> > > the current SECCOMP mode. Which is to use rt_sigreturn to jump into
> > > userspace and let the host kernel deal with the ugly details of how to
> > > do that.
> >=20
> > I looked at how MMU mode (ptrace/seccomp) does handle this case.
> >=20
> > In nommu mode, we don't have external process to catch signals so, the
> > nommu mode uses hard_handler() to catch SEGV/FPE of userspace
> > programs.=A0 While mmu mode calls segv_handler not in a context of
> > signal handler.
> >=20
> > # correct me if I'm wrong.
> >=20
> > thus, mmu mode doesn't have this situation.
>=20
> Yes, it does not have this specific issue. But see the top of the mail
> for other issues that are somewhat related.
>=20
> > I'm attempting various ways; calling um's rt_sigreturn instead of
> > host's one, which doesn't work as host restore procedures (unblocking
> > masked signals, restoring register states, etc) aren't called.
> >=20
> > I'll update here if I found a good direction, but would be great if
> > you see how it should be handled.
>=20
> Can we please discuss possible solutions? We can figure out the details
> once it is clear how the interaction with the host should work.

I was wishing to update to you that I'm working on it.  So, your
comments are always helpful to me.  Thanks.

-- Hajime

> I still think that the idea of using the kernel task stack as the
> signal stack is really elegant. Actually, doing that in normal UML may
> be how we can fix the issues mentioned at the top of my mail. And for
> nommu, we can also use the host mcontext to jump back into userspace
> using a simple "return".
>=20
> Conceptually it seems so simple.
>=20
> Benjamin
>=20
>=20
> >=20
> > -- Hajime
> >=20
> > > I believe that this requires a second "userspace" sigaltstack in
> > > addition to the current "IRQ" sigaltstack. Then switching in between
> > > the two (note that the "userspace" one is also used for IRQs if those
> > > happen while userspace is executing).
> > >=20
> > > So, in principle I would think something like:
> > > =A0* to jump into userspace, you would:
> > > =A0=A0=A0 - block all signals
> > > =A0=A0=A0 - set "userspace" sigaltstack
> > > =A0=A0=A0 - setup mcontext for rt_sigreturn
> > > =A0=A0=A0 - setup RSP for rt_sigreturn
> > > =A0=A0=A0 - call rt_sigreturn syscall
> > > =A0* all signal handlers can (except pure IRQs):
> > > =A0=A0=A0 - check on which stack they are
> > > =A0=A0=A0=A0=A0 -> easy to detect whether we are in kernel mode
> > > =A0=A0=A0 - for IRQs one can probably handle them directly (and retur=
n)
> > > =A0=A0=A0 - in user mode:
> > > =A0=A0=A0=A0=A0=A0 + store mcontext location and information needed f=
or rt_sigreturn
> > > =A0=A0=A0=A0=A0=A0 + jump back into kernel task stack
> > > =A0* kernel task handler to continue would:
> > > =A0=A0=A0 - set sigaltstack to IRQ stack
> > > =A0=A0=A0 - fetch register from mcontext
> > > =A0=A0=A0 - unblock all signals
> > > =A0=A0=A0 - handle syscall/signal in whatever way needed
> > >=20
> > > Now that I wrote about it, I am thinking that it might be possible to
> > > just use the kernel task stack for the signal stack. One would probab=
ly
> > > need to increase the kernel stack size a bit, but it would also mean
> > > that no special code is needed for "rt_sigreturn" handling. The rest
> > > would remain the same.
> > >=20
> > > Thoughts?
> > >=20
> > > Benjamin
> > >=20
> > > > [SNIP]
> > >=20
> >=20
>=20
