Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB02D23BE
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 18:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750618166; cv=none; b=kndgv7+y09W42zqKOhGVj1RQXWutoCEO1eZS6T8epiUuzzL1oMVo8tOz7otbM3kkGi1lAyhWBJNyo8fJbfqqmgZ1UcBZsjSS2TiTWYlp7VJw91YL8kfn+iZZtENSj4ISrmTFPidD22splPkJclmNgRv0ziTwekvwJOxn5nn2LHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750618166; c=relaxed/simple;
	bh=nmn8YiyGujQyGKW0sD+8BgAnlHRSPCtQ7XuRBectnZ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nXLeX3xRMKIfdrKodS62i9B1MNiUoHzGjJ/DLRjKNLiA70qQyy3FmJ2Sx9JJOyOoFIFqnUBktFsTdAkErZO6xLS6p4GelzW5Qqyd5A1nsFil8eYhk7upuzBMPWJOXJs/81mveGg3ZUSJIB92zuIN5OUMjOCtr9RvdhdfyAzJmKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iARgcumr; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iARgcumr"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-32b31afa781so27335371fa.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 11:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750618163; x=1751222963; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bnNyTcaporlHwCgllu2txLFibELgDG3yNgRM2ngHJ00=;
        b=iARgcumrM9JlmnjGktcjV0m/iFPeEaW0faDfhzZ5C2Q3nfay3gs6HnV3VnjFnImjxq
         BEp5l0+Av0js3SJql/ukiUj1fTR3sXYmVg1s1z8fmtZwHctjyV5pW1FL5npiQRtS+G7Q
         DMu4/ubHucqgTL3hKUC7VcstDI3ZVH9b7gDy7g9NXzp+yOtjAeIBJjXZCCmhw2doPXpe
         0TE1o2hR2k/4Rp85BDzUNCS+eRjZ3q1xpFCKXQ7pTHsK4ki1ssOPRfmw5jW5DHgIeepa
         kGLY8djW3sZ7X/2F6fsysiWPLaaLTSADxT6EPTeC1TVzgId8V7gt1mQjHo+L70RqvZXO
         6FRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750618163; x=1751222963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bnNyTcaporlHwCgllu2txLFibELgDG3yNgRM2ngHJ00=;
        b=GEmuxXyy8qCX9DnVJ5E+0lh52c6PaJ6p7iS3fkI3bVSdHPIYGK559T2bgWRftVwvUi
         6Xh1W8ZnZ3LmSZ0lWl1/RoKTc8sg9CDzYwARWZIjTHK9uWxS3iejc7G51XA6usECt5yi
         TuDm8Lq51YGp9jX77AeqJqXTLz3lyENZbmOfpPMyjsTAdfZ+UqT4nZLkJV1o9rtyAPtd
         OSkOULYnJu6hGlSpuvvp54B/7GxiqR441xWjgNoF9e3Bu/yDqPGmrUIDI7FYB5048PXU
         hfggpjm0NcmRk4U5+NLPdEKwKNLz1U73eNw/Ew9vVSYS2ESLb8EWLp4HlGPIgB0U5u0a
         8/qQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqxigqU+6UpN8JMwnb6ZNgJ+dfXmJHXLrCP8btZfQExtR1l/l0uAkqAipvi0JgTqV1ul1kWlbk7lt3PDc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdhwVeaZWMlpFK6Da4lglSBAGIkkOAJX86f7eA5JHqkYLp3OWb
	PL03RpGNH4RcB/3C0X/dZug+g3Dh7maFlisdXr4IN+QjweFR8AcdwUvZM1Mmt3e+C+8fQcgdze7
	KiEkGwpYJn9jR3ArsoBGlq18bnrux+jk=
X-Gm-Gg: ASbGncvpTxoAWPQXnsx7CiqHq0xV7WeRZIe9usJaW1BHQ8XQEN65xOQ4cZ3oqMoY0yx
	JhHLPMNN3khCvFF7184OnnJIx/TpA3foYaWdVUSG+xS57hVLn7GNZAD7nr4On+PLCRRSL3/4iBx
	E1RkfQ62bz2lGK9+KuP5OiQUW4nMa08oXBC7HPXfuVigA=
X-Google-Smtp-Source: AGHT+IExQxg0yirHqqchbs9CN5McpQ2sqVSeWzlrTqlX76mIZmn2AORHzJmh5Wn4P154ufsgd1QONEzCoMl700Q4H8w=
X-Received: by 2002:a2e:be03:0:b0:32a:710f:5a0 with SMTP id
 38308e7fff4ca-32b98e806d6mr31121821fa.11.1750618162664; Sun, 22 Jun 2025
 11:49:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619175538.15799-1-ryncsn@gmail.com> <20250619175538.15799-4-ryncsn@gmail.com>
 <aFUTdnPTT6m0GBX0@yjaykim-PowerEdge-T330>
In-Reply-To: <aFUTdnPTT6m0GBX0@yjaykim-PowerEdge-T330>
From: Kairui Song <ryncsn@gmail.com>
Date: Mon, 23 Jun 2025 02:48:45 +0800
X-Gm-Features: AX0GCFseCWH126ZQTjGHJnxO_W4W6wYKrx4XLRGW68Izh0-zdTnQKmgU-hVfYvQ
Message-ID: <CAMgjq7DWMPOy-1z0gCs6DcPo39e95rO10gQwLUtYcZhoqCOL9w@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] mm/shmem, swap: improve mthp swapin process
To: YoungJun Park <youngjun.park@lge.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Matthew Wilcox <willy@infradead.org>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Chris Li <chrisl@kernel.org>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, 
	Barry Song <baohua@kernel.org>, linux-kernel@vger.kernel.org, gunho.lee@lge.com, 
	taejoon.song@lge.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 3:53=E2=80=AFPM YoungJun Park <youngjun.park@lge.co=
m> wrote:
> On Fri, Jun 20, 2025 at 01:55:37AM +0800, Kairui Song wrote:
> > +     if (skip_swapcache) {
> > +             swapcache_clear(si, folio->swap, folio_nr_pages(folio));
> > +             folio->swap.val =3D 0;
> >       }
> > +     if (folio)
> > +             folio_put(folio);
> >       put_swap_device(si);
>
> I really appreciate the patch. great work!

Hi YoungJun,

Thanks for the suggestions.

>
> It's a rather trivial point, but I was wondering if the following change
> might make sense:
> ...
>         if (skip_swapcache)
>                 swapcache_clear(si, folio->swap, folio_nr_pages(folio));
>
>         put_swap_device(si);
>
>         if (folio)
>                 folio_put(folio);
>
>         return error;
> ...
>
> My intention here is to minimize the reference to si,

The si reference is only used to prevent swapoff from releasing the
underlying swap data structures, which is trivial as the overhead is
tiny, and releasing the folio first might help reduce memory pressure
(even more trivial though).

> and from what I understand, this folio has already been allocated and wou=
ld
> soon disappear. Is it possible to to reduce the clear operation?
> (folio->swap.val =3D 0)

Right, that might be not needed, but leaving a dangling swap entry in
the folio->private seems not a very good practice to me, so while at,
I added this clearing (folio->private is always cleared for anon
swapin that bypass swap cache). The chance of a failed
"skip_swapcache" swapin is quite low here, so I think it should be OK.

> Just a small suggestion.
> Thank you again for your work!

Thanks for the review!

> Regards,
> Youngjun Park
>
