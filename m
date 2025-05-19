Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C01A21FF51
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 23:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747697301; cv=none; b=FYF5YxYLBl5LaN3uiP19/lOUxYNFk/xRpRDJCIIFNpmrQORKu6ubLN/cM0q/0bDw2BCPMB2XYqyuAiAPZThAEkQDJhUJ8t4UrYMomXo8eaEzwA/VmQiY8YB6YsI9xJ4FyrqaFwwAujdzH2jjQ61epQvfnG7cGDQnU0mhBY4zv6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747697301; c=relaxed/simple;
	bh=Rqx4tIOwuvzIkuS+hhvK3QTqXtDusXXoDiyTkrhAXM0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hhpPVF8rRzvLZOAqCr7ROkl1Y5w5AHPdljv85Ao/ICS45zLQU7bKJ31Ow1geJckusTz+9QB7IrjkWVF9O38j9YKKG2f5CQM2f6oHcNu2tdhX9ubaoCUXiXAq5YIlaX7wS1+qTVpPN/kTiLeHzS/4i/GvxyzBsjW89yJ9078MjCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=istqz/YY; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="istqz/YY"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-30ed0017688so1803583a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747697299; x=1748302099; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=AbLQPh1fsq8VOWBYp78JIFNrZ7hflbSEfHvBODcXQ5s=;
        b=istqz/YYvjPBBl18Q7oAl0KF9Ld3jvAevn3xWrXCUzfZK7qRzGkP9eBH/ieNSFjwS2
         sC670djpR1q+Q8dICjW7IZaodfQplLJ/cqNMOHoIKtH8BMhVau72PQtdczSk7ydNXSDw
         boV16c4jKbhn2jkPYRVNKRQzeo+Op+mDRGFEUthH4nsUMlb843CbNJE649ql0kkQcuuL
         I6v2MbD2ZzlROtbOySeBCJmcBD1FAwlWJfQncTjziBrNPEMw0IGobPRjf8x4e0V7HgU8
         TC6mHUa5h9sVkYJ3hQLAwMfzOly/a5jKIsTJinq8NrlTYkBIJDCJv9ozZOG31K+nyJcT
         OGdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747697299; x=1748302099;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AbLQPh1fsq8VOWBYp78JIFNrZ7hflbSEfHvBODcXQ5s=;
        b=PfYLiItz56lyvoUpORl1Wapjjr2VaNVLdyQs1S0WLGv/do0tIukutmyub7BYEx0NrL
         hXoxaDHwQu2+WhVZetH3UxK3Z9EtXhbiTNDSKRVt02U5kA21gOZ6dZaqXViPYlrpQbBU
         GIdrqVQcsR9zF9zvWkMlc7AlOqBh1GpxE8WeoMmprCScJXjm1ycaZ+oEb/W839DjB1RU
         Sykr2M7rrNVGlAnJQ16NbGcln9NFfx82zVzkJIsodwmYC5ObygKIR0aS3wPUFYmzk07v
         va36lzUz8G46wK0nz7iO2WcaUa0wKCFrmBNnVJ5UbiQRru978k5/vzwI8damNfvaF/Zz
         hIxg==
X-Forwarded-Encrypted: i=1; AJvYcCWGwdLapVCUqueHCdv8kQRvsnEX92eFN9qBmOZVIra2Ny+/QRpIMkCxp7p3jH45ySEG8yKqVHPwcxt2shE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdFtz2TfbEs8HmZ+ATT3qgi63anKRw6XTMJGtkT6mmzQuiRFwF
	ywUQS9Mge1G3etvN2c3k+bnnmyx3EQe3zSU9oPAPGzZgvj2gIRccBSkVf4cc9NY4u+/xk8TZMhh
	bC9co5g==
X-Google-Smtp-Source: AGHT+IELa/OBaU4oS5x4ZbaidUXv9+BLCZojuJzU3EtQI6qSLxAolguOuiFMHAGXuQ+SyHn2BSZVs6zuCw8=
X-Received: from pjbtb12.prod.google.com ([2002:a17:90b:53cc:b0:2fc:13d6:b4cb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5251:b0:308:5273:4dee
 with SMTP id 98e67ed59e1d1-30e7d542b40mr21807019a91.15.1747697299584; Mon, 19
 May 2025 16:28:19 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Mon, 19 May 2025 16:27:56 -0700
In-Reply-To: <20250519232808.2745331-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250519232808.2745331-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250519232808.2745331-4-seanjc@google.com>
Subject: [PATCH 03/15] KVM: x86: Drop superfluous kvm_set_ioapic_irq() =>
 kvm_ioapic_set_irq() wrapper
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Drop the superfluous and confusing kvm_set_ioapic_irq() and instead wire
up ->set() directly to its final destination.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/ioapic.c   |  6 ++++--
 arch/x86/kvm/ioapic.h   |  5 +++--
 arch/x86/kvm/irq_comm.c | 11 +----------
 3 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/arch/x86/kvm/ioapic.c b/arch/x86/kvm/ioapic.c
index 45dae2d5d2f1..8c8a8062eb19 100644
--- a/arch/x86/kvm/ioapic.c
+++ b/arch/x86/kvm/ioapic.c
@@ -479,9 +479,11 @@ static int ioapic_service(struct kvm_ioapic *ioapic, int irq, bool line_status)
 	return ret;
 }
 
-int kvm_ioapic_set_irq(struct kvm_ioapic *ioapic, int irq, int irq_source_id,
-		       int level, bool line_status)
+int kvm_ioapic_set_irq(struct kvm_kernel_irq_routing_entry *e, struct kvm *kvm,
+		       int irq_source_id, int level, bool line_status)
 {
+	struct kvm_ioapic *ioapic = kvm->arch.vioapic;
+	int irq = e->irqchip.pin;
 	int ret, irq_level;
 
 	BUG_ON(irq < 0 || irq >= IOAPIC_NUM_PINS);
diff --git a/arch/x86/kvm/ioapic.h b/arch/x86/kvm/ioapic.h
index aa8cb4ac0479..a86f59bbea44 100644
--- a/arch/x86/kvm/ioapic.h
+++ b/arch/x86/kvm/ioapic.h
@@ -111,8 +111,9 @@ void kvm_ioapic_update_eoi(struct kvm_vcpu *vcpu, int vector,
 			int trigger_mode);
 int kvm_ioapic_init(struct kvm *kvm);
 void kvm_ioapic_destroy(struct kvm *kvm);
-int kvm_ioapic_set_irq(struct kvm_ioapic *ioapic, int irq, int irq_source_id,
-		       int level, bool line_status);
+int kvm_ioapic_set_irq(struct kvm_kernel_irq_routing_entry *e, struct kvm *kvm,
+		       int irq_source_id, int level, bool line_status);
+
 void kvm_ioapic_clear_all(struct kvm_ioapic *ioapic, int irq_source_id);
 void kvm_get_ioapic(struct kvm *kvm, struct kvm_ioapic_state *state);
 void kvm_set_ioapic(struct kvm *kvm, struct kvm_ioapic_state *state);
diff --git a/arch/x86/kvm/irq_comm.c b/arch/x86/kvm/irq_comm.c
index 64f352e7bcb0..8dcb6a555902 100644
--- a/arch/x86/kvm/irq_comm.c
+++ b/arch/x86/kvm/irq_comm.c
@@ -27,15 +27,6 @@
 #include "x86.h"
 #include "xen.h"
 
-static int kvm_set_ioapic_irq(struct kvm_kernel_irq_routing_entry *e,
-			      struct kvm *kvm, int irq_source_id, int level,
-			      bool line_status)
-{
-	struct kvm_ioapic *ioapic = kvm->arch.vioapic;
-	return kvm_ioapic_set_irq(ioapic, e->irqchip.pin, irq_source_id, level,
-				line_status);
-}
-
 int kvm_irq_delivery_to_apic(struct kvm *kvm, struct kvm_lapic *src,
 		struct kvm_lapic_irq *irq, struct dest_map *dest_map)
 {
@@ -293,7 +284,7 @@ int kvm_set_routing_entry(struct kvm *kvm,
 		case KVM_IRQCHIP_IOAPIC:
 			if (ue->u.irqchip.pin >= KVM_IOAPIC_NUM_PINS)
 				return -EINVAL;
-			e->set = kvm_set_ioapic_irq;
+			e->set = kvm_ioapic_set_irq;
 			break;
 		default:
 			return -EINVAL;
-- 
2.49.0.1101.gccaa498523-goog

