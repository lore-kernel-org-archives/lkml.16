Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BF91DE2A9
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 00:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745367738; cv=none; b=tDz1vTuaAFE3utcIFITQn3yvopU+4y0IVW2elIHxjttnWwzsV50ZGzkg1UlhLJ2UtMLID7Dcex0MyzI02/AULKxTu8k0T81faWgQ1WRKC2hAKIQz/kw4LXfrH4WnnGurFRiXXto3A+iAVfEKT3WRpOm9UUAJw8+7OK8q7A7hf0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745367738; c=relaxed/simple;
	bh=iWphUKYz2iupbH04/8FQkV1k/+Xsn4ynyoT28+vVPvg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rcyxE6WY/e3wboGCA7rODc6i7EqQtQjWWsI/heFetGC/fcf9FMU4rG7X8wgJwiT4sNRUYiolieOcm7/OL4BHWXEABy6UuKKmBP3wfEuRk1Px3xbXk+O6IgcUnN78VO5ocHfy9Gdccl5+VrJuZ7YRpGP4WrzB8pKF0TtisnUood4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pC00NK82; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pC00NK82"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4774611d40bso136691cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 17:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745367735; x=1745972535; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t18C6LCHr0hDabU7TZ+QZr3j9vPs436RM37EWGNx20c=;
        b=pC00NK82z3iww/BPwUnjDsuD+p6UsuEpBjdAddxy5a8Rwz6j2pSiepTr0CF34T+q0T
         TvU7PK5bjNERZC7RQV1fQVnQsQdqmuaoIIdTXqyB7iVDjtwxtw3tsdptZMHZXXQNCONV
         8dTQl92hIylx5Yx3LfrZMcg0f/pN54Sj1KgQ4v1lja3sf6SkFv+6At4aoLQgDIjgjVhO
         BepRwWU3knj6kQleEg3LilYK7CLEAVAmXHULX6QUCFMkZaBdP2IDTonAfD3KHG06THP2
         0PryLoyMYyMF5zv7/zH9842j76uTMDwNmyVx6HzpBIU7S5eRULwPtPfxOuBBVu6/ynqW
         TJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745367735; x=1745972535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t18C6LCHr0hDabU7TZ+QZr3j9vPs436RM37EWGNx20c=;
        b=NmXp1PUpu1CJTJqeomZrhLi1RFhp1qJ7lB7azlAfO0ftZUsdHEch6wjlkCdnRQxVJM
         XyBNW4BpyehqQ4fvnTgiQFOsnv+ROksz6TNjlbfDl4llvH0RurisMWbDOcg+3fp7p2wC
         BDXiBBQYQfbWWNyQzU+YjgqblBLtpNQpK/gDQDQTGZdHz8gGWJCu8ypT37vJJ0kkzOUJ
         QGluOHpu1FLBYswaKLbQRHWr2GsNxJ0RlroOO/XfZI8JoSoazaH4DWaV1V0GaOAQAcQS
         Y93IpV9hdmFQOhnYdcm3isugqmGXhur/Kggg7+6ScIjT3Xk1wjMa4/cTVu9KjRYO5lap
         cJLw==
X-Forwarded-Encrypted: i=1; AJvYcCUuT6ITdaNlq53uYbX8fzwo+f6RbXtqlHgFkiL1qbndoWxuNcAnfoN6KnzmMxr0ujJo78TnK9f5q5ebh6s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp8Jx0prPhY1/uTBdvi5Om5iRvHsFpFmClQYrj6RJ0WomHDuuW
	8ervGa4NiZXkuFxROQIf9g1Wx1d07m2kecPaqvIoQ0+g82YhWT9K7lNS4aKgHOKsESjpVjXFxw1
	Rtcv86Lg43V7cGJBu6yT6CbSz4Zg/tUiPIvgn
X-Gm-Gg: ASbGncvwvz3wrFhRHo7O75F/6BgZjI6uCMlEM1ZCCtICQaXzsgn3vcOxHQVmuncbnB/
	0ygD2op09zvocsIza6yLiCf70AubR62u0EY0V24a0J1Fh1p/fRbLQEJ66vb3f3uZunPMm8BB/jt
	hkSukipoUTdDPpWLy5KsSo1BE3fr624WHlX8Q29T1K6VbirRY8M4ex
X-Google-Smtp-Source: AGHT+IF/ulFm1u/wrb6Z9JTDyIIX9Z/3tWgVPN+WIa93aMZMmu/2Wv+vkID2acqsQOxCDG0EPTzY3Urz/Okit1V5ed4=
X-Received: by 2002:a05:622a:2483:b0:477:c4f:ee58 with SMTP id
 d75a77b69052e-47d13ae65a9mr1911041cf.24.1745367734940; Tue, 22 Apr 2025
 17:22:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416082405.20988-1-zhangtianyang@loongson.cn>
 <aAYXP4f417_bx6Is@harry> <025e3f51-2ab5-bc58-5475-b57103169a82@loongson.cn> <20250422171116.f3928045a13205dc1b9a46ea@linux-foundation.org>
In-Reply-To: <20250422171116.f3928045a13205dc1b9a46ea@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 22 Apr 2025 17:22:04 -0700
X-Gm-Features: ATxdqUGzXCZA__JdB5Nad1t-pfokmHKYCm90-XSN8xWEAIqENK2Zsn9n3Tkt8lo
Message-ID: <CAJuCfpHbXmjAr2Rt0Mo_i32hpGOyXnVtXUd4qFjXriH9eYFDkQ@mail.gmail.com>
Subject: Re: [PATCH] mm/page_alloc.c: Avoid infinite retries caused by cpuset race
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Tianyang Zhang <zhangtianyang@loongson.cn>, Harry Yoo <harry.yoo@oracle.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>, 
	Michal Hocko <mhocko@suse.com>, Brendan Jackman <jackmanb@google.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 5:11=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Tue, 22 Apr 2025 20:10:06 +0800 Tianyang Zhang <zhangtianyang@loongson=
.cn> wrote:
>
> >
> > ...
> >
> > >>
> > >> Simultaneously starting multiple cpuset01 from LTP can quickly
> > >> reproduce this issue on a multi node server when the maximum
> > >> memory pressure is reached and the swap is enabled
> > >>
> > >> Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
> > >> ---
> > > What commit does it fix and should it be backported to -stable?
> > >
> > > There's a new 'MEMORY MANAGEMENT - PAGE ALLOCATOR' entry (only in
> > > Andrew's mm.git repository now).
> > >
> > > Let's Cc the page allocator folks here!
> >
> > We first identified this issue in 6.6.52-stable , and through root caus=
e
> > analysis,
> >
> > it appears the problem may have existed for a significant period.
> >
> > However It is recommended that the fix should be backported to at least
> > Linux kernel versions after 6.6-stable
>
> OK, thanks,
>
> This has been in mm-hotfixes-unstable for six days.  Hopefully we'll
> see some review activity soon (please).

I reviewed and provided my feedback but saw neither a reply nor a
respin with proposed changes.

>
