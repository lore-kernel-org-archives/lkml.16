Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7ABB289E3F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 17:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749231054; cv=none; b=g6zvNlnF/SoRVX4X6KKa/tdx+ZDkVoJ5kCvQIB7QFOk0BMswQUK5T2uw4HG2HsQU8tHNx6Eg1HgLswLPdCDf9xH1JPi8Mg1zY4kN+7kahrDHI35sUrxuAfyQIRo8sr4EvxFlxB8PwwXvWFrLIypVvcZ8ZXoRuDgbC8LIykkX0nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749231054; c=relaxed/simple;
	bh=WrKuzknhxuZmIhDuA/hX3k4HQxxGVb/btPuHfQ6V57k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RUlCvKQz/mQ2mbV/KkR6qgIml9GjZiYFdB1TWK2LXLuMT7dmHYn6V3da9nLoWn6soAORtXLHWeMrgcsMrbXytZAu3Nt4nSG19Cpdr0d5p/s3kT+0ByVp9scyQ7HQnqxMOC0ghMtylo36/dSPXYs3JasUi/I1jbjJKRJJnuZHhAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=b1K6rIiO; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="b1K6rIiO"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-74267c68c11so2023836b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 10:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1749231051; x=1749835851; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X2PQ67BFWU56/gkiZ9MusCHT/JwVeFrtJgEOKPncvwI=;
        b=b1K6rIiOTRX620AdlgC00E36EPZIQxmkzbwj3IGi0tlO5ZrKod/7b4roSEQcxyoWp5
         sOKFNPsIdKSE8AP/CsSWzFIIuls24YFqlvgZPKIzR3MmWmrjjjqHcfUamRKdlWlUQIZk
         lh+saLkx2kjLvTTbzT87k7sNvs7ItoZkU9z6IS6k3iTwdOR8oZsXYyIKBEaULYVhcpvj
         Dcl+peSG2mjbTXJ3QFAKFtFEPLwZZAtGJ7vc74yotoqrSCpFpBVTl4l42101s12NMOrM
         isETEhkCuFqJKji5osDqJYGjqiYcYYWAnLW1F8/0HOF35ElvHCSk6tAVY4MZhtDHLW77
         fbzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749231051; x=1749835851;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X2PQ67BFWU56/gkiZ9MusCHT/JwVeFrtJgEOKPncvwI=;
        b=wG+i9dyr0MC5Dom9WVf0pLxCzyFsShiNq6G7/3FbhLWQ0VRzJvNvJFwQMWcuGey+jz
         ERjzXhF3VEWKZ9GZ0/q7u7mNte0sinBo4qUG8bsHbjj2pCzV/8+KNO1v05DrVE0HuE+J
         LjjHb+87TuIAaDyyusGMFkgGoPVwmnMcbr7vHQ35S73vvzv0Ei64k4vWVNODVFwVrQJ6
         L35Y/cvwGjdopKVtAo/g6ILibb3NQDy+2w0B80U68d+HvMKDQZsS2E9ZiEhmg52kiihb
         t52L0ibv/MVk/b5DxfIYnqJi7Z6aq+KgDSHSOOycytUBgB8iVPP1RG8u1FDm+7HUgY+i
         eVHg==
X-Forwarded-Encrypted: i=1; AJvYcCVSrCXhTSKGOaETc5+3e8p0ipv2QbP2WdLcJ16sjrjXVvXKEQMULf7Y9n/QoPgOhhUQ8ewfELPLR5YDng8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg+YaL/VCMZsw0oqj7CX/kEvCO017LZX3ANXN4RIn+PUjOwGf8
	jIok/XSxk94fH+uDDLrfyp1d+2UXNTc95EGnJ/cx3biTLXR2pR61vIay5mhrqSKc3K4=
X-Gm-Gg: ASbGnctDtTaNeLFBG8LJrNEEnARrE0FrmIcYTjTvkAUNdodJJryxY+A7qXKc2y/Q0ZY
	QouiRI51BI22A1wFkx9AIgI5UmJ7kx8ypmp2NInIpOWzVBsIkOQZeB5zFEksDUc5z1ixRBoWyke
	03Nqmln38fmAR5bnpkw0QqSWdPIvqzPNfjM4kNdOtGryxoSuKmmAKBT5KjmNWdbzuUg3w6deSuw
	/mAWf6HB++XtmYuFXb/khX2C7uDQKiiVdtSpMBGC2NoK8IfTpxNhGfnKAKk7IMzovdCk2xZLmRJ
	kv7BvZU5C8qI8QAc0CGWdNEKrQnk+sAusNaITY7+EIB7Ds464rqcC0WiIbtTmA==
X-Google-Smtp-Source: AGHT+IHgMy5gdkBqvTbfaUQGR2qvVQaW9QlO1x9bJKi+Q4H2O89s0ff1Q5OBkCzHauPpSkT1Z14DRg==
X-Received: by 2002:a05:6a21:2d4a:b0:215:d457:ca6d with SMTP id adf61e73a8af0-21ee43e18e5mr6073980637.40.1749231051059;
        Fri, 06 Jun 2025 10:30:51 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0836d4sm1517910b3a.85.2025.06.06.10.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 10:30:50 -0700 (PDT)
Date: Fri, 6 Jun 2025 10:30:48 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexandre Ghiti <alex@ghiti.fr>, Ved Shanbhogue <ved@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Chunyan Zhang <zhang.lyra@gmail.com>
Subject: Re: [PATCH RFC v7 3/3] riscv: mm: Add uffd write-protect support
Message-ID: <aEMlyNf-NN6moeFb@debug.ba.rivosinc.com>
References: <20250409095320.224100-1-zhangchunyan@iscas.ac.cn>
 <20250409095320.224100-4-zhangchunyan@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250409095320.224100-4-zhangchunyan@iscas.ac.cn>

On Wed, Apr 09, 2025 at 05:53:20PM +0800, Chunyan Zhang wrote:
>The Svrsw60t59b extension allows to free the PTE reserved bits 60 and 59
>for software, this patch uses bit 60 for uffd-wp tracking
>
>Additionally for tracking the uffd-wp state as a PTE swap bit, we borrow
>bit 4 which is not involved into swap entry computation.
>
>Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
>---
> arch/riscv/Kconfig                    |  1 +
> arch/riscv/include/asm/pgtable-bits.h | 18 ++++++++
> arch/riscv/include/asm/pgtable.h      | 65 +++++++++++++++++++++++++++
> 3 files changed, 84 insertions(+)
>
>diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>index 652e2bbfb702..cafdfbe4412b 100644
>--- a/arch/riscv/Kconfig
>+++ b/arch/riscv/Kconfig
>@@ -145,6 +145,7 @@ config RISCV
> 	select HAVE_ARCH_TRACEHOOK
> 	select HAVE_ARCH_TRANSPARENT_HUGEPAGE if 64BIT && MMU
> 	select HAVE_ARCH_USERFAULTFD_MINOR if 64BIT && USERFAULTFD
>+	select HAVE_ARCH_USERFAULTFD_WP if 64BIT && MMU && USERFAULTFD && RISCV_ISA_SVRSW60T59B
> 	select HAVE_ARCH_VMAP_STACK if MMU && 64BIT
> 	select HAVE_ASM_MODVERSIONS
> 	select HAVE_CONTEXT_TRACKING_USER
>diff --git a/arch/riscv/include/asm/pgtable-bits.h b/arch/riscv/include/asm/pgtable-bits.h
>index a6fa871dc19e..a953a582cd75 100644
>--- a/arch/riscv/include/asm/pgtable-bits.h
>+++ b/arch/riscv/include/asm/pgtable-bits.h
>@@ -39,6 +39,24 @@
> #define _PAGE_SWP_SOFT_DIRTY	0
> #endif /* CONFIG_MEM_SOFT_DIRTY */
>
>+#ifdef CONFIG_HAVE_ARCH_USERFAULTFD_WP
>+
>+/* ext_svrsw60t59b: Bit(60) for uffd-wp tracking */
>+#define _PAGE_UFFD_WP							\
>+	((riscv_has_extension_unlikely(RISCV_ISA_EXT_SVRSW60T59B)) ?	\
>+	 (1UL << 60) : 0)
>+/*
>+ * Bit 4 is not involved into swap entry computation, so we
>+ * can borrow it for swap page uffd-wp tracking.
>+ */
>+#define _PAGE_SWP_UFFD_WP						\
>+	((riscv_has_extension_unlikely(RISCV_ISA_EXT_SVRSW60T59B)) ?	\
>+	 _PAGE_USER : 0)
>+#else
>+#define _PAGE_UFFD_WP		0
>+#define _PAGE_SWP_UFFD_WP	0
>+#endif
>+

Same comment as previous patch on above. Have `RISCV_ISA_EXT_SVRSW60T59B`
with the "#ifdef CONFIG_HAVE_ARCH_USERFAULTFD_WP"


> #define _PAGE_TABLE     _PAGE_PRESENT
>
> /*
>diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
>index 14461ffe6321..ee0fbca28a76 100644
>--- a/arch/riscv/include/asm/pgtable.h
>+++ b/arch/riscv/include/asm/pgtable.h
>@@ -425,6 +425,38 @@ static inline pte_t pte_wrprotect(pte_t pte)
> 	return __pte(pte_val(pte) & ~(_PAGE_WRITE));
> }
>
>+#ifdef CONFIG_HAVE_ARCH_USERFAULTFD_WP
>+static inline bool pte_uffd_wp(pte_t pte)
>+{
>+	return !!(pte_val(pte) & _PAGE_UFFD_WP);
>+}
>+
>+static inline pte_t pte_mkuffd_wp(pte_t pte)
>+{
>+	return pte_wrprotect(__pte(pte_val(pte) | _PAGE_UFFD_WP));
>+}
>+
>+static inline pte_t pte_clear_uffd_wp(pte_t pte)
>+{
>+	return __pte(pte_val(pte) & ~(_PAGE_UFFD_WP));
>+}
>+
>+static inline bool pte_swp_uffd_wp(pte_t pte)
>+{
>+	return !!(pte_val(pte) & _PAGE_SWP_UFFD_WP);
>+}
>+
>+static inline pte_t pte_swp_mkuffd_wp(pte_t pte)
>+{
>+	return __pte(pte_val(pte) | _PAGE_SWP_UFFD_WP);
>+}
>+
>+static inline pte_t pte_swp_clear_uffd_wp(pte_t pte)
>+{
>+	return __pte(pte_val(pte) & ~(_PAGE_SWP_UFFD_WP));
>+}
>+#endif /* CONFIG_HAVE_ARCH_USERFAULTFD_WP */
>+
> /* static inline pte_t pte_mkread(pte_t pte) */
>
> static inline pte_t pte_mkwrite_novma(pte_t pte)
>@@ -853,6 +885,38 @@ static inline pud_t pud_mkspecial(pud_t pud)
> }
> #endif
>
>+#ifdef CONFIG_HAVE_ARCH_USERFAULTFD_WP
>+static inline bool pmd_uffd_wp(pmd_t pmd)
>+{
>+	return pte_uffd_wp(pmd_pte(pmd));
>+}
>+
>+static inline pmd_t pmd_mkuffd_wp(pmd_t pmd)
>+{
>+	return pte_pmd(pte_mkuffd_wp(pmd_pte(pmd)));
>+}
>+
>+static inline pmd_t pmd_clear_uffd_wp(pmd_t pmd)
>+{
>+	return pte_pmd(pte_clear_uffd_wp(pmd_pte(pmd)));
>+}
>+
>+static inline bool pmd_swp_uffd_wp(pmd_t pmd)
>+{
>+	return pte_swp_uffd_wp(pmd_pte(pmd));
>+}
>+
>+static inline pmd_t pmd_swp_mkuffd_wp(pmd_t pmd)
>+{
>+	return pte_pmd(pte_swp_mkuffd_wp(pmd_pte(pmd)));
>+}
>+
>+static inline pmd_t pmd_swp_clear_uffd_wp(pmd_t pmd)
>+{
>+	return pte_pmd(pte_swp_clear_uffd_wp(pmd_pte(pmd)));
>+}
>+#endif /* CONFIG_HAVE_ARCH_USERFAULTFD_WP */
>+
> #ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
> static inline bool pmd_soft_dirty(pmd_t pmd)
> {
>@@ -978,6 +1042,7 @@ extern pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
>  *	bit            0:	_PAGE_PRESENT (zero)
>  *	bit       1 to 2:	(zero)
>  *	bit            3:	_PAGE_SWP_SOFT_DIRTY
>+ *	bit            4:	_PAGE_SWP_UFFD_WP
>  *	bit            5:	_PAGE_PROT_NONE (zero)
>  *	bit            6:	exclusive marker
>  *	bits      7 to 11:	swap type
>-- 
>2.34.1
>
