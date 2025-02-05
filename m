Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0720217719;
	Wed,  5 Feb 2025 23:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738799116; cv=none; b=Do3D9kW5AlhMQ3CeuhaeEesuTTTKVXIq4FOJ5SrhEb7qkhiDY673qLG5e7fuWt7j8mzp3VbQ53PkFLBuqoHSn1fwL5quXG70EcOuOTrCBNlgotoxE3vy973ls4r0wPie9kUrI353I4mJxxaxYV2enKJW5HJ68K96ePBUagU81Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738799116; c=relaxed/simple;
	bh=hWGvnZUmBD0v5igaZuuRSRfMtKmEtSzNCT6nrW9WSk4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q7GZf9QwLnSf57IziL+FyaJWuAttQkkxbO3S9wLClk+4CoPG0YfEZ5TjmTY2qFVkosLeajwNQdQASRWgE+6EZuaCjzAXmAY6J9M9M2XA/1jVqmLeaBao4MFg8Bg0WmrOdClgD0qK5Q9zjsk34fgVqr118+vZzYEKnAsTnNRAonI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OFo9CJG6; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OFo9CJG6"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43675b1155bso3355355e9.2;
        Wed, 05 Feb 2025 15:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738799112; x=1739403912; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SdQ0hVwmExFQXuENvdvOWkm1J/+EX7f8PfThOUaFEXo=;
        b=OFo9CJG6WtqovwbxGBjbJGowYMHupg9d0zOp4FRArZ8bwR4fzQPB41wPJ8ehMJL/BO
         gXiS8+eK+wTjDJHtFCaCelnUDj4hI8qqAWtmWpmiVKo6yejPSKJJiWVGa3Z4KdvZWhen
         +AZOWa9VLgxcUhNn5VhrHakldg9QccLh4aazdIokKtuMvVHA1DHtunYxB3dHIewbUAxc
         dAiSyOfxXRDLAtf5UGHLwZqG7A83vqWjeMpPwaB1nOiABe1KHHJtL7H0WBpcR959S/5a
         /9fnMy7Y4h6E0/sBairZjic+ufWYQtFeuMPUfkahh87orBJjXhFAsdaOv6LWa7Hba6sK
         0OJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738799112; x=1739403912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SdQ0hVwmExFQXuENvdvOWkm1J/+EX7f8PfThOUaFEXo=;
        b=qyOMv1619p/Nskhd0m0Iv5wNilx04rheUHr5JxRM19wCKQrQWz0vPPVGTEIr1OmwXz
         MW6ArA9hCWqKz5ecW0MPwHGd9jAu/bSA21W5v+iHF+CklfAgmwE7Mq+MRyNNqFfXmBWo
         oQvmKWzZSixAGuc7f0oobY8JHnDADva0nZ1WyZX0xWYsro0qClsCeoTIIu/LcEdqJpXM
         03R9z4Sg1BD91TElFI3gB9O0wR4RcaGwV7hjhMxDueKo6ifCE61Sx7IGiFE3Dsrojo3S
         zfieMQS+CSjdeiH2UC0btBXcPTNQVEaEpB1aNuZu1dxVBdHPSluShYR1E90lI5PC9fEJ
         jgWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDDUoFAmhUD3WZKa+BaWxMW9zb0z/RuYvHS83SKwE0E1P4xE6olbXvGHFFEfyVMcyzNYfYWS15Wxu7ANFn@vger.kernel.org, AJvYcCWCldOMqCcRyYdM/2bLKcbO7ljiiCBxaOygLZ+yR4TRpNTxNnM0ROACxUyLrAFRQzAGo1/6JBc86mU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz5WNvQeVuYtO6rU8cZ2QnfTF8m3p71Rdy8Evy92nozJ6+LBk9
	WqfZ3fSCnriew6nnJrcgdNph/Iq7yL5jbyzU7dnA8roqOtZLcuqBfwGvqDxssmKN76HkaoT6zpa
	Jyv1KpUWQHDnVwleP/p/3EGcdnrc=
X-Gm-Gg: ASbGncuiuqfqsyszrcCG79adsrcG/wXtJWgERbGLP0S/uZ5Wtwq9h+Jd5h/Tl4OYQGe
	cJ1dLW9fBEIxZBfImvGfXgptedAG3yp61r4Q2cHozUzmNZDsDJW68QwWKaYiTHY36zG5qclBjgA
	==
X-Google-Smtp-Source: AGHT+IESZXCWamQ4w7BL1aiMWj19pGJakxD0lP6OCslkeQGXt0DeW/7BNkq71jUjJrrw9iAETkqUbyYJwcIuGnYZmTc=
X-Received: by 2002:a05:6000:4020:b0:38d:b2e4:6da3 with SMTP id
 ffacd0b85a97d-38db485890fmr3579308f8f.9.1738799111940; Wed, 05 Feb 2025
 15:45:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com> <8f790bb7e166c1ea2e5003318149eb1d7aba3596.1738686764.git.maciej.wieczor-retman@intel.com>
In-Reply-To: <8f790bb7e166c1ea2e5003318149eb1d7aba3596.1738686764.git.maciej.wieczor-retman@intel.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Thu, 6 Feb 2025 00:45:01 +0100
X-Gm-Features: AWEUYZmiEgjCF8wXgTKLUmOPwZJyA3J8QaYcM7d1IkKeZ18qsMT-vpi9smhb5Jc
Message-ID: <CA+fCnZf20PmUL5Ms7aoGq0CAdaXzcx0yrgSrmvgy89og_PwYMg@mail.gmail.com>
Subject: Re: [PATCH 02/15] kasan: Tag checking with dense tag-based mode
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

On Tue, Feb 4, 2025 at 6:35=E2=80=AFPM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> In KASAN's tag-based mode (arm64) when a memory access occurs, the tag
> stored in the top 8 bits of the pointer is compared with tags saved in
> the region of the shadow memory that maps to memory the pointer points
> to. If any of the tags in the shadow memory region do not match the one
> stored in the pointer an error report is generated.
>
> With the introduction of the dense mode, tags won't necessarily occupy
> whole bytes of shadow memory if the previously allocated memory wasn't
> aligned to 32 bytes - which is the coverage of one shadow byte.
>
> Add an alternative implementation of kasan_check_range() that performs
> special checks on first and last bytes of shadow memory ranges if the
> originally allocated memory wasn't aligned to 32 bytes.
>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> ---
>  include/linux/kasan.h     | 47 +++++++++++++++-------
>  mm/kasan/Makefile         |  3 ++
>  mm/kasan/dense.c          | 83 +++++++++++++++++++++++++++++++++++++++
>  mm/kasan/kasan.h          |  2 +-
>  mm/kasan/report.c         |  2 +-
>  mm/kasan/report_sw_tags.c | 12 ++----
>  mm/kasan/sw_tags.c        |  8 ++++
>  7 files changed, 133 insertions(+), 24 deletions(-)
>  create mode 100644 mm/kasan/dense.c
>
> diff --git a/include/linux/kasan.h b/include/linux/kasan.h
> index ea0f5acd875b..5a3e9bec21c2 100644
> --- a/include/linux/kasan.h
> +++ b/include/linux/kasan.h
> @@ -33,6 +33,20 @@ typedef unsigned int __bitwise kasan_vmalloc_flags_t;
>
>  #include <linux/pgtable.h>
>
> +#ifndef kasan_mem_to_shadow
> +static inline void *kasan_mem_to_shadow(const void *addr)
> +{
> +       void *scaled;
> +
> +       if (IS_ENABLED(CONFIG_KASAN_GENERIC))
> +               scaled =3D (void *)((unsigned long)addr >> KASAN_SHADOW_S=
CALE_SHIFT);
> +       else
> +               scaled =3D (void *)((long)addr >> KASAN_SHADOW_SCALE_SHIF=
T);
> +
> +       return KASAN_SHADOW_OFFSET + scaled;
> +}
> +#endif

Any reason this is moved up here?


> +
>  /* Software KASAN implementations use shadow memory. */
>
>  #ifdef CONFIG_KASAN_SW_TAGS_DENSE
> @@ -53,6 +67,25 @@ static inline u8 kasan_dense_tag(u8 tag)
>
>  #define KASAN_GRANULE_SIZE     (1UL << KASAN_GRANULE_SHIFT)
>
> +#ifdef CONFIG_KASAN_SW_TAGS_DENSE
> +static inline u8 kasan_get_shadow_tag(const void *ptr)
> +{
> +       u8 shadow_byte =3D *(u8 *)kasan_mem_to_shadow(ptr);
> +       unsigned long addr =3D (unsigned long)ptr;
> +       int shift;
> +
> +       shift =3D !!(addr & KASAN_GRANULE_SIZE) * KASAN_TAG_WIDTH;
> +       shadow_byte >>=3D shift;
> +
> +       return shadow_byte & KASAN_TAG_KERNEL;
> +}
> +#else
> +static inline u8 kasan_get_shadow_tag(const void *addr)
> +{
> +       return (*(u8 *)kasan_mem_to_shadow(addr));
> +}
> +#endif
> +
>  #ifdef CONFIG_KASAN_SW_TAGS
>  /* This matches KASAN_TAG_INVALID. */
>  #define KASAN_SHADOW_INIT 0xFE
> @@ -73,20 +106,6 @@ extern p4d_t kasan_early_shadow_p4d[MAX_PTRS_PER_P4D]=
;
>  int kasan_populate_early_shadow(const void *shadow_start,
>                                 const void *shadow_end);
>
> -#ifndef kasan_mem_to_shadow
> -static inline void *kasan_mem_to_shadow(const void *addr)
> -{
> -       void *scaled;
> -
> -       if (IS_ENABLED(CONFIG_KASAN_GENERIC))
> -               scaled =3D (void *)((unsigned long)addr >> KASAN_SHADOW_S=
CALE_SHIFT);
> -       else
> -               scaled =3D (void *)((long)addr >> KASAN_SHADOW_SCALE_SHIF=
T);
> -
> -       return KASAN_SHADOW_OFFSET + scaled;
> -}
> -#endif
> -
>  int kasan_add_zero_shadow(void *start, unsigned long size);
>  void kasan_remove_zero_shadow(void *start, unsigned long size);
>
> diff --git a/mm/kasan/Makefile b/mm/kasan/Makefile
> index b88543e5c0cc..3a460abd4c18 100644
> --- a/mm/kasan/Makefile
> +++ b/mm/kasan/Makefile
> @@ -5,6 +5,7 @@ KCOV_INSTRUMENT :=3D n
>
>  # Disable ftrace to avoid recursion.
>  CFLAGS_REMOVE_common.o =3D $(CC_FLAGS_FTRACE)
> +CFLAGS_REMOVE_dense.o =3D $(CC_FLAGS_FTRACE)
>  CFLAGS_REMOVE_generic.o =3D $(CC_FLAGS_FTRACE)
>  CFLAGS_REMOVE_init.o =3D $(CC_FLAGS_FTRACE)
>  CFLAGS_REMOVE_quarantine.o =3D $(CC_FLAGS_FTRACE)
> @@ -24,6 +25,7 @@ CC_FLAGS_KASAN_RUNTIME +=3D -fno-stack-protector
>  CC_FLAGS_KASAN_RUNTIME +=3D -DDISABLE_BRANCH_PROFILING
>
>  CFLAGS_common.o :=3D $(CC_FLAGS_KASAN_RUNTIME)
> +CFLAGS_dense.o :=3D $(CC_FLAGS_KASAN_RUNTIME)
>  CFLAGS_generic.o :=3D $(CC_FLAGS_KASAN_RUNTIME)
>  CFLAGS_init.o :=3D $(CC_FLAGS_KASAN_RUNTIME)
>  CFLAGS_quarantine.o :=3D $(CC_FLAGS_KASAN_RUNTIME)
> @@ -49,6 +51,7 @@ RUSTFLAGS_kasan_test_rust.o :=3D $(RUSTFLAGS_KASAN)
>  CFLAGS_kasan_test_module.o :=3D $(CFLAGS_KASAN_TEST)
>
>  obj-y :=3D common.o report.o
> +obj-$(CONFIG_KASAN_SW_TAGS_DENSE) +=3D dense.o
>  obj-$(CONFIG_KASAN_GENERIC) +=3D init.o generic.o report_generic.o shado=
w.o quarantine.o
>  obj-$(CONFIG_KASAN_HW_TAGS) +=3D hw_tags.o report_hw_tags.o tags.o repor=
t_tags.o
>  obj-$(CONFIG_KASAN_SW_TAGS) +=3D init.o report_sw_tags.o shadow.o sw_tag=
s.o tags.o report_tags.o
> diff --git a/mm/kasan/dense.c b/mm/kasan/dense.c
> new file mode 100644
> index 000000000000..306bbbfdce29
> --- /dev/null
> +++ b/mm/kasan/dense.c
> @@ -0,0 +1,83 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include "kasan.h"
> +
> +static __always_inline bool kasan_check_range_inline(const void *addr,
> +                                                    size_t size, bool wr=
ite,
> +                                                    unsigned long ret_ip=
)
> +{
> +       u8 *shadow_first, *shadow_last, *shadow, *shadow_first_aligned, *=
shadow_last_aligned;
> +       u64 addr_start_aligned, addr_end_aligned;
> +       u8 tag, kasan_granule_offset;
> +       size_t aligned_size;
> +       void *untagged_addr;
> +
> +       if (unlikely(size =3D=3D 0))
> +               return true;
> +
> +       if (unlikely(addr + size < addr))
> +               return !kasan_report(addr, size, write, ret_ip);
> +
> +       tag =3D get_tag((const void *)addr);
> +
> +       /*
> +        * Ignore accesses for pointers tagged with native kernel
> +        * pointer tag to suppress false positives caused by kmap.
> +        *
> +        * Some kernel code was written to account for archs that don't k=
eep
> +        * high memory mapped all the time, but rather map and unmap part=
icular
> +        * pages when needed. Instead of storing a pointer to the kernel =
memory,
> +        * this code saves the address of the page structure and offset w=
ithin
> +        * that page for later use. Those pages are then mapped and unmap=
ped
> +        * with kmap/kunmap when necessary and virt_to_page is used to ge=
t the
> +        * virtual address of the page. For arm64 (that keeps the high me=
mory
> +        * mapped all the time), kmap is turned into a page_address call.
> +
> +        * The issue is that with use of the page_address + virt_to_page
> +        * sequence the top byte value of the original pointer gets lost =
(gets
> +        * set to KASAN_TAG_KERNEL).
> +        */
> +       if (tag =3D=3D KASAN_TAG_KERNEL)
> +               return true;
> +
> +       untagged_addr =3D kasan_reset_tag((void *)round_down((u64)addr, K=
ASAN_GRANULE_SIZE));
> +       if (unlikely(!addr_has_metadata(untagged_addr)))
> +               return !kasan_report(addr, size, write, ret_ip);
> +
> +       kasan_granule_offset =3D ((u64)addr & KASAN_GRANULE_MASK);
> +       aligned_size =3D round_up(size + kasan_granule_offset, KASAN_GRAN=
ULE_SIZE);
> +       shadow_first =3D kasan_mem_to_shadow(untagged_addr);
> +       shadow_last =3D kasan_mem_to_shadow(untagged_addr + aligned_size)=
;
> +       addr_start_aligned =3D round_up((u64)untagged_addr, KASAN_SHADOW_=
SCALE_SIZE);
> +       addr_end_aligned =3D round_down((u64)untagged_addr + aligned_size=
, KASAN_SHADOW_SCALE_SIZE);
> +       shadow_first_aligned =3D kasan_mem_to_shadow((void *)addr_start_a=
ligned);
> +       shadow_last_aligned =3D kasan_mem_to_shadow((void *)addr_end_alig=
ned);
> +
> +       /* Check the first unaligned tag in shadow memory. */
> +       if ((u64)untagged_addr % KASAN_SHADOW_SCALE_SIZE) {
> +               if (unlikely((*shadow_first >> KASAN_TAG_WIDTH) !=3D tag)=
)
> +                       return !kasan_report(addr, size, write, ret_ip);
> +       }
> +
> +       /* Check the middle aligned part in shadow memory. */
> +       for (shadow =3D shadow_first_aligned; shadow < shadow_last_aligne=
d; shadow++) {
> +               if (unlikely(*shadow !=3D ((tag << KASAN_TAG_WIDTH) | tag=
)))
> +                       return !kasan_report(addr, size, write, ret_ip);
> +       }
> +
> +       /* Check the last unaligned tag in shadow memory. */
> +       if (((u64)untagged_addr + aligned_size) % KASAN_SHADOW_SCALE_SIZE=
) {
> +               if (unlikely((*shadow_last & KASAN_TAG_MASK) !=3D tag))
> +                       return !kasan_report(addr, size, write, ret_ip);
> +       }
> +
> +       return true;
> +}
> +
> +#if IS_ENABLED(CONFIG_KASAN_SW_TAGS_DENSE)
> +bool kasan_check_range(const void *addr, size_t size, bool write,
> +                      unsigned long ret_ip)
> +{
> +       return kasan_check_range_inline(addr, size, write, ret_ip);
> +}
> +#endif
> diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> index 0e04c5e2c405..d29bd0e65020 100644
> --- a/mm/kasan/kasan.h
> +++ b/mm/kasan/kasan.h
> @@ -183,7 +183,7 @@ static inline bool kasan_requires_meta(void)
>  #define META_BYTES_PER_BLOCK 1
>  #define META_BLOCKS_PER_ROW 16
>  #define META_BYTES_PER_ROW (META_BLOCKS_PER_ROW * META_BYTES_PER_BLOCK)
> -#define META_MEM_BYTES_PER_ROW (META_BYTES_PER_ROW * KASAN_GRANULE_SIZE)
> +#define META_MEM_BYTES_PER_ROW (META_BYTES_PER_ROW * KASAN_SHADOW_SCALE_=
SIZE)
>  #define META_ROWS_AROUND_ADDR 2
>
>  #define KASAN_STACK_DEPTH 64
> diff --git a/mm/kasan/report.c b/mm/kasan/report.c
> index c08097715686..ee9e406b0cdb 100644
> --- a/mm/kasan/report.c
> +++ b/mm/kasan/report.c
> @@ -436,7 +436,7 @@ static int meta_pointer_offset(const void *row, const=
 void *addr)
>          *    plus 1 byte for space.
>          */
>         return 3 + (BITS_PER_LONG / 8) * 2 +
> -               (addr - row) / KASAN_GRANULE_SIZE * 3 + 1;
> +               (addr - row) / KASAN_SHADOW_SCALE_SIZE * 3 + 1;
>  }
>
>  static void print_memory_metadata(const void *addr)
> diff --git a/mm/kasan/report_sw_tags.c b/mm/kasan/report_sw_tags.c
> index 689e94f9fe3c..1ac5c7a9011d 100644
> --- a/mm/kasan/report_sw_tags.c
> +++ b/mm/kasan/report_sw_tags.c
> @@ -39,7 +39,7 @@ const void *kasan_find_first_bad_addr(const void *addr,=
 size_t size)
>         if (!addr_has_metadata(p))
>                 return p;
>
> -       while (p < end && tag =3D=3D *(u8 *)kasan_mem_to_shadow(p))
> +       while (p < end && tag =3D=3D kasan_get_shadow_tag(p))
>                 p +=3D KASAN_GRANULE_SIZE;
>
>         return p;
> @@ -48,7 +48,6 @@ const void *kasan_find_first_bad_addr(const void *addr,=
 size_t size)
>  size_t kasan_get_alloc_size(void *object, struct kmem_cache *cache)
>  {
>         size_t size =3D 0;
> -       u8 *shadow;
>
>         /*
>          * Skip the addr_has_metadata check, as this function only operat=
es on
> @@ -59,13 +58,11 @@ size_t kasan_get_alloc_size(void *object, struct kmem=
_cache *cache)
>          * The loop below returns 0 for freed objects, for which KASAN ca=
nnot
>          * calculate the allocation size based on the metadata.
>          */
> -       shadow =3D (u8 *)kasan_mem_to_shadow(object);
>         while (size < cache->object_size) {
> -               if (*shadow !=3D KASAN_TAG_INVALID)
> +               if (kasan_get_shadow_tag(object + size) !=3D KASAN_TAG_IN=
VALID)
>                         size +=3D KASAN_GRANULE_SIZE;
>                 else
>                         return size;
> -               shadow++;
>         }
>
>         return cache->object_size;
> @@ -78,9 +75,8 @@ void kasan_metadata_fetch_row(char *buffer, void *row)
>
>  void kasan_print_tags(u8 addr_tag, const void *addr)
>  {
> -       u8 *shadow =3D (u8 *)kasan_mem_to_shadow(addr);
> -
> -       pr_err("Pointer tag: [%02x], memory tag: [%02x]\n", addr_tag, *sh=
adow);
> +       pr_err("Pointer tag: [%02x], memory tag: [%02x]\n", addr_tag,
> +              kasan_get_shadow_tag(addr));
>  }
>
>  #ifdef CONFIG_KASAN_STACK
> diff --git a/mm/kasan/sw_tags.c b/mm/kasan/sw_tags.c
> index 32435d33583a..7a6b8ea9bf78 100644
> --- a/mm/kasan/sw_tags.c
> +++ b/mm/kasan/sw_tags.c
> @@ -79,6 +79,7 @@ u8 __hwasan_generate_tag(void)
>  }
>  EXPORT_SYMBOL(__hwasan_generate_tag);
>
> +#if !IS_ENABLED(CONFIG_KASAN_SW_TAGS_DENSE)
>  bool kasan_check_range(const void *addr, size_t size, bool write,
>                         unsigned long ret_ip)
>  {
> @@ -127,17 +128,24 @@ bool kasan_check_range(const void *addr, size_t siz=
e, bool write,
>
>         return true;
>  }
> +#endif
>
>  bool kasan_byte_accessible(const void *addr)
>  {
>         u8 tag =3D get_tag(addr);
>         void *untagged_addr =3D kasan_reset_tag(addr);
>         u8 shadow_byte;
> +       int shift;
>
>         if (!addr_has_metadata(untagged_addr))
>                 return false;
>
>         shadow_byte =3D READ_ONCE(*(u8 *)kasan_mem_to_shadow(untagged_add=
r));
> +       if (IS_ENABLED(CONFIG_KASAN_SW_TAGS_DENSE)) {
> +               shift =3D !!((u64)addr & BIT(KASAN_TAG_WIDTH)) * KASAN_TA=
G_WIDTH;
> +               shadow_byte =3D (shadow_byte >> shift) & KASAN_TAG_KERNEL=
;
> +       }
> +
>         return tag =3D=3D KASAN_TAG_KERNEL || tag =3D=3D shadow_byte;
>  }
>
> --
> 2.47.1
>
