Received: from mail-io1-f73.google.com (mail-io1-f73.google.com [209.85.166.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD912FD872
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 20:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750968375; cv=none; b=mC5/7B8Pm/JvmhlspnEQBHqekn55c0SbPmNFEaB+RULim9OrFUybZ966wMx3IW07CmN7GfpmwtPMcr0xGYNcGt5RAA7PYlzCaLQ8j4CM1lsR9USzT7BUE/IbcUkkBfpomQ1XM8jEYPwbOH4uNLmNXRX6AxGbZU7mE2dSPZgra58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750968375; c=relaxed/simple;
	bh=gOCVNUcJxbP4E19oVaSXNAaxiVd9KT2116peS7a3WYY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lhGsgIvGIehb3FrbnZeo7WlaAOlO4GN6meHrl5Je4GH6QTHA94k2ogQpOwwlt8ebLpEEMx99HuOzV5uEuaREG8FiqRqpJNMiv3+8ZpUkfUW19gfOWM07j1+fU8i0exNuECLNhUrosdfK0UYJZ1qPF5bXlD61+eFzUjz/UHfRtrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D9dOn/5D; arc=none smtp.client-ip=209.85.166.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D9dOn/5D"
Received: by mail-io1-f73.google.com with SMTP id ca18e2360f4ac-86cf89ff625so135837439f.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 13:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750968371; x=1751573171; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=S6YI1PbJ7Kn84JnSkWupK7ZLYRCn92aoL1PXIwZUeC8=;
        b=D9dOn/5DrKjAxctMufgKLJeo6rPsYWyidZbROfbRj3KalNUIzBGfAcN2HPY+r4ojQu
         QJRs0PphmEKDzY3g4mLkgN8U/4+zqOBuwlOe11n+y8Np3AdHmL21r/E28CjWuJVVrx1e
         BVmX/Cly4iFtmfZXv+ii2RjGjF6xHYKeB3QlZ/I87WWDJsf8daSkg0teefCfBP+U98Gt
         PyrZwLrLir9ih9kiiVUp4ZdMcEwUyspWXsjv4pL73dnVh5wCRDoQpyk8oe4+Ea1VJrQQ
         5uEleY7cc34aLVE7Q1WwhTaoPZcIeicdihSYUcBbFmrnoPXIvyHVOTT/Rww3L0tuqFvg
         5uFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750968371; x=1751573171;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S6YI1PbJ7Kn84JnSkWupK7ZLYRCn92aoL1PXIwZUeC8=;
        b=mF5/qVfBuoAQZnyGGznnVN4PWRmIDQg89zOuZb97u8+dPmRs6gS+Gl4+AatL5KphJC
         PXnlBHj+Ivwmk5Ys3CMJhuJyi7R7FEVaAPjo/sSegXJRM+haDBW9IKkl+2QU/cxh4ZVl
         AJg+XqoWFi0OBxbPXWlgP/Xr0iefwFMeYosUp4TSM3k9ZzjxiN6OQGU2849R1+SOgDhZ
         UhcfHilaA6/IrJycFHrD1SIjFj3iKvMknCJB7tVtLYAltE71+Tfogc7LGO70uh22Z51X
         HByMz2xcIZ9ZK6sENAgFhC7WCZFMo5nQlR/krGC7PoE6OSlwSQqH86AwB8yhpv1NQWZF
         jWlg==
X-Forwarded-Encrypted: i=1; AJvYcCWee0j7z5AP/JGvWxhnQh15cjXdGWWTEozZDzlH/6FZY65ksAK+oGH55TY6Eq4BDMcNYJVAUZdOJgVxX30=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHHrw19xKqdNL5FnZgtPHr9xqRzsSRasF9fgA3+csAJmq3oI7e
	L4tjan0fdHnmxeR2U0Bxo34sFXe/LpNfL5Uk3JNd5Hgy+zIZ42zWgoAOGs4sUGqli81ReoZSj71
	NcQsidv9Gpd/keYjoxCFISSBKXA==
X-Google-Smtp-Source: AGHT+IHJUkjGyGvNcWxAAAjfiD6q7g9phykRry/HcdOfgoIUsGWYJ5QzPA0/oIz6lali1a+s4FtxtR3CCKpC4TGpWw==
X-Received: from ilbbb14.prod.google.com ([2002:a05:6e02:e:b0:3df:38c1:b314])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:154a:b0:3de:25cb:42c2 with SMTP id e9e14a558f8ab-3df4acdd094mr10972865ab.18.1750968371417;
 Thu, 26 Jun 2025 13:06:11 -0700 (PDT)
Date: Thu, 26 Jun 2025 20:04:55 +0000
In-Reply-To: <20250626200459.1153955-1-coltonlewis@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250626200459.1153955-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250626200459.1153955-20-coltonlewis@google.com>
Subject: [PATCH v3 19/22] perf: arm_pmuv3: Handle IRQs for Partitioned PMU
 guest counters
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

Guest counters will still trigger interrupts that need to be handled
by the host PMU interrupt handler. Clear the overflow flags in
hardware to handle the interrupt as normal, but record which guest
overflow flags were set in the virtual overflow register for later
injecting the interrupt into the guest.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm/include/asm/arm_pmuv3.h |  6 ++++++
 arch/arm64/include/asm/kvm_pmu.h |  2 ++
 arch/arm64/kvm/pmu-part.c        | 17 +++++++++++++++++
 drivers/perf/arm_pmuv3.c         |  9 +++++++++
 4 files changed, 34 insertions(+)

diff --git a/arch/arm/include/asm/arm_pmuv3.h b/arch/arm/include/asm/arm_pmuv3.h
index 5f6269039f44..36638efe4258 100644
--- a/arch/arm/include/asm/arm_pmuv3.h
+++ b/arch/arm/include/asm/arm_pmuv3.h
@@ -180,6 +180,11 @@ static inline void write_pmintenset(u32 val)
 	write_sysreg(val, PMINTENSET);
 }
 
+static inline u32 read_pmintenset(void)
+{
+	return read_sysreg(PMINTENSET);
+}
+
 static inline void write_pmintenclr(u32 val)
 {
 	write_sysreg(val, PMINTENCLR);
@@ -249,6 +254,7 @@ static inline u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu)
 	return ~0;
 }
 
+static inline void kvm_pmu_handle_guest_irq(u64 govf) {}
 
 static inline bool has_vhe(void)
 {
diff --git a/arch/arm64/include/asm/kvm_pmu.h b/arch/arm64/include/asm/kvm_pmu.h
index 4f0741bf6779..03e3bd318e4b 100644
--- a/arch/arm64/include/asm/kvm_pmu.h
+++ b/arch/arm64/include/asm/kvm_pmu.h
@@ -95,6 +95,7 @@ u64 kvm_pmu_host_counter_mask(struct arm_pmu *pmu);
 u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu);
 void kvm_pmu_host_counters_enable(void);
 void kvm_pmu_host_counters_disable(void);
+void kvm_pmu_handle_guest_irq(u64 govf);
 
 u8 kvm_pmu_guest_num_counters(struct kvm_vcpu *vcpu);
 u8 kvm_pmu_hpmn(struct kvm_vcpu *vcpu);
@@ -291,6 +292,7 @@ static inline u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu)
 
 static inline void kvm_pmu_host_counters_enable(void) {}
 static inline void kvm_pmu_host_counters_disable(void) {}
+static inline void kvm_pmu_handle_guest_irq(u64 govf) {}
 
 #endif
 
diff --git a/arch/arm64/kvm/pmu-part.c b/arch/arm64/kvm/pmu-part.c
index 1451870757e1..bd04c37b19b9 100644
--- a/arch/arm64/kvm/pmu-part.c
+++ b/arch/arm64/kvm/pmu-part.c
@@ -338,3 +338,20 @@ void kvm_pmu_put(struct kvm_vcpu *vcpu)
 	val = read_pmintenset();
 	__vcpu_assign_sys_reg(vcpu, PMINTENSET_EL1, val & mask);
 }
+
+/**
+ * kvm_pmu_handle_guest_irq() - Record IRQs in guest counters
+ * @govf: Bitmask of guest overflowed counters
+ *
+ * Record IRQs from overflows in guest-reserved counters in the VCPU
+ * register for the guest to clear later.
+ */
+void kvm_pmu_handle_guest_irq(u64 govf)
+{
+	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
+
+	if (!vcpu)
+		return;
+
+	__vcpu_rmw_sys_reg(vcpu, PMOVSSET_EL0, |=, govf);
+}
diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 5836672a3dd9..dba7dcee8258 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -750,6 +750,8 @@ static u64 armv8pmu_getreset_flags(void)
 
 	/* Write to clear flags */
 	value &= ARMV8_PMU_CNT_MASK_ALL;
+	/* Only reset interrupt enabled counters. */
+	value &= read_pmintenset();
 	write_pmovsclr(value);
 
 	return value;
@@ -852,6 +854,7 @@ static void armv8pmu_stop(struct arm_pmu *cpu_pmu)
 static irqreturn_t armv8pmu_handle_irq(struct arm_pmu *cpu_pmu)
 {
 	u64 pmovsr;
+	u64 govf;
 	struct perf_sample_data data;
 	struct pmu_hw_events *cpuc = this_cpu_ptr(cpu_pmu->hw_events);
 	struct pt_regs *regs;
@@ -906,6 +909,12 @@ static irqreturn_t armv8pmu_handle_irq(struct arm_pmu *cpu_pmu)
 		 */
 		perf_event_overflow(event, &data, regs);
 	}
+
+	govf = pmovsr & kvm_pmu_guest_counter_mask(cpu_pmu);
+
+	if (kvm_pmu_is_partitioned(cpu_pmu) && govf)
+		kvm_pmu_handle_guest_irq(govf);
+
 	armv8pmu_start(cpu_pmu);
 
 	return IRQ_HANDLED;
-- 
2.50.0.727.gbf7dc18ff4-goog

