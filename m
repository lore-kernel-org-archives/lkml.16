Received: from mail-io1-f74.google.com (mail-io1-f74.google.com [209.85.166.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFA52F5300
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 20:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750968367; cv=none; b=OszHPearEKuuT5v/qZNzVRNGHeg7hBn2DMXcwsR+4BI5Tkh/jQ2s/OdnkbFh7ZjoIs9Bhah4fS7dwD4Hwbb4F68GOKXAyIY3ieYKakaEGx4m8rjqvskeAAMoX792xO/pS6u1gY/bnayg0hbptWRDuxKEnDVtbmyGD7jVsO+GPWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750968367; c=relaxed/simple;
	bh=OXBsuzgQqKeH4go9scl3J2sCFEoZvJBcvtYLhQxD4UM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=e59sC5FsBjnoz3Q1OJ7zaqY5WN+RZ32z808hU5zfLlVCNL3oM6lKnZiOrVGrQJNWJNPRKI88QmHLTgYx8MNJjekGN8u8gP37B0djTjyrnSELOWbQJF0lnb9OrX/865IfOyot2jZg4J8cUYV+Im5s0pMz6gQE5DfaETu+wlYG5ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1X+FQOqf; arc=none smtp.client-ip=209.85.166.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1X+FQOqf"
Received: by mail-io1-f74.google.com with SMTP id ca18e2360f4ac-86cfccca327so228072439f.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 13:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750968363; x=1751573163; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OjcjVqcT3PfYTwjN9wXAnWmKWncB0aK3QVDv0kRYNAs=;
        b=1X+FQOqfKvgouuPXQVl+pSvQ/7A9Od9j6N10ykxLJCJwVmnko+4ZHI24nK2V4iKPQj
         1WY2cJIguxoDOmBNP7XKVnPzikBB2PZKAKMPzAAPTJId9tUxEoHholjI1RHRbKXRTFDl
         8LQSYpTnaOb4A4+kpDq8Op9vxx7E97aXBErgQ3pY/E8gPuSvXPj3CP5ZOup0+4QAM9V4
         GcTUE06AW7tQuM1uWiouBQ+eGDJDML0OzhDpF/iXQpXlfxgVI3NBamH1C79DBumJIrXn
         5BRcHDfOjMogsin6EnQXvGAZEa424Ecp7lyISmO8enY0ORanJGAbKoH6gpp3IlpYu0Z1
         rMdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750968363; x=1751573163;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OjcjVqcT3PfYTwjN9wXAnWmKWncB0aK3QVDv0kRYNAs=;
        b=D2yXm9UhVUzenyza8z9TMeDFLBZxGsJJzD5xwaF7NIOr9b/Zsd1h7ky4BAuZMd0tMD
         FqPwSyY8I1np2kiNVX+UFjizUEz9Ocx6aRka6tZGOgrD4JBtNxtamAzoleIL/plAwYOD
         ZCX0Hl6cEOE69Lj6WA6+VNvXg+NnLDKZiLMET4sPlc4JViR4SRotPY3gbGoKb9mNbkIb
         QE0XUWB9/gyQBXFeANE4xZsvspfBR47YFjUypobeWdEY09+1wkfX4O0RRGMKAU5ttJGI
         3mO/9VSj1QUfp36VEJiuTB6G6vugCPL8XDoorqZAMGm2XKJIzgF136/CKbLqCecWLZGm
         vnGA==
X-Forwarded-Encrypted: i=1; AJvYcCUFZEMtCs5URP1929duo0B8m0jGl+OPm0gj22KKuh7b+GjAjalnGyYHzCFNob6KvYkBwg3etI+mQcIqsRY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNqkDWyyQ9rK8Cdsf05p0BncbtvBeJ4Zdgsa9iWMh2jvSMqfwl
	tUWfh/NKM6VtEXXt8duvR4FC1YSXLmq0F+s+1uGrgXWF0OfwHXuFIymx+ibXgjLdYCpEgXC95il
	O1+SGyYhx5hIgjWMJLdIKJEbD5w==
X-Google-Smtp-Source: AGHT+IFUddqpSua+e1bwkQXI4ID0eoYsJI6Flt9aCdAiBQPdjrY96T7W5A1qLJU1ATtwnMWwgss2F2B6rdL1cwzbcQ==
X-Received: from ilbec6.prod.google.com ([2002:a05:6e02:4706:b0:3df:16fc:af6f])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:1c03:b0:3df:3464:ab86 with SMTP id e9e14a558f8ab-3df4ab61d98mr11788385ab.9.1750968362685;
 Thu, 26 Jun 2025 13:06:02 -0700 (PDT)
Date: Thu, 26 Jun 2025 20:04:47 +0000
In-Reply-To: <20250626200459.1153955-1-coltonlewis@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250626200459.1153955-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250626200459.1153955-12-coltonlewis@google.com>
Subject: [PATCH v3 11/22] KVM: arm64: Writethrough trapped PMEVTYPER register
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

With FGT in place, the remaining trapped registers need to be written
through to the underlying physical registers as well as the virtual
ones. Failing to do this means delaying when guest writes take effect.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/sys_regs.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index eaff6d63ef77..49e8e3dcd306 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -18,6 +18,7 @@
 #include <linux/printk.h>
 #include <linux/uaccess.h>
 #include <linux/irqchip/arm-gic-v3.h>
+#include <linux/perf/arm_pmu.h>
 #include <linux/perf/arm_pmuv3.h>
 
 #include <asm/arm_pmuv3.h>
@@ -1037,6 +1038,30 @@ static bool access_pmu_evcntr(struct kvm_vcpu *vcpu,
 	return true;
 }
 
+static bool writethrough_pmevtyper(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
+				   u64 reg, u64 idx)
+{
+	u64 eventsel;
+
+	if (idx == ARMV8_PMU_CYCLE_IDX)
+		eventsel = ARMV8_PMUV3_PERFCTR_CPU_CYCLES;
+	else
+		eventsel = p->regval & kvm_pmu_evtyper_mask(vcpu->kvm);
+
+	if (vcpu->kvm->arch.pmu_filter &&
+	    !test_bit(eventsel, vcpu->kvm->arch.pmu_filter))
+		return false;
+
+	__vcpu_assign_sys_reg(vcpu, reg, eventsel);
+
+	if (idx == ARMV8_PMU_CYCLE_IDX)
+		write_pmccfiltr(eventsel);
+	else
+		write_pmevtypern(idx, eventsel);
+
+	return true;
+}
+
 static bool access_pmu_evtyper(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 			       const struct sys_reg_desc *r)
 {
@@ -1063,7 +1088,9 @@ static bool access_pmu_evtyper(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
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
2.50.0.727.gbf7dc18ff4-goog

