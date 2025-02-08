Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41639241117
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 19:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739043173; cv=none; b=sOG08awgVPHznBoT/YjNIq/HIaDm+3y7aVCPmAQOgF5vrUURr6+6i0oVmi30YR/E4m7jKc19OAYwj3MAA/B6YpF1wpgAPLT/nJqWERYOkEvnoCsyEMnnKM1MrHfDMZOte7CNqHyDnIKCdGTbYAURwUSTwm2OC+iZEgm4pwEnim4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739043173; c=relaxed/simple;
	bh=vJ9lCUk/TUaMgCf8PErRDe7NgUjJC0Is05mkFyMD75A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AkRkTyp1IkKOSeF8G92UfsgSDLHGTFn9zaqXEKxuLl7ZRn9bkzsfn9MXsqgD0ETSdu78wpj2BkGjLgntwqi7y0YmvbkLtp0ur+TdHAy2bi0yknbI+Otw6OjMfnO1cQnJl/mtbWWZyhhoAdUEyeddrEcpEXkBZFoIPaoiKt6Z96M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MWav0YQD; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MWav0YQD"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5de6c70832bso295171a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 11:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739043169; x=1739647969; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+FZs8q8ftsdU4wJEkhQIrC5ScCI5wVWiJUplliectHY=;
        b=MWav0YQDLa0kH6nLWkZIJXHsMRUdza2ZDh4tzxoVSfqYjbLJaRO5c9ZmB5Z7WyxIso
         Pl2MT3/BnABXJpbbZ+bQ3mCTNBs1tNjq8/P7L2mnyduQUHlDStVG+EhcthLuo+vBwRS/
         elAQUHDwfAw2vwK0kBwNoo0icbx5+tvn3l/P016Zp5eNfQBLLKxeWAbNzDwoUNQCY5iK
         f5D6B3KMyJtlneuTU1tJGTw9vUi9YlfejLd41Fq2RNFLiOVqU9qmF6bRdnsCzdJzVMRR
         NKvVAQU2hTxtVsKd9jkSgRkTy5H3MCZiq5fUi9WPDUf86vCUmV5fA212kAkflfL2ip+Z
         xu3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739043169; x=1739647969;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+FZs8q8ftsdU4wJEkhQIrC5ScCI5wVWiJUplliectHY=;
        b=i3j+r78wergZ+ChjCdk00Q6n+/VFeVB8CAKkLlAdl9EhTHm9u8Z7rx5q3ykK6w7ewH
         Wcq1WTM5ADBMYVUpo0kFhPGRC3LGExjyH2g1AC0Zi+i9Ni+Nwxgl+r3AbI7u6z88WNbv
         3y6IyVzcNaNlPMixfSsjx4Ntyd4CoaJfUmUPYSJbqcs9tsHx86Spw6LOF6wvs6BQqy4F
         YMzlwXQLShi6kq3e0pd+g08CjL5leSZ3TokxOzN3EJGzy8qrCcOLwD1JfiKPZJlwQZ5i
         fUbI6mzt0rwKVIr7uQwtWIB5pqNyK58VBg0V+rl5RDeNtBTyEiVSY/YOZz/xwZyWS1kd
         BgIA==
X-Forwarded-Encrypted: i=1; AJvYcCU60RItGbzgmcjfU60/riA0OJdjsN0Yclr7PNXaXmeZsOK12UG0b1JFBeWJOw6QGEZEIlR9ZRQDhcaGuY4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9Y6KqjvuSAkOR3317xxW8inNy91vEiVFvgTNMmvlZCTd2npes
	SYSGjSoyhAbG6v8CvnEkUbOX6fwzcXXv38dyZoaBVl5FxyiL4iaO9YqKm3++U41mlmLBlzvyrl1
	lKItaQUVEeM7y9+I2RBUIAnBW+5pDX9gClqat5g==
X-Gm-Gg: ASbGncvXsArEi3uHw2slFKpnOjr1J92Cd1oWPD4xsFQnMbydMRPpum8c1wgi8zYBE00
	+d+TqA4A+9DSQ6VU3EnoRmQUdw1Z7+E+NX86JqzHDghbtANYHGvq6puOurbAAkN+Fb5IdWOEQ1Q
	==
X-Google-Smtp-Source: AGHT+IHaKVyKkmd6xHX8EHvVTmdNCvvbkQYTJwk6PJMuW1bvmisSCSA36omrGd2CB0F1tRie2cfAY2xu6FKAUr3TTJQ=
X-Received: by 2002:a05:6402:5186:b0:5dc:7965:80d5 with SMTP id
 4fb4d7f45d1cf-5dcecc3d9efmr12966623a12.1.1739043169568; Sat, 08 Feb 2025
 11:32:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250208074821.11832-1-15645113830zzh@gmail.com> <20250208075747.14104-1-15645113830zzh@gmail.com>
In-Reply-To: <20250208075747.14104-1-15645113830zzh@gmail.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Sat, 8 Feb 2025 20:32:38 +0100
X-Gm-Features: AWEUYZmX4FKsAa0sDRb-ygUjRt5TvaHpySJQ9LC5naihV3BQrVOtAiozJa3xUwM
Message-ID: <CAKfTPtDuCJTOJ0WvtEJLmkanZCWLfKG-D5r8+8p7EWGin2mGRw@mail.gmail.com>
Subject: Re: [PATCH V3 2/2] sched: Reduce the default slice to avoid tasks
 getting an extra tick
To: zihan zhou <15645113830zzh@gmail.com>
Cc: bsegall@google.com, dietmar.eggemann@arm.com, juri.lelli@redhat.com, 
	linux-kernel@vger.kernel.org, mgorman@suse.de, mingo@redhat.com, 
	peterz@infradead.org, rostedt@goodmis.org, vschneid@redhat.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 8 Feb 2025 at 08:59, zihan zhou <15645113830zzh@gmail.com> wrote:
>
> Update sysctl_sched_base_slice with debugfs, limit its value and
> update normalized_sysctl_sched_base_slice.
>
> Rename the function sched_update_scaling to sched_update_scaling_or_slice,
> it is no longer related to CONFIG_SMP and return void, as the previous
> function always returns 0 and there is no need to judge the return value
> again, just like the function update_sysctl.
>
> Signed-off-by: zihan zhou <15645113830zzh@gmail.com>
> Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>

My Reviewed applied only for patch 1 not patch 2. That's also why I
asked you to split it. Patch 1 makes sense for me but I don't see the
benefit of patch 2

> ---
>  kernel/sched/debug.c | 52 +++++++++++++++++++++++++++++++++++++++++---
>  kernel/sched/fair.c  |  8 +++----
>  kernel/sched/sched.h |  4 ++--
>  3 files changed, 54 insertions(+), 10 deletions(-)
>
> diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
> index fd7e85220715..f40d9d638939 100644
> --- a/kernel/sched/debug.c
> +++ b/kernel/sched/debug.c
> @@ -166,6 +166,53 @@ static const struct file_operations sched_feat_fops = {
>         .release        = single_release,
>  };
>
> +static ssize_t sched_base_slice_write(struct file *filp, const char __user *ubuf,
> +                                  size_t cnt, loff_t *ppos)
> +{
> +       char buf[16];
> +       unsigned int base_slice;
> +
> +       if (cnt > 15)
> +               cnt = 15;
> +
> +       if (copy_from_user(&buf, ubuf, cnt))
> +               return -EFAULT;
> +       buf[cnt] = '\0';
> +
> +       if (kstrtouint(buf, 10, &base_slice))
> +               return -EINVAL;
> +
> +       base_slice = clamp_t(u64, base_slice,
> +                                       NSEC_PER_MSEC/10,   /* HZ=1000 * 10 */
> +                                       NSEC_PER_MSEC*100); /* HZ=100  / 10 */
> +
> +       sysctl_sched_base_slice = base_slice;
> +
> +       sched_update_scaling_or_slice();
> +
> +       *ppos += cnt;
> +       return cnt;
> +}
> +
> +static int sched_base_slice_show(struct seq_file *m, void *v)
> +{
> +       seq_printf(m, "%d\n", sysctl_sched_base_slice);
> +       return 0;
> +}
> +
> +static int sched_base_slice_open(struct inode *inode, struct file *filp)
> +{
> +       return single_open(filp, sched_base_slice_show, NULL);
> +}
> +
> +static const struct file_operations sched_base_slice_fops = {
> +       .open           = sched_base_slice_open,
> +       .write          = sched_base_slice_write,
> +       .read           = seq_read,
> +       .llseek         = seq_lseek,
> +       .release        = single_release,
> +};
> +
>  #ifdef CONFIG_SMP
>
>  static ssize_t sched_scaling_write(struct file *filp, const char __user *ubuf,
> @@ -188,8 +235,7 @@ static ssize_t sched_scaling_write(struct file *filp, const char __user *ubuf,
>                 return -EINVAL;
>
>         sysctl_sched_tunable_scaling = scaling;
> -       if (sched_update_scaling())
> -               return -EINVAL;
> +       sched_update_scaling_or_slice();
>
>         *ppos += cnt;
>         return cnt;
> @@ -505,7 +551,7 @@ static __init int sched_init_debug(void)
>         debugfs_create_file("preempt", 0644, debugfs_sched, NULL, &sched_dynamic_fops);
>  #endif
>
> -       debugfs_create_u32("base_slice_ns", 0644, debugfs_sched, &sysctl_sched_base_slice);
> +       debugfs_create_file("base_slice_ns", 0644, debugfs_sched, NULL, &sched_base_slice_fops);
>
>         debugfs_create_u32("latency_warn_ms", 0644, debugfs_sched, &sysctl_resched_latency_warn_ms);
>         debugfs_create_u32("latency_warn_once", 0644, debugfs_sched, &sysctl_resched_latency_warn_once);
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 34e7d09320f7..0fe7c4530a87 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -981,8 +981,8 @@ struct sched_entity *__pick_last_entity(struct cfs_rq *cfs_rq)
>  /**************************************************************
>   * Scheduling class statistics methods:
>   */
> -#ifdef CONFIG_SMP
> -int sched_update_scaling(void)
> +
> +void sched_update_scaling_or_slice(void)
>  {
>         unsigned int factor = get_update_sysctl_factor();
>
> @@ -990,10 +990,8 @@ int sched_update_scaling(void)
>         (normalized_sysctl_##name = sysctl_##name / (factor))
>         WRT_SYSCTL(sched_base_slice);
>  #undef WRT_SYSCTL
> -
> -       return 0;
>  }
> -#endif
> +
>  #endif
>
>  static void clear_buddies(struct cfs_rq *cfs_rq, struct sched_entity *se);
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index c7cf4cc57cdd..3ac73cbd711f 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -1923,6 +1923,8 @@ init_numa_balancing(unsigned long clone_flags, struct task_struct *p)
>
>  #endif /* !CONFIG_NUMA_BALANCING */
>
> +extern void sched_update_scaling_or_slice(void);
> +
>  #ifdef CONFIG_SMP
>
>  static inline void
> @@ -2088,8 +2090,6 @@ static inline void update_sched_domain_debugfs(void) { }
>  static inline void dirty_sched_domain_sysctl(int cpu) { }
>  #endif
>
> -extern int sched_update_scaling(void);
> -
>  static inline const struct cpumask *task_user_cpus(struct task_struct *p)
>  {
>         if (!p->user_cpus_ptr)
> --
> 2.33.0
>
