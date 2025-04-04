Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6B122578E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 19:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743795618; cv=none; b=Mgr5S20vINBqQOU7GEcxS+UCazhkN2niYGCd/8bvkbaEYfRTWqmGSZXmt1Hv7l8R3KcYB+7v03ySl+J4PTN/ADeXtwQHfFOGgcYaqdr/lcW20c8aI1PwAx7wtZ8BgRgr8MEM2LEBr4leUQi56OB1dIhOOnzQ2tpE/oH8ULcea/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743795618; c=relaxed/simple;
	bh=8CNUPuQxWruAqazLiQ2U7Se/O49wV/nzU7fAMxK6IVw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SqhsoAYRgIoPfdyZOmweh+c/FJPfM7N8FuBarKCgN5pgznHlvmudyFSfyF5kF9T7qtmfQEUngRKScz5B0+lYNHqBHiAxfx/iXRktqaYyDyam9zZ/mvauds7kGxD2uT5uGW64gpu/oD9tvcGnv4UXDqp1XHPH78bmDhbL0QUGLls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1pN65nSV; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1pN65nSV"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-736cd36189bso3496878b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 12:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743795616; x=1744400416; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=HPznh6CGxUFhqaGN+tuF1KZuEdkc3IM8iRC+hka4d9I=;
        b=1pN65nSVS2GahCTQdEV5p277Xunym8GA5pPvb3mn/dhq/gkiSaQhCvoTJzMv8QU/7H
         zUPbLfqdmda8r8bbWRYv6NS0eO2czKXIfhp9d5oqXhMAW4mO+DnCQKFjOsxmyRXIIDL2
         cHIO59zrJ9i7PnPN/wsPDdd55ZuU2UNGTH4mFao5NFM93BvKo0OnBTQ6By9Y/y2Nqwh/
         WxFKuu/x5xYPjmlG5+NTD/7mKfhidUoxjA1Zi8N/nuBKHSyAHT+0pej2Q3b0TWRxYi0z
         s/rIQpF8ELF0IleRujmCThprLJ2ryfnlvZ2cteXjrEQ/MCV2qAajZnUXW1lxCDgKfbD6
         hNQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743795616; x=1744400416;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HPznh6CGxUFhqaGN+tuF1KZuEdkc3IM8iRC+hka4d9I=;
        b=YURaaW2fB8TavZqGQGjactrr3V+amKIagWbZ44Hxhk4+MyVb6ODD6qSMvNDwesqKV8
         DUVCaBhXsO1SXs9rbGJOIcy08yyBzNyTzsbBMPYjHW0oeVKZQxW+WJ7G0vjz63TitBJ7
         LFuhLyN7H7hJA6Z28C3Wu4CFzt/MUsotPB/G2pLbv0pMyXI5kr/lMJMHgDTDbNqlvCzL
         ypyvNQ3Gf+SsqzXI2KUr8MsuCLq2wRIwc7QetI6N5mbSGTIkd0/cvSR3eBtOpyYCFE2W
         gyIar8CHY3uviz4ZFdXNTCb7c+o/tyCzvaROAvS3EzhR7KnKzijIji8SVoQwH4Vz2LKq
         3R0g==
X-Forwarded-Encrypted: i=1; AJvYcCXcRDT9acQfBNFL8c580Q1aKIn0c/dBFrmuBcW4OThppQhPxGvArukUkQbg4oKH20H/xNLG1BpNGeEfbM0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg2kDpgoZmVjAWSMZKekBk4vpecanOlUOiVH/MmCFWLQVoHxDs
	EHXb+opi8rpsv1HZgDjw+wOmdNH8xo+JmH+IsgUpQM6I4DaJHpzXV7l1khMGVfDg9Nl1usP6Pll
	oFA==
X-Google-Smtp-Source: AGHT+IHdDhY3q1PoCzEN393Qre591g1t5JRHt7vREsmAZfu9y83GvrelcK4mphnOUkWNilXZrFXu1h6Tod0=
X-Received: from pfbhb19.prod.google.com ([2002:a05:6a00:8593:b0:737:79:e096])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:244c:b0:736:546c:eb69
 with SMTP id d2e1a72fcca58-739e492c849mr5818791b3a.9.1743795616257; Fri, 04
 Apr 2025 12:40:16 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri,  4 Apr 2025 12:38:32 -0700
In-Reply-To: <20250404193923.1413163-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250404193923.1413163-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250404193923.1413163-18-seanjc@google.com>
Subject: [PATCH 17/67] KVM: SVM: Drop redundant check in AVIC code on ID
 during vCPU creation
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>
Cc: kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Drop avic_get_physical_id_entry()'s compatibility check on the incoming
ID, as its sole caller, avic_init_backing_page(), performs the exact same
check.  Drop avic_get_physical_id_entry() entirely as the only remaining
functionality is getting the address of the Physical ID table, and
accessing the array without an immediate bounds check is kludgy.

Opportunistically add a compile-time assertion to ensure the vcpu_id can't
result in a bounds overflow, e.g. if KVM (really) messed up a maximum
physical ID #define, as well as run-time assertions so that a NULL pointer
dereference is morphed into a safer WARN().

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 47 +++++++++++++++++------------------------
 1 file changed, 19 insertions(+), 28 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index ba8dfc8a12f4..344541e418c3 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -265,35 +265,19 @@ void avic_init_vmcb(struct vcpu_svm *svm, struct vmcb *vmcb)
 		avic_deactivate_vmcb(svm);
 }
 
-static u64 *avic_get_physical_id_entry(struct kvm_vcpu *vcpu,
-				       unsigned int index)
-{
-	u64 *avic_physical_id_table;
-	struct kvm_svm *kvm_svm = to_kvm_svm(vcpu->kvm);
-
-	if ((!x2avic_enabled && index > AVIC_MAX_PHYSICAL_ID) ||
-	    (index > X2AVIC_MAX_PHYSICAL_ID))
-		return NULL;
-
-	avic_physical_id_table = page_address(kvm_svm->avic_physical_id_table_page);
-
-	return &avic_physical_id_table[index];
-}
-
 static int avic_init_backing_page(struct kvm_vcpu *vcpu)
 {
-	u64 *entry, new_entry;
-	int id = vcpu->vcpu_id;
+	struct kvm_svm *kvm_svm = to_kvm_svm(vcpu->kvm);
 	struct vcpu_svm *svm = to_svm(vcpu);
+	u32 id = vcpu->vcpu_id;
+	u64 *table, new_entry;
 
 	/*
 	 * Inhibit AVIC if the vCPU ID is bigger than what is supported by AVIC
-	 * hardware.  Do so immediately, i.e. don't defer the update via a
-	 * request, as avic_vcpu_load() expects to be called if and only if the
-	 * vCPU has fully initialized AVIC.  Immediately clear apicv_active,
-	 * as avic_vcpu_load() assumes avic_physical_id_cache is valid, i.e.
-	 * waiting until KVM_REQ_APICV_UPDATE is processed on the first KVM_RUN
-	 * will result in an NULL pointer deference when loading the vCPU.
+	 * hardware.  Immediately clear apicv_active, i.e. don't wait until the
+	 * KVM_REQ_APICV_UPDATE request is processed on the first KVM_RUN, as
+	 * avic_vcpu_load() expects to be called if and only if the vCPU has
+	 * fully initialized AVIC.
 	 */
 	if ((!x2avic_enabled && id > AVIC_MAX_PHYSICAL_ID) ||
 	    (id > X2AVIC_MAX_PHYSICAL_ID)) {
@@ -302,6 +286,9 @@ static int avic_init_backing_page(struct kvm_vcpu *vcpu)
 		return 0;
 	}
 
+	BUILD_BUG_ON((AVIC_MAX_PHYSICAL_ID + 1) * sizeof(*table) > PAGE_SIZE ||
+		     (X2AVIC_MAX_PHYSICAL_ID + 1) * sizeof(*table) > PAGE_SIZE);
+
 	if (WARN_ON_ONCE(!vcpu->arch.apic->regs))
 		return -EINVAL;
 
@@ -320,9 +307,7 @@ static int avic_init_backing_page(struct kvm_vcpu *vcpu)
 	}
 
 	/* Setting AVIC backing page address in the phy APIC ID table */
-	entry = avic_get_physical_id_entry(vcpu, id);
-	if (!entry)
-		return -EINVAL;
+	table = page_address(kvm_svm->avic_physical_id_table_page);
 
 	/* Note, fls64() returns the bit position, +1. */
 	BUILD_BUG_ON(__PHYSICAL_MASK_SHIFT >
@@ -330,9 +315,9 @@ static int avic_init_backing_page(struct kvm_vcpu *vcpu)
 
 	new_entry = avic_get_backing_page_address(svm) |
 		    AVIC_PHYSICAL_ID_ENTRY_VALID_MASK;
-	WRITE_ONCE(*entry, new_entry);
+	WRITE_ONCE(table[id], new_entry);
 
-	svm->avic_physical_id_cache = entry;
+	svm->avic_physical_id_cache = &table[id];
 
 	return 0;
 }
@@ -1018,6 +1003,9 @@ void avic_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	if (WARN_ON(h_physical_id & ~AVIC_PHYSICAL_ID_ENTRY_HOST_PHYSICAL_ID_MASK))
 		return;
 
+	if (WARN_ON_ONCE(!svm->avic_physical_id_cache))
+		return;
+
 	/*
 	 * No need to update anything if the vCPU is blocking, i.e. if the vCPU
 	 * is being scheduled in after being preempted.  The CPU entries in the
@@ -1058,6 +1046,9 @@ void avic_vcpu_put(struct kvm_vcpu *vcpu)
 
 	lockdep_assert_preemption_disabled();
 
+	if (WARN_ON_ONCE(!svm->avic_physical_id_cache))
+		return;
+
 	/*
 	 * Note, reading the Physical ID entry outside of ir_list_lock is safe
 	 * as only the pCPU that has loaded (or is loading) the vCPU is allowed
-- 
2.49.0.504.g3bcea36a83-goog

