Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04F5289368
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 15:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745595270; cv=none; b=Rqz0ZMeBC83qQE7tfUV90UJsg+dGatDaB0VqyjnqfF9BkNyMkrgT4RTWvgf16Sj9ZL08V+Ks9nIw2kiCsIySbQcCjLV2YQzt1HRjx5hsowLnQlVb1LAyMRoATfKnIVJIIBA7dvMgZ9sQkj66gKNXxuxJZh18HlS82gpxiwpt27M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745595270; c=relaxed/simple;
	bh=0jK06R2qLurz+wi/sMT+CchnLf1TN2lsnDN5h1VaYpA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=uAyS1yfPcR7Eyf4TeJdms0nq+1nS3QxsFVxvO1/qfRQbPm4sNcjwpReqWcuzSABtHeVhIOWJTXAML0eVJqwUcTSixoEBAV2xyXlYs+jHkXhLVZYh1j31rsq5BOz84ixc3O9LuN6mgnHZdF0GikpGqfeevwZGVZiArpzMC3KFn50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EsapinBE; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EsapinBE"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-47666573242so432341cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 08:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745595268; x=1746200068; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5/jbEJKCj61SS9UYhrPT3xCuMZt1d5yjdn5+6M7u7I=;
        b=EsapinBE1E1Fxy3neslFSWWmJFW3wDWCjQbzVl1YnFr5W/SG0xw6UPSueWlmBAXuDG
         tr5WLPwkO0O9rZsd0ZpSMA97L061ansk2Tcrgtah1fmlMFbqPoijMEpG8lmpFm+3XLhn
         qx/7hWx9aC5bNydgEnsloJRo5jmO+m+gMnbB+c2fbK7Z2CiBNyDrP0/fqPRs3e/J/wdd
         5AtP6W6COcPmh38HWoEm38ClBe23eJWNnbV62dIffizJcF98Cl8ErmkjNC79i5z4zQe6
         FwFNs/cm4KW5cU509jN/F9DMKDnhuLj+SG9TXv7hZELLWQAlu5+0y2p0suWxqmDVDfZy
         RCaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745595268; x=1746200068;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g5/jbEJKCj61SS9UYhrPT3xCuMZt1d5yjdn5+6M7u7I=;
        b=QHsRXtZ3hr5gTv+hRJCr6SNAbI3wSwNHpcxiz99MsoRoPQ/U0LLykUzYl8xm7KHlPm
         0wtQ8EKqoKtKzA6GxAIL4nASn5zrNa38CyUiIShl5J+koITCPvhTy7LOrxPLjMJij2uL
         2ORkfEMxvzmliHTexZWi5srbMKhaZeHv7gqpyunIHSYDS/z4uL+e1GEO8vrIVznx9SLY
         pe/B4oR8demQXrbVCp1KtuZ5zqboWOJTrgUXLx3FnLBAWi9UlJ8Up5uAE5FhfwQE4BnD
         EVLn5y6+ewOKsRxvjxok/ISS/4euQReXhW1hw0wZxWo7zANSXRdrNCMQWU4VEhkOj1ov
         jj5A==
X-Forwarded-Encrypted: i=1; AJvYcCW/5Z6Ch5MTMz8uiEiiOwtMKF7bkHf6a2yXdmaZnl2avEuTBdTsvLex43a9VRUDR6VR0ylhhWrU6azDIPI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzORqP0QEdKxKDtpBXBPuqc+ZBq+tthCJrnNL9RdH9DbD+72NhL
	tt3cGx53/Jv6aO3PrNOkfxbctjGfHYz20PUj6h/HjTmL8FSvr8N8IYL2ZZJCmPZPx6OOuI+X3jI
	W7OOSy948e7w/TxX7AzmYXQjaFecQa7bFaEgr
X-Gm-Gg: ASbGnctBl6g6sHyQBgtrSTUojUiM3a5Ki2RRJqO9vZ3/4OED23Sj65qxVGnAT+U8rj/
	8GOJlhkVoRGwL5jvTV8qGy4iF5ewKkEEw+xJeYPbrxaT2kzdX3s/g3n5xP6FSm0xzj02vThP4Vm
	Qac6GLLTjb1nXgw8RiOzXa
X-Google-Smtp-Source: AGHT+IFaLY3s0izE7nmgvYKPlu8fJRpk84aR32fIsczDTeevwRZvaPztL4MnBjYx9gEAYjD/NulcuZ/Xj53z+YfAbTw=
X-Received: by 2002:a05:622a:230d:b0:475:1410:2ca3 with SMTP id
 d75a77b69052e-4800d34c448mr3287071cf.15.1745595267360; Fri, 25 Apr 2025
 08:34:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1745528282.git.lorenzo.stoakes@oracle.com>
 <0f848d59f3eea3dd0c0cdc3920644222c40cffe6.1745528282.git.lorenzo.stoakes@oracle.com>
 <51903B43-2BFC-4BA6-9D74-63F79CF890B7@kernel.org> <7212f5f4-f12b-4b94-834f-b392601360a3@lucifer.local>
 <n6lrbjs4o6luzl3fydpo4frj35q6kvoz74mhlyae5gp7t5loyy@ubmfmzwfhnwq> <CAJuCfpErtLvktCsbFSGmrT_zir9z0g+uuVvhr=QEitA7ARkdkw@mail.gmail.com>
In-Reply-To: <CAJuCfpErtLvktCsbFSGmrT_zir9z0g+uuVvhr=QEitA7ARkdkw@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 25 Apr 2025 08:34:16 -0700
X-Gm-Features: ATxdqUFzDiR6aSNEgXYvKyPF3vMF5nNp5WgPe7-q3Zd9yW0scIDZAX7G0iFsnAY
Message-ID: <CAJuCfpGtz-gXur2mNaa8NW-V=dk5oKfgYXAXzNMuv-Aq7Qg-bA@mail.gmail.com>
Subject: Re: [PATCH 2/4] mm: perform VMA allocation, freeing, duplication in mm
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Kees Cook <kees@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	David Hildenbrand <david@redhat.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 8:32=E2=80=AFAM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Fri, Apr 25, 2025 at 6:55=E2=80=AFAM Liam R. Howlett <Liam.Howlett@ora=
cle.com> wrote:
> >
> > * Lorenzo Stoakes <lorenzo.stoakes@oracle.com> [250425 06:40]:
> > > On Thu, Apr 24, 2025 at 08:15:26PM -0700, Kees Cook wrote:
> > > >
> > > >
> > > > On April 24, 2025 2:15:27 PM PDT, Lorenzo Stoakes <lorenzo.stoakes@=
oracle.com> wrote:
> > > > >+static void vm_area_init_from(const struct vm_area_struct *src,
> > > > >+                        struct vm_area_struct *dest)
> > > > >+{
> > > > >+  dest->vm_mm =3D src->vm_mm;
> > > > >+  dest->vm_ops =3D src->vm_ops;
> > > > >+  dest->vm_start =3D src->vm_start;
> > > > >+  dest->vm_end =3D src->vm_end;
> > > > >+  dest->anon_vma =3D src->anon_vma;
> > > > >+  dest->vm_pgoff =3D src->vm_pgoff;
> > > > >+  dest->vm_file =3D src->vm_file;
> > > > >+  dest->vm_private_data =3D src->vm_private_data;
> > > > >+  vm_flags_init(dest, src->vm_flags);
> > > > >+  memcpy(&dest->vm_page_prot, &src->vm_page_prot,
> > > > >+         sizeof(dest->vm_page_prot));
> > > > >+  /*
> > > > >+   * src->shared.rb may be modified concurrently when called from
> > > > >+   * dup_mmap(), but the clone will reinitialize it.
> > > > >+   */
> > > > >+  data_race(memcpy(&dest->shared, &src->shared, sizeof(dest->shar=
ed)));
> > > > >+  memcpy(&dest->vm_userfaultfd_ctx, &src->vm_userfaultfd_ctx,
> > > > >+         sizeof(dest->vm_userfaultfd_ctx));
> > > > >+#ifdef CONFIG_ANON_VMA_NAME
> > > > >+  dest->anon_name =3D src->anon_name;
> > > > >+#endif
> > > > >+#ifdef CONFIG_SWAP
> > > > >+  memcpy(&dest->swap_readahead_info, &src->swap_readahead_info,
> > > > >+         sizeof(dest->swap_readahead_info));
> > > > >+#endif
> > > > >+#ifdef CONFIG_NUMA
> > > > >+  dest->vm_policy =3D src->vm_policy;
> > > > >+#endif
> > > > >+}
> > > >
> > > > I know you're doing a big cut/paste here, but why in the world is t=
his function written this way? Why not just:
> > > >
> > > > *dest =3D *src;
> > > >
> > > > And then do any one-off cleanups?
> > >
> > > Yup I find it odd, and error prone to be honest. We'll end up with un=
initialised
> > > state for some fields if we miss them here, seems unwise...
> > >
> > > Presumably for performance?
> > >
> > > This is, as you say, me simply propagating what exists, but I do wond=
er.
> >
> > Two things come to mind:
> >
> > 1. How ctors are done.  (v3 of Suren's RCU safe patch series, willy mad=
e
> > a comment.. I think)
> >
> > 2. Some race that Vlastimil came up with the copy and the RCU safeness.
> > IIRC it had to do with the ordering of the setting of things?
> >
> > Also, looking at it again...
> >
> > How is it safe to do dest->anon_name =3D src->anon_name?  Isn't that re=
f
> > counted?
>
> dest->anon_name =3D src->anon_name is fine here because right after
> vm_area_init_from() we call dup_anon_vma_name() which will bump up the
> refcount. I don't recall why this is done this way but now looking at
> it I wonder if I could call dup_anon_vma_name() directly instead of
> this assignment. Might be just an overlooked legacy from the time we
> memcpy'd the entire structure. I'll need to double-check.
>
> >
> > Pretty sure it's okay, but Suren would know for sure on all of this.
> >
> > Suren, maybe you could send a patch with comments on this stuff?
>
> Yeah, I think I need to add some comments in this code for
> clarification. We do not copy the entire vm_area_struct because we
> have to preserve vma->vm_refcnt field of the dest vma. Since these
> structures are allocated from a cache with SLAB_TYPESAFE_BY_RCU,
> another thread might be concurrently checking the state of the dest
> object by reading dest->vm_refcnt. Therefore it's important here not
> to override the vm_refcnt. Changelog in
> https://lore.kernel.org/all/20250213224655.1680278-18-surenb@google.com/
> touches on it but a comment in the code would be indeed helpful. Will
> add it but will wait for Lorenzo's refactoring to land into linux-mm

s/linux-mm/mm-unstable. I need my morning coffee.

> first to avoid adding merge conflicts.
>
> >
> > Thanks,
> > Liam
