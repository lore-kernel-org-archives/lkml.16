Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C0D1EB186
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 14:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738940089; cv=none; b=FlV7HaSgtsrD6XK8Rjj24x/PcpA5EN4bWcqehK7D9xuNtIJQelFjoI4YL+vIUH1GbErXoMySPyDu3Q2b3DPB2ZGSuPUv5YGupgpMgAGh/V3fMlRGF1SoXDZoLhhMOi4au1an1VkOGGIT2g4L2Av22jJHL2MBOKvC2V6R9tPR+lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738940089; c=relaxed/simple;
	bh=7YwVG7hAXiAQe6oe2H0WofBt3yAK0jzo/OvknGwgC6M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=auT2qfQgoXSniPLkPdxk0nWrKkozxEGWyBvqSKOnNZiOtH9cRtc32HCKwo+PTk/G7FrjO6yySWGD17GAcNv6BBuJ30jejJhxg6d3T404mxjNoJf797ptGC8PHGqUeqGrkSjRvxr4jiPAl2j0Ev37Ar/a/ZxN1bw46Ab+Im4DN7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--qperret.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Hi3mVsh0; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--qperret.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Hi3mVsh0"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-5dca72b752fso2420390a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 06:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738940086; x=1739544886; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EVbHfeOZZeQwuwJHSY7djFz56cmMNDUZpBf4HXbLLoc=;
        b=Hi3mVsh0LHkS2s+IEsd8GkDOkiSu7nsxf0cFvs42g1rh4uprA+7/cqGmt8epD4iERp
         +CQJ+YljRKkE3JFQ5m1YuOUKiQkfx+Ubu51QlfwA7dv3RVOlVf/sJkIKwzlOZFCsq8q0
         KL7Cn8Hgfu5mxWHQcbq35J2nZE502XxI1W7LkrN7sjSiOWQAF7Hzu+wAGf88yqZM3tZF
         XNXu7AQGERtZykCvg2qMuFDObGMrgi2MgJsszA3rDUOCRIdK7AYZ1kBnpV/Kj2TvVfvq
         yWHeUUEzRMUrLThTDBiluL0i62pbABclQoxsvc11FvsbGHxxpSTGG7YisYf2eyljSPI1
         DBHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738940086; x=1739544886;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EVbHfeOZZeQwuwJHSY7djFz56cmMNDUZpBf4HXbLLoc=;
        b=D7vVZVjQkeMzy28+x7dDrtP0shxVTdoTcBefOLgLXIwE37fxI6rZQ9up/IHQt4cqPl
         RjrJppBlybw+Fa3xTwr+xQSD8Vfh1EADMQ+2OL0dONDFAJESPnxzPaCpJ8IPT6oB89jg
         0/jBrVWYHUjLbETbF4DVtfjcFd6INF9+KuTEpNP9Y84i0xBnjD7ZvlQ55J13BhCzS8Zm
         NLnNlsc9P4hzAyllDKO8yTZlZOsmuC6hWZJV1F8cwoXOxgW8SiL5zIdeu5/Sva/IdHTM
         j/hJOnG8B1z0ZefdMxySsugTh+nXfvrw4WP9KMW01ihMrTeXqwZj1L4c6OMMxMu828aE
         dwTg==
X-Forwarded-Encrypted: i=1; AJvYcCWgVpOyJnmA30WklZDaG9k+QlH0Nffed2wOQi8XbgBSj5Y6tJkslWBwZotbEQS+LPnJsPM9aemIqmEaQ9Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/xQs6poWAKd2MWhvbQ7En3EAyXsk1nAR6Wuv6Iv3uuMWIUYNF
	h8lXGjNhKQfazIRA7KqMjd8I4Ine0bBhlLkvQKnH1jV6ji75ShPIPwXyVH5bY1IjbfhAtid2hPF
	o+E2oSQ==
X-Google-Smtp-Source: AGHT+IHcADnZ88ZDBPcCM/6Viy+F4eISrGE+uNYHO/bQ+LOgCwyU9X5ytoU17kork4MbEbCQlQqyCizNz+Zl
X-Received: from edbio9.prod.google.com ([2002:a05:6402:2189:b0:5dc:22e2:2325])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:35c6:b0:5de:5263:ae79
 with SMTP id 4fb4d7f45d1cf-5de5263af0bmr1071447a12.12.1738940085850; Fri, 07
 Feb 2025 06:54:45 -0800 (PST)
Date: Fri,  7 Feb 2025 14:54:38 +0000
In-Reply-To: <20250207145438.1333475-1-qperret@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250207145438.1333475-1-qperret@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250207145438.1333475-3-qperret@google.com>
Subject: [PATCH 2/2] KVM: arm64: Simplify np-guest hypercalls
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When the handling of a guest stage-2 permission fault races with an MMU
notifier, the faulting page might be gone from the guest's stage-2 by
the point we attempt to call (p)kvm_pgtable_stage2_relax_perms(). In the
normal KVM case, this leads to returning -EAGAIN which user_mem_abort()
handles correctly by simply re-entering the guest. However, the pKVM
hypercall implementation has additional logic to check the page state
using __check_host_shared_guest() which gets confused with absence of a
page mapped at the requested IPA and returns -ENOENT, hence breaking
user_mem_abort() and hilarity ensues.

Luckily, several of the hypercalls for managing the stage-2 page-table
of NP guests have no effect on the pKVM ownership tracking (wrprotect,
test_clear_young, mkyoung, and crucially relax_perms), so the extra
state checking logic is in fact not strictly necessary. So, to fix the
discrepancy between standard KVM and pKVM, let's just drop the
superfluous __check_host_shared_guest() logic from those hypercalls and
make the extra state checking a debug assertion dependent on
CONFIG_NVHE_EL2_DEBUG as we already do for other transitions.

Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 69 +++++++++++++++------------
 1 file changed, 38 insertions(+), 31 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 41847c04b270..4c2f6a6a2efe 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -998,63 +998,73 @@ int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *vm)
 	return ret;
 }
 
-int __pkvm_host_relax_perms_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_pgtable_prot prot)
+static void assert_host_shared_guest(struct pkvm_hyp_vm *vm, u64 ipa)
 {
-	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
-	u64 ipa = hyp_pfn_to_phys(gfn);
 	u64 phys;
 	int ret;
 
-	if (prot & ~KVM_PGTABLE_PROT_RWX)
-		return -EINVAL;
+	if (!IS_ENABLED(CONFIG_NVHE_EL2_DEBUG))
+		return;
 
 	host_lock_component();
 	guest_lock_component(vm);
 
 	ret = __check_host_shared_guest(vm, &phys, ipa);
-	if (!ret)
-		ret = kvm_pgtable_stage2_relax_perms(&vm->pgt, ipa, prot, 0);
 
 	guest_unlock_component(vm);
 	host_unlock_component();
 
-	return ret;
+	WARN_ON(ret && ret != -ENOENT);
 }
 
-int __pkvm_host_wrprotect_guest(u64 gfn, struct pkvm_hyp_vm *vm)
+int __pkvm_host_relax_perms_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_pgtable_prot prot)
 {
+	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
 	u64 ipa = hyp_pfn_to_phys(gfn);
-	u64 phys;
 	int ret;
 
-	host_lock_component();
-	guest_lock_component(vm);
+	if (pkvm_hyp_vm_is_protected(vm))
+		return -EPERM;
 
-	ret = __check_host_shared_guest(vm, &phys, ipa);
-	if (!ret)
-		ret = kvm_pgtable_stage2_wrprotect(&vm->pgt, ipa, PAGE_SIZE);
+	if (prot & ~KVM_PGTABLE_PROT_RWX)
+		return -EINVAL;
 
+	assert_host_shared_guest(vm, ipa);
+	guest_lock_component(vm);
+	ret = kvm_pgtable_stage2_relax_perms(&vm->pgt, ipa, prot, 0);
 	guest_unlock_component(vm);
-	host_unlock_component();
 
 	return ret;
 }
 
-int __pkvm_host_test_clear_young_guest(u64 gfn, bool mkold, struct pkvm_hyp_vm *vm)
+int __pkvm_host_wrprotect_guest(u64 gfn, struct pkvm_hyp_vm *vm)
 {
 	u64 ipa = hyp_pfn_to_phys(gfn);
-	u64 phys;
 	int ret;
 
-	host_lock_component();
+	if (pkvm_hyp_vm_is_protected(vm))
+		return -EPERM;
+
+	assert_host_shared_guest(vm, ipa);
 	guest_lock_component(vm);
+	ret = kvm_pgtable_stage2_wrprotect(&vm->pgt, ipa, PAGE_SIZE);
+	guest_unlock_component(vm);
 
-	ret = __check_host_shared_guest(vm, &phys, ipa);
-	if (!ret)
-		ret = kvm_pgtable_stage2_test_clear_young(&vm->pgt, ipa, PAGE_SIZE, mkold);
+	return ret;
+}
 
+int __pkvm_host_test_clear_young_guest(u64 gfn, bool mkold, struct pkvm_hyp_vm *vm)
+{
+	u64 ipa = hyp_pfn_to_phys(gfn);
+	int ret;
+
+	if (pkvm_hyp_vm_is_protected(vm))
+		return -EPERM;
+
+	assert_host_shared_guest(vm, ipa);
+	guest_lock_component(vm);
+	ret = kvm_pgtable_stage2_test_clear_young(&vm->pgt, ipa, PAGE_SIZE, mkold);
 	guest_unlock_component(vm);
-	host_unlock_component();
 
 	return ret;
 }
@@ -1063,18 +1073,15 @@ int __pkvm_host_mkyoung_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu)
 {
 	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
 	u64 ipa = hyp_pfn_to_phys(gfn);
-	u64 phys;
 	int ret;
 
-	host_lock_component();
-	guest_lock_component(vm);
-
-	ret = __check_host_shared_guest(vm, &phys, ipa);
-	if (!ret)
-		kvm_pgtable_stage2_mkyoung(&vm->pgt, ipa, 0);
+	if (pkvm_hyp_vm_is_protected(vm))
+		return -EPERM;
 
+	assert_host_shared_guest(vm, ipa);
+	guest_lock_component(vm);
+	kvm_pgtable_stage2_mkyoung(&vm->pgt, ipa, 0);
 	guest_unlock_component(vm);
-	host_unlock_component();
 
 	return ret;
 }
-- 
2.48.1.502.g6dc24dfdaf-goog

