Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00F62397B9
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739201243; cv=none; b=O+i5bQKq8DBGhv5RMmOUO0EO0mFe9nPdVtG4/NF/TlCPBpxVPNjDzaG5isLj2xTU0B6a+B9Qq32IdbXKLYDr5YvDjAk8BEzZSYnBnCpbfSPd8YUIcGh0gz2GFDpJdY3Obaf7YsgRQVWxGABT732EqoIEycLNT1gpxh1EbHm3RLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739201243; c=relaxed/simple;
	bh=U1/rZF6zOJAqI8OY8Ce4AadGuLZuCkbuu66ZHSutObo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PAQDM9QdSkx2a+tgaplT7uw+l3CRDDkvpps0YEtJlM+J+92RZ3onzabOi8i5Wkxmsgeci/HxW4Px01jvszw2UpYpcihBqJ68YOfucZtg8YbN7QX+culS/xPV8g73DHngW1EHnCoMLm2PzY5JyZDEMdcoHOz0pe1LLDgdbzmrS2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jlFG+Z61; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jlFG+Z61"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-47180c199ebso393021cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739201238; x=1739806038; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yZ316OTEKAnaWAw3ip6jFLMYmi3bAEAv/lpBYPcdN08=;
        b=jlFG+Z61RHsyMOxGEhmWkVg3QTreW+CFEGsOS0ic9daD5/szjRF5Hxxgo0UTD9X4uZ
         URskS4JHIQhtuogsVKiZr6WwW0cKj29CxMfYM4GbCx2slytcE/LfRWsDT7Us/NL+AXU+
         JyZE8mtl/nYjCi89g4Q54gepu4X8uIESyV8HHpJRsCGycQ1RLAoaS+8JXMu0A0Pa4JzT
         /BJ8ykfHgwrPn4YkBlCUg8BtKmZUTgMN8KRChFzd9ihn+eHzKzKVnwDQt8OJN3ShhfT1
         E8VHFrGTyLWTzv5HQm2+WGGcz5beNI9Msl1HZZ53yZapaRJ72pp5J1d8linqqbHAxqeQ
         cVqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739201238; x=1739806038;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yZ316OTEKAnaWAw3ip6jFLMYmi3bAEAv/lpBYPcdN08=;
        b=avhUTzpkCucGxnNQU/DdqY6AtFzYdNLcabRz7+M+3l7WropR0Q29vicX9Sv6RLAWo3
         ZoHSHwwcf+tMxUu9w8QdMzdfNOqtMpciR5QXKn9zn1Uq2+ISy0fx3HVSzWBeQbZdghH6
         WLL/IM3ajEClQNGe11sqyqtjbqrCKB6OqPEKXckdx7044NdoUaZzV2RUFv/gwBNmgqmQ
         2+5moBksSoD+yTgRBczDkSl0aZcL0OwLt9LyvR9CVFXZQFJPS7Tf0LLr9xw0wevJEADs
         PUAnyz1PWKOE3/AdK6n2QfsHCVcdqlUFAeId8awqpail9+iluYrytaSiVB0BYEDUrPac
         ocCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzh34pKs5ap1zJvuMTUe36E5I+FyTEFEb/4NOE0039YBN/h1k9aiGdYVqSwv8/09M58qwMqo3Bmk1M/QY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFrjRLHdBJXflFszOOLrAkpFY3h9/dMsnNsCKJCyvnV0x1rC2k
	thmFvxVHztt47eupthYR9SpUqaxKMLcCaQ5pGFgbs04XXOJX+wrfng/8xk3BVxa5XKywlP95TQY
	RNi10J0yeN1tymWkwbAQ1fp1u1NtwQD9DuQpd
X-Gm-Gg: ASbGncvS8rm2rPsEPQo5UhYv0qOSCYwfa7S56jGgB6kOjhsK7eD/CYDsLD+84MIfXhO
	BjWI2YSpAusWuVz3oaCX5A84GYB2iJHL+arYziqhhIbdsH+IibL4Aeo9Ji1NjcSAxWRqoqOSEGR
	D7KczI5fgAUlkaXvAUtgHaahOFdfc=
X-Google-Smtp-Source: AGHT+IGMC9rpyokyquYS20i+q+ma7qGGS+XM/pl59dYsC1sgzfA9pzyKGEeQgh9YV3MTbqORXSHO8DmjEdKJ7ZFsWzg=
X-Received: by 2002:a05:622a:1829:b0:466:8c7c:3663 with SMTP id
 d75a77b69052e-47177e0c91fmr6467531cf.5.1739201238266; Mon, 10 Feb 2025
 07:27:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206044346.3810242-1-riel@surriel.com> <20250206044346.3810242-11-riel@surriel.com>
In-Reply-To: <20250206044346.3810242-11-riel@surriel.com>
From: Brendan Jackman <jackmanb@google.com>
Date: Mon, 10 Feb 2025 16:27:06 +0100
X-Gm-Features: AWEUYZnA61IuaO7K52ByypDfx9F-3cd0JBhr6z4LbJwawKvTYqUz-OtEqws_R8s
Message-ID: <CA+i-1C2zuctxx6oPVVu0zBJ=Q=Hs73mgrWs5jsp8obARNcUS9g@mail.gmail.com>
Subject: Re: [PATCH v9 10/12] x86/mm: do targeted broadcast flushing from
 tlbbatch code
To: Rik van Riel <riel@surriel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, bp@alien8.de, 
	peterz@infradead.org, dave.hansen@linux.intel.com, zhengqi.arch@bytedance.com, 
	nadav.amit@gmail.com, thomas.lendacky@amd.com, kernel-team@meta.com, 
	linux-mm@kvack.org, akpm@linux-foundation.org, jannh@google.com, 
	mhklinux@outlook.com, andrew.cooper3@citrix.com, 
	Manali Shukla <Manali.Shukla@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Feb 2025 at 05:46, Rik van Riel <riel@surriel.com> wrote:
>  /* Wait for INVLPGB originated by this CPU to complete. */
> -static inline void tlbsync(void)
> +static inline void __tlbsync(void)
>  {
> -       cant_migrate();

Why does this have to go away?

> diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
> index 234277a5ef89..bf167e215e8e 100644
> --- a/arch/x86/include/asm/tlbflush.h
> +++ b/arch/x86/include/asm/tlbflush.h
> @@ -106,6 +106,7 @@ struct tlb_state {
>          * need to be invalidated.
>          */
>         bool invalidate_other;
> +       bool need_tlbsync;

The ifdeffery is missing here.

> +static inline void invlpgb_flush_user_nr_nosync(unsigned long pcid,
> +                                               unsigned long addr,
> +                                               u16 nr, bool pmd_stride)
> +{
> +       __invlpgb_flush_user_nr_nosync(pcid, addr, nr, pmd_stride);
> +       if (!this_cpu_read(cpu_tlbstate.need_tlbsync))
> +               this_cpu_write(cpu_tlbstate.need_tlbsync, true);

 Why do we need the conditional here?

I always thought code like this was about avoiding cacheline
contention, but given this is a percpu and it's really only of
interest to the present CPU, is this worthwhile?

I guess it might be sharing a cacheline with some other percpu that is
more shared?

Anyway, not a big deal, I'm mostly asking for my own education.

> @@ -794,6 +825,8 @@ void switch_mm_irqs_off(struct mm_struct *unused, struct mm_struct *next,
>         if (IS_ENABLED(CONFIG_PROVE_LOCKING))
>                 WARN_ON_ONCE(!irqs_disabled());
>
> +       tlbsync();
> +
>         /*
>          * Verify that CR3 is what we think it is.  This will catch
>          * hypothetical buggy code that directly switches to swapper_pg_dir
> @@ -973,6 +1006,8 @@ void switch_mm_irqs_off(struct mm_struct *unused, struct mm_struct *next,
>   */
>  void enter_lazy_tlb(struct mm_struct *mm, struct task_struct *tsk)
>  {
> +       tlbsync();
> +

I have a feeling I'll look stupid for asking this, but why do we need
this and the one in switch_mm_irqs_off()?

> @@ -1661,12 +1694,53 @@ void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
>                 local_irq_enable();
>         }
>
> +       /*
> +        * If we issued (asynchronous) INVLPGB flushes, wait for them here.
> +        * The cpumask above contains only CPUs that were running tasks
> +        * not using broadcast TLB flushing.
> +        */
> +       if (cpu_feature_enabled(X86_FEATURE_INVLPGB))

It feels wrong that we check the cpufeature here but not in e.g.
enter_lazy_tlb().

> +               tlbsync();
> +
>         cpumask_clear(&batch->cpumask);
>
>         put_flush_tlb_info();
>         put_cpu();
>  }
>
> +void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
> +                                            struct mm_struct *mm,
> +                                            unsigned long uaddr)
> +{
> +       u16 asid = mm_global_asid(mm);
> +
> +       if (asid) {
> +               invlpgb_flush_user_nr_nosync(kern_pcid(asid), uaddr, 1, false);
> +               /* Do any CPUs supporting INVLPGB need PTI? */

Not today, but

1. I don't think avoiding static_cpu_has() is worth the cost of making
the reader take that logical step.

2.  AFAIK a new CPU bug never led to enabling KPTI on a CPU that
didn't have it before, and I think that would be a pretty dystopian
future (and hopefully by then we'll have ASI instead...). But we can't
really rule it out.
