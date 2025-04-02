Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDDB1F8BC9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 23:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743635597; cv=none; b=BcJm6vs7Lk0etMwKCaqJjl6Ab8PIsvjgxwWyemm2MhY0+bigBwuWcDbUwk1DGvsxVIQOEd27D1VMTom+Kz37IqF6QED1+wZHUmg/awWUiYbriJrmEkZO7gYXOzY2tZ+TXFyQUu0JHDhDUmmtdniAvWIsof0eXxjFtG4obqCUeH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743635597; c=relaxed/simple;
	bh=nlVU4m2cGOe9nm23h8UEok/akX92Rm8UP7rBstIa2ww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HDDcPClRoH5U7Yyu8+cBzpPC3YUMghOt0o86tIulvlorlMWnkZfNhJD7DL5zsI+bEE+6T+CicjTxoiWIcvPAs3OJra0JAecl57jqno1FjK+UwltrTXge4t4m9CSRLdOdPCuRZTWCo7G0YSqGhgnlDpHK+0tRN01lf7VjqEnsu8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SQcrr3nf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SQcrr3nf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43EC5C4CEEB;
	Wed,  2 Apr 2025 23:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743635597;
	bh=nlVU4m2cGOe9nm23h8UEok/akX92Rm8UP7rBstIa2ww=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SQcrr3nfpRELCHfXW94TzpOuPbpqtdc009Rx0J9/GRx8i+51s9cjayq8yTuNXer18
	 jPMVOrKbMX/bUjQMmlbvU2dVmv3XXXavEIItFVTj/Lj3nZK1HPIAAv47eLc7Td/4E1
	 5ZboKmDjINyY5HOtFZKhOPlzbJfsBeV9+CxF8gVI0tmuJPeBGlaPT/9/zTbBK2/86E
	 suZamKoGvl4furbm1x8B9moe5cvRDcyAA2ENXXd1CsfbALwJa2Hr+E9MBKFIKTFEJ9
	 Z5XbaE2v9riPC10IeZNPBaiHdH+mWmIxS+osSkr9V4fBlU9RlSTKuNLhU0D4s0Mr5a
	 4TGtJRuJy8I4A==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 02 Apr 2025 23:59:37 +0100
Subject: [PATCH 05/10] arm64/fpsimd: Stop using TIF_SVE to manage register
 saving in KVM
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-stable-sve-5-15-v1-5-84d0e5ff1102@kernel.org>
References: <20250402-stable-sve-5-15-v1-0-84d0e5ff1102@kernel.org>
In-Reply-To: <20250402-stable-sve-5-15-v1-0-84d0e5ff1102@kernel.org>
To: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Oleg Nesterov <oleg@redhat.com>, Oliver Upton <oliver.upton@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3851; i=broonie@kernel.org;
 h=from:subject:message-id; bh=nlVU4m2cGOe9nm23h8UEok/akX92Rm8UP7rBstIa2ww=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBn7cR4jz+1xO696XbwVAk4aCE4x9KrK6Yp6EI9NXz9
 bZ9npY2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ+3EeAAKCRAk1otyXVSH0JpRB/
 41VT8sIS1wRDFoA5Mll33zdBM34e9099U/RT60Tex6eXhoUAoLkTOuWrIo2c+TQ59n33CgGi1cEAiD
 rpE92rhxtYv8QvZqvW0e1jsciZQPPd1FC55MckCT0rpemfzRUC3M+5Q8fPBV2UFV8rEHhd2h5KnIPA
 0f0yCpwYO0lBBaetULd5zlFzfpetakgYSbyjYPNMWa9ETsSg6DpwZFTPVNN441ImVAKkqOoDdGVbUk
 x5pe9nyd+N6pvRLP9hdl23PsoqPmGYz1Nd1/c76DYOZZfuhJuyFhob70zXMZenQD95Aazjv6I1I+En
 FTYWt8NSS/xnmRISeJ3r2XsVSG135P
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

[ Upstream commit 62021cc36add7b2c015b837f7893f2fb4b8c2586 ]

Now that we are explicitly telling the host FP code which register state
it needs to save we can remove the manipulation of TIF_SVE from the KVM
code, simplifying it and allowing us to optimise our handling of normal
tasks. Remove the manipulation of TIF_SVE from KVM and instead rely on
to_save to ensure we save the correct data for it.

There should be no functional or performance impact from this change.

Signed-off-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Link: https://lore.kernel.org/r/20221115094640.112848-5-broonie@kernel.org
Signed-off-by: Will Deacon <will@kernel.org>
[ Mark: trivial backport ]
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kernel/fpsimd.c | 40 ++++++++++++++++------------------------
 arch/arm64/kvm/fpsimd.c    |  3 ---
 2 files changed, 16 insertions(+), 27 deletions(-)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index 105b8aa0c038..e8f10daaa0d7 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -318,7 +318,13 @@ static void task_fpsimd_load(void)
 
 /*
  * Ensure FPSIMD/SVE storage in memory for the loaded context is up to
- * date with respect to the CPU registers.
+ * date with respect to the CPU registers. Note carefully that the
+ * current context is the context last bound to the CPU stored in
+ * last, if KVM is involved this may be the guest VM context rather
+ * than the host thread for the VM pointed to by current. This means
+ * that we must always reference the state storage via last rather
+ * than via current, if we are saving KVM state then it will have
+ * ensured that the type of registers to save is set in last->to_save.
  */
 static void fpsimd_save(void)
 {
@@ -334,9 +340,15 @@ static void fpsimd_save(void)
 	if (test_thread_flag(TIF_FOREIGN_FPSTATE))
 		return;
 
-	if (IS_ENABLED(CONFIG_ARM64_SVE) &&
-	    test_thread_flag(TIF_SVE)) {
-		if (WARN_ON(sve_get_vl() != last->sve_vl)) {
+	if ((last->to_save == FP_STATE_CURRENT && test_thread_flag(TIF_SVE)) ||
+	    last->to_save == FP_STATE_SVE) {
+		save_sve_regs = true;
+		vl = last->sve_vl;
+	}
+
+	if (IS_ENABLED(CONFIG_ARM64_SVE) && save_sve_regs) {
+		/* Get the configured VL from RDVL, will account for SM */
+		if (WARN_ON(sve_get_vl() != vl)) {
 			/*
 			 * Can't save the user regs, so current would
 			 * re-enter user with corrupt state.
@@ -347,26 +359,6 @@ static void fpsimd_save(void)
 		}
 	}
 
-	if (test_thread_flag(TIF_SVE)) {
-		save_sve_regs = true;
-		vl = last->sve_vl;
-	}
-
-	/*
-	 * Validate that an explicitly specified state to save is
-	 * consistent with the task state.
-	 */
-	switch (last->to_save) {
-	case FP_STATE_CURRENT:
-		break;
-	case FP_STATE_FPSIMD:
-		WARN_ON_ONCE(save_sve_regs);
-		break;
-	case FP_STATE_SVE:
-		WARN_ON_ONCE(!save_sve_regs);
-		break;
-	}
-
 	if (IS_ENABLED(CONFIG_ARM64_SVE) && save_sve_regs) {
 		sve_save_state((char *)last->sve_state +
 			       sve_ffr_offset(last->sve_vl),
diff --git a/arch/arm64/kvm/fpsimd.c b/arch/arm64/kvm/fpsimd.c
index 54a31c97eb7a..2e0f44f4c470 100644
--- a/arch/arm64/kvm/fpsimd.c
+++ b/arch/arm64/kvm/fpsimd.c
@@ -110,7 +110,6 @@ void kvm_arch_vcpu_ctxsync_fp(struct kvm_vcpu *vcpu)
 					 &vcpu->arch.fp_type, fp_type);
 
 		clear_thread_flag(TIF_FOREIGN_FPSTATE);
-		update_thread_flag(TIF_SVE, vcpu_has_sve(vcpu));
 	}
 }
 
@@ -151,7 +150,5 @@ void kvm_arch_vcpu_put_fp(struct kvm_vcpu *vcpu)
 			sysreg_clear_set(CPACR_EL1, CPACR_EL1_ZEN_EL0EN, 0);
 	}
 
-	update_thread_flag(TIF_SVE, 0);
-
 	local_irq_restore(flags);
 }

-- 
2.39.5

