Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA8D73477
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 23:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743635764; cv=none; b=dVsrMuoFZieUFWj2IRjc0Wv/Zg46/MYaY+xPQOkBocOB50lL+13rrsehqr4iEPM26hRqbZVeZifZ+wtiB3GSWdaP/4lMFKu4ceAKNIDfr2LKBODqtxyLisy168PZruN1uaxS86FE+bDUGFd3xjPIn6NkIv8dKJjMxXn+7FQoaoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743635764; c=relaxed/simple;
	bh=D6WHhLKBp86v20UDdy7+nirAk/plKGSxIhni9ahn7EU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i3sJmiMnanvfNy6/1etiWA5l4Y/FYMxoGPuYY0jqKZs4o/Vh5/IoATYYIVWUhS2yh7Ky2HFEqi4SCtfpanxDyFtJaLkVUQfDzq9+Q/R4GPEvYkwTqWDysMJcCjG3j8hjlx7yHEm2oFAqRCG/2Qcy9vZrbm/hWzQ6jfUJvY6JriA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KCXGj0/B; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KCXGj0/B"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5eb5ecf3217so612091a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 16:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743635761; x=1744240561; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D6WHhLKBp86v20UDdy7+nirAk/plKGSxIhni9ahn7EU=;
        b=KCXGj0/Bh8vvo9jrSJp3WNk0NWtC+j2nEc7y/2zOivEDKgSJPkI6PnQTiUgCJq3FXh
         4WUWq80Kbkbj/0MzWadRwvapewbOCKVnsUMKR8UvYKvipjHIJM31lM+33orZnPqq/NW9
         4gxV/uXyX9SGkhhS61tinr4TFethwWj4LFlFEYAl04GF+WnWrlZhyv26Iu3cyY690za9
         h57Bqfcz3JOU0TPtujwn62idGaRjWOjmyLQw23SpjwdJnmyConehfOh2fnV0KbBj4glq
         +dPBfx1hF4URdoiQQIEonhX5c/X/3B9m/SkdGxhdybltvMfMXqhtjuzKPkn91CZK+sEq
         ecCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743635761; x=1744240561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D6WHhLKBp86v20UDdy7+nirAk/plKGSxIhni9ahn7EU=;
        b=GWWSSnAy4ZTsTyf+jcWy9c+9jDBw24By6BaM5OnFSr5O1jA9fGLiuZO2Yke7m2gScv
         m1PKGgoxq4sD3KQd/D+/eNip7feZEnUfTnAbCxAtmClFXq27mjCvPq8JH0BOD1z+s9HC
         XL9WZtS0QyhkKOppZIGEW6snWrAj4rK4uiU2oP/JhiwTCC/bYCrXokQmul6/BrzcP1Tu
         6oj3MyfGK14BU1wtQTDV9knbNg2sPIQvBTfdjN3ogDPvQXJhI2fDEhIhL73+GkqNErJ8
         HbRl1ER/nkqlt030Fjn+oAOp8vjq2eyghrNm88LlMBlBQgs/r6f0TQ/bj1Ou44/lF7Be
         eA0w==
X-Forwarded-Encrypted: i=1; AJvYcCV7QHPPOru72NJbTz6pGvo+qxP61NjgA1sWRiArsJ20GCBln1d783lZ/0HznrTahSAX6gLZT0VWvK5V+JE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLsJF3OecNYC5fFvXkNyew3WzQPFGC3tBKcBBAGk/9++YtU+bH
	I4i3BYjn3X8oEdJB25BEiDlSDQjl2nvIbozHPDNHM7LkR978pRO6xGhAiqy2Q5Vwwux0EegFMhd
	+6w2yTCn80fEY9mUpHTdA5blENIU=
X-Gm-Gg: ASbGncubhHSq1wrPLjUtJk1n3ylbKRItPiHhpdmMioTHvProE5J00N50oaMGqrklZPr
	zEiaaXXsUPBXJMPe37PxUvPzfZmtSNOM0B/xNQR2x0Dz8lTYAV0WOWIMdWpFA4yk+Mzoo8dAW1C
	SnxTWhSCcH+nqGn31Srfy7gzE7
X-Google-Smtp-Source: AGHT+IEARbTxgh5FA+rBMEx/4Klvx4Zxwn9QSAdfavUMJLPO/02lrpmhOhisS1MMIbcCqSC+m/BlRL203UUTe7Qt9c0=
X-Received: by 2002:a05:6402:4305:b0:5e5:e78a:c4d7 with SMTP id
 4fb4d7f45d1cf-5f0871ccefbmr265710a12.12.1743635760501; Wed, 02 Apr 2025
 16:16:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <xmzxiwno5q3ordgia55wyqtjqbefxpami5wevwltcto52fehbv@ul44rsesp4kw> <20250402232917.6978ffa3@pumpkin>
In-Reply-To: <20250402232917.6978ffa3@pumpkin>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Thu, 3 Apr 2025 01:15:48 +0200
X-Gm-Features: AQ5f1JpMqkenAIEGOxzdCY120sRHOh6u3tt5gadZVW3gdAMGFIkiUFq_-P0r_jY
Message-ID: <CAGudoHFRbAf=3xWTe_asYLb38D1qr59nCTYmJcGcdetiUgyHLA@mail.gmail.com>
Subject: Re: [RFC PATCH] x86: prevent gcc from emitting rep movsq/stosq for
 inlined ops
To: David Laight <david.laight.linux@gmail.com>
Cc: torvalds@linux-foundation.org, mingo@redhat.com, x86@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 12:29=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Wed, 2 Apr 2025 15:42:40 +0200
> Mateusz Guzik <mjguzik@gmail.com> wrote:
>
> > Not a real submission yet as I would like results from other people.
> >
> > tl;dr when benchmarking compilation of a hello-world program I'm gettin=
g
> > a 1.7% increase in throughput on Sapphire Rapids when convincing the
> > compiler to only use regular stores for inlined memset and memcpy
> >
> > Note this uarch does have FSRM and still benefits from not using it for
> > some cases.
> >
> > I am not in position to bench this on other CPUs, would be nice if
> > someone did it on AMD.
>
> I did some benchmarking of 'rep movsb' on a zen 5.
> Test is: mfence; rdpmc; mfence; test_code; mfence; rdpmc; mfence.
> For large copies you get 64 bytes/clock.
> Short copies (less than 128 bytes) are usually very cheap - maybe 5 clock=
s
> But it then jumps to 38 clocks.
> And the 'elephant in the room' is when (dest - src) % 4096 is between 1 a=
nd 63.
> In that case short copies jump to 55 clocks.
> Otherwise alignment doesn't make much difference.
>

I think this roughly follows the advice on how to do benchmarks, but
at the same time I think it has too much potential to distort
differences when it comes to these routines.

The fence forces the CPU to get rid of the state accumulated prior and
probably prevents it from speculatively messing with instructions
after. But what if uarchs tolerate a mov loop better than rep mov? (up
to a point of course)

Based on my tests with running the compiler, Sapphire Rapids does
prefer the loop approach at least till 256 bytes, despite Fast Short
REP MOV. This can be seen in sync_regs() for example.

If you are up to it, I would appreciate if you ran the actual bench as
described in my opening mail. It is not hard to set up, but it does
require rebuilding the kernel. Perhaps you can do it in a vm, it's not
a scalability bench.

--=20
Mateusz Guzik <mjguzik gmail.com>
