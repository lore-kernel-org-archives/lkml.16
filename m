Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C26B21CA17
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 16:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743524292; cv=none; b=VmGg3tNUCpRl7QREojYDLaaXKEBJb6CMlvpFd80MYCEwHQHHN7Sz/Ld4ZOPj+8VYA5U9Oepynw4VYNVtb9plqu7iTIhlcLjF1LlGjVSK6fxs6bqJZfC9kRj5pVLlOAsXJ1+SnhcdlIFWzHsnGrfV8/JD4W1ZpX8VEGwAtiuWdfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743524292; c=relaxed/simple;
	bh=ZlxjQIsKWBnCn4azAPaeZp9DWgj/64K0rqQe0dmeggs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hU0Bm1K7la2NQZGNW50fnLsw0gNfIfuJNOUmE1M/OcvPRdchNIC15+zFqGbVPyA+sD9iCUoInAg+KCUpbiBivM7xWf+g84HfAbAiEyYJhW9RXUHUEyBJwgrVGPrc6qVQKql2MuDAQw8C403NAAlO8LidrCNwLCahpYodd0VjLio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ecIcKzhu; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ecIcKzhu"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-22647ff3cf5so93354935ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 09:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743524289; x=1744129089; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=bqWYbif5v+Yux+dM7N5z+opj8vbiyTpqkOl2VaFaASM=;
        b=ecIcKzhuHkx8Y8993aWfZyVZeVHbR5WfCSOWJWb2Tj2Qw+sAu3TDQQJmSH3bSZsO+T
         lq4SF+cFmcvZwoDZ/CllHj+uLyPytkesMLm0+fT8A2QhMOax0olEG/0lApy8ypWsDPWb
         JpQqc7Q5TSUCeTne3PwnUk8kphlivvrQvGAe83pOwn0drMkOI6Dz5zbVs5MTvaCXyCQU
         jZWs1qQuTHtwCpdbK5t3cEUbkxoICEMa6GUZ865oNbKkjARyJb62Ji+OpyGV8WNMtmEz
         fA/+cYVEY2Ia3erb93znXH3Ppr+aWBo+otq54+WMaLDkiaGXfNkjCAAzfgsSYcttNIjN
         Ur9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743524289; x=1744129089;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bqWYbif5v+Yux+dM7N5z+opj8vbiyTpqkOl2VaFaASM=;
        b=OgyOcJA1SyF/Pf3xxrhoLm3iv8aS9n9uBt6JXOodxNI7r3sm07efKxs1ZoL8ym4BOw
         wlS6RPEunAE6XterGpK+/JRRVYRU0Z6aeW7cWJEYsARZGrUXLwSIxEXD/kzbieLNDZ1I
         fRzKxRVTM1h7hqsPYBpMR0Pi2Gc7a4WdR/xSgDpxASyUeafIM5nLpJ6QD3tt8mFUrWHG
         OZ1KwZZh8H3hV3AeiijkLw3fNlpJCP5RcGgs53ZpL5/Gb3mgr+5SgzLcVizP+ytsbW55
         UQtSezD61o7QTMAKgpTKk7KYxSUraUTXSdXRuqfwSakFQQS+XcWgEloKMJOvT4ZwLtiT
         wBMw==
X-Forwarded-Encrypted: i=1; AJvYcCWIdO6+521hXOdqC6VGawXu0Az8wRYELkE5oIadGl/ZWPc+YcBncnht4YYYMFmhOvIkJcTYt3CMwg/WT/0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBZCfg6Xo7W/29smnlbWDHX0sXdOIy8Kc419XDkHa4S8ReMOrz
	M0ghOKtdlrZcyecrg4HSWusuTumVXcrvwBPFYuEwdiGLLyqqlE/P6MzA/rC16ScR2Z+G6n6rkke
	wMQ==
X-Google-Smtp-Source: AGHT+IFBjQl9T5sWawUBkQ+04s8CWsMBMWzhJzaFZdNq/LILgQj/lKKMYLjUW8g9R/4M43HyO/qeuo/exXs=
X-Received: from pfgt25.prod.google.com ([2002:a05:6a00:1399:b0:736:4ad6:1803])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4609:b0:736:46b4:beef
 with SMTP id d2e1a72fcca58-73980350385mr18816589b3a.3.1743524289597; Tue, 01
 Apr 2025 09:18:09 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue,  1 Apr 2025 09:18:03 -0700
In-Reply-To: <20250401161804.842968-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250401161804.842968-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250401161804.842968-3-seanjc@google.com>
Subject: [PATCH v3 2/3] KVM: SVM: Don't update IRTEs if APICv/AVIC is disabled
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

Skip IRTE updates if AVIC is disabled/unsupported, as forcing the IRTE
into remapped mode (kvm_vcpu_apicv_active() will never be true) is
unnecessary and wasteful.  The IOMMU driver is responsible for putting
IRTEs into remapped mode when an IRQ is allocated by a device, long before
that device is assigned to a VM.  I.e. the kernel as a whole has major
issues if the IRTE isn't already in remapped mode.

Opportunsitically kvm_arch_has_irq_bypass() to query for APICv/AVIC, so
so that all checks in KVM x86 incorporate the same information.

Cc: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Jim Mattson <jmattson@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 65fd245a9953..901d8d2dc169 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -898,8 +898,7 @@ int avic_pi_update_irte(struct kvm *kvm, unsigned int host_irq,
 	struct kvm_irq_routing_table *irq_rt;
 	int idx, ret = 0;
 
-	if (!kvm_arch_has_assigned_device(kvm) ||
-	    !irq_remapping_cap(IRQ_POSTING_CAP))
+	if (!kvm_arch_has_assigned_device(kvm) || !kvm_arch_has_irq_bypass())
 		return 0;
 
 	pr_debug("SVM: %s: host_irq=%#x, guest_irq=%#x, set=%#x\n",
-- 
2.49.0.472.ge94155a9ec-goog

