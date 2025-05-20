Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7AC265CAC
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 08:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747731187; cv=none; b=Li29ShPgEWErePWiCiPdfo1JRadYhPbF947Kg8B42iuMY4RPR6mHuXFfvXL/jpQ6MCsEmxGgnL1U7slkEKJ3Ca+3D5kW+J3nLeTQT/mdAWsVUSXOxrRir6v4qN4Mm+Gynsffp9FPJ9EyyjWA8N+QyOMqVdiE+lqCBtLEJHVlUc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747731187; c=relaxed/simple;
	bh=O5K7ItQfEvdR6AyA+LX5hbN194oMzarUGnY1zvOk3ZA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Gfaivi6IwMcRzdk5blOvQcc5DJbZp+5UEfn+w68H81D9Y70s1ZG4ZB81jjs3Gonu3ogweoZmuGvvXuXwOV1d/kw/vsYyL99/iILL2abyWn9uF7SdghpoKEoz0uezFNmtTa+l/skT422FnbTcQIC2txq0ZWTzQyFepIt/x+SG690=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tI76Wp5T; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tI76Wp5T"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-440667e7f92so27531685e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 01:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747731184; x=1748335984; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=a+P4jqcPY/5X/H7GHLC9QBb5JYHi83egH9jTzrY/YYI=;
        b=tI76Wp5TlD39hCtXDClspN7YJw6VgSckvNYu6RbTQCORj7NK5tM4uU4AWYWgt2hefc
         NykcUU5Bq1wDfNvkaQfcccK5MOnV915xod57zXxfuMI+21VLB2Q+i4XpNJgbGxUb3son
         eRs9k/vbf+9WQ0uJ7FiiASMoCUutQO+9ZmtE/g/kzD1Uil1gBWwNFZJRsIUnQiQ3m1Uq
         FXIhxA0JkmfTCdhpuk/98fRyeq+9VVUdCpRwfUAQ+ARVr7oL2ILHrNyIaHS3J4ksk8BZ
         6Eu/zDY8Kl4lkv0/q3u+p5tION5QCOeediV6GFv6Ki7Epf8SaSiXKom4sMkVPJYDpheG
         1sbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747731184; x=1748335984;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a+P4jqcPY/5X/H7GHLC9QBb5JYHi83egH9jTzrY/YYI=;
        b=nx5gPtVxay/CBgW+r6mH3JcRtDXuBF625d2Ick4qXmVut8u8xyNGUuEz0J0+pt9BlG
         gpaaV3PSoJZuJSFmPwldQAgB/MyXIplMbjEWziuu77qEFVup5cLILtFG1KbqjRpH+nbJ
         9iDbVRbEuK8BnigOFI+oJ6AYt7eYhsccHWD6E7ayOg9kuXGmwsaxAa6UhZeFVZ4nLmY1
         Vr5bF/fmNiPnIztLt9ceYKHTXBKKqKYN3sCkmq66zgHRSQbcMyEw24rmohvfAdmVpibF
         GiU1S9NT7Agd+ppLWk9sFIxdZvIOeBaSv5F/EhNDNrtbULZ04ySXlD7HMrb7lNGNIl5v
         DHEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDKzIOdrAF4kJFLcTf1zVM8DFq9SXNqa8d7K0tErAMSPHdBVjbosnyOM6CGks3VRAE8ybK+MWY40k1mA8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMuuRQgLh5lvkNQAzYjZuSLxrWnpT88vfeDmpdHmh5oeF6rnV8
	nRAyHnEvWx5/g8AStVqcd3b96SylN6Fp9qU/ZaFRFxWwxMBoipNYOO0nwrm8iG7qvp4jYChLmz8
	0rY5ShUFFvIGVIfUz7GF18w==
X-Google-Smtp-Source: AGHT+IGLoj+sVRo93xr3VaTiuIGmKV090qzpfNpi8aOUsOQ8a3/MaEFrOpiu7dpS+CVE/xIW+C0ev0Qm8AecEqxT
X-Received: from wmbec10.prod.google.com ([2002:a05:600c:610a:b0:440:595d:fba9])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5305:b0:441:b19c:96fe with SMTP id 5b1f17b1804b1-442fd622eb4mr188234885e9.10.1747731183859;
 Tue, 20 May 2025 01:53:03 -0700 (PDT)
Date: Tue, 20 May 2025 09:51:53 +0100
In-Reply-To: <20250520085201.3059786-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250520085201.3059786-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1143.g0be31eac6b-goog
Message-ID: <20250520085201.3059786-3-vdonnefort@google.com>
Subject: [PATCH v5 02/10] KVM: arm64: Introduce for_each_hyp_page
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
index be4f7c5612f8..1018a6f66359 100644
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
2.49.0.1143.g0be31eac6b-goog

