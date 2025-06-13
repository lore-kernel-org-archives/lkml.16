Received: from mail-vs1-f73.google.com (mail-vs1-f73.google.com [209.85.217.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC2C2472BD
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 20:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749846201; cv=none; b=IWvD9bF75BoU8GRudmdz8UFMv8HaW/jaUHBiTU5b1Lo0UuL55SSmgLSUHM/gVYhEOGNGOmBxTu4qA9birzJFEBAzoeqC/0XnFvkRZLf5PJ6O1alfEJ5BW7kIum8j2uoBbzED97T19oyNIOGNlNUrgJDDnoybojcQiAAXS8tPHC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749846201; c=relaxed/simple;
	bh=/C++yCmsyoQoAQ/JFzedGKuseM7Tk6mR7YxlYpQd9Z4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=E85Npf2VBF2hYqguBmHn6NN7IzI6Oy5JhaVa8ZDClDxCJorxaqqCJD4d7UTJ1HqXgr8qK/IyVOfpGjRqLa+80vqB4+QovioNtd7ngPdfZfVkQYxZiCHy1zsYtJzvjp/qjI1x76GIcLE73tXJMwWJM3tEs5iGycYguW6qdvO7pbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DI7O/op7; arc=none smtp.client-ip=209.85.217.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DI7O/op7"
Received: by mail-vs1-f73.google.com with SMTP id ada2fe7eead31-4e2e3366df8so344236137.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749846199; x=1750450999; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3qYYxlJUSy6v2zDI8TzsrBHHnn7rC00X6zn+VLpi9Eg=;
        b=DI7O/op7sJjmj4UgMKY+hqp50fD6y+yELUDSegFrlN9qVyfEZfmdCL6hYrQfz8Sed2
         fmwULYVQvcIKMQTUHzjWNgBe2s1rlSyx3TthyGsZJpADqtS9epQMkfSacSDCUjqM83CY
         Ag+JBDnBnuaFCBpGXZPpQkEaDOLvr8OkPxdF+wS6nOxvd5DRvsqBZyRW71DkjJX04sE2
         ZKEw24bsj3fKmXTvE/Iglv6uzQ85LOtYYwXek8uuc/T4XySMDbCdfyIuQD/D/aGd5yoc
         /Je0VXioyz1csfrJlJ5dycq2+c/dfU7xhrWK3Z8PFO3pCgIMCmuxwyHVxTr4OQyfryIb
         RroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749846199; x=1750450999;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3qYYxlJUSy6v2zDI8TzsrBHHnn7rC00X6zn+VLpi9Eg=;
        b=nJcFFb/CDURwAbtccS0LYPXrjSdqpk1OY6qkLIJckRVYzPNbfV4M4BZja/99aE5wet
         oDfRiCx5sj5mchMCexIQ4A/h+MiQnUw9EGTAfLrSknNPWeXlrhVpVkF1oxOXNcICkAv1
         U08+Nn1B6+4WwUWbhUEBeQvOXi6B+fudSyR5vaY4aTyoRWribqj6sUHlCnaXHuLjw96R
         XuKtKLnG5/FJJBY1h7rRJY6sqgJdCZH29eg8jfusAmx9KvFBJc8UXIexQQHhEZvDkF05
         UQBrCuiR7awmpl9p2Vwd3Q7hFaWHrwuWlrpC6Lox2sGlixBwvLfyzth399WF3qk7IdZc
         LtGA==
X-Forwarded-Encrypted: i=1; AJvYcCVNgdY3ZWyHXP1pgBtz8jElhg3wA+51k+8Nb+MuJ3E+ricEMisfVgggCFsEHmNE57de6sPcd80Q7nuR2Aw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmhOnOv13iwYlopemYg+EvZYpVlrHMuRcCQ7ZjF46cHf2U+wBp
	RseE080J9UrRrYHHocTDbprAMBOCwehbE0Cb8HWWvDpj850OqwrYkVroUd2gDXy7Wtnw4bux17p
	IjZCw1/7b4MXAJ4bvRNdwGw==
X-Google-Smtp-Source: AGHT+IFVJjORcfffmUQKREgb2IlI7UakEaV5K18PSnlHkSke00VMT7vSvDgcnELg5b1l3wOKG9x8pR03ScjPXHET
X-Received: from vsbia14.prod.google.com ([2002:a05:6102:4b0e:b0:4e7:edf6:29b2])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6102:370c:b0:4df:8259:eab with SMTP id ada2fe7eead31-4e7f63c60ebmr1243215137.19.1749846199123;
 Fri, 13 Jun 2025 13:23:19 -0700 (PDT)
Date: Fri, 13 Jun 2025 20:23:09 +0000
In-Reply-To: <20250613202315.2790592-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250613202315.2790592-1-jthoughton@google.com>
X-Mailer: git-send-email 2.50.0.rc2.692.g299adb8693-goog
Message-ID: <20250613202315.2790592-3-jthoughton@google.com>
Subject: [PATCH v4 2/7] KVM: x86/mmu: Rename kvm_tdp_mmu_zap_sp() to better
 indicate its purpose
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: Vipin Sharma <vipinsh@google.com>, David Matlack <dmatlack@google.com>, 
	James Houghton <jthoughton@google.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Vipin Sharma <vipinsh@google.com>

kvm_tdp_mmu_zap_sp() is only used for NX huge page recovery, so rename
it to kvm_tdp_mmu_zap_possible_nx_huge_page(). In a future commit, this
function will be changed to include logic specific to NX huge page
recovery.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/x86/kvm/mmu/mmu.c     | 2 +-
 arch/x86/kvm/mmu/tdp_mmu.c | 3 ++-
 arch/x86/kvm/mmu/tdp_mmu.h | 3 ++-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index f44d7f3acc179..b074f7bb5cc58 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -7607,7 +7607,7 @@ static void kvm_recover_nx_huge_pages(struct kvm *kvm,
 		if (slot && kvm_slot_dirty_track_enabled(slot))
 			unaccount_nx_huge_page(kvm, sp);
 		else if (mmu_type == KVM_TDP_MMU)
-			flush |= kvm_tdp_mmu_zap_sp(kvm, sp);
+			flush |= kvm_tdp_mmu_zap_possible_nx_huge_page(kvm, sp);
 		else
 			kvm_mmu_prepare_zap_page(kvm, sp, &invalid_list);
 		WARN_ON_ONCE(sp->nx_huge_page_disallowed);
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 48b070f9f4e13..19907eb04a9c4 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -925,7 +925,8 @@ static void tdp_mmu_zap_root(struct kvm *kvm, struct kvm_mmu_page *root,
 	rcu_read_unlock();
 }
 
-bool kvm_tdp_mmu_zap_sp(struct kvm *kvm, struct kvm_mmu_page *sp)
+bool kvm_tdp_mmu_zap_possible_nx_huge_page(struct kvm *kvm,
+					   struct kvm_mmu_page *sp)
 {
 	u64 old_spte;
 
diff --git a/arch/x86/kvm/mmu/tdp_mmu.h b/arch/x86/kvm/mmu/tdp_mmu.h
index 52acf99d40a00..bd62977c9199e 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.h
+++ b/arch/x86/kvm/mmu/tdp_mmu.h
@@ -64,7 +64,8 @@ static inline struct kvm_mmu_page *tdp_mmu_get_root(struct kvm_vcpu *vcpu,
 }
 
 bool kvm_tdp_mmu_zap_leafs(struct kvm *kvm, gfn_t start, gfn_t end, bool flush);
-bool kvm_tdp_mmu_zap_sp(struct kvm *kvm, struct kvm_mmu_page *sp);
+bool kvm_tdp_mmu_zap_possible_nx_huge_page(struct kvm *kvm,
+					   struct kvm_mmu_page *sp);
 void kvm_tdp_mmu_zap_all(struct kvm *kvm);
 void kvm_tdp_mmu_invalidate_roots(struct kvm *kvm,
 				  enum kvm_tdp_mmu_root_types root_types);
-- 
2.50.0.rc2.692.g299adb8693-goog

