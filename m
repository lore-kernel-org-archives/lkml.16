Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C4C226CF8
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 09:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751535775; cv=none; b=efBvgqUrgdw1qDBxbfgSK2KczzqgxWniv19eTRr0sti/BjAKF1PZMW6G8ldFgQZawFAIZOLL2Gnyvm6PMSH8G0FrI6RiOBqA60Z1Bp3Tx+jYekTOtP6w0tEJf4UJDwdIS19h7N4GUT34E8bXK7rat0PonjKMNTtSp04E89MoHbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751535775; c=relaxed/simple;
	bh=BPpSE19WHkb5oe874u2pfEKP8/jWes+4W7IfLAS4FTs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LuG6LmOBXHhkkRKPL9fjj3f1WsE2ExJlIFpbQ9b5B1CfeKKpskR8odZEJY62a0su0ehPDQV7cyJYEzeppWL4MEx2Io6kFDlN87S/zYYgaPvuAgUtvCjD7WRp9ZyjynLwdmo75wEFmbhM4c67/A1eOvf1sT66UA8x6otkRD7WtMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E/L+7VtI; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E/L+7VtI"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4a98208fa69so7993041cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 02:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751535773; x=1752140573; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7kSWauSUcPpA+CNR1kCjbxt1scdxRqBfgBdq7plG+/U=;
        b=E/L+7VtIimPcmr/n4YvhlBbgL5sJ5K3zw+/nBIkJzx0MuAX1LzQ4bDg/eQnHZvMDVY
         FWv/D+i6/F2+U4spwgvDMiUqnuJXPKyYrRk7+uz2Z6clfgScJgTC5LKryTq0tkMxBcBd
         JTYMd9GHlYzREm/JmqA/AslSgCpdJKSZxyjGVZA37RvdbPIvhslgnNC6j7oXqH2g1k7Q
         tfbrzqQkCWYGqMHbtUFacHqqNUY1PkskUuFPF0s02mprOExEKdR4t8NBQc0zPFJh8szq
         Q5P8YFYwfKvJ2JqF0FV2TULlfM85vWeGDv7cHOJxV+T8Up21vcwa9HxkTF4cK2SPuP49
         hLIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751535773; x=1752140573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7kSWauSUcPpA+CNR1kCjbxt1scdxRqBfgBdq7plG+/U=;
        b=sM5r7zYpSY390/sTBUvEC4BcsZa8hfcNiPCv0y+l9NahNXyXvcJfo7SDIU0Akxw904
         pHsC1HDxUooBMrnCliny4hXrSn0RtjzQS0WYFkrO3FTc0V6w8ZHmukwwxKllusAt2jP+
         wVZ/ymECEF3y2VqnlLBOsFrxIt2wFZ14/z+/EOBSYfXfBziPbAM0I0oRP8E0xHmabnP+
         qIt44apKmFaUiZHxrpfizPleQXpFf6pp72kHO+T47Ec5Rt2fOket9C9dRCyU7vtrN2Jc
         mzM/o88e9YH9rBKADxL2A7t6b7MOtxxESLWjdAZkUmrKLfrj+75Z5tw7d5n6/FkpdVyJ
         56AA==
X-Forwarded-Encrypted: i=1; AJvYcCXV8NrEj3nIZT/GQgrYucbGrB82BRkzsRvry3mztjVWL/ktznZT6p7Q5gzHTW9qaet1yqyQLUw1YWU6wQw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGAtTEJvNRWYfnq4rRppnaTXDoGXc2Pp97ts0kYQvlYUsMLy2f
	Hf9v4tfY2YmzH1h4RgHVkobbg7yJZHGp7rIveBulxm3PglYUlFHzFmpfB5GrFTkJeFWmhhKNHFn
	zESAA/9pZtWvbVa5V1KYwqTEHo587L2s=
X-Gm-Gg: ASbGncudrDhiYkPYkcd8W/k9BXYxPqXdyuNT4WOdsEBGMQKBtsXyWlgHzphs3XpgkFy
	xq/7vOFrR39MI74nwwetyY+HmGA/nIp/Al2ALlLcGDOEfhaNw4xO4Ps+tZ118iquMfJ6JrA0gt7
	qCnMDVvsRqLzKwE11RUVJFF47ozKSKvDSIYxIKG5cfeekj
X-Google-Smtp-Source: AGHT+IEpe7PMvDso9pxqvv0RN6fYjsC0DLBOyEgrC7JZkGxQo5t1o9XYDz6M5BzZRkfcyCvvhIBQkzc18WR5hF6wIpo=
X-Received: by 2002:a05:622a:5a8a:b0:4a6:f098:f7ab with SMTP id
 d75a77b69052e-4a98aadcb04mr20348991cf.4.1751535772611; Thu, 03 Jul 2025
 02:42:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250703091437.79861-1-zhangzihuan@kylinos.cn>
In-Reply-To: <20250703091437.79861-1-zhangzihuan@kylinos.cn>
From: Xuewen Yan <xuewen.yan94@gmail.com>
Date: Thu, 3 Jul 2025 17:42:41 +0800
X-Gm-Features: Ac12FXyvDah0jmW6VW5zXFUY_OV3D2M7PONxSOJYGb3SgDdjVLrP-8obGRsB3b8
Message-ID: <CAB8ipk_MZ8j_HNtPL4zB3FXVKHMLxCkn_9ohGhhHqrx8xTRnYA@mail.gmail.com>
Subject: Re: [PATCH v1] sched/uclamp: Exclude kernel threads from uclamp logic
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: xuewen.yan@unisoc.com, vincent.guittot@linaro.org, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	hongyan.xia2@arm.com, linux-kernel@vger.kernel.org, ke.wang@unisoc.com, 
	di.shen@unisoc.com, kprateek.nayak@amd.com, kuyo.chang@mediatek.com, 
	juju.sung@mediatek.com, qyousef@layalina.io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi zihuan,

On Thu, Jul 3, 2025 at 5:15=E2=80=AFPM Zihuan Zhang <zhangzihuan@kylinos.cn=
> wrote:
>
> Kernel threads (PF_KTHREAD) are not subject to user-defined utilization
> clamping. They do not represent user workloads and should not participate
> in any uclamp logic, including:

Indeed, some driver would use set_scheduler() to set some kthread to
improve performance.
It is not a good idea to exclude it.

Thanks=EF=BC=81

>
>  - clamp initialization during fork/post-fork
>  - effective clamp value computation
>  - runtime aggregation (uclamp_rq_inc/dec)
>
> Allowing kernel threads into these paths may pollute the rq->uclamp[]
> statistics, mislead schedutil governor's frequency selection, and
> complicate debugging or trace interpretation.
>
> This patch ensures that:
>  - uclamp_fork() and uclamp_post_fork() skip kernel threads
>  - uclamp_eff_value() return default values
>  - uclamp_rq_inc() and uclamp_rq_dec() skip kernel threads
>
> This aligns the semantics of uclamp with its original intent:
> user-space task-specific clamping.
>
> dmesg in uclamp_rq_inc_id:
> [   76.373903] uclamp_rq_inc_id: task:rcu_preempt pid:16 clamp_id:0 value=
:0 kthread:1
> [   76.375905] uclamp_rq_inc_id: task:kworker/2:1H pid:188 clamp_id:1 val=
ue:1024 kthread:1
> [   76.379837] uclamp_rq_inc_id: task:kworker/2:1H pid:188 clamp_id:0 val=
ue:0 kthread:1
> [   76.379839] uclamp_rq_inc_id: task:kworker/2:1H pid:188 clamp_id:1 val=
ue:1024 kthread:1
> [   76.379839] uclamp_rq_inc_id: task:rcu_preempt pid:16 clamp_id:0 value=
:0 kthread:1
> [   76.379841] uclamp_rq_inc_id: task:rcu_preempt pid:16 clamp_id:1 value=
:1024 kthread:1
> [   76.383897] uclamp_rq_inc_id: task:rcu_preempt pid:16 clamp_id:0 value=
:0 kthread:1
> [   76.383897] uclamp_rq_inc_id: task:kworker/2:1H pid:188 clamp_id:0 val=
ue:0 kthread:1
> [   76.383900] uclamp_rq_inc_id: task:rcu_preempt pid:16 clamp_id:1 value=
:1024 kthread:1
> [   76.383901] uclamp_rq_inc_id: task:kworker/2:1H pid:188 clamp_id:1 val=
ue:1024 kthread:1
> [   76.387885] uclamp_rq_inc_id: task:rcu_preempt pid:16 clamp_id:0 value=
:0 kthread:1
> [   76.387885] uclamp_rq_inc_id: task:kworker/2:1H pid:188 clamp_id:0 val=
ue:0 kthread:1
> [   76.387888] uclamp_rq_inc_id: task:kworker/2:1H pid:188 clamp_id:1 val=
ue:1024 kthread:1
> [   76.387889] uclamp_rq_inc_id: task:rcu_preempt pid:16 clamp_id:1 value=
:1024 kthread:1
> [   76.388139] uclamp_rq_inc_id: task:jbd2/sda3-8 pid:316 clamp_id:0 valu=
e:0 kthread:1
> [   76.388140] uclamp_rq_inc_id: task:kworker/1:1H pid:153 clamp_id:0 val=
ue:0 kthread:1
> [   76.388142] uclamp_rq_inc_id: task:kworker/1:1H pid:153 clamp_id:1 val=
ue:1024 kthread:1
> [   76.388143] uclamp_rq_inc_id: task:jbd2/sda3-8 pid:316 clamp_id:1 valu=
e:1024 kthread:1
> [   76.388169] uclamp_rq_inc_id: task:kworker/u48:6 pid:93 clamp_id:0 val=
ue:0 kthread:1
> [   76.388171] uclamp_rq_inc_id: task:kworker/u48:6 pid:93 clamp_id:1 val=
ue:1024 kthread:1
> [   76.388891] uclamp_rq_inc_id: task:rcu_preempt pid:16 clamp_id:0 value=
:0 kthread:1
> [   76.388893] uclamp_rq_inc_id: task:rcu_preempt pid:16 clamp_id:1 value=
:1024 kthread:1
> [   76.392900] uclamp_rq_inc_id: task:rcu_preempt pid:16 clamp_id:0 value=
:0 kthread:1
> [   76.392902] uclamp_rq_inc_id: task:rcu_preempt pid:16 clamp_id:1 value=
:1024 kthread:1
> [   76.398850] uclamp_rq_inc_id: task:kworker/2:1H pid:188 clamp_id:0 val=
ue:0 kthread:1
> [   76.398852] uclamp_rq_inc_id: task:kworker/2:1H pid:188 clamp_id:1 val=
ue:1024 kthread:1
> [   76.401880] uclamp_rq_inc_id: task:ksoftirqd/8 pid:67 clamp_id:0 value=
:0 kthread:1
> [   76.401883] uclamp_rq_inc_id: task:ksoftirqd/8 pid:67 clamp_id:1 value=
:1024 kthread:1
> [   76.409053] uclamp_rq_inc_id: task:kworker/2:1H pid:188 clamp_id:0 val=
ue:0 kthread:1
> [   76.409054] uclamp_rq_inc_id: task:kworker/2:1H pid:188 clamp_id:1 val=
ue:1024 kthread:1
> [   76.410881] uclamp_rq_inc_id: task:kworker/u48:10 pid:97 clamp_id:0 va=
lue:0 kthread:1
> [   76.410884] uclamp_rq_inc_id: task:kworker/u48:10 pid:97 clamp_id:1 va=
lue:1024 kthread:1
> [   76.419947] uclamp_rq_inc_id: task:kworker/1:1H pid:153 clamp_id:0 val=
ue:0 kthread:1
> [   76.419949] uclamp_rq_inc_id: task:kworker/1:1H pid:153 clamp_id:1 val=
ue:1024 kthread:1
> [   76.419976] uclamp_rq_inc_id: task:kworker/u48:6 pid:93 clamp_id:0 val=
ue:0 kthread:1
> [   76.419979] uclamp_rq_inc_id: task:kworker/u48:6 pid:93 clamp_id:1 val=
ue:1024 kthread:1
> [   76.420119] uclamp_rq_inc_id: task:kworker/2:1H pid:188 clamp_id:0 val=
ue:0 kthread:1
> [   76.420121] uclamp_rq_inc_id: task:kworker/2:1H pid:188 clamp_id:1 val=
ue:1024 kthread:1
> [   76.420642] uclamp_rq_inc_id: task:kworker/1:1H pid:153 clamp_id:0 val=
ue:0 kthread:1
> [   76.420644] uclamp_rq_inc_id: task:kworker/1:1H pid:153 clamp_id:1 val=
ue:1024 kthread:1
> [   76.434914] uclamp_rq_inc_id: task:kcompactd0 pid:108 clamp_id:0 value=
:0 kthread:1
> [   76.434916] uclamp_rq_inc_id: task:kcompactd0 pid:108 clamp_id:1 value=
:1024 kthread:1
> [   76.447689] uclamp_rq_inc_id: task:kworker/3:2 pid:244 clamp_id:0 valu=
e:0 kthread:1
> [   76.447691] uclamp_rq_inc_id: task:kworker/3:2 pid:244 clamp_id:1 valu=
e:1024 kthread:1
> [   76.447705] uclamp_rq_inc_id: task:ksoftirqd/3 pid:37 clamp_id:0 value=
:0 kthread:1
> [   76.447707] uclamp_rq_inc_id: task:ksoftirqd/3 pid:37 clamp_id:1 value=
:1024 kthread:1
> [   76.448809] uclamp_rq_inc_id: task:rcu_preempt pid:16 clamp_id:0 value=
:0 kthread:1
> [   76.448811] uclamp_rq_inc_id: task:rcu_preempt pid:16 clamp_id:1 value=
:1024 kthread:1
> [   76.451260] uclamp_rq_inc_id: task:kworker/1:1H pid:153 clamp_id:0 val=
ue:0 kthread:1
> [   76.451263] uclamp_rq_inc_id: task:kworker/1:1H pid:153 clamp_id:1 val=
ue:1024 kthread:1
> [   76.452806] uclamp_rq_inc_id: task:rcu_preempt pid:16 clamp_id:0 value=
:0 kthread:1
> [   76.452808] uclamp_rq_inc_id: task:rcu_preempt pid:16 clamp_id:1 value=
:1024 kthread:1
> [   76.488052] uclamp_rq_inc_id: task:kworker/1:1H pid:153 clamp_id:0 val=
ue:0 kthread:1
> [   76.488054] uclamp_rq_inc_id: task:kworker/1:1H pid:153 clamp_id:1 val=
ue:1024 kthread:1
> [   76.488767] uclamp_rq_inc_id: task:kworker/1:1H pid:153 clamp_id:0 val=
ue:0 kthread:1
> [   76.488770] uclamp_rq_inc_id: task:kworker/1:1H pid:153 clamp_id:1 val=
ue:1024 kthread:1
> [   76.490847] uclamp_rq_inc_id: task:kworker/3:2 pid:244 clamp_id:0 valu=
e:0 kthread:1
> [   76.490848] uclamp_rq_inc_id: task:kworker/2:1 pid:143 clamp_id:0 valu=
e:0 kthread:1
> [   76.490849] uclamp_rq_inc_id: task:kworker/1:3 pid:462 clamp_id:0 valu=
e:0 kthread:1
> [   76.490848] uclamp_rq_inc_id: task:kworker/7:2 pid:687 clamp_id:0 valu=
e:0 kthread:1
> [   76.490849] uclamp_rq_inc_id: task:kworker/11:1 pid:146 clamp_id:0 val=
ue:0 kthread:1
> [   76.490850] uclamp_rq_inc_id: task:kworker/2:1 pid:143 clamp_id:1 valu=
e:1024 kthread:1
> [   76.490851] uclamp_rq_inc_id: task:kworker/3:2 pid:244 clamp_id:1 valu=
e:1024 kthread:1
> [   76.490851] uclamp_rq_inc_id: task:kworker/11:1 pid:146 clamp_id:1 val=
ue:1024 kthread:1
> [   76.490851] uclamp_rq_inc_id: task:kworker/7:2 pid:687 clamp_id:1 valu=
e:1024 kthread:1
> [   76.490853] uclamp_rq_inc_id: task:kworker/1:3 pid:462 clamp_id:1 valu=
e:1024 kthread:1
> [   76.490857] uclamp_rq_inc_id: task:kworker/5:1 pid:141 clamp_id:0 valu=
e:0 kthread:1
> [   76.490859] uclamp_rq_inc_id: task:kworker/5:1 pid:141 clamp_id:1 valu=
e:1024 kthread:1
> [   76.491850] uclamp_rq_inc_id: task:kworker/4:2 pid:534 clamp_id:0 valu=
e:0 kthread:1
> [   76.491852] uclamp_rq_inc_id: task:kworker/4:2 pid:534 clamp_id:1 valu=
e:1024 kthread:1
> [   76.504848] uclamp_rq_inc_id: task:kworker/10:2 pid:228 clamp_id:0 val=
ue:0 kthread:1
> [   76.504852] uclamp_rq_inc_id: task:kworker/10:2 pid:228 clamp_id:1 val=
ue:1024 kthread:1
> [   76.508785] uclamp_rq_inc_id: task:kworker/9:1 pid:142 clamp_id:0 valu=
e:0 kthread:1
> [   76.508787] uclamp_rq_inc_id: task:kworker/9:1 pid:142 clamp_id:1 valu=
e:1024 kthread:1
> [   76.514856] uclamp_rq_inc_id: task:kworker/u48:10 pid:97 clamp_id:0 va=
lue:0 kthread:1
> [   76.514859] uclamp_rq_inc_id: task:kworker/u48:10 pid:97 clamp_id:1 va=
lue:1024 kthread:1
> [   76.522742] uclamp_rq_inc_id: task:kworker/1:1H pid:153 clamp_id:0 val=
ue:0 kthread:1
>
> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> ---
>  kernel/sched/core.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 8988d38d46a3..a1e6b4157682 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -1630,6 +1630,9 @@ unsigned long uclamp_eff_value(struct task_struct *=
p, enum uclamp_id clamp_id)
>  {
>         struct uclamp_se uc_eff;
>
> +       if (p->flags & PF_KTHREAD)
> +               return uclamp_none(clamp_id);
> +
>         /* Task currently refcounted: use back-annotated (effective) valu=
e */
>         if (p->uclamp[clamp_id].active)
>                 return (unsigned long)p->uclamp[clamp_id].value;
> @@ -1769,6 +1772,9 @@ static inline void uclamp_rq_inc(struct rq *rq, str=
uct task_struct *p, int flags
>         if (unlikely(!p->sched_class->uclamp_enabled))
>                 return;
>
> +       if (p->flags & PF_KTHREAD)
> +               return;
> +
>         /* Only inc the delayed task which being woken up. */
>         if (p->se.sched_delayed && !(flags & ENQUEUE_DELAYED))
>                 return;
> @@ -1797,6 +1803,9 @@ static inline void uclamp_rq_dec(struct rq *rq, str=
uct task_struct *p)
>         if (unlikely(!p->sched_class->uclamp_enabled))
>                 return;
>
> +       if (p->flags & PF_KTHREAD)
> +               return;
> +
>         if (p->se.sched_delayed)
>                 return;
>
> @@ -1977,6 +1986,8 @@ static void uclamp_fork(struct task_struct *p)
>  {
>         enum uclamp_id clamp_id;
>
> +       if (p->flags & PF_KTHREAD)
> +               return;
>         /*
>          * We don't need to hold task_rq_lock() when updating p->uclamp_*=
 here
>          * as the task is still at its early fork stages.
> @@ -1995,6 +2006,8 @@ static void uclamp_fork(struct task_struct *p)
>
>  static void uclamp_post_fork(struct task_struct *p)
>  {
> +       if (p->flags & PF_KTHREAD)
> +               return;
>         uclamp_update_util_min_rt_default(p);
>  }
>
> --
> 2.25.1
>
>
