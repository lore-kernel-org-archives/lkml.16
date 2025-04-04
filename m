Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D3E24A04F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 19:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743795688; cv=none; b=nnas11avamMR0rb+iXeX/lM426Bwh/5ivRa2pGbsJ0U3NwuyuwbHvo4TD8dcQgdq0FMi5RsV4cEzjQ3ieYLJzfP7bBa0DGL4gJAaCwTI594Egl4sPLNw9qfJY4oDkE75jtrJiA0wxHF4eZCMYTEIU/hqc3NtmuSJPYUJfe5E5K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743795688; c=relaxed/simple;
	bh=oILWHlZoymAyC2X3yedwJsSZpaT6PkdFe55df8DN2A8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PNnrcsvP1wJRQ5WONtCRnVIIEC5jhue6VWYBLWgsPkh2CfB4qFuWuQXFr6S6mUkk/KfazY7TTn3VFGrvMU9Bs+KZ/q1cbUaps9BgTUjw9UR/AIIxaFInbwNejpZlVteYa3ZPJRSXVdeG4aRIBtJs8bnk7TKaTqppLkxsRZGcRJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N6vMQf7Q; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N6vMQf7Q"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2254bdd4982so34883475ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 12:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743795687; x=1744400487; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=tpUGu5WACeQY+DXaIgbcGZ/fnmY4/g2Rj2L2cuTjvC4=;
        b=N6vMQf7QHggN6Cyrqc0cLgrW3AiYuo5pLuNmm9hDNe4D9ctk1c5e0vFhRmqCdgj40Z
         8LhMwJ3ZT/eztpCXhBBCaeT9EfnJVvbFqpAXG/a1p19LPWntBT9qTwAJOVNFH8KsMwPL
         R1a7nCdUupH9jz4J8Fiygs1BNZb4daEr4MfgjGII46vXivbJ/NaRpL9crbH9uyIfCI07
         aN5qk0l97tXAGAyvpYmVq3YlbFjwwAMusuYUIaF2rxI4Fd0EpA9Hpr/xUHG05qBOcA9q
         c0B/hjRQXBmJHPtoFqHyNbLDYoRzd4fnS90+va4it3MmYK4BwSd+oZ84G9bsjc6vLu6E
         uHRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743795687; x=1744400487;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tpUGu5WACeQY+DXaIgbcGZ/fnmY4/g2Rj2L2cuTjvC4=;
        b=thWy6k2e3Pt0UbZJuUsMFofADZuAxeQVbeb3Qda+dLae6VEeaWn5ZYJ8It6CRda8kj
         I2aKdXMvLGiHnyN61zy9LRoLOP5RgLfu4CZ06jw+bmpRUflo9YAcliBDBIiadUAalvNH
         rfWoX5uLU/3b0HL5CDRlA8LNU+k+5XDdd9jT1RoA/fKMxjnSH3tbPgPIqk1DOp+5gPOa
         ttSemCC0vEXO7zKDns+EMFNdAAD8lPALtWIaAItlE1m9gX+lLdpOQbmPq1HeNNuMz8Hh
         mQBE4Md+x4n+q+v1GFxxLqg03WyCHyBulRIQ9thxAU/ZRjCzv8jBaYpJ4WFng7ZkVCbO
         FFPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOpMVk2k/r43xv/MZnOJquh2BR1OVIcTwfg4WeY1ues3iuur2UYSpa3t6Yl11XkkhCMlone6rZakLoXfc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzS13cC/q2MGtfVZu4kF11OHPoDq0Iv/BvlSZuwxr0sqxUS/Wof
	t2ptAlv3GVjLqVXroGMqis39xe1nX+zV6ehn3JL81ZIHJ+RUn0Z5UDplQp+mk+kHUUMOloMRtS6
	j+Q==
X-Google-Smtp-Source: AGHT+IGWIJW5oXdpll4D4kyUc6CqYVXv1H9LdsgiZOQiFY8S/63oNQDk+1VKkmtwRbHnjm+dtN9Wq0qn+Vk=
X-Received: from plbkx14.prod.google.com ([2002:a17:902:f94e:b0:223:f59e:ae50])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d589:b0:224:76f:9e44
 with SMTP id d9443c01a7336-22a954f9e33mr7330205ad.8.1743795686999; Fri, 04
 Apr 2025 12:41:26 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri,  4 Apr 2025 12:39:13 -0700
In-Reply-To: <20250404193923.1413163-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250404193923.1413163-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250404193923.1413163-59-seanjc@google.com>
Subject: [PATCH 58/67] KVM: VMX: WARN if VT-d Posted IRQs aren't possible when
 starting IRQ bypass
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>
Cc: kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

WARN if KVM attempts to "start" IRQ bypass when VT-d Posted IRQs are
disabled, to make it obvious that the logic is a sanity check, and so that
a bug related to nr_possible_bypass_irqs is more like to cause noisy
failures, e.g. so that KVM doesn't silently fail to wake blocking vCPUs.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/posted_intr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
index 457a5b21c9d3..29804dfa826c 100644
--- a/arch/x86/kvm/vmx/posted_intr.c
+++ b/arch/x86/kvm/vmx/posted_intr.c
@@ -262,7 +262,7 @@ bool pi_has_pending_interrupt(struct kvm_vcpu *vcpu)
  */
 void vmx_pi_start_bypass(struct kvm *kvm)
 {
-	if (!kvm_arch_has_irq_bypass())
+	if (WARN_ON_ONCE(!vmx_can_use_vtd_pi(kvm)))
 		return;
 
 	kvm_make_all_cpus_request(kvm, KVM_REQ_UNBLOCK);
-- 
2.49.0.504.g3bcea36a83-goog

