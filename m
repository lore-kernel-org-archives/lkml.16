Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B37280026
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 08:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749024108; cv=none; b=CBBfqH4y98hr8KxlhEpNikQieWjdi6RiskZVPWgKsKAQ3M4yKR/QAtKUxbWoiOnZ+g91WVXVAosVQHGAqRrmB9yfkrI5IGy48A9qk0RxGQ3iUxVGOl1o4JYiz3fmVha/1D/UI/qDjF9qCt8+Fbois8CwCNWT4rwcJ9VFbll0H4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749024108; c=relaxed/simple;
	bh=ZV3zmP8/HWd8IP6LH+qVrBUnhU+he1EKR8z3CtxnEiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ObYySefvyIxM2ZCi4h+tEqWHgW219SSoBsNb5wRcpgZuPCzF4XVdpdmmZa09NvQCAziwpYqxjAOnKKDs84g2TbWDhyQ4Z1WxrO1RwXOuqveeOYdr8CVt0F4oONtfC+mdPauLhBpLUIhG9kFh0HtXBsOFlwYQEmHJp9SJ59G2ois=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=lx7RFWvw; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="lx7RFWvw"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-acacb8743a7so129610266b.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 01:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1749024103; x=1749628903; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/GISmhyXSYm4I4kugK9hsCQWAMnGYj9YvW19lAeuh6A=;
        b=lx7RFWvwrS1FKbho+sPiv9HPwdxyOJ+44SJ5OgxwFPcjAmq2SZGu2RuAD5uqn+MbiY
         Mli1xQuNQ94MI8IRC0sMasN4QRW1yCtCsmbvslmaGY80xNyt9UHTjo0zfrM0a+U4Ks3E
         l/cK7Aa33S/zD6t7cM/BaEGwYBw35AT+aC0xE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749024103; x=1749628903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/GISmhyXSYm4I4kugK9hsCQWAMnGYj9YvW19lAeuh6A=;
        b=mvsB4RTpKqF8h8mPWT37bIVA9w6OxC5OJHg06eWrxFLSQjgypzcb4fH9Gv4gT1HLsM
         CFbh/ZD9IgKi1XrBbpQ78PQeD1aYAQ8P6m1/0jqf+8bwPNMCKE1ngh8CDJ10RmLAIuHG
         6tGaCYFUrA66IYk1kJjFGMHHH6szeBUtyQxC8pzS76uZljWDooWiniAOTn4OdELlqElY
         Ieqi64zff7AGmruG5ehB56GeeGHtoU9x99NYZ+H8UNGq1AFSRP/cQxWEpFhjpRqzFu3L
         2O5B7om1qwZbcyQTb6/9O1N4OSS+auQ9a62W0Ifgbfwg/XXiSshaQfvs3ed/z2FN4s6y
         7Kag==
X-Forwarded-Encrypted: i=1; AJvYcCWXTajNIHUG9UbMzZUH8vqFUxw+e4x5XlIPS+rbwPJUlAKb5QKpRyMQi9AGie3OXCQ+PBVg/d1M3vTnsEA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLws/10QnKHWG8miTei9PbISXM4UAO+6o80v1BwVTLt6xNKPH3
	MC6KuLmN5e26oBBUlwJHZCjSwZESFZPyDnnxYfx44sgx2n2H4ELDd40/IyPfQXPi52yjMZF8+Q5
	aTqAe/dCL/gnmrO2Tkrjq+9yCpU2YuXakCWLQPWJB/Q==
X-Gm-Gg: ASbGncuCkqiJ1pove7ZH0CR8djQOdkRLRq591AXTdI78ulG0OIbFnK4Z8Ca4If12nnS
	6APcYi9b0EAh3zw2JPIGVzXecirt6fBINjYY78NQ9H+ptMwSpwrvNDfPNF20z9JjchXQ0XRQIH+
	UY/iejshE+oM7B3CXjWz3KCmtU/OeHvLD/tu8gElV5r2y4ihgsR1Pwc10i2XWczkHEZtI=
X-Google-Smtp-Source: AGHT+IF3wlbZEeEv6BI76hpjLBKmKeQjJgafj4INC3kTA4P8qmJWCG5rCPSmW6OMzlcUCgxNVZ/4+/Te6VS03GA17tk=
X-Received: by 2002:a17:907:9627:b0:ad8:959c:c567 with SMTP id
 a640c23a62f3a-addf6ea249fmr212374666b.10.1749024102944; Wed, 04 Jun 2025
 01:01:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602223251.496591-1-daniel@quora.org> <CANDhNCqn__w4kGE2N6P5MndR4=2KwJnrb9=+eMo0=j5ToP6UZQ@mail.gmail.com>
In-Reply-To: <CANDhNCqn__w4kGE2N6P5MndR4=2KwJnrb9=+eMo0=j5ToP6UZQ@mail.gmail.com>
From: Daniel J Blueman <daniel@quora.org>
Date: Wed, 4 Jun 2025 16:01:31 +0800
X-Gm-Features: AX0GCFvGYDB0ZmzJCkGMQsrCqGO_4sXcTNNHSUCLgXCHfO_4HOwHNG70mgOmb_Y
Message-ID: <CAMVG2ssyhp2zFAOu74FUQtWn55XwUtiSp49FqNwy6Pj-f6sgQw@mail.gmail.com>
Subject: Re: [PATCH RESEND] Prevent unexpected TSC to HPET clocksource
 fallback on many-socket systems
To: John Stultz <jstultz@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, 
	stable@kernel.org, Scott Hamilton <scott.hamilton@eviden.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 3 Jun 2025 at 09:35, John Stultz <jstultz@google.com> wrote:
>
> On Mon, Jun 2, 2025 at 3:34=E2=80=AFPM Daniel J Blueman <daniel@quora.org=
> wrote:
> >
> > On systems with many sockets, kernel timekeeping may quietly fallback f=
rom
> > using the inexpensive core-level TSCs to the expensive legacy socket HP=
ET,
> > notably impacting application performance until the system is rebooted.
> > This may be triggered by adverse workloads generating considerable
> > coherency or processor mesh congestion.
> >
> > This manifests in the kernel log as:
> >  clocksource: timekeeping watchdog on CPU1750: Marking clocksource 'tsc=
' as unstable because the skew is too large:
> >  clocksource:                       'hpet' wd_nsec: 503029760 wd_now: 4=
8a38f74 wd_last: 47e3ab74 mask: ffffffff
> >  clocksource:                       'tsc' cs_nsec: 503466648 cs_now: 32=
24653e7bd cs_last: 3220d4f8d57 mask: ffffffffffffffff
> >  clocksource:                       Clocksource 'tsc' skewed 436888 ns =
(0 ms) over watchdog 'hpet' interval of 503029760 ns (503 ms)
> >  clocksource:                       'tsc' is current clocksource.
> >  tsc: Marking TSC unstable due to clocksource watchdog
> >  TSC found unstable after boot, most likely due to broken BIOS. Use 'ts=
c=3Dunstable'.
> >  sched_clock: Marking unstable (882011139159, 1572951254)<-(91339503244=
6, -29810979023)
> >  clocksource: Checking clocksource tsc synchronization from CPU 1800 to=
 CPUs 0,187,336,434,495,644,1719,1792.
> >  clocksource: Switched to clocksource hpet
> >
> > Scale the default timekeeping watchdog uncertainty margin by the log2 o=
f
> > the number of online NUMA nodes; this allows a more appropriate margin
> > from embedded systems to many-socket systems.
>
> So, missing context from the commit message:
> * Why is it "appropriate" for the TSC and HPET to be further out of
> sync on numa machines?

I absolutely agree TSC skew is inappropriate. The TSCs are in sync
here using the same low-jitter base clock across all modules, meaning
this is an observability problem.

> * Why is log2(numa nodes) the right metric to scale by?

This is the simplest strategy I could determine to model latency from
the underlying cache coherency mesh congestion, and fits well with the
previous and future processor architectures.

> > This fix successfully prevents HPET fallback on Eviden 12 socket/1440
> > thread SH120 and 16 socket/1920 thread SH160 Intel SPR systems with
> > Numascale XNC node controllers.
>
> I recognize improperly falling back to HPET is costly and unwanted,
> but given the history of bad TSCs, why is this loosening of the sanity
> checks actually safe?

The current approach fails on large systems, therefore interconnect
market leaders of these 12-16 socket systems require users to boot
with "tsc=3Dnowatchdog".

Since this change introduces scaling, it therefore conservatively
tightens the margin for 1-2 NUMA node systems; these values have been
historically appropriate.

> The skew you've highlighted above looks to be > 800ppm, which is well
> beyond what NTP can correct for, so it might be good to better explain
> why this skew is happening (you mention congestion, so is the skew
> consistent, or short term due to read latencies? if so would trying
> again or changing how we sample be more appropriate than just growing
> the acceptable skew window?).

For the workloads I instrumented, the read latencies aren't
consistently high enough to trip HPET fallback if there was further
retrying, so characterising the read latencies as 'bursty' might be
reasonable.

Ultimately, this reflects complex dependency patterns in inter and
intra-socket coherency queuing, so there is some higher baseline
latency.

> These sorts of checks were important before as NUMA systems might have
> separate crystals on different nodes, so the TSCs (and HPETs) could
> drift relative to each other, and ignoring such a problem could result
> in visible TSC inconsistencies.  So I just want to make sure this
> isn't solving an issue for you but opening a problem for someone else.

Yes, we didn't have an inter-module shared base clock in early cache
coherent interconnects. The hierarchical software clocksource mech I
developed closed the gap on near-TSC performance, though at higher
jitter of course.

Definitely agreed that we want to detect systematic TSC skew; I am
happy to prepare an alternative approach if preferred.

Many thanks for the discussion on this John,
  Dan
--=20
Daniel J Blueman
