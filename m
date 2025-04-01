Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D66221D94
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 20:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743540430; cv=none; b=RmTJBxhNIPaWSZvaXxbALtGR+bmINPTxwlEVS3wZJfPwhX5IhHcQD0Harwo/VQED36UNs13LqZoDzTpz055Ow4wwl3Hkup1vo/CVKD3+BdT45/XaQHsWC9OOFS81VcFelOWlgFKtAtLcvBqCOMh9qUtMGoZemnuzzUUa4uLD9Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743540430; c=relaxed/simple;
	bh=86HpLcvhrOdiDEIe6VssKHPWpXBqZvLXcZIB239MpOM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QpC8mdk8EAdsitzT8YLzWQV665vfz6NdG0ciDEalwAS7/Yy5uRNVxiNqDp18FICeWn5g0OH1CNW4CQgLZEVsylZWnY4+mSsd+OQ7Vg2DcTJz1ippK76eNLkLpofOsMOqfORIebH9lj4n+6RNO85bKnyIFuJNHbgH91UGT5oE95s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=icZax2fe; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="icZax2fe"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-22410b910b0so86953225ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 13:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743540427; x=1744145227; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=7WhTcpnDfS966b8qcjFRKYTbiz5sb4vgFd+KNycoqKw=;
        b=icZax2feZyy+mVbCa81lDja026HHawMGANa367/cgoZFVHJT0qUl8eQuPfUfvUmdHQ
         eS3iqiFhg0O7XXTp2X4RRGX2ZPCz37YsSA8Z0E1jX6boTrZV95yiCGVimCXSs/a4Z5vy
         MdrSB9S9yZqjBCdLkLN1STkDOc+6A6Ikc7s2Jiy5vzllk8rVanK3M7cDaUFgDKmR1cbO
         FoWGKvsBM7NVq17U8daxKJI5nJkEScWy6g/CRuO5QYrMWlqkizviS8SJVPT/2WdIhQgM
         dgt5oYjIoB6/k9zwiusnW0L/fvlAAVDpOweuVh/n0OCbnRxaVDg2s7bn8mjdh1fMRa+2
         4f3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743540427; x=1744145227;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7WhTcpnDfS966b8qcjFRKYTbiz5sb4vgFd+KNycoqKw=;
        b=iUC2MFg1TnGVFKV14ObvcyMnSMHmfHfi+otKNaSMThe9OaxL50EJtud63YX1TiGCvD
         NuFVejOrFN6Dm5zWCSZseBpqO7JTC7Q8Pf17zHXGQacdXALareCXVqI8sOdmYe8yjrrV
         zG4O8r/48o6gLpZ6/2sSfewLDSwkl/WYbP5bW7xc3kOwJJt1wBjX81vQHUThRxjtsHMy
         E5scC95LCRGR804Oa0ZcfUBr/46h7sW4Mu3HjMxq1fY6cC7d8qyRmkqMD6rhDw3gY/Wf
         diZ436cxwZtbPUmWXWujSBtrIW7kuAZwg1VTfN2c67LUa36567d72CT0S+eJHV/VxtTK
         7kkA==
X-Forwarded-Encrypted: i=1; AJvYcCUZLVlnG9c6XYOeS9sqOrXCOivZ6BRn3fjbUgrTfCf0nxIvyYEtJNe09tdrodEPOFq64OTk5jGUFfpC0yI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr32QMXJfW0ombPSqjQLD2N1qL7zSUb178i2mq9CxovdQyVC3H
	nztSH09rNQoqgiupYebIJaJ9noFXMm7lboDAk2gjvXqRtYjLu57/FB1k/wjxTPj4p3eETV+Rn1E
	v/Q==
X-Google-Smtp-Source: AGHT+IE69F+P2diWss4q1R2RCvqjJn9bih0SHo0zrhhUPWnYhjvt54Ev63/iq2FBMJOXU3F4HgV2IVY99W4=
X-Received: from pfef19.prod.google.com ([2002:a05:6a00:2293:b0:736:5b36:db8f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:853:b0:736:9fa2:bcbb
 with SMTP id d2e1a72fcca58-73980436cbamr22550678b3a.24.1743540426869; Tue, 01
 Apr 2025 13:47:06 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue,  1 Apr 2025 13:44:23 -0700
In-Reply-To: <20250401204425.904001-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250401204425.904001-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250401204425.904001-12-seanjc@google.com>
Subject: [PATCH 11/12] KVM: selftests: Add utilities to create eventfds and do KVM_IRQFD
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Sean Christopherson <seanjc@google.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, David Matlack <dmatlack@google.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset="UTF-8"

Add helpers to create eventfds and to (de)assign eventfds via KVM_IRQFD.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/arm64/vgic_irq.c  | 12 ++----
 .../testing/selftests/kvm/include/kvm_util.h  | 40 +++++++++++++++++++
 .../selftests/kvm/x86/xen_shinfo_test.c       | 18 ++-------
 3 files changed, 47 insertions(+), 23 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_irq.c b/tools/testing/selftests/kvm/arm64/vgic_irq.c
index f4ac28d53747..a09dd423c2d7 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_irq.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_irq.c
@@ -620,18 +620,12 @@ static void kvm_routing_and_irqfd_check(struct kvm_vm *vm,
 	 * that no actual interrupt was injected for those cases.
 	 */
 
-	for (f = 0, i = intid; i < (uint64_t)intid + num; i++, f++) {
-		fd[f] = eventfd(0, 0);
-		TEST_ASSERT(fd[f] != -1, __KVM_SYSCALL_ERROR("eventfd()", fd[f]));
-	}
+	for (f = 0, i = intid; i < (uint64_t)intid + num; i++, f++)
+		fd[f] = kvm_new_eventfd();
 
 	for (f = 0, i = intid; i < (uint64_t)intid + num; i++, f++) {
-		struct kvm_irqfd irqfd = {
-			.fd  = fd[f],
-			.gsi = i - MIN_SPI,
-		};
 		assert(i <= (uint64_t)UINT_MAX);
-		vm_ioctl(vm, KVM_IRQFD, &irqfd);
+		kvm_assign_irqfd(vm, i - MIN_SPI, fd[f]);
 	}
 
 	for (f = 0, i = intid; i < (uint64_t)intid + num; i++, f++) {
diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 373912464fb4..4f7bf8f000bb 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -18,6 +18,7 @@
 #include <asm/atomic.h>
 #include <asm/kvm.h>
 
+#include <sys/eventfd.h>
 #include <sys/ioctl.h>
 
 #include "kvm_util_arch.h"
@@ -496,6 +497,45 @@ static inline int vm_get_stats_fd(struct kvm_vm *vm)
 	return fd;
 }
 
+static inline int __kvm_irqfd(struct kvm_vm *vm, uint32_t gsi, int eventfd,
+			      uint32_t flags)
+{
+	struct kvm_irqfd irqfd = {
+		.fd = eventfd,
+		.gsi = gsi,
+		.flags = flags,
+		.resamplefd = -1,
+	};
+
+	return __vm_ioctl(vm, KVM_IRQFD, &irqfd);
+}
+
+static inline void kvm_irqfd(struct kvm_vm *vm, uint32_t gsi, int eventfd,
+			      uint32_t flags)
+{
+	int ret = __kvm_irqfd(vm, gsi, eventfd, flags);
+
+	TEST_ASSERT_VM_VCPU_IOCTL(!ret, KVM_IRQFD, ret, vm);
+}
+
+static inline void kvm_assign_irqfd(struct kvm_vm *vm, uint32_t gsi, int eventfd)
+{
+	kvm_irqfd(vm, gsi, eventfd, 0);
+}
+
+static inline void kvm_deassign_irqfd(struct kvm_vm *vm, uint32_t gsi, int eventfd)
+{
+	kvm_irqfd(vm, gsi, eventfd, KVM_IRQFD_FLAG_DEASSIGN);
+}
+
+static inline int kvm_new_eventfd(void)
+{
+	int fd = eventfd(0, 0);
+
+	TEST_ASSERT(fd >= 0, __KVM_SYSCALL_ERROR("eventfd()", fd));
+	return fd;
+}
+
 static inline void read_stats_header(int stats_fd, struct kvm_stats_header *header)
 {
 	ssize_t ret;
diff --git a/tools/testing/selftests/kvm/x86/xen_shinfo_test.c b/tools/testing/selftests/kvm/x86/xen_shinfo_test.c
index 34d180cf4eed..23909b501ac2 100644
--- a/tools/testing/selftests/kvm/x86/xen_shinfo_test.c
+++ b/tools/testing/selftests/kvm/x86/xen_shinfo_test.c
@@ -547,11 +547,8 @@ int main(int argc, char *argv[])
 	int irq_fd[2] = { -1, -1 };
 
 	if (do_eventfd_tests) {
-		irq_fd[0] = eventfd(0, 0);
-		TEST_ASSERT(irq_fd[0] >= 0, __KVM_SYSCALL_ERROR("eventfd()", irq_fd[0]));
-
-		irq_fd[1] = eventfd(0, 0);
-		TEST_ASSERT(irq_fd[1] >= 0, __KVM_SYSCALL_ERROR("eventfd()", irq_fd[1]));
+		irq_fd[0] = kvm_new_eventfd();
+		irq_fd[1] = kvm_new_eventfd();
 
 		irq_routes.info.nr = 2;
 
@@ -569,15 +566,8 @@ int main(int argc, char *argv[])
 
 		vm_ioctl(vm, KVM_SET_GSI_ROUTING, &irq_routes.info);
 
-		struct kvm_irqfd ifd = { };
-
-		ifd.fd = irq_fd[0];
-		ifd.gsi = 32;
-		vm_ioctl(vm, KVM_IRQFD, &ifd);
-
-		ifd.fd = irq_fd[1];
-		ifd.gsi = 33;
-		vm_ioctl(vm, KVM_IRQFD, &ifd);
+		kvm_assign_irqfd(vm, 32, irq_fd[0]);
+		kvm_assign_irqfd(vm, 33, irq_fd[1]);
 
 		struct sigaction sa = { };
 		sa.sa_handler = handle_alrm;
-- 
2.49.0.504.g3bcea36a83-goog

