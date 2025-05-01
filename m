Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D45944F
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 10:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746094121; cv=none; b=i7UZZ6JxaYXeGZN7ItvefR8e/rCe7GVY8bj5VgL0J9Jb1/mPpI5+1f8Um6dMDaRgVx6TkM+PP3yKPPTvoiLtjrE7m2sx9oFFa7lhk2AAEgzEKcLyZVF1oGPd7IUp7SKrOILGv1Zrmy1KHziCQ1nvlfvfvSjEoz0WEdJhnh3J67k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746094121; c=relaxed/simple;
	bh=++Kj0KYndw9OEp0WCpL6FMSr9Bb5pO7zvil0RccbHzw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T7ig4EYttcoAKHBFY8FPkkDlyZxEmm91OZl/NCTdFI5kRkNSIAXDu5H24X6+Ie4bUBj8s8d1Xrm/8/MhZi1hIqvbyZt3DHdd0EQMsTNnuX7HtXvtK4vD77uFxugbmPpoVdgdfvG742xguIVEeQUKdo/kkShW6DbT/YCotEI0zl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=doXANfXX; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="doXANfXX"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30bfc79ad97so20769101fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 03:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746094118; x=1746698918; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HgLvO+n0R7zxT3cGMmFndY151LKlyH3b08KaJoiQevA=;
        b=doXANfXXo6zlZd9m7kfiY3RfdnEEdEg7CO0Kyp3qk90nz46nyj+CvVXHPqSbcFAPjL
         Vl6CyfEFTlIRjADZdF503BBfi25tA9ffDC5W3lLAKI5wbFDiPglJ3orxf1eWM6sH5jki
         3/amkk9aYAedcofE1/l6LPC3orgVxmnvo2XucyNzqCVutskStd+rk/fgEhm7haipFQQJ
         6pDMIAwK6cGFn/F1bu3BExbsCZn2lNk/LRvKBb/kwehQGK62YfvBzvuOnyqNVe//laGm
         i8DIHpNRy/oMRpryyI2dAxMKjhU8VGvR9EfgLKnjPORTZUYRMAD3GvEcScX8/VVQOhWY
         AKBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746094118; x=1746698918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HgLvO+n0R7zxT3cGMmFndY151LKlyH3b08KaJoiQevA=;
        b=ZuI4Qfnn1q5Pyt546MIQUi/xYBHjCo/QqnTwygVU1vQFEjAybGlClUZg7AmccM77Na
         q+CY2KviWEEfFnnTfKMf08r9JL9SpHGWL8dO2yX8zkFd8lCH5GelfvhQ1XOXu5PuA5TW
         el3fTDzipjlpjE4G0RH2e7MMhcrLWWdIi3LwUW5D/vjMpPzyQEPNQtiwZcU0NJVlcF3l
         DjNhePWOuz75PiEW5Dtdiqk7xNU5y/2XMd2KNxqoK27dlkfYg1eBdxt3I0h3adU/ZEBR
         ZzN/4tCwy5nqwIwkUIdEglM11mVMz1uAui9Lw+p0cBKZ+WjXbBDfKn4/mg5N8ENiKKsP
         UfwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdPzamT5K74hgs8HgIecN1rYavH5e4lslRjK4DEwTPP2opXkX7SR/tB0JQs3Y8+vjyqIuzx4XWOwbRQPo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVb8m9hdv+X37bsi/TpKMc4FmsuAFBuGFLR5JTTR9bvGTJ3nzR
	gCVPg3PEERNEVDRhKIxEaBcLjIEBMboFu8RJomfi56RAoz9kbLFuxCvHsMd1Octq46sqWEhyNiy
	1Ts/+FnkGMY5gbhv2l/MovK2zkDtf0IM58NQ=
X-Gm-Gg: ASbGncvzE1znauUSba82H0RKO6AZQ2ZgftezG8UNd5J0Ecp9tw3uinfYP59ZVqD4YE9
	3+ecY0fnCpkFfw46Uv7gdgU45fYSIU6ukJdbhnr1dj3131IpZ7b6/l6QmJAX8zG9ePLmG5VEDvJ
	DsgG5XXl21q7SRxvAcLPZF0Q==
X-Google-Smtp-Source: AGHT+IG1al/aKxdyoPYpVBZh9QPGrAguZJZDe79LmZGdPhoM6KIk17z7h13JBq9bkxvvPDQKjOMggWbxZpaefC37Pls=
X-Received: by 2002:a2e:a906:0:b0:30b:f0dd:9096 with SMTP id
 38308e7fff4ca-31fbc1849eamr4423881fa.12.1746094117691; Thu, 01 May 2025
 03:08:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430181052.55698-1-ryncsn@gmail.com> <20250430181052.55698-6-ryncsn@gmail.com>
 <19908a46-feaf-4bbb-b41c-ef5b7d72343a@redhat.com>
In-Reply-To: <19908a46-feaf-4bbb-b41c-ef5b7d72343a@redhat.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Thu, 1 May 2025 18:08:19 +0800
X-Gm-Features: ATxdqUHS9sTsB5VG99FBddABZLncQkxd7c8acvTDcoWZo0Z6OVZk9LcS-Eea_38
Message-ID: <CAMgjq7Bv5mgVwca0aN2RhJXkJuVPtKFCjv915WcgaDKD9_DM3w@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] mm: move folio_index to mm/swap.h and remove no
 longer needed helper
To: David Hildenbrand <david@redhat.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Matthew Wilcox <willy@infradead.org>, Hugh Dickins <hughd@google.com>, Chris Li <chrisl@kernel.org>, 
	Yosry Ahmed <yosryahmed@google.com>, "Huang, Ying" <ying.huang@linux.alibaba.com>, 
	Nhat Pham <nphamcs@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 1, 2025 at 5:11=E2=80=AFAM David Hildenbrand <david@redhat.com>=
 wrote:
>
> On 30.04.25 20:10, Kairui Song wrote:
> > From: Kairui Song <kasong@tencent.com>
> >
> > There are no remaining users of folio_index() outside the mm subsystem.
> > Move it to mm/swap.h to co-locate it with swap_cache_index(), eliminati=
ng
> > a forward declaration, and a function call overhead.
> >
> > Also remove the helper that was used to fix circular header dependency
> > issue.
> >
> > Signed-off-by: Kairui Song <kasong@tencent.com>
> > ---
> >   include/linux/pagemap.h | 20 --------------------
> >   mm/gup.c                |  1 +
> >   mm/memfd.c              |  1 +
> >   mm/migrate.c            |  1 +
> >   mm/page-writeback.c     |  1 +
> >   mm/swap.h               | 18 ++++++++++++++++++
> >   mm/swapfile.c           |  6 ------
> >   7 files changed, 22 insertions(+), 26 deletions(-)
>
> [...]
>
> >   bool isolate_movable_page(struct page *page, isolate_mode_t mode)
> >   {
> > diff --git a/mm/page-writeback.c b/mm/page-writeback.c
> > index 20e1d76f1eba..9ff44b64d3d6 100644
> > --- a/mm/page-writeback.c
> > +++ b/mm/page-writeback.c
> > @@ -41,6 +41,7 @@
> >   #include <trace/events/writeback.h>
> >
> >   #include "internal.h"
> > +#include "swap.h"
>
> I wonder if we should just have it in mm/internal.h instead?

That will require internal.h to depend on swap.h. In follow up patches
I'd like to remove the folio_index usage in all places except migrate
and swap files, this will make the code cleaner and swap cache will be
less exposed.

>
> In any case
>
> Acked-by: David Hildenbrand <david@redhat.com>

Thanks!

>
> --
> Cheers,
>
> David / dhildenb
>
>
