Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66CC20ED
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 12:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750854667; cv=none; b=NBKlGsEaP/RkOrvg8hi83ncWUWLFR8I4isXkwVYoBVUCyRrWHz4qusgQ4mgqMKHha+q9ipT6MYKg4XwrRwrxRLq5I0PRg3Ma8Fbr+yOB4An5ZAxyzfFCgBK7+7wisAHpOjQvvQ4obCW5LVUi2RWrFQCzdrlRfZatt8qT0bZOhvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750854667; c=relaxed/simple;
	bh=qelaXKw8Ql/+34guQgLntK0jX11q7WZYCH/Gn7LwMUE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ACxae4pA/lqDEaJDJe4h+QpgdBmoj4oQ7+frMDYX7q3zTKNroj+G4jaJ6KqtspD7onuJV4g14mfGhB+OgAZwcNbAvP/lnNBa3Yab6y/pFxffXIdCGwHtDoHz+FY30APYFNdFZpxXa1GbKT4MiuCNn64IQP7HkgNTvrMHt87wziM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b7JWzUD5; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b7JWzUD5"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-453691d0a1dso27489275e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 05:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750854664; x=1751459464; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iRi13urPf1s8iS1Y5TOXOPMfOOng2yoJIcbPobf34Z4=;
        b=b7JWzUD5zbBIq5kraWECcaK1nnVMNCRzyQoHup/lPi5NDcetKLc1CGiFu0mu6UGRu6
         9UUHAC6m4Q8q33r3nZ9F8g2GEvKcbRfmZphlGPxQI77t4bwqMdWwgCwAPwcY81dQkMTT
         zSkmDXYKXO05LvuahmCBgCULjCRs2CcRERcL6vkurJGEDzAWBJRTWokYIyTcjaLvY0mI
         4D5H9Lf6I2HFs9q8mrDQBhtkgTlF9XtSRR6sF3FU0vGTc1/QMHM+9EjrJGaqJqgg79mH
         lZXL3fUx9qZEGQrBLpG2so/qfAzyotgDZLay/59qMp6KRMpzJc6+K0Y/X2UIbq0R5HPL
         u7ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750854664; x=1751459464;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iRi13urPf1s8iS1Y5TOXOPMfOOng2yoJIcbPobf34Z4=;
        b=jlLXtxTuX33FZoGJ72X7FEd6oWyZvDgIXkLrMLWFqIsluQPkc+flhkF5lmQ6g3S1Us
         j4UfPS7lcHzGtVJ2q9ZBfsNbjXg2Ac7LDBwhWS+hOMEnXzYCy+D5LxurcZMa3N5/i41f
         bJGgHNlIo/0ywipDiwaG29sqq7sLLp1/gDmHZ0vNs4GQvNwtc/JEJqXwMsc1ggR27DE5
         Pw2prdH57kVP3OMKXR5XOG9gu1GXcXcyU7udpJAWrEh4Qcmv9CXpihWlTd+HFoHt7FnI
         HiCmZn5b5nkEsaHT6ZeWDm4Y8NRhTM0oRMf5XHiV/4QgtC9tBbR/OgAst0qzstj42xHk
         4E1g==
X-Gm-Message-State: AOJu0YwmILzmKo1+lzHPFtRs+aQjA/ABRbtt3hvIqbiL3yPN6dX3PmtZ
	CEyH/AIfjoAjxzs9m2EqTBuS6m3PuBuCIdZMcLK3O+td3Z85PvowomtbESyWI+9x+bn00sC8l8B
	RikKJIxHDvBM0qjKx7WwEMjWTl5NvB1Fu+In05On5m4N21zzHJlteah7iPW4JK1GcYhSjMUrnBI
	SnjSfhOOZ2DwIPVoOW1gZcKS+rtfNOb4fgxu5SngkSAw/b1dfMfSMyXcA=
X-Google-Smtp-Source: AGHT+IEwANlGVnDCXGN7hg9uNGMVTxicEuUKtoVCQA9kfAk4equFrtEicPN5MHaP2YqeylAONmjqdnnDHvce6g==
X-Received: from wmqe9.prod.google.com ([2002:a05:600c:4e49:b0:44a:ebc5:9921])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:34d5:b0:43c:fdbe:4398 with SMTP id 5b1f17b1804b1-45381a9f52bmr26163945e9.6.1750854664293;
 Wed, 25 Jun 2025 05:31:04 -0700 (PDT)
Date: Wed, 25 Jun 2025 12:30:58 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Message-ID: <20250625123058.875179-1-smostafa@google.com>
Subject: [PATCH v2] KVM: arm64: Fix error path in init_hyp_mode()
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

As Quentin pointed, the order of free is also wrong, we need to free
SVE state first before freeing the per CPU ptrs.

I initially observed this on 6.12, but I could also repro in master.

Signed-off-by: Mostafa Saleh <smostafa@google.com>

---
v2:
- Address Quentin comments.
---
 arch/arm64/kvm/arm.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 38a91bb5d4c7..6bdf79bc5d95 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2346,7 +2346,9 @@ static void __init teardown_hyp_mode(void)
 	free_hyp_pgds();
 	for_each_possible_cpu(cpu) {
 		free_pages(per_cpu(kvm_arm_hyp_stack_base, cpu), NVHE_STACK_SHIFT - PAGE_SHIFT);
-		free_pages(kvm_nvhe_sym(kvm_arm_hyp_percpu_base)[cpu], nvhe_percpu_order());
+
+		if (!kvm_nvhe_sym(kvm_arm_hyp_percpu_base)[cpu])
+			continue;
 
 		if (free_sve) {
 			struct cpu_sve_state *sve_state;
@@ -2354,6 +2356,9 @@ static void __init teardown_hyp_mode(void)
 			sve_state = per_cpu_ptr_nvhe_sym(kvm_host_data, cpu)->sve_state;
 			free_pages((unsigned long) sve_state, pkvm_host_sve_state_order());
 		}
+
+		free_pages(kvm_nvhe_sym(kvm_arm_hyp_percpu_base)[cpu], nvhe_percpu_order());
+
 	}
 }
 
-- 
2.50.0.714.g196bf9f422-goog

