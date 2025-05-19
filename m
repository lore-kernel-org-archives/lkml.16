Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4082222DD
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 23:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747697311; cv=none; b=TZn0whUi67G1e0JBN3I8IE6DFAnQ7DIeEsEwdVlsPcXC7rgow0xuIEqXcNEwcifTgSjpKzPTDR1hV8X+P3HXlV0//TdW1aWFSXIVRQXwkxrwSb0uOWdVFN4Thaewk7SdlgILXtdfOUeLjWnQKJa+PKDRuXl/yAeScdaTgAqJWk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747697311; c=relaxed/simple;
	bh=OPUsOxJQRGQw18S5qUhUF69GtSIfHQcNTuuAQQroEw8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Dss1JQsIQ85Bvt7vAzTkmF2hkvYrV1HHy3ZNiHE5wfVQLHDz2Zsr8tzDvsoeNS4NoGEUYhnO9Pkwbr265HRDYSP0bXSCbobvQIoKZ1WicCAoncGRIpc3dM1WC2IU95oxocKhD4l2tKfDEB/EoM+HVuG2x2mf69ODA4Oev+tqsqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K0U5Xyfq; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K0U5Xyfq"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-742a091d290so3301557b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747697309; x=1748302109; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=OzpwPK/JEQxQkuGwL5Uwcgd2u1TTmwDV5SMaEASMIM8=;
        b=K0U5XyfqgHrS2d9PlpRzAfQDjGsuiEqKG5sEJZDSwrpGBKOTPlolW2ZNCjJAaesWfK
         WPv/GR4F4SSckoZ4enIKwF6RFley8RsZ7oxr7jCJtDiUMCBCa9m3VCOwxRsZa+Oyrbn8
         hr9QsW/4hgJj9B4iMtZTBEbTzIiD0sQA8JuUxOt1QhoXlLfQEoi03h266SoUOpegAFg0
         oRJCzs0Zta8fHlrEDqQ77ZPi28z4qj7/x4kQdi1NsOHhyf6TshwKehBUM88WJZn1VS/r
         OgkjmfqMaNVp3/EamztMXO7eBe4DXdGVngYK0Y9nZ3T0Mf/5vw7EqadqAnsh1WqEs+8E
         pKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747697309; x=1748302109;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OzpwPK/JEQxQkuGwL5Uwcgd2u1TTmwDV5SMaEASMIM8=;
        b=GT0s08AgxuQ4suh8LfUE0cyOgBFDbKtqRoYLPCN0zaCDfH9csl7Lql+oPuHmxsx1uB
         QMXeLuUnACKL/fFqlUGGOyTy4cAHD0L7EdtiHH99hPj1BnH6/jdYz+JbIoX5O1OHq8rm
         lvlTgPW7XuofH9N85zce73f0b+NYkZhx50L62YWwsN8IndDEV0/Qh4wANrgob8bQsgET
         5TvKIV/3c9WR4YCqpeol5TyjwoPS71jmv6GlJkco6ifvjExIWfDJXvKN1y9YuTODPA2G
         0QSM/BZ6GE8HmLc4GkBzkzc6uyvc7Km9FgHPndSV6foYbDHioXMpVOUfubv+vGUkZsvz
         4qyA==
X-Forwarded-Encrypted: i=1; AJvYcCUCRhqRCt2QBAmkdQg5R4U3Z0LZUaEo7OhUmZIV9tIy1RdNbA1yC0g34PSkRLrknonQNscg7TTNqoIpMMQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw45nSi2UX7h5sTxMRzNHXn2klHHjbc+296TM8te/EPpYp34CKh
	gIRL9pSJMkesd00nq/ZF0mfoEKHf7Nj6AApZb2RQnjF9he9pcbwC4hANTYCn4wiqpURSIWwzrAO
	XAZVHPA==
X-Google-Smtp-Source: AGHT+IES8VHuEi1O9VM21YWHDIFRJ/0jkBwb+8TYaOYI0d7V6KDKgJQT1u+7T8XTP8XEgC0NqDqkFIUei3w=
X-Received: from pjyp5.prod.google.com ([2002:a17:90a:e705:b0:30e:7783:edb6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:69b:b0:1f5:7c6f:6c8a
 with SMTP id adf61e73a8af0-216219f8d9dmr22093394637.35.1747697309545; Mon, 19
 May 2025 16:28:29 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Mon, 19 May 2025 16:28:02 -0700
In-Reply-To: <20250519232808.2745331-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250519232808.2745331-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250519232808.2745331-10-seanjc@google.com>
Subject: [PATCH 09/15] KVM: x86: Explicitly check for in-kernel PIC when
 getting ExtINT
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Explicitly check for an in-kernel PIC when checking for a pending ExtINT
in the PIC.  Effectively swapping the split vs. full irqchip logic will
allow guarding the in-kernel I/O APIC (and PIC) emulation with a Kconfig,
and also makes it more obvious that kvm_pic_read_irq() won't result in a
NULL pointer dereference.

Opportunistically add WARNs in the fallthrough path, mostly to document
that the userspace ExtINT logic is only relevant to split IRQ chips.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/irq.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kvm/irq.c b/arch/x86/kvm/irq.c
index 97d68d837929..b9b9df00ab77 100644
--- a/arch/x86/kvm/irq.c
+++ b/arch/x86/kvm/irq.c
@@ -41,6 +41,14 @@ static int pending_userspace_extint(struct kvm_vcpu *v)
 	return v->arch.pending_external_vector != -1;
 }
 
+static int get_userspace_extint(struct kvm_vcpu *vcpu)
+{
+	int vector = vcpu->arch.pending_external_vector;
+
+	vcpu->arch.pending_external_vector = -1;
+	return vector;
+}
+
 /*
  * check if there is pending interrupt from
  * non-APIC source without intack.
@@ -67,10 +75,11 @@ int kvm_cpu_has_extint(struct kvm_vcpu *v)
 	if (!kvm_apic_accept_pic_intr(v))
 		return 0;
 
-	if (irqchip_split(v->kvm))
-		return pending_userspace_extint(v);
-	else
+	if (pic_in_kernel(v->kvm))
 		return v->kvm->arch.vpic->output;
+
+	WARN_ON_ONCE(!irqchip_split(v->kvm));
+	return pending_userspace_extint(v);
 }
 
 /*
@@ -126,13 +135,11 @@ int kvm_cpu_get_extint(struct kvm_vcpu *v)
 		return v->kvm->arch.xen.upcall_vector;
 #endif
 
-	if (irqchip_split(v->kvm)) {
-		int vector = v->arch.pending_external_vector;
-
-		v->arch.pending_external_vector = -1;
-		return vector;
-	} else
+	if (pic_in_kernel(v->kvm))
 		return kvm_pic_read_irq(v->kvm); /* PIC */
+
+	WARN_ON_ONCE(!irqchip_split(v->kvm));
+	return get_userspace_extint(v);
 }
 EXPORT_SYMBOL_GPL(kvm_cpu_get_extint);
 
-- 
2.49.0.1101.gccaa498523-goog

