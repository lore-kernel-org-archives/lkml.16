Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5162E6126
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 19:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749842091; cv=none; b=WpnybSdW2p6ksMK0nEUBGeLPdSIfp4f36DJt6HKH2/SNfjX0+HX7fMnhq3x9St04N/+cuSjNQxJ3zzimT/z0+QF8EBFf+y7HlPf5WI61fkLc3trwVYn+qHc8s7hBJScYnaE76Br8E7Q/hYhyQvoEzmczYVlBUWNGdzKzFG2E6ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749842091; c=relaxed/simple;
	bh=EYmmSlBF4C/72f7adu2xrFOYMqAVykY+Yges75e1mk4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=piG6osvPLLCoS6KUZZRvvQxxuZpS2b+Bdng9j64YFMiEaKOK7n6HTIPOmmF6NxdxUOivR95XfMGEXxt8SOWLQ+trTxCGj1uEqzmndBZgV2y50vdYaxQW1gdxnoOpm928k4LeWySaUbAmQdnmLfyeNbzJMBdiYwZ4nlxpNg4/ULE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sagis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mc03Tefr; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sagis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mc03Tefr"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7462aff55bfso1856311b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 12:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749842090; x=1750446890; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uQS9KEcxjrfBhT5g6y6btmmw0Zrm/EBAnz28lESsUJQ=;
        b=mc03Tefrk34C1Ez1tsp8bzS/pW5L/dgSM+oDnEu8kCEz/Hf89u5nPArn3PDYVLZZwh
         mHlLRe4CIAVX/6f3Q37gpzPfFUFVhJS3fxHA1fuWIi3xOPTvPG3ZIq7tADUB4UZq/CXd
         6/FtXg7QLDu4mJIhfHoRK/IZHUQKK9jsQOx7Ofyv5o5apTWYHMF7Fo+IVtv3se5WUaLg
         Hduq0xJZBM+yO1JHaTsdyuBtVjbMRWuJDHsNKEh/qcOf1yWXprixmY+PNDqinuSz3KGg
         Sm1UiRxFUiuW/FlVIOiVpIRFj7rXS4b+Ut+KaH4zCCfPoxJhZwCFCeoviz4jEVFpZ0EH
         /Btw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749842090; x=1750446890;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uQS9KEcxjrfBhT5g6y6btmmw0Zrm/EBAnz28lESsUJQ=;
        b=YWuszAyXE0ADcFZh5+SLWlnQC75xL+HnTZNDhzEYKD46r2HizHT9PhUyWKqwBzb3Sz
         pL9SJHgu2oiHj8RRSxsMHNzJFya+VXEmoniSpznV6WtVnaxGZ9mHe+Zi7H78lX7aOHg7
         zk+bAqh5xdbAnP0iwsaJaDa68MuOeYmL78tuNqyBjn1oUI52hjjHmOlEudM8K4KyZJkO
         S6eyVU5XjJ4C2vytL4LVySE8jYuaRAalLtXetDEPCR+izrTTe9s9QCdi3NvJYenAJ6fx
         KP4z4MrLHTcl3PYzWqT6m2PCBPPJbq13TSHL9XxJqdHFxoiykyrpOCesApKJqV8pEh4V
         v7ZA==
X-Gm-Message-State: AOJu0Yxh7/cZA4mGTY9O7ed/qyHHhjmrCVblA33zrdx/pMWGBLyl0+TJ
	poNNwYAJVgwARrdOojrjsoixxfKrjsbOC1MXE/VrjYKvOp5Ru9l2xhS/pBqDljWTJLtTr8cFRp2
	0cw==
X-Google-Smtp-Source: AGHT+IEOP4GrUzQcNjvdcHvZ0T90I3oYrH2Eb488bsbJSQug0p1LrqzO/9hpSqb5M4HMhpMKbNB+gqPsIg==
X-Received: from pfbhx21.prod.google.com ([2002:a05:6a00:8995:b0:747:a9de:9998])
 (user=sagis job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2185:b0:736:a8db:93bb
 with SMTP id d2e1a72fcca58-7489cdedbb5mr672632b3a.5.1749842089751; Fri, 13
 Jun 2025 12:14:49 -0700 (PDT)
Date: Fri, 13 Jun 2025 12:13:52 -0700
In-Reply-To: <20250613191359.35078-1-sagis@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250613191359.35078-1-sagis@google.com>
X-Mailer: git-send-email 2.50.0.rc2.692.g299adb8693-goog
Message-ID: <20250613191359.35078-26-sagis@google.com>
Subject: [PATCH v7 25/30] KVM: selftests: KVM: selftests: Expose new vm_vaddr_alloc_private()
From: Sagi Shahar <sagis@google.com>
To: linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Ryan Afranji <afranji@google.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Sagi Shahar <sagis@google.com>, Roger Wang <runanwang@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Oliver Upton <oliver.upton@linux.dev>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Ackerley Tng <ackerleytng@google.com>

vm_vaddr_alloc_private allow specifying both the virtual and physical
addresses for the allocation.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Sagi Shahar <sagis@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h | 3 +++
 tools/testing/selftests/kvm/lib/kvm_util.c     | 7 +++++++
 2 files changed, 10 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 2e444c172261..add0b91ebce0 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -652,6 +652,9 @@ vm_vaddr_t __vm_vaddr_alloc(struct kvm_vm *vm, size_t sz, vm_vaddr_t vaddr_min,
 vm_vaddr_t vm_vaddr_alloc_shared(struct kvm_vm *vm, size_t sz,
 				 vm_vaddr_t vaddr_min,
 				 enum kvm_mem_region_type type);
+vm_vaddr_t vm_vaddr_alloc_private(struct kvm_vm *vm, size_t sz,
+				  vm_vaddr_t vaddr_min, vm_paddr_t paddr_min,
+				  enum kvm_mem_region_type type);
 vm_vaddr_t vm_vaddr_identity_alloc(struct kvm_vm *vm, size_t sz,
 				   vm_vaddr_t vaddr_min,
 				   enum kvm_mem_region_type type);
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 14edb1de5434..2b442639ee2d 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -1503,6 +1503,13 @@ vm_vaddr_t vm_vaddr_alloc_shared(struct kvm_vm *vm, size_t sz,
 	return ____vm_vaddr_alloc(vm, sz, vaddr_min, KVM_UTIL_MIN_PFN * vm->page_size, type, false);
 }
 
+vm_vaddr_t vm_vaddr_alloc_private(struct kvm_vm *vm, size_t sz,
+				  vm_vaddr_t vaddr_min, vm_paddr_t paddr_min,
+				  enum kvm_mem_region_type type)
+{
+	return ____vm_vaddr_alloc(vm, sz, vaddr_min, paddr_min, type, true);
+}
+
 /*
  * Allocate memory in @vm of size @sz beginning with the desired virtual address
  * of @vaddr_min and backed by physical address equal to returned virtual
-- 
2.50.0.rc2.692.g299adb8693-goog

