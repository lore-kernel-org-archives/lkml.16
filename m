Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E1521FF51
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 23:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747697306; cv=none; b=Ac3KZOnT46AgoxQeqN+zkYysoZUGuJntQC9Mhap96bCgYFoG3OiNc+xBJ3ATc+ekdHWoNCj0mnTkH9ntsjp3b0tHCdoJFofkCOty9zCp29DsckAGGp+In3XeymK5qgrmWH2+qPqFCQO97Iw/TNRcGJK0aieNVclRXY6WrrMaN3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747697306; c=relaxed/simple;
	bh=DxxAtdli8YLcSYXG2cyhc1Qhnv1N2EL2kPaPo+nEHRk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MoMnBRwvFYsrPAWN9XoIWTJUw7QkqNrju0bgVDYGagNH+lbcZHaIZFRMpTX+1PS4w0SXjVFSJjaIMuNyQIh7J2STlz7rQCa5SYbmlNooFvwk6DY3t0VxUscOVcdF0neAvYn5IgtAzVf85QTXO2i4llpF2kjldv25ylmlEVwJwNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eE1w/xdx; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eE1w/xdx"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b00e4358a34so2939200a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 16:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747697304; x=1748302104; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=6sutRc/njb8rhVGLfAVAjC870Mmm73jxB+i6PD25/Ys=;
        b=eE1w/xdxnBFEKb7nugsUk+tmoivjyh4eifGZdJJBSQIqcIpsif1f3ESiqBG960QZGP
         tYchDgV5Tj3kQ05jd2/GXUR1AoESXtp6m4lmK9HF4qdg++oGTr4Pb6pow5WnuG00KsYS
         pOWjrdAk8+OH2Ndhy/+WDA0uJ4sDrGlOxOatMfJF5UE35Kd3ZcBsqAQL3v/ISwswvnPy
         uqFh8OxrTZEnYhGj7mktTn6ad9wLSNGM5FhE82RJXn9lUYVhy4FgRYj2f3XoO03OpC4i
         KHjqRuL5Ehm8PnOot+5KdLh4HmCO2qfQJez7fHesGH3K9eH20cPogctWvkort/GvnUdv
         LNKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747697304; x=1748302104;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6sutRc/njb8rhVGLfAVAjC870Mmm73jxB+i6PD25/Ys=;
        b=HNN90DisOQXpoE5x8wie+8+Fad8e51UqGipmk3WAbzjH8CPSFTV92SEhe7Lqz46qiz
         MgleukxzhLyego08DZBf6xzUkP0Gi6OfpG8REhRdPvfJ2TnuTVU0hxxivK44fn1N05Tf
         TgrD3fLL9Ft+j8HeJ4WElvd+HJeI7hw2Ahm/k9yxEsdUk7wioZKdFavq7wbtYRGt024E
         k2WFZ/rfOu217wpAFDnH9pBIx0XuvhwxGSdtHVZwcPebHLIGbgI6ycMyfHFqK+k5x+wj
         IuX+koQmEvVeJ9W2VYZuXl4J4crwAMCNi4Z9cY96K7aqD4XI93vQBEeW+wVYSdvZIJaJ
         5q1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWL2NpjEH73+ZkKFwsEGaY19nYith92PHYD2RAMnP194iB2tkI8YM2iJkjLLZM6WiHRHG8Kjv1rH+wVVHw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2QN9xHZxy1LhwGe9ns0JqZDixs38F/83MpFIk3Fn0LBv17RWf
	EuKmbmd972yglFrSEWyRa0puSglwXOZ23cKXHmA8l0Sluf9V4jKSej07IiMeVSU9vk4DDkiS5iC
	pw3GQVA==
X-Google-Smtp-Source: AGHT+IHGPBMajla04MgxrlVwsVQli9dUbzxkAy7PKtDrGVE71mvqfTNjDQWwFxF9Xl/sQL5zU8TiFFsVVXs=
X-Received: from pjbqa8.prod.google.com ([2002:a17:90b:4fc8:b0:30e:85f1:6fa5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:534e:b0:2ef:67c2:4030
 with SMTP id 98e67ed59e1d1-30e7d5b7599mr23570889a91.27.1747697304606; Mon, 19
 May 2025 16:28:24 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Mon, 19 May 2025 16:27:59 -0700
In-Reply-To: <20250519232808.2745331-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250519232808.2745331-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250519232808.2745331-7-seanjc@google.com>
Subject: [PATCH 06/15] KVM: x86: Move kvm_{request,free}_irq_source_id() to
 i8254.c (PIT)
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Move kvm_{request,free}_irq_source_id() to i8254.c, i.e. the dedicated PIT
emulation file, in anticipation of removing them entirely in favor of
hardcoding the PIT's "requested" source ID (the source ID can only ever be
'2', and the request can never fail).

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/i8254.c     | 44 ++++++++++++++++++++++++++++++++++++++++
 arch/x86/kvm/irq_comm.c  | 44 ----------------------------------------
 include/linux/kvm_host.h |  2 --
 3 files changed, 44 insertions(+), 46 deletions(-)

diff --git a/arch/x86/kvm/i8254.c b/arch/x86/kvm/i8254.c
index 739aa6c0d0c3..2a0964c859af 100644
--- a/arch/x86/kvm/i8254.c
+++ b/arch/x86/kvm/i8254.c
@@ -641,6 +641,50 @@ static void kvm_pit_reset(struct kvm_pit *pit)
 	kvm_pit_reset_reinject(pit);
 }
 
+static int kvm_request_irq_source_id(struct kvm *kvm)
+{
+	unsigned long *bitmap = &kvm->arch.irq_sources_bitmap;
+	int irq_source_id;
+
+	mutex_lock(&kvm->irq_lock);
+	irq_source_id = find_first_zero_bit(bitmap, BITS_PER_LONG);
+
+	if (irq_source_id >= BITS_PER_LONG) {
+		pr_warn("exhausted allocatable IRQ sources!\n");
+		irq_source_id = -EFAULT;
+		goto unlock;
+	}
+
+	ASSERT(irq_source_id != KVM_USERSPACE_IRQ_SOURCE_ID);
+	ASSERT(irq_source_id != KVM_IRQFD_RESAMPLE_IRQ_SOURCE_ID);
+	set_bit(irq_source_id, bitmap);
+unlock:
+	mutex_unlock(&kvm->irq_lock);
+
+	return irq_source_id;
+}
+
+static void kvm_free_irq_source_id(struct kvm *kvm, int irq_source_id)
+{
+	ASSERT(irq_source_id != KVM_USERSPACE_IRQ_SOURCE_ID);
+	ASSERT(irq_source_id != KVM_IRQFD_RESAMPLE_IRQ_SOURCE_ID);
+
+	mutex_lock(&kvm->irq_lock);
+	if (irq_source_id < 0 ||
+	    irq_source_id >= BITS_PER_LONG) {
+		pr_err("IRQ source ID out of range!\n");
+		goto unlock;
+	}
+	clear_bit(irq_source_id, &kvm->arch.irq_sources_bitmap);
+	if (!irqchip_kernel(kvm))
+		goto unlock;
+
+	kvm_ioapic_clear_all(kvm->arch.vioapic, irq_source_id);
+	kvm_pic_clear_all(kvm->arch.vpic, irq_source_id);
+unlock:
+	mutex_unlock(&kvm->irq_lock);
+}
+
 static void pit_mask_notifer(struct kvm_irq_mask_notifier *kimn, bool mask)
 {
 	struct kvm_pit *pit = container_of(kimn, struct kvm_pit, mask_notifier);
diff --git a/arch/x86/kvm/irq_comm.c b/arch/x86/kvm/irq_comm.c
index 998c4a34d87c..8c827da3e3d6 100644
--- a/arch/x86/kvm/irq_comm.c
+++ b/arch/x86/kvm/irq_comm.c
@@ -165,50 +165,6 @@ int kvm_arch_set_irq_inatomic(struct kvm_kernel_irq_routing_entry *e,
 	return -EWOULDBLOCK;
 }
 
-int kvm_request_irq_source_id(struct kvm *kvm)
-{
-	unsigned long *bitmap = &kvm->arch.irq_sources_bitmap;
-	int irq_source_id;
-
-	mutex_lock(&kvm->irq_lock);
-	irq_source_id = find_first_zero_bit(bitmap, BITS_PER_LONG);
-
-	if (irq_source_id >= BITS_PER_LONG) {
-		pr_warn("exhausted allocatable IRQ sources!\n");
-		irq_source_id = -EFAULT;
-		goto unlock;
-	}
-
-	ASSERT(irq_source_id != KVM_USERSPACE_IRQ_SOURCE_ID);
-	ASSERT(irq_source_id != KVM_IRQFD_RESAMPLE_IRQ_SOURCE_ID);
-	set_bit(irq_source_id, bitmap);
-unlock:
-	mutex_unlock(&kvm->irq_lock);
-
-	return irq_source_id;
-}
-
-void kvm_free_irq_source_id(struct kvm *kvm, int irq_source_id)
-{
-	ASSERT(irq_source_id != KVM_USERSPACE_IRQ_SOURCE_ID);
-	ASSERT(irq_source_id != KVM_IRQFD_RESAMPLE_IRQ_SOURCE_ID);
-
-	mutex_lock(&kvm->irq_lock);
-	if (irq_source_id < 0 ||
-	    irq_source_id >= BITS_PER_LONG) {
-		pr_err("IRQ source ID out of range!\n");
-		goto unlock;
-	}
-	clear_bit(irq_source_id, &kvm->arch.irq_sources_bitmap);
-	if (!irqchip_kernel(kvm))
-		goto unlock;
-
-	kvm_ioapic_clear_all(kvm->arch.vioapic, irq_source_id);
-	kvm_pic_clear_all(kvm->arch.vpic, irq_source_id);
-unlock:
-	mutex_unlock(&kvm->irq_lock);
-}
-
 void kvm_register_irq_mask_notifier(struct kvm *kvm, int irq,
 				    struct kvm_irq_mask_notifier *kimn)
 {
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 963e250664d6..0d4506598d62 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1780,8 +1780,6 @@ void kvm_register_irq_ack_notifier(struct kvm *kvm,
 				   struct kvm_irq_ack_notifier *kian);
 void kvm_unregister_irq_ack_notifier(struct kvm *kvm,
 				   struct kvm_irq_ack_notifier *kian);
-int kvm_request_irq_source_id(struct kvm *kvm);
-void kvm_free_irq_source_id(struct kvm *kvm, int irq_source_id);
 bool kvm_arch_irqfd_allowed(struct kvm *kvm, struct kvm_irqfd *args);
 
 /*
-- 
2.49.0.1101.gccaa498523-goog

