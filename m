Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7726424290C;
	Thu,  3 Apr 2025 12:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743681959; cv=none; b=RJc5UN2BVOYgqDYM6TvRZPdTIin6fsENMxVRS+pSp2j3FFLbPW68cKk5U0HU9DPfvPoxeFPwMgmnUswpkCBeKp2PgAityZP8E9M5bklbuvqgKj1sDK+hrNxTBGXnieZsx59V7o4q99cTiSAYYkYXQ8ufJIQo9Hj7KNKdhU9X0qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743681959; c=relaxed/simple;
	bh=s8ja9gkRvDOlewwxdfelIcRL2wzNjeltE1uLz4eWgpY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OmZcThcTeLJtRUqsttoNoPzNsFTwp6QX5TJ0ASQurgY6MfmEiWVcyp/ay8nGjxeb89VOzQKZx1WwINe9PqYUo9Ks3ekXZYCFn++C8OWp3ZcX9438Usj4FtLDNq2yZZa5dVz2OycfftnvsxUVruqfjX65As3QiH6JrX82PEmZO+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P4Ki7mTP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P4Ki7mTP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1520C4CEE3;
	Thu,  3 Apr 2025 12:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743681958;
	bh=s8ja9gkRvDOlewwxdfelIcRL2wzNjeltE1uLz4eWgpY=;
	h=From:To:Cc:Subject:Date:From;
	b=P4Ki7mTP6O7yOXm5+X/ianwp7T1UURrYVKeF3UIHu9g1UoxR+IXcN4QayJVdMWOP0
	 TvoWfsMQs1jllAWan4GrbTmKijiBA9vwZNiX1lM4J3dLam6Hwx1Q/YnnCs25bLvE7C
	 ZWWd9IipztAf0VtQ16mWcQ5HjiJxzGWN9p+4cdG5FWJ4OJJtAojmu+WXeYEhpbGzd4
	 hxTNeXhfss4WR5WcQBeUpLcOzG+alL9iUIg8MYd20HjdjHZDvRSpIpQee1XDcEuZ44
	 80bP18yXtGMXWbj6kG2q9LI2GRyq7J5ImkmED+ybynId9ewckvgwDDavJTUC/J5R4p
	 oYwN0DAPgzGtw==
From: "Naveen N Rao (AMD)" <naveen@kernel.org>
To: <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>,
	linux-coco@lists.linux.dev
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	Borislav Petkov <bp@alien8.de>,
	Vishal Annapurve <vannapurve@google.com>,
	Kirill Shutemov <kirill.shutemov@linux.intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Nikolay Borisov <nik.borisov@suse.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Kevin Loughlin <kevinloughlin@google.com>
Subject: [RFC PATCH] x86/sev: Disallow userspace access to BIOS region for SEV-SNP guests
Date: Thu,  3 Apr 2025 17:32:28 +0530
Message-ID: <20250403120228.2344377-1-naveen@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 9704c07bf9f7 ("x86/kernel: Validate ROM memory before accessing
when SEV-SNP is active") added code to validate the ROM region from
0xc0000 to 0xfffff in a SEV-SNP guest since that region can be accessed
during kernel boot. That address range is not part of the system RAM, so
it needed to be validated separately.

Commit 0f4a1e80989a ("x86/sev: Skip ROM range scans and validation for
SEV-SNP guests") reverted those changes and instead chose to prevent the
guest from accessing the ROM region since SEV-SNP guests did not rely on
data from that region. However, while the kernel itself no longer
accessed the ROM region, there are userspace programs that probe this
region through /dev/mem and they started crashing due to this change. In
particular, fwupd (up until versions released last year that no longer
link against libsmbios) and smbios utilities such as smbios-sys-info
crash with a cryptic message in dmesg:
  Wrong/unhandled opcode bytes: 0x8b, exit_code: 0x404, rIP: 0x7fe5404d3840
  SEV: Unsupported exit-code 0x404 in #VC exception (IP: 0x7fe5404d3840)

Deny access to the BIOS region (rather than just the video ROM range)
via /dev/mem to address this. Restrict changes to CONFIG_STRICT_DEVMEM=y
which is enabled by default on x86. Add a new x86_platform_ops callback
so Intel can customize the address range to block.

Fixes: 0f4a1e80989a ("x86/sev: Skip ROM range scans and validation for SEV-SNP guests")
Signed-off-by: Naveen N Rao (AMD) <naveen@kernel.org>
---
 arch/x86/coco/sev/core.c        | 13 +++++++++++++
 arch/x86/include/asm/sev.h      |  2 ++
 arch/x86/include/asm/x86_init.h |  2 ++
 arch/x86/kernel/x86_init.c      |  2 ++
 arch/x86/mm/init.c              |  3 +++
 arch/x86/mm/mem_encrypt_amd.c   |  1 +
 6 files changed, 23 insertions(+)

diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index b0c1a7a57497..4e10701536d4 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -43,6 +43,7 @@
 #include <asm/apic.h>
 #include <asm/cpuid.h>
 #include <asm/cmdline.h>
+#include <asm/e820/types.h>
 
 #define DR7_RESET_VALUE        0x400
 
@@ -761,6 +762,18 @@ static u64 __init get_jump_table_addr(void)
 	return ret;
 }
 
+bool sev_snp_pfn_access_allowed(unsigned long pfn)
+{
+	/*
+	 * Reject access to BIOS address range (0xa0000 to 0x100000) for SEV-SNP guests
+	 * as that address range is not validated, so access can cause #VC exception
+	 */
+	if (pfn << PAGE_SHIFT >= BIOS_BEGIN && pfn << PAGE_SHIFT < BIOS_END)
+		return 0;
+
+	return 1;
+}
+
 static void __head
 early_set_pages_state(unsigned long vaddr, unsigned long paddr,
 		      unsigned long npages, enum psc_op op)
diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
index ba7999f66abe..721498c0a055 100644
--- a/arch/x86/include/asm/sev.h
+++ b/arch/x86/include/asm/sev.h
@@ -454,6 +454,7 @@ static inline int pvalidate(unsigned long vaddr, bool rmp_psize, bool validate)
 struct snp_guest_request_ioctl;
 
 void setup_ghcb(void);
+bool sev_snp_pfn_access_allowed(unsigned long pfn);
 void early_snp_set_memory_private(unsigned long vaddr, unsigned long paddr,
 				  unsigned long npages);
 void early_snp_set_memory_shared(unsigned long vaddr, unsigned long paddr,
@@ -496,6 +497,7 @@ static inline void sev_enable(struct boot_params *bp) { }
 static inline int pvalidate(unsigned long vaddr, bool rmp_psize, bool validate) { return 0; }
 static inline int rmpadjust(unsigned long vaddr, bool rmp_psize, unsigned long attrs) { return 0; }
 static inline void setup_ghcb(void) { }
+static inline bool sev_snp_pfn_access_allowed(unsigned long pfn) { return true; }
 static inline void __init
 early_snp_set_memory_private(unsigned long vaddr, unsigned long paddr, unsigned long npages) { }
 static inline void __init
diff --git a/arch/x86/include/asm/x86_init.h b/arch/x86/include/asm/x86_init.h
index 36698cc9fb44..d559587dee48 100644
--- a/arch/x86/include/asm/x86_init.h
+++ b/arch/x86/include/asm/x86_init.h
@@ -307,6 +307,7 @@ struct x86_hyper_runtime {
  * @realmode_reserve:		reserve memory for realmode trampoline
  * @realmode_init:		initialize realmode trampoline
  * @hyper:			x86 hypervisor specific runtime callbacks
+ * @pfn_access_allowed:		filter accesses to pages
  */
 struct x86_platform_ops {
 	unsigned long (*calibrate_cpu)(void);
@@ -324,6 +325,7 @@ struct x86_platform_ops {
 	void (*set_legacy_features)(void);
 	void (*realmode_reserve)(void);
 	void (*realmode_init)(void);
+	bool (*pfn_access_allowed)(unsigned long pfn);
 	struct x86_hyper_runtime hyper;
 	struct x86_guest guest;
 };
diff --git a/arch/x86/kernel/x86_init.c b/arch/x86/kernel/x86_init.c
index 0a2bbd674a6d..3679a92a3881 100644
--- a/arch/x86/kernel/x86_init.c
+++ b/arch/x86/kernel/x86_init.c
@@ -142,6 +142,7 @@ static bool enc_cache_flush_required_noop(void) { return false; }
 static void enc_kexec_begin_noop(void) {}
 static void enc_kexec_finish_noop(void) {}
 static bool is_private_mmio_noop(u64 addr) {return false; }
+static bool pfn_access_allowed_noop(unsigned long pfn) { return true; }
 
 struct x86_platform_ops x86_platform __ro_after_init = {
 	.calibrate_cpu			= native_calibrate_cpu_early,
@@ -156,6 +157,7 @@ struct x86_platform_ops x86_platform __ro_after_init = {
 	.restore_sched_clock_state	= tsc_restore_sched_clock_state,
 	.realmode_reserve		= reserve_real_mode,
 	.realmode_init			= init_real_mode,
+	.pfn_access_allowed		= pfn_access_allowed_noop,
 	.hyper.pin_vcpu			= x86_op_int_noop,
 	.hyper.is_private_mmio		= is_private_mmio_noop,
 
diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
index bfa444a7dbb0..9a82ebc02011 100644
--- a/arch/x86/mm/init.c
+++ b/arch/x86/mm/init.c
@@ -867,6 +867,9 @@ void __init poking_init(void)
  */
 int devmem_is_allowed(unsigned long pagenr)
 {
+	if (!x86_platform.pfn_access_allowed(pagenr))
+		return 0;
+
 	if (region_intersects(PFN_PHYS(pagenr), PAGE_SIZE,
 				IORESOURCE_SYSTEM_RAM, IORES_DESC_NONE)
 			!= REGION_DISJOINT) {
diff --git a/arch/x86/mm/mem_encrypt_amd.c b/arch/x86/mm/mem_encrypt_amd.c
index 7490ff6d83b1..526f2ba40788 100644
--- a/arch/x86/mm/mem_encrypt_amd.c
+++ b/arch/x86/mm/mem_encrypt_amd.c
@@ -532,6 +532,7 @@ void __init sme_early_init(void)
 		 * parsing has happened.
 		 */
 		x86_init.resources.dmi_setup = snp_dmi_setup;
+		x86_platform.pfn_access_allowed = sev_snp_pfn_access_allowed;
 	}
 
 	/*

base-commit: 1c13554a1d43317fe9009837ef6524f808e107b7
-- 
2.48.1

