Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21888263C90
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 23:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750807211; cv=none; b=T3olqWAp1kAEKHP0MhOZvcRllvLHt1HCN9nRxo9Rz2gnUjOjqMn4eOmfWFB3HUN4G2lKIBenLCgi1jyQoY5NZiiLIKuEeEBKVRVYk9tdHO4S3WRd4+3LxiWZXzUwLYY21v9MDjSSedV0v0oWwl8exdwEUK3aK0u+FgGGTSCQOQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750807211; c=relaxed/simple;
	bh=LlpC1YfPX0wSzNxpniPUr6menRDKhqJ5YjGVmLYKGrU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gP+Fazcl3NEAWQH129RxBWV1RGgHykR1wJAsOPKvry1YqqjAYz+okyVRt/uYxQBNxzMrWJ4gptI9FVNukv7pmmWuI3KdwX/ge6WvGvxDBw54wdkQCAX09DmB8/3XSC42BMRenwgUnfTQngsegTyV8c+AFlwI8fZCyUVlK18Mgm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=UAthxjcK; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="UAthxjcK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=V8gmztvWykFpmhkeFbGIlEUdI1CttO0IpihuArM71Qk=;
	t=1750807209; x=1752016809; b=UAthxjcKMQ5A286Hj/YnPgDPjMRqoi31u6mQSOLK6TLuE2P
	snaxafCGSK7wBx1K2q3pOMA7yZTTTMyxP+i3DrrDYWHgQ37dI2dGioPpmZEcZaOJxV+cChLuUXE1r
	itrWKI8NG/wXKESV6OQ6i2oOSW9vYZYfixW2t+6RNOBmdMYJam/r8dmb1d1OdlLidIPViWRIzVNZy
	Xs0ZnyiwTRD44myxk72cXDtLMqBZ4DKuI0f5MOYmJEBUWu5TUg5XnSnGOroZfmTKVNG+wj2asCRgC
	1U6WfwvtPHJuYihZ/uZOE1tafekcjwDfSbug7g3HnXVC/EO9YEFCVojdxKDsl7/g==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <benjamin@sipsolutions.net>)
	id 1uUCvs-00000009Aa0-0S6V;
	Wed, 25 Jun 2025 01:20:04 +0200
Message-ID: <3b407ed711c5d7e1819da7513c3e320699473b2d.camel@sipsolutions.net>
Subject: Re: [PATCH v10 09/13] x86/um: nommu: signal handling
From: Benjamin Berg <benjamin@sipsolutions.net>
To: Hajime Tazaki <thehajime@gmail.com>, linux-um@lists.infradead.org
Cc: ricarkol@google.com, Liam.Howlett@oracle.com,
 linux-kernel@vger.kernel.org
Date: Wed, 25 Jun 2025 01:20:03 +0200
In-Reply-To: <548dcef198b79a4f8eb166481e39abe6e13ed2e3.1750594487.git.thehajime@gmail.com>
References: <cover.1750594487.git.thehajime@gmail.com>
	 <548dcef198b79a4f8eb166481e39abe6e13ed2e3.1750594487.git.thehajime@gmail.com>
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

On Mon, 2025-06-23 at 06:33 +0900, Hajime Tazaki wrote:
> This commit updates the behavior of signal handling under !MMU
> environment. It adds the alignment code for signal frame as the frame
> is used in userspace as-is.
>=20
> floating point register is carefully handling upon entry/leave of
> syscall routine so that signal handlers can read/write the contents of
> the register.
>=20
> It also adds the follow up routine for SIGSEGV as a signal delivery runs
> in the same stack frame while we have to avoid endless SIGSEGV.
>=20
> Signed-off-by: Hajime Tazaki <thehajime@gmail.com>
> ---
> =C2=A0arch/um/include/shared/kern_util.h=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 =
4 +
> =C2=A0arch/um/nommu/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> =C2=A0arch/um/nommu/os-Linux/signal.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 13 ++
> =C2=A0arch/um/nommu/trap.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 194 +++++++++++=
+++++++++++++++
> =C2=A0arch/x86/um/nommu/do_syscall_64.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 6 +
> =C2=A0arch/x86/um/nommu/os-Linux/mcontext.c |=C2=A0 11 ++
> =C2=A0arch/x86/um/shared/sysdep/mcontext.h=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0arch/x86/um/shared/sysdep/ptrace.h=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 =
2 +-
> =C2=A08 files changed, 231 insertions(+), 2 deletions(-)
> =C2=A0create mode 100644 arch/um/nommu/trap.c
>=20
> [SNIP]
> diff --git a/arch/x86/um/nommu/os-Linux/mcontext.c b/arch/x86/um/nommu/os=
-Linux/mcontext.c
> index c4ef877d5ea0..955e7d9f4765 100644
> --- a/arch/x86/um/nommu/os-Linux/mcontext.c
> +++ b/arch/x86/um/nommu/os-Linux/mcontext.c
> @@ -6,6 +6,17 @@
> =C2=A0#include <sysdep/mcontext.h>
> =C2=A0#include <sysdep/syscalls.h>
> =C2=A0
> +static void __userspace_relay_signal(void)
> +{
> + /* XXX: dummy syscall */
> + __asm__ volatile("call *%0" : : "r"(__kernel_vsyscall), "a"(39) :);
> +}

39 is NR__getpid, I assume?

The "call *%0" looks like it is code for retpolin, I think this would
currently just segfault.

> +
> +void set_mc_userspace_relay_signal(mcontext_t *mc)
> +{
> + mc->gregs[REG_RIP] =3D (unsigned long) __userspace_relay_signal;
> +}
> +

And this is really confusing me. The way I am reading it, the code
tries to do:
   1. Rewrite RIP to jump to __userspace_relay_signal
   2. Trigger a getpid syscall (to do "nothing"?)
   3. Let do_syscall_64 fire the signal from interrupt_end

However, then that really confuses me, because:
 * If I am reading it correctly, then this approach will destroy the
   contents of various registers (RIP, RAX and likely more)
 * This would result in an incorrect mcontext in the userspace signal
   handler (which could be relevant if userspace is inspecting it)
 * However, worst, rt_sigreturn will eventually jump back
   into__userspace_relay_signal, which has nothing to return to.
 * Also, relay_signal doesn't use this? What happens for a SIGFPE, how
   is userspace interrupted immediately in that case?


Honestly, I really think we should take a step back and swap the
current syscall entry/exit code. That would likely also simplify
floating point register handling, which I think is currently
insufficient do deal with the odd special cases caused by different
x86_64 hardware extensions.

Basically, I think nommu mode should use the same general approach as
the current SECCOMP mode. Which is to use rt_sigreturn to jump into
userspace and let the host kernel deal with the ugly details of how to
do that.

I believe that this requires a second "userspace" sigaltstack in
addition to the current "IRQ" sigaltstack. Then switching in between
the two (note that the "userspace" one is also used for IRQs if those
happen while userspace is executing).

So, in principle I would think something like:
 * to jump into userspace, you would:
    - block all signals
    - set "userspace" sigaltstack
    - setup mcontext for rt_sigreturn
    - setup RSP for rt_sigreturn
    - call rt_sigreturn syscall
 * all signal handlers can (except pure IRQs):
    - check on which stack they are
      -> easy to detect whether we are in kernel mode
    - for IRQs one can probably handle them directly (and return)
    - in user mode:
       + store mcontext location and information needed for rt_sigreturn
       + jump back into kernel task stack
 * kernel task handler to continue would:
    - set sigaltstack to IRQ stack
    - fetch register from mcontext
    - unblock all signals
    - handle syscall/signal in whatever way needed

Now that I wrote about it, I am thinking that it might be possible to
just use the kernel task stack for the signal stack. One would probably
need to increase the kernel stack size a bit, but it would also mean
that no special code is needed for "rt_sigreturn" handling. The rest
would remain the same.

Thoughts?

Benjamin

> [SNIP]

