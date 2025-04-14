Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331CFEC4
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 15:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744643396; cv=none; b=b80eEbWXCDgVVr55dKpLUNUxhi1ZFBSP/+/G02XMc1pWI7GjA2+Vr4qpefC1g57EuKHWsmajSQxR7JvsRnMlJFMwYLD1rF/UrXLV0Sp9m3C8jb7MVkogBScGqIFtbmUn0oF/3mMGLujsZwk5Jb8hpXCRe0TXNqef3f9OkGGBbjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744643396; c=relaxed/simple;
	bh=7Hi6DqkEM9fIB3dfF/pbu20fNXGcLxy+2NwCVtPc+jk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Am03kQQHJn6ijn9xDsyOkgPgZBLG/iYfXT6BKhHKPa1oA/m9u3YttQto0A2Z7WFUz+tDV9TVmdM9eJ/lUdmwv5V52xujGrbv61vWJg19CMRnumPi9Kam4rKIowjJvGYYbK0TqyIJaQZobpl1Y2qzh6xmF9GNnZX7JfHxx0DdT+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bgjNcwxS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bgjNcwxS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7512C4CEEB;
	Mon, 14 Apr 2025 15:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744643395;
	bh=7Hi6DqkEM9fIB3dfF/pbu20fNXGcLxy+2NwCVtPc+jk=;
	h=From:To:Cc:Subject:Date:From;
	b=bgjNcwxSJFfU84m9mCpCgqp1v49/ptx8IOaCmYPzXeqcJmAxDE+Kbc2oTlUBNb0u0
	 hsctD1HmQCeGIBJumPKZPeDvcMTE1zvgk9ubQmQaU9Cy6dc2RLe/6OYpN1q9o+CRPk
	 HWZhpoOl44MfQpWp2OMvaBO4qcdNmu5Bbe85IgjQ39MK2iIjdN/t+QG//Mejxnbsek
	 qaiF6klUzm13W0ymGaY7l5wQgOZ+3KUOnTzRYJtMjQbojFMqhOkwYM9QGRnE0MK8js
	 iNlL+UgB02SpB2Txs3c3b+wKNAOcwGaQ94WZn6fdi4Qe0eOVa11kYcxEXwGG1uWF8h
	 zarlOxzYAk44g==
From: Borislav Petkov <bp@kernel.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	David Kaplan <david.kaplan@amd.com>,
	X86 ML <x86@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	"Borislav Petkov (AMD)" <bp@alien8.de>
Subject: [PATCH] x86/bugs: Remove X86_BUG_MMIO_UNKNOWN
Date: Mon, 14 Apr 2025 17:09:51 +0200
Message-ID: <20250414150951.5345-1-bp@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Borislav Petkov (AMD)" <bp@alien8.de>

Whack this thing because:

- the "unknown" handling is done only for this vuln and not for the
  others

- it doesn't do anything besides reporting things differently. It
  doesn't apply any mitigations - it is simply causing unnecessary
  complications to the code which don't bring anything besides
  maintenance overhead to what is already a very nasty spaghetti pile

- all the currently unaffected CPUs can also be in "unknown" status so
  there's no need for special handling here

so get rid of it.

Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
---
 arch/x86/include/asm/cpufeatures.h       |  2 +-
 arch/x86/kernel/cpu/bugs.c               | 12 +-----------
 arch/x86/kernel/cpu/common.c             |  5 -----
 tools/arch/x86/include/asm/cpufeatures.h |  2 +-
 4 files changed, 3 insertions(+), 18 deletions(-)

diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
index 6c2c152d8a67..e8f8d43a3825 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -519,7 +519,7 @@
 #define X86_BUG_ITLB_MULTIHIT		X86_BUG(23) /* "itlb_multihit" CPU may incur MCE during certain page attribute changes */
 #define X86_BUG_SRBDS			X86_BUG(24) /* "srbds" CPU may leak RNG bits if not mitigated */
 #define X86_BUG_MMIO_STALE_DATA		X86_BUG(25) /* "mmio_stale_data" CPU is affected by Processor MMIO Stale Data vulnerabilities */
-#define X86_BUG_MMIO_UNKNOWN		X86_BUG(26) /* "mmio_unknown" CPU is too old and its MMIO Stale Data status is unknown */
+/* unused, was #define X86_BUG_MMIO_UNKNOWN		X86_BUG(26) "mmio_unknown" CPU is too old and its MMIO Stale Data status is unknown */
 #define X86_BUG_RETBLEED		X86_BUG(27) /* "retbleed" CPU is affected by RETBleed */
 #define X86_BUG_EIBRS_PBRSB		X86_BUG(28) /* "eibrs_pbrsb" EIBRS is vulnerable to Post Barrier RSB Predictions */
 #define X86_BUG_SMT_RSB			X86_BUG(29) /* "smt_rsb" CPU is vulnerable to Cross-Thread Return Address Predictions */
diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 4f6bda8b5361..0e120da17414 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -427,7 +427,6 @@ static const char * const mmio_strings[] = {
 static void __init mmio_select_mitigation(void)
 {
 	if (!boot_cpu_has_bug(X86_BUG_MMIO_STALE_DATA) ||
-	     boot_cpu_has_bug(X86_BUG_MMIO_UNKNOWN) ||
 	     cpu_mitigations_off()) {
 		mmio_mitigation = MMIO_MITIGATION_OFF;
 		return;
@@ -590,8 +589,6 @@ static void __init md_clear_update_mitigation(void)
 		pr_info("TAA: %s\n", taa_strings[taa_mitigation]);
 	if (boot_cpu_has_bug(X86_BUG_MMIO_STALE_DATA))
 		pr_info("MMIO Stale Data: %s\n", mmio_strings[mmio_mitigation]);
-	else if (boot_cpu_has_bug(X86_BUG_MMIO_UNKNOWN))
-		pr_info("MMIO Stale Data: Unknown: No mitigations\n");
 	if (boot_cpu_has_bug(X86_BUG_RFDS))
 		pr_info("Register File Data Sampling: %s\n", rfds_strings[rfds_mitigation]);
 }
@@ -2780,9 +2777,6 @@ static ssize_t tsx_async_abort_show_state(char *buf)
 
 static ssize_t mmio_stale_data_show_state(char *buf)
 {
-	if (boot_cpu_has_bug(X86_BUG_MMIO_UNKNOWN))
-		return sysfs_emit(buf, "Unknown: No mitigations\n");
-
 	if (mmio_mitigation == MMIO_MITIGATION_OFF)
 		return sysfs_emit(buf, "%s\n", mmio_strings[mmio_mitigation]);
 
@@ -2967,7 +2961,6 @@ static ssize_t cpu_show_common(struct device *dev, struct device_attribute *attr
 		return srbds_show_state(buf);
 
 	case X86_BUG_MMIO_STALE_DATA:
-	case X86_BUG_MMIO_UNKNOWN:
 		return mmio_stale_data_show_state(buf);
 
 	case X86_BUG_RETBLEED:
@@ -3036,10 +3029,7 @@ ssize_t cpu_show_srbds(struct device *dev, struct device_attribute *attr, char *
 
 ssize_t cpu_show_mmio_stale_data(struct device *dev, struct device_attribute *attr, char *buf)
 {
-	if (boot_cpu_has_bug(X86_BUG_MMIO_UNKNOWN))
-		return cpu_show_common(dev, attr, buf, X86_BUG_MMIO_UNKNOWN);
-	else
-		return cpu_show_common(dev, attr, buf, X86_BUG_MMIO_STALE_DATA);
+	return cpu_show_common(dev, attr, buf, X86_BUG_MMIO_STALE_DATA);
 }
 
 ssize_t cpu_show_retbleed(struct device *dev, struct device_attribute *attr, char *buf)
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 079ded4eeb86..d7fe0fdb2cfa 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1402,15 +1402,10 @@ static void __init cpu_set_bug_bits(struct cpuinfo_x86 *c)
 	 * Affected CPU list is generally enough to enumerate the vulnerability,
 	 * but for virtualization case check for ARCH_CAP MSR bits also, VMM may
 	 * not want the guest to enumerate the bug.
-	 *
-	 * Set X86_BUG_MMIO_UNKNOWN for CPUs that are neither in the blacklist,
-	 * nor in the whitelist and also don't enumerate MSR ARCH_CAP MMIO bits.
 	 */
 	if (!arch_cap_mmio_immune(x86_arch_cap_msr)) {
 		if (cpu_matches(cpu_vuln_blacklist, MMIO))
 			setup_force_cpu_bug(X86_BUG_MMIO_STALE_DATA);
-		else if (!cpu_matches(cpu_vuln_whitelist, NO_MMIO))
-			setup_force_cpu_bug(X86_BUG_MMIO_UNKNOWN);
 	}
 
 	if (!cpu_has(c, X86_FEATURE_BTC_NO)) {
diff --git a/tools/arch/x86/include/asm/cpufeatures.h b/tools/arch/x86/include/asm/cpufeatures.h
index 9e3fa7942e7d..e88500d90309 100644
--- a/tools/arch/x86/include/asm/cpufeatures.h
+++ b/tools/arch/x86/include/asm/cpufeatures.h
@@ -508,7 +508,7 @@
 #define X86_BUG_ITLB_MULTIHIT		X86_BUG(23) /* "itlb_multihit" CPU may incur MCE during certain page attribute changes */
 #define X86_BUG_SRBDS			X86_BUG(24) /* "srbds" CPU may leak RNG bits if not mitigated */
 #define X86_BUG_MMIO_STALE_DATA		X86_BUG(25) /* "mmio_stale_data" CPU is affected by Processor MMIO Stale Data vulnerabilities */
-#define X86_BUG_MMIO_UNKNOWN		X86_BUG(26) /* "mmio_unknown" CPU is too old and its MMIO Stale Data status is unknown */
+/* unused, was #define X86_BUG_MMIO_UNKNOWN		X86_BUG(26) * "mmio_unknown" CPU is too old and its MMIO Stale Data status is unknown */
 #define X86_BUG_RETBLEED		X86_BUG(27) /* "retbleed" CPU is affected by RETBleed */
 #define X86_BUG_EIBRS_PBRSB		X86_BUG(28) /* "eibrs_pbrsb" EIBRS is vulnerable to Post Barrier RSB Predictions */
 #define X86_BUG_SMT_RSB			X86_BUG(29) /* "smt_rsb" CPU is vulnerable to Cross-Thread Return Address Predictions */
-- 
2.43.0

