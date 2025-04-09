Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FDE2144A8
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 20:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744230599; cv=none; b=t2yYKtaA9vYFZaZEXO2DhgkKWYSdeoipb2a5LfaBHh6nMDbCEo3rb9FcFlxJCjVrQFoSyOPHJwHqBHRcCBJzNrYPz8FnFLCplnDzqhji/HO1IqMV1Uum7106sbShW217Eg+61AxxcmlE1808DJZXQN9wyZrOPSqPRrptKKdIAXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744230599; c=relaxed/simple;
	bh=jHUmgaT+J+eMZcTwdvJ3rTVzP9L43PG5nzNXq6XYjDk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RKb0DGuRRi5PRujxskBZWqi5dYa2UORZl57TYE3XN9w6rP2v9gKgTQCB2Ny8JjywG4Q0uvHJ3uEyJvIW+WKWmGXCPrI+bx9Mpo68gaf8m27mpZC71kwK1yDP+dN1+o0xYgyPf74MXIeTkYbfFhdU77cvJ33Ugrh4FOPVvo3iIcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I6NbOmNu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I6NbOmNu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAF04C4CEE9;
	Wed,  9 Apr 2025 20:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744230599;
	bh=jHUmgaT+J+eMZcTwdvJ3rTVzP9L43PG5nzNXq6XYjDk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I6NbOmNu8jGBfbFieNenBIOUGvsrITaP2HweDowZotl5lqmKZSbxGiAmAyC6KIXT8
	 FnH3BeV70+QQmz3WczEVuWSovC2wzBDFmOeO5omgdVUzqbctwHLeGzVONawvxaDXV8
	 gGsdYiwK8A4RwNaGyE0s7jJA6ajDsO2a8M736hucOoSTVBYJqs9NFsAmJrgfi3f1Tq
	 qLqFYiYOKko34GltWuYV1Icu5gZNNkG4Z2swtNcVR421XRDxCEE1f7jfeFsbzPZ0PV
	 Cl0zFILw2v7EDE72XuwDxGxIsSYhKSc9AvJ7VgoReU5U79nId+gWZ8cuvJ5+7dtTrJ
	 wTARs40VeIdgA==
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
Subject: [PATCH 15/20] x86/msr: Rename 'mce_rdmsrl()' to 'mce_rdmsrq()'
Date: Wed,  9 Apr 2025 22:29:02 +0200
Message-ID: <20250409202907.3419480-16-mingo@kernel.org>
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
 arch/x86/kernel/cpu/mce/core.c     | 32 ++++++++++++++++----------------
 arch/x86/kernel/cpu/mce/internal.h |  2 +-
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index c2740248b852..765b799c7090 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -388,7 +388,7 @@ void ex_handler_msr_mce(struct pt_regs *regs, bool wrmsr)
 }
 
 /* MSR access wrappers used for error injection */
-noinstr u64 mce_rdmsrl(u32 msr)
+noinstr u64 mce_rdmsrq(u32 msr)
 {
 	DECLARE_ARGS(val, low, high);
 
@@ -444,7 +444,7 @@ static noinstr void mce_wrmsrl(u32 msr, u64 v)
 	low  = (u32)v;
 	high = (u32)(v >> 32);
 
-	/* See comment in mce_rdmsrl() */
+	/* See comment in mce_rdmsrq() */
 	asm volatile("1: wrmsr\n"
 		     "2:\n"
 		     _ASM_EXTABLE_TYPE(1b, 2b, EX_TYPE_WRMSR_IN_MCE)
@@ -468,7 +468,7 @@ static noinstr void mce_gather_info(struct mce_hw_err *err, struct pt_regs *regs
 	instrumentation_end();
 
 	m = &err->m;
-	m->mcgstatus = mce_rdmsrl(MSR_IA32_MCG_STATUS);
+	m->mcgstatus = mce_rdmsrq(MSR_IA32_MCG_STATUS);
 	if (regs) {
 		/*
 		 * Get the address of the instruction at the time of
@@ -488,7 +488,7 @@ static noinstr void mce_gather_info(struct mce_hw_err *err, struct pt_regs *regs
 		}
 		/* Use accurate RIP reporting if available. */
 		if (mca_cfg.rip_msr)
-			m->ip = mce_rdmsrl(mca_cfg.rip_msr);
+			m->ip = mce_rdmsrq(mca_cfg.rip_msr);
 	}
 }
 
@@ -684,10 +684,10 @@ static noinstr void mce_read_aux(struct mce_hw_err *err, int i)
 	struct mce *m = &err->m;
 
 	if (m->status & MCI_STATUS_MISCV)
-		m->misc = mce_rdmsrl(mca_msr_reg(i, MCA_MISC));
+		m->misc = mce_rdmsrq(mca_msr_reg(i, MCA_MISC));
 
 	if (m->status & MCI_STATUS_ADDRV) {
-		m->addr = mce_rdmsrl(mca_msr_reg(i, MCA_ADDR));
+		m->addr = mce_rdmsrq(mca_msr_reg(i, MCA_ADDR));
 
 		/*
 		 * Mask the reported address by the reported granularity.
@@ -702,12 +702,12 @@ static noinstr void mce_read_aux(struct mce_hw_err *err, int i)
 	}
 
 	if (mce_flags.smca) {
-		m->ipid = mce_rdmsrl(MSR_AMD64_SMCA_MCx_IPID(i));
+		m->ipid = mce_rdmsrq(MSR_AMD64_SMCA_MCx_IPID(i));
 
 		if (m->status & MCI_STATUS_SYNDV) {
-			m->synd = mce_rdmsrl(MSR_AMD64_SMCA_MCx_SYND(i));
-			err->vendor.amd.synd1 = mce_rdmsrl(MSR_AMD64_SMCA_MCx_SYND1(i));
-			err->vendor.amd.synd2 = mce_rdmsrl(MSR_AMD64_SMCA_MCx_SYND2(i));
+			m->synd = mce_rdmsrq(MSR_AMD64_SMCA_MCx_SYND(i));
+			err->vendor.amd.synd1 = mce_rdmsrq(MSR_AMD64_SMCA_MCx_SYND1(i));
+			err->vendor.amd.synd2 = mce_rdmsrq(MSR_AMD64_SMCA_MCx_SYND2(i));
 		}
 	}
 }
@@ -753,7 +753,7 @@ void machine_check_poll(enum mcp_flags flags, mce_banks_t *b)
 		m->bank = i;
 
 		barrier();
-		m->status = mce_rdmsrl(mca_msr_reg(i, MCA_STATUS));
+		m->status = mce_rdmsrq(mca_msr_reg(i, MCA_STATUS));
 
 		/*
 		 * Update storm tracking here, before checking for the
@@ -887,8 +887,8 @@ quirk_sandybridge_ifu(int bank, struct mce *m, struct pt_regs *regs)
  */
 static noinstr bool quirk_skylake_repmov(void)
 {
-	u64 mcgstatus   = mce_rdmsrl(MSR_IA32_MCG_STATUS);
-	u64 misc_enable = mce_rdmsrl(MSR_IA32_MISC_ENABLE);
+	u64 mcgstatus   = mce_rdmsrq(MSR_IA32_MCG_STATUS);
+	u64 misc_enable = mce_rdmsrq(MSR_IA32_MISC_ENABLE);
 	u64 mc1_status;
 
 	/*
@@ -899,7 +899,7 @@ static noinstr bool quirk_skylake_repmov(void)
 	    !(misc_enable & MSR_IA32_MISC_ENABLE_FAST_STRING))
 		return false;
 
-	mc1_status = mce_rdmsrl(MSR_IA32_MCx_STATUS(1));
+	mc1_status = mce_rdmsrq(MSR_IA32_MCx_STATUS(1));
 
 	/* Check for a software-recoverable data fetch error. */
 	if ((mc1_status &
@@ -955,7 +955,7 @@ static __always_inline int mce_no_way_out(struct mce_hw_err *err, char **msg, un
 	int i;
 
 	for (i = 0; i < this_cpu_read(mce_num_banks); i++) {
-		m->status = mce_rdmsrl(mca_msr_reg(i, MCA_STATUS));
+		m->status = mce_rdmsrq(mca_msr_reg(i, MCA_STATUS));
 		if (!(m->status & MCI_STATUS_VAL))
 			continue;
 
@@ -1335,7 +1335,7 @@ __mc_scan_banks(struct mce_hw_err *err, struct pt_regs *regs,
 		m->addr = 0;
 		m->bank = i;
 
-		m->status = mce_rdmsrl(mca_msr_reg(i, MCA_STATUS));
+		m->status = mce_rdmsrq(mca_msr_reg(i, MCA_STATUS));
 		if (!(m->status & MCI_STATUS_VAL))
 			continue;
 
diff --git a/arch/x86/kernel/cpu/mce/internal.h b/arch/x86/kernel/cpu/mce/internal.h
index 95a504ece43e..b5ba598e54cb 100644
--- a/arch/x86/kernel/cpu/mce/internal.h
+++ b/arch/x86/kernel/cpu/mce/internal.h
@@ -312,7 +312,7 @@ static __always_inline void pentium_machine_check(struct pt_regs *regs) {}
 static __always_inline void winchip_machine_check(struct pt_regs *regs) {}
 #endif
 
-noinstr u64 mce_rdmsrl(u32 msr);
+noinstr u64 mce_rdmsrq(u32 msr);
 
 static __always_inline u32 mca_msr_reg(int bank, enum mca_msr reg)
 {
-- 
2.45.2

