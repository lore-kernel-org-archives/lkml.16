Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98F51519AC;
	Wed,  5 Feb 2025 23:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738799040; cv=none; b=E6xK33pcvIg8dIT13LHf+Po+yL6gBlxOJ4Ep7PKPYH9drQLHyM4VdduvftW/OIqtwhJvkV9crvON0JMuhG1xLHF35Ye2niAty22iiF45Js0Po2keSqAdpLzhDkvpIlbVxH/Kz0Id4RoesUluDxG8nor7G0AuwTUPmzwwpnTlAyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738799040; c=relaxed/simple;
	bh=caQT1VAruVJZyYFBwKqf+5DBhF9Jx8BYjjCDJbxi8Dk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=du8EeQE6nh784MsHM0gZWB3Nv2bisyic9LgmYtCpbr9n7xNMxOkSohCMgyE6ot4eA8KlZrUma1slLIyGH4M9hJtiigyzaW7dzwkjh6QZA3wuxHJCYLGibubQPRwGUxJc+JuJS1OjDSWjrsOrOLvLT3lfoRJK9ppP+oVSID3pFM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cfjc5WOx; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cfjc5WOx"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38daf156e97so144670f8f.0;
        Wed, 05 Feb 2025 15:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738799037; x=1739403837; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aGo4tCOA20uwm5WJCsot6mmTXWb0qFu219UCGH8y36Q=;
        b=cfjc5WOxItMXNRgR156zQvZ/9qYzdygCyjmjgdHYfhA0z+hM45Th7XNG7CmBZFOd22
         cQuSrh5PRR0IXzPIH87+UYslJIrfSISw4DC0z5ItiH8B5VpRwcR9MaTI5qTHJudvw74b
         8WOkX/6L44bjnK4UjRXd0UIqAh4xmjmk1fNX6GE+rK9++t6LpOP39MblaG6vG5PIOLjM
         rNliuQ/QcLn0Qb425uJgf5FdsHhaRh/z1WzToKCVt+UEwxBsyxDcApze/IsNWemhVW1P
         5ncmqu+qONkSQYCY9C72CmQGFmZ8b369BR9biaBzBJhYQ7AFGXNSyAAOnzQZijOGeY7O
         8R/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738799037; x=1739403837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aGo4tCOA20uwm5WJCsot6mmTXWb0qFu219UCGH8y36Q=;
        b=t7G3xAH4WthBP+773WYb/5a9jOHDL93xBv68OFCrIHYxzeAJyZLv1O7RSiFR0WfuXx
         ihINJRQZn1aQtGgjI1/i7v2BwaXYoFoz0etZhI8RbF9o5nQLujCxXfJedpzvioamtetB
         HvIymn7nG2xmT3vWQLLig2Y9Jo9TEVqy1i0t5WqFZTvo0Ok7c1nBYXVYrzMjzj7bO31O
         Nn/KT+/LdP3oJsTd7Qaf7J39/KYIC2acTAIBX5jMWv8pqc1iMMkm1aTrEFFBJ0FaFKGc
         ylcw3na8/PRACfZMM1tq3bMNIsVR2IpsQ7bl1ai/81UAcYCSmB1NWxN5NPdXONy/vxae
         aBMg==
X-Forwarded-Encrypted: i=1; AJvYcCUbBO2zJ+gOYesAak8GbtYUzE0RusuF6hFd2pxdZS41IP3Q9B6VC/942Q71hO+utALELdFCnesy83d1rMj3@vger.kernel.org, AJvYcCXU4aU0xefQGq9Sf8bxcSBehg5MDTEMB6XCEJ8fvwoQidqP/VqTRfrV9p+kqXlObIdwG6LSgi4+dQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPRVahZJ2kFawtrE589Z8gx6jZ1/q4Clc27Yy9WC73aVIc/3rS
	I63fN6g5Zxvsq/1LZXU++MCKX48aJViOgVsmusWzPy6W+pWLF00a+LJf1WhGeWBRUJWkrC1dfBP
	3UVRL+W/5iC7Relu0jQz19EYd9F4=
X-Gm-Gg: ASbGncuzy6XtNl0wfqOtv7xO4kX7dv7kdmsE3Iqb4xokyDalBhKSTs1SOXvj1aHwbQy
	B/JGROzZe2jVenJTHb9N6uXHPkudi7xv9l3HZNMQp+s2qsb1sRVx9XB3BU19WpCZofgqo73HEKA
	==
X-Google-Smtp-Source: AGHT+IFKv9CmFOCpshmLHOVTz/+nJCvoTktlcFWAvpeIbb7F3am3sTbbPPiOxOKYQ2fGikByHOPLiYyKm0JTH3qTGZg=
X-Received: by 2002:a05:6000:11c3:b0:38c:617c:ee22 with SMTP id
 ffacd0b85a97d-38db48e8e74mr2835161f8f.54.1738799036822; Wed, 05 Feb 2025
 15:43:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com> <808cc6516f47d5f5e811d2c237983767952f3743.1738686764.git.maciej.wieczor-retman@intel.com>
In-Reply-To: <808cc6516f47d5f5e811d2c237983767952f3743.1738686764.git.maciej.wieczor-retman@intel.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Thu, 6 Feb 2025 00:43:46 +0100
X-Gm-Features: AWEUYZm1UyfErQs1w01vhNGFZmNjvN3ORJYc2s5iPoOpZVl-pALgPbNFMXszvaU
Message-ID: <CA+fCnZd3sP1_x2c5FvztA6LzsBY3Fq3cD5cJ6FQ+FAnmawe06Q@mail.gmail.com>
Subject: Re: [PATCH 01/15] kasan: Allocation enhancement for dense tag-based mode
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

On Tue, Feb 4, 2025 at 6:34=E2=80=AFPM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> Tag-based KASAN (on arm64) works by generating a random 8-bit tag and
> putting it in both the top byte of the pointer (that points to the
> allocated memory) and into all bytes of shadow memory that correspond to
> the chunk of allocated regular memory. Each byte of shadow memory covers
> a 16 byte chunk of allocated memory - a value called KASAN granularity.
> This means that out-of-bounds memory accesses that happen inside the 16
> bytes can't be caught.
>
> The dense mode offers reducing the tag width from 8 to 4 bits and
> storing two tags in one byte of shadow memory - one in the upper 4 bits
> of the byte and one in the lower 4. This way one byte of shadow memory
> can cover 32 bytes of allocated memory while still keeping the "16 bytes
> per one tag" granularity. The lower 4 bits of each shadow byte map bytes
> of memory with offsets 0-15 and the upper 4 bits map offsets 16-31.
>
> Example:
> The example below shows how the shadow memory looks like after
> allocating 48 bytes of memory in both normal tag-based mode and the
> dense mode. The contents of shadow memory are overlaid onto address
> offsets that they relate to in the allocated kernel memory. Each cell
> |    | symbolizes one byte of shadow memory.
>
> =3D The regular tag based mode:
> - Randomly generated 8-bit tag equals 0xAB.
> - 0xFE is the tag that symbolizes unallocated memory.
>
> Shadow memory contents:           |  0xAB  |  0xAB  |  0xAB  |  0xFE  |
> Shadow memory address offsets:    0        1        2        3        4
> Allocated memory address offsets: 0        16       32       48       64
>
> =3D The dense tag based mode:
> - Randomly generated 4-bit tag equals 0xC.
> - 0xE is the tag that symbolizes unallocated memory.
>
> Shadow memory contents:           |0xC 0xC |0xC 0xE |0xE 0xE |0xE 0xE |
> Shadow memory address offsets:    0        1        2        3        4
> Allocated memory address offsets: 0        32       64       96       128
>
> Add a new config option and defines that can override the standard
> system of one tag per one shadow byte.
>
> Add alternative version of the kasan_poison() that deals with tags not
> being aligned to byte size in shadow memory.
>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> ---
>  include/linux/kasan.h | 18 ++++++++++++++++++
>  lib/Kconfig.kasan     | 21 +++++++++++++++++++++
>  mm/kasan/kasan.h      |  4 +---
>  mm/kasan/shadow.c     | 33 ++++++++++++++++++++++++++++++---
>  4 files changed, 70 insertions(+), 6 deletions(-)
>
> diff --git a/include/linux/kasan.h b/include/linux/kasan.h
> index 03b440658817..ea0f5acd875b 100644
> --- a/include/linux/kasan.h
> +++ b/include/linux/kasan.h
> @@ -35,6 +35,24 @@ typedef unsigned int __bitwise kasan_vmalloc_flags_t;
>
>  /* Software KASAN implementations use shadow memory. */
>
> +#ifdef CONFIG_KASAN_SW_TAGS_DENSE
> +#define KASAN_GRANULE_SHIFT    (KASAN_SHADOW_SCALE_SHIFT - 1)
> +#define KASAN_SHADOW_SCALE_SIZE        (1UL << KASAN_SHADOW_SCALE_SHIFT)
> +static inline u8 kasan_dense_tag(u8 tag)
> +{
> +       return (tag << KASAN_TAG_WIDTH | tag);
> +}
> +#else
> +#define KASAN_GRANULE_SHIFT    KASAN_SHADOW_SCALE_SHIFT
> +#define KASAN_SHADOW_SCALE_SIZE        (1UL << KASAN_GRANULE_SHIFT)
> +static inline u8 kasan_dense_tag(u8 tag)
> +{
> +       return tag;
> +}
> +#endif
> +
> +#define KASAN_GRANULE_SIZE     (1UL << KASAN_GRANULE_SHIFT)
> +

Is there a reason these definitions are added to
include/linux/kasan.h? At least within this patch, they are only used
within mm/kasan, so let's keep them in mm/kasan/kasan.h.

>  #ifdef CONFIG_KASAN_SW_TAGS
>  /* This matches KASAN_TAG_INVALID. */
>  #define KASAN_SHADOW_INIT 0xFE
> diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
> index 98016e137b7f..d08b4e9bf477 100644
> --- a/lib/Kconfig.kasan
> +++ b/lib/Kconfig.kasan
> @@ -19,6 +19,13 @@ config ARCH_DISABLE_KASAN_INLINE
>           Disables both inline and stack instrumentation. Selected by
>           architectures that do not support these instrumentation types.
>
> +config ARCH_HAS_KASAN_SW_TAGS_DENSE
> +       bool
> +       help
> +         Enables option to compile tag-based KASAN with densely packed t=
ags -
> +         two 4-bit tags per one byte of shadow memory. Set on architectu=
res
> +         that have 4-bit tag macros.
> +
>  config CC_HAS_KASAN_GENERIC
>         def_bool $(cc-option, -fsanitize=3Dkernel-address)
>
> @@ -223,4 +230,18 @@ config KASAN_EXTRA_INFO
>           boot parameter, it will add 8 * stack_ring_size bytes of additi=
onal
>           memory consumption.
>
> +config KASAN_SW_TAGS_DENSE
> +       bool "Two 4-bit tags in one shadow memory byte"
> +       depends on KASAN_SW_TAGS
> +       depends on ARCH_HAS_KASAN_SW_TAGS_DENSE

I think this should also depend on KASAN_OUTLINE: Clang/GCC aren't
aware of the dense mode.

> +       help
> +         Enables packing two tags into one shadow byte to half the memor=
y usage
> +         compared to normal tag-based mode.

But adds some performance impact?

> +
> +         After setting this option, tag width macro is set to 4 and size=
 macros
> +         are adjusted based on used KASAN_SHADOW_SCALE_SHIFT.

I think this paragraph is an implementation detail and we can drop it.

> +
> +         ARCH_HAS_KASAN_SW_TAGS_DENSE is needed for this option since th=
e
> +         special tag macros need to be properly set for 4-bit wide tags.
> +
>  endif # KASAN
> diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
> index 72da5ddcceaa..0e04c5e2c405 100644
> --- a/mm/kasan/kasan.h
> +++ b/mm/kasan/kasan.h
> @@ -128,9 +128,7 @@ static inline bool kasan_requires_meta(void)
>
>  #endif /* CONFIG_KASAN_GENERIC */
>
> -#if defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)
> -#define KASAN_GRANULE_SIZE     (1UL << KASAN_SHADOW_SCALE_SHIFT)
> -#else
> +#ifdef CONFIG_KASAN_HW_TAGS
>  #include <asm/mte-kasan.h>
>  #define KASAN_GRANULE_SIZE     MTE_GRANULE_SIZE
>  #endif
> diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
> index d6210ca48dda..368503f54b87 100644
> --- a/mm/kasan/shadow.c
> +++ b/mm/kasan/shadow.c
> @@ -123,7 +123,8 @@ EXPORT_SYMBOL(__hwasan_memcpy);
>
>  void kasan_poison(const void *addr, size_t size, u8 value, bool init)
>  {
> -       void *shadow_start, *shadow_end;
> +       u8 *shadow_start, *shadow_end, *shadow_start_aligned, *shadow_end=
_aligned, tag;
> +       u64 addr64, addr_start_aligned, addr_end_aligned;
>
>         if (!kasan_arch_is_ready())
>                 return;
> @@ -134,16 +135,42 @@ void kasan_poison(const void *addr, size_t size, u8=
 value, bool init)
>          * addresses to this function.
>          */
>         addr =3D kasan_reset_tag(addr);
> +       addr64 =3D (u64)addr;
>
> -       if (WARN_ON((unsigned long)addr & KASAN_GRANULE_MASK))
> +       if (WARN_ON(addr64 & KASAN_GRANULE_MASK))
>                 return;
>         if (WARN_ON(size & KASAN_GRANULE_MASK))
>                 return;
>
>         shadow_start =3D kasan_mem_to_shadow(addr);
>         shadow_end =3D kasan_mem_to_shadow(addr + size);
> +       addr_start_aligned =3D round_up(addr64, KASAN_SHADOW_SCALE_SIZE);
> +       addr_end_aligned =3D round_down(addr64 + size, KASAN_SHADOW_SCALE=
_SIZE);
> +       shadow_start_aligned =3D kasan_mem_to_shadow((void *)addr_start_a=
ligned);
> +       shadow_end_aligned =3D kasan_mem_to_shadow((void *)addr_end_align=
ed);
> +
> +       /* If size is empty just return. */
> +       if (!size)
> +               return;
>
> -       __memset(shadow_start, value, shadow_end - shadow_start);
> +       /* Memset the first unaligned tag in shadow memory. */
> +       if (addr64 % KASAN_SHADOW_SCALE_SIZE) {

So this is required, because KASAN_SHADOW_SCALE_SIZE is 32 but minimal
slab alignment is still KASAN_GRANULE_SIZE =3D=3D 16... We should at least
hide this check is under IS_ENABLED(KASAN_SW_TAGS_DENSE).

> +               tag =3D *shadow_start & KASAN_TAG_MASK;
> +               tag |=3D value << KASAN_TAG_WIDTH;
> +               *shadow_start =3D tag;
> +       }
> +
> +       /* Memset the middle aligned part in shadow memory. */
> +       tag =3D kasan_dense_tag(value);
> +       __memset(shadow_start_aligned, tag, shadow_end_aligned - shadow_s=
tart_aligned);
> +
> +       /* Memset the last unaligned tag in shadow memory. */
> +       if ((addr64 + size) % KASAN_SHADOW_SCALE_SIZE) {

Would it be possible to move this part to kasan_poison_last_granule()?
That functions seems to be serving a similar purpose but for the
Generic mode.

It might also be cleaner to add a kasan_poison_first_granule() that
contains the if (addr64 % KASAN_SHADOW_SCALE_SIZE) check.

> +               tag =3D KASAN_TAG_MASK << KASAN_TAG_WIDTH;
> +               tag &=3D *shadow_end;
> +               tag |=3D value;
> +               *shadow_end =3D tag;
> +       }
>  }
>  EXPORT_SYMBOL_GPL(kasan_poison);
>
> --
> 2.47.1
>
