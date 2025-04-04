Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B3F21D5B6
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 19:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743795601; cv=none; b=ayCiqL2O068LobUM92cy84jzGdzfbUK6wzFYvAP0aga6DtykXzdVdTOxES79L5aQd+jteTZFu2dBXi2GgvXY+56DKUMHY1fSDOEpn3KrUEF5Jfvwgisy87V+vt5wmCcrbFQQUei3a7tZCTrXvygy58slZ0IVRbMHJrDMUMlkcIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743795601; c=relaxed/simple;
	bh=yOm0l7runQh/bqd/+NGHUK/eIjFj2umaZ1UvQPY4G08=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RoTp9SFcR6YWrEDEquIUQHd640jbQuRP4YEq4KdLDbxyGfmJaf21ys384QOQdacR/R85VRWZ0L9ptxggv4td7H8MncCydFKX5FKLArBHFPZ0wI2Q30EETIVhqkJAhBT9loNbUyGFGLDPaO+AA6LePenXWhBUHcvFzVf5qcnXco4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d7OZnnuy; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d7OZnnuy"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-736cb72efd5so2195958b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 12:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743795599; x=1744400399; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ksKzicOEYbjGpeVOLeT0G0MNe2BKT96MICWw9wdEzS4=;
        b=d7OZnnuyLEPoirHra3BvFwZao73wMFB0i/1Mq+wBjhZTxLODaZIe0YVwG/sxt+RKky
         n/QXIDFQsJyLjBO12rGLABUN5UGzy7Xt0ZwKO2VvJgBKSBOERH9pXgu28n0d0EAtd+Cr
         PB69H7c84AcDo/ZZ96qFarFF22aJf+8gLUPgsFHTsFMfUwiOVOv3GjGNdDDHcCGZdtuj
         1H3oCP/Of1CbQba2hyjI2gUJlgJ80o3cRJIeyflTkYrBeMxPYOF5olwHGsApBNnFWUNP
         RGN5g1+cw9hbJL0Vy/2QmcHETI3wLGEnQA5CPwG5I2b3IyAm4uZD54NzEVE6BxO/gH7Y
         t05Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743795599; x=1744400399;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ksKzicOEYbjGpeVOLeT0G0MNe2BKT96MICWw9wdEzS4=;
        b=mw7YVpBNw701XxW+UvFAa2fvTgYFgv0cC2qOHjaIXGK9hCjNin0bdylOZQeY/7nrFc
         kCuxNirBAJTZX77TfETq/0z6G8Lko/ssRKmidMjp2wGcae97CzzZl1cvalkBPbQFdCkd
         9P6WMUSOo10lgju5wBC6ka0gkNkAJr24AeRenpxruOjaSGgS2zscyZkYdZH8WfAcbs9J
         4MjYi6BqxutbuOP5ODvuND5jpRHJqcFY7aDvqVRQsuqdB6V49qjy8WdLI0gzkOt4/Bdl
         UxcTVLm1NWYbZ9biilzojCUqssrKgimrJbuEzIrPyE6I5s4RpoEGRprH8zj455zrGCMo
         MH4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVJFpu0PNTrtnJbgNb75Yj30l/UJbz8gME/kc1hClDlfpWzKTpl4ZivFZTVFBrt7Z/48QE0XGjTpiYofiU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyT2SdEa2+V/g2mcPQwtJYgAdLhqczt4Ne0e4ESdqXemx5E7sOB
	Ac1FuzChuT4oncfth0TWpF8MYP1c9Ii6eKa+2El9FnHAn/NloKyFa1Frmk2AmdMbdDHztwgVEq4
	GRw==
X-Google-Smtp-Source: AGHT+IHgQd8TSnrl1N62387tBCrXt8b1iTBjftjzhSHwCWE5Yo+RGmXWAwjPpFA1Fbz5oNevpz0/JHGX4zg=
X-Received: from pfax3.prod.google.com ([2002:aa7:9183:0:b0:736:47b8:9b88])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2e9d:b0:736:5f75:4a3b
 with SMTP id d2e1a72fcca58-739e6fdb4bemr5249939b3a.7.1743795598917; Fri, 04
 Apr 2025 12:39:58 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri,  4 Apr 2025 12:38:22 -0700
In-Reply-To: <20250404193923.1413163-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250404193923.1413163-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250404193923.1413163-8-seanjc@google.com>
Subject: [PATCH 07/67] KVM: SVM: WARN if an invalid posted interrupt IRTE
 entry is added
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>
Cc: kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Now that the AMD IOMMU doesn't signal success incorrectly, WARN if KVM
attempts to track an AMD IRTE entry without metadata.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index ef08356fdb1c..1708ea55125a 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -796,12 +796,15 @@ static int svm_ir_list_add(struct vcpu_svm *svm, struct amd_iommu_pi_data *pi)
 	struct amd_svm_iommu_ir *ir;
 	u64 entry;
 
+	if (WARN_ON_ONCE(!pi->ir_data))
+		return -EINVAL;
+
 	/**
 	 * In some cases, the existing irte is updated and re-set,
 	 * so we need to check here if it's already been * added
 	 * to the ir_list.
 	 */
-	if (pi->ir_data && (pi->prev_ga_tag != 0)) {
+	if (pi->prev_ga_tag) {
 		struct kvm *kvm = svm->vcpu.kvm;
 		u32 vcpu_id = AVIC_GATAG_TO_VCPUID(pi->prev_ga_tag);
 		struct kvm_vcpu *prev_vcpu = kvm_get_vcpu_by_id(kvm, vcpu_id);
-- 
2.49.0.504.g3bcea36a83-goog

