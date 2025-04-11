Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F0527EC7D
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 07:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744355066; cv=none; b=uXq/QEmx/N49zXOi+AVZ5XwP/9157lMcWXL+FiI5KrS9aQITOsR8kyA7/WfzFazMMUaUz1lrAfeURKPG4dEh/I0VlN7xXrU8OqUBE4++4fQqy1ZHvijotZ0zrUbXLkpygGvPBQXl90zsWUvTk5Dy8yafuuwjy0OJJ3j0pLzpL9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744355066; c=relaxed/simple;
	bh=ySVeJdWJuakANiYyE9FVHFeBrWSom6GjCdzvIpzIyFY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ijl1D3fTWARft31H+X9GBu76g+ja7bD+K7J6EzkkOYspR6M594uTwgq3TLJ/uKV+97fMaVIt3S1DkHeyIvWq3WCgC8gCZ1Ki2CNaP+WGtTt2FDJQeAZWPpeV0JqRXL+dDgnnLDexlaN+AWtrwjaykALNffzuWLx/aTA6kc7X9ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=D3FXasTP; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VzsvHXQq; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="D3FXasTP";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VzsvHXQq"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744355063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U8HwGV/Y4xZF8mOuGq/oBUKRv04hGa2lTjJUvK/X5LY=;
	b=D3FXasTPRDPGP95J6XQybO0vga4DubsdMYYePoibVOwD4p+XFS+sMxXnNmk9A6/DyCNBjz
	jm54mSEADQa6qK6z9Qg3zvA2obZk961PQlc4d+o69a2aoFlEJuf1JJP/8HDcfUCcdioO2m
	AL/cOMxsUAv/ult44JXDZbMrKtv2F8ISgu415SaZ/IEWqXcDlQqM8trKQvhI2wyzy3yr2x
	Gn03TODVMuv6WgAodEH3l9cRIC8JpUe8MxQqhgiezKtTMmEnG1vA/oBvpRguq8M9TI17E9
	YIZb3FFGNMQt2/w//Ni8knvOyUbEfuvpAwBCDxNUgbL4jwRdTf1UkorJZ9Kt+A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744355063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U8HwGV/Y4xZF8mOuGq/oBUKRv04hGa2lTjJUvK/X5LY=;
	b=VzsvHXQqSFaxPOFKQygrTKBtartgYV2VH2thUEIxRc3rHpHsJfuD9EGANBCawZx3Gncnex
	I8e4uwN0kI/XjhAg==
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
Subject: [PATCH v1 2/2] x86/cacheinfo: Standardize header files and CPUID references
Date: Fri, 11 Apr 2025 09:04:01 +0200
Message-ID: <20250411070401.1358760-3-darwi@linutronix.de>
In-Reply-To: <20250411070401.1358760-1-darwi@linutronix.de>
References: <20250411070401.1358760-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reference header files using their canonical form <linux/cacheinfo.h>.

Standardize on CPUID(0xN), instead of CPUID(N), for all standard leaves.
This removes ambiguity and aligns them with their extended counterparts
like CPUID(0x8000001d).

References: 0dd09e215a39 ("x86/cacheinfo: Apply maintainer-tip coding style fixes")
Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/cacheinfo.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/x86/kernel/cpu/cacheinfo.c b/arch/x86/kernel/cpu/cacheinfo.c
index 52727f8c0006..cc7ae2bdcf4a 100644
--- a/arch/x86/kernel/cpu/cacheinfo.c
+++ b/arch/x86/kernel/cpu/cacheinfo.c
@@ -3,9 +3,9 @@
  * x86 CPU caches detection and configuration
  *
  * Previous changes
- * - Venkatesh Pallipadi:		Cache identification through CPUID(4)
+ * - Venkatesh Pallipadi:		Cache identification through CPUID(0x4)
  * - Ashok Raj <ashok.raj@intel.com>:	Work with CPU hotplug infrastructure
- * - Andi Kleen / Andreas Herrmann:	CPUID(4) emulation on AMD
+ * - Andi Kleen / Andreas Herrmann:	CPUID(0x4) emulation on AMD
  */
 
 #include <linux/cacheinfo.h>
@@ -78,7 +78,7 @@ struct _cpuid4_info {
 	unsigned long size;
 };
 
-/* Map CPUID(4) EAX.cache_type to linux/cacheinfo.h types */
+/* Map CPUID(0x4) EAX.cache_type to <linux/cacheinfo.h> types */
 static const enum cache_type cache_type_map[] = {
 	[CTYPE_NULL]	= CACHE_TYPE_NOCACHE,
 	[CTYPE_DATA]	= CACHE_TYPE_DATA,
@@ -87,7 +87,7 @@ static const enum cache_type cache_type_map[] = {
 };
 
 /*
- * Fallback AMD CPUID(4) emulation
+ * Fallback AMD CPUID(0x4) emulation
  * AMD CPUs with TOPOEXT can just use CPUID(0x8000001d)
  *
  * @AMD_L2_L3_INVALID_ASSOC: cache info for the respective L2/L3 cache should
@@ -361,7 +361,7 @@ static void intel_cacheinfo_done(struct cpuinfo_x86 *c, unsigned int l3,
 {
 	/*
 	 * If llc_id is still unset, then cpuid_level < 4, which implies
-	 * that the only possibility left is SMT.  Since CPUID(2) doesn't
+	 * that the only possibility left is SMT.  Since CPUID(0x2) doesn't
 	 * specify any shared caches and SMT shares all caches, we can
 	 * unconditionally set LLC ID to the package ID so that all
 	 * threads share it.
@@ -376,7 +376,7 @@ static void intel_cacheinfo_done(struct cpuinfo_x86 *c, unsigned int l3,
 }
 
 /*
- * Legacy Intel CPUID(2) path if CPUID(4) is not available.
+ * Legacy Intel CPUID(0x2) path if CPUID(0x4) is not available.
  */
 static void intel_cacheinfo_0x2(struct cpuinfo_x86 *c)
 {
@@ -466,7 +466,7 @@ static bool intel_cacheinfo_0x4(struct cpuinfo_x86 *c)
 
 void init_intel_cacheinfo(struct cpuinfo_x86 *c)
 {
-	/* Don't use CPUID(2) if CPUID(4) is supported. */
+	/* Don't use CPUID(0x2) if CPUID(0x4) is supported. */
 	if (intel_cacheinfo_0x4(c))
 		return;
 
@@ -474,7 +474,7 @@ void init_intel_cacheinfo(struct cpuinfo_x86 *c)
 }
 
 /*
- * linux/cacheinfo.h shared_cpu_map setup, AMD/Hygon
+ * <linux/cacheinfo.h> shared_cpu_map setup, AMD/Hygon
  */
 static int __cache_amd_cpumap_setup(unsigned int cpu, int index,
 				    const struct _cpuid4_info *id4)
@@ -533,7 +533,7 @@ static int __cache_amd_cpumap_setup(unsigned int cpu, int index,
 }
 
 /*
- * linux/cacheinfo.h shared_cpu_map setup, Intel + fallback AMD/Hygon
+ * <linux/cacheinfo.h> shared_cpu_map setup, Intel + fallback AMD/Hygon
  */
 static void __cache_cpumap_setup(unsigned int cpu, int index,
 				 const struct _cpuid4_info *id4)
@@ -599,7 +599,7 @@ int init_cache_level(unsigned int cpu)
 }
 
 /*
- * The max shared threads number comes from CPUID(4) EAX[25-14] with input
+ * The max shared threads number comes from CPUID(0x4) EAX[25-14] with input
  * ECX as cache index. Then right shift apicid by the number's order to get
  * cache id for this cache node.
  */
-- 
2.49.0

