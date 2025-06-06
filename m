Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECF5289E20
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 17:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749230688; cv=none; b=f72Vv35wgxGmGGhn4gY9mU4EVbb7ElZ6DTOFpzzayBm4mRnvNv6Sd7AeFtBkuIbAz14U2nOgFcUajQPi0oqYzH8+Iyy5qyzuHssFEYtUJsRBLdsv0cE65nXYU1qKtGafEvUMy/Joh4jLS0+cnlGWMGrTvxLiNPIsZ1m+P04JaYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749230688; c=relaxed/simple;
	bh=aRCKhHRdREcdkXfU/rdVItEEZM6yKFM54RYxU//2jKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rKOBp6+lgsz8vOA7KRqscfOANWfMv+SmpS4B8fcknbOryQo9b8a4OB58TawJ4BH7Rn79G2xeyFA8E/8WaZSjSnMa27eB4SVNCHnkyO2GXks8/ipGBeaYqE5MmsupJhSLV8kUjyZn8Bw6KBqoC8fTxU0uK6AZl1mb1LqU/+2SIOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=kZxrlOC2; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="kZxrlOC2"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3122368d7cfso1995881a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 10:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1749230686; x=1749835486; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lRmqKOZp4D3Po4Bjw8bM54XRDD+6MB8FGn9lAZKiGFc=;
        b=kZxrlOC2wwclR/ota+A3js3F2QfgKvakzfB00mbL/APT8QIsMiNr3kLrNNWyTdVVwJ
         pUHUWpHgaX+DZkUdRCNuF/kM81JBnOiEaGkONpqw4JMFqhcGFG3kFQ/aSs4x/QXIaO6e
         Ge0fmCZlC0ew3pDWJ/DfB8zoqRg5dlynqMcEe3mAuA1sC0i+vz/GB+31aTmqRypDAaoD
         KNnb1ChBiovaQBdE434taR+H1Uh6bHGhJgEG1HKe0gnq3E2yaIB3DLYIszdYVh2Sp8wO
         Bns1bm4dN6d86mYhfteHRbZJP7jEpCXJbIfamuJ8dBE0/EsGc5CAdejK7lFvoh8XdeuC
         KbPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749230686; x=1749835486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lRmqKOZp4D3Po4Bjw8bM54XRDD+6MB8FGn9lAZKiGFc=;
        b=rKEGF1eSQfiF81e1gWq43PfNG2318pvZrjjcJRbMLOaHzaJAAvLVoTvNiSpZmLX2kQ
         +1XgZsC52Ghnsk0V8p/Jg5RPmn0xnWJ6Edi5gQKkE8wVVKJnU275hviES10W9Q7QLIFo
         gvrfoZQe2ff/JOy7ZTKTyEOJyCRYlhYLAbCuI/ZTVjT4wxlR5TUS7xE49j5Nm8FhZ6dm
         7WF9RBEvvpxJxzGu1mLps9EwY7wjT+MIarBe/BojS0Z+9pDE7zApATxy+Tl3087B9LPW
         5VGRc4agmQeuzg8HQipm2jbEV9WiEAe237zlNIvPw6wrgFNVTGd03poiUdHNc+b2pOt1
         NbWA==
X-Forwarded-Encrypted: i=1; AJvYcCVLv/3FHk//LtkGv6HyEY8GcZl5MbxoqE2OqCy790+sD9igud8pH7LgfNFyqkFXGIUwpp4uAydCHqp8kSU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw78I1sn3BtP+rrYyJ+mAjOW3AU2HW+YTwmv3yC4jq7+Rdrx1tN
	7N81elg2E0yURNNkGWqHaHinzZ8OC97OdzqUAzeMGW+zuqEgSo0IN21A5GYewvaJCNw=
X-Gm-Gg: ASbGnctbm5pqYKoLy9IZAF/cr5VzJz9XCD+xolxtYK7xuCfPsBEBpzfpDXg6hrRejDq
	RHEltD4/Ftp+dcNm/hkeGHzM9MKyOMYN5s64USp5u/yPZ6Xes69hT5au4OTG4uDT9AoL0C8CtlQ
	h+U4GETharwfldJuIqrzxW2dhaXCe/hAuZCJi0lIeSCM/mB2MhdEV9j5FVf53W0jQMyubws2l5f
	ETsQ/4SRrXrIvREfBGS2Vr5iK+3WP23ZW04vMGEC90uA33wFc5JPGU5pNZuzGLoCec316oab9v5
	+1JXGAOxUMRngDmXcDAOFqwiR9pNKqBv4DN8A6eis3hWr4NVlZshgJD57cz2nA==
X-Google-Smtp-Source: AGHT+IGIK8Erhji21niUWFPogzt6iDf0VsC6RhJImYChHCMhfsalLAttwAM/hAjBUM+rRasFiPUl/w==
X-Received: by 2002:a17:90b:2252:b0:312:25dd:1c86 with SMTP id 98e67ed59e1d1-3134730af09mr7057432a91.18.1749230685624;
        Fri, 06 Jun 2025 10:24:45 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31349f17c04sm1725087a91.8.2025.06.06.10.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 10:24:45 -0700 (PDT)
Date: Fri, 6 Jun 2025 10:24:43 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexandre Ghiti <alex@ghiti.fr>, Ved Shanbhogue <ved@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Chunyan Zhang <zhang.lyra@gmail.com>
Subject: Re: [PATCH RFC v7 2/3] riscv: mm: Add soft-dirty page tracking
 support
Message-ID: <aEMkW8py61njmNLo@debug.ba.rivosinc.com>
References: <20250409095320.224100-1-zhangchunyan@iscas.ac.cn>
 <20250409095320.224100-3-zhangchunyan@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250409095320.224100-3-zhangchunyan@iscas.ac.cn>

On Wed, Apr 09, 2025 at 05:53:19PM +0800, Chunyan Zhang wrote:
>The Svrsw60t59b extension allows to free the PTE reserved bits 60 and 59
>for software, this patch uses bit 59 for soft-dirty.
>
>To add swap PTE soft-dirty tracking, we borrow bit 3 which is available
>for swap PTEs on RISC-V systems.
>
>Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
>---
> arch/riscv/Kconfig                    |  1 +
> arch/riscv/include/asm/pgtable-bits.h | 19 +++++++
> arch/riscv/include/asm/pgtable.h      | 71 ++++++++++++++++++++++++++-
> 3 files changed, 89 insertions(+), 2 deletions(-)
>
>diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>index 332fc00243ad..652e2bbfb702 100644
>--- a/arch/riscv/Kconfig
>+++ b/arch/riscv/Kconfig
>@@ -139,6 +139,7 @@ config RISCV
> 	select HAVE_ARCH_MMAP_RND_COMPAT_BITS if COMPAT
> 	select HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET
> 	select HAVE_ARCH_SECCOMP_FILTER
>+	select HAVE_ARCH_SOFT_DIRTY if 64BIT && MMU && RISCV_ISA_SVRSW60T59B
> 	select HAVE_ARCH_STACKLEAK
> 	select HAVE_ARCH_THREAD_STRUCT_WHITELIST
> 	select HAVE_ARCH_TRACEHOOK
>diff --git a/arch/riscv/include/asm/pgtable-bits.h b/arch/riscv/include/asm/pgtable-bits.h
>index a8f5205cea54..a6fa871dc19e 100644
>--- a/arch/riscv/include/asm/pgtable-bits.h
>+++ b/arch/riscv/include/asm/pgtable-bits.h
>@@ -20,6 +20,25 @@
>
> #define _PAGE_SPECIAL   (1 << 8)    /* RSW: 0x1 */
> #define _PAGE_DEVMAP    (1 << 9)    /* RSW, devmap */
>+
>+#ifdef CONFIG_MEM_SOFT_DIRTY
>+
>+/* ext_svrsw60t59b: bit 59 for software dirty tracking */
>+#define _PAGE_SOFT_DIRTY						\
>+	((riscv_has_extension_unlikely(RISCV_ISA_EXT_SVRSW60T59B)) ?	\
>+	 (1UL << 59) : 0)
>+/*
>+ * Bit 3 is always zero for swap entry computation, so we
>+ * can borrow it for swap page soft-dirty tracking.
>+ */
>+#define _PAGE_SWP_SOFT_DIRTY						\
>+	((riscv_has_extension_unlikely(RISCV_ISA_EXT_SVRSW60T59B)) ?	\
>+	 _PAGE_EXEC : 0)
>+#else
>+#define _PAGE_SOFT_DIRTY	0
>+#define _PAGE_SWP_SOFT_DIRTY	0
>+#endif /* CONFIG_MEM_SOFT_DIRTY */
>+

Above can be done like this

+
+#ifdef CONFIG_MEM_SOFT_DIRTY && RISCV_ISA_EXT_SVRSW60T59B
+
+/* ext_svrsw60t59b: bit 59 for software dirty tracking */
+#define _PAGE_SOFT_DIRTY (1UL << 59)
+/*
+ * Bit 3 is always zero for swap entry computation, so we
+ * can borrow it for swap page soft-dirty tracking.
+ */
+#define _PAGE_SWP_SOFT_DIRTY _PAGE_EXEC
+#else
+#define _PAGE_SOFT_DIRTY       0
+#define _PAGE_SWP_SOFT_DIRTY   0
+#endif /* CONFIG_MEM_SOFT_DIRTY */

> #define _PAGE_TABLE     _PAGE_PRESENT
>
> /*
>diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
>index 428e48e5f57d..14461ffe6321 100644
>--- a/arch/riscv/include/asm/pgtable.h
>+++ b/arch/riscv/include/asm/pgtable.h
>@@ -436,7 +436,7 @@ static inline pte_t pte_mkwrite_novma(pte_t pte)

Shouldn't "static inline int pte_dirty(pte_t pte)" be updated as well

static inline int pte_dirty(pte_t pte)
{
	return pte_val(pte) & (_PAGE_DIRTY | _PAGE_SOFT_DIRTY);
}

Perhaps have a macro which includes both dirty together and then use together.


>
> static inline pte_t pte_mkdirty(pte_t pte)
> {
>-	return __pte(pte_val(pte) | _PAGE_DIRTY);
>+	return __pte(pte_val(pte) | _PAGE_DIRTY | _PAGE_SOFT_DIRTY);
> }
>
> static inline pte_t pte_mkclean(pte_t pte)
>@@ -469,6 +469,38 @@ static inline pte_t pte_mkhuge(pte_t pte)
> 	return pte;
> }
>
>+#ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
>+static inline bool pte_soft_dirty(pte_t pte)
>+{
>+	return !!(pte_val(pte) & _PAGE_SOFT_DIRTY);
>+}
>+
>+static inline pte_t pte_mksoft_dirty(pte_t pte)
>+{
>+	return __pte(pte_val(pte) | _PAGE_SOFT_DIRTY);
>+}
>+
>+static inline pte_t pte_clear_soft_dirty(pte_t pte)
>+{
>+	return __pte(pte_val(pte) & ~(_PAGE_SOFT_DIRTY));
>+}
>+
>+static inline bool pte_swp_soft_dirty(pte_t pte)
>+{
>+	return !!(pte_val(pte) & _PAGE_SWP_SOFT_DIRTY);
>+}
>+
>+static inline pte_t pte_swp_mksoft_dirty(pte_t pte)
>+{
>+	return __pte(pte_val(pte) | _PAGE_SWP_SOFT_DIRTY);
>+}
>+
>+static inline pte_t pte_swp_clear_soft_dirty(pte_t pte)
>+{
>+	return __pte(pte_val(pte) & ~(_PAGE_SWP_SOFT_DIRTY));
>+}
>+#endif /* CONFIG_HAVE_ARCH_SOFT_DIRTY */
>+
> #ifdef CONFIG_RISCV_ISA_SVNAPOT
> #define pte_leaf_size(pte)	(pte_napot(pte) ?				\
> 					napot_cont_size(napot_cont_order(pte)) :\
>@@ -821,6 +853,40 @@ static inline pud_t pud_mkspecial(pud_t pud)
> }
> #endif
>
>+#ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
>+static inline bool pmd_soft_dirty(pmd_t pmd)
>+{
>+	return pte_soft_dirty(pmd_pte(pmd));
>+}
>+
>+static inline pmd_t pmd_mksoft_dirty(pmd_t pmd)
>+{
>+	return pte_pmd(pte_mksoft_dirty(pmd_pte(pmd)));
>+}
>+
>+static inline pmd_t pmd_clear_soft_dirty(pmd_t pmd)
>+{
>+	return pte_pmd(pte_clear_soft_dirty(pmd_pte(pmd)));
>+}
>+
>+#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
>+static inline bool pmd_swp_soft_dirty(pmd_t pmd)
>+{
>+	return pte_swp_soft_dirty(pmd_pte(pmd));
>+}
>+
>+static inline pmd_t pmd_swp_mksoft_dirty(pmd_t pmd)
>+{
>+	return pte_pmd(pte_swp_mksoft_dirty(pmd_pte(pmd)));
>+}
>+
>+static inline pmd_t pmd_swp_clear_soft_dirty(pmd_t pmd)
>+{
>+	return pte_pmd(pte_swp_clear_soft_dirty(pmd_pte(pmd)));
>+}
>+#endif /* CONFIG_ARCH_ENABLE_THP_MIGRATION */
>+#endif /* CONFIG_HAVE_ARCH_SOFT_DIRTY */
>+
> static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
> 				pmd_t *pmdp, pmd_t pmd)
> {
>@@ -910,7 +976,8 @@ extern pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
>  *
>  * Format of swap PTE:
>  *	bit            0:	_PAGE_PRESENT (zero)
>- *	bit       1 to 3:       _PAGE_LEAF (zero)
>+ *	bit       1 to 2:	(zero)
>+ *	bit            3:	_PAGE_SWP_SOFT_DIRTY
>  *	bit            5:	_PAGE_PROT_NONE (zero)
>  *	bit            6:	exclusive marker
>  *	bits      7 to 11:	swap type
>-- 
>2.34.1
>
