Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E48E2222A6
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 20:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744230611; cv=none; b=KeCb+QZWCKULKEYTJTL82NWM1QBOZsLtb7hZuQ6VJAVvxdM3njUY/z+Mn04BN3cE2FBs11/1cXZ3ZWvxlzTlEf//upNEBq51sEYMY/SUpOSvOw/DmJ0cHDdv/JCYDAl7OH+/trR/S0nF6ji+SATUgm0Q74YjCbWeRWx7ZS06Z1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744230611; c=relaxed/simple;
	bh=CGmCdJf01UXuI3vhr0VMS+FaMTgdOl4kYiqtWH1ipLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VMier34dioJVNynplOtime8EVu3jWY3AKfA4MlxzHCQpyP4bTil0hSxr0uYnYTRvh05fHgWY6eziVcsT1Y6URlRiWfW6HMlqOR1Apw6aeJ/QBFbYZG4dP2yQsjIPAy2lUs6tKHdbzHK9xZQjP78NOMDiA4qbbA11p2g4lxUYnG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s75ZyYJ4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s75ZyYJ4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA5C4C4CEE8;
	Wed,  9 Apr 2025 20:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744230610;
	bh=CGmCdJf01UXuI3vhr0VMS+FaMTgdOl4kYiqtWH1ipLs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s75ZyYJ4t1TmiL3bddhkIUkhJ/gQ0XHuDpul4gkTVHTrll+MT6tmiV/C8+SxTyWR1
	 eoAUT7893chcKRrnVdkoNOO/e9rGMiIleQ9dfPPpfaYUld48mEydb/aKtGq43TFf9Z
	 rIRiWKt85Mw7rae8ACjyM/bvb95VKgeIjmUcO/kVSA5F2fc512bMOT10rv0pI09afm
	 eaK2/UQijKQOdFI0Pa5RtUTbedI+xvEakQxQzGDdOCO84WVyUflGW6hSh8+q0U7O3G
	 IZMvyzFBI5khZpRl7gD37L+TQ5JstTj7tpTXy8dBSbXC/aS0GFn7R1+NxVAsiopEIk
	 bcJkZm9/zXChQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Dave Hansen <dave.hansen@intel.com>,
	Xin Li <xin@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 19/20] x86/msr: Rename 'native_wrmsrl()' to 'native_wrmsrq()'
Date: Wed,  9 Apr 2025 22:29:06 +0200
Message-ID: <20250409202907.3419480-20-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250409202907.3419480-1-mingo@kernel.org>
References: <20250409202907.3419480-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Suggested-by: "H. Peter Anvin" <hpa@zytor.com>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Juergen Gross <jgross@suse.com>
Cc: Dave Hansen <dave.hansen@intel.com>
Cc: Xin Li <xin@zytor.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
---
 arch/x86/hyperv/ivm.c                 | 2 +-
 arch/x86/include/asm/microcode.h      | 2 +-
 arch/x86/include/asm/msr.h            | 2 +-
 arch/x86/include/asm/spec-ctrl.h      | 2 +-
 arch/x86/kernel/cpu/microcode/amd.c   | 2 +-
 arch/x86/kernel/cpu/microcode/intel.c | 2 +-
 arch/x86/kvm/vmx/vmx.c                | 8 ++++----
 7 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/x86/hyperv/ivm.c b/arch/x86/hyperv/ivm.c
index 77bf05f06b9e..1b8a2415183b 100644
--- a/arch/x86/hyperv/ivm.c
+++ b/arch/x86/hyperv/ivm.c
@@ -115,7 +115,7 @@ static inline u64 rd_ghcb_msr(void)
 
 static inline void wr_ghcb_msr(u64 val)
 {
-	native_wrmsrl(MSR_AMD64_SEV_ES_GHCB, val);
+	native_wrmsrq(MSR_AMD64_SEV_ES_GHCB, val);
 }
 
 static enum es_result hv_ghcb_hv_call(struct ghcb *ghcb, u64 exit_code,
diff --git a/arch/x86/include/asm/microcode.h b/arch/x86/include/asm/microcode.h
index 695e569159c1..263ea3dd0001 100644
--- a/arch/x86/include/asm/microcode.h
+++ b/arch/x86/include/asm/microcode.h
@@ -61,7 +61,7 @@ static inline u32 intel_get_microcode_revision(void)
 {
 	u32 rev, dummy;
 
-	native_wrmsrl(MSR_IA32_UCODE_REV, 0);
+	native_wrmsrq(MSR_IA32_UCODE_REV, 0);
 
 	/* As documented in the SDM: Do a CPUID 1 here */
 	native_cpuid_eax(1);
diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index 4335f914d6f8..20deb58308e5 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -109,7 +109,7 @@ do {							\
 #define native_wrmsr(msr, low, high)			\
 	__wrmsr(msr, low, high)
 
-#define native_wrmsrl(msr, val)				\
+#define native_wrmsrq(msr, val)				\
 	__wrmsr((msr), (u32)((u64)(val)),		\
 		       (u32)((u64)(val) >> 32))
 
diff --git a/arch/x86/include/asm/spec-ctrl.h b/arch/x86/include/asm/spec-ctrl.h
index 658b690b2ccb..00b7e0398210 100644
--- a/arch/x86/include/asm/spec-ctrl.h
+++ b/arch/x86/include/asm/spec-ctrl.h
@@ -84,7 +84,7 @@ static inline u64 ssbd_tif_to_amd_ls_cfg(u64 tifn)
 static __always_inline void __update_spec_ctrl(u64 val)
 {
 	__this_cpu_write(x86_spec_ctrl_current, val);
-	native_wrmsrl(MSR_IA32_SPEC_CTRL, val);
+	native_wrmsrq(MSR_IA32_SPEC_CTRL, val);
 }
 
 #ifdef CONFIG_SMP
diff --git a/arch/x86/kernel/cpu/microcode/amd.c b/arch/x86/kernel/cpu/microcode/amd.c
index b61028cf5c8a..041dae089a36 100644
--- a/arch/x86/kernel/cpu/microcode/amd.c
+++ b/arch/x86/kernel/cpu/microcode/amd.c
@@ -602,7 +602,7 @@ static bool __apply_microcode_amd(struct microcode_amd *mc, u32 *cur_rev,
 	if (!verify_sha256_digest(mc->hdr.patch_id, *cur_rev, (const u8 *)p_addr, psize))
 		return false;
 
-	native_wrmsrl(MSR_AMD64_PATCH_LOADER, p_addr);
+	native_wrmsrq(MSR_AMD64_PATCH_LOADER, p_addr);
 
 	if (x86_family(bsp_cpuid_1_eax) == 0x17) {
 		unsigned long p_addr_end = p_addr + psize - 1;
diff --git a/arch/x86/kernel/cpu/microcode/intel.c b/arch/x86/kernel/cpu/microcode/intel.c
index 819199bc0119..86e1047f738f 100644
--- a/arch/x86/kernel/cpu/microcode/intel.c
+++ b/arch/x86/kernel/cpu/microcode/intel.c
@@ -320,7 +320,7 @@ static enum ucode_state __apply_microcode(struct ucode_cpu_info *uci,
 	}
 
 	/* write microcode via MSR 0x79 */
-	native_wrmsrl(MSR_IA32_UCODE_WRITE, (unsigned long)mc->bits);
+	native_wrmsrq(MSR_IA32_UCODE_WRITE, (unsigned long)mc->bits);
 
 	rev = intel_get_microcode_revision();
 	if (rev != mc->hdr.rev)
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 9b221bdd3c51..cd0d6c1fcf9c 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -382,7 +382,7 @@ static __always_inline void vmx_disable_fb_clear(struct vcpu_vmx *vmx)
 
 	msr = __rdmsr(MSR_IA32_MCU_OPT_CTRL);
 	msr |= FB_CLEAR_DIS;
-	native_wrmsrl(MSR_IA32_MCU_OPT_CTRL, msr);
+	native_wrmsrq(MSR_IA32_MCU_OPT_CTRL, msr);
 	/* Cache the MSR value to avoid reading it later */
 	vmx->msr_ia32_mcu_opt_ctrl = msr;
 }
@@ -393,7 +393,7 @@ static __always_inline void vmx_enable_fb_clear(struct vcpu_vmx *vmx)
 		return;
 
 	vmx->msr_ia32_mcu_opt_ctrl &= ~FB_CLEAR_DIS;
-	native_wrmsrl(MSR_IA32_MCU_OPT_CTRL, vmx->msr_ia32_mcu_opt_ctrl);
+	native_wrmsrq(MSR_IA32_MCU_OPT_CTRL, vmx->msr_ia32_mcu_opt_ctrl);
 }
 
 static void vmx_update_fb_clear_dis(struct kvm_vcpu *vcpu, struct vcpu_vmx *vmx)
@@ -6745,7 +6745,7 @@ static noinstr void vmx_l1d_flush(struct kvm_vcpu *vcpu)
 	vcpu->stat.l1d_flush++;
 
 	if (static_cpu_has(X86_FEATURE_FLUSH_L1D)) {
-		native_wrmsrl(MSR_IA32_FLUSH_CMD, L1D_FLUSH);
+		native_wrmsrq(MSR_IA32_FLUSH_CMD, L1D_FLUSH);
 		return;
 	}
 
@@ -7318,7 +7318,7 @@ void noinstr vmx_spec_ctrl_restore_host(struct vcpu_vmx *vmx,
 	 */
 	if (cpu_feature_enabled(X86_FEATURE_KERNEL_IBRS) ||
 	    vmx->spec_ctrl != hostval)
-		native_wrmsrl(MSR_IA32_SPEC_CTRL, hostval);
+		native_wrmsrq(MSR_IA32_SPEC_CTRL, hostval);
 
 	barrier_nospec();
 }
-- 
2.45.2

