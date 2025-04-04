Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB552512DF
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 19:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743795696; cv=none; b=bY1lfhFEMfZvsMJujvrOtRFZ5NU8bzG+zeIeavWH/LGDV+9hBevuVh6PwLmw+R8XqomZU2OL8meGJJkGMk3h5ncMBw2bIjW7zaFwUgaNw4DZXMdxq5FYlbCwpnfZ2IfwmGm46s4yC7PUL8fyYGw8Ixlc+xolO2qNWrGNWjyCGmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743795696; c=relaxed/simple;
	bh=jVZErwdal797VpSsrwTL71Rrrie0hFV8uvPJVa7d+Ug=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=G3spmNlIbXIB85MnZsPOW783f1JOHqtU+3otCrK/lIXdqjbI1fGDVzd2rN9hNIDnVo0itTabhkIBAEP9/ENf8d/CkNGUZwIkuT5eMU4D8DC8tS4pD3eD5Ph6vc8Rjk+OzD/mPOETe1Fe6H+LL6yim4xT6UQYenViRGbF4yqbPdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hyBULlxD; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hyBULlxD"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-736c135f695so1931826b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 12:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743795694; x=1744400494; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=H1ACwNhde2OYKIaCE2zz1dgH1XDk00/KwfgDPrzpopE=;
        b=hyBULlxDoWQiiD0nsirhWlqiz05A8c9jXi4fXenGaUdaYYmEPstm5ACmQjtQM5eETa
         LDMW8u8tvOhWrCgulnAPLw+PAR6OzO8hnxlzgg05hMmgJtbtSBmwoY3/Lz2420fakCKQ
         z1gct5L+5JRATa0qTw/fGcjAWo0TbFbicEovonA9E/1jATIRkJfqydpJ5h8gOiOUSvZB
         e4KzTxh1iIHf+0Rwo4Uius9OXpYvuH651HMqEz+YFnnKtEohfj08OXGF49NgsGdhcbeH
         UDaTrZVE3uFDuR0wM5Db1l1Btx0YUwUDa4FjgAwzoNfIqk2UuEbRLiOXpseAzIC1JiRH
         adVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743795694; x=1744400494;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H1ACwNhde2OYKIaCE2zz1dgH1XDk00/KwfgDPrzpopE=;
        b=XiymjGCS8NpRG5yuvBGcjaMhlDch0W80Q+ScA8qeAcp0TNoatSz/iJumBp6AQwFvcE
         ITNhGMaOfnobrzkRmZ+vJN8O0FoHjUycCB7cQSaP30w3PVWP1jqfKwelkqT3LCDHRxFp
         93pFZcFMTLDFitlmm5G0GagN3xk7eT7VavPDvmtfe4laOF+EkOcuSjACQHNUWpMyz8Nj
         p7gpfM39GmvE1p6ohkPu250aSm+viKRNLKwYa5EfKr96037CDuYozLktQx18LMnhCAqR
         5au32iC2jmuT/3vM+DmJQ9ERIBpgQ1eu6J1id1rGgLkH6utuw6SVcIL2SFRelvwMg+aY
         PS0A==
X-Forwarded-Encrypted: i=1; AJvYcCW6v/v0cL3ukshHU67LBuC6BX9Zkmhs67VXvWn4/VIHwN1wA4uafHV/c/OsnkPIpVyk7nCTBWxC/ukqB/s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlGvB36/N3JWgjeFXENTYcbsgbpHpzTRcfg8whA4IdniZ9sfbe
	FJZ+9entmdHS7867FScL0Nfpxm2sZWb2kGFBKFs+33e4iYIL2w0uVqc3v7E31EOC+iAZbB01Wwh
	yCQ==
X-Google-Smtp-Source: AGHT+IGbZ24Q6rwJO75l7fVdcdLxJb2hwrofRssz7VDHE5j8x4DF+N+5JpsqYoKoJNTaXTZKLWKOQNskhGw=
X-Received: from pfhh19.prod.google.com ([2002:a05:6a00:2313:b0:736:ab5f:21f4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2e14:b0:736:4bd3:ffab
 with SMTP id d2e1a72fcca58-739e4be89demr4703540b3a.17.1743795693901; Fri, 04
 Apr 2025 12:41:33 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri,  4 Apr 2025 12:39:17 -0700
In-Reply-To: <20250404193923.1413163-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250404193923.1413163-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250404193923.1413163-63-seanjc@google.com>
Subject: [PATCH 62/67] KVM: SVM: Don't check vCPU's blocking status when
 toggling AVIC on/off
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>
Cc: kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Don't query a vCPU's blocking status when toggling AVIC on/off; barring
KVM bugs, the vCPU can't be blocking when refrecing AVIC controls.  And if
there are KVM bugs, ensuring the vCPU and its associated IRTEs are in the
correct state is desirable, i.e. well worth any overhead in a buggy
scenario.

Isolating the "real" load/put flows will allow moving the IOMMU IRTE
(de)activation logic from avic_refresh_apicv_exec_ctrl() to
avic_update_iommu_vcpu_affinity(), i.e. will allow updating the vCPU's
physical ID entry and its IRTEs in a common path, under a single critical
section of ir_list_lock.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 65 +++++++++++++++++++++++------------------
 1 file changed, 37 insertions(+), 28 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 0425cc374a79..d5fa915d0827 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -838,7 +838,7 @@ static void avic_update_iommu_vcpu_affinity(struct kvm_vcpu *vcpu, int cpu)
 		WARN_ON_ONCE(amd_iommu_update_ga(cpu, ir->data));
 }
 
-void avic_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
+static void __avic_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 {
 	struct kvm_svm *kvm_svm = to_kvm_svm(vcpu->kvm);
 	int h_physical_id = kvm_cpu_get_apicid(cpu);
@@ -854,16 +854,6 @@ void avic_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	if (WARN_ON_ONCE(vcpu->vcpu_id * sizeof(entry) >= PAGE_SIZE))
 		return;
 
-	/*
-	 * No need to update anything if the vCPU is blocking, i.e. if the vCPU
-	 * is being scheduled in after being preempted.  The CPU entries in the
-	 * Physical APIC table and IRTE are consumed iff IsRun{ning} is '1'.
-	 * If the vCPU was migrated, its new CPU value will be stuffed when the
-	 * vCPU unblocks.
-	 */
-	if (kvm_vcpu_is_blocking(vcpu))
-		return;
-
 	/*
 	 * Grab the per-vCPU interrupt remapping lock even if the VM doesn't
 	 * _currently_ have assigned devices, as that can change.  Holding
@@ -898,31 +888,33 @@ void avic_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	spin_unlock_irqrestore(&svm->ir_list_lock, flags);
 }
 
-void avic_vcpu_put(struct kvm_vcpu *vcpu)
+void avic_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
+{
+	/*
+	 * No need to update anything if the vCPU is blocking, i.e. if the vCPU
+	 * is being scheduled in after being preempted.  The CPU entries in the
+	 * Physical APIC table and IRTE are consumed iff IsRun{ning} is '1'.
+	 * If the vCPU was migrated, its new CPU value will be stuffed when the
+	 * vCPU unblocks.
+	 */
+	if (kvm_vcpu_is_blocking(vcpu))
+		return;
+
+	__avic_vcpu_load(vcpu, cpu);
+}
+
+static void __avic_vcpu_put(struct kvm_vcpu *vcpu)
 {
 	struct kvm_svm *kvm_svm = to_kvm_svm(vcpu->kvm);
 	struct vcpu_svm *svm = to_svm(vcpu);
 	unsigned long flags;
-	u64 entry;
+	u64 entry = svm->avic_physical_id_entry;
 
 	lockdep_assert_preemption_disabled();
 
 	if (WARN_ON_ONCE(vcpu->vcpu_id * sizeof(entry) >= PAGE_SIZE))
 		return;
 
-	/*
-	 * Note, reading the Physical ID entry outside of ir_list_lock is safe
-	 * as only the pCPU that has loaded (or is loading) the vCPU is allowed
-	 * to modify the entry, and preemption is disabled.  I.e. the vCPU
-	 * can't be scheduled out and thus avic_vcpu_{put,load}() can't run
-	 * recursively.
-	 */
-	entry = svm->avic_physical_id_entry;
-
-	/* Nothing to do if IsRunning == '0' due to vCPU blocking. */
-	if (!(entry & AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK))
-		return;
-
 	/*
 	 * Take and hold the per-vCPU interrupt remapping lock while updating
 	 * the Physical ID entry even though the lock doesn't protect against
@@ -942,7 +934,24 @@ void avic_vcpu_put(struct kvm_vcpu *vcpu)
 		WRITE_ONCE(kvm_svm->avic_physical_id_table[vcpu->vcpu_id], entry);
 
 	spin_unlock_irqrestore(&svm->ir_list_lock, flags);
+}
 
+void avic_vcpu_put(struct kvm_vcpu *vcpu)
+{
+	/*
+	 * Note, reading the Physical ID entry outside of ir_list_lock is safe
+	 * as only the pCPU that has loaded (or is loading) the vCPU is allowed
+	 * to modify the entry, and preemption is disabled.  I.e. the vCPU
+	 * can't be scheduled out and thus avic_vcpu_{put,load}() can't run
+	 * recursively.
+	 */
+	u64 entry = to_svm(vcpu)->avic_physical_id_entry;
+
+	/* Nothing to do if IsRunning == '0' due to vCPU blocking. */
+	if (!(entry & AVIC_PHYSICAL_ID_ENTRY_IS_RUNNING_MASK))
+		return;
+
+	__avic_vcpu_put(vcpu);
 }
 
 void avic_refresh_virtual_apic_mode(struct kvm_vcpu *vcpu)
@@ -983,9 +992,9 @@ void avic_refresh_apicv_exec_ctrl(struct kvm_vcpu *vcpu)
 	avic_refresh_virtual_apic_mode(vcpu);
 
 	if (activated)
-		avic_vcpu_load(vcpu, vcpu->cpu);
+		__avic_vcpu_load(vcpu, vcpu->cpu);
 	else
-		avic_vcpu_put(vcpu);
+		__avic_vcpu_put(vcpu);
 
 	/*
 	 * Here, we go through the per-vcpu ir_list to update all existing
-- 
2.49.0.504.g3bcea36a83-goog

