Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0483E23AE6D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 19:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743795668; cv=none; b=tPggezw+jGN8AdzYsH8U+NFFWNm58hwuOmXvQBP7Vp7MLAgumJqLOWadOAVMsPf90/rgVCPczf2Up1mNI0f0Pvry8BF2DJqh40b6yoykcI6Uy6obbjsJvn8Ze9saZX/7B6cCQFfwgBGdtS2XlElalL5fu/+ucySL+AoI4W8xPrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743795668; c=relaxed/simple;
	bh=vEYwD1yOWLfk/95pT3cNRoQCpvLsFYMJf/mNwwjdg6w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gaDUQt6j6E6trvYpmyxsJssYM9SaPfzCjifpZZfaUMgi5/qq3fyS1cSeMUCRtUtVAFofZLb4CdH5fN6brT6FtWkF4rNjiGb1MsML+qMoi/hfgfwKPudUmpc2qyfIsvYPpd4+JmNg6FrpJcmYvETryc80uBfVoiwCTShKR83yxeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RHIN6lgr; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RHIN6lgr"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-73009f59215so2924109b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 12:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743795666; x=1744400466; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=fCu4znq/izmNOP+TGp2LQJl6nRBB96ndlJ2G/FSp1oU=;
        b=RHIN6lgrIfeFHt2loEhTGwv5J4IOocqS1BmpajAT2NECGOQJECqTISX1590E8yip8y
         Q7FJBWXqk+Klh4YbzjW0ifdmcbVy/jAoAAtNySD//zHoG7mEkNMi65zgaYwc5q/0nwOg
         M+atOXn7V3czvZVSCZKJu0m7LRYkC1JISB1iup9xal/w7D17iTvrKZxAsWHqyD726DBp
         3q0uqpkaoLjCH+l0BoupCJNdR64mnZ+q1qxDK7GAmgIR1tM69uVYpBqUULD1OL/06QZr
         ycez5fCeCpZhklAlcI85JAhsINKtMIx5zqikI14fzXysh6yznuVY9Vk3UYSL2JFs5lqI
         wCnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743795666; x=1744400466;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fCu4znq/izmNOP+TGp2LQJl6nRBB96ndlJ2G/FSp1oU=;
        b=EQqmal4qK0Y3Wb+Ofv+XVq4jDozg9hNMCMDc96fR0dGoE42l/x8NEG038ScqV9YS4E
         msXyIcTV+Ss2oABIeFZxWxgZHsEY+OHuQ35nRLHF5fmJL/Niw5yen+Ldwn0FLgAku3E9
         qde1C7zrsCSv0F/pzcTsXodDjqFI5GoDGpw6gsoRigCMNbzIOX9aQXVBdFTqiRSebccM
         tkBqKYdLyupKivTy6Kz26Va3I6piib7raXE0mCra7LP4H2I01ua8HOh3y+3eh1QPy8PR
         +5LBu3l2/HkupaH8S+auqHaoX4QWXZHUCkT4g/35VEJ9G6NsmlS0eZ+PUPTFc4Uh6s+j
         M/OQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcj/ClEw3FYF63DjdM1r1VC4QQuohaqupgtnr98sxJucQ8l2zq+ARuv7+INpQQjConqdti06o6dRv5KEI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlqDdK6llNNZmgSBN1cM5sB1Kusthb6Hn62Pk0kV8i36Imxj8L
	YCQCSQlcbJgw3aOwee/GtaK64NLMix9IKf7YTFv0UJ05k3sRkhdlUQ+/tD5HioenNb0WS5lsNOJ
	CNw==
X-Google-Smtp-Source: AGHT+IGPj22UXTH/Zcy5qZIqn9/BjQASYjiq8B8h2ade9XrhvSEXkbVGkfxvkxUFnqdy7NHyCw+NgEfc9co=
X-Received: from pfch7.prod.google.com ([2002:a05:6a00:1707:b0:736:aaee:120e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3cc2:b0:730:75b1:7219
 with SMTP id d2e1a72fcca58-739e70575e6mr4840675b3a.12.1743795666219; Fri, 04
 Apr 2025 12:41:06 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri,  4 Apr 2025 12:39:01 -0700
In-Reply-To: <20250404193923.1413163-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250404193923.1413163-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250404193923.1413163-47-seanjc@google.com>
Subject: [PATCH 46/67] iommu/amd: KVM: SVM: Set pCPU info in IRTE when setting
 vCPU affinity
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>
Cc: kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Now that setting vCPU affinity is guarded with ir_list_lock, i.e. now that
avic_physical_id_entry can be safely accessed, set the pCPU info
straight-away when setting vCPU affinity.  Putting the IRTE into posted
mode, and then immediately updating the IRTE a second time if the target
vCPU is running is wasteful and confusing.

This also fixes a flaw where a posted IRQ that arrives between putting
the IRTE into guest_mode and setting the correct destination could cause
the IOMMU to ring the doorbell on the wrong pCPU.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/irq_remapping.h |  1 +
 arch/x86/kvm/svm/avic.c              | 26 ++++++++++++++------------
 drivers/iommu/amd/iommu.c            |  6 ++++--
 include/linux/amd-iommu.h            |  4 ++--
 4 files changed, 21 insertions(+), 16 deletions(-)

diff --git a/arch/x86/include/asm/irq_remapping.h b/arch/x86/include/asm/irq_remapping.h
index 2dbc9cb61c2f..4c75a17632f6 100644
--- a/arch/x86/include/asm/irq_remapping.h
+++ b/arch/x86/include/asm/irq_remapping.h
@@ -35,6 +35,7 @@ struct amd_iommu_pi_data {
 	u64 vapic_addr;		/* Physical address of the vCPU's vAPIC. */
 	u32 ga_tag;
 	u32 vector;		/* Guest vector of the interrupt */
+	int cpu;
 	bool is_guest_mode;
 	void *ir_data;
 };
diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 3fcec297e3e3..086139e85242 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -735,6 +735,7 @@ void avic_apicv_post_state_restore(struct kvm_vcpu *vcpu)
 
 static int avic_set_pi_irte_mode(struct kvm_vcpu *vcpu, bool activate)
 {
+	int apic_id = kvm_cpu_get_apicid(vcpu->cpu);
 	int ret = 0;
 	unsigned long flags;
 	struct amd_svm_iommu_ir *ir;
@@ -754,7 +755,7 @@ static int avic_set_pi_irte_mode(struct kvm_vcpu *vcpu, bool activate)
 
 	list_for_each_entry(ir, &svm->ir_list, node) {
 		if (activate)
-			ret = amd_iommu_activate_guest_mode(ir->data);
+			ret = amd_iommu_activate_guest_mode(ir->data, apic_id);
 		else
 			ret = amd_iommu_deactivate_guest_mode(ir->data);
 		if (ret)
@@ -819,6 +820,18 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 		 */
 		guard(spinlock_irqsave)(&svm->ir_list_lock);
 
+		/*
+		 * Update the target pCPU for IOMMU doorbells if the vCPU is
+		 * running.  If the vCPU is NOT running, i.e. is blocking or
+		 * scheduled out, KVM will update the pCPU info when the vCPU
+		 * is awakened and/or scheduled in.  See also avic_vcpu_load().
+		 */
+		entry = svm->avic_physical_id_entry;
+		if (entry & AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK)
+			pi_data.cpu = entry & AVIC_PHYSICAL_ID_ENTRY_HOST_PHYSICAL_ID_MASK;
+		else
+			pi_data.cpu = -1;
+
 		ret = irq_set_vcpu_affinity(host_irq, &pi_data);
 		if (ret)
 			return ret;
@@ -833,17 +846,6 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 			return -EIO;
 		}
 
-		/*
-		 * Update the target pCPU for IOMMU doorbells if the vCPU is
-		 * running.  If the vCPU is NOT running, i.e. is blocking or
-		 * scheduled out, KVM will update the pCPU info when the vCPU
-		 * is awakened and/or scheduled in.  See also avic_vcpu_load().
-		 */
-		entry = svm->avic_physical_id_entry;
-		if (entry & AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK)
-			amd_iommu_update_ga(entry & AVIC_PHYSICAL_ID_ENTRY_HOST_PHYSICAL_ID_MASK,
-					    pi_data.ir_data);
-
 		irqfd->irq_bypass_data = pi_data.ir_data;
 		list_add(&irqfd->vcpu_list, &svm->ir_list);
 		return 0;
diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 4fdf1502be69..b0b4c5ca16a8 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -3807,7 +3807,7 @@ int amd_iommu_update_ga(int cpu, void *data)
 }
 EXPORT_SYMBOL(amd_iommu_update_ga);
 
-int amd_iommu_activate_guest_mode(void *data)
+int amd_iommu_activate_guest_mode(void *data, int cpu)
 {
 	struct amd_ir_data *ir_data = (struct amd_ir_data *)data;
 	struct irte_ga *entry = (struct irte_ga *) ir_data->entry;
@@ -3828,6 +3828,8 @@ int amd_iommu_activate_guest_mode(void *data)
 	entry->hi.fields.vector            = ir_data->ga_vector;
 	entry->lo.fields_vapic.ga_tag      = ir_data->ga_tag;
 
+	__amd_iommu_update_ga(entry, cpu);
+
 	return modify_irte_ga(ir_data->iommu, ir_data->irq_2_irte.devid,
 			      ir_data->irq_2_irte.index, entry);
 }
@@ -3894,7 +3896,7 @@ static int amd_ir_set_vcpu_affinity(struct irq_data *data, void *info)
 		ir_data->ga_root_ptr = (pi_data->vapic_addr >> 12);
 		ir_data->ga_vector = pi_data->vector;
 		ir_data->ga_tag = pi_data->ga_tag;
-		ret = amd_iommu_activate_guest_mode(ir_data);
+		ret = amd_iommu_activate_guest_mode(ir_data, pi_data->cpu);
 	} else {
 		ret = amd_iommu_deactivate_guest_mode(ir_data);
 	}
diff --git a/include/linux/amd-iommu.h b/include/linux/amd-iommu.h
index fe0e16ffe0e5..c9f2df0c4596 100644
--- a/include/linux/amd-iommu.h
+++ b/include/linux/amd-iommu.h
@@ -32,7 +32,7 @@ extern int amd_iommu_register_ga_log_notifier(int (*notifier)(u32));
 
 extern int amd_iommu_update_ga(int cpu, void *data);
 
-extern int amd_iommu_activate_guest_mode(void *data);
+extern int amd_iommu_activate_guest_mode(void *data, int cpu);
 extern int amd_iommu_deactivate_guest_mode(void *data);
 
 #else /* defined(CONFIG_AMD_IOMMU) && defined(CONFIG_IRQ_REMAP) */
@@ -48,7 +48,7 @@ static inline int amd_iommu_update_ga(int cpu, void *data)
 	return 0;
 }
 
-static inline int amd_iommu_activate_guest_mode(void *data)
+static inline int amd_iommu_activate_guest_mode(void *data, int cpu)
 {
 	return 0;
 }
-- 
2.49.0.504.g3bcea36a83-goog

