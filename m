Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642A4293468
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 22:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749682043; cv=none; b=dD8MYNzI6nJv8Wfk0g0IF5gB+X6soPqcg9of4aguS17Hce9ScXUNJ0NGv/S3DmmBwBSja0LMJ3YojO0Ukz9aoNmjQvdXtn6t5Yn0K9skimj+X2e/vfmz4PcM7QurIDIi4cg74Wro3Rl6iwxnC3FEhzsdQF/Wvtul5nJu+Lq2xsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749682043; c=relaxed/simple;
	bh=2qGacpjWOqGXCydBdqQhvBSAIJOXNOYV4LljHdOsKcQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=U9PL7VEDkQKMmaDjiEWKNbYVDGCJKGhIIFT759BfvSImDy7xeve9LXnPn3yCVPf0pLQmM6hqh/h8Po4O1QQS8I9Q+32z6ATR/MmBuM8E9XPOkxiMQWGzPny75qiVSnCOzIR+SabZwjL7JqwTwHKWugUBySALvgCOfZ3al53MftI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ugbQdSwH; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ugbQdSwH"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-74299055c3dso487497b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682040; x=1750286840; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=fjGDTFzoOPTHOIiqFgNMI96VBH4N7QEJybjbvNpN00c=;
        b=ugbQdSwHXylRvh2DXNjr/gnX5+d+LHF/tcH+uDAeYFryWZfQjxI+52PC3+d/QP6Ia+
         arsKzMY5NcD+XgIWQ8eJTC5Mfx4r2b0CqVs2QhUk1RWh+/+gGitYA6+AlDd47NTU94Sr
         L/BHNZVQk8KisulIsm9WYK4xpp6aPCAwY1lFknyT2pAb5a0WlZyOANU9DZ7aebZxBsXn
         N1cRRct2CiBQQFqozBEfdxggerOFBU+GfTG59odG51Yp9nTKY3KvZ1i1Izrh+Ip4ZFT0
         46r4cni/Wcu582O6jhfnuM6JErX8xsFQwAaeJqL0r1oHb95UGl/MxSuwUl0MDxNK1LLW
         8F+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682040; x=1750286840;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fjGDTFzoOPTHOIiqFgNMI96VBH4N7QEJybjbvNpN00c=;
        b=LnhCNEqrukrNCy+RVgJ1yXEHBgxmmaZNLu8a07g293JXpxXc+9qhjTB7Sh+soQsTb7
         43dWMMqsp+QNz2tXom6MA4Gz7tKtmt9cDpGmXquOQ5hi9RrIdZpEe0Q6Qgu5wr9AkU1L
         aHeXw1g3IbMFKsBEpNpVNb1n5V5Jt1E3YNZwMUqlpYkab2rLwMS/GFDqdjvxfv7qDMtN
         toyIEUIINxJY0hr52aO2z7zhrQjA5uF4sIk0uD0bcRuWhEr0ocrKDVhQ7RU6jcTehod6
         fCutZkpRq4TJSrkKe/Ic0P6xaVukfZWV9ckTGLe02gbAyaLau0HC2BhNJhu5836i1CSE
         qBTg==
X-Forwarded-Encrypted: i=1; AJvYcCVaANL6MnzfnWcTF/KMQyqBFxyLCTgRewHfztG1Tn5XUBkARhNjcIUe22Uws9OLn23OrHfR1FClT7iKd9s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy5us6a/i8U8TCl1F8Afk7ZN+eVMYfb/tz9+KXrNzDWOepcp0v
	c0A3fs8fnDkEPV/9GiHN36u3WQPq3Clvpa2YkFguYagYD1GFyFYO9YYT+BHFDWwfzGCMCIWgXQw
	kCjoLpQ==
X-Google-Smtp-Source: AGHT+IGecZq8RM5h9tJ+sa6mCIHJXtBSp+Ntypd+iUzFZkPpDRHr5SZ8PChIvutcjWxMiCNgxwsIm8TNC5o=
X-Received: from pfbay26.prod.google.com ([2002:a05:6a00:301a:b0:746:223d:ebdc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:9a3:b0:736:43d6:f008
 with SMTP id d2e1a72fcca58-7486cdf41e9mr7104627b3a.12.1749682040461; Wed, 11
 Jun 2025 15:47:20 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 11 Jun 2025 15:45:17 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-16-seanjc@google.com>
Subject: [PATCH v3 14/62] KVM: SVM: Track AVIC tables as natively sized
 pointers, not "struct pages"
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <joro@8bytes.org>, 
	David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sairaj Kodilkar <sarunkod@amd.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	Francesco Lavra <francescolavra.fl@gmail.com>, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Allocate and track AVIC's logical and physical tables as u32 and u64
pointers respectively, as managing the pages as "struct page" pointers
adds an almost absurd amount of boilerplate and complexity.  E.g. with
page_address() out of the way, svm->avic_physical_id_cache becomes
completely superfluous, and will be removed in a future cleanup.

No functional change intended.

Tested-by: Sairaj Kodilkar <sarunkod@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 49 ++++++++++++++---------------------------
 arch/x86/kvm/svm/svm.h  |  4 ++--
 2 files changed, 18 insertions(+), 35 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 948bab48083b..bf18b0b643d9 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -172,10 +172,8 @@ void avic_vm_destroy(struct kvm *kvm)
 	if (!enable_apicv)
 		return;
 
-	if (kvm_svm->avic_logical_id_table_page)
-		__free_page(kvm_svm->avic_logical_id_table_page);
-	if (kvm_svm->avic_physical_id_table_page)
-		__free_page(kvm_svm->avic_physical_id_table_page);
+	free_page((unsigned long)kvm_svm->avic_logical_id_table);
+	free_page((unsigned long)kvm_svm->avic_physical_id_table);
 
 	spin_lock_irqsave(&svm_vm_data_hash_lock, flags);
 	hash_del(&kvm_svm->hnode);
@@ -188,27 +186,19 @@ int avic_vm_init(struct kvm *kvm)
 	int err = -ENOMEM;
 	struct kvm_svm *kvm_svm = to_kvm_svm(kvm);
 	struct kvm_svm *k2;
-	struct page *p_page;
-	struct page *l_page;
 	u32 vm_id;
 
 	if (!enable_apicv)
 		return 0;
 
-	/* Allocating physical APIC ID table (4KB) */
-	p_page = alloc_page(GFP_KERNEL_ACCOUNT | __GFP_ZERO);
-	if (!p_page)
+	kvm_svm->avic_physical_id_table = (void *)get_zeroed_page(GFP_KERNEL_ACCOUNT);
+	if (!kvm_svm->avic_physical_id_table)
 		goto free_avic;
 
-	kvm_svm->avic_physical_id_table_page = p_page;
-
-	/* Allocating logical APIC ID table (4KB) */
-	l_page = alloc_page(GFP_KERNEL_ACCOUNT | __GFP_ZERO);
-	if (!l_page)
+	kvm_svm->avic_logical_id_table = (void *)get_zeroed_page(GFP_KERNEL_ACCOUNT);
+	if (!kvm_svm->avic_logical_id_table)
 		goto free_avic;
 
-	kvm_svm->avic_logical_id_table_page = l_page;
-
 	spin_lock_irqsave(&svm_vm_data_hash_lock, flags);
  again:
 	vm_id = next_vm_id = (next_vm_id + 1) & AVIC_VM_ID_MASK;
@@ -242,12 +232,10 @@ static phys_addr_t avic_get_backing_page_address(struct vcpu_svm *svm)
 void avic_init_vmcb(struct vcpu_svm *svm, struct vmcb *vmcb)
 {
 	struct kvm_svm *kvm_svm = to_kvm_svm(svm->vcpu.kvm);
-	phys_addr_t lpa = __sme_set(page_to_phys(kvm_svm->avic_logical_id_table_page));
-	phys_addr_t ppa = __sme_set(page_to_phys(kvm_svm->avic_physical_id_table_page));
 
 	vmcb->control.avic_backing_page = avic_get_backing_page_address(svm);
-	vmcb->control.avic_logical_id = lpa;
-	vmcb->control.avic_physical_id = ppa;
+	vmcb->control.avic_logical_id = __sme_set(__pa(kvm_svm->avic_logical_id_table));
+	vmcb->control.avic_physical_id = __sme_set(__pa(kvm_svm->avic_physical_id_table));
 	vmcb->control.avic_vapic_bar = APIC_DEFAULT_PHYS_BASE;
 
 	if (kvm_apicv_activated(svm->vcpu.kvm))
@@ -261,7 +249,7 @@ static int avic_init_backing_page(struct kvm_vcpu *vcpu)
 	struct kvm_svm *kvm_svm = to_kvm_svm(vcpu->kvm);
 	struct vcpu_svm *svm = to_svm(vcpu);
 	u32 id = vcpu->vcpu_id;
-	u64 *table, new_entry;
+	u64 new_entry;
 
 	/*
 	 * Inhibit AVIC if the vCPU ID is bigger than what is supported by AVIC
@@ -277,8 +265,8 @@ static int avic_init_backing_page(struct kvm_vcpu *vcpu)
 		return 0;
 	}
 
-	BUILD_BUG_ON((AVIC_MAX_PHYSICAL_ID + 1) * sizeof(*table) > PAGE_SIZE ||
-		     (X2AVIC_MAX_PHYSICAL_ID + 1) * sizeof(*table) > PAGE_SIZE);
+	BUILD_BUG_ON((AVIC_MAX_PHYSICAL_ID + 1) * sizeof(new_entry) > PAGE_SIZE ||
+		     (X2AVIC_MAX_PHYSICAL_ID + 1) * sizeof(new_entry) > PAGE_SIZE);
 
 	if (WARN_ON_ONCE(!vcpu->arch.apic->regs))
 		return -EINVAL;
@@ -297,18 +285,16 @@ static int avic_init_backing_page(struct kvm_vcpu *vcpu)
 			return ret;
 	}
 
-	/* Setting AVIC backing page address in the phy APIC ID table */
-	table = page_address(kvm_svm->avic_physical_id_table_page);
-
 	/* Note, fls64() returns the bit position, +1. */
 	BUILD_BUG_ON(__PHYSICAL_MASK_SHIFT >
 		     fls64(AVIC_PHYSICAL_ID_ENTRY_BACKING_PAGE_MASK));
 
+	/* Setting AVIC backing page address in the phy APIC ID table */
 	new_entry = avic_get_backing_page_address(svm) |
 		    AVIC_PHYSICAL_ID_ENTRY_VALID_MASK;
-	WRITE_ONCE(table[id], new_entry);
+	WRITE_ONCE(kvm_svm->avic_physical_id_table[id], new_entry);
 
-	svm->avic_physical_id_cache = &table[id];
+	svm->avic_physical_id_cache = &kvm_svm->avic_physical_id_table[id];
 
 	return 0;
 }
@@ -442,7 +428,7 @@ static int avic_kick_target_vcpus_fast(struct kvm *kvm, struct kvm_lapic *source
 		if (apic_x2apic_mode(source))
 			avic_logical_id_table = NULL;
 		else
-			avic_logical_id_table = page_address(kvm_svm->avic_logical_id_table_page);
+			avic_logical_id_table = kvm_svm->avic_logical_id_table;
 
 		/*
 		 * AVIC is inhibited if vCPUs aren't mapped 1:1 with logical
@@ -544,7 +530,6 @@ unsigned long avic_vcpu_get_apicv_inhibit_reasons(struct kvm_vcpu *vcpu)
 static u32 *avic_get_logical_id_entry(struct kvm_vcpu *vcpu, u32 ldr, bool flat)
 {
 	struct kvm_svm *kvm_svm = to_kvm_svm(vcpu->kvm);
-	u32 *logical_apic_id_table;
 	u32 cluster, index;
 
 	ldr = GET_APIC_LOGICAL_ID(ldr);
@@ -565,9 +550,7 @@ static u32 *avic_get_logical_id_entry(struct kvm_vcpu *vcpu, u32 ldr, bool flat)
 		return NULL;
 	index += (cluster << 2);
 
-	logical_apic_id_table = (u32 *) page_address(kvm_svm->avic_logical_id_table_page);
-
-	return &logical_apic_id_table[index];
+	return &kvm_svm->avic_logical_id_table[index];
 }
 
 static void avic_ldr_write(struct kvm_vcpu *vcpu, u8 g_physical_id, u32 ldr)
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index 71e3c003580e..ec5d77d42a49 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -123,8 +123,8 @@ struct kvm_svm {
 
 	/* Struct members for AVIC */
 	u32 avic_vm_id;
-	struct page *avic_logical_id_table_page;
-	struct page *avic_physical_id_table_page;
+	u32 *avic_logical_id_table;
+	u64 *avic_physical_id_table;
 	struct hlist_node hnode;
 
 	struct kvm_sev_info sev_info;
-- 
2.50.0.rc1.591.g9c95f17f64-goog

