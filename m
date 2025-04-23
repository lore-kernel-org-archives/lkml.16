Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B75D1553A3
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745414248; cv=none; b=ejFR60EDtXaJFm2dISmwdJUKoNz/MgJBOwGJ+EFtmXMLVZR825VoJZWEB05VhM/Y4wI7GcuR7jtmABmabdFXwn5RPxOJU9POjIyKw+sy0mkYZv+MjuHbxcqs0aIhjUidw8w2Q4wmzuCHoY7lbL3sEV6SqWL5k0thwLH06jmMKTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745414248; c=relaxed/simple;
	bh=y/8rtSvifbRVc2f+TMVr5JRsOBv+lpYpJqMnR/GTad4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o7uO8sZ4ABs2u0Q9HT2J6H78w5EK+SznnJ7ElqbYUgZ9D1saQFkthG1OsNJPEfe+/fE67WKLGT7VvwhYewHmXuZA3DDwgRtoeawOHO229BbpsbPeLq1B+KHmdv27aNVZ07dfTwzAQMGdwKxwtV1gKyHz2BafmVRSMtxJgwphV+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=popyCkHd; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="popyCkHd"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6e8ec399427so54229346d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 06:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745414245; x=1746019045; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=47n91vIA+7F3IZw3KWGYOVVfAlHkRgnHFR90Rbj0tB8=;
        b=popyCkHdNUyITWcHEQ8YfKPxaNIDMpcuJtn3S6547VPTJOfdWqedw8QgzXljYTeSOC
         0GNgUw4DhrTkPYdzV+DltXCpgEMRz7sD7qHVJIxyoORO9t4la3BTvUsNVrFMxp2/0hmB
         JjxDPjVuJfkypFbUHxqR5/niko98mVrPG5hOMAxNugD6Y65ohroEkqptNbki6ncRsAsA
         6ZO16nrlgzy0s4xgiiJWzsdFht5eCTXmRaMuLQGe56IjSiWkqhheo9r7e7aUdnuY+gDS
         SM8xqJ6JfggmM9JmuaWYzVeKBN2zWbkjcX2Tp/a9NBFARtMwWOYPx0BmrXlFKTWranZI
         +Yqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745414245; x=1746019045;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=47n91vIA+7F3IZw3KWGYOVVfAlHkRgnHFR90Rbj0tB8=;
        b=i9hxyc/LLWUVdQyMb6ll+U31+WU908Ke9h3Uol1y/6SG+eolQ8h9HWoR6PGGSquHC0
         jGRIEvrjRVi/u+oP+vvm4nUKzAOTPNTQWRagXstFL8CeGbR8smuE+RiUEhoOW3Iy2cDR
         I5RbSGOyCyutjxlz3aMP09TZd18eoLTKBdHlbA2sA3bhRdl2To8hEbIJNu+xHlCp6JFo
         UB/tLlaQ+u3iBXSoAVHj53yaypHQdA8AnfDUsgdYtkTiEkBUuBs7XLdIy33hw/xylFlc
         Yfio3DfTAwCt4GAyZzD9n1OOYx3+2ZrHUvRMpCkbq2zbBFcUKxAxpGPTChUEtGJMLhKR
         cL6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWRiIYuPPTiCQksbpxn1jx17WgIKxA27s6kaK7livk9KQOQpyFSOz18egdjuaQ1dW+r2uhDrXRhE7XHd58=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5PVPvHWER3uxOfNG2kUsLvW2nLidd957bwq44hxUhFFhPVCSi
	RNk9WgPmVjvPorMRweDLUTMt9+sUtUR3lhFivN46aqAdT+UYhT0xuicFblUcib8eHu97ayF8Qw7
	MG4bd8FxIcGVbf2d2e7IXJTXdCrHxZsefoQv2
X-Gm-Gg: ASbGnctRVi7hXjqkeqt/oynCnaKqmPlBBzxe6hGiSDFuWeIGk/N1ZD2DBFBAAn+7Zx6
	/ADAkbCvD84Vm6codnR5AZOUtQE9hVuXtFnpg/RJRyzk0u6yozt5GxXqNqyHn/dVWCU0RvkKarY
	UNljhJMiuN1xSvBCZq/K3nZTOxxNmol7KxvdZoaaUtuf8AV2Feoac8/knykZGruA==
X-Google-Smtp-Source: AGHT+IFI6tbQKYRQR6qMRG6M2ZrsLlzZM1+bPOO+V6KSlbn3nxXW7N5btQB0SOVz/XF86XDiEn+gXDIsb8IOeLC3gio=
X-Received: by 2002:a05:6214:1c47:b0:6e4:7307:51c6 with SMTP id
 6a1803df08f44-6f2c4664a1fmr345097686d6.34.1745414244765; Wed, 23 Apr 2025
 06:17:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416085446.480069-1-glider@google.com> <20250416085446.480069-6-glider@google.com>
 <CANpmjNM=AAtiXeDHgG+ec48=xwBTzphG3rpJZ3krpG2Hd1FixQ@mail.gmail.com> <CAG_fn=WD3ZuJCQ4TiVKXLhn5-=tsaW0d=zrM-TuEokP5zEvOSw@mail.gmail.com>
In-Reply-To: <CAG_fn=WD3ZuJCQ4TiVKXLhn5-=tsaW0d=zrM-TuEokP5zEvOSw@mail.gmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Wed, 23 Apr 2025 15:16:48 +0200
X-Gm-Features: ATxdqUGP6Sm5jILBJHeySVhpgt2vOiTNYZA_rN6aN2uLH5lQDDhJQbQKZx7QM4c
Message-ID: <CAG_fn=UrJGBcmqYkaqy3qckg=vVQZ4fA2cwruSnCdphkP0ZoZQ@mail.gmail.com>
Subject: Re: [PATCH 5/7] kcov: add ioctl(KCOV_UNIQUE_ENABLE)
To: Marco Elver <elver@google.com>
Cc: quic_jiangenj@quicinc.com, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, Aleksandr Nogikh <nogikh@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

> > >  void notrace __sanitizer_cov_trace_pc_guard(u32 *guard)
> > >  {
> > > -       if (!check_kcov_mode(KCOV_MODE_TRACE_PC, current))
> > > -               return;
> > > +       u32 pc_index;
> > > +       enum kcov_mode mode = get_kcov_mode(current);
> > >
> > > -       sanitizer_cov_write_subsequent(current->kcov_state.s.trace,
> > > -                                      current->kcov_state.s.trace_size,
> > > -                                      canonicalize_ip(_RET_IP_));
> > > +       switch (mode) {
> > > +       case KCOV_MODE_TRACE_UNIQUE_PC:
> > > +               pc_index = READ_ONCE(*guard);
> > > +               if (unlikely(!pc_index))
> > > +                       pc_index = init_pc_guard(guard);
> >
> > This is an unlikely branch, yet init_pc_guard is __always_inline. Can
> > we somehow make it noinline? I know objtool will complain, but besides
> > the cosmetic issues, doing noinline and just giving it a better name
> > ("kcov_init_pc_guard") and adding that to objtool whilelist will be
> > better for codegen.
>
> I don't expect it to have a big impact on the performance, but let's
> check it out.

Oh wait, now I remember that when we uninline that function, that
introduces a register spill in __sanitizer_cov_trace_pc_guard, which
we want to avoid.
