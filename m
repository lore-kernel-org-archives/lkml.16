Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6661C24DCFE
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 00:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747959109; cv=none; b=oqbMyrxPbs9easfrRWoGNh12lwqvjF/9c4t1ttdap30+QVxr4F0S66Al1ZLYEezztK9YkbNfyjdzn3U+gxfknVBZHMcmuBDLNeTa1JtHDaMByrKrimga9ul3Ehh77vYnGBnXTrvlP78pFQ9hT1bdkwGNvPwxXDwVtmXmmF33sVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747959109; c=relaxed/simple;
	bh=+ePbA9IebCdbBB4vABHa4UUkOnxwLFCdaaUUAlJzaeo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NRZHWlsPy64mEO0+SrXjtWE9jtfUAenC0t8Yj/ENxmrLdPawyasdncejxkjEu7z1HR4Fy0BmqUlzc/5LwPVNWCSZzLBMgO6P9kmcOtVEXsHvb13N8mj2o8vNnXkLV1Zf/vkvho/8UESbkAUT+m+JCeADxyEy9ytRXtoKodApI4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o3sxMYV6; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o3sxMYV6"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3108d5538c0so2056365a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 17:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747959106; x=1748563906; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=SFvVGfdjVe68Lcv3nMcYvz6wEM8RX1QjbaqHj6wcH2k=;
        b=o3sxMYV6cSis3XtpXIXqQJ/ix5+ZyB/OAbceQwb8jHrTkOmUXwO266UsxkGw1lfxh9
         nxt/uuO/1br6UVKKOI2vR4pN36LG6MwgmKiLIW+LC3keSWW8pduQVulU6s168JRu/DVh
         j/3E2L/7qJPQESHx/rOVCTvCP8AUTRJLNYR30EDyEEPWzueu6r5HaxJdeu45PXHDKxon
         GRQfXYQ9Lb9U95Zuzd0azls1vgRVBkzZhnnn0blwneHQOSSWqjFzENjcJU024FaOoFPd
         pwFdkH457y//cTzVuFdbUVKN2ptnoPSq67RS69ppQdGlvkczEtrOM4mjNJBcNKkZ8mYp
         9VFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747959106; x=1748563906;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SFvVGfdjVe68Lcv3nMcYvz6wEM8RX1QjbaqHj6wcH2k=;
        b=alBTR2uTiuu2+XmuDN6Q+OglDCr3MpiK0zg898MaV01tHVKyWJye+/CTPwm4gFneP3
         yvrkJFGBhF5xCHligqzBgQwSmvX/pGLHrAIRcNCrKLPD+inTDjy2YCHnwuWECjgWd0ZP
         NU49D5ulyY1eELUiSSbshwRvquYegOl/M/y+1TN295fJydSsj/eNS34D/JYW37ktgO9A
         rZdSGrp81ofpMRG29zSKQBnynzF14KTo0GA6FMX9j4k2NSQOL0vKxP40k6VDUxSxVNND
         z+8RPw8hxcPEDgZLwq5yPch82Xhj5QvOpEp6gdsqcSxuLxkLI4n5Acayjy5gR6nNQLFa
         FHlw==
X-Forwarded-Encrypted: i=1; AJvYcCUJ2lP9W2r8FrwO4cgHcWecvcQ0ec6tFuz94CTWM33Nb1YbqDD3HwkvkPZjkcIPwzaMaK71dq5fWTxS39U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd7YWunCW9rG3l6KCwcU7OO9ctazFS88z/2nGyoM6U5exWKWRR
	WzwBtg1fiuDbp78P8wdXv4ZxeOVHy36sORfBRvL9TlP79eyKosUolmWQX8/y/jUije0VB1RVQJh
	Avu2RxQ==
X-Google-Smtp-Source: AGHT+IFXejHNB1MVLyCyxsu8hgU/yJNUmWF4rMS2c4NmhYW0BkLhjuLGqMvU5Lsb8AeRc+Sz5DJolyQUQkQ=
X-Received: from pjd15.prod.google.com ([2002:a17:90b:54cf:b0:308:861f:fddb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2f0d:b0:2fe:68a5:d84b
 with SMTP id 98e67ed59e1d1-30e7d4e7e1bmr38315774a91.1.1747959106548; Thu, 22
 May 2025 17:11:46 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 May 2025 17:11:37 -0700
In-Reply-To: <20250523001138.3182794-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250523001138.3182794-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250523001138.3182794-4-seanjc@google.com>
Subject: [PATCH v4 3/4] KVM: x86: Use kvzalloc() to allocate VM struct
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vipin Sharma <vipinsh@google.com>, James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="UTF-8"

Allocate VM structs via kvzalloc(), i.e. try to use a contiguous physical
allocation before falling back to __vmalloc(), to avoid the overhead of
establishing the virtual mappings.  For non-debug builds, The SVM and VMX
(and TDX) structures are now just below 7000 bytes in the worst case
scenario (see below), i.e. are order-1 allocations, and will likely remain
that way for quite some time.

Add compile-time assertions in vendor code to ensure the size of the
structures, sans the memslos hash tables, are order-0 allocations, i.e.
are less than 4KiB.  There's nothing fundamentally wrong with a larger
kvm_{svm,vmx,tdx} size, but given that the size of the structure (without
the memslots hash tables) is below 2KiB after 18+ years of existence,
more than doubling the size would be quite notable.

Add sanity checks on the memslot hash table sizes, partly to ensure they
aren't resized without accounting for the impact on VM structure size, and
partly to document that the majority of the size of VM structures comes
from the memslots.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h |  2 +-
 arch/x86/kvm/svm/svm.c          |  2 ++
 arch/x86/kvm/vmx/tdx.c          |  2 ++
 arch/x86/kvm/vmx/vmx.c          |  2 ++
 arch/x86/kvm/x86.h              | 22 ++++++++++++++++++++++
 5 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 9667d6b929ee..3a985825a945 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1961,7 +1961,7 @@ void kvm_x86_vendor_exit(void);
 #define __KVM_HAVE_ARCH_VM_ALLOC
 static inline struct kvm *kvm_arch_alloc_vm(void)
 {
-	return __vmalloc(kvm_x86_ops.vm_size, GFP_KERNEL_ACCOUNT | __GFP_ZERO);
+	return kvzalloc(kvm_x86_ops.vm_size, GFP_KERNEL_ACCOUNT);
 }
 
 #define __KVM_HAVE_ARCH_VM_FREE
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 0ad1a6d4fb6d..d13e475c3407 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -5675,6 +5675,8 @@ static int __init svm_init(void)
 {
 	int r;
 
+	KVM_SANITY_CHECK_VM_STRUCT_SIZE(kvm_svm);
+
 	__unused_size_checks();
 
 	if (!kvm_is_svm_supported())
diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 1790f6dee870..559fb18ff9fb 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -3531,6 +3531,8 @@ int __init tdx_bringup(void)
 
 void __init tdx_hardware_setup(void)
 {
+	KVM_SANITY_CHECK_VM_STRUCT_SIZE(kvm_tdx);
+
 	/*
 	 * Note, if the TDX module can't be loaded, KVM TDX support will be
 	 * disabled but KVM will continue loading (see tdx_bringup()).
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 9ff00ae9f05a..ef58b727d6c8 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -8643,6 +8643,8 @@ int __init vmx_init(void)
 {
 	int r, cpu;
 
+	KVM_SANITY_CHECK_VM_STRUCT_SIZE(kvm_vmx);
+
 	if (!kvm_is_vmx_supported())
 		return -EOPNOTSUPP;
 
diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
index 832f0faf4779..db4e6a90e83d 100644
--- a/arch/x86/kvm/x86.h
+++ b/arch/x86/kvm/x86.h
@@ -55,6 +55,28 @@ struct kvm_host_values {
 
 void kvm_spurious_fault(void);
 
+#define SIZE_OF_MEMSLOTS_HASHTABLE \
+	(sizeof(((struct kvm_memslots *)0)->id_hash) * 2 * KVM_MAX_NR_ADDRESS_SPACES)
+
+/* Sanity check the size of the memslot hash tables. */
+static_assert(SIZE_OF_MEMSLOTS_HASHTABLE ==
+	      (1024 * (1 + IS_ENABLED(CONFIG_X86_64)) * (1 + IS_ENABLED(CONFIG_KVM_SMM))));
+
+/*
+ * Assert that "struct kvm_{svm,vmx,tdx}" is an order-0 or order-1 allocation.
+ * Spilling over to an order-2 allocation isn't fundamentally problematic, but
+ * isn't expected to happen in the foreseeable future (O(years)).  Assert that
+ * the size is an order-0 allocation when ignoring the memslot hash tables, to
+ * help detect and debug unexpected size increases.
+ */
+#define KVM_SANITY_CHECK_VM_STRUCT_SIZE(x)						\
+do {											\
+	BUILD_BUG_ON(get_order(sizeof(struct x) - SIZE_OF_MEMSLOTS_HASHTABLE) &&	\
+		     !IS_ENABLED(CONFIG_DEBUG_KERNEL) && !IS_ENABLED(CONFIG_KASAN));	\
+	BUILD_BUG_ON(get_order(sizeof(struct x)) > 1 &&					\
+		     !IS_ENABLED(CONFIG_DEBUG_KERNEL) && !IS_ENABLED(CONFIG_KASAN));	\
+} while (0)
+
 #define KVM_NESTED_VMENTER_CONSISTENCY_CHECK(consistency_check)		\
 ({									\
 	bool failed = (consistency_check);				\
-- 
2.49.0.1151.ga128411c76-goog

