Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F74200B9F
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 14:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750775503; cv=none; b=XK7rlY0fWEw9tG7u9dyJe2JOUbdzALcZTsuZKUCpAlUjA1nIH2Uf4VbUr2o+55a9qBhNXl43GkHxFhSGuG8fXeC+YINp5rrcPDMIIdolnbIgHSrbD6b0/LDNtMiEoFNTW/z+MvdCyEGeQ9UMJmCv/4e3Qd4tQkNLmJ3QarZ3758=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750775503; c=relaxed/simple;
	bh=1YMSFJyiph2pHxTCBZ5cLQtuaHjFVBnBX44oQa4BcGk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UgbizsnGsY2UJqQs2fznldUTdGx5uopCxb6oRhg5JuZbQY1b73Y05kJ2IOPzxs8EApHmmir0WLzlwztRDFXVoVlTAXEJQsh823RK46SreTaB9Lfle/3Hq57STE57fWysd+FnxDPi8MttE9tgweiYUrW3r2zs2wWsp2cRANoYgmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bYLzIPJ/; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bYLzIPJ/"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4a58ef58a38so169771cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 07:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750775500; x=1751380300; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Dx/+TnSwYdW10JgkjELsEMSU3LgJtYLB/mfgfXSHy4=;
        b=bYLzIPJ/gVs17rQ5wlA9y+bJEgV4bFQPxzYlyi5dQzucEZaNqjhtXTtVXz1oeT+Bnp
         Ewqn38fQU/NRu7VXqKMg8Eufx+WqPG1AUcfeoUCvTCyTJywinOaIctyXeNFE3c08dh54
         GJN5Tr7DisHfs1l22vwlLGIPP5SOSzZuQQeR1msWEuMKzhiyg6dR+AaSCbfa805S4g7a
         h4cVNzwYpKBexfslknzisgFcUkNL+U5aMvauTJP8ukQvlMS4/p2XTBBN7Ga93jMPfzOy
         tt/aR0SXShYoAdQWGJFI/qqsdqlGZUMRRgytas2oQ+sg8QKzCCxUN0ktUGYFhBOmqP4G
         3Lng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750775500; x=1751380300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Dx/+TnSwYdW10JgkjELsEMSU3LgJtYLB/mfgfXSHy4=;
        b=in5RsBP6KsitNpzgxxx2bHTczsn7AVK4PJMzrnsUcN6LX74uSkoN97UnAoi0R92+Zf
         tsApqfDeL9rsCP5z1RuZ8RvQWcMCof1fHXjXuKoBu23S/BQL3PRYouY14r3UaK8cTG+1
         FuXL5uP2hkHNysxKYRvdN0Z++OwxkxOYpis1+E8On1nWO8H613hHFLK1w4W9WdKPIqls
         mRqfbKKxmPtwloIXgWoPE7CW30iwLyhnOlQhU66sUPY8Bv6BM/bUs13j3ZLQae/NLO1n
         SgwwYNfHlkJ98v78hfj5WXk44SfzgIol6HW+dJ5Q2EyYUga9Dhep8DUWv7YhOgvA23Lp
         3wnA==
X-Forwarded-Encrypted: i=1; AJvYcCVtRXLuFGAm1/X2PfG8yemU7Wf9ZSRw7WYxID19issdac1ZHjXbSTvS6Z7opiEkJdX8s+0auT5ey/dU0PE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3x1rxbAXLuq2Vkj90CgqYk6fiBIad7M+qBz0hR5jpuaOLVenS
	duxDN/NqjHZZ1FVvU0FOHWF/uR/uQ6orO1Ta0R8UeOLMA3QT9V1TGkNajmmUYDZTq6Q/1b8UEK3
	wT4WvF9uXXmRxftY4Xbsus2+RCvUemniTZ+9BF4fR
X-Gm-Gg: ASbGncslfZ885cEvJS0v32Ywph4mjPsEMdGfMCDMRKfxYA1gWdNn6db67x9A77whCH+
	H5F89rxs7qZIZL/Pg8eHkhqjRSETnzhpgZQk+/pxLaiDZKJFCUDGoUgplWABYOdrDcvkdkPdsoi
	ll9LLfq8kQbtDztmz1FKgR+w8NT57iVSUyh/lddN1qZBTtWB2ferQJMmAkdZKcoN1khRCrk8Lcd
	4Z/PKoJbgrd
X-Google-Smtp-Source: AGHT+IF8m5bDv4fa4b2+5QuiowqlyoSEs488hOK24HaBkXNb1gnvwEaGBWvrzHdlbSSiGkSaKVbK3yU98qWSVHvY+Qc=
X-Received: by 2002:a05:622a:9010:b0:494:9777:4bd with SMTP id
 d75a77b69052e-4a7b153cbd6mr4073601cf.3.1750775499995; Tue, 24 Jun 2025
 07:31:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624-anon_name_cleanup-v2-0-600075462a11@suse.cz>
 <20250624-anon_name_cleanup-v2-2-600075462a11@suse.cz> <5f5b83ae-8482-4eea-9df0-55871c30375b@redhat.com>
In-Reply-To: <5f5b83ae-8482-4eea-9df0-55871c30375b@redhat.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 24 Jun 2025 07:31:29 -0700
X-Gm-Features: Ac12FXwHVOrDSDKjXlvP2rTZQM9CiZzwk-glg1sDoR3MmAbXFdWmo5SzGP5P17M
Message-ID: <CAJuCfpG0O-CsdhYujLeMsqrWJYoh9o9tFZMehb0MgtE+aRdo1g@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] mm, madvise: extract mm code from prctl_set_vma()
 to mm/madvise.c
To: David Hildenbrand <david@redhat.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Jann Horn <jannh@google.com>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Colin Cross <ccross@google.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 7:04=E2=80=AFAM David Hildenbrand <david@redhat.com=
> wrote:
>
> On 24.06.25 15:03, Vlastimil Babka wrote:
> > Setting anon_name is done via madvise_set_anon_name() and behaves a lot
> > of like other madvise operations. However, apparently because madvise()
> > has lacked the 4th argument and prctl() not, the userspace entry point
> > has been implemented via prctl(PR_SET_VMA, ...) and handled first by
> > prctl_set_vma().
> >
> > Currently prctl_set_vma() lives in kernel/sys.c but setting the
> > vma->anon_name is mm-specific code so extract it to a new
> > set_anon_vma_name() function under mm. mm/madvise.c seems to be the mos=
t
> > straightforward place as that's where madvise_set_anon_name() lives.
> > Stop declaring the latter in mm.h and instead declare
> > set_anon_vma_name().
> >
> > Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
> > ---
> >   include/linux/mm.h | 14 +++++++-------
> >   kernel/sys.c       | 50 +--------------------------------------------=
-----
> >   mm/madvise.c       | 52 +++++++++++++++++++++++++++++++++++++++++++++=
+++++--
> >   3 files changed, 58 insertions(+), 58 deletions(-)
> >
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index 0e0549f3d681f6c7a78e8dfa341a810e5a8f96c1..ef40f68c1183d4c95016575=
a4ee0171e12df9ba4 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -4059,14 +4059,14 @@ unsigned long wp_shared_mapping_range(struct ad=
dress_space *mapping,
> >   #endif
> >
> >   #ifdef CONFIG_ANON_VMA_NAME
> > -int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
> > -                       unsigned long len_in,
> > -                       struct anon_vma_name *anon_name);
> > +int set_anon_vma_name(unsigned long addr, unsigned long size,
> > +                   const char __user *uname);
> >   #else
> > -static inline int
> > -madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
> > -                   unsigned long len_in, struct anon_vma_name *anon_na=
me) {
> > -     return 0;
> > +static inline
> > +int set_anon_vma_name(unsigned long addr, unsigned long size,
> > +                   const char __user *uname)
> > +{
> > +     return -EINVAL;
> >   }
> >   #endif
> >
> > diff --git a/kernel/sys.c b/kernel/sys.c
> > index adc0de0aa364aebb23999f621717a5d32599921c..b153fb345ada28ea1a33386=
a32bcce9cb1b23475 100644
> > --- a/kernel/sys.c
> > +++ b/kernel/sys.c
> > @@ -2343,54 +2343,14 @@ int __weak arch_lock_shadow_stack_status(struct=
 task_struct *t, unsigned long st
> >
> >   #define PR_IO_FLUSHER (PF_MEMALLOC_NOIO | PF_LOCAL_THROTTLE)
> >
> > -#ifdef CONFIG_ANON_VMA_NAME
> > -
> > -#define ANON_VMA_NAME_MAX_LEN                80
> > -#define ANON_VMA_NAME_INVALID_CHARS  "\\`$[]"
> > -
> > -static inline bool is_valid_name_char(char ch)
> > -{
> > -     /* printable ascii characters, excluding ANON_VMA_NAME_INVALID_CH=
ARS */
> > -     return ch > 0x1f && ch < 0x7f &&
> > -             !strchr(ANON_VMA_NAME_INVALID_CHARS, ch);
> > -}
> > -
> >   static int prctl_set_vma(unsigned long opt, unsigned long addr,
> >                        unsigned long size, unsigned long arg)
> >   {
> > -     struct mm_struct *mm =3D current->mm;
> > -     const char __user *uname;
> > -     struct anon_vma_name *anon_name =3D NULL;
> >       int error;
> >
> >       switch (opt) {
> >       case PR_SET_VMA_ANON_NAME:
> > -             uname =3D (const char __user *)arg;
> > -             if (uname) {
> > -                     char *name, *pch;
> > -
> > -                     name =3D strndup_user(uname, ANON_VMA_NAME_MAX_LE=
N);
> > -                     if (IS_ERR(name))
> > -                             return PTR_ERR(name);
> > -
> > -                     for (pch =3D name; *pch !=3D '\0'; pch++) {
> > -                             if (!is_valid_name_char(*pch)) {
> > -                                     kfree(name);
> > -                                     return -EINVAL;
> > -                             }
> > -                     }
> > -                     /* anon_vma has its own copy */
> > -                     anon_name =3D anon_vma_name_alloc(name);
> > -                     kfree(name);
> > -                     if (!anon_name)
> > -                             return -ENOMEM;
> > -
> > -             }
> > -
> > -             mmap_write_lock(mm);
> > -             error =3D madvise_set_anon_name(mm, addr, size, anon_name=
);
> > -             mmap_write_unlock(mm);
> > -             anon_vma_name_put(anon_name);
> > +             error =3D set_anon_vma_name(addr, size, (const char __use=
r *)arg);
>
> At first I thought whether passing current->mm as an argument might make
> it clearer on what we actually operate. But then, "anon_vma" might give
> a good hint.
>
> Acked-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>

>
> --
> Cheers,
>
> David / dhildenb
>
