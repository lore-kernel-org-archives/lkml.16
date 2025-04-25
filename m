Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FA11F6694
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745602021; cv=none; b=LwDjMVIypRtMKtvKAAZ5KjVNGdkeR1y80tOrj7oKMKg0YiCWk+rSniedc+ZJSQVrEfSd4pSeAe27bGJPe5T/CQRs4G4aUwOeMjzTl7u9poSwqTRmd5N5KOvrL1URYNoMv6ejd8LPCef2tfTgjEym4L8WeQI7oKmAuNuMls/LrYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745602021; c=relaxed/simple;
	bh=RUX2gI2q/VVGvwoTtRvFHA0juUd3HegmJSo0vMg0yFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m4bVMNsRgw2hgvzvAMBnjiePaONEkJ7KCQ4G1+fzgvM1nXQ7bYmVAu/xbNj/JqoPpBOz69jBdtsTuwAMmhHwQuFcyR4qOrgMbJmvgpCSGO6SvSwFp+q/XkugzQfflek1YVq+5DE6BGgWKnp8nvNWIHVaqcLX7rXBLh1+nCae+rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k9Y8r4Co; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k9Y8r4Co"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-47e9fea29easo9561cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745602019; x=1746206819; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WVMnvFn9n+P1CKhwUPkCgqII5/m+lypiQFfGIbxcLVc=;
        b=k9Y8r4CoiQfcH6npxvwR1VkRf+zF49Gv0CsZHecEFgvwrHSwjL/+tzT33GswZo6KJO
         LJ11En4c/82csNgW9BhtQBagW9jFol5x5cbmW4YYqxc0lvpX/g0kdQ8aFadTSwPJIDvX
         9fJXCTUPXzDCOf5u11XDZ2Coz25/bm1NgtPZxzgju9nSaBQ0BTc/ba7Ter25JkVKQ5qm
         HdsMexoExCDH2WVZdaZtTqeIu7VVs4GCRlBrx4BmDhGuHd7iRo8dCzdWArUFMy+MPsya
         3P5aRnj3GBhOeLLTPX9IopXcZ8xi8wlGHrNzcEdVPvtbrtB8bGqQIwSIlmUPq7Kj2SjF
         ZgZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745602019; x=1746206819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WVMnvFn9n+P1CKhwUPkCgqII5/m+lypiQFfGIbxcLVc=;
        b=DW6CUCcqorqcF6VwACY82RsA1zdoBIG39zPtqcQAobDJbZGOtFfhlOMK33UcVOvQRv
         xnqvrF+g2NtihC7We6hz+z5OKs5zH/V50hxc8tM4o9Pd18ei0HSSAxbR0Y9C5VMQZEC/
         CCS0vDiYH4KCxz803bJuuleZECm+37fvmXrfSvz5C25TqDa+59QNvVEknm1W0LIMVdEi
         z3/KrXx1sdpaze6d4pP+JU5VoNWXyK7UN3xgsVaz0kovnv+JSRYAScId1TOXSj62vU57
         yEGlCC3ab9qD8ppuAW24uzh54JmzZ9RfgfBAmkDmKQjqHhjzh0sXXeFAQNHYoNISdeBW
         +7Fg==
X-Forwarded-Encrypted: i=1; AJvYcCVciuXuLfGsn4owkK8Z9rt+Z0JpQxFLW7nIT0Tteh/xvWDfPeEgYGIqKI+qk835XGsnXVzLD/9hoDuWnXI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0lG0+/EScFDxb5ud1GSF87i5apJF7YuGhw03KQd3t9bE/UMY7
	k9Fdmkl1n3oeE1LBWMpr+AJuXGxfpcAo+VMYcxFZ1Nt82aY1SYCeIDTRmAC6tO8o/68Ane80aD6
	t+Le6zMavF1im6SnEVU+7BiLytzBnedV/6yc/
X-Gm-Gg: ASbGncsB5dGC7asR/ExWErqsgpw3D59O4f45iPdAeArP9u5l2fLndsik76G2wbNia+E
	l4BzHyZ4TzPe/92fnbDIHmMRmM5yiPvfVKyu1KNEITTXlHgt9y9se4QDwk6vpALTy802ylUCi00
	ocLxOteKRTbCSFnXMknC95
X-Google-Smtp-Source: AGHT+IG2cM1yVyej3lzRTanwt7H6lzpj/LO2wjSzm/XIby/6ONbcRTy0GQn4YFZVRCdWJ666A7314P2+DMcWcIOFy4s=
X-Received: by 2002:a05:622a:5a0e:b0:476:d668:fd1c with SMTP id
 d75a77b69052e-48140acfd95mr30411cf.2.1745602018724; Fri, 25 Apr 2025 10:26:58
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1745528282.git.lorenzo.stoakes@oracle.com>
 <0f848d59f3eea3dd0c0cdc3920644222c40cffe6.1745528282.git.lorenzo.stoakes@oracle.com>
 <51903B43-2BFC-4BA6-9D74-63F79CF890B7@kernel.org> <7212f5f4-f12b-4b94-834f-b392601360a3@lucifer.local>
 <n6lrbjs4o6luzl3fydpo4frj35q6kvoz74mhlyae5gp7t5loyy@ubmfmzwfhnwq>
 <CAJuCfpErtLvktCsbFSGmrT_zir9z0g+uuVvhr=QEitA7ARkdkw@mail.gmail.com> <202504251010.C5CCE66@keescook>
In-Reply-To: <202504251010.C5CCE66@keescook>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 25 Apr 2025 10:26:47 -0700
X-Gm-Features: ATxdqUFI25tBLuuz7impmOSN8LJFpyEkWMIodbUWLISW0FgBbB8BqB9ZvMK9h3U
Message-ID: <CAJuCfpG+0zV3P-P+yr_bnGKJVkNHVznfcVmfcsWbUcW4Bw4LzQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] mm: perform VMA allocation, freeing, duplication in mm
To: Kees Cook <kees@kernel.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@redhat.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 10:12=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> On Fri, Apr 25, 2025 at 08:32:48AM -0700, Suren Baghdasaryan wrote:
> > On Fri, Apr 25, 2025 at 6:55=E2=80=AFAM Liam R. Howlett <Liam.Howlett@o=
racle.com> wrote:
> > >
> > > * Lorenzo Stoakes <lorenzo.stoakes@oracle.com> [250425 06:40]:
> > > > On Thu, Apr 24, 2025 at 08:15:26PM -0700, Kees Cook wrote:
> > > > >
> > > > >
> > > > > On April 24, 2025 2:15:27 PM PDT, Lorenzo Stoakes <lorenzo.stoake=
s@oracle.com> wrote:
> > > > > >+static void vm_area_init_from(const struct vm_area_struct *src,
> > > > > >+                        struct vm_area_struct *dest)
> > > > > >+{
> > > > > >+  dest->vm_mm =3D src->vm_mm;
> > > > > >+  dest->vm_ops =3D src->vm_ops;
> > > > > >+  dest->vm_start =3D src->vm_start;
> > > > > >+  dest->vm_end =3D src->vm_end;
> > > > > >+  dest->anon_vma =3D src->anon_vma;
> > > > > >+  dest->vm_pgoff =3D src->vm_pgoff;
> > > > > >+  dest->vm_file =3D src->vm_file;
> > > > > >+  dest->vm_private_data =3D src->vm_private_data;
> > > > > >+  vm_flags_init(dest, src->vm_flags);
> > > > > >+  memcpy(&dest->vm_page_prot, &src->vm_page_prot,
> > > > > >+         sizeof(dest->vm_page_prot));
> > > > > >+  /*
> > > > > >+   * src->shared.rb may be modified concurrently when called fr=
om
> > > > > >+   * dup_mmap(), but the clone will reinitialize it.
> > > > > >+   */
> > > > > >+  data_race(memcpy(&dest->shared, &src->shared, sizeof(dest->sh=
ared)));
> > > > > >+  memcpy(&dest->vm_userfaultfd_ctx, &src->vm_userfaultfd_ctx,
> > > > > >+         sizeof(dest->vm_userfaultfd_ctx));
> > > > > >+#ifdef CONFIG_ANON_VMA_NAME
> > > > > >+  dest->anon_name =3D src->anon_name;
> > > > > >+#endif
> > > > > >+#ifdef CONFIG_SWAP
> > > > > >+  memcpy(&dest->swap_readahead_info, &src->swap_readahead_info,
> > > > > >+         sizeof(dest->swap_readahead_info));
> > > > > >+#endif
> > > > > >+#ifdef CONFIG_NUMA
> > > > > >+  dest->vm_policy =3D src->vm_policy;
> > > > > >+#endif
> > > > > >+}
> > > > >
> > > > > I know you're doing a big cut/paste here, but why in the world is=
 this function written this way? Why not just:
> > > > >
> > > > > *dest =3D *src;
> > > > >
> > > > > And then do any one-off cleanups?
> > > >
> > > > Yup I find it odd, and error prone to be honest. We'll end up with =
uninitialised
> > > > state for some fields if we miss them here, seems unwise...
> > > >
> > > > Presumably for performance?
> > > >
> > > > This is, as you say, me simply propagating what exists, but I do wo=
nder.
> > >
> > > Two things come to mind:
> > >
> > > 1. How ctors are done.  (v3 of Suren's RCU safe patch series, willy m=
ade
> > > a comment.. I think)
> > >
> > > 2. Some race that Vlastimil came up with the copy and the RCU safenes=
s.
> > > IIRC it had to do with the ordering of the setting of things?
> > >
> > > Also, looking at it again...
> > >
> > > How is it safe to do dest->anon_name =3D src->anon_name?  Isn't that =
ref
> > > counted?
> >
> > dest->anon_name =3D src->anon_name is fine here because right after
> > vm_area_init_from() we call dup_anon_vma_name() which will bump up the
> > refcount. I don't recall why this is done this way but now looking at
> > it I wonder if I could call dup_anon_vma_name() directly instead of
> > this assignment. Might be just an overlooked legacy from the time we
> > memcpy'd the entire structure. I'll need to double-check.
>
> Oh, is "dest" accessible to other CPU threads? I hadn't looked and was
> assuming this was like process creation where everything gets built in
> isolation and then attached to the main process tree. I was thinking
> this was similar.

Yeah, it's process creation time but this structure is created from a
SLAB_TYPESAFE_BY_RCU cache which adds complexity. A newly allocated
object from this cache might be still accessible from another thread
holding a reference to its earlier incarnation. We need an indication
for that other thread to say "this object has been released, so the
reference you are holding is pointing to a freed or reallocated/wrong
object". vm_refcnt in this case is this indication and we are careful
not to override it even temporarily during object initialization.
Well, in truth we override it later with 0 but for the other thread
that will still mean this object is not what it wants.

I suspect you know this already but just in case
https://elixir.bootlin.com/linux/v6.14.3/source/include/linux/slab.h#L101
has more detailed explanation of SLAB_TYPESAFE_BY_RCU.

>
> --
> Kees Cook
