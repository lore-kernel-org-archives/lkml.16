Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D58B28CF5F
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 11:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747134738; cv=none; b=AYNWDXLMr1nfh+sRkwoBiNco39Xl/rl9iwLW2pRshtIO/LMRpMLJrSdJVgzekhxzdFDbCY6UTWxx0WksDFsUieEyyNSD8ze6C+R9Ndy72cLh9T3ThNc9EuQTMI1VW1HtV0/TcwC17e32vIt/MHEm/xPJq66YqwDEZ1+Af6iD17Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747134738; c=relaxed/simple;
	bh=SiE9cxLDiw7N8srrflo7E3I2uPLPal/N84998cgDVx4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kY0XIpiXBDsXxSznnJew+ou187jc/GCLWqnfEjYgx2uLSSL+Uv8kl/GSBeg3e26xbXC0oCPi3fyAXrju17QYuoi4fg0oeu2h3MfSdKZveMyZUhuffkkDAey2AXaysBSVHP60jjLeZGKG1JA+hA8KFAnRO+HbE91bLOXdPY3X5y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UmmHGgw1; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UmmHGgw1"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-442d472cf7fso32541425e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 04:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747134734; x=1747739534; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bGXY26rkuYFN33Dk+vazAfhid/+q25E0zXYiCdmIXuo=;
        b=UmmHGgw1s8e1Oj9CyLWcoWTKWR8OwqsloV6EX6IfxRRtB/y8FX2w44tskeJmeVA7o+
         u1/q06hzPPMax1NmwzTKkX0PG5LlVtz/3JBoNC8CdV6PziOcdObE+BUNcCMDmemCAFGX
         QPML6q/v8hEesWKeJrw0tfMam1HbA9Ps5ByHFQCIODpcgOOjCBi0f+7T58uktd5d0KIS
         fHyh/1M1ThjJjM4KwlpU0UEHpbBn4tAcAxI+ZojYd6LTMzaRbP0w2zLA8wmAsYvzV7gj
         i3S8UoPZBxLy+HlZzn0RNGXkJeiQ5Rv/9yZ6+4r953d/oQtpc1b6VduaMV76JHs6ZhMC
         yR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747134734; x=1747739534;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bGXY26rkuYFN33Dk+vazAfhid/+q25E0zXYiCdmIXuo=;
        b=u0m9m9SKfwMOyz7m0YOeom1eUIpzpLmL647EtPt45xbQbVZVzSakgwDJX64G9XlPwZ
         T2tJVzXzQFtVd0sJKhQYS+aobEeV9HtStW5fIvrmF/IfZJjbFvvKYQeFHdeFtAUwTWVw
         JGBMGsRaPLqj+0MKlM0XPAU+7WJhUSFT+Dmgynm57ls8hj6VUUntMDRMeoXel2L8czzR
         2LvV9fOcsPk12F+RZWWkh0K6w2qzjOj0IaEIWhDKGbQF+7LT7wspi7wS/pPbUOUAhp28
         7PeygTe33A0wiYHpz26hT54Xheo/knkKss44HIsnFPaRx8z7trWLifPVTESGzhJAaW4N
         U9hA==
X-Gm-Message-State: AOJu0Yz2NDSy/E9BVNuLCsSakmDcnQHhJow5b7L5rRb6mQhHsw6+1/DY
	oLJyQcbr072YWFw0ubvfqfXjlgOT3yh4salSgovNEO4AtYY91aXdkqhYXct4ImqHmvJ85AiJYAM
	KDooe82jF4qw+1untFGr8F0F/uKj5By+fBrCSFkumjONAMU/rJaKzEK9eu0tdtQCkH917zo81i6
	aD3Y1dg0+M0/LQW8cejGa/zRqk/ylyPw==
X-Google-Smtp-Source: AGHT+IGKS18rlNuMSDx8foLA5/omTQ9ArqIDwz9wP8fDSpdTQarXd3VgQ9KmTdRfYBeY1a3vEY9F/xMM
X-Received: from wmbdo8.prod.google.com ([2002:a05:600c:6808:b0:442:cd42:1f7])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:46d3:b0:43c:f470:7605
 with SMTP id 5b1f17b1804b1-442d6d377f0mr169499755e9.12.1747134734613; Tue, 13
 May 2025 04:12:14 -0700 (PDT)
Date: Tue, 13 May 2025 13:12:00 +0200
In-Reply-To: <20250513111157.717727-8-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250513111157.717727-8-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=7295; i=ardb@kernel.org;
 h=from:subject; bh=CTJz8NdzmD/WIIGiFevnMSJGKvermr1seghTmPDFq64=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUNZk0HGovNuyNqi6UvWSzhfqfDsv3mJOfrRjB9ZBg/mG
 UwPkYzqKGVhEONgkBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABMJncTwP3it7OXk0soXPNFz
 TKpu/ti1P25nlJJdMneWQK7tzkpmbob/iZmrZ9XrqNWIM3DL9tzvu+raxzWVa/dLI2njsxO/rhX nAwA=
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Message-ID: <20250513111157.717727-10-ardb+git@google.com>
Subject: [RFC PATCH v2 2/6] x86/cpu: Use a new feature flag for 5 level paging
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>
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

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/include/asm/cpufeatures.h               |  1 +
 arch/x86/include/asm/page_64.h                   |  2 +-
 arch/x86/include/asm/pgtable_64_types.h          |  2 +-
 arch/x86/kernel/cpu/common.c                     | 16 ++--------------
 arch/x86/kvm/x86.h                               |  4 ++--
 drivers/iommu/amd/init.c                         |  4 ++--
 drivers/iommu/intel/svm.c                        |  4 ++--
 tools/testing/selftests/kvm/x86/set_sregs_test.c |  2 +-
 8 files changed, 12 insertions(+), 23 deletions(-)

diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
index 6c2c152d8a67..13162cac8957 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -481,6 +481,7 @@
 #define X86_FEATURE_AMD_HETEROGENEOUS_CORES (21*32 + 6) /* Heterogeneous Core Topology */
 #define X86_FEATURE_AMD_WORKLOAD_CLASS	(21*32 + 7) /* Workload Classification */
 #define X86_FEATURE_PREFER_YMM		(21*32 + 8) /* Avoid ZMM registers due to downclocking */
+#define X86_FEATURE_5LEVEL_PAGING	(21*32 + 9) /* Whether 5 levels of page tables are in use */
 
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
index 5bb782d856f2..88dc719b7d37 100644
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
index f0f85482a73b..bbec5c4cd8ed 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1675,20 +1675,8 @@ static void __init early_identify_cpu(struct cpuinfo_x86 *c)
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
index dd9e26b7b718..1d129969c4fd 100644
--- a/drivers/iommu/amd/init.c
+++ b/drivers/iommu/amd/init.c
@@ -3084,7 +3084,7 @@ static int __init early_amd_iommu_init(void)
 		goto out;
 
 	/* 5 level guest page table */
-	if (cpu_feature_enabled(X86_FEATURE_LA57) &&
+	if (cpu_feature_enabled(X86_FEATURE_5LEVEL_PAGING) &&
 	    FIELD_GET(FEATURE_GATS, amd_iommu_efr) == GUEST_PGTABLE_5_LEVEL)
 		amd_iommu_gpt_level = PAGE_MODE_5_LEVEL;
 
@@ -3683,7 +3683,7 @@ __setup("ivrs_acpihid",		parse_ivrs_acpihid);
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
2.49.0.1045.g170613ef41-goog

