Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CC02EB5BB
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 23:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749771736; cv=none; b=luvvnPvzCRko9rITNQlU5Pve4JfwpkKfpnWvR9xB1t8TRZ6K45Va7SVfElt7Yg8hON+8q6J4LOVFn4Q33rZBYItv7ybf0kVpX4E3AQgABp1J6xZJ4p8KFnt2SCXlUGEVOLPdj1PVR+gPoDOcZurRptjaP70kFTkYLLbRha9DS/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749771736; c=relaxed/simple;
	bh=ZRkIeO0BTcv/lumFRsJ4Atyy4DdC7OCXYFbW9VI5Lig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CKqVAA9mIOIl7rMBGaWiaE3oWT8rHyc2faFmpNLmeOr2GCYREK1F4nHBAj2lacYp3MfHfaOIPZPZaC6pvGo8SL9b1QLQ4Rk5XngN6l9vbEh2GJirl0k478eQ/ELe9Pj9HFEWOqW8OGlmnuMEoIQD/hmlvRXwG9pO8mgZ38ooTkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KiQwRa5p; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DuEQIMIg; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KiQwRa5p";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DuEQIMIg"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749771733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0d6+AjEeMoKQFGCB/Vkk9/QFVZvuEWvHCBVLkE734to=;
	b=KiQwRa5p63Y3G9U+VRMTisFWQQRk78Au6sFGLaYf1Sqml5c2PfG0EGupkvwlpw9oMPgc91
	aXH2yX1gRGpOM6dhZ0O+oWaAaB8LqK/P+bEJ9cGp249Dr4Eq1jMZmMYdrXGT52wH7jKtXc
	lyt4UR0SpJstNElK35CIt4jzZkNiqB14E4Dop3XRDSO87B12DgG1Q00+9ug72idtNqsrCD
	8zCl6Xht2oVOqaPUmT4KqNsaWqXPo4+LplClqYu2ppSVTRSh6tfQBl0oaYC7OOSZwPfG/W
	v0v8sS9zSX6vmFrysBg5wNPKu209fi0OuLxEO8h3EhNyDoSqvHpBfzUmigRpYg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749771733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0d6+AjEeMoKQFGCB/Vkk9/QFVZvuEWvHCBVLkE734to=;
	b=DuEQIMIgJChsyGP90pMD53URrrAja1/3HeWmx0P7fEBlxTmTSi8CEOkL7Ti29oP7vsgy8x
	QHP9TZlKqTWvBZCA==
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
Subject: [PATCH v3 34/44] x86/cacheinfo: Pass a 'struct cpuinfo_x86' refrence to CPUID(0x4) code
Date: Fri, 13 Jun 2025 01:40:00 +0200
Message-ID: <20250612234010.572636-35-darwi@linutronix.de>
In-Reply-To: <20250612234010.572636-1-darwi@linutronix.de>
References: <20250612234010.572636-1-darwi@linutronix.de>
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

