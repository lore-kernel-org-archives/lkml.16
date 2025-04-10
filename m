Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758E420A5EE
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 07:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744269263; cv=none; b=pvXp0ccdeUx8DjEZuTZ19uxlszdW5/4ZpRCaELRyS5+7uS2e7+iGhMVbA9NqYoZozDdI6rCKFloX1Qe1rdktbojjIgAhahaUDTiGyU7iCHSrqE7ySgLp2ht4k+1kwxcZrVqvVw/TpLLSlf+ArfsdFmkvMp1qrq30jrlWAQcDB2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744269263; c=relaxed/simple;
	bh=e/8/vlcek38HrkqHIPo+nE/+cMZ1BaANdim1mNRESOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uZykwNCPn0uzcJPT/GJ48AXpz50YQ98KskS73MgrF600mR8H2xZ+h/kM/syI9d6/RQktMVnJ9HOVQhx+gDEsl5oi2PFwVOeUWxkVUqTEGc30nvqd9XGVEhysGi4S7viBBB5OXo25lSvKd2LFIXFXsexPjIcbT7o4bLf1ipIhcBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GgDnW3C5; arc=none smtp.client-ip=209.85.167.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GgDnW3C5"
Received: by mail-lf1-f67.google.com with SMTP id 2adb3069b0e04-5499659e669so566101e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 00:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744269259; x=1744874059; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fkzfHpsSmQe+3DwxYaMkLdhCRIPJGICVcWzqb8XFgVQ=;
        b=GgDnW3C5MNMLhIAul9gH0p9gC3VY7E2giVaGFnq0n/V50FLRiM5il1Jmfi37nzSx9m
         3aUatyfV0tUyI2dY42sUdvRUgSCXuTonmlAFJdQzuX5/z3yqS708hd5lvPJRmYyhpAmL
         tf2UyatvLrlDwkxBVffNBFnaQt76rnRfpXDGTLEb5s5aK+yhS0Tg6hqb1bpyPC1eCun/
         2vJmMKyuRlYk9RHXzvTb134ZmVVy1vthRTCq9W6J52Cc5dnqvIdxpAaeJEZDvjQcQ2nz
         wRRfKLsEJZvP2JvJpCj5tSLwAET2his0RLiCpEcjEmZ4Op2WNaUNTDJWftro15TnRokc
         hjrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744269259; x=1744874059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fkzfHpsSmQe+3DwxYaMkLdhCRIPJGICVcWzqb8XFgVQ=;
        b=NjUnHU4mjgHEi6tkpbUA+AdwVO9msfsUnXXSAk1UqqI6T8UIZTDA9qLpgIk281Ctnp
         tqVy3hW3gu3be1Mj2lSMcIuMVcj6xTXwgiC0ldj87fT32kfqzJvfhdb5FR9ecck15ZGk
         sdkxucGIjKhoIN3pwGOUh36T8tAEqKN9zp/o3U2Wh65lHTmhEJMJXASjf16Ns6g/6Y7Y
         0juezPymKhJZuD502M8FH1pMYtja9sukoAaLJ0mkjXuiy/cyWSROz+SCpyPId499G9Ru
         J9b+mnWlogjuYcDo6B4aWMLXSb1Xgm8Q3gjpb3sj2KePrrKLDCRDvJSPM2SYwbIROYwu
         NQ4w==
X-Gm-Message-State: AOJu0YxZ29AoT2R6YrbMtPt22jgfYiSpUnp0yxYAMLY0qQzbLo6w8aMc
	CsFVGdL1UtvUc7p0CJ98wl5NmTjZOqg/fGH3ZRa97+hus3NVouq/H3Nd9uUTYTOX03xor/IzxVH
	XRVl2GeaoL8BWWk3/p3FwZjZdf/4=
X-Gm-Gg: ASbGncv2yAR40Y1cyuwSQ3x2tNLyCiWxfjyxNGncO3qwmRyNdGu40k6HTFKwmXqO1O/
	WZzTuAGZ9t292mNkf5bNzwlv0laBBWkwMliKgMhXTGaXCwqYwq1REWd4df9MPvGk5KvUJwfsocV
	twxpS9ZADWaqY9h9Z3U5mbakk=
X-Google-Smtp-Source: AGHT+IE/Y6pxd6Xlhn8r3OCiCEHWbDOy1z00tluR41WAXPNuXpz63gAoNuszOIRGYUYXZRjuMfBn8nxwfUlGxlI45lQ=
X-Received: by 2002:a05:651c:19a5:b0:30c:4be7:1d42 with SMTP id
 38308e7fff4ca-30fa7250763mr5095611fa.12.1744269259321; Thu, 10 Apr 2025
 00:14:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407134654.92841-1-hupu.gm@gmail.com> <CANDhNCptjorLthhgMBLLCCYsk5MJT73Daj+usFPWNenpgYTF4A@mail.gmail.com>
In-Reply-To: <CANDhNCptjorLthhgMBLLCCYsk5MJT73Daj+usFPWNenpgYTF4A@mail.gmail.com>
From: hupu <hupu.gm@gmail.com>
Date: Thu, 10 Apr 2025 15:14:07 +0800
X-Gm-Features: ATxdqUEauPF2EoGuKrP6eQvSb5Bm_-tbpudFxPiYOFwn3byEzqLJT_uub1WL7zI
Message-ID: <CADHxFxTWZJMBU9+VJH9=U9GHeoFf3N5fju3hApSRDONpQ9KAXg@mail.gmail.com>
Subject: Re: [RFC 1/1] sched: Remove unreliable wake_cpu check in proxy_needs_return
To: John Stultz <jstultz@google.com>
Cc: linux-kernel@vger.kernel.org, juri.lelli@redhat.com, peterz@infradead.org, 
	vschneid@redhat.com, mingo@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, hupu@transsion.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi John,
Thank you for your feedback, I appreciate you taking the time to
review my proposal.

On Thu, Apr 10, 2025 at 7:35=E2=80=AFAM John Stultz <jstultz@google.com> wr=
ote:
>
> Hey hupu!
>   Thanks so much for taking the time to review the full proxy patch
> series and to submit this change!
>
> On Mon, Apr 7, 2025 at 6:47=E2=80=AFAM hupu <hupu.gm@gmail.com> wrote:
> >
> > The (p->wake_cpu !=3D cpu_of(rq)) check in proxy_needs_return() is unsa=
fe
> > during early wakeup phase. When called via ttwu_runnable() path:
> >
> > |-- try_to_wake_up
> >     |-- ttwu_runnable
> >         |-- proxy_needs_return    //we are here
> >     |-- select_task_rq
> >     |-- set_task_cpu              //set p->wake_cpu here
> >     |-- ttwu_queue
> >
> > The p->wake_cpu at this point reflects the CPU where donor last ran bef=
ore
> > blocking, not the target migration CPU. During blocking period:
> > 1. CPU affinity may have been changed by other threads
> > 2. Proxy migrations might have altered the effective wake_cpu
> > 3. set_task_cpu() hasn't updated wake_cpu yet in this code path
>
> A few nits here:
> 1) We do reassign wake_cpu __set_cpus_allowed_ptr_locked() if necessary.
> 2) Proxy migrations use proxy_set_task_cpu() which preserve the wake_cpu
>
> And I'm not sure I quite understand the concern of #3 above. Could you
> clarify further?

Thank you for pointing this out! You are correct that
`__set_cpus_allowed_ptr_locked()` has updated `wake_cpu`, which makes
the `p->wake_cpu` check in `proxy_needs_return()` valid. This avoids
placing the donor task on an incorrect CPU, and I sincerely regret my
oversight in failing to account for this behavior in my initial
submission.

However, I still believe this logic could lead to potential issues,
which I will explain below.

In `__set_cpus_allowed_ptr_locked()`, the `wake_cpu` is updated by
using `cpumask_any_and_distribute()` to select the first online CPU
from `ctx->new_mask`. I believe this selection criterion is overly
simplistic, as CPU selection for tasks is inherently complex and
varies depending on the scheduling class of the task. For instance,
CFS tasks require considerations for load balancing across
sched_domains, while RT tasks aim to avoid placing multiple RT threads
on the same CPU to minimize contention. Therefore, I believe it is
insufficient to simply select a CPU from `ctx->new_mask` and assign it
to `p->wake_cpu`. Instead, this task is better handled by delegating
it to `select_task_rq()`.

Additionally, on derivative platforms like Android, performance issues
may arise. Vendors often hook into `select_task_rq()` to customize CPU
selection for critical tasks, such as foreground or high-priority
threads. For instance, on ARM big.LITTLE architectures, vendors
prioritize placing high-priority tasks on powerful CPUs to reduce
latency. If we assign `wake_cpu` to the first online CPU in `new_mask`
(often a less powerful CPU due to smaller ID values), donor tasks may
wake up on CPUs that cannot meet performance or load-balancing needs.
Worse, vendors cannot intervene in this logic via their hooks in
`select_task_rq()`.

>
> As you noted, in proxy_needs_return() we use the wake_cpu to tell us
> if the task is still on the rq where it was blocked,  with the hope
> that we can short-cut the deactiave&wakeup logic and instead just mark
> it BO_RUNNABLE and return from ttwu.

I understand and agree that using `wake_cpu` can effectively shortcut
the deactivate and wakeup logic. However, my concern is that it may
not always meet the donor task's performance requirements and may
disrupt load balancing across CPUs.

To address these concerns, I suggest that `proxy_needs_return()`
should always return false for donor tasks unless the task is already
running on a CPU, as this would ensure the `set_task_cpu()` logic in
`try_to_wake_up()` is triggered, allowing `select_task_rq()` to make a
more informed CPU selection and enabling vendors on derivative
platforms to retain the ability to customize CPU selection for
critical tasks via hooks in `select_task_rq()`.

These are my considerations for the current patch proposal. I am
uncertain if this design is reasonable and would appreciate the
opportunity to discuss it further with you.

Best regards,
hupu
