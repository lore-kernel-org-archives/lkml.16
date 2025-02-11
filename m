Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AA62566C9
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 16:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739291819; cv=none; b=t3VuDQWDF6CFxG/nzZoZsA6WBZB6dODOqj1Wc3Jms2Yv4FJQWlB1qeBcda0k9UZVAeF7nNKdbELOvI1bJDeFb4yEwHHW/Bj8dRrf4b7oxtPxHcHw7e/e97lPDaGJx8f5Fin2Vpu4X9Xilu6tpARQTfppaoWvMoCSv40xsqXlkGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739291819; c=relaxed/simple;
	bh=+HW24izCZDjaUaZUO8o/SCJ3eyQma72sjafBY/n5uz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q9GIhGlb1i1NLJQ2hacSUXAhL7CaNUJ0wKikt6evhkWPDAlWwAiilEI5BSiRB1u15Hk1FEo+GIAJupCCnPPfD8ah2MXWLqyJXWU+cYjYvVr5tavBYXanAKJ1buiGLldPfJkMRJGWBwJWyCgvVHPNtaFuJK8Sl52CHaDRQ++nyH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hQs07nC9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hQs07nC9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14218C4CEE9;
	Tue, 11 Feb 2025 16:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739291819;
	bh=+HW24izCZDjaUaZUO8o/SCJ3eyQma72sjafBY/n5uz8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hQs07nC9tCFo22fAQGh78psDMhxtQEFnZ+c3V505nCsC+59OCPrgvGBeJRXmo8F6M
	 xPS+D0EQQlSy13MBMubgkUAJ54DUcnzcOAQW4v+mwtFG1/BPo103Fw3bfiFZAePGeO
	 VFq9KZPagGlIwCzMlIBLPjdpyPDhRk5vQ1m0oYOu+HSveONpD2EBCMokVU05zhNLDQ
	 w64eymohMePG45yl4a1y3FZFVnCfE0qrB9HY6bqmpx7TtUyVeWgyhl6pyYyB+9yb7M
	 Lv4COJg8LuwlM/XykkyPNZRT6oed5nft+SKh73RGkUw0MK2fLHd8tqSvdPlOQqRuc7
	 m2b+V0KMgfGFw==
From: Borislav Petkov <bp@kernel.org>
To: X86 ML <x86@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	"Borislav Petkov (AMD)" <bp@alien8.de>
Subject: [PATCH 5/5] x86/microcode/AMD: Add get_patch_level()
Date: Tue, 11 Feb 2025 17:36:48 +0100
Message-ID: <20250211163648.30531-6-bp@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250211163648.30531-1-bp@kernel.org>
References: <20250211163648.30531-1-bp@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Borislav Petkov (AMD)" <bp@alien8.de>

Put the MSR_AMD64_PATCH_LEVEL reading of the current microcode revision
the hw has, into a separate function.

Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
---
 arch/x86/kernel/cpu/microcode/amd.c | 46 +++++++++++++++--------------
 1 file changed, 24 insertions(+), 22 deletions(-)

diff --git a/arch/x86/kernel/cpu/microcode/amd.c b/arch/x86/kernel/cpu/microcode/amd.c
index adfea4d0d129..31f90e129b08 100644
--- a/arch/x86/kernel/cpu/microcode/amd.c
+++ b/arch/x86/kernel/cpu/microcode/amd.c
@@ -145,6 +145,15 @@ ucode_path[] __maybe_unused = "kernel/x86/microcode/AuthenticAMD.bin";
  */
 static u32 bsp_cpuid_1_eax __ro_after_init;
 
+static u32 get_patch_level(void)
+{
+	u32 rev, dummy __always_unused;
+
+	native_rdmsr(MSR_AMD64_PATCH_LEVEL, rev, dummy);
+
+	return rev;
+}
+
 static union cpuid_1_eax ucode_rev_to_cpuid(unsigned int val)
 {
 	union zen_patch_rev p;
@@ -483,10 +492,10 @@ static void scan_containers(u8 *ucode, size_t size, struct cont_desc *desc)
 	}
 }
 
-static bool __apply_microcode_amd(struct microcode_amd *mc, unsigned int psize)
+static bool __apply_microcode_amd(struct microcode_amd *mc, u32 *cur_rev,
+				  unsigned int psize)
 {
 	unsigned long p_addr = (unsigned long)&mc->hdr.data_code;
-	u32 rev, dummy;
 
 	native_wrmsrl(MSR_AMD64_PATCH_LOADER, p_addr);
 
@@ -504,9 +513,8 @@ static bool __apply_microcode_amd(struct microcode_amd *mc, unsigned int psize)
 	}
 
 	/* verify patch application was successful */
-	native_rdmsr(MSR_AMD64_PATCH_LEVEL, rev, dummy);
-
-	if (rev != mc->hdr.patch_id)
+	*cur_rev = get_patch_level();
+	if (*cur_rev != mc->hdr.patch_id)
 		return false;
 
 	return true;
@@ -563,11 +571,12 @@ void __init load_ucode_amd_bsp(struct early_load_data *ed, unsigned int cpuid_1_
 	struct cont_desc desc = { };
 	struct microcode_amd *mc;
 	struct cpio_data cp = { };
-	u32 dummy;
+	u32 rev;
 
 	bsp_cpuid_1_eax = cpuid_1_eax;
 
-	native_rdmsr(MSR_AMD64_PATCH_LEVEL, ed->old_rev, dummy);
+	rev = get_patch_level();
+	ed->old_rev = rev;
 
 	/* Needed in load_microcode_amd() */
 	ucode_cpu_info[0].cpu_sig.sig = cpuid_1_eax;
@@ -589,8 +598,8 @@ void __init load_ucode_amd_bsp(struct early_load_data *ed, unsigned int cpuid_1_
 	if (ed->old_rev > mc->hdr.patch_id)
 		return;
 
-	if (__apply_microcode_amd(mc, desc.psize))
-		native_rdmsr(MSR_AMD64_PATCH_LEVEL, ed->new_rev, dummy);
+	if (__apply_microcode_amd(mc, &rev, desc.psize))
+		ed->new_rev = rev;
 }
 
 static inline bool patch_cpus_equivalent(struct ucode_patch *p,
@@ -692,14 +701,9 @@ static void free_cache(void)
 static struct ucode_patch *find_patch(unsigned int cpu)
 {
 	struct ucode_cpu_info *uci = ucode_cpu_info + cpu;
-	u32 rev, dummy __always_unused;
 	u16 equiv_id = 0;
 
-	/* fetch rev if not populated yet: */
-	if (!uci->cpu_sig.rev) {
-		rdmsr(MSR_AMD64_PATCH_LEVEL, rev, dummy);
-		uci->cpu_sig.rev = rev;
-	}
+	uci->cpu_sig.rev = get_patch_level();
 
 	if (x86_family(bsp_cpuid_1_eax) < 0x17) {
 		equiv_id = find_equiv_id(&equiv_table, uci->cpu_sig.sig);
@@ -722,22 +726,20 @@ void reload_ucode_amd(unsigned int cpu)
 
 	mc = p->data;
 
-	rdmsr(MSR_AMD64_PATCH_LEVEL, rev, dummy);
-
+	rev = get_patch_level();
 	if (rev < mc->hdr.patch_id) {
-		if (__apply_microcode_amd(mc, p->size))
-			pr_info_once("reload revision: 0x%08x\n", mc->hdr.patch_id);
+		if (__apply_microcode_amd(mc, &rev, p->size))
+			pr_info_once("reload revision: 0x%08x\n", rev);
 	}
 }
 
 static int collect_cpu_info_amd(int cpu, struct cpu_signature *csig)
 {
-	struct cpuinfo_x86 *c = &cpu_data(cpu);
 	struct ucode_cpu_info *uci = ucode_cpu_info + cpu;
 	struct ucode_patch *p;
 
 	csig->sig = cpuid_eax(0x00000001);
-	csig->rev = c->microcode;
+	csig->rev = get_patch_level();
 
 	/*
 	 * a patch could have been loaded early, set uci->mc so that
@@ -778,7 +780,7 @@ static enum ucode_state apply_microcode_amd(int cpu)
 		goto out;
 	}
 
-	if (!__apply_microcode_amd(mc_amd, p->size)) {
+	if (!__apply_microcode_amd(mc_amd, &rev, p->size)) {
 		pr_err("CPU%d: update failed for patch_level=0x%08x\n",
 			cpu, mc_amd->hdr.patch_id);
 		return UCODE_ERROR;
-- 
2.43.0

