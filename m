Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A25217648
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 04:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750220680; cv=none; b=WR21wcw5UZ3hqRpUT4WjNnBbJIAm0oynNtbYlU5T2luGsIjDDlF6TOnuKQAKasW+XTbtZ0mZ7yDvE56p1u+9mqXK+r3SKxSmLUPXj3QkMn7Nz9rFDuM6xSBC5NtGleZVPB8oMySDpSbtKmIleqWfNZXRdJaXLPZRQqBN0v+qwAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750220680; c=relaxed/simple;
	bh=RjOGGjzo1gz+MJ4XHnzV65K+mX6uQwTz9v2uyBR8F74=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DuHRKTmtYrUm9KdwGuOdDykIQL0W4+K391JrkNcGZKTsvacOq+gRLsCZ3xnQs1zNBpdAx9O67f16PEgAtdnpXtuVacY91SLdZxsNYnyaxxmB5MzsG0AazXv8oxnPRCbZbL4ajCt4ezTGkcK9bzsyf2cc2K/csMfUuq7WFNQttUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LmFG06QS; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LmFG06QS"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3138c50d2a0so8960687a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 21:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750220678; x=1750825478; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=u7uDKQXpUwdrzKwoUkA90P4kaViu0b/lAOUYW7NM+2o=;
        b=LmFG06QSpvI9kslH54L9ZBzmL2vQPHE23udaQdw3yxlcbVTs7uMyhHrSalyOq5Y+1X
         zHZ+E7VCBB2GCaHQwbX46oVP683MBeDZsIv3ik1UxXPu6DiuND2gp6KEYUZXmPFC9ZqX
         dcF7XM8JHygb1RUSHPyvR10yOVg38uEgMyGrTumDiyNLc2IpmkAZEXk+BLZxRkWl87D7
         EkmRiWyWS27tc8le+DSDJAvYk44dVkf3Umq5uzp2ZkQ/RwKYoB99PDRpA4i0b8te5HbP
         ejrvCSw+3R3G7EGkLDckWgsl+zFBQJuchIdVuKQmH15sBXzg4T0Je9XY3GUDnh4tt/Gv
         2y3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750220678; x=1750825478;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u7uDKQXpUwdrzKwoUkA90P4kaViu0b/lAOUYW7NM+2o=;
        b=PJ9fgbjD3ZR2LVvYifDrTiUBxqya6Z2zz0uvT1xU+cdnDYFP96d5WAkqCCF2vMxkrk
         oJMP3k72SDk+iiY6jdjIJB05cgsXcOeZzfbv6L3qZrHoNOecahkpePw7lkxQi+6bAmYY
         ruF6q/wfMwn99Pkhgr1Uy8yoC0SvaBq5lrNwgbTXi5JGKBO6W4zEyjxlBeJxo5qaVVht
         S1wyRZZGLatNlPNeAAw2HFirThpK7888p5RLC83lDCVn+WPZocd20k5TD6r8vKzv/sLE
         9QdhjJIOyHIRGwH6VM6qbiJwb9ZLdRhuaHbzuWFFxG8LnXEzWGZdoEBEuhrnJaVllM2P
         kSJA==
X-Forwarded-Encrypted: i=1; AJvYcCVU9o3+AlLz2faGJWo+ElAVqW4lgnC6d1wYAK+tq+SF+moRx+h9HWIOiOMCF1QeBNPntIukd04BWbJLcdM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKznimp3pbiqcLJQFi86nDlOU5yHyik5aPKDOeBqRv5nZiWR0e
	ywGc6vuoYUNd3ZjAIq9fGDoKYAQEAWHvmJa67EkC7WqNz2egt/TSE7D94ieJIV6FBR/odQqBdlh
	8LZ7V5t1GdsOq1Um2Xneh4g==
X-Google-Smtp-Source: AGHT+IEsvRhaA+pgvEn2VcIt6EZL6lLvB8OQlgHyuSOj5NMOQERsIQvH6ATMkLPJIOGQBvW8tdGSJDJWdEvdsdMB
X-Received: from pjbsm7.prod.google.com ([2002:a17:90b:2e47:b0:312:f650:c7aa])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2d47:b0:312:db8f:9a09 with SMTP id 98e67ed59e1d1-313f1c380f7mr29459716a91.14.1750220677882;
 Tue, 17 Jun 2025 21:24:37 -0700 (PDT)
Date: Wed, 18 Jun 2025 04:24:16 +0000
In-Reply-To: <20250618042424.330664-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250618042424.330664-1-jthoughton@google.com>
X-Mailer: git-send-email 2.50.0.rc2.696.g1fc2a0284f-goog
Message-ID: <20250618042424.330664-8-jthoughton@google.com>
Subject: [PATCH v3 07/15] KVM: Enable and advertise support for KVM userfault exits
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

Now that all architectures (arm64 and x86) that utilize "generic" page
faults also support userfault exits, advertise support for
KVM_CAP_USERFAULT and let userspace set KVM_MEM_USERFAULT in memslots.

Signed-off-by: James Houghton <jthoughton@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/uapi/linux/kvm.h | 1 +
 virt/kvm/kvm_main.c      | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index e3b871506ec85..0ba265f99f033 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -937,6 +937,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_ARM_EL2 240
 #define KVM_CAP_ARM_EL2_E2H0 241
 #define KVM_CAP_RISCV_MP_STATE_RESET 242
+#define KVM_CAP_USERFAULT 243
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index bef6760cd1c0e..2962be09d5ebf 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1604,6 +1604,9 @@ static int check_memory_region_flags(struct kvm *kvm,
 	    !(mem->flags & KVM_MEM_GUEST_MEMFD))
 		valid_flags |= KVM_MEM_READONLY;
 
+	if (IS_ENABLED(CONFIG_KVM_GENERIC_PAGE_FAULT))
+		valid_flags |= KVM_MEM_USERFAULT;
+
 	if (mem->flags & ~valid_flags)
 		return -EINVAL;
 
@@ -4881,6 +4884,9 @@ static int kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
 	case KVM_CAP_CHECK_EXTENSION_VM:
 	case KVM_CAP_ENABLE_CAP_VM:
 	case KVM_CAP_HALT_POLL:
+#ifdef CONFIG_KVM_GENERIC_PAGE_FAULT
+	case KVM_CAP_USERFAULT:
+#endif
 		return 1;
 #ifdef CONFIG_KVM_MMIO
 	case KVM_CAP_COALESCED_MMIO:
-- 
2.50.0.rc2.692.g299adb8693-goog

