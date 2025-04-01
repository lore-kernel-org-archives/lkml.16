Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994B9213230
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 16:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743525807; cv=none; b=P30ZQ37J2unvT4dRPJiSxzEWQmJJ4jhHD73XayBi9nz2OFyCbmTp1+PraDHgO8v6a4Z8nBe+2SVw/ZVW25Ts/aXjQfjyo66d9FalveA1QCAR2+1UjYmpyMLUQ93qfomXZAfH3uvrBCWpBP1Pt+ovt+qUJ6Eq9e6IfgcBIkHzmrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743525807; c=relaxed/simple;
	bh=5iq6Ej0JukMZOt4v5A++8d64xSPyqQ5v5er7/1iuZW4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Wa3Jo+vUt0GU1ipq2PO9quXzc1i/qTqMHRZbrdMMQZHU6R/xHvavAmLqtCaCQp2HwGNH9n74F9fYVYmL/cOgkJCADK5KhiCR5Vvq7cjXw9OQ2mlpYUnDgczZ0Y3EyPJZjBalZHlySbili5tO5V8r6lmaeyswL+KLbEg9ZJkjjWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IB82jXoQ; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IB82jXoQ"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2255ae39f8fso276975ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 09:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743525802; x=1744130602; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=/XYYrhooXHNQcqBoobC7D5bK0XS2jFQGb7UC9bcI9h8=;
        b=IB82jXoQ/BkQnpCN7Rnwso7yq0sh9Olsv/ISZOjrxCNXY38HN21itGuR8GTyHGf5QT
         elKTjYZKc0bXe7hovNqFTEKchRz5UlBPzDilS+eSSz4Ek6pGZ+j8pDbPHD7rU/xm2IOp
         FfFptLjn4aizDgbDhMESnlL8jF+KDt0ecpZnxYvi9AzUzt1XMMX/5oSc/UHa2owTPg/g
         9jVjaJFdqd1DB7wZJHIg3/bY5u1INOUwXBLOlX+j7yuXxFNWOfK8uj53110xYeHxDJ+w
         iyv0WPoY+M0BnIZRVGN1LSrtD9FctfBHdKZXyOhcomhuWmiWK6wC7DhjuD5O94ELMmIY
         qjyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743525802; x=1744130602;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/XYYrhooXHNQcqBoobC7D5bK0XS2jFQGb7UC9bcI9h8=;
        b=D2ji8HemsJ/+jv/jsK4wmYIg9IvMfs4vCfZY+fYHIEYrAndeLIMROPd5h5H7/zgBGi
         RRPq/+KaJmhORj0mznWSP+YI74/q6jeMUSSrF28Ky9nMWETUKckkUhUtmFxYwfAQGXZo
         p9Jmiw3Cw5IzjsDyP8kk94JAW7h2r3CxTYSAD+hcyzKf46ezSQQdODSlqKnBpYRkcmdH
         FmqoEi87Z4EEqGpMFtYXzFzCsCSRVqjyMKK131vHcxj8sR67pyE4nuGJ33WiCnjv2LXw
         Ml5wz2vq5P7j4WddqHFJ+eSaXym1H4t1/At6HzjxiVcbk+CcIRVpKD120+zfaqzmPhkv
         NbBg==
X-Gm-Message-State: AOJu0YyubQf35cp88tW9YP2mJAcoeAnNdYeTNOidRaa13TdGxkw961Zo
	lGzTvsgNfBypcqYcJrtZ4yG7uQZkvrXzF4SrcdmKk3NOfMHaU87f+wxIWDYqKiNmWUAKnrr0/31
	RKw==
X-Google-Smtp-Source: AGHT+IFy0IhgEaHcg00977nQlGMuEOMnb3oYwKlOFTc/u3M4G7iMNsSXATt5UTOpWjp44DoW3ZbtcVNrt4s=
X-Received: from pfbfo6.prod.google.com ([2002:a05:6a00:6006:b0:736:3cd5:ba36])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:8186:b0:736:b400:b58f
 with SMTP id d2e1a72fcca58-739c3f771bcmr873231b3a.0.1743525801845; Tue, 01
 Apr 2025 09:43:21 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue,  1 Apr 2025 09:34:44 -0700
In-Reply-To: <20250401163447.846608-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250401163447.846608-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250401163447.846608-6-seanjc@google.com>
Subject: [PATCH v2 5/8] KVM: VMX: Process PIR using 64-bit accesses on 64-bit kernels
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

Process the PIR at the natural kernel width, i.e. in 64-bit chunks on
64-bit kernels, so that the worst case of having a posted IRQ in each
chunk of the vIRR only requires 4 loads and xchgs from/to the PIR, not 8.

Deliberately use a "continue" to skip empty entries so that the code is a
carbon copy of handle_pending_pir(), in anticipation of deduplicating KVM
and posted MSI logic.

Suggested-by: Jim Mattson <jmattson@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/lapic.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
index 893e7d06e0e6..e4f182ee9340 100644
--- a/arch/x86/kvm/lapic.c
+++ b/arch/x86/kvm/lapic.c
@@ -657,26 +657,32 @@ static u8 count_vectors(void *bitmap)
 
 bool __kvm_apic_update_irr(unsigned long *pir, void *regs, int *max_irr)
 {
-	u32 *__pir = (void *)pir;
+	unsigned long pir_vals[NR_PIR_WORDS];
+	u32 *__pir = (void *)pir_vals;
 	u32 i, vec;
-	u32 pir_val, irr_val, prev_irr_val;
+	u32 irr_val, prev_irr_val;
 	int max_updated_irr;
 
 	max_updated_irr = -1;
 	*max_irr = -1;
 
+	for (i = 0; i < NR_PIR_WORDS; i++) {
+		pir_vals[i] = READ_ONCE(pir[i]);
+		if (!pir_vals[i])
+			continue;
+
+		pir_vals[i] = xchg(&pir[i], 0);
+	}
+
 	for (i = vec = 0; i <= 7; i++, vec += 32) {
 		u32 *p_irr = (u32 *)(regs + APIC_IRR + i * 0x10);
 
 		irr_val = READ_ONCE(*p_irr);
-		pir_val = READ_ONCE(__pir[i]);
-
-		if (pir_val) {
-			pir_val = xchg(&__pir[i], 0);
 
+		if (__pir[i]) {
 			prev_irr_val = irr_val;
 			do {
-				irr_val = prev_irr_val | pir_val;
+				irr_val = prev_irr_val | __pir[i];
 			} while (prev_irr_val != irr_val &&
 				 !try_cmpxchg(p_irr, &prev_irr_val, irr_val));
 
-- 
2.49.0.472.ge94155a9ec-goog

