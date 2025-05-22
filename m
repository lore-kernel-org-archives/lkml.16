Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1932E3375
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 23:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747957976; cv=none; b=oHH+XW8FhGPRMgO40dUBP1zHqzlyK52U7WqwwA7O48C6UpICfq9p0kvzkDyFcqFul5cQgIrMlNAutgzeWhgxBAdIHwvDnS6OeAu9Gej4Eetobqr3j0IWc07GdkPtzt2q6iZ4U85grFvdCwD+QoZXmD+x1mnD2NqtH1mKRUUuvsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747957976; c=relaxed/simple;
	bh=gLdwd1sbkJEcZs1IEVaRfWUXkNSzfXvHtgjA2aYSHac=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oVOvHNTIM4MTPk12vFJr2XnnOABRsj15nah5vwZbDPuzK2lMDJ4+2CbQghDC/1Cx8GeZKFVmSDAinxXe5OLCZzkxjz00Kvr8WG3igA2IDB13vv1B2QwKe31MVqERNwzmZZk55YQorLDBJ62Y+NDUU14VykJdEsvHmrHdnvPdvDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AutYh9t4; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AutYh9t4"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-742aa6581caso6155933b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 16:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747957974; x=1748562774; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=EKiGsGdj01NsitpTuPJ3Ew8X7lvRxIwEPSz2u8YI9Cs=;
        b=AutYh9t4YSwwTwf4IFTDPN2sw7vFZEs6x737T8za8dr+b7a6aD5NsOH9YcMyE8hACk
         eG1LobvQhOIphwEJSfR/hNI6GM1LFwtjsiY9CwNKn11DeIIca/pljzAAKEOZWOSsubJO
         hCNmzkpitI4LI1mQAIpIZmwG4xyj0sRlOPdbROlaFQtnwXfw8utMVnoeEkUE6SZf6bRC
         +UAolP2OFJu619tQSF6f6wzFS+GclpLKwWPigaAYwuuxfWYOL3JE4H4HOtjNQbJEF8Cu
         3FsPkfU8HTYkw9ZQs1Ya66zELwozD89JniaIYsE3TQWEiAAxI38dbA7GOOTqRpGjLKio
         NwtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747957974; x=1748562774;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EKiGsGdj01NsitpTuPJ3Ew8X7lvRxIwEPSz2u8YI9Cs=;
        b=TSVHAu2I+OraLfqydTr200NVImt9fa6dcreCCpMEmpH+CdZN2EYgj+biLPmxc4fwca
         6nyEF73VVGy9z8ZK5GoT2zefERry2fKePSbq6EJ6Jd4lfyOQiCMh8XNBLnQPP729gUbB
         Hy+xZKd0Ewa5LUa/0OfN8G8UU/5XWE1u/flGnoijK2hZr4/gN30z/ZDC5ig0/aRcLj0r
         zL5cRkAt4rO+GmOiMZnkwBKPEwJidIT/ZhhHA5EoyoBOq49HGftv0HhWH6BSo77pFNYr
         bFq8x/1NmpSILOMGKrwIvOeGB4Svewbo+NBJtV1Q5HN1qyc7p0CGg2NZ3KvnZu4QItfa
         gDpg==
X-Gm-Message-State: AOJu0YwlUHVJJ2EYdJ3TKfjgjepwwvH3Mx5K2rhaJ+HwyVC5hpwpdOcd
	0YViJih4GMovdnwZ6YwEdc+dn9emFNa0vSuSVHJ9T1CpYgu6gTrkUzgnmYZy0LkTeGd7z454zxa
	F7C3fOA==
X-Google-Smtp-Source: AGHT+IFfHuwPoraxH7fHOxcJKjCs5i19crB1g3gqYt+qVLkDFB/zR2OG4BEQkHLANHuLxCZWJd/rEXtT30s=
X-Received: from pga16.prod.google.com ([2002:a05:6a02:4f90:b0:af2:3385:de87])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:d527:b0:206:aa42:8e7c
 with SMTP id adf61e73a8af0-2170cc715a0mr39501029637.18.1747957974292; Thu, 22
 May 2025 16:52:54 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 May 2025 16:52:22 -0700
In-Reply-To: <20250522235223.3178519-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250522235223.3178519-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522235223.3178519-13-seanjc@google.com>
Subject: [PATCH v3 12/13] KVM: selftests: Add utilities to create eventfds and
 do KVM_IRQFD
From: Sean Christopherson <seanjc@google.com>
To: "K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Shuah Khan <shuah@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Sean Christopherson <seanjc@google.com>
Cc: linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, K Prateek Nayak <kprateek.nayak@amd.com>, 
	David Matlack <dmatlack@google.com>
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
2.49.0.1151.ga128411c76-goog

