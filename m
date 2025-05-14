Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6CB25DD07
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 10:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747219386; cv=none; b=dh4VqVq6piTKrizaUs/Aezy9aIQmThEioSCb5qgjp6xx6+r0ETu85tc4LUFoKM3ZO1TCz/QUA3yWh8UOyKGw4H8KGGHgBtnb/a+ZIHDKwTJX3CoqmqCqdvPD0qruzpArmx7PZ0wvGJghD9TZdWasHf8nOgxl/7oNTj2lmHP3pZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747219386; c=relaxed/simple;
	bh=WyGZ/24tIZKLg0DtCp8ZCs/LqUIOLp/iW/2ONkTOUgU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IzM9YsBU/CUw8gQoeZxD2dyLp6HaibFjS9ej3Il65RRaHkazYZ0OHL2rNFRZIPS2cJFYKc1c29MHHDvJPpDhLCnZU0V8UucB4Fs0E7Vf3pf7x1ajcNjzZaU2vF7uKNkIAPVwPm9X9YGrK2TXtWa54SqrSe0oYWEgrb3cuWpDRBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=twmy2FU9; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="twmy2FU9"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43cf44b66f7so38647165e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 03:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747219383; x=1747824183; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ckYKmlenvli+0Pxosp0NBNxHU7WK7xjiIFwUQud7L+M=;
        b=twmy2FU9WqpiWUunN6K3tO3r0CMofgSnxWmUESTa70Vc6pBRF0hufty3kg1taxLF2V
         5tidVLjsoAZRPUmI2foguZTd779re+XFOQbGgPsXbgIRx61i0ziksVLIsYe0H9YL0xIY
         OruTyqp5kP/96806gdQeyE+Uf9YJ33+VK+6Lm+hWex3BLtgzGglRt6NGxbC0ltAH7UAh
         R3Z1Jyg+FOtSY5P7VEQNZUSwIvpGnVkcvFShhi8Tw+29lRD9SfO/OVuuC8RZPmmbB6Dv
         9PXShzdcMpzSLux5jJrO9L3i7tFrr/6JhlgPgGzQtjA9WvDA0S8UZxssgTK2zcd3rgQb
         8EXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747219383; x=1747824183;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ckYKmlenvli+0Pxosp0NBNxHU7WK7xjiIFwUQud7L+M=;
        b=mlfq02XimetlarczL0pRNEcXgBSreXRW9UYn9qs5QqWDWKScJym3VwVJMnBuxNoHn8
         ZrsEkoco+VpI9uGGyBpDgHAgK3j7n8+kv1iODZeILqCyRRLrkpjc6HXRJQZYkZEbmkx6
         pjIJjSPKgwHl7Bn2OJhcsZDn4zKbs10VP/Jq9VI+n2tEfdkQE7iApjhDQaFGOjf2DLqR
         PcgZB9S1lfFuvqm08EFoj2BjU60kRyztwcHFJYtbBu5yXDhfWyRks5KFjwkR//ld4Slg
         WGlk9orfxVZ2mTquuu2aNhBKFtrLaINs1AiZWIko4A4xpcKkUePG+2obigb7VP/HlFdK
         kj+Q==
X-Gm-Message-State: AOJu0YzDUdw4pKudnAQaTQ83sZgcZfGeKjjNLhK1t5rppnLXMcpQNfeJ
	5QRAh7Bk6Xat2oMAgf3HbVEf0BDwHI0GOuJ4mWr/zJZL/Y9G7N/1q6zgW4ir1LnA54yNFqAHTGv
	BfiFZDYfCg7PJtzbRFBrhW/mgcpdmnXnAOAPOuu/WpS5JIID+mWRGD3wFhq4J1roB7dZiXyLh9P
	Jz7C2e8ceRzKHE1bjuqdMecU+S5e2erQ==
X-Google-Smtp-Source: AGHT+IHbw3td/F9MyBKMNyMdIHKKo8hqKv1EMrvJQzvgVFUp+PGwcQKl6dlPm5huSDTMMlh0d6sLisHn
X-Received: from wmbjb12.prod.google.com ([2002:a05:600c:54ec:b0:442:f45c:c10c])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600d:1b:b0:442:f4d4:53a
 with SMTP id 5b1f17b1804b1-442f4d43e20mr13951605e9.2.1747219383053; Wed, 14
 May 2025 03:43:03 -0700 (PDT)
Date: Wed, 14 May 2025 12:42:44 +0200
In-Reply-To: <20250514104242.1275040-9-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250514104242.1275040-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=8344; i=ardb@kernel.org;
 h=from:subject; bh=t77kZe3wNkywK6OUBs9RIua9fCaypVtIiPtrUFlNqNY=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUOleAn/jnci6sWaHorvmLv0t7xvL9rAevLDLuFmj4ybN
 7uf+y/uKGVhEONgkBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABNxb2L4p/Jmij3jlw7VK1YV
 rTP+ZX+NnrzQwjT95Yudvuu3HZubeobhrxB3wqzODLMnXmyMcjIrP1zJkJVe+FpX+5B0xa5bjoE H2AE=
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250514104242.1275040-10-ardb+git@google.com>
Subject: [PATCH v3 1/7] x86/cpu: Use a new feature flag for 5 level paging
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Brian Gerst <brgerst@gmail.com>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Currently, the LA57 CPU feature flag is taken to mean two different
things at once:
- whether the CPU implements the LA57 extension, and is therefore
  capable of supporting 5 level paging;
- whether 5 level paging is currently in use.

This means the LA57 capability of the hardware is hidden when a LA57
capable CPU is forced to run with 4 levels of paging. It also means the
the ordinary CPU capability detection code will happily set the LA57
capability and it needs to be cleared explicitly afterwards to avoid
inconsistencies.

Separate the two so that the CPU hardware capability can be identified
unambigously in all cases.

To avoid breaking existing users that might assume that 5 level paging
is being used when the "la57" string is visible in /proc/cpuinfo,
repurpose that string to mean that 5-level paging is in use, and add a
new string la57_capable to indicate that the CPU feature is implemented
by the hardware.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/include/asm/cpufeatures.h               |  3 ++-
 arch/x86/include/asm/page_64.h                   |  2 +-
 arch/x86/include/asm/pgtable_64_types.h          |  2 +-
 arch/x86/kernel/cpu/common.c                     | 16 ++--------------
 arch/x86/kvm/x86.h                               |  4 ++--
 drivers/iommu/amd/init.c                         |  4 ++--
 drivers/iommu/intel/svm.c                        |  4 ++--
 tools/testing/selftests/kvm/x86/set_sregs_test.c |  2 +-
 8 files changed, 13 insertions(+), 24 deletions(-)

diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
index f67a93fc9391..d59bee5907e7 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -395,7 +395,7 @@
 #define X86_FEATURE_AVX512_BITALG	(16*32+12) /* "avx512_bitalg" Support for VPOPCNT[B,W] and VPSHUF-BITQMB instructions */
 #define X86_FEATURE_TME			(16*32+13) /* "tme" Intel Total Memory Encryption */
 #define X86_FEATURE_AVX512_VPOPCNTDQ	(16*32+14) /* "avx512_vpopcntdq" POPCNT for vectors of DW/QW */
-#define X86_FEATURE_LA57		(16*32+16) /* "la57" 5-level page tables */
+#define X86_FEATURE_LA57		(16*32+16) /* "la57_hw" 5-level page tables */
 #define X86_FEATURE_RDPID		(16*32+22) /* "rdpid" RDPID instruction */
 #define X86_FEATURE_BUS_LOCK_DETECT	(16*32+24) /* "bus_lock_detect" Bus Lock detect */
 #define X86_FEATURE_CLDEMOTE		(16*32+25) /* "cldemote" CLDEMOTE instruction */
@@ -483,6 +483,7 @@
 #define X86_FEATURE_PREFER_YMM		(21*32+ 8) /* Avoid ZMM registers due to downclocking */
 #define X86_FEATURE_APX			(21*32+ 9) /* Advanced Performance Extensions */
 #define X86_FEATURE_INDIRECT_THUNK_ITS	(21*32+10) /* Use thunk for indirect branches in lower half of cacheline */
+#define X86_FEATURE_5LEVEL_PAGING	(21*32+11) /* "la57" Whether 5 levels of page tables are in use */
 
 /*
  * BUG word(s)
diff --git a/arch/x86/include/asm/page_64.h b/arch/x86/include/asm/page_64.h
index d3aab6f4e59a..acfa61ad0725 100644
--- a/arch/x86/include/asm/page_64.h
+++ b/arch/x86/include/asm/page_64.h
@@ -86,7 +86,7 @@ static __always_inline unsigned long task_size_max(void)
 	unsigned long ret;
 
 	alternative_io("movq %[small],%0","movq %[large],%0",
-			X86_FEATURE_LA57,
+			X86_FEATURE_5LEVEL_PAGING,
 			"=r" (ret),
 			[small] "i" ((1ul << 47)-PAGE_SIZE),
 			[large] "i" ((1ul << 56)-PAGE_SIZE));
diff --git a/arch/x86/include/asm/pgtable_64_types.h b/arch/x86/include/asm/pgtable_64_types.h
index e83721db18c9..d31ae12663bb 100644
--- a/arch/x86/include/asm/pgtable_64_types.h
+++ b/arch/x86/include/asm/pgtable_64_types.h
@@ -34,7 +34,7 @@ static inline bool pgtable_l5_enabled(void)
 	return __pgtable_l5_enabled;
 }
 #else
-#define pgtable_l5_enabled() cpu_feature_enabled(X86_FEATURE_LA57)
+#define pgtable_l5_enabled() cpu_feature_enabled(X86_FEATURE_5LEVEL_PAGING)
 #endif /* USE_EARLY_PGTABLE_L5 */
 
 #else
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 114aaaf6ae8a..6f7827015834 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1755,20 +1755,8 @@ static void __init early_identify_cpu(struct cpuinfo_x86 *c)
 	setup_clear_cpu_cap(X86_FEATURE_PCID);
 #endif
 
-	/*
-	 * Later in the boot process pgtable_l5_enabled() relies on
-	 * cpu_feature_enabled(X86_FEATURE_LA57). If 5-level paging is not
-	 * enabled by this point we need to clear the feature bit to avoid
-	 * false-positives at the later stage.
-	 *
-	 * pgtable_l5_enabled() can be false here for several reasons:
-	 *  - 5-level paging is disabled compile-time;
-	 *  - it's 32-bit kernel;
-	 *  - machine doesn't support 5-level paging;
-	 *  - user specified 'no5lvl' in kernel command line.
-	 */
-	if (!pgtable_l5_enabled())
-		setup_clear_cpu_cap(X86_FEATURE_LA57);
+	if (IS_ENABLED(CONFIG_X86_5LEVEL) && (native_read_cr4() & X86_CR4_LA57))
+		setup_force_cpu_cap(X86_FEATURE_5LEVEL_PAGING);
 
 	detect_nopl();
 }
diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
index 9dc32a409076..d2c093f17ae5 100644
--- a/arch/x86/kvm/x86.h
+++ b/arch/x86/kvm/x86.h
@@ -243,7 +243,7 @@ static inline u8 vcpu_virt_addr_bits(struct kvm_vcpu *vcpu)
 
 static inline u8 max_host_virt_addr_bits(void)
 {
-	return kvm_cpu_cap_has(X86_FEATURE_LA57) ? 57 : 48;
+	return kvm_cpu_cap_has(X86_FEATURE_5LEVEL_PAGING) ? 57 : 48;
 }
 
 /*
@@ -603,7 +603,7 @@ static inline bool __kvm_is_valid_cr4(struct kvm_vcpu *vcpu, unsigned long cr4)
 		__reserved_bits |= X86_CR4_FSGSBASE;    \
 	if (!__cpu_has(__c, X86_FEATURE_PKU))           \
 		__reserved_bits |= X86_CR4_PKE;         \
-	if (!__cpu_has(__c, X86_FEATURE_LA57))          \
+	if (!__cpu_has(__c, X86_FEATURE_5LEVEL_PAGING))          \
 		__reserved_bits |= X86_CR4_LA57;        \
 	if (!__cpu_has(__c, X86_FEATURE_UMIP))          \
 		__reserved_bits |= X86_CR4_UMIP;        \
diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
index 14aa0d77df26..083fca8f8b97 100644
--- a/drivers/iommu/amd/init.c
+++ b/drivers/iommu/amd/init.c
@@ -3084,7 +3084,7 @@ static int __init early_amd_iommu_init(void)
 		goto out;
 
 	/* 5 level guest page table */
-	if (cpu_feature_enabled(X86_FEATURE_LA57) &&
+	if (cpu_feature_enabled(X86_FEATURE_5LEVEL_PAGING) &&
 	    FIELD_GET(FEATURE_GATS, amd_iommu_efr) == GUEST_PGTABLE_5_LEVEL)
 		amd_iommu_gpt_level = PAGE_MODE_5_LEVEL;
 
@@ -3691,7 +3691,7 @@ __setup("ivrs_acpihid",		parse_ivrs_acpihid);
 bool amd_iommu_pasid_supported(void)
 {
 	/* CPU page table size should match IOMMU guest page table size */
-	if (cpu_feature_enabled(X86_FEATURE_LA57) &&
+	if (cpu_feature_enabled(X86_FEATURE_5LEVEL_PAGING) &&
 	    amd_iommu_gpt_level != PAGE_MODE_5_LEVEL)
 		return false;
 
diff --git a/drivers/iommu/intel/svm.c b/drivers/iommu/intel/svm.c
index ba93123cb4eb..1f615e6d06ec 100644
--- a/drivers/iommu/intel/svm.c
+++ b/drivers/iommu/intel/svm.c
@@ -37,7 +37,7 @@ void intel_svm_check(struct intel_iommu *iommu)
 		return;
 	}
 
-	if (cpu_feature_enabled(X86_FEATURE_LA57) &&
+	if (cpu_feature_enabled(X86_FEATURE_5LEVEL_PAGING) &&
 	    !cap_fl5lp_support(iommu->cap)) {
 		pr_err("%s SVM disabled, incompatible paging mode\n",
 		       iommu->name);
@@ -165,7 +165,7 @@ static int intel_svm_set_dev_pasid(struct iommu_domain *domain,
 		return PTR_ERR(dev_pasid);
 
 	/* Setup the pasid table: */
-	sflags = cpu_feature_enabled(X86_FEATURE_LA57) ? PASID_FLAG_FL5LP : 0;
+	sflags = cpu_feature_enabled(X86_FEATURE_5LEVEL_PAGING) ? PASID_FLAG_FL5LP : 0;
 	ret = __domain_setup_first_level(iommu, dev, pasid,
 					 FLPT_DEFAULT_DID, mm->pgd,
 					 sflags, old);
diff --git a/tools/testing/selftests/kvm/x86/set_sregs_test.c b/tools/testing/selftests/kvm/x86/set_sregs_test.c
index f4095a3d1278..de78665fa675 100644
--- a/tools/testing/selftests/kvm/x86/set_sregs_test.c
+++ b/tools/testing/selftests/kvm/x86/set_sregs_test.c
@@ -52,7 +52,7 @@ static uint64_t calc_supported_cr4_feature_bits(void)
 
 	if (kvm_cpu_has(X86_FEATURE_UMIP))
 		cr4 |= X86_CR4_UMIP;
-	if (kvm_cpu_has(X86_FEATURE_LA57))
+	if (kvm_cpu_has(X86_FEATURE_5LEVEL_PAGING))
 		cr4 |= X86_CR4_LA57;
 	if (kvm_cpu_has(X86_FEATURE_VMX))
 		cr4 |= X86_CR4_VMXE;
-- 
2.49.0.1101.gccaa498523-goog

