Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05711C6FE8
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751036539; cv=none; b=sA85ff6yQ33chQdNFe5HD+DOVAgwFKUcV4YWbhrUa762o+vfylaARhIri/1RYCY2+JdoAkU60Q8H43/rPwa3ME28GcqEDpH/AUB4mnr6pkxiSQ47/g5KNmcAKDnhRccwbDBg6KvpfGm/uIgUwrMi+hD65gCpYIeVcy9teNVoPI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751036539; c=relaxed/simple;
	bh=cJONLCQOpF6Xvzl9B4WOfWoBD70JG1idjgUJls73ICM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UWddn8QeoqjJmxC0WeaFSSi1OQBfiUZ+gQJd7COUsQ91rPNSQVL+5lKsdk+h2Mn10fvnUj/8J8TtpKf3itbcE/UcDapkZeNDLW6CNmJ4ihROR0ZDp9/WDlAZf2dKunL4jx96jw5FVwQ/3Sps8INR8OO+eT1M3KzgCToPK3/eC1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=fqrcEMzH; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="fqrcEMzH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=cJONLCQOpF6Xvzl9B4WOfWoBD70JG1idjgUJls73ICM=;
	t=1751036537; x=1752246137; b=fqrcEMzH67jcXO3t44Gn2or1IjychTyd49mOgT190lyVxPp
	jQaWNQmsrbCThndknUKF047gGY2+6fLUYPo2Y8PSSwSS6pZl3kxrPYl72SfH6TZ59g0npLQF419I3
	xkbwrqZRZlCaC89VbNGfp5zS+OUQvqAxXgnIWCPfZ2sQi6BxnOa32AB7eQFoQhQ9WNtaaXcqTINNv
	e5KNPxS3vstnhdqHKZCu6cfBf7iiITKJG2p58wqodeA6A7javfVotmGdce/SyOLDariI88XCRdWUX
	KGl4t/zSU5GUOC6KesrlQlCaWC033ZsmmtVJDvVlo/VnNVD33Sh9Nud3b4zpeT4A==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <benjamin@sipsolutions.net>)
	id 1uVAac-0000000Du7J-0uX8;
	Fri, 27 Jun 2025 17:02:06 +0200
Message-ID: <734965ac85b2c4cf481cc98ac53052fd5064d30e.camel@sipsolutions.net>
Subject: Re: [PATCH v10 09/13] x86/um: nommu: signal handling
From: Benjamin Berg <benjamin@sipsolutions.net>
To: Hajime Tazaki <thehajime@gmail.com>
Cc: linux-um@lists.infradead.org, ricarkol@google.com,
 Liam.Howlett@oracle.com, 	linux-kernel@vger.kernel.org
Date: Fri, 27 Jun 2025 17:02:05 +0200
In-Reply-To: <m2sejl47ke.wl-thehajime@gmail.com> (sfid-20250627_155052_193903_B610E51D)
References: <cover.1750594487.git.thehajime@gmail.com>
		<548dcef198b79a4f8eb166481e39abe6e13ed2e3.1750594487.git.thehajime@gmail.com>
		<3b407ed711c5d7e1819da7513c3e320699473b2d.camel@sipsolutions.net>
	 <m2sejl47ke.wl-thehajime@gmail.com> (sfid-20250627_155052_193903_B610E51D)
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

Hi,

On Fri, 2025-06-27 at 22:50 +0900, Hajime Tazaki wrote:
> thanks for the comment on the complicated part of the kernel (signal).

This stuff isn't simple.

Actually, I am starting to think that the current MMU UML kernel also
needs a redesign with regard to signal handling and stack use in that
case. My current impression is that the design right now only permits
voluntarily scheduling. More specifically, scheduling in response to an
interrupt is impossible.

I suppose that works fine, but it also does not seem quite right.

> On Wed, 25 Jun 2025 08:20:03 +0900,
> Benjamin Berg wrote:
> >=20
> > Hi,
> >=20
> > On Mon, 2025-06-23 at 06:33 +0900, Hajime Tazaki wrote:
> > > This commit updates the behavior of signal handling under !MMU
> > > environment. It adds the alignment code for signal frame as the frame
> > > is used in userspace as-is.
> > >=20
> > > floating point register is carefully handling upon entry/leave of
> > > syscall routine so that signal handlers can read/write the contents o=
f
> > > the register.
> > >=20
> > > It also adds the follow up routine for SIGSEGV as a signal delivery r=
uns
> > > in the same stack frame while we have to avoid endless SIGSEGV.
> > >=20
> > > Signed-off-by: Hajime Tazaki <thehajime@gmail.com>
> > > ---
> > > =C2=A0arch/um/include/shared/kern_util.h=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 4 +
> > > =C2=A0arch/um/nommu/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> > > =C2=A0arch/um/nommu/os-Linux/signal.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 13 ++
> > > =C2=A0arch/um/nommu/trap.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 194 ++++++++=
++++++++++++++++++
> > > =C2=A0arch/x86/um/nommu/do_syscall_64.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 6 +
> > > =C2=A0arch/x86/um/nommu/os-Linux/mcontext.c |=C2=A0 11 ++
> > > =C2=A0arch/x86/um/shared/sysdep/mcontext.h=C2=A0 |=C2=A0=C2=A0 1 +
> > > =C2=A0arch/x86/um/shared/sysdep/ptrace.h=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 2 +-
> > > =C2=A08 files changed, 231 insertions(+), 2 deletions(-)
> > > =C2=A0create mode 100644 arch/um/nommu/trap.c
> > >=20
> > > [SNIP]
> > > diff --git a/arch/x86/um/nommu/os-Linux/mcontext.c b/arch/x86/um/nomm=
u/os-Linux/mcontext.c
> > > index c4ef877d5ea0..955e7d9f4765 100644
> > > --- a/arch/x86/um/nommu/os-Linux/mcontext.c
> > > +++ b/arch/x86/um/nommu/os-Linux/mcontext.c
> > > @@ -6,6 +6,17 @@
> > > =C2=A0#include <sysdep/mcontext.h>
> > > =C2=A0#include <sysdep/syscalls.h>
> > > =C2=A0
> > > +static void __userspace_relay_signal(void)
> > > +{
> > > + /* XXX: dummy syscall */
> > > + __asm__ volatile("call *%0" : : "r"(__kernel_vsyscall), "a"(39) :);
> > > +}
> >=20
> > 39 is NR__getpid, I assume?
> >=20
> > The "call *%0" looks like it is code for retpolin, I think this would
> > currently just segfault.
>=20
> # if you mean retpolin as zpoline,
>=20
> zploine uses `call *%rax` so, this is not about zpoline.

Ah, yes, of course.

> > > +void set_mc_userspace_relay_signal(mcontext_t *mc)
> > > +{
> > > + mc->gregs[REG_RIP] =3D (unsigned long) __userspace_relay_signal;
> > > +}
> > > +
>=20
> This is a bit scary code which I tried to handle when SIGSEGV is
> raised by host for a userspace program running on UML (nommu).
>=20
> # and I should remember my XXX tag is important to fix....
>=20
> let me try to explain what happens and what I tried to solve.
>=20
> The SEGV signal from userspace program is delivered to userspace but
> if we don't fix the code raising the signal, after (um) rt_sigreturn,
> it will restart from $rip and raise SIGSEGV again.
>=20
> # so, yes, we've already relied on host and um's rt_sigreturn to
> =C2=A0 restore various things.
>=20
> when a uml userspace crashes with SIGSEGV,
>=20
> - host kernel raises SIGSEGV (at original $rip)
> - caught by uml process (hard_handler)
> - raise a signal to uml userspace process (segv_handler)
> - handler ends (hard_handler)
> - (host) run restorer (rt_sigreturn, registered by (libc)sigaction,
> =C2=A0 not (host) rt_sigaction)
> - return back to the original $rip
> - (back to top)
>=20
> this is the case where endless loop is happened.
> um's sa_handler isn't called as rt_sigreturn (um) isn't called.
> and the my original attempt (__userspace_relay_signal) is what I tried.
>=20
> I agree that it is lazy to call a dummy syscall (indeed, getpid).
> I'm trying to introduce another routine to jump into userspace and
> call (um) rt_sigreturn after (host) rt_sigreturn.
>=20
> > And this is really confusing me. The way I am reading it, the code
> > tries to do:
> > =C2=A0=C2=A0 1. Rewrite RIP to jump to __userspace_relay_signal
> > =C2=A0=C2=A0 2. Trigger a getpid syscall (to do "nothing"?)
> > =C2=A0=C2=A0 3. Let do_syscall_64 fire the signal from interrupt_end
>=20
> correct.
>=20
> > However, then that really confuses me, because:
> > =C2=A0* If I am reading it correctly, then this approach will destroy t=
he
> > =C2=A0=C2=A0 contents of various registers (RIP, RAX and likely more)
> > =C2=A0* This would result in an incorrect mcontext in the userspace sig=
nal
> > =C2=A0=C2=A0 handler (which could be relevant if userspace is inspectin=
g it)
> > =C2=A0* However, worst, rt_sigreturn will eventually jump back
> > =C2=A0=C2=A0 into__userspace_relay_signal, which has nothing to return =
to.
> > =C2=A0* Also, relay_signal doesn't use this? What happens for a SIGFPE,=
 how
> > =C2=A0=C2=A0 is userspace interrupted immediately in that case?
>=20
> relay_signal shares the same goal of this, indeed.
> but the issue with `mc->gregs[REG_RIP]` (endless signals) still exists
> I guess.

Well, endless signals only exist as long as you exit to the same
location. My suggestion was to read the user state from the mcontext
(as SECCOMP mode does it) and executing the signal right away, i.e.:
 * Fetch the current registers from the mcontext
 * Push the signal context onto the userspace stack
 * Modify the host mcontext to set registers for the signal handler
 * Jump back to userspace by doing a "return"

Said differently, I really prefer deferring as much logic as possible
to the host. This is both safer and easier to understand. Plus, it also
has the advantage of making it simpler to port UML to other
architectures.

> > Honestly, I really think we should take a step back and swap the
> > current syscall entry/exit code. That would likely also simplify
> > floating point register handling, which I think is currently
> > insufficient do deal with the odd special cases caused by different
> > x86_64 hardware extensions.
> >=20
> > Basically, I think nommu mode should use the same general approach as
> > the current SECCOMP mode. Which is to use rt_sigreturn to jump into
> > userspace and let the host kernel deal with the ugly details of how to
> > do that.
>=20
> I looked at how MMU mode (ptrace/seccomp) does handle this case.
>=20
> In nommu mode, we don't have external process to catch signals so, the
> nommu mode uses hard_handler() to catch SEGV/FPE of userspace
> programs.=C2=A0 While mmu mode calls segv_handler not in a context of
> signal handler.
>=20
> # correct me if I'm wrong.
>=20
> thus, mmu mode doesn't have this situation.

Yes, it does not have this specific issue. But see the top of the mail
for other issues that are somewhat related.

> I'm attempting various ways; calling um's rt_sigreturn instead of
> host's one, which doesn't work as host restore procedures (unblocking
> masked signals, restoring register states, etc) aren't called.
>=20
> I'll update here if I found a good direction, but would be great if
> you see how it should be handled.

Can we please discuss possible solutions? We can figure out the details
once it is clear how the interaction with the host should work.

I still think that the idea of using the kernel task stack as the
signal stack is really elegant. Actually, doing that in normal UML may
be how we can fix the issues mentioned at the top of my mail. And for
nommu, we can also use the host mcontext to jump back into userspace
using a simple "return".

Conceptually it seems so simple.

Benjamin


>=20
> -- Hajime
>=20
> > I believe that this requires a second "userspace" sigaltstack in
> > addition to the current "IRQ" sigaltstack. Then switching in between
> > the two (note that the "userspace" one is also used for IRQs if those
> > happen while userspace is executing).
> >=20
> > So, in principle I would think something like:
> > =C2=A0* to jump into userspace, you would:
> > =C2=A0=C2=A0=C2=A0 - block all signals
> > =C2=A0=C2=A0=C2=A0 - set "userspace" sigaltstack
> > =C2=A0=C2=A0=C2=A0 - setup mcontext for rt_sigreturn
> > =C2=A0=C2=A0=C2=A0 - setup RSP for rt_sigreturn
> > =C2=A0=C2=A0=C2=A0 - call rt_sigreturn syscall
> > =C2=A0* all signal handlers can (except pure IRQs):
> > =C2=A0=C2=A0=C2=A0 - check on which stack they are
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -> easy to detect whether we are in kern=
el mode
> > =C2=A0=C2=A0=C2=A0 - for IRQs one can probably handle them directly (an=
d return)
> > =C2=A0=C2=A0=C2=A0 - in user mode:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + store mcontext location and info=
rmation needed for rt_sigreturn
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + jump back into kernel task stack
> > =C2=A0* kernel task handler to continue would:
> > =C2=A0=C2=A0=C2=A0 - set sigaltstack to IRQ stack
> > =C2=A0=C2=A0=C2=A0 - fetch register from mcontext
> > =C2=A0=C2=A0=C2=A0 - unblock all signals
> > =C2=A0=C2=A0=C2=A0 - handle syscall/signal in whatever way needed
> >=20
> > Now that I wrote about it, I am thinking that it might be possible to
> > just use the kernel task stack for the signal stack. One would probably
> > need to increase the kernel stack size a bit, but it would also mean
> > that no special code is needed for "rt_sigreturn" handling. The rest
> > would remain the same.
> >=20
> > Thoughts?
> >=20
> > Benjamin
> >=20
> > > [SNIP]
> >=20
>=20

