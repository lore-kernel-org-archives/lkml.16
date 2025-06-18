Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D9420E6F9
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 04:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750220677; cv=none; b=RT0125zb9DIEvgpo+NfHe8rgUeWgI2bpyIG2yzeupB/JdetG0cWZhLoZ9JNCV+CWeZPE/O3d5zVV3EnggTzuHlOq5KdYdeUzR+8HiSnRf5lg2gZGaTjtfL9VjW21b96Vk2z2njc1dNtJLHfy1Rszkfg0yT+k/Vmv8HrITEhiYJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750220677; c=relaxed/simple;
	bh=Fd4SdpBpGMWqTpDQtVvgHQNQARLYxNkES4VtDZAj2OE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=d0WpxL0+yWif5nrDflsQjIjlEEnrPFQngnnPcLjdI4vIrpLiCrQE9gPHS2LmrSlfu6M111VE0EN4iRFuzGLDGuTeHKx/LCMFfXmMqr/PG9fDAKA9CHnhZb9Wh2vUWtQEwl1eZ2H4K4aRTzh+dWcs5HD8gXZvw/ayNUSIRABu/wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KH1B+lap; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KH1B+lap"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-235f6b829cfso51739775ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 21:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750220675; x=1750825475; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=He9GMZwZGhbuABKsoN3wz9xUeb4JLf+qOIjtO6Uhl9c=;
        b=KH1B+laphzq9ggMTEQZDW66kmcpSWnAYBsc+aRZHqDzrFFdd5a2kfuMyA8Do5iKMKK
         TNM2qWwAsbo54UwgRLqPmu9xIm6uchA7dv8+Lifren1AYDWH26/xsEBFRfxGw1Rxrv0E
         RtugHExSRwAyTo5Rw3URXCtupYMjsnTcre+cWu3ud2Axr7N0TOxsA7URRl7vt4QM3ldj
         +5NTxYki7ofVN0hAqzgKWbzYtezZJHziPrYJ+1TiySFeURxabaBEE7o+XX5NW2vS9Yjw
         8XjGR4lcCmA9ZcuRj+7D4fRxXBEnoPaaqVSGa4pn0EwgXRVDp66lbSu9X4sMFXNJpbas
         lx7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750220675; x=1750825475;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=He9GMZwZGhbuABKsoN3wz9xUeb4JLf+qOIjtO6Uhl9c=;
        b=eMqyzFpLbwY3coZy7h+nLQJacnRp1YranJRSrurLVO7c0HBz7sQcZdGc6BPzuDrqtc
         RQAW3adsBz29LIs0KXpYCI13UAZ+Bz2Yx04F17OlczzB8K/tiLCCMx1g/KstQYGg+FmT
         aOPGAqb9gPqz6wxrxS0+8wxQJ+fVLbVT8gcCBhatP5TI1F5YtJi0Fgr9woXQGFXVOyRr
         /1J3T86/XZH2rGN0Bo0Rhgbo7TGjfoGCMmZuCeETZ6ypnuqeF+WarWcs4y7nGJGqhGbb
         oKdTLD99cum9xw7ItNTXo1NTitlKr3gK2jJnyKYduH8u1pS3HOvwU9tO2IKjVzKQOy0f
         NTSg==
X-Forwarded-Encrypted: i=1; AJvYcCXh8EAvniXwpnZIEOdKRbQg5jsQM4sOaNhF5oVUaal6tuv47IMhPoA2BJPqWRKEmfguAWQJx8ZOwy4p9wM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAERkHiiMBTgq3v4KfXeuD7PytcYzq9WtMN01S5MWLA7tK2Q2c
	+mBHuDM4VgLtK1A5kHsT/QIDJXLqKujLQMCRMVtZy8scMrX7NNUF3Y3+/UDEsJjPZGmtlL2KBQq
	n5JHelO4yZA0GbdX2W6H2Fw==
X-Google-Smtp-Source: AGHT+IEz+sYmwmOj4IeHxcE6XX3uQvv4AyNEb1cpKl7A16mtz5cSX2RNnd2uZJbF+w+tZiQScGXmjNJtGrMaKECU
X-Received: from pjtd15.prod.google.com ([2002:a17:90b:4f:b0:30a:31eb:ec8e])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:dacc:b0:234:c8f6:1b05 with SMTP id d9443c01a7336-2366b3fe725mr232646505ad.52.1750220674878;
 Tue, 17 Jun 2025 21:24:34 -0700 (PDT)
Date: Wed, 18 Jun 2025 04:24:14 +0000
In-Reply-To: <20250618042424.330664-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250618042424.330664-1-jthoughton@google.com>
X-Mailer: git-send-email 2.50.0.rc2.696.g1fc2a0284f-goog
Message-ID: <20250618042424.330664-6-jthoughton@google.com>
Subject: [PATCH v3 05/15] KVM: x86: Add support for KVM userfault exits
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Oliver Upton <oliver.upton@linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Only a few changes are needed to support KVM userfault exits on x86:

1. Adjust kvm_mmu_hugepage_adjust() to force pages to be mapped at 4K
   while KVM_MEM_USERFAULT is enabled.
2. Return -EFAULT when kvm_do_userfault() when it reports that the page
   is userfault. (Upon failure to read from the bitmap,
   kvm_do_userfault() will return true without setting up a memory fault
   exit, so we'll return a bare -EFAULT).

For hugepage recovery, the behavior when disabling KVM_MEM_USERFAULT
should match the behavior when disabling KVM_MEM_LOG_DIRTY_PAGES; make
changes to kvm_mmu_slot_apply_flags() to recover hugepages when
KVM_MEM_USERFAULT is disabled.

Signed-off-by: James Houghton <jthoughton@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c |  5 ++++-
 arch/x86/kvm/x86.c     | 27 +++++++++++++++++----------
 2 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index a4439e9e07268..49eb6b9b268cb 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -3304,7 +3304,7 @@ void kvm_mmu_hugepage_adjust(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
 	if (is_error_noslot_pfn(fault->pfn))
 		return;
 
-	if (kvm_slot_dirty_track_enabled(slot))
+	if (kvm_slot_dirty_track_enabled(slot) || kvm_is_userfault_memslot(slot))
 		return;
 
 	/*
@@ -4522,6 +4522,9 @@ static int __kvm_mmu_faultin_pfn(struct kvm_vcpu *vcpu,
 {
 	unsigned int foll = fault->write ? FOLL_WRITE : 0;
 
+	if (kvm_do_userfault(vcpu, fault))
+		return -EFAULT;
+
 	if (fault->is_private)
 		return kvm_mmu_faultin_pfn_private(vcpu, fault);
 
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index b58a74c1722de..fa279ba38115c 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -13152,12 +13152,27 @@ static void kvm_mmu_slot_apply_flags(struct kvm *kvm,
 	u32 new_flags = new ? new->flags : 0;
 	bool log_dirty_pages = new_flags & KVM_MEM_LOG_DIRTY_PAGES;
 
+	/*
+	 * Recover hugepages when userfault is toggled off, as KVM forces 4KiB
+	 * mappings when userfault is enabled.  See below for why CREATE, MOVE,
+	 * and DELETE don't need special handling.  Note, common KVM handles
+	 * zapping SPTEs when userfault is toggled on.
+	 */
+	if (change == KVM_MR_FLAGS_ONLY && (old_flags & KVM_MEM_USERFAULT) &&
+	    !(new_flags & KVM_MEM_USERFAULT))
+		kvm_mmu_recover_huge_pages(kvm, new);
+
+	/*
+	 * Nothing more to do if dirty logging isn't being toggled.
+	 */
+	if (!((old_flags ^ new_flags) & KVM_MEM_LOG_DIRTY_PAGES))
+		return;
+
 	/*
 	 * Update CPU dirty logging if dirty logging is being toggled.  This
 	 * applies to all operations.
 	 */
-	if ((old_flags ^ new_flags) & KVM_MEM_LOG_DIRTY_PAGES)
-		kvm_mmu_update_cpu_dirty_logging(kvm, log_dirty_pages);
+	kvm_mmu_update_cpu_dirty_logging(kvm, log_dirty_pages);
 
 	/*
 	 * Nothing more to do for RO slots (which can't be dirtied and can't be
@@ -13177,14 +13192,6 @@ static void kvm_mmu_slot_apply_flags(struct kvm *kvm,
 	if ((change != KVM_MR_FLAGS_ONLY) || (new_flags & KVM_MEM_READONLY))
 		return;
 
-	/*
-	 * READONLY and non-flags changes were filtered out above, and the only
-	 * other flag is LOG_DIRTY_PAGES, i.e. something is wrong if dirty
-	 * logging isn't being toggled on or off.
-	 */
-	if (WARN_ON_ONCE(!((old_flags ^ new_flags) & KVM_MEM_LOG_DIRTY_PAGES)))
-		return;
-
 	if (!log_dirty_pages) {
 		/*
 		 * Recover huge page mappings in the slot now that dirty logging
-- 
2.50.0.rc2.692.g299adb8693-goog

