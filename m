Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6529E280306
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 21:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747432481; cv=none; b=fhGHls0Ybxol6IW9aj3Jksj3XgGQUt3vY4KmaPg9TZi4Py/mkMgUEQJL5qaduP//ubgR/1Inrtk+HgUkYaQLO/ZccHtQ+x/XuhelUul0QJSWBUl4oyBcM+HzbhQNTW/tQxlsQubknw8SSLD7FjkgRbX6R1SCuXCdYJY6UT0DzTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747432481; c=relaxed/simple;
	bh=nRPieSPOQF3VWwkmferQ1dgFBNyvX49xzQ3/NHlAE9Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hshP2GqIRX5NaKa6OsJVGzpW9XsAY8wY3ZSUtl+XZMXX6yTDhTXnEhdgwuxvkuBDYdw6UhtobesATFJQGNHUua9dlIDNrHzV/heAuEYsExp2GoTCZo+gzbVJS5+fwvel3rVVphWq9W08tz90wswyc2aXDciodl8nP9FjHFQH+YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mpgAOzN6; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mpgAOzN6"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-30e6ccd17d6so2370343a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 14:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747432479; x=1748037279; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=D0gXvpr2sHdqy9QZLUq/qbAZv7yiyUTA7R6EBW7+pvc=;
        b=mpgAOzN609xA3+MSbXoT0pRFGc/sGYDtMvWODsOZRp9/SdDIQwxKNRbycdg5iCrscn
         1UjqFf4KpE+cZh8qwGS3V166rUtCGI0uo4B0t5sLmVzsbf5cepwakJGItZlS3EBZZ8iA
         yxIno286gtoM1apT3fSWbxtp+TYhI5axFXVbAGihfk/HaW3WpQ6E8D+D9Ww6BBgNKIlq
         3Pz2l05PIcnBnlwJeaFQ5KEq0yxgkuBu4VqIpG9Dd9Zmz62ehwukxDobK4v/h9bdZvpI
         zrwySx6zD37w1pEBhalO0BxjeXagDd02FYqRPk7446mTnoUg42JKOk2aqRjPLYD+LBPA
         ZVzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747432479; x=1748037279;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D0gXvpr2sHdqy9QZLUq/qbAZv7yiyUTA7R6EBW7+pvc=;
        b=DZxBjTcjt2BQblM8itu9kvdQT3n4Unu9SiR4w55wH4IJo6Qi4kWfB2t93CrWjuCsC3
         as1yLZAUVq+T9k0vVOYf9QpDE4D3Ys+LNa2WFhT5FL4pQ8Ty3MjIq7WXpVnRQr8p9iAx
         A6XR5mqMRLyB3n0DV1IOGRgSgKudEbx670Nd79ukwBqo8bGbOZ68LFOo51bhWTGT7tfQ
         QZoYGYTTrPKpT+L/9m06S2sNNWednCk40001aaz51zATl4LvcUh1nxM+oW9bM3GDDKv/
         yO11SWpBElPUGliGFM+MRZ15rHpyPRxKMyFQGRMeagx7ME5LTWOCk5BOHTDGs2zsouHA
         sStw==
X-Forwarded-Encrypted: i=1; AJvYcCV7e+9nh4Auli/fZA1c/aI5zgbj5o1OW1XtmpybseNB4b3AOi/RK6i6+h3YwfkcxvxHUviMwZDMM9sSEzo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuI0M9Au0QC+g8tKtcFIc0N4z4rivcxrEYuqcQSNlHCPLiW2GI
	XXmLjM6Wvp1SWgVLkxmdZlJ3uEorVn2YMyHa4Z4bvZREsQS4uwJ1GBWkOyKkpLeEoAifrQMmzfR
	gp54vtg==
X-Google-Smtp-Source: AGHT+IH34nCA0NwEOc5om/HjB7xT1Sgsq7/Owr6ybh70IbeIayMQAkFXjkdzcFi3Zex3eJnI4pnnMU32WEw=
X-Received: from pjbpt6.prod.google.com ([2002:a17:90b:3d06:b0:30a:7da4:f075])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:28c5:b0:2f2:a664:df1a
 with SMTP id 98e67ed59e1d1-30e7d4f920dmr8130238a91.2.1747432479652; Fri, 16
 May 2025 14:54:39 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 16 May 2025 14:54:21 -0700
In-Reply-To: <20250516215422.2550669-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250516215422.2550669-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <20250516215422.2550669-3-seanjc@google.com>
Subject: [PATCH v3 2/3] KVM: x86: Use kvzalloc() to allocate VM struct
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vipin Sharma <vipinsh@google.com>
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
 arch/x86/kvm/vmx/main.c         |  2 ++
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
diff --git a/arch/x86/kvm/vmx/main.c b/arch/x86/kvm/vmx/main.c
index d1e02e567b57..e18dfada2e90 100644
--- a/arch/x86/kvm/vmx/main.c
+++ b/arch/x86/kvm/vmx/main.c
@@ -64,6 +64,8 @@ static __init int vt_hardware_setup(void)
 		vt_x86_ops.protected_apic_has_interrupt = tdx_protected_apic_has_interrupt;
 	}
 
+	KVM_SANITY_CHECK_VM_STRUCT_SIZE(kvm_tdx);
+
 	return 0;
 }
 
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
index 832f0faf4779..0f3046cccb79 100644
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
+	BUILD_BUG_ON(get_order(sizeof(struct x)) < 2 &&					\
+		     !IS_ENABLED(CONFIG_DEBUG_KERNEL) && !IS_ENABLED(CONFIG_KASAN));	\
+} while (0)
+
 #define KVM_NESTED_VMENTER_CONSISTENCY_CHECK(consistency_check)		\
 ({									\
 	bool failed = (consistency_check);				\
-- 
2.49.0.1112.g889b7c5bd8-goog

