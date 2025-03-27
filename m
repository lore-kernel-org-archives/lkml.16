Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06ECE1F4C84
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 07:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743060599; cv=none; b=OcfFKhzSNfsoo0M/SSt4OGREbz0nOzzQb/+qW6E/9YowJnPjfrAg2t/Pie6WBO/uPCfSoJcUxgYaUxTry/JaaxmF9BBkuTCZBVgqHaOCv5Hv41jJ/csP05/yNglUSGGdAQQDGQqZOZi7QqpTth9lX76CVPyB/OeYNlIHG+3eAd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743060599; c=relaxed/simple;
	bh=UVSK2OcQIxu7GqCdEZXROoD138DGI826o2h6Os0Wvbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g6k1PJdwUyDe6EgdR9OwfrIm6kR/sxquj+JUjcZ7bTlzhnLYsGID5hs1TLA2mYMNnMU+aGuNoIrmIjKnLIZZnUURy7DFgOLgPGWi0sdmatP92gBUAxuQQSVeUAsCYtYXiAavuW7K0s0KJjlTkAZS+G1HSlbsz/qAPApboWY0OT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OqQl2VaB; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OqQl2VaB"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6e8ffa00555so5392256d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 00:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743060596; x=1743665396; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UVSK2OcQIxu7GqCdEZXROoD138DGI826o2h6Os0Wvbs=;
        b=OqQl2VaB1u39fB26cpU7mXCK7/DGUFa5TsIaFeksSNh8R58REJpWPK9pgdNLsXX9uf
         Vse4HQS+nIbqwHM8XOm+/j4UNNxtN+Az8XLHdu78SuVTzsyIGfjrIP04B/p2CA2V4S2v
         57i9RjtGAgJV0oVNIYqnOJkzzMeEmGAN/iY+ug9icD9dfBw0iVxeRargEONB2ASk63r2
         sQz1/GJxM8xWlGYlrqvy9bVTgoOCyXSOEvwOJVpxZ/NLwD1qsuQYO5LyDtYtcjzHR8lU
         kCh0Yf23HHDpavFIgJqRBP/8oqCqokTP5z3Jcb4MCTLKW+yx5inok59xdMv0eKjM+ibZ
         eubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743060596; x=1743665396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UVSK2OcQIxu7GqCdEZXROoD138DGI826o2h6Os0Wvbs=;
        b=bWTmle9O7cKKjnGdf+y5wRbaGor1wjvdGkvNvYxZTRYt4u2bqiEPWrZ9t89GsokcIk
         pj1NrVTtMCQU+RFG/YzfVa1n852nazT3ar7CKom8TjnaRJZ92H52wvtFqE5qbehFg1nL
         LuH/UTLjTdmfKQ1HHm+chRvw8NTgHtgotniRVBiC/bGCRbpxjTlje94TKjUnhKpwCI8t
         4KaKZtRh8sMLzggmPbqRS/hACK0SuCJCm/FWpnevQmgN3RVHg/e8VNlGvGDf+xSfYK2O
         z3dtiiw5NXkA581wdI/oH33p97wqhJqK4g1Jfsxel6GVwzoq0pq+oKjRI6CMgBkKiUNN
         1rjw==
X-Forwarded-Encrypted: i=1; AJvYcCWC58pLjK4yY5C5zQNc28Gd8LrFUIcd/lLMlHpVkzNeP4gaV5QBOMn2itMAMtMlLOFEYhc8tufTqLL2ktU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEGhh9N651hyRzsv5zi4D7JFaPCv4UltLTwPZJCeJ2Y8dVGBK4
	SDnaL0BLnKJXCPKclFI8pM6LEqOzB4geyq6Hy6oos4bhfutxQs705rtd3Ir9a2znZu/k1qXKQVl
	MC9sC6lCyceuWuT9EaI5bAhB/GfaGHjATYdIU
X-Gm-Gg: ASbGncta6nBNXG0HYVT/B4fcztU7MtJYiYuRQzemyyoQMUuVuqyNf7hV+EfuWjlzpv0
	LFBp2379wGuFcD9J4u+z1er8d7whWeXC0nbS5B4STE5m6oSkq6KAXY6DQQp5m7iD87rR0YOCejV
	4vIeMzwO7nhgLE6GhebJaGyFrfI20KBUuriJKBKpiRqVijtqKtYf6E9mNC
X-Google-Smtp-Source: AGHT+IFodbPmwJt4QLy+rox/4P7ba1LI/HNq1Ca31C0T5Xi4oS+Qr4SiPc6bWeImmNVunEMpHRieoFe8u16EuLCSZhM=
X-Received: by 2002:a05:6214:1311:b0:6ed:1da2:afac with SMTP id
 6a1803df08f44-6ed2390449emr39214346d6.32.1743060595360; Thu, 27 Mar 2025
 00:29:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAG48ez2jj8KxxYG8-chkkzxiw-CLLK6MoSR6ajfCE6PyYyEZ=A@mail.gmail.com>
In-Reply-To: <CAG48ez2jj8KxxYG8-chkkzxiw-CLLK6MoSR6ajfCE6PyYyEZ=A@mail.gmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Thu, 27 Mar 2025 08:29:18 +0100
X-Gm-Features: AQ5f1JpUvz_D0Czd4hU24LmSodys4uaFqOZY_Yq3Ndxmm6C9Z-cmzAlUlTUQiTA
Message-ID: <CAG_fn=UF1JmwMmPJd_CJQSzQAfA_z5fQ1MKaKXDv3N5+s3f6qg@mail.gmail.com>
Subject: Re: does software KASAN not instrument READ_ONCE() on arm64 with LTO?
To: Jann Horn <jannh@google.com>
Cc: Will Deacon <will@kernel.org>, kasan-dev <kasan-dev@googlegroups.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, kernel list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 12:10=E2=80=AFAM Jann Horn <jannh@google.com> wrote=
:
>
> Hi!
>
> I just realized - arm64 redefines __READ_ONCE() to use inline assembly
> instead of a volatile load, and ASAN is designed to not instrument asm
> statement operands (not even memory operands).

Nice catch!

> (I think I may have a years-old LLVM patch somewhere that changes
> that, but I vaguely recall being told once that that's an intentional
> design decision. I might be misremembering that though...)

We have some best-effort asm instrumentation in KMSAN (see
https://llvm.org/doxygen/MemorySanitizer_8cpp_source.html#l04968) and
could potentially do something similar for KASAN, but if I remember
correctly there were some corner cases with unknown argument sizes and
with percpu instrumentation (at least on x86 percpu accesses receive
an offset of the variable in .data..percpu, not the actual address).

> So because __READ_ONCE() does not call anything like
> instrument_read(), I think instrumentation-based KASAN in LTO arm64
> builds probably doesn't cover READ_ONCE() accesses?
>
> A quick test seems to confirm this: https://godbolt.org/z/8oYfaExYf

So should it be enough to call instrument_read()?


--=20
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Liana Sebastian
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
