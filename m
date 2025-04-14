Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CF62628C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 07:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744617187; cv=none; b=CukULFT1g8NUZgEikOsq4OFBiAiu5dpk271SvCy+MFvJgU+PdyKl/KrkhYvhsiJ5C8IfaXaFFWd8yxmwLU+LzyEy2o8Ai112+MLIADfIIiyB3kiyDhZdsPPPhu48mP7o81ODsSecGh2QAWHX0bYtiis/rdLcXmt7BF+/UzPEW8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744617187; c=relaxed/simple;
	bh=3DbjrOZ3GgA1JbOIsk1z2k32sd9znGXc3GZZ549+9FM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lqt5uA0s5eZ5gAbItm5ZmhK2AB5xe22368hoOBwiN1NmJn8JruNfwOWvn1JYvEgD4j+uSDb9ymDxs0m0RadCBwxBhWTOhAVBjwsH9OpgRZTIxL3eVq81ncbOVw2LJIikAG+IrXRDfRSWNNcEkvz3jeazoPLfybAOQDyU+qzKCGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YClopSW2; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YClopSW2"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30effbfaf61so44319241fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 00:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744617183; x=1745221983; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+mGEmg0/F7XzkKMSGVWeK1CRSWc8K6jmw6reSH8Ppw=;
        b=YClopSW2VDfYCL9DRs+4Ct7WYBcK/He+9yOuoM4ww9oGpAt9NdNdF4vjw+PlHQpXE3
         yT1Ywh8PbUyrRfDBlbep1AFs2n0Qz+WD5Fm/6iuxNVEO4ArZrZ/qQrCI8aC0L2t8doFl
         FCKBO5iGlxHWnJagJCsN9YWIyCsEI2yKzspNPKhHfYudoYJh234f7Jly6OIg+xbFBVQC
         BbTHN7lOdxI8RqoxZepYltHU8EGz7guzcZgj4uj/pkQpdtWXbJozcuOWmS3wNyoVBaV0
         wCPAVZSqXkKc9dlgcHAobJxxfWo2V0BJzIXq9kM44SZhOSbpkEgD9dkfllszHG2OdmJA
         MSFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744617183; x=1745221983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f+mGEmg0/F7XzkKMSGVWeK1CRSWc8K6jmw6reSH8Ppw=;
        b=hoXwYKOUcySMQu96cgGw2Eu5LKxbUfstBfQnvqD1Dih30hhTC19wdo9tgktGRD2ZVv
         e59BvH/mSb41YXK9sEu9nibgPntWe/eoMtPMZRcOJpvLnbIuraXuh1ZM8rKsSU6b1z0O
         bo3UmBK1V7kAjSWzA6IeVY332/8FsIX/Ri+tmKoUMuzxom5u93z8vC2TC77HRVG9hE6W
         Re00veac4JuRubpPF8DbJ9su0i7j4+jYZwbJzQ8I4r7+K+tNmR9XtzKzOjRGF1rZTg6U
         yl7yjb1VbpdhHvMuKfzE21ZhLirMpVZFxETcIEyjaJCdZXhXQ419lwOsdrj1+1I8NS6H
         uOkQ==
X-Gm-Message-State: AOJu0YwZ0lZV/g9/tRwDp371AOqrDWs6/E4P8a5z0t7CK/TZl0UlnCbi
	wZmHu16DTK477tJHSFeebHktT2zzvknp9F41GtAj/q7ZjwjyGtGoNm8Bm+er6J/XKr+pJMbbIYr
	iSGeSHEdrgUPD3fzp8UmsYf/x0bU=
X-Gm-Gg: ASbGncvcxt37jaIAiWWvFE+EsOS1AZPP6bTzLJkjardkXF8qtwAv14P9ThPV/qFGfdl
	iwfYdnRBuUPYpLtzzzJsrVebSxjAYZQGh4GfOL5My0PtGlJeSI6fEGF/quskGs/qocE2Mx4EK3G
	ZKxYEEvNkoidYFCPKnBtejLA==
X-Google-Smtp-Source: AGHT+IGaW2Z7DWDGr2HFU5VHTQtysseeXN0uVaodvAvadagWNJBE8bDtwJxAMPH4brjIHMjzzJQ7m9S7HjK2/Olw8Pk=
X-Received: by 2002:a2e:9e4a:0:b0:30b:f0dd:9096 with SMTP id
 38308e7fff4ca-30fdf5219c3mr37012721fa.12.1744617183007; Mon, 14 Apr 2025
 00:53:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250413220749.270704-1-ubizjak@gmail.com> <Z_y3OIQECdVo6YJL@gmail.com>
In-Reply-To: <Z_y3OIQECdVo6YJL@gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Mon, 14 Apr 2025 09:52:51 +0200
X-Gm-Features: ATxdqUHY0NlQtviHKJXw8qjaGilUMnYZ23Oad2FM9WdTvQl_XeY7l2C-VLGjFk4
Message-ID: <CAFULd4Z=ErsRwzLvQ7yjqXG684UT5D07RoRqVPJhsEh4fxqqyQ@mail.gmail.com>
Subject: Re: [PATCH] genksyms: Handle typeof_unqual keyword and __seg_{fs,gs} qualifiers
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Paul Menzel <pmenzel@molgen.mpg.de>, 
	Masahiro Yamada <yamada.masahiro@socionext.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Borislav Petkov <bp@alien8.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 9:20=E2=80=AFAM Ingo Molnar <mingo@kernel.org> wrot=
e:
>
>
> * Uros Bizjak <ubizjak@gmail.com> wrote:
>
> > Handle typeof_unqual, __typeof_unqual and __typeof_unqual__ keywords
> > using TYPEOF_KEYW token in the same way as typeof keyword.
> >
> > Also ignore x86 __seg_fs and __seg_gs named address space qualifiers
> > using X86_SEG_KEYW token in the same way as const, volatile or
> > restrict qualifiers.
> >
> > Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> > Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
> > Closes: https://lore.kernel.org/lkml/81a25a60-de78-43fb-b56a-131151e1c0=
35@molgen.mpg.de/
> > Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: Ingo Molnar <mingo@kernel.org>
> > Cc: Borislav Petkov <bp@alien8.de>
> > ---
> >  scripts/genksyms/keywords.c | 7 +++++++
> >  scripts/genksyms/parse.y    | 5 ++++-
> >  2 files changed, 11 insertions(+), 1 deletion(-)
>
> Thanks, applied to tip:core/urgent.
>
> I've also added this tag for context:
>
>   Fixes: ac053946f5c4 ("compiler.h: introduce TYPEOF_UNQUAL() macro")

Heh, I intentionally removed it because the patch now fixes genksyms.

No big deal, though.

Thanks,
Uros.
