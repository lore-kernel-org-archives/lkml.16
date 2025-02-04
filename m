Received: from mail-vs1-f73.google.com (mail-vs1-f73.google.com [209.85.217.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0649F5684
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 00:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738629659; cv=none; b=YMWKEby8DTSnHtxEziT20ArOMuxwjrwr78igBtJtvCJihwCmi7vnLJ4QobwhVbTD8wOheFAYhGkzuB3tCc5Wwy8wfD/EkCWYSY05epHckAyqH3CQKSSICwIhZNnfP3SZuxytB+/v6v+0csFdIndR57sQmroOLxQQoQA5Ez2p5GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738629659; c=relaxed/simple;
	bh=BgGA7ROTPL0sIEgMvRuiQa9cabWE/8+IjXJZdJHbfGw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ttMsLqijHsuK9d25BEXTX80Gm6Q3yTzxNNY3JGJI88uWjOJx+dzqUP8p1Rz3F06txBsWhNVQzc3voIsrKTGI0jVLzBAGlQYEI2k8pkZo4p5nm1NQGqQpTeaW6oJ32ViVSN+U8oE0ZO4lKgFNdFGSfS2y4YBJdTCal/mAzCJs2YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mwNdEXKj; arc=none smtp.client-ip=209.85.217.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mwNdEXKj"
Received: by mail-vs1-f73.google.com with SMTP id ada2fe7eead31-4aff4bc545dso469046137.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 16:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738629657; x=1739234457; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=p6K1OVMuQTd658Umax8NEjVCXyrHg3jp4bgkmGXf6oM=;
        b=mwNdEXKjyUKZPytD7GrhMD/ZXFhxYtlElMZJRr1CsvM43MP6T4omE+tuyu4DW662Rw
         WYJDUqZsl3Z76oGOBibpa56oOejJbnTxJDR8D6Cq72MIKg2zHLL0lLT03+9cKlvnYlKO
         0d36kDpThzUoxYvuwdWh9nHKKYfPjjGDahJoDF8cIeoyl8cJ16Yhdqj19CryqK+n28p9
         CxMRWBnwvZYESjSZtka/8Okt5lbERVbCEnMGc3TBFRzaCYpKvAhv3t0m5C3Ul5/J7IE9
         NN3exiCWTBEtgg7IvaxBrTSTcxJiY9k8bF+CDDDk6KfJyZFyuMrcxOtk98WHDLSUgAQc
         FaGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738629657; x=1739234457;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p6K1OVMuQTd658Umax8NEjVCXyrHg3jp4bgkmGXf6oM=;
        b=K1HTpdKRvfDTWgctft5IXvd3FEB45XsDxfat9H5q1NqCHxCKazWgzMaoNGdkv7jAi+
         M89VhZzRbROEKT8XIG/c2wO36bXFqLw9OE+KOYR5gh8iORdgCGyhX+e7gv64DWw+RJyo
         GOr5SflhS2gvHjj5KrUQC1Ej0kZBW48d5sedYQtjnMLtAeWqtmLA+lFRQ4al/O8AR0pU
         5i9ivpHJKkgdVyJINjYkaMpyJ4tvbxXYBgUIgms97+kUgHFrUdFSCgzoOTkfGdUmcVCr
         IQha9wrjdxjBe+9DrG35szXhIgv8NQ6bB3YCSzrgE5SBrBotZHLI6XQN9szw9NO3r3QC
         JWPw==
X-Forwarded-Encrypted: i=1; AJvYcCU2xhoyySizr0I2f6H5QtOH2u8dGDgJNdRqdxCn2yDDFvVhO8c5NC2yDn+RY06r2Ng7G9iFr+CdjAd+Zo4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEdteX9b6npWfGfGu8xeLq4oda52kLJsLP4Ua8dZ5SN2ftHxwP
	8OBJiy6ncSnUW9MPPvCfAoJmvXSEUOmNwKoMQWxk4Hhol3sAIW7kvxmoqSzg3OlI7i2d35MRbLS
	SSW2+WV24fJuaqVviCQ==
X-Google-Smtp-Source: AGHT+IG7mZazUgI6zXPd8PxKR1PwQ9GiCLBimHc3vVCrmcoMwEafOmvY7s+h7RDaMlvDg6+p4+ggaHz+iPCzJVV7
X-Received: from vsqd6.prod.google.com ([2002:a05:6102:406:b0:4ba:d75:c698])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6102:504b:b0:4b1:1b33:eb0f with SMTP id ada2fe7eead31-4b9a526c5f9mr19288103137.24.1738629656799;
 Mon, 03 Feb 2025 16:40:56 -0800 (PST)
Date: Tue,  4 Feb 2025 00:40:29 +0000
In-Reply-To: <20250204004038.1680123-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250204004038.1680123-1-jthoughton@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250204004038.1680123-3-jthoughton@google.com>
Subject: [PATCH v9 02/11] KVM: Add lockless memslot walk to KVM
From: James Houghton <jthoughton@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: David Matlack <dmatlack@google.com>, David Rientjes <rientjes@google.com>, 
	James Houghton <jthoughton@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Wei Xu <weixugc@google.com>, Yu Zhao <yuzhao@google.com>, 
	Axel Rasmussen <axelrasmussen@google.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

It is possible to correctly do aging without taking the KVM MMU lock;
this option allows such architectures to do so. Architectures that
select CONFIG_KVM_MMU_NOTIFIER_AGING_LOCKLESS are responsible for
correctness.

Suggested-by: Yu Zhao <yuzhao@google.com>
Signed-off-by: James Houghton <jthoughton@google.com>
Reviewed-by: David Matlack <dmatlack@google.com>
---
 include/linux/kvm_host.h |  1 +
 virt/kvm/Kconfig         |  2 ++
 virt/kvm/kvm_main.c      | 24 +++++++++++++++++-------
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index f34f4cfaa513..c28a6aa1f2ed 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -267,6 +267,7 @@ struct kvm_gfn_range {
 	union kvm_mmu_notifier_arg arg;
 	enum kvm_gfn_range_filter attr_filter;
 	bool may_block;
+	bool lockless;
 };
 bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range);
 bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range);
diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
index 54e959e7d68f..9356f4e4e255 100644
--- a/virt/kvm/Kconfig
+++ b/virt/kvm/Kconfig
@@ -102,6 +102,8 @@ config KVM_GENERIC_MMU_NOTIFIER
 
 config KVM_ELIDE_TLB_FLUSH_IF_YOUNG
        depends on KVM_GENERIC_MMU_NOTIFIER
+
+config KVM_MMU_NOTIFIER_AGING_LOCKLESS
        bool
 
 config KVM_GENERIC_MEMORY_ATTRIBUTES
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 1bd49770506a..4734ae9e8a54 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -517,6 +517,7 @@ struct kvm_mmu_notifier_range {
 	on_lock_fn_t on_lock;
 	bool flush_on_ret;
 	bool may_block;
+	bool lockless;
 };
 
 /*
@@ -571,6 +572,10 @@ static __always_inline kvm_mn_ret_t kvm_handle_hva_range(struct kvm *kvm,
 			 IS_KVM_NULL_FN(range->handler)))
 		return r;
 
+	/* on_lock will never be called for lockless walks */
+	if (WARN_ON_ONCE(range->lockless && !IS_KVM_NULL_FN(range->on_lock)))
+		return r;
+
 	idx = srcu_read_lock(&kvm->srcu);
 
 	for (i = 0; i < kvm_arch_nr_memslot_as_ids(kvm); i++) {
@@ -607,15 +612,18 @@ static __always_inline kvm_mn_ret_t kvm_handle_hva_range(struct kvm *kvm,
 			gfn_range.start = hva_to_gfn_memslot(hva_start, slot);
 			gfn_range.end = hva_to_gfn_memslot(hva_end + PAGE_SIZE - 1, slot);
 			gfn_range.slot = slot;
+			gfn_range.lockless = range->lockless;
 
 			if (!r.found_memslot) {
 				r.found_memslot = true;
-				KVM_MMU_LOCK(kvm);
-				if (!IS_KVM_NULL_FN(range->on_lock))
-					range->on_lock(kvm);
-
-				if (IS_KVM_NULL_FN(range->handler))
-					goto mmu_unlock;
+				if (!range->lockless) {
+					KVM_MMU_LOCK(kvm);
+					if (!IS_KVM_NULL_FN(range->on_lock))
+						range->on_lock(kvm);
+
+					if (IS_KVM_NULL_FN(range->handler))
+						goto mmu_unlock;
+				}
 			}
 			r.ret |= range->handler(kvm, &gfn_range);
 		}
@@ -625,7 +633,7 @@ static __always_inline kvm_mn_ret_t kvm_handle_hva_range(struct kvm *kvm,
 		kvm_flush_remote_tlbs(kvm);
 
 mmu_unlock:
-	if (r.found_memslot)
+	if (r.found_memslot && !range->lockless)
 		KVM_MMU_UNLOCK(kvm);
 
 	srcu_read_unlock(&kvm->srcu, idx);
@@ -647,6 +655,8 @@ static __always_inline int kvm_age_hva_range(struct mmu_notifier *mn,
 		.on_lock	= (void *)kvm_null_fn,
 		.flush_on_ret	= flush_on_ret,
 		.may_block	= false,
+		.lockless	=
+			IS_ENABLED(CONFIG_KVM_MMU_NOTIFIER_AGING_LOCKLESS),
 	};
 
 	return kvm_handle_hva_range(kvm, &range).ret;
-- 
2.48.1.362.g079036d154-goog

