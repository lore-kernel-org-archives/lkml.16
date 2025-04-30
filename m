Received: from 9.mo550.mail-out.ovh.net (9.mo550.mail-out.ovh.net [178.32.108.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235291BF37
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 22:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.32.108.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746053433; cv=none; b=Gmiu+G5wkYKIT9o1/2Ud2TkoveUgPJjIdoUfpT0QsgW/in043Ojzo9er+zXaTl2v9YXk3UxS/ArPMv3JbIzvkHxXLuwcJDOhU2re0kT9a7+g9wKLQHg+uNiiipVjm6qvuMeFGIIAoZiWtBv4lXtNzfNOt9ktcriPa52toiGWVVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746053433; c=relaxed/simple;
	bh=kPomQ7PXgpw7knpV3SVfubuKhsQUI05+skk6zT7Eq1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KqHHuSqzPpwfFGcoCtCko4DOGL9KBs8PmSuvvV/M7nkmnZkJZdI4y5yJHs2j1P/xg68VcVsnBoQxXv0dqPz2Onzh8PzFCBPlZseZdGkG5u1PP6BqOFfqAMoXKqSq7IrIYlezxuIN4Pp3aK6NyRjc5svfse6wKxSF3VHtHXrsxhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com; spf=pass smtp.mailfrom=3mdeb.com; dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b=NGixRtCX; arc=none smtp.client-ip=178.32.108.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b="NGixRtCX"
Received: from director4.ghost.mail-out.ovh.net (unknown [10.109.176.170])
	by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4ZnshT6jk9z1Xnx
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 22:45:13 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-twnx5 (unknown [10.110.164.49])
	by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 9A8971FD29;
	Wed, 30 Apr 2025 22:45:13 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.114])
	by ghost-submission-5b5ff79f4f-twnx5 with ESMTPSA
	id SuivGfmnEmgRWAgA1PhhsQ
	(envelope-from <sergii.dmytruk@3mdeb.com>); Wed, 30 Apr 2025 22:45:13 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-114S00894c63abd-27f7-477a-bf0c-fa55fba5a45f,
                    7FFE21389DDF989CCD6FB7268846A7FDE11993D7) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.178
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: linux-kernel@vger.kernel.org
Cc: trenchboot-devel@googlegroups.com
Subject: [RFC PATCH v2 4/9] x86: Split up Secure Launch setup and finalize functions
Date: Thu,  1 May 2025 01:44:46 +0300
Message-ID: <bd2d21fb90cbb4905afcb5d934c48e4ff23a3ed8.1746037489.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746037489.git.sergii.dmytruk@3mdeb.com>
References: <cover.1746037489.git.sergii.dmytruk@3mdeb.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12103705474822026396
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieejleegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhephfehfeehudeileeikeffgfffgfefuddtveelvedvhfffgfelvdfgtddutdehfeeinecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukedurddujeekpdefjedrheelrddugedvrdduudegnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheehtdgmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=5VFk4FOVNsAWcUO093+INFp3zTO4CmYlsU9Pb5Y3iAY=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1746053114; v=1;
 b=NGixRtCXiVNRihEJULF8W1ZW/fYzDX8yDyGmrA6teCk3Ay5vijC/ujJIEvuiIt77Jvbovyg5
 1emvo6H6OUx/EGrumVzKuPIPcKZTXbZF64GGzgswl72MQQ0mDrGCR9ij7vYC91kMCaXiR5r2MOw
 n/XdkN2Jt67S4UvPhfwyJ3XxJpw3NTLNy2dqsO1RWmTUeWZ///FTqQ8l+xuqU/udfT1oD4aThYV
 mpsdLtXMW4HPWLiNOriK53mnZvcJt/mEP5aeicp950Rx2d0Z8JOKvouY7B0SfKkyMwx1BWKmNQy
 zp7kImWAnNhPFybpQ4UIa7rl5+yRadOv952gxYnC6pVUQ==

From: Ross Philipson <ross.philipson@oracle.com>

Split up the setup and findalize functions internally to determine
the type of launch and call the appropriate function (TXT or SKINIT
version).

Signed-off-by: Ross Philipson <ross.philipson@oracle.com>
Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---
 arch/x86/include/asm/svm.h |  2 ++
 arch/x86/kernel/setup.c    |  2 +-
 arch/x86/kernel/slaunch.c  | 69 +++++++++++++++++++++++++++++++-------
 include/linux/slaunch.h    |  4 +--
 4 files changed, 62 insertions(+), 15 deletions(-)

diff --git a/arch/x86/include/asm/svm.h b/arch/x86/include/asm/svm.h
index 9b7fa99ae951..da9536c5a137 100644
--- a/arch/x86/include/asm/svm.h
+++ b/arch/x86/include/asm/svm.h
@@ -584,6 +584,8 @@ static inline void __unused_size_checks(void)
 
 #define SVM_CPUID_FUNC 0x8000000a
 
+#define SVM_VM_CR_INIT_REDIRECTION 1
+
 #define SVM_SELECTOR_S_SHIFT 4
 #define SVM_SELECTOR_DPL_SHIFT 5
 #define SVM_SELECTOR_P_SHIFT 7
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index afb1b238202f..3bcf5a5fbac7 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -999,7 +999,7 @@ void __init setup_arch(char **cmdline_p)
 	early_gart_iommu_check();
 #endif
 
-	slaunch_setup_txt();
+	slaunch_setup();
 
 	/*
 	 * partially used pages are not usable - thus
diff --git a/arch/x86/kernel/slaunch.c b/arch/x86/kernel/slaunch.c
index b6ba4c526aa3..d81433a9b699 100644
--- a/arch/x86/kernel/slaunch.c
+++ b/arch/x86/kernel/slaunch.c
@@ -18,6 +18,7 @@
 #include <asm/tlbflush.h>
 #include <asm/e820/api.h>
 #include <asm/setup.h>
+#include <asm/svm.h>
 #include <asm/realmode.h>
 #include <linux/slr_table.h>
 #include <linux/slaunch.h>
@@ -437,21 +438,11 @@ void __init slaunch_fixup_jump_vector(void)
  * Intel TXT specific late stub setup and validation called from within
  * x86 specific setup_arch().
  */
-void __init slaunch_setup_txt(void)
+static void __init slaunch_setup_txt(void)
 {
 	u64 one = TXT_REGVALUE_ONE, val;
 	void __iomem *txt;
 
-	if (!boot_cpu_has(X86_FEATURE_SMX))
-		return;
-
-	/*
-	 * If booted through secure launch entry point, the loadflags
-	 * option will be set.
-	 */
-	if (!(boot_params.hdr.loadflags & SLAUNCH_FLAG))
-		return;
-
 	/*
 	 * See if SENTER was done by reading the status register in the
 	 * public space. If the public register space cannot be read, TXT may
@@ -523,6 +514,42 @@ void __init slaunch_setup_txt(void)
 	pr_info("Intel TXT setup complete\n");
 }
 
+/*
+ * AMD SKINIT specific late stub setup and validation called from within
+ * x86 specific setup_arch().
+ */
+static void __init slaunch_setup_skinit(void)
+{
+	u64 val;
+
+	/*
+	 * If the platform is performing a Secure Launch via SKINIT
+	 * INIT_REDIRECTION flag will be active.
+	 */
+	rdmsrl(MSR_VM_CR, val);
+	if (!(val & (1 << SVM_VM_CR_INIT_REDIRECTION)))
+		return;
+
+	/* Set flags on BSP so subsequent code knows it was a SKINIT launch */
+	sl_flags |= (SL_FLAG_ACTIVE|SL_FLAG_ARCH_SKINIT);
+	pr_info("AMD SKINIT setup complete\n");
+}
+
+void __init slaunch_setup(void)
+{
+	/*
+	 * If booted through secure launch entry point, the loadflags
+	 * option will be set.
+	 */
+	if (!(boot_params.hdr.loadflags & SLAUNCH_FLAG))
+		return;
+
+	if (boot_cpu_has(X86_FEATURE_SMX))
+		slaunch_setup_txt();
+	else if (boot_cpu_has(X86_FEATURE_SKINIT))
+		slaunch_setup_skinit();
+}
+
 static inline void smx_getsec_sexit(void)
 {
 	asm volatile ("getsec\n"
@@ -533,7 +560,7 @@ static inline void smx_getsec_sexit(void)
  * Used during kexec and on reboot paths to finalize the TXT state
  * and do an SEXIT exiting the DRTM and disabling SMX mode.
  */
-void slaunch_finalize(int do_sexit)
+static void slaunch_finalize_txt(int do_sexit)
 {
 	u64 one = TXT_REGVALUE_ONE, val;
 	void __iomem *config;
@@ -594,3 +621,21 @@ void slaunch_finalize(int do_sexit)
 
 	pr_info("TXT SEXIT complete.\n");
 }
+
+/*
+ * Used during kexec and on reboot paths to finalize the SKINIT.
+ */
+static void slaunch_finalize_skinit(void)
+{
+	/* AMD CPUs with PSP-supported DRTM */
+	if (!slaunch_is_skinit_psp())
+		return;
+}
+
+void slaunch_finalize(int do_sexit)
+{
+	if (boot_cpu_has(X86_FEATURE_SMX))
+		slaunch_finalize_txt(do_sexit);
+	else if (boot_cpu_has(X86_FEATURE_SKINIT))
+		slaunch_finalize_skinit();
+}
diff --git a/include/linux/slaunch.h b/include/linux/slaunch.h
index ec7e0d736a03..22e253960fdd 100644
--- a/include/linux/slaunch.h
+++ b/include/linux/slaunch.h
@@ -547,7 +547,7 @@ static inline int tpm2_log_event(struct txt_heap_event_log_pointer2_1_element *e
 /*
  * External functions available in mainline kernel.
  */
-void slaunch_setup_txt(void);
+void slaunch_setup(void);
 void slaunch_fixup_jump_vector(void);
 u32 slaunch_get_flags(void);
 struct sl_ap_wake_info *slaunch_get_ap_wake_info(void);
@@ -563,7 +563,7 @@ void slaunch_psp_finalize(void);
 
 #else
 
-static inline void slaunch_setup_txt(void)
+static inline void slaunch_setup(void)
 {
 }
 
-- 
2.49.0

