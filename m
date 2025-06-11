Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C2A246BB3
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 21:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749677765; cv=none; b=cSWwf+LCzgqsvHkdKbWmjGtM+7P3SwfBoFJeWV8Z2B+x9NJiabTPht+7gkJpmNBXsyHV/xJsK3MkMXi2Sb2gC5ivyxLTsLfmysG2gOxMTR598pIPE3lG8G9Z6RkqgWtVR+ULoXNn7YNkQSjRLqWCSLfL1hq5T6NfnZOFLTHNx+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749677765; c=relaxed/simple;
	bh=iBgu8VQrFAzBzHjOcFJGyC7B0S/jSUUo1LM+MQoNfPo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gb1Jd+8at2+EWqkRmmc+fPoTRq5fvtdwET5TaYEfafKAqMCZLzo+a/cUbz8+EAW+chtGPchPO6Ok87mjsJaWd4FHoazf6oDTKFAI4xAzlKyB8lBeS52uJFRnDRd16LUE+jM67rTV2qNvIOiG41Q/zJ8UiGkhE46GvHyoiyZ5yms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bozHI0NS; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bozHI0NS"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b2c37558eccso124451a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749677763; x=1750282563; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=2JaUG+lAMcEA3STa8zY9dDuT6d/UMMtmtelCk9MZjcw=;
        b=bozHI0NSX7/RSLUMOQA5Oh3vkXtbuJXg9lDsHhbXDG5ZRHB3WRN0oZUt28B8GNg4Ka
         0/na232365C8YsgQrRcDfM4BTe+4YXpWQEbYg6Q7ArXhcBZ7Vv9CLgQSVUmdr7GfTr3t
         f8aaEq4UKV9DSqMaS6ETvrcES1J7rMxSVXGrhO1DljvQp7VjosaQuuSRTQrbi4HIcXOR
         Jk+T5txYtZ9q5MXlpAhDKRWZfGtQgRboRb9KRqEvR4lmjdvb7TUfwrqmeVXwz9UDYhp8
         KWNsQKzNBmmaLGfljNag4amrQumj8wLYdOcjSlxV5v9CDbwoStbIG6yjuz2FraKjoLob
         5+HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749677763; x=1750282563;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2JaUG+lAMcEA3STa8zY9dDuT6d/UMMtmtelCk9MZjcw=;
        b=qejzSdlkMwkWYA69yW4oMGp66o67Y/YLuCQSgjJc5nrJxxzDmZWYTyHPx0FBIMXx2/
         lre+gn3ef8JZCiXYdP9Z7pbaPu3UWsacxf5PWGexwiBYs+p/g/E+s/P512sK4UQ3gh+F
         WY6xmsvQnOMSST6ZlkmcHfcX3DrydHbDe6lnFtjeHUK1AagfVo1ACXAc6ww8oz+N9rRI
         dy8yqu9556TM7ZTLlWXic581GIgBD+oaC9Bm/U27NzJKPMXyVafzCXzvN7VCT907H7s2
         E9OTFtN+xSRX9utIITuxkLJNZQBKN5Q8l8TF3udDUi+qvFsF+Bv3btmNfGG+MBagpiph
         4drw==
X-Forwarded-Encrypted: i=1; AJvYcCXcAhBtOg7N2KUgiyxecG3mR7TXTqZeQ3cgvyaWS10zFPJgQ/uiRXbaD4XmsjzkicJrUmvx+eE7I4UsO+U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqg8gaYETIpC8BT7mCvOHUk3mIQ6rULAqL5ygDerwYpAWunKP7
	XBRvGrIwj6tp9hg8ohQ1yBiRAb5yi8fZxb2MB3OVwBEmREWoCukDum2cJ4v5Kt8wKUkb8XqKJId
	fRUEHeQ==
X-Google-Smtp-Source: AGHT+IG6B6kgW6H0pxkQD+dVPNuTQyDl6CJ46+89mkFbuv65EfOtjJWPPwjiEK+h36aAz0qlZaANfNlZVDc=
X-Received: from pjbdb8.prod.google.com ([2002:a17:90a:d648:b0:30c:4b1f:78ca])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a4f:b0:311:f99e:7f4e
 with SMTP id 98e67ed59e1d1-313af1abc88mr7672525a91.16.1749677763697; Wed, 11
 Jun 2025 14:36:03 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 11 Jun 2025 14:35:41 -0700
In-Reply-To: <20250611213557.294358-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611213557.294358-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611213557.294358-3-seanjc@google.com>
Subject: [PATCH v2 02/18] KVM: x86: Drop superfluous kvm_set_pic_irq() =>
 kvm_pic_set_irq() wrapper
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kai Huang <kai.huang@intel.com>
Content-Type: text/plain; charset="UTF-8"

Drop the superfluous and confusing kvm_set_pic_irq() => kvm_pic_set_irq()
wrapper, and instead wire up ->set() directly to its final destination.

Opportunistically move the declaration kvm_pic_set_irq() to irq.h to
start gathering more of the in-kernel APIC/IO-APIC logic in irq.{c,h}.

No functional change intended.

Acked-by: Kai Huang <kai.huang@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h |  1 -
 arch/x86/kvm/i8259.c            |  5 ++++-
 arch/x86/kvm/irq.h              |  2 ++
 arch/x86/kvm/irq_comm.c         | 10 +---------
 4 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 330cdcbed1a6..f25ec3ec5ce4 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -2208,7 +2208,6 @@ static inline int __kvm_irq_line_state(unsigned long *irq_state,
 	return !!(*irq_state);
 }
 
-int kvm_pic_set_irq(struct kvm_pic *pic, int irq, int irq_source_id, int level);
 void kvm_pic_clear_all(struct kvm_pic *pic, int irq_source_id);
 
 void kvm_inject_nmi(struct kvm_vcpu *vcpu);
diff --git a/arch/x86/kvm/i8259.c b/arch/x86/kvm/i8259.c
index a8fb19940975..0150aec4f523 100644
--- a/arch/x86/kvm/i8259.c
+++ b/arch/x86/kvm/i8259.c
@@ -185,8 +185,11 @@ void kvm_pic_update_irq(struct kvm_pic *s)
 	pic_unlock(s);
 }
 
-int kvm_pic_set_irq(struct kvm_pic *s, int irq, int irq_source_id, int level)
+int kvm_pic_set_irq(struct kvm_kernel_irq_routing_entry *e, struct kvm *kvm,
+		    int irq_source_id, int level, bool line_status)
 {
+	struct kvm_pic *s = kvm->arch.vpic;
+	int irq = e->irqchip.pin;
 	int ret, irq_level;
 
 	BUG_ON(irq < 0 || irq >= PIC_NUM_PINS);
diff --git a/arch/x86/kvm/irq.h b/arch/x86/kvm/irq.h
index 76d46b2f41dd..33dd5666b656 100644
--- a/arch/x86/kvm/irq.h
+++ b/arch/x86/kvm/irq.h
@@ -63,6 +63,8 @@ int kvm_pic_init(struct kvm *kvm);
 void kvm_pic_destroy(struct kvm *kvm);
 int kvm_pic_read_irq(struct kvm *kvm);
 void kvm_pic_update_irq(struct kvm_pic *s);
+int kvm_pic_set_irq(struct kvm_kernel_irq_routing_entry *e, struct kvm *kvm,
+		    int irq_source_id, int level, bool line_status);
 
 static inline int irqchip_split(struct kvm *kvm)
 {
diff --git a/arch/x86/kvm/irq_comm.c b/arch/x86/kvm/irq_comm.c
index e2ae62ff9cc2..64f352e7bcb0 100644
--- a/arch/x86/kvm/irq_comm.c
+++ b/arch/x86/kvm/irq_comm.c
@@ -27,14 +27,6 @@
 #include "x86.h"
 #include "xen.h"
 
-static int kvm_set_pic_irq(struct kvm_kernel_irq_routing_entry *e,
-			   struct kvm *kvm, int irq_source_id, int level,
-			   bool line_status)
-{
-	struct kvm_pic *pic = kvm->arch.vpic;
-	return kvm_pic_set_irq(pic, e->irqchip.pin, irq_source_id, level);
-}
-
 static int kvm_set_ioapic_irq(struct kvm_kernel_irq_routing_entry *e,
 			      struct kvm *kvm, int irq_source_id, int level,
 			      bool line_status)
@@ -296,7 +288,7 @@ int kvm_set_routing_entry(struct kvm *kvm,
 		case KVM_IRQCHIP_PIC_MASTER:
 			if (ue->u.irqchip.pin >= PIC_NUM_PINS / 2)
 				return -EINVAL;
-			e->set = kvm_set_pic_irq;
+			e->set = kvm_pic_set_irq;
 			break;
 		case KVM_IRQCHIP_IOAPIC:
 			if (ue->u.irqchip.pin >= KVM_IOAPIC_NUM_PINS)
-- 
2.50.0.rc1.591.g9c95f17f64-goog

