Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9F72F49F2
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750268526; cv=none; b=szBrQkpR5xTXNfZ+MSag7ceQC99HC1iay6WoTzxkPz4fIEfMhgJj+cWnBqMikx8g4DX8N2WeFPVJiVL3xultXT7/2fBK+eG07gLPdsO5EUk0vWbD5UAG1UTcF7VeILHSmLveq2cJt15ob4O7qbl/iyfxuJrXjbctb/GjGhz49OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750268526; c=relaxed/simple;
	bh=MSzvZQ8DcRnKWVEjmAFq3/5Xw2XVlCRN38sv4fKdf+M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pZwnDafsE7xZ+gVMynpc/ExDri6ufWnHquSIzTqhtEJUroYPg44mxpeElFjsTt3gBPaLiknRXk5+27Run0TGDbjhTLlmPCIZ/DeR2nj2rEMeoqKPsTVx6KR1eMOzUi6XLTrq4bPnWl1EraGhHWUh7fIq+ROmfpqplAs8o971hkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VGYT9Q5n; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VGYT9Q5n"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6fafc79bca8so84128516d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750268523; x=1750873323; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4KtsacfCH4ompyndjxAxteo2uJlXhUngPXY36wLIt+Q=;
        b=VGYT9Q5n77g7QCdDwvXJeJpPpaUoqgaQSi+y4ZxXrtZ/r4jWHrH73+kKUEvXPN6bFo
         40AX0z4og55mUy/oQQTA+oaso8XdZu0K21vRBB0jeQsTA9Iowi/hjoGrAWPzay9iM0+P
         aNMUE/STdoxiesjOqHxdhUrzP5awcSJscVCakNLp330zVw/XQGJej3owtb/oeu2+DF8E
         EHC0pb/Mk3VW1/ynJEPEB095Rv1sMxzwVQo3XSJtaPwBHyPYrjPClS+PKYcnAy/nKoV3
         os/ET+i+Xhx1wKNgZD1iEXqUelYFiWFNgq7VcgpxhxwKU5Rbg/OR0YA36OfgQaTxmjWg
         LSvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268523; x=1750873323;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4KtsacfCH4ompyndjxAxteo2uJlXhUngPXY36wLIt+Q=;
        b=OIhHHsxj9S21qRs1y1USAauHn2I2JuDVASosVQR942b7Sei0B0AQdPyjPK028GpOsy
         vaInaTizqoLI9Z4hshGvA87CSor+2wPsMhlMcDTCX3p8rJ8wU+Icj7x6TiueqwlKtuSf
         IkRti2ZPxkUy4KW6X2OyBys82rF+a7Ht6DVA5jqjpzqjjSNWgl9w78nai+Bc6skMGoiE
         9TN+8i9uIqYR31BDAWGkGd8WZXLZ+5hmcUt5hFQicWiPmi5MgZNhAbCcyhlcXRebDkGL
         3GAgO6p1YW9KRQTEaRFbqN6arqhVmJ1vIuZprgpYM7eqSgnv+7hW/O2nBZG1VuwOULDX
         95+g==
X-Forwarded-Encrypted: i=1; AJvYcCXJePiYJ5zpBaBxxvZRm+gx2x1bQeSQJCB3mIM2xTjAs2r03Pg+E6RH6CeQijKcQZSx/PDc9iGGkCZiAt0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxHK5Ir3Dljo4EZQQwjC4ODzbQ+71L+tW+dZ1FJLbr5BQ1F1Jz
	UQGxXGGTxaDSdi3hr9ITCVSgZ/bab8HuoJgLYZzV3wXbVLHLZX0ALrUAmqQbU3hdZ+V+lyLEaw9
	pswOzgG07BNwwieLvJONX/JiK/bqbIrA075RSgfRt
X-Gm-Gg: ASbGncugxgCUiRiED9oizjpmcw9g6noYVLCAqJYb2W+zT+UfSI7YRA2MNxcOIhBdVpU
	SttGGZb57Cf+1HAuS4Tgw02IJ60tFaxR01sVpi32/vAos3wLdj5wEseXVgrjwgAfV5XXWJxNB3t
	nxppa5fPuZYcABnSBVQ7/PNQ6OryxNjmLwY2q4bbKGrifr9R4oK4srbpbsZMUXUu9AJi2wgRxj
X-Google-Smtp-Source: AGHT+IEqixnpKpo8WWVQ7PKmKI/0NKZy0aQGz8wi2uqIHNrjBFilS81Nz0eKUrKDkfKBXuNRsZ1jp02EjFLOfb/W0Wc=
X-Received: by 2002:a05:6214:2f82:b0:6fa:c81a:6234 with SMTP id
 6a1803df08f44-6fb47786b3fmr291387006d6.10.1750268523147; Wed, 18 Jun 2025
 10:42:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416085446.480069-1-glider@google.com> <20250416085446.480069-3-glider@google.com>
 <CANpmjNNCf+ep-1-jZV9GURy7UkVX5CJF7sE_sGXV8KWoL6QPtQ@mail.gmail.com>
In-Reply-To: <CANpmjNNCf+ep-1-jZV9GURy7UkVX5CJF7sE_sGXV8KWoL6QPtQ@mail.gmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Wed, 18 Jun 2025 19:41:26 +0200
X-Gm-Features: Ac12FXwkIZeCxG1skmZP_wQUq_V6XjEjYDn0jhV__bms-J4s-zMDCJE6vbE-kG4
Message-ID: <CAG_fn=W9_QEhwoSwc9efY9cEFkagBTC=Q6u=wtf1rA+aJqa-Zg@mail.gmail.com>
Subject: Re: [PATCH 2/7] kcov: factor out struct kcov_state
To: Marco Elver <elver@google.com>
Cc: quic_jiangenj@quicinc.com, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, Aleksandr Nogikh <nogikh@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

> > ---
> >  MAINTAINERS                |   1 +
> >  include/linux/kcov-state.h |  31 ++++++++
>
> Looking at <linux/sched.h>, a lot of the headers introduced to factor
> out types are called "foo_types.h", so this probably should be
> "kcov_types.h".

Yeah, it makes sense, thank you!


> > +
> > +#ifdef CONFIG_KCOV
> > +struct kcov_state {
> > +       /* See kernel/kcov.c for more details. */
> > +       /*
> > +        * Coverage collection mode enabled for this task (0 if disabled).
> > +        * This field is used for synchronization, so it is kept outside of
> > +        * the below struct.
> > +        */
> > +       unsigned int mode;
> > +
>
> It'd be nice to have a comment why the below is in an anon struct "s"
Ack

> - AFAIK it's to be able to copy it around easily.
Yes, correct.

> However, thinking about it more, why does "mode" have to be in
> "kcov_state"? Does it logically make sense?

You might be right. Almost everywhere we are accessing mode and
kcov_state independently, so there isn't too much profit in keeping
them in the same struct.
Logically, they are protected by the same lock, but that lock protects
other members of struct kcov anyway.

> We also have this inconsistency where before we had the instance in
> "struct kcov" be "enum kcov_mode", and the one in task_struct be
> "unsigned int". Now they're both unsigned int - which I'm not sure is
> better.

You are right, this slipped my mind.

> Could we instead do this:
> - keep "mode" outside the struct (a bit more duplication, but I think
> it's clearer)
Ack

> - move enum kcov_mode to kcov_types.h
Ack

> - define all instances of "mode" consistently as "enum kcov_mode"

There is one tricky place where kcov_get_mode() handily returns either
an enum, or an error value. Not sure we want to change that (and the
declaration of "mode" in kcov_ioctl_locked()).
Or otherwise we could define two modes corresponding to -EINVAL and
-ENOTSUPP to preserve the existing behavior.

> - make kcov_state just contain what is now in "kcov_state::s", and
> effectively get rid of the nested "s"

Yeah, this is doable.


> > @@ -54,24 +55,16 @@ struct kcov {
> >          *  - each code section for remote coverage collection
> >          */
> >         refcount_t refcount;
> > -       /* The lock protects mode, size, area and t. */
> > +       /* The lock protects state and t. */
>
> Unlike previously, this implies it also protects "s.sequence" now.
> (Aside: as-is this will also make annotating it with __guarded_by
> rather difficult.)

As far as I can see, s.sequence is accessed under the same lock
anyway, so it is not too late to make it part of the protected state.
Or am I missing something?
