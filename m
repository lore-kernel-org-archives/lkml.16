Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3913E26C397
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 16:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746461664; cv=none; b=X+UPQL6NNatqKpG5VwIlv5xnFTO37ngZ3jTuaGgBqIGs04lWtEPeNqOEuLEaJp2Cx7hcDRFmX+CT0LzPD27loCYHpHy9d4b1UMH1qK51m3xAagDBcFaSwS2noxXWUgEWxhuMIt2VL5nxXf3YWeFsck3PGZ2xhCzqwlFCxDDkHTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746461664; c=relaxed/simple;
	bh=0xPFNmQ2aYdSjFcVuUL7sWXmakZUXXwCI8TdRZJDz9g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=W7VTH/g+cZN5+J4XkmU2Tv5X47ac/xV+BxEDpw6ih4jQw8Sb752ebfvWGaqM/bU3jyhjqpXaskbbCVB8ewGn+thf8ZA2xn3XkjsGMUZShEiR2UcRMtP8Zgjuc4/eQhZeqSfsJ4qc2KKIq43RpQJWcFKAQm9tbrc65WnBw5ajRDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jiaqiyan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Cc/uRD0N; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jiaqiyan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Cc/uRD0N"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-22c31b55ac6so65506655ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 09:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746461663; x=1747066463; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qoM9DcHdqZBj+rk9l05sHHopuoPZxH677juEX9RJpMg=;
        b=Cc/uRD0NkHMrvPWyT0Y0tQDFxYje4u+lAlj51UllWvP+vb8F75TLhDZfMk/s9tqp7e
         By63/13gFQ5NcWX7qRtzSQjeih5tCGR1c4iv2BjHSclUscQqkiqAuSwKsxd0IHNDsbN4
         lJ9rEWZRh/3i2Z8c49kE1kkVvhByLqyf3sx4WUcRy4ipDV13h2nIem54t3B5v+pL2lTJ
         YETibOULRG4lMzgU1+AZWkqKJztkgRlfKGqXeceMHAucShGOXji7IaI+ZjWesRpq+mRV
         9m0qNeK9j2gO5EmLahmYFSfuVz6COBeV5t8a+2SDHuUFsRcf/qxHnR97MySv8E7pPpl7
         59vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746461663; x=1747066463;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qoM9DcHdqZBj+rk9l05sHHopuoPZxH677juEX9RJpMg=;
        b=FMZkj6Cxou6lrUrS7rRwpfh4uWP10SvVey51Kw+sOLQ01/SFwS14KLBlTo9kEzhof3
         4xGpYWx3q/IkG+h8bofiu/0bTmzgZ4wdTa4+VNU2m00iEVhlv1QtrAZPhY81eq5S5mnr
         TLry40ucPiqywECPkF9UF1x4tSdkkK5PK4AsJGB7HR7BaxfNc3Mf3fcbeRnbYnGt4gKb
         hV18wqgruaAvqAI3GHGesdv05ZP+WkBffc8u9UDyO4ApqP8Vu8u+d52cR2LDHZlMi5DR
         9lpLkaF9aCPiDn8Yrmifg1GQ8S1tO9fmJ81RsudxfJZWZR635TcPbq4U+SeRjhxLgvz3
         OD+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU2gNExU3jhLzOa9OsvtOj4Lz13ARAT8eByuYtp05AMBzcg9vifaT9iKS+Zd8VJo+3O0LHt+lCM/DP/8/s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv9krlARzXsS6Y+eWbwU3eutUTl76zWIOQEeBMlw8+1YJcxgae
	/NsmFtgmC0v4gUM4DJ+CMSUVyx6Z3P7L95fz/JTlWsr4lPaACj6A1k6zAQzVTPjjCo/Iy/vfaqt
	lviQDrQYSnQ==
X-Google-Smtp-Source: AGHT+IFZMxB5zKbz0DCB224XcS28TLNRLHuTk3G5CmkpWtkGxQ7uQKT12C81gz2CRUWIcDMNDv5x3jsR5vZQHg==
X-Received: from pfbdh13.prod.google.com ([2002:a05:6a00:478d:b0:739:485f:c33e])
 (user=jiaqiyan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2383:b0:21f:52e:939e with SMTP id d9443c01a7336-22e18bc4033mr159804055ad.28.1746461662677;
 Mon, 05 May 2025 09:14:22 -0700 (PDT)
Date: Mon,  5 May 2025 16:14:11 +0000
In-Reply-To: <20250505161412.1926643-1-jiaqiyan@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250505161412.1926643-1-jiaqiyan@google.com>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250505161412.1926643-6-jiaqiyan@google.com>
Subject: [PATCH v1 5/6] KVM: selftests: Test for KVM_CAP_INJECT_EXT_IABT
From: Jiaqi Yan <jiaqiyan@google.com>
To: maz@kernel.org, oliver.upton@linux.dev
Cc: joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	shuah@kernel.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	duenwen@google.com, rananta@google.com, jthoughton@google.com, 
	Jiaqi Yan <jiaqiyan@google.com>
Content-Type: text/plain; charset="UTF-8"

Test userspace can use KVM_SET_VCPU_EVENTS to inject an external
instruction abort into guest. The test injects instruction abort at an
arbitrary time without real SEA happening in the guest VCPU, so only
certain ESR_EL1 value can be expected, but not the case for FAR_EL1.

Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
---
 tools/arch/arm64/include/uapi/asm/kvm.h       |   3 +-
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../testing/selftests/kvm/arm64/inject_iabt.c | 100 ++++++++++++++++++
 3 files changed, 103 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/kvm/arm64/inject_iabt.c

diff --git a/tools/arch/arm64/include/uapi/asm/kvm.h b/tools/arch/arm64/include/uapi/asm/kvm.h
index af9d9acaf9975..d3a4530846311 100644
--- a/tools/arch/arm64/include/uapi/asm/kvm.h
+++ b/tools/arch/arm64/include/uapi/asm/kvm.h
@@ -184,8 +184,9 @@ struct kvm_vcpu_events {
 		__u8 serror_pending;
 		__u8 serror_has_esr;
 		__u8 ext_dabt_pending;
+		__u8 ext_iabt_pending;
 		/* Align it to 8 bytes */
-		__u8 pad[5];
+		__u8 pad[4];
 		__u64 serror_esr;
 	} exception;
 	__u32 reserved[12];
diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 16d2e9f32619f..708fd126a36dd 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -148,6 +148,7 @@ TEST_GEN_PROGS_arm64 += arm64/aarch32_id_regs
 TEST_GEN_PROGS_arm64 += arm64/arch_timer_edge_cases
 TEST_GEN_PROGS_arm64 += arm64/debug-exceptions
 TEST_GEN_PROGS_arm64 += arm64/hypercalls
+TEST_GEN_PROGS_arm64 += arm64/inject_iabt
 TEST_GEN_PROGS_arm64 += arm64/mmio_abort
 TEST_GEN_PROGS_arm64 += arm64/page_fault_test
 TEST_GEN_PROGS_arm64 += arm64/psci_test
diff --git a/tools/testing/selftests/kvm/arm64/inject_iabt.c b/tools/testing/selftests/kvm/arm64/inject_iabt.c
new file mode 100644
index 0000000000000..43b701e9143c2
--- /dev/null
+++ b/tools/testing/selftests/kvm/arm64/inject_iabt.c
@@ -0,0 +1,100 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * inject_iabt.c - Tests for injecting instruction aborts into guest.
+ */
+
+#include "processor.h"
+#include "test_util.h"
+
+static void expect_iabt_handler(struct ex_regs *regs)
+{
+	u64 esr = read_sysreg(esr_el1);
+
+	GUEST_PRINTF("Guest SEA esr_el1=%#lx\n", esr);
+	GUEST_ASSERT_EQ(ESR_ELx_EC(esr), ESR_ELx_EC_IABT_CUR);
+	GUEST_ASSERT_EQ(esr & ESR_ELx_FSC_TYPE, ESR_ELx_FSC_EXTABT);
+	/*
+	 * We inject IABT but there is no SEA in guest at all,
+	 * so guest should see FnV == 1, which is set by KVM.
+	 */
+	GUEST_ASSERT(esr & ESR_ELx_FnV);
+
+	GUEST_DONE();
+}
+
+static void guest_code(void)
+{
+	GUEST_FAIL("Guest should only run SEA handler");
+}
+
+static void vcpu_run_expect_done(struct kvm_vcpu *vcpu)
+{
+	struct ucall uc;
+	bool guest_done = false;
+
+	do {
+		vcpu_run(vcpu);
+		switch (get_ucall(vcpu, &uc)) {
+		case UCALL_ABORT:
+			REPORT_GUEST_ASSERT(uc);
+			break;
+		case UCALL_PRINTF:
+			ksft_print_msg("From guest: %s", uc.buffer);
+		case UCALL_DONE:
+			ksft_print_msg("Guest done gracefully!\n");
+			guest_done = true;
+			break;
+		default:
+			TEST_FAIL("Unexpected ucall: %lu", uc.cmd);
+	}
+	} while (!guest_done);
+}
+
+static void vcpu_inject_ext_iabt(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_events events = {};
+
+	events.exception.ext_iabt_pending = true;
+	vcpu_events_set(vcpu, &events);
+}
+
+static void vcpu_inject_invalid_abt(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_events events = {};
+	int r;
+
+	events.exception.ext_iabt_pending = true;
+	events.exception.ext_dabt_pending = true;
+
+	ksft_print_msg("Injecting invalid external abort events\n");
+	r = __vcpu_ioctl(vcpu, KVM_SET_VCPU_EVENTS, &events);
+	TEST_ASSERT(r && errno == EINVAL,
+		    KVM_IOCTL_ERROR(KVM_SET_VCPU_EVENTS, r));
+}
+
+static void test_inject_iabt(void)
+{
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+
+	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
+
+	vm_init_descriptor_tables(vm);
+	vcpu_init_descriptor_tables(vcpu);
+
+	vm_install_sync_handler(vm, VECTOR_SYNC_CURRENT,
+				ESR_ELx_EC_IABT_CUR, expect_iabt_handler);
+
+	vcpu_inject_invalid_abt(vcpu);
+
+	vcpu_inject_ext_iabt(vcpu);
+	vcpu_run_expect_done(vcpu);
+
+	kvm_vm_free(vm);
+}
+
+int main(void)
+{
+	test_inject_iabt();
+	return 0;
+}
-- 
2.49.0.967.g6a0df3ecc3-goog

