Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3663295531
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 13:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746796645; cv=none; b=nIKW41PAOF6yaM0P9yq1jz/DbxOEf9nNplwU5yDeggRhlXl6wJLKI9wuJvg844Tq9MDPXitb/1KuLfwJ3UfoxViDts/ZPERBBQ9FvhF7t+LOG0W0uft26Q+fMSa67/ad2MhUbKGyYay1BF5s9mqAVvaP8db6QWZmJdDuy5UVG+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746796645; c=relaxed/simple;
	bh=0dN7xNkWVVcK8u32o4MK+QgSiql5mKiL3ICUdzvqXsc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OoKTl/NJVpfKYrAelsG+qaUbONmbAnUrhysWxjx+OgO5nRemW3tt/y6ltL94FFk0k3f9yMOHLM6CM/bGi8cg2YD6Phlf5vIt1NSL0hdKY45YHITieKiLqX4JfQWyYRs/aSuNzzHMZ5NZlt7EO8RFEvB75SNyCbp3Xihj0DbvszQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=w7pmr55f; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="w7pmr55f"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-441d438a9b7so13574985e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 06:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746796642; x=1747401442; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sJXlEdEAMlkb2qBBm9toZJ5sXPbHKi+X7VZ3IC/AQeA=;
        b=w7pmr55fuZ65KMxV8tF15xmcnVF1IZmJJVDVmssEcrnmORpen8w5+FRoeWMzTgerWf
         Tje4k5CRXBlvcsYe7sdKMrSWlhibAM2uFLdyEvNG0P30Z5+1J1nGMblBUglYEfZMjFBy
         00F46wePMMx65KQs6iEeI+rNlJXA+l1QBRqQ+iZ8vWYzhJG3QidA2ueY0z5E0bpY2lpv
         0nUHrrpUhbdpRV5ikQBz4lTE6OfSQwp8AfbNzp9nSkoa7DBBdNeuPg0dsrBH4jP/rSVO
         xeC0PGQlvav0DCk4B5vKuFDcBu7VRzSZtb5gugHmYEhEE9zAVzfHicjTU3Xbi+isA1Vm
         PBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746796642; x=1747401442;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sJXlEdEAMlkb2qBBm9toZJ5sXPbHKi+X7VZ3IC/AQeA=;
        b=FV8AMfaS9bRmNo6CvEsvb5JDPvzx/telbNuflh9rhCIu8Tx5Kw2F8vhftKALodPidA
         PEFm3YQfiKLUszzsWwns/TiIcUahB3oNjPfwy5QdaCxLRb0ZcTRBgxtxltMGggy7Y6af
         9BaMORRHKBEbXyBHX/+IfqWnL8tiCEiEDG2C75sWTkUn2i1/M28jS38e/pEFW3EZkbx5
         f1pzbJj6DzgSl3CteW75r3zHaDN3Lszt26Pa8PxnnQO0x/0vQCGpYHZJOT74F2BzEiH1
         gltf1MuxGgVRyQmWrxaXjg72M0M93DXUZsA4wZpYCUEF0/JIhC0U+nGFeGkRbcvVnz/9
         AqNQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0ERnZkd9jHv4nQGed4G3aucZh1eLEydVFdABlnzP3dVFEotCaijauwb3r1HKxSMhG9zq1nHrdTQ0wKfs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7DM2Xobkp4ij4OTCAM7Dq/lqAP7vdla2+fuU4kcbHx36kJcrX
	F9cDBVqu53PIm/rEnB2SytGNng5mLk1Gmig2aRUjTD7PUwTirlE/E4AWZeaobKcwwRRjEC7avPL
	fltJO+xWPCdRfPBE/7w==
X-Google-Smtp-Source: AGHT+IGHjgfBBQziUExP1MPI5PB38ZTGtxeEqo5dEeOPRz5XOW0PWp3aLbHOfSRkKDKmFhtCkoq6HHA3Mb4iDMfv
X-Received: from wmbdr16.prod.google.com ([2002:a05:600c:6090:b0:43d:4ba5:b5d6])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8716:b0:441:b3eb:570c with SMTP id 5b1f17b1804b1-442d6d9c266mr30919685e9.6.1746796642493;
 Fri, 09 May 2025 06:17:22 -0700 (PDT)
Date: Fri,  9 May 2025 14:17:02 +0100
In-Reply-To: <20250509131706.2336138-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250509131706.2336138-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Message-ID: <20250509131706.2336138-7-vdonnefort@google.com>
Subject: [PATCH v4 06/10] KVM: arm64: Add a range to __pkvm_host_test_clear_young_guest()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

In preparation for supporting stage-2 huge mappings for np-guest. Add a
nr_pages argument to the __pkvm_host_test_clear_young_guest hypercall.
This range supports only two values: 1 or PMD_SIZE / PAGE_SIZE (that is
512 on a 4K-pages system).

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index 64d4f3bf6269..5f9d56754e39 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -43,8 +43,8 @@ int __pkvm_host_share_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu
 			    enum kvm_pgtable_prot prot);
 int __pkvm_host_unshare_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *hyp_vm);
 int __pkvm_host_relax_perms_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_pgtable_prot prot);
-int __pkvm_host_test_clear_young_guest(u64 gfn, bool mkold, struct pkvm_hyp_vm *vm);
 int __pkvm_host_wrprotect_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *hyp_vm);
+int __pkvm_host_test_clear_young_guest(u64 gfn, u64 nr_pages, bool mkold, struct pkvm_hyp_vm *vm);
 int __pkvm_host_mkyoung_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu);
 
 bool addr_is_memory(phys_addr_t phys);
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index fa7e2421d359..8e8848de4d47 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -331,7 +331,8 @@ static void handle___pkvm_host_test_clear_young_guest(struct kvm_cpu_context *ho
 {
 	DECLARE_REG(pkvm_handle_t, handle, host_ctxt, 1);
 	DECLARE_REG(u64, gfn, host_ctxt, 2);
-	DECLARE_REG(bool, mkold, host_ctxt, 3);
+	DECLARE_REG(u64, nr_pages, host_ctxt, 3);
+	DECLARE_REG(bool, mkold, host_ctxt, 4);
 	struct pkvm_hyp_vm *hyp_vm;
 	int ret = -EINVAL;
 
@@ -342,7 +343,7 @@ static void handle___pkvm_host_test_clear_young_guest(struct kvm_cpu_context *ho
 	if (!hyp_vm)
 		goto out;
 
-	ret = __pkvm_host_test_clear_young_guest(gfn, mkold, hyp_vm);
+	ret = __pkvm_host_test_clear_young_guest(gfn, nr_pages, mkold, hyp_vm);
 	put_pkvm_hyp_vm(hyp_vm);
 out:
 	cpu_reg(host_ctxt, 1) = ret;
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 887848408e1b..78fb9cea2034 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1123,17 +1123,21 @@ int __pkvm_host_wrprotect_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *vm)
 	return ret;
 }
 
-int __pkvm_host_test_clear_young_guest(u64 gfn, bool mkold, struct pkvm_hyp_vm *vm)
+int __pkvm_host_test_clear_young_guest(u64 gfn, u64 nr_pages, bool mkold, struct pkvm_hyp_vm *vm)
 {
-	u64 ipa = hyp_pfn_to_phys(gfn);
+	u64 size, ipa = hyp_pfn_to_phys(gfn);
 	int ret;
 
 	if (pkvm_hyp_vm_is_protected(vm))
 		return -EPERM;
 
-	assert_host_shared_guest(vm, ipa, PAGE_SIZE);
+	ret = __guest_check_transition_size(0, ipa, nr_pages, &size);
+	if (ret)
+		return ret;
+
+	assert_host_shared_guest(vm, ipa, size);
 	guest_lock_component(vm);
-	ret = kvm_pgtable_stage2_test_clear_young(&vm->pgt, ipa, PAGE_SIZE, mkold);
+	ret = kvm_pgtable_stage2_test_clear_young(&vm->pgt, ipa, size, mkold);
 	guest_unlock_component(vm);
 
 	return ret;
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index daab4a00790a..057874bbe3e1 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -420,7 +420,7 @@ bool pkvm_pgtable_stage2_test_clear_young(struct kvm_pgtable *pgt, u64 addr, u64
 	lockdep_assert_held(&kvm->mmu_lock);
 	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping)
 		young |= kvm_call_hyp_nvhe(__pkvm_host_test_clear_young_guest, handle, mapping->gfn,
-					   mkold);
+					   1, mkold);
 
 	return young;
 }
-- 
2.49.0.1015.ga840276032-goog

