Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F7922B8BF
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 19:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743795637; cv=none; b=izdn3SOPRsgH3bTEiIznDOVvsABJry2EN0ThjSmlnLFrpxCloMQCUOjac+nJw2rl5qtU9jh85c8SDK/UfR6h+EGF21Uf99Fa9f34ChaR9anx1V95cgyELSkHxS5VBgvLqcU6TOz/2haHfYaoLl/EacBX6I9kYqw5qH19IJtO5FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743795637; c=relaxed/simple;
	bh=t3mwELhAcKd1FG0Vgyh+Vr0Nt27BO998JuBjMUh3xzA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uBXv38yCrWeJgBveyseDEHwkIanrQ85Mt1Jn44Y2OxnwortYGbai1fJVsfTRKMr6zCp39yh9LQ5CM4nlF7UNEkk2tzxasQ2ammVTSVHB29CjBzSRwxb9O0MeUDCS1EBOuWtqXwD3QFW3RVJtt0Pg5+kB06O6Ywrh0Qb1plCkreI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ATB9yvaA; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ATB9yvaA"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-736bf7eb149so1784277b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 12:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743795635; x=1744400435; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=JCbQ/uPtm4GA9Jd+dczlO9sqKxeGX1Ak3ycPsl+3KAs=;
        b=ATB9yvaABISON25xFvatCZEJCKtZuWnlOD176S/yALBtezMElcUhPoWKGaq+bd+wt4
         Z7K6wIs/bGNsR4tjVqKFVySWaHSrjbaFRGO9Xv1/aisfieapwmwrNe+XR/tJabzvhgjA
         fumDfwTKabCcOyf6ZMoJJM0IpPT+mOE7Kd6CX/y87kY6tR+p68yjNmC4xDmQEjhae93I
         7TRwP2cps2+7RuG6+sff/B0vjAWxsGA66fBp2VBywh7qPaDIH+dZzrInpKeYUPL+g4P2
         TjWpwvLHop6gVg6SPP5koL0Qv5wAVzmvQcWJuIL4FOBjo2kXNAy3B0C1zbL8vjTfGaxP
         jjRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743795635; x=1744400435;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JCbQ/uPtm4GA9Jd+dczlO9sqKxeGX1Ak3ycPsl+3KAs=;
        b=dBC9KxZGX4zT/oU67ORZSfeIa1eR57ke2rlkUtElvmzIlyLu1UuY7cEjzUm5WoWHlU
         GvJD6xK5WeGvSDHKJ/btLxY45T4uu4BmG31Xr0nQtkOdnaAmHnxcGxmzqraYo3/kfXOA
         Eoj69MRwWtvjZPfy0q0uOPDWF6yyMjitm+36TPPSXqzzdmgTgXXW07ODW+Upoedsk7FD
         wJhInqMDSlnK0jQ6XsDn5zmvNbe78TdxmBHHTvk6yCTHJNsYy2SKfqov2MWPHZJbWyOy
         MIWDiCX6FAy5iYHzJDpU0ybsg5rRUi1oo8WSB5lj1VEmTajyEgq6/VrWutGol/ygGLtj
         kBWA==
X-Forwarded-Encrypted: i=1; AJvYcCUoYhlLuCsHBsl6L3gsDwPp5YI3Q6RJWXSG9f/YVjCCZlEwSxYO4Biwnl5g05VmdGQTQXI+xX0rAc0NC9g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtx+E2e7o0AjBMNoXi7IrskrzWDezZ8sinYyqLN3Qs2vDJM56U
	oVo+ZXPyTPluqk5gyCyxcOBtvd7xKJuZGhbpf8/8wrloXEBmnz/wMBUzZfUyncJJ/oy0jrnAcs2
	l7A==
X-Google-Smtp-Source: AGHT+IF4DCxN4WQm8X4YFDxAo5hJ4BKHPkaXMYPBbUUX5BoVrFQSM6Xqq/UtaAv66x4ahce5XCI5nOVMSUc=
X-Received: from pfoi21.prod.google.com ([2002:aa7:87d5:0:b0:732:6c92:3f75])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7f9f:b0:1f5:52fe:dcf8
 with SMTP id adf61e73a8af0-20113d27d58mr891016637.26.1743795635469; Fri, 04
 Apr 2025 12:40:35 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri,  4 Apr 2025 12:38:43 -0700
In-Reply-To: <20250404193923.1413163-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250404193923.1413163-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250404193923.1413163-29-seanjc@google.com>
Subject: [PATCH 28/67] KVM: SVM: Get vCPU info for IRTE using new routing entry
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>
Cc: kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Explicitly get the vCPU information for a GSI routing entry from the new
(or current) entry provided by common KVM.  This is subtly a nop, as KVM
allows at most one MSI per GSI, i.e. the for-loop can only ever process
one entry, and that entry is the new/current entry.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 9c789c288314..eb6017b01c5f 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -855,7 +855,6 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 	struct kvm_kernel_irq_routing_entry *e;
 	struct kvm_irq_routing_table *irq_rt;
 	bool enable_remapped_mode = true;
-	bool set = !!new;
 	int idx, ret = 0;
 
 	if (!kvm_arch_has_assigned_device(kvm) || !kvm_arch_has_irq_bypass())
@@ -868,7 +867,7 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 	svm_ir_list_del(irqfd);
 
 	pr_debug("SVM: %s: host_irq=%#x, guest_irq=%#x, set=%#x\n",
-		 __func__, host_irq, guest_irq, set);
+		 __func__, host_irq, guest_irq, !!new);
 
 	idx = srcu_read_lock(&kvm->irq_srcu);
 	irq_rt = srcu_dereference(kvm->irq_routing, &kvm->irq_srcu);
@@ -896,7 +895,7 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 		 * 3. APIC virtualization is disabled for the vcpu.
 		 * 4. IRQ has incompatible delivery mode (SMI, INIT, etc)
 		 */
-		if (!get_pi_vcpu_info(kvm, e, &vcpu_info, &svm) && set &&
+		if (new && !get_pi_vcpu_info(kvm, new, &vcpu_info, &svm) &&
 		    kvm_vcpu_apicv_active(&svm->vcpu)) {
 			struct amd_iommu_pi_data pi;
 
@@ -927,7 +926,7 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 		if (!ret && svm) {
 			trace_kvm_pi_irte_update(host_irq, svm->vcpu.vcpu_id,
 						 e->gsi, vcpu_info.vector,
-						 vcpu_info.pi_desc_addr, set);
+						 vcpu_info.pi_desc_addr, !!new);
 		}
 
 		if (ret < 0) {
-- 
2.49.0.504.g3bcea36a83-goog

