Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534921C5D4E
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 09:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747473414; cv=none; b=UgXzkbmXmY2GDxtQD94/qx4XWxtbcmV8FwAN6STCtc06ZpsBqqZeinotifBZYCTgk/ktr6NaHYcziDL//u1qhYjhRAkyAt+jSf4FfXUVpe9NMPayasPYGzmhB4pfEaaqaVwRxavO+EPNFIt0c9mXat4XWmpDOLgrVzqvJdVWc0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747473414; c=relaxed/simple;
	bh=A2PWt6apuTm9JwluZpTScl/wfgfGu9Nf4nGzK5k3BNU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iY4ZXu3yHOhCkfS4Wm9/KvMzCiU9rpj5i9gP05+jJdz0Llpn8JFIhOrPFpuvUCihyUWJAv/YpDJS2OfxV3dwes1SB1CzqPT83/CJkwHgBCy2LFuguGnUgKgbggBrMYbrQbHrOkBrmS7gNN+SFcBnHKshg11nNLjf7VTHQkdTDU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Hgqaa8D6; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Hgqaa8D6"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43cfda30a3cso15528465e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 02:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747473410; x=1748078210; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ySqGRgKPqgwX6++IKUIQ9Ziefq9nh8F/5/YDVXWW7hc=;
        b=Hgqaa8D6GCijHPERO6QnqnSG5Qeoq96SNCWFveAJQ+Jzmx0sNrPgJiyewNq+Tc2v1H
         aHxJrAbK8fgeg3cAgAIWubRBA5lQPwsqTBkBQdSrhkKU2MTrkfyhyLoojLbsWsTaZ50x
         C4kl9TfbKF8B1woGEQBhXqOn9P0MqE0I4O9nG43sMG6DQevvHXDU32Puow1mthP4KDxs
         3dZmfjZQSa6pKHAUId70RvRKFLiKRZiX74rtg4qVT3yTCdR2IzUTHJCTKWbHmJVm8SLc
         fsx+JSRA/seqDVs9JYaywtWCu6d20/0YyFbSwaVR6i8iBRqrjIgYYcesCB8OMIIcY738
         sNCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747473410; x=1748078210;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ySqGRgKPqgwX6++IKUIQ9Ziefq9nh8F/5/YDVXWW7hc=;
        b=hGbWsls6Q8B41hVzscOYhC3ysTXm92xeIKBAPzd0PjvYrutPpeFhMLDJSVu9p8ZCol
         1bGaxIDgRxhvQAn3TjYIg1qO45R3ES1rhdLChzB2OhRcUsx+rOskz2PE0f+2cciaRpXa
         3ZkwoOVhtMqYmMFQhLHl0M2Yub48XouNiALXSEmHeFNZ3cKRcY9jfoSh49ahgWssXH41
         SJoMjT8hsnATcjORA38NtN8IhXC9vqENces5YhBz/mOXVUKwagy9SR1CnHuOWMmSF0sl
         Pu6Wt6nm2JgNrDEKn1CVQqWrI0Xp7fI1kYK1wrSYogOlGwMuezols7flKllJuUzNvlrK
         0bpw==
X-Gm-Message-State: AOJu0YzbRRvGLiHOHG01d4ivFAtluMZT/fdqfm+ss0jKwVLsU3U47CXl
	tACiqYb5pZ7ZQFZM2TeDoyNV30q9OELIapzhReXqZ6LYzElW1alKsPKKabmAcHy7MOd6XXssv5J
	QqsMPkVjAfPG0Ois8337fqy6ZDcTGzSezPGNm7LWaajf6vWv2/0JaB97aN83z96IT/CwLbuRCJy
	c31wQZ9lEdT70futCjSlaqsqHFZUt6KIzs1w==
X-Google-Smtp-Source: AGHT+IEdsXPLrHmfzWnR5aagQ68Up8bfq5fBEgvzRrU1XlcXC2St/uxPUjjIbI45MsV2X7UYNYtdubIg
X-Received: from wmrm14.prod.google.com ([2002:a05:600c:37ce:b0:43c:f7c3:c16e])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3c87:b0:442:d9f2:c6ef
 with SMTP id 5b1f17b1804b1-442fefd5f98mr59544035e9.2.1747473410746; Sat, 17
 May 2025 02:16:50 -0700 (PDT)
Date: Sat, 17 May 2025 11:16:41 +0200
In-Reply-To: <20250517091639.3807875-8-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250517091639.3807875-8-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=6631; i=ardb@kernel.org;
 h=from:subject; bh=3LxUTlSUbspQmEIJOCH5/fP+eOwl8D45b7vP/53ouJk=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUMj+Mfe04YZv4vynNf8uMmZ/5klLkPo4t9qxd74dietg
 +13tih1lLIwiHEwyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgIns3cPI0HT4yTN19bMGd+7v
 n9bhZ7TDLlBsbf+xmUeV+8Umtzi+LmRkeKyzftXTd4Fxsqek7jMX++VJS+xU/pOkMUdL20fN6VA 7FwA=
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250517091639.3807875-9-ardb+git@google.com>
Subject: [PATCH v4 1/6] x86/cpu: Use a new feature flag for 5 level paging
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Brian Gerst <brgerst@gmail.com>, 
	"Kirill A. Shutemov" <kirill@shutemov.name>
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
 arch/x86/include/asm/cpufeatures.h      |  3 ++-
 arch/x86/include/asm/page_64.h          |  2 +-
 arch/x86/include/asm/pgtable_64_types.h |  2 +-
 arch/x86/kernel/cpu/common.c            | 16 ++--------------
 drivers/iommu/amd/init.c                |  4 ++--
 drivers/iommu/intel/svm.c               |  4 ++--
 6 files changed, 10 insertions(+), 21 deletions(-)

diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
index f67a93fc9391..5c19bee0af11 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -395,7 +395,7 @@
 #define X86_FEATURE_AVX512_BITALG	(16*32+12) /* "avx512_bitalg" Support for VPOPCNT[B,W] and VPSHUF-BITQMB instructions */
 #define X86_FEATURE_TME			(16*32+13) /* "tme" Intel Total Memory Encryption */
 #define X86_FEATURE_AVX512_VPOPCNTDQ	(16*32+14) /* "avx512_vpopcntdq" POPCNT for vectors of DW/QW */
-#define X86_FEATURE_LA57		(16*32+16) /* "la57" 5-level page tables */
+#define X86_FEATURE_LA57		(16*32+16) /* 57-bit linear addressing */
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
index eee06f77b245..bf4c33ae24d7 100644
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
index 8feb8fd2957a..67cdbd916830 100644
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
+	if (native_read_cr4() & X86_CR4_LA57)
+		setup_force_cpu_cap(X86_FEATURE_5LEVEL_PAGING);
 
 	detect_nopl();
 }
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
-- 
2.49.0.1101.gccaa498523-goog

