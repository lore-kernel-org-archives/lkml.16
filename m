Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E3A26E6F0
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 21:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750888395; cv=none; b=Kh73Y9pQP2ki3bwTso5D8MkftLok6tUsW/psezB467TUxNjCbIoaHfm5RCT7lO2Gq/2F1ProsWtgysuld0s8BKoB/ouHKBmksoHb+F60V+zxs+zp3Bl1eItZ7/x5XHrZPC1ZxXQXiMhWYv99RUQ5DxbZXQUYVlfyA/zg6UqnIf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750888395; c=relaxed/simple;
	bh=h9qSb5HxBjSwMwEcyXzrURojD63UB2KbVe0aFGdN2l4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SvDWi+kjcmBK3lSuq6wDtJnt/2XwOwHvwz0pgjRP/80llmwq977sAewC+hjYpb3tighibwvS6b6ge732DqebNZKC4SDWst9heZRUMM9753iboJ5q7lyXFi9nnP0r5ip6spHyEpmA2h8zmE40f3AEo6ReI6Fcyet2a8a+YUC/ZUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XTJTwDqz; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XTJTwDqz"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-710f39f5cb9so4119897b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 14:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750888393; x=1751493193; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qWi7VS68JCJiJ4n7nNp7sCBvx7AXIU3WxIj8KvmDdzs=;
        b=XTJTwDqzvUqxkcBRErc8HFgKsY16B3YNVZHPVBGHBpCRP5myvowRPIcpdBRKp7579W
         15ujo1EyZhSVF8LKPLTmQxeCrckDP04OJEgWSCPf7Umy+/hiMfjsfc9ymyYzW9KweLoC
         e1rXZFeDgaO2jf0z8iNT3XIqbUcCQeiMcPK+UWexAEF4IstLigBMWe1LSfsd6d1M/R1Q
         OyhnI0kuzR4fUaYZZ1vyCZg+WxLZXBO1HCr2K8Iag5odA0d3WgLyVNXj8d7peCqdDVXQ
         Lf9PGHsqRHBnvvUEWqj4D5Q2/ydyYIbY/J7BilpnP9WCMnlKu6wfle07bGSry7BjBaCs
         tghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750888393; x=1751493193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qWi7VS68JCJiJ4n7nNp7sCBvx7AXIU3WxIj8KvmDdzs=;
        b=pANBmMofd5UGd3C8KIHCgtay4XbeSb4JazPjWx41v4EvQrTGjFYvkPFVKpUhmT0ppj
         P+oE0CWlxrZnHQh4vTGoKbCdTf/vuypvrBkgPld7RJWwIdNE98iGM/K8ROFDFT3HUHNv
         aoMSNn+IqYERpl/eW3z7BlTFZKM6cLzlCHKkKuLUv6kmpyM3TpJz2QWFgIrvUDTqIVAo
         78FEj6PjGalXSRRjAU/RNxXMJ6HE/oqRmpFKy9yGpMwogF1M5TtiV1jse/dI+6hmepAa
         dWE6nwlEjRfFOkxHMnPY1Lc3ewoNbURusJkGVq+Oyx9UT/oDcHeIAnrgOP4fSTGzyHWX
         L93A==
X-Forwarded-Encrypted: i=1; AJvYcCVeCR2Bg8HSywcML2JN+CihV0iHix9AHHeOzwpD1DzlDoiBrq2b+SBVb6NjEUDZyOQQ8hWHkvxRCz+e1pA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3Ym1ToT3MDJ7XdD7yIQzskwxUZwh1hxIa3EZHVPCKuw8KiZwI
	/E9Y3rqHcAuVfBgTRyfdoi6B5DHDLE2CXXYQClj3UM2OJBeNPVwFO8JWtk81w6k7FWJ7xf6nedJ
	5+h3teGfrLrP6NFYmPON8MBVTpuG5KbHJAPS9ph9v
X-Gm-Gg: ASbGnctpEKUdIWXFD5/xnIuYguHa63p26bA/zdZy3Q2NWOHuDYK5vO7EcfCLhOOip+R
	NsraEd1QaUG7QLbdDItNY7nO0fizh0Wqd1mJ7xnpW+ZAruiywKxTR3G+cNBrx6BBNlcm5roXB9D
	Oaqrds3yinziOiIZhjYumOiK/qKYhXDKxKg/26CKT4/16wPFosLtUSJzfBWu2wc2Wh0TW7FJcW
X-Google-Smtp-Source: AGHT+IEE+CqH2S/1hl8wpZ9lOiJWAvunz/7I5rI37rX3CMwOVbWSsZDph+Usnj4r6Sb+yD24axNzgewxGSCafBX1EV0=
X-Received: by 2002:a05:690c:9a93:b0:712:36f3:f6d7 with SMTP id
 00721157ae682-715087b2b59mr30192347b3.32.1750888392659; Wed, 25 Jun 2025
 14:53:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620190342.1780170-1-peterx@redhat.com> <20250620190342.1780170-5-peterx@redhat.com>
 <CADrL8HVZccikHRZ+PP4EfKQBkgXZ0E9S3GFtwWVYLD2NMhg7EA@mail.gmail.com> <aFxoSzdDGRkYLyr2@x1.local>
In-Reply-To: <aFxoSzdDGRkYLyr2@x1.local>
From: James Houghton <jthoughton@google.com>
Date: Wed, 25 Jun 2025 14:52:36 -0700
X-Gm-Features: Ac12FXx9P-x9q79zO7IJW5v6WPEy_7cefnTsv5aEQX3ADRGfEBKFHjCxHQFCpRc
Message-ID: <CADrL8HUUt8D9Tg5uR0e7ig02F7z6ZZFiJp6d8rYROoF54sD61Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] mm: Apply vm_uffd_ops API to core mm
To: Peter Xu <peterx@redhat.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Nikita Kalyazin <kalyazin@amazon.com>, Hugh Dickins <hughd@google.com>, 
	Oscar Salvador <osalvador@suse.de>, Michal Hocko <mhocko@suse.com>, 
	David Hildenbrand <david@redhat.com>, Muchun Song <muchun.song@linux.dev>, 
	Andrea Arcangeli <aarcange@redhat.com>, Ujwal Kundur <ujwal.kundur@gmail.com>, 
	Suren Baghdasaryan <surenb@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@suse.cz>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Mike Rapoport <rppt@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Axel Rasmussen <axelrasmussen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 2:21=E2=80=AFPM Peter Xu <peterx@redhat.com> wrote:
>
> On Wed, Jun 25, 2025 at 01:31:49PM -0700, James Houghton wrote:
> > > -static inline bool vma_can_userfault(struct vm_area_struct *vma,
> > > -                                    unsigned long vm_flags,
> > > -                                    bool wp_async)
> > > +static inline const vm_uffd_ops *vma_get_uffd_ops(struct vm_area_str=
uct *vma)
> > >  {
> > > -       vm_flags &=3D __VM_UFFD_FLAGS;
> > > -
> > > -       if (vma->vm_flags & VM_DROPPABLE)
> > > -               return false;
> > > -
> > > -       if ((vm_flags & VM_UFFD_MINOR) &&
> > > -           (!is_vm_hugetlb_page(vma) && !vma_is_shmem(vma)))
> > > -               return false;
> > > -
> > > -       /*
> > > -        * If wp async enabled, and WP is the only mode enabled, allo=
w any
> > > -        * memory type.
> > > -        */
> > > -       if (wp_async && (vm_flags =3D=3D VM_UFFD_WP))
> > > -               return true;
> > > -
> > > -#ifndef CONFIG_PTE_MARKER_UFFD_WP
> > > -       /*
> > > -        * If user requested uffd-wp but not enabled pte markers for
> > > -        * uffd-wp, then shmem & hugetlbfs are not supported but only
> > > -        * anonymous.
> > > -        */
> > > -       if ((vm_flags & VM_UFFD_WP) && !vma_is_anonymous(vma))
> > > -               return false;
> > > -#endif
> >
> > Hi Peter,
> >
> > Thanks for this cleanup!
> >
> > It looks like the above two checks, the wp-async one and the PTE
> > marker check, have been reordered in this patch. Does this result in a
> > functional difference?
> >
> > The rest of this series looks fine to me. :)
>
> Thanks for the very careful review, James!
>
> Yes that's a small tweak I did when moving. I don't expect to have any
> functional change.  Maybe I should at least mention that in the commit lo=
g.

Yeah if you could leave a small explanation, like what you have below,
in the commit log, that would be good. :)

>
> Here I did the movement because fundamentally wp_async depends on the pte
> markers, so it may be slightly more intuitive to check pte markers first,
> rejecting any form of file wr-protect traps.  Otherwise it may looks like
> we could return the true for wp_async=3D=3Dtrue too early.  In reality II=
UC it
> can't happen.
>
> For example, currently userfaultfd_api() has:
>
> #ifndef CONFIG_PTE_MARKER_UFFD_WP
>         uffdio_api.features &=3D ~UFFD_FEATURE_WP_HUGETLBFS_SHMEM;
>         uffdio_api.features &=3D ~UFFD_FEATURE_WP_UNPOPULATED;
>         uffdio_api.features &=3D ~UFFD_FEATURE_WP_ASYNC;
> #endif

Ah, I see, thanks!

> So when wp_async can be true above, pte markers must be compiled..  IOW,
> above code clip should work identically with below lines:
>
>     #ifdef CONFIG_PTE_MARKER_UFFD_WP
>        if (wp_async && (vm_flags =3D=3D VM_UFFD_WP))
>             return true;
>     #endif
>
>     #ifndef CONFIG_PTE_MARKER_UFFD_WP
>         if ((vm_flags & VM_UFFD_WP) && !vma_is_anonymous(vma))
>             return false;
>     #endif
>
> Then it means both chunks of code cannot be compiled together.  The order
> shouldn't matter.
>
> But maybe I should just move it back as before, to save the explain and
> confusions.  Let me know if you have any preference.

Feel free to leave this patch as it is, that's fine. Thanks for the
explanation. :)

If you'd like, feel free to add:

Reviewed-by: James Houghton <jthoughton@google.com>
