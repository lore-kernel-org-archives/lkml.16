Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEF32459D3
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 13:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744896313; cv=none; b=O3/bqfLcB0YCHMkQZOrXd0+wRH/kNM1QEOU33F9yr413SZvcSy6cy3QP6MCY3uTKvM9i+UUknZTcuB9MqLblKrN8ViGNgDku5IU4odHdlU0AMO/Dkqvgz5r9OiRSI/713qkyUfRxATC6kl4CkuTxWpHPftGg//yic/nYizOjQWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744896313; c=relaxed/simple;
	bh=uPx/gCmeGJxZJPFsRmqNBUDw0IV9MPk4j42a+Nwd25A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VGrxAXCYHI9YKLC/CVyPuGH7nDwEuFyUfIFZYiJGkjIinUwmkr5BQnrn5Eo4VQDPO6or0k1rmUXJFXdY9jioiKpcxlwQbNpjcBV9Oea2gT4oAmYAWV6g1jLzlNre2LkLbKhiF+/JcWwZA8BsnyiNUs3a/994YBjEtZ227xll1uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fDTJcQ0q; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fDTJcQ0q"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e614da8615so1638725a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 06:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744896310; x=1745501110; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kpNf6w6GnEUetZaJA+rqBWn6AFuG6sqOCwucLcmthoc=;
        b=fDTJcQ0qtdG7fsKjGgQfcDJha/U8r1uT6mJ+uA7i656kepTDNJQ/Hey0k6HlTlwn0c
         Npih6h4nYAzRPLj6tMzetqPlGecJcPHJQ1d6ZNuC8N3oRd5NjRJaBexoOEuBV3PTaXEz
         mHqD6yku7yrQv5NE1jlDy2UjAAIVbW1zB4z5EC3ztI0u0x5Ky7hoXsecLTD/W/l4EJfZ
         +mAqUFlpcnb+xkK64WEJ2xbUNl/WV1bspmvRy9M16UTR72NHDn0DYdoIv1JoxNmlNv3p
         ZG3pMZx+FcauXLUmauPBp86SRcY461+5SRUERZa+mUpmzcl2/lBV97etK/gZDd+vK+Iw
         X6cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744896310; x=1745501110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kpNf6w6GnEUetZaJA+rqBWn6AFuG6sqOCwucLcmthoc=;
        b=PHFxoAINxs7eiF0FiFKFynLF873XKJE90LwqcH13yqUefesU8TXmulGOLu9GvWTD1U
         bHuVlK3MRMxyHth58FpQuP2e6bnm3i42VYhps3uotQFXL6R1rxHJosjx4LAfa9j9ntSI
         jzD7xmDdBGO2O24o9eK83xAVxFNGfYAU6RDaQC9Pq85BR1AXe8SATQ1mY+cdpcULHhUZ
         uO/jOxTId62MhV9ZNZdoedHedTGJeeSFhIcP0IwFi2BGgeQP6C99tcvYkBrbedwUPYci
         2u8BkoQTuu059DWsqvm1Kj2+rx25yiMvfIpLOleEtj+errrjHOfxlusMQFB0pSHwqcMB
         z40Q==
X-Forwarded-Encrypted: i=1; AJvYcCUkS9Pz/TAW9HkpjWN/pdhTgIzWiQ4LkyRw3YiIdTeOUaeGbU8fUqAG7wxoSZPgZx00m1EovrV5nDGMowo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2uPHWL1IbiWfzBeRfbhjaQAjVnakaAVAQg+QavdVuR59pHWon
	QHvSJu0SIcvoPkcqZ6pkTL1Qn31toUYPy5f8tewbkHHCEU3CIn2nSe6EQyIFUScbf1/eRGmtX4A
	um33fNThabf836C72Lq3WDdw67RQ=
X-Gm-Gg: ASbGncvr9rbWZtCNiHQ1JFf77fismhpY+THyj+bjtGyvaxnzovrZheUJgsgwskuC+fD
	/ykjx7fyYnPD/zDv1EVju3dqZrKxG81iQIOlSlXnGqH3pCpaRfMCfgSGYmRC7M9oP9FsDdxQoM8
	nRNVBkyzK7V1fRc7BYSWi1fQ==
X-Google-Smtp-Source: AGHT+IE4wbCf7TezOopemIV0fOYus0Gx4w/ZoyD0bBV1TFMSzOb8alw5GhhnENcFKPzNOqWxc/bAQglhq8CL9qZtIs4=
X-Received: by 2002:a05:6402:520f:b0:5e0:752a:1c7c with SMTP id
 4fb4d7f45d1cf-5f4d1377d11mr2619228a12.1.1744896310073; Thu, 17 Apr 2025
 06:25:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417124908.58543-1-ioworker0@gmail.com> <a825b3c3-55f7-4d90-a318-e20acf55e0cd@redhat.com>
In-Reply-To: <a825b3c3-55f7-4d90-a318-e20acf55e0cd@redhat.com>
From: Lance Yang <ioworker0@gmail.com>
Date: Thu, 17 Apr 2025 21:24:33 +0800
X-Gm-Features: ATxdqUED3wkrDBOxfYANPvf-Dj0nW7Nq8Qoxfvbu9oI8rK9kDfgiQD8DT1tprds
Message-ID: <CAK1f24mkswwY71EKourpw1y-KiFi08OkGzZSBkutoj+UCgbLMg@mail.gmail.com>
Subject: Re: [PATCH 1/1] mm/rmap: add CONFIG_MM_ID guard for folio_test_large_maybe_mapped_shared()
To: David Hildenbrand <david@redhat.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Mingzhe Yang <mingzhe.yang@ly.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

Thanks for taking the time to review!

On Thu, Apr 17, 2025 at 8:56=E2=80=AFPM David Hildenbrand <david@redhat.com=
> wrote:
>
> On 17.04.25 14:49, Lance Yang wrote:
> > Add a compile-time check to make sure folio_test_large_maybe_mapped_sha=
red()
> > is only used with CONFIG_MM_ID enabled, as it directly accesses the _mm=
_ids
> > field that only works under CONFIG_MM_ID.
> >
> > Suggested-by: David Hildenbrand <david@redhat.com>
> > Signed-off-by: Mingzhe Yang <mingzhe.yang@ly.com>
>
> ^ should that be here?

Yep, that's my email too ;p

>
> > Signed-off-by: Lance Yang <ioworker0@gmail.com>
> > ---
> >   include/linux/page-flags.h | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> > index d3909cb1e576..6bd9b9043976 100644
> > --- a/include/linux/page-flags.h
> > +++ b/include/linux/page-flags.h
> > @@ -1232,6 +1232,8 @@ static inline int folio_has_private(const struct =
folio *folio)
> >
> >   static inline bool folio_test_large_maybe_mapped_shared(const struct =
folio *folio)
> >   {
> > +     /* This function should never be called without CONFIG_MM_ID enab=
led. */
> > +     BUILD_BUG_ON(!IS_ENABLED(CONFIG_MM_ID));
> >       return test_bit(FOLIO_MM_IDS_SHARED_BITNUM, &folio->_mm_ids);
> >   }
> >   #undef PF_ANY
>
> That should work. I can throw this into a cross-compile setup later if I
> get to it.
>

Yeah, just built kernels with and without both CONFIG_MM_ID and
CONFIG_TRANSPARENT_HUGEPAGE -- no issues either way ;p

> Acked-by: David Hildenbrand <david@redhat.com>

Thanks again for your time,
Lance

>
> --
> Cheers,
>
> David / dhildenb
>
