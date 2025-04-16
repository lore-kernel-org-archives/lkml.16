Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997092080FF
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 15:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744817223; cv=none; b=JeiBwgIUntpv3EkXW3i2UHbtwhGvhBCdVB3vhrdRLKHNiU+wxLh2dpUsaip8tS64IjbyFBcROyWzCoCSJjL09oZFAdYKRdz8dWfAhGlF0rv+Q3X3DB7PYWa3r9OYBNM7ut7oVd7rjGvwEyUXVGVGqv1WvssPWzIihrgHhqrzaiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744817223; c=relaxed/simple;
	bh=J9Yf6lxkoaWGjJfgEDe4MZh/KA3qtVyYK53UWzW0zEg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=n0gJYXtOc9FNmjMqVeVCHohXe36E4TBpEdI+ui13SSqBRQyUfpXQtNLO+WpEdCZiCY6PJRhS+98kosMq+QrzycsNnqKN+OZajagoITA0QOg9aMuAOAWtLBi3SQGwYdWHRfQOskIItL2WVsZ7YCqF0vFDToZYlLCf+Ig9ydT3MSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--qperret.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MjM/TY9A; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--qperret.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MjM/TY9A"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-ac2bb3ac7edso738376666b.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744817220; x=1745422020; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UXTqFvc4opPwLmL9HAQrXX66kUt2kBii3Ie6HubIYaY=;
        b=MjM/TY9ACHQE1ZmMKF5ofuuwpOTGhcn5KSFYjm9kEAY7knvQZ1QVG3JZW2lOLbQq+p
         TeSW8iCQbdfZoHziAX9XtwabfuoBjuTXXz0/33+qP2dj5LuOyuTqCoOCLYoEhHhmA17S
         ZEp8mvzepWmeCiXLjcRqu2B/880V7prvYArQfZUN0QBvJOWTne3Pvbqwe9jQPOPbQ2X3
         21qmR3UL1Q2NnEn19qypIlSm9Uv6ttMl0Rpdnrk2VC7zWP0IFL+jY4ggUBbo2HwW2b+y
         dmcSv6UmgoKfCknCQ2WgneTZ2HC+cfuMQV4X3K7CjNgxSb5LJ2kalpsTHd1o9Llmwluq
         rQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744817220; x=1745422020;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UXTqFvc4opPwLmL9HAQrXX66kUt2kBii3Ie6HubIYaY=;
        b=E5TSoR/z3m5GFzm5hOb7hwKs6n1S8Fcd9E+ry4SQpiUTuqzY06rb+L5mdPtVPfylC+
         3LY88BVD8V+IPQDDKWRKyY5NZ/j8AaP88Aw4LKKKsx6KW+cDyiIVfqMObhKppWFNB34Q
         tGQMQGXcJBrOBCMoS/hd70/SLHyFwa+v3kyoTgPUBUA6FqCKrUQ3XIARFj5fBmx2j3LD
         9jORDb35sTJlhoXW7EegJ30CnVweMih0EzWv4kieqOUkbSNunF5iph9dWQfdpjml8Vz5
         hY8kWXXxUzEBEjnytyZZdhigShAsl9W6Xqn0+zOR8aH+QzngVlwlSYEhjxomb3SoxgKL
         4m0w==
X-Forwarded-Encrypted: i=1; AJvYcCXbjinVh+rPTJNgIngVkuqkjYXHMclPAoorz3xSCSAlhrdT6IBsrLXlwzDtvlB8NoxiCzzHm92Ctzf4+Ls=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxYnn37j9xKYmQShwR05ohBLHRPJHYQ9nv5TXXMYLYE/nQ6dib
	GbizdSebrFglutT3bf7zPr7+DbD6Q0yT4Yejn+OjSDMSLKruqO66vIj/Z0S7a9xx+Kc2jaO34W6
	LUdc3Jw==
X-Google-Smtp-Source: AGHT+IEu+nQt3ZvaltJ8ile4BL4Mx8RMjIE5u1QNIcuD+qDhprPfJ5PQQJQVdc2cu/l2DfDtzKgEXuEQXODM
X-Received: from edod3.prod.google.com ([2002:a50:ea83:0:b0:5ec:289d:754b])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:9408:b0:abf:6ec7:65e9
 with SMTP id a640c23a62f3a-acb42b6cbddmr211529666b.43.1744817220022; Wed, 16
 Apr 2025 08:27:00 -0700 (PDT)
Date: Wed, 16 Apr 2025 15:26:44 +0000
In-Reply-To: <20250416152648.2982950-1-qperret@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250416152648.2982950-1-qperret@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250416152648.2982950-5-qperret@google.com>
Subject: [PATCH v2 4/7] KVM: arm64: Introduce {get,set}_host_state() helpers
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, Fuad Tabba <tabba@google.com>, 
	Quentin Perret <qperret@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Instead of directly accessing the host_state member in struct hyp_page,
introduce static inline accessors to do it. The future hyp_state member
will follow the same pattern as it will need some logic in the accessors.

Reviewed-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/memory.h | 12 +++++++++++-
 arch/arm64/kvm/hyp/nvhe/mem_protect.c    | 14 +++++++-------
 arch/arm64/kvm/hyp/nvhe/setup.c          |  4 ++--
 3 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/memory.h b/arch/arm64/kvm/hyp/include/nvhe/memory.h
index bf28f9f9de65..a1754aecf8f8 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/memory.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/memory.h
@@ -52,7 +52,7 @@ struct hyp_page {
 	u8 order;
 
 	/* Host state. Guarded by the host stage-2 lock. */
-	enum pkvm_page_state host_state : 8;
+	unsigned __host_state : 8;
 
 	u32 host_share_guest_count;
 };
@@ -89,6 +89,16 @@ static inline struct hyp_page *hyp_phys_to_page(phys_addr_t phys)
 #define hyp_page_to_virt(page)	__hyp_va(hyp_page_to_phys(page))
 #define hyp_page_to_pool(page)	(((struct hyp_page *)page)->pool)
 
+static inline enum pkvm_page_state get_host_state(phys_addr_t phys)
+{
+	return (enum pkvm_page_state)hyp_phys_to_page(phys)->__host_state;
+}
+
+static inline void set_host_state(phys_addr_t phys, enum pkvm_page_state state)
+{
+	hyp_phys_to_page(phys)->__host_state = state;
+}
+
 /*
  * Refcounting for 'struct hyp_page'.
  * hyp_pool::lock must be held if atomic access to the refcount is required.
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 2a5284f749b4..e9060e6205cb 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -467,7 +467,7 @@ static int host_stage2_adjust_range(u64 addr, struct kvm_mem_range *range)
 		return -EAGAIN;
 
 	if (pte) {
-		WARN_ON(addr_is_memory(addr) && hyp_phys_to_page(addr)->host_state != PKVM_NOPAGE);
+		WARN_ON(addr_is_memory(addr) && get_host_state(addr) != PKVM_NOPAGE);
 		return -EPERM;
 	}
 
@@ -496,7 +496,7 @@ static void __host_update_page_state(phys_addr_t addr, u64 size, enum pkvm_page_
 	phys_addr_t end = addr + size;
 
 	for (; addr < end; addr += PAGE_SIZE)
-		hyp_phys_to_page(addr)->host_state = state;
+		set_host_state(addr, state);
 }
 
 int host_stage2_set_owner_locked(phys_addr_t addr, u64 size, u8 owner_id)
@@ -627,7 +627,7 @@ static int __host_check_page_state_range(u64 addr, u64 size,
 
 	hyp_assert_lock_held(&host_mmu.lock);
 	for (; addr < end; addr += PAGE_SIZE) {
-		if (hyp_phys_to_page(addr)->host_state != state)
+		if (get_host_state(addr) != state)
 			return -EPERM;
 	}
 
@@ -637,7 +637,7 @@ static int __host_check_page_state_range(u64 addr, u64 size,
 static int __host_set_page_state_range(u64 addr, u64 size,
 				       enum pkvm_page_state state)
 {
-	if (hyp_phys_to_page(addr)->host_state == PKVM_NOPAGE) {
+	if (get_host_state(addr) == PKVM_NOPAGE) {
 		int ret = host_stage2_idmap_locked(addr, size, PKVM_HOST_MEM_PROT);
 
 		if (ret)
@@ -911,7 +911,7 @@ int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu,
 		goto unlock;
 
 	page = hyp_phys_to_page(phys);
-	switch (page->host_state) {
+	switch (get_host_state(phys)) {
 	case PKVM_PAGE_OWNED:
 		WARN_ON(__host_set_page_state_range(phys, PAGE_SIZE, PKVM_PAGE_SHARED_OWNED));
 		break;
@@ -964,9 +964,9 @@ static int __check_host_shared_guest(struct pkvm_hyp_vm *vm, u64 *__phys, u64 ip
 	if (WARN_ON(ret))
 		return ret;
 
-	page = hyp_phys_to_page(phys);
-	if (page->host_state != PKVM_PAGE_SHARED_OWNED)
+	if (get_host_state(phys) != PKVM_PAGE_SHARED_OWNED)
 		return -EPERM;
+	page = hyp_phys_to_page(phys);
 	if (WARN_ON(!page->host_share_guest_count))
 		return -EINVAL;
 
diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
index d62bcb5634a2..1a414288fe8c 100644
--- a/arch/arm64/kvm/hyp/nvhe/setup.c
+++ b/arch/arm64/kvm/hyp/nvhe/setup.c
@@ -201,10 +201,10 @@ static int fix_host_ownership_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	case PKVM_PAGE_OWNED:
 		return host_stage2_set_owner_locked(phys, PAGE_SIZE, PKVM_ID_HYP);
 	case PKVM_PAGE_SHARED_OWNED:
-		hyp_phys_to_page(phys)->host_state = PKVM_PAGE_SHARED_BORROWED;
+		set_host_state(phys, PKVM_PAGE_SHARED_BORROWED);
 		break;
 	case PKVM_PAGE_SHARED_BORROWED:
-		hyp_phys_to_page(phys)->host_state = PKVM_PAGE_SHARED_OWNED;
+		set_host_state(phys, PKVM_PAGE_SHARED_OWNED);
 		break;
 	default:
 		return -EINVAL;
-- 
2.49.0.604.gff1f9ca942-goog

