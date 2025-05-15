Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04CF235371
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 20:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747340944; cv=none; b=bA/yi3bsE9WbkTo0T1oEDAPULrFrhXKHDG+YFL3AhOdBjyUWhRjUnfeLs1s2feNSz6rfGGktsLFNPufC5qDJ9ePZowwDKqCZdh0zHzk3A2h2kqwLFCe1g+FAUbCRI9TV8mzfUpRSqFE+LYyRmc9Q0hItEAcRHCrbvK/udJC7Eok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747340944; c=relaxed/simple;
	bh=qpTfU7XOprI/kvZiFlufF/io7suJwOtPxC3JUsMa7AE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aHhXbC9hCsYFaosID/ny2XtrQN03ulgcZGvxu9YAbHXFD3Rgb/Y6YzMDkZ6t9x2pGiNFuTEMqzXdUSC4wnaiHIpKkuO9HOJblnev89Fcm7/H4wy3NrULOjqbZyllXHH6uVopFavYkQK1DK+EW55l3ju0AeCecW7zEq62jBZpEKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Kib/ZCuX; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Db4LWQCb; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Kib/ZCuX";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Db4LWQCb"
Date: Thu, 15 May 2025 22:28:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747340941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dezAiO+6NtjbxTAnko7B/7eCkBAIolQDl5NvQdCS6XI=;
	b=Kib/ZCuXdQ3WDGWvoOs83ymOxhu8Z+1YXrMJfoaLmznHs+lEvO7yS5DOUmDbaRxFKPGMJZ
	Tj3SUYlL7gH8Fg7LOFnXxyBTUlckgUp6fAAj8Mw/m2qWCagyS97U92dm7T+SHahzyTeuph
	bpgzxjVEbJzCrFud+dACtTKoq7dUkL1RzZ+MVCL/LYFV6d+7uRfUHsWuiy0VydfSB6xV1k
	RJi5NaPMKi20vg0zWtpC7532XwB0zIAn4Hb7HxgLhotnDfAyEmtng+OxPm0f6qnS81YO3P
	FqzzKi6XBWz4RMbCLVtYKeuDGphW+AcggC8R1SwspTr7JKEQ5Zm0IhrM+1c/ag==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747340941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dezAiO+6NtjbxTAnko7B/7eCkBAIolQDl5NvQdCS6XI=;
	b=Db4LWQCbnxXF5EZLHTQMY5tIb/rAR4vcjMfR6XC5Oha3wuhXdrfv1xYBMRm6ZdPrc2ZMag
	e37wXweFAcHgf4CA==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v3] x86/cpuid: Rename hypervisor_cpuid_base() to
 cpuid_base_hypervisor()
Message-ID: <aCZOi0Oohc7DpgTo@lx-t490>
References: <20250515202143.34448-1-darwi@linutronix.de>
 <20250515202143.34448-3-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515202143.34448-3-darwi@linutronix.de>

In order to let all the APIs under <cpuid/api.h> have a shared "cpuid_"
namespace, rename hypervisor_cpuid_base() to cpuid_base_hypervisor().

To align with the new style, also rename:

    for_each_possible_hypervisor_cpuid_base(function)

to:

    for_each_possible_cpuid_base_hypervisor(function)

Adjust call-sites accordingly.

Suggested-by: Ingo Molnar <mingo@kernel.org>
Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---

 Changelog-v3: Fix commit subject line to include the new function name,
 cpuid_base_hypervisor().

 arch/x86/include/asm/acrn.h           | 2 +-
 arch/x86/include/asm/cpuid/api.h      | 6 +++---
 arch/x86/include/asm/xen/hypervisor.h | 2 +-
 arch/x86/kernel/jailhouse.c           | 2 +-
 arch/x86/kernel/kvm.c                 | 2 +-
 arch/x86/kvm/cpuid.c                  | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/acrn.h b/arch/x86/include/asm/acrn.h
index 1dd14381bcb6..fab11192c60a 100644
--- a/arch/x86/include/asm/acrn.h
+++ b/arch/x86/include/asm/acrn.h
@@ -25,7 +25,7 @@ void acrn_remove_intr_handler(void);
 static inline u32 acrn_cpuid_base(void)
 {
 	if (boot_cpu_has(X86_FEATURE_HYPERVISOR))
-		return hypervisor_cpuid_base("ACRNACRNACRN", 0);
+		return cpuid_base_hypervisor("ACRNACRNACRN", 0);

 	return 0;
 }
diff --git a/arch/x86/include/asm/cpuid/api.h b/arch/x86/include/asm/cpuid/api.h
index ccf20c62b89f..44fa82e1267c 100644
--- a/arch/x86/include/asm/cpuid/api.h
+++ b/arch/x86/include/asm/cpuid/api.h
@@ -188,14 +188,14 @@ static __always_inline bool cpuid_function_is_indexed(u32 function)
 	return false;
 }

-#define for_each_possible_hypervisor_cpuid_base(function) \
+#define for_each_possible_cpuid_base_hypervisor(function) \
 	for (function = 0x40000000; function < 0x40010000; function += 0x100)

-static inline u32 hypervisor_cpuid_base(const char *sig, u32 leaves)
+static inline u32 cpuid_base_hypervisor(const char *sig, u32 leaves)
 {
 	u32 base, eax, signature[3];

-	for_each_possible_hypervisor_cpuid_base(base) {
+	for_each_possible_cpuid_base_hypervisor(base) {
 		cpuid(base, &eax, &signature[0], &signature[1], &signature[2]);

 		/*
diff --git a/arch/x86/include/asm/xen/hypervisor.h b/arch/x86/include/asm/xen/hypervisor.h
index bd0fc69a10a7..c2fc7869b996 100644
--- a/arch/x86/include/asm/xen/hypervisor.h
+++ b/arch/x86/include/asm/xen/hypervisor.h
@@ -43,7 +43,7 @@ extern struct start_info *xen_start_info;

 static inline uint32_t xen_cpuid_base(void)
 {
-	return hypervisor_cpuid_base(XEN_SIGNATURE, 2);
+	return cpuid_base_hypervisor(XEN_SIGNATURE, 2);
 }

 struct pci_dev;
diff --git a/arch/x86/kernel/jailhouse.c b/arch/x86/kernel/jailhouse.c
index cd8ed1edbf9e..9e9a591a5fec 100644
--- a/arch/x86/kernel/jailhouse.c
+++ b/arch/x86/kernel/jailhouse.c
@@ -49,7 +49,7 @@ static uint32_t jailhouse_cpuid_base(void)
 	    !boot_cpu_has(X86_FEATURE_HYPERVISOR))
 		return 0;

-	return hypervisor_cpuid_base("Jailhouse\0\0\0", 0);
+	return cpuid_base_hypervisor("Jailhouse\0\0\0", 0);
 }

 static uint32_t __init jailhouse_detect(void)
diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
index f3642226e0a5..921c1c783bc1 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -875,7 +875,7 @@ static noinline uint32_t __kvm_cpuid_base(void)
 		return 0;	/* So we don't blow up on old processors */

 	if (boot_cpu_has(X86_FEATURE_HYPERVISOR))
-		return hypervisor_cpuid_base(KVM_SIGNATURE, 0);
+		return cpuid_base_hypervisor(KVM_SIGNATURE, 0);

 	return 0;
 }
diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
index 7f43d8d24fbe..ecd85f4801cc 100644
--- a/arch/x86/kvm/cpuid.c
+++ b/arch/x86/kvm/cpuid.c
@@ -236,7 +236,7 @@ static struct kvm_hypervisor_cpuid kvm_get_hypervisor_cpuid(struct kvm_vcpu *vcp
 	struct kvm_cpuid_entry2 *entry;
 	u32 base;

-	for_each_possible_hypervisor_cpuid_base(base) {
+	for_each_possible_cpuid_base_hypervisor(base) {
 		entry = kvm_find_cpuid_entry(vcpu, base);

 		if (entry) {
--
2.49.0
