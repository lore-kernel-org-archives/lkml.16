Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9DE1F4717
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 16:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749487324; cv=none; b=HR6XjK6luaW3TMVJDIqdU7WLzKhtiS0dGUBMsGN0/rp3UHc5wSl6E5sP+AI7rI5YJaJjRiMeNXBrod4OdrQPfPrcaIcMkzzUrNz+RtkckEt5TOXta+fWaPJf3g1KqIy3i05H3376rM4TPKY9dz7EBajpz1FEDeCJYokqtqhEHsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749487324; c=relaxed/simple;
	bh=5dcMonmbViKn4VhjpmJvDB1jH3EBI+J6XOzMy63sEu0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uAGyP/tJghX0e5WlLdPsujLc4yKdz7IHvb079FXoaQ7XGC6FWAH3LZt+2Bnvv7psmA5z9uScUK3YO0VKTzQLEBZN9bDWBJX75VeAueZTvGZ7gz1gc74nQQAbbNcesEnSiBcHqmD+VYspeDJ1oSv9B+Wh6eJSb8wvDWEfFG55ugk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4ntsRanN; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4ntsRanN"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4a58ef58a38so3231cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 09:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749487322; x=1750092122; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l2bEgukdH9aiCzJThPP2Ro0SznLIJMxlFJH/lpGLEyg=;
        b=4ntsRanNvCVXWgPTHBYrrIi+2qm5ek/pHebJajZBbUFzcOt7Z82VhzGKlJ/vJXy1IF
         7NhilVCx7kSgsR/Cnk6gmI2xpuUOfIEhpzDBT9UjuXePMGOEZpJFLDlV+WNk+0adepVJ
         NTXIJmo+dj6JUQ/kI8bWSL7NdBHet7jwBqF1IzJwG4L0R6sY3VQDAgSHSFweOWC/wfOh
         lGsxcxS5mDzuxXNtdhh3gEzJC8eDdfrYoze2GlrD5c6dCNT2jKZHfLWFdnVO5KZrfM3a
         o1tuaPI6B2eavcQ8zUfYoIig0AG4Qo8xXey33ZogAzhqK7q7SXxJM8ebwNvwnuX5JqNs
         fs2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749487322; x=1750092122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l2bEgukdH9aiCzJThPP2Ro0SznLIJMxlFJH/lpGLEyg=;
        b=mcUMWHA8l++ohHKshyYCvI73nE5q6PnTCNNt7ptc8Sd1QKcoArfg/wphVbxSPfyIIt
         a9CXLMw8srJM14rSZhZxt1seuyegZRT1VLXZtT4gTnTP/7I8j9Rjsv2aXOKl0SC20QSG
         9riXJgYMBe/QBCUphxo40w71OEZgBAZpql7WcrHwV8oykLBuMP4x0Jv23Ek/f3M89tI7
         YZPW6CzNP1oA/Tce7woL5jkErw+V9XpLwE40MuR72UnBbMvVTxe71YDj4aNKB+stTu9k
         qgP5dWayDACfoTpDlxnurNc10gx7wFtCQuqWwtxNIhKp/yMrZVck9PK3rcLW1Vvc1kmO
         KDPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYS+Fs/DdhqiR7j7ylXw+u4xiZxOAOleAkjH1ZHjp+UZhDsW+be0t2+hABUPjM75ZMRBY24lXZduoT3tY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQPkotVPj8jEUQKs1sEr7Xvq7CAb8OqntNvIEqQ3MI3H0Nl9pV
	FFW88PFnclIpJpASqucB4nID1eFJdyS8ZivxbSmltj3W21rmuGxorNaHDJVk4LIQfc6pOY/7FP5
	k4HX5yNTMumjLjdC/Oy0/ayX5WMgC7Q7vxjBUv0eE
X-Gm-Gg: ASbGnctZLsPY+c4z20T5sliTM+9/rqtFrbiikqvxiehnhxeHorxbgrPB2z9YFChJcw3
	iNEFNzJMmIco5LGFJ0g82b5/YLbXJY8UoL25acvlkErdBwEEzkL9vF0NnnLCVnR+Ol2Q0Trc59q
	UdpVV9LN1fqAJWOwGV8zCNuXc58X2UP0UvJc+l8cXERd1EtI9H2cB5
X-Google-Smtp-Source: AGHT+IHmhxA108gtEOoOXG0qx9dWAER77RS0fyaMl5SPKAxVC9HhUtFsg6pK8xjxSMsLTNIYiS1NK6fNU+bYN+a3RUQ=
X-Received: by 2002:a05:622a:1811:b0:494:b641:4851 with SMTP id
 d75a77b69052e-4a6f072bd8fmr6891031cf.27.1749487321264; Mon, 09 Jun 2025
 09:42:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJuCfpGa2UxLY5Af_R6ZR4q57T0380bAWvwYWv2PzC=0sgCqKQ@mail.gmail.com>
 <20250609064200.112639-1-00107082@163.com>
In-Reply-To: <20250609064200.112639-1-00107082@163.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 9 Jun 2025 09:41:49 -0700
X-Gm-Features: AX0GCFuG9CNSfFi7NHP4pnT9H2IWxg8ZBh3ZOyd12yJV3BiVgyPIXL3nD4toA9c
Message-ID: <CAJuCfpGsb5MVc35Y21uG3r8c6+duOXzd_y2KyLOKYNddrKy3FA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] alloc_tag: add sequence number for module and iterator
To: David Wang <00107082@163.com>
Cc: kent.overstreet@linux.dev, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 8, 2025 at 11:42=E2=80=AFPM David Wang <00107082@163.com> wrote=
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
> ---
> Changes since v2:
> Rebase to 6.16-rc1

If all you did is rebase then please add my Acked-by. Thanks!

> ---
>  include/linux/codetag.h |  1 +
>  lib/codetag.c           | 17 ++++++++++++++---
>  2 files changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/include/linux/codetag.h b/include/linux/codetag.h
> index 5f2b9a1f722c..457ed8fd3214 100644
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
> index 650d54d7e14d..545911cebd25 100644
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
> @@ -191,6 +201,7 @@ static int codetag_module_init(struct codetag_type *c=
ttype, struct module *mod)
>         cmod->range =3D range;
>
>         down_write(&cttype->mod_lock);
> +       cmod->mod_seq =3D ++cttype->next_mod_seq;
>         mod_id =3D idr_alloc(&cttype->mod_idr, cmod, 0, 0, GFP_KERNEL);
>         if (mod_id >=3D 0) {
>                 if (cttype->desc.module_load) {
> --
> 2.39.2
>
