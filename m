Received: from mail-il1-f201.google.com (mail-il1-f201.google.com [209.85.166.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C3A154C0D
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 02:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738980090; cv=none; b=U7SBAXenQiRQq1sCIuBR1X8lt+41NymbBPVTxS2J8/X/h4mjzXf2faAcBsIMME1MkXwVhnY0Q4iPm5FjfKZcacfsrnR3WDCIsIrojeDdbvj9ZmdYiWV8n7+h0XDvuPC2bGmSvrbV7K9v9XchFxz4qkMuWxIqnDkBNjh6JDWjSB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738980090; c=relaxed/simple;
	bh=LQBYMp4KmUXKjINd8GkhcF2qurugv4q68hUcGJQNnjI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eMxIWcCQOPAxhRbN1Fw3j0cCECBvJIPsqzDn3e+rkjovdagJTQTm1IVoZePdSIruqfnua873QDc6ZdZ3qAySKnpVSGyZuKpdtfuQhlDeD5KNQy94Me9c6FxMnm9q1CWND9WNiFi9766SmYxWfIDG8K2C3V40xZnESIpt7EPayo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WsHtKx+W; arc=none smtp.client-ip=209.85.166.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WsHtKx+W"
Received: by mail-il1-f201.google.com with SMTP id e9e14a558f8ab-3d054d79dacso46713055ab.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 18:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738980087; x=1739584887; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TJ0ITpSot12bWRIgUxfFL1nJMNuEe3fyU4TCb+rHvco=;
        b=WsHtKx+WDJOKNaUauQa96j4suPxy5k0mhq7/IFflync0k7Bb7Eo13HzPLlkYXNM5rO
         UQC34q6hmhU/y0RifQK8a7n3dh/AFUvjG6SCFTusyZx39xjEKEs9RT6RzcsvxmzI8avy
         ONDg64/PsLTe7Kd5eDeAoXtJWkUE2DM7wQI7Tg7n7AuJ/wc2xWOW5Fppy+optDM+Pnhg
         7YpFTuoE2co5Uge254VNBhJwL6TVDgkrpbOOe2GYp8Ycz9OKuFHDLzDCoTQPouF1REvd
         SD4PvCSRCMJ81sEPCLsMUFni8rZfLTtgmj6OL09w7MGb+w1SSEVT5j+28iEtZMxQzSmG
         h0JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738980087; x=1739584887;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TJ0ITpSot12bWRIgUxfFL1nJMNuEe3fyU4TCb+rHvco=;
        b=Tchqr5cNTHQ2qBXvOWdl/42v63zp1jT1pN+K2YT6UYdnJY24i+YhLl7hyNWlXe9pdd
         wL6fPdHq1X8Hutjo76jmpAvFjaJcKoWTFZNOZfXpgx+g1zFIIhRPc/t05cYxqsRbYTjY
         8XhbikuhyX6GdK2nMjMrAV/XLjHIfOjXna+el5a81UCefPHLdUGcIKY43YabPqT0eJl0
         6fp/SK4ofkZmI46FJtAduTgKYI0ud3nrlgbegBiI2UP3SiFhtL2Mf32+vpOdD7mpmdCH
         RClei8HdgSaBVAULIF7EALEesXv+qnOH2BqoRU/6jWOf6QSKAj5qQDoZ/nDb0Kxemsbc
         l/HQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9Jycij73YhoV5f5gkj+dlvT8pBMaQnyafDfvZDEW8sJmzmIoxFafCYwkxlIFbMwYAtNgaQtDof9+r2Pc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6S4gnt7bxTR7m1BdGfKReZRjGpZi5pvdcI4OI6+udvkLkqW/3
	/ScsILPSANirRENVGrlYTiJ9y8vUupkDfr4+k1rR+l/d9iMwwKpXoSAxYlZRdoy1KNh1CxNUww6
	ZLwBbw4tKobcdGzPn+S8T3w==
X-Google-Smtp-Source: AGHT+IHGzAbpz5Gck/2Rf7WgkWKxzSWHxb28Hylkb71d1eO6uNKmPJkkI+3L+zJwZvOSJQqcK2g9jZxrFbjtaCAz6g==
X-Received: from ilbeh24.prod.google.com ([2002:a05:6e02:4c18:b0:3d0:499b:8e3d])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:20c9:b0:3cf:cdb8:78fb with SMTP id e9e14a558f8ab-3d13df0fb5fmr49647775ab.16.1738980086868;
 Fri, 07 Feb 2025 18:01:26 -0800 (PST)
Date: Sat,  8 Feb 2025 02:01:11 +0000
In-Reply-To: <20250208020111.2068239-1-coltonlewis@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250208020111.2068239-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250208020111.2068239-5-coltonlewis@google.com>
Subject: [RFC PATCH v2 4/4] KVM: arm64: Make guests see only counters they can access
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"

The ARM architecture specifies that when MDCR_EL2.HPMN is set, EL1 and
EL0, which includes KVM guests, should read that value for PMCR.N.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/debug.c                                  | 3 +--
 arch/arm64/kvm/pmu-emul.c                               | 8 +++++++-
 tools/testing/selftests/kvm/arm64/vpmu_counter_access.c | 2 +-
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
index 0e4c805e7e89..7c04db00bf6c 100644
--- a/arch/arm64/kvm/debug.c
+++ b/arch/arm64/kvm/debug.c
@@ -36,8 +36,7 @@ static void kvm_arm_setup_mdcr_el2(struct kvm_vcpu *vcpu)
 	 * This also clears MDCR_EL2_E2PB_MASK and MDCR_EL2_E2TB_MASK
 	 * to disable guest access to the profiling and trace buffers
 	 */
-	vcpu->arch.mdcr_el2 = FIELD_PREP(MDCR_EL2_HPMN,
-					 *host_data_ptr(nr_event_counters));
+	vcpu->arch.mdcr_el2 = FIELD_PREP(MDCR_EL2_HPMN, read_mdcr());
 	vcpu->arch.mdcr_el2 |= (MDCR_EL2_TPM |
 				MDCR_EL2_TPMS |
 				MDCR_EL2_TTRF |
diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 6c5950b9ceac..052ce8c721fe 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -993,12 +993,18 @@ static bool pmu_irq_is_valid(struct kvm *kvm, int irq)
 u8 kvm_arm_pmu_get_max_counters(struct kvm *kvm)
 {
 	struct arm_pmu *arm_pmu = kvm->arch.arm_pmu;
+	u8 limit;
+
+	if (arm_pmu->partitioned)
+		limit = arm_pmu->hpmn - 1;
+	else
+		limit = ARMV8_PMU_MAX_GENERAL_COUNTERS;
 
 	/*
 	 * The arm_pmu->cntr_mask considers the fixed counter(s) as well.
 	 * Ignore those and return only the general-purpose counters.
 	 */
-	return bitmap_weight(arm_pmu->cntr_mask, ARMV8_PMU_MAX_GENERAL_COUNTERS);
+	return bitmap_weight(arm_pmu->cntr_mask, limit);
 }
 
 static void kvm_arm_set_pmu(struct kvm *kvm, struct arm_pmu *arm_pmu)
diff --git a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
index f16b3b27e32e..b5bc18b7528d 100644
--- a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
+++ b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
@@ -609,7 +609,7 @@ static void run_pmregs_validity_test(uint64_t pmcr_n)
  */
 static void run_error_test(uint64_t pmcr_n)
 {
-	pr_debug("Error test with pmcr_n %lu (larger than the host)\n", pmcr_n);
+	pr_debug("Error test with pmcr_n %lu (larger than the host allows)\n", pmcr_n);
 
 	test_create_vpmu_vm_with_pmcr_n(pmcr_n, true);
 	destroy_vpmu_vm();
-- 
2.48.1.502.g6dc24dfdaf-goog

