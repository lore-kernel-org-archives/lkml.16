Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB6917E00E
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 16:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744130487; cv=none; b=C+l1HCYpxq45noPEqXuLCX45da9zHnh8z4XrWD/nYieAB+xP1K65CWRj3xe960Q4ODVcMeJev6JiSS9ZP8rApWFqyzUwUZMnphooWhtHgff+xNvoPZL0TVFPlWAXhPG4Uj1/0UTxFD8cyZL4CD2Qyttlx47ebHYK/2L6mVs8yqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744130487; c=relaxed/simple;
	bh=t6w2Cb9KJ+KmGc5phWFTtlLm/KRYuZJz6zI4NrKhCuI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G5bXSvcD1lL9D1nJRnCYg6V1oEWtziZrDCetVEKmhzI2cK2thlJdVHsTvEyRZu7+ZYL/UFl6oJct74RNCs5EB3npbnLyyNal4CfuD+IzUjPDnNv4ZrgJDc8jw6gRdeu/sDBYUyUSj3ou9ZHbtjZoPQEs7XmnXIhEG+/3wwyghzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BpR0TUYG; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BpR0TUYG"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4774611d40bso339591cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 09:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744130484; x=1744735284; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iYRcH3lLl5pRDZXnglwcCxaB3s5dgtk0PEdOP904X1c=;
        b=BpR0TUYGYEYhYO6EvPtpzrgTqye67i5Q8gpZ2VNXBwcRKVzJgYwRsfj+DQhvESFnf2
         tgZSkcH4hHWMloLFiHs8ASUoJeuj7/ldQ36XwKaZS/QnR7Plf6VQmvpnynI5zYngSPHT
         xxu6ScRbatbBZlugZs5lN1+kECJuk+/L5d4T7rG4hJGL5C0mhrT0eXNzbTZxOtswUw4p
         CWezP2wAW5KXsENDBBltpPWOqGqn8SraqOvQ3xW4ocHlBwBMJLl9Texw3WGQBNUnrViO
         nbxboRT0Ps0yLw7RL2VNgayz0L8cK2tHcZ+qBP+vVK2mRpgBnqMXY3RzTYjLKRy+ON+P
         dq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744130484; x=1744735284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iYRcH3lLl5pRDZXnglwcCxaB3s5dgtk0PEdOP904X1c=;
        b=iCPWlNyqZi1oFR9K/17xtKAL+/2V6zFVMBCrAyle4T3sNYpjUMH88Ch5w23enBJxMi
         kbHjP8aA9MGh/BCfcZ77pFGOcxY/UxLe6LYA5/5Ar+f700d89CtphZt1smaHs2bS39C9
         mJk5WtxDJjdGcNRe/AB6vMEvtxxsnXkBQqkvnMh/G1F2wu7XEQ/NjFGzz9C+VeR8KdPH
         uBpUUucJG/vyhWnMKk8BA0E6AlkZCOZVDvZ9aAPb/+KE4O/I2hlXPoQXrJLQd0TMtdli
         b1SBU6oBGbdfzELFmR/cXrYSTo2vrCoGeCntvIdxx0oGm5qmu5039aWJBEzcF495e6if
         2aAg==
X-Forwarded-Encrypted: i=1; AJvYcCUoeFWs+HLcVQHxA69130KWK+AKNMQWfn/Cvr00LhaqKD4r8qx0/7mAcx79BZhmfazwr/p6onbmEJ9vW/g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqN6CQss6HErVkeN/fKLKDwynTWG0KZ0sGsr/PapBF1pf2QlQN
	tqoMexMfmLxPJtBM0q8BINoaUF5K0s5nlSR/3qhHjclPSPoI4uJgbqzheplf3GUnbGC2yR+/FGA
	FI8Vwu3Cnw5rQM1nbEU8HDlJC0uMMXMJ5ATUmVZepM9AZpv0HHg==
X-Gm-Gg: ASbGnctaRQtfr58cxkt5smaSn1DWCuAJN4USBfRzq8LGDooMCE8eGYpqVX/1en+ESi7
	rsZJFU19EBWblZxzriS5t4MSCVRf6IArSjExFQv4bRvQNkSKfVo9dHGo8KxKMvblRxUvVZVyB9H
	hqJKwOskEktDTUqjAw6/lGozs=
X-Google-Smtp-Source: AGHT+IG699SWsw9sjYrwWeM4sOVRWMvlyHpBHJHj5auiQO03bS+mgysoep4meUMKmncXBX4E76zuRYFM0QuRNyPMlzE=
X-Received: by 2002:a05:622a:1103:b0:477:9a4:d7ea with SMTP id
 d75a77b69052e-47956264737mr4192611cf.13.1744130484148; Tue, 08 Apr 2025
 09:41:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407165435.2567898-1-fvdl@google.com> <CAMuHMdUeGjbOx-aJTvwOVBWdUFmY7wU-p3mKaCbEzQ4PbJDqNg@mail.gmail.com>
In-Reply-To: <CAMuHMdUeGjbOx-aJTvwOVBWdUFmY7wU-p3mKaCbEzQ4PbJDqNg@mail.gmail.com>
From: Frank van der Linden <fvdl@google.com>
Date: Tue, 8 Apr 2025 09:41:11 -0700
X-Gm-Features: ATxdqUE799IJwNgPzTNGIuwf5_KGnKhCOK8_htZEHLvF_Tsz71NvBnrUJBVGzFM
Message-ID: <CAPTztWbR1FYO21j_sGT8mMyjJ8UP0EaH1=TvJ9wqxf2cu8Zcgg@mail.gmail.com>
Subject: Re: [PATCH] mm/cma: report base address of single range correctly
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, gushchin@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 1:06=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> On Mon, 7 Apr 2025 at 18:54, Frank van der Linden <fvdl@google.com> wrote=
:
> > The cma_declare_contiguous_nid code was refactored by
> > commit c009da4258f9 ("mm, cma: support multiple contiguous
> > ranges, if requested"), so that it could use an internal
> > function to attempt a single range area first, and then
> > try a multi-range one.
> >
> > However, that meant that the actual base address used for
> > the !fixed case (base =3D=3D 0) wasn't available one level up
> > to be printed in the informational message, and it would
> > always end up printing a base address of 0 in the boot
> > message.
> >
> > Make the internal function take a phys_addr_t pointer to
> > the base address, so that the value is available to the
> > caller.
> >
> > Fixes: c009da4258f9 ("mm, cma: support multiple contiguous ranges, if r=
equested")
> > Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Closes: https://lore.kernel.org/linux-mm/CAMuHMdVWviQ7O9yBFE3f=3Dev0eVb=
1CnsQvR6SKtEROBbM6z7g3w@mail.gmail.com/
> > Signed-off-by: Frank van der Linden <fvdl@google.com>
>
> Thanks, this fixes the issue!
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> > --- a/mm/cma.c
> > +++ b/mm/cma.c
> > @@ -724,8 +724,10 @@ static int __init __cma_declare_contiguous_nid(phy=
s_addr_t base,
> >         ret =3D cma_init_reserved_mem(base, size, order_per_bit, name, =
res_cma);
> >         if (ret)
> >                 memblock_phys_free(base, size);
> > -
> > -       (*res_cma)->nid =3D nid;
> > +       else {
> > +               (*res_cma)->nid =3D nid;
> > +               *basep =3D base;
> > +       }
>
> Please add curly braces to the other branch, too.
>
> Or perhaps restructure as:
>
>     if (ret) {
>             memblock_phys_free(base, size);
>             return ret;
>     }
>
>     (*res_cma)->nid =3D nid;
>     *basep =3D base;
>
>     return 0;
>
> >
> >         return ret;
> >  }
>
> Gr{oetje,eeting}s,
>
>                         Geert
>

Thanks for testing - I sent a v2 with the style nit fixed.

Thanks again,

- Frank
