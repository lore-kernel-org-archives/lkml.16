Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C2120D51D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 15:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743523043; cv=none; b=JNFj9Lbig0IJ6vTV/KZQwu5P8AffFz5eQ3eshNh3r1wD/enhzyhLG+Prhse/5rqdodhPqB+mBmjg+IWc1aRHGBKf/iVqdezg/JFm3xpNc91jQxnmNP71OJdBUf3pM5MRJeCPuJ4B4Noa4kwkz7gyCOSBHVOA84Xob3IjGs1ocFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743523043; c=relaxed/simple;
	bh=9xW9GrSKCT/xwLFYa59X9SWljYJetUhynN30KptsTI4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ArqPyeb9eW/Q5TnnGcj7kyvbQI8Hw8fsNrmXbEFOiVv0QREPMpZBltGYi5/z2oKi6rP6xPcE5oucigoLTSvs+BLB0fJBVqAaZjmNpsMrJVf2ta1Hot0sRSMArgICzdr/sPbKwjIBFHiJ+rSN+SricrrDsSKn1t+BBqRO84MMpcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VeqA0S6S; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VeqA0S6S"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-30566e34290so970434a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 08:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743523041; x=1744127841; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=OcWZ8FomvSCbpj1QhcSsf3iHQ4ToTVlAqE/iZm3XJpQ=;
        b=VeqA0S6SCrWkkrdcdFt3WlTvC+rz5BGjdUxqJfeRjoOkC/0FG6k6UZ2n30Ebu8wa0V
         N5iyLrEK4DpyIVTKRXNt9mnI1sr06sZGUcPBgoyjZvXcyks+WT0LTgNoS15vgB7vIX8z
         2lVtuvxvEVnBVvVQo+vUk+cF+OaC2MbvnQNsd1Tkt3goB2BoWLwBtMvKWxc47G+GmXTd
         sZofK4erYCdQ86CvkiWraHHE34rAYC8x7RUxSj/dmCIOg3yC0PM/B8yvexVixzao9VAh
         HguZfbRGrFpSBeiPT+3FfzEItHvJ5Umx9rqHwmEREuavj9pW0dzYOwuVY24Cn03uXfmL
         He9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743523041; x=1744127841;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OcWZ8FomvSCbpj1QhcSsf3iHQ4ToTVlAqE/iZm3XJpQ=;
        b=l4vlzAaZYfIm13MWizPsif1/NYyQGPRMq+iN5oGpU0elPv2GliYlNDVkYTGUGOeSMZ
         7H/C67SiNiYt6wmP2InYcz9eLd0dLZrixxLE6fFzetMC3i4uejVzb4aVqKbWQPestcvp
         4//XRX479+Uh9XeC6SaiefRmBOoqHRl4jqCOxGy2eOlJCzxpojxYDraHByfveYjd6qMv
         xg61qpvjxDlytWiGAx5e/90DKE8T/buX57GhuTc35NskotAWB0B5HbNCw2tYe7wPsI2U
         nrxzmu4XZSvo7zwVTf22L2Lo+XcNZy2wvUM5odrE1rigX0cawJ6RZMtnq2rxbC/OL52o
         hNDg==
X-Forwarded-Encrypted: i=1; AJvYcCVi+qbNqjhLzDbUcYgeWK10uDS+HdnGy/sQ52QDa8fmAVQfGjikmvzimAnt8jNCUJlBHt4NgY9UXkg4Bxk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9uxHv9rep0OywNhAV6yqG/DEcHZpj8hboxOwAHMFzrxFOSXM3
	JkHL48x1ridEeSf6bExo89Z3KlTAfua+aE+dXEbuS2F93IlsfHz6u55n6mppfGXNZ7l7nL0TB55
	YRg==
X-Google-Smtp-Source: AGHT+IHu9Zv08nz2HYgQrk1iOQEUOZWiNQiFOu+C1kdTrpqwaD1bTf9yPuSC+oGjaWR9wby7kt+YZPyycSE=
X-Received: from pfbli7.prod.google.com ([2002:a05:6a00:7187:b0:736:a983:dc43])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:aa7:88c9:0:b0:736:34ff:be7
 with SMTP id d2e1a72fcca58-7398044e159mr16761821b3a.15.1743523041623; Tue, 01
 Apr 2025 08:57:21 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue,  1 Apr 2025 08:57:14 -0700
In-Reply-To: <20250401155714.838398-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250401155714.838398-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250401155714.838398-4-seanjc@google.com>
Subject: [PATCH v2 3/3] KVM: x86/mmu: Defer allocation of shadow MMU's hashed
 page list
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"

When the TDP MMU is enabled, i.e. when the shadow MMU isn't used until a
nested TDP VM is run, defer allocation of the array of hashed lists used
to track shadow MMU pages until the first shadow root is allocated.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 40 ++++++++++++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 6b9c72405860..213009cdba15 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -1982,14 +1982,25 @@ static bool sp_has_gptes(struct kvm_mmu_page *sp)
 	return true;
 }
 
+static __ro_after_init HLIST_HEAD(empty_page_hash);
+
+static struct hlist_head *kvm_get_mmu_page_hash(struct kvm *kvm, gfn_t gfn)
+{
+	struct hlist_head *page_hash = READ_ONCE(kvm->arch.mmu_page_hash);
+
+	if (!page_hash)
+		return &empty_page_hash;
+
+	return &page_hash[kvm_page_table_hashfn(gfn)];
+}
+
 #define for_each_valid_sp(_kvm, _sp, _list)				\
 	hlist_for_each_entry(_sp, _list, hash_link)			\
 		if (is_obsolete_sp((_kvm), (_sp))) {			\
 		} else
 
 #define for_each_gfn_valid_sp_with_gptes(_kvm, _sp, _gfn)		\
-	for_each_valid_sp(_kvm, _sp,					\
-	  &(_kvm)->arch.mmu_page_hash[kvm_page_table_hashfn(_gfn)])	\
+	for_each_valid_sp(_kvm, _sp, kvm_get_mmu_page_hash(_kvm, _gfn))	\
 		if ((_sp)->gfn != (_gfn) || !sp_has_gptes(_sp)) {} else
 
 static bool kvm_sync_page_check(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp)
@@ -2357,6 +2368,7 @@ static struct kvm_mmu_page *__kvm_mmu_get_shadow_page(struct kvm *kvm,
 	struct kvm_mmu_page *sp;
 	bool created = false;
 
+	BUG_ON(!kvm->arch.mmu_page_hash);
 	sp_list = &kvm->arch.mmu_page_hash[kvm_page_table_hashfn(gfn)];
 
 	sp = kvm_mmu_find_shadow_page(kvm, vcpu, gfn, sp_list, role);
@@ -3884,11 +3896,14 @@ static int kvm_mmu_alloc_page_hash(struct kvm *kvm)
 {
 	typeof(kvm->arch.mmu_page_hash) h;
 
+	if (kvm->arch.mmu_page_hash)
+		return 0;
+
 	h = kcalloc(KVM_NUM_MMU_PAGES, sizeof(*h), GFP_KERNEL_ACCOUNT);
 	if (!h)
 		return -ENOMEM;
 
-	kvm->arch.mmu_page_hash = h;
+	WRITE_ONCE(kvm->arch.mmu_page_hash, h);
 	return 0;
 }
 
@@ -3911,9 +3926,13 @@ static int mmu_first_shadow_root_alloc(struct kvm *kvm)
 	if (kvm_shadow_root_allocated(kvm))
 		goto out_unlock;
 
+	r = kvm_mmu_alloc_page_hash(kvm);
+	if (r)
+		goto out_unlock;
+
 	/*
-	 * Check if anything actually needs to be allocated, e.g. all metadata
-	 * will be allocated upfront if TDP is disabled.
+	 * Check if memslot metadata actually needs to be allocated, e.g. all
+	 * metadata will be allocated upfront if TDP is disabled.
 	 */
 	if (kvm_memslots_have_rmaps(kvm) &&
 	    kvm_page_track_write_tracking_enabled(kvm))
@@ -6694,12 +6713,13 @@ int kvm_mmu_init_vm(struct kvm *kvm)
 	INIT_LIST_HEAD(&kvm->arch.possible_nx_huge_pages);
 	spin_lock_init(&kvm->arch.mmu_unsync_pages_lock);
 
-	r = kvm_mmu_alloc_page_hash(kvm);
-	if (r)
-		return r;
-
-	if (tdp_mmu_enabled)
+	if (tdp_mmu_enabled) {
 		kvm_mmu_init_tdp_mmu(kvm);
+	} else {
+		r = kvm_mmu_alloc_page_hash(kvm);
+		if (r)
+			return r;
+	}
 
 	kvm->arch.split_page_header_cache.kmem_cache = mmu_page_header_cache;
 	kvm->arch.split_page_header_cache.gfp_zero = __GFP_ZERO;
-- 
2.49.0.472.ge94155a9ec-goog

