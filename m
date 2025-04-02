Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517291F869E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 23:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743635590; cv=none; b=CLJ6qD1M9NxE3Zhd8OSrtCSIfLxY89a2kRKuShJSlnYZHfv2KeYaTmfZvP6orDF81a7s74l44j2/WvjuRxWIjq2ShrUQcc0WF1/buBquk/pn8dCOCQcZHJt6IaLl2AshbAWsOeVmj6tMWyJth7/zyEjeTjXvMEjrEpcX9c7dAzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743635590; c=relaxed/simple;
	bh=3I3JV/ck2QZ+DL7hhJF3NDc5SpXrkme3Nu2RxTmLX10=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eabWZswRJfaix+ETqZuZUE0X56BA91PbwgHCDzTbzj7HpWgNUUkdfM/IWUHC5qLIoDr/sAy6gSsxztcHZT9208WgK9t4qqgbyEnPYlKy1aGWtRFFoLIhYkXD+pylm2heV5KEDWFnXhkJvAXwoAUiU7UWer0OElAeiNlyrmf3E7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C5Q7RurP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C5Q7RurP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A83D6C4CEE7;
	Wed,  2 Apr 2025 23:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743635589;
	bh=3I3JV/ck2QZ+DL7hhJF3NDc5SpXrkme3Nu2RxTmLX10=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=C5Q7RurPuQ/Iws/ekeAahdsMeeMBJnc42uWZ6PXPB4WRHRV5ssxwNdxpdp0KacOJi
	 LSwfwzD1wNUeiTV4VCJMJLAZlRn6SzBeSVkJd4mbWU2sMA02SH28ti2F8Z7V1bOJZN
	 somtlWhAjDyHPiumcGPBaJ/T0zvDnb8z+VIyk59U9XzbEC2Usq7aXPzWt2GBY2Es+T
	 4/uk8Z5YvUkUz03DSe7OlUnqgGhY24xDH8exjOjkzAB7QniTnbhKu3TiQJZC/4eSXJ
	 2A9S2Eml+kRaN1qo5ldS7wkU3IuhmU09ACHRtVlhDoICr1UStRj87DR7lRYfojq23n
	 +pdV22vI+N3NQ==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 02 Apr 2025 23:59:34 +0100
Subject: [PATCH 02/10] KVM: arm64: Discard any SVE state when entering KVM
 guests
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-stable-sve-5-15-v1-2-84d0e5ff1102@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3563; i=broonie@kernel.org;
 h=from:subject:message-id; bh=3I3JV/ck2QZ+DL7hhJF3NDc5SpXrkme3Nu2RxTmLX10=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBn7cR2G5VhYf+YEH1QYMSLj8ZIx0dtGarjOr9cKLtg
 hyLXcwCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ+3EdgAKCRAk1otyXVSH0IYMB/
 97CjFbi/WBQQWNBsACXWr8HNevnExny9dDVhXj9hvpZmFu9W8mEv6on9ZZYIP8hdWbzIEmYNP9yNc3
 tg7Xj1D47T6YdYrVbKYbUL4VERrMAY+hQEZkidIG8eKrnFofm74DMK8oS/3GYx/w1Yg1w7dHekRVou
 Am/U1JWd+GxmxwwtPQ+xoOhAZlUYaekdGpmGeduBfSHJrgcnnC6trrD/MrGeT8GsPq7k7/Bnkwrwom
 PYmwvKTkXL0Z/u4bF0aZPJCJvNcTmvZ2Obf01sEsj6wpUe92GA+7ouyrdTBIku+TTS8jOPBnjHeJJQ
 0x3MSRzLRMO1TdCMzpxWoKY/TbHNI6
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

[ Upstream commit 93ae6b01bafee8fa385aa25ee7ebdb40057f6abe ]

Since 8383741ab2e773a99 (KVM: arm64: Get rid of host SVE tracking/saving)
KVM has not tracked the host SVE state, relying on the fact that we
currently disable SVE whenever we perform a syscall. This may not be true
in future since performance optimisation may result in us keeping SVE
enabled in order to avoid needing to take access traps to reenable it.
Handle this by clearing TIF_SVE and converting the stored task state to
FPSIMD format when preparing to run the guest.  This is done with a new
call fpsimd_kvm_prepare() to keep the direct state manipulation
functions internal to fpsimd.c.

Signed-off-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Link: https://lore.kernel.org/r/20221115094640.112848-2-broonie@kernel.org
Signed-off-by: Will Deacon <will@kernel.org>
[ Mark: trivial backport to v6.1 ]
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/fpsimd.h |  1 +
 arch/arm64/kernel/fpsimd.c      | 23 +++++++++++++++++++++++
 arch/arm64/kvm/fpsimd.c         |  5 ++++-
 3 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/fpsimd.h b/arch/arm64/include/asm/fpsimd.h
index 9a62884183e5..f7faf0f4507c 100644
--- a/arch/arm64/include/asm/fpsimd.h
+++ b/arch/arm64/include/asm/fpsimd.h
@@ -44,6 +44,7 @@ extern void fpsimd_signal_preserve_current_state(void);
 extern void fpsimd_preserve_current_state(void);
 extern void fpsimd_restore_current_state(void);
 extern void fpsimd_update_current_state(struct user_fpsimd_state const *state);
+extern void fpsimd_kvm_prepare(void);
 
 extern void fpsimd_bind_state_to_cpu(struct user_fpsimd_state *state,
 				     void *sve_state, unsigned int sve_vl);
diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index e22571e57ae1..57e89361edcb 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1108,6 +1108,29 @@ void fpsimd_signal_preserve_current_state(void)
 		sve_to_fpsimd(current);
 }
 
+/*
+ * Called by KVM when entering the guest.
+ */
+void fpsimd_kvm_prepare(void)
+{
+	if (!system_supports_sve())
+		return;
+
+	/*
+	 * KVM does not save host SVE state since we can only enter
+	 * the guest from a syscall so the ABI means that only the
+	 * non-saved SVE state needs to be saved.  If we have left
+	 * SVE enabled for performance reasons then update the task
+	 * state to be FPSIMD only.
+	 */
+	get_cpu_fpsimd_context();
+
+	if (test_and_clear_thread_flag(TIF_SVE))
+		sve_to_fpsimd(current);
+
+	put_cpu_fpsimd_context();
+}
+
 /*
  * Associate current's FPSIMD context with this cpu
  * The caller must have ownership of the cpu FPSIMD context before calling
diff --git a/arch/arm64/kvm/fpsimd.c b/arch/arm64/kvm/fpsimd.c
index 2d15e1d6e214..16e29f03dcbf 100644
--- a/arch/arm64/kvm/fpsimd.c
+++ b/arch/arm64/kvm/fpsimd.c
@@ -70,11 +70,14 @@ int kvm_arch_vcpu_run_map_fp(struct kvm_vcpu *vcpu)
 void kvm_arch_vcpu_load_fp(struct kvm_vcpu *vcpu)
 {
 	BUG_ON(!current->mm);
-	BUG_ON(test_thread_flag(TIF_SVE));
 
 	vcpu->arch.flags &= ~KVM_ARM64_FP_ENABLED;
 	vcpu->arch.flags |= KVM_ARM64_FP_HOST;
 
+	fpsimd_kvm_prepare();
+
+	vcpu->arch.flags &= ~KVM_ARM64_HOST_SVE_ENABLED;
+
 	if (read_sysreg(cpacr_el1) & CPACR_EL1_ZEN_EL0EN)
 		vcpu->arch.flags |= KVM_ARM64_HOST_SVE_ENABLED;
 }

-- 
2.39.5

