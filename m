Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5CE1FC7D7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 23:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743635609; cv=none; b=h7wnfGgv1Wt71zqVmJsBhShswi0Fe3CT2ycUOKyAfMCJKIksqq7vxGTlKSDeWRMcouwM8iSHruReCN09kQEhP4edgLWvceKK5yd7SG6nNHz/5TKu+XhQd1HIS+oBlJSIV4bSdAbCpy7eADwUYWFeD8XmYDBtogllWfgl3cq9EOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743635609; c=relaxed/simple;
	bh=5LpLtUug8+WAmrpDqxb97Aqky7PzaY6BPA6LoGHVYvM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OMo65vQU4Ks2xMVBWgJejnblnh4pg7COS/V9FTepn7qw2mDhyLpBI+4TOOavFEkaexi+0bbTodbKSvkF0LIOPwDbJzX3GPZwslgD2ysUoh0gJW7oIs8JqTZ1K5li7Nb3V4Tg0FAoRixhoK+X0FmB+Q6eawznTTWDZEGl2AtWWro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e6zOCTfI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e6zOCTfI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBEA8C4CEEA;
	Wed,  2 Apr 2025 23:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743635609;
	bh=5LpLtUug8+WAmrpDqxb97Aqky7PzaY6BPA6LoGHVYvM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=e6zOCTfIbfBoxD8ROtsIVqW1T8Xa1PVRZExUIFZThYjX6M7ECcSTIq4iRJoxvnBei
	 OFPqDENL5p2/4dYdkasu7piYYqiGHoD07iJSjbpyTqqjvyZE241hOG6vOdU3lo5sYo
	 kkPbybTmCYAUpn3RU7bBtRVPP+n3eQbCALjg5geKsrMtKX9wEhBQrIe0NJ4VIxwKPT
	 6GjvvrtESwTLTFCudHkVdIKwT1Z3TKz51c52ersNQymI7D2zRnzk9cKWeh6MClQH/1
	 MF537TXQmGg4igseRw6r0D4HE4n6KAo3FcDltZCRnAtHxGE77/tFdT5VH7wjZJvp7U
	 TeEilDVVLBYHA==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 02 Apr 2025 23:59:41 +0100
Subject: [PATCH 09/10] KVM: arm64: Calculate cptr_el2 traps on activating
 traps
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-stable-sve-5-15-v1-9-84d0e5ff1102@kernel.org>
References: <20250402-stable-sve-5-15-v1-0-84d0e5ff1102@kernel.org>
In-Reply-To: <20250402-stable-sve-5-15-v1-0-84d0e5ff1102@kernel.org>
To: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Oleg Nesterov <oleg@redhat.com>, Oliver Upton <oliver.upton@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
 Fuad Tabba <tabba@google.com>, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3292; i=broonie@kernel.org;
 h=from:subject:message-id; bh=dzuSkTHzORViq39mf97JEZt+XWlNRsFaxOQ4IWqXP1g=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBn7cR7N73oFKRhczTXNGGx/jdGtlVF0vLwVsngJpzw
 k+0qmsGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ+3EewAKCRAk1otyXVSH0BeVCA
 CDsgghGxJg+i8PrezkADB1+iPr2viowx4MCqyhXJ14mmf9A3RtlBHqAOByOUd4OFXlNCgQeBwXOHnf
 U+AQJB+0i35+Ot3cp7PesJQiYSJHQeAUBQHIuoUajI1lie8MpipKNkvPcVKOkEc949OCp8yPKe53ak
 bcYSowKiogb2BylbUSVcOkMyq7YpZnDV/5zjZylbSnhRFpHznF15RGK4dcbftzPrQJLRbzb1QIAPm8
 M86ctRfm6NCNwVcOQf609ieGo64RRVgQps2aUA58zvtLzIRzL9PeFvdmOodg6fZZYSPPp5br53jJss
 VZLCzmTBOVTdizNiKJuKskiFoJLFdd
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

From: Fuad Tabba <tabba@google.com>

[ Upstream commit 2fd5b4b0e7b440602455b79977bfa64dea101e6c ]

Similar to VHE, calculate the value of cptr_el2 from scratch on
activate traps. This removes the need to store cptr_el2 in every
vcpu structure. Moreover, some traps, such as whether the guest
owns the fp registers, need to be set on every vcpu run.

Reported-by: James Clark <james.clark@linaro.org>
Fixes: 5294afdbf45a ("KVM: arm64: Exclude FP ownership from kvm_vcpu_arch")
Signed-off-by: Fuad Tabba <tabba@google.com>
Link: https://lore.kernel.org/r/20241216105057.579031-13-tabba@google.com
Signed-off-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h |  1 -
 arch/arm64/kvm/arm.c              |  1 -
 arch/arm64/kvm/hyp/nvhe/switch.c  | 35 ++++++++++++++++++++++++++---------
 3 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 3d4e2396a2d7..2e0952134e2e 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -301,7 +301,6 @@ struct kvm_vcpu_arch {
 	/* Values of trap registers for the guest. */
 	u64 hcr_el2;
 	u64 mdcr_el2;
-	u64 cptr_el2;
 
 	/* Values of trap registers for the host before guest entry. */
 	u64 mdcr_el2_host;
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 9ded5443de48..5ca8782edb96 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1138,7 +1138,6 @@ static int kvm_arch_vcpu_ioctl_vcpu_init(struct kvm_vcpu *vcpu,
 	}
 
 	vcpu_reset_hcr(vcpu);
-	vcpu->arch.cptr_el2 = CPTR_EL2_DEFAULT;
 
 	/*
 	 * Handle the "start in power-off" case.
diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
index 4db5409f40c4..c0885197f2a5 100644
--- a/arch/arm64/kvm/hyp/nvhe/switch.c
+++ b/arch/arm64/kvm/hyp/nvhe/switch.c
@@ -34,21 +34,38 @@ DEFINE_PER_CPU(struct kvm_host_data, kvm_host_data);
 DEFINE_PER_CPU(struct kvm_cpu_context, kvm_hyp_ctxt);
 DEFINE_PER_CPU(unsigned long, kvm_hyp_vector);
 
-static void __activate_traps(struct kvm_vcpu *vcpu)
+static bool guest_owns_fp_regs(struct kvm_vcpu *vcpu)
 {
-	u64 val;
+	return vcpu->arch.flags & KVM_ARM64_FP_ENABLED;
+}
 
-	___activate_traps(vcpu);
-	__activate_traps_common(vcpu);
+static void __activate_cptr_traps(struct kvm_vcpu *vcpu)
+{
+	u64 val = CPTR_EL2_TAM;	/* Same bit irrespective of E2H */
 
-	val = vcpu->arch.cptr_el2;
-	val |= CPTR_EL2_TTA | CPTR_EL2_TAM;
-	if (!update_fp_enabled(vcpu)) {
-		val |= CPTR_EL2_TFP | CPTR_EL2_TZ;
-		__activate_traps_fpsimd32(vcpu);
+	/* !hVHE case upstream */
+	if (1) {
+		val |= CPTR_EL2_TTA | CPTR_NVHE_EL2_RES1;
+
+		if (!vcpu_has_sve(vcpu) || !guest_owns_fp_regs(vcpu))
+			val |= CPTR_EL2_TZ;
+
+		if (!guest_owns_fp_regs(vcpu))
+			val |= CPTR_EL2_TFP;
 	}
 
+	if (!guest_owns_fp_regs(vcpu))
+		__activate_traps_fpsimd32(vcpu);
+
 	write_sysreg(val, cptr_el2);
+}
+
+static void __activate_traps(struct kvm_vcpu *vcpu)
+{
+	___activate_traps(vcpu);
+	__activate_traps_common(vcpu);
+	__activate_cptr_traps(vcpu);
+
 	write_sysreg(__this_cpu_read(kvm_hyp_vector), vbar_el2);
 
 	if (cpus_have_final_cap(ARM64_WORKAROUND_SPECULATIVE_AT)) {

-- 
2.39.5

