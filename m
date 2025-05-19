Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697C01FC7CA
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747647662; cv=none; b=XSSZABTiNPRZHKaOqobe3ecB2BVksaiEgJyjmsHB+BEtn/uyAvBP+L22bfSwQThC5ACQEG4ty6zMM0O3tWveD1lsmUGc7/Sx/dFh+NcDNk1uTsINHLYZgj8hjjYTS/08Ixwfi7kwQbtHsl9iy5ZMCqXu2mceZivLqjdRnudO18U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747647662; c=relaxed/simple;
	bh=eTNmEe4DOaQ32UissRn1hz5ErOGQ6xPgtQqEURYP/zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i7/E1x7tF7fys7Oo8Pu2/Esl0zjkWQjkI/+5LUMQmgT3CVV7GjMc0W7YCL7pvz2lNizbYYXYF5d1ImJJx/1evpXwYqM3sAlgQ+pX+WncNifA6kFOv0BSuqwBE2Dq9YX+xmjig7iqToYQvk7yvL9duu6gGLQG47eNRPxfE5cj2sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=ZySM7qT5; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="ZySM7qT5"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 8466340E0240;
	Mon, 19 May 2025 09:40:56 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id f7staS3xzTLK; Mon, 19 May 2025 09:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1747647652; bh=CgeKTfEJxEthOuBnwVpghf/oVuTHW5JeXSBGitlvlr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZySM7qT5OdAdtEpDZqRZnmZIBYcKlY1L+PmkD7e4ONyv4hjaL0D62B4JllVWbzZ1D
	 FSbEPHIiESq/ymgzncHSr25PeXU/mS5x39wSYlaU+XO/284Zs4oMmFPtp+QSpyOkPE
	 IYm8Nzmf9b93RJS1v2ogdNScCXNaDcB/ZEtr8ZpQe1UGB5Wm1EzCPJ21gwGxDPv/A3
	 0/GJoBUcADGi1pFWp8BcauF+HqNBySS7qfczTVriNR/U6rK5QBHuaYRykKEKWjT7eH
	 G1QpN1QkfYu4SxIow4ER81QMGnm3Z9azSp9k+fHCPufLETIZ4UE8Qj5kVr+pOoTTs5
	 d59bQNpqUQPupX9YncdXPYrsoT8hjc4L/DtOy6moLOS2eKPoNPDStASZtExZ1sHmUP
	 HxV4UNogF8VJDu4kNQr6J4Q/JMfdnxoEa+0fnnh8jPKFsA3bL34hPPiK/9GOdS1yhC
	 FnZUgnuKWA0cThskVLXFqyLJv/2IIoTL9Xb7TD6T0MrBbZ01cxJOb6N7eXoAjtj9Q+
	 UtUznG54oeoHG7OmL6v1Rzisez0ualOn6y5BjZQLxczEZJt5Rg9Z6vrnkVAno0sQ51
	 8c2M4dBbFnoEa/xUEPJkFmjG+rKM6Y+lIX4kzQEdg4qaWi5EiCDKIhyTu9EY0p89YX
	 EOIIRtEL0RwnaWM1LaJeDgk4=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 646BB40E0173;
	Mon, 19 May 2025 09:40:44 +0000 (UTC)
Date: Mon, 19 May 2025 11:40:38 +0200
From: Borislav Petkov <bp@alien8.de>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Brian Gerst <brgerst@gmail.com>,
	"Kirill A. Shutemov" <kirill@shutemov.name>
Subject: Re: [PATCH v4 1/6] x86/cpu: Use a new feature flag for 5 level paging
Message-ID: <20250519094038.GIaCr8ltHvLBYjk8iI@fat_crate.local>
References: <20250517091639.3807875-8-ardb+git@google.com>
 <20250517091639.3807875-9-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250517091639.3807875-9-ardb+git@google.com>

On Sat, May 17, 2025 at 11:16:41AM +0200, Ard Biesheuvel wrote:
> diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
> index f67a93fc9391..5c19bee0af11 100644
> --- a/arch/x86/include/asm/cpufeatures.h
> +++ b/arch/x86/include/asm/cpufeatures.h
> @@ -395,7 +395,7 @@
>  #define X86_FEATURE_AVX512_BITALG	(16*32+12) /* "avx512_bitalg" Support for VPOPCNT[B,W] and VPSHUF-BITQMB instructions */
>  #define X86_FEATURE_TME			(16*32+13) /* "tme" Intel Total Memory Encryption */
>  #define X86_FEATURE_AVX512_VPOPCNTDQ	(16*32+14) /* "avx512_vpopcntdq" POPCNT for vectors of DW/QW */
> -#define X86_FEATURE_LA57		(16*32+16) /* "la57" 5-level page tables */
> +#define X86_FEATURE_LA57		(16*32+16) /* 57-bit linear addressing */
>  #define X86_FEATURE_RDPID		(16*32+22) /* "rdpid" RDPID instruction */
>  #define X86_FEATURE_BUS_LOCK_DETECT	(16*32+24) /* "bus_lock_detect" Bus Lock detect */
>  #define X86_FEATURE_CLDEMOTE		(16*32+25) /* "cldemote" CLDEMOTE instruction */
> @@ -483,6 +483,7 @@
>  #define X86_FEATURE_PREFER_YMM		(21*32+ 8) /* Avoid ZMM registers due to downclocking */
>  #define X86_FEATURE_APX			(21*32+ 9) /* Advanced Performance Extensions */
>  #define X86_FEATURE_INDIRECT_THUNK_ITS	(21*32+10) /* Use thunk for indirect branches in lower half of cacheline */
> +#define X86_FEATURE_5LEVEL_PAGING	(21*32+11) /* "la57" Whether 5 levels of page tables are in use */

I don't think we need this second flag - you can simply clear the existing
one. Diff ontop below:

---

diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
index 371eaf3f300e..3b34e7c6d1b9 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -395,7 +395,7 @@
 #define X86_FEATURE_AVX512_BITALG	(16*32+12) /* "avx512_bitalg" Support for VPOPCNT[B,W] and VPSHUF-BITQMB instructions */
 #define X86_FEATURE_TME			(16*32+13) /* "tme" Intel Total Memory Encryption */
 #define X86_FEATURE_AVX512_VPOPCNTDQ	(16*32+14) /* "avx512_vpopcntdq" POPCNT for vectors of DW/QW */
-#define X86_FEATURE_LA57		(16*32+16) /* 57-bit linear addressing */
+#define X86_FEATURE_LA57		(16*32+16) /* "la57" 57-bit linear addressing */
 #define X86_FEATURE_RDPID		(16*32+22) /* "rdpid" RDPID instruction */
 #define X86_FEATURE_BUS_LOCK_DETECT	(16*32+24) /* "bus_lock_detect" Bus Lock detect */
 #define X86_FEATURE_CLDEMOTE		(16*32+25) /* "cldemote" CLDEMOTE instruction */
@@ -483,7 +483,6 @@
 #define X86_FEATURE_PREFER_YMM		(21*32+ 8) /* Avoid ZMM registers due to downclocking */
 #define X86_FEATURE_APX			(21*32+ 9) /* Advanced Performance Extensions */
 #define X86_FEATURE_INDIRECT_THUNK_ITS	(21*32+10) /* Use thunk for indirect branches in lower half of cacheline */
-#define X86_FEATURE_5LEVEL_PAGING	(21*32+11) /* "la57" Whether 5 levels of page tables are in use */
 
 /*
  * BUG word(s)
diff --git a/arch/x86/include/asm/page_64.h b/arch/x86/include/asm/page_64.h
index 754be17cc8c2..015d23f3e01f 100644
--- a/arch/x86/include/asm/page_64.h
+++ b/arch/x86/include/asm/page_64.h
@@ -85,7 +85,7 @@ static __always_inline unsigned long task_size_max(void)
 	unsigned long ret;
 
 	alternative_io("movq %[small],%0","movq %[large],%0",
-			X86_FEATURE_5LEVEL_PAGING,
+			X86_FEATURE_LA57,
 			"=r" (ret),
 			[small] "i" ((1ul << 47)-PAGE_SIZE),
 			[large] "i" ((1ul << 56)-PAGE_SIZE));
diff --git a/arch/x86/include/asm/pgtable_64_types.h b/arch/x86/include/asm/pgtable_64_types.h
index 92176887f8eb..4604f924d8b8 100644
--- a/arch/x86/include/asm/pgtable_64_types.h
+++ b/arch/x86/include/asm/pgtable_64_types.h
@@ -33,7 +33,7 @@ static inline bool pgtable_l5_enabled(void)
 	return __pgtable_l5_enabled;
 }
 #else
-#define pgtable_l5_enabled() cpu_feature_enabled(X86_FEATURE_5LEVEL_PAGING)
+#define pgtable_l5_enabled() cpu_feature_enabled(X86_FEATURE_LA57)
 #endif /* USE_EARLY_PGTABLE_L5 */
 
 extern unsigned int pgdir_shift;
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 67cdbd916830..104944e93902 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1755,8 +1755,8 @@ static void __init early_identify_cpu(struct cpuinfo_x86 *c)
 	setup_clear_cpu_cap(X86_FEATURE_PCID);
 #endif
 
-	if (native_read_cr4() & X86_CR4_LA57)
-		setup_force_cpu_cap(X86_FEATURE_5LEVEL_PAGING);
+	if (!(native_read_cr4() & X86_CR4_LA57))
+		setup_clear_cpu_cap(X86_FEATURE_LA57);
 
 	detect_nopl();
 }
diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
index 083fca8f8b97..14aa0d77df26 100644
--- a/drivers/iommu/amd/init.c
+++ b/drivers/iommu/amd/init.c
@@ -3084,7 +3084,7 @@ static int __init early_amd_iommu_init(void)
 		goto out;
 
 	/* 5 level guest page table */
-	if (cpu_feature_enabled(X86_FEATURE_5LEVEL_PAGING) &&
+	if (cpu_feature_enabled(X86_FEATURE_LA57) &&
 	    FIELD_GET(FEATURE_GATS, amd_iommu_efr) == GUEST_PGTABLE_5_LEVEL)
 		amd_iommu_gpt_level = PAGE_MODE_5_LEVEL;
 
@@ -3691,7 +3691,7 @@ __setup("ivrs_acpihid",		parse_ivrs_acpihid);
 bool amd_iommu_pasid_supported(void)
 {
 	/* CPU page table size should match IOMMU guest page table size */
-	if (cpu_feature_enabled(X86_FEATURE_5LEVEL_PAGING) &&
+	if (cpu_feature_enabled(X86_FEATURE_LA57) &&
 	    amd_iommu_gpt_level != PAGE_MODE_5_LEVEL)
 		return false;
 
diff --git a/drivers/iommu/intel/svm.c b/drivers/iommu/intel/svm.c
index 1f615e6d06ec..ba93123cb4eb 100644
--- a/drivers/iommu/intel/svm.c
+++ b/drivers/iommu/intel/svm.c
@@ -37,7 +37,7 @@ void intel_svm_check(struct intel_iommu *iommu)
 		return;
 	}
 
-	if (cpu_feature_enabled(X86_FEATURE_5LEVEL_PAGING) &&
+	if (cpu_feature_enabled(X86_FEATURE_LA57) &&
 	    !cap_fl5lp_support(iommu->cap)) {
 		pr_err("%s SVM disabled, incompatible paging mode\n",
 		       iommu->name);
@@ -165,7 +165,7 @@ static int intel_svm_set_dev_pasid(struct iommu_domain *domain,
 		return PTR_ERR(dev_pasid);
 
 	/* Setup the pasid table: */
-	sflags = cpu_feature_enabled(X86_FEATURE_5LEVEL_PAGING) ? PASID_FLAG_FL5LP : 0;
+	sflags = cpu_feature_enabled(X86_FEATURE_LA57) ? PASID_FLAG_FL5LP : 0;
 	ret = __domain_setup_first_level(iommu, dev, pasid,
 					 FLPT_DEFAULT_DID, mm->pgd,
 					 sflags, old);

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
