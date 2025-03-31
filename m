Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07976189528
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 18:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743445627; cv=none; b=bvsqVmC0LO7QhHxr22EtNFrazT5oanZ0TG1mO3a9H8Ay5HJy7lPMW72lYcuMJSjJ1udW5wrD+WgDQX9+Qn7NCAGxgRHhFpEKH5OkVM5PvtIjzH4FSmrDHRnWINDJAF6IQs9c+46Y8hvqLYzwnK3PcGwZZjyp5wPy1tHeW3lPvTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743445627; c=relaxed/simple;
	bh=VLeEC0uxP7p7Qxgwk6jBT/2tB9FcHfRZeZYItPwC9lQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Jt6PftXIEaQG2CSIpR+PVtYHG7s4LXyV0ABvzzcATytwkN8P1aJ2nqRUjGsVKINFdHBrAFEi+hGMpiZ7WmH6kToVmjaj9UuUVfW49CHEekuoxRF8MAJsDuNZDJRM3keEJTMXkyoeBYdEApK1o+JHhJzJ0o5Y7CmSgoFsxSavmn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Wt8pRrPR; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Wt8pRrPR"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff82dd6de0so6629752a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 11:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743445625; x=1744050425; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/pd2nm65FwNh6FkK7APuxjmignZQ8EE6F/lay1fSaQY=;
        b=Wt8pRrPRDebI9/Sb6Dp0CnbaZbd5Ln8JpEzk+ZbjhzGJjZy6auF4pP+eEafo7jgEBt
         uRF0nVA6ZpBVEe1Il4lOKKHfwUPZeI0jms8BOJhf+WbOu2IYbWLjGIfA/mtLEKUp8I1d
         xmfAIxK8HUtDq6d7ph6jrmaUDYKIQcdUeh9dtQp85QJIqIlow5q2lUaAm207MC8bez0t
         kNbwbRUDvagjRXRgAM8FIYGm0eEN+/Y8O8DXkyK73SAdmMMpA8P2sJHPzKgDohoaYHKh
         tAto8G9sfhyv+7o8MEfUZgNHQ339Ouufg3yaB1KcEjKfq8RRDHfGaRHDn4Ptx+i9zxRD
         fiRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743445625; x=1744050425;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/pd2nm65FwNh6FkK7APuxjmignZQ8EE6F/lay1fSaQY=;
        b=W6nTAiGwWXudHuuuAldTRNZZgjQKbIT+9SfR+bwf++V7LRcPjWOn/tS/V0u6wJIpMx
         cCXtq/CMbGi0QsiRG3YquNr8TYVHZMQuh3+tE+eTdeMBOKkHmLyzwCnNZnVEb70Ull1t
         5uf4uEgna40AGjgx+htsayW2rxdzJmaxMYxRFyoNcvxZPn2Gevm4gcLe0g7jybS8DBiy
         dlfZ2h3VoIUKsVPhJ9jAveMBthUxT7TLwINRXxeAGwqvucUhcBNrxg6RpA3Q8Y7iBLZS
         TIuoL+qi65U+4DRgqB3MTq1za1ZrTVnx2B/S5NTruBxhUH80wOe6mI6HINQRFkKoYLoU
         +qKg==
X-Forwarded-Encrypted: i=1; AJvYcCXwR5826vs2MnRCA12Po6r9L9ryjKxpX8ia+pDtHP7vtyIGpOLW3bq92r6rne1pmP7cB6eVKy3nOjiALvU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzP1ZUAEvzFZFP/MWQaVv0ktOVIcLKe2AmAW5HjPy2Hg8fKeNMH
	Is5SJuSMq7ncg0MfUZiaY0ws8rfKD3amih4b2l/eKtzhxAdQUkrbvjExpF9ux9mcwockrrsGLFF
	2MQ==
X-Google-Smtp-Source: AGHT+IE7/Ln+Jxwi1mydQwY17OY/8d3EivlMQrIxCkvH79DxswQfD41orcj9o7Y3pcs2rnJaFmVNwhu0ZYw=
X-Received: from pjm7.prod.google.com ([2002:a17:90b:2fc7:b0:2fc:c98:ea47])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2801:b0:2ff:4bac:6fbf
 with SMTP id 98e67ed59e1d1-30531f7be36mr16361724a91.7.1743445625372; Mon, 31
 Mar 2025 11:27:05 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Mon, 31 Mar 2025 11:27:03 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250331182703.725214-1-seanjc@google.com>
Subject: [PATCH] KVM: x86/mmu: Use kvm_x86_call() instead of manual static_call()
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Use KVM's preferred kvm_x86_call() wrapper to invoke static calls related
to mirror page tables.

No functional change intended.

Fixes: 77ac7079e66d ("KVM: x86/tdp_mmu: Propagate building mirror page tables")
Fixes: 94faba8999b9 ("KVM: x86/tdp_mmu: Propagate tearing down mirror page tables")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/tdp_mmu.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 7cc0564f5f97..cbea40ccf4b8 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -372,7 +372,7 @@ static void remove_external_spte(struct kvm *kvm, gfn_t gfn, u64 old_spte,
 	/* Zapping leaf spte is allowed only when write lock is held. */
 	lockdep_assert_held_write(&kvm->mmu_lock);
 	/* Because write lock is held, operation should success. */
-	ret = static_call(kvm_x86_remove_external_spte)(kvm, gfn, level, old_pfn);
+	ret = kvm_x86_call(remove_external_spte)(kvm, gfn, level, old_pfn);
 	KVM_BUG_ON(ret, kvm);
 }
 
@@ -479,8 +479,8 @@ static void handle_removed_pt(struct kvm *kvm, tdp_ptep_t pt, bool shared)
 	}
 
 	if (is_mirror_sp(sp) &&
-	    WARN_ON(static_call(kvm_x86_free_external_spt)(kvm, base_gfn, sp->role.level,
-							  sp->external_spt))) {
+	    WARN_ON(kvm_x86_call(free_external_spt)(kvm, base_gfn, sp->role.level,
+						    sp->external_spt))) {
 		/*
 		 * Failed to free page table page in mirror page table and
 		 * there is nothing to do further.
@@ -532,12 +532,12 @@ static int __must_check set_external_spte_present(struct kvm *kvm, tdp_ptep_t sp
 	 * external page table, or leaf.
 	 */
 	if (is_leaf) {
-		ret = static_call(kvm_x86_set_external_spte)(kvm, gfn, level, new_pfn);
+		ret = kvm_x86_call(set_external_spte)(kvm, gfn, level, new_pfn);
 	} else {
 		void *external_spt = get_external_spt(gfn, new_spte, level);
 
 		KVM_BUG_ON(!external_spt, kvm);
-		ret = static_call(kvm_x86_link_external_spt)(kvm, gfn, level, external_spt);
+		ret = kvm_x86_call(link_external_spt)(kvm, gfn, level, external_spt);
 	}
 	if (ret)
 		__kvm_tdp_mmu_write_spte(sptep, old_spte);

base-commit: 782f9feaa9517caf33186dcdd6b50a8f770ed29b
-- 
2.49.0.472.ge94155a9ec-goog

