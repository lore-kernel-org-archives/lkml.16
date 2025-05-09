Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871FD2957CD
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 13:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746796649; cv=none; b=gbQbwc7yfbTDUsGXqN8I73bd4F2MV28SM+rzYDJYC9KW39uTFx5NsyqYTyiIcgLcCAh/glGEylxSvfTh6s1C7lyns5J8xWlGjyi+trPYR6Se2skYo70GhLsY+bILfrcJsjZmh10cbJ9hSsmRh7y+wMaAdOkEtkxo0W0oswArsrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746796649; c=relaxed/simple;
	bh=VmFLE0qPF+vVZAa1wgh69Vyijh9+uNZXV/gnUp4P62A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YTMeSvs1+0B47nJzYcvCmT3fuZXsjdpdNtBrMlRoEAc7Demb6nPwVxjZxg9IOAFLIwcaBQ52t1X2j/Ol6eHM8VMT3Q4dWMBYO8t33anhAyUw6b4Yf4YWHpr1svfz/VQPE27EniaxPRXJ021v6UsoO47RFB1hb/CrC6q9/GMDqt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R3wXIg8Y; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R3wXIg8Y"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43e9b0fd00cso10997015e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 06:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746796646; x=1747401446; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RNLpH3Q60kPaAsu8vhpy60m6RZim/8uyJRruoS33oJY=;
        b=R3wXIg8YULBZXKylFY1WqOzEBS7DcGzJQ9YMRQfqCeVCpUbz9QPMLGpyDwTdSyLGAZ
         34IgEun+cSfNesPLXHIIOFNU1E2pdtrG0OYWH82LAirGyTKK0Kg4w0OHd0zMmKtTo7AR
         vihwzT0PymTb/BwRfeoeEeWQ2BZkF+vaN/+RBuGXM11nHaiVt8vD2axACUSiKwRmTZQM
         FiuA2wrt/+teunMX9F52n2RO0DxV7w47YfuvnVfKGfVvMrVZANksGOcnDYAavLPJsowP
         0B2OugMHyq8G5rXa9sJXsutj64y6jKFcLiVF0u2QetpcW5/YDBHyNyyL1GIQx+jtqGlo
         ulRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746796646; x=1747401446;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RNLpH3Q60kPaAsu8vhpy60m6RZim/8uyJRruoS33oJY=;
        b=Hd8iaEdgTuzWILtC8cTJ0SHDEwgWWSouQ8Snr8BboQnJI4/Hmy9wPx999ZfNW3tWN8
         PXu/dcxvo6V80HrA1wsXWmIDhpODhNQxMV7DgLoVp8CQXjaWf/uX52c/AErsWHGdYwhd
         bwiJLLnCqZ4OxhXNH4uJOU0Hp3tJKd0xICSLXZT4zV2GgyECKhY9WjxHh0VjdY1rWfI7
         D9amhBfdy1sGNtKHu3v3fVuYe0OlEGP/QzBdG9Eh7OGstwpNIZ0A/VnZTHednn81cJdq
         eMduF2LRAQvF8T7AUBUbigiuXU63yqY14reLPNM0v/Rzqn/XZK4TMxQnlN1r951jJjzA
         468g==
X-Forwarded-Encrypted: i=1; AJvYcCV2G1lXIvOIuRKYSM0VKKRutr2F6JLmz3LhCbMWK6GX3rLv6no/d9HQA1sWSlWgjv6HR6cripbJTm+7amA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfxiLzeVWfaZXEuUQ2ZXOI8xHpo7SU1/VhLflkJiMIA+ksVNkG
	dZq2nrVWDfj/vv5Z9VFGPm56N0pF27d+pOaQn4WfAaGUIbV2OONwKuudgsgFdBVg/CjY+dOcE/H
	tzusTiP3LwdxT+agLsA==
X-Google-Smtp-Source: AGHT+IEzp3z+QA2RzhLt/eBNPn4r3BZgbOIVIrs7d4F5IcvdZaGGp2zyrkjpEIgHZCECiNxrwkCgmBm3JE7hKe7K
X-Received: from wmbdr11.prod.google.com ([2002:a05:600c:608b:b0:441:d228:3918])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5919:b0:441:d228:3a07 with SMTP id 5b1f17b1804b1-442d0325520mr59393395e9.13.1746796646289;
 Fri, 09 May 2025 06:17:26 -0700 (PDT)
Date: Fri,  9 May 2025 14:17:04 +0100
In-Reply-To: <20250509131706.2336138-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250509131706.2336138-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Message-ID: <20250509131706.2336138-9-vdonnefort@google.com>
Subject: [PATCH v4 08/10] KVM: arm64: Add a range to pkvm_mappings
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Quentin Perret <qperret@google.com>

In preparation for supporting stage-2 huge mappings for np-guest, add a
nr_pages member for pkvm_mappings to allow EL1 to track the size of the
stage-2 mapping.

Signed-off-by: Quentin Perret <qperret@google.com>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index da75d41c948c..ea58282f59bb 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -173,6 +173,7 @@ struct pkvm_mapping {
 	struct rb_node node;
 	u64 gfn;
 	u64 pfn;
+	u64 nr_pages;
 	u64 __subtree_last;	/* Internal member for interval tree */
 };
 
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 6febddbec69e..0e30f16149d5 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -264,7 +264,7 @@ static u64 __pkvm_mapping_start(struct pkvm_mapping *m)
 
 static u64 __pkvm_mapping_end(struct pkvm_mapping *m)
 {
-	return (m->gfn + 1) * PAGE_SIZE - 1;
+	return (m->gfn + m->nr_pages) * PAGE_SIZE - 1;
 }
 
 INTERVAL_TREE_DEFINE(struct pkvm_mapping, node, u64, __subtree_last,
@@ -301,7 +301,8 @@ static int __pkvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 start, u64 e
 		return 0;
 
 	for_each_mapping_in_range_safe(pgt, start, end, mapping) {
-		ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_guest, handle, mapping->gfn, 1);
+		ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_guest, handle, mapping->gfn,
+					mapping->nr_pages);
 		if (WARN_ON(ret))
 			return ret;
 		pkvm_mapping_remove(mapping, &pgt->pkvm_mappings);
@@ -331,16 +332,32 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
 		return -EINVAL;
 
 	lockdep_assert_held_write(&kvm->mmu_lock);
-	ret = kvm_call_hyp_nvhe(__pkvm_host_share_guest, pfn, gfn, 1, prot);
-	if (ret) {
-		/* Is the gfn already mapped due to a racing vCPU? */
-		if (ret == -EPERM)
+
+	/*
+	 * Calling stage2_map() on top of existing mappings is either happening because of a race
+	 * with another vCPU, or because we're changing between page and block mappings. As per
+	 * user_mem_abort(), same-size permission faults are handled in the relax_perms() path.
+	 */
+	mapping = pkvm_mapping_iter_first(&pgt->pkvm_mappings, addr, addr + size - 1);
+	if (mapping) {
+		if (size == (mapping->nr_pages * PAGE_SIZE))
 			return -EAGAIN;
+
+		/* Remove _any_ pkvm_mapping overlapping with the range, bigger or smaller. */
+		ret = __pkvm_pgtable_stage2_unmap(pgt, addr, addr + size);
+		if (ret)
+			return ret;
+		mapping = NULL;
 	}
 
+	ret = kvm_call_hyp_nvhe(__pkvm_host_share_guest, pfn, gfn, size / PAGE_SIZE, prot);
+	if (WARN_ON(ret))
+		return ret;
+
 	swap(mapping, cache->mapping);
 	mapping->gfn = gfn;
 	mapping->pfn = pfn;
+	mapping->nr_pages = size / PAGE_SIZE;
 	pkvm_mapping_insert(mapping, &pgt->pkvm_mappings);
 
 	return ret;
@@ -362,7 +379,8 @@ int pkvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size)
 
 	lockdep_assert_held(&kvm->mmu_lock);
 	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping) {
-		ret = kvm_call_hyp_nvhe(__pkvm_host_wrprotect_guest, handle, mapping->gfn, 1);
+		ret = kvm_call_hyp_nvhe(__pkvm_host_wrprotect_guest, handle, mapping->gfn,
+					mapping->nr_pages);
 		if (WARN_ON(ret))
 			break;
 	}
@@ -377,7 +395,8 @@ int pkvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size)
 
 	lockdep_assert_held(&kvm->mmu_lock);
 	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping)
-		__clean_dcache_guest_page(pfn_to_kaddr(mapping->pfn), PAGE_SIZE);
+		__clean_dcache_guest_page(pfn_to_kaddr(mapping->pfn),
+					  PAGE_SIZE * mapping->nr_pages);
 
 	return 0;
 }
@@ -392,7 +411,7 @@ bool pkvm_pgtable_stage2_test_clear_young(struct kvm_pgtable *pgt, u64 addr, u64
 	lockdep_assert_held(&kvm->mmu_lock);
 	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping)
 		young |= kvm_call_hyp_nvhe(__pkvm_host_test_clear_young_guest, handle, mapping->gfn,
-					   1, mkold);
+					   mapping->nr_pages, mkold);
 
 	return young;
 }
-- 
2.49.0.1015.ga840276032-goog

