Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E284C22E3E3
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 19:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743795649; cv=none; b=hEh8LSbaaeIsAsSReFm2gsL6Im8MEltK9aacQ1XSuzs9l2skoEQmAwKRqNYeGqZ3x6vOlY1f/0hUbfSLi5FtORirCAQz1hHmQH+uIV1Gvt/NvtFy8HQ2kNgeFr0WLSwZpPo3DooC3R6FJemUDNXIVBqi4i+Ft2MfxHiLG8YCWHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743795649; c=relaxed/simple;
	bh=IzCJp621ChpF3CQ8d6txaWCGos/Pxg81tWUUPEDnhso=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NC42kn7Egzeq3gy3ewYzDgSEo79tsEmucOSgdIMwPCbx4JNwlsnlVpy0SvU8mVzjT3nUy6yk0cgDwl5WeGDfQiHvGasnoGMzVA1FqDU8+9pp8kVYbLDG5WBejvf3R6rAlU00hf6xLzZiB5j8vOgEiim9stLzg5bYua1u6nyXosQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3xG6Nmqk; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3xG6Nmqk"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-736cb72efd5so2196455b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 12:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743795647; x=1744400447; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=KYDMvc/wv5loDVXS9Aa0v44uXiIbogLzadPCYMuhYAo=;
        b=3xG6Nmqk78M9AzuOJ84gJPfIrCZLuI66N1ff2VqpwIamutnGdCwQXFgchYlnOC4NpX
         j/+mtg6U7dSmjRMpnN69JGGe0v84VufjIrtxDhhIzoPzW4r5tLFLW3oOXqyuaSSekHJS
         fssa/owanQ9Ws/tZBt77rtURM1oCttbFMbMs7WO8HLlBUfSJELGJM8kBI43uH/rG0vPi
         AUHK4IAyhap4o0hrNazfGL9VW/fM9dqVH30Uy5UV4BuVmjfhla8TJ8Qv6QN/nN2UxzRI
         gvagR20jugrjFM0FGY6o/pRK1qQyaicNcTZPAbjcpjX0GEsQDdnWn3Eu6xJYXGgLam3h
         a3pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743795647; x=1744400447;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KYDMvc/wv5loDVXS9Aa0v44uXiIbogLzadPCYMuhYAo=;
        b=t7Y3iA1wMuYBB/erdRhuOpw7hCWuC6LsN6qCP6vlSpiUuIiFErKol53p+1zbrOkAqP
         nYh4sohxpdur1RiuiJznT+IZKF7u70wljiQT1e2aYTr5GlIDVqbOZA0GBGOFG8hpt5nx
         D+1nS6EXmbdf42AuRyLfnldNWtZ45rF3DHntAlRU0xku0ZKnOfHmZWpGe++16vvd9HDJ
         sVP9D28feRdt5EKJJYTWbozFIXzeiE78trCYPa9gJRYbaFrJ+YLwd+fHv0VKH8pYOk9E
         ScySF0wl5QlUr5C5IVldnWUdtPAnV4dH9n3+RT8+Vf9CpqHpv/TIcat5pDBJB6Kbf4OM
         b8yA==
X-Forwarded-Encrypted: i=1; AJvYcCVZ2hApaqA4iuR217JYKicIJZqNOKgTR0lfBBslOLPKx4V9R08PIGroPv6JzNWScp/jBNbLurlx3fGVYBM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaSxlQP8lL6MfdLg/ykvcNARCjVImObsliVOXgSEfQXblbtm+u
	zhgjHZnSExIV+hEQDIEMsdxNUg9Xt9wt60aQxbL5MbhVA6NlJDlaAIvE3k8ZY5ctIgiQ9JNaoe1
	Hkg==
X-Google-Smtp-Source: AGHT+IErXqsvd0WDpARxVffQQIxJmZ1gHBUNSi2cCsl6CNRLxY8uKCXZMQn+YonfMwuOH2OZCDTOEAintT4=
X-Received: from pfbay40.prod.google.com ([2002:a05:6a00:3028:b0:730:7b0c:592c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3102:b0:1f5:80eb:846d
 with SMTP id adf61e73a8af0-20107efed2bmr5565765637.10.1743795647339; Fri, 04
 Apr 2025 12:40:47 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri,  4 Apr 2025 12:38:50 -0700
In-Reply-To: <20250404193923.1413163-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250404193923.1413163-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250404193923.1413163-36-seanjc@google.com>
Subject: [PATCH 35/67] KVM: SVM: Clean up return handling in avic_pi_update_irte()
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>
Cc: kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Clean up the return paths for avic_pi_update_irte() now that the
refactoring dust has settled.

Opportunistically drop the pr_err() on IRTE update failures.  Logging that
a failure occurred without _any_ context is quite useless.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index dcfe908f5b98..4382ab2eaea6 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -817,8 +817,6 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 			struct kvm_kernel_irq_routing_entry *new,
 			struct kvm_vcpu *vcpu, u32 vector)
 {
-	int ret = 0;
-
 	/*
 	 * If the IRQ was affined to a different vCPU, remove the IRTE metadata
 	 * from the *previous* vCPU's list.
@@ -848,8 +846,11 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 			.is_guest_mode = true,
 			.vcpu_data = &vcpu_info,
 		};
+		int ret;
 
 		ret = irq_set_vcpu_affinity(host_irq, &pi);
+		if (ret)
+			return ret;
 
 		/**
 		 * Here, we successfully setting up vcpu affinity in
@@ -858,20 +859,9 @@ int avic_pi_update_irte(struct kvm_kernel_irqfd *irqfd, struct kvm *kvm,
 		 * we can reference to them directly when we update vcpu
 		 * scheduling information in IOMMU irte.
 		 */
-		if (!ret)
-			ret = svm_ir_list_add(to_svm(vcpu), irqfd, &pi);
-	} else {
-		ret = irq_set_vcpu_affinity(host_irq, NULL);
+		return svm_ir_list_add(to_svm(vcpu), irqfd, &pi);
 	}
-
-	if (ret < 0) {
-		pr_err("%s: failed to update PI IRTE\n", __func__);
-		goto out;
-	}
-
-	ret = 0;
-out:
-	return ret;
+	return irq_set_vcpu_affinity(host_irq, NULL);
 }
 
 static inline int
-- 
2.49.0.504.g3bcea36a83-goog

