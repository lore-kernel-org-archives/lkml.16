Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A59218821
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 11:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744976445; cv=none; b=RNpYhooNnUu6Ngt4uN/5a0vkY4WdNw754JnykjWMpzos3eHTK5Gl2ge8dbMDxg51AZw3GFrIkGFv20IrD/anFbeB1D9DKj8cZCRpIU2JHTCo/H+tznLxHYWHb0diFspLg4WtnwyCrCNSALKy5Wy9iDUMQ43VHvUcsZ4VapcfOBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744976445; c=relaxed/simple;
	bh=RDOxvXWOIOMrMMQccTTYmfg+gZYjfAFf54l6G++Kqg4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KrigsJcj9FZmdXiF3S/CoJx5JPN4fD82qP1KCxy8zc1novQh4PCWj4mxxuIzWFH8QqOwXrjYHnkwIOF9XzHxpALzqwXmorKejEOyvVCyApstbSVkT+/aqix2BOxhgU+dYWmGaYZeCejB2NEsWX0tu0NwgkJMN7I3VAFoFJ+54ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EtOM8Nb9; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EtOM8Nb9"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac2c663a3daso327725566b.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 04:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744976442; x=1745581242; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vkRjZE5uaIJfPFmn5rKYrxKOhaaT1kGuIn7UK1e/USo=;
        b=EtOM8Nb9TfalqmmNB88dsxKSLJEYeYVXkwK1JI+Sio5SsyUnKTKPH9Ykwo7ZiKs7UW
         WTcy739Oh+E4jn742RzfhifGdql11VoGK40W2YDrkIYvI4D3++527/8o+zr4Sx7FCERB
         hIhs9r4AzxqO+nEdx5UtkN7eqORhgCQmGz6UcRjToUOCfzPeM3b062DSDJMS4kGdkA5/
         IYArZygujey3boYNF21/hlhXqoFLTcMX1rSmYTUINXVdphhdGSkBwTtKm24CSnM7NOKf
         IifRslxKAZwzp5vtSiqI7h1rzgws6803JQFRtU3hl2+eunydhSJfK6DJVZRgN3qsAsSn
         tkyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744976442; x=1745581242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vkRjZE5uaIJfPFmn5rKYrxKOhaaT1kGuIn7UK1e/USo=;
        b=NLpSIelrwyOXOjk6g7nzhuZhrYzC3PvFqPTozNcOdH0Lw46OOeZWIeHxKQmDl4y+tc
         xhUmJg2swxju0wodlKymj8THEfNhDf7g+avC1jpZnQ1eYwbii2+iBq7IDFSX+McgBlBS
         xe/z2ZU6HXDO6qAVClfLVrFTKDey0vMMeT0Vu4rDe3nEUTcWbVd+OthyTO3BgsySXA2z
         Qf+FbjOhqH1cPrjzaZG4/lAsSD/0F5z19RBwqG4uQEK1xtxdslG/0NVyeQhSUiFffCzz
         bAu7hR6GZquelRpMftCrpdOQ0HKMhfRPRI3jZ/wRbCJAyr+Bxlqn5bslRDZIrE4msOML
         /VYg==
X-Forwarded-Encrypted: i=1; AJvYcCXjmf0G8m0D7MWb+VOVfW7uo2r8T24dBeFxE34d8kIYNq2DyL5bbZPeCH1ii55MEXih2kTbi+jos3XzvEI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpH1UWVjOjhD42tQ/4v6dFYxNUnAKAsmBomygtZjPKcbDSB2Se
	Wd5SCNJmkMKHYJhoqzlvjQ9Ugjt6SA4uMyJSIcCsrrOlf1bxfdRayfx19VaLphH+qVkD0nudyWK
	HkndE69Zy9CzNT67AzuX+SK0guOY5kgG5mGPupw==
X-Gm-Gg: ASbGncvFOqKye8eW9oJESDDe/m/uZOJCnSYu+rK+hXCP5p9EyB4d8nFGgN25mSqmtcx
	PDycIrnacb0V8KU6TOXUKmDL5vFr4Z23IU9Xf5ZkWqoXfaTGOCsFbSvaT+IzPH3Uob66rn93Fx2
	kHJzCQPpy9Vr9vperEkLggoTX4PWnNjZBZ
X-Google-Smtp-Source: AGHT+IF+QKKkOc6nEoaAOnVO7evTJZw2eZgtbS2yCrRNa1lPqT61GmJ+upDhqIbpwgEmMNJBuyIKgJXC+P6xJHhCw78=
X-Received: by 2002:a17:906:c154:b0:aca:a162:8707 with SMTP id
 a640c23a62f3a-acb74ad9629mr203403666b.7.1744976441838; Fri, 18 Apr 2025
 04:40:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417124908.58543-1-ioworker0@gmail.com> <20250417150237.ba3bbb3f55f992c692932841@linux-foundation.org>
 <CAK1f24nCWXgOonOpiJ0mEk+-rvGt4WN20yri+wi6-eMf3rf=4w@mail.gmail.com> <413657ae-8271-4a5a-9507-e9161d1f08c2@redhat.com>
In-Reply-To: <413657ae-8271-4a5a-9507-e9161d1f08c2@redhat.com>
From: Lance Yang <ioworker0@gmail.com>
Date: Fri, 18 Apr 2025 19:40:05 +0800
X-Gm-Features: ATxdqUEKPGWluWfGztcJ-llCSTg63sxpZ8Hw9sQZZhSMXFi2W3YycPKsD6a7JIw
Message-ID: <CAK1f24kchcoN4ToW5aPbSA7KDB6ZPtQin2s6wOPQZLTkNzjNow@mail.gmail.com>
Subject: Re: [PATCH 1/1] mm/rmap: add CONFIG_MM_ID guard for folio_test_large_maybe_mapped_shared()
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Mingzhe Yang <mingzhe.yang@ly.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 18, 2025 at 6:38=E2=80=AFPM David Hildenbrand <david@redhat.com=
> wrote:
>
> On 18.04.25 09:26, Lance Yang wrote:
> > Hi Andrew,
> >
> > Thanks for taking the time to review!
> >
> > On Fri, Apr 18, 2025 at 6:02=E2=80=AFAM Andrew Morton <akpm@linux-found=
ation.org> wrote:
> >>
> >> On Thu, 17 Apr 2025 20:49:08 +0800 Lance Yang <ioworker0@gmail.com> wr=
ote:
> >>
> >>> Add a compile-time check to make sure folio_test_large_maybe_mapped_s=
hared()
> >>> is only used with CONFIG_MM_ID enabled, as it directly accesses the _=
mm_ids
> >>> field that only works under CONFIG_MM_ID.
> >>>
> >>> ...
> >>>
> >>> --- a/include/linux/page-flags.h
> >>> +++ b/include/linux/page-flags.h
> >>> @@ -1232,6 +1232,8 @@ static inline int folio_has_private(const struc=
t folio *folio)
> >>>
> >>>   static inline bool folio_test_large_maybe_mapped_shared(const struc=
t folio *folio)
> >>>   {
> >>> +     /* This function should never be called without CONFIG_MM_ID en=
abled. */
> >>> +     BUILD_BUG_ON(!IS_ENABLED(CONFIG_MM_ID));
> >>>        return test_bit(FOLIO_MM_IDS_SHARED_BITNUM, &folio->_mm_ids);
> >>>   }
> >>>   #undef PF_ANY
> >>
> >> I don't get it.  Sounds like we're adding a compile-time check to chec=
k
> >> for a compilation error which would have happened anyway.
> >>
> >> If folio_test_large_maybe_mapped_shared() is only used with
> >> CONFIG_MM_ID enabled, then do
> >>
> >> #ifdef CONFIG_MM_ID
> >> static inline bool folio_test_large_maybe_mapped_shared(...)
> >> {
> >> }
> >> #endif
> >>
> >> ?
> >
> > Hmm... we considered using '#ifdef CONFIG_MM_ID' for
> > folio_test_large_maybe_mapped_shared(),
> > but since this function should never be called without CONFIG_MM_ID
> > enabled, compile-time errors might be the way to go -- and a compile-ti=
me
> > check here does the trick ;)
>
> Yeah, I deliberately used plenty of IS_ENABLED to avoid a #ifdef mess
> all over the place.
>
> Maybe clarify in the patch description that we want to prevent the
> function from getting used without CONFIG_MM_ID, and we don't want to
> use #ifdef because then we'd have to add even more #ifdef in callers
> that use IS_ENABLED(CONFIG_MM_ID).

Agreed, the patch description could be clearer. I'll update it to better
explain what it does and why we are avoiding #ifdef ;)

Thanks for your suggestion,
Lance

>
> --
> Cheers,
>
> David / dhildenb
>
