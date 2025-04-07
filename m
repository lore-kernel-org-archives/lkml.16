Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A95F22B584
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 08:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744014469; cv=none; b=hkjCSo/Z9DHq/RF/AVDCJXPOqBVA1WLgLtiP5GQUDbd0wMyiSz1W/uPo0i/WoDaaWLgX6YWiN4RLPR1It40qKeUtrQDoHH6qcW5DrzZadzr6pYsUPCWvBajAnYLHE6/E42s0pBr0U1hrktgAoQwfwLs2GE5xw9fQhAb8hVBiid4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744014469; c=relaxed/simple;
	bh=cSaWMlG3D7f39sDYeOOmQiW5NsLLNPUoCpZkJMcp+iw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Hfx4dXpv5D6gtDr5XlLTxxrkwGO+1GLd8G98ayudAS9yNMH6LE2rkgjH5zW1cIQn887tdRSqLFvnSK9d4PDQtJK7ekzsRr0yMDoBznNqo+h736xj4R0JHqhviHqFkSLXxvsjiizqvftKosRoHK8p43rPK2IcIIbW6KzsyrpddBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Lz/EEjqh; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Lz/EEjqh"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43cfda30a3cso24363175e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 01:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744014466; x=1744619266; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FRbmnXi/kMVYfkZ+DJBP7bhEsGPG5CEmYLC9waH1gHc=;
        b=Lz/EEjqh+JFu3c6DTJkQ6u7VkOYsWR6NeH2CHdle0QlYd5p14kmGvopPldHD7Vhb8p
         h2madksz7HwnRUq7u5JOjRx9AaJYQsjFYQkLzytwFkDGRGZ9lPVQD7q3KhMMWsKNswUo
         lsQN4PYbpkDLCPy6BEp9X1A/uqGFRme3hzMZqB5geaPBce+rz0qFNmJdk1uj8ap4/XJt
         nwDzBIb4zBS1W2LDVXxoj8/gurJWYpquDdZo2fsV9HV85wuT4Yb9PEKI2wpG1Hv+vK9V
         rtmn31pqhZ5M6NJUE8T6QkAtvFIZHwbfao/iFKJVL3gOcz4n7uTZehbWobzpd9P/GM0y
         BnRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744014466; x=1744619266;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FRbmnXi/kMVYfkZ+DJBP7bhEsGPG5CEmYLC9waH1gHc=;
        b=mbrA/fZguiBYUN7P3UrFVa4AcOCfO8o/9ovK1Bh3pgrxkTT8lWPY1oNebGr2egvX5c
         p9+yxWsyXvqMjnwKe5HODOezGZXFLOYGMgHS+EcaN1Furvpv5OlL1+YxemoBchGkQ7fP
         GMZYCTUnKR5JxIGfpcq9vDk69ffg3sAJOPEC7unzu/738TQPi2WIaeAmN2AM+W7DC+XK
         +qPjXhUmvAOBwQaKzTYMviskexSsit2lONnXZloG8zNVrwkDLP0KebRKO/Q4FnLw+Ur6
         RCwnOYPgtiFGc1Q0djsv4N2mJ/BuUiR3dyQyLolxjAUBxFgPKuHCH/HyLuXn0SeesMqh
         L1zw==
X-Forwarded-Encrypted: i=1; AJvYcCWLWeKg6twJbFgGNUC0Ir+5hWLkbA09tBnF7VWhNj27QgYODYjIGXkHnTSqr6FvfP+XJps0wx2j3kMZqKs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi4YfzXqMam8YW+rgVqGqgn4VoNeXwnr/Hm4EZlaSEbi6jZDbH
	rTH3CTnK6IVkqppx+9+6h+k9i7BNtk+1dt9jnZhoYAP1Oe3na+2y7Ji3wFecsPjTYnYKxHilrSH
	63XEtd5lDYIdVM+3sEA==
X-Google-Smtp-Source: AGHT+IEic6OXLHFjJFcSMjX6yW+diABGg79TavoXgMJoLPcFtBwYVwRi0D0qAEBQti0q9fFPcQTMJ2BeP0VaFbsn
X-Received: from wmqe6.prod.google.com ([2002:a05:600c:4e46:b0:43b:c914:a2d9])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:500c:b0:43d:bb9:ad00 with SMTP id 5b1f17b1804b1-43ecf8cf6b2mr129812945e9.15.1744014466013;
 Mon, 07 Apr 2025 01:27:46 -0700 (PDT)
Date: Mon,  7 Apr 2025 09:27:05 +0100
In-Reply-To: <20250407082706.1239603-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250407082706.1239603-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250407082706.1239603-9-vdonnefort@google.com>
Subject: [PATCH v3 8/9] KVM: arm64: Stage-2 huge mappings for np-guests
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
index ad14b79a32e2..da82d554ff88 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -167,7 +167,7 @@ int kvm_host_prepare_stage2(void *pgt_pool_base)
 static bool guest_stage2_force_pte_cb(u64 addr, u64 end,
 				      enum kvm_pgtable_prot prot)
 {
-	return true;
+	return false;
 }
 
 static void *guest_s2_zalloc_pages_exact(size_t size)
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 2feb6c6b63af..b1479e607a9b 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1537,7 +1537,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	 * logging_active is guaranteed to never be true for VM_PFNMAP
 	 * memslots.
 	 */
-	if (logging_active || is_protected_kvm_enabled()) {
+	if (logging_active) {
 		force_pte = true;
 		vma_shift = PAGE_SHIFT;
 	} else {
@@ -1547,7 +1547,8 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	switch (vma_shift) {
 #ifndef __PAGETABLE_PMD_FOLDED
 	case PUD_SHIFT:
-		if (fault_supports_stage2_huge_mapping(memslot, hva, PUD_SIZE))
+		if (!is_protected_kvm_enabled() &&
+		    fault_supports_stage2_huge_mapping(memslot, hva, PUD_SIZE))
 			break;
 		fallthrough;
 #endif
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 97ce9ca68143..18dfaee3143e 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -345,7 +345,7 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
 	u64 pfn = phys >> PAGE_SHIFT;
 	int ret;
 
-	if (size != PAGE_SIZE)
+	if (size != PAGE_SIZE && size != PMD_SIZE)
 		return -EINVAL;
 
 	lockdep_assert_held_write(&kvm->mmu_lock);
-- 
2.49.0.504.g3bcea36a83-goog

