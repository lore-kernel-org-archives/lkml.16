Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2202A748F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749820131; cv=none; b=C5RDcDSuQK35HRR5lLI7iN7RqpXNnWSYG32AEXqt4IPrUNdF+ovSw0wsDpDBvCdHG9xd0KejVmlF0tFpkfGbu5jhcmK7Mk/uy9OnXmkO+FnNV4MIm1WYq14+gJrHDxRUWd6CMgBxci12ZQ+OCOn8HgSr3wmtn4KVJsgVJko6/uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749820131; c=relaxed/simple;
	bh=1LaYV7MhhzgJiUrta6PuXTkOikRroZ0koqMu6oLF2l8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CL5Q5hLXqfAgLbKIdx/xbWlYi3gttpydLeGHffgh42zPEs7Sfav/en5PT32jrw1XAnNB1LUadJas6rkWTZSMtN++eRh1VpcqfB7jc4e2Kri7rFSCdym7CyE91ZeqKG/bjXKramSmoZHssoNPrVxSB7XM4XRVGfPGwU+6dfLCwXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dIMjIfy+; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MOUjajxb; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dIMjIfy+";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MOUjajxb"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749820128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z31RB5aO5339q+fZJTs6E2r8Q/+Wcgh+80WzagvlQ7s=;
	b=dIMjIfy+dfqOhy+YyMfSRsGc4NvTjdL6ai9RuUctaBX0j/eKQIj6HP18yLc3G76CpfWGgm
	T7knTqtLpemWfFT1+4NNNRh8nm1ZPE0YHQdHK16B8jcl1z+zPli/1wfySRUi3j1I6VTmf9
	5h3eO7Rg2FDHvLhtbJg4r5kG3KVTIRCK0KUSPbrmhO6v4Mc3ZrCuEQxX8wxpNr3GIdURK3
	4yx/iv2bkT0VWQk/0loYDpEyx19C1BQEbSqRUkW1e5zgU3XMYh6aU0Kl/f47iaRf8PDEkO
	bRek8bZyZlQCUHmfzgRMNGQzyXk4xKp8qiBC9bWYvOFrmGHDeu2Ws2mkIOC5Mw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749820128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z31RB5aO5339q+fZJTs6E2r8Q/+Wcgh+80WzagvlQ7s=;
	b=MOUjajxb7iXFW1qFkqe+g05LO01nURwZ8T+Ela+rCHA1oNw2yQAcjSnySUclcw3bRalQWG
	eNGjpcViv5MdljBw==
To: Pranav Tyagi <pranav.tyagi03@gmail.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 =?utf-8?Q?Andr=C3=A9?= Almeida <andrealmeid@igalia.com>,
 linux-kernel@vger.kernel.org,
 jann@thejh.net, keescook@chromium.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] futex: don't leak robust_list pointer on exec race
In-Reply-To: <CAH4c4jLjSBxbd3bqkdgcCSWqXURratANgnbq9negrSU283xHpg@mail.gmail.com>
References: <20250607064444.4310-1-pranav.tyagi03@gmail.com>
 <87cybdp7to.ffs@tglx>
 <CAH4c4jLjSBxbd3bqkdgcCSWqXURratANgnbq9negrSU283xHpg@mail.gmail.com>
Date: Fri, 13 Jun 2025 15:08:47 +0200
Message-ID: <87frg3ss9s.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11 2025 at 19:33, Pranav Tyagi wrote:
> On Mon, Jun 9, 2025 at 3:15=E2=80=AFPM Thomas Gleixner <tglx@linutronix.d=
e> wrote:
> Does the revised version below address the concerns more effectively
> or does it still need a bit more seasoning?
>
> "Currently, sys_get_robust_list() and compat_get_robust_list() perform a
> ptrace_may_access() check to verify if the calling task is allowed to
> query another task=E2=80=99s robust_list pointer. However, this check is =
racy
> against a concurrent exec() in the target process.
>
> During exec(), a task's credentials and memory mappings can change, and
> the task may transition from a non-privileged binary to a privileged one
> (e.g., a setuid binary). If get_robust_list() performs ptrace_may_access()
> before this transition, it may wrongly allow access to sensitive
> information after the target becomes privileged.
>
> To address this, a read lock is taken on signal->exec_update_lock prior
> to invoking ptrace_may_access() and accessing the robust_list. This
> ensures that the target task's exec state remains stable during the
> check, allowing for consistent and synchronized validation of
> credentials."

That's way better, but it still does not explain what the consequences
of the racy access are.
>>
>> You really did not have a better idea than copying all of that logic
>> into the compat code?
>
> As I=E2=80=99m still learning, I wasn=E2=80=99t quite sure how to avoid
> duplication there. Would factoring out the common logic into a helper fun=
ction
> be the right direction? I=E2=80=99d be grateful for your suggestion.

Exactly.

Thanks,

        tglx
