Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF4827AC4C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 16:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750697283; cv=none; b=Z/Gq+LJgeWFU9V02xnaMqJ5MdEkSNAU9dDWIgUBazN644XeP9HcfC3mXcx8O9Uxajs+LYMKiXUIjx/fmzGT7yQ8YxqZP61q/HURFNxCyCzBCXLZ+UkR+4TA+PV5E67qV9L29BtlaDr7KYovgdEvV76sdWUJeKL8LxdLO+B9ySsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750697283; c=relaxed/simple;
	bh=bCX0HCIlq3er6JCdz9ITAb+mtOvXp6hxotfl2UpDlcs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SYZOIWVQDmZExdNPbb/9+/s+cPjmshO9xfCEKrQtvc2ihEbkRV7hKDivr60K+4LXMfNKcnFqQpaWxR21wKONJgpNieHKeWmIOApagLia1IVWrSCv71beu3SRvWXXknLQAsXkzvLNkFwXTnM/8VgzXD7gMnaAT8objRhtAT0vmHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=znGajDXq; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="znGajDXq"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4a5ac8fae12so14271cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 09:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750697280; x=1751302080; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R5sEhvD1o8Bo/zBsuxrAo9Wuzcni0KuqnAqzHNeBsA0=;
        b=znGajDXq1LMepHS6TCx3iTXAJaj6V0xUGLvPgl4d4Y9Us2ROiidBzkM9v4k0DQyn2y
         RavpwMDvgn6WwHCCIEKrA0a5rLBPuEBD2HjY9fDdM68PCvM1+Su7mVfhl0jDryS+2rUi
         ZA6w4LgCRaocZFBHaKtD8Kqft7QWh7dZbK/J2vtSUgXjmEP9+BI/qJKiR7Q+IVQUlOrd
         rA28+SC8Ad45gh4tP5amAtPxmfdwtbEKUqQQ1EbTWmggw4iVDS8kVhbOnOx7jYAcDVCI
         6eqC1nf66trUvC0YiOeD3kYWe5V+arLyuUzR2IKOs5QxgiDqh8de9nA+/ahYRJ22aPTn
         mI6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750697280; x=1751302080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R5sEhvD1o8Bo/zBsuxrAo9Wuzcni0KuqnAqzHNeBsA0=;
        b=lrTV0xvN92V+akKRugsfuSKQdpoFxmpfjV5o+2aQUfvoGrECiSTFdVHA+m6VJAu2ke
         9PhYqgEBbZlvANTrLJyC+7nRtY5TeyMw3Ct5xHh/G8RWrFHaqKft5wtCxQCZHVx4Okya
         MOkNyijSkked7isrvPOjGzT9sXBt4Hi16HZ92moimGSGqEVbuLLLnmyrfKlE6QR++IQb
         OX7UMIqb5c40UANDC7DP1sMwgQDK6DPp0d/bRrcOdWJ8rIeOMafTumbi7QBnM0jknx7+
         GJ3LLlXTun/6DXD1iIUmRHI0fs/04Fh55EY7qQX4zz3/no1spEM83ZWxoxuc4Dp4KekJ
         iB0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUN4rII7agSjfWI/JzpdY2BWS10gVmYhB0Qrkfwtimkm6kYzKhAw4xtmuy+Sy6SlwDlVy8X0OKOZ3REtFs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBUNKP2Q+6LRw2qD7hR9z8B3OjL6h+YDXLWrPK0O4roPbOQDBZ
	r+8Aiumw7/ymIT7i+//sV3xDw1YWEgkekYG0hEgIUFUsfdkuLmv/DETfsLtJxXNVuUQ1GJs/E2D
	KfTxoxRkYc5hBJxY4fHgmbRdtRexH3Kinz9C+oJJk
X-Gm-Gg: ASbGnctqyqk1azVVgQy6HeJE6q2ji0THuja8YbvWo93hLNQ8rR/uTeC6psIi4pVPxVP
	s2tsXHakccM5qcfyPP1puDNvzAlHomUhXtcvmoVpiHFmaArsA/pD8uJjZzBQbuREmUkHNK17aht
	v8MAImUKOHSdcnB3aRCPLOqwPFXbrz46fdYL9wwj9oTA==
X-Google-Smtp-Source: AGHT+IErU8MyPzxoQBKh0E9tOFlZmJJTClUvJPjmcT2f641+BQlv2u0wG4prN29Z87lZ1kXBPh8/2C/2BPk/uVpNP7E=
X-Received: by 2002:ac8:7c43:0:b0:4a4:fdf2:375c with SMTP id
 d75a77b69052e-4a786d6571bmr8284131cf.9.1750697280105; Mon, 23 Jun 2025
 09:48:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623-anon_name_cleanup-v1-0-04c94384046f@suse.cz> <20250623-anon_name_cleanup-v1-2-04c94384046f@suse.cz>
In-Reply-To: <20250623-anon_name_cleanup-v1-2-04c94384046f@suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 23 Jun 2025 09:47:49 -0700
X-Gm-Features: Ac12FXxpII-wpM0zzRsKLrIeZ-308_02VCxAihZcNIoMLOaUT8VN7THZMvcpndc
Message-ID: <CAJuCfpHA9hMbDfeW9kh5m0ZWOLaxya3PrwNh9e6rZDqQyu0gAw@mail.gmail.com>
Subject: Re: [PATCH RFC 2/2] mm, madvise: move prctl_set_vma() to mm/madvise.c
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, David Hildenbrand <david@redhat.com>, 
	Jann Horn <jannh@google.com>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Colin Cross <ccross@google.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 8:00=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> wr=
ote:
>
> Setting anon_name is done via madvise_set_anon_name() and behaves a lot
> of like other madvise operations. However, apparently because madvise()
> has lacked the 4th argument and prctl() not, the userspace entry point
> has been implemented via prctl(PR_SET_VMA, ...) and handled first by
> prctl_set_vma().
>
> Currently prctl_set_vma() lives in kernel/sys.c but it's mm code so move
> it under mm. mm/madvise.c seems to be the most straightforward place as
> that's where madvise_set_anon_name() lives, so we can stop declaring the
> latter in the header and instead declare prctl_set_vma(). It's not ideal
> as prctl is not madvise, but that's the reality we live in, as described
> above.
>
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
> ---
>  include/linux/mm.h | 13 +++++------
>  kernel/sys.c       | 64 ------------------------------------------------=
------
>  mm/madvise.c       | 59 +++++++++++++++++++++++++++++++++++++++++++++++-=
-
>  3 files changed, 63 insertions(+), 73 deletions(-)
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 0e0549f3d681f6c7a78e8dfa341a810e5a8f96c1..1f8c2561c8cf77e9bb6950943=
25401c09c15f3e6 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -4059,14 +4059,13 @@ unsigned long wp_shared_mapping_range(struct addr=
ess_space *mapping,
>  #endif
>
>  #ifdef CONFIG_ANON_VMA_NAME
> -int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
> -                         unsigned long len_in,
> -                         struct anon_vma_name *anon_name);
> +int prctl_set_vma(unsigned long opt, unsigned long start,
> +                 unsigned long size, unsigned long arg);
>  #else
> -static inline int
> -madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
> -                     unsigned long len_in, struct anon_vma_name *anon_na=
me) {
> -       return 0;
> +static inline int prctl_set_vma(unsigned long opt, unsigned long start,
> +                               unsigned long size, unsigned long arg)
> +{
> +       return -EINVAL;
>  }
>  #endif
>
> diff --git a/kernel/sys.c b/kernel/sys.c
> index adc0de0aa364aebb23999f621717a5d32599921c..247d8925daa6fc86134504042=
832c2164b5d8277 100644
> --- a/kernel/sys.c
> +++ b/kernel/sys.c
> @@ -2343,70 +2343,6 @@ int __weak arch_lock_shadow_stack_status(struct ta=
sk_struct *t, unsigned long st
>
>  #define PR_IO_FLUSHER (PF_MEMALLOC_NOIO | PF_LOCAL_THROTTLE)
>
> -#ifdef CONFIG_ANON_VMA_NAME
> -
> -#define ANON_VMA_NAME_MAX_LEN          80
> -#define ANON_VMA_NAME_INVALID_CHARS    "\\`$[]"
> -
> -static inline bool is_valid_name_char(char ch)
> -{
> -       /* printable ascii characters, excluding ANON_VMA_NAME_INVALID_CH=
ARS */
> -       return ch > 0x1f && ch < 0x7f &&
> -               !strchr(ANON_VMA_NAME_INVALID_CHARS, ch);
> -}
> -
> -static int prctl_set_vma(unsigned long opt, unsigned long addr,
> -                        unsigned long size, unsigned long arg)
> -{
> -       struct mm_struct *mm =3D current->mm;
> -       const char __user *uname;
> -       struct anon_vma_name *anon_name =3D NULL;
> -       int error;
> -
> -       switch (opt) {
> -       case PR_SET_VMA_ANON_NAME:
> -               uname =3D (const char __user *)arg;

My issue with this refactoring is that prctl_set_vma() might grow some
other opt which does not belong in madvise.c. Moving it into vma.c
seems a bit more appropriate IMHO.

> -               if (uname) {
> -                       char *name, *pch;
> -
> -                       name =3D strndup_user(uname, ANON_VMA_NAME_MAX_LE=
N);
> -                       if (IS_ERR(name))
> -                               return PTR_ERR(name);
> -
> -                       for (pch =3D name; *pch !=3D '\0'; pch++) {
> -                               if (!is_valid_name_char(*pch)) {
> -                                       kfree(name);
> -                                       return -EINVAL;
> -                               }
> -                       }
> -                       /* anon_vma has its own copy */
> -                       anon_name =3D anon_vma_name_alloc(name);
> -                       kfree(name);
> -                       if (!anon_name)
> -                               return -ENOMEM;
> -
> -               }
> -
> -               mmap_write_lock(mm);
> -               error =3D madvise_set_anon_name(mm, addr, size, anon_name=
);
> -               mmap_write_unlock(mm);
> -               anon_vma_name_put(anon_name);
> -               break;
> -       default:
> -               error =3D -EINVAL;
> -       }
> -
> -       return error;
> -}
> -
> -#else /* CONFIG_ANON_VMA_NAME */
> -static int prctl_set_vma(unsigned long opt, unsigned long start,
> -                        unsigned long size, unsigned long arg)
> -{
> -       return -EINVAL;
> -}
> -#endif /* CONFIG_ANON_VMA_NAME */
> -
>  static inline unsigned long get_current_mdwe(void)
>  {
>         unsigned long ret =3D 0;
> diff --git a/mm/madvise.c b/mm/madvise.c
> index ae29395b4fc7f65a449c5772b1901a90f4195885..4a8e61e2c5025726bc2ce1f32=
3768c5b25cef2c9 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -31,6 +31,7 @@
>  #include <linux/swapops.h>
>  #include <linux/shmem_fs.h>
>  #include <linux/mmu_notifier.h>
> +#include <linux/prctl.h>
>
>  #include <asm/tlb.h>
>
> @@ -134,8 +135,8 @@ static int replace_anon_vma_name(struct vm_area_struc=
t *vma,
>         return 0;
>  }
>
> -int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
> -                         unsigned long len_in, struct anon_vma_name *ano=
n_name)
> +static int madvise_set_anon_name(struct mm_struct *mm, unsigned long sta=
rt,
> +               unsigned long len_in, struct anon_vma_name *anon_name)
>  {
>         unsigned long end;
>         unsigned long len;
> @@ -165,6 +166,60 @@ int madvise_set_anon_name(struct mm_struct *mm, unsi=
gned long start,
>         madv_behavior.range.end =3D end;
>         return madvise_walk_vmas(&madv_behavior);
>  }
> +
> +#define ANON_VMA_NAME_MAX_LEN          80
> +#define ANON_VMA_NAME_INVALID_CHARS    "\\`$[]"
> +
> +static inline bool is_valid_name_char(char ch)
> +{
> +       /* printable ascii characters, excluding ANON_VMA_NAME_INVALID_CH=
ARS */
> +       return ch > 0x1f && ch < 0x7f &&
> +               !strchr(ANON_VMA_NAME_INVALID_CHARS, ch);
> +}
> +
> +int prctl_set_vma(unsigned long opt, unsigned long addr,
> +                 unsigned long size, unsigned long arg)
> +{
> +       struct mm_struct *mm =3D current->mm;
> +       const char __user *uname;
> +       struct anon_vma_name *anon_name =3D NULL;
> +       int error;
> +
> +       switch (opt) {
> +       case PR_SET_VMA_ANON_NAME:
> +               uname =3D (const char __user *)arg;
> +               if (uname) {
> +                       char *name, *pch;
> +
> +                       name =3D strndup_user(uname, ANON_VMA_NAME_MAX_LE=
N);
> +                       if (IS_ERR(name))
> +                               return PTR_ERR(name);
> +
> +                       for (pch =3D name; *pch !=3D '\0'; pch++) {
> +                               if (!is_valid_name_char(*pch)) {
> +                                       kfree(name);
> +                                       return -EINVAL;
> +                               }
> +                       }
> +                       /* anon_vma has its own copy */
> +                       anon_name =3D anon_vma_name_alloc(name);
> +                       kfree(name);
> +                       if (!anon_name)
> +                               return -ENOMEM;
> +
> +               }
> +
> +               mmap_write_lock(mm);
> +               error =3D madvise_set_anon_name(mm, addr, size, anon_name=
);
> +               mmap_write_unlock(mm);
> +               anon_vma_name_put(anon_name);
> +               break;
> +       default:
> +               error =3D -EINVAL;
> +       }
> +
> +       return error;
> +}
>  #else /* CONFIG_ANON_VMA_NAME */
>  static int replace_anon_vma_name(struct vm_area_struct *vma,
>                                  struct anon_vma_name *anon_name)
>
> --
> 2.50.0
>
