Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64FE221542
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 19:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743795679; cv=none; b=SnmQ0InEpe0YhsvKiooXrJocU+iNObWIKD71F0QfTUbraRTBdj0qafiJy+jy89hZai/sKHSWU+cV7Y9DfN3ZoY1zmcnVjbVXbHXyZRSPbBNzIIKghg8lWAJCNr7mxD3wXZbHjIHc8zyWFJThsPyUcePfTK5B9fjtk2/PtoUq+mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743795679; c=relaxed/simple;
	bh=pUv+Xc96YlFs/6EQOBDk/1ZAyvlUymEt7XHqJtNT7IA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pbmu1m/tb4Cm+BuktYLn6oqn2TV9/KHElfdgin6kxooR+bNHGOtbqJIHwN/MkulVzDdERqCAIaWha3TNj+HHrQO8U3VTtiNxaGbaEKX6R2/YQESpjRmBbucy8e0XSB5n/SsY9/efZNr3feWYqUGv/KgXKRRhxBLVKLC6HEyObrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sPslsL06; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sPslsL06"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-739071bdf2eso1813888b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 12:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743795677; x=1744400477; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=2g+yUGZiG4yfMHeUUYgs9UInpjAc1fZElggf5I4uJ3E=;
        b=sPslsL06yXOu4BpH0Gqk5VC5Y9RqsAoPXwFRGOxfOGnFmr9vaAOv4ZEfF/ax5zgPXv
         PYiBqHqdKYv2ztvZTRp2/9hVd7Art7wXctEPySKHRMHteUrBM1cOPiZi03fJ/Jbay9EV
         uBFwphIicHq96xLpsSNiEVwHrT5DjyHZbkxnjSZ6dH7iNRcW78huTBZdIw/bOKy2cgvz
         t/reNhNpRX7vrm0ycQW4t9TeBo1HyTDaZjp/qj8TnlhVdg3PrWRqqxXRYx8tw6quyNmC
         HSqypZBjQBtM4HUcGRUrxxHrhEq22Wt5uQxxyqDVlVjnxJhSZb50onzkXDEvhjsK2wmC
         QhgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743795677; x=1744400477;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2g+yUGZiG4yfMHeUUYgs9UInpjAc1fZElggf5I4uJ3E=;
        b=sL6Ll5HOTsVvY9uaujePD8wYgWY6Gg9BscOJ3aFccFCN0Nj8c8pH6XKmmQGsXxEZWr
         cs8L6tWYZ6M37iiloG4pF0KDY7aCwrej7iA0saWWtEhGzTxFjoFMuzflgRZ+iTHgOJkT
         sRlQhCxKrFSVNq4+LjCPC2HWDNmYtq7b/eenjx7Su2S2ghjSL9U9IZU/q3hdUSnIUYPc
         Yov5tQbYhh8DU3ATQvrBGeFu3/vAqOoSKdm4NB9Y1aQqu4vPvuy41N8qNQI/JYRkmk7a
         uDj755jdACqNdvjea74HFG9f1N8R0aJWAcB+YfJ6NN5x30H6ii5WP/CAUVj0C4upDetV
         UoPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtbaUzZu4f9Lkq3piz81J+HiTng4tm2qL5TJt9VZWkEHiqyEOqREZkOkl6QLaBijCfCK9MzBBxiX7I9kU=@vger.kernel.org
X-Gm-Message-State: AOJu0YztjUVa61N3SkIq1y1cHOZxLCAT+0Ldl9Nfb1Q87w9IuTzETOZt
	LFz7d2gpNIY0PvUkFWGS9YyLGaFVZuIdyECZ0Idpy0Nv373sMp416VMKC77cOucBykHXy0rD3IY
	zGw==
X-Google-Smtp-Source: AGHT+IGWwBLEvimkzUQGQ+6a6AS7T1fRIlofnqD1LzuuuvVqr1b/zIjzTOQVerQA0BKJhk3Q69vR5NQVKu4=
X-Received: from pfbjw34.prod.google.com ([2002:a05:6a00:92a2:b0:730:5761:84af])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:9c99:b0:1f5:769a:a4c0
 with SMTP id adf61e73a8af0-20113c71809mr1061441637.22.1743795677060; Fri, 04
 Apr 2025 12:41:17 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri,  4 Apr 2025 12:39:07 -0700
In-Reply-To: <20250404193923.1413163-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250404193923.1413163-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250404193923.1413163-53-seanjc@google.com>
Subject: [PATCH 52/67] KVM: SVM: WARN if updating IRTE GA fields in IOMMU fails
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>
Cc: kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

WARN if updating GA information for an IRTE entry fails as modifying an
IRTE should only fail if KVM is buggy, e.g. has stale metadata, and
because returning an error that is always ignored is pointless.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 5544e8e88926..a932eba1f42c 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -842,9 +842,8 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 	return irq_set_vcpu_affinity(host_irq, NULL);
 }
 
-static inline int avic_update_iommu_vcpu_affinity(struct kvm_vcpu *vcpu, int cpu)
+static void avic_update_iommu_vcpu_affinity(struct kvm_vcpu *vcpu, int cpu)
 {
-	int ret = 0;
 	struct amd_svm_iommu_ir *ir;
 	struct vcpu_svm *svm = to_svm(vcpu);
 
@@ -855,12 +854,10 @@ static inline int avic_update_iommu_vcpu_affinity(struct kvm_vcpu *vcpu, int cpu
 	 * interrupt remapping table entry targeting this vcpu.
 	 */
 	if (list_empty(&svm->ir_list))
-		return 0;
+		return;
 
 	list_for_each_entry(ir, &svm->ir_list, node)
-		ret = amd_iommu_update_ga(cpu, ir->data);
-
-	return ret;
+		WARN_ON_ONCE(amd_iommu_update_ga(cpu, ir->data));
 }
 
 void avic_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
-- 
2.49.0.504.g3bcea36a83-goog

