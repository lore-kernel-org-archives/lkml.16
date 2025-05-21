Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36AC26FD9E
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 12:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747831881; cv=none; b=k5pCt4Ni6nm1GY5t+oYegoDpZG3VnCTfn/c4PD89bV7KecKKBOGy2tLJpC/jcazQNwUc/GhgpKULQRnQZMNrUCHivunSC0Q06yokSTJ0oIFZ4KhHOkxtFYjDj84OhLuSSeqRKLz49Po5WIPULGKm+1D55tLiZyuH3KN30oZUNaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747831881; c=relaxed/simple;
	bh=m9dI9Rg8h/c091GpkdF/1r+aT4iwGTUctJ0aDf1/BoU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UAPCz3hS3Tt0keSS1o5uQu+JddNAp1N4HLK0EEDpg4SIefDbGdvKnbnV8Kk3ZmDm/jQGk96yT+0vCPkORwfG1fiCQ3+YXu5O0piKgGl8cFbI+FKbi6bf55X2IHSRNRnuP9k0ACZqgPKb9V1Lnl421wB6jLZaBMEUTCVRYUO/JWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hFiiSQ9h; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hFiiSQ9h"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3a364d121ccso1917259f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 05:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747831878; x=1748436678; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=THRS6RUOhVQKyz2pzkS3iWtym7smEtX3sb7fjdkvEcQ=;
        b=hFiiSQ9hz2sdq0EZkVXhlPfuGqibinRHSN52UuEwRz9eouPYsB26agthhCsFxl9ZAh
         3tciCZ15xrRWK8wRCVo5xR2RiRVX3GlDQAQNhceK3NrQgKSGRYsgZy8vY82BGqj2bWOi
         hFFOgddz+STh+dcKTa3lUV1bEt/QJeVmysagfqXTCEXxsbZtRx0De4LckT1x757XyxSX
         C+1LnRBtwIe1TkU498FpgrvDVCkT4LjcT9OiS42A6AWpInpTFhxApQGwF4+HI8JAZz6K
         OYXUrZNnrt5qEneHBMnIlmohe43TYRC/j7YCRPOSpc/dkpKtf0j7/tNUyNWyHuzLCyYl
         B7Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747831878; x=1748436678;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=THRS6RUOhVQKyz2pzkS3iWtym7smEtX3sb7fjdkvEcQ=;
        b=U1BUbtg4bbP7FBUJPK5xoBYQXgR0Ce7pKFIACAuqr7TJV95mAmFFpL+1goB9SI9LO2
         2qfs4tsmcB7lGd98gCA6EEAQwpPcYuNLbl3ForBZaKNyEWWZ7zKYgedhyYmrfrI1v7vL
         Na0DqillX8fQypmixqfAVIqHbp9Ll4mjRPKYqMCAoxpTAgWaHjcO1diEffPDrc48vA8s
         13x60mVKYtVZFm/gx94W5EXO9MpzrjFh4utrvydgI3hpt9eiGGD1FaB7o3+0NhLXHnFQ
         ei4Yk68x+n7/jPpMIHSh937H9nLIIHH3Vjtpc4JmlgubxK525bjzkAkDQADINdIkEyjQ
         jgTQ==
X-Forwarded-Encrypted: i=1; AJvYcCX30ldlcwLtwczD/suEB0am80i0V+bNhKERo0nVTMDcuywx/GzhvWkaDlmWxjyF6Gs3cX0zSWWmrY8rpKA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWMW60k9C/9nJWlaBdnN/Z+HRj0vPMLcKZ0ctKvcsZwtnfNpDQ
	I+mPTUCCvqSIeErv9okT3iLPVUyTMkIlgvoV/F5Rx3z7mwDhPaWXjKHptkASc8gIBYeLPDx6n57
	/RqpS2nD+0JsqZ3gOgaULYQ==
X-Google-Smtp-Source: AGHT+IGhYVIBRuADQr6WRByKd7PpHl5cm15NxpBtNtkX8ms0Vg3sLjAj+oF4iS4GtuyYvGveuHPK8YSVEQ+prz7R
X-Received: from wmbhc24.prod.google.com ([2002:a05:600c:8718:b0:441:bf4e:899c])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4304:b0:3a3:6ae4:6615 with SMTP id ffacd0b85a97d-3a36ae46750mr10498053f8f.13.1747831878332;
 Wed, 21 May 2025 05:51:18 -0700 (PDT)
Date: Wed, 21 May 2025 13:48:32 +0100
In-Reply-To: <20250521124834.1070650-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250521124834.1070650-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <20250521124834.1070650-9-vdonnefort@google.com>
Subject: [PATCH v6 08/10] KVM: arm64: Add a range to pkvm_mappings
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
index 8a1a2faf66a8..b1a65f50c02a 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -264,7 +264,7 @@ static u64 __pkvm_mapping_start(struct pkvm_mapping *m)
 
 static u64 __pkvm_mapping_end(struct pkvm_mapping *m)
 {
-	return (m->gfn + 1) * PAGE_SIZE - 1;
+	return (m->gfn + m->nr_pages) * PAGE_SIZE - 1;
 }
 
 INTERVAL_TREE_DEFINE(struct pkvm_mapping, node, u64, __subtree_last,
@@ -305,7 +305,8 @@ static int __pkvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 start, u64 e
 		return 0;
 
 	for_each_mapping_in_range_safe(pgt, start, end, mapping) {
-		ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_guest, handle, mapping->gfn, 1);
+		ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_guest, handle, mapping->gfn,
+					mapping->nr_pages);
 		if (WARN_ON(ret))
 			return ret;
 		pkvm_mapping_remove(mapping, &pgt->pkvm_mappings);
@@ -335,16 +336,32 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
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
@@ -366,7 +383,8 @@ int pkvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size)
 
 	lockdep_assert_held(&kvm->mmu_lock);
 	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping) {
-		ret = kvm_call_hyp_nvhe(__pkvm_host_wrprotect_guest, handle, mapping->gfn, 1);
+		ret = kvm_call_hyp_nvhe(__pkvm_host_wrprotect_guest, handle, mapping->gfn,
+					mapping->nr_pages);
 		if (WARN_ON(ret))
 			break;
 	}
@@ -381,7 +399,8 @@ int pkvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size)
 
 	lockdep_assert_held(&kvm->mmu_lock);
 	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping)
-		__clean_dcache_guest_page(pfn_to_kaddr(mapping->pfn), PAGE_SIZE);
+		__clean_dcache_guest_page(pfn_to_kaddr(mapping->pfn),
+					  PAGE_SIZE * mapping->nr_pages);
 
 	return 0;
 }
@@ -396,7 +415,7 @@ bool pkvm_pgtable_stage2_test_clear_young(struct kvm_pgtable *pgt, u64 addr, u64
 	lockdep_assert_held(&kvm->mmu_lock);
 	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping)
 		young |= kvm_call_hyp_nvhe(__pkvm_host_test_clear_young_guest, handle, mapping->gfn,
-					   1, mkold);
+					   mapping->nr_pages, mkold);
 
 	return young;
 }
-- 
2.49.0.1112.g889b7c5bd8-goog

