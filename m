Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7495E6A33B
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 02:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738808089; cv=none; b=nnK9n+yaUTNSqmRNQJbcAmklz3JuW7a6SGAScTtONiHTH6DEg+iqv9k3nwJ3PVsGqgfuDae0Byeh54BwU9Q7YhnXQ/iieadrypnysOkdULgzvYfGTuIdAQ6bbnkwqPggAQiRaNbB+LROysF1Fe0ycEX3YqIsCYHTtnHf8I/PkSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738808089; c=relaxed/simple;
	bh=Ojia6x7vJXX9k70zhKx2IgQUJd4PShe+C5jUbgyhcc8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E/sSkAApoqyKJh9N3YN24xH2v7yQ6F1oGO8vP6UxlUttLS2QwAbIirJLlCATclFyNtzWqdbAhbKflT6aEdP+TVX7UBR4aLP0dSrzKMUDMA0/JWxifzUfDjyeylyqogN99Mtm8cvTTkT2EQQRiv8NjQp8uIKA+MKNy46PGqY7K2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LGGx6wFi; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LGGx6wFi"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3076262bfc6so3884851fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 18:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738808085; x=1739412885; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sl7OpDreIMnTrM+4bCT93LEcjwLpBqwnjhWThvaWZWw=;
        b=LGGx6wFi0MakdvXNgi/Ud5Z74QPtePsroctGCTvleL9QqIJ0q7XS+Hn+ZM65+7Tlgg
         wvk/bLFuVELKNy50KL1/5y+1wdwoemr5Llz/0gpBA3a+99weDhDdCL/g6+slH9pDRmGg
         BVTDAz7NJnOtX0ciqDjI9brvvxoFERxUMlWrxvIC1BApWdMtDoG0hHdMBs6310MR8QyU
         qAWzjO4x5TSwIlkpReYq+nkjvtMBVlrwoQR5/EWMz1OSEHCqFKwcRg95bpTzSRwRS43A
         mMtGIzwpDa9HyxE17TAdxEZybPDOEZKL7dh9OH9Eeud/etx0pGwIQ97idWp8cHI+Z5iw
         ukiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738808085; x=1739412885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sl7OpDreIMnTrM+4bCT93LEcjwLpBqwnjhWThvaWZWw=;
        b=o+TWsBftWvo8pDOCQKWMFNKe+54f21KdIxsw/yPiOVDe5aSbFAkwauFpcS6XL2l/+f
         2gEOnA6T1rZqtIJarw5JpVIVZ0YItvNvjjxih214P60PoyvRoNFNEQL7nVkQtsbAQaGt
         QMLw7m2ZPzzHGfu8tB8rRPT3Zg+PxZuocC98GR/GJGJgBD8klR5IFyId6U9Lo4OCIpan
         U0R6rV+vC4KTfz9rm4Z5jPpbU2E2gAxj6/2m482Tg5F99uwRvNR1DNZFwNRBXHHLcZpS
         D70w9S4J6U181/0ht6yUb4VCVky464kcwe+DzrwtN/qPvfYP4UeBHebNALbsVkLRwlnq
         gJhg==
X-Gm-Message-State: AOJu0YwhJVwpb6TagctACcqLjneNu299Aak3Zz5bCd3NWEt9jKA89/cg
	DbbJgZs2VJtmz1GNI3RKwOmCDJyd+bFld8RI9eFypUoxvANS3vhslnzor8KSMwsFxnM4MKla9q7
	shsOcnSyHc46MNVmyh4TYKV+L6Rc+ixp5rN8=
X-Gm-Gg: ASbGncsnEzpohIa8ruP8ZFPb1+WVEWCKfdk2GGshlkz+3LIhpBhIsbTufn07HUzfuA6
	Kw/fuMUaLlOVPIL1smp8gYfr5IflgpXOkOpWwvR6E14BxQ7RvIDw+NUGmRB+Lk4hOgnkeOQqZ
X-Google-Smtp-Source: AGHT+IFzLRQCAD+8FQBF4AO0N4iNeN8l+6jugU/REtt6RJZGj0165s8OvgtOVActhwGVPx4CogH2IxLjEEaGykbWcDA=
X-Received: by 2002:a2e:ab0a:0:b0:300:33b1:f0c4 with SMTP id
 38308e7fff4ca-307cf307693mr20171301fa.11.1738808085163; Wed, 05 Feb 2025
 18:14:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205092721.9395-1-bhe@redhat.com> <20250205092721.9395-5-bhe@redhat.com>
 <CAMgjq7CYC4xfAkp9Y7g=3rw=iqTj_pQAjrnwDC1orkdUhnOCSQ@mail.gmail.com> <Z6QTKQPKXDEpWWKb@fedora>
In-Reply-To: <Z6QTKQPKXDEpWWKb@fedora>
From: Kairui Song <ryncsn@gmail.com>
Date: Thu, 6 Feb 2025 10:14:28 +0800
X-Gm-Features: AWEUYZmaTaHRs6ZOkVq_GXPR-0Sk_ZBvGZue39Bp6HjBZqbdZy6BtGM27a5ThMY
Message-ID: <CAMgjq7DUpffkX66KCJzF92mHUrNCV7TOhW+0j4sgyqHtZvNbgw@mail.gmail.com>
Subject: Re: [PATCH 04/12] mm/swap: skip scanning cluster range if it's empty cluster
To: Baoquan He <bhe@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	akpm@linux-foundation.org, chrisl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 9:41=E2=80=AFAM Baoquan He <bhe@redhat.com> wrote:
>
> On 02/06/25 at 01:07am, Kairui Song wrote:
> > On Wed, Feb 5, 2025 at 5:27=E2=80=AFPM Baoquan He <bhe@redhat.com> wrot=
e:
> > >
> > > Since ci->lock has been taken when isolating cluster from
> > > si->free_clusters or taking si->percpu_cluster->next[order],
> > > it's unnecessary to scan and check the cluster range availability
> > > if i'ts empty cluster, and this can accelerate the huge page
> > > swapping.
> > >
> > > Signed-off-by: Baoquan He <bhe@redhat.com>
> > > ---
> > >  mm/swapfile.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/mm/swapfile.c b/mm/swapfile.c
> > > index 9c9a4ec6d4c6..61efde853eea 100644
> > > --- a/mm/swapfile.c
> > > +++ b/mm/swapfile.c
> > > @@ -729,6 +729,9 @@ static bool cluster_scan_range(struct swap_info_s=
truct *si,
> > >         unsigned long offset, end =3D start + nr_pages;
> > >         unsigned char *map =3D si->swap_map;
> > >
> > > +       if (cluster_is_empty(ci))
> > > +               return true;
> > > +
> >
> > Hi Baoquan,
> >
> > Thanks for the series.
>
> Thanks for your reviewing.
>
> >
> > Most commits are looking great, but this one is a bit questionable.
> > cluster_scan_range is only called by alloc_swap_scan_cluster, and it
> > already checks if the cluster has enough empty slots to use, so this
> > might be redundant.
>
> Hmm, maybe no. Assume we want to allocate 2M space on system with 4K
> page size. Even if a empty cluster is taken into consideration,
> cluster_scan_range() will loop 512 times to check if each slot is
> available. That for sure is not necessary in the case, while the added
> empty cluster checking is very cheap.
>
> >
> > It is possible that cluster_scan_range sees an empty cluster if the
> > cluster lock was dropped for reclaiming HAS_CACHE, but the chance
> > should be extremely low, that this might be a negative optimization.
>
> It may be not like that. If it's empty cluster, the added checking will
> return directly. Then 'need_reclaim' is kept false, there's no chance to
> drop cluster lock to do reclaiming for HAS_CACHE. Means for empty
> cluster scanning, the ci->lock is kept held. Not sure if I missed
> anything.

Ah, right, sorry, I just understood your code wrongly. This makes
sense to me now.

>
> Thanks
> Baoquan
>
