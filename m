Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17670229B02
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 06:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748413494; cv=none; b=FkQXgtE1YdN1p+7Ar2588MLQBUM+x6Tj/Ot6iDGYydJft7FRvM96K+EfZxgYmUNqcaGRCcOVpsHD/vY9qYorgQ+PfLW9xXukdmgvDJ2At8bsZNdvunmGl9BEsZmhStTL/OCIz7yQaX5oc/uiNQoDQr8BOvrZ9ZdqbZrcvPuTdZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748413494; c=relaxed/simple;
	bh=5L0FtTWnRbbY87Yw9Pxs0SGCCrECEW3HTNR3PqErd2A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A88Gp84HGxdBNRgb7B/4QsQti80U1rSlXgRcnS/skQasEW/dBx6BXWdzgucVuVn8kzV+dw+jeYEIdX7yWqTBLiP9jTH4d/29ORblAQ8I8y6R0OTQbjZQyKROqAe3yy3n76bM2Gz2oTRlDWReegj+Xh93EJJWs9QoMIoyhlOLF3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=n/jdDY6B; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n/jdDY6B"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54e7967cf67so5026992e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 23:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748413490; x=1749018290; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2VjMIwtm0V4q/6YXouYv5VWMCuIWdhRj/RbZOIsk2fE=;
        b=n/jdDY6BSB+Cden1wqbk4SUWesOe5i0WDSHJyWMHJHb334iM6vNe/7hII1AKDi8fGs
         85+KFbi1USMK16zpUSNNk3c6T2XM0X8hcKePlWyDgMiUy5KQlHiqErGwINmwtJ86T0CY
         Xye2G65vcRLqAGx1wReKd+jUgEDhiLVQL8gG3qEJi6VcMiI57CVyhtbllFiWNgpody09
         5E65Z2PFCMPEcOwbOklr/OBdqQzUxAeXOWiMrTiFwBar8+SQ2n3qBGdEwJmmQxs8QH+V
         Ie7/NLo1crdfUOxKh39jQhN7GVt8NfI1gY6HjNnEZiQX4nu5Quj3/dafePr8YUAzSuEe
         Km3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748413490; x=1749018290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2VjMIwtm0V4q/6YXouYv5VWMCuIWdhRj/RbZOIsk2fE=;
        b=l6JJdtrFflmvJFfrGG5IpjOEtEr9rEIMWFJplZXWfTdOd8K833lrAEmAHMzarUaOcJ
         9aac3II8uOeA21mD9sHxiXmiFU8TigdbPGkUSs+WQBMQAE37BGzS6I7K4460v/hmKov2
         V5cIadLQsrtYC3iIOs23ZoOoEv3luUKUU4ysx26HjhxVn34E0HxaYlynw/DrwFxi4MR/
         BLMuoNCgCChwgttJVJXQcemkXkJAkQk5r3rJatO+3j9Qy7N6mx2wNUbMAlTgA3YP1wXk
         dAmaW8riG/ZfdYtMfg8xDwASPMsnAjFfdgbd1KflrHF/S9LVL52u2L5odZKUMCXFn/l2
         f44Q==
X-Forwarded-Encrypted: i=1; AJvYcCVdf2+3nHlUCAuESxfUOwu4/w40t16pZ7atAsJ920rRVvadQf+9Hv1g3q2e6hHrGSZBidyP4kyCjQRz+R4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfwMWFZLhqZWPVw1R2SG1AGCCQ6dlhLzbENihBfTwWwlfzVSmy
	Myqa8Fqdt6CYxwhIoOgnIA4Ps+cvjeoDO2UnM/lmap9i+Q1nRbnXJixwyLzek8jhh75IYOPl2Oq
	XLIvrPJOmuuhfYqzwwEYH5bmvJRjLICU3PGqOa7w=
X-Gm-Gg: ASbGncuYBfTnCePuPRBCiCsuRnS2fMZzdOZOAA9GxEMVK4yeMdXOlLKWKyhWV5ApriJ
	vlbqfjLOjQzSgPJoMxDZKW+1gY7I4J4HJx1TNBxOQ+BXpElXmZVRHAvujCqBBTk5KuZsHMvb1qF
	qnqQrezcXM6z8Yv/+0k2ke2ewoqPvURwVAmtGX/3ua1DYjooM4IxuGI6su11anM9Om2AiFmJBJ
X-Google-Smtp-Source: AGHT+IFiOFDgiD2Yew6S6gUcCWYVyy3xoWHT9dB0uRijWmV59T3GiUiRNdkcyKO0SfhMx7cvGysw0leQ13jWVyUBnHM=
X-Received: by 2002:ac2:4c4d:0:b0:553:2ff8:5e0b with SMTP id
 2adb3069b0e04-5532ff8611fmr226839e87.42.1748413489737; Tue, 27 May 2025
 23:24:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407134712.93062-1-hupu.gm@gmail.com> <CANDhNCosvML9XKH8HV1QBXKzxt3zMWxzsPSUfYxoyPCORf6Krw@mail.gmail.com>
 <CADHxFxS+qpmD8r1uxru+VWLj=K616=jLKbBgUR3Ed7ZBY1gidg@mail.gmail.com>
 <CANDhNCqgCGtWubkuMpn=GdfLwP6d5kMEvbhoQL4oef5yf_74ug@mail.gmail.com>
 <CANDhNCqv0iFMJanxj4uTyOHGUGxfCqb18Ku+w5y9JFKRm0M=Rg@mail.gmail.com>
 <CADHxFxQoNOBCOMDsh0iNrdD=ke=YweVZgZrTWbBQRA8SYy9McA@mail.gmail.com> <CADHxFxRd66FB6=wgY2-NLxqiMGZui+um+h2LUe4+hwXabdUpVg@mail.gmail.com>
In-Reply-To: <CADHxFxRd66FB6=wgY2-NLxqiMGZui+um+h2LUe4+hwXabdUpVg@mail.gmail.com>
From: John Stultz <jstultz@google.com>
Date: Tue, 27 May 2025 23:24:36 -0700
X-Gm-Features: AX0GCFv_qDUaay4tEkY_LtAWSjlUSsFUToVgWY1oH3YwFp4qL-q6HnTtF-SKiUI
Message-ID: <CANDhNCq+xE4dpecHio2x6TJXMXxhQjrDk1oCon=NR2b+k0Y9yQ@mail.gmail.com>
Subject: Re: [RFC 1/1] sched: Skip redundant operations for proxy tasks
 needing return migration
To: hupu <hupu.gm@gmail.com>
Cc: peterz@infradead.org, linux-kernel@vger.kernel.org, juri.lelli@redhat.com, 
	vschneid@redhat.com, mingo@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, hupu@transsion.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 18, 2025 at 7:51=E2=80=AFAM hupu <hupu.gm@gmail.com> wrote:
>
> Hi John,
> Sorry for the delayed response.
>
> > Usually I boot qemu with 64 cores, and have found stress testing
> > running the following separate programs frequently uncovers issues:
> >
> > #cyclictest from the rt-test suite to add some rt load
> > cyclictest -t -p90
> >
> > # rerunning the test_ww_mtuex logic (enabled by a patch in my full
> > proxy-exec series)
> > while true; do echo 1 > /sys/kernel/test_ww_mutex/run_tests ; sleep 5; =
done
> >
> > # Along with my prio-inversion-demo (which ensures we do the proxying p=
aths)
> > # ? https://github.com/johnstultz-work/priority-inversion-demo
> > while true; do ./run.sh; sleep 10 ; done
> >
> > # Sometimes I also throw in the ltp sched_football test:
> > # https://github.com/linux-test-project/ltp/tree/master/testcases/realt=
ime/func/sched_football
> > while true; do ./sched_football -m | grep Result ; sleep 1; done
> >
>
>
> I followed your suggested approach and successfully reproduced the
> issue you mentioned. The system experienced a hang during bootup and
> triggered a crash due to a watchdog timeout. This issue is related to
> the logic of sched_delayed. I will provide a detailed description of
> the debugging steps below. I apologize in advance if the explanation
> becomes somewhat lengthy.
>

Yeah. To be honest, this is a little tough to follow, particularly
trying to distinguish between the debug changes and the actual change
you are proposing. Especially as they are whitespace damaged.

[snip]
> The above patch was solely intended to verify the correctness of the
> analysis, as directly clearing `p->se.sched_delayed` is unreasonable.
> Doing so would cause tasks with non-zero lag to be dequeued, thereby
> undermining the fairness enforced by EEVDF. Moving the
> proxy_needs_return operation after the handling of sched_delayed
> appears to be more reasonable, as for a donor that is about to be
> dequeued, executing the subsequent wakeup_preempt operation is
> redundant. Therefore, the following patch seems reasonable, and I
> propose adopting it as version 2.0.
>
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> old mode 100644
> new mode 100755
> index 06e9924d3f77..f804c681b861
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
>  #ifdef CONFIG_SCHED_PROXY_EXEC
> @@ -4164,6 +4172,10 @@ static int ttwu_runnable(struct task_struct *p,
> int wake_flags)
>   proxy_remove_from_sleeping_owner(p);
>   enqueue_task(rq, p, ENQUEUE_NOCLOCK | ENQUEUE_DELAYED);
>   }
> + if (proxy_needs_return(rq, p)) {
> + _trace_sched_pe_return_migration(p);
> + goto out;
> + }
>   if (!task_on_cpu(rq, p)) {
>   /*
>   * When on_rq && !on_cpu the task is preempted, see if
> @@ -4171,10 +4183,6 @@ static int ttwu_runnable(struct task_struct *p,
> int wake_flags)
>   */
>   wakeup_preempt(rq, p, wake_flags);
>   }
> - if (proxy_needs_return(rq, p)) {
> - _trace_sched_pe_return_migration(p);
> - goto out;
> - }
>   ttwu_do_wakeup(p);
>   ret =3D 1;
>   }

Ok, so this matches what I had tested before modifying your earlier patch.


> However, there is a potential issue. Whether it is the original code
> logic or the v2.0 patch mentioned above, directly removing a task from
> the runqueue in proxy_needs_return undermines the fairness enforced by
> EEVDF. In fact, clearing the task's `p->se.sched_delayed` variable
> first (via enqueue_task(ENQUEUE_DELAYED) -> enqueue_task_fair ->
> requeue_delayed_entity) and then removing task from the runqueue in
> proxy_needs_return is essentially no different from directly removing
> the task while retaining its lag. This is because the non-zero lag
> will eventually be discarded. Therefore, regardless of the method
> used, the fairness maintained by EEVDF will be compromised.

Hrm. Can you walk me through the specific case you're thinking about here?

Is the idea something like:  a mutex blocked task (not sched_delayed)
gets migrated to a rq, where it acts as a donor so that a lock holder
can be run.
If the lock holder sleeps, it might be set as sched_delayed, but the
donor will be dequeued from the rq and enqueued onto the sched_delayed
sleeping owner.

And the concern is that in doing this, the donor's lag from the rq it
was migrated to won't be preserved (since it isn't set as
sched_delayed)?

I'll need to think on this a bit, as I don't quite have my head around
how mutex blocked tasks might also end up sched_delayed.

> I have not yet determined the best approach to address the issue of
> EEVDF fairness being compromised. Perhaps we could preserve the lag
> during the dequeue process and handle it during the next enqueue. I
> look forward to further discussing this issue with you.
>
> Finally, I have decided to adopt the following patch as version 2.0.
> This patch is specifically designed to avoid unnecessary
> wakeup_preempt checks. Regarding the fairness issue discussed earlier,
> I plan to submit a new patch to address it.
>
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> old mode 100644
> new mode 100755
> index 06e9924d3f77..f804c681b861
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
>  #ifdef CONFIG_SCHED_PROXY_EXEC
> @@ -4164,6 +4172,10 @@ static int ttwu_runnable(struct task_struct *p,
> int wake_flags)
>   proxy_remove_from_sleeping_owner(p);
>   enqueue_task(rq, p, ENQUEUE_NOCLOCK | ENQUEUE_DELAYED);
>   }
> + if (proxy_needs_return(rq, p)) {
> + _trace_sched_pe_return_migration(p);
> + goto out;
> + }
>   if (!task_on_cpu(rq, p)) {
>   /*
>   * When on_rq && !on_cpu the task is preempted, see if
> @@ -4171,10 +4183,6 @@ static int ttwu_runnable(struct task_struct *p,
> int wake_flags)
>   */
>   wakeup_preempt(rq, p, wake_flags);
>   }
> - if (proxy_needs_return(rq, p)) {
> - _trace_sched_pe_return_migration(p);
> - goto out;
> - }
>   ttwu_do_wakeup(p);
>   ret =3D 1;
>   }

This looks identical to the version above, or am I missing something?

thanks
-john
