Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB3C1FBC91
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 23:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743635604; cv=none; b=c/mT/E73urMs1NyMKQ5DkdfR8W0n7aw3tFaj4UALQqSQYw1DCdsEhBkAuo8hMYR3H/Ytnl/8vEwkkRzcxE8KJMaJCyogm1iPd6aHXmS18/ewagumsSUBDwsFrc1R1lFk3LTWTrZX3cXiCV6+V9p+zf+xNzJBjFi7WHDwpSt8DPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743635604; c=relaxed/simple;
	bh=e9qvF2o7uVNtfQASnyy4CdQbnEmB3uPMMDe207tDMbc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qeVcN3DYtJA180ktQAmxF6wntQRo89QFw0hwNiL0cCr2FYMs88kYK9cK4rW+CMBSci2FxLPy9PGd8Mz8o8jc6dfeJmSxEa3+SsJz3+W/7TkygK0mv/UQWfJomhCqjhZPT40XR+DTZXlNjgYGioYKKxTQk94L4zNbY/FNsYp7d5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fztfd1x/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fztfd1x/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79A06C4CEDD;
	Wed,  2 Apr 2025 23:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743635603;
	bh=e9qvF2o7uVNtfQASnyy4CdQbnEmB3uPMMDe207tDMbc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Fztfd1x/wVzBdqaRol8+VqBw8dm+ZBsdLd/dWg7xC9Nx2NxsSA6YtwWB78w5kAQ4q
	 T5UR65LsoKxbnRT2E7TQ2q+6q6xLgUunfaDAEucVzzLqmD1+HlHzjtzdTKm94eGLuU
	 pRhX25bw+z/qgWlSkhW9o3au9ZIAIgotcR1QgZvgFRFLx6dHfLNcBBTh2ro7VEj6Dn
	 x6dO3nKyIDLE1xrK6O1yg/qLZt0eoWbubNvKSnGm8CXIvrgg4FdyTWGJr0MyY2n2FG
	 rnZOxqrCfN/VfmHLTD6ALT4w0hPJ9WEGOMoL1Dx0qIhzLtkwC55h/0ed9dMLy+Vc6j
	 FQhkrTph9gqtw==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 02 Apr 2025 23:59:39 +0100
Subject: [PATCH 07/10] KVM: arm64: Remove host FPSIMD saving for
 non-protected KVM
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-stable-sve-5-15-v1-7-84d0e5ff1102@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2943; i=broonie@kernel.org;
 h=from:subject:message-id; bh=IYSm9LOHiakFHli8QpJhz4RyCAaedNNXODj93c0ElHY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBn7cR6CaBze9XGCWVbrXtnDajTUWVJQSWrhg38d7eh
 NqyV1MmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ+3EegAKCRAk1otyXVSH0PRmB/
 97IvqGTk1Dcp9rBYA25dZJgcA4cv3dsRfK90xQnmIz0LuF2e6ujhg0lk+w3OlE7fZ1V4lUThD265q9
 +Z/CMI+gq23oq9L7jENaOfrFNNCuaszGR/s8RGf7oxpLx3qMgmT3h6o64j76oNpcgeIr84KWWmbkjA
 Wd6OirQymsBxPVh6E7Qso0fbXdvMKLFsRB0cvAgLuMzsFzwSQIt/XRAQr9a327dTt0dKlxJGDC8coH
 /OGWzE7j5awQFd664L0Rvbo7nxoUuAIiPr/9OUCobDoBqez+OLEIs5wT1+WzZ4+cT4jQErIGX2MJfV
 KubfuHJ8RbIMEGpEc3sfjuk16L0OnB
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

From: Mark Rutland <mark.rutland@arm.com>

[ Upstream commit 8eca7f6d5100b6997df4f532090bc3f7e0203bef ]

Now that the host eagerly saves its own FPSIMD/SVE/SME state,
non-protected KVM never needs to save the host FPSIMD/SVE/SME state,
and the code to do this is never used. Protected KVM still needs to
save/restore the host FPSIMD/SVE state to avoid leaking guest state to
the host (and to avoid revealing to the host whether the guest used
FPSIMD/SVE/SME), and that code needs to be retained.

Remove the unused code and data structures.

To avoid the need for a stub copy of kvm_hyp_save_fpsimd_host() in the
VHE hyp code, the nVHE/hVHE version is moved into the shared switch
header, where it is only invoked when KVM is in protected mode.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Tested-by: Mark Brown <broonie@kernel.org>
Acked-by: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
Link: https://lore.kernel.org/r/20250210195226.1215254-3-mark.rutland@arm.com
Signed-off-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h       | 1 -
 arch/arm64/kvm/fpsimd.c                 | 1 -
 arch/arm64/kvm/hyp/include/hyp/switch.h | 6 +-----
 3 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index ecae31b0dab3..06e8d4645ecd 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -333,7 +333,6 @@ struct kvm_vcpu_arch {
 	struct kvm_guest_debug_arch external_debug_state;
 
 	struct thread_info *host_thread_info;	/* hyp VA */
-	struct user_fpsimd_state *host_fpsimd_state;	/* hyp VA */
 
 	struct {
 		/* {Break,watch}point registers */
diff --git a/arch/arm64/kvm/fpsimd.c b/arch/arm64/kvm/fpsimd.c
index 2afa2521bce1..1ef9d6cb91ee 100644
--- a/arch/arm64/kvm/fpsimd.c
+++ b/arch/arm64/kvm/fpsimd.c
@@ -55,7 +55,6 @@ int kvm_arch_vcpu_run_map_fp(struct kvm_vcpu *vcpu)
 	}
 
 	vcpu->arch.host_thread_info = kern_hyp_va(ti);
-	vcpu->arch.host_fpsimd_state = kern_hyp_va(fpsimd);
 error:
 	return ret;
 }
diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index 269ec3587210..cc102e46b0e2 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -251,11 +251,7 @@ static inline bool __hyp_handle_fpsimd(struct kvm_vcpu *vcpu)
 	}
 	isb();
 
-	if (vcpu->arch.flags & KVM_ARM64_FP_HOST) {
-		__fpsimd_save_state(vcpu->arch.host_fpsimd_state);
-		vcpu->arch.flags &= ~KVM_ARM64_FP_HOST;
-	}
-
+	/* Restore the guest state */
 	if (sve_guest)
 		__hyp_sve_restore_guest(vcpu);
 	else

-- 
2.39.5

