Received: from mail-il1-f202.google.com (mail-il1-f202.google.com [209.85.166.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C385022F177
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 19:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748892554; cv=none; b=nk0hTMpWztQRRoqNk7KCEK38WiPx0w3afQSuzjkrrxkqWep4gVbYutGrYkjGTClW/IgqoAuL5Kfc/n8cp+KgaKUPYuznLAWGXBTzLu6Tjzl5HRQnJ1qP6fMDk7Yi7q4DL8aGPfl37dzQBH4b3VLeakz+PXWis7504prjPGzY7do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748892554; c=relaxed/simple;
	bh=gJd6Sg7X96ujBJm4xpL0n0BwR1+EO0NbIRmkP5OmPT4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=V64t5Ar/cKwiPi8cLhGhBzxy7AtGLnZ9VejR2BqZWIVooCPVETnvnC/M/SP1bguddp+oqcetHjTextq+6JP/Ld4y2MFefMbVG6BEge5xAfCLMSrtToxw2IiEq9X39hFeby1V9AmSAUQpyFYOTmHHM3ngyHhutXGGkNxtkTs1NYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jJPoXRM0; arc=none smtp.client-ip=209.85.166.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jJPoXRM0"
Received: by mail-il1-f202.google.com with SMTP id e9e14a558f8ab-3ddb4ed2dcbso9577705ab.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 12:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748892547; x=1749497347; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0IRqT9xxCS8Kun6mHdSmbCCnl/MV3abA8LdyACjVeWc=;
        b=jJPoXRM0BVG9y0DfHxdv7KEUrF7FUc/unmtfGpMvTs5Q6kqBeTVPZoPbnIR/LGtltY
         3VfNLV68uzcmKpShBwZdeIn2nc0horX+isDFPhqunBwvZiJaoT6dBZUDrLwocvRVlxmC
         ypMfInTy3wn4aem+01zskMCLnILW+S58THYyChI4xom4dpABTQcBRUpt5+Xf49g9biyB
         ouoX4teDR0DBhvZdbmSh1zVR6xkbtJsndd/hiq0/ubSiUeyAsIG20zewUG+TVpaK6Me6
         gIaJAis+GHb+NWa73Q2L0M6QhsU2+TUjW8nC9t8lwcz0tMbr5K4X/0sBHrWDLFKcHSd9
         nc6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748892547; x=1749497347;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0IRqT9xxCS8Kun6mHdSmbCCnl/MV3abA8LdyACjVeWc=;
        b=R2011d/YLoJWctMy1OiUk/MzFixq4FKrcOyh93L1GRxKUMmOF2vaiTGQek2fnc0wiY
         2q2b1JyWqSFu8auSMMXWoxUyof/EARPFYaG3BP0Q7vi7TfFoUkgoC0MR6OgQ06w2K08S
         31Z00iXOdethTzyTFE9RlO1mXfNfQdLvLJ9g4FDPW2d5Vvr7GYodzk1QeVQgdrWcUdAI
         WU8mOJkqWpVi5WNku+ltjZpmLpf0NOBddwrWQ2WmQFMoczeJdOURPeOST9o8cjkwQqKT
         bM3htBPakk7Q4AqxOcSOabUFi9b2GwCuX8RFavAaj2u8+CyIrfZ8YpoQihurovYmhyVY
         WwUg==
X-Forwarded-Encrypted: i=1; AJvYcCUZ0irhp5UpNuna0Dk7R3KiKaZ7jk0HxVMrCH45aBktt3Mb0z4K9fV+Fj3WmtsjTU84IRu5Zyn69UCpNdI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrW/b78/4mBfpWHrE96PjXA2bbH6EA6slFEDLoartrlnJf3ZoD
	M1ahcxDwJqU5dk15wvYEP78wtpQcPWkbIPJ0IJMukT5XWgH9ORIGpmrAlJuPwQJvqHNs81QDK4s
	De66LVQLW9DPZgfM/fGkUozfR1w==
X-Google-Smtp-Source: AGHT+IFMVeKyETkycXmBUpASHlOBIqAlJOgdAa/bpyVkcS9jV+S6qkzUphiHGfVK6q8KTzMSYrzDWRGuInC2fMT41A==
X-Received: from ilbbk6.prod.google.com ([2002:a05:6e02:3286:b0:3dd:b580:4100])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:4515:10b0:3dd:b5c6:421f with SMTP id e9e14a558f8ab-3ddb5c642c8mr13690965ab.6.1748892547783;
 Mon, 02 Jun 2025 12:29:07 -0700 (PDT)
Date: Mon,  2 Jun 2025 19:26:55 +0000
In-Reply-To: <20250602192702.2125115-1-coltonlewis@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250602192702.2125115-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250602192702.2125115-11-coltonlewis@google.com>
Subject: [PATCH 10/17] KVM: arm64: Writethrough trapped PMEVTYPER register
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"

With FGT in place, the remaining trapped registers need to be written
through to the underlying physical registers as well as the virtual
ones. Failing to do this means delaying when guest writes take effect.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/sys_regs.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index d368eeb4f88e..afd06400429a 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -18,6 +18,7 @@
 #include <linux/printk.h>
 #include <linux/uaccess.h>
 #include <linux/irqchip/arm-gic-v3.h>
+#include <linux/perf/arm_pmu.h>
 #include <linux/perf/arm_pmuv3.h>
 
 #include <asm/arm_pmuv3.h>
@@ -942,7 +943,11 @@ static bool pmu_counter_idx_valid(struct kvm_vcpu *vcpu, u64 idx)
 {
 	u64 pmcr, val;
 
-	pmcr = kvm_vcpu_read_pmcr(vcpu);
+	if (kvm_vcpu_pmu_is_partitioned(vcpu))
+		pmcr = read_pmcr();
+	else
+		pmcr = kvm_vcpu_read_pmcr(vcpu);
+
 	val = FIELD_GET(ARMV8_PMU_PMCR_N, pmcr);
 	if (idx >= val && idx != ARMV8_PMU_CYCLE_IDX) {
 		kvm_inject_undefined(vcpu);
@@ -1037,6 +1042,22 @@ static bool access_pmu_evcntr(struct kvm_vcpu *vcpu,
 	return true;
 }
 
+static void writethrough_pmevtyper(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
+				   u64 reg, u64 idx)
+{
+	u64 evmask = kvm_pmu_evtyper_mask(vcpu->kvm);
+	u64 val = p->regval & evmask;
+
+	__vcpu_sys_reg(vcpu, reg) = val;
+
+	if (idx == ARMV8_PMU_CYCLE_IDX)
+		write_pmccfiltr(val);
+	else if (idx == ARMV8_PMU_INSTR_IDX)
+		write_pmicfiltr(val);
+	else
+		write_pmevtypern(idx, val);
+}
+
 static bool access_pmu_evtyper(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 			       const struct sys_reg_desc *r)
 {
@@ -1063,7 +1084,9 @@ static bool access_pmu_evtyper(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 	if (!pmu_counter_idx_valid(vcpu, idx))
 		return false;
 
-	if (p->is_write) {
+	if (kvm_vcpu_pmu_is_partitioned(vcpu) && p->is_write) {
+		writethrough_pmevtyper(vcpu, p, reg, idx);
+	} else if (p->is_write) {
 		kvm_pmu_set_counter_event_type(vcpu, p->regval, idx);
 		kvm_vcpu_pmu_restore_guest(vcpu);
 	} else {
-- 
2.49.0.1204.g71687c7c1d-goog

