Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EAB2D3A7C
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 01:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747962093; cv=none; b=gAmwtGX60Ea0GaBrV3c+qBkFdULS+CC6AOTjYHwooVlE7eaSOItJAiTAVVDgxVPGy6AuRgg0c7ReQIzzFJISG1zGz043PhLSe/XXwWYEY2tUC/hcmj2OWC4Qe1ozj8+JohjPLtlvAiQL/qZHur7RcJwcSJrR/wPovBfv+YjzrYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747962093; c=relaxed/simple;
	bh=6xj74XotH+Q4CRZUCiYbLA659UygnyGaE+O2rFb5mnw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VJzKrbIgfU83UE3sLQ06/AO5XvmElSwOBnqGDIXETH/DLuthPrhzvqrblVzLmhB0a7AqdH1Cjigb6Mu6hljphc50PnbPEfREu9dSq0D7X2FRnpi6gCVJJGtQtwwdOh3oVsx0slOkOzzrNoLkHnCXV4kA8XCkaHMGzRjtfNtYkPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ikIWNxSC; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ikIWNxSC"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-30e895056f0so9232013a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747962091; x=1748566891; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=SI8/xkDYLLYF6taZwnw26LAv3lyi2NrQBm7/9JBUNzc=;
        b=ikIWNxSCyR7jBiGL7zet5PLQEbHFWWeMwdZyifOl7uaY1L7f6f5ug+wSxYcwDZlvfp
         sjyNi0131OGVyEg0sIx4lD6IRVrVqPtSNgpRV4rYgA8AFZdkaUehV5+FCFlUqQ8lDtg6
         pz0aV8Ij8+4COfxFRwtzLN3o621Pkz6IafzSyl4UsZdNWrtnolH1ktRRcgPCambWF0Af
         y+Y9TeZQ1VM6ls9jGh41v/bAfHdpfrXWko71ZOz9mcC0JihFPYdRC9EeRmbXqDusGT5a
         0XdYL7WkHNzvyht6Q7EISyampl8lpecnkFcJE4d6BxJsC2XdhCfjlRdfNj31CkF+vd68
         G9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747962091; x=1748566891;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SI8/xkDYLLYF6taZwnw26LAv3lyi2NrQBm7/9JBUNzc=;
        b=o/n8MIsVuv2jcVvSR2ABCBxVlsrexLpx48Z5ETHE6b4/VCPN7dkIn2Fg+dtUZENOpb
         JVsOLtoAYy4vTSI/39jnT5BwnwNuWW1MJEQOPa7PSoZJIP0b50vkMr9P39JZWtf+7em9
         /6u/opBme8eZFFLpbWhdrEzAG9kQmWL6doJ69ivk76oAk9x+dZeu9dhVotK6yBDT6xHK
         6Xt9BZ01wLp5FOCaNvfqddHhuSrb5ufEle3fZgkD6WMmel4UNoiFe46s25Xqxdu6qEBN
         oGpx2roGhk4fOqUnltrx7s2oJ0vfSxoG8MZ3QwgGVB1bvFg/fMC7c/XiBrYQOiGZ6GBu
         3Fqw==
X-Forwarded-Encrypted: i=1; AJvYcCVRL8nZC/4Or7jKypDYrBfInsXq5BO43MiLz3ChRWrNNAf+6ZzYeHU88rScZHBE2pPo+9Ww0ERDKKMVFSg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0ooxJLczqw//LQ8BcjCanf/Q1j7Aukqt/cyvUijc9/CqXUgRm
	S2siG0cNhnSIoUW3rf0naU+JilRAr6C210tAXn6rbyOCVibkpEgDQr33P2MI1tBTLBENHyTsOQi
	Ax0ERvA==
X-Google-Smtp-Source: AGHT+IEfo9l+n8Wtly1vR+PcVTI5WpP1pj3psfcNyO0/y6H1bp5kCb0/Tv8svuMeGn96uoIkUHhB1SnsRmc=
X-Received: from pjbee16.prod.google.com ([2002:a17:90a:fc50:b0:2fa:15aa:4d1e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3147:b0:309:cf0b:cb37
 with SMTP id 98e67ed59e1d1-310e96b615bmr1979932a91.7.1747962091171; Thu, 22
 May 2025 18:01:31 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 May 2025 17:59:53 -0700
In-Reply-To: <20250523010004.3240643-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250523010004.3240643-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250523010004.3240643-49-seanjc@google.com>
Subject: [PATCH v2 48/59] KVM: x86: WARN if IRQ bypass isn't supported in kvm_pi_update_irte()
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>
Cc: kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sairaj Kodilkar <sarunkod@amd.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	Francesco Lavra <francescolavra.fl@gmail.com>, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

WARN if kvm_pi_update_irte() is reached without IRQ bypass support, as the
code is only reachable if the VM already has an IRQ bypass producer (see
kvm_irq_routing_update()), or from kvm_arch_irq_bypass_{add,del}_producer(),
which, stating the obvious, are called if and only if KVM enables its IRQ
bypass hooks.

Cc: David Matlack <dmatlack@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/irq.c b/arch/x86/kvm/irq.c
index 904aac4d5e08..af766130b650 100644
--- a/arch/x86/kvm/irq.c
+++ b/arch/x86/kvm/irq.c
@@ -517,7 +517,7 @@ static int kvm_pi_update_irte(struct kvm_kernel_irqfd *irqfd,
 	struct kvm_lapic_irq irq;
 	int r;
 
-	if (!irqchip_in_kernel(kvm) || !kvm_arch_has_irq_bypass())
+	if (!irqchip_in_kernel(kvm) || WARN_ON_ONCE(!kvm_arch_has_irq_bypass()))
 		return 0;
 
 	if (entry && entry->type == KVM_IRQ_ROUTING_MSI) {
-- 
2.49.0.1151.ga128411c76-goog

