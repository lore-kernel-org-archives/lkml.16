Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9BD211715
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 15:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744817228; cv=none; b=TKzWQKOQ5hQQ2GaZW1vzKo9nlnDIlw1i+UhKTkn0ojjD7D64oh9D2wmj4mlMObFqN2cu7vH4eUbuctNsq0enlkjH0OlANccutt+wRSZURrjeq0rVtqMkwBwJOt/B4+F5X4mQbXxKIzj4WcjY/A/l7HhjmN+XXbB6b3SR5U/w8Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744817228; c=relaxed/simple;
	bh=mlPlfdc/NWwYqy2zjYwAzNRWIZhZ7ZZR38Y6Ldz2Cr0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ee6AYKtVne4UMhgsjT1KGb2fSumSP+gZ2ozoHGDLIihZ0e557r2AA6e2L1rud/RsqEsBAP3mzqTYtF3jIiIGNvoRkByNd342HugbS1f5iVIK5+PsDZc9+trCm+OaAIA8mZ2haepRBkVOrPiM1MOlIIgB+jprV8tqgijOLcEOB3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--qperret.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rNayNeQD; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--qperret.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rNayNeQD"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-ac3dca41591so620226066b.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744817224; x=1745422024; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VYU32RrZwSVxBTFJfFZ/zcmulUROASDhu21QhFFvtpI=;
        b=rNayNeQDPSxQYMnciZNcdl7/kUmhK16bMPGV70Gxg5zzBD/MLjOXtAzRXFXk4tGkCI
         rImmHevMX1axjiPTW14omZr7+wKAGB0Qf4zWr7ZmQtbWGkD8tZzIxYEx56fIGYBH8lgb
         4+8YLYILzeweoplpMqIGIOGF2ozD557XlXDUqWgyiwF0nQdmoAm2sbU40hNner/8BWsX
         wCx0XppMyPhUm0DpVB8vTy4rYv8qkB7HxYaoIKeIqNoevC3gLBHDuG0+DMbShP4Jl/7p
         BaGCuJdQi+Fsz7GSgK7yzaYuoYu6ABy1elFdI7AKPmEqoy8G/BwYWxhgNsDlTP6DkLTM
         VB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744817224; x=1745422024;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VYU32RrZwSVxBTFJfFZ/zcmulUROASDhu21QhFFvtpI=;
        b=S4dOyaP6oDwjI+IZeQbcbQYCDwM0n5jl5DgKW1/CwUFYnPvVWOlEwqkl/1kwM5MMux
         3OrgMVXqLm+XqISl6JXgSZTYMuKhhtRsWTEJQ+33+AVZMw3zNpOTzyG5FnSe5bxhm1Uh
         BQFxTgiuFcybkKynGwD2FHqcOyxveakBJ5JZEBinQNKlftvmO251do+zWbS6RuYrxkgI
         mJBO7+m8v/9uD13/8ZihXxEraE5hhJWSoUe2FNoDmmzbGE//h9APmFsAiSP9z2drFCau
         fjrWLAmAtgVkdLBaQ4TuKeQcJt1ED3FL9Y5l6oF+JW0lBfpS+OLklLNVXk1NwGHa/rOh
         3pVQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3xyqOqCrjx5ylQo0Fzp2W+rDXWU8deL23Mj4nkFgIDrxzks4vzAY5cgpKUMBLHCKIMLlcwj2s9YpjnB8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHSgtZSViLQO7O/1vlYcnx7nyreR2TngclXAXanBGuYTL/+0I7
	TrgQ2PEu4Od8TXB1Y32sWmAlLRWPuKfr5CKBWQLdGNvEO/X9grF+EgaRLv9PhyZUFLtoII9LSl6
	OSwtdKA==
X-Google-Smtp-Source: AGHT+IFx/wZB15eiIdBs2Eh1Wi5DlZDuOgycITN7QmUrR/0Pho2JFdCK7PrHfR8mLm6W9F5WKdLs/Vk8CDxe
X-Received: from edyc19.prod.google.com ([2002:aa7:df13:0:b0:5ec:dada:a73e])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:478a:b0:ac7:cfe0:3014
 with SMTP id a640c23a62f3a-acb4296492fmr220940266b.25.1744817224502; Wed, 16
 Apr 2025 08:27:04 -0700 (PDT)
Date: Wed, 16 Apr 2025 15:26:46 +0000
In-Reply-To: <20250416152648.2982950-1-qperret@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250416152648.2982950-1-qperret@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250416152648.2982950-7-qperret@google.com>
Subject: [PATCH v2 6/7] KVM: arm64: Defer EL2 stage-1 mapping on share
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, Fuad Tabba <tabba@google.com>, 
	Quentin Perret <qperret@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

We currently blindly map into EL2 stage-1 *any* page passed to the
__pkvm_host_share_hyp() HVC. This is less than ideal from a security
perspective as it makes exploitation of potential hypervisor gadgets
easier than it should be. But interestingly, pKVM should never need to
access SHARED_BORROWED pages that it hasn't previously pinned, so there
is no need to map the page before that.

Reviewed-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 25ff84c053c1..91b757e3fb4c 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -693,7 +693,6 @@ static int __guest_check_page_state_range(struct pkvm_hyp_vcpu *vcpu, u64 addr,
 int __pkvm_host_share_hyp(u64 pfn)
 {
 	u64 phys = hyp_pfn_to_phys(pfn);
-	void *virt = __hyp_va(phys);
 	u64 size = PAGE_SIZE;
 	int ret;
 
@@ -710,7 +709,6 @@ int __pkvm_host_share_hyp(u64 pfn)
 	}
 
 	__hyp_set_page_state_range(phys, size, PKVM_PAGE_SHARED_BORROWED);
-	WARN_ON(pkvm_create_mappings_locked(virt, virt + size, PAGE_HYP));
 	WARN_ON(__host_set_page_state_range(phys, size, PKVM_PAGE_SHARED_OWNED));
 
 unlock:
@@ -742,7 +740,6 @@ int __pkvm_host_unshare_hyp(u64 pfn)
 	}
 
 	__hyp_set_page_state_range(phys, size, PKVM_NOPAGE);
-	WARN_ON(kvm_pgtable_hyp_unmap(&pkvm_pgtable, virt, size) != size);
 	WARN_ON(__host_set_page_state_range(phys, size, PKVM_PAGE_OWNED));
 
 unlock:
@@ -818,6 +815,7 @@ int hyp_pin_shared_mem(void *from, void *to)
 	u64 end = PAGE_ALIGN((u64)to);
 	u64 phys = __hyp_pa(start);
 	u64 size = end - start;
+	struct hyp_page *p;
 	int ret;
 
 	host_lock_component();
@@ -831,8 +829,14 @@ int hyp_pin_shared_mem(void *from, void *to)
 	if (ret)
 		goto unlock;
 
-	for (cur = start; cur < end; cur += PAGE_SIZE)
-		hyp_page_ref_inc(hyp_virt_to_page(cur));
+	for (cur = start; cur < end; cur += PAGE_SIZE) {
+		p = hyp_virt_to_page(cur);
+		hyp_page_ref_inc(p);
+		if (p->refcount == 1)
+			WARN_ON(pkvm_create_mappings_locked((void *)cur,
+							    (void *)cur + PAGE_SIZE,
+							    PAGE_HYP));
+	}
 
 unlock:
 	hyp_unlock_component();
@@ -845,12 +849,17 @@ void hyp_unpin_shared_mem(void *from, void *to)
 {
 	u64 cur, start = ALIGN_DOWN((u64)from, PAGE_SIZE);
 	u64 end = PAGE_ALIGN((u64)to);
+	struct hyp_page *p;
 
 	host_lock_component();
 	hyp_lock_component();
 
-	for (cur = start; cur < end; cur += PAGE_SIZE)
-		hyp_page_ref_dec(hyp_virt_to_page(cur));
+	for (cur = start; cur < end; cur += PAGE_SIZE) {
+		p = hyp_virt_to_page(cur);
+		if (p->refcount == 1)
+			WARN_ON(kvm_pgtable_hyp_unmap(&pkvm_pgtable, cur, PAGE_SIZE) != PAGE_SIZE);
+		hyp_page_ref_dec(p);
+	}
 
 	hyp_unlock_component();
 	host_unlock_component();
-- 
2.49.0.604.gff1f9ca942-goog

