Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B025E442C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750850144; cv=none; b=Dlx1294s/69RT2L5CPdW3CeangL2NRnIHeNECqCropRdsuybm+YZhm5W2HvT+9w5TEhFAE5WSvUv9STpWgwQm21ESiBrF9j0FiIxABduiZxGMaEB+BAl/lrnJQ0iNxp+EVxrL1mYcodjo/WUeqoQsrwskZMXW+v+M8REuvvBuEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750850144; c=relaxed/simple;
	bh=Ssy1fHqF63DEDck2koQnOEBEokat+2hmWr7pLt8BeTs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J2cTG7gDy2Uytr4YxZeiACYlrYsFalMt6nH39FJvz8nwis+3FooD/OVxSN+nsCV0KgxbHIMPL80JjMNms3qwWTesB2CswTIN1zRLAy/7Nz7metvD9JmNahP2pmljBC1gusfwT51sxGT49ZQmhOrI2375sf85xl2s4Xf3/S8r+7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eWJVqhVB; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eWJVqhVB"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-528ce9730cfso1919747e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 04:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750850140; x=1751454940; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UzzWoBYzuELzHA/ZeU/yfgoxYFcBOEqkCLdhulSDso8=;
        b=eWJVqhVBUqKUpS8TiYzDUuvaYERQMGlhzSuQuGokUpI6XTwMi3AUOyZzzWhFTBBXWi
         jL92fEeCjXlfFt3fHXq4RDZi6SwyRuRgcJXljFG4ouWrfUwP6jrUjyZ1tbA55o2N1LWW
         /GlXzMZqUUgpuSbSjpevbhXCc8vHheMy4L/7hOUtVUKg3+RmhFBIp7yAQD8fdoJpJh86
         QT6e8Os/uCmy6WyKvWAud0x/tmtZ9DMkHNL0H/FXM8v/go3izhUIL4TzE7mgGSQ6GNRw
         57Orl9qlgYxaczv9iZfP7E4gpvTnj0v7JaLy3ChzpVkW8ylOt7/eHGwHGvLkhDUqYseD
         Fmkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750850140; x=1751454940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UzzWoBYzuELzHA/ZeU/yfgoxYFcBOEqkCLdhulSDso8=;
        b=YJirUmqhp4r8m7jEMpqV9OegjdYFoemfgG49o4yEblv71bDZuk9g/FwUm1QNLkWT+U
         ArqnFrVqOYioIX3TMZ6pwAt/Q7QxtUaeyCwSmrMa8rBZOf+iyXqfI/UCUutvQZlj3dsa
         8BxjTyaI9NpIeNN5I2LOlehSD9gSRpjxQL+wiu2WCUY+VfFNmpnRs3erFZ0CZB57cyqY
         yn2VGeVpmdBU/WwFv9PqOfWcRmwcER4Gn7n7oq8UJizLkYDe3g8WpG8xpSz4ZykoDH9u
         bWQanYASBcEjCpApqAkIV/rBYGHPYw0PQPGgnMkZlK2OzUoA0NWOdD82br3hdPyw2hOi
         eQcw==
X-Forwarded-Encrypted: i=1; AJvYcCWfFF0WXJD3VCK/K2kxaqBLCVk6JnkaMO6YvPOU6KvHRhKT3OQlXmwZuOVJMpDa1fM6n0krEMWGD1UScsg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyal/n9WwB2a7mGD3gDDzSQIEv1Wd81lY2gokY5uLnrAlA58O+Y
	Px2ARjrwQqfjlPYepXu9ZBTDcKX7nVknQ4IBf/d+UUbqvUIKNDiTwmVIkT39UzuRKEYgYZjRO1J
	F4+oGDQM7f8xvitK6LWvdoIjT4sknvLWCl8Zl
X-Gm-Gg: ASbGncu33DRZKY1EOI/dK9n1A1CUmE417iw9gOQ7XAIotqOmQA0uF0ro6FwK/x7j3iE
	/wruhJoC4P+GG1Wcv8WZukbG9O4zugNf5wjHqF3bnA2cUinUNKJHfpi8lrTJ5Wdk6Mdyiwb3bM5
	W/xZhg0hfJOzi+Raodx1RMBeUjHwCq0Gary06zpXYHpdt2fM5kVYZrKQ==
X-Google-Smtp-Source: AGHT+IHwxdbJNROelzY3OknT3azAp92ywQE88MfIFFnBydzATnoYswUHYfRj+B3vYRzmFHBdJZPqRWnqwsEAdwdY54w=
X-Received: by 2002:a05:6122:1ac9:b0:531:19ee:93ea with SMTP id
 71dfb90a1353d-532ef208beamr1331489e0c.0.1750850140366; Wed, 25 Jun 2025
 04:15:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2c19a6cf-0b42-477b-a672-ed8c1edd4267@redhat.com>
 <20250624162503.78957-1-ioworker0@gmail.com> <27d174e0-c209-4851-825a-0baeb56df86f@redhat.com>
 <938c4726-b93e-46df-bceb-65c7574714a6@linux.dev> <CAGsJ_4y1GObH-C7R=FQL=UWe3kF6qhKoRqPxNPYx0k7uwocc+g@mail.gmail.com>
 <5ba95609-302b-456a-a863-2bd5df51baf2@redhat.com>
In-Reply-To: <5ba95609-302b-456a-a863-2bd5df51baf2@redhat.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 25 Jun 2025 23:15:29 +1200
X-Gm-Features: Ac12FXzIwn089IFe1tMYOckn8MZY5eni2aX8dcGFabAwMmxZ1sP0z4GGek9WzJY
Message-ID: <CAGsJ_4zSGT05GjxM1H6JwSa5MhgtxaiYVa1Wtvm8+SmYkm=jmQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
To: David Hildenbrand <david@redhat.com>
Cc: Lance Yang <lance.yang@linux.dev>, akpm@linux-foundation.org, 
	baolin.wang@linux.alibaba.com, chrisl@kernel.org, kasong@tencent.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com, 
	x86@kernel.org, ying.huang@intel.com, zhengtangquan@oppo.com, 
	Lance Yang <ioworker0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 11:01=E2=80=AFPM David Hildenbrand <david@redhat.co=
m> wrote:
>
> On 25.06.25 12:57, Barry Song wrote:
> >>>
> >>> Note that I don't quite understand why we have to batch the whole thi=
ng
> >>> or fallback to
> >>> individual pages. Why can't we perform other batches that span only s=
ome
> >>> PTEs? What's special
> >>> about 1 PTE vs. 2 PTEs vs. all PTEs?
> >>
> >> That's a good point about the "all-or-nothing" batching logic ;)
> >>
> >> It seems the "all-or-nothing" approach is specific to the lazyfree use
> >> case, which needs to unmap the entire folio for reclamation. If that's
> >> not possible, it falls back to the single-page slow path.
> >
> > Other cases advance the PTE themselves, while try_to_unmap_one() relies
> > on page_vma_mapped_walk() to advance the PTE. Unless we want to manuall=
y
> > modify pvmw.pte and pvmw.address outside of page_vma_mapped_walk(), whi=
ch
> > to me seems like a violation of layers. :-)
>
> Please explain to me why the following is not clearer and better:

This part is much clearer, but that doesn=E2=80=99t necessarily improve the=
 overall
picture. The main challenge is how to exit the iteration of
while (page_vma_mapped_walk(&pvmw)).

Right now, we have it laid out quite straightforwardly:
                /* We have already batched the entire folio */
                if (nr_pages > 1)
                        goto walk_done;

with any nr between 1 and folio_nr_pages(), we have to consider two issues:
1. How to skip PTE checks inside page_vma_mapped_walk for entries that
were already handled in the previous batch;
2. How to break the iteration when this batch has arrived at the end.

Of course, we could avoid both, but that would mean performing unnecessary
checks inside page_vma_mapped_walk().

We=E2=80=99ll still need to introduce some =E2=80=9Ccomplicated=E2=80=9D co=
de to address the issues
mentioned above, won=E2=80=99t we?

>
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 8200d705fe4ac..09e2c2f28aa58 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1845,23 +1845,31 @@ void folio_remove_rmap_pud(struct folio *folio, s=
truct page *page,
>   #endif
>   }
>
> -/* We support batch unmapping of PTEs for lazyfree large folios */
> -static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
> -                       struct folio *folio, pte_t *ptep)
> +static inline unsigned int folio_unmap_pte_batch(struct folio *folio,
> +               struct page_vma_mapped_walk *pvmw, enum ttu_flags flags,
> +               pte_t pte)
>   {
>          const fpb_t fpb_flags =3D FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIR=
TY;
> -       int max_nr =3D folio_nr_pages(folio);
> -       pte_t pte =3D ptep_get(ptep);
> +       struct vm_area_struct *vma =3D pvmw->vma;
> +       unsigned long end_addr, addr =3D pvmw->address;
> +       unsigned int max_nr;
> +
> +       if (flags & TTU_HWPOISON)
> +               return 1;
> +       if (!folio_test_large(folio))
> +               return 1;
> +
> +       /* We may only batch within a single VMA and a single page table.=
 */
> +       end_addr =3D min_t(unsigned long, ALIGN(addr + 1, PMD_SIZE), vma-=
>vm_end);
> +       max_nr =3D (end_addr - addr) >> PAGE_SHIFT;
>
> +       /* We only support lazyfree batching for now ... */
>          if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
> -               return false;
> +               return 1;
>          if (pte_unused(pte))
> -               return false;
> -       if (pte_pfn(pte) !=3D folio_pfn(folio))
> -               return false;
> -
> -       return folio_pte_batch(folio, addr, ptep, pte, max_nr, fpb_flags,=
 NULL,
> -                              NULL, NULL) =3D=3D max_nr;
> +               return 1;
> +       return folio_pte_batch(folio, addr, pvmw->pte, pte, max_nr, fpb_f=
lags,
> +                              NULL, NULL, NULL);
>   }
>
>   /*
> @@ -2024,9 +2032,7 @@ static bool try_to_unmap_one(struct folio *folio, s=
truct vm_area_struct *vma,
>                          if (pte_dirty(pteval))
>                                  folio_mark_dirty(folio);
>                  } else if (likely(pte_present(pteval))) {
> -                       if (folio_test_large(folio) && !(flags & TTU_HWPO=
ISON) &&
> -                           can_batch_unmap_folio_ptes(address, folio, pv=
mw.pte))
> -                               nr_pages =3D folio_nr_pages(folio);
> +                       nr_pages =3D folio_unmap_pte_batch(folio, &pvmw, =
flags, pteval);
>                          end_addr =3D address + nr_pages * PAGE_SIZE;
>                          flush_cache_range(vma, address, end_addr);
>
>
> --
> Cheers,
>
> David / dhildenb
>

Thanks
Barry
