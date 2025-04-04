Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C382459C8
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 19:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743795684; cv=none; b=EaERXFvgbNk4fuZ0TSbHIw+wLz5G2kbOmYNF4KMU7bC3E6FOwu6KDsXKZJTi6M/In8Bxt+ct+wSK2Hen34Ky7KU01am2TlJlpmhq2AW2ULh6DmtKkhUv0SpP5GPpR67cqLsjkWu+8psFvXraJoUtg0yvm10rBgWk1cqn9GrFsek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743795684; c=relaxed/simple;
	bh=O8Jtgnd04lzwalcRZpXtJREHuwR/9U8Wy9xXm5Q/t8M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ei3TSvpaXkbk3UuQKTP1mqwg1SEpWIVQGOq1i/cCYiS8rI99HViUqx0M+qGIjKaVhcxSxE7YDjqQQe31ayza7mpOO9QEJrOCyvAgfVQlZVnpEY1uuE8MJVVSqId5JnGlPvOPQS2QlegM/10DX9OGxi2cpezydmywCcIszByMXEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3aaVAhyB; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3aaVAhyB"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-896c1845cb9so2215505a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 12:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743795682; x=1744400482; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=5ipvbDW4TsHmSl/et8/oy0jhI2aY6XeoFvTlaXxC+Z0=;
        b=3aaVAhyBhj5FMhPX+gvUdAiyjviZ0HuyfmLV+BsodTGOsc69jlMB0AuqWL9aErd1fE
         hhQX9rBM6te4ZSzT0FLWQuLKEUQyQQSVL5Sw/0I2+XxRjKaeyAz/1/7TciN1OOR0/rSL
         nmFVlgagw4e3MR7ElU+puOMTNovtsl7vI7eQoEFXFGlcE4tVzxrcN7DUSgJk9lkwkZ1+
         5CJ71/n+C9XH9SwFXw9WmLzTOGxbcqbHDhW73oK/GBZHTx8OrXBumVebTE+NxUefQJmg
         7S38cwf0KWn14TfRfjsnfiMSqPCtVSstwigVY0vxNq0ke/PaRwz21j9bZjyQNjZYFKFC
         X2bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743795682; x=1744400482;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ipvbDW4TsHmSl/et8/oy0jhI2aY6XeoFvTlaXxC+Z0=;
        b=dAYhqYmUtSefcfIBiCRrDD62812Y9hl97gUAALs3Qi6i/rqnEh5ENukAUwD39uJPLt
         5af0Dmn4QJ5ZpXz+1NYM4na8qf1uD9dFHK/grgnDfPbpSdenJzG+CKmkKNkvdfc6LT7e
         rt1E1KvnKqJ/QzO6UScP4TeMXBesjDUEClS3c11+dZQDJwGkN8s3B9Wv5TiGLfgA84rV
         J+acWTaouAn1Li6Vbl1vH2T3rRHQ1NcNzW+2L3NxndfP/fZZ4GgHu1zYpeNZmEdRzBMB
         ZIaZDE8ZExmFjHrr0SNrtSSj8RgxK5uZKku+yYfUs35Ew/nXQRFc9QU6B+HuH6mSGVEL
         0ihw==
X-Forwarded-Encrypted: i=1; AJvYcCUu720dGUCOQqczxrf4IVauV0UZ9ougw93wrkPNlaL5nJIn137miOPcB/ca3RPHmnJY41LUEmRyJkHKklM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWvmU/kN8H7h+Gv7Bcdo+8cgLbOifcJ5pNrvlUk9FwiNT6defg
	tTzq6oBQYwJmGQkM+0nMaNxY8lYhM0+bJlCg4WSoeKoZKe+o100lUMc1JiX07pJ0GfoH0edGwk3
	9gA==
X-Google-Smtp-Source: AGHT+IF8vEX1BRq7iqbtezxSkX3cXerhUEkRR8Wpf5vTHNdIS8Aw+5Af2q/0JmJ4ODDazjlc49NfshTSImw=
X-Received: from pfbfb23.prod.google.com ([2002:a05:6a00:2d97:b0:736:47b8:9b89])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ef4d:b0:220:ff82:1c60
 with SMTP id d9443c01a7336-229765d1b70mr135066285ad.14.1743795682327; Fri, 04
 Apr 2025 12:41:22 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri,  4 Apr 2025 12:39:10 -0700
In-Reply-To: <20250404193923.1413163-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250404193923.1413163-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250404193923.1413163-56-seanjc@google.com>
Subject: [PATCH 55/67] KVM: x86: WARN if IRQ bypass routing is updated without
 in-kernel local APIC
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>
Cc: kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Yell if kvm_pi_update_irte() is reached without an in-kernel local APIC,
as kvm_arch_irqfd_allowed() should prevent attaching an irqfd and thus any
and all postable IRQs to an APIC-less VM.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index d05bffef88b7..49c3360eb4e8 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -13577,8 +13577,8 @@ static int kvm_pi_update_irte(struct kvm_kernel_irqfd *irqfd,
 	struct kvm_lapic_irq irq;
 	int r;
 
-	if (!irqchip_in_kernel(kvm) || WARN_ON_ONCE(!kvm_arch_has_irq_bypass()))
-		return 0;
+	if (WARN_ON_ONCE(!irqchip_in_kernel(kvm) || !kvm_arch_has_irq_bypass()))
+		return -EINVAL;
 
 	if (new && new->type == KVM_IRQ_ROUTING_MSI) {
 		kvm_set_msi_irq(kvm, new, &irq);
-- 
2.49.0.504.g3bcea36a83-goog

