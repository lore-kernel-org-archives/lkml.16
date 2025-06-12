Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEB579E1
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 06:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749711156; cv=none; b=hRAe8i+3mkTO/kV1lln/LrSfH4ZnKu2Dg3f4e/eNLp2/EottM5NaJ7FhPrmvdNuqZBfzvUcQFV2L3Q3H8CI3jmFINJA2WxpWvCL7aCUxfCozGG3OnGfM4TJ1k+VnZTvg3ESyBIZp2Vbn9vfTGmHPdtfqM7F0YW/YWcOWiCihCcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749711156; c=relaxed/simple;
	bh=jgzVdAv2U9AmZZSmvRc4C4uJNRNVy2QMy5VDpk7tcHg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nLCAfFh4CV/9h8WsS7KnALrRgQSAUZvqwMf6CjU96n31ujWP6jRxRgG+EFPx9bzpl56NCZ5QpL/hdNvJyfYruAHErKx3JXcBqgGrHm5m67HR0je9lOQ3P2E3LzHE381HhDzY2veZ0+E8O8ZIEhiAE4/xjFGHVOC7oFvaU2g+0fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=maKWKdwa; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="maKWKdwa"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6065251725bso444148eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 23:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749711153; x=1750315953; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W2/+iUlaJ294s+wpba9MY64GmUZ7LAOV32lfNtCqjkY=;
        b=maKWKdwaxFOtZ6sWBgbuaanra9OFCadilztLYCJJXPP+K2rKcCgaLI8RFCp0XUFIAY
         H0mgtL2e2vN4pj95jdSDHk++ZkjjwOSi9xg5XASjl2RAUMq2zWJgjJI9yL7eRf9AW9wS
         vxIQ1jilzjomKsa0zBqUG4xMkF+jFKtm4ulPeOloG76vkKYspN61tDZS7J0Nfyu7B3MO
         zHaSLhBEebz1uU0wJX8mfUtgtATQgqlgEGpLeWzYEmhzG3xr2xYtINSPX4fWbuADvLGh
         bvBwhvkJP1LkQ17RL042AwzeWL/bNVAtyGn0fxi2+SE8bbEiPMZcgbfC6lS7wkrRgyPa
         FdVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749711153; x=1750315953;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W2/+iUlaJ294s+wpba9MY64GmUZ7LAOV32lfNtCqjkY=;
        b=p5LVLYnjWVwTKIZexAzsXlPQ6C/AyMj7CPRz5u4Z42qPp5Jd7B+e25ntClq0ENvgqb
         TmajVk3DcZAGL1+FC0HVjrjj59g2oguDjUItiT54vBFqBksl3K5tlnC9Kb35bozYbdD/
         cXzzWa9VDrOixjJuJgO5EfUUR7cHwH8XXvwqkQSz4Yjgs7Mo/HXzuZmZTlJLOQTHzUR6
         GeMimx5fQ2IWPu9AFfNopKCCHyCj7IaKkTJTs48eZy96gee3Ty5XCXOizm8kQRkGBV3E
         uncohF5YRs8ZZ4m84QMstBoHdILDL6KPwgXqECgwNgAbe9MlysxsdKaaU1XV/JB6GMmo
         wAfw==
X-Forwarded-Encrypted: i=1; AJvYcCXzOmkiRh15R6gZM8rQCItGninixHRSGHsNKaKE2rbLm9V4wIxKYcFlVbhLEKtxOS43lw+koGDI698KA60=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo/DNUAbnACd9bedJ77yh5iUZL4lQjc+uo00JKOAju+OBUfG44
	DClSn5s73drDHy8jqZ3kH17vMmbQKnU77SKHhgtIpVDlWMRKIb3+IgL5UJYAQSqdpmDNvlOWDre
	ychtK79Zikdrlwz3mdgXsaqF0aNrdQ7E=
X-Gm-Gg: ASbGncvLHcOZIdMPRXO5vy0t8T9lGnWzm3DN1XiIXMhobXS4AdJUJ/82XtvH8p3aFRZ
	mjFWh8aH40zQ7m6IbrIWMo2t6NHz7svQ9Smx6i2RIg+IpoHucKBEzYYYvcpYtQlxSTh2JEfJ7Ax
	bX69b6gxeMc8VwqXh94Bvh2oCNjk1LjqUonsrTjwKL+ezruLv7ntBTykI7ngjtnHfn586mkWWt3
	2s=
X-Google-Smtp-Source: AGHT+IEXaSAxJHBD5zJ/jXr/ytazFvv/SzoH8XkasFy+/Ngo9EnWqRZ5Z/KblRlbN0mv5KgJa+BmqpKyWeNniLArqs8=
X-Received: by 2002:a05:6870:b489:b0:2e8:7471:6350 with SMTP id
 586e51a60fabf-2eab6ee974fmr940028fac.1.1749711153330; Wed, 11 Jun 2025
 23:52:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409095320.224100-1-zhangchunyan@iscas.ac.cn>
 <20250409095320.224100-3-zhangchunyan@iscas.ac.cn> <aEMkW8py61njmNLo@debug.ba.rivosinc.com>
In-Reply-To: <aEMkW8py61njmNLo@debug.ba.rivosinc.com>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Thu, 12 Jun 2025 14:51:57 +0800
X-Gm-Features: AX0GCFvfXefT5-e0VhoPel5shfY3P4DRms3fCl30qyUVp20BchYZ18iAG961p5E
Message-ID: <CAAfSe-u3oyjW7D0f=XUVaOJsM00Mqx7-LeR-Ecxjui3sfaAMUQ@mail.gmail.com>
Subject: Re: [PATCH RFC v7 2/3] riscv: mm: Add soft-dirty page tracking support
To: Deepak Gupta <debug@rivosinc.com>
Cc: Chunyan Zhang <zhangchunyan@iscas.ac.cn>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Andrew Morton <akpm@linux-foundation.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	Ved Shanbhogue <ved@rivosinc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Deepak,

On Sat, 7 Jun 2025 at 01:24, Deepak Gupta <debug@rivosinc.com> wrote:
>
> On Wed, Apr 09, 2025 at 05:53:19PM +0800, Chunyan Zhang wrote:
> >The Svrsw60t59b extension allows to free the PTE reserved bits 60 and 59
> >for software, this patch uses bit 59 for soft-dirty.
> >
> >To add swap PTE soft-dirty tracking, we borrow bit 3 which is available
> >for swap PTEs on RISC-V systems.
> >
> >Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> >---
> > arch/riscv/Kconfig                    |  1 +
> > arch/riscv/include/asm/pgtable-bits.h | 19 +++++++
> > arch/riscv/include/asm/pgtable.h      | 71 ++++++++++++++++++++++++++-
> > 3 files changed, 89 insertions(+), 2 deletions(-)
> >
> >diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> >index 332fc00243ad..652e2bbfb702 100644
> >--- a/arch/riscv/Kconfig
> >+++ b/arch/riscv/Kconfig
> >@@ -139,6 +139,7 @@ config RISCV
> >       select HAVE_ARCH_MMAP_RND_COMPAT_BITS if COMPAT
> >       select HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET
> >       select HAVE_ARCH_SECCOMP_FILTER
> >+      select HAVE_ARCH_SOFT_DIRTY if 64BIT && MMU && RISCV_ISA_SVRSW60T59B
> >       select HAVE_ARCH_STACKLEAK
> >       select HAVE_ARCH_THREAD_STRUCT_WHITELIST
> >       select HAVE_ARCH_TRACEHOOK
> >diff --git a/arch/riscv/include/asm/pgtable-bits.h b/arch/riscv/include/asm/pgtable-bits.h
> >index a8f5205cea54..a6fa871dc19e 100644
> >--- a/arch/riscv/include/asm/pgtable-bits.h
> >+++ b/arch/riscv/include/asm/pgtable-bits.h
> >@@ -20,6 +20,25 @@
> >
> > #define _PAGE_SPECIAL   (1 << 8)    /* RSW: 0x1 */
> > #define _PAGE_DEVMAP    (1 << 9)    /* RSW, devmap */
> >+
> >+#ifdef CONFIG_MEM_SOFT_DIRTY
> >+
> >+/* ext_svrsw60t59b: bit 59 for software dirty tracking */
> >+#define _PAGE_SOFT_DIRTY                                              \
> >+      ((riscv_has_extension_unlikely(RISCV_ISA_EXT_SVRSW60T59B)) ?    \
> >+       (1UL << 59) : 0)
> >+/*
> >+ * Bit 3 is always zero for swap entry computation, so we
> >+ * can borrow it for swap page soft-dirty tracking.
> >+ */
> >+#define _PAGE_SWP_SOFT_DIRTY                                          \
> >+      ((riscv_has_extension_unlikely(RISCV_ISA_EXT_SVRSW60T59B)) ?    \
> >+       _PAGE_EXEC : 0)
> >+#else
> >+#define _PAGE_SOFT_DIRTY      0
> >+#define _PAGE_SWP_SOFT_DIRTY  0
> >+#endif /* CONFIG_MEM_SOFT_DIRTY */
> >+
>
> Above can be done like this
>
> +
> +#ifdef CONFIG_MEM_SOFT_DIRTY && RISCV_ISA_EXT_SVRSW60T59B
> +
> +/* ext_svrsw60t59b: bit 59 for software dirty tracking */
> +#define _PAGE_SOFT_DIRTY (1UL << 59)
> +/*
> + * Bit 3 is always zero for swap entry computation, so we
> + * can borrow it for swap page soft-dirty tracking.
> + */
> +#define _PAGE_SWP_SOFT_DIRTY _PAGE_EXEC
> +#else
> +#define _PAGE_SOFT_DIRTY       0
> +#define _PAGE_SWP_SOFT_DIRTY   0
> +#endif /* CONFIG_MEM_SOFT_DIRTY */
>

No, the feature depends not only on the compile-time configuration but
also on the run-time environment.

We need to check if the platform on which the system is running
supports the extension SVRSW60T59B, and riscv_has_extension_unlikely()
does that check that is a run-time check, not a build-time condition.

> > #define _PAGE_TABLE     _PAGE_PRESENT
> >
> > /*
> >diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> >index 428e48e5f57d..14461ffe6321 100644
> >--- a/arch/riscv/include/asm/pgtable.h
> >+++ b/arch/riscv/include/asm/pgtable.h
> >@@ -436,7 +436,7 @@ static inline pte_t pte_mkwrite_novma(pte_t pte)
>
> Shouldn't "static inline int pte_dirty(pte_t pte)" be updated as well

It may not be needed, since pte_dirty() on X86 and ARM doesn't check
_PAGE_SOFT_DIRTY either.

Thanks for the review,
Chunyan




>
> static inline int pte_dirty(pte_t pte)
> {
>         return pte_val(pte) & (_PAGE_DIRTY | _PAGE_SOFT_DIRTY);
> }
>
> Perhaps have a macro which includes both dirty together and then use together.
>
>
> >
> > static inline pte_t pte_mkdirty(pte_t pte)
> > {
> >-      return __pte(pte_val(pte) | _PAGE_DIRTY);
> >+      return __pte(pte_val(pte) | _PAGE_DIRTY | _PAGE_SOFT_DIRTY);
> > }
> >
> > static inline pte_t pte_mkclean(pte_t pte)
> >@@ -469,6 +469,38 @@ static inline pte_t pte_mkhuge(pte_t pte)
> >       return pte;
> > }
> >
> >+#ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
> >+static inline bool pte_soft_dirty(pte_t pte)
> >+{
> >+      return !!(pte_val(pte) & _PAGE_SOFT_DIRTY);
> >+}
> >+
> >+static inline pte_t pte_mksoft_dirty(pte_t pte)
> >+{
> >+      return __pte(pte_val(pte) | _PAGE_SOFT_DIRTY);
> >+}
> >+
> >+static inline pte_t pte_clear_soft_dirty(pte_t pte)
> >+{
> >+      return __pte(pte_val(pte) & ~(_PAGE_SOFT_DIRTY));
> >+}
> >+
> >+static inline bool pte_swp_soft_dirty(pte_t pte)
> >+{
> >+      return !!(pte_val(pte) & _PAGE_SWP_SOFT_DIRTY);
> >+}
> >+
> >+static inline pte_t pte_swp_mksoft_dirty(pte_t pte)
> >+{
> >+      return __pte(pte_val(pte) | _PAGE_SWP_SOFT_DIRTY);
> >+}
> >+
> >+static inline pte_t pte_swp_clear_soft_dirty(pte_t pte)
> >+{
> >+      return __pte(pte_val(pte) & ~(_PAGE_SWP_SOFT_DIRTY));
> >+}
> >+#endif /* CONFIG_HAVE_ARCH_SOFT_DIRTY */
> >+
> > #ifdef CONFIG_RISCV_ISA_SVNAPOT
> > #define pte_leaf_size(pte)    (pte_napot(pte) ?                               \
> >                                       napot_cont_size(napot_cont_order(pte)) :\
> >@@ -821,6 +853,40 @@ static inline pud_t pud_mkspecial(pud_t pud)
> > }
> > #endif
> >
> >+#ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
> >+static inline bool pmd_soft_dirty(pmd_t pmd)
> >+{
> >+      return pte_soft_dirty(pmd_pte(pmd));
> >+}
> >+
> >+static inline pmd_t pmd_mksoft_dirty(pmd_t pmd)
> >+{
> >+      return pte_pmd(pte_mksoft_dirty(pmd_pte(pmd)));
> >+}
> >+
> >+static inline pmd_t pmd_clear_soft_dirty(pmd_t pmd)
> >+{
> >+      return pte_pmd(pte_clear_soft_dirty(pmd_pte(pmd)));
> >+}
> >+
> >+#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
> >+static inline bool pmd_swp_soft_dirty(pmd_t pmd)
> >+{
> >+      return pte_swp_soft_dirty(pmd_pte(pmd));
> >+}
> >+
> >+static inline pmd_t pmd_swp_mksoft_dirty(pmd_t pmd)
> >+{
> >+      return pte_pmd(pte_swp_mksoft_dirty(pmd_pte(pmd)));
> >+}
> >+
> >+static inline pmd_t pmd_swp_clear_soft_dirty(pmd_t pmd)
> >+{
> >+      return pte_pmd(pte_swp_clear_soft_dirty(pmd_pte(pmd)));
> >+}
> >+#endif /* CONFIG_ARCH_ENABLE_THP_MIGRATION */
> >+#endif /* CONFIG_HAVE_ARCH_SOFT_DIRTY */
> >+
> > static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
> >                               pmd_t *pmdp, pmd_t pmd)
> > {
> >@@ -910,7 +976,8 @@ extern pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
> >  *
> >  * Format of swap PTE:
> >  *    bit            0:       _PAGE_PRESENT (zero)
> >- *    bit       1 to 3:       _PAGE_LEAF (zero)
> >+ *    bit       1 to 2:       (zero)
> >+ *    bit            3:       _PAGE_SWP_SOFT_DIRTY
> >  *    bit            5:       _PAGE_PROT_NONE (zero)
> >  *    bit            6:       exclusive marker
> >  *    bits      7 to 11:      swap type
> >--
> >2.34.1
> >
