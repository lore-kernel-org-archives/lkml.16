Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3BA27A13C
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 15:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746716576; cv=none; b=eDB7nxCDTGyM8q8+ZBiicyJkPdj7Tm1gxz4JN5Fm2YSk/F4MT7M0VGl3ZXRHR46lOEb1x65Qpxg6kNB32rqZJGv8PtSriuVBw6Ft1zOvbrbPPyHOpGCZuO4cKqnZuh1bkO2OcufNqu/5M0yKuNV2LmLRfIw13wAyU9HCBp8sC5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746716576; c=relaxed/simple;
	bh=pLyBLISA1jVCwKlxy/h9Ji+QDPDETT7+/UIMCqqCApU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r+AQa/50CimN2S2TdKju3HcdssAyaSJzkTOYgz7aglf8ln/JIhEQqYs2AXWVVFX0nVYn1LzVIn75IRP18eIJKw7E7usdnHS17nL1KqKmGtzqY1xtgmDOz4nG531j75HPkoLtfgw8OKjGV/4J0s41fwC2zpRBl0BwdKb10thgeZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=eNcd90Rb; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MaqB2Xkz; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="eNcd90Rb";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MaqB2Xkz"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746716573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u0W/UPFWoW8PqfBXB7gf7n2lCel41MNGw4v1MeRpAvk=;
	b=eNcd90RbhF8rPgC3KAl+diwKqMyoSpzdYd04HPYnle5/q7hAsBe9kBRlu6qDERNTzN2gtS
	8bATJfeZXZ2PxxRSIQ+U1d/QB5nD7PuYqC3zOag4vSPnGItroIi3DjiZ0EDetrbxEGy9bK
	iJO2ApTs+04UNa7ziQ8DfDkFsL3ioSPkrLI5Xmi64sIbf3F5n944dAHH4AIe7PsOD0GXZU
	1ZE6K0LnjElseWNcI6cxxfbkmwWtK9p34V6f7DWg4cwXZf5RBOIYEsU75+Gqg49X7giB31
	iOlrz4pocraiYOxhKVxuwqn58Rc/I1kpPusAfJFCrNdTfCR6WWSdHzqhDJSypQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746716573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u0W/UPFWoW8PqfBXB7gf7n2lCel41MNGw4v1MeRpAvk=;
	b=MaqB2XkzrUzsZD4/BRe8HY1BdS+WJbxSA9ubzHT56VLoYgeqsFGzJjuMUuwWJIjQn2W564
	p4ZciaDgYzKS/2Bg==
To: Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>,
	x86@kernel.org,
	x86-cpuid@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: [PATCH v1 4/9] x86/cpuid: Rename hypervisor_cpuid_base() to cpuid_hypervisor_base()
Date: Thu,  8 May 2025 17:02:33 +0200
Message-ID: <20250508150240.172915-5-darwi@linutronix.de>
In-Reply-To: <20250508150240.172915-1-darwi@linutronix.de>
References: <20250508150240.172915-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to let all the APIs under <cpuid/api.h> have a shared "cpuid_"
namespace, rename hypervisor_cpuid_base() to cpuid_hypervisor_base().

To align with the new style, also rename:

    for_each_possible_hypervisor_cpuid_base(function)

to:

    for_each_possible_cpuid_hypervisor_base(function)

Adjust all call-sites accordingly.

Suggested-by: Ingo Molnar <mingo@kernel.org>
Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/acrn.h           | 2 +-
 arch/x86/include/asm/cpuid/api.h      | 6 +++---
 arch/x86/include/asm/xen/hypervisor.h | 2 +-
 arch/x86/kernel/jailhouse.c           | 2 +-
 arch/x86/kernel/kvm.c                 | 2 +-
 arch/x86/kvm/cpuid.c                  | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/acrn.h b/arch/x86/include/asm/acrn.h
index 1dd14381bcb6..b509c622e6f4 100644
--- a/arch/x86/include/asm/acrn.h
+++ b/arch/x86/include/asm/acrn.h
@@ -25,7 +25,7 @@ void acrn_remove_intr_handler(void);
 static inline u32 acrn_cpuid_base(void)
 {
 	if (boot_cpu_has(X86_FEATURE_HYPERVISOR))
-		return hypervisor_cpuid_base("ACRNACRNACRN", 0);
+		return cpuid_hypervisor_base("ACRNACRNACRN", 0);
 
 	return 0;
 }
diff --git a/arch/x86/include/asm/cpuid/api.h b/arch/x86/include/asm/cpuid/api.h
index c0211fcdc706..0e4b53306e99 100644
--- a/arch/x86/include/asm/cpuid/api.h
+++ b/arch/x86/include/asm/cpuid/api.h
@@ -188,14 +188,14 @@ static __always_inline bool cpuid_function_is_indexed(u32 function)
 	return false;
 }
 
-#define for_each_possible_hypervisor_cpuid_base(function) \
+#define for_each_possible_cpuid_hypervisor_base(function) \
 	for (function = 0x40000000; function < 0x40010000; function += 0x100)
 
-static inline u32 hypervisor_cpuid_base(const char *sig, u32 leaves)
+static inline u32 cpuid_hypervisor_base(const char *sig, u32 leaves)
 {
 	u32 base, eax, signature[3];
 
-	for_each_possible_hypervisor_cpuid_base(base) {
+	for_each_possible_cpuid_hypervisor_base(base) {
 		cpuid(base, &eax, &signature[0], &signature[1], &signature[2]);
 
 		/*
diff --git a/arch/x86/include/asm/xen/hypervisor.h b/arch/x86/include/asm/xen/hypervisor.h
index bd0fc69a10a7..09b15a0e2d2e 100644
--- a/arch/x86/include/asm/xen/hypervisor.h
+++ b/arch/x86/include/asm/xen/hypervisor.h
@@ -43,7 +43,7 @@ extern struct start_info *xen_start_info;
 
 static inline uint32_t xen_cpuid_base(void)
 {
-	return hypervisor_cpuid_base(XEN_SIGNATURE, 2);
+	return cpuid_hypervisor_base(XEN_SIGNATURE, 2);
 }
 
 struct pci_dev;
diff --git a/arch/x86/kernel/jailhouse.c b/arch/x86/kernel/jailhouse.c
index cd8ed1edbf9e..07da72de80ba 100644
--- a/arch/x86/kernel/jailhouse.c
+++ b/arch/x86/kernel/jailhouse.c
@@ -49,7 +49,7 @@ static uint32_t jailhouse_cpuid_base(void)
 	    !boot_cpu_has(X86_FEATURE_HYPERVISOR))
 		return 0;
 
-	return hypervisor_cpuid_base("Jailhouse\0\0\0", 0);
+	return cpuid_hypervisor_base("Jailhouse\0\0\0", 0);
 }
 
 static uint32_t __init jailhouse_detect(void)
diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
index 3be9b3342c67..35d3d2803c57 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -874,7 +874,7 @@ static noinline uint32_t __kvm_cpuid_base(void)
 		return 0;	/* So we don't blow up on old processors */
 
 	if (boot_cpu_has(X86_FEATURE_HYPERVISOR))
-		return hypervisor_cpuid_base(KVM_SIGNATURE, 0);
+		return cpuid_hypervisor_base(KVM_SIGNATURE, 0);
 
 	return 0;
 }
diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
index 7f43d8d24fbe..d153719302a2 100644
--- a/arch/x86/kvm/cpuid.c
+++ b/arch/x86/kvm/cpuid.c
@@ -236,7 +236,7 @@ static struct kvm_hypervisor_cpuid kvm_get_hypervisor_cpuid(struct kvm_vcpu *vcp
 	struct kvm_cpuid_entry2 *entry;
 	u32 base;
 
-	for_each_possible_hypervisor_cpuid_base(base) {
+	for_each_possible_cpuid_hypervisor_base(base) {
 		entry = kvm_find_cpuid_entry(vcpu, base);
 
 		if (entry) {
-- 
2.49.0

