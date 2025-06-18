Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9402F533A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 07:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750231340; cv=none; b=ra3fJVHrIfjXc6l8Sz+iUp871EfSK0PLAaKc5SoID3e7O8ct67AQu0NKApTtxZBQbbwE49flZJe931VQJaCmkQAKJ4NWKIFTtwdQFH0evu0daecyhSOhI9WUYEdKMym7dslx3Blu+9mrww3W31LIcN6pVLEAAWN8Kgo4/QbIu7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750231340; c=relaxed/simple;
	bh=FlYIp1GSWXgA47DrwMIkay6HroV1XLb7hc3gExSwoE4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KdtGrSx5K0ooaxjTaW9FXi481t02PsnEisJ0gpeIkPjgpYm+eIK76+RkhJ9d0Rwn/LlY++t/Z9ZCWdG4xTFUfEy5nilxSdcuLGMWUBE9Wne37WykoKCw15jM1YisAZJtx61e0MHs45AkdXTSacZIsp2DmMUDbi3STZ/qHbmKBjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Zh+qr4gD; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Zh+qr4gD"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-313910f392dso5827891a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 00:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750231338; x=1750836138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g90eoEwOIpMaTkn+dJ7Xpv9ylWdjlRNbMVrS8tF+CzE=;
        b=Zh+qr4gDieiiDIq+0sFz5aljgNoxhu28li3qFs8ishAvrRVrzZmM7f/ebQlsHhvKe7
         f1CEtJkOHnPqn0rAo6uc3Owqar2bIBBaWQb/IjKfN7W0YzuvIxGFp8JaP25g2e2kyziE
         vzA4AkKjFFuKarY0aTbxjkcbmqNM/B7qEhxKAmzsTkJazARznFZhqObcObN6W4DvRwyC
         jRfOZHavXYB5k3Jqeyumc4bqho+nk8t41Ynh5olFHzZTXmrbPeoi5UwxP5wpggHCZgyo
         kj7TGsE3zXOy/cIxolHYug8FvhpurEvBgczf5V3gXh/ZQKJG5VzzdCi9WeWo80jkDDSI
         bZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750231338; x=1750836138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g90eoEwOIpMaTkn+dJ7Xpv9ylWdjlRNbMVrS8tF+CzE=;
        b=ots1wexy7fSwou6Vr3nULSJUrCz7dTewFSyTyI984h9w1R40gIiS5pNEcOmM+HxQyA
         kPEcD/1fj29oz2TGfJhuuoeM6oga2RJbYbOKjAWNCxAdMNLwgpXP2TIOxg11twQP/Y4G
         jHUBifUWfI8TZGQ3BmlXKnl976bZjId1U+rqMEK/5Aq1NUPPlVWNf4WwTbYp0JuNqJm3
         ia1rqlzy5t9bhJ1Voy85CNtnbDR01OkIaXpCru9r4JWht/XRm8rAt/mppbnh9lTBPjGf
         S5/WDusLcp0PDcsu29M36/1cVv1yifLm5ouLeYY5+HwIQgwlYctn7NpnJ9UP+F6euqbZ
         7s/g==
X-Forwarded-Encrypted: i=1; AJvYcCWHgZ+VPxevIjtVAuz94Ka3DAcGVoc77xRQdqszQnDAfhqkTRAKPDxpqu4wOZ2P/O5ZQhZxwGWT2De2DL8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyN3SGArEX2dK95HZTG3SEx219e5R6af5zQHJJgYbSljKfNLqjA
	l+cBl8yB0smk7RFPly0nib9BQoyuYnW+9tsBVj3tD5Z6vKxxEYmk/CwUyAWaah4ym9E=
X-Gm-Gg: ASbGncuYvJVbSeYFjSPcrlcOi7x0zD4oCiVdu4k0pRUEOh1rQqO91E2VcY0ohavlR48
	36wnqYUOX4vzMD9DNPJkKGp1OW7aLEtuPbp1yOll5fou+srSMOpMfvIx+2zoCyYBnQ/B+8cmIzr
	8vF8yJUvjjxZqujMlKfB2T7F6P3rb3luA3HvHIR46ithgNq7OJ74dsyWA//NoStcWXnbofGWOAG
	xfTvsX+K1Ihh0keYYZZy0M87NZrJQAQZxWUY/FQDWEt9ZdM9jrDv2g9kDhKeruwWESqBut1y8+F
	cNEkU0geFBvalH+GsYcaoT0HP3eyordA1QN3m79VxtxOJbUry5dBGAh84JlWybLrd+YEF0I2/sO
	Mhm9KBDtTxFbirw==
X-Google-Smtp-Source: AGHT+IEIlF9MTo6BXhNVepXYf6WgSUfQhwoHcEgxpRuHCE9CuMWp3AFMHSQtgSDSihKLhGjH6gjAVQ==
X-Received: by 2002:a17:90b:350c:b0:312:f0d0:bb0 with SMTP id 98e67ed59e1d1-313f1ca0fbfmr30726786a91.12.1750231338007;
        Wed, 18 Jun 2025 00:22:18 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.12])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365dfc6990sm92909995ad.224.2025.06.18.00.22.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Jun 2025 00:22:17 -0700 (PDT)
From: lizhe.67@bytedance.com
To: david@redhat.com
Cc: akpm@linux-foundation.org,
	alex.williamson@redhat.com,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	peterx@redhat.com,
	lizhe.67@bytedance.com
Subject: Re: [PATCH v4 3/3] vfio/type1: optimize vfio_unpin_pages_remote() for large folio
Date: Wed, 18 Jun 2025 15:22:11 +0800
Message-ID: <20250618072211.12867-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250618061143.6470-1-lizhe.67@bytedance.com>
References: <20250618061143.6470-1-lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 18 Jun 2025 14:11:43 +0800, lizhe.67@bytedance.com wrote:
 
> > > How do you think of this implementation?
> > > 
> > > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > > index 242b05671502..eb91f99ea973 100644
> > > --- a/include/linux/mm.h
> > > +++ b/include/linux/mm.h
> > > @@ -2165,6 +2165,23 @@ static inline long folio_nr_pages(const struct folio *folio)
> > >          return folio_large_nr_pages(folio);
> > >   }
> > >   
> > > +/*
> > > + * folio_remaining_pages - Counts the number of pages from a given
> > > + * start page to the end of the folio.
> > > + *
> > > + * @folio: Pointer to folio
> > > + * @start_page: The starting page from which to begin counting.
> > > + *
> > > + * Returned number includes the provided start page.
> > > + *
> > > + * The caller must ensure that @start_page belongs to @folio.
> > > + */
> > > +static inline unsigned long folio_remaining_pages(struct folio *folio,
> > > +               struct page *start_page)
> > > +{
> > > +       return folio_nr_pages(folio) - folio_page_idx(folio, start_page);
> > > +}
> > > +
> > >   /* Only hugetlbfs can allocate folios larger than MAX_ORDER */
> > >   #ifdef CONFIG_ARCH_HAS_GIGANTIC_PAGE
> > >   #define MAX_FOLIO_NR_PAGES     (1UL << PUD_ORDER)
> > > diff --git a/mm/gup.c b/mm/gup.c
> > > index 15debead5f5b..14ae2e3088b4 100644
> > > --- a/mm/gup.c
> > > +++ b/mm/gup.c
> > > @@ -242,7 +242,7 @@ static inline struct folio *gup_folio_range_next(struct page *start,
> > >   
> > >          if (folio_test_large(folio))
> > >                  nr = min_t(unsigned int, npages - i,
> > > -                          folio_nr_pages(folio) - folio_page_idx(folio, next));
> > > +                          folio_remaining_pages(folio, next));
> > >   
> > >          *ntails = nr;
> > >          return folio;
> > > diff --git a/mm/page_isolation.c b/mm/page_isolation.c
> > > index b2fc5266e3d2..34e85258060c 100644
> > > --- a/mm/page_isolation.c
> > > +++ b/mm/page_isolation.c
> > > @@ -96,7 +96,7 @@ static struct page *has_unmovable_pages(unsigned long start_pfn, unsigned long e
> > >                                  return page;
> > >                          }
> > >   
> > > -                       skip_pages = folio_nr_pages(folio) - folio_page_idx(folio, page);
> > > +                       skip_pages = folio_remaining_pages(folio, page);
> > >                          pfn += skip_pages - 1;
> > >                          continue;
> > >                  }
> > > ---
> > 
> > Guess I would have pulled the "min" in there, but passing something like 
> > ULONG_MAX for the page_isolation case also looks rather ugly.
> 
> Yes, the page_isolation case does not require the 'min' logic. Since
> there are already places in the current kernel code where
> folio_remaining_pages() is used without needing min, we could simply
> create a custom wrapper function based on folio_remaining_pages() only
> in those specific scenarios where min is necessary.
> 
> Following this line of thinking, the wrapper function in vfio would
> look something like this.
> 
> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -801,16 +801,40 @@ static long vfio_pin_pages_remote(struct vfio_dma *dma, unsigned long vaddr,
>         return pinned;
>  }
>  
> +static inline unsigned long vfio_folio_remaining_pages(
> +               struct folio *folio, struct page *start_page,
> +               unsigned long max_pages)
> +{
> +       if (!folio_test_large(folio))
> +               return 1;

The above two lines may no longer be necessary.

> +       return min(max_pages,
> +                  folio_remaining_pages(folio, start_page));
> +}

Thanks,
Zhe
