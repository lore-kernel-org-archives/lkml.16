Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF53D28EC
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 14:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745593088; cv=none; b=YM1z8r/FqM7Suh2oNCZF/w8OhvUn1slR+Wf841BD+kM5z2rKJU3yqdLVq4l8isBlxV73hD5+stqxL3yhwBKfWM8hdNbYZ58ppbpkmQxDfXCH7bGVdU7GxHXHdsAQik4hoA0rUDbSj6ktLZ4NM2/YvrJmeaD38uvFxtT8vMGP3zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745593088; c=relaxed/simple;
	bh=/OKM3YtB1u7t4llITDX/LmLKKxVYmX8r8f4jO8mJyfk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OeazQThV1ZT1ATq9M+juxKDz5cycG0aAWjgJfXIDRQB4DpLvZs+HS8qLbdvWAjW65YwR1k1uPdyK+ywC1BG2GP4VJ3td2EOEeUHNCZmupoGR6nTYdZNVB8ICREUmrUGVkTVh0o8c8NO2RLfUIXpzwqt1j4cnbLCgvmw5PHkXkq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LIefl8f2; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LIefl8f2"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e7299e3ab5cso1869049276.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 07:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745593085; x=1746197885; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n+JfgXLgZyCYxu7B7mUIKQ4/DMO5+uHVG4Enqm6k6wU=;
        b=LIefl8f2OCZ4ODUHVf3NgBiso0nHhT8MOUdOKHio2Mgg6qEAy56mohySXsz31K0NZl
         9PNkbR59mvdSWTrGJZRmeaoN+l/XBDAtTZKzTEdK5hUggbteh4PIJc3Hfm2OEPPUFGRR
         JqHAGkRQ7v0z/IoGG9ZxhGjaf1KlTeFWKZWb+Hb+YRyaaGzk0MbDljYBlL6zbJdyI7+N
         QKkvvzmOpWhjSYJdcfzRmr8bwHQtvz57jrlrJ/NRvlOBDHFfdio6GThvOCoGEZWn3jKt
         UqAzNR11g465TzUJxvzgbC4srHOAN6ekjxPaBdZt8sgL3WbyFdiWjpAnDuSjVtA3R5zm
         djNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745593085; x=1746197885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n+JfgXLgZyCYxu7B7mUIKQ4/DMO5+uHVG4Enqm6k6wU=;
        b=tkNIaEkMV4d4fhzljlJgS7vxTS+l3flv5nyP9XgOvyuNBCv2x0pekKP3oWQbjFh7xE
         LGbBAxFpO2r1AqWu3VSuEBoaBUB8tjFzPHqN6vnmQlkws7E7ePxQLLDjM/9xDlas43cP
         YF06j+hR6/JBctPh2GiVBxlga8h9D/JJ6a/XMUXI+bZgMsm7rrT8uTund21cy9722i8V
         eye/ALV3UEZ5ZSdL8o0hQqtzzs4XXxfjF9p0xJTaMXvfqM3M8gTfQqweO+embEevYPb9
         nvKwdEcNeMhwF1G050OFd6WVktgoOvPDaJ8l/gVWARE6WADiIoIAxEdusS759nyqn5J2
         LOug==
X-Forwarded-Encrypted: i=1; AJvYcCWQuxEB2ZzR0r9QWOV4re0hiNNbUJkb5bfkR7WA5gd0opEdm+vfxp7Mc7pLKgG1813tY30Tv4WChh71EPk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywvbk3bIngJH0hI9ZOwLd0QIp+mMcSYuZ0ICHqrn5la0g9ta6cl
	/rqo03BoJcL+TQiPLSyobfIQs3egWrtiPxBeUOjEpy7jGXQPDQgEpZJgkOTVSf1uWpMCWprN9vU
	T4P+emANY3tgXpFhFzzdSEDU7K6E=
X-Gm-Gg: ASbGncubD1goodFWW9rZEmx42tIJ29laXc3NDu4cUdlwrDn74xX9cIEL1dVAoClHTew
	e6G6M8N0D9TiWbegFvBzpdD2MXN5yNWw3BE5A9RHGXX8/dL5ZtdrcAD2fg0Anzh2gMCg8tN71II
	ed4/sABzAM313/z+K+kzJIFlhQgaGZ3JWSig==
X-Google-Smtp-Source: AGHT+IEo7ARr7g02UpjCXpp5GUfKWlGgEmFddHaeQwxNo6PWnqJ2zIiDARe5QyTYEKSdmvHqXaz07LR62euwob5p1Zg=
X-Received: by 2002:a05:6902:140b:b0:e6b:80e3:2d00 with SMTP id
 3f1490d57ef6-e73167d2953mr3499792276.17.1745593085330; Fri, 25 Apr 2025
 07:58:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424153815.4003-1-haowenchao22@gmail.com> <8905cbf7-7507-44de-8721-b3e75e80732b@linux.alibaba.com>
In-Reply-To: <8905cbf7-7507-44de-8721-b3e75e80732b@linux.alibaba.com>
From: Wenchao Hao <haowenchao22@gmail.com>
Date: Fri, 25 Apr 2025 22:57:54 +0800
X-Gm-Features: ATxdqUEg70XJjGEjqzqthCjr_rv-cR_B85mtW4y2_0_YdVO9cQCkVBrryBfOaCY
Message-ID: <CAOptpSMZtw8xEHqgu-ufdQouiAHpitkQtBdFXmEbRGQ+FSAWYA@mail.gmail.com>
Subject: Re: [PATCH] mm/compaction: do not break pages whose order is larger
 than target order
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 2:53=E2=80=AFPM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
>
>
> On 2025/4/24 23:38, Wenchao Hao wrote:
> > When scanning free pages for memory compaction, if the compaction targe=
t
> > order is explicitly specified, do not split pages in buddy whose order
> > are larger than compaction target order.
>
> We've already checked this in suitable_migration_target(), so how did
> you observe that there are still attempts to isolate such non-suitable
> free large folios? Please explain your usecase in detail.
>

I found such non-suitable during testing proactive compaction on
android device (6.6 kernel), and I want to use proactive compaction
to produce order4 pages for mthp.

The test device did not include your patch "mm: compaction: limit the suita=
ble
target page order to be less than cc->order".

However, from the analysis of the code flow, even if it is included,
similar non-suitable free large folios may still appear.

suitable_migration_target() only check before isolate_freepages_block(), an=
d
check is based on the starting page of pageblock.

If the target order is relatively small(order4 for example), just one check=
 in
suitable_migration_target() is not enough, because there may be other free
folios which are larger than order4 in this pageblock.

> > Signed-off-by: Wenchao Hao <haowenchao22@gmail.com>
> > ---
> >   mm/compaction.c | 11 +++++++++++
> >   1 file changed, 11 insertions(+)
> >
> > diff --git a/mm/compaction.c b/mm/compaction.c
> > index 3925cb61dbb8..b0ed0831c400 100644
> > --- a/mm/compaction.c
> > +++ b/mm/compaction.c
> > @@ -656,6 +656,17 @@ static unsigned long isolate_freepages_block(struc=
t compact_control *cc,
> >
> >               /* Found a free page, will break it into order-0 pages */
> >               order =3D buddy_order(page);
> > +
> > +             /*
> > +              * Do not break free pages whose order is larger than
> > +              * compact's desired order
> > +              */
> > +             if (cc->order !=3D -1 && order >=3D cc->order) {
> > +                     blockpfn +=3D (1 << order) - 1;
> > +                     page +=3D (1 << order) - 1;
> > +                     goto isolate_fail;
> > +             }
> > +
> >               isolated =3D __isolate_free_page(page, order);
> >               if (!isolated)
> >                       break;
