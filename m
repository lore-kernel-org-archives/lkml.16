Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE75236A7C
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 14:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739196930; cv=none; b=ULy4/n+Jb4UZfD95iSoA82HhKRXUiXykMx/NinYQAGt4UZwX7ojQpzraj8qzc20IeKnCaDsLGZFEjEql9Q/QGUw6dXEuoek+OcCazRS5ZPFwlCelOe8kXCnKRHaGP4NAoT4LD9SmvjSSTRdZ2dnHgdnFkIGDXhYKMgae9fvamBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739196930; c=relaxed/simple;
	bh=jV9ZM9KJ4l97B3XM23mtjzvW6/V0AEvG7zDBIxfNdAA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pd9seE6T10Ed99Aim/5OOsHfvR44GGbVWe0+rOLceHaprNyGSDwkFcNw1a1UkWTIAdMzBrU9utYTjwLYpL7+gZJnRwZRW/yYVxfse4UPu8q3gcOKRY4r8DminP4MYGCJzGyfpM84otzEpMLAhPcFBhJ0sSwc9DMs206y/9rYuEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ij2N/ihe; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ij2N/ihe"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4718e224eb1so232861cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 06:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739196927; x=1739801727; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dLdP/oKxMdakWzZ4EPoe5ogtcPVBnnydtLFs9opdq1M=;
        b=ij2N/ihePRy6Y7+AAXyUJlfH55ivDsEEl9iWh0dOgG2KWHrQplwIc7Cg96GILDGlKh
         KjX1ZU2zZqVjxbIW8JIst/vDq1tYn6JptXd02YIc/TduvG75BAmxKOJSybhzZUrOas4N
         qjubgQbRIa9XnzyhOJXkJIls2jdj5duhaUGePpCnu1sHs/YU3es/HzYQqpsq55k47fZu
         Kw+AxBq/eRQlrlh/8iDT8dDHacYVNDaPaoET6ooU7QYQ5QuLvsCAmrq52H8HDy2PKhVx
         C/eUw+jvWoZuyKtQtjlm3ocxEtqbq3asY+hlCJNXNXYtH+2HorY8VIcNVwIfJbYbeIBb
         MfSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739196927; x=1739801727;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dLdP/oKxMdakWzZ4EPoe5ogtcPVBnnydtLFs9opdq1M=;
        b=xSkYcujQFEcGilnnwzXcl8oSlW4iM9OhZpJjL1f417VzLMHjBcMUUjtVmLBrKDGz5w
         gP6yBUq0Q91l+2cV9swnRl81EUGYHLiZ7Cz4TVxLyWassM9SFOKuPunRqeVq567u21UL
         c+0Ib5hlWFvhWgglLILdV+bvY9Di2ijsIkgJOyMss6UsSfSsIyd8Tu3ZpFgQF9JLt3FH
         DZttfayENsyBVeLCXvwgrD8RcQarhFQRbzzDo7UQWe6Xiv0+P69ZaJYtsg0trFLGxE0V
         PMIWKJz0oz8udma32Ra7+d5jA3wMbuOC3W9RTHlDCbAxm6LUzo24pQqgshqJoFTG5Yqy
         05iw==
X-Forwarded-Encrypted: i=1; AJvYcCWh55h/u/+us6kDAZEtA0dWN8OHGwnTxgEucuonEO3z6eq5CcGaw91w9jUCzzvMvkEStc6JlkFfqk/rOME=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNCJUo4pV3pq0HA+1FrjCVTiIx3l2drbxzyxM4GSux/pcpGCCU
	y98w9/kFZ8QkhjoI2rjvcvUlu8oEDT1mMPUY/jprxK5mClG3KIu63Xk7Kzbk8KEwoP0N37r6sPB
	PkvT2TzGGHq6EiGFWkRq7AJr2hz/6BPAprgle
X-Gm-Gg: ASbGncuThj2YumPoHarQ5E26Fp9yOTucpCm65MPg2VIALXRM9Dfzy0QNHyC/buu3Plo
	QJOSIsmteOKa7in3+asGYfsNRu/4MqTXouRGMrPUZV9gB72hA7tKtUcaybo5pFHELIeMtBOpcgC
	qpxovYBZ02FRlUBi6JK3JQbds96Gg=
X-Google-Smtp-Source: AGHT+IEGexvXS6MPJZAKDHaRlF5nijqAut2h9euMWvOzIVltnkcIQSbLpdWS9TcKpaINqYk37SxjSgdRI0B8hH1PTpc=
X-Received: by 2002:a05:622a:4291:b0:466:975f:b219 with SMTP id
 d75a77b69052e-471759fcc9cmr7886411cf.8.1739196926921; Mon, 10 Feb 2025
 06:15:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206044346.3810242-1-riel@surriel.com> <20250206044346.3810242-10-riel@surriel.com>
In-Reply-To: <20250206044346.3810242-10-riel@surriel.com>
From: Brendan Jackman <jackmanb@google.com>
Date: Mon, 10 Feb 2025 15:15:15 +0100
X-Gm-Features: AWEUYZk8MqG_c7jLb4tGoW116wgmCinWT2b92SLYLT4paBK5Ts1DNGfOwUSJIZU
Message-ID: <CA+i-1C37LM62cvM33rNCfejA4fSumh_OSVkuuDU91iur_ZxCtQ@mail.gmail.com>
Subject: Re: [PATCH v9 09/12] x86/mm: enable broadcast TLB invalidation for
 multi-threaded processes
To: Rik van Riel <riel@surriel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, bp@alien8.de, 
	peterz@infradead.org, dave.hansen@linux.intel.com, zhengqi.arch@bytedance.com, 
	nadav.amit@gmail.com, thomas.lendacky@amd.com, kernel-team@meta.com, 
	linux-mm@kvack.org, akpm@linux-foundation.org, jannh@google.com, 
	mhklinux@outlook.com, andrew.cooper3@citrix.com, 
	Manali Shukla <Manali.Shukla@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Feb 2025 at 05:47, Rik van Riel <riel@surriel.com> wrote:
> +static u16 get_global_asid(void)
> +{
> +
> +       u16 asid;
> +
> +       lockdep_assert_held(&global_asid_lock);
> +
> +       /* The previous allocated ASID is at the top of the address space. */
> +       if (last_global_asid >= MAX_ASID_AVAILABLE - 1)
> +               reset_global_asid_space();
> +
> +       asid = find_next_zero_bit(global_asid_used, MAX_ASID_AVAILABLE, last_global_asid);
> +
> +       if (asid >= MAX_ASID_AVAILABLE) {
> +               /* This should never happen. */
> +               VM_WARN_ONCE(1, "Unable to allocate global ASID despite %d available\n", global_asid_available);

If you'll forgive the nitpicking, please put the last arg on a new
line or otherwise break this up, the rest of this file keeps below 100
chars (this is 113).

> +               return 0;
> +       }
> +
> +       /* Claim this global ASID. */
> +       __set_bit(asid, global_asid_used);
> +       last_global_asid = asid;
> +       global_asid_available--;
> +       return asid;
> +}
> +
> +/*
> + * Returns true if the mm is transitioning from a CPU-local ASID to a global
> + * (INVLPGB) ASID, or the other way around.
> + */
> +static bool needs_global_asid_reload(struct mm_struct *next, u16 prev_asid)
> +{
> +       u16 global_asid = mm_global_asid(next);
> +
> +       if (global_asid && prev_asid != global_asid)
> +               return true;
> +
> +       if (!global_asid && is_global_asid(prev_asid))
> +               return true;

I think this needs clarification around when switches from
global->nonglobal happen. Maybe commentary or maybe there's a way to
just express the code that makes it obvious. Here's what I currently
understand, please correct me if I'm wrong:

- Once a process gets a global ASID it keeps it forever. So within a
process we never switch global->nonglobal.

- In flush_tlb_func() we are just calling this to check if the process
has just been given a global ASID - there's no way loaded_mm_asid can
be global yet !mm_global_asid(loaded_mm).

- When we call this from switch_mm_irqs_off() we are in the prev==next
case. Is there something about lazy TLB that can cause the case above
to happen here?

> +static bool meets_global_asid_threshold(struct mm_struct *mm)
> +{
> +       if (!global_asid_available)

I think we need READ_ONCE here.

Also - this doesn't really make sense in this function as it's currently named.

I think we could just inline this whole function into
consider_global_asid(), it would still be nice and readable IMO.

> @@ -786,6 +1101,8 @@ static void flush_tlb_func(void *info)
>                 return;
>         }
>
> +       local_tlb_gen = this_cpu_read(cpu_tlbstate.ctxs[loaded_mm_asid].tlb_gen);
> +
>         if (unlikely(f->new_tlb_gen != TLB_GENERATION_INVALID &&
>                      f->new_tlb_gen <= local_tlb_gen)) {
>                 /*
> @@ -953,7 +1270,7 @@ STATIC_NOPV void native_flush_tlb_multi(const struct cpumask *cpumask,
>          * up on the new contents of what used to be page tables, while
>          * doing a speculative memory access.
>          */
> -       if (info->freed_tables)
> +       if (info->freed_tables || in_asid_transition(info->mm))
>                 on_each_cpu_mask(cpumask, flush_tlb_func, (void *)info, true);
>         else
>                 on_each_cpu_cond_mask(should_flush_tlb, flush_tlb_func,
> @@ -1058,9 +1375,12 @@ void flush_tlb_mm_range(struct mm_struct *mm, unsigned long start,
>          * a local TLB flush is needed. Optimize this use-case by calling
>          * flush_tlb_func_local() directly in this case.
>          */
> -       if (cpumask_any_but(mm_cpumask(mm), cpu) < nr_cpu_ids) {
> +       if (mm_global_asid(mm)) {
> +               broadcast_tlb_flush(info);
> +       } else if (cpumask_any_but(mm_cpumask(mm), cpu) < nr_cpu_ids) {
>                 info->trim_cpumask = should_trim_cpumask(mm);
>                 flush_tlb_multi(mm_cpumask(mm), info);
> +               consider_global_asid(mm);

Why do we do this here instead of when the CPU enters the mm? Is the
idea that in combination with the jiffies thing in
consider_global_asid() we get a probability of getting a global ASID
(within some time period) that scales with the amount of TLB flushing
the process does? So then we avoid using up ASID space on processes
that are multithreaded but just sit around with stable VMAs etc?

I guess another reason would be in the bizarre case that we ran out of
global ASIDs and then entered one big workload that effectively owns
all the CPUs, that big workload can still get a global ASID later once
the old processes free them up, even if we enter it before
reset_global_asid_space().

Just to be clear - this isn't an objection, I just wanna see if I
actually understood the design.

I guess it would be worth having a comment about it - especially if
I'm missing something or totally wrong.
