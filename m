Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14DA2EA145
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750775641; cv=none; b=jGrVCzRdd5MFgGaL+5pwr59nKhRiZY/I8XMeh5h94Qx/JDaoYQ+Qo5fKZuXvHwrT4/QJOcjQNbZXgYAySiuH6B2JhkEzZw7v6BBaKPmipD+nwuhfA7kV3PcgD/Yh0eidqYo9O9BTBJlxXqyRF7M1XxC4mKMQ8tevtqAUT70taM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750775641; c=relaxed/simple;
	bh=WS7vkHSjkcW4xBeq2eoa2ChPfg79JxQxAebMvkPeoHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lwt4lfBBWI4uNds44+0dy7J/tJSgqfbPUj1kUpEgATEJTIsO791PxB1Qv9wRZn1DO6dwsx8QdINRY9SckvcBFcT1hnzT21aiAY+DLMq2ZQuWXvhmRFYe8IJXYPD0ce2i6o0d5hg9SqLnqBPW4HI894ngVtKqfN3weUBKl6Jokso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HUXB0Rc7; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HUXB0Rc7"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-47e9fea29easo410661cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 07:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750775637; x=1751380437; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=px+6/25zYVIxF5pbO7IhD5/oS5ucz4FqyHM3nhsWCNQ=;
        b=HUXB0Rc71t/kOWT7tolg+8ul5dFHSptR/scvxsKptoa7pt/uMTyHhzNZwvVuECmeDK
         7rKQm6P2vK+/Cj0hqW9Fcwkapw7uKLRZSmXfz2V4TfWpFZU7/cn4cdCemEVCXrCAx00K
         Pawuhko7aU+uuq8AFTfxAHylzIoxNLMJR7FgXTLLzGjhVwbuTPItigEgVKGMhUoS/Z+f
         Lr1FJHIl/2i7FGc3dSPEOWKx7pgEo/BPGKxBsVtQJdf/n3vjw2uI1KCJuARmg+8TqHXF
         YevWbJE4+ebCBXyUuE9nhw49w2KEvxOry1liqOXobRTTIhNWnRiCnbRBl5xJ87z0HGx2
         7AMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750775637; x=1751380437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=px+6/25zYVIxF5pbO7IhD5/oS5ucz4FqyHM3nhsWCNQ=;
        b=Xk1eRzyQwpILQRNTy1QmPh8K/Dm8OEDrxKPW/ufn8fEnG5xO+RaFyxjnkBa7KoPE/g
         NnD8QzsJ3l7gvDxRB89L2B8e69f1eD4OHkNYw3Jdi+WcUs8V0NI4af4lM+ALUjmlf4Eh
         WcISqSAOuZPZecVaC34cvLV+Ivhc8mDVhz7XJ8OJ6JIKCIbGaDudkAdHANhgKqFSLAWQ
         lDMPFM7ZjBMXL1LZOMNXZbbuzDl9Fan5kpgvdQbDmpwVxsxsMs+8LL+BSsP+1q1WRV8P
         DSNXpiUsHBPRH6gBzh/nmj87AL29wSZ6AmmGsfqbN/baLA2wZjhZN1KZY2YlStTdTKw4
         ngTA==
X-Forwarded-Encrypted: i=1; AJvYcCUzLp+rLCNlbYifPdTDzM0s19BSYttQWMpQwcnfmSTPapmsa85Ra0KxXS4+JVumdltMbbKuz6jyXIoFyYg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7gpt4u3gFoKpiXvoyNuaDx1KRKbKfponS2KZOxgqSzOhoYdTE
	NfyGpYc2edsZIQXCSt+k0mhT5zwnbzsrj18Ef6eP8NnVbH6jjhR7TjOgz7XKHPSYhYqZlBhZ7Bf
	h7XBX1Ew6DlFpZcnDIseHVQFLJCtdbEaaCTDpa2jo
X-Gm-Gg: ASbGncuNVaqrKQE/xLG62t4B6lFHah5zCJZtL/GNY/f/47NCTyZyGvvhz7j9/khIM3C
	VLZI13uIgZSw9qS9u1DRloOJQD4rLKW0hHZB6DgSESAd59RF6g6MyRnaDlVoC5zIh4G0tNFWAel
	cGnsZ7fRwZH/6RW2Uie91PXtL7awxT+muq1i572q1SYLINBxVO07sqGs6JCgd3NhEgBrj6QGbjD
	g==
X-Google-Smtp-Source: AGHT+IGLY4ZBK3B6v4Q3itKcyN5ZL8x8XfHH79Wzt7dA2aGWLUgYsOlBtYdOj1HkiKEJTVUwKSwYae0O3YEzIm0vFDQ=
X-Received: by 2002:a05:622a:64a:b0:4a5:a8b7:6c12 with SMTP id
 d75a77b69052e-4a7af8f8945mr4101121cf.26.1750775636917; Tue, 24 Jun 2025
 07:33:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624-anon_name_cleanup-v2-0-600075462a11@suse.cz>
 <20250624-anon_name_cleanup-v2-3-600075462a11@suse.cz> <c6240a90-e02a-4ae2-b144-4fbf82aca6ce@redhat.com>
In-Reply-To: <c6240a90-e02a-4ae2-b144-4fbf82aca6ce@redhat.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 24 Jun 2025 07:33:45 -0700
X-Gm-Features: Ac12FXx3Umpvg01gGoeZg2oSTYWEbXBROMjGNj0OAQWs2jH5wC9nlMqBJW92b5k
Message-ID: <CAJuCfpEBLNH9KKXNYnYL+7AjzfZcrqfFqtsZmMEzn=sa-Zmc3Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] mm, madvise: move madvise_set_anon_name() down the file
To: David Hildenbrand <david@redhat.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Jann Horn <jannh@google.com>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Colin Cross <ccross@google.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 7:05=E2=80=AFAM David Hildenbrand <david@redhat.com=
> wrote:
>
> On 24.06.25 15:03, Vlastimil Babka wrote:
> > Preparatory change so that we can use madvise_lock()/unlock() in the
> > function without forward declarations or more thorough shuffling.

If you respin the series please add a note that there is no functional
change here.

> >
> > Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
> > ---
> >   mm/madvise.c | 64 ++++++++++++++++++++++++++++++---------------------=
---------
> >   1 file changed, 32 insertions(+), 32 deletions(-)
> >
> > diff --git a/mm/madvise.c b/mm/madvise.c
> > index 7e8819b5e9a0f183213ffe19d7e52bd5fda5f49d..cae064479cdf908707c45b9=
41bd03d43d095eab6 100644
> > --- a/mm/madvise.c
> > +++ b/mm/madvise.c
> > @@ -133,38 +133,6 @@ static int replace_anon_vma_name(struct vm_area_st=
ruct *vma,
> >
> >       return 0;
> >   }
> > -
> > -static int madvise_set_anon_name(struct mm_struct *mm, unsigned long s=
tart,
> > -             unsigned long len_in, struct anon_vma_name *anon_name)
> > -{
> > -     unsigned long end;
> > -     unsigned long len;
> > -     struct madvise_behavior madv_behavior =3D {
> > -             .mm =3D mm,
> > -             .behavior =3D __MADV_SET_ANON_VMA_NAME,
> > -             .lock_mode =3D MADVISE_MMAP_WRITE_LOCK,
> > -             .anon_name =3D anon_name,
> > -     };
> > -
> > -     if (start & ~PAGE_MASK)
> > -             return -EINVAL;
> > -     len =3D (len_in + ~PAGE_MASK) & PAGE_MASK;
> > -
> > -     /* Check to see whether len was rounded up from small -ve to zero=
 */
> > -     if (len_in && !len)
> > -             return -EINVAL;
> > -
> > -     end =3D start + len;
> > -     if (end < start)
> > -             return -EINVAL;
> > -
> > -     if (end =3D=3D start)
> > -             return 0;
> > -
> > -     madv_behavior.range.start =3D start;
> > -     madv_behavior.range.end =3D end;
> > -     return madvise_walk_vmas(&madv_behavior);
> > -}
> >   #else /* CONFIG_ANON_VMA_NAME */
> >   static int replace_anon_vma_name(struct vm_area_struct *vma,
> >                                struct anon_vma_name *anon_name)
> > @@ -2109,6 +2077,38 @@ static inline bool is_valid_name_char(char ch)
> >               !strchr(ANON_VMA_NAME_INVALID_CHARS, ch);
> >   }
> >
> > +static int madvise_set_anon_name(struct mm_struct *mm, unsigned long s=
tart,
> > +             unsigned long len_in, struct anon_vma_name *anon_name)
> > +{
> > +     unsigned long end;
> > +     unsigned long len;
> > +     struct madvise_behavior madv_behavior =3D {
> > +             .mm =3D mm,
> > +             .behavior =3D __MADV_SET_ANON_VMA_NAME,
> > +             .lock_mode =3D MADVISE_MMAP_WRITE_LOCK,
> > +             .anon_name =3D anon_name,
> > +     };
> > +
> > +     if (start & ~PAGE_MASK)
> > +             return -EINVAL;
> > +     len =3D (len_in + ~PAGE_MASK) & PAGE_MASK;
> > +
> > +     /* Check to see whether len was rounded up from small -ve to zero=
 */
> > +     if (len_in && !len)
> > +             return -EINVAL;
> > +
> > +     end =3D start + len;
> > +     if (end < start)
> > +             return -EINVAL;
> > +
> > +     if (end =3D=3D start)
> > +             return 0;
> > +
> > +     madv_behavior.range.start =3D start;
> > +     madv_behavior.range.end =3D end;
> > +     return madvise_walk_vmas(&madv_behavior);
> > +}
> > +
> >   int set_anon_vma_name(unsigned long addr, unsigned long size,
> >                     const char __user *uname)
> >   {
> >
>
> Personally, I would squash that into #4, given that #4 is pretty small ;)
>
> Acked-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>

>
> --
> Cheers,
>
> David / dhildenb
>
