Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7854281528
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 19:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749151512; cv=none; b=AEWp5mdJ6cetBhO+bpWCOFDXhVMN+ZcDNfNuVTM9FsS2x7+Yu/d4nDctfk3fPzBt+NQl8iPNTPOyDLQbIRKa4/gOzO6k04Y+ct3kHz2LfG8EFZ1zIcE1iagEqh47QRKzCuF7REBdKjMw3JUx6klmkLY3RYpl11ucHkkZyqyeoas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749151512; c=relaxed/simple;
	bh=ZRkIeO0BTcv/lumFRsJ4Atyy4DdC7OCXYFbW9VI5Lig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=InGuVDpynanD7vvD3aU+eHAdEGwIyUkRFeaWZl9woPjydDQPqx1kLEw04yl9EDZjYd9DVcNpA0NBVyL/3zXXvjpmXwTGM3P1D+l6j07EkqtpKXhpBbT8N73rY7k9rGh1R1Gzao9JpH83oR8fPd4eE94CQ5RmwG0pOKXVjCgnykA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=x4lB+k8y; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DJwz5OML; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="x4lB+k8y";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DJwz5OML"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749151509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0d6+AjEeMoKQFGCB/Vkk9/QFVZvuEWvHCBVLkE734to=;
	b=x4lB+k8yUU/bgKlC4tus+6yO83Qnq5okIqLuqLIACJq+/jGfMVZfyRu3ezZftrPbkp0nkZ
	R+R9iD5zx3ONQHQn/nbrV2NkIS3tSe6zOSIAFFVhQMiymQib90Q+1a1K9Q9EjnOEyxud+e
	MXk+HZBl9b3L2PnFlUc8fGLW5JZhwRK1aPEWJNK4u5W/E3K8iLq0CNi4vsn3UgQEcyNvAs
	EXWbpzvtIz9xQKJcbE4k1oltSMBxfxLTEniDXKX4OILSDY/YV3JsyzCV+nw3vT4w4DC4l+
	hb3Z0jYYzV/R+dAJNvTsPfG4yyt8qVCj01IBbmi/m76oD9/OFWsHrhfQGI/mcQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749151509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0d6+AjEeMoKQFGCB/Vkk9/QFVZvuEWvHCBVLkE734to=;
	b=DJwz5OMLVvi0a+aWuDkFk/3B6kq7bUa7Zm8Ob6tJ8yiRFtB6KzVdXENW+/noCcVUxP8Nob
	rq1ZJ9VpTAHQksDg==
To: Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Sean Christopherson <seanjc@google.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	John Ogness <john.ogness@linutronix.de>,
	x86@kernel.org,
	x86-cpuid@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: [PATCH v2 19/27] x86/cacheinfo: Pass a 'struct cpuinfo_x86' refrence to CPUID(0x4) code
Date: Thu,  5 Jun 2025 21:23:48 +0200
Message-ID: <20250605192356.82250-20-darwi@linutronix.de>
In-Reply-To: <20250605192356.82250-1-darwi@linutronix.de>
References: <20250605192356.82250-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prepare the CPUID(0x4) cache topology code for using parsed CPUID APIs
instead of invoking direct CPUID queries.

Since such an API requires a 'struct cpuinfo_x86' reference, trickle it
from the <linux/cacheinfo.h>'s populate_cache_leaves() x86 implementation
down to fill_cpuid4_info() and its Intel-specific CPUID(0x4) code.

No functional change intended.

Suggested-by: Ingo Molnar <mingo@kernel.org>
Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
Link: https://lore.kernel.org/lkml/aBnEBbDATdE2LTGU@gmail.com
---
 arch/x86/kernel/cpu/cacheinfo.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/cpu/cacheinfo.c b/arch/x86/kernel/cpu/cacheinfo.c
index f837ccdec116..0ed5dd6d29ef 100644
--- a/arch/x86/kernel/cpu/cacheinfo.c
+++ b/arch/x86/kernel/cpu/cacheinfo.c
@@ -252,7 +252,7 @@ static int amd_fill_cpuid4_info(int index, struct _cpuid4_info *id4)
 	return cpuid4_info_fill_done(id4, eax, ebx, ecx);
 }
 
-static int intel_fill_cpuid4_info(int index, struct _cpuid4_info *id4)
+static int intel_fill_cpuid4_info(struct cpuinfo_x86 *unused, int index, struct _cpuid4_info *id4)
 {
 	union _cpuid4_leaf_eax eax;
 	union _cpuid4_leaf_ebx ebx;
@@ -264,13 +264,13 @@ static int intel_fill_cpuid4_info(int index, struct _cpuid4_info *id4)
 	return cpuid4_info_fill_done(id4, eax, ebx, ecx);
 }
 
-static int fill_cpuid4_info(int index, struct _cpuid4_info *id4)
+static int fill_cpuid4_info(struct cpuinfo_x86 *c, int index, struct _cpuid4_info *id4)
 {
 	u8 cpu_vendor = boot_cpu_data.x86_vendor;
 
 	return (cpu_vendor == X86_VENDOR_AMD || cpu_vendor == X86_VENDOR_HYGON) ?
 		amd_fill_cpuid4_info(index, id4) :
-		intel_fill_cpuid4_info(index, id4);
+		intel_fill_cpuid4_info(c, index, id4);
 }
 
 static int find_num_cache_leaves(struct cpuinfo_x86 *c)
@@ -434,7 +434,7 @@ static bool intel_cacheinfo_0x4(struct cpuinfo_x86 *c)
 		struct _cpuid4_info id4 = {};
 		int ret;
 
-		ret = intel_fill_cpuid4_info(i, &id4);
+		ret = intel_fill_cpuid4_info(c, i, &id4);
 		if (ret < 0)
 			continue;
 
@@ -618,13 +618,14 @@ int populate_cache_leaves(unsigned int cpu)
 {
 	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
 	struct cacheinfo *ci = this_cpu_ci->info_list;
+	struct cpuinfo_x86 *c = &cpu_data(cpu);
 	u8 cpu_vendor = boot_cpu_data.x86_vendor;
 	struct amd_northbridge *nb = NULL;
 	struct _cpuid4_info id4 = {};
 	int idx, ret;
 
 	for (idx = 0; idx < this_cpu_ci->num_leaves; idx++) {
-		ret = fill_cpuid4_info(idx, &id4);
+		ret = fill_cpuid4_info(c, idx, &id4);
 		if (ret)
 			return ret;
 
-- 
2.49.0

