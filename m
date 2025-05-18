Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474101B6CE4
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 13:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747575800; cv=none; b=EgiNh/k29w2QpgGxRg3g1l2YwbDeKaQmYAuXKYWrMZ2sh98K8e9YYanM6FZqFw9/AOhCEJUxhsP2ROvd1uGLbF94006rB21Wm409xZSh7rs4aOEXfBkocAuMRpLOH7IjYBb93HqXu2i5hilaf/mXonbN6htapJuQy813oihdw7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747575800; c=relaxed/simple;
	bh=9pfiITaaM0RN+3BJYUYEpu+rC3YDVOFLRLL+DlwN0HY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tko7QuIqIvbaEzBBFtp9dA4c/3JIuvq8ctDpdI690Ht1afyKGZxzubqYSo3isboZYSXPhrsEjoEmYUwPo9bWGbDJUEJ3/1sTPOM06Ro7sysz9D8B6psnlLoz/8/znNz8TcF1ytQeHFp5y/0saSxGyMa3SBuLYkiBmaPd+5Ji5wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KUF5HSHs; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KUF5HSHs"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a366843fa6so651531f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 06:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747575796; x=1748180596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FR+KNazv1a99jxxhP/UXJ5agbYFNsmjfEFgwnSDrxUw=;
        b=KUF5HSHstGdNLdVnprYyqxmAxGpvMXB/6wegdFZa32jYoG/AFv24Fp9waTwSUc36Na
         48sqGPH4OJsCpqiZLaihrjdwOHvEZoRwq3WnV8UA0ekjfN9mqXNIDpKLUFxsGhWunfqR
         ALhYpbt1w7krcBbPHh9nZ+tN+DV4czoewSB3RI2oZAu4A5EiUoaC/5cec9Ibw22UQbHY
         t62zmBnGMGEkcDGaSfeGvR3S6VM5Ep6lR7ESlwdiVz8xWn0l3lp5PQy+lB+TR0alz9wU
         tFQjdMQO5fz82q/2FON+KlxGleY6+6F5BarHFI7Bw7QLRmEQ6FqfvDEJkd8YYP37uSsv
         4GXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747575796; x=1748180596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FR+KNazv1a99jxxhP/UXJ5agbYFNsmjfEFgwnSDrxUw=;
        b=VDIqpoOTdVeJMdh1WPLyi8rZM/zdf9RwX9kicwxX9TNBVeSVX//mgIiSe3/ov50G5n
         /2RZP5HWcL3wVpo559vPj5C6uVFVmGnS3vo6CSz1pCyI8fBEISY8sv87aplLUe5pbLtB
         OzOCeYlMUKx8OxnKEikma7a9dbgyM/sJx7ZBJbfDnEVy9pJonQNmCROD3gyHZ+cid39B
         rY03nBob6A5NDLeHIZKtrvJHTP0ptgIv0daM+qI6JX/nip9nrIrzSabroHR+RmXuPsYy
         vsqWU7IyBpSJ2rV7xZ7qgBtlNuORh0Na7ZOiR+Epv4F/JFtfdlXmkAGXsYbhUjaK/udi
         tPVA==
X-Forwarded-Encrypted: i=1; AJvYcCUUnLg23HsTzh5WF5JRzpGDuSOYuVTyoUqTj42SpLH+MGvlLcFo7y/dlA8a2vkhDx6SbdJzsXHCLIC68X8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yydd+HyHVOSgpCdEMMRBN+92w399LsIoZyybYKWrY9B2L4aUypE
	16urDyXU+rw5wdCkZDKkct03++QIWHNJvpI75kIFfrf75cvdva6r3dNq
X-Gm-Gg: ASbGncs+I5qWoFhvMDGFVVMTDfHoiNLNlzzwiNcV1kuJ2o4m012zcXQEJKXiXnPcQax
	NepNYn6yM5WyAyKZ81hsdRE5lL50CXlEehKxdGqre/CLzzatd3vFqc4qYs07SqZarjqTfgUSN0o
	NK+pPfchypmfKOWAG1WIXlG/fzP/ZMHlxQrnbNAN97zFN8tm9xhX2QxgL1r2Sm19H13noQ7ukJM
	eiZraJagxBYGVggqBRGJWHNcP7NDvLOxm/TWNyl5SpjGQrc/qo2Gq8jGoEnl0tcQDX+s2Y8zP/B
	XBRZ8JT9VyJIpW27gANfeQlFaXH1AScNeJvNBKFe7dEQF6p8TVtiy4GXY62N54KNqPL7k5xY39U
	qkJNZD33PqMSlwg==
X-Google-Smtp-Source: AGHT+IHYRoSSrBbhDVOLUNTqk2BXkEwC1gDrDgs2WlyPQljOulExtuWjFBBFMTIRYVRNL/gIUiYXHQ==
X-Received: by 2002:a05:6000:2407:b0:3a0:a0e5:d28b with SMTP id ffacd0b85a97d-3a35fe5bb31mr7512309f8f.3.1747575796463;
        Sun, 18 May 2025 06:43:16 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a362997dc8sm7925894f8f.46.2025.05.18.06.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 06:43:16 -0700 (PDT)
Date: Sun, 18 May 2025 14:43:15 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Nicolas Pitre <npitre@baylibre.com>
Cc: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH next 0/3] lib: Implement mul_u64_u64_div_u64_roundup()
Message-ID: <20250518144315.2c2b4cb8@pumpkin>
In-Reply-To: <028q4r18-q026-0qoo-sr92-752s68rpp6n4@onlyvoer.pbz>
References: <20250405204530.186242-1-david.laight.linux@gmail.com>
	<5e7mp3nreaadppjhxhpffyff2d2ccwcjf2suonxe43eofngddu@qfufr2wiw7yn>
	<20250516131758.2a304d1b@pumpkin>
	<028q4r18-q026-0qoo-sr92-752s68rpp6n4@onlyvoer.pbz>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 16 May 2025 11:49:44 -0400 (EDT)
Nicolas Pitre <npitre@baylibre.com> wrote:

> On Fri, 16 May 2025, David Laight wrote:
>=20
> > On Fri, 16 May 2025 11:47:58 +0200
> > Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com> wrote:
> >  =20
> > > Hello David,
> > >=20
> > > On Sat, Apr 05, 2025 at 09:45:27PM +0100, David Laight wrote: =20
> > > > The pwm-stm32.c code wants a 'rounding up' version of mul_u64_u64_d=
iv_u64().
> > > > This can be done simply by adding 'divisor - 1' to the 128bit produ=
ct.
> > > > Implement mul_u64_add_u64_div_u64(a, b, c, d) =3D (a * b + c)/d bas=
ed on the
> > > > existing code.
> > > > Define mul_u64_u64_div_u64(a, b, d) as mul_u64_add_u64_div_u64(a, b=
, 0, d) and
> > > > mul_u64_u64_div_u64_roundup(a, b, d) as mul_u64_add_u64_div_u64(a, =
b, d-1, d).
> > > >=20
> > > > Only x86-64 has an optimsed (asm) version of the function.
> > > > That is optimised to avoid the 'add c' when c is known to be zero.
> > > > In all other cases the extra code will be noise compared to the sof=
tware
> > > > divide code.
> > > >=20
> > > > I've updated the test module to test mul_u64_u64_div_u64_roundup() =
and
> > > > also enhanced it to verify the C division code on x86-64.
> > > >=20
> > > > Note that the code generated by gcc (eg for 32bit x86) just for the=
 multiply
> > > > is rather more horrid than one would expect (clang does better).
> > > > I dread to think how long the divide loop takes.
> > > > And I'm not at all sure the call in kernel/sched/cputime.c isn't in=
 a
> > > > relatively common path (rather than just hardware initialisation).
...
> > > I wonder what happend to this series. I'd like to make use of
> > > mul_u64_u64_div_u64_roundup() so I'd be interested to get this into t=
he
> > > mainline. =20
> >=20
> > I've a WIP rewrite of the divide code, speeds it up considerably for
> > 'not amd-64'. =20
>=20
> May I suggest you simply submit the new API now (addressing my latest=20
> comments if possible) and submit the divide optimization later?

I've just 'lobbed in' a 'v2' that excludes the last patch (extra changes
to the test module) and replaces 'if (!divisor) 1/0;' with BUG_ON(!divisor).

I'll to the speedup changes on top.

	David

