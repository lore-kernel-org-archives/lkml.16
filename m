Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A0D24C669
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 13:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739282159; cv=none; b=q+XfeQ6ScKauVStv+ffrqbcCgNWz6v2zC+UXzTR9Lrd3a9aLZJomhEWi5HrBoPJMJdFNf4zC2k8s8V+4NS39ls0LjBcprhMXKS0iOMo7zhnJQjzpINXnkUCpnuVwE9cAeXSHIhZ5zoPucDuoiNKBdZkvi913uQ2gsUVPf8xR8Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739282159; c=relaxed/simple;
	bh=tvddLOD38SbA+nE14izQGPNoMlGp5ZWiCv7xIdyaTR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XdlNxB4YIsfcf6KknIJpsTp7kKMhJhObirMg2WiNwrHY2tvYVxqb239A4G/ESNXlHEivw5yZlXMHwBrAxwZkyPNOSgHBhuYBypTyRloJwzyf4uPIHhp7PwyRqYW3NcADkrhzsAE32jATBPJ0su18IpAfJdIhof7JuIuLt65JqUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LjEEbJVK; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LjEEbJVK"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2f44353649aso8177571a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 05:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739282157; x=1739886957; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AhF+JZnbICstMQ4SyijmaSYDsITfNwFybUAYOWyiZXU=;
        b=LjEEbJVKsnr9/Bsf8TZWXbIEH1ixlpJK61YR+lS6w6zVvRx0ZMR8sUTqELQhPhYvx0
         g6F8Xe/usYq8l/6WOpRHuk63HnkmtvH6PvLGsgcpB+9NeHgdaGSBIJq7nbE9ilO28O3R
         g3w0p4vW/9Pggxyymt7DJIK4Hpcvocw8jjphJjx7OaqZAwzzfqGCiK52B5fxCqrBWDSn
         JGYdvodniqgfzB9aSif2AxWUg746i+Z5vsZbd0bmnP4JxqvmBMgVZuEuui9KQ0lE1efb
         pciajeEA29strUtEP+X4Z67WFSHVxbszxRS3WwB/ywXHhenuZtNgHUZJIRZokwpsrs7K
         sNEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739282157; x=1739886957;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AhF+JZnbICstMQ4SyijmaSYDsITfNwFybUAYOWyiZXU=;
        b=ce7mX5KDPgDDfnYqJToxWGOqDgSpLAdLbhx6lBQCCeyxvKghcsUFJyAQeJPIRp8/6A
         y+4SXztex1a9lr3lNmOrowN1pS9rm35e6cbf0Y1qU6i73d4XDVxhK+liWxFEeix/cF/M
         k6cJZCb9c8vHd1951wr5fEw0Ov7cfpvX10aKv5gzDzwNnqpuPi33em+71GG5wj99CnHA
         kXeAEdXI+02P+Dtl3nrCQ6bcrC3AO7Fg+FU8wjVB/akovhlGaw+Hq9VvI6aG00DI2kfc
         X47NL3mg14mHMccvdNljkZwVF18S27K/G6DG3jcxOOvCZwWgLHaWEPqeVKUP052vWu73
         bCQQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2djfungK9EreYIhwm+eoQGejdTb7ayJxI0QZK10GuyoT+NrwqKYRYQ3wRmz10lqFy8/9ByRkL3dNsMv0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQZjNTA9/1bcCrJrrW4hej5/EtdW574fadQenwQgXcPBfUJ50b
	C4FP0uEVlHje8wrxQtMhzWJOKIuQxPqnXPL1kKIqZzJFq7xJruLWQgUiqYi3KLef+TIvzzBhjCA
	X6GS9NmLZu0jQp4X7X9wL1AbFNI/PF8I/7obW
X-Gm-Gg: ASbGncs0nRG0IggTpFnE0d/ctFmYr35gRwGFnaen6xJN41YYX9E2P90jFPPzRfWX7Sg
	NMrvrn/dmxnsWUhrVEqtPixpiLBrBvUFn7xLvpGozJUJO/0eh8MGape8/omKfNoLuKuHWy1l3kO
	m81NS6KpCyVWlY6ON/sEq30+rgAHE=
X-Google-Smtp-Source: AGHT+IGroUNVHpMBAUy/bObZea2jE/snBP4iAn1fJ0F8Y+yGqofcGPH5OOKF/rW4Qwm5mzGvQOH1DLn2V2e6J52emRE=
X-Received: by 2002:a17:90b:1d45:b0:2ea:5e0c:2847 with SMTP id
 98e67ed59e1d1-2fa9ee17fb8mr4391611a91.22.1739282157250; Tue, 11 Feb 2025
 05:55:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206181711.1902989-1-elver@google.com> <20250206181711.1902989-9-elver@google.com>
 <e276263f-2bc5-450e-9a35-e805ad8f277b@acm.org> <CANpmjNMfxcpyAY=jCKSBj-Hud-Z6OhdssAXWcPaqDNyjXy0rPQ@mail.gmail.com>
 <f5eda818-6119-4b8f-992f-33bc9c184a64@acm.org>
In-Reply-To: <f5eda818-6119-4b8f-992f-33bc9c184a64@acm.org>
From: Marco Elver <elver@google.com>
Date: Tue, 11 Feb 2025 14:55:20 +0100
X-Gm-Features: AWEUYZkwbHjIdQKR2hqck9okMpxl0TDfWkkc2sBGpPLWquXQ8_lyXjiGcdcjlSE
Message-ID: <CANpmjNPxyWey6v1tj6TwtN6Pe8Ze=wrfFFjuJFzCQTd4XM8xQA@mail.gmail.com>
Subject: Re: [PATCH RFC 08/24] lockdep: Annotate lockdep assertions for
 capability analysis
To: Bart Van Assche <bvanassche@acm.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Alexander Potapenko <glider@google.com>, 
	Bill Wendling <morbo@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@kernel.org>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joel@joelfernandes.org>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Triplett <josh@joshtriplett.org>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	Will Deacon <will@kernel.org>, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, rcu@vger.kernel.org, linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 10 Feb 2025 at 19:54, Bart Van Assche <bvanassche@acm.org> wrote:
>
>
> On 2/10/25 10:23 AM, Marco Elver wrote:
> > If you try to write code where you access a guarded_by variable, but
> > the lock is held not in all paths we can write it like this:
> >
> > struct bar {
> >    spinlock_t lock;
> >    bool a; // true if lock held
> >    int counter __var_guarded_by(&lock);
> > };
> > void foo(struct bar *d)
> > {
> >     ...
> >     if (d->a) {
> >       lockdep_assert_held(&d->lock);
> >       d->counter++;
> >     } else {
> >       // lock not held!
> >     }
> >    ...
> > }
> >
> > Without lockdep_assert_held() you get false positives, and there's no
> > other good way to express this if you do not want to always call foo()
> > with the lock held.
> >
> > It essentially forces addition of lockdep checks where the static
> > analysis can't quite prove what you've done is right. This is
> > desirable over adding no-analysis attributes and not checking anything
> > at all.
>
> In the above I see that two different options have been mentioned for
> code that includes conditional lockdep_assert_held() calls:
> - Either include __assert_cap() in the lockdep_assert_held() definition.
> - Or annotate the entire function with __no_thread_safety_analysis.
>
> I think there is a third possibility: add an explicit __assert_cap()
> call under the lockdep_assert_held() call. With this approach the
> thread-safety analysis remains enabled for the annotated function and
> the compiler will complain if neither __must_hold() nor __assert_cap()
> has been used.

That's just adding more clutter. Being able to leverage existing
lockdep_assert to avoid false positives (at potential cost of few
false negatives) is a decent trade-off. Sure, having maximum checking
guarantees would be nice, but there's a balance we have to strike vs.
ergonomics, usability, and pointless clutter.

Can we initially try to avoid clutter as much as possible? Then, if
you feel coverage is not good enough, make the analysis stricter by
e.g. removing the implicit assert from lockdep_assert in later patches
and see how it goes.

I'm basing my judgement here on experience having worked on other
analysis in the kernel, and the biggest request from maintainers has
always been to "avoid useless clutter and false positives at all
cost", often at the cost of increased potential for false negatives
but avoiding false positives and reducing annotations (I can dig out
discussions we had for KMSAN if you do not believe me...).
