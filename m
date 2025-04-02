Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC271FA177
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 23:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743635601; cv=none; b=MIlAEGoE9Da+LKJt8oH40l0te7A6X83HVVHy3gm7s7HO/+XOYsnxb0QgC1W4qp9VjqNm7LFlsIewZo69Fx3nMvRI24onkdfd/8+D0R3/BatQeofD+RfHIQN8uCf+PtFCApl7YSBKt43wgOzOPxwyNsethMj4CmQpXim3DkDxxic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743635601; c=relaxed/simple;
	bh=snqshUSLnJbd+v3fb51JH5LHVcFkGZDOPske10wHJPE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uaPu/KF2nqZqHxUrMSyURSHnIZCnvqkMAG8wxnYT0bTVvswOqsk8Eprg1kj1mIQRQ8ANv0dZvEonaIBe0YLUafIBvuP8ybVUSYdDEtVmPDK2uUreRUuzXNgk0qwQMeBMIfR4F3bcfqhJPp2+hDEZc8+LdvCd9jh+f9Z1ej96bn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DuVO6/gh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DuVO6/gh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3E83C4CEE9;
	Wed,  2 Apr 2025 23:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743635601;
	bh=snqshUSLnJbd+v3fb51JH5LHVcFkGZDOPske10wHJPE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DuVO6/ghagQ+JOaEy/DNo+/nEyYFUgtfUzsfPnQrHhwSj+lXZ9UjQvmp3wExDIhX3
	 5WTRnFvxs0QMLKCli5aTUcD9KSrMbeqlnpoasVimHy+mjLB1Pqbc6RSmbDrUjTcKQZ
	 Uo5V6a6n+Cz54gGgW5IBDC6WR29lbrMZLC+0dj69+g8CFJ65nBXs20w1ycC7za/z72
	 +mlvpxXl+3b6h9opD6j7Mid3rdRi1em8M0vAFFRPtUxIFyEB02UR4GRD1UUZzk0DEO
	 XRokv3jgwWJ0ovE5RehrEqNr9FxnpZ+bqjfTQir47WJ15cJxU9sWT0T/PJa9OUUGTE
	 ELtUpVW9BDc9A==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 02 Apr 2025 23:59:38 +0100
Subject: [PATCH 06/10] KVM: arm64: Unconditionally save+flush host
 FPSIMD/SVE/SME state
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-stable-sve-5-15-v1-6-84d0e5ff1102@kernel.org>
References: <20250402-stable-sve-5-15-v1-0-84d0e5ff1102@kernel.org>
In-Reply-To: <20250402-stable-sve-5-15-v1-0-84d0e5ff1102@kernel.org>
To: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Oleg Nesterov <oleg@redhat.com>, Oliver Upton <oliver.upton@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Eric Auger <eauger@redhat.com>, 
 Wilco Dijkstra <wilco.dijkstra@arm.com>, Eric Auger <eric.auger@redhat.com>, 
 Florian Weimer <fweimer@redhat.com>, Fuad Tabba <tabba@google.com>, 
 Jeremy Linton <jeremy.linton@arm.com>, Paolo Bonzini <pbonzini@redhat.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5038; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Ejt+NbeaO37nvme363QMF97yG2cqvt7ZXstCZKzmrH4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBn7cR5wTTqrE8JZeGfHwq6oJBnayWjqWk7He3JmEwg
 F5TvL6+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ+3EeQAKCRAk1otyXVSH0CYCB/
 9kA9vhqMVW86Hs8nEoHBbWl6JzmEE5b+D2WpzNq0s6+hSuuWhLl2yP3yWsItgovbdmroVDFpNSI7AC
 gzo/bVbUDT5PEzJfFBvT1UP1bu14J1vsxiq3ITVMGYWgqfNzU/WNLxXAahPpeF4fEQFtOzNS3Eeoiw
 GOzY5fvvUnw0pD9zRRfQZ23DTV93VF2uhJvJtCakyMXyxcaWQhRtEz9/bUh4JRGk0KwFI/XJyuLH9T
 I8oIF7YHOG3tnH3mzfqtN7RvRsHVdU1K3jwciY3WgfY+eCoBDqIAF+fhWG1qXP3iQU6l3ZQ0NN7fjz
 D1FXZlpxLtnZsI2oLa10iSceJHkJZY
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

From: Mark Rutland <mark.rutland@arm.com>

[ Upstream commit fbc7e61195e23f744814e78524b73b59faa54ab4 ]

There are several problems with the way hyp code lazily saves the host's
FPSIMD/SVE state, including:

* Host SVE being discarded unexpectedly due to inconsistent
  configuration of TIF_SVE and CPACR_ELx.ZEN. This has been seen to
  result in QEMU crashes where SVE is used by memmove(), as reported by
  Eric Auger:

  https://issues.redhat.com/browse/RHEL-68997

* Host SVE state is discarded *after* modification by ptrace, which was an
  unintentional ptrace ABI change introduced with lazy discarding of SVE state.

* The host FPMR value can be discarded when running a non-protected VM,
  where FPMR support is not exposed to a VM, and that VM uses
  FPSIMD/SVE. In these cases the hyp code does not save the host's FPMR
  before unbinding the host's FPSIMD/SVE/SME state, leaving a stale
  value in memory.

Avoid these by eagerly saving and "flushing" the host's FPSIMD/SVE/SME
state when loading a vCPU such that KVM does not need to save any of the
host's FPSIMD/SVE/SME state. For clarity, fpsimd_kvm_prepare() is
removed and the necessary call to fpsimd_save_and_flush_cpu_state() is
placed in kvm_arch_vcpu_load_fp(). As 'fpsimd_state' and 'fpmr_ptr'
should not be used, they are set to NULL; all uses of these will be
removed in subsequent patches.

Historical problems go back at least as far as v5.17, e.g. erroneous
assumptions about TIF_SVE being clear in commit:

  8383741ab2e773a9 ("KVM: arm64: Get rid of host SVE tracking/saving")

... and so this eager save+flush probably needs to be backported to ALL
stable trees.

Fixes: 93ae6b01bafee8fa ("KVM: arm64: Discard any SVE state when entering KVM guests")
Fixes: 8c845e2731041f0f ("arm64/sve: Leave SVE enabled on syscall if we don't context switch")
Fixes: ef3be86021c3bdf3 ("KVM: arm64: Add save/restore support for FPMR")
Reported-by: Eric Auger <eauger@redhat.com>
Reported-by: Wilco Dijkstra <wilco.dijkstra@arm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Tested-by: Mark Brown <broonie@kernel.org>
Tested-by: Eric Auger <eric.auger@redhat.com>
Acked-by: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Florian Weimer <fweimer@redhat.com>
Cc: Fuad Tabba <tabba@google.com>
Cc: Jeremy Linton <jeremy.linton@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
Link: https://lore.kernel.org/r/20250210195226.1215254-2-mark.rutland@arm.com
Signed-off-by: Marc Zyngier <maz@kernel.org>
[ Mark: Handle vcpu/host flag conflict, remove host_data_ptr() ]
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kernel/fpsimd.c | 25 -------------------------
 arch/arm64/kvm/fpsimd.c    | 13 ++++++++++---
 2 files changed, 10 insertions(+), 28 deletions(-)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index e8f10daaa0d7..4be9d9fd4fb7 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1154,31 +1154,6 @@ void fpsimd_signal_preserve_current_state(void)
 		sve_to_fpsimd(current);
 }
 
-/*
- * Called by KVM when entering the guest.
- */
-void fpsimd_kvm_prepare(void)
-{
-	if (!system_supports_sve())
-		return;
-
-	/*
-	 * KVM does not save host SVE state since we can only enter
-	 * the guest from a syscall so the ABI means that only the
-	 * non-saved SVE state needs to be saved.  If we have left
-	 * SVE enabled for performance reasons then update the task
-	 * state to be FPSIMD only.
-	 */
-	get_cpu_fpsimd_context();
-
-	if (test_and_clear_thread_flag(TIF_SVE)) {
-		sve_to_fpsimd(current);
-		current->thread.fp_type = FP_STATE_FPSIMD;
-	}
-
-	put_cpu_fpsimd_context();
-}
-
 /*
  * Associate current's FPSIMD context with this cpu
  * The caller must have ownership of the cpu FPSIMD context before calling
diff --git a/arch/arm64/kvm/fpsimd.c b/arch/arm64/kvm/fpsimd.c
index 2e0f44f4c470..2afa2521bce1 100644
--- a/arch/arm64/kvm/fpsimd.c
+++ b/arch/arm64/kvm/fpsimd.c
@@ -74,9 +74,16 @@ void kvm_arch_vcpu_load_fp(struct kvm_vcpu *vcpu)
 	vcpu->arch.flags &= ~KVM_ARM64_FP_ENABLED;
 	vcpu->arch.flags |= KVM_ARM64_FP_HOST;
 
-	fpsimd_kvm_prepare();
-
-	vcpu->arch.flags &= ~KVM_ARM64_HOST_SVE_ENABLED;
+	/*
+	 * Ensure that any host FPSIMD/SVE/SME state is saved and unbound such
+	 * that the host kernel is responsible for restoring this state upon
+	 * return to userspace, and the hyp code doesn't need to save anything.
+	 *
+	 * When the host may use SME, fpsimd_save_and_flush_cpu_state() ensures
+	 * that PSTATE.{SM,ZA} == {0,0}.
+	 */
+	fpsimd_save_and_flush_cpu_state();
+	vcpu->arch.flags &= ~KVM_ARM64_FP_HOST;
 
 	if (read_sysreg(cpacr_el1) & CPACR_EL1_ZEN_EL0EN)
 		vcpu->arch.flags |= KVM_ARM64_HOST_SVE_ENABLED;

-- 
2.39.5

