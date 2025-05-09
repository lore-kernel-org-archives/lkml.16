Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0291D2327A3
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 16:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746807015; cv=none; b=TdQEoeGKfi/XVAR+YdLf9FrGBAHehnVT7Y2AGX4Jw3EpJ2eHlN1ru0L7l8JS24jKgJjq9NoOr0xcQJEO7Q572z9yJ9o/tyy+HpPlNmFGl+LmjX3DgPnoOlqL7vd9p/PXL1SfVL+T08VImPuebOC0G2pS+qbpNPpIFQvTf1CSuwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746807015; c=relaxed/simple;
	bh=uoSXEquHDqYPEqEkV/ozAUTflYmdGbZaWZR3IgRaHHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I/qhZqnWBJLmqks8fPoU9fBeFlLOtg2G+anSbmtgYo/yBGc7eV3tLoHLvMQEya7u7YAsJPZK47Of4QJogTLqQSgrpigfWvot1SaC2ukEFVwNvRycplK8Tr5O3+//gHzQWsgwGZiAK60p0dilhieuR1xcZat4sVToD7OGLWa6t6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4LU/6+iP; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4LU/6+iP"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-47e9fea29easo358231cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 09:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746807013; x=1747411813; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H2oav+qfacpS8QQCmqXiLrV/4p7+2M/TJ6/O5XYWWRg=;
        b=4LU/6+iPBb1sfOB/W1DH+2waNDVmgc+3DIgIn8/e1VJ0vbU1Hz/sMetheBf0/wky4n
         3LyppPxsZiK2MSubVs6pete5Sp7r8EXTESzyOcE5upgEwFKodYdW06piqxOTwC5hRxp9
         UGa0vxOfvaij9hyXwuBzeWi/bKLDDCCmmZC66a8khTHJ4LJUvX/+/iIA6CHs7C75ERxc
         slKm1Y9RlxLDCLJl4OI8G0HLEspNlejW+pGL4S0Zz5uJhWTei+ZrnLZ1yOluGpkeTzJS
         cpOWp3h91JeA5SMkIwDGObFeygDMbEBWQYUjpJ0SFlaUxEeK8Z6k+LNQ52x3kw5U8QLB
         flRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746807013; x=1747411813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H2oav+qfacpS8QQCmqXiLrV/4p7+2M/TJ6/O5XYWWRg=;
        b=VgpDcuxsNhyprTiOmqB6aPQCRplP/uEZ/deZfuxSoDJWe7qHp64pUbF43/f0LfmpLm
         8G3E2Yy1lAQkXdQi9g6Ms8xGpIZSFTYzYaEuGPZhqUn2X4X8+i+Cda8XRXJ3IkZA3CBP
         UJBrXb1M3J0hhuQdI49rzH4tfYfvl/puYxmwIT9k2rHA9XDsGYn7yvvum8+S2ziBkATx
         Cr06IqsosAtgB2fFAo+OXpioIb4kyucqbNtU+N4OePrZIEYOLDy/7c4ot3EXlXM4zo9b
         gZdJEM6XD/x3Hhf2G1KLsT4OXsqnDwrCtUIH7mA3jEOFEVLasCHO0sMvM/+W0MhrP+p7
         I/gQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhbsnmrIT/HJLuGb+Ir/UI2Jvd+HWJ86cJ+y/Fqx5mqDITOfGa57I2xoYHyE8Z630JozlNlajYFq0iTMI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoJZg2x8IBvdYs2ftDmJqJyYBWMzTThSY+lI3nWSQY5TnQRCF6
	oRZ1xh7XeXQDEHrc1hbs2sH64w7sETVWEHHVGJf/ZullUgPwiG9y1nsmB10BgJBH6ja7ICdvbs6
	+IAzFp2Hj28HMDLzGLW35whCHVL00NPvqRx3W
X-Gm-Gg: ASbGnctcR0V4POjIQxsmae12JLlNnXUosSW8KdafgCgdh0bIM5LJeBnRxHqpH4BblvC
	d/DOvZfexDIf2ZnNLhoKWhi0JTIm6vDCEQozS0RhyDEdoULU+preBg1KlHyt9z1LrnyklOlNl93
	9E1+PyxUq3VeujZ7L2Y2o9j5qs15/uruQ=
X-Google-Smtp-Source: AGHT+IF8kvUu0MzFS0B+zGe6tSSbFanEw8RvuFK5mRodORG/rJW5v25+TMXJ16bIiJrBmdOJD7Hx9yk9hYk+cNNuF4M=
X-Received: by 2002:a05:622a:353:b0:477:9a4:d7ea with SMTP id
 d75a77b69052e-49453ca9a50mr3983951cf.13.1746807012477; Fri, 09 May 2025
 09:10:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507175500.204569-1-00107082@163.com> <20250509055151.922612-1-00107082@163.com>
In-Reply-To: <20250509055151.922612-1-00107082@163.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 9 May 2025 09:10:01 -0700
X-Gm-Features: AX0GCFtDnNSP2857-92GN4ciVgg5AMBl8rpJYg0o2yZeBcjMT_lG9rJw6s48zws
Message-ID: <CAJuCfpHRTGvctcEwXHd1bpfUiFa=A--zKmVBJggB5D9huPEdSA@mail.gmail.com>
Subject: Re: [PATCH 1/2] alloc_tag: add timestamp to codetag iterator
To: David Wang <00107082@163.com>
Cc: kent.overstreet@linux.dev, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 10:52=E2=80=AFPM David Wang <00107082@163.com> wrote=
:
>
> Codetag iterator use <id,address> pair to guarantee the
> validness. But both id and address can be reused, there is
> theoretical possibility when module inserted right after
> another module removed, kmalloc return an address kfree by
> previous module and IDR key reuse the key recently removed.
>
> Add timestamp to codetag_module and code_iterator, the
> timestamp is generated by a clock which is strickly
> incremented whenever a module is loaded. An iterator is
> valid if and only if its timestamp match codetag_module's.
>
> Signed-off-by: David Wang <00107082@163.com>
> ---
>  include/linux/codetag.h |  1 +
>  lib/codetag.c           | 12 ++++++++++--
>  2 files changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/codetag.h b/include/linux/codetag.h
> index d14dbd26b370..61d43c3fbd19 100644
> --- a/include/linux/codetag.h
> +++ b/include/linux/codetag.h
> @@ -54,6 +54,7 @@ struct codetag_iterator {
>         struct codetag_module *cmod;
>         unsigned long mod_id;
>         struct codetag *ct;
> +       unsigned long timestamp;

The way you implement this, it is not really a timestamp, more like a
unique id or sequence number. I would suggest calling it mod_seq or
something similar. Maybe: cttype->next_mod_seq, iter->mod_seq and
cmod->mod_seq.

>  };
>
>  #ifdef MODULE
> diff --git a/lib/codetag.c b/lib/codetag.c
> index 42aadd6c1454..973bfa5dd5db 100644
> --- a/lib/codetag.c
> +++ b/lib/codetag.c
> @@ -13,6 +13,8 @@ struct codetag_type {
>         struct idr mod_idr;
>         struct rw_semaphore mod_lock; /* protects mod_idr */

The comment above should be expanded to say that mod_lock also
protects accesses to cttype->clock, iter->timestamp and
cmod->timestamp.

>         struct codetag_type_desc desc;
> +       /* generates timestamp for module load */
> +       unsigned long clock;
>  };
>
>  struct codetag_range {
> @@ -23,6 +25,7 @@ struct codetag_range {
>  struct codetag_module {
>         struct module *mod;
>         struct codetag_range range;
> +       unsigned long timestamp;
>  };
>
>  static DEFINE_MUTEX(codetag_lock);
> @@ -48,6 +51,7 @@ struct codetag_iterator codetag_get_ct_iter(struct code=
tag_type *cttype)
>                 .cmod =3D NULL,
>                 .mod_id =3D 0,
>                 .ct =3D NULL,
> +               .timestamp =3D 0,
>         };
>
>         return iter;
> @@ -91,11 +95,13 @@ struct codetag *codetag_next_ct(struct codetag_iterat=
or *iter)
>                 if (!cmod)
>                         break;
>
> -               if (cmod !=3D iter->cmod) {
> +               if (!iter->cmod || iter->timestamp !=3D cmod->timestamp) =
{
>                         iter->cmod =3D cmod;
> +                       iter->timestamp =3D cmod->timestamp;
>                         ct =3D get_first_module_ct(cmod);
> -               } else
> +               } else {
>                         ct =3D get_next_module_ct(iter);
> +               }
>
>                 if (ct)
>                         break;
> @@ -190,6 +196,8 @@ static int codetag_module_init(struct codetag_type *c=
ttype, struct module *mod)
>         cmod->range =3D range;
>
>         down_write(&cttype->mod_lock);
> +       cttype->clock++;
> +       cmod->timestamp =3D cttype->clock;
>         err =3D idr_alloc(&cttype->mod_idr, cmod, 0, 0, GFP_KERNEL);
>         if (err >=3D 0) {
>                 cttype->count +=3D range_size(cttype, &range);
> --
> 2.39.2
>
