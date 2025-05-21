Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEC1267B6D
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 12:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747831870; cv=none; b=KuvQHy690i+JML+JgSw4rDES1GBVumUaoOpXlL0iFMJlQ4CqDzteXZAExYex52pUap64IUtCW20iUuEZOkhvyKP/p7lFCwqbFczpNsVklDJVy50dtM29xfPFnyqUpgatNyuZ4M1Kh+cuXxogM4IVdqviniXlx4tbi6wNUsTBdgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747831870; c=relaxed/simple;
	bh=UbAtLg5BzpIszX+sw31M0F50p9tMAFAKqEZT4GqRiLU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dgnvIR7/eVSTLTve+9kP/EgVM0uRHkGStUw9MOkc/JpVE/xZbfG3bxDV6sTWQVd9sqh1S7o44CDtDxw0A7ntUVt+9hbcU5JSO0gyBTAN8/y1r62jLgN3jQ1OlTKszn2MR4hTB/xcT4G36bmJMYCseqWF/Y6mzb18tVLy6Oiu6oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rXVPg7D7; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rXVPg7D7"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43cf44b66f7so44384245e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 05:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747831867; x=1748436667; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=plMFgSGJhN3aobtGanbzGcqM69WCQayfYelFMBRo2Js=;
        b=rXVPg7D7XYLZcPWXq7lp+X8bgSowFAQcG0ZLUlJkA2WCNzEUy2JjANjG295GwiRe9I
         zuECssFsmNVM2Ptxuy++IDU7QnvgdLM9XxjlySSb9zVZxo3G1AJejzfEmmdC3bXM6Dhj
         iNmHf6kTsdcpKCnUURvRnPZsJcGSfuHi9HXq1bij0emmMjCXhdiSVzh1hLCdpPnWbU3H
         Yxbj5szGp0/A2yTstOHWXwEkqcyXnvk/KOarkzqdAj8DpCI05Yb64ydInwtaNdyDgANK
         w54QOwrQTznXJz3M6BxHmfnQqAKG7z4kQEw1GUkb2UF/srzjqW1V41VXcTpXChNYv/vf
         MfIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747831867; x=1748436667;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=plMFgSGJhN3aobtGanbzGcqM69WCQayfYelFMBRo2Js=;
        b=l/GTVoCTBWmTum68vgYPGz2u14n8ZHYS8o+pMgUv+lSJU0WgFzug9CuUc2fY+SGlHS
         0FCIPFy3cOJFCHdlHU5OnFTLGVOGBhKYs/Vp4814TJVDit03cr/3ndFxLqargZwQVSAC
         3j5xQ1ZyxmIk/UeC1dyEbTN1JL7ObZdLgO95eqoOCBjjWuFzDw7CApZdn97HmFOBjD95
         qBzIdYGs9f+Tn1ejFMJ3PK+/9FRxW/JnHtMfKaEye+6mHbmNILPyMCYsrUAEa8y+lbWw
         yU8S5BayU+te8ye3yxcNsDMG4dkfDjRqP82oX1BxVE8tlQBLUlHTjvUXTzo8gJbU7gQw
         3zyQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0+xHbz/BAISkZ29WSLfPKBsbOc2cKxODk+ARKFU2FEyP5omWzw3UmlRgVVJ/d9/pRhKq9qZO8oKo+iLo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwe9wI+Fvu/DmUo8viRudHGJ4tfJ4DAK502k9exMqedk/SKqHg
	pY/eaU17sZshmqcaS4XQCLPaPiXcjEXucsTAFQDBtrXBNXotM/Bmf0Ir6Xx0/wfRqzHqGvvxr6P
	Dryr+JL+CeK4SnwAClT6Bmw==
X-Google-Smtp-Source: AGHT+IGUJ63iSzGU9Dvi29HCEISiLcJX+9ayQfyUSIkAJKvRnN6Pz7ziGCcGzjc9QNZmRMp/cFiAga+uxL4Qvxfo
X-Received: from wro21.prod.google.com ([2002:a05:6000:41d5:b0:3a3:6593:a846])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:64ee:0:b0:3a0:8291:20d0 with SMTP id ffacd0b85a97d-3a35c83f19bmr19075001f8f.29.1747831866928;
 Wed, 21 May 2025 05:51:06 -0700 (PDT)
Date: Wed, 21 May 2025 13:48:26 +0100
In-Reply-To: <20250521124834.1070650-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250521124834.1070650-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <20250521124834.1070650-3-vdonnefort@google.com>
Subject: [PATCH v6 02/10] KVM: arm64: Introduce for_each_hyp_page
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Add a helper to iterate over the hypervisor vmemmap. This will be
particularly handy with the introduction of huge mapping support
for the np-guest stage-2.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/include/nvhe/memory.h b/arch/arm64/kvm/hyp/include/nvhe/memory.h
index eb0c2ebd1743..dee1a406b0c2 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/memory.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/memory.h
@@ -96,24 +96,24 @@ static inline struct hyp_page *hyp_phys_to_page(phys_addr_t phys)
 #define hyp_page_to_virt(page)	__hyp_va(hyp_page_to_phys(page))
 #define hyp_page_to_pool(page)	(((struct hyp_page *)page)->pool)
 
-static inline enum pkvm_page_state get_host_state(phys_addr_t phys)
+static inline enum pkvm_page_state get_host_state(struct hyp_page *p)
 {
-	return (enum pkvm_page_state)hyp_phys_to_page(phys)->__host_state;
+	return p->__host_state;
 }
 
-static inline void set_host_state(phys_addr_t phys, enum pkvm_page_state state)
+static inline void set_host_state(struct hyp_page *p, enum pkvm_page_state state)
 {
-	hyp_phys_to_page(phys)->__host_state = state;
+	p->__host_state = state;
 }
 
-static inline enum pkvm_page_state get_hyp_state(phys_addr_t phys)
+static inline enum pkvm_page_state get_hyp_state(struct hyp_page *p)
 {
-	return hyp_phys_to_page(phys)->__hyp_state_comp ^ PKVM_PAGE_STATE_MASK;
+	return p->__hyp_state_comp ^ PKVM_PAGE_STATE_MASK;
 }
 
-static inline void set_hyp_state(phys_addr_t phys, enum pkvm_page_state state)
+static inline void set_hyp_state(struct hyp_page *p, enum pkvm_page_state state)
 {
-	hyp_phys_to_page(phys)->__hyp_state_comp = state ^ PKVM_PAGE_STATE_MASK;
+	p->__hyp_state_comp = state ^ PKVM_PAGE_STATE_MASK;
 }
 
 /*
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index c18d4f691d2b..53bb029698c8 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -60,6 +60,11 @@ static void hyp_unlock_component(void)
 	hyp_spin_unlock(&pkvm_pgd_lock);
 }
 
+#define for_each_hyp_page(__p, __st, __sz)				\
+	for (struct hyp_page *__p = hyp_phys_to_page(__st),		\
+			     *__e = __p + ((__sz) >> PAGE_SHIFT);	\
+	     __p < __e; __p++)
+
 static void *host_s2_zalloc_pages_exact(size_t size)
 {
 	void *addr = hyp_alloc_pages(&host_s2_pool, get_order(size));
@@ -485,7 +490,8 @@ static int host_stage2_adjust_range(u64 addr, struct kvm_mem_range *range)
 		return -EAGAIN;
 
 	if (pte) {
-		WARN_ON(addr_is_memory(addr) && get_host_state(addr) != PKVM_NOPAGE);
+		WARN_ON(addr_is_memory(addr) &&
+			get_host_state(hyp_phys_to_page(addr)) != PKVM_NOPAGE);
 		return -EPERM;
 	}
 
@@ -511,10 +517,8 @@ int host_stage2_idmap_locked(phys_addr_t addr, u64 size,
 
 static void __host_update_page_state(phys_addr_t addr, u64 size, enum pkvm_page_state state)
 {
-	phys_addr_t end = addr + size;
-
-	for (; addr < end; addr += PAGE_SIZE)
-		set_host_state(addr, state);
+	for_each_hyp_page(page, addr, size)
+		set_host_state(page, state);
 }
 
 int host_stage2_set_owner_locked(phys_addr_t addr, u64 size, u8 owner_id)
@@ -636,16 +640,16 @@ static int check_page_state_range(struct kvm_pgtable *pgt, u64 addr, u64 size,
 static int __host_check_page_state_range(u64 addr, u64 size,
 					 enum pkvm_page_state state)
 {
-	u64 end = addr + size;
 	int ret;
 
-	ret = check_range_allowed_memory(addr, end);
+	ret = check_range_allowed_memory(addr, addr + size);
 	if (ret)
 		return ret;
 
 	hyp_assert_lock_held(&host_mmu.lock);
-	for (; addr < end; addr += PAGE_SIZE) {
-		if (get_host_state(addr) != state)
+
+	for_each_hyp_page(page, addr, size) {
+		if (get_host_state(page) != state)
 			return -EPERM;
 	}
 
@@ -655,7 +659,7 @@ static int __host_check_page_state_range(u64 addr, u64 size,
 static int __host_set_page_state_range(u64 addr, u64 size,
 				       enum pkvm_page_state state)
 {
-	if (get_host_state(addr) == PKVM_NOPAGE) {
+	if (get_host_state(hyp_phys_to_page(addr)) == PKVM_NOPAGE) {
 		int ret = host_stage2_idmap_locked(addr, size, PKVM_HOST_MEM_PROT);
 
 		if (ret)
@@ -669,18 +673,14 @@ static int __host_set_page_state_range(u64 addr, u64 size,
 
 static void __hyp_set_page_state_range(phys_addr_t phys, u64 size, enum pkvm_page_state state)
 {
-	phys_addr_t end = phys + size;
-
-	for (; phys < end; phys += PAGE_SIZE)
-		set_hyp_state(phys, state);
+	for_each_hyp_page(page, phys, size)
+		set_hyp_state(page, state);
 }
 
 static int __hyp_check_page_state_range(phys_addr_t phys, u64 size, enum pkvm_page_state state)
 {
-	phys_addr_t end = phys + size;
-
-	for (; phys < end; phys += PAGE_SIZE) {
-		if (get_hyp_state(phys) != state)
+	for_each_hyp_page(page, phys, size) {
+		if (get_hyp_state(page) != state)
 			return -EPERM;
 	}
 
@@ -931,7 +931,7 @@ int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu,
 		goto unlock;
 
 	page = hyp_phys_to_page(phys);
-	switch (get_host_state(phys)) {
+	switch (get_host_state(page)) {
 	case PKVM_PAGE_OWNED:
 		WARN_ON(__host_set_page_state_range(phys, PAGE_SIZE, PKVM_PAGE_SHARED_OWNED));
 		break;
@@ -983,9 +983,9 @@ static int __check_host_shared_guest(struct pkvm_hyp_vm *vm, u64 *__phys, u64 ip
 	if (WARN_ON(ret))
 		return ret;
 
-	if (get_host_state(phys) != PKVM_PAGE_SHARED_OWNED)
-		return -EPERM;
 	page = hyp_phys_to_page(phys);
+	if (get_host_state(page) != PKVM_PAGE_SHARED_OWNED)
+		return -EPERM;
 	if (WARN_ON(!page->host_share_guest_count))
 		return -EINVAL;
 
diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
index 6d513a4b3763..c19860fc8183 100644
--- a/arch/arm64/kvm/hyp/nvhe/setup.c
+++ b/arch/arm64/kvm/hyp/nvhe/setup.c
@@ -190,6 +190,7 @@ static int fix_host_ownership_walker(const struct kvm_pgtable_visit_ctx *ctx,
 				     enum kvm_pgtable_walk_flags visit)
 {
 	enum pkvm_page_state state;
+	struct hyp_page *page;
 	phys_addr_t phys;
 
 	if (!kvm_pte_valid(ctx->old))
@@ -202,6 +203,8 @@ static int fix_host_ownership_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	if (!addr_is_memory(phys))
 		return -EINVAL;
 
+	page = hyp_phys_to_page(phys);
+
 	/*
 	 * Adjust the host stage-2 mappings to match the ownership attributes
 	 * configured in the hypervisor stage-1, and make sure to propagate them
@@ -210,15 +213,15 @@ static int fix_host_ownership_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	state = pkvm_getstate(kvm_pgtable_hyp_pte_prot(ctx->old));
 	switch (state) {
 	case PKVM_PAGE_OWNED:
-		set_hyp_state(phys, PKVM_PAGE_OWNED);
+		set_hyp_state(page, PKVM_PAGE_OWNED);
 		return host_stage2_set_owner_locked(phys, PAGE_SIZE, PKVM_ID_HYP);
 	case PKVM_PAGE_SHARED_OWNED:
-		set_hyp_state(phys, PKVM_PAGE_SHARED_OWNED);
-		set_host_state(phys, PKVM_PAGE_SHARED_BORROWED);
+		set_hyp_state(page, PKVM_PAGE_SHARED_OWNED);
+		set_host_state(page, PKVM_PAGE_SHARED_BORROWED);
 		break;
 	case PKVM_PAGE_SHARED_BORROWED:
-		set_hyp_state(phys, PKVM_PAGE_SHARED_BORROWED);
-		set_host_state(phys, PKVM_PAGE_SHARED_OWNED);
+		set_hyp_state(page, PKVM_PAGE_SHARED_BORROWED);
+		set_host_state(page, PKVM_PAGE_SHARED_OWNED);
 		break;
 	default:
 		return -EINVAL;
-- 
2.49.0.1112.g889b7c5bd8-goog

