Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB83321CC4D
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 10:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750932620; cv=none; b=MX8jTxnE7WaymKGf+P2FAhJY6zCJDDdcANaL4gC6VL/8u30Pz7W3YBPfsx6Z+mOO74y13zjc+yHKszb6YJYcYL7KxejSWhAOyf/oaHd0lhuTyI1oGIaCwPftylY/Ura3rUQAtTyKJs/13mpwErU5PwoTWDxgXfEBwyzzJRHHHrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750932620; c=relaxed/simple;
	bh=DKVjNysQiPg44WHFvqc/jybFh9qT2hEaqcBWlu8MgG4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=SQy4l8VeUNXjnsrEDkvz2bqQPJB4znIxaHg8Bls+bzHt6A4MYhuLKtPTCo5A7M7fBbwuk3i0Nd4fmxgb7/xAXJ3JGhAulfaDmBEtXhhTuf3GTYBUKNF7aV7l6jjzMBnGuLzyNJao71xu1AYj6kjnJQ5qzgSbgGMas5FhQJRVkjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--qperret.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=amihLVRP; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--qperret.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="amihLVRP"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-60995aa5417so646462a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 03:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750932617; x=1751537417; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TP7OERsBD0AIL6q0/hWWV2FPerGoaJHuU25B69zEssI=;
        b=amihLVRPYmGOb+7AQvPfqjsMjviHpcJpXTVajK3rMu3eMqM1DjKcS7hUq1hrcJ5Bd7
         eRWdPhFl8B9de3xw3vP4t/M0gvupYV9QUlgMrDnwIgwK6FyWcED2cjX8zJ4ZchyyJOm2
         o8jiujvewxCceK0nszQKNQbgWnCDc1z0Waf1dAfPHioPOJPaIpEP5hLAdZfaDrIwzypW
         hYlbzu9GIrLJIR0dJNMfxMdDCqOYBebtlHTiUa6ZTIWrNfdDj4sGenTASMSjadhWpWy8
         gaQTXBnzIJZdu1jkzFM1HhokXX0teTVIyol1dcdTiZEThFXWbMPU7fTaUQbjzn8r6VeK
         hh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750932617; x=1751537417;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TP7OERsBD0AIL6q0/hWWV2FPerGoaJHuU25B69zEssI=;
        b=uMrYNVPZ0x5Yw0jii8IaEUFdsFfziahP8Zk3/4YyMBY1/IWI27fG0Tbk/Pra4BlA+J
         +eYOJ1HmCJ6EZE/uf3yDOyRQFHyHBZwzMwEgXvEB4cknd+phQp0ldW2Q1cTNfJnLYGkA
         BCHder81JFqMQog2H80+OjyUB23juLBmXtUQJSkHlkj6Ha/m9gFTdUTtLMahi//rcjq6
         978YDJt6eh66eGWXmwvX63czFSqnIYxugyWPLngtUgTUKItTPGiDmoujbDesYZKSm1dr
         ApUB8ja9xG77QrQAyXqKPRV2DQfGhyMcYHuuXgqMhGdl0V9kU6gXzZCuRnyaCkLoS2kr
         Xs6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWKkgNZV+S+KWnPXUAF4d1m3c1uNIKhGnNy2AJm3Gg3y/WsnhmEcCwHkq4w0LEVo6uIqbLhihcZOg4wIeY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhZYA/E2RRKz//BzyK8Zjb6SxOxbcfws3+I8CcN/V6HI3T8ZPq
	oun4wwGjk0pv/pVR3sIlE0RJfUFJLPvm+0FeZ73x28Rsvd64MecscEtv8/J1KJTE6OnimqS6o4u
	qcz7gKnIt/g==
X-Google-Smtp-Source: AGHT+IEep39DiT0nAnVXFppD+aWUwOIVpbsw7STELNO8ls+qxpoksuLe5NaSudBMyzv7SiB61C4OREGYZWCw
X-Received: from edvo20.prod.google.com ([2002:a05:6402:394:b0:606:e3fd:b317])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:4309:b0:608:48b0:5e88
 with SMTP id 4fb4d7f45d1cf-60c4dd42daamr6239997a12.18.1750932617018; Thu, 26
 Jun 2025 03:10:17 -0700 (PDT)
Date: Thu, 26 Jun 2025 10:10:14 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250626101014.1519345-1-qperret@google.com>
Subject: [PATCH] KVM: arm64: Don't free hyp pages with pKVM on GICv2
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Mostafa Saleh <smostafa@google.com>, Quentin Perret <qperret@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Marc reported that enabling protected mode on a device with GICv2
doesn't fail gracefully as one would expect, and leads to a host
kernel crash.

As it turns out, the first half of pKVM init happens before the vgic
probe, and so by the time we find out we have a GICv2 we're already
committed to keeping the pKVM vectors installed at EL2 -- pKVM rejects
stub HVCs for obvious security reasons. However, the error path on KVM
init leads to teardown_hyp_mode() which unconditionally frees hypervisor
allocations (including the EL2 stacks and per-cpu pages) under the
assumption that a previous cpu_hyp_uninit() execution has reset the
vectors back to the stubs, which is false with pKVM.

Interestingly, host stage-2 protection is not enabled yet at this point,
so this use-after-free may go unnoticed for a while. The issue becomes
more obvious after the finalize_pkvm() call.

Fix this by keeping track of the CPUs on which pKVM is initialized in
the kvm_hyp_initialized per-cpu variable, and use it from
teardown_hyp_mode() to skip freeing pages that are in fact used.

Fixes: a770ee80e662 ("KVM: arm64: pkvm: Disable GICv2 support")
Reported-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Quentin Perret <qperret@google.com>
---

This patch depends on Mostafa's recent fix for teardown_hyp_mode():

  https://lore.kernel.org/kvmarm/20250625123058.875179-1-smostafa@google.com/
---
 arch/arm64/kvm/arm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 6bdf79bc5d95..b223d21c063c 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2129,7 +2129,7 @@ static void cpu_hyp_init(void *discard)
 
 static void cpu_hyp_uninit(void *discard)
 {
-	if (__this_cpu_read(kvm_hyp_initialized)) {
+	if (!is_protected_kvm_enabled() && __this_cpu_read(kvm_hyp_initialized)) {
 		cpu_hyp_reset();
 		__this_cpu_write(kvm_hyp_initialized, 0);
 	}
@@ -2345,6 +2345,9 @@ static void __init teardown_hyp_mode(void)
 
 	free_hyp_pgds();
 	for_each_possible_cpu(cpu) {
+		if (per_cpu(kvm_hyp_initialized, cpu))
+			continue;
+
 		free_pages(per_cpu(kvm_arm_hyp_stack_base, cpu), NVHE_STACK_SHIFT - PAGE_SHIFT);
 
 		if (!kvm_nvhe_sym(kvm_arm_hyp_percpu_base)[cpu])
-- 
2.50.0.727.gbf7dc18ff4-goog

