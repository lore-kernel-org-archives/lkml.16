Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36071EBA09
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 21:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749503354; cv=none; b=K8CfHjxLPmJ8QRxYkqtrYV8AFL0Ih4xQwqOcOkspiQK5hRSCfpxp2NR0rXqUQcn7YLRhZOUadHXEEDBuEvzpdr3X4J3Zumg27ieu7h6ArkUDOuCtrwDyJlj8WkuCzuCgdz+TCqxrahaMY1flVyQH5e2ji1A+5PhKhWcrLSxXtP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749503354; c=relaxed/simple;
	bh=GQXm7OWaXA72Iap2k/hiMV9+oszOqx5OaWGCsvkRJQA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SfD2+85YD8pF6zjb9Tz0iX8ZEwmIudUPDk4sDg6KpgpSpxJA5nu5o7J6LFPU/APOlwqitQschdcURX2oj5NMrqfyRVQBD7FNGPgZ9KR6XiGz+bhQF47cx9H9nIjMk+jsa1PgmQUPCSlAOZuHge7klB+3R+fP1d/vJo2JvOIxsPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UlvDxFDt; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UlvDxFDt"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a375e72473so2371252f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 14:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749503351; x=1750108151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lAS0rJ1ySea+g/4X6g/budVBfW0UHUVWKvkj245cPik=;
        b=UlvDxFDtTWeFJ85HHC+ynf3BZe+9FkBLHIIXcIwKSfgj2kx9ssfJe5vr6pQppQbzQ7
         9xXumQGT8+NuwNENdqdm15BtryqqDCTKzu3Cu0CVwQXMWk36zX9gsdlBbtJAwTeKDBED
         eh9WCl2kQO6fujgZ9TPtXwegnd+IJQt1pEf1gNL2jvgvPSDmnVLdTvDrrj754Ek7260C
         Ayag7L6pUhEn5nast5+67ct47+8b8TAS3hnjbqPoEMT1Di4XmQ2TzMaCQS3c19gy7Yw3
         zOHbwvKs3HUUWkeESRDZz8Umg13jFSJO7GcclkqWPS2JdB+Zg+6hkbIMcF3eHQGVaxZb
         C0Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749503351; x=1750108151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lAS0rJ1ySea+g/4X6g/budVBfW0UHUVWKvkj245cPik=;
        b=Me8ZSuGoIXTqgSKF9GepP+sk7RNafPFR1ufc8rHk5RrRWO4aCRe5vnoR9RB4VPWLMw
         aZvgZp1kXH+NEBuspo4o+u0sJtF88G9mUdBTpRdSke//16F8LoKb/BGn4Tnu838+qMqs
         FOOjxdE0yl6CGhXagrceub3VzGTmG2/7QBW9qUMId2lUAfv3JrJ29W98/+sio4wQaEoA
         iG1GcQpdAepo4E6XJzr95Nn2dYJWDXLE/Ek62HEMdAk/AvI9ciOiAe9/9aAxV6Anv6sa
         BF4mBE6ZYmNpnyhCbQHRIgKUrfYZ61QxiuqvZZm7ZB0uzRPuyzM6oiYXx26k6s7HyI1B
         WDxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCK05cH15B4vhwrSpIVMlmaSMdxY1zCaf5cxDqGcvbfZ40VSGV3QN5hXjwiWBlZGfEnAaGtArfQ1wh+us=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGMBM4QxwmG2HcDy6PLxsqHBeq7IU4UW1r/fGDeBzaXSTiI0Jv
	n4Mqg0TwHk9TiNPwBkb6M+FOGvDqz1afwxekzdR9bYnW3QDW3zwkY/Zs
X-Gm-Gg: ASbGncsSI3TPk1CYqbjTXoPGZEJOdhyY5xOFDsstEdGgrAdWCDYEHApBgG8Tdhe37X2
	PYVbpORBpOhS4SPfSN0HxQ9EHEMDErnVuXE2a98qPHx6/A2m/ELPFfFg3IUoI/pj1PLNgvJJvp/
	RFBhT6X42+LqNp9qI1/qkVaru+DZku/X9WXiBf70RujuznxSyf3B2m6OGv5LBIq7VELr04wX65/
	wjGmXmWIiT+NV719xprPx7lXhoLp6ryBZu8BQZ0L9OwCzqXb/dI/rNJ20iTVvupw33GtEI+w23+
	aRi4z7H/YDXAid4mueVE530vyBf6G3Pi0l+swdOs2tANWtZxPrlOBR78f3TU27Wz64LkkwnC+WD
	sC/A/yIFQfZt8jDteQwN91lYJ
X-Google-Smtp-Source: AGHT+IH5QTr0zA90Rks2a60GXk28kdppKSN0GNpzl1qwizwa8Myb4hrpbW2lV+aYUuHmlK3zEHu4Lw==
X-Received: by 2002:a05:6000:144b:b0:3a4:dc80:b932 with SMTP id ffacd0b85a97d-3a53188a757mr10615370f8f.8.1749503350742;
        Mon, 09 Jun 2025 14:09:10 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53246b678sm10266045f8f.101.2025.06.09.14.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 14:09:10 -0700 (PDT)
Date: Mon, 9 Jun 2025 22:09:01 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Uros Bizjak <ubizjak@gmail.com>, Mateusz Guzik <mjguzik@gmail.com>,
 torvalds@linux-foundation.org, mingo@redhat.com, x86@kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] x86: prevent gcc from emitting rep movsq/stosq for
 inlined ops
Message-ID: <20250609220901.5059217c@pumpkin>
In-Reply-To: <20250606072029.GI30486@noisy.programming.kicks-ass.net>
References: <20250605164733.737543-1-mjguzik@gmail.com>
	<20250605190054.GH30486@noisy.programming.kicks-ass.net>
	<CAFULd4b1dQO3biWvRoHfpyE-Bot0urmWDzxfO0dEverzuQOpdA@mail.gmail.com>
	<CAFULd4Zito-1VasojoL7qZdu_yggDgQL_0qMSv6ZBrtMe3i1zA@mail.gmail.com>
	<20250606072029.GI30486@noisy.programming.kicks-ass.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 6 Jun 2025 09:20:29 +0200
Peter Zijlstra <peterz@infradead.org> wrote:

> On Fri, Jun 06, 2025 at 08:27:39AM +0200, Uros Bizjak wrote:
> > On Fri, Jun 6, 2025 at 8:13=E2=80=AFAM Uros Bizjak <ubizjak@gmail.com> =
wrote: =20
> > >
> > > On Thu, Jun 5, 2025 at 9:00=E2=80=AFPM Peter Zijlstra <peterz@infrade=
ad.org> wrote: =20
> > > >
> > > > On Thu, Jun 05, 2025 at 06:47:33PM +0200, Mateusz Guzik wrote: =20
> > > > > gcc is over eager to use rep movsq/stosq (starts above 40 bytes),=
 which
> > > > > comes with a significant penalty on CPUs without the respective f=
ast
> > > > > short ops bits (FSRM/FSRS). =20
> > > >
> > > > I don't suppose there's a magic compiler toggle to make it emit pre=
fix
> > > > padded 'rep movs'/'rep stos' variants such that they are 5 bytes ea=
ch,
> > > > right?
> > > >
> > > > Something like:
> > > >
> > > >    2e 2e 2e f3 a4          cs cs rep movsb %ds:(%rsi),%es:(%rdi) =20
> > >
> > > This won't fly, because gas complains:
> > >
> > > z.s: Assembler messages:
> > > z.s:1: Error: same type of prefix used twice =20
> >=20
> > However, it is possible to use " cs ; cs ; cs ; rep movsb".  =20
>=20
> Heh, the way I encoded it was:
>=20
> 	.byte 0x2e, 0x2e, 0x2e
> 	rep movsb %ds:(%rsi), %es:(%rdi)
>=20
> GCC compiled it, and then objdump grokked it (although it outputs one CS
> too few). Your variant is much nicer though.
>=20
> > We can add a compile flag to the compiler, and it will be able to emit
> > the desired sequence.

You want the compiler to use 'rep movsw', 'rep movsl' or 'rep movsq' if it =
knows
the size is a multiple of 2, 4 or 8.
Then you can substitute a suitable function.
But replacing the 'rep movsb' with a call is much more flexible.

You do need to allow for the REX prefix (rep movsq is f3 48 a5).

I also suspect it would be neater to repeat the 'rep' prefix instead of
using the 'cs' prefix.

>=20
> Thanks; Linus, this would be acceptable?

Any compiler change isn't going to be useful in the short term.
(Unless the kernel sources start including gcc.)

	David

