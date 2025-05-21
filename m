Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D85D26E17A
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 12:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747831878; cv=none; b=IHQ4RHOghmSUgHCU6hzyPjzw6cCZTnMGnrPqrfRqX2hwPHaNDmT5Dyl4CeBTtu3YuZmO4XTmKKI7aGcbnQcJTFjviYW6YBz6KDD7W23s5G8JAWGL2gaCPtv8c/8MwcuLRPKl6SBOHxi8pV0T9QQHrFGdjNMvOZtqTMXHt0Re0m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747831878; c=relaxed/simple;
	bh=Q1Lc4SelnIqqZ8x5yzeOZdivf0g9ssVJJqMqyBh+gKk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=r4l3ni7xzrL8wrdaq8yvCUYpQfOu2drsJn8qEyXNiwFMi5xF8Ozhr/9JGWjV8JCz5wKhbSoXkzundW5yMWJJcm95ZL5G4ummlpLkXTKz6gbfHM9U3Ts6raH9xksluG7CtJE91buATPiq4PhLXwyLBlsaawd3kIfGPJao7ATr4hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iBQU6RX9; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iBQU6RX9"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3a3683aa00eso2115681f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 05:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747831875; x=1748436675; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=h7Oq5jwZK0pb08xH59h8gdjNoJEBEnOv69ZeonvXBfg=;
        b=iBQU6RX9JB1Bmlbe0SUKdzsJYCJ9f+c5LG/fkw/rYRLDIVMKzyZ+asFz7yiGeYc/ok
         cM08gCbQSh8Fq8VwBsetXuj0qETCSrEVB25pBvnAIkxjJmcSpZ0Nk6tzg1EfYRv+Ffiu
         fk3VgIKVlwuUe0KaKO18iwrTFU+k8P0E4Nv76Ee4vidtHd5Xf5tkLM3D1AlKIXr2MKKZ
         EBs/M05Hi60x2v1soSozlOIkAh+tzwRdW2jgedWuFgkWaJLpAKtBGdJBzz3E/UseaAEY
         5iS+iSmCSvJ8Jyej/l92UyCPX8+lXFERNOdAEWOSWQKHdsHjL0PPTBSI6o7OzuFFhty1
         iypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747831875; x=1748436675;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h7Oq5jwZK0pb08xH59h8gdjNoJEBEnOv69ZeonvXBfg=;
        b=elUybEQkS9iZA6zoulTF7RQqoR17ztbX1DDQlpeLnJLj8GDwwP9elZ06t9gG1L6Kkw
         PcKYUUH2YAa4XnGsGswti6p8tZtdXpGEeWvIjkHI0S8gkmB/75A56yTuv/q6s9a5MMde
         hV0i2r+tqbDoRprFgfgDN4IGy2aXdjTrwMQO6IgcKmsdmfHn7Wo65ohg3X1KE+pb3wbS
         1r3gbdEe32Ksr7RyNh1Q6fWa8sAFK1VrmgO0yx4Dfb+9dFyjUjZvP8dI0SMQophmG5Qz
         cZTw9scyeVDuNJS+TphSnxzWSSnJaPuKFSE50FVkHT0vNGQc98mAebiDWRcs3+XJssyY
         M7PA==
X-Forwarded-Encrypted: i=1; AJvYcCVsOiBWuOhnkQ5bM/xOEOMhNTuvHwbDPoATz3PbRtIcUGuV8y8PFCj9o0/7SJgwebeZ79avIQw7FyiUlCs=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk9xqVysXdicSivFDs5ZqloPRK42kmodqwTlR64WmYTBoi1ky1
	WvQkyPl8sNbwI/tNrMYkLufRQ+QRiYYGUlSmq1UvMAQSRJmv2tPX7WnMfW06ryQGxbKW831Co4Z
	bbxKxZqbyBCfkhqxbVLXmtQ==
X-Google-Smtp-Source: AGHT+IG2h60jELokLEU/h5uhC0DSsHsKCsOBofWotQOOeFuSTUQx51WyDXB/rj32MRC8kvwd+rTI6s1Fodm9S1qj
X-Received: from wmbhj14.prod.google.com ([2002:a05:600c:528e:b0:442:f9ef:e460])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2582:b0:3a3:6915:33a6 with SMTP id ffacd0b85a97d-3a369153515mr12239550f8f.23.1747831874642;
 Wed, 21 May 2025 05:51:14 -0700 (PDT)
Date: Wed, 21 May 2025 13:48:30 +0100
In-Reply-To: <20250521124834.1070650-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250521124834.1070650-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <20250521124834.1070650-7-vdonnefort@google.com>
Subject: [PATCH v6 06/10] KVM: arm64: Add a range to __pkvm_host_test_clear_young_guest()
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
index 569adeaa0869..e08c735206e0 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1111,17 +1111,21 @@ int __pkvm_host_wrprotect_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *vm)
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
2.49.0.1112.g889b7c5bd8-goog

