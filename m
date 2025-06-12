Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32146248F50
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 17:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749749806; cv=none; b=OAdciiwPMIYOhZx0IKfP8smGkWVMEA7oK+j78QRkTCgpcTPFv6FpDW1o6chDNFCz+Q1mRa56qK4fjUEXixvkv4Sm4JoDiyrYPbr4/EY7s/X6K8nXcMaoo3MQXU4Ypkt+MQzKlFjkTu342aCEeRiufROWgxw6ZoH4pBqLi9MFrVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749749806; c=relaxed/simple;
	bh=LCDpx9RPv21Vt/bDTkl807l3tYeupskl+otEl77ScuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d7AKhgBXwiZ2+5aUoE+hMny1aBiJ7whCWE8eSHoWxtJxlyUd2drIKIZcMHEIghjHlR0kac5/1ERo8vz2rYUWgeV2a5JYw6gsoBRR2t1QXIp6gT9ZihtfZ0Nh8V0KA8k25mOoC5Poz2HQ7MWvQpDh6AAXjBvbt1Wue2xtx6scaYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=jav+p3jL; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="jav+p3jL"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-313154270bbso1394685a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 10:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1749749803; x=1750354603; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gt5YyyJeOLs2VGVgNIW5XxNcnh/B2T4VMdq9AInbPd0=;
        b=jav+p3jLoRI8eK8c61aUT5WxR21qI6PmoBYbHDgQT8DS3eQWuJk3r1aiPe1lQ9jIda
         QLmwwv++Z7TNelWSAcuG/8mOhKEtxss8iAlfMUzlkmPJav/AAJg3KpQqk/1zXRzRcc4Y
         9kiB4+jWxlt+yP1oSboTxPooY3xM++oy3GpHeawLFFNO6CuRRw1/f5WkUywEIIJmGfj8
         DehOAbeurqi/zmGcwiEwHHPjW+TjArXcE/psejS6l2VvxIaAOKPLKNraLMVIsRfSo+rQ
         BzxfJAJibQUCD/EIlJNa2WgMsX2zZppU8p/WeEBGcY/rkuxxRJ5Z3l40nIUvOD0XZOOY
         2lBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749749803; x=1750354603;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gt5YyyJeOLs2VGVgNIW5XxNcnh/B2T4VMdq9AInbPd0=;
        b=M9oAOaqJWnlGLYWBFZVnqsRbkZqrqC/6zmlYEgC0N07xjQdm5i9JRi2jMEa+z5wYtf
         BoZAgjyYlz+PZuDTC+XWWmAm5HMA8oSDxbyP+z94Nv8NIxtiKKWPXFRgywWdNPBajWh/
         QvUnC15Q2cCBuR2Jz2nVJrMu3IJgTgLwNJmaE0cYtxTVjc2Bl/UCW+15nd9TTYvX1DLS
         gmEIt6hA9nxVPcAwUKXyd26stJsezsc5IzFKWNeR4UJXLwTd9WIfed12eamyrZUEWuDP
         Z+fyHqW3/0XYqju4XdRbGWw49h/TfCTFGICw04nc/Pda2fTb0l8vFI5evtGuHwa/VLV0
         IXHw==
X-Forwarded-Encrypted: i=1; AJvYcCVboNkAHarUY3dr4YZl8GWoiZid2dclWRHRYdLBv/KEV3GEVv81aW82Ca74BNYmswtaLNrD+FgSpSEz7oA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwF2qbmghVJCjKNcIrWFYDR20nYdA/5l4Mo5fzWdRj9g/noyhTQ
	Ys2QtdUY5UmqqPSzNHFrtxsJXwZG8wHLukBk6SR/0uGU/p6kUu+abyIfmMhvSA7ibRE=
X-Gm-Gg: ASbGncvtJMEanGQXl/AkcRTpxEYpn3Y1oOQH+IRapBuNiibfeIpHOpiWKkEy0BzSrfL
	GjB8IGhCINKh0svkVos8lSwvdJD+GKnZxWd8oNO20xFGt/QrvzbhrfCHKnIxu5H5vAWFIRlZ3vD
	wV6hfElp0kIBUJtnVg1TDkr+ND/xL5zP+4j5Pw3DGsleW9r1QF5fvf4yjwhePOCGx5m3U4ybs7e
	XWwdXs+1jJnAcItUkjErGuqed0NF4zj2eZW0YM0wrpOABXHeLdWaAyAEkhN0+qUtftrbw2xgS5T
	dpM79r6EHiupqGWTBKa6T3HGdaZ1A62a7Kr4hgSA8rJwzrX+WRUWLeWEAIeKTDW1vr/scAaB
X-Google-Smtp-Source: AGHT+IFUg2RKRnIposbOF8fnfoBpdDR3SO+Eyx4YydJxNVc0sFUoQpaOabCcthfeabsf+6EmWv84Sw==
X-Received: by 2002:a17:90b:5845:b0:311:f05b:869a with SMTP id 98e67ed59e1d1-313d9c3292dmr85247a91.8.1749749803405;
        Thu, 12 Jun 2025 10:36:43 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c19cd3cbsm1788950a91.11.2025.06.12.10.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 10:36:43 -0700 (PDT)
Date: Thu, 12 Jun 2025 10:36:41 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Chunyan Zhang <zhang.lyra@gmail.com>
Cc: Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexandre Ghiti <alex@ghiti.fr>, Ved Shanbhogue <ved@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v7 2/3] riscv: mm: Add soft-dirty page tracking
 support
Message-ID: <aEsQKeJGOlCooOUK@debug.ba.rivosinc.com>
References: <20250409095320.224100-1-zhangchunyan@iscas.ac.cn>
 <20250409095320.224100-3-zhangchunyan@iscas.ac.cn>
 <aEMkW8py61njmNLo@debug.ba.rivosinc.com>
 <CAAfSe-u3oyjW7D0f=XUVaOJsM00Mqx7-LeR-Ecxjui3sfaAMUQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAAfSe-u3oyjW7D0f=XUVaOJsM00Mqx7-LeR-Ecxjui3sfaAMUQ@mail.gmail.com>

On Thu, Jun 12, 2025 at 02:51:57PM +0800, Chunyan Zhang wrote:
>Hi Deepak,
>
>On Sat, 7 Jun 2025 at 01:24, Deepak Gupta <debug@rivosinc.com> wrote:
>>
>> On Wed, Apr 09, 2025 at 05:53:19PM +0800, Chunyan Zhang wrote:
>> >The Svrsw60t59b extension allows to free the PTE reserved bits 60 and 59
>> >for software, this patch uses bit 59 for soft-dirty.
>> >
>> >To add swap PTE soft-dirty tracking, we borrow bit 3 which is available
>> >for swap PTEs on RISC-V systems.
>> >
>> >Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
>> >---
>> > arch/riscv/Kconfig                    |  1 +
>> > arch/riscv/include/asm/pgtable-bits.h | 19 +++++++
>> > arch/riscv/include/asm/pgtable.h      | 71 ++++++++++++++++++++++++++-
>> > 3 files changed, 89 insertions(+), 2 deletions(-)
>> >
>> >diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> >index 332fc00243ad..652e2bbfb702 100644
>> >--- a/arch/riscv/Kconfig
>> >+++ b/arch/riscv/Kconfig
>> >@@ -139,6 +139,7 @@ config RISCV
>> >       select HAVE_ARCH_MMAP_RND_COMPAT_BITS if COMPAT
>> >       select HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET
>> >       select HAVE_ARCH_SECCOMP_FILTER
>> >+      select HAVE_ARCH_SOFT_DIRTY if 64BIT && MMU && RISCV_ISA_SVRSW60T59B
>> >       select HAVE_ARCH_STACKLEAK
>> >       select HAVE_ARCH_THREAD_STRUCT_WHITELIST
>> >       select HAVE_ARCH_TRACEHOOK
>> >diff --git a/arch/riscv/include/asm/pgtable-bits.h b/arch/riscv/include/asm/pgtable-bits.h
>> >index a8f5205cea54..a6fa871dc19e 100644
>> >--- a/arch/riscv/include/asm/pgtable-bits.h
>> >+++ b/arch/riscv/include/asm/pgtable-bits.h
>> >@@ -20,6 +20,25 @@
>> >
>> > #define _PAGE_SPECIAL   (1 << 8)    /* RSW: 0x1 */
>> > #define _PAGE_DEVMAP    (1 << 9)    /* RSW, devmap */
>> >+
>> >+#ifdef CONFIG_MEM_SOFT_DIRTY
>> >+
>> >+/* ext_svrsw60t59b: bit 59 for software dirty tracking */
>> >+#define _PAGE_SOFT_DIRTY                                              \
>> >+      ((riscv_has_extension_unlikely(RISCV_ISA_EXT_SVRSW60T59B)) ?    \
>> >+       (1UL << 59) : 0)
>> >+/*
>> >+ * Bit 3 is always zero for swap entry computation, so we
>> >+ * can borrow it for swap page soft-dirty tracking.
>> >+ */
>> >+#define _PAGE_SWP_SOFT_DIRTY                                          \
>> >+      ((riscv_has_extension_unlikely(RISCV_ISA_EXT_SVRSW60T59B)) ?    \
>> >+       _PAGE_EXEC : 0)
>> >+#else
>> >+#define _PAGE_SOFT_DIRTY      0
>> >+#define _PAGE_SWP_SOFT_DIRTY  0
>> >+#endif /* CONFIG_MEM_SOFT_DIRTY */
>> >+
>>
>> Above can be done like this
>>
>> +
>> +#ifdef CONFIG_MEM_SOFT_DIRTY && RISCV_ISA_EXT_SVRSW60T59B
>> +
>> +/* ext_svrsw60t59b: bit 59 for software dirty tracking */
>> +#define _PAGE_SOFT_DIRTY (1UL << 59)
>> +/*
>> + * Bit 3 is always zero for swap entry computation, so we
>> + * can borrow it for swap page soft-dirty tracking.
>> + */
>> +#define _PAGE_SWP_SOFT_DIRTY _PAGE_EXEC
>> +#else
>> +#define _PAGE_SOFT_DIRTY       0
>> +#define _PAGE_SWP_SOFT_DIRTY   0
>> +#endif /* CONFIG_MEM_SOFT_DIRTY */
>>
>
>No, the feature depends not only on the compile-time configuration but
>also on the run-time environment.
>
>We need to check if the platform on which the system is running
>supports the extension SVRSW60T59B, and riscv_has_extension_unlikely()
>does that check that is a run-time check, not a build-time condition.
>

aah you are right. Ignore my comment.

>> > #define _PAGE_TABLE     _PAGE_PRESENT
>> >
>> > /*
>> >diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
>> >index 428e48e5f57d..14461ffe6321 100644
>> >--- a/arch/riscv/include/asm/pgtable.h
>> >+++ b/arch/riscv/include/asm/pgtable.h
>> >@@ -436,7 +436,7 @@ static inline pte_t pte_mkwrite_novma(pte_t pte)
>>
>> Shouldn't "static inline int pte_dirty(pte_t pte)" be updated as well
>
>It may not be needed, since pte_dirty() on X86 and ARM doesn't check
>_PAGE_SOFT_DIRTY either.

arch/arm64/include/asm/pgtable.h
#define pte_dirty(pte)		(pte_sw_dirty(pte) || pte_hw_dirty(pte))


`pte_sw_dirty` eventually expands to checking of b55 which is soft dirty.

But when I look at `pte_to_pagemap_entry` (`fs/proc/task_mmu.c`), I don't
see that pte to pagemap entry conversion for arm64. There is no equivalent
`pte_soft_dirty` macro defined on arm64.

Yeah may be it's not needed then.

>
>Thanks for the review,
>Chunyan
>
>
>
>
>>
>> static inline int pte_dirty(pte_t pte)
>> {
>>         return pte_val(pte) & (_PAGE_DIRTY | _PAGE_SOFT_DIRTY);
>> }
>>
>> Perhaps have a macro which includes both dirty together and then use together.
>>
>>
>> >
>> > static inline pte_t pte_mkdirty(pte_t pte)
>> > {
>> >-      return __pte(pte_val(pte) | _PAGE_DIRTY);
>> >+      return __pte(pte_val(pte) | _PAGE_DIRTY | _PAGE_SOFT_DIRTY);
>> > }
>> >
>> > static inline pte_t pte_mkclean(pte_t pte)
>> >@@ -469,6 +469,38 @@ static inline pte_t pte_mkhuge(pte_t pte)
>> >       return pte;
>> > }
>> >
>> >+#ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
>> >+static inline bool pte_soft_dirty(pte_t pte)
>> >+{
>> >+      return !!(pte_val(pte) & _PAGE_SOFT_DIRTY);
>> >+}
>> >+
>> >+static inline pte_t pte_mksoft_dirty(pte_t pte)
>> >+{
>> >+      return __pte(pte_val(pte) | _PAGE_SOFT_DIRTY);
>> >+}
>> >+
>> >+static inline pte_t pte_clear_soft_dirty(pte_t pte)
>> >+{
>> >+      return __pte(pte_val(pte) & ~(_PAGE_SOFT_DIRTY));
>> >+}
>> >+
>> >+static inline bool pte_swp_soft_dirty(pte_t pte)
>> >+{
>> >+      return !!(pte_val(pte) & _PAGE_SWP_SOFT_DIRTY);
>> >+}
>> >+
>> >+static inline pte_t pte_swp_mksoft_dirty(pte_t pte)
>> >+{
>> >+      return __pte(pte_val(pte) | _PAGE_SWP_SOFT_DIRTY);
>> >+}
>> >+
>> >+static inline pte_t pte_swp_clear_soft_dirty(pte_t pte)
>> >+{
>> >+      return __pte(pte_val(pte) & ~(_PAGE_SWP_SOFT_DIRTY));
>> >+}
>> >+#endif /* CONFIG_HAVE_ARCH_SOFT_DIRTY */
>> >+
>> > #ifdef CONFIG_RISCV_ISA_SVNAPOT
>> > #define pte_leaf_size(pte)    (pte_napot(pte) ?                               \
>> >                                       napot_cont_size(napot_cont_order(pte)) :\
>> >@@ -821,6 +853,40 @@ static inline pud_t pud_mkspecial(pud_t pud)
>> > }
>> > #endif
>> >
>> >+#ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
>> >+static inline bool pmd_soft_dirty(pmd_t pmd)
>> >+{
>> >+      return pte_soft_dirty(pmd_pte(pmd));
>> >+}
>> >+
>> >+static inline pmd_t pmd_mksoft_dirty(pmd_t pmd)
>> >+{
>> >+      return pte_pmd(pte_mksoft_dirty(pmd_pte(pmd)));
>> >+}
>> >+
>> >+static inline pmd_t pmd_clear_soft_dirty(pmd_t pmd)
>> >+{
>> >+      return pte_pmd(pte_clear_soft_dirty(pmd_pte(pmd)));
>> >+}
>> >+
>> >+#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
>> >+static inline bool pmd_swp_soft_dirty(pmd_t pmd)
>> >+{
>> >+      return pte_swp_soft_dirty(pmd_pte(pmd));
>> >+}
>> >+
>> >+static inline pmd_t pmd_swp_mksoft_dirty(pmd_t pmd)
>> >+{
>> >+      return pte_pmd(pte_swp_mksoft_dirty(pmd_pte(pmd)));
>> >+}
>> >+
>> >+static inline pmd_t pmd_swp_clear_soft_dirty(pmd_t pmd)
>> >+{
>> >+      return pte_pmd(pte_swp_clear_soft_dirty(pmd_pte(pmd)));
>> >+}
>> >+#endif /* CONFIG_ARCH_ENABLE_THP_MIGRATION */
>> >+#endif /* CONFIG_HAVE_ARCH_SOFT_DIRTY */
>> >+
>> > static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
>> >                               pmd_t *pmdp, pmd_t pmd)
>> > {
>> >@@ -910,7 +976,8 @@ extern pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
>> >  *
>> >  * Format of swap PTE:
>> >  *    bit            0:       _PAGE_PRESENT (zero)
>> >- *    bit       1 to 3:       _PAGE_LEAF (zero)
>> >+ *    bit       1 to 2:       (zero)
>> >+ *    bit            3:       _PAGE_SWP_SOFT_DIRTY
>> >  *    bit            5:       _PAGE_PROT_NONE (zero)
>> >  *    bit            6:       exclusive marker
>> >  *    bits      7 to 11:      swap type
>> >--
>> >2.34.1
>> >
