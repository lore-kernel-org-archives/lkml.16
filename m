Received: from mail-il1-f202.google.com (mail-il1-f202.google.com [209.85.166.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47B82FD896
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 20:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750968379; cv=none; b=eI20vfGrBwPwfEgxvGl7spmBuhjhDRfETyjlhjqzu8SmpD4XcSgBJ28IUgf1cMU6pElDFdNX2XU/KZxgqt1wMBsT4/Tm0GmJlh+HsQ9OJWgq4rHBUF5nwV6fsHWCAzjPyUj7TJPnnPJMQRLu7tr97R/Zhrz0xxrhAEDK5E7HMuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750968379; c=relaxed/simple;
	bh=gH+Yd1mzVo9y7Dr3+Hxk8fddtdVh8GqAqskRlpwY6xU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ulXBLBncqBm1Ls2kxVEzKBiG5EGBLUzgSDqB7cJIxu7ioCDkwMBq5bWocDTKNm2xVauzvWAsbVoN/pvY09Nol6v7dRnJejIQJSXOE40osS+o7pUQGUzX4DP4mh5PAtAVDcvWO5C8XS0NZn3EYCUFm/SnJlanGRdZ89XYiC1t/2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XbEtBbxr; arc=none smtp.client-ip=209.85.166.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XbEtBbxr"
Received: by mail-il1-f202.google.com with SMTP id e9e14a558f8ab-3ddc0a6d4bdso17350525ab.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 13:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750968372; x=1751573172; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ai9/sepaJ5XVOCTHqXQnbqMQb7WUqdqFh88LxqpgeeM=;
        b=XbEtBbxrk8G0itMu4AxXxhJJrIOyP6ZFUEEqGx5SKDlIWdT5LX+bE5fVGWmi9TiXxP
         iklyJBAQhesnjI4kwameANIoYix4kjytwAhJ1zqSlmiclrtzDHSOHFhPaM1kFw9G4s1u
         2d1/QpucTiRh1rT1wnbctZYhsGFozHQyven0ZUSI/wYozuaBVLjh880k+I4zyzoitoBZ
         oFpcaLAhGlXGoB2FbqskYjjQ2R+7jLn6QPAqgQGkPbWbhCdQoRoc44Byo+KKRAA3gngE
         9hkGmHRypRPabwbw+1eiP1Zl+2GewJU+i9zal6QYFgbPhA7Iw1JlQyluaeizTENO9wuZ
         Wp5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750968372; x=1751573172;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ai9/sepaJ5XVOCTHqXQnbqMQb7WUqdqFh88LxqpgeeM=;
        b=mf//DBjKO39Au9mC6+3oEj5U1IEIS8Tjuu6ZSSYAr54HmS2bU5/OElF9B6ucpw2ZS9
         ijEK0nK39bsXrWlvC7JMcPmzg6nwqZZvjjpaOa8sESllnXx/Sh4wMrfbBXpEzlRgQ+Vs
         lBENxnisgigl/MOV0W0AdStFhF/Z8CQzCbONBKjPpnvCeGzKhEVUziB115eNqqMgJBEo
         XsYZ+eqSwFtZOCSnG/wySToM+K0QWugUN49Z/4xwg3sLdBTeLvqGiFsPw+VA3VN8rXdi
         lKp5a1goPOgdDzn+Wo0Loeq5F68qtmZlmsNu2iJf2Yn3Xke+SOuFSgWwi+wMIsfb3p5g
         cXKw==
X-Forwarded-Encrypted: i=1; AJvYcCXehn6p+tM2Y3rBgMpdCfq9PlKgVghfpNgPT8Tc1pNOiSqPvXD4L9hZxSIBE70WVUeHBZndVeX6z87T98Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyYWLSubCDz0BRR52iqyE2TImLkjhZmZITqG/xlH3BQEq8oegx
	tDrt+iy79fjh13L9/koqJ0Riw3Z3mF2Z7x5jSTJvWoXUi9BYVpnEOKIfxT8USJyVnIS2XaCttyu
	xS+U792wuh3K/7Zik+KnJQZkckw==
X-Google-Smtp-Source: AGHT+IHMxVNZWApbptZpNTBCT5d8XSjlwqRmfTyoWU26w+gUqtg0TL1VrqiKQldGVuUwisWThSdEUMcZDgoysCsEWA==
X-Received: from ilos8.prod.google.com ([2002:a92:cb08:0:b0:3db:8374:9a74])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:1c04:b0:3dc:7cc1:b731 with SMTP id e9e14a558f8ab-3df4aacec3amr12947595ab.0.1750968372540;
 Thu, 26 Jun 2025 13:06:12 -0700 (PDT)
Date: Thu, 26 Jun 2025 20:04:56 +0000
In-Reply-To: <20250626200459.1153955-1-coltonlewis@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250626200459.1153955-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250626200459.1153955-21-coltonlewis@google.com>
Subject: [PATCH v3 20/22] KVM: arm64: Inject recorded guest interrupts
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"

When we re-enter the VM after handling a PMU interrupt, calculate
whether it was any of the guest counters that overflowed and inject an
interrupt into the guest if so.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/include/asm/kvm_pmu.h |  2 ++
 arch/arm64/kvm/pmu-emul.c        |  4 ++--
 arch/arm64/kvm/pmu-part.c        | 22 +++++++++++++++++++++-
 arch/arm64/kvm/pmu.c             |  6 +++++-
 4 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pmu.h b/arch/arm64/include/asm/kvm_pmu.h
index 03e3bd318e4b..d047def897bc 100644
--- a/arch/arm64/include/asm/kvm_pmu.h
+++ b/arch/arm64/include/asm/kvm_pmu.h
@@ -86,6 +86,8 @@ bool pmu_access_el0_disabled(struct kvm_vcpu *vcpu);
 void kvm_vcpu_pmu_restore_guest(struct kvm_vcpu *vcpu);
 void kvm_vcpu_pmu_restore_host(struct kvm_vcpu *vcpu);
 void kvm_vcpu_pmu_resync_el0(void);
+bool kvm_pmu_emul_overflow_status(struct kvm_vcpu *vcpu);
+bool kvm_pmu_part_overflow_status(struct kvm_vcpu *vcpu);
 
 #define kvm_vcpu_has_pmu(vcpu)					\
 	(vcpu_has_feature(vcpu, KVM_ARM_VCPU_PMU_V3))
diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index bcaa9f7a8ca2..6f41fc3e3f74 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -268,7 +268,7 @@ void kvm_pmu_reprogram_counter_mask(struct kvm_vcpu *vcpu, u64 val)
  * counter where the values of the global enable control, PMOVSSET_EL0[n], and
  * PMINTENSET_EL1[n] are all 1.
  */
-bool kvm_pmu_overflow_status(struct kvm_vcpu *vcpu)
+bool kvm_pmu_emul_overflow_status(struct kvm_vcpu *vcpu)
 {
 	u64 reg = __vcpu_sys_reg(vcpu, PMOVSSET_EL0);
 
@@ -405,7 +405,7 @@ static void kvm_pmu_perf_overflow(struct perf_event *perf_event,
 		kvm_pmu_counter_increment(vcpu, BIT(idx + 1),
 					  ARMV8_PMUV3_PERFCTR_CHAIN);
 
-	if (kvm_pmu_overflow_status(vcpu)) {
+	if (kvm_pmu_emul_overflow_status(vcpu)) {
 		kvm_make_request(KVM_REQ_IRQ_PENDING, vcpu);
 
 		if (!in_nmi())
diff --git a/arch/arm64/kvm/pmu-part.c b/arch/arm64/kvm/pmu-part.c
index bd04c37b19b9..165d1eae2634 100644
--- a/arch/arm64/kvm/pmu-part.c
+++ b/arch/arm64/kvm/pmu-part.c
@@ -279,7 +279,7 @@ void kvm_pmu_load(struct kvm_vcpu *vcpu)
 	write_pmcr(val);
 
 	/*
-	 * Loading these registers is tricky because of
+	 * Loading these registers is more intricate because of
 	 * 1. Applying only the bits for guest counters (indicated by mask)
 	 * 2. Setting and clearing are different registers
 	 */
@@ -355,3 +355,23 @@ void kvm_pmu_handle_guest_irq(u64 govf)
 
 	__vcpu_rmw_sys_reg(vcpu, PMOVSSET_EL0, |=, govf);
 }
+
+/**
+ * kvm_pmu_part_overflow_status() - Determine if any guest counters have overflowed
+ * @vcpu: Ponter to struct kvm_vcpu
+ *
+ * Determine if any guest counters have overflowed and therefore an
+ * IRQ needs to be injected into the guest.
+ *
+ * Return: True if there was an overflow, false otherwise
+ */
+bool kvm_pmu_part_overflow_status(struct kvm_vcpu *vcpu)
+{
+	struct arm_pmu *pmu = vcpu->kvm->arch.arm_pmu;
+	u64 mask = kvm_pmu_guest_counter_mask(pmu);
+	u64 pmovs = __vcpu_sys_reg(vcpu, PMOVSSET_EL0);
+	u64 pmint = read_pmintenset();
+	u64 pmcr = read_pmcr();
+
+	return (pmcr & ARMV8_PMU_PMCR_E) && (mask & pmovs & pmint);
+}
diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
index 9469f1e0a0b6..6ab0d23f9251 100644
--- a/arch/arm64/kvm/pmu.c
+++ b/arch/arm64/kvm/pmu.c
@@ -407,7 +407,11 @@ static void kvm_pmu_update_state(struct kvm_vcpu *vcpu)
 	struct kvm_pmu *pmu = &vcpu->arch.pmu;
 	bool overflow;
 
-	overflow = kvm_pmu_overflow_status(vcpu);
+	if (kvm_vcpu_pmu_is_partitioned(vcpu))
+		overflow = kvm_pmu_part_overflow_status(vcpu);
+	else
+		overflow = kvm_pmu_emul_overflow_status(vcpu);
+
 	if (pmu->irq_level == overflow)
 		return;
 
-- 
2.50.0.727.gbf7dc18ff4-goog

