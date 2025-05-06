Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D25283FC7
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 05:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746507963; cv=none; b=PRYLRhF+5maGejwLfIuoe2JDRoIeJ3Rg8KrRtpvC5qs2GrsxnTWcdYCTDyhaEOr2Msx8X8liVMxell7ajXdtTBBgcd93wPIrGjGXw5yUwHrj1XB3n6ONvTa/H1e93rgb59HlRWUJZvy+/aqJRS2MArWc/RULu4kCXg+lv0U4L3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746507963; c=relaxed/simple;
	bh=3wSqw+Qp0y3iWcWDj+HvazLrMtu8vfz62+VnyFCPaJU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B2JZoop0XWl824dGpiyLw7GqjOJebmLOW8NhN3t9cOtGDUCC1eu4uj7iSKjBH8fUgH7oyxmFpVNI2gc14K/HrRmg2CsX/lvkI1YvKrsCI1wDDF2WfRaI5s8FQuXBerynuasB54UmygKop9NKRTWts7Ddt/L68yOkbU94ebO+Ug4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=uYZtWdbn; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Hm1BhZPu; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="uYZtWdbn";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Hm1BhZPu"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746507960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KgbvbyREq9s0QTdtaijh+aBEhlm9K3a1aGsRijPe+LE=;
	b=uYZtWdbnFh1V0opJ+9MdNYyAYcoLRzLQdQvONxOxz5SzO+uC61x7aiGuYEbBm5/ivc+WIP
	kwS8YyLcAflRjukR6cNqCh+Hdtl9jgkbwHK0t78DILpS8UR7ZzXgCkUOMjcoIK8/YZnceu
	7aLDQdRCyhfr95ogEy9Yw0MMnkIq1XYkKmxA+xRsBvV60ZDbDo/5oUfYyCtAKq54zAlf6b
	+MFo88m5yniHjRb7igrbK/V1Sro28gT8X1XZdkgsiwI5X/4GzH3crWTKETrSBqu3E9laRP
	WtwhZk+GreXAEv3zQoH9Qp8Qn3bcGanXlxR7J54grSgO7F9AL4AUz5yJ86OslA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746507960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KgbvbyREq9s0QTdtaijh+aBEhlm9K3a1aGsRijPe+LE=;
	b=Hm1BhZPuVRoDvJqvghoRTS4rsNp8xnrhfvMBWMxPMRP/ZnaGods1d0LnSEGBovTUGUzE82
	BeakiWX9WudcN1AA==
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
Subject: [PATCH v1 25/26] x86/cpu: Rescan CPUID table after PSN disable
Date: Tue,  6 May 2025 07:04:36 +0200
Message-ID: <20250506050437.10264-26-darwi@linutronix.de>
In-Reply-To: <20250506050437.10264-1-darwi@linutronix.de>
References: <20250506050437.10264-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Pentium-III and Transmeta CPUs, disabling the CPUID(0x3) Processor
Serial Number (PSN) can affect the maximum valid CPUID standard leaf.

Rescan the CPU's CPUID table in that case, not to have stale cached data.
Use scanned CPUID(0x0) access, instead of a direct CPUID query,
afterwards.

Rename squash_the_stupid_serial_number() to disable_cpu_serial_number()
and explain the rational for disabling the CPU's PSN.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/common.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index a08340a5e6a5..f73f8b600286 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -326,15 +326,17 @@ bool have_cpuid_p(void)
 	return flag_is_changeable_p(X86_EFLAGS_ID);
 }
 
-static void squash_the_stupid_serial_number(struct cpuinfo_x86 *c)
+/*
+ * For privacy concerns, disable legacy Intel and Transmeta CPUID(0x3)
+ * feature, Processor Serial Number, by default.
+ */
+static void disable_cpu_serial_number(struct cpuinfo_x86 *c)
 {
 	unsigned long lo, hi;
 
 	if (!cpu_has(c, X86_FEATURE_PN) || !disable_x86_serial_nr)
 		return;
 
-	/* Disable processor serial number: */
-
 	rdmsr(MSR_IA32_BBL_CR_CTL, lo, hi);
 	lo |= 0x200000;
 	wrmsr(MSR_IA32_BBL_CR_CTL, lo, hi);
@@ -342,8 +344,12 @@ static void squash_the_stupid_serial_number(struct cpuinfo_x86 *c)
 	pr_notice("CPU serial number disabled.\n");
 	clear_cpu_cap(c, X86_FEATURE_PN);
 
-	/* Disabling the serial number may affect the cpuid level */
-	c->cpuid_level = cpuid_eax(0);
+	/*
+	 * Disabling CPUID(0x3) might affect the maximum standard CPUID
+	 * level.  Rescan the CPU's CPUID table afterwards.
+	 */
+	cpuid_rescan_cpu(c);
+	c->cpuid_level = cpudata_cpuid(c, 0x0)->max_std_leaf;
 }
 
 static int __init x86_serial_nr_setup(char *s)
@@ -353,7 +359,7 @@ static int __init x86_serial_nr_setup(char *s)
 }
 __setup("serialnumber", x86_serial_nr_setup);
 #else
-static inline void squash_the_stupid_serial_number(struct cpuinfo_x86 *c)
+static inline void disable_cpu_serial_number(struct cpuinfo_x86 *c)
 {
 }
 #endif
@@ -1883,7 +1889,7 @@ static void identify_cpu(struct cpuinfo_x86 *c)
 	bus_lock_init();
 
 	/* Disable the PN if appropriate */
-	squash_the_stupid_serial_number(c);
+	disable_cpu_serial_number(c);
 
 	/* Set up SMEP/SMAP/UMIP */
 	setup_smep(c);
-- 
2.49.0

