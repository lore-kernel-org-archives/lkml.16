Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5816327D78C
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745510896; cv=none; b=EaXK0Nuv866joIzHXqV1pbBCMBPwzJXGUDrwot7oHjxd6gOfCbw0ewCkvk+5RV243pBWSgk/9uhNcDyyXyB10AzClPY3iKqk0U/PswF6Dfm0ak2AMt0GXsOGEu7yHcg4VQcDMNWA6+gkU195xtDHp+PWQRBZsfqCIZ2T9AjSSP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745510896; c=relaxed/simple;
	bh=uYWmPDd6dGCG5UIqLBjzPijQmOpSj8ZY1AFu91nEB8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ioibX7Z2EvYmvkrwr6FUeC/kUcXwIJu12Slou5bvYjRw1BuHPQeqRdrbUHcpdJwi9jLnbnL97M9OTqH/wFefvpB6AMlciA5DKkRuTlp7Z1vv+drUgPyRN/J0+H/CFe+u20AWWPk2hr/U9csJfARsIenwxtjcTsXR2TwvRUDMBhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=AE+afHeG; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="AE+afHeG"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-acb415dd8faso192433866b.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745510891; x=1746115691; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kBzGqlReJRCvZloMhkbm/qwk3PtByoa/h3b9iiRxguw=;
        b=AE+afHeG644IzxILzypOfHlhDEfgOLyXGsoCjefDhFwAO7bEJZaiYqGV6DtTuA3i2g
         y5NqxfEvel1L40LWk7xx9TmE3fOKqHvZoyPgKp6ja4s7ln6zV84lWIhsKTJ3nTLX/aw1
         /CsLWx4C/NE9hH9CAphXTvJVrIgRbOSXd+stw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745510891; x=1746115691;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kBzGqlReJRCvZloMhkbm/qwk3PtByoa/h3b9iiRxguw=;
        b=AIUy9TAJa8grSV7Opg0Qo7EbbDmsEJxFP60SKJkc+tHO1wdz5D0c4EHF1MnzXwuGLf
         ROW8H66lhC/V3Yq2wrbeuxRHRtRe8cusZbTHSFgJ3OfT9Z29nSV5wk6MeXZe7yPqZKM2
         7I1j7ZeRsqOFa5iTCE/LUeciy908b3G5SKcv66F2mTrDMyqOyord4g4fikzBJmw2t7fh
         +6OQW/WuoN9GuRUxUJvuMg1F4jeymCFrARhAzYPTnONbiWtwK0mzNuLUiRhtI8Q5ykGg
         llDNA+xu2rAKmITBXRURdmREPtPHcRHz6I5aL6ltm+QBX9MbVmWQwpORuYv+Z5exu/ij
         VOyA==
X-Forwarded-Encrypted: i=1; AJvYcCWGibYK7yDAXTIyQ3YqVZUnb2ZA921CEE8uU/lFR+6qWaoj4gYsnpv8PnS8TRUrZRiaWhUz04tWEmb3aus=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDXycScp7mmTYJaWZZkRN0ncFjw95W+KAs29ZjZBTG8qU9IH2E
	g5Mex3fpQ7xySzY+DNESpumuWOhLUXNkSmjY9gLZAYK5nad5bcZ9FGi+t7QQm/PytGJnvNiHpNR
	3Nxs=
X-Gm-Gg: ASbGnctM1kCDnrPkx44nl9SKY1kGKcjib9FnDQVeOl4pYUnK0d6lSt8EYFamgBtWicI
	7BneqgarmgYKo+zIv5xYjAMiNTpm8wUdzFehQ+kKxq+TewFhCGszcrMssv8sGWdkJBZU9wkp5G0
	qoGHMe+r/+kMbKHBwOJ6RdQpX0z4d6Xr0S8Nw8Sj9Isg7kOSc5bBypGYUZwA2O8h10A+TrJwsZf
	ZcC8Mq0aGaA0F/1g+YCnW3KxTv1B+0vBAke6Qu3qzVgXFwSO8sVi9Sq1EI2HtqxZXjWLiqF0bWm
	OrNUYeg5Rq8Il+tQNmCUnvN74t5xVYX2zKIyLUz/pFvFNu7K7GebUEeGVga4adNvT2i09qUGAWU
	fwDsZ+YgIRzrStsk=
X-Google-Smtp-Source: AGHT+IG2cCfVMl4yopvGRXe8BTzObYZgltxNHIHYntF4SbBI0Ma2pPqAXTDRg6YP5G0Y+N6rICRv1w==
X-Received: by 2002:a17:907:970c:b0:ac6:e42b:7556 with SMTP id a640c23a62f3a-ace6b38f97dmr17993666b.11.1745510891360;
        Thu, 24 Apr 2025 09:08:11 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace59bbe3e4sm128251066b.93.2025.04.24.09.08.08
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 09:08:09 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac28e66c0e1so173723066b.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:08:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVCfxADZvLDBQmmoV0UfoP/oLjhlTfSJwYRQaVj9dshJpQ3MD5BAHB8tqf1d/9Pxp2WpSJ09txVBSSa/eM=@vger.kernel.org
X-Received: by 2002:a17:907:9803:b0:aca:e2d9:41f with SMTP id
 a640c23a62f3a-ace6b741e5bmr13129366b.60.1745510887699; Thu, 24 Apr 2025
 09:08:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202504211553.3ba9400-lkp@intel.com> <59198081-15e2-4b02-934f-c34dd1a0ac93@app.fastmail.com>
 <aAmeJmL0hUx2kcXC@xsang-OptiPlex-9020> <f1ccb8b4-bbe2-42bc-bb86-c2bf3f9c557d@app.fastmail.com>
In-Reply-To: <f1ccb8b4-bbe2-42bc-bb86-c2bf3f9c557d@app.fastmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 24 Apr 2025 09:07:50 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi6k0wk89u+8vmOhcLHPmapK13DDsL2m+xeqEwR9iTd9A@mail.gmail.com>
X-Gm-Features: ATxdqUFWu0hKLhcTGhg8mlyRmmQ2N2zZFRhSbIjzH-PLZ1yO8QAM-8GtVZ65lIc
Message-ID: <CAHk-=wi6k0wk89u+8vmOhcLHPmapK13DDsL2m+xeqEwR9iTd9A@mail.gmail.com>
Subject: Re: [linus:master] [x86/cpu] f388f60ca9: BUG:soft_lockup-CPU##stuck_for#s![swapper:#]
To: Arnd Bergmann <arnd@arndb.de>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, 
	kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org, 
	Ingo Molnar <mingo@kernel.org>, John Stultz <jstultz@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Apr 2025 at 01:01, Arnd Bergmann <arnd@arndb.de> wrote:
>
> Thanks for confirming. So a 486-targeted kernel still passes
> your tests on modern hardware if we force TSC and CX8 to
> be enabled, but the boot fails if the options are turned
> off in Kconfig (though available in emulated hardware).

I wouldn't expect CX8 to really matter - it causes us to generate
extra code to pick one over the other, but on modern hardware we'll
still always then dynamically pick the cmpxchg8b instruction.

Could it trigger bugs in our alternatives, or some miscompilation due
to the extra complexity? Sure. But it does sound unlikely.

> To be completely sure, you could re-run the same test with
> just one of these enabled, but I'm rather sure that the TSC
> is the root cause.

Agreed.

Particularly when the lockup is then in timekeeping_notify() during
the initial initcalls -> clocksource_select(), I'm pretty sure this is
purely about TSC.

That said, maybe the problem is in the watchdog logic, because
clocksource_done_booting() is what starts the watchdog thread .

So it might be the watchdog code itself that then gets confused
(because of some "don't use tsc" case that never gets any testing in
real life) and triggers immediately - and then points the finger at
the clocksource code only because that's what is still running.

Because CONFIG_X86_TSC does cause some oddities: we end up still
*using* the TSC for many things if the hardware supports it (which
modern hardware obviously does), but then other things get disabled
entirely.

For example, this:

  /*
   * Boot-time check whether the TSCs are synchronized across
   * all CPUs/cores:
   */
  #ifdef CONFIG_X86_TSC
  extern bool tsc_store_and_check_tsc_adjust(bool bootcpu);
  extern void tsc_verify_tsc_adjust(bool resume);
  extern void check_tsc_sync_target(void);
  #else
  static inline bool tsc_store_and_check_tsc_adjust(bool bootcpu) {
return false; }
  static inline void tsc_verify_tsc_adjust(bool resume) { }
  static inline void check_tsc_sync_target(void) { }
  #endif

So that tsc_store_and_check_tsc_adjust() thing etc never gets run,
even though we actually *do* use TSC for get_cycles() and friends,
because *that* code checks the runtime status too:

Now, none of that should matter - because all *those* things are about
details that simply aren't relevant for any of this case - but maybe
there is some other situation that has similar "I'm actually using the
TSC through get_cycles(), but I didn't do some setup because X86_TSC
wasn't on.."

I really get the feeling that it's time to leave i486 support behind.
There's zero real reason for anybody to waste one second of
development effort on this kind of issue.

                   Linus
