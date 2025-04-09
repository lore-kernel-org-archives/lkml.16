Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57999254AF1
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 07:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744182724; cv=none; b=uxO+KNVADRajW0BzLNGCZ3gybllZXzQBH8ex+HiLm8kc274pEXSxbA8ZpVRxNQufKZ+9FcVCB2G56X96lZLJL5ZsQJr/59lhOXeceznnms16x59oiqS2FPwNQLqp/ZBshJkCe0liYbmrfG+mD1k1lLo6Cx+TbUFKlmytLB1zcAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744182724; c=relaxed/simple;
	bh=1dHpp+YAmkxffVuWKD3c0VooHyqFL6o5lTKXmH6DeAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RzhaklkPfrES67IFpPO+rKsbfKAov3rkMShnsuDeg5Z+NVbKy8vyGD+tEThj6WU24UZfnw1kmUWU2rLgzi2hYj3SOxZFLYiuifTVDzqzNUZ1nV0MFukGTv2V0PLCuOE2aR+cAV6TLFphyU44Ra3To3BiUwozf3fhJJosXm8rjdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BoMn52qP; arc=none smtp.client-ip=209.85.167.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BoMn52qP"
Received: by mail-lf1-f66.google.com with SMTP id 2adb3069b0e04-549946c5346so7568346e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 00:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744182720; x=1744787520; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJw78G1uu0t5s2aLKvUfwf0n4Luu7OSwO+LArYIEbG8=;
        b=BoMn52qPUR8yVArUmDZ0GtW8wkzr9ittpgSjElCtAg+uTeOfJ1ulthc7HnHkuAmrne
         EvoXTKqx5q4Y1eYfh4MXlvmjgsphyYlU0J20wepjYY54ALoae8NmWR6XGfxw/7LuiMzg
         I5rRjvqey+ahOmhv6F7iKbAuop2Z+6y65Hntv6LFk1D/yk6Rk1aTV192IdNZGrewBV19
         Aa2Jwvs4hWM7O8rd26s3JafUUF2aejRoKbuDzPUn1W0DDHPnge85wQyjXDJ43BHDSOPp
         Un8AMyInJhE3NwL0eR2ZaQ8++bHkG7fSyMycu1dfR6Uut1Ki3r5UAiFmzQZBIPQcuEpr
         MOFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744182720; x=1744787520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pJw78G1uu0t5s2aLKvUfwf0n4Luu7OSwO+LArYIEbG8=;
        b=cj3o37ik/uIz8SAAV5wM20LU+wKLxbyJk4Azvi3bDoDE1PDWKBepGzRdZL+ugZ1BIj
         EL0al/sCr5+Zh5+HvdCnacriuwAFnXg4DFsjXAJBBmxW9qcsN/HSJo9rhe4oeSTTkPjK
         5xpXOMr9m7bqUw7fgFDcXT4r5MGTK8L35QciRgZGpsK1mEpqTJ2nDxd60QsjlcE+HsCz
         mi22JzAvWBHaYdgLdJD+p/HpTUar8NtoiTrpQOzcxMEGdKjV96Q8eAFlMfaiPc7V9pqb
         5GHl4CU/R22koi2/t3C8i43c+wj3HvyTtdVRhN2M7NLwdOGMA5sUuFG+78mESB0YUhDD
         EgpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqOGBtjzhq7BZjbGPgnjjBRwJm7dxnAoaxwG2sQXhAV8Mgep86xG5y7FYPvvI+LfXfAnB/mDx1V1Q/gto=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsdZ7kNTDHeDmdGwuVMjxQXTRPSzcQ6s8I7S9zSZm/aZik6aCk
	tfFOKKXw1WYQsmZyiT5C/qXFLwbZKbLJ65Wt/wvHxM/5e8P+A34b5D8xFAiTeCz9176favQJQMD
	rr2ykwxDJ3Rcu0c5Q9BR2WwWviG0=
X-Gm-Gg: ASbGncug7j4PE7ms+m93dcHWsZlqhTFssbkXo6rX0mY6bkeuT3SijP6cZvc+Tfo+ejV
	JehM0/qBIFy1f93TFcvtBqnm7vIoY9a1BOiYxTe3VusJPfzRkygY784ZkgGWO6hEbLhS8KnR08v
	Ae9moTNyygkPBvAxfqkj6Sb0M=
X-Google-Smtp-Source: AGHT+IEiKyshdkV9Fm3P2WCL24TaH1aUfK8r294akS/UnueF42cAzCptnpCpOugf30xE8WfXn2UZ7hcUZZbEJ3Aoq6Q=
X-Received: by 2002:a05:6512:b1f:b0:545:944:aae1 with SMTP id
 2adb3069b0e04-54c444b6beemr431895e87.12.1744182720104; Wed, 09 Apr 2025
 00:12:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407134712.93062-1-hupu.gm@gmail.com>
In-Reply-To: <20250407134712.93062-1-hupu.gm@gmail.com>
From: hupu <hupu.gm@gmail.com>
Date: Wed, 9 Apr 2025 15:11:47 +0800
X-Gm-Features: ATxdqUG2kOVvIkJUFf5meIZcz_MyTKg2fhzSmrI80w5ETIkkw0OPIZU4nYj5Ga8
Message-ID: <CADHxFxTLacN3o45WbDCLpMVb6oz2O4EeetXZkXgYDOcSJVqP-g@mail.gmail.com>
Subject: Re: [RFC 1/1] sched: Skip redundant operations for proxy tasks
 needing return migration
To: jstultz@google.com, linux-kernel@vger.kernel.org
Cc: juri.lelli@redhat.com, peterz@infradead.org, vschneid@redhat.com, 
	mingo@redhat.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, hupu@transsion.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear maintainer,
My sincere apologies for the oversight in my previous submission. I
realized I failed to provide the repository and branch details for the
patch context. Here are the specifics:

The patch is based on the following repository:
https://github.com/johnstultz-work/linux-dev.git

Specifically, the changes are present in these Proxy Execution
development branches:
a) proxy-exec-WIP
b) proxy-exec-v15-WIP

The changes are part of the ongoing Proxy Execution feature
development in these branches.
Please let me know if you need further clarifications. Thank you for
your understanding and patience.

On Mon, Apr 7, 2025 at 9:47=E2=80=AFPM hupu <hupu.gm@gmail.com> wrote:
>
> Move the proxy_needs_return() check earlier in ttwu_runnable() to avoid
> unnecessary scheduling operations when a proxy task requires return
> migration to its original CPU.
>
> The current implementation performs several operations (rq clock update,
> enqueue, and wakeup preemption checks) before checking for return
> migration needs. This is inefficient because:
>
> 1. For tasks needing return migration, these operations are redundant
>    since the task will be dequeued from current rq anyway
> 2. The task may not even be allowed to run on current CPU due to
>    possible affinity changes during blocking
> 3. The proper CPU selection will be handled by select_task_rq() in
>    the subsequent try_to_wake_up() logic
>
> By moving the proxy_needs_return() check to the beginning, we:
> - Avoid unnecessary rq clock updates
> - Skip redundant enqueue operations
> - Eliminate meaningless wakeup preemption checks
> - Let the normal wakeup path handle proper CPU selection
>
> This optimization is particularly valuable in proxy execution scenarios
> where tasks frequently migrate between CPUs.
>
> Signed-off-by: hupu <hupu.gm@gmail.com>
> ---
>  kernel/sched/core.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index ca4ca739eb85..ebb4bc1800e3 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -4162,6 +4162,10 @@ static int ttwu_runnable(struct task_struct *p, in=
t wake_flags)
>
>         rq =3D __task_rq_lock(p, &rf);
>         if (task_on_rq_queued(p)) {
> +               if (proxy_needs_return(rq, p)) {
> +                       _trace_sched_pe_return_migration(p);
> +                       goto out;
> +               }
>                 update_rq_clock(rq);
>                 if (p->se.sched_delayed) {
>                         proxy_remove_from_sleeping_owner(p);
> @@ -4174,10 +4178,6 @@ static int ttwu_runnable(struct task_struct *p, in=
t wake_flags)
>                          */
>                         wakeup_preempt(rq, p, wake_flags);
>                 }
> -               if (proxy_needs_return(rq, p)) {
> -                       _trace_sched_pe_return_migration(p);
> -                       goto out;
> -               }
>                 ttwu_do_wakeup(p);
>                 ret =3D 1;
>         }
> --
> 2.47.0
>
