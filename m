Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012B64685
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 00:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745972955; cv=none; b=Hl7kuJ3dN9RzlGdNduufIf1P8NTv/O/+kBS4yh22MhBzv1fSSVMUeRLEzh+DeF8GJ0TiPDzhq2UbTsO9WyfFvMW4ccrY1hX60snsfcnDESsljKuZbVdzwntiiSEqasRDTcbbXhz2m3ZtpF6C4G0XN8ATREOt+G7FssWotMsO1Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745972955; c=relaxed/simple;
	bh=rckdEsw4LI+2Q4VYEsNzqiOS7xxyq/0EBJvPBWu9bjo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s/k8Ou/8pnZWyxVoCLzcc9wQIwRNmZwKwSaTPBFBTiabB9HH+u09Jsg+m4XzmtpQzS49EEN7ElZx/kAka3x8xhKvOLb6U+QcZ+EHgrXlAAiUhCSyBXJM92dmCjLSGx86AgBLOqrnkWYwiWlkvwUY7V5jelmoCMr96o2xmYdwot8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B+HUEtDP; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B+HUEtDP"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-47666573242so500031cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 17:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745972952; x=1746577752; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SET8sA9iAqxjHw6Ms59eY6Brr42Gs60ohd9HvBlI7Ok=;
        b=B+HUEtDPnbQRVIZj2INCuc0Qeqf0iXm5Zn1bBgA1QDnMi4YJ+oELctz9VPs9HHM5dL
         HtNo343gEFXv3Tlikn+CPejXj5Ia/4C8OQpxoiP2kuL1qJNttSFNXbvHlDnI0wlwPVJV
         aL3JVvr9ewpnseJdudlCHvHm7Ws5WbVES000+6GVed7i7dmGDYKRCffL5U4aGjrpfrT8
         0aPRhlKlFKS4IwcxjG5B4TZco4VJHFGbpFamYDlX8OPpaDZzsDcFocdh2sstzZgxkPoR
         tSDCRrPhw3fe0Z21J6sFte7ZveqerUo1X8eUjbXcjv59cIPOBc/snPtXvODu+XjmODil
         tv6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745972952; x=1746577752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SET8sA9iAqxjHw6Ms59eY6Brr42Gs60ohd9HvBlI7Ok=;
        b=nTSZWwrJv3wZ1UA1HmaeyRkzfNWSuN/ix3Qj67gz5eQvGzIJQ/HJ9IPLqoync70/aY
         EujwxAG3Mn4/GKZUsLA9UFPaCwCOvo4v7qq0qhHnoGeT7mdHiOiJhzC7KOkkohC90D9X
         uVnNhONpZT0mfu3Nz8yhq1ApD5zHiUb4f7X2P8qsLotiqpQzsZgfP+vvdpabYhXXBEIt
         Yq/Ian0Px/wPtiPowcpJNH6s1H//1+5iLmG5glMG6U1lwJTPHqfY1D7ufCotprqKmQib
         3b/94QIksaoS4/o00TpjwE02p1Zlw7UzescANUPM7LJatmmBrmrN5QKRFepn7fEvzCrL
         2xvw==
X-Gm-Message-State: AOJu0Ywb3Mg/u9P3jWvcdrN+VOlHGTCvTgSua/hvwXrGFjjdQRZk8Gnn
	/wpQ9yfS/j/9IIsHkDe7vBtkVGSz65+4fi+RbSsDW/ngCo1jnE/iCg/aQ1mlBur9K5Je7gPjb5I
	zV+PgY+6YV6D/Mqhiq0KWsSXKbP1XWJXjaYOfILPXMG1fsrAxRx4doIs=
X-Gm-Gg: ASbGncvvhD6MCe1gGIn0liheZLQGbiBED7ENjLvQ9Z7H+XN12WDgALjeKggKUoqsu1i
	21Z+jxgraB+M9iZpzgzni5Sl6l1MF0y3y2kipqKJGMTcfJIiJIPpaenpAHki2E+j8tH22iBWdW+
	eTDnliikRYs1/TQStUsBmJrk6vZ/Yp3/9NAEnrS+xqU23HzBLwr2zF7lon7wCqIyU=
X-Google-Smtp-Source: AGHT+IGYYwIA/2/5KM/ug1jcPdIS8qPi3fGg3w/31Max0dqI27BtipvLcMKHWDfaI1D8DwJd48fBi1Tpym4pkltqpto=
X-Received: by 2002:ac8:7e83:0:b0:486:9b6e:dd46 with SMTP id
 d75a77b69052e-489b993a5b3mr2073341cf.10.1745972951520; Tue, 29 Apr 2025
 17:29:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428033617.3797686-1-roman.gushchin@linux.dev> <20250428033617.3797686-10-roman.gushchin@linux.dev>
In-Reply-To: <20250428033617.3797686-10-roman.gushchin@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 29 Apr 2025 17:28:59 -0700
X-Gm-Features: ATxdqUHFz_05fXYir2rslhYlMwSd6Gi_vbBqhLqf6_eQZAIUdoejhM82LlPFoTU
Message-ID: <CAJuCfpEdyZWac7diTUYV7JjkpAPDuy9hwT5sfE2AC2zDVPA9ZA@mail.gmail.com>
Subject: Re: [PATCH rfc 09/12] sched: psi: bpf hook to handle psi events
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Alexei Starovoitov <ast@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>, David Rientjes <rientjes@google.com>, 
	Josh Don <joshdon@google.com>, Chuyi Zhou <zhouchuyi@bytedance.com>, cgroups@vger.kernel.org, 
	linux-mm@kvack.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 27, 2025 at 8:37=E2=80=AFPM Roman Gushchin <roman.gushchin@linu=
x.dev> wrote:
>
> Introduce a bpf hook to handle psi events. The primary intended
> purpose of this hook is to declare OOM events based on the reaching
> a certain memory pressure level, similar to what systemd-oomd and oomd
> are doing in userspace.

It's a bit awkward that this requires additional userspace action to
create PSI triggers. I have almost no experience with BPF, so this
might be a stupid question, but maybe we could provide a bpf kfunc for
the BPF handler to register its PSI trigger(s) upon handler
registration?


>
> Signed-off-by: Roman Gushchin <roman.gushchin@linux.dev>
> ---
>  kernel/sched/psi.c | 36 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 35 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/sched/psi.c b/kernel/sched/psi.c
> index 1396674fa722..4c4eb4ead8f6 100644
> --- a/kernel/sched/psi.c
> +++ b/kernel/sched/psi.c
> @@ -176,6 +176,32 @@ static void psi_avgs_work(struct work_struct *work);
>
>  static void poll_timer_fn(struct timer_list *t);
>
> +#ifdef CONFIG_BPF_SYSCALL
> +__bpf_hook_start();
> +
> +__weak noinline int bpf_handle_psi_event(struct psi_trigger *t)
> +{
> +       return 0;
> +}
> +
> +__bpf_hook_end();
> +
> +BTF_KFUNCS_START(bpf_psi_hooks)
> +BTF_ID_FLAGS(func, bpf_handle_psi_event, KF_SLEEPABLE)
> +BTF_KFUNCS_END(bpf_psi_hooks)
> +
> +static const struct btf_kfunc_id_set bpf_psi_hook_set =3D {
> +       .owner =3D THIS_MODULE,
> +       .set   =3D &bpf_psi_hooks,
> +};
> +
> +#else
> +static inline int bpf_handle_psi_event(struct psi_trigger *t)
> +{
> +       return 0;
> +}
> +#endif
> +
>  static void group_init(struct psi_group *group)
>  {
>         int cpu;
> @@ -489,6 +515,7 @@ static void update_triggers(struct psi_group *group, =
u64 now,
>
>                 /* Generate an event */
>                 if (cmpxchg(&t->event, 0, 1) =3D=3D 0) {
> +                       bpf_handle_psi_event(t);
>                         if (t->of)
>                                 kernfs_notify(t->of->kn);
>                         else
> @@ -1655,6 +1682,8 @@ static const struct proc_ops psi_irq_proc_ops =3D {
>
>  static int __init psi_proc_init(void)
>  {
> +       int err =3D 0;
> +
>         if (psi_enable) {
>                 proc_mkdir("pressure", NULL);
>                 proc_create("pressure/io", 0666, NULL, &psi_io_proc_ops);
> @@ -1662,9 +1691,14 @@ static int __init psi_proc_init(void)
>                 proc_create("pressure/cpu", 0666, NULL, &psi_cpu_proc_ops=
);
>  #ifdef CONFIG_IRQ_TIME_ACCOUNTING
>                 proc_create("pressure/irq", 0666, NULL, &psi_irq_proc_ops=
);
> +#endif
> +#ifdef CONFIG_BPF_SYSCALL
> +               err =3D register_btf_fmodret_id_set(&bpf_psi_hook_set);
> +               if (err)
> +                       pr_err("error while registering bpf psi hooks: %d=
", err);
>  #endif
>         }
> -       return 0;
> +       return err;
>  }
>  module_init(psi_proc_init);
>
> --
> 2.49.0.901.g37484f566f-goog
>
