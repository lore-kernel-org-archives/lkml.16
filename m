Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F18E2701A0
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 12:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747831883; cv=none; b=KIhGDVsUAI8/dht/9hv95SMptJP2MJtWZ8vWymfQ5ancr36WEVXH54Nx/QAT4zFy3flYHBnU+YEZBDaJjrZpzaOk+GFsJgQJt3+hiE3mPpC5xas7pXNSrny+W0bZJ18f19az2o6E0nxTP18MLnQXGzQY9fgFo5nwonT95GM2vpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747831883; c=relaxed/simple;
	bh=a+a+wevfv4p+oR9F4TvoqKDZh9S97aZ58/Pb/MgJ4LE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aqq9jqoHgfBvk2iiJ+kx7Q+bSMYVBjHkSr1vQnmwqkGdAtmNI7aj75jLjau9cCpYtAK5JdZzza44rvpaUFDRImQIBnUc8KmCH/JFDJmfvlAp2BfbTIuydGqc2q2adc4c/A2i0VncnR53ffK3mQQrLFzaMkIGz2rJwakdAWQdz1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1CUmKVxV; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1CUmKVxV"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a371fb826cso1581779f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 05:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747831880; x=1748436680; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=X5HS1MTADtzk13DQ0X8VV2YLbKPpc9rF/EQ2n6h7rrc=;
        b=1CUmKVxVNuK2Bqzo07aP5p2jRyoE4uVp/lUXJVmCend77kJkPsv7yVw4LfI7FvD0Iz
         hAIMxwczJhYovykAg91aqnjhQnBNKn97ct8e/tZfE2ymohoSk9A82antDHyz/IodhKxB
         J8999f8giWAqvzF4B+sAY2nQgIzXBw4nv8vIga6Eye91cNKGkKqVHq3Z9m2oihLd6t+f
         wqnmlCGvO3WJipl0MjbfEPazxPHKQXfVVuzoXklNniwH21pohanxa963o5T6lG4hOHDx
         4D2oh/D63maUJhZq8fM7GMCbGjKDGFrXgfyN9JmJyXYG7FuqN6rj7Ufw/greouVckfiN
         rtkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747831880; x=1748436680;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X5HS1MTADtzk13DQ0X8VV2YLbKPpc9rF/EQ2n6h7rrc=;
        b=aM7TEoIT06hBQnu36jdTSBc96IT0SK+yc4wxv11gwim/j14DjUH+7mI7g62XHdDMUh
         x8OGnaNc7HrLVbqlcmNFALmuMubNBLbV3kAkXb+p7UQ3uAN7CjFuQtN0891japzYtJHS
         XtiRGf7UpNtzg0YjcevH1MeGS0tKI/9zBqwSO3dBs8zmI4TGlHVFbMbtQUkCHruGSeNz
         cGQtbywQjJXpiynqUJKauOf0aP9ZLCBXNGH4BPuS/2J1U1jiZmt4uDoLNXtbkP/BEdaz
         bDqJTF8VHmVEa0YizqwJtZiZSPUKVanXaZfmjGr0mR5dbJ/9mEkCJqyKUHbms3ftmO+A
         QMLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVs0XRgn3Ez1bZI3F3DiDxmIOuNaYmtv1Bl7uFQKRJM1E1Ii+nI1EOdJ5KBZr3wqf4tYg2kUZ8MKz9viXo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuPLlfLHIBE3SRkAzcOShWsoH2AZx1ADKe3OM4r+SauXj8/BEw
	RwvnUMuCIrAub0YQzJ6Gv2axbM8k/F3rLpTY0YkJLkv0qWB8jyrAzXAlMDzJAQRfp9mz5ruOSg+
	edTfQO58rsuNiVRnElhRPJA==
X-Google-Smtp-Source: AGHT+IFn3AYms1bLCqgZr1MLXfsCQOa84rpC6sI4FufTfMFtyP2s5auBVEIM75SbnJC+p900vsvf1E3FCH0tA9RV
X-Received: from wrbei2.prod.google.com ([2002:a05:6000:4182:b0:3a3:6d1d:3837])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:186d:b0:3a3:6b0c:a8a3 with SMTP id ffacd0b85a97d-3a36b0ca9b1mr11358542f8f.17.1747831880271;
 Wed, 21 May 2025 05:51:20 -0700 (PDT)
Date: Wed, 21 May 2025 13:48:33 +0100
In-Reply-To: <20250521124834.1070650-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250521124834.1070650-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <20250521124834.1070650-10-vdonnefort@google.com>
Subject: [PATCH v6 09/10] KVM: arm64: Stage-2 huge mappings for np-guests
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
index e08c735206e0..1c18fca82209 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -166,12 +166,6 @@ int kvm_host_prepare_stage2(void *pgt_pool_base)
 	return 0;
 }
 
-static bool guest_stage2_force_pte_cb(u64 addr, u64 end,
-				      enum kvm_pgtable_prot prot)
-{
-	return true;
-}
-
 static void *guest_s2_zalloc_pages_exact(size_t size)
 {
 	void *addr = hyp_alloc_pages(&current_vm->pool, get_order(size));
@@ -278,8 +272,7 @@ int kvm_guest_prepare_stage2(struct pkvm_hyp_vm *vm, void *pgd)
 	};
 
 	guest_lock_component(vm);
-	ret = __kvm_pgtable_stage2_init(mmu->pgt, mmu, &vm->mm_ops, 0,
-					guest_stage2_force_pte_cb);
+	ret = __kvm_pgtable_stage2_init(mmu->pgt, mmu, &vm->mm_ops, 0, NULL);
 	guest_unlock_component(vm);
 	if (ret)
 		return ret;
@@ -908,12 +901,24 @@ int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages)
 
 static int __guest_check_transition_size(u64 phys, u64 ipa, u64 nr_pages, u64 *size)
 {
+	size_t block_size;
+
 	if (nr_pages == 1) {
 		*size = PAGE_SIZE;
 		return 0;
 	}
 
-	return -EINVAL;
+	/* We solely support second to last level huge mapping */
+	block_size = kvm_granule_size(KVM_PGTABLE_LAST_LEVEL - 1);
+
+	if (nr_pages != block_size >> PAGE_SHIFT)
+		return -EINVAL;
+
+	if (!IS_ALIGNED(phys | ipa, block_size))
+		return -EINVAL;
+
+	*size = block_size;
+	return 0;
 }
 
 int __pkvm_host_share_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu *vcpu,
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 754f2fe0cc67..e445db2cb4a4 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1304,6 +1304,10 @@ static bool fault_supports_stage2_huge_mapping(struct kvm_memory_slot *memslot,
 	if (map_size == PAGE_SIZE)
 		return true;
 
+	/* pKVM only supports PMD_SIZE huge-mappings */
+	if (is_protected_kvm_enabled() && map_size != PMD_SIZE)
+		return false;
+
 	size = memslot->npages * PAGE_SIZE;
 
 	gpa_start = memslot->base_gfn << PAGE_SHIFT;
@@ -1537,7 +1541,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	 * logging_active is guaranteed to never be true for VM_PFNMAP
 	 * memslots.
 	 */
-	if (logging_active || is_protected_kvm_enabled()) {
+	if (logging_active) {
 		force_pte = true;
 		vma_shift = PAGE_SHIFT;
 	} else {
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index b1a65f50c02a..fcd70bfe44fb 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -332,7 +332,7 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
 	u64 pfn = phys >> PAGE_SHIFT;
 	int ret;
 
-	if (size != PAGE_SIZE)
+	if (size != PAGE_SIZE && size != PMD_SIZE)
 		return -EINVAL;
 
 	lockdep_assert_held_write(&kvm->mmu_lock);
-- 
2.49.0.1112.g889b7c5bd8-goog

