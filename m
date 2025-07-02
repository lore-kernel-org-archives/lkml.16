Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E151DFDAB
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 04:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751431077; cv=none; b=RNF28D8RJmPmgKBGJsWW6YJL3LvnR+YqwZvrjK0DElrsw2XtRpY1lLZqyjHdjj6l3FLJ8/Yr4c5JnwvwSpJNd5EKn+hgltEc7cRTkDiD89ys3GARmHsr9buGhYVftqgkgW7GLU1pIJkFAowhFzA/aT4uimtVEVpAWrC8mMUm8L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751431077; c=relaxed/simple;
	bh=K+aSR1Zxvr8AQBX0Ee6UZKKbxHTUwWY63MRdLabpiss=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AyeSIOyxrIElHCTPgiDRmHSN6ilFrseIJQyd5/gnWlBjNAprDJRtSt2yW9XjUuK4Uuxlv2ZNBKgkf2nXzNVIWcv4WBqhYb2UdDFA1cG+9aHDnie1Qp0giNLRMbfLIhrRdJPIZM9aCKifrudHal6IZxDEQdiyymCp9LWnW3tyzsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lcY4r71O; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lcY4r71O"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7426c44e014so6538059b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 21:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751431075; x=1752035875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DqKHZ3YOCI5aMWXYNxmGmyH7fkJ1YGDCrEv2jLSP254=;
        b=lcY4r71ORlp3xoJXt8mA8MzRL/Bw6vVUn0cdd8whKBgECait4ODJd7aLXl4pt+1Fdc
         ejXjaWw7aUyaBtSVNyihT/ThMRKqa9WlX7+lGjfTGf3tPSE81WXzuSCmjsqUUKt06mJw
         yCI8PdPldCqBdMAcwsbwNV37qbLTAdAdfvdL6PejcCdh+Awns8EcVu1/zUBP3HGshoub
         yaJK2DEKmdKLOWmThS21usnhtJieKBYThe+L6Xf6xKACSdrK4KM8fup8tB7AocsrLhU3
         MBAMcuFpGEnoJYS3R+blD2W28yTvossE0ASjqnAo90tYAz+jjD1qZJsnitH6GOpr+HEM
         5Kbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751431075; x=1752035875;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DqKHZ3YOCI5aMWXYNxmGmyH7fkJ1YGDCrEv2jLSP254=;
        b=NNTx8E/jTXqAjJncNltWOKA7MJ6y7s4qH6uIwAkCRBBBGduVu3EfoYMkBXNbPu243g
         qbS/0oskejhuqlZ4mBRZ4hb7HEPYd8jvtq7xqFsyRefzH4OZCsJL6VY+8961L60J/N6o
         uEcsLyIi+SFgQUqPGtjX0O5mFSBaIchGdWhNsKijFP9JI5tEcoQMFqXfvghaXYvBVirh
         6GQqaKgiYQRfev4U1OahmLgfaNyGourRY3diZ8Sdez9emiH2Cz9nSIIdhpFXQdpjX9j6
         JbuLxgte16dr8zO7lFsfVNZs5Zp2XM1bf4yZM4/3x0Si+ifAEdV480ytUrWSDSeezVuw
         gqYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCIvvLDxP6yPzQ+oSGpFYEO/mg8X5CXrNK90Yqk47KCSMbbySG16yq2klVVOyWeb/CowAqpE1uZIDTKI4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+9eW7X9Z5a5aRck02iAWlfzEZMi1p0yFaBkjJ9bH7k+9aaVBx
	Qq53Cb4LbLml4rCFHf9UwMmIgocZvw21RedMAE9xPu7hMPnvx1iM+dU7
X-Gm-Gg: ASbGncvSMBKXw9M9v5BGUe+JFrMLHrIkrWmhHw9rwzz5vHyrsONr+FJMFYw3OqPblHH
	9d7EEZFVOXefhRPnGa9ihg9CTkBSI3JF/GWjvW9h1eRd7QoFydASEP7tFnh9MR5cQoru/wASzRA
	TmRLZlufLhbtm0EdkZW+Ea/7RwAZrGxY2I2ZgaN+0RuG2c53uTCw5LZ26ZHnJjexZ93GmCIWb8k
	Yfsw8SVl2YukMIKidU1x8d9uzJbL3Ufr+kQW8zYvvKFbdrAAyECGSkeisQOoMcu3KGPw5ZhydG+
	3FnAQ4eF0dGtfrhyfPNyDn5XjJeOZQVb7t4qw/abiWKmomtB0Ck505s1peRB6jJKNJvjnLhq9BB
	t72SDfylP6lpCEH4mJVJ/24GaUnroSKPTa6OOqZc2+s0jQDatD5WtvAb/aCQ=
X-Google-Smtp-Source: AGHT+IFARmBZdAwHylJZygPinHDAsNzIEnh0TD+qkpE/EoEdqBmplqR8UldnjCJiTu8d6KNKM5ZjNQ==
X-Received: by 2002:a05:6a00:10cf:b0:740:b394:3ebd with SMTP id d2e1a72fcca58-74b50dc915emr1964365b3a.7.1751431074329;
        Tue, 01 Jul 2025 21:37:54 -0700 (PDT)
Received: from mars.local.gmail.com (221x241x217x81.ap221.ftth.ucom.ne.jp. [221.241.217.81])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af541e664sm12501384b3a.68.2025.07.01.21.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 21:37:53 -0700 (PDT)
Date: Wed, 02 Jul 2025 13:37:50 +0900
Message-ID: <m2jz4r438h.wl-thehajime@gmail.com>
From: Hajime Tazaki <thehajime@gmail.com>
To: benjamin@sipsolutions.net
Cc: linux-um@lists.infradead.org,
	ricarkol@google.com,
	Liam.Howlett@oracle.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 09/13] x86/um: nommu: signal handling
In-Reply-To: <a9133d9a69843948078f590a102bad9302f3f554.camel@sipsolutions.net>
References: <cover.1750594487.git.thehajime@gmail.com>
	<548dcef198b79a4f8eb166481e39abe6e13ed2e3.1750594487.git.thehajime@gmail.com>
	<3b407ed711c5d7e1819da7513c3e320699473b2d.camel@sipsolutions.net>
	<m2sejl47ke.wl-thehajime@gmail.com>
	<734965ac85b2c4cf481cc98ac53052fd5064d30e.camel@sipsolutions.net>
	<m2plem3urj.wl-thehajime@gmail.com>
	<a9133d9a69843948078f590a102bad9302f3f554.camel@sipsolutions.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/26.3 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


Hello Benjamin,

On Tue, 01 Jul 2025 21:03:36 +0900,
Benjamin Berg wrote:
>=20
> Hi Hajim,
>=20
> On Mon, 2025-06-30 at 10:04 +0900, Hajime Tazaki wrote:
> >=20
> > Hello Benjamin,
> >=20
> > On Sat, 28 Jun 2025 00:02:05 +0900,
> > Benjamin Berg wrote:
> > >=20
> > > Hi,
> > >=20
> > > On Fri, 2025-06-27 at 22:50 +0900, Hajime Tazaki wrote:
> > > > thanks for the comment on the complicated part of the kernel (signa=
l).
> > >=20
> > > This stuff isn't simple.
> > >=20
> > > Actually, I am starting to think that the current MMU UML kernel also
> > > needs a redesign with regard to signal handling and stack use in that
> > > case. My current impression is that the design right now only permits
> > > voluntarily scheduling. More specifically, scheduling in response to =
an
> > > interrupt is impossible.
> > >=20
> > > I suppose that works fine, but it also does not seem quite right.
> >=20
> > thanks for the info.=C2=A0 it's very useful to understand what's going =
on.
> >=20
> > (snip)
> >=20
> > > > > > +void set_mc_userspace_relay_signal(mcontext_t *mc)
> > > > > > +{
> > > > > > + mc->gregs[REG_RIP] =3D (unsigned long) __userspace_relay_sign=
al;
> > > > > > +}
> > > > > > +
> > > >=20
> > > > This is a bit scary code which I tried to handle when SIGSEGV is
> > > > raised by host for a userspace program running on UML (nommu).
> > > >=20
> > > > # and I should remember my XXX tag is important to fix....
> > > >=20
> > > > let me try to explain what happens and what I tried to solve.
> > > >=20
> > > > The SEGV signal from userspace program is delivered to userspace but
> > > > if we don't fix the code raising the signal, after (um) rt_sigretur=
n,
> > > > it will restart from $rip and raise SIGSEGV again.
> > > >=20
> > > > # so, yes, we've already relied on host and um's rt_sigreturn to
> > > > =C2=A0 restore various things.
> > > >=20
> > > > when a uml userspace crashes with SIGSEGV,
> > > >=20
> > > > - host kernel raises SIGSEGV (at original $rip)
> > > > - caught by uml process (hard_handler)
> > > > - raise a signal to uml userspace process (segv_handler)
> > > > - handler ends (hard_handler)
> > > > - (host) run restorer (rt_sigreturn, registered by (libc)sigaction,
> > > > =C2=A0 not (host) rt_sigaction)
> > > > - return back to the original $rip
> > > > - (back to top)
> > > >=20
> > > > this is the case where endless loop is happened.
> > > > um's sa_handler isn't called as rt_sigreturn (um) isn't called.
> > > > and the my original attempt (__userspace_relay_signal) is what I tr=
ied.
> > > >=20
> > > > I agree that it is lazy to call a dummy syscall (indeed, getpid).
> > > > I'm trying to introduce another routine to jump into userspace and
> > > > call (um) rt_sigreturn after (host) rt_sigreturn.
> > > >=20
> > > > > And this is really confusing me. The way I am reading it, the code
> > > > > tries to do:
> > > > > =C2=A0=C2=A0 1. Rewrite RIP to jump to __userspace_relay_signal
> > > > > =C2=A0=C2=A0 2. Trigger a getpid syscall (to do "nothing"?)
> > > > > =C2=A0=C2=A0 3. Let do_syscall_64 fire the signal from interrupt_=
end
> > > >=20
> > > > correct.
> > > >=20
> > > > > However, then that really confuses me, because:
> > > > > =C2=A0* If I am reading it correctly, then this approach will des=
troy the
> > > > > =C2=A0=C2=A0 contents of various registers (RIP, RAX and likely m=
ore)
> > > > > =C2=A0* This would result in an incorrect mcontext in the userspa=
ce signal
> > > > > =C2=A0=C2=A0 handler (which could be relevant if userspace is ins=
pecting it)
> > > > > =C2=A0* However, worst, rt_sigreturn will eventually jump back
> > > > > =C2=A0=C2=A0 into__userspace_relay_signal, which has nothing to r=
eturn to.
> > > > > =C2=A0* Also, relay_signal doesn't use this? What happens for a S=
IGFPE, how
> > > > > =C2=A0=C2=A0 is userspace interrupted immediately in that case?
> > > >=20
> > > > relay_signal shares the same goal of this, indeed.
> > > > but the issue with `mc->gregs[REG_RIP]` (endless signals) still exi=
sts
> > > > I guess.
> > >=20
> > > Well, endless signals only exist as long as you exit to the same
> > > location. My suggestion was to read the user state from the mcontext
> > > (as SECCOMP mode does it) and executing the signal right away, i.e.:
> >=20
> > thanks too;=C2=A0 below is my understanding.
> >=20
> > > =C2=A0* Fetch the current registers from the mcontext
> >=20
> > I guess this is already done in sig_handler_common().
>=20
> Well, not really?
>=20
> It does seem to fetch the general purpose registers. But the code
> pretty much assumes we will return to the same location and only stores
> them on the stack for the signal handler itself. Also, remember that it
> might be userspace or kernel space in your case. The kernel task
> registers are in "switch_buf" while the userspace registers are in
> "regs" of "struct task_struct" (effectively "struct uml_pt_regs").

indeed, the handler returns to the same location.
here is what the current patchset does for the signal handling.

# sorry i might be writing same things several times, but I hope
  this will help to understand/discuss what it should be.

receive signal (from host)
- > call host sa_handler (hard_handler)
 - > sig_handler_common =3D> get_regs_from_mc (fetch host mcontext to um)
 - > set TIF_SIGPENDING (um kernel)
 - > set host mcontext[RIP] to __userspace_relay_signal
(host sa_handler ends)
- call host sa_restorer =3D> return to mcontext[RIP]
 - > call __userspace_relay_signal from mcontext[RIP]
 - > call interrupt_end()
 - > do_signal =3D> handle_signal =3D> setup_signal_stack_si
     (because TIF_SIGPENDING is on above)
 - > call userspace sa_handler
 - > call userspace sa_restorer

instead of set mcontext[RIP] to userspace sa_handler, it uses
__userspace_relay_signal, which configures stack and mcontext (via
interrupt_end, setup_signal_stack_si, etc) and call userspace
sa_handler/restorer after that.

in this way, programs runs userspace sa_handler not in the host
sa_handler context.  I guess this means we don't have to configure
host register/mcontext with the userspace one ?

I agree that the current __userspace_relay_signal can be shrunk not
to call __kernel_vsyscall and focus on interrupt_end and stack
preparation.

> > > =C2=A0* Push the signal context onto the userspace stack
> >=20
> > (guess) this is already done on handle_signal() =3D> setup_signal_stack=
_si().
> >=20
> > > =C2=A0* Modify the host mcontext to set registers for the signal hand=
ler
> >=20
> > this is something which I'm not well understanding.
> > - do you mean the host handler when you say "for the signal handler" ?
> > =C2=A0 or the userspace handler ?
>=20
> Both in a way ;-)
>=20
> I mean modify the registers in the host mcontext so that the UML
> userspace will continue executing inside its signal handler.
>
> > - if former (the host one), maybe mcontext is already there so, it
> > =C2=A0 might not be the one you mentioned.
> > - if the latter, how the original handler (the host one,
> > =C2=A0 hard_handler()) works ? even if we can call userspace handler
> > =C2=A0 instead of the host one, we need to call the host handler (and
> > =C2=A0 restorer).=C2=A0 do we call both ?
> > - and by "to set registers", what register do you mean ? for the
> > =C2=A0 registers inspected by userspace signal handler ?=C2=A0 but if y=
ou set a
> > =C2=A0 register, for instance RIP, as the fault location to the host
> > =C2=A0 register, it will return to RIP after handler and restart the fa=
ult
> > =C2=A0 again ?
>=20
> I am confused, why would the fault handler be restarted? If you modify
> RIP, then the host kernel will not return to the faulting location. You
> were using that already to jump into __userspace_relay_signal. All I am
> arguing that instead of jumping to __userspace_relay_signal you can
> prepare everything and directly jump into the users signal handler.

what I meant in that example is; set host mcontext[RIP] to the fault
location, as a userspace information, which will lead to the fault
again.  But this doesn't change RIP before and after so, I guess this
isn't a good example..
Sorry for the confusion.

> > > =C2=A0* Jump back to userspace by doing a "return"
> >=20
> > this is still also unclear to me.
> >=20
> > it would be very helpful if you point the location of the code (at
> > uml/next tree) on how SECCOMP mode does.=C2=A0 I'm also looking at but
> > really hard to map what you described and the code (sorry).
>=20
> "stub_signal_interrupt" simply returns, which means it jumps into the
> restorer "stub_signal_restorer" which does the rt_sigreturn syscall.
> This means the host kernel restores the userspace state from the
> mcontext. As the mcontext resides in shared memory, the UML kernel can
> update it to specify where the process should continue running (thread
> switching, signals, syscall return value, =E2=80=A6).

thanks !

so, stub_signal_interrupt runs on a different host process.
nommu mode tries to reuse existing host sa_handler (hard_handler) to
do the job (handle SEGV etc).

If there are something missing on hard_handler and co on nommmu mode
for what userspace_tramp does on seccomp mode, I've been trying to
update it.

-- Hajime

>=20
> Benjamin
>=20
> > all of above runs within hard_handler() in nommu mode on SIGSEGV.
> > my best guess is this is different from what ptrace/seccomp do.
> >=20
> > > Said differently, I really prefer deferring as much logic as possible
> > > to the host. This is both safer and easier to understand. Plus, it al=
so
> > > has the advantage of making it simpler to port UML to other
> > > architectures.
> >=20
> > okay.
> >=20
> > >=20
> > > > > Honestly, I really think we should take a step back and swap the
> > > > > current syscall entry/exit code. That would likely also simplify
> > > > > floating point register handling, which I think is currently
> > > > > insufficient do deal with the odd special cases caused by differe=
nt
> > > > > x86_64 hardware extensions.
> > > > >=20
> > > > > Basically, I think nommu mode should use the same general approac=
h as
> > > > > the current SECCOMP mode. Which is to use rt_sigreturn to jump in=
to
> > > > > userspace and let the host kernel deal with the ugly details of h=
ow to
> > > > > do that.
> > > >=20
> > > > I looked at how MMU mode (ptrace/seccomp) does handle this case.
> > > >=20
> > > > In nommu mode, we don't have external process to catch signals so, =
the
> > > > nommu mode uses hard_handler() to catch SEGV/FPE of userspace
> > > > programs.=C2=A0 While mmu mode calls segv_handler not in a context =
of
> > > > signal handler.
> > > >=20
> > > > # correct me if I'm wrong.
> > > >=20
> > > > thus, mmu mode doesn't have this situation.
> > >=20
> > > Yes, it does not have this specific issue. But see the top of the mail
> > > for other issues that are somewhat related.
> > >=20
> > > > I'm attempting various ways; calling um's rt_sigreturn instead of
> > > > host's one, which doesn't work as host restore procedures (unblocki=
ng
> > > > masked signals, restoring register states, etc) aren't called.
> > > >=20
> > > > I'll update here if I found a good direction, but would be great if
> > > > you see how it should be handled.
> > >=20
> > > Can we please discuss possible solutions? We can figure out the detai=
ls
> > > once it is clear how the interaction with the host should work.
> >=20
> > I was wishing to update to you that I'm working on it.=C2=A0 So, your
> > comments are always helpful to me.=C2=A0 Thanks.
> >=20
> > -- Hajime
> >=20
> > > I still think that the idea of using the kernel task stack as the
> > > signal stack is really elegant. Actually, doing that in normal UML may
> > > be how we can fix the issues mentioned at the top of my mail. And for
> > > nommu, we can also use the host mcontext to jump back into userspace
> > > using a simple "return".
> > >=20
> > > Conceptually it seems so simple.
> > >=20
> > > Benjamin
> > >=20
> > >=20
> > > >=20
> > > > -- Hajime
> > > >=20
> > > > > I believe that this requires a second "userspace" sigaltstack in
> > > > > addition to the current "IRQ" sigaltstack. Then switching in betw=
een
> > > > > the two (note that the "userspace" one is also used for IRQs if t=
hose
> > > > > happen while userspace is executing).
> > > > >=20
> > > > > So, in principle I would think something like:
> > > > > =C2=A0* to jump into userspace, you would:
> > > > > =C2=A0=C2=A0=C2=A0 - block all signals
> > > > > =C2=A0=C2=A0=C2=A0 - set "userspace" sigaltstack
> > > > > =C2=A0=C2=A0=C2=A0 - setup mcontext for rt_sigreturn
> > > > > =C2=A0=C2=A0=C2=A0 - setup RSP for rt_sigreturn
> > > > > =C2=A0=C2=A0=C2=A0 - call rt_sigreturn syscall
> > > > > =C2=A0* all signal handlers can (except pure IRQs):
> > > > > =C2=A0=C2=A0=C2=A0 - check on which stack they are
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -> easy to detect whether we are i=
n kernel mode
> > > > > =C2=A0=C2=A0=C2=A0 - for IRQs one can probably handle them direct=
ly (and return)
> > > > > =C2=A0=C2=A0=C2=A0 - in user mode:
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + store mcontext location an=
d information needed for rt_sigreturn
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 + jump back into kernel task=
 stack
> > > > > =C2=A0* kernel task handler to continue would:
> > > > > =C2=A0=C2=A0=C2=A0 - set sigaltstack to IRQ stack
> > > > > =C2=A0=C2=A0=C2=A0 - fetch register from mcontext
> > > > > =C2=A0=C2=A0=C2=A0 - unblock all signals
> > > > > =C2=A0=C2=A0=C2=A0 - handle syscall/signal in whatever way needed
> > > > >=20
> > > > > Now that I wrote about it, I am thinking that it might be possibl=
e to
> > > > > just use the kernel task stack for the signal stack. One would pr=
obably
> > > > > need to increase the kernel stack size a bit, but it would also m=
ean
> > > > > that no special code is needed for "rt_sigreturn" handling. The r=
est
> > > > > would remain the same.
> > > > >=20
> > > > > Thoughts?
> > > > >=20
> > > > > Benjamin
> > > > >=20
> > > > > > [SNIP]
> > > > >=20
> > > >=20
> > >=20
> >=20
>=20
