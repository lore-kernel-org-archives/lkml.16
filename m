Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080E81FC0E3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 23:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743635607; cv=none; b=JmluiSSsy+asRTvX21BU3jymWRORDpKHsa+eRR2z7EsCyf+uz/kJOMgk8iGwfEehO9et0ps50WLjVjeGdsGIlMCvjatXPXmgVGh8vaZ5xUZeQJJfkE+q/MMM0rfMEwpSt2oFm+lZKGOpTCKWsnhol6tEkRwjHzTDnPj6eLOgQVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743635607; c=relaxed/simple;
	bh=94B73exkvxZIp7PjZglkCZBY40cUsa7OpOScJsLUoog=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W50iHAOVm4C9p+xnqhcskZHTUmU5Ds4T01om5jWUq4t1z4/5p2srcLpmkOxgPwF2hQTmapvK2LSP9F9M24JEn94Cu5H5aIF8IQPm8cV07ofK+5VIvMP1mG6dd5M67PEULpdOONNvYNGxjv93eCN8O6pZ4EeppReToIZ5AQgB994=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cz9bCjX0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cz9bCjX0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 310BFC4CEE9;
	Wed,  2 Apr 2025 23:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743635606;
	bh=94B73exkvxZIp7PjZglkCZBY40cUsa7OpOScJsLUoog=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Cz9bCjX0XQNtJUML4hgMGAGzC+n+ekfOTyZwnmkaThPbXDcFTccvEM2wIO5eS2qYC
	 mWGR5Q0clh56b9AzkImiTPYO9nAIjAq74rH2mDDkYMVYhPt+w4KlsAj500fOqRYK9o
	 0r5y6lJTnBgctGT+QTi+jPINh5hhad3PrrT4kbIy/s9mpO4ySsO4QLZ7rLjnWM/vCn
	 Aj9+pHSCHacY1Vk9tiE3w27yHx0Ec/E79h1tlTGdnEtaGcnInyF6dU50VOV90zTYal
	 fKeMxyvNUm5sBizGrGgGnTKJ6SW35VkrAA+ZImQ9oTAqOGuim0Gs4dA8A4u2sL/7K7
	 IeqYa45xw3ZYw==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 02 Apr 2025 23:59:40 +0100
Subject: [PATCH 08/10] KVM: arm64: Remove VHE host restore of CPACR_EL1.ZEN
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-stable-sve-5-15-v1-8-84d0e5ff1102@kernel.org>
References: <20250402-stable-sve-5-15-v1-0-84d0e5ff1102@kernel.org>
In-Reply-To: <20250402-stable-sve-5-15-v1-0-84d0e5ff1102@kernel.org>
To: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Oleg Nesterov <oleg@redhat.com>, Oliver Upton <oliver.upton@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Fuad Tabba <tabba@google.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3514; i=broonie@kernel.org;
 h=from:subject:message-id; bh=z0T8Mw2Gv92zuKeVWJq8mDeqr184OynN7N95pkdbt3E=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBn7cR6CzsLnXqKuTai2nTTrTJYDmpEeihjmPP8suGz
 oDr1dJiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ+3EegAKCRAk1otyXVSH0Hn8B/
 4kgpuKQR93h5ohmPUvMD8MAlaq8D1rYGCe/+VjyydlEf/3HeaB6Qi7JEcpLhy2hkdKMGLqCnZei2lA
 cGeMrKXeez0f1JJnUqRPyAZiVmSYqvimHYtnB6tH0kuJLbWny4bJVePe5qvSSG+9+GqaDKRcBQNNcH
 CZRBZzvXp2/BL9o1ccYGfVi4Y6ihOjNJZRL3GBpyxocmsAMn5zIjQNPwzQCuXKpitgxzNpnccCYdzc
 ZfK22BIcyowVdqqT4DzfbyGPXWLYQkMSGWl/+kjtnotORC4t1+VPLpAjnNqYy2HZGJS3dmF2ibvu0D
 TTm7A6qTC729HqrRGPXqCo+68KgiJe
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

From: Mark Rutland <mark.rutland@arm.com>

[ Upstream commit 459f059be702056d91537b99a129994aa6ccdd35 ]

When KVM is in VHE mode, the host kernel tries to save and restore the
configuration of CPACR_EL1.ZEN (i.e. CPTR_EL2.ZEN when HCR_EL2.E2H=1)
across kvm_arch_vcpu_load_fp() and kvm_arch_vcpu_put_fp(), since the
configuration may be clobbered by hyp when running a vCPU. This logic is
currently redundant.

The VHE hyp code unconditionally configures CPTR_EL2.ZEN to 0b01 when
returning to the host, permitting host kernel usage of SVE.

Now that the host eagerly saves and unbinds its own FPSIMD/SVE/SME
state, there's no need to save/restore the state of the EL0 SVE trap.
The kernel can safely save/restore state without trapping, as described
above, and will restore userspace state (including trap controls) before
returning to userspace.

Remove the redundant logic.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Tested-by: Mark Brown <broonie@kernel.org>
Acked-by: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
Link: https://lore.kernel.org/r/20250210195226.1215254-4-mark.rutland@arm.com
Signed-off-by: Marc Zyngier <maz@kernel.org>
[Rework for refactoring of where the flags are stored -- broonie]
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h |  1 -
 arch/arm64/kvm/fpsimd.c           | 15 ---------------
 2 files changed, 16 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 06e8d4645ecd..3d4e2396a2d7 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -421,7 +421,6 @@ struct kvm_vcpu_arch {
 #define KVM_ARM64_DEBUG_DIRTY		(1 << 0)
 #define KVM_ARM64_FP_ENABLED		(1 << 1) /* guest FP regs loaded */
 #define KVM_ARM64_FP_HOST		(1 << 2) /* host FP regs loaded */
-#define KVM_ARM64_HOST_SVE_ENABLED	(1 << 4) /* SVE enabled for EL0 */
 #define KVM_ARM64_GUEST_HAS_SVE		(1 << 5) /* SVE exposed to guest */
 #define KVM_ARM64_VCPU_SVE_FINALIZED	(1 << 6) /* SVE config completed */
 #define KVM_ARM64_GUEST_HAS_PTRAUTH	(1 << 7) /* PTRAUTH exposed to guest */
diff --git a/arch/arm64/kvm/fpsimd.c b/arch/arm64/kvm/fpsimd.c
index 1ef9d6cb91ee..1360ddd4137b 100644
--- a/arch/arm64/kvm/fpsimd.c
+++ b/arch/arm64/kvm/fpsimd.c
@@ -83,9 +83,6 @@ void kvm_arch_vcpu_load_fp(struct kvm_vcpu *vcpu)
 	 */
 	fpsimd_save_and_flush_cpu_state();
 	vcpu->arch.flags &= ~KVM_ARM64_FP_HOST;
-
-	if (read_sysreg(cpacr_el1) & CPACR_EL1_ZEN_EL0EN)
-		vcpu->arch.flags |= KVM_ARM64_HOST_SVE_ENABLED;
 }
 
 /*
@@ -142,18 +139,6 @@ void kvm_arch_vcpu_put_fp(struct kvm_vcpu *vcpu)
 		}
 
 		fpsimd_save_and_flush_cpu_state();
-	} else if (has_vhe() && system_supports_sve()) {
-		/*
-		 * The FPSIMD/SVE state in the CPU has not been touched, and we
-		 * have SVE (and VHE): CPACR_EL1 (alias CPTR_EL2) has been
-		 * reset to CPACR_EL1_DEFAULT by the Hyp code, disabling SVE
-		 * for EL0.  To avoid spurious traps, restore the trap state
-		 * seen by kvm_arch_vcpu_load_fp():
-		 */
-		if (vcpu->arch.flags & KVM_ARM64_HOST_SVE_ENABLED)
-			sysreg_clear_set(CPACR_EL1, 0, CPACR_EL1_ZEN_EL0EN);
-		else
-			sysreg_clear_set(CPACR_EL1, CPACR_EL1_ZEN_EL0EN, 0);
 	}
 
 	local_irq_restore(flags);

-- 
2.39.5

