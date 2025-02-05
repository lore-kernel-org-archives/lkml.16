Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206492147F3;
	Wed,  5 Feb 2025 23:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738799164; cv=none; b=gvo2Hpoxd1q4rMKlm6MiY137Gj+eerNFdrHGTA2Y6Nkt8UOr0xyvQ8ZvF+P98b47TWllTy5bgcXqGrBZLE/sxqwBcqwu+p446ieti9faea10PULqfddAgprGc+L9R1Ne41i1DizR/M5wv7DbWHXbBrtoRaZBBPaAPatUk3oo0UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738799164; c=relaxed/simple;
	bh=MrDuwIcA4TUWgBdw7ZNSSQ8hvV3j4q9ZV/wFeQ7mJKU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b8nezY21DbJDxAUA9msP68caRfAiyRUdO0WOW7YX58J+Utk9Egw+aEYjo7fj2UaqBMm2B7KTZt8Hp4RmJssp9IkXrGH2AhD2V9JFxkfghG1yXs4gg8CpTmwHZUAlBzlbQFKO7GTU2BrKx2Z0lXKV3lg5TB3wiTbXYTm48rzqSnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bFzHhS5o; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bFzHhS5o"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38db909acc9so220016f8f.0;
        Wed, 05 Feb 2025 15:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738799160; x=1739403960; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rz+V1fDyiTyTkm+6v9/Yshk0vlGrK4aQBew/N8UNm8o=;
        b=bFzHhS5ocZEL9dJc1ZNFNipyssN9Hgwmrk/WQvIEkK2cDi7hdqHEhsAyIDLtTNY1Cp
         4cKEUTYoEV7zL84vXkMf5PReGiuQy8qthuzr8u8rjWg3uP4XIsAW2TCkcprrg1m/0Xuj
         X5NdVYL1fJUybxMHbyPU9I1K1iJRrt7vwsZe1RX4ls8/7mQKp3VeC7pcz9dQ+laPFQoi
         OmkukbhVL/glGBS+sK/rgxzikc0UBIC6sIW/BXHDfExd6NTnxdER1AB6IViP8qRgezkV
         2mHJyVEhp5Nw9ZL85bvzSktBNg20TDliJ5Sszj02NaP7p3nw2Xffe7unkZyqGjQldtCN
         vp8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738799160; x=1739403960;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rz+V1fDyiTyTkm+6v9/Yshk0vlGrK4aQBew/N8UNm8o=;
        b=Qno9UPgaWluL6a8NPyTnBvRlTnr1ejPgowy3SUGnMktyw3up3sIN9A2lF2MgjM3ckH
         wSMQkTSmOG1u+LTwGfcW+eLWy4JVbr3OehdWmncW0vzC6EaJJtX5Bm+tFSB8WOFZ9GDu
         o6G4BrT7y03UGOoTfQrIH9/TCMQp3xWxk8jz1h6RLudKkukhah3Fwxkrwc2R2xNBBjgR
         qKStIu0JUSIotLvYq2Rn+ysXOq2ynrlno5X0B777J9o1pCj6oP9VCvRhlwObuINftSjn
         QLy4bGR3N5tIOvRPQUTWUUBbMjLFOM2figHqdiAu5pA5Qd6tsvs7eoq2emRtbqOwsMNt
         4ogA==
X-Forwarded-Encrypted: i=1; AJvYcCUle4V3jTGrOwoLghy3yb6Iq0m3hzJPa5qm+cYLtCkhWIqU17sk0FHTCewJwnEzkA49DymJAywyA8UhQ/CV@vger.kernel.org, AJvYcCXWf1yZrVfDKeS2EqwrGIbTCZT1cGt7PIwqNelamPFWtrwSGwqFmZODcNDd7fr1xSGTgQ9uwduvzCg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzF4Soex7zaxzQm9FtrmkucTWc913yjG8J5mK/dmR+5ztUszkh9
	j53RRzgD8ClI1ELdvf4XpUjUmI6CfnZbVVd1h0z5+/nYBBDcvuSlFcJdxak08AmCMK/goZryoVs
	Cxv/dybn4U7Vbp8rNvp9XGpBo1Cw=
X-Gm-Gg: ASbGncvKSWx7asfSNqndTCiAgSR4arhpe7zuuPyCq+k6PdT3BTqJo9g0UpbWwMSHTTV
	doztpRBWA/aDUPSGiQb6+19To3wpfS1dXj++wNjPZRbcA53DX8IIl84uraofG7499TStCp6THtA
	==
X-Google-Smtp-Source: AGHT+IGbg8frwCmtZh2Cq1mQ+7gcdTinnbG3Ybu+Qvbg9VC2A4roSQzA7Y8T7x0Do1hYoZdYgXjogJqzzmDtvH5wZas=
X-Received: by 2002:a05:6000:1786:b0:385:f0dc:c9f4 with SMTP id
 ffacd0b85a97d-38db48bdaecmr3897521f8f.20.1738799160206; Wed, 05 Feb 2025
 15:46:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com> <28ddfb1694b19278405b4934f37d398794409749.1738686764.git.maciej.wieczor-retman@intel.com>
In-Reply-To: <28ddfb1694b19278405b4934f37d398794409749.1738686764.git.maciej.wieczor-retman@intel.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Thu, 6 Feb 2025 00:45:49 +0100
X-Gm-Features: AWEUYZm-2kNDPAYBLLDAqKKnZZXufvhPekieyoATWEHpiTcF4DB1S0LSkY8umDA
Message-ID: <CA+fCnZfKQwNWbYEhk70ykT1+cnibCBnvZJrhAMvu_b0Y8xZTSg@mail.gmail.com>
Subject: Re: [PATCH 10/15] x86: KASAN raw shadow memory PTE init
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: luto@kernel.org, xin@zytor.com, kirill.shutemov@linux.intel.com, 
	palmer@dabbelt.com, tj@kernel.org, brgerst@gmail.com, ardb@kernel.org, 
	dave.hansen@linux.intel.com, jgross@suse.com, will@kernel.org, 
	akpm@linux-foundation.org, arnd@arndb.de, corbet@lwn.net, dvyukov@google.com, 
	richard.weiyang@gmail.com, ytcoode@gmail.com, tglx@linutronix.de, 
	hpa@zytor.com, seanjc@google.com, paul.walmsley@sifive.com, 
	aou@eecs.berkeley.edu, justinstitt@google.com, jason.andryuk@amd.com, 
	glider@google.com, ubizjak@gmail.com, jannh@google.com, bhe@redhat.com, 
	vincenzo.frascino@arm.com, rafael.j.wysocki@intel.com, 
	ndesaulniers@google.com, mingo@redhat.com, catalin.marinas@arm.com, 
	junichi.nomura@nec.com, nathan@kernel.org, ryabinin.a.a@gmail.com, 
	dennis@kernel.org, bp@alien8.de, kevinloughlin@google.com, morbo@google.com, 
	dan.j.williams@intel.com, julian.stecklina@cyberus-technology.de, 
	peterz@infradead.org, cl@linux.com, kees@kernel.org, 
	kasan-dev@googlegroups.com, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 6:36=E2=80=AFPM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> In KASAN's generic mode the default value in shadow memory is zero.
> During initialization of shadow memory pages they are allocated and
> zeroed.
>
> In KASAN's tag-based mode the default tag for the arm64 architecture is
> 0xFE which corresponds to any memory that should not be accessed. On x86
> (where tags are 4-bit wide instead of 8-bit wide) that tag is 0xE so
> during the initializations all the bytes in shadow memory pages should
> be filled with 0xE or 0xEE if two tags should be packed in one shadow
> byte.
>
> Use memblock_alloc_try_nid_raw() instead of memblock_alloc_try_nid() to
> avoid zeroing out the memory so it can be set with the KASAN invalid
> tag.
>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> ---
>  arch/x86/mm/kasan_init_64.c | 19 ++++++++++++++++---
>  include/linux/kasan.h       | 25 +++++++++++++++++++++++++
>  mm/kasan/kasan.h            | 19 -------------------
>  3 files changed, 41 insertions(+), 22 deletions(-)
>
> diff --git a/arch/x86/mm/kasan_init_64.c b/arch/x86/mm/kasan_init_64.c
> index 9dddf19a5571..55d468d83682 100644
> --- a/arch/x86/mm/kasan_init_64.c
> +++ b/arch/x86/mm/kasan_init_64.c
> @@ -35,6 +35,18 @@ static __init void *early_alloc(size_t size, int nid, =
bool should_panic)
>         return ptr;
>  }
>
> +static __init void *early_raw_alloc(size_t size, int nid, bool should_pa=
nic)
> +{
> +       void *ptr =3D memblock_alloc_try_nid_raw(size, size,
> +                       __pa(MAX_DMA_ADDRESS), MEMBLOCK_ALLOC_ACCESSIBLE,=
 nid);
> +
> +       if (!ptr && should_panic)
> +               panic("%pS: Failed to allocate page, nid=3D%d from=3D%lx\=
n",
> +                     (void *)_RET_IP_, nid, __pa(MAX_DMA_ADDRESS));
> +
> +       return ptr;
> +}
> +
>  static void __init kasan_populate_pmd(pmd_t *pmd, unsigned long addr,
>                                       unsigned long end, int nid)
>  {
> @@ -64,8 +76,9 @@ static void __init kasan_populate_pmd(pmd_t *pmd, unsig=
ned long addr,
>                 if (!pte_none(*pte))
>                         continue;
>
> -               p =3D early_alloc(PAGE_SIZE, nid, true);
> -               entry =3D pfn_pte(PFN_DOWN(__pa(p)), PAGE_KERNEL);
> +               p =3D early_raw_alloc(PAGE_SIZE, nid, true);
> +               memset(p, PAGE_SIZE, kasan_dense_tag(KASAN_SHADOW_INIT));
> +               entry =3D pfn_pte(PFN_DOWN(__pa_nodebug(p)), PAGE_KERNEL)=
;
>                 set_pte_at(&init_mm, addr, pte, entry);
>         } while (pte++, addr +=3D PAGE_SIZE, addr !=3D end);
>  }
> @@ -437,7 +450,7 @@ void __init kasan_init(void)
>          * it may contain some garbage. Now we can clear and write protec=
t it,
>          * since after the TLB flush no one should write to it.
>          */
> -       memset(kasan_early_shadow_page, 0, PAGE_SIZE);
> +       kasan_poison(kasan_early_shadow_page, PAGE_SIZE, KASAN_SHADOW_INI=
T, false);
>         for (i =3D 0; i < PTRS_PER_PTE; i++) {
>                 pte_t pte;
>                 pgprot_t prot;
> diff --git a/include/linux/kasan.h b/include/linux/kasan.h
> index 83146367170a..af8272c74409 100644
> --- a/include/linux/kasan.h
> +++ b/include/linux/kasan.h
> @@ -151,6 +151,31 @@ static __always_inline void kasan_unpoison_range(con=
st void *addr, size_t size)
>                 __kasan_unpoison_range(addr, size);
>  }
>
> +#ifdef CONFIG_KASAN_HW_TAGS
> +
> +static inline void kasan_poison(const void *addr, size_t size, u8 value,=
 bool init)
> +{
> +       if (WARN_ON((unsigned long)addr & KASAN_GRANULE_MASK))
> +               return;
> +       if (WARN_ON(size & KASAN_GRANULE_MASK))
> +               return;
> +
> +       hw_set_mem_tag_range(kasan_reset_tag(addr), size, value, init);
> +}
> +
> +#else /* CONFIG_KASAN_HW_TAGS */
> +
> +/**
> + * kasan_poison - mark the memory range as inaccessible
> + * @addr - range start address, must be aligned to KASAN_GRANULE_SIZE
> + * @size - range size, must be aligned to KASAN_GRANULE_SIZE
> + * @value - value that's written to metadata for the range
> + * @init - whether to initialize the memory range (only for hardware tag=
-based)
> + */
> +void kasan_poison(const void *addr, size_t size, u8 value, bool init);
> +
> +#endif /* CONFIG_KASAN_HW_TAGS */

Please keep kasan_poison() and kasan_unpoison() in mm/kasan/kasan.h:
these are intended as internal-only functions (perhaps, we should add
this into the comment). Instead, add a purpose-specific wrapper
similar to the ones in include/linux/kasan.h.


> +
>  void __kasan_poison_pages(struct page *page, unsigned int order, bool in=
it);
>  static __always_inline void kasan_poison_pages(struct page *page,
>                                                 unsigned int order, bool =
init)
> diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> index a56aadd51485..2405477c5899 100644
> --- a/mm/kasan/kasan.h
> +++ b/mm/kasan/kasan.h
> @@ -466,16 +466,6 @@ static inline u8 kasan_random_tag(void) { return 0; =
}
>
>  #ifdef CONFIG_KASAN_HW_TAGS
>
> -static inline void kasan_poison(const void *addr, size_t size, u8 value,=
 bool init)
> -{
> -       if (WARN_ON((unsigned long)addr & KASAN_GRANULE_MASK))
> -               return;
> -       if (WARN_ON(size & KASAN_GRANULE_MASK))
> -               return;
> -
> -       hw_set_mem_tag_range(kasan_reset_tag(addr), size, value, init);
> -}
> -
>  static inline void kasan_unpoison(const void *addr, size_t size, bool in=
it)
>  {
>         u8 tag =3D get_tag(addr);
> @@ -497,15 +487,6 @@ static inline bool kasan_byte_accessible(const void =
*addr)
>
>  #else /* CONFIG_KASAN_HW_TAGS */
>
> -/**
> - * kasan_poison - mark the memory range as inaccessible
> - * @addr - range start address, must be aligned to KASAN_GRANULE_SIZE
> - * @size - range size, must be aligned to KASAN_GRANULE_SIZE
> - * @value - value that's written to metadata for the range
> - * @init - whether to initialize the memory range (only for hardware tag=
-based)
> - */
> -void kasan_poison(const void *addr, size_t size, u8 value, bool init);
> -
>  /**
>   * kasan_unpoison - mark the memory range as accessible
>   * @addr - range start address, must be aligned to KASAN_GRANULE_SIZE
> --
> 2.47.1
>
