Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2669288539
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750692211; cv=none; b=ja581wW3i2OvXlK4wkaaSk3gnmmOaULidJIrM/QrVFbBlXUx8d5nsvicNAnCRkoNCbyeqhrwo78GeAA6xcUP4exf9czJyzQ+6cSYAhIfcKxtB5NFFHCh0syI6B7aRKFwXxzO41aONrsToFc7iJx+xS0Hy7Z5V1h/woNmU58swAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750692211; c=relaxed/simple;
	bh=SVVhYZvptRHvWy6ECNSSMwCz2nb8b9mlJe/B4F5PLGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JClCziweZbJnWLUibjGlWAoH2QAyUPwNgu3QVLd6BIiDHNkqHftlp/SQJjQ2XDbRzoLwSM1Isp4k0aZOUNPppd8xILwAYJpt1fUPpxs7CaQw83ERdD3m/4zD1gRwe+tfSx0f+bdEl/w0ZhFB0WpTcWfLnH+xJw/mEMayTPo+fn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M2fAiRSo; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M2fAiRSo"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-235e389599fso347485ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750692208; x=1751297008; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xKVYEt/1XAG/rDm3Qsq30ciDg7bGFCanzViwOcaGes=;
        b=M2fAiRSoRH/yEdLHXPLjY01Lk434/zOqJuhTtvLt/PGncXuYdFn0pnNo5R5p8pa51K
         dG/o7RKcjFrPYeLEWOeWiU3vRY3Qjhnz8YTOv89PeS4c6CW5VgelMUbaE0y6tAtBqK+7
         dMFk9raViN9EBYvKHeAv+GMEBaaynaeTnLaaD24lSJ/kqmsxu+J/eN3kRAUm0T9Ql4b0
         LOYM2wK0xF8Wfdsumxuj9ALp6UX+9kFxvagvawHuGOsGGAhLdmCDvVvjYmQTbCFljVNM
         prM6N4aWWOR+7OteVl26UjBjUjyqerKXt9kinX4mkTWZ4vwiUOLKCXMS6icTgzU+0Wpf
         BriQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750692208; x=1751297008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+xKVYEt/1XAG/rDm3Qsq30ciDg7bGFCanzViwOcaGes=;
        b=Jx1bRYpX8PYGquhtG5aCGkEZmGhaHS5Uu9JtIDfBPid6yUZZYY+vMxkl8mujjCFN5u
         0Cu+O2X5YRhYKcdI37jHb2tu2P/3YI+/r1Og4Pq4Y5GUg9XzFqrss/6KW1WS5G0jnIJx
         F2eM/Je3UCuraNf0e7P+3ewMyEhBksk4v6VeySBnfglvb8quz/MNqp8jOMupGPU3sUrl
         vOaNhuYS6BHnwIakm/xnL5NiAZ7D74rkWccHSwg5rbSVHVMs77XtEBGWZhD0pwhrU1tc
         P921gwk7uEi+9kT4pVWRXj9bfVw9ZWUekH4fRQth6/+LGttyo8H9Kju6eWKhgo7nuaen
         44tw==
X-Forwarded-Encrypted: i=1; AJvYcCXYPAZAAi0X+2Kbf1IC5Xzzh9IUOOZod5qmAOkD6hlu2VHKliO9gUrRK+rNIxYvkJaCaKhtzob496LsFXw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwntETS7mTdtsRwwEUHNy/nviCECqgKOF5Rp1QQrZpwvE8DVCnb
	siqaMj7K5TDmVD6eyx+fC46pX0aMkFHWZJJKTGgJ0DmUu5knth3y3r+0DVRH75ZNXftBBt6MxML
	g8SAJaHm8UxNKK9NRnYEjHzrs8f/kkfl44b98SBSC
X-Gm-Gg: ASbGncux0QA245aXstyLwizE+vxAqnum0bj79SdAyfHp+jHsuWzp14Hp4muJgJunyQw
	6algP1Mf/babDfBvucL7fRV2cqFFsnJOhV0xal5FyxbLALgynnZmWSRJiKjoQalVO+TzMoPRLMX
	r/pWiI/wd9QiD/DZu0rsIbjKjXhqlZV4utR0Mo3yaGx521dabtunw=
X-Google-Smtp-Source: AGHT+IGKDqfw73zBONPMhWTBZq5sn8fIPJr6XNb97m1huHThSghMFLDPcjpDBONMI3PYmS2dmvUHHdzvcgJaT8blGQg=
X-Received: by 2002:a17:902:ecd2:b0:235:e1e4:efc4 with SMTP id
 d9443c01a7336-237e47a607dmr4681835ad.14.1750692207615; Mon, 23 Jun 2025
 08:23:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623092350.3261118-2-gprocida@google.com>
In-Reply-To: <20250623092350.3261118-2-gprocida@google.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 23 Jun 2025 08:22:50 -0700
X-Gm-Features: AX0GCFsxTT0ix79BDZcTXttlcbRoLHw5kXN43iSZKxn3LLTNwWtw8gubZbmerQY
Message-ID: <CABCJKucSF7O8m6-QM4-J7-qTNTvFFax3=_v_kFy_3qRZZ6ym_Q@mail.gmail.com>
Subject: Re: [PATCH] gendwarfksyms: make -T symtypes output be in name order
To: Giuliano Procida <gprocida@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Giuliano,

On Mon, Jun 23, 2025 at 2:26=E2=80=AFAM Giuliano Procida <gprocida@google.c=
om> wrote:
>
> When writing symtypes information, we iterate through the entire hash
> table containing type expansions. The key order varies unpredictably
> as new entries are added, making it harder to compare symtypes between
> builds.
>
> Resolve this by sorting the type expansions by name before output.
>
> Signed-off-by: Giuliano Procida <gprocida@google.com>
> ---
>  scripts/gendwarfksyms/types.c | 29 ++++++++++++++++++++++++++---
>  1 file changed, 26 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/gendwarfksyms/types.c b/scripts/gendwarfksyms/types.=
c
> index 7bd459ea6c59..51c1471e8684 100644
> --- a/scripts/gendwarfksyms/types.c
> +++ b/scripts/gendwarfksyms/types.c
> @@ -6,6 +6,8 @@
>  #define _GNU_SOURCE
>  #include <inttypes.h>
>  #include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
>  #include <zlib.h>
>
>  #include "gendwarfksyms.h"
> @@ -179,20 +181,41 @@ static int type_map_get(const char *name, struct ty=
pe_expansion **res)
>         return -1;
>  }
>
> +static int cmp_expansion_name(const void *p1, const void *p2)
> +{
> +       struct type_expansion *const *e1 =3D p1;
> +       struct type_expansion *const *e2 =3D p2;
> +
> +       return strcmp((*e1)->name, (*e2)->name);
> +}
> +
>  static void type_map_write(FILE *file)
>  {
>         struct type_expansion *e;
>         struct hlist_node *tmp;
> +       struct type_expansion **es;
> +       size_t count =3D 0;
> +       size_t i =3D 0;
>
>         if (!file)
>                 return;
>
> -       hash_for_each_safe(type_map, e, tmp, hash) {
> -               checkp(fputs(e->name, file));
> +       hash_for_each_safe(type_map, e, tmp, hash)
> +               ++count;
> +       es =3D xmalloc(count * sizeof(struct type_expansion *));
> +       hash_for_each_safe(type_map, e, tmp, hash)
> +               es[i++] =3D e;
> +
> +       qsort(es, count, sizeof(struct type_expansion *), cmp_expansion_n=
ame);
> +
> +       for (i =3D 0; i < count; ++i) {
> +               checkp(fputs(es[i]->name, file));
>                 checkp(fputs(" ", file));
> -               type_list_write(&e->expanded, file);
> +               type_list_write(&es[i]->expanded, file);
>                 checkp(fputs("\n", file));
>         }
> +
> +       free(es);

Looks like a nice improvement. Thanks for the patch!

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
