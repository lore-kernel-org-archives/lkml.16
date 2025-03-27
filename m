Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02697133987
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 19:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743102603; cv=none; b=pyJ6cORyM5ZpAQ8Q+IOME21w/7mYBokX69q9hM5VHStriQ7EVa+gu7KD0W36Zy+98+lbsB3tkVMeY6YyWlQKxeDYHqrjGaSSK3eZV7rI/15auNHhG+OcMBSKownvwERoZ2vukogh8krnmzYcnEUiWp5v6d5XXV1lUxyrWzsTDGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743102603; c=relaxed/simple;
	bh=RUuFRox/uRP18i3K1c7cQBFPt0r8UQeqKMMt0JvYusg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sM4zkjlSoBpEor/FQrPKgsQuez7EnQvoFUflyFCeZdLNa2hbHacuTKLk40YkIgsQ4CTjUVGPjkc80bqPQZlBJke8FxqyZU2I20uS+l2H348V0TCMLrw8zUQiKc3u34k+zBqmgmtGD1DOgee4mh3eaZtm1oBMy+/IliF+L7t5oao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Nr8GYgW9; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Nr8GYgW9"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e5cbd8b19bso2470a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 12:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743102600; x=1743707400; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUuFRox/uRP18i3K1c7cQBFPt0r8UQeqKMMt0JvYusg=;
        b=Nr8GYgW9FbZ382u/DxFH7HRYiZmw+GL1Qf6s1UgcRJoIqshroxZ/2nB7siPiaZh2m3
         UJcDLgjkJsWnhHDOg4IdyTmelmQtvt+/tm9VwW2z9VctkiwpW7SENy1L2waEjkrJ24Oi
         cAhox2UL+24IHelUphMlX1LQW9nZ2T8RD7dx90eRy4T4Vcc9CdEgPxblBDWXCb8pw7Ic
         EKgKO1oCKtwoM4UMNz44ZBK05QoYf3YjjcfVgt+i+7RVKC2pyjco+BRn8r7FYrbADvbE
         qhbUwZTTWFOB8khUpdG1GtipwyYXu8GbCJjrVLbMRiNtM70YXMUol0paT5FK6PgwvDpC
         OBbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743102600; x=1743707400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RUuFRox/uRP18i3K1c7cQBFPt0r8UQeqKMMt0JvYusg=;
        b=wqbrHsqNLVbWSZn7OlY7fmKTQYevFgnwnnWjQ+UCrtOVQxguw6XEJ3FAWCq8vVG/Jb
         Tz8/04ZwbJoI7sxLPXiuHvYur8Eu7ZiI+lMuqpa60tErgSLFPQ+sRsXCGcaI/Y8hLltF
         x1L68/c6F8kejcEwVUFMLaZ6kcmLjX/XIqVmZQjhId1KR5zUkRi/61RJM/IJJ/aw1JIP
         BcsIyQoIIx1is+Ijzqk9pap6uzvpjBbcd1CDe60TlXIXgSS3USZoX1TLD7HB7Pabn8J/
         rZv1iwK9VL1WnR3fJ49I9JKWQDiZZnd2LREATwIZKScSujEmjriSV1O6L4GWlNlHOU6x
         ZchA==
X-Forwarded-Encrypted: i=1; AJvYcCUL8SXNlUqaN+AFqxPvEHhoGUfpo7ckYMwYjNKLgys9mUnQ3DYPHc9psk3uKCCYe6LPgAq0D1C5s0kzexM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCfI5iApdZ9FY+rUMqCl5Zbmvw0rE/Tc8LzObBnBfSsoszYTM3
	JXJh39aeCckN1mK17eupmBCyK6jkYjr7RBKMX1BjyajytaBT8JnrSynLpJjOX39enoOVqMxPdTi
	W219OH6dFtyAX0w5v4s99ez3yZBavfLd4FY2t
X-Gm-Gg: ASbGncs1IuKHe6BDNzYZLQbhXTeQk9Tqu0PiMcZ22Llcu0VfTmf3hONRpV7vuucln5L
	Za6e0P8DPVKacCGwOyKQf6Dg2puGAOo/cOeKCmLf/pJgLmgtT99vR9Q2e8fovNtdipjJmvfw0Do
	60kRblkGkFk+p0xFHv1deKKrrtA4GI5mmTVg6TilxU/4KGmAQcyil9etBIeEFhSRrG
X-Google-Smtp-Source: AGHT+IHOr4ihodjQlvGDZs5ucW33VxA3jHugvRzddGHMknJhFWeOFtCLmC/UGJxIUeYk/Xc0DHxewm+kR73X7bKSWW4=
X-Received: by 2002:a50:d613:0:b0:5e6:15d3:ffe7 with SMTP id
 4fb4d7f45d1cf-5edc31eb882mr9171a12.7.1743102599869; Thu, 27 Mar 2025 12:09:59
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAG48ez2jj8KxxYG8-chkkzxiw-CLLK6MoSR6ajfCE6PyYyEZ=A@mail.gmail.com>
 <CAG_fn=UF1JmwMmPJd_CJQSzQAfA_z5fQ1MKaKXDv3N5+s3f6qg@mail.gmail.com>
In-Reply-To: <CAG_fn=UF1JmwMmPJd_CJQSzQAfA_z5fQ1MKaKXDv3N5+s3f6qg@mail.gmail.com>
From: Jann Horn <jannh@google.com>
Date: Thu, 27 Mar 2025 20:09:23 +0100
X-Gm-Features: AQ5f1Jr5wNbIvQR1MW-T7jQhq0ywmSJ9hxwgEvhc7yrF336jp7xpkEVq02UK2vU
Message-ID: <CAG48ez1w3YO=dwuGqVF3PdHec6=vbYr3GmabY-qQHbZ0fko2JA@mail.gmail.com>
Subject: Re: does software KASAN not instrument READ_ONCE() on arm64 with LTO?
To: Alexander Potapenko <glider@google.com>
Cc: Will Deacon <will@kernel.org>, kasan-dev <kasan-dev@googlegroups.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, kernel list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 8:29=E2=80=AFAM Alexander Potapenko <glider@google.=
com> wrote:
> On Thu, Mar 27, 2025 at 12:10=E2=80=AFAM Jann Horn <jannh@google.com> wro=
te:
> > Hi!
> >
> > I just realized - arm64 redefines __READ_ONCE() to use inline assembly
> > instead of a volatile load, and ASAN is designed to not instrument asm
> > statement operands (not even memory operands).
>
> Nice catch!
>
> > (I think I may have a years-old LLVM patch somewhere that changes
> > that, but I vaguely recall being told once that that's an intentional
> > design decision. I might be misremembering that though...)
>
> We have some best-effort asm instrumentation in KMSAN (see
> https://llvm.org/doxygen/MemorySanitizer_8cpp_source.html#l04968) and
> could potentially do something similar for KASAN, but if I remember
> correctly there were some corner cases with unknown argument sizes and
> with percpu instrumentation (at least on x86 percpu accesses receive
> an offset of the variable in .data..percpu, not the actual address).

Ah, I see. Annoying that memory operands are used for that...

> > So because __READ_ONCE() does not call anything like
> > instrument_read(), I think instrumentation-based KASAN in LTO arm64
> > builds probably doesn't cover READ_ONCE() accesses?
> >
> > A quick test seems to confirm this: https://godbolt.org/z/8oYfaExYf
>
> So should it be enough to call instrument_read()?

Sort of, I think; but I'm not sure whether instrument_read() is
available in this header or whether that would create an include
dependency loop because READ_ONCE is so fundamental
(linux/instrumented.h depends on linux/compiler.h, which pulls in
asm/rwonce.h). So instrument_read() might maybe need to be open-coded
if we want to use it here? IDK...

And also I think this would probably cause ASAN false-positives in
__read_once_word_nocheck(), because I think disabling ASAN
instrumentation per-function with __no_sanitize_or_inline probably
does not disable explicit instrumentation through instrument_read()?
