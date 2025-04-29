Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BB5154BE2
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 13:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745933732; cv=none; b=F1/1MKkyMDaSgXDu9zbueNklyvugGDNU3ACWsWezfZ0Qhyt2GeTJo3LcA8ClckjVhisVzU7dnTS/nFoFzsAQo3xddb6I8heQmHrHXW5rnri76A7GFkplQiyk7X4q9HXCr6j+CsALw3H67WB1TBaa/tq1mXAazBPJENUNnWisuno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745933732; c=relaxed/simple;
	bh=a63i9iE1pik7V30aPviWOUMBkFOGLS98nmC+avpfCtM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dz5KxZn+eJrJU1N7bOW0KZZl9yISIKy6vvDLcAxDcCTF9KCTMj7W5mdf7fOwHQQXdtOfPFAKZwDtcS/ALp7NqIKAJQwhr9CnBPi7fVySs61E4MrdabBXg6yARIo8f/rb4SrOggZd4xzdGzzcHC4EFrR0Zw06x2ndXsQ+x+4nauI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UlOHZ5AQ; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UlOHZ5AQ"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30db1bd3bebso63706871fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745933728; x=1746538528; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fodDWo+RGItuZQ4Oj97QRpH3lQkupmOqH95MLEPhgwk=;
        b=UlOHZ5AQa2u4IFH5xIhr/dphqpzisEAfEppRx3tDHCeHT1DCFyfAoirzB8sCqIIfnp
         qSvHFhVFeiu5stx9OChq5nO0OK08P7enbHkdi4EdUW+NFCSL5HdVkEJLZoDsYPMg/x2M
         GUcDSIkD2pvKNKmpKqlfXQ1oBQZJkfhQTVrLOGPC7C27mzP7IMukksGzZUsbI9ZbkPpr
         DJlExUoyRBXWNkTUTAhvs6386bJPrGzIiM38660Z/l7z/itCMRjMHWvwRTJOm9fKLVY7
         w1d8jElNuzkbC7cg2aShXk/Mgr0F55X4axl3tVGDnD/kGc1NStb/Uf7IVtOUGcCSHSG7
         p+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745933728; x=1746538528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fodDWo+RGItuZQ4Oj97QRpH3lQkupmOqH95MLEPhgwk=;
        b=e0s6LnoFS1QyKJXRjTcdIDmXl1t0fDmTEPNbxCLS+yj/nSsc08fkA15ilh3P/OhH1+
         OmJT6XxBTrgEV6WtEUSCkLC6DCoBGEzJ/uu/QaVxdzHxcp1jHnUemKfv7FD0hXBXeqYI
         Z9qhFInfqRVCCDKOwvE92werN+ferYKCfIFE5s9N2R0k7T4vRM76CSRWWoh7UQWfLg3r
         FjgOQ/KyfFf0voGErjqK5+HfRINyNVT6qCc5aKmZNk/+dtzm/xN1MNFSc4PyGjU3Owlr
         WB5peZ015znK2568RZmMTrx3cl1uvlehZB9AAdFNMGJe2AhDL+3nmgaBcKzghcPmHRxQ
         ltiQ==
X-Forwarded-Encrypted: i=1; AJvYcCU87sLp5GNaCZX6nWh8KWxDdxXOf6g6jPQHRpDvgxMWdddWA44nSFly0Eo7253Ndi2RTNHvDMq+c39v3hc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDV57sYoV7ldfTGTCQdfjhRkoKTUi+3p9q5dEKuI+ymh2pxFUW
	0PKty/HDIWgjqkPLMKJde/g5aTfYMIJaO/3H5NOlPQDPbmN4ghfI8IO6uROJ3IlxFWQ5gqsQdNr
	Imb0dJf3dnDUun9QBnpCI+34zyCg=
X-Gm-Gg: ASbGnctOg9+BqCPyKEfKMyjlFr5ZlpwaLiKUSXlwmwu+2KXFrdfN33XkQWogIe7DH7P
	x4wh1zNjQKaM4+beKrS1a4kTZxbiJepDOldUKeT2rBxXkiX2LvnT4rdwAnBb2Db0y+OraSFhpld
	18EYastry4hYhUILOmFJ9EDw==
X-Google-Smtp-Source: AGHT+IEwbfo6deTbCOIVtlzBWTe68r6ELJYHmuLGqK8PNPUVDEYpsne7HuqViroBaEpBasloP+47VkDxUjCrfDuNbX8=
X-Received: by 2002:a05:651c:88f:b0:30b:9813:b010 with SMTP id
 38308e7fff4ca-319dd1c2296mr41566301fa.31.1745933727982; Tue, 29 Apr 2025
 06:35:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429114949.41124-1-ryncsn@gmail.com> <20250429114949.41124-6-ryncsn@gmail.com>
 <78487605-8b83-4b77-8147-9e34e4f8fda2@redhat.com>
In-Reply-To: <78487605-8b83-4b77-8147-9e34e4f8fda2@redhat.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Tue, 29 Apr 2025 21:35:10 +0800
X-Gm-Features: ATxdqUE4OYwPtw1kshLNvPBfX3ps1ZKR7FI5Y31rw9GI1__xH3Xmuo1y3FX0n9U
Message-ID: <CAMgjq7AkaA+q8tNXurv4w2dNN5q6iLaGZ_7tfYRWSr5Oqrd3uQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] mm: move folio_index to mm/swap.h and remove no
 longer needed helper
To: David Hildenbrand <david@redhat.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Matthew Wilcox <willy@infradead.org>, Hugh Dickins <hughd@google.com>, Chris Li <chrisl@kernel.org>, 
	Yosry Ahmed <yosryahmed@google.com>, "Huang, Ying" <ying.huang@linux.alibaba.com>, 
	Nhat Pham <nphamcs@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 8:24=E2=80=AFPM David Hildenbrand <david@redhat.com=
> wrote:
>
> On 29.04.25 13:49, Kairui Song wrote:
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
> >   mm/memfd.c              |  1 +
> >   mm/migrate.c            |  1 +
> >   mm/swap.h               | 23 +++++++++++++++++++++++
> >   mm/swapfile.c           |  6 ------
> >   5 files changed, 25 insertions(+), 26 deletions(-)
> >
> > diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
> > index 1dc3416a9c0d..47b5746d5a65 100644
> > --- a/include/linux/pagemap.h
> > +++ b/include/linux/pagemap.h
> > @@ -884,26 +884,6 @@ static inline struct page *grab_cache_page_nowait(=
struct address_space *mapping,
> >                       mapping_gfp_mask(mapping));
> >   }
> >
> > -extern pgoff_t __folio_swap_cache_index(struct folio *folio);
> > -
> > -/**
> > - * folio_index - File index of a folio.
> > - * @folio: The folio.
> > - *
> > - * For a folio which is either in the page cache or the swap cache,
> > - * return its index within the address_space it belongs to.  If you kn=
ow
> > - * the page is definitely in the page cache, you can look at the folio=
's
> > - * index directly.
> > - *
> > - * Return: The index (offset in units of pages) of a folio in its file=
.
> > - */
> > -static inline pgoff_t folio_index(struct folio *folio)
> > -{
> > -     if (unlikely(folio_test_swapcache(folio)))
> > -             return __folio_swap_cache_index(folio);
> > -     return folio->index;
> > -}
> > -
> >   /**
> >    * folio_next_index - Get the index of the next folio.
> >    * @folio: The current folio.
> > diff --git a/mm/memfd.c b/mm/memfd.c
> > index c64df1343059..ab367e61553d 100644
> > --- a/mm/memfd.c
> > +++ b/mm/memfd.c
> > @@ -20,6 +20,7 @@
> >   #include <linux/memfd.h>
> >   #include <linux/pid_namespace.h>
> >   #include <uapi/linux/memfd.h>
> > +#include "swap.h"
> >
> >   /*
> >    * We need a tag: a new tag would expand every xa_node by 8 bytes,
> > diff --git a/mm/migrate.c b/mm/migrate.c
> > index f3ee6d8d5e2e..662e5dc44b33 100644
> > --- a/mm/migrate.c
> > +++ b/mm/migrate.c
> > @@ -50,6 +50,7 @@
> >   #include <trace/events/migrate.h>
> >
> >   #include "internal.h"
> > +#include "swap.h"
> >
> >   bool isolate_movable_page(struct page *page, isolate_mode_t mode)
> >   {
> > diff --git a/mm/swap.h b/mm/swap.h
> > index 6f4a3f927edb..91439d0ce50b 100644
> > --- a/mm/swap.h
> > +++ b/mm/swap.h
> > @@ -50,6 +50,24 @@ static inline pgoff_t swap_cache_index(swp_entry_t e=
ntry)
> >       return swp_offset(entry) & SWAP_ADDRESS_SPACE_MASK;
> >   }
> >
> > +/**
> > + * folio_index - File index of a folio.
> > + * @folio: The folio.
> > + *
> > + * For a folio which is either in the page cache or the swap cache,
> > + * return its index within the address_space it belongs to.  If you kn=
ow
> > + * the folio is definitely in the page cache, you can look at the foli=
o's
> > + * index directly.
> > + *
> > + * Return: The index (offset in units of pages) of a folio in its file=
.
> > + */
> > +static inline pgoff_t folio_index(struct folio *folio)
> > +{
> > +     if (unlikely(folio_test_swapcache(folio)))
> > +             return swap_cache_index(folio->swap);
> > +     return folio->index;
> > +}
> > +
> >   void show_swap_cache_info(void);
> >   void *get_shadow_from_swap_cache(swp_entry_t entry);
> >   int add_to_swap_cache(struct folio *folio, swp_entry_t entry,
> > @@ -125,6 +143,11 @@ static inline pgoff_t swap_cache_index(swp_entry_t=
 entry)
> >       return 0;
> >   }
> >
> > +static inline pgoff_t folio_index(struct folio *folio)
> > +{
> > +     return folio->index;
> > +}
> > +
>
> Could we just have a single generic function that does something like:
>
> static inline pgoff_t folio_index(struct folio *folio)
> {
>         if (unlikely(IS_ENABLED(CONFIG_SWAP) &&
>                      folio_test_swapcache(folio)))
>                 return swap_cache_index(folio->swap);
>         return folio->index;
> }
>

Sure, this is doable. I wanted to put the file in swap.h so it can use
swap_cache_index without introducing another extra header dependency,
and put in right next to swap_cache_index, I thought this way looks
prettier :)

I can move it to the tail of this file (out of ifdef CONFIG_SWAP) and
use one single generic function.

>
> --
> Cheers,
>
> David / dhildenb
>
>
