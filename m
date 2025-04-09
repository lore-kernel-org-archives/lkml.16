Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1283E21B180
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 23:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744241243; cv=none; b=HTk1x/Js3iMNP+bUyOADvjZCx2WxYKeF0+ue+hZeBGQgIwiH07TTbNrwOEhMaXHeI5+ELlXYvqV4Y2T7iHzrHsNO6v1y96Avsj3FIEci/kY3qO7vpsskZNmofXhtekqZVs2UKpOILjuvwdUidj8ybEqvNk49dS4v4k2hERFC1Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744241243; c=relaxed/simple;
	bh=ARtDxjBTU5N+hI+5VShbIO8d7yVdjsigpe/y1uDlzRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PJJ70L+21DUE0mQFR1+DUXe/Z8lxhQVcFvDwUVjRuPAQH0vYXT+vFh97za9UYMH6EFWKYnXO9DYGO6kniBm0nV24uy9uXgDsCM/5kMCvllsaCjt+KDKbsZ6UPA40ZL0dOdJgxA0gn0jVWii4bIOco81EW9Wnefsf14RIwH68gzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=We/jgiPH; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="We/jgiPH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744241242; x=1775777242;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ARtDxjBTU5N+hI+5VShbIO8d7yVdjsigpe/y1uDlzRI=;
  b=We/jgiPHGRK+z5Fb7OWXHe8+xRPqzO1IOIwrApcIxNi6cx79Lo6KIytF
   K59Vg+GkZ0PmOXluA2ojLTXlIBtKddes8NjMFhMYQPWDWr4agUXVRzvK/
   daBobwiDhZifaAgusjGSzk5EAN1iestCbUoB64FIWQCqPdk1SOG8RZIW3
   ezn2iJQgJ1ZvlwDQ+XnbF47muEcbZA7tzbPhflLBX6S+w2m4z+sm1x6RH
   mj9noyUBhVbPArxBrrngk6VLh2i71edMZBOMhy8hIDSRYqGvDEsMqXJa4
   2jk5tlZjrFVL41rnKulHNQFuVd/pmx+GNi90EaaFTEt17dMzGxWSG6x8y
   Q==;
X-CSE-ConnectionGUID: rEBNA4mRRS+gYBe1a6U9uA==
X-CSE-MsgGUID: 7g90K3ETRPyH4sHCo75+Jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="68224049"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="68224049"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 16:27:20 -0700
X-CSE-ConnectionGUID: oU/Nye3aTWmO1gf6evzJkw==
X-CSE-MsgGUID: GW7yhE9pT9meAArbbCBDdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="133593071"
Received: from cbae1-mobl.amr.corp.intel.com (HELO cbae1-mobl.intel.com) ([10.124.161.191])
  by orviesa003.jf.intel.com with ESMTP; 09 Apr 2025 16:27:19 -0700
From: "Chang S. Bae" <chang.seok.bae@intel.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	colinmitchell@google.com,
	chao.gao@intel.com,
	chang.seok.bae@intel.com
Subject: [PATCH v3 2/6] x86/microcode/intel: Establish staging control logic
Date: Wed,  9 Apr 2025 16:27:09 -0700
Message-ID: <20250409232713.4536-3-chang.seok.bae@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250409232713.4536-1-chang.seok.bae@intel.com>
References: <20250320234104.8288-1-chang.seok.bae@intel.com>
 <20250409232713.4536-1-chang.seok.bae@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When microcode staging is initiated, operations are carried out through
an MMIO interface. Each package has a unique interface specified by the
IA32_MCU_STAGING_MBOX_ADDR MSR, which maps to a set of 32-bit registers.

Prepare staging with the following steps:

  1.  Ensure the microcode image is 32-bit aligned to match the MMIO
      register size.

  2.  Identify each MMIO interface based on its per-package scope.

  3.  Invoke the staging function for each identified interface, which
      will be implemented separately.

Also, define cpu_primary_thread_mask for the CONFIG_SMP=n case, allowing
consistent use when narrowing down primary threads to locate the
per-package interface.

Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
Link: https://lore.kernel.org/all/871pznq229.ffs@tglx
---
V2 -> V3:
* Remove a global variable and adjust stage_microcode() (Dave).
* Simplify for_each_cpu() loop control code
* Handle rdmsrl_on_cpu() return code explicitly (Chao)

V1 -> V2:
* Adjust to reference the staging_state struct.
* Add lockdep_assert_cpus_held() (Boris)
---
 arch/x86/include/asm/msr-index.h      |  2 ++
 arch/x86/include/asm/topology.h       |  1 +
 arch/x86/kernel/cpu/microcode/intel.c | 50 +++++++++++++++++++++++++++
 3 files changed, 53 insertions(+)

diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index 53da787b9326..f5b05e4f1e27 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -897,6 +897,8 @@
 #define MSR_IA32_UCODE_WRITE		0x00000079
 #define MSR_IA32_UCODE_REV		0x0000008b
 
+#define MSR_IA32_MCU_STAGING_MBOX_ADDR	0x000007a5
+
 /* Intel SGX Launch Enclave Public Key Hash MSRs */
 #define MSR_IA32_SGXLEPUBKEYHASH0	0x0000008C
 #define MSR_IA32_SGXLEPUBKEYHASH1	0x0000008D
diff --git a/arch/x86/include/asm/topology.h b/arch/x86/include/asm/topology.h
index 6c79ee7c0957..91b5fc44ca62 100644
--- a/arch/x86/include/asm/topology.h
+++ b/arch/x86/include/asm/topology.h
@@ -235,6 +235,7 @@ static inline bool topology_is_primary_thread(unsigned int cpu)
 static inline int topology_phys_to_logical_pkg(unsigned int pkg) { return 0; }
 static inline int topology_max_smt_threads(void) { return 1; }
 static inline unsigned int topology_amd_nodes_per_pkg(void) { return 1; }
+#define cpu_primary_thread_mask cpu_none_mask
 #endif /* !CONFIG_SMP */
 
 static inline void arch_fix_phys_package_id(int num, u32 slot)
diff --git a/arch/x86/kernel/cpu/microcode/intel.c b/arch/x86/kernel/cpu/microcode/intel.c
index 819199bc0119..a791d5dc2cef 100644
--- a/arch/x86/kernel/cpu/microcode/intel.c
+++ b/arch/x86/kernel/cpu/microcode/intel.c
@@ -299,6 +299,55 @@ static __init struct microcode_intel *scan_microcode(void *data, size_t size,
 	return size ? NULL : patch;
 }
 
+/*
+ * Handle the staging process using the mailbox MMIO interface.
+ * Return the result state.
+ */
+static enum ucode_state do_stage(u64 mmio_pa)
+{
+	pr_debug_once("Staging implementation is pending.\n");
+	return UCODE_ERROR;
+}
+
+static void stage_microcode(void)
+{
+	unsigned int pkg_id = UINT_MAX;
+	enum ucode_state ret;
+	int cpu, err;
+	u64 mmio_pa;
+
+	if (!IS_ALIGNED(get_totalsize(&ucode_patch_late->hdr), sizeof(u32)))
+		return;
+
+	lockdep_assert_cpus_held();
+
+	/*
+	 * The MMIO address is unique per package, and all the SMT
+	 * primary threads are online here. Find each MMIO space by
+	 * their package ids to avoid duplicate staging.
+	 */
+	for_each_cpu(cpu, cpu_primary_thread_mask) {
+		if (topology_logical_package_id(cpu) == pkg_id)
+			continue;
+		pkg_id = topology_logical_package_id(cpu);
+
+		err = rdmsrl_on_cpu(cpu, MSR_IA32_MCU_STAGING_MBOX_ADDR, &mmio_pa);
+		if (WARN_ON_ONCE(err))
+			return;
+
+		ret = do_stage(mmio_pa);
+		if (ret != UCODE_OK) {
+			pr_err("Error: staging failed with %s for CPU%d at package %u.\n",
+			       ret == UCODE_TIMEOUT ? "timeout" : "error state",
+			       cpu, pkg_id);
+			return;
+		}
+	}
+
+	pr_info("Staging of patch revision 0x%x succeeded.\n",
+		((struct microcode_header_intel *)ucode_patch_late)->rev);
+}
+
 static enum ucode_state __apply_microcode(struct ucode_cpu_info *uci,
 					  struct microcode_intel *mc,
 					  u32 *cur_rev)
@@ -627,6 +676,7 @@ static struct microcode_ops microcode_intel_ops = {
 	.collect_cpu_info	= collect_cpu_info,
 	.apply_microcode	= apply_microcode_late,
 	.finalize_late_load	= finalize_late_load,
+	.stage_microcode	= stage_microcode,
 	.use_nmi		= IS_ENABLED(CONFIG_X86_64),
 };
 
-- 
2.45.2

