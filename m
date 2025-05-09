Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AB2295D84
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 13:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746796651; cv=none; b=bwc7P5BbWP1Ec4C0yS6LXbv42omyRvkJqjvHT3+/RlGvPoVIVjr2lQBSefuAm5Rk8o/jk8IBzNguoBp/+fSr4+ZRAuAUpcp0RCc/b6+NV7ULM6RMS9wcoA16vEYCQQUq9vD0rQNt4eqrG1yzgVbNgphbAlmi+BG3SbJHVHqOYqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746796651; c=relaxed/simple;
	bh=4XzFUi2IUGhuTAc22HpxKl0V29jC7HNRX5NluMAstk8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=A5L5A4dA5QXTeajoKOW1ryzWLWK0UU7wTiYo4cyKgAlgwE3zIt7E99u5oeWNAaENsJUMFLW/8iUeGVSJecGbkDNjrK1CnP8fIN4t6hanJkzj5akQFtv9vD/cqE2RKhEe5zCHFQ4GCTwtse3RpXxrGVEOJ3DKFJWmsdd0rCUtel8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MkwBjTTA; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MkwBjTTA"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43efa869b19so13916335e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 06:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746796648; x=1747401448; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iY9xHEFUpTNbpzkbkz6w6fJAjv29kAFcmljY+gYvWx4=;
        b=MkwBjTTA5AaVevaK7oS8CDnf1ydaWKqlnIF7F0K+59D4/wFiRMfUGrP/TXy3sOvRvV
         iW35LfNYyaYoT8hlvmauPieekINGUJEK6Ne1Akcq7VJtKbaYIdO6i1R28cPFkcJea8e2
         pd05EoGHOb6z8/WPNLj9MF+j8Sc5F9mW6D2bsVUQZ1WAlC4eeiWkocUDdN2ZvWrekp7W
         l9UA2oIF6+Kn97lV+8deBEIioJxoOdULxw+Plhkp8U6DyuoZIpNm4QiFvLOoLqwRpkd3
         XlfoY8B5s63v8s3mPcVEHA1rQ9xtaZna+nEUSHk61KkIhTEYc/a1gvtpbLcKn5200b/w
         jTdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746796648; x=1747401448;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iY9xHEFUpTNbpzkbkz6w6fJAjv29kAFcmljY+gYvWx4=;
        b=Iag/OCWtZT5Zb0MpRnfqQxFK7V2KbbMSSKAdWCnq19TV8MJ3mOxUUQM/4m2WBDAGam
         4qhEd0CwsqkluZfQhFLKh+27Hu5FwdMrTGgQoo1MMFqvBIZNiUGtrntJRZU46nD8wUpb
         v4HscnEn2ay/h+m9o+0+QeQiqVJU/BLXJ776vH1H1TL+9iGOpGUPGZwkR3eXg4b72Cae
         0WO+o7hE2b+qpVyMcW7PBYwhxjgmv/aFH65SQJUV6ieKe2GL3CJ9GP+g/a3ZfUYlWU7M
         PLhDyy0Ker+hiNHm+Z6i6zsQcNEFrGCnFWyDoCvOqkMh595d5BRFOcc3GeY3G6XUwsvn
         W9DA==
X-Forwarded-Encrypted: i=1; AJvYcCVabesUeHIle5TumFF4MTU0Mao3fomRUN++KoRcGSLXxH+DIE9UICULw81ksZgz7v2KDL+4881mxMm3Rd4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxW0MJgFO7E+Dx0FF0UjMarckSKllnsY7kkZIfQ1VMgxeOMJips
	SHNxfoUodYDv1dkNqkg3onMTnGeqtRz41etmE5qNltAkrqkIVqL9dMTNMIsYBAPX1eAwR3MnwDj
	yLhmHfgB8PA/f6FE5IQ==
X-Google-Smtp-Source: AGHT+IEF+XO6uPZe1MEto7eLqAL+0iiIrzIwhxZbJdzOlJd1PeGxlk1/ZzYpvt4tHE4RjgjMniLCrdsLZfZB2R8i
X-Received: from wmbdq15.prod.google.com ([2002:a05:600c:64cf:b0:441:bf4e:899c])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3e8c:b0:43c:f969:13c0 with SMTP id 5b1f17b1804b1-442d6ddec16mr29442225e9.29.1746796648033;
 Fri, 09 May 2025 06:17:28 -0700 (PDT)
Date: Fri,  9 May 2025 14:17:05 +0100
In-Reply-To: <20250509131706.2336138-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250509131706.2336138-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Message-ID: <20250509131706.2336138-10-vdonnefort@google.com>
Subject: [PATCH v4 09/10] KVM: arm64: Stage-2 huge mappings for np-guests
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Now np-guests hypercalls with range are supported, we can let the
hypervisor to install block mappings whenever the Stage-1 allows it,
that is when backed by either Hugetlbfs or THPs. The size of those block
mappings is limited to PMD_SIZE.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 78fb9cea2034..97e0fea9db4e 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -167,7 +167,7 @@ int kvm_host_prepare_stage2(void *pgt_pool_base)
 static bool guest_stage2_force_pte_cb(u64 addr, u64 end,
 				      enum kvm_pgtable_prot prot)
 {
-	return true;
+	return false;
 }
 
 static void *guest_s2_zalloc_pages_exact(size_t size)
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 754f2fe0cc67..7c8be22e81f9 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1537,7 +1537,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	 * logging_active is guaranteed to never be true for VM_PFNMAP
 	 * memslots.
 	 */
-	if (logging_active || is_protected_kvm_enabled()) {
+	if (logging_active) {
 		force_pte = true;
 		vma_shift = PAGE_SHIFT;
 	} else {
@@ -1547,7 +1547,8 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	switch (vma_shift) {
 #ifndef __PAGETABLE_PMD_FOLDED
 	case PUD_SHIFT:
-		if (fault_supports_stage2_huge_mapping(memslot, hva, PUD_SIZE))
+		if (!is_protected_kvm_enabled() &&
+		    fault_supports_stage2_huge_mapping(memslot, hva, PUD_SIZE))
 			break;
 		fallthrough;
 #endif
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 0e30f16149d5..9504169fb37f 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -328,7 +328,7 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
 	u64 pfn = phys >> PAGE_SHIFT;
 	int ret;
 
-	if (size != PAGE_SIZE)
+	if (size != PAGE_SIZE && size != PMD_SIZE)
 		return -EINVAL;
 
 	lockdep_assert_held_write(&kvm->mmu_lock);
-- 
2.49.0.1015.ga840276032-goog

