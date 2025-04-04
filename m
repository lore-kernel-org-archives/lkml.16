Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6637B23C8B2
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 19:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743795670; cv=none; b=l1rygP7UfwdMRyMbyKuhZTw7v7ycqoLpGIOJ2WrhUi11kvld9MbXlutovU1ayYwma49PBKhmI62Omn1Aolup5bFqZVFTxieCUpA535J3QdT/7UEwxV0aiXivgTckAioVDBhG71biO/mh1/zTxnVNGuy7B1RgFdMaMSCtC9qCuLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743795670; c=relaxed/simple;
	bh=Gs/w7b1TpQ2M7g5MgA9NNIvjCHFPtQtwURjHeBU9J9A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=r47tz80yvOwKYPgmE+b+pcGpxsMJhbyV8NA+4zPP8QL3BxGLlk+1gxNv6v/TomuN21wYJVPxMTeP+05Id0AYhkhNrBS7oJyy9XtbDiWHuYVKva0o2dFQvGKlZP8t+hJcfVpVjBb3lfhAU8FvKPwP/U4UHSt47MLrjRZfi/IZfm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E+N5REh0; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E+N5REh0"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7398d70abbfso3440834b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 12:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743795668; x=1744400468; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=PKGLHehhFYZS7RFg1K2PZNaed8s88CqZbtq5pq5GKIE=;
        b=E+N5REh0WKQZpugrVbhv1ef447RAFeK+DrrVDWbrqamdfv+j9JAxFAzO15P2TxIjkD
         tx7nrf3gBHnX3MTPU9pVSPQmHmbx/RVFV/cgphXLB2smw/dBwcUPm+Zv2SLsz7iLmcBS
         aY8f4E2ixwYFHJAJcuFhrGuKLzKgYuKeIUwvxJpvvf7GQvyPeZGkl2JulA2am8cWu/1m
         NwZ+/9enMY+QzeLVp2m4BNTJw+26jF1djzMRPF5KV2NHd1/ZFi8uldxWQI/tH23SYjOG
         zfNxYO5TskWh8pqymPjq5KPg26xU1QVZICrwJiYEQLy6hEX6P3N8lq2A5wDJV7lQx1HM
         8xVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743795668; x=1744400468;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PKGLHehhFYZS7RFg1K2PZNaed8s88CqZbtq5pq5GKIE=;
        b=eCxyBKTLrLWv8X2FyeX5TALaUP6d7UbEUXs/XOnG1AYOMHn6UNjAHFIvglh6AEXL+/
         HXuVcOCEdmusvEmMOhNHWn/HVdkWeujP7g5l2+EV5NgSaJxbr0+U3v9VPjzBAUbp8j/P
         05ZdGV+De0mv/+UNje9kJqvIZ73buxo1zqAJ5LtCGvLZwav8KkIckjB3Pk0laVDUOEJI
         mYkQVyqj5aeNLo3CNMOr+D1X8WUNTjM1ika2uEwLFWWPSvEIHkNGZ/3Yp+Vj4CVYVC30
         lFdwLERsKTKTRA42q0AuaPSq/XPcjcMN7hblpcTk6fiEAHIZ9cUlspRjbidbXajFiVtZ
         ABIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWoY0BLKNW3YEp5DeboUfQ93s1qYjFFxniYziRTk6HpTFXNEDvFHdAwht2DHOQRa93yt1qc3GSLLHGYo4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzalJl/3tVtdct/LL+txjpH+f0hjWIMr69zX3q+ifeHFY839dS2
	PbcjupCh24oOQiqtJ+N2OvCB/6WND+XSaFBZZB/qkFrDfKxire/hELUPQUScPCptR8FPOnQPxr+
	xaA==
X-Google-Smtp-Source: AGHT+IHe6zs/5LhCfrFgK+vj2rDDG19lUEDx00Bzgp892zED1081EdFE7G+DtTelTSRWbal8s7FZTzV1M7s=
X-Received: from pfch7.prod.google.com ([2002:a05:6a00:1707:b0:736:aaee:120e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:aa7:88c9:0:b0:736:6043:69f9
 with SMTP id d2e1a72fcca58-73b6b8c2c45mr719867b3a.19.1743795667980; Fri, 04
 Apr 2025 12:41:07 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri,  4 Apr 2025 12:39:02 -0700
In-Reply-To: <20250404193923.1413163-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250404193923.1413163-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250404193923.1413163-48-seanjc@google.com>
Subject: [PATCH 47/67] iommu/amd: KVM: SVM: Add IRTE metadata to affined
 vCPU's list if AVIC is inhibited
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>
Cc: kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

If an IRQ can be posted to a vCPU, but AVIC is currently inhibited on the
vCPU, go through the dance of "affining" the IRTE to the vCPU, but leave
the actual IRTE in remapped mode.  KVM already handles the case where AVIC
is inhibited => uninhibited with posted IRQs (see avic_set_pi_irte_mode()),
but doesn't handle the scenario where a postable IRQ comes along while AVIC
is inhibited.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c   | 16 ++++++----------
 drivers/iommu/amd/iommu.c |  5 ++++-
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 086139e85242..04bc1aa88dcc 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -790,21 +790,17 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 	 */
 	svm_ir_list_del(irqfd);
 
-	/**
-	 * Here, we setup with legacy mode in the following cases:
-	 * 1. When cannot target interrupt to a specific vcpu.
-	 * 2. Unsetting posted interrupt.
-	 * 3. APIC virtualization is disabled for the vcpu.
-	 * 4. IRQ has incompatible delivery mode (SMI, INIT, etc)
-	 */
-	if (vcpu && kvm_vcpu_apicv_active(vcpu)) {
+	if (vcpu) {
 		/*
-		 * Try to enable guest_mode in IRTE.
+		 * Try to enable guest_mode in IRTE, unless AVIC is inhibited,
+		 * in which case configure the IRTE for legacy mode, but track
+		 * the IRTE metadata so that it can be converted to guest mode
+		 * if AVIC is enabled/uninhibited in the future.
 		 */
 		struct amd_iommu_pi_data pi_data = {
 			.ga_tag = AVIC_GATAG(to_kvm_svm(kvm)->avic_vm_id,
 					     vcpu->vcpu_id),
-			.is_guest_mode = true,
+			.is_guest_mode = kvm_vcpu_apicv_active(vcpu),
 			.vapic_addr = avic_get_backing_page_address(to_svm(vcpu)),
 			.vector = vector,
 		};
diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index b0b4c5ca16a8..a881fad027fd 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -3896,7 +3896,10 @@ static int amd_ir_set_vcpu_affinity(struct irq_data *data, void *info)
 		ir_data->ga_root_ptr = (pi_data->vapic_addr >> 12);
 		ir_data->ga_vector = pi_data->vector;
 		ir_data->ga_tag = pi_data->ga_tag;
-		ret = amd_iommu_activate_guest_mode(ir_data, pi_data->cpu);
+		if (pi_data->is_guest_mode)
+			ret = amd_iommu_activate_guest_mode(ir_data, pi_data->cpu);
+		else
+			ret = amd_iommu_deactivate_guest_mode(ir_data);
 	} else {
 		ret = amd_iommu_deactivate_guest_mode(ir_data);
 	}
-- 
2.49.0.504.g3bcea36a83-goog

