Received: from mail-vk1-f202.google.com (mail-vk1-f202.google.com [209.85.221.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55C770825
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 00:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738629660; cv=none; b=T91HCgNMDaaKmn8VRkC0/GDNR0kBST62RvHW9ti0Hpjfc6phfDTGaRMD7VU9QuqgMaYVLc4WbsEhujdDdPpSYmPt4HKwuPlJcyuHpsYaN3Cu5VisYZ05GypJOseAa904S4JERWV2EN6QOTKEQ4G9TpL7Knc2TmsZPXmVkZ1ACyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738629660; c=relaxed/simple;
	bh=d6Z0Qr4CTc08P9WkJMHZwVj8gKSLjMo2tlv6iVU7it0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=r9LW8P8ZSMauVcI98OsY5jMwxDyU8f/o4jNQw+qQr2jDKA2YLDntEGxck/VvTHZpNNw2v3ZWuXbgu3jcBzmYDVd96AKIoJ5y5+Nt39XoPgsEl+fwUGTwQ/7cXSoJkyxuSLWQbbTB6nbbjzi6vJi7DMBBge65qhcC1mVdg/oM8Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DTg5c4IK; arc=none smtp.client-ip=209.85.221.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DTg5c4IK"
Received: by mail-vk1-f202.google.com with SMTP id 71dfb90a1353d-51604d32337so1006754e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 16:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738629657; x=1739234457; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z8EVTlPHi7Mb2Te93qLO1p412b+GgWZ4HCCPa7QLCB4=;
        b=DTg5c4IK4uqeuKtprc8dCv/TZ7A4uurNkQMARBgJxO+sjnAeHiw8rFBELPn6xJP5uC
         xgJfetwG8KkHjqgLqiwIKmMJria6QEul1ClGwcQ3fPKRFbqo8xIfN8WUK5NkGLGBpmXd
         9IVxv/pkg0IeWlG9S5kp04FDegDFP4FlD9eebRcu7p+uSU8x6THomfAV9aVzDT08bWJ1
         6xsOo0TDwPuqVx3NRUNjKXgR8ObT1AGkb9Wdp7Xxp7U1JMJVZQW5Pq/qiWCxB/m53djr
         2TFRspj9z/Pw23JuoJZDv3s5Oav9LvjH46cxLrHPJut+nKDZ0qSt48U5VyTbres1KwFE
         3CtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738629657; x=1739234457;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z8EVTlPHi7Mb2Te93qLO1p412b+GgWZ4HCCPa7QLCB4=;
        b=uhoHTu1YviyZ/+pvNZCfgSRAqCvWvK1WEYRlTzdTHTBrc92IUNES86XVK+6Lg4b9pA
         rxhkBOMx56jL9FcT2JSkm6lf5mX4DeQqYCIm20DUBVx367CNFDik78S4c9Gkfr3yBXod
         NMTXnbnvHMsqX+BzeMGYVe2Pa+z0oVn0Ckn7CXbRfr8RK86wBLHSCTA31nsBoe0Mh3J3
         yHATKlE2TpWSo5G1ski+Wd52w7K1U+svU6gmuECe2h9vTUpK+Q6P4ULlzSB0YocHFW9R
         6mJH+93fcg8WElLQeQosPRilCkeFVxCvRvUv2V/EQNzpmg6akVZ835ycRs620exzoFTI
         Hm1g==
X-Forwarded-Encrypted: i=1; AJvYcCU/8EDSHE56AxWnqRuc9BK0iAkwEv4J3LPTOcOAo9hyxmpFxo1ddbsCg/mzvRF050QPx9lZdViBC4bXDVY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ/BrMQMVcnxeKU+Pb8PoVAK3P9/rLZyiytsmdyO1WAfwTZlaO
	WKRMmcs3dJxnsQzqCmDobCjp6V5gHKUH1nz5ue31mGplFqdLcAxEVQPH550z4GLqO1g+wg+GnFm
	3/YA47Ud2xbPhJc/HbQ==
X-Google-Smtp-Source: AGHT+IGHq940BRezUkVwlNOCiT1XgwqRxT3qyHCt+hNVEw0Fg5bWPvg40CR+xh2gIgoPsc7fxthizhVN+hgnsK9w
X-Received: from vsbid8.prod.google.com ([2002:a05:6102:4bc8:b0:4af:ed99:8589])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6102:c0f:b0:4af:c519:4e86 with SMTP id ada2fe7eead31-4b9a4ec4902mr18110648137.1.1738629657558;
 Mon, 03 Feb 2025 16:40:57 -0800 (PST)
Date: Tue,  4 Feb 2025 00:40:30 +0000
In-Reply-To: <20250204004038.1680123-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250204004038.1680123-1-jthoughton@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250204004038.1680123-4-jthoughton@google.com>
Subject: [PATCH v9 03/11] KVM: x86/mmu: Factor out spte atomic bit clearing routine
From: James Houghton <jthoughton@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: David Matlack <dmatlack@google.com>, David Rientjes <rientjes@google.com>, 
	James Houghton <jthoughton@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Wei Xu <weixugc@google.com>, Yu Zhao <yuzhao@google.com>, 
	Axel Rasmussen <axelrasmussen@google.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This new function, tdp_mmu_clear_spte_bits_atomic(), will be used in a
follow-up patch to enable lockless Accessed bit clearing.

Signed-off-by: James Houghton <jthoughton@google.com>
Acked-by: Yu Zhao <yuzhao@google.com>
---
 arch/x86/kvm/mmu/tdp_iter.h | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/mmu/tdp_iter.h b/arch/x86/kvm/mmu/tdp_iter.h
index 047b78333653..9135b035fa40 100644
--- a/arch/x86/kvm/mmu/tdp_iter.h
+++ b/arch/x86/kvm/mmu/tdp_iter.h
@@ -25,6 +25,13 @@ static inline u64 kvm_tdp_mmu_write_spte_atomic(tdp_ptep_t sptep, u64 new_spte)
 	return xchg(rcu_dereference(sptep), new_spte);
 }
 
+static inline u64 tdp_mmu_clear_spte_bits_atomic(tdp_ptep_t sptep, u64 mask)
+{
+	atomic64_t *sptep_atomic = (atomic64_t *)rcu_dereference(sptep);
+
+	return (u64)atomic64_fetch_and(~mask, sptep_atomic);
+}
+
 static inline void __kvm_tdp_mmu_write_spte(tdp_ptep_t sptep, u64 new_spte)
 {
 	KVM_MMU_WARN_ON(is_ept_ve_possible(new_spte));
@@ -63,12 +70,8 @@ static inline u64 kvm_tdp_mmu_write_spte(tdp_ptep_t sptep, u64 old_spte,
 static inline u64 tdp_mmu_clear_spte_bits(tdp_ptep_t sptep, u64 old_spte,
 					  u64 mask, int level)
 {
-	atomic64_t *sptep_atomic;
-
-	if (kvm_tdp_mmu_spte_need_atomic_write(old_spte, level)) {
-		sptep_atomic = (atomic64_t *)rcu_dereference(sptep);
-		return (u64)atomic64_fetch_and(~mask, sptep_atomic);
-	}
+	if (kvm_tdp_mmu_spte_need_atomic_write(old_spte, level))
+		return tdp_mmu_clear_spte_bits_atomic(sptep, mask);
 
 	__kvm_tdp_mmu_write_spte(sptep, old_spte & ~mask);
 	return old_spte;
-- 
2.48.1.362.g079036d154-goog

