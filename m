Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787A32BDC09
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 15:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747150724; cv=none; b=cHaibBrJCwkeStb5cWe0SvWGBSgMj7RccxXix/cGhKuVJn39aWkQJA8d7VPe7z9flaBG+qfN6U3Yh21d1kMLs7k2I6wkrOCqSWso6OboJEEHcGrDQS2yMo/o5oC5VkGUJlDuggblEm3vdsFKExAUFhd6ZsR7N7RV3GO+mS/4/I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747150724; c=relaxed/simple;
	bh=+iXXgL4gr8KPYDv9/e7RFbUo5M19orzShFShoavpw88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=PmvqXaPxJAkFUpUaCAbc24nbWjeDLQZwRvmeQibBcYcKRplIMUain54rkvKmNjLD99lnXVQtWeI8e0Zkdbyh5UoQK7lRDDUr38jx1lb8ev5GYwJfVW54e7d5zk6Qj9iTsojAz+wxCXEbQEvKhRlCDCG3ub2yAYIUj60o5xUb1xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pvsJuyhn; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pvsJuyhn"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-48b7747f881so358761cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 08:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747150721; x=1747755521; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89y90/kYEAF6o+kMHPOusZlookMeFzeAB2+XdecwNJU=;
        b=pvsJuyhnthP36mpKtFRwOuGdagEFkSpcv5CG9cVRWKoO6+E+AjXyWrAodHH4ZxBUGQ
         VaROaGwfeuDTVcDwXZrwm/kGSlboFRbky06MAHhNerZaNYYosvcfFjxrw5lQ0gsN8hve
         NlRdSKM1qmnkrBnG9R61in2tfCgGkIJQdQ+UNE6/tjgcuilNN0hSnIDbUrzjuZDUrtK/
         jmCK+Nj2daEBFWql6RNWaM9K9hnhHRLFcHSb5yyMzjNvmhO+Ubg2krUh8MP5zmVeiQJ+
         PEt8zzdJ79zrOXUT49wsy2CNY6qIbw3Yf0tJjKUEKmgtLYUNUr8CBr63AAz3QkzrhzMv
         BBnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747150721; x=1747755521;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=89y90/kYEAF6o+kMHPOusZlookMeFzeAB2+XdecwNJU=;
        b=LsglyXEmjuPlj5Eews5X2yS+wc9qLbXzEk0eKEka+2V26vVaxTyDCxzpiWe6MmXwZf
         KUpClmAbcZqafLpr21OhTA+omA+iG73kDllkybE3mEkd3dkrfwRZsv+nFdF+iN0wunTR
         c1CvirExo5VJ/u1ciz/kpI7pp3QAYBzy+NKK4iKKUtIFPE6Yh7upz3hiEvVH9MBi9WLV
         Lyv95jW8wczTUoV2Ek0YZhzsFGpnG/N2Dq4FLTTWjBXZaAiA2PyDCxVE8HnkxVH94Xvy
         ar0IAIY5zxpaeKcmC9YEiiR761kuQnQpg7356/Smgn6v7HvJrCYp3P9ezZlSf6d9YN8+
         Hu3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVcQQJGkwmvX5TotUboDG6sOXQ1QkHv1Wl+BA92SDDMx/n/+kbwm+XWHtOab9CpuE8xZoNYQst5Ji4KoGc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh72Nf6HHAEhMYfM2vWxTA1MNFSANAb+ILQ0sRhBg/5m8hij9K
	CzSzjK7HqXAYIvcA4Jl8vdGZIZJfkpULL07qC9HdhQt62/oK6BljbAUepNP5oI7eItrR+9Ja1yE
	YWCJrLGipebqzedct0ZebEkurkBckyucMpH/boQQO
X-Gm-Gg: ASbGncu03v8NSzevDLIC5P+XVm9M5JA2PEkL4zgTfuLT9H2nMHi+QlRlxpBrU0k9FL9
	dI394CZfGMPAqhAU8MElJRzBCXOXOkow9y1Xt7bRQTjabJprSUsVcoqmA1sWeCPOJ0tqXuHD9cs
	NS31toqNOR5VBYOc9q5KQPLbrtndej6BbHLG/XoQF5Nmw1mN1GoKEn2elduJG4
X-Google-Smtp-Source: AGHT+IEGe3y7C/3dEYNxkfLLRp1t4I353MK1YI+azNL4dTTRCLF/nBxhIhBEqvLjXbiBNaH44EYUd3wPgMy+iFeei/0=
X-Received: by 2002:ac8:598d:0:b0:466:8c23:823a with SMTP id
 d75a77b69052e-494898efdb9mr3460091cf.17.1747150720836; Tue, 13 May 2025
 08:38:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1746792520.git.lorenzo.stoakes@oracle.com>
 <d5d8fc74f02b89d6bec5ae8bc0e36d7853b65cda.1746792520.git.lorenzo.stoakes@oracle.com>
 <bfd5b4co3ha32m7z7fo7rm2uhaqcunn7zqgywonm54wi2iakpb@zogdqwo4722c>
In-Reply-To: <bfd5b4co3ha32m7z7fo7rm2uhaqcunn7zqgywonm54wi2iakpb@zogdqwo4722c>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 13 May 2025 08:38:28 -0700
X-Gm-Features: AX0GCFu_sNznUsLr1ugO_DiPLuhx2Qpcv2QmJwH3d9RiFtZ1VEMUc2w3eNQQQs0
Message-ID: <CAJuCfpHCZS-goD88VhKU1ovuZbOnQk6aWBHnEPu2HsBxfT+xzQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mm/vma: remove mmap() retry merge
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 6:25=E2=80=AFAM Liam R. Howlett <Liam.Howlett@oracl=
e.com> wrote:
>
> * Lorenzo Stoakes <lorenzo.stoakes@oracle.com> [250509 08:14]:
> > We have now introduced a mechanism that obviates the need for a reattem=
pted
> > merge via the mmap_prepare() file hook, so eliminate this functionality
> > altogether.
> >
> > The retry merge logic has been the cause of a great deal of complexity =
in
> > the past and required a great deal of careful manoeuvring of code to en=
sure
> > its continued and correct functionality.
> >
> > It has also recently been involved in an issue surrounding maple tree
> > state, which again points to its problematic nature.
> >
> > We make it much easier to reason about mmap() logic by eliminating this=
 and
> > simply writing a VMA once. This also opens the doors to future optimisa=
tion
> > and improvement in the mmap() logic.
> >
> > For any device or file system which encounters unwanted VMA fragmentati=
on
> > as a result of this change (that is, having not implemented .mmap_prepa=
re
> > hooks), the issue is easily resolvable by doing so.
> >
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > Reviewed-by: David Hildenbrand <david@redhat.com>
>
> I have a few tests for the vma test suite that would test this path.
> I'll just let them go.
>
> Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>

>
> > ---
> >  mm/vma.c | 14 --------------
> >  1 file changed, 14 deletions(-)
> >
> > diff --git a/mm/vma.c b/mm/vma.c
> > index 3f32e04bb6cc..3ff6cfbe3338 100644
> > --- a/mm/vma.c
> > +++ b/mm/vma.c
> > @@ -24,7 +24,6 @@ struct mmap_state {
> >       void *vm_private_data;
> >
> >       unsigned long charged;
> > -     bool retry_merge;
> >
> >       struct vm_area_struct *prev;
> >       struct vm_area_struct *next;
> > @@ -2417,8 +2416,6 @@ static int __mmap_new_file_vma(struct mmap_state =
*map,
> >                       !(map->flags & VM_MAYWRITE) &&
> >                       (vma->vm_flags & VM_MAYWRITE));
> >
> > -     /* If the flags change (and are mergeable), let's retry later. */
> > -     map->retry_merge =3D vma->vm_flags !=3D map->flags && !(vma->vm_f=
lags & VM_SPECIAL);

Could we have a WARN_ON() here please? I know you took care of in-tree
drivers but if an out-of-tree driver does this there will be no
indication that it has to change its ways. I know we don't care about
out-of-tree ones but they still exist, so maybe we can be nice here
and issue a warning?

> >       map->flags =3D vma->vm_flags;
> >
> >       return 0;
> > @@ -2622,17 +2619,6 @@ static unsigned long __mmap_region(struct file *=
file, unsigned long addr,
> >       if (have_mmap_prepare)
> >               set_vma_user_defined_fields(vma, &map);
> >
> > -     /* If flags changed, we might be able to merge, so try again. */
> > -     if (map.retry_merge) {
> > -             struct vm_area_struct *merged;
> > -             VMG_MMAP_STATE(vmg, &map, vma);
> > -
> > -             vma_iter_config(map.vmi, map.addr, map.end);
> > -             merged =3D vma_merge_existing_range(&vmg);
> > -             if (merged)
> > -                     vma =3D merged;
> > -     }
> > -
> >       __mmap_complete(&map, vma);
> >
> >       return addr;
> > --
> > 2.49.0
> >
