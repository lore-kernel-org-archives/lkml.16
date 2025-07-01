Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AB721770D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 12:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751371426; cv=none; b=SXsh+bRVfA3PCdzo1eWT/oIQnxH303ZHfzXjBMEWxml3wp+Jxr6oHj0nzY906jDusLUJWhT4lPLdJW5ohQi7l4H3fWi+dWVEVKCEhXrfDgHeXkuK4STr75Pydj/TwpWknqa4k1YXuSFvjTN8G+0BWm7LZ74FjpNeiKqJnfaB2Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751371426; c=relaxed/simple;
	bh=CwLYhwgxOP5iVMOJ89NSnug/Ktag9wZPPAlbRKt/yvQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C6aY3EksEzWz+45zaYZyF12QqLad6ywxxD6RuFgppxROKUwCpTQgnK0VWy+KTr6e9H6180sHvYypSGe5gHMd/oLIQFkEl4uh5qfpQ9NwGxdelNpjV1Deg6f+NSbXc2tLTEPBT5zZaZZ+IUajbN4m8PgkoybILmi+jy9L/2gnXHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=NwknkCu1; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="NwknkCu1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=CwLYhwgxOP5iVMOJ89NSnug/Ktag9wZPPAlbRKt/yvQ=;
	t=1751371424; x=1752581024; b=NwknkCu1nH8Rjjp+rpZoRfLqOVndEkoI7PY44L0+uIaCtxp
	q5ZaiF0NrsiWyvwEkH2nTyH7AyuJGN1Jm7DjuZsnyrO7kAd9FKjEXyOppZ1cWBg9uqh/iKFUl15DK
	kCFqdy/c6DspbVWjzLOiX/f87zt/lW0wBMibSw8CjAWO+Y+7SNcNUXJgQXTFTGsdoiHAxolfxlk/E
	EUcdjY98o7VVDs/1/IH0tb5Ttj0H9Lc67DoX3PY5AsGesZ/Lzv9VZqFdNuZT83ki6JsW5XzBQTCU4
	9fGb6jxVYgguDgJXUxt06j2kg4EY0D3oSI5EyFC8fuDYmi9IPwWRvvSLrYfLnU+w==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <benjamin@sipsolutions.net>)
	id 1uWZi6-00000002kX6-0pVs;
	Tue, 01 Jul 2025 14:03:38 +0200
Message-ID: <a9133d9a69843948078f590a102bad9302f3f554.camel@sipsolutions.net>
Subject: Re: [PATCH v10 09/13] x86/um: nommu: signal handling
From: Benjamin Berg <benjamin@sipsolutions.net>
To: Hajime Tazaki <thehajime@gmail.com>
Cc: linux-um@lists.infradead.org, ricarkol@google.com,
 Liam.Howlett@oracle.com, 	linux-kernel@vger.kernel.org
Date: Tue, 01 Jul 2025 14:03:36 +0200
In-Reply-To: <m2plem3urj.wl-thehajime@gmail.com> (sfid-20250630_030407_541368_3EBD3064)
References: <cover.1750594487.git.thehajime@gmail.com>
		<548dcef198b79a4f8eb166481e39abe6e13ed2e3.1750594487.git.thehajime@gmail.com>
		<3b407ed711c5d7e1819da7513c3e320699473b2d.camel@sipsolutions.net>
		<m2sejl47ke.wl-thehajime@gmail.com>
		<734965ac85b2c4cf481cc98ac53052fd5064d30e.camel@sipsolutions.net>
	 <m2plem3urj.wl-thehajime@gmail.com> (sfid-20250630_030407_541368_3EBD3064)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

Hi Hajim,

On Mon, 2025-06-30 at 10:04 +0900, Hajime Tazaki wrote:
>=20
> Hello Benjamin,
>=20
> On Sat, 28 Jun 2025 00:02:05 +0900,
> Benjamin Berg wrote:
> >=20
> > Hi,
> >=20
> > On Fri, 2025-06-27 at 22:50 +0900, Hajime Tazaki wrote:
> > > thanks for the comment on the complicated part of the kernel (signal)=
.
> >=20
> > This stuff isn't simple.
> >=20
> > Actually, I am starting to think that the current MMU UML kernel also
> > needs a redesign with regard to signal handling and stack use in that
> > case. My current impression is that the design right now only permits
> > voluntarily scheduling. More specifically, scheduling in response to an
> > interrupt is impossible.
> >=20
> > I suppose that works fine, but it also does not seem quite right.
>=20
> thanks for the info.=C2=A0 it's very useful to understand what's going on=
.
>=20
> (snip)
>=20
> > > > > +void set_mc_userspace_relay_signal(mcontext_t *mc)
> > > > > +{
> > > > > + mc->gregs[REG_RIP] =3D (unsigned long) __userspace_relay_signal=
;
> > > > > +}
> > > > > +
> > >=20
> > > This is a bit scary code which I tried to handle when SIGSEGV is
> > > raised by host for a userspace program running on UML (nommu).
> > >=20
> > > # and I should remember my XXX tag is important to fix....
> > >=20
> > > let me try to explain what happens and what I tried to solve.
> > >=20
> > > The SEGV signal from userspace program is delivered to userspace but
> > > if we don't fix the code raising the signal, after (um) rt_sigreturn,
> > > it will restart from $rip and raise SIGSEGV again.
> > >=20
> > > # so, yes, we've already relied on host and um's rt_sigreturn to
> > > =C2=A0 restore various things.
> > >=20
> > > when a uml userspace crashes with SIGSEGV,
> > >=20
> > > - host kernel raises SIGSEGV (at original $rip)
> > > - caught by uml process (hard_handler)
> > > - raise a signal to uml userspace process (segv_handler)
> > > - handler ends (hard_handler)
> > > - (host) run restorer (rt_sigreturn, registered by (libc)sigaction,
> > > =C2=A0 not (host) rt_sigaction)
> > > - return back to the original $rip
> > > - (back to top)
> > >=20
> > > this is the case where endless loop is happened.
> > > um's sa_handler isn't called as rt_sigreturn (um) isn't called.
> > > and the my original attempt (__userspace_relay_signal) is what I trie=
d.
> > >=20
> > > I agree that it is lazy to call a dummy syscall (indeed, getpid).
> > > I'm trying to introduce another routine to jump into userspace and
> > > call (um) rt_sigreturn after (host) rt_sigreturn.
> > >=20
> > > > And this is really confusing me. The way I am reading it, the code
> > > > tries to do:
> > > > =C2=A0=C2=A0 1. Rewrite RIP to jump to __userspace_relay_signal
> > > > =C2=A0=C2=A0 2. Trigger a getpid syscall (to do "nothing"?)
> > > > =C2=A0=C2=A0 3. Let do_syscall_64 fire the signal from interrupt_en=
d
> > >=20
> > > correct.
> > >=20
> > > > However, then that really confuses me, because:
> > > > =C2=A0* If I am reading it correctly, then this approach will destr=
oy the
> > > > =C2=A0=C2=A0 contents of various registers (RIP, RAX and likely mor=
e)
> > > > =C2=A0* This would result in an incorrect mcontext in the userspace=
 signal
> > > > =C2=A0=C2=A0 handler (which could be relevant if userspace is inspe=
cting it)
> > > > =C2=A0* However, worst, rt_sigreturn will eventually jump back
> > > > =C2=A0=C2=A0 into__userspace_relay_signal, which has nothing to ret=
urn to.
> > > > =C2=A0* Also, relay_signal doesn't use this? What happens for a SIG=
FPE, how
> > > > =C2=A0=C2=A0 is userspace interrupted immediately in that case?
> > >=20
> > > relay_signal shares the same goal of this, indeed.
> > > but the issue with `mc->gregs[REG_RIP]` (endless signals) still exist=
s
> > > I guess.
> >=20
> > Well, endless signals only exist as long as you exit to the same
> > location. My suggestion was to read the user state from the mcontext
> > (as SECCOMP mode does it) and executing the signal right away, i.e.:
>=20
> thanks too;=C2=A0 below is my understanding.
>=20
> > =C2=A0* Fetch the current registers from the mcontext
>=20
> I guess this is already done in sig_handler_common().

Well, not really?

It does seem to fetch the general purpose registers. But the code
pretty much assumes we will return to the same location and only stores
them on the stack for the signal handler itself. Also, remember that it
might be userspace or kernel space in your case. The kernel task
registers are in "switch_buf" while the userspace registers are in
"regs" of "struct task_struct" (effectively "struct uml_pt_regs").

> > =C2=A0* Push the signal context onto the userspace stack
>=20
> (guess) this is already done on handle_signal() =3D> setup_signal_stack_s=
i().
>=20
> > =C2=A0* Modify the host mcontext to set registers for the signal handle=
r
>=20
> this is something which I'm not well understanding.
> - do you mean the host handler when you say "for the signal handler" ?
> =C2=A0 or the userspace handler ?

Both in a way ;-)

I mean modify the registers in the host mcontext so that the UML
userspace will continue executing inside its signal handler.

> - if former (the host one), maybe mcontext is already there so, it
> =C2=A0 might not be the one you mentioned.
> - if the latter, how the original handler (the host one,
> =C2=A0 hard_handler()) works ? even if we can call userspace handler
> =C2=A0 instead of the host one, we need to call the host handler (and
> =C2=A0 restorer).=C2=A0 do we call both ?
> - and by "to set registers", what register do you mean ? for the
> =C2=A0 registers inspected by userspace signal handler ?=C2=A0 but if you=
 set a
> =C2=A0 register, for instance RIP, as the fault location to the host
> =C2=A0 register, it will return to RIP after handler and restart the faul=
t
> =C2=A0 again ?

I am confused, why would the fault handler be restarted? If you modify
RIP, then the host kernel will not return to the faulting location. You
were using that already to jump into __userspace_relay_signal. All I am
arguing that instead of jumping to __userspace_relay_signal you can
prepare everything and directly jump into the users signal handler.

> > =C2=A0* Jump back to userspace by doing a "return"
>=20
> this is still also unclear to me.
>=20
> it would be very helpful if you point the location of the code (at
> uml/next tree) on how SECCOMP mode does.=C2=A0 I'm also looking at but
> really hard to map what you described and the code (sorry).

"stub_signal_interrupt" simply returns, which means it jumps into the
restorer "stub_signal_restorer" which does the rt_sigreturn syscall.
This means the host kernel restores the userspace state from the
mcontext. As the mcontext resides in shared memory, the UML kernel can
update it to specify where the process should continue running (thread
switching, signals, syscall return value, =E2=80=A6).

Benjamin

> all of above runs within hard_handler() in nommu mode on SIGSEGV.
> my best guess is this is different from what ptrace/seccomp do.
>=20
> > Said differently, I really prefer deferring as much logic as possible
> > to the host. This is both safer and easier to understand. Plus, it also
> > has the advantage of making it simpler to port UML to other
> > architectures.
>=20
> okay.
>=20
> >=20
> > > > Honestly, I really think we should take a step back and swap the
> > > > current syscall entry/exit code. That would likely also simplify
> > > > floating point register handling, which I think is currently
> > > > insufficient do deal with the odd special cases caused by different
> > > > x86_64 hardware extensions.
> > > >=20
> > > > Basically, I think nommu mode should use the same general approach =
as
> > > > the current SECCOMP mode. Which is to use rt_sigreturn to jump into
> > > > userspace and let the host kernel deal with the ugly details of how=
 to
> > > > do that.
> > >=20
> > > I looked at how MMU mode (ptrace/seccomp) does handle this case.
> > >=20
> > > In nommu mode, we don't have external process to catch signals so, th=
e
> > > nommu mode uses hard_handler() to catch SEGV/FPE of userspace
> > > programs.=C2=A0 While mmu mode calls segv_handler not in a context of
> > > signal handler.
> > >=20
> > > # correct me if I'm wrong.
> > >=20
> > > thus, mmu mode doesn't have this situation.
> >=20
> > Yes, it does not have this specific issue. But see the top of the mail
> > for other issues that are somewhat related.
> >=20
> > > I'm attempting various ways; calling um's rt_sigreturn instead of
> > > host's one, which doesn't work as host restore procedures (unblocking
> > > masked signals, restoring register states, etc) aren't called.
> > >=20
> > > I'll update here if I found a good direction, but would be great if
> > > you see how it should be handled.
> >=20
> > Can we please discuss possible solutions? We can figure out the details
> > once it is clear how the interaction with the host should work.
>=20
> I was wishing to update to you that I'm working on it.=C2=A0 So, your
> comments are always helpful to me.=C2=A0 Thanks.
>=20
> -- Hajime
>=20
> > I still think that the idea of using the kernel task stack as the
> > signal stack is really elegant. Actually, doing that in normal UML may
> > be how we can fix the issues mentioned at the top of my mail. And for
> > nommu, we can also use the host mcontext to jump back into userspace
> > using a simple "return".
> >=20
> > Conceptually it seems so simple.
> >=20
> > Benjamin
> >=20
> >=20
> > >=20
> > > -- Hajime
> > >=20
> > > > I believe that this requires a second "userspace" sigaltstack in
> > > > addition to the current "IRQ" sigaltstack. Then switching in betwee=
n
> > > > the two (note that the "userspace" one is also used for IRQs if tho=
se
> > > > happen while userspace is executing).
> > > >=20
> > > > So, in principle I would think something like:
> > > > =C2=A0* to jump into userspace, you would:
> > > > =C2=A0=C2=A0=C2=A0 - block all signals
> > > > =C2=A0=C2=A0=C2=A0 - set "userspace" sigaltstack
> > > > =C2=A0=C2=A0=C2=A0 - setup mcontext for rt_sigreturn
> > > > =C2=A0=C2=A0=C2=A0 - setup RSP for rt_sigreturn
> > > > =C2=A0=C2=A0=C2=A0 - call rt_sigreturn syscall
> > > > =C2=A0* all signal handlers can (except pure IRQs):
> > > > =C2=A0=C2=A0=C2=A0 - check on which stack they are
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -> easy to detect whether we are in =
kernel mode
> > > > =C2=A0=C2=A0=C2=A0 - for IRQs one can probably handle them directly=
 (and return)
> > > > =C2=A0=C2=A0=C2=A0 - in user mode:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + store mcontext location and =
information needed for rt_sigreturn
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + jump back into kernel task s=
tack
> > > > =C2=A0* kernel task handler to continue would:
> > > > =C2=A0=C2=A0=C2=A0 - set sigaltstack to IRQ stack
> > > > =C2=A0=C2=A0=C2=A0 - fetch register from mcontext
> > > > =C2=A0=C2=A0=C2=A0 - unblock all signals
> > > > =C2=A0=C2=A0=C2=A0 - handle syscall/signal in whatever way needed
> > > >=20
> > > > Now that I wrote about it, I am thinking that it might be possible =
to
> > > > just use the kernel task stack for the signal stack. One would prob=
ably
> > > > need to increase the kernel stack size a bit, but it would also mea=
n
> > > > that no special code is needed for "rt_sigreturn" handling. The res=
t
> > > > would remain the same.
> > > >=20
> > > > Thoughts?
> > > >=20
> > > > Benjamin
> > > >=20
> > > > > [SNIP]
> > > >=20
> > >=20
> >=20
>=20

