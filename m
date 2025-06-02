Received: from mail-oi1-f202.google.com (mail-oi1-f202.google.com [209.85.167.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAFC22D9E6
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 19:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748892560; cv=none; b=TBV4RlJKS7oAsBYoUwydDuX57HjCKSjYQTw0ubV8JexhXEr84a1rSfXi0XCupLUfJL8SU7qT1R5YUCVskqkycZyqvxnJoL8jNKDixWeT47IYNXcTWP9rckZQcuvmntJx1B3ziNYvh5v/KgnQ1yS3i8QWMhqvgsPro/MyqpIJo4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748892560; c=relaxed/simple;
	bh=rVIheqH0+/PJT/lcs6JePPwGwkoQWcSv5wqNXPtE6ls=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nBZ0OSMnEYZmBTG2454cKO/aa9kVqxfeMYp71yTViRzgGJD8jpEqBR4wRF753xb3w57p7K24UHNKrSzThTjBUFn96lrOXitijxzAXqT6wYRHrM6bwv70UVmDUFmrYytMk6inFrpO7JQ+8iHoWNowqyIQlsPuKN0bMWRMroPII0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iVF2U7KN; arc=none smtp.client-ip=209.85.167.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iVF2U7KN"
Received: by mail-oi1-f202.google.com with SMTP id 5614622812f47-4067106dd65so1185428b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 12:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748892555; x=1749497355; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=26CTSmqDyxITTH+s3Gb/2J4B5NVYM/QmbIppKLMrdxo=;
        b=iVF2U7KNerA2yKX30lgFz560RP6ahSkVuDbEImHI8MLTQoKAfuMMuNkwLrPVfzp1G0
         G8fteJN4JgmbdVyEYbWDqD2Qb6JCYDbrVKcQ4u+y700djaB94a2GDRDPgNrLuzojdTdK
         WqCYuqlBdJNiYLwSbi58SJLdlpJHp4UVyHCkNXqkubUEYoCiDi0F7BVI5mPNIKHEFZN7
         ozO5+CQ3kLvaMNFnj7i8ShAKOo676CAFm8/E5REfbPRnHLPkQ5VdFvv78mxXMUOnK+JE
         zquKYMlg+/ahB/l4hqjQWxOF43zSAUUVM+WekZkUTTP0rVEugEa7ujZO2Gqs36DAsujF
         WqfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748892555; x=1749497355;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=26CTSmqDyxITTH+s3Gb/2J4B5NVYM/QmbIppKLMrdxo=;
        b=NV5sgedPKGxsnhUXRSBY88JY8kVbQsPa9/oAGgfDTCfTmnlWkhngd1kgnOxWatYz1n
         QgaWOywluGTKtXEUhv70XdEL6pPsmkWalVE08NZ26eW0SXcjK6dPMaDoBfZQFV6MfhWl
         /ZMUsMocPNwJdKOdgHNOZwfBrrS3fZx8Q73jdcIqz9zugfib6ALKuzFsWnYPkD0rKWc4
         pOinPkA9I6uMxeXzilouClmtIjL1VekNF5Agqx9JBguMODVY3Gsf193x18r0A6sNfL5C
         n236PJjyRJBZoVKwdPD9G0RGoQlTuo0uR0HLOs1KW0IvFVDoXMbd0HhjNgd2Ghq8ZDyM
         xzJA==
X-Forwarded-Encrypted: i=1; AJvYcCV7EDFv9fkwXf0QDKE9mZy/QPYnWiFRwUlq1uSxXWkh6upY4Xxem1JK9cmsHqeIq+/VMZsfVIJpeojv/UM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCSv3rDoQ95wwvqdO6CLOT1Gt/+s4xJFbjLlTHUDoGAb1c8qu0
	sO+3eA/UKuv3AhJhnptbZtGXiwV/pWVW+3IORq4GWaqRIO9PirMaSVsN/uF6Bts77Trj2QcXeOr
	3XGK6walfpSXN/C+Ajp1ZJLjBVA==
X-Google-Smtp-Source: AGHT+IGRQ3tQu2xw3SSP0wfqw8hVdXkUiNnwLp3FSZDPtlEdZWrls30MkwdnKq2FbM4pg171i7/WNDJ2D1arVSPVXw==
X-Received: from oibbo14.prod.google.com ([2002:a05:6808:228e:b0:406:4510:b017])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:6b8d:b0:403:3e86:ab4c with SMTP id 5614622812f47-4067e6d94d1mr7758695b6e.39.1748892555108;
 Mon, 02 Jun 2025 12:29:15 -0700 (PDT)
Date: Mon,  2 Jun 2025 19:27:02 +0000
In-Reply-To: <20250602192702.2125115-1-coltonlewis@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250602192702.2125115-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250602192702.2125115-18-coltonlewis@google.com>
Subject: [PATCH 17/17] KVM: arm64: selftests: Add test case for partitioned PMU
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

Run separate test cases for a partitioned PMU in
vpmu_counter_access. Notably, partitioning the PMU untraps PMCR_EL0.N,
so that is no longer settable by KVM.

Add a boolean argument to run_access_test() that will partition the
PMU by reserving one host counter if true then run the test for the
PMCR_EL0.N value that implies, one less than the number of counters on
the host system.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 tools/include/uapi/linux/kvm.h                |  2 +
 .../selftests/kvm/arm64/vpmu_counter_access.c | 40 ++++++++++++++++---
 2 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/tools/include/uapi/linux/kvm.h b/tools/include/uapi/linux/kvm.h
index b6ae8ad8934b..cb72b57b9b6c 100644
--- a/tools/include/uapi/linux/kvm.h
+++ b/tools/include/uapi/linux/kvm.h
@@ -930,6 +930,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_X86_APIC_BUS_CYCLES_NS 237
 #define KVM_CAP_X86_GUEST_MODE 238
 #define KVM_CAP_ARM_WRITABLE_IMP_ID_REGS 239
+#define KVM_CAP_ARM_PARTITION_PMU 242
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
@@ -1356,6 +1357,7 @@ struct kvm_vfio_spapr_tce {
 #define KVM_S390_SET_CMMA_BITS      _IOW(KVMIO, 0xb9, struct kvm_s390_cmma_log)
 /* Memory Encryption Commands */
 #define KVM_MEMORY_ENCRYPT_OP      _IOWR(KVMIO, 0xba, unsigned long)
+#define KVM_ARM_PARTITION_PMU	_IOWR(KVMIO, 0xce, u8)
 
 struct kvm_enc_region {
 	__u64 addr;
diff --git a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
index f16b3b27e32e..e06448c1fbb5 100644
--- a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
+++ b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
@@ -369,6 +369,7 @@ static void guest_code(uint64_t expected_pmcr_n)
 	pmcr = read_sysreg(pmcr_el0);
 	pmcr_n = get_pmcr_n(pmcr);
 
+	/* __GUEST_ASSERT(0, "Expect PMCR: %lx", pmcr); */
 	/* Make sure that PMCR_EL0.N indicates the value userspace set */
 	__GUEST_ASSERT(pmcr_n == expected_pmcr_n,
 			"Expected PMCR.N: 0x%lx, PMCR.N: 0x%lx",
@@ -508,16 +509,18 @@ static void test_create_vpmu_vm_with_pmcr_n(uint64_t pmcr_n, bool expect_fail)
  * Create a guest with one vCPU, set the PMCR_EL0.N for the vCPU to @pmcr_n,
  * and run the test.
  */
-static void run_access_test(uint64_t pmcr_n)
+static void run_access_test(uint64_t pmcr_n, bool partition)
 {
 	uint64_t sp;
 	struct kvm_vcpu *vcpu;
 	struct kvm_vcpu_init init;
+	uint8_t host_counters = (uint8_t)partition;
 
 	pr_debug("Test with pmcr_n %lu\n", pmcr_n);
 
 	test_create_vpmu_vm_with_pmcr_n(pmcr_n, false);
 	vcpu = vpmu_vm.vcpu;
+	vcpu_ioctl(vcpu, KVM_ARM_PARTITION_PMU, &host_counters);
 
 	/* Save the initial sp to restore them later to run the guest again */
 	sp = vcpu_get_reg(vcpu, ARM64_CORE_REG(sp_el1));
@@ -529,6 +532,8 @@ static void run_access_test(uint64_t pmcr_n)
 	 * check if PMCR_EL0.N is preserved.
 	 */
 	vm_ioctl(vpmu_vm.vm, KVM_ARM_PREFERRED_TARGET, &init);
+	vcpu_ioctl(vcpu, KVM_ARM_PARTITION_PMU, &host_counters);
+
 	init.features[0] |= (1 << KVM_ARM_VCPU_PMU_V3);
 	aarch64_vcpu_setup(vcpu, &init);
 	vcpu_init_descriptor_tables(vcpu);
@@ -609,7 +614,7 @@ static void run_pmregs_validity_test(uint64_t pmcr_n)
  */
 static void run_error_test(uint64_t pmcr_n)
 {
-	pr_debug("Error test with pmcr_n %lu (larger than the host)\n", pmcr_n);
+	pr_debug("Error test with pmcr_n %lu (larger than the host allows)\n", pmcr_n);
 
 	test_create_vpmu_vm_with_pmcr_n(pmcr_n, true);
 	destroy_vpmu_vm();
@@ -629,20 +634,45 @@ static uint64_t get_pmcr_n_limit(void)
 	return get_pmcr_n(pmcr);
 }
 
-int main(void)
+void test_emulated_pmu(void)
 {
 	uint64_t i, pmcr_n;
 
-	TEST_REQUIRE(kvm_has_cap(KVM_CAP_ARM_PMU_V3));
+	pr_info("Testing Emulated PMU\n");
 
 	pmcr_n = get_pmcr_n_limit();
 	for (i = 0; i <= pmcr_n; i++) {
-		run_access_test(i);
+		run_access_test(i, false);
 		run_pmregs_validity_test(i);
 	}
 
 	for (i = pmcr_n + 1; i < ARMV8_PMU_MAX_COUNTERS; i++)
 		run_error_test(i);
+}
+
+void test_partitioned_pmu(void)
+{
+	uint64_t i, pmcr_n;
+
+	pr_info("Testing Partitioned PMU\n");
+
+	pmcr_n = get_pmcr_n_limit();
+	run_access_test(pmcr_n - 1, true);
+
+	/* Partitioning implies only one PMCR.N allowed */
+	for (i = 0; i < ARMV8_PMU_MAX_COUNTERS; i++)
+		if (i != pmcr_n)
+			run_error_test(i);
+}
+
+int main(void)
+{
+	TEST_REQUIRE(kvm_has_cap(KVM_CAP_ARM_PMU_V3));
+
+	test_emulated_pmu();
+
+	if (kvm_has_cap(KVM_CAP_ARM_PARTITION_PMU))
+		test_partitioned_pmu();
 
 	return 0;
 }
-- 
2.49.0.1204.g71687c7c1d-goog

