Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A861722F762
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 19:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746818762; cv=none; b=KCHGunfInaTDVFcciDYEkwCgqVgS66nwZGQHRSAoZX3D8Y35xMF4S04p2f0fdef5XLjGxzbt0HVmEabf8l9dmGDRG2k7mz8gwgYKOxHx75fDJYaranjjbn/Ryf5gNhINsxha1eGRpi7K23bJ+x52E/xrGjqjEejkJpd+Q/EIW9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746818762; c=relaxed/simple;
	bh=vJLK/+2zaVnYm2lG3pTBzuQQiwL6njhF9uUD+1Kx53Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q/Kl5721rxw6NMENGEh9yw/jUVsImFw6RP+zvaHwbWm16S1Wnt5MAT4f4fcjeLn6/MhldmeaKKDG3oot2n79vFSPd8WpDdk/9B36Zxuk17rdXOFE1T2Tl5cRsM1mA+Ek7GFNHgaA57J4xqBvOGOIeNpdcBmRh4yzIFEKhrb69SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0+jjJtIC; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0+jjJtIC"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-48b7747f881so54371cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 12:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746818759; x=1747423559; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRK58VoET9zvgDbCBhQHoSSCN1RJjcIrwRnLvq4Sf8k=;
        b=0+jjJtIC9bwtDkwi2LXINnr9HrThjyfjCMMRX8+cW5RLTNibLIGLTYaR0O0PVjjgUe
         WoenO4VyOahRQVhZ6JjRSOQMPh/5iCMqtxZyNutrzCNMVR3KR5yPVAUdQ0KKUvR2q7hB
         wm9YyffHtUDHrZWLlQAY4P+19kX14AbKdwmgrAZhGFKjZvpKmG9V/UdK9XqJWf2Jly+e
         7UREcAIJ8rhhNSwnnTvdPKysVxO69aer5vVtE6XHc0YvJgsnlgJZnjyMufyim218ajLI
         uUIV6MnrysgNxPZg1gNHtFIkMACzWY1R4g5MnggmFMW/fUiGgN2oCeB1Lh8p9CVal0Gb
         wxzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746818759; x=1747423559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MRK58VoET9zvgDbCBhQHoSSCN1RJjcIrwRnLvq4Sf8k=;
        b=xLu1JfKvHQDr+Vov7I+MtXOBLRkbKXbDWs7dPk74lGjLQeqKandNZZr8+E6M8DLs3Z
         KJsAcv0IAQyq1UFNjT+BdezF3xqPpFN20Pb9WUFxc4gTFqKdvNkgbVBGWlNdua6/yAIh
         o9uGQP5FzsaFBPZytwbutq60e06YqdSBl6LuTsrCk4A3ysJHv5bksIcSPbmXuc2DFYMK
         ZDv0BkKSBTP3CQvCWER7iVDfYYMVGOTXV3FcyHeF4/vqvFeUj8BCbilfirnm9K/lYTzq
         byxfn9P/SqtnVUKeprKycBHfM+E0pvfrqoyAK+E1jjK4Np3AHcETRWGPJdYXD8C+jjyI
         K8HQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkAN1LL7VVqyvQ3G6IGalJUtnCfKhkPNzT4cmZSsy5cPkGbM13jyrSkqcHBRXys5E9Eggb1Tl23Z996/4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdxUIkY+SQQpWe9uidNfJh1gmWrIWSz4RI6ehT6g0JFq2tu4fn
	BmV7shh3xPb/uAcuvv4zsVbjTguyfwiDVZkvt2c5pAAHHkGN/Z010f1indH1GkzHJqq4JzAXkRs
	a0h4A/0KwMVVqs5ml/LXLYVnTYO/Fymo/6SmoAcBR6JxCofVZXr6D
X-Gm-Gg: ASbGncsI9SQLTj9ZmH4YY4JL//DxGKwUT/oDP/N2WMT8Yt/pLLIDAi13MOSDgWQr0ZO
	OKe7is7y21i369xTwuz8kHFOG6nQLeHb+yMBr5LL/QOKIxwye0WCKnPTOUGAmbPAFdFqYCh+8nn
	DU7TRp0avpv50uaIqerVLgCF2A6+rvJj5cC5kHk5LCZQ==
X-Google-Smtp-Source: AGHT+IFAHmUD6k9Kc4byGLMuYpc5VWZ1EWrUpWRhN9toDoFBSnJdMJ1BHaLGHq0RChCml0Y4GSPMhFm5cLpvWU84BV0=
X-Received: by 2002:ac8:5d91:0:b0:480:1561:837f with SMTP id
 d75a77b69052e-494610f14a2mr792601cf.8.1746818759104; Fri, 09 May 2025
 12:25:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507175500.204569-1-00107082@163.com> <20250509173836.42473-1-00107082@163.com>
In-Reply-To: <20250509173836.42473-1-00107082@163.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 9 May 2025 12:25:47 -0700
X-Gm-Features: AX0GCFsf_Wh7hSaSJkTKUXg6Nisb5y70xYck-HJ6zL4RHZUUCf6DhaOZoQ4ggtk
Message-ID: <CAJuCfpGa2UxLY5Af_R6ZR4q57T0380bAWvwYWv2PzC=0sgCqKQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] alloc_tag: add sequence number for module and iterator
To: David Wang <00107082@163.com>
Cc: kent.overstreet@linux.dev, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 10:39=E2=80=AFAM David Wang <00107082@163.com> wrote=
:
>
> Codetag iterator use <id,address> pair to guarantee the
> validness. But both id and address can be reused, there is
> theoretical possibility when module inserted right after
> another module removed, kmalloc returns an address same as
> the address kfree by previous module and IDR key reuses
> the key recently removed.
>
> Add a sequence number to codetag_module and code_iterator,
> the sequence number is strickly incremented whenever a module
> is loaded. An iterator is valid if and only if its sequence
> number match codetag_module's.
>
> Signed-off-by: David Wang <00107082@163.com>

Acked-by: Suren Baghdasaryan <surenb@google.com>

> ---
>  include/linux/codetag.h |  1 +
>  lib/codetag.c           | 17 ++++++++++++++---
>  2 files changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/include/linux/codetag.h b/include/linux/codetag.h
> index d14dbd26b370..90f707c3821f 100644
> --- a/include/linux/codetag.h
> +++ b/include/linux/codetag.h
> @@ -54,6 +54,7 @@ struct codetag_iterator {
>         struct codetag_module *cmod;
>         unsigned long mod_id;
>         struct codetag *ct;
> +       unsigned long mod_seq;
>  };
>
>  #ifdef MODULE
> diff --git a/lib/codetag.c b/lib/codetag.c
> index 42aadd6c1454..496cef7cdad3 100644
> --- a/lib/codetag.c
> +++ b/lib/codetag.c
> @@ -11,8 +11,14 @@ struct codetag_type {
>         struct list_head link;
>         unsigned int count;
>         struct idr mod_idr;
> -       struct rw_semaphore mod_lock; /* protects mod_idr */
> +       /*
> +        * protects mod_idr, next_mod_seq,
> +        * iter->mod_seq and cmod->mod_seq
> +        */
> +       struct rw_semaphore mod_lock;
>         struct codetag_type_desc desc;
> +       /* generates unique sequence number for module load */
> +       unsigned long next_mod_seq;
>  };
>
>  struct codetag_range {
> @@ -23,6 +29,7 @@ struct codetag_range {
>  struct codetag_module {
>         struct module *mod;
>         struct codetag_range range;
> +       unsigned long mod_seq;
>  };
>
>  static DEFINE_MUTEX(codetag_lock);
> @@ -48,6 +55,7 @@ struct codetag_iterator codetag_get_ct_iter(struct code=
tag_type *cttype)
>                 .cmod =3D NULL,
>                 .mod_id =3D 0,
>                 .ct =3D NULL,
> +               .mod_seq =3D 0,
>         };
>
>         return iter;
> @@ -91,11 +99,13 @@ struct codetag *codetag_next_ct(struct codetag_iterat=
or *iter)
>                 if (!cmod)
>                         break;
>
> -               if (cmod !=3D iter->cmod) {
> +               if (!iter->cmod || iter->mod_seq !=3D cmod->mod_seq) {
>                         iter->cmod =3D cmod;
> +                       iter->mod_seq =3D cmod->mod_seq;
>                         ct =3D get_first_module_ct(cmod);
> -               } else
> +               } else {
>                         ct =3D get_next_module_ct(iter);
> +               }
>
>                 if (ct)
>                         break;
> @@ -190,6 +200,7 @@ static int codetag_module_init(struct codetag_type *c=
ttype, struct module *mod)
>         cmod->range =3D range;
>
>         down_write(&cttype->mod_lock);
> +       cmod->mod_seq =3D ++cttype->next_mod_seq;
>         err =3D idr_alloc(&cttype->mod_idr, cmod, 0, 0, GFP_KERNEL);
>         if (err >=3D 0) {
>                 cttype->count +=3D range_size(cttype, &range);
> --
> 2.39.2
>
