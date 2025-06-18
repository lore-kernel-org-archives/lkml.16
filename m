Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D198281341
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 14:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750256666; cv=none; b=bvTkLkvMgTF/D8AtULdtHEWbSb6o4oHvc/q0RwMREFNreClQPFb9N5CI3fdPzzJ0L9EJCOTtfV3ThJoy5nPfVuAOFFsGqcgPxhaWnAxdPyZLh5vRgT/FDS4hirj9hLDQ39LhEmmlq8LLzuRDYYk/+tqmwGm35eMcblLZhbR4tCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750256666; c=relaxed/simple;
	bh=sr3Z5SQi/c0byycGqZoP+15+8kMGuxUIdam9NQVzQGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gzMKGPtnFAgLelQpcJzUCUztV81ADniOJ5iDCqCGicSMqChfVecvP3YvEj66D/eEXDjL9bgMcRSeUU2mGLFCgXKkxCwmQbjEchEVE6mYlu6setpc7mIFq6cbu+uAzdiBzSZPaP6yQH1DP11LawxPQA6D6OYkx27eIRlmLbXjuVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YS/vSnvn; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YS/vSnvn"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6ecf99dd567so75584146d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 07:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750256663; x=1750861463; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yUcfR2kwkjbsjTzvnqaKQjl0q9VATkRLDawL3wYx9EM=;
        b=YS/vSnvnoeCxpBViYKhwaAv8nFsmmLZsbwi63LV+78MDziBZJ8NPe5CoZcvF5qJCEs
         jJXSG7Ek7CpVIIToQ13vXODbGtgqYnW33ocmkDRQTAmFDS64lhagd1WkX9h6PzsftLzS
         oCMzZbABqu7FIrXhWyZKndUvKB99TPr2UjiZIXZAfyaDBXC3HwOC6WylFyflU2sZ/KaV
         UDaQL3xKnL6bNN+LljugwnT6UCRL/wTsrj8i+xUfXDsa3kgZaTq+/B9OS5JaGavwUyOc
         0MRxeZVD9oGfYYkDWZQ+HNiJH6vIUyrdSsubTHumHWfvHK+ERgxilB8kqZLz3O5R4REO
         WcyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750256663; x=1750861463;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yUcfR2kwkjbsjTzvnqaKQjl0q9VATkRLDawL3wYx9EM=;
        b=SRnAfTvsB16fut5V0ZNGEn2hbBPJC4Nn+DF9tBEw9BNxgpa4S+QSK2L6sb1ratomIJ
         sGGkITZY18iDyfIOCYSZAAFkhGMD9mVTdzkrQRg6gtMgTwiivmHdTqOQ6AMrukH+6zEX
         izaDf10+Dil2T1g2uMzk7R+mXtwycgVHRDyxu7VVi1IarCpNH8mjLFpBgubBuKCFuAw7
         Y29VoGBzu9nCIXh0z0kO8Fk9KUKJ5g+0f8zCTkOpiWTi38WLuaVxXv9wcFGlxjIEUWzk
         z1iwBYGKR8UIPAZDzcywY0Qp/VTNuKniVFluwZAbh+LBubeCQtE+lONAKU05HwwOMpan
         +7+g==
X-Forwarded-Encrypted: i=1; AJvYcCWiOlO6B13TcaodgZ3fUNIJ7IqAmLVmILrbBFPYc6Tg9hzZfZNmXWXVTbAs2AiWfTdunq8V3PtfDrN/efQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7QzAvrOnnMY2gpSE78g7P5DcrbMuMtme+RoZOWRFZn+ozgZFT
	h6UpJ9wuxXuz1LReJyiz+dK0w9Paa5fIrIXxYaYqBjcZTeODz8zryedqxEpbHEum67swiwHLj1i
	tauGs4dZDmILgsQri4qM+WKtVCryZCUBeh9hV8mNQ
X-Gm-Gg: ASbGnct4ifGnTfEax0yOTBNJhhU2rJtbg5EEYEb9kelKJPYiQRWiXXRsfu6uf+HMTsu
	k560GoWnwl5Le8i6t9CMthi3JXbnGWDjqSjpRnR1eG2V4oTCo+ee/csfU28gqufmYbN6em1Yhpt
	yMHoVACSEG0fXDUv8hylKI+oSSn018Gp5c/yMZ/1BiD+UejkXUUPUNhQ3YT7crlQqDN70VA18D
X-Google-Smtp-Source: AGHT+IHdIl6hBZ14aq0nr2z6lG2ii3Kcxe/4qSRb9s4mKKYwgN/kx2q0ATe/pPHiSWFigZOI1t1Rna7e6taADfKz5Ac=
X-Received: by 2002:a05:6214:5249:b0:6fa:c55e:86a with SMTP id
 6a1803df08f44-6fb47759665mr312049966d6.28.1750256663221; Wed, 18 Jun 2025
 07:24:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416085446.480069-1-glider@google.com> <20250416085446.480069-2-glider@google.com>
 <CANpmjNPass_tPdjwguw5N+5HRn81FOJm0axLDMxwbZLrHHH8hg@mail.gmail.com>
In-Reply-To: <CANpmjNPass_tPdjwguw5N+5HRn81FOJm0axLDMxwbZLrHHH8hg@mail.gmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Wed, 18 Jun 2025 16:23:45 +0200
X-Gm-Features: Ac12FXxlhTVNXm_co53abS-moIAJmLryjKY8L53ZBoxurLT46rDjZIdqZcqlZ5g
Message-ID: <CAG_fn=VmddBTURnLESOQHEWYzsiUJCph9mVKS6W84TPqm3DCyw@mail.gmail.com>
Subject: Re: [PATCH 1/7] kcov: apply clang-format to kcov code
To: Marco Elver <elver@google.com>
Cc: quic_jiangenj@quicinc.com, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, Aleksandr Nogikh <nogikh@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

> > +static inline void kcov_remote_start(u64 handle)
> > +{
> > +}
> > +static inline void kcov_remote_stop(void)
> > +{
> > +}
>
> This excessive-new-line style is not an improvement over previously.
> But nothing we can do about I guess...

I think we'd better stick with whatever clang-format gives us.



> > @@ -728,13 +730,15 @@ static long kcov_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
> >                 spin_unlock_irqrestore(&kcov->lock, flags);
> >                 return 0;
> >         case KCOV_REMOTE_ENABLE:
> > -               if (get_user(remote_num_handles, (unsigned __user *)(arg +
> > -                               offsetof(struct kcov_remote_arg, num_handles))))
> > +               if (get_user(remote_num_handles,
> > +                            (unsigned __user *)(arg +
> > +                                                offsetof(struct kcov_remote_arg,
> > +                                                         num_handles))))
>
> Ouch. Maybe move the address calculation before and assign to
> temporary to avoid this mess?
I factored out offsetof(), because the address calculation looked all
the same after formatting.

> >         for_each_possible_cpu(cpu) {
> >                 void *area = vmalloc_node(CONFIG_KCOV_IRQ_AREA_SIZE *
> > -                               sizeof(unsigned long), cpu_to_node(cpu));
> > +                                                 sizeof(unsigned long),
> > +                                         cpu_to_node(cpu));
>
> Ouch.

Someday we'll probably switch clang-format to 100 columns
