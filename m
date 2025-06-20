Received: from mail-il1-f201.google.com (mail-il1-f201.google.com [209.85.166.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D49258CD3
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 22:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750457942; cv=none; b=ncdDuvJxpEUSuo/FSrlcAbWQ36/EwqjipmuvXEzSWXBQZI2XeMMTn2Pe0tu5wDJoSaL0wNpbOxQ7VxIC9OJ2GtSJtYC6qIMrRLfZLmu8UUdSTpoJQ2qGgFH0PQb4j4Uw+fvw5aKHPbgPUqUuULMTc+ipVW/fO3xjaDAQcsz0riM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750457942; c=relaxed/simple;
	bh=yMGaPG1CZQkU3Bq8XdwQsHNu1kFzSYzZgl5dA+p/rKk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sqM5uFjhS7bM9Nq9DK6sQqi+tFPceymrEwhy/sU/3Uq8P2aX+osOLJMkW3RONA2K8TqWfU7epTeRbnA6OoCgBHuVgrfWFsRyJHp0GTTSUNzP2vhH7nwzZb3OMUal6s4xxdsc621ajqQyXP701xXXqQfvwKwsFH/kUtXQPT/wYUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4L05MAEd; arc=none smtp.client-ip=209.85.166.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4L05MAEd"
Received: by mail-il1-f201.google.com with SMTP id e9e14a558f8ab-3ddd045bb28so21159155ab.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750457937; x=1751062737; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=evXfKUBhSeG+2oly7f+qnRnfAE1yqFxCmvksu6Guakw=;
        b=4L05MAEd9mBEL8yU95i3IBx5kciKhcXWgeqgGyv2qKblvATzu89jWtccYMwybuTNrP
         0Y7cMvGjd84bgA7H5wLSrdeiKjLIFiwDCC76vAZnTdewMhsMtq2nYkpbxlit3rO0q7z0
         ixy8Vras9MBVijExVSrgLBCrQwZUetK1jdLA+97kzLfvH/m0HaK55r/aeNmfKwDqE3M3
         WzZq5KNsqEWlDSlCetxInka78F/jj2l48XZhH7cE2dcczPgHWXQTQ3Jtpohk4ceNA/z2
         NNw9Jdu3q+UybwkiwEcdEEvy9FCpEndbxye4hnfInlBmncJwTdvhpDXLUWQaJ0m1ecVp
         DAlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750457937; x=1751062737;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=evXfKUBhSeG+2oly7f+qnRnfAE1yqFxCmvksu6Guakw=;
        b=XE4ZfJ3VSb/DMU8/lMsw40hGfyw6mvoErom2k0gLiqDeP0dJt1EyEgPdVA/W9EoOV3
         uVrhk0yM65k2CiljiZXIUWJhE68JM3O5Fh3R1Q/8JDP/IGtsBYfHBXIQQZMSxirs4uj9
         BxnyEibxebaaaHWCZWLtRy7tp7bRC2uTks1eWOkO58ffk95tkWIO8zKfuafCdzY7Vduy
         louBHVZ+vvsv4J0L7eu0Fu9Fi89PPV0H/eSvkfe6UJCarVCdYDlHkEw9x3jhjBGLqRIv
         AU1fvx3ChT68xDSFhRgzgpz4vS7IBCZWbqreb7tPDosJAHARJl0AyJ1KWwRIqMRHPnLd
         KdIA==
X-Forwarded-Encrypted: i=1; AJvYcCVs7H0+zbBt1CA8JinOr10ny+q3WuAC+sl5eknBxwNM1v4ONcaLr+U+OcvlgCGMeDGdLLi3/Utc8yhRaz0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yye6Knf12r7SPYQ8dcG17P/V2+R3+zZpHxeChc7CoDQNQsnuLhW
	7mthEG6Or8qI2hHgdxbHukoO75oBWWbLjUe4rfolkC4ftXU1pzVxmLHy02w38z+e2/E0Mt6uCUV
	brJi6g4NqqQpJSZQHVwuc2m2h7g==
X-Google-Smtp-Source: AGHT+IFQNwOuHEkKN7g4qywdhJQMH3Ei639Gg+Rq7B3OB/2GxQkU/gqG6/aq0ZsCLexdUvss75SIoe73NPnJzqeZ9A==
X-Received: from ilue6.prod.google.com ([2002:a05:6e02:b26:b0:3dd:b662:5c3b])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:1a4f:b0:3dd:bb7e:f1af with SMTP id e9e14a558f8ab-3de38cdcc11mr49042745ab.20.1750457937447;
 Fri, 20 Jun 2025 15:18:57 -0700 (PDT)
Date: Fri, 20 Jun 2025 22:13:20 +0000
In-Reply-To: <20250620221326.1261128-1-coltonlewis@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250620221326.1261128-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Message-ID: <20250620221326.1261128-21-coltonlewis@google.com>
Subject: [PATCH v2 19/23] KVM: arm64: Enforce PMU event filter at vcpu_load()
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

The KVM API for event filtering says that counters do not count when
blocked by the event filter. To enforce that, the event filter must be
rechecked on every load. If the event is filtered, exclude counting at
all exception levels before writing the hardware.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/pmu-part.c | 43 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/kvm/pmu-part.c b/arch/arm64/kvm/pmu-part.c
index 19bd6e0da222..fd19a1dd7901 100644
--- a/arch/arm64/kvm/pmu-part.c
+++ b/arch/arm64/kvm/pmu-part.c
@@ -177,6 +177,47 @@ u8 kvm_pmu_hpmn(struct kvm_vcpu *vcpu)
 	return hpmn;
 }
 
+/**
+ * kvm_pmu_apply_event_filter()
+ * @vcpu: Pointer to vcpu struct
+ *
+ * To uphold the guarantee of the KVM PMU event filter, we must ensure
+ * no counter counts if the event is filtered. Accomplish this by
+ * filtering all exception levels if the event is filtered.
+ */
+static void kvm_pmu_apply_event_filter(struct kvm_vcpu *vcpu)
+{
+	struct arm_pmu *pmu = vcpu->kvm->arch.arm_pmu;
+	u64 evtyper_set = kvm_pmu_evtyper_mask(vcpu->kvm)
+		& ~kvm_pmu_event_mask(vcpu->kvm)
+		& ~ARMV8_PMU_INCLUDE_EL2;
+	u64 evtyper_clr = ARMV8_PMU_INCLUDE_EL2;
+	u8 i;
+	u64 val;
+
+	for (i = 0; i < pmu->hpmn_max; i++) {
+		val = __vcpu_sys_reg(vcpu, PMEVTYPER0_EL0 + i);
+
+		if (vcpu->kvm->arch.pmu_filter &&
+		    !test_bit(val, vcpu->kvm->arch.pmu_filter)) {
+			val |= evtyper_set;
+			val &= ~evtyper_clr;
+		}
+
+		write_pmevtypern(i, val);
+	}
+
+	val = __vcpu_sys_reg(vcpu, PMCCFILTR_EL0);
+
+	if (vcpu->kvm->arch.pmu_filter &&
+	    !test_bit(ARMV8_PMUV3_PERFCTR_CPU_CYCLES, vcpu->kvm->arch.pmu_filter)) {
+		val |= evtyper_set;
+		val &= ~evtyper_clr;
+	}
+
+	write_pmccfiltr(val);
+}
+
 /**
  * kvm_pmu_load() - Load untrapped PMU registers
  * @vcpu: Pointer to struct kvm_vcpu
@@ -199,6 +240,8 @@ void kvm_pmu_load(struct kvm_vcpu *vcpu)
 	if (!kvm_pmu_is_partitioned(pmu) || (vcpu->arch.mdcr_el2 & MDCR_EL2_TPM))
 		return;
 
+	kvm_pmu_apply_event_filter(vcpu);
+
 	for (i = 0; i < pmu->hpmn_max; i++) {
 		val = __vcpu_sys_reg(vcpu, PMEVCNTR0_EL0 + i);
 		write_pmevcntrn(i, val);
-- 
2.50.0.714.g196bf9f422-goog

