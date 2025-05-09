Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F9C295512
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 13:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746796643; cv=none; b=PToGaY0cVGCZr5KW4ObcgVE/i300VwBjVTQfnzLAw8191FNTW2SZ56Z2yId3kdgDVgHHCAA20P26inJoq/+quA3+jMGyLfmiHXpbOUUQiomIKJ2ddO14RNTwRN+k34Cx36DYondhoCkiyPv6Zs1edexA9CKJedY2QPdOFsa+6JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746796643; c=relaxed/simple;
	bh=HPn8lrzAz8n6RVOfwH44bcQFtkRcGgvalRD3D6SncuU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=A2jylUSQinaF3fKWS2OQ4qQqJao7uUVb+V5hSgu5GG1eMqabMdHt4k909tg5LT8uX2VN5nLGI6AaFU5ZduUu2vD1rxYikGhMMRpU3algajl/V/rCC2mfEL/mCTK8vd4J4+UiOa2zqxX2tMASWpTX40ZXLLevt/R/p7qP+BtLhZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ICfHFwuU; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ICfHFwuU"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-442d472cf7fso9801945e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 06:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746796638; x=1747401438; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y89KpiuMEOxtubuMTpIdKZbHzHFigeuxmtNmFCn1YRw=;
        b=ICfHFwuUi4hgMy1UfR0nES7Yqbsb1pgmVbSRG3UGqBb4qAIueCfIvTKgJ3mRk8IvS0
         4Vfx69GJidr4Efq43onCO1o91wmDaPR12QiAR6v/ZHtWJoHifkH4+AsrN9I+q053G+zo
         +xpm13N8atRUGylaf+25IhiM3E0tL5Gr/yDE8LurZfwKVHGBWLlQ5uAzEvucc8R1N4TR
         cHr6dqNg2Yvwjsyp87DQvuyGLMONdE6XPkiMEuLL5IvJ82W+CH5+Y2G7tkFIYoQR3z04
         omR2QMhzWdUwaS9Z90qi6MpKUSt1UUcgrOUg4FX4Kk1Y3oc58WhW46l7M6RAqTjEo0rS
         dzew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746796638; x=1747401438;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y89KpiuMEOxtubuMTpIdKZbHzHFigeuxmtNmFCn1YRw=;
        b=tYTVzL1Aakzht2cLKZbp4DPdUMnWLWnA4H7sMXhRAYhG8Rq8ebIzxTOaxCGeclSyHM
         k4fzKhdrHr0xsyCOYfG4HKG60Z2pwDXJH67AcQF803bBCxx5mTUNW3bD+jgzDnJNUEAz
         vL1PK3/mJ/hBlqCrKW596o7+lGHR2XxiwjgU2zgIvY7GSI+EA0x4cwoTYObDv2TJARVj
         36GwanLicA1KCpxMx2ii3UzOcF1GHOU4KYali4OlTmhLvRuuo1OxttMXixPPIoDxwSsZ
         BDZY8cNhFYI1BwuJJQqKKkxgcQgfkeAfw8aRfhe3Fe22hkUoY8OAyTNvqKCSUAgFAqst
         mUrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiL2cOsmTWZOum27ba0nC/xIYFawcrGCSgh2l+mU3UlKhTlAlQaUryPrxJb4oEeIfsUD8JZqgjPcBvmHc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNSQ50m2WhHmZ7zv9OIufTWD5mBBIVpxIZIKCBuinBLDv8hcn1
	ct8HH1YZhDoUEE4hd/2FRGBjev5831dPTyf6pf6hqK9K+CqNgQ8DBbn3LpSmO/jVIZzuw8L+J8K
	bd081LeLuQmNHp2Pt/w==
X-Google-Smtp-Source: AGHT+IG0PFdA7tBxedgnr2V/gfd20+TBkPi+kPSsUQGO9pdlkgnf5jsutVLpvJ7X4gVCm/d6/ylRU+TZdpbjbrLs
X-Received: from wmbez7.prod.google.com ([2002:a05:600c:83c7:b0:442:cdb9:da41])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:46c3:b0:43c:fc04:6d35 with SMTP id 5b1f17b1804b1-442d6d0a9f6mr30262775e9.4.1746796638595;
 Fri, 09 May 2025 06:17:18 -0700 (PDT)
Date: Fri,  9 May 2025 14:17:00 +0100
In-Reply-To: <20250509131706.2336138-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250509131706.2336138-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Message-ID: <20250509131706.2336138-5-vdonnefort@google.com>
Subject: [PATCH v4 04/10] KVM: arm64: Add a range to __pkvm_host_unshare_guest()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

In preparation for supporting stage-2 huge mappings for np-guest. Add a
nr_pages argument to the __pkvm_host_unshare_guest hypercall. This range
supports only two values: 1 or PMD_SIZE / PAGE_SIZE (that is 512 on a
4K-pages system).

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index 47aa7b01114f..19671edbe18f 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -41,7 +41,7 @@ int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
 int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
 int __pkvm_host_share_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu *vcpu,
 			    enum kvm_pgtable_prot prot);
-int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
+int __pkvm_host_unshare_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *hyp_vm);
 int __pkvm_host_relax_perms_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_pgtable_prot prot);
 int __pkvm_host_wrprotect_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
 int __pkvm_host_test_clear_young_guest(u64 gfn, bool mkold, struct pkvm_hyp_vm *vm);
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 4d3d215955c3..5c03bd1db873 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -270,6 +270,7 @@ static void handle___pkvm_host_unshare_guest(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(pkvm_handle_t, handle, host_ctxt, 1);
 	DECLARE_REG(u64, gfn, host_ctxt, 2);
+	DECLARE_REG(u64, nr_pages, host_ctxt, 3);
 	struct pkvm_hyp_vm *hyp_vm;
 	int ret = -EINVAL;
 
@@ -280,7 +281,7 @@ static void handle___pkvm_host_unshare_guest(struct kvm_cpu_context *host_ctxt)
 	if (!hyp_vm)
 		goto out;
 
-	ret = __pkvm_host_unshare_guest(gfn, hyp_vm);
+	ret = __pkvm_host_unshare_guest(gfn, nr_pages, hyp_vm);
 	put_pkvm_hyp_vm(hyp_vm);
 out:
 	cpu_reg(host_ctxt, 1) =  ret;
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index f0f7c6f83e57..ae9a91a21a61 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -990,7 +990,7 @@ int __pkvm_host_share_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu
 	return ret;
 }
 
-static int __check_host_shared_guest(struct pkvm_hyp_vm *vm, u64 *__phys, u64 ipa)
+static int __check_host_shared_guest(struct pkvm_hyp_vm *vm, u64 *__phys, u64 ipa, u64 size)
 {
 	enum pkvm_page_state state;
 	struct hyp_page *page;
@@ -1004,7 +1004,7 @@ static int __check_host_shared_guest(struct pkvm_hyp_vm *vm, u64 *__phys, u64 ip
 		return ret;
 	if (!kvm_pte_valid(pte))
 		return -ENOENT;
-	if (level != KVM_PGTABLE_LAST_LEVEL)
+	if (kvm_granule_size(level) != size)
 		return -E2BIG;
 
 	state = guest_get_page_state(pte, ipa);
@@ -1012,43 +1012,50 @@ static int __check_host_shared_guest(struct pkvm_hyp_vm *vm, u64 *__phys, u64 ip
 		return -EPERM;
 
 	phys = kvm_pte_to_phys(pte);
-	ret = check_range_allowed_memory(phys, phys + PAGE_SIZE);
+	ret = check_range_allowed_memory(phys, phys + size);
 	if (WARN_ON(ret))
 		return ret;
 
-	page = hyp_phys_to_page(phys);
-	if (get_host_state(page) != PKVM_PAGE_SHARED_OWNED)
-		return -EPERM;
-	if (WARN_ON(!page->host_share_guest_count))
-		return -EINVAL;
+	for_each_hyp_page(phys, size, page) {
+		if (get_host_state(page) != PKVM_PAGE_SHARED_OWNED)
+			return -EPERM;
+		if (WARN_ON(!page->host_share_guest_count))
+			return -EINVAL;
+	}
 
 	*__phys = phys;
 
 	return 0;
 }
 
-int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *vm)
+int __pkvm_host_unshare_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *vm)
 {
 	u64 ipa = hyp_pfn_to_phys(gfn);
 	struct hyp_page *page;
-	u64 phys;
+	u64 size, phys;
 	int ret;
 
+	ret = __guest_check_transition_size(0, ipa, nr_pages, &size);
+	if (ret)
+		return ret;
+
 	host_lock_component();
 	guest_lock_component(vm);
 
-	ret = __check_host_shared_guest(vm, &phys, ipa);
+	ret = __check_host_shared_guest(vm, &phys, ipa, size);
 	if (ret)
 		goto unlock;
 
-	ret = kvm_pgtable_stage2_unmap(&vm->pgt, ipa, PAGE_SIZE);
+	ret = kvm_pgtable_stage2_unmap(&vm->pgt, ipa, size);
 	if (ret)
 		goto unlock;
 
-	page = hyp_phys_to_page(phys);
-	page->host_share_guest_count--;
-	if (!page->host_share_guest_count)
-		WARN_ON(__host_set_page_state_range(phys, PAGE_SIZE, PKVM_PAGE_OWNED));
+	for_each_hyp_page(phys, size, page) {
+		/* __check_host_shared_guest() protects against underflow */
+		page->host_share_guest_count--;
+		if (!page->host_share_guest_count)
+			set_host_state(page, PKVM_PAGE_OWNED);
+	}
 
 unlock:
 	guest_unlock_component(vm);
@@ -1068,7 +1075,7 @@ static void assert_host_shared_guest(struct pkvm_hyp_vm *vm, u64 ipa)
 	host_lock_component();
 	guest_lock_component(vm);
 
-	ret = __check_host_shared_guest(vm, &phys, ipa);
+	ret = __check_host_shared_guest(vm, &phys, ipa, PAGE_SIZE);
 
 	guest_unlock_component(vm);
 	host_unlock_component();
@@ -1255,7 +1262,7 @@ void pkvm_ownership_selftest(void *base)
 	assert_transition_res(-EPERM,	__pkvm_host_unshare_ffa, pfn, 1);
 	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
-	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, vm);
+	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, 1, vm);
 
 	selftest_state.host = PKVM_PAGE_OWNED;
 	selftest_state.hyp = PKVM_NOPAGE;
@@ -1263,7 +1270,7 @@ void pkvm_ownership_selftest(void *base)
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn);
 	assert_transition_res(-EPERM,	__pkvm_host_unshare_ffa, pfn, 1);
-	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, vm);
+	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, 1, vm);
 	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);
 
 	selftest_state.host = PKVM_PAGE_SHARED_OWNED;
@@ -1274,7 +1281,7 @@ void pkvm_ownership_selftest(void *base)
 	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
-	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, vm);
+	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, 1, vm);
 
 	assert_transition_res(0,	hyp_pin_shared_mem, virt, virt + size);
 	assert_transition_res(0,	hyp_pin_shared_mem, virt, virt + size);
@@ -1286,7 +1293,7 @@ void pkvm_ownership_selftest(void *base)
 	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
-	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, vm);
+	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, 1, vm);
 
 	hyp_unpin_shared_mem(virt, virt + size);
 	assert_page_state();
@@ -1305,7 +1312,7 @@ void pkvm_ownership_selftest(void *base)
 	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn);
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
-	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, vm);
+	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, 1, vm);
 	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);
 
 	selftest_state.host = PKVM_PAGE_OWNED;
@@ -1329,11 +1336,11 @@ void pkvm_ownership_selftest(void *base)
 	WARN_ON(hyp_virt_to_page(virt)->host_share_guest_count != 2);
 
 	selftest_state.guest[0] = PKVM_NOPAGE;
-	assert_transition_res(0,	__pkvm_host_unshare_guest, gfn, vm);
+	assert_transition_res(0,	__pkvm_host_unshare_guest, gfn, 1, vm);
 
 	selftest_state.guest[1] = PKVM_NOPAGE;
 	selftest_state.host = PKVM_PAGE_OWNED;
-	assert_transition_res(0,	__pkvm_host_unshare_guest, gfn + 1, vm);
+	assert_transition_res(0,	__pkvm_host_unshare_guest, gfn + 1, 1, vm);
 
 	selftest_state.host = PKVM_NOPAGE;
 	selftest_state.hyp = PKVM_PAGE_OWNED;
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 0285e2cd2e7f..f77c5157a8d7 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -371,7 +371,7 @@ int pkvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size)
 
 	lockdep_assert_held_write(&kvm->mmu_lock);
 	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping) {
-		ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_guest, handle, mapping->gfn);
+		ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_guest, handle, mapping->gfn, 1);
 		if (WARN_ON(ret))
 			break;
 		rb_erase(&mapping->node, &pgt->pkvm_mappings);
-- 
2.49.0.1015.ga840276032-goog

