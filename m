Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0AD2690F4
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 08:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747731200; cv=none; b=uw6SL9n6IoxRwdSFSK7888fKuy2GJWnlZHVibu5sITcKRZgnAAcrilED+SVfMWYLQHyDy5Kks2PpW1wo+TgMTGwKtecaI7yTooVPyfIDGmRQpYkj1keN5zs5BYQe/f6WMRUU6USUOJWJFogfkyBJDrT2iH0bX3DrEEucZVlS010=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747731200; c=relaxed/simple;
	bh=fKyfGQakCHdtjnwXmnpo6PcZIvIiLxTvpbrQEFntiX8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jHmKt8hWXOfgC1Q2lx6I5v6hvbv5jc2JmdG7Stah3WUuFg8Gu6E/i/ua7JrAOlrTLMqcdEiPw7vmFqha6twoRNqps82HeSnZoBG5QOI10OA12/MLDPEBn1o4M93xOAHPF7ONZMLjZ6G2SBiD0SncMVy4K/hujYY3hLyBa5O7Lf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y7wU+NfD; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y7wU+NfD"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43cf172ff63so30925785e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 01:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747731197; x=1748335997; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6RhcZhtCDaS8NkJIeedFdZ107qBBIN26D1SVsvDpNZ8=;
        b=Y7wU+NfDho/Aa61Ane3rKCLmPTi1bxwPdLAJIwwrUBSAIy0ZK9nAcnHkV6YedzoV8c
         0NGHvtKEvs9M5N49zK0fQbwbxUYe7IfCCTBd4q9saHIeHDzYywh/WXVm7WSomT42u6Ye
         jy4k3HqVrUDgQjb0FU3kXO89BYzvTvb2v4/jAGc01TUiHllT/zQ5akwXQqFRgAb+1PT/
         q5J0r/XmtnqQlbREQmmzkB+eaXL0BY6fCkjipegpttIDebu4YJ6hMijCPLznbfHbIoKA
         EzoDUXC3vvyfl0fJhsXf+H38ek5hnuGsb21OPAKgWWxtSaKBBREJT0Pg8wHuPcN5IVk1
         2pzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747731197; x=1748335997;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6RhcZhtCDaS8NkJIeedFdZ107qBBIN26D1SVsvDpNZ8=;
        b=A71puLFjdtmLYZVd3Zyv+dSwO1nwnG/WcpxdMLRyv2ROMHPRrci0FOy5rh0ktd3wZL
         ZDcQztPR5kLDjhUaoOxJxtCJwq3TBAoTvwh7iPlqde46lFNxpeLBXpwh61P4fWZrF3kX
         GolpKcwEpRoIiHEsvMunTwok/HJAdaZV3l1NSiii2MNLQRjM653WK3+dW4baV3zn2gh8
         IGIzi8wE8UOX2imbQ5Yd+6Vt2fnCdT95KxYtQp5ZGga3vDT4aERpmiOJHky41WJY7FGQ
         BuGwBpkStFRjZ24yXZzjgkFlS0ikiDQo8E8kcEOmVGwDYJ0KJpZrgAhYxKxU8a7NE10m
         +Y5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWfDNT4q3t9LuuUJFsTgJEYrv9ub7RrxGCq9iOSvJunD+CmNbD/+mM26CMUGB45IL3jhMH7vnrQfIkUnk8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnkWUpEMDQgeWs8V1dn2ECyWry7bXm43DZghx/CVoMaO4uqqsK
	OoJiQW9bIKp7b8nQO1v2rlS3iEUyvjaCO4Dg/lMrfq8D9VMDlVMRHQU2R2iEXI0knNih4RUkufC
	VMsH0PW4Cs/oi3REXojlJAg==
X-Google-Smtp-Source: AGHT+IFEFnMn+5WqEzWmxQGG8vmhM7+5mi+63YjdjHfeO/BUWq/ciG944KxWrfJB4c3YAkUdS5M6ZuY5i48SqhBo
X-Received: from wrbfu10.prod.google.com ([2002:a05:6000:25ea:b0:3a3:659e:161])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5f4a:0:b0:3a3:6c61:9d52 with SMTP id ffacd0b85a97d-3a36c619e19mr6952768f8f.18.1747731197095;
 Tue, 20 May 2025 01:53:17 -0700 (PDT)
Date: Tue, 20 May 2025 09:52:00 +0100
In-Reply-To: <20250520085201.3059786-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250520085201.3059786-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1143.g0be31eac6b-goog
Message-ID: <20250520085201.3059786-10-vdonnefort@google.com>
Subject: [PATCH v5 09/10] KVM: arm64: Stage-2 huge mappings for np-guests
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
index 5a7a38c5d67c..1490820b9ebe 100644
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
2.49.0.1143.g0be31eac6b-goog

