Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2B12957AE
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 13:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746796648; cv=none; b=WS6fQm5A7j3ZDxgr2ANc0qcUiXupMPAW+ry0lnE0BrNg7oCvqApgwv/WuePFsrY3XcTADcUd5IfG78q7LeaMc4V8Yq4q934RrQCmaZMWANTuHhj4CvIAdsBmONweaShXr64srXF0kdd2B9VQKtwZt08k6s1vw3xaHpWusv9aQGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746796648; c=relaxed/simple;
	bh=E7VlmQ5b+xrGGMbUITjYdvw3hvby2ZNarS87AT40iK0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=guUTQv9p/m4jp01b+lqVYI5qur+XChwtTrcBBM+u9DUsrtVSN3jSw2mEtOp2r+zi1CTY7J8TMyu6dmZbwg2EeOP2atNFU8R1Rz6XMg8WyUcgW6wXOElR92Qn0150ZbRW58XCeuhVgHN5CPmDcJ7/6B7KhVKjPkyOlbi3mkFm0S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4T8iQ0fs; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4T8iQ0fs"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43cec217977so10602925e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 06:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746796644; x=1747401444; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=z1Uryq/H5Al7KRzNx1c5hjinQdhQFMxs1pYSpg8hQoY=;
        b=4T8iQ0fsOb22TzjjzzNvQbv58/PhRflsG9pb+sjSvzv8LLI8ol/DbPdXZ7WmC9l9ol
         I20F0Aa5J+rY/OzE/WwxMA1KzDeV8D+ee19JC47i4l1uXJ5OrwR/ypAE/RhTqDMhJp4b
         m6tVQeC3HC9BsdLLkFscNnMGpU1R4v8CpUxMpxw5n4+iR30+/NSzWtZyrRNzLaK8ceCp
         ClXa5Nv1mWacb1FRPr9RvU2o3k+BO4DUK94RyuSxq2ealIu3b/FVO+DzQB81BPc4blti
         0ZVkRs+rk28h9Xkiu4UVP/1ZRWLkjVphrOCnXeK+UFYUaG5+hBkPzPEOa5IUy4cr+mEP
         vPlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746796644; x=1747401444;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z1Uryq/H5Al7KRzNx1c5hjinQdhQFMxs1pYSpg8hQoY=;
        b=OFT3m9UrDCdfCAEGQCDF10J34jtjGDEGjQh+eTDnZ1OppCXKmc0qKqELGJ3koqTiFy
         6r4L/Z7OXzK/B949Am+Ii4n2wGH3yoehBCRYcam5vbqV+Ru9nmwaxlKWfRetQ/t25vsh
         C6SHFXbcI/HY1mIohBKPGY8W8VmlIhuYSb75cUM9TUtYzU025opQ/jq7CwXEsxYzLjIe
         egSraaepyPvD0EbtGRMFYejZieIn7Nu+N06ctRRWsQQ/MXJ+Sds8t0IYkGmQRKtunwq/
         DX86lPL67ZU+hR3G/S0rLfUIPNh0sdcsmPLrj55YHNTkD8rPfZMCRXTgAEy14YTCwjLV
         nvHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPL9e4+GRsOqHsGVF/GrR/IzKtzSBVoyhmA8f83G8lEr8lP1I/6kmVXIziWvGgk5xnyMTpRT2MMm6uEYw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw651ncWDHTU5MvP1E5nYI2075I4dTO9ufdOWX7QHY8t/UKGdqt
	Ua1RLBEEq1o7AGAt3/MPpddxYeOPMc4f7rSoZsKurRw/MwM5tD660JDGezzbgCxM4ez0a91MiK1
	OncBx4xBBERIVo9IWFg==
X-Google-Smtp-Source: AGHT+IGomDiLVgDmN7C8t3SdZrJfMFN/MUq/cHtvkG2ueOdPzk8loSbhG7i46xpFxQBXDMIRTr4jQEEd0OtkNlS8
X-Received: from wmbdo10.prod.google.com ([2002:a05:600c:680a:b0:440:68aa:44b])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8708:b0:43c:f3e4:d6f6 with SMTP id 5b1f17b1804b1-442d6ddeb99mr32730975e9.31.1746796644429;
 Fri, 09 May 2025 06:17:24 -0700 (PDT)
Date: Fri,  9 May 2025 14:17:03 +0100
In-Reply-To: <20250509131706.2336138-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250509131706.2336138-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Message-ID: <20250509131706.2336138-8-vdonnefort@google.com>
Subject: [PATCH v4 07/10] KVM: arm64: Convert pkvm_mappings to interval tree
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Quentin Perret <qperret@google.com>

In preparation for supporting stage-2 huge mappings for np-guest, let's
convert pgt.pkvm_mappings to an interval tree.

No functional change intended.

Suggested-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Quentin Perret <qperret@google.com>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 6b9d274052c7..1b43bcd2a679 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -413,7 +413,7 @@ static inline bool kvm_pgtable_walk_lock_held(void)
  */
 struct kvm_pgtable {
 	union {
-		struct rb_root					pkvm_mappings;
+		struct rb_root_cached				pkvm_mappings;
 		struct {
 			u32					ia_bits;
 			s8					start_level;
diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index d91bfcf2db56..da75d41c948c 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -173,6 +173,7 @@ struct pkvm_mapping {
 	struct rb_node node;
 	u64 gfn;
 	u64 pfn;
+	u64 __subtree_last;	/* Internal member for interval tree */
 };
 
 int pkvm_pgtable_stage2_init(struct kvm_pgtable *pgt, struct kvm_s2_mmu *mmu,
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 057874bbe3e1..6febddbec69e 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/init.h>
+#include <linux/interval_tree_generic.h>
 #include <linux/kmemleak.h>
 #include <linux/kvm_host.h>
 #include <asm/kvm_mmu.h>
@@ -256,80 +257,63 @@ static int __init finalize_pkvm(void)
 }
 device_initcall_sync(finalize_pkvm);
 
-static int cmp_mappings(struct rb_node *node, const struct rb_node *parent)
+static u64 __pkvm_mapping_start(struct pkvm_mapping *m)
 {
-	struct pkvm_mapping *a = rb_entry(node, struct pkvm_mapping, node);
-	struct pkvm_mapping *b = rb_entry(parent, struct pkvm_mapping, node);
-
-	if (a->gfn < b->gfn)
-		return -1;
-	if (a->gfn > b->gfn)
-		return 1;
-	return 0;
+	return m->gfn * PAGE_SIZE;
 }
 
-static struct rb_node *find_first_mapping_node(struct rb_root *root, u64 gfn)
+static u64 __pkvm_mapping_end(struct pkvm_mapping *m)
 {
-	struct rb_node *node = root->rb_node, *prev = NULL;
-	struct pkvm_mapping *mapping;
-
-	while (node) {
-		mapping = rb_entry(node, struct pkvm_mapping, node);
-		if (mapping->gfn == gfn)
-			return node;
-		prev = node;
-		node = (gfn < mapping->gfn) ? node->rb_left : node->rb_right;
-	}
-
-	return prev;
+	return (m->gfn + 1) * PAGE_SIZE - 1;
 }
 
-/*
- * __tmp is updated to rb_next(__tmp) *before* entering the body of the loop to allow freeing
- * of __map inline.
- */
+INTERVAL_TREE_DEFINE(struct pkvm_mapping, node, u64, __subtree_last,
+		     __pkvm_mapping_start, __pkvm_mapping_end, static,
+		     pkvm_mapping);
+
 #define for_each_mapping_in_range_safe(__pgt, __start, __end, __map)				\
-	for (struct rb_node *__tmp = find_first_mapping_node(&(__pgt)->pkvm_mappings,		\
-							     ((__start) >> PAGE_SHIFT));	\
+	for (struct pkvm_mapping *__tmp = pkvm_mapping_iter_first(&(__pgt)->pkvm_mappings,	\
+								  __start, __end - 1);		\
 	     __tmp && ({									\
-				__map = rb_entry(__tmp, struct pkvm_mapping, node);		\
-				__tmp = rb_next(__tmp);						\
+				__map = __tmp;							\
+				__tmp = pkvm_mapping_iter_next(__map, __start, __end - 1);	\
 				true;								\
 		       });									\
-	    )											\
-		if (__map->gfn < ((__start) >> PAGE_SHIFT))					\
-			continue;								\
-		else if (__map->gfn >= ((__end) >> PAGE_SHIFT))					\
-			break;									\
-		else
+	    )
 
 int pkvm_pgtable_stage2_init(struct kvm_pgtable *pgt, struct kvm_s2_mmu *mmu,
 			     struct kvm_pgtable_mm_ops *mm_ops)
 {
-	pgt->pkvm_mappings	= RB_ROOT;
+	pgt->pkvm_mappings	= RB_ROOT_CACHED;
 	pgt->mmu		= mmu;
 
 	return 0;
 }
 
-void pkvm_pgtable_stage2_destroy(struct kvm_pgtable *pgt)
+static int __pkvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 start, u64 end)
 {
 	struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
 	pkvm_handle_t handle = kvm->arch.pkvm.handle;
 	struct pkvm_mapping *mapping;
-	struct rb_node *node;
+	int ret;
 
 	if (!handle)
-		return;
+		return 0;
 
-	node = rb_first(&pgt->pkvm_mappings);
-	while (node) {
-		mapping = rb_entry(node, struct pkvm_mapping, node);
-		kvm_call_hyp_nvhe(__pkvm_host_unshare_guest, handle, mapping->gfn);
-		node = rb_next(node);
-		rb_erase(&mapping->node, &pgt->pkvm_mappings);
+	for_each_mapping_in_range_safe(pgt, start, end, mapping) {
+		ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_guest, handle, mapping->gfn, 1);
+		if (WARN_ON(ret))
+			return ret;
+		pkvm_mapping_remove(mapping, &pgt->pkvm_mappings);
 		kfree(mapping);
 	}
+
+	return 0;
+}
+
+void pkvm_pgtable_stage2_destroy(struct kvm_pgtable *pgt)
+{
+	__pkvm_pgtable_stage2_unmap(pgt, 0, ~(0ULL));
 }
 
 int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
@@ -357,28 +341,16 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
 	swap(mapping, cache->mapping);
 	mapping->gfn = gfn;
 	mapping->pfn = pfn;
-	WARN_ON(rb_find_add(&mapping->node, &pgt->pkvm_mappings, cmp_mappings));
+	pkvm_mapping_insert(mapping, &pgt->pkvm_mappings);
 
 	return ret;
 }
 
 int pkvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size)
 {
-	struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
-	pkvm_handle_t handle = kvm->arch.pkvm.handle;
-	struct pkvm_mapping *mapping;
-	int ret = 0;
+	lockdep_assert_held_write(&kvm_s2_mmu_to_kvm(pgt->mmu)->mmu_lock);
 
-	lockdep_assert_held_write(&kvm->mmu_lock);
-	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping) {
-		ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_guest, handle, mapping->gfn, 1);
-		if (WARN_ON(ret))
-			break;
-		rb_erase(&mapping->node, &pgt->pkvm_mappings);
-		kfree(mapping);
-	}
-
-	return ret;
+	return __pkvm_pgtable_stage2_unmap(pgt, addr, addr + size);
 }
 
 int pkvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size)
-- 
2.49.0.1015.ga840276032-goog

