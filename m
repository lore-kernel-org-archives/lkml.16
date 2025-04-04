Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42A61DB34C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 11:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743766564; cv=none; b=retUm3xxsZzR890K9MPDmKj3Goa2GAyO5WDV7QhLXLraxP03Lsxc3kgjMkic/cbdJsf0PxqXsPRe76/qXgfY0Hv5Qu3hWHEZR8EU6RfdVQYnyzqwf7R6nSzPdsCdbGYfDkf6NQM+NUC7yxURlrm61+6KX+1wD22PXGkSF7FWq4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743766564; c=relaxed/simple;
	bh=VESalJP7ZL+nitnbDAWdGop/8vGDiwf3xv7DdkO+lzo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D2uEo2eqI3L1fhAAvgjp8lQDWQGmUSThF2dqXG8vhg1dec+JU+B9R17sKt9BqANlbTQjCafzJtU+rmlJMVa0j/7iR4cXRb3tby9rpZjfaqSgeMD3tCJvRDys7ISuyU2oZzdEVM09gQpPU3NggEEL+Qcl+GBd8OnHu9LbMxKQm9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FuFVzkfU; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FuFVzkfU"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2263428c8baso131465ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 04:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743766561; x=1744371361; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1eyajWB+7jjTPaaR8yZhZbdWh1p1RlxmUfHflZtAUUo=;
        b=FuFVzkfU6eCjMIEy36mpxT8o9gZKNIbRrU6B9ocGx6NWQ2kyiSkK6jvwe4Sighe3Pd
         6qRPtxhi4eMqttxm6KN4DpHKIVAfulME0zOHr8QpabRl+YAIzqBWFatOyXqoopuaBdZy
         3riJpo0eCscZzooxmGV+gUshQYnSTaEb6RWTdQ6D7rqpozNIlSAaIR8E6GIRvmp5czD4
         8grbupVpqsa8fInPzQwJUuN1BkeP5znju0zX82YyGFTDo2SVcn6N+T4KVav81ggMJrTz
         COHiLea5vl1ai7D3HkSvXFus/nMW6FxbXc/L3ptgc/0XwCOFn3S6gt0M5ExVBBBiE7cR
         BhXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743766561; x=1744371361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1eyajWB+7jjTPaaR8yZhZbdWh1p1RlxmUfHflZtAUUo=;
        b=mWDZLA7e9RZZHzc+SBHrzhg71gJE9NBtGyh4AX+FcX9XDR/DrDvh0Vc4n6QT0koeSY
         uxixPCIGCX/FKrLKXhVJo0ACOcb/qBSDTqb4HnhxzMb3Ip8lvxlwFtGwbeefKPRjdld0
         8wl1G6CMzqyZsu7XztQHfQYm6VVyG3oU135PENBVqQEv0Nvuw2zWBNvkGW6YIZO7nPmF
         0O7fS5hgUgyJyhrl4CEElhMbyyQa4imVk/8bT2dcu++LsvfNIrHIFZjImcQPxe89iPhF
         Nw5J08Swki5QzRPZzIGnPUWTFLn4tGuDBd8hmhYTy/lKZSB7YUC9KJWxXsxk0yMWqTkE
         1AOg==
X-Forwarded-Encrypted: i=1; AJvYcCUxs1r1vqsSG4SkTdK48TwDtTc/4SdMy2RBAJ28yT9Fcq5qItj35RysGbC7/fgrg1AfeeY0TfEIVdhKRgc=@vger.kernel.org
X-Gm-Message-State: AOJu0YytT2sSQLibgIi/2YXuZT9nWWgtHdBg9OJc4eR8kiFW3XfTNuII
	1vdZ7KTSLPNXMoy/lgFOotZ9AwJ//S17KalvYl4C84R0liL16vRYwtLxV8rXS8N/LYvcQtEQemy
	NPZM9MWru84k0wSQW9XBEZqm0IJtBfpQEW6L5
X-Gm-Gg: ASbGncuBe0fQfPFm1JANRsjv7teBtIzawjZ5PexI10Ay/skqSR9HG2L4IDmvMiP6Gjf
	M93icKUP8m2AtAUvDD0FebfPn0dxU0pex02QqknmakkFxDxCTFg1uU7AkwHSKDVegcEQPKSVmTp
	YcHKhMBfgIzM8SQYozj6LY3oGxQok=
X-Google-Smtp-Source: AGHT+IED3d7Nee0RkFeQ/TfMnvqofVxnmkzP6wrLXFrYkWR2UjtCec6EbIVzIf0i4xh5ml+5Sm4+57ZZZARaNgNjLIY=
X-Received: by 2002:a17:903:1cb:b0:215:8723:42d1 with SMTP id
 d9443c01a7336-22a89eabbecmr2670415ad.10.1743766560729; Fri, 04 Apr 2025
 04:36:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403165702.396388-1-irogers@google.com> <20250403165702.396388-4-irogers@google.com>
 <48a734d3-0920-402c-afab-f4f205cd6b0d@app.fastmail.com>
In-Reply-To: <48a734d3-0920-402c-afab-f4f205cd6b0d@app.fastmail.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 4 Apr 2025 04:35:49 -0700
X-Gm-Features: AQ5f1JpD8IxezKIMQJr341eabN5TwcT9DjE5US16IXc1hwT1GroRon_SXxjDvaQ
Message-ID: <CAP-5=fUB=UWcrX4JJg5skJ30_mQTy4TwWVU-=g99WSjTg67Eig@mail.gmail.com>
Subject: Re: [PATCH v1 3/5] bitops: Silence a clang -Wshorten-64-to-32 warning
To: Arnd Bergmann <arnd@arndb.de>
Cc: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Jakub Kicinski <kuba@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>, 
	Linux-Arch <linux-arch@vger.kernel.org>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 10:43=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Thu, Apr 3, 2025, at 18:57, Ian Rogers wrote:
> > The clang warning -Wshorten-64-to-32 can be useful to catch
> > inadvertent truncation. In some instances this truncation can lead to
> > changing the sign of a result, for example, truncation to return an
> > int to fit a sort routine. Silence the warning by making the implicit
> > truncation explicit.
>
> The fls64() function only seems to deal with unsigned values, so
> I don't see how it would change the sign.

You are right. I was trying to motivate in the message why building
with -Wshorten-64-to-32 is a good thing, and in this case we're making
an implicit cast explicit.

> > diff --git a/include/asm-generic/bitops/fls64.h
> > b/include/asm-generic/bitops/fls64.h
> > index 866f2b2304ff..9ad3ff12f454 100644
> > --- a/include/asm-generic/bitops/fls64.h
> > +++ b/include/asm-generic/bitops/fls64.h
> > @@ -21,7 +21,7 @@ static __always_inline int fls64(__u64 x)
> >       __u32 h =3D x >> 32;
> >       if (h)
> >               return fls(h) + 32;
> > -     return fls(x);
> > +     return fls((__u32)x);
> >  }
>
> Maybe this would be clearer with an explicit upper_32_bits()/
> lower_32_bits() instead of the cast and the shift?

It feels a little overkill to me, but if others prefer it then it is a
minor change.

Thanks,
Ian

>       Arnd
