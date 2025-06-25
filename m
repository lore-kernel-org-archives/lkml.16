Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9998725C834
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750851205; cv=none; b=ub2mRdZiZufVPw955YQxDGLKFsMUSMYBEOMxdScGd+q2a2lgHchPL5T5HtWo/xWxW+rwWkQYM62+KABktHtFujPv6+QzdHpE+HhFqfAUiAfI1PatBaToN6uU9L5eGRjyfLa4JjP0mjCCzcAVuyo3F/XMSrEF/8dySntKFZVMzLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750851205; c=relaxed/simple;
	bh=/cwfe7cQie7eRGu4mTNSb1C1PMIa0UZgfLu+KikXDvc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=oSP3NbCB8wn47d7Z3kn8InPNRHg5Qxk51DNC6lvUv24ZHcTceDO1+1diUDJ6BvG8nnSG8HUqzUB0KMq8854STOhtrg+Qu6UduC+Zlhdnp3EN7RTM7o3RNjG3dsKphqkwiev8IiTp3w7bBDI+4rnPY7y5RNPhC+AC9QCRJM3LP2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hovrZTvJ; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hovrZTvJ"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4532ff43376so52013875e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 04:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750851202; x=1751456002; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2NIlOMIrjnVsdM2AHEMlWacU0EQa3pY5nigk/W+dUCk=;
        b=hovrZTvJa8dK6e1NnyAukpuSGDzRxhBeuADMPg3CA3OT56m7t11Oitb/lM/UUSZFAQ
         I15LVZzb2ahCXdOQ9mUKetQ9GmllC4T87zJrgMzYaxKX9AVYHCH+GtPbHr5GpeKhQ+Yc
         L+H8QCXj+PgVzBiHhZQeg+thT9hesqADqv4/r4F8EEcTD0t9r9RTnUm4fGHSCAswDjnV
         D7KXGOHocLABNyHZCj1G+fDxQUh0YonSQoidt8ixFjXsjGmv/YkrP+i+QWctssyyGiIW
         q3fmZAFTpf+wv2rXfjWFHLVkePdN4mV175zy8UXyit1P8Jfw0RTGFfi1hAcQVuteyZ2j
         +vsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750851202; x=1751456002;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2NIlOMIrjnVsdM2AHEMlWacU0EQa3pY5nigk/W+dUCk=;
        b=e5XKWjO+GVwHEiiL0LCOyrjySBe0KD8KJ6V72iSDJaxEPSkbCUEidMtaQOieK7Ig0G
         Voi83HR71He+y71GIRPsQnKKoagzq5ZKg4+fWUYv3fshuTL1oeTwztTC6YxK/lbRY9Gm
         mSTLjSDdSEA0P3utSaUP9bnGBmpI2wnY+lHmFh2WhgZdTC6r8nG6l17azm/v77nGGiIm
         PIAiX9Kwb/D4KNC3W8Jo7cVaNLmixbkrdudqnLlbOOG8MbfrE52A5wnd64SSlSigQdZi
         6Zy+xcKBSXygcvGVP6esKWva6Ro/z6DugZGqrO5wquxJWpVZoR4Z3YRnssbO7lA/G6hl
         5q5Q==
X-Gm-Message-State: AOJu0Yxd3jKctCanY2AW+Dqi2O5RxzoTC0cUH7yjS5wqDBCaGXaQu0FP
	ErXq2EkjE3IFz5vkZeCOLSnrhKYCLGI0zC7QFkrAdj6+MR+bU3xFqmBf/vMuuxYxeOsqdxz5EHN
	9pkhE0ctBb9QEiySiFTWhIDwSdiTQb98TiIKTADUe+boWhz5sPacUuuu9H8zQ9XZqLs/OIV432Z
	upVcZKyp1EzB08o+B9aBzNKUnMlCqm1VQae2wavH1Mx0GLf/YAJ0Y8ArY=
X-Google-Smtp-Source: AGHT+IFOs0Gi4knoSxkuw3WEzWTeg5pmNz2XOZ2P1IvG2UaOypTfCATZEtKucsPAekJhdqLV//IPLmdoJn1rpQ==
X-Received: from wmbfs5.prod.google.com ([2002:a05:600c:3f85:b0:450:cfda:ece7])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:674a:b0:441:b076:fce8 with SMTP id 5b1f17b1804b1-45381ab25e9mr28886085e9.14.1750851201981;
 Wed, 25 Jun 2025 04:33:21 -0700 (PDT)
Date: Wed, 25 Jun 2025 11:33:01 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Message-ID: <20250625113301.580253-1-smostafa@google.com>
Subject: [PATCH] KVM: arm64: Fix error path in init_hyp_mode()
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, qperret@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

In the unlikely case pKVM failed to allocate carveout, the error path
tries to access NULL ptr when it de-reference the SVE state from the
uninitialized nVHE per-cpu base.

[    1.575420] pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
[    1.576010] pc : teardown_hyp_mode+0xe4/0x180
[    1.576920] lr : teardown_hyp_mode+0xd0/0x180
[    1.577308] sp : ffff8000826fb9d0
[    1.577600] x29: ffff8000826fb9d0 x28: 0000000000000000 x27: ffff80008209b000
[    1.578383] x26: ffff800081dde000 x25: ffff8000820493c0 x24: ffff80008209eb00
[    1.579180] x23: 0000000000000040 x22: 0000000000000001 x21: 0000000000000000
[    1.579881] x20: 0000000000000002 x19: ffff800081d540b8 x18: 0000000000000000
[    1.580544] x17: ffff800081205230 x16: 0000000000000152 x15: 00000000fffffff8
[    1.581183] x14: 0000000000000008 x13: fff00000ff7f6880 x12: 000000000000003e
[    1.581813] x11: 0000000000000002 x10: 00000000000000ff x9 : 0000000000000000
[    1.582503] x8 : 0000000000000000 x7 : 7f7f7f7f7f7f7f7f x6 : 43485e525851ff30
[    1.583140] x5 : fff00000ff6e9030 x4 : fff00000ff6e8f80 x3 : 0000000000000000
[    1.583780] x2 : 0000000000000000 x1 : 0000000000000002 x0 : 0000000000000000
[    1.584526] Call trace:
[    1.584945]  teardown_hyp_mode+0xe4/0x180 (P)
[    1.585578]  init_hyp_mode+0x920/0x994
[    1.586005]  kvm_arm_init+0xb4/0x25c
[    1.586387]  do_one_initcall+0xe0/0x258
[    1.586819]  do_initcall_level+0xa0/0xd4
[    1.587224]  do_initcalls+0x54/0x94
[    1.587606]  do_basic_setup+0x1c/0x28
[    1.587998]  kernel_init_freeable+0xc8/0x130
[    1.588409]  kernel_init+0x20/0x1a4
[    1.588768]  ret_from_fork+0x10/0x20
[    1.589568] Code: f875db48 8b1c0109 f100011f 9a8903e8 (f9463100)
[    1.590332] ---[ end trace 0000000000000000 ]---

It seems also in other cases, it can try to free NULL ptrs, so add the
proper NULL checks in teardown_hyp_mode(), we can skip the loop early
if any of the ptrs is NULL as the order of free matches the order of
initialization.

I initially observed this on 6.12, but I could also repro in master.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/arm.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 38a91bb5d4c7..5bb36c3b06b5 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2344,15 +2344,22 @@ static void __init teardown_hyp_mode(void)
 	int cpu;
 
 	free_hyp_pgds();
+	/* Order matches the order of initialization init_hyp_mode() */
 	for_each_possible_cpu(cpu) {
+		if (!per_cpu(kvm_arm_hyp_stack_base, cpu))
+			continue;
 		free_pages(per_cpu(kvm_arm_hyp_stack_base, cpu), NVHE_STACK_SHIFT - PAGE_SHIFT);
+
+		if (!kvm_nvhe_sym(kvm_arm_hyp_percpu_base)[cpu])
+			continue;
 		free_pages(kvm_nvhe_sym(kvm_arm_hyp_percpu_base)[cpu], nvhe_percpu_order());
 
 		if (free_sve) {
 			struct cpu_sve_state *sve_state;
 
 			sve_state = per_cpu_ptr_nvhe_sym(kvm_host_data, cpu)->sve_state;
-			free_pages((unsigned long) sve_state, pkvm_host_sve_state_order());
+			if (sve_state)
+				free_pages((unsigned long) sve_state, pkvm_host_sve_state_order());
 		}
 	}
 }
-- 
2.50.0.714.g196bf9f422-goog

